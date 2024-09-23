@implementation MTRDemandResponseLoadControlClusterAddLoadControlEventRequestParams

- (MTRDemandResponseLoadControlClusterAddLoadControlEventRequestParams)init
{
  MTRDemandResponseLoadControlClusterAddLoadControlEventRequestParams *v2;
  uint64_t v3;
  MTRDemandResponseLoadControlClusterLoadControlEventStruct *event;
  NSNumber *timedInvokeTimeoutMs;
  NSNumber *serverSideProcessingTimeout;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRDemandResponseLoadControlClusterAddLoadControlEventRequestParams;
  v2 = -[MTRDemandResponseLoadControlClusterAddLoadControlEventRequestParams init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    event = v2->_event;
    v2->_event = (MTRDemandResponseLoadControlClusterLoadControlEventStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDemandResponseLoadControlClusterAddLoadControlEventRequestParams *v4;
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

  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterAddLoadControlEventRequestParams);
  objc_msgSend_event(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEvent_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: event:%@; >"), v5, self->_event);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTRDemandResponseLoadControlClusterLoadControlEventStruct)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
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
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  _QWORD *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  unint64_t v98;
  const char *v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t i;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  unint64_t v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  void *v117;
  char isKindOfClass;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  void *v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  void *v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  ChipError *v255;
  int v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  unint64_t v268[8];
  void *v269;
  uint64_t v270;
  uint64_t v271;
  char v272;
  uint64_t v273;
  uint64_t *v274;
  _QWORD v275[2];
  __int128 v276;
  __int128 v277;
  char v278;
  __int16 v279;
  int v280;
  __int16 v281;
  char v282;
  int v283;
  char v284;
  uint64_t v285;
  uint64_t v286;
  _BYTE v287[32];

  v278 = 0;
  v279 = 0;
  v280 = 0;
  LOBYTE(v281) = 0;
  v282 = 0;
  LOBYTE(v283) = 0;
  v284 = 0;
  v285 = 0;
  v286 = 0;
  v276 = 0uLL;
  LOBYTE(v277) = 0;
  v275[0] = 0;
  v275[1] = 0;
  v274 = v275;
  objc_msgSend_event(self, a3, (uint64_t)a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_eventID(v5, v6, v7);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend_bytes(v8, v9, v10);
  v14 = objc_msgSend_length(v8, v12, v13);
  sub_233BF7114(v268, v11, v14);

  v276 = *(_OWORD *)v268;
  objc_msgSend_event(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_programID(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v277 = 0uLL;
    v278 = 1;
    objc_msgSend_event(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_programID(v23, v24, v25);
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = objc_msgSend_bytes(v26, v27, v28);
    v32 = objc_msgSend_length(v26, v30, v31);
    sub_233BF7114(v268, v29, v32);

    v277 = *(_OWORD *)v268;
  }
  objc_msgSend_event(self, v21, v22);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_control(v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v279 = objc_msgSend_unsignedShortValue(v36, v37, v38);

  objc_msgSend_event(self, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceClass(v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v280 = objc_msgSend_unsignedIntValue(v44, v45, v46);

  objc_msgSend_event(self, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enrollmentGroup(v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    v281 = 1;
    objc_msgSend_event(self, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_enrollmentGroup(v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    HIBYTE(v281) = objc_msgSend_unsignedCharValue(v58, v59, v60);

  }
  objc_msgSend_event(self, v53, v54);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_criticality(v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v282 = objc_msgSend_unsignedCharValue(v64, v65, v66);

  objc_msgSend_event(self, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startTime(v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    v283 = 0;
    v284 = 1;
    objc_msgSend_event(self, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startTime(v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v283 = objc_msgSend_unsignedIntValue(v78, v79, v80);

  }
  objc_msgSend_event(self, v73, v74);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transitions(v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend_count(v84, v85, v86);
  v88 = &v285;

  if (v87)
  {
    v89 = (_QWORD *)operator new();
    objc_msgSend_event(self, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transitions(v92, v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend_count(v95, v96, v97);
    sub_233CB0054(v89, v98);

    if (v89[1])
    {
      v268[0] = (unint64_t)v89;
      sub_233CAF24C(&v274, v268, (uint64_t *)v268);
      v101 = 0;
      for (i = 37; ; i += 38)
      {
        objc_msgSend_event(self, v99, v100);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transitions(v103, v104, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = objc_msgSend_count(v106, v107, v108);

        if (v101 >= v109)
        {
          v257 = v89[1];
          objc_msgSend_event(self, v110, v111);
          v258 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_transitions(v258, v259, v260);
          v261 = (void *)objc_claimAutoreleasedReturnValue();
          v264 = objc_msgSend_count(v261, v262, v263);
          sub_233CAF22C(v268, v257, v264);
          *(_OWORD *)v88 = *(_OWORD *)v268;

          goto LABEL_45;
        }
        objc_msgSend_event(self, v110, v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transitions(v112, v113, v114);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v115, v116, v101);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          break;
        objc_msgSend_event(self, v119, v120);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transitions(v121, v122, v123);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v124, v125, v101);
        v126 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_duration(v126, v127, v128);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        *(_WORD *)(v89[1] + i - 37) = objc_msgSend_unsignedShortValue(v129, v130, v131);

        objc_msgSend_control(v126, v132, v133);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        *(_WORD *)(v89[1] + i - 35) = objc_msgSend_unsignedShortValue(v134, v135, v136);

        objc_msgSend_temperatureControl(v126, v137, v138);
        v139 = (void *)objc_claimAutoreleasedReturnValue();

        if (v139)
        {
          v142 = v88;
          v143 = v89[1];
          *(_QWORD *)(v143 + i - 31) = 0;
          v144 = v143 + i - 31;
          *(_BYTE *)(v144 - 2) = 1;
          *(_QWORD *)(v144 + 8) = 0;
          *(_QWORD *)(v144 + 16) = 0;
          objc_msgSend_temperatureControl(v126, v140, v141);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_coolingTempOffset(v145, v146, v147);
          v148 = (void *)objc_claimAutoreleasedReturnValue();

          if (v148)
          {
            *(_BYTE *)v144 = 1;
            v151 = v143 + i;
            *(_DWORD *)(v143 + i - 29) = 0;
            objc_msgSend_temperatureControl(v126, v149, v150);
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_coolingTempOffset(v152, v153, v154);
            v155 = (void *)objc_claimAutoreleasedReturnValue();

            v156 = v143 + i;
            if (v155)
            {
              *(_WORD *)(v151 - 29) = 0;
              *(_BYTE *)(v156 - 27) = 1;
              objc_msgSend_temperatureControl(v126, v149, v150);
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_coolingTempOffset(v157, v158, v159);
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              *(_WORD *)(v151 - 29) = objc_msgSend_unsignedShortValue(v160, v161, v162);

            }
            else if (*(_BYTE *)(v156 - 27))
            {
              *(_BYTE *)(v156 - 27) = 0;
            }
          }
          objc_msgSend_temperatureControl(v126, v149, v150);
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_heatingtTempOffset(v163, v164, v165);
          v166 = (void *)objc_claimAutoreleasedReturnValue();

          if (v166)
          {
            v169 = v143 + i;
            *(_BYTE *)(v169 - 25) = 1;
            *(_DWORD *)(v169 - 23) = 0;
            objc_msgSend_temperatureControl(v126, v167, v168);
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_heatingtTempOffset(v170, v171, v172);
            v173 = (void *)objc_claimAutoreleasedReturnValue();

            v174 = v143 + i;
            if (v173)
            {
              *(_WORD *)(v169 - 23) = 0;
              *(_BYTE *)(v174 - 21) = 1;
              objc_msgSend_temperatureControl(v126, v167, v168);
              v175 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_heatingtTempOffset(v175, v176, v177);
              v178 = (void *)objc_claimAutoreleasedReturnValue();
              *(_WORD *)(v169 - 23) = objc_msgSend_unsignedShortValue(v178, v179, v180);

            }
            else if (*(_BYTE *)(v174 - 21))
            {
              *(_BYTE *)(v174 - 21) = 0;
            }
          }
          objc_msgSend_temperatureControl(v126, v167, v168);
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_coolingTempSetpoint(v181, v182, v183);
          v184 = (void *)objc_claimAutoreleasedReturnValue();

          if (v184)
          {
            v187 = v143 + i;
            *(_BYTE *)(v187 - 19) = 1;
            *(_DWORD *)(v187 - 17) = 0;
            objc_msgSend_temperatureControl(v126, v185, v186);
            v188 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_coolingTempSetpoint(v188, v189, v190);
            v191 = (void *)objc_claimAutoreleasedReturnValue();

            v192 = v143 + i;
            if (v191)
            {
              *(_WORD *)(v187 - 17) = 0;
              *(_BYTE *)(v192 - 15) = 1;
              objc_msgSend_temperatureControl(v126, v185, v186);
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_coolingTempSetpoint(v193, v194, v195);
              v196 = (void *)objc_claimAutoreleasedReturnValue();
              *(_WORD *)(v187 - 17) = objc_msgSend_shortValue(v196, v197, v198);

            }
            else if (*(_BYTE *)(v192 - 15))
            {
              *(_BYTE *)(v192 - 15) = 0;
            }
          }
          objc_msgSend_temperatureControl(v126, v185, v186);
          v199 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_heatingTempSetpoint(v199, v200, v201);
          v202 = (void *)objc_claimAutoreleasedReturnValue();

          v88 = v142;
          if (v202)
          {
            v203 = v143 + i;
            *(_BYTE *)(v203 - 13) = 1;
            *(_DWORD *)(v203 - 11) = 0;
            objc_msgSend_temperatureControl(v126, v140, v141);
            v204 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_heatingTempSetpoint(v204, v205, v206);
            v207 = (void *)objc_claimAutoreleasedReturnValue();

            v208 = v143 + i;
            if (v207)
            {
              *(_WORD *)(v203 - 11) = 0;
              *(_BYTE *)(v208 - 9) = 1;
              objc_msgSend_temperatureControl(v126, v140, v141);
              v209 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_heatingTempSetpoint(v209, v210, v211);
              v212 = (void *)objc_claimAutoreleasedReturnValue();
              *(_WORD *)(v203 - 11) = objc_msgSend_shortValue(v212, v213, v214);

              v88 = v142;
            }
            else
            {
              v88 = v142;
              if (*(_BYTE *)(v208 - 9))
                *(_BYTE *)(v208 - 9) = 0;
            }
          }
        }
        objc_msgSend_averageLoadControl(v126, v140, v141);
        v215 = (void *)objc_claimAutoreleasedReturnValue();

        if (v215)
        {
          v218 = v89[1] + i;
          *(_WORD *)(v218 - 7) = 1;
          objc_msgSend_averageLoadControl(v126, v216, v217);
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_loadAdjustment(v219, v220, v221);
          v222 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(v218 - 6) = objc_msgSend_charValue(v222, v223, v224);

        }
        objc_msgSend_dutyCycleControl(v126, v216, v217);
        v225 = (void *)objc_claimAutoreleasedReturnValue();

        if (v225)
        {
          v228 = v89[1] + i;
          *(_WORD *)(v228 - 5) = 1;
          objc_msgSend_dutyCycleControl(v126, v226, v227);
          v229 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dutyCycle(v229, v230, v231);
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(v228 - 4) = objc_msgSend_unsignedCharValue(v232, v233, v234);

        }
        objc_msgSend_powerSavingsControl(v126, v226, v227);
        v235 = (void *)objc_claimAutoreleasedReturnValue();

        if (v235)
        {
          v238 = v89[1] + i;
          *(_WORD *)(v238 - 3) = 1;
          objc_msgSend_powerSavingsControl(v126, v236, v237);
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_powerSavings(v239, v240, v241);
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(v238 - 2) = objc_msgSend_unsignedCharValue(v242, v243, v244);

        }
        objc_msgSend_heatingSourceControl(v126, v236, v237);
        v245 = (void *)objc_claimAutoreleasedReturnValue();

        if (v245)
        {
          v248 = v89[1];
          *(_WORD *)(v248 + i - 1) = 1;
          objc_msgSend_heatingSourceControl(v126, v246, v247);
          v249 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_heatingSource(v249, v250, v251);
          v252 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(v248 + i) = objc_msgSend_unsignedCharValue(v252, v253, v254);

        }
        ++v101;
      }
      v255 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v256 = 15457;
    }
    else
    {
      v255 = retstr;
      retstr->mError = 47;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      v256 = 15451;
    }
    v255->mLine = v256;
  }
  else
  {
    v285 = 0;
    v286 = 0;
LABEL_45:
    sub_234118674(0x62FuLL, 0, &v273);
    if (v273)
    {
      sub_234106C48((uint64_t)v268);
      v270 = 0;
      v271 = 0;
      v269 = &unk_250504030;
      v272 = 0;
      sub_233CAF098((uint64_t)&v269, &v273, 0);
      sub_234106CA8((uint64_t)v268, (uint64_t)&v269, 0xFFFFFFFF, (uint64_t)v287);
      *(_QWORD *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(_QWORD *)&retstr->mLine = 0;
      sub_233D1CFB0((uint64_t)&v276, (char *)v268, 0x100uLL, (uint64_t)retstr);
      if (!retstr->mError)
      {
        *(_QWORD *)&retstr->mError = 0;
        retstr->mFile = 0;
        *(_QWORD *)&retstr->mLine = 0;
        sub_233C115F0((uint64_t)v268, &v273, retstr);
        if (!retstr->mError)
        {
          sub_233C11670((uint64_t)a4, &v273);
          sub_234106010((uint64_t)a4, 21, 256, retstr);
        }
      }
      v269 = &unk_250504030;
      sub_233CAF128(&v271);
      sub_233CAF128(&v270);
    }
    else
    {
      retstr->mError = 11;
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-"
                      "generated/MTRCommandPayloadsObjc.mm";
      retstr->mLine = 15527;
    }
    sub_233CAF128(&v273);
  }
  return (ChipError *)sub_233CAF15C((uint64_t)&v274);
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
    v11 = 15556;
    sub_2340017F0((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_233CAF128(&v15);
  return v8;
}

@end
