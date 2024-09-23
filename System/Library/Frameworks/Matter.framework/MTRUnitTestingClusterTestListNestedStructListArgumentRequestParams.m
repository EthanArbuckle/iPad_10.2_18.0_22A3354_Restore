@implementation MTRUnitTestingClusterTestListNestedStructListArgumentRequestParams

- (MTRUnitTestingClusterTestListNestedStructListArgumentRequestParams)init
{
  const char *v2;
  uint64_t v3;
  MTRUnitTestingClusterTestListNestedStructListArgumentRequestParams *v4;
  uint64_t v5;
  NSArray *arg1;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTRUnitTestingClusterTestListNestedStructListArgumentRequestParams;
  v4 = -[MTRUnitTestingClusterTestListNestedStructListArgumentRequestParams init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend_array(MEMORY[0x24BDBCE30], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    arg1 = v4->_arg1;
    v4->_arg1 = (NSArray *)v5;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRUnitTestingClusterTestListNestedStructListArgumentRequestParams *v4;
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

  v4 = objc_alloc_init(MTRUnitTestingClusterTestListNestedStructListArgumentRequestParams);
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

- (NSArray)arg1
{
  return self->_arg1;
}

- (void)setArg1:(NSArray *)arg1
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
  uint64_t v8;
  _QWORD *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  unint64_t i;
  void *v19;
  const char *v20;
  uint64_t v21;
  unint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  char isKindOfClass;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
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
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  id v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  id v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  int v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  _QWORD *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  unint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t j;
  void *v136;
  const char *v137;
  uint64_t v138;
  unint64_t v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  void *v144;
  char v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  id v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  id v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  int v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  unint64_t v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  _QWORD *v212;
  const char *v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  unint64_t k;
  void *v221;
  const char *v222;
  uint64_t v223;
  unint64_t v224;
  const char *v225;
  uint64_t v226;
  void *v227;
  const char *v228;
  void *v229;
  char v230;
  const char *v231;
  uint64_t v232;
  void *v233;
  const char *v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  unint64_t v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  _QWORD *v250;
  const char *v251;
  uint64_t v252;
  void *v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  void *v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  unint64_t m;
  void *v262;
  const char *v263;
  uint64_t v264;
  unint64_t v265;
  const char *v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  void *v270;
  char v271;
  const char *v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  void *v276;
  id v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  unint64_t v284;
  uint64_t v285;
  void *v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  _QWORD *v294;
  const char *v295;
  uint64_t v296;
  void *v297;
  const char *v298;
  uint64_t v299;
  const char *v300;
  uint64_t v301;
  unint64_t n;
  void *v303;
  const char *v304;
  uint64_t v305;
  unint64_t v306;
  const char *v307;
  uint64_t v308;
  void *v309;
  const char *v310;
  void *v311;
  char v312;
  const char *v313;
  uint64_t v314;
  void *v315;
  const char *v316;
  void *v317;
  const char *v318;
  uint64_t v319;
  unint64_t v320;
  uint64_t v321;
  void *v322;
  const char *v323;
  uint64_t v324;
  uint64_t v325;
  unsigned int v326;
  unsigned int v327;
  uint64_t v329;
  void *v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  unint64_t v336[8];
  void *v337;
  uint64_t v338;
  uint64_t v339;
  char v340;
  uint64_t v341;
  uint64_t *v342;
  _QWORD v343[2];
  __int128 v344;
  _BYTE v345[32];

  v344 = 0uLL;
  v343[0] = 0;
  v343[1] = 0;
  v342 = v343;
  objc_msgSend_arg1(self, a3, (uint64_t)a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(v5, v6, v7);

  if (v8)
  {
    v9 = (_QWORD *)operator new();
    objc_msgSend_arg1(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_count(v12, v13, v14);
    sub_233CB23B0(v9, v15);

    if (v9[1])
    {
      v336[0] = (unint64_t)v9;
      sub_233CAF24C(&v342, v336, (uint64_t *)v336);
      for (i = 0; ; ++i)
      {
        objc_msgSend_arg1(self, v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend_count(v19, v20, v21);

        if (i >= v22)
        {
          v329 = v9[1];
          objc_msgSend_arg1(self, v23, v24);
          v330 = (void *)objc_claimAutoreleasedReturnValue();
          v333 = objc_msgSend_count(v330, v331, v332);
          sub_233CAF22C(v336, v329, v333);
          v344 = *(_OWORD *)v336;

          goto LABEL_42;
        }
        objc_msgSend_arg1(self, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v25, v26, i);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          break;
        objc_msgSend_arg1(self, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v31, v32, i);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_a(v33, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v9[1] + (i << 7)) = objc_msgSend_unsignedCharValue(v36, v37, v38);

        objc_msgSend_b(v33, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v9[1] + (i << 7) + 1) = objc_msgSend_BOOLValue(v41, v42, v43);

        objc_msgSend_c(v33, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_a(v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v9[1] + (i << 7) + 8) = objc_msgSend_unsignedCharValue(v49, v50, v51);

        objc_msgSend_c(v33, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_b(v54, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v9[1] + (i << 7) + 9) = objc_msgSend_BOOLValue(v57, v58, v59);

        objc_msgSend_c(v33, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_c(v62, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v9[1] + (i << 7) + 10) = objc_msgSend_unsignedCharValue(v65, v66, v67);

        objc_msgSend_c(v33, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_d(v70, v71, v72);
        v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v76 = objc_msgSend_bytes(v73, v74, v75);
        v79 = objc_msgSend_length(v73, v77, v78);
        sub_233BF7114(v336, v76, v79);

        *(_OWORD *)(v9[1] + (i << 7) + 16) = *(_OWORD *)v336;
        objc_msgSend_c(v33, v80, v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_e(v82, v83, v84);
        v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v88 = objc_msgSend_UTF8String(v85, v86, v87);
        v90 = objc_msgSend_lengthOfBytesUsingEncoding_(v85, v89, 4);
        sub_233CAF22C(v336, v88, v90);

        *(_OWORD *)(v9[1] + (i << 7) + 32) = *(_OWORD *)v336;
        objc_msgSend_c(v33, v91, v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_f(v93, v94, v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(v9[1] + (i << 7) + 48) = objc_msgSend_unsignedCharValue(v96, v97, v98);

        objc_msgSend_c(v33, v99, v100);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_g(v101, v102, v103);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_floatValue(v104, v105, v106);
        *(_DWORD *)(v9[1] + (i << 7) + 52) = v107;

        objc_msgSend_c(v33, v108, v109);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_h(v110, v111, v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v113, v114, v115);
        *(_QWORD *)(v9[1] + (i << 7) + 56) = v116;

        objc_msgSend_d(v33, v117, v118);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = objc_msgSend_count(v119, v120, v121);

        if (v122)
        {
          v125 = (_QWORD *)operator new();
          objc_msgSend_d(v33, v126, v127);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = objc_msgSend_count(v128, v129, v130);
          sub_233CB24EC(v125, v131);

          if (v125[1])
          {
            v336[0] = (unint64_t)v125;
            sub_233CAF24C(&v342, v336, (uint64_t *)v336);
            v134 = 0;
            for (j = 0; ; ++j)
            {
              objc_msgSend_d(v33, v132, v133);
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              v139 = objc_msgSend_count(v136, v137, v138);

              if (j >= v139)
              {
                v201 = v125[1];
                objc_msgSend_d(v33, v140, v141);
                v202 = (void *)objc_claimAutoreleasedReturnValue();
                v205 = objc_msgSend_count(v202, v203, v204);
                sub_233CAF22C(v336, v201, v205);
                *(_OWORD *)(v9[1] + (i << 7) + 64) = *(_OWORD *)v336;

                goto LABEL_14;
              }
              objc_msgSend_d(v33, v140, v141);
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v142, v143, j);
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v145 = objc_opt_isKindOfClass();

              if ((v145 & 1) == 0)
                break;
              objc_msgSend_d(v33, v146, v147);
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v148, v149, j);
              v150 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_a(v150, v151, v152);
              v153 = (void *)objc_claimAutoreleasedReturnValue();
              *(_BYTE *)(v125[1] + v134) = objc_msgSend_unsignedCharValue(v153, v154, v155);

              objc_msgSend_b(v150, v156, v157);
              v158 = (void *)objc_claimAutoreleasedReturnValue();
              *(_BYTE *)(v125[1] + v134 + 1) = objc_msgSend_BOOLValue(v158, v159, v160);

              objc_msgSend_c(v150, v161, v162);
              v163 = (void *)objc_claimAutoreleasedReturnValue();
              *(_BYTE *)(v125[1] + v134 + 2) = objc_msgSend_unsignedCharValue(v163, v164, v165);

              objc_msgSend_d(v150, v166, v167);
              v168 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v171 = objc_msgSend_bytes(v168, v169, v170);
              v174 = objc_msgSend_length(v168, v172, v173);
              sub_233BF7114(v336, v171, v174);

              *(_OWORD *)(v125[1] + v134 + 8) = *(_OWORD *)v336;
              objc_msgSend_e(v150, v175, v176);
              v177 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v180 = objc_msgSend_UTF8String(v177, v178, v179);
              v182 = objc_msgSend_lengthOfBytesUsingEncoding_(v177, v181, 4);
              sub_233CAF22C(v336, v180, v182);

              *(_OWORD *)(v125[1] + v134 + 24) = *(_OWORD *)v336;
              objc_msgSend_f(v150, v183, v184);
              v185 = (void *)objc_claimAutoreleasedReturnValue();
              *(_BYTE *)(v125[1] + v134 + 40) = objc_msgSend_unsignedCharValue(v185, v186, v187);

              objc_msgSend_g(v150, v188, v189);
              v190 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_floatValue(v190, v191, v192);
              *(_DWORD *)(v125[1] + v134 + 44) = v193;

              objc_msgSend_h(v150, v194, v195);
              v196 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_doubleValue(v196, v197, v198);
              *(_QWORD *)(v125[1] + v134 + 48) = v199;

              v134 += 56;
            }
            v327 = 35024;
          }
          else
          {
            v327 = 35018;
          }
          goto LABEL_55;
        }
        v200 = v9[1] + (i << 7);
        *(_QWORD *)(v200 + 64) = 0;
        *(_QWORD *)(v200 + 72) = 0;
LABEL_14:
        objc_msgSend_e(v33, v123, v124);
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        v209 = objc_msgSend_count(v206, v207, v208);

        if (v209)
        {
          v212 = (_QWORD *)operator new();
          objc_msgSend_e(v33, v213, v214);
          v215 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_count(v215, v216, v217);
          *v212 = &off_2504EF520;
          v212[1] = operator new[]();

          if (v212[1])
          {
            v336[0] = (unint64_t)v212;
            sub_233CAF24C(&v342, v336, (uint64_t *)v336);
            for (k = 0; ; ++k)
            {
              objc_msgSend_e(v33, v218, v219);
              v221 = (void *)objc_claimAutoreleasedReturnValue();
              v224 = objc_msgSend_count(v221, v222, v223);

              if (k >= v224)
              {
                v239 = v212[1];
                objc_msgSend_e(v33, v225, v226);
                v240 = (void *)objc_claimAutoreleasedReturnValue();
                v243 = objc_msgSend_count(v240, v241, v242);
                sub_233CAF22C(v336, v239, v243);
                *(_OWORD *)(v9[1] + (i << 7) + 80) = *(_OWORD *)v336;

                goto LABEL_22;
              }
              objc_msgSend_e(v33, v225, v226);
              v227 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v227, v228, k);
              v229 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v230 = objc_opt_isKindOfClass();

              if ((v230 & 1) == 0)
                break;
              objc_msgSend_e(v33, v231, v232);
              v233 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v233, v234, k);
              v235 = (void *)objc_claimAutoreleasedReturnValue();

              *(_DWORD *)(v212[1] + 4 * k) = objc_msgSend_unsignedIntValue(v235, v236, v237);
            }
            v327 = 35053;
          }
          else
          {
            v327 = 35047;
          }
          goto LABEL_55;
        }
        v238 = v9[1] + (i << 7);
        *(_QWORD *)(v238 + 80) = 0;
        *(_QWORD *)(v238 + 88) = 0;
LABEL_22:
        objc_msgSend_f(v33, v210, v211);
        v244 = (void *)objc_claimAutoreleasedReturnValue();
        v247 = objc_msgSend_count(v244, v245, v246);

        if (v247)
        {
          v250 = (_QWORD *)operator new();
          objc_msgSend_f(v33, v251, v252);
          v253 = (void *)objc_claimAutoreleasedReturnValue();
          v256 = objc_msgSend_count(v253, v254, v255);
          *v250 = &off_2504EF408;
          v257 = (void *)operator new[]();
          v258 = v257;
          if (v256)
            bzero(v257, 16 * v256);
          v250[1] = v258;

          if (v250[1])
          {
            v336[0] = (unint64_t)v250;
            sub_233CAF24C(&v342, v336, (uint64_t *)v336);
            for (m = 0; ; ++m)
            {
              objc_msgSend_f(v33, v259, v260);
              v262 = (void *)objc_claimAutoreleasedReturnValue();
              v265 = objc_msgSend_count(v262, v263, v264);

              if (m >= v265)
              {
                v285 = v250[1];
                objc_msgSend_f(v33, v266, v267);
                v286 = (void *)objc_claimAutoreleasedReturnValue();
                v289 = objc_msgSend_count(v286, v287, v288);
                sub_233CAF22C(v336, v285, v289);
                *(_OWORD *)(v9[1] + (i << 7) + 96) = *(_OWORD *)v336;

                goto LABEL_32;
              }
              objc_msgSend_f(v33, v266, v267);
              v268 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v268, v269, m);
              v270 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v271 = objc_opt_isKindOfClass();

              if ((v271 & 1) == 0)
                break;
              objc_msgSend_f(v33, v272, v273);
              v274 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v274, v275, m);
              v276 = (void *)objc_claimAutoreleasedReturnValue();

              v277 = objc_retainAutorelease(v276);
              v280 = objc_msgSend_bytes(v277, v278, v279);
              v283 = objc_msgSend_length(v277, v281, v282);
              sub_233BF7114(v336, v280, v283);

              *(_OWORD *)(v250[1] + 16 * m) = *(_OWORD *)v336;
            }
            v327 = 35075;
          }
          else
          {
            v327 = 35069;
          }
          goto LABEL_55;
        }
        v284 = v9[1] + (i << 7);
        *(_QWORD *)(v284 + 96) = 0;
        *(_QWORD *)(v284 + 104) = 0;
LABEL_32:
        objc_msgSend_g(v33, v248, v249);
        v290 = (void *)objc_claimAutoreleasedReturnValue();
        v293 = objc_msgSend_count(v290, v291, v292);

        if (v293)
        {
          v294 = (_QWORD *)operator new();
          objc_msgSend_g(v33, v295, v296);
          v297 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_count(v297, v298, v299);
          *v294 = &off_2504EF750;
          v294[1] = operator new[]();

          if (v294[1])
          {
            v336[0] = (unint64_t)v294;
            sub_233CAF24C(&v342, v336, (uint64_t *)v336);
            for (n = 0; ; ++n)
            {
              objc_msgSend_g(v33, v300, v301);
              v303 = (void *)objc_claimAutoreleasedReturnValue();
              v306 = objc_msgSend_count(v303, v304, v305);

              if (n >= v306)
              {
                v321 = v294[1];
                objc_msgSend_g(v33, v307, v308);
                v322 = (void *)objc_claimAutoreleasedReturnValue();
                v325 = objc_msgSend_count(v322, v323, v324);
                sub_233BF7114(v336, v321, v325);
                *(_OWORD *)(v9[1] + (i << 7) + 112) = *(_OWORD *)v336;

                goto LABEL_40;
              }
              objc_msgSend_g(v33, v307, v308);
              v309 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v309, v310, n);
              v311 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v312 = objc_opt_isKindOfClass();

              if ((v312 & 1) == 0)
                break;
              objc_msgSend_g(v33, v313, v314);
              v315 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v315, v316, n);
              v317 = (void *)objc_claimAutoreleasedReturnValue();

              *(_BYTE *)(v294[1] + n) = objc_msgSend_unsignedCharValue(v317, v318, v319);
            }
            v327 = 35097;
          }
          else
          {
            v327 = 35091;
          }
LABEL_55:
          retstr->mError = 47;
          retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/"
                          "zap-generated/MTRCommandPayloadsObjc.mm";
          retstr->mLine = v327;

          return (ChipError *)sub_233CAF15C((uint64_t)&v342);
        }
        v320 = v9[1] + (i << 7);
        *(_QWORD *)(v320 + 112) = 0;
        *(_QWORD *)(v320 + 120) = 0;
LABEL_40:

      }
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v326 = 34999;
    }
    else
    {
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v326 = 34993;
    }
    retstr->mLine = v326;
  }
  else
  {
    v344 = 0uLL;
LABEL_42:
    sub_234118674(0x62FuLL, 0, &v341);
    if (v341)
    {
      sub_234106C48((uint64_t)v336);
      v338 = 0;
      v339 = 0;
      v337 = &unk_250504030;
      v340 = 0;
      sub_233CAF098((uint64_t)&v337, &v341, 0);
      sub_234106CA8((uint64_t)v336, (uint64_t)&v337, 0xFFFFFFFF, (uint64_t)v345);
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233D3F6B0((uint64_t)&v344, (char *)v336, 0x100uLL, (uint64_t)retstr);
      if (!retstr->mError)
      {
        *(_QWORD *)&retstr->mError = 0;
        retstr->mFile = 0;
        *(_QWORD *)&retstr->mLine = 0;
        sub_233C115F0((uint64_t)v336, &v341, retstr);
        if (!retstr->mError)
        {
          sub_233C11670((uint64_t)a4, &v341);
          sub_234106010((uint64_t)a4, 21, 256, retstr);
        }
      }
      v337 = &unk_250504030;
      sub_233CAF128(&v339);
      sub_233CAF128(&v338);
    }
    else
    {
      retstr->mError = 11;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = 35117;
    }
    sub_233CAF128(&v341);
  }
  return (ChipError *)sub_233CAF15C((uint64_t)&v342);
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
    v11 = 35146;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
