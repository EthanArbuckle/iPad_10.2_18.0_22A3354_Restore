@implementation MTRContentLauncherClusterLaunchContentParams

- (MTRContentLauncherClusterLaunchContentParams)init
{
  MTRContentLauncherClusterLaunchContentParams *v2;
  uint64_t v3;
  MTRContentLauncherClusterContentSearchStruct *search;
  NSNumber *autoPlay;
  NSString *data;
  MTRContentLauncherClusterPlaybackPreferencesStruct *playbackPreferences;
  NSNumber *useCurrentContext;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTRContentLauncherClusterLaunchContentParams;
  v2 = -[MTRContentLauncherClusterLaunchContentParams init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    search = v2->_search;
    v2->_search = (MTRContentLauncherClusterContentSearchStruct *)v3;

    autoPlay = v2->_autoPlay;
    v2->_autoPlay = (NSNumber *)&unk_250591A40;

    data = v2->_data;
    v2->_data = 0;

    playbackPreferences = v2->_playbackPreferences;
    v2->_playbackPreferences = 0;

    useCurrentContext = v2->_useCurrentContext;
    v2->_useCurrentContext = 0;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRContentLauncherClusterLaunchContentParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;

  v4 = objc_alloc_init(MTRContentLauncherClusterLaunchContentParams);
  objc_msgSend_search(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSearch_(v4, v8, (uint64_t)v7);

  objc_msgSend_autoPlay(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAutoPlay_(v4, v12, (uint64_t)v11);

  objc_msgSend_data(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setData_(v4, v16, (uint64_t)v15);

  objc_msgSend_playbackPreferences(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPlaybackPreferences_(v4, v20, (uint64_t)v19);

  objc_msgSend_useCurrentContext(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUseCurrentContext_(v4, v24, (uint64_t)v23);

  objc_msgSend_timedInvokeTimeoutMs(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v28, (uint64_t)v27);

  objc_msgSend_serverSideProcessingTimeout(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: search:%@; autoPlay:%@; data:%@; playbackPreferences:%@; useCurrentContext:%@; >"),
    v5,
    self->_search,
    self->_autoPlay,
    self->_data,
    self->_playbackPreferences,
    self->_useCurrentContext);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRContentLauncherClusterContentSearchStruct)search
{
  return self->_search;
}

- (void)setSearch:(MTRContentLauncherClusterContentSearchStruct *)search
{
  objc_setProperty_nonatomic_copy(self, a2, search, 8);
}

- (NSNumber)autoPlay
{
  return self->_autoPlay;
}

- (void)setAutoPlay:(NSNumber *)autoPlay
{
  objc_setProperty_nonatomic_copy(self, a2, autoPlay, 16);
}

- (NSString)data
{
  return self->_data;
}

- (void)setData:(NSString *)data
{
  objc_setProperty_nonatomic_copy(self, a2, data, 24);
}

- (MTRContentLauncherClusterPlaybackPreferencesStruct)playbackPreferences
{
  return self->_playbackPreferences;
}

- (void)setPlaybackPreferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)useCurrentContext
{
  return self->_useCurrentContext;
}

- (void)setUseCurrentContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 48);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_useCurrentContext, 0);
  objc_storeStrong((id *)&self->_playbackPreferences, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_autoPlay, 0);
  objc_storeStrong((id *)&self->_search, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  MTRContentLauncherClusterLaunchContentParams *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  _QWORD *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  unint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  char isKindOfClass;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t i;
  void *v88;
  const char *v89;
  uint64_t v90;
  unint64_t v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  void *v96;
  char v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  id v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  id v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  id v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  id v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  _QWORD *v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  unint64_t j;
  void *v199;
  const char *v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  unint64_t v208;
  const char *v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  void *v219;
  char v220;
  const char *v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  unsigned int v234;
  ChipError *v235;
  int v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  void *v267;
  const char *v268;
  uint64_t v269;
  void *v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  _QWORD *v278;
  const char *v279;
  uint64_t v280;
  void *v281;
  const char *v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  unint64_t v287;
  const char *v288;
  uint64_t v289;
  unint64_t k;
  void *v291;
  const char *v292;
  uint64_t v293;
  void *v294;
  const char *v295;
  uint64_t v296;
  unint64_t v297;
  const char *v298;
  uint64_t v299;
  void *v300;
  const char *v301;
  uint64_t v302;
  void *v303;
  const char *v304;
  void *v305;
  char v306;
  const char *v307;
  uint64_t v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  void *v312;
  const char *v313;
  const char *v314;
  uint64_t v315;
  id v316;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  const char *v320;
  uint64_t v321;
  const char *v322;
  uint64_t v323;
  void *v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  _QWORD *v328;
  void *v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  _QWORD *v333;
  const char *v334;
  uint64_t v335;
  void *v336;
  const char *v337;
  uint64_t v338;
  const char *v339;
  uint64_t v340;
  unint64_t m;
  void *v342;
  const char *v343;
  uint64_t v344;
  unint64_t v345;
  const char *v346;
  uint64_t v347;
  void *v348;
  const char *v349;
  void *v350;
  char v351;
  const char *v352;
  uint64_t v353;
  void *v354;
  const char *v355;
  void *v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  void *v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  void *v364;
  const char *v365;
  uint64_t v366;
  void *v367;
  const char *v368;
  uint64_t v369;
  void *v370;
  const char *v371;
  uint64_t v372;
  uint64_t v374;
  void *v375;
  const char *v376;
  uint64_t v377;
  void *v378;
  const char *v379;
  uint64_t v380;
  uint64_t v381;
  __int128 *v382;
  MTRContentLauncherClusterLaunchContentParams *v385;
  unint64_t v386[8];
  void *v387;
  uint64_t v388;
  uint64_t v389;
  char v390;
  uint64_t v391;
  uint64_t *v392;
  _QWORD v393[2];
  __int128 v394;
  char v395;
  char v396;
  __int128 v397;
  char v398;
  _QWORD v399[4];
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int16 v403;
  _BYTE v404[40];

  v4 = self;
  v396 = 0;
  v398 = 0;
  LOBYTE(v403) = 0;
  v394 = 0uLL;
  v395 = 0;
  v393[0] = 0;
  v393[1] = 0;
  v392 = v393;
  objc_msgSend_search(self, a3, (uint64_t)a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parameterList(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_count(v8, v9, v10);

  v385 = v4;
  if (v11)
  {
    v14 = (_QWORD *)operator new();
    objc_msgSend_search(v4, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parameterList(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_count(v20, v21, v22);
    sub_233CB1914(v14, v23);

    if (!v14[1])
    {
      v235 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v236 = 28831;
LABEL_32:
      v235->mLine = v236;
      return (ChipError *)sub_233CAF15C((uint64_t)&v392);
    }
    v386[0] = (unint64_t)v14;
    sub_233CAF24C(&v392, v386, (uint64_t *)v386);
    v24 = 0;
    objc_msgSend_search(v4, v25, v26);
    while (1)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parameterList(v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend_count(v30, v31, v32);

      if (v24 >= v33)
        break;
      objc_msgSend_search(v4, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parameterList(v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v39, v40, v24);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v235 = retstr;
        retstr->mError = 47;
        retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/za"
                        "p-generated/MTRCommandPayloadsObjc.mm";
        v236 = 28837;
        goto LABEL_32;
      }
      objc_msgSend_search(v4, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parameterList(v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v48, v49, v24);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_type(v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(v14[1] + 48 * v24) = objc_msgSend_unsignedCharValue(v53, v54, v55);

      objc_msgSend_value(v50, v56, v57);
      v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v61 = objc_msgSend_UTF8String(v58, v59, v60);
      v63 = objc_msgSend_lengthOfBytesUsingEncoding_(v58, v62, 4);
      sub_233CAF22C(v386, v61, v63);

      *(_OWORD *)(v14[1] + 48 * v24 + 8) = *(_OWORD *)v386;
      objc_msgSend_externalIDList(v50, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        v69 = v14[1] + 48 * v24;
        *(_QWORD *)(v69 + 32) = 0;
        v70 = v69 + 32;
        *(_BYTE *)(v70 - 8) = 1;
        *(_QWORD *)(v70 + 8) = 0;
        objc_msgSend_externalIDList(v50, v67, v68);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend_count(v71, v72, v73);

        if (v74)
        {
          v75 = (_QWORD *)operator new();
          objc_msgSend_externalIDList(v50, v76, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend_count(v78, v79, v80);
          *v75 = &off_2504EF638;
          v82 = (void *)operator new[]();
          v83 = v82;
          if (v81)
            bzero(v82, 32 * v81);
          v75[1] = v83;

          if (v75[1])
          {
            v386[0] = (unint64_t)v75;
            sub_233CAF24C(&v392, v386, (uint64_t *)v386);
            v86 = 0;
            for (i = 0; ; ++i)
            {
              objc_msgSend_externalIDList(v50, v84, v85);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = objc_msgSend_count(v88, v89, v90);

              if (i >= v91)
              {
                v119 = v75[1];
                objc_msgSend_externalIDList(v50, v92, v93);
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                v123 = objc_msgSend_count(v120, v121, v122);
                sub_233CAF22C(v386, v119, v123);
                *(_OWORD *)v70 = *(_OWORD *)v386;

                goto LABEL_17;
              }
              objc_msgSend_externalIDList(v50, v92, v93);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v94, v95, i);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v97 = objc_opt_isKindOfClass();

              if ((v97 & 1) == 0)
                break;
              objc_msgSend_externalIDList(v50, v98, v99);
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v100, v101, i);
              v102 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_name(v102, v103, v104);
              v105 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v108 = objc_msgSend_UTF8String(v105, v106, v107);
              v110 = objc_msgSend_lengthOfBytesUsingEncoding_(v105, v109, 4);
              sub_233CAF22C(v386, v108, v110);

              *(_OWORD *)(v75[1] + v86) = *(_OWORD *)v386;
              objc_msgSend_value(v102, v111, v112);
              v113 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v116 = objc_msgSend_UTF8String(v113, v114, v115);
              v118 = objc_msgSend_lengthOfBytesUsingEncoding_(v113, v117, 4);
              sub_233CAF22C(v386, v116, v118);

              *(_OWORD *)(v75[1] + v86 + 16) = *(_OWORD *)v386;
              v86 += 32;
            }
            v234 = 28856;
          }
          else
          {
            v234 = 28850;
          }
          goto LABEL_30;
        }
        *(_QWORD *)v70 = 0;
        *(_QWORD *)(v70 + 8) = 0;
      }
LABEL_17:

      ++v24;
      v4 = v385;
      objc_msgSend_search(v385, v124, v125);
    }
    v237 = v14[1];
    objc_msgSend_search(v4, v34, v35);
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parameterList(v238, v239, v240);
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    v244 = objc_msgSend_count(v241, v242, v243);
    sub_233CAF22C(v386, v237, v244);
    v394 = *(_OWORD *)v386;

  }
  else
  {
    v394 = 0uLL;
  }
  objc_msgSend_autoPlay(v4, v12, v13);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v395 = objc_msgSend_BOOLValue(v126, v127, v128);

  objc_msgSend_data(v4, v129, v130);
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  if (v131)
  {
    v396 = 1;
    v397 = 0uLL;
    objc_msgSend_data(v4, v132, v133);
    v134 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v137 = objc_msgSend_UTF8String(v134, v135, v136);
    v139 = objc_msgSend_lengthOfBytesUsingEncoding_(v134, v138, 4);
    sub_233CAF22C(v386, v137, v139);

    v397 = *(_OWORD *)v386;
  }
  objc_msgSend_playbackPreferences(v4, v132, v133);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v140)
    goto LABEL_56;
  v398 = 1;
  memset(v399, 0, sizeof(v399));
  v400 = 0u;
  v401 = 0u;
  v402 = 0u;
  objc_msgSend_playbackPreferences(v4, v141, v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_playbackPosition(v143, v144, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v399[0] = objc_msgSend_unsignedLongLongValue(v146, v147, v148);

  objc_msgSend_playbackPreferences(v4, v149, v150);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_textTrack(v151, v152, v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_languageCode(v154, v155, v156);
  v157 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v160 = objc_msgSend_UTF8String(v157, v158, v159);
  v162 = objc_msgSend_lengthOfBytesUsingEncoding_(v157, v161, 4);
  sub_233CAF22C(v386, v160, v162);

  *(_OWORD *)&v399[1] = *(_OWORD *)v386;
  objc_msgSend_playbackPreferences(v4, v163, v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_textTrack(v165, v166, v167);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_characteristics(v168, v169, v170);
  v171 = (void *)objc_claimAutoreleasedReturnValue();

  if (v171)
  {
    LOBYTE(v399[3]) = 1;
    v400 = 0uLL;
    objc_msgSend_playbackPreferences(v4, v172, v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_textTrack(v174, v175, v176);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_characteristics(v177, v178, v179);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v183 = objc_msgSend_count(v180, v181, v182);

    if (v183)
    {
      v184 = (_QWORD *)operator new();
      objc_msgSend_playbackPreferences(v4, v185, v186);
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_textTrack(v187, v188, v189);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_characteristics(v190, v191, v192);
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_count(v193, v194, v195);
      *v184 = &off_2504EF670;
      v184[1] = operator new[]();

      if (!v184[1])
      {
        v235 = retstr;
        retstr->mError = 47;
        retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/za"
                        "p-generated/MTRCommandPayloadsObjc.mm";
        v236 = 28897;
        goto LABEL_32;
      }
      v386[0] = (unint64_t)v184;
      sub_233CAF24C(&v392, v386, (uint64_t *)v386);
      for (j = 0; ; ++j)
      {
        objc_msgSend_playbackPreferences(v385, v196, v197);
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_textTrack(v199, v200, v201);
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_characteristics(v202, v203, v204);
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        v208 = objc_msgSend_count(v205, v206, v207);

        if (j >= v208)
          break;
        objc_msgSend_playbackPreferences(v385, v209, v210);
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_textTrack(v211, v212, v213);
        v214 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_characteristics(v214, v215, v216);
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v217, v218, j);
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v220 = objc_opt_isKindOfClass();

        if ((v220 & 1) == 0)
        {
          v235 = retstr;
          retstr->mError = 47;
          retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/"
                          "zap-generated/MTRCommandPayloadsObjc.mm";
          v236 = 28903;
          goto LABEL_32;
        }
        objc_msgSend_playbackPreferences(v385, v221, v222);
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_textTrack(v223, v224, v225);
        v226 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_characteristics(v226, v227, v228);
        v229 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v229, v230, j);
        v231 = (void *)objc_claimAutoreleasedReturnValue();

        *(_BYTE *)(v184[1] + j) = objc_msgSend_unsignedCharValue(v231, v232, v233);
      }
      v245 = v184[1];
      v4 = v385;
      objc_msgSend_playbackPreferences(v385, v209, v210);
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_textTrack(v246, v247, v248);
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_characteristics(v249, v250, v251);
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      v255 = objc_msgSend_count(v252, v253, v254);
      sub_233CAF22C(v386, v245, v255);
      v400 = *(_OWORD *)v386;

    }
    else
    {
      v400 = 0uLL;
    }
  }
  objc_msgSend_playbackPreferences(v4, v172, v173);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_textTrack(v256, v257, v258);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_audioOutputIndex(v259, v260, v261);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v401) = objc_msgSend_unsignedCharValue(v262, v263, v264);

  objc_msgSend_playbackPreferences(v4, v265, v266);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_audioTracks(v267, v268, v269);
  v270 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v270)
  {
LABEL_56:
    objc_msgSend_useCurrentContext(v4, v141, v142);
    v367 = (void *)objc_claimAutoreleasedReturnValue();

    if (v367)
    {
      v403 = 1;
      objc_msgSend_useCurrentContext(v4, v368, v369);
      v370 = (void *)objc_claimAutoreleasedReturnValue();
      HIBYTE(v403) = objc_msgSend_BOOLValue(v370, v371, v372);

    }
    sub_234118674(0x62FuLL, 0, &v391);
    if (v391)
    {
      sub_234106C48((uint64_t)v386);
      v388 = 0;
      v389 = 0;
      v387 = &unk_250504030;
      v390 = 0;
      sub_233CAF098((uint64_t)&v387, &v391, 0);
      sub_234106CA8((uint64_t)v386, (uint64_t)&v387, 0xFFFFFFFF, (uint64_t)v404);
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233D398A0((uint64_t)&v394, (char *)v386, 0x100uLL, (uint64_t)retstr);
      if (!retstr->mError)
      {
        *(_QWORD *)&retstr->mError = 0;
        retstr->mFile = 0;
        *(_QWORD *)&retstr->mLine = 0;
        sub_233C115F0((uint64_t)v386, &v391, retstr);
        if (!retstr->mError)
        {
          sub_233C11670((uint64_t)a4, &v391);
          sub_234106010((uint64_t)a4, 21, 256, retstr);
        }
      }
      v387 = &unk_250504030;
      sub_233CAF128(&v389);
      sub_233CAF128(&v388);
    }
    else
    {
      retstr->mError = 11;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = 28977;
    }
    sub_233CAF128(&v391);
    return (ChipError *)sub_233CAF15C((uint64_t)&v392);
  }
  BYTE8(v401) = 1;
  v402 = 0uLL;
  objc_msgSend_playbackPreferences(v4, v141, v142);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_audioTracks(v271, v272, v273);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  v277 = objc_msgSend_count(v274, v275, v276);

  if (!v277)
  {
    v402 = 0uLL;
    goto LABEL_56;
  }
  v382 = &v402;
  v278 = (_QWORD *)operator new();
  objc_msgSend_playbackPreferences(v4, v279, v280);
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_audioTracks(v281, v282, v283);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  v287 = objc_msgSend_count(v284, v285, v286);
  sub_233CB1BA4(v278, v287);

  if (!v278[1])
  {
    v235 = retstr;
    retstr->mError = 47;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    v236 = 28923;
    goto LABEL_32;
  }
  v386[0] = (unint64_t)v278;
  sub_233CAF24C(&v392, v386, (uint64_t *)v386);
  for (k = 0; ; ++k)
  {
    objc_msgSend_playbackPreferences(v4, v288, v289, v382);
    v291 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_audioTracks(v291, v292, v293);
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    v297 = objc_msgSend_count(v294, v295, v296);

    if (k >= v297)
    {
      v374 = v278[1];
      objc_msgSend_playbackPreferences(v4, v298, v299);
      v375 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_audioTracks(v375, v376, v377);
      v378 = (void *)objc_claimAutoreleasedReturnValue();
      v381 = objc_msgSend_count(v378, v379, v380);
      sub_233CAF22C(v386, v374, v381);
      *v382 = *(_OWORD *)v386;

      goto LABEL_56;
    }
    objc_msgSend_playbackPreferences(v4, v298, v299);
    v300 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_audioTracks(v300, v301, v302);
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v303, v304, k);
    v305 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v306 = objc_opt_isKindOfClass();

    if ((v306 & 1) == 0)
    {
      v235 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v236 = 28929;
      goto LABEL_32;
    }
    objc_msgSend_playbackPreferences(v4, v307, v308);
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_audioTracks(v309, v310, v311);
    v312 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v312, v313, k);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_languageCode(v50, v314, v315);
    v316 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v319 = objc_msgSend_UTF8String(v316, v317, v318);
    v321 = objc_msgSend_lengthOfBytesUsingEncoding_(v316, v320, 4);
    sub_233CAF22C(v386, v319, v321);

    *(_OWORD *)(v278[1] + 48 * k) = *(_OWORD *)v386;
    objc_msgSend_characteristics(v50, v322, v323);
    v324 = (void *)objc_claimAutoreleasedReturnValue();

    if (v324)
      break;
LABEL_54:
    objc_msgSend_audioOutputIndex(v50, v325, v326);
    v364 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(v278[1] + 48 * k + 40) = objc_msgSend_unsignedCharValue(v364, v365, v366);

  }
  v327 = v278[1] + 48 * k;
  *(_QWORD *)(v327 + 24) = 0;
  v328 = (_QWORD *)(v327 + 24);
  *((_BYTE *)v328 - 8) = 1;
  v328[1] = 0;
  objc_msgSend_characteristics(v50, v325, v326);
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  v332 = objc_msgSend_count(v329, v330, v331);

  if (!v332)
  {
    *v328 = 0;
    v328[1] = 0;
LABEL_53:
    v4 = v385;
    goto LABEL_54;
  }
  v333 = (_QWORD *)operator new();
  objc_msgSend_characteristics(v50, v334, v335);
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_count(v336, v337, v338);
  *v333 = &off_2504EF670;
  v333[1] = operator new[]();

  if (v333[1])
  {
    v386[0] = (unint64_t)v333;
    sub_233CAF24C(&v392, v386, (uint64_t *)v386);
    for (m = 0; ; ++m)
    {
      objc_msgSend_characteristics(v50, v339, v340);
      v342 = (void *)objc_claimAutoreleasedReturnValue();
      v345 = objc_msgSend_count(v342, v343, v344);

      if (m >= v345)
      {
        v359 = v333[1];
        objc_msgSend_characteristics(v50, v346, v347);
        v360 = (void *)objc_claimAutoreleasedReturnValue();
        v363 = objc_msgSend_count(v360, v361, v362);
        sub_233CAF22C(v386, v359, v363);
        *(_OWORD *)v328 = *(_OWORD *)v386;

        goto LABEL_53;
      }
      objc_msgSend_characteristics(v50, v346, v347);
      v348 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v348, v349, m);
      v350 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v351 = objc_opt_isKindOfClass();

      if ((v351 & 1) == 0)
        break;
      objc_msgSend_characteristics(v50, v352, v353);
      v354 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v354, v355, m);
      v356 = (void *)objc_claimAutoreleasedReturnValue();

      *(_BYTE *)(v333[1] + m) = objc_msgSend_unsignedCharValue(v356, v357, v358);
    }
    v234 = 28947;
  }
  else
  {
    v234 = 28941;
  }
LABEL_30:
  retstr->mError = 47;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = v234;

  return (ChipError *)sub_233CAF15C((uint64_t)&v392);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  int v11;
  __int128 v12;
  uint64_t v13;
  _BYTE v14[72];
  uint64_t v15;

  v5 = sub_234104468((uint64_t)v14);
  v15 = 0;
  v12 = 0uLL;
  v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  sub_233CE3234((uint64_t)v14, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((_QWORD *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    v11 = 29006;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
