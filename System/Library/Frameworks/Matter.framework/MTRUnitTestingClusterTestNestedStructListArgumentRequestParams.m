@implementation MTRUnitTestingClusterTestNestedStructListArgumentRequestParams

- (MTRUnitTestingClusterTestNestedStructListArgumentRequestParams)init
{
  MTRUnitTestingClusterTestNestedStructListArgumentRequestParams *v2;
  uint64_t v3;
  MTRUnitTestingClusterNestedStructList *arg1;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRUnitTestingClusterTestNestedStructListArgumentRequestParams;
  v2 = -[MTRUnitTestingClusterTestNestedStructListArgumentRequestParams init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    arg1 = v2->_arg1;
    v2->_arg1 = (MTRUnitTestingClusterNestedStructList *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterTestNestedStructListArgumentRequestParams *v4;
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

  v4 = objc_alloc_init(MTRUnitTestingClusterTestNestedStructListArgumentRequestParams);
  objc_msgSend_arg1(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setArg1_(v4, v8, (uint64_t)v7);

  objc_msgSend_timedInvokeTimeoutMs(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v12, (uint64_t)v11);

  objc_msgSend_serverSideProcessingTimeout(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerSideProcessingTimeout_(v4, v16, (uint64_t)v15);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: arg1:%@; >"), v5, self->_arg1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRUnitTestingClusterNestedStructList)arg1
{
  return self->_arg1;
}

- (void)setArg1:(MTRUnitTestingClusterNestedStructList *)arg1
{
  objc_setProperty_nonatomic_copy(self, a2, arg1, 8);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 16);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, serverSideProcessingTimeout, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_arg1, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  id v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  id v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  int v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  _QWORD *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  unint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t i;
  void *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  unint64_t v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  void *v155;
  char isKindOfClass;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  id v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  id v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  int v207;
  const char *v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  ChipError *v214;
  int v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  _QWORD *v233;
  const char *v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  unint64_t j;
  void *v245;
  const char *v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  unint64_t v251;
  const char *v252;
  uint64_t v253;
  void *v254;
  const char *v255;
  uint64_t v256;
  void *v257;
  const char *v258;
  void *v259;
  char v260;
  const char *v261;
  uint64_t v262;
  void *v263;
  const char *v264;
  uint64_t v265;
  void *v266;
  const char *v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  void *v272;
  const char *v273;
  uint64_t v274;
  void *v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  void *v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  const char *v286;
  uint64_t v287;
  _QWORD *v288;
  const char *v289;
  uint64_t v290;
  void *v291;
  const char *v292;
  uint64_t v293;
  void *v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  void *v298;
  void *v299;
  const char *v300;
  uint64_t v301;
  unint64_t k;
  void *v303;
  const char *v304;
  uint64_t v305;
  void *v306;
  const char *v307;
  uint64_t v308;
  unint64_t v309;
  const char *v310;
  uint64_t v311;
  void *v312;
  const char *v313;
  uint64_t v314;
  void *v315;
  const char *v316;
  void *v317;
  char v318;
  const char *v319;
  uint64_t v320;
  void *v321;
  const char *v322;
  uint64_t v323;
  void *v324;
  const char *v325;
  void *v326;
  id v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  void *v335;
  const char *v336;
  uint64_t v337;
  void *v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  void *v342;
  const char *v343;
  uint64_t v344;
  void *v345;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  _QWORD *v349;
  const char *v350;
  uint64_t v351;
  void *v352;
  const char *v353;
  uint64_t v354;
  void *v355;
  const char *v356;
  uint64_t v357;
  const char *v358;
  uint64_t v359;
  unint64_t m;
  void *v361;
  const char *v362;
  uint64_t v363;
  void *v364;
  const char *v365;
  uint64_t v366;
  unint64_t v367;
  const char *v368;
  uint64_t v369;
  void *v370;
  const char *v371;
  uint64_t v372;
  void *v373;
  const char *v374;
  void *v375;
  char v376;
  const char *v377;
  uint64_t v378;
  void *v379;
  const char *v380;
  uint64_t v381;
  void *v382;
  const char *v383;
  void *v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  void *v388;
  const char *v389;
  uint64_t v390;
  void *v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  unint64_t v398[8];
  void *v399;
  uint64_t v400;
  uint64_t v401;
  char v402;
  uint64_t v403;
  uint64_t *v404;
  _QWORD v405[2];
  unsigned __int8 v406[8];
  __int16 v407;
  char v408;
  __int128 v409;
  __int128 v410;
  char v411;
  _DWORD v412[19];
  _BYTE v413[40];

  *(_WORD *)v406 = 0;
  v407 = 0;
  v408 = 0;
  v409 = 0u;
  v410 = 0u;
  v411 = 0;
  memset(v412, 0, sizeof(v412));
  v405[0] = 0;
  v405[1] = 0;
  v404 = v405;
  objc_msgSend_arg1(self, a3, (uint64_t)a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_a(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v406[0] = objc_msgSend_unsignedCharValue(v8, v9, v10);

  objc_msgSend_arg1(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_b(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v406[1] = objc_msgSend_BOOLValue(v16, v17, v18);

  objc_msgSend_arg1(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_a(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v407) = objc_msgSend_unsignedCharValue(v27, v28, v29);

  objc_msgSend_arg1(self, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_b(v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  HIBYTE(v407) = objc_msgSend_BOOLValue(v38, v39, v40);

  objc_msgSend_arg1(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v408 = objc_msgSend_unsignedCharValue(v49, v50, v51);

  objc_msgSend_arg1(self, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_d(v57, v58, v59);
  v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v63 = objc_msgSend_bytes(v60, v61, v62);
  v66 = objc_msgSend_length(v60, v64, v65);
  sub_233BF7114(v398, v63, v66);

  v409 = *(_OWORD *)v398;
  objc_msgSend_arg1(self, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_e(v72, v73, v74);
  v75 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v78 = objc_msgSend_UTF8String(v75, v76, v77);
  v80 = objc_msgSend_lengthOfBytesUsingEncoding_(v75, v79, 4);
  sub_233CAF22C(v398, v78, v80);

  v410 = *(_OWORD *)v398;
  objc_msgSend_arg1(self, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v83, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_f(v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v411 = objc_msgSend_unsignedCharValue(v89, v90, v91);

  objc_msgSend_arg1(self, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v94, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_g(v97, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v100, v101, v102);
  v412[0] = v103;

  objc_msgSend_arg1(self, v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_c(v106, v107, v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_h(v109, v110, v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v112, v113, v114);
  *(_QWORD *)&v412[1] = v115;

  objc_msgSend_arg1(self, v116, v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_d(v118, v119, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = objc_msgSend_count(v121, v122, v123);

  if (v124)
  {
    v127 = (_QWORD *)operator new();
    objc_msgSend_arg1(self, v128, v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_d(v130, v131, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = objc_msgSend_count(v133, v134, v135);
    sub_233CB24EC(v127, v136);

    if (v127[1])
    {
      v398[0] = (unint64_t)v127;
      sub_233CAF24C(&v404, v398, (uint64_t *)v398);
      v139 = 0;
      for (i = 0; ; ++i)
      {
        objc_msgSend_arg1(self, v137, v138);
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_d(v141, v142, v143);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        v147 = objc_msgSend_count(v144, v145, v146);

        if (i >= v147)
        {
          v216 = v127[1];
          objc_msgSend_arg1(self, v148, v149);
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_d(v217, v218, v219);
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          v223 = objc_msgSend_count(v220, v221, v222);
          sub_233CAF22C(v398, v216, v223);
          *(_OWORD *)&v412[3] = *(_OWORD *)v398;

          goto LABEL_10;
        }
        objc_msgSend_arg1(self, v148, v149);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_d(v150, v151, v152);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v153, v154, i);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          break;
        objc_msgSend_arg1(self, v157, v158);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_d(v159, v160, v161);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v162, v163, i);
        v164 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_a(v164, v165, v166);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v127[1] + v139) = objc_msgSend_unsignedCharValue(v167, v168, v169);

        objc_msgSend_b(v164, v170, v171);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v127[1] + v139 + 1) = objc_msgSend_BOOLValue(v172, v173, v174);

        objc_msgSend_c(v164, v175, v176);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v127[1] + v139 + 2) = objc_msgSend_unsignedCharValue(v177, v178, v179);

        objc_msgSend_d(v164, v180, v181);
        v182 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v185 = objc_msgSend_bytes(v182, v183, v184);
        v188 = objc_msgSend_length(v182, v186, v187);
        sub_233BF7114(v398, v185, v188);

        *(_OWORD *)(v127[1] + v139 + 8) = *(_OWORD *)v398;
        objc_msgSend_e(v164, v189, v190);
        v191 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v194 = objc_msgSend_UTF8String(v191, v192, v193);
        v196 = objc_msgSend_lengthOfBytesUsingEncoding_(v191, v195, 4);
        sub_233CAF22C(v398, v194, v196);

        *(_OWORD *)(v127[1] + v139 + 24) = *(_OWORD *)v398;
        objc_msgSend_f(v164, v197, v198);
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v127[1] + v139 + 40) = objc_msgSend_unsignedCharValue(v199, v200, v201);

        objc_msgSend_g(v164, v202, v203);
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_floatValue(v204, v205, v206);
        *(_DWORD *)(v127[1] + v139 + 44) = v207;

        objc_msgSend_h(v164, v208, v209);
        v210 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v210, v211, v212);
        *(_QWORD *)(v127[1] + v139 + 48) = v213;

        v139 += 56;
      }
      v214 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v215 = 34734;
    }
    else
    {
      v214 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v215 = 34728;
    }
    goto LABEL_50;
  }
  *(_QWORD *)&v412[3] = 0;
  *(_QWORD *)&v412[5] = 0;
LABEL_10:
  objc_msgSend_arg1(self, v125, v126);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_e(v224, v225, v226);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  v230 = objc_msgSend_count(v227, v228, v229);

  if (v230)
  {
    v233 = (_QWORD *)operator new();
    objc_msgSend_arg1(self, v234, v235);
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_e(v236, v237, v238);
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_count(v239, v240, v241);
    *v233 = &off_2504EF520;
    v233[1] = operator new[]();

    if (v233[1])
    {
      v398[0] = (unint64_t)v233;
      sub_233CAF24C(&v404, v398, (uint64_t *)v398);
      for (j = 0; ; ++j)
      {
        objc_msgSend_arg1(self, v242, v243);
        v245 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_e(v245, v246, v247);
        v248 = (void *)objc_claimAutoreleasedReturnValue();
        v251 = objc_msgSend_count(v248, v249, v250);

        if (j >= v251)
        {
          v271 = v233[1];
          objc_msgSend_arg1(self, v252, v253);
          v272 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_e(v272, v273, v274);
          v275 = (void *)objc_claimAutoreleasedReturnValue();
          v278 = objc_msgSend_count(v275, v276, v277);
          sub_233CAF22C(v398, v271, v278);
          *(_OWORD *)&v412[7] = *(_OWORD *)v398;

          goto LABEL_20;
        }
        objc_msgSend_arg1(self, v252, v253);
        v254 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_e(v254, v255, v256);
        v257 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v257, v258, j);
        v259 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v260 = objc_opt_isKindOfClass();

        if ((v260 & 1) == 0)
          break;
        objc_msgSend_arg1(self, v261, v262);
        v263 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_e(v263, v264, v265);
        v266 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v266, v267, j);
        v268 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)(v233[1] + 4 * j) = objc_msgSend_unsignedIntValue(v268, v269, v270);
      }
      v214 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v215 = 34763;
    }
    else
    {
      v214 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v215 = 34757;
    }
    goto LABEL_50;
  }
  *(_QWORD *)&v412[7] = 0;
  *(_QWORD *)&v412[9] = 0;
LABEL_20:
  objc_msgSend_arg1(self, v231, v232);
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_f(v279, v280, v281);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  v285 = objc_msgSend_count(v282, v283, v284);

  if (v285)
  {
    v288 = (_QWORD *)operator new();
    objc_msgSend_arg1(self, v289, v290);
    v291 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_f(v291, v292, v293);
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    v297 = objc_msgSend_count(v294, v295, v296);
    *v288 = &off_2504EF408;
    v298 = (void *)operator new[]();
    v299 = v298;
    if (v297)
      bzero(v298, 16 * v297);
    v288[1] = v299;

    if (v288[1])
    {
      v398[0] = (unint64_t)v288;
      sub_233CAF24C(&v404, v398, (uint64_t *)v398);
      for (k = 0; ; ++k)
      {
        objc_msgSend_arg1(self, v300, v301);
        v303 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_f(v303, v304, v305);
        v306 = (void *)objc_claimAutoreleasedReturnValue();
        v309 = objc_msgSend_count(v306, v307, v308);

        if (k >= v309)
        {
          v334 = v288[1];
          objc_msgSend_arg1(self, v310, v311);
          v335 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_f(v335, v336, v337);
          v338 = (void *)objc_claimAutoreleasedReturnValue();
          v341 = objc_msgSend_count(v338, v339, v340);
          sub_233CAF22C(v398, v334, v341);
          *(_OWORD *)&v412[11] = *(_OWORD *)v398;

          goto LABEL_32;
        }
        objc_msgSend_arg1(self, v310, v311);
        v312 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_f(v312, v313, v314);
        v315 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v315, v316, k);
        v317 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v318 = objc_opt_isKindOfClass();

        if ((v318 & 1) == 0)
          break;
        objc_msgSend_arg1(self, v319, v320);
        v321 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_f(v321, v322, v323);
        v324 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v324, v325, k);
        v326 = (void *)objc_claimAutoreleasedReturnValue();

        v327 = objc_retainAutorelease(v326);
        v330 = objc_msgSend_bytes(v327, v328, v329);
        v333 = objc_msgSend_length(v327, v331, v332);
        sub_233BF7114(v398, v330, v333);

        *(_OWORD *)(v288[1] + 16 * k) = *(_OWORD *)v398;
      }
      v214 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v215 = 34785;
    }
    else
    {
      v214 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v215 = 34779;
    }
    goto LABEL_50;
  }
  *(_QWORD *)&v412[11] = 0;
  *(_QWORD *)&v412[13] = 0;
LABEL_32:
  objc_msgSend_arg1(self, v286, v287);
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_g(v342, v343, v344);
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  v348 = objc_msgSend_count(v345, v346, v347);

  if (v348)
  {
    v349 = (_QWORD *)operator new();
    objc_msgSend_arg1(self, v350, v351);
    v352 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_g(v352, v353, v354);
    v355 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_count(v355, v356, v357);
    *v349 = &off_2504EF750;
    v349[1] = operator new[]();

    if (v349[1])
    {
      v398[0] = (unint64_t)v349;
      sub_233CAF24C(&v404, v398, (uint64_t *)v398);
      for (m = 0; ; ++m)
      {
        objc_msgSend_arg1(self, v358, v359);
        v361 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_g(v361, v362, v363);
        v364 = (void *)objc_claimAutoreleasedReturnValue();
        v367 = objc_msgSend_count(v364, v365, v366);

        if (m >= v367)
        {
          v387 = v349[1];
          objc_msgSend_arg1(self, v368, v369);
          v388 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_g(v388, v389, v390);
          v391 = (void *)objc_claimAutoreleasedReturnValue();
          v394 = objc_msgSend_count(v391, v392, v393);
          sub_233BF7114(v398, v387, v394);
          *(_OWORD *)&v412[15] = *(_OWORD *)v398;

          goto LABEL_42;
        }
        objc_msgSend_arg1(self, v368, v369);
        v370 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_g(v370, v371, v372);
        v373 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v373, v374, m);
        v375 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v376 = objc_opt_isKindOfClass();

        if ((v376 & 1) == 0)
          break;
        objc_msgSend_arg1(self, v377, v378);
        v379 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_g(v379, v380, v381);
        v382 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v382, v383, m);
        v384 = (void *)objc_claimAutoreleasedReturnValue();

        *(_BYTE *)(v349[1] + m) = objc_msgSend_unsignedCharValue(v384, v385, v386);
      }
      v214 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v215 = 34807;
    }
    else
    {
      v214 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v215 = 34801;
    }
LABEL_50:
    v214->mLine = v215;
    return (ChipError *)sub_233CAF15C((uint64_t)&v404);
  }
  *(_QWORD *)&v412[15] = 0;
  *(_QWORD *)&v412[17] = 0;
LABEL_42:
  sub_234118674(0x62FuLL, 0, &v403);
  if (v403)
  {
    sub_234106C48((uint64_t)v398);
    v400 = 0;
    v401 = 0;
    v399 = &unk_250504030;
    v402 = 0;
    sub_233CAF098((uint64_t)&v399, &v403, 0);
    sub_234106CA8((uint64_t)v398, (uint64_t)&v399, 0xFFFFFFFF, (uint64_t)v413);
    *(_QWORD *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(_QWORD *)&retstr->mLine = 0;
    sub_233D41DA8(v406, (char *)v398, 0x100uLL, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233C115F0((uint64_t)v398, &v403, retstr);
      if (!retstr->mError)
      {
        sub_233C11670((uint64_t)a4, &v403);
        sub_234106010((uint64_t)a4, 21, 256, retstr);
      }
    }
    v399 = &unk_250504030;
    sub_233CAF128(&v401);
    sub_233CAF128(&v400);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 34821;
  }
  sub_233CAF128(&v403);
  return (ChipError *)sub_233CAF15C((uint64_t)&v404);
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
    v11 = 34850;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
