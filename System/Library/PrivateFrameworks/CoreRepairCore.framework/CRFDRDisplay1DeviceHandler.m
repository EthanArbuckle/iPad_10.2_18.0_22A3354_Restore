@implementation CRFDRDisplay1DeviceHandler

+ (BOOL)isDisplay1ProductType:(int)a3
{
  return *(_QWORD *)&a3 == 376943508;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  uint64_t v3;
  CRFDRDisplay1DeviceHandler *v4;

  if (objc_msgSend_isDisplay1ProductType_(CRFDRDisplay1DeviceHandler, a2, *(uint64_t *)&a3, v3))v4 = objc_alloc_init(CRFDRDisplay1DeviceHandler);
  else
    v4 = 0;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRFDRDisplay1DeviceHandler);
}

- (id)getExcludedPropertiesForFactoryReset
{
  return &unk_24D1B8530;
}

- (id)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makePropertiesDict:(id *)a5 fdrError:(id *)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  id *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  id v68;
  const char *v69;
  uint64_t v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  NSObject *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  NSObject *v109;
  NSObject *v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  int v127;
  id v128;
  NSObject *v130;
  const char *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  const char *v136;
  void *v137;
  const char *v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  char isEqualToString;
  uint64_t v147;
  void *v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  int v165;
  NSObject *v166;
  void *v167;
  const char *v168;
  const char *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t i;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  void *v186;
  const char *v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  const char *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  NSObject *v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  void *v203;
  const char *v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
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
  void *v229;
  const char *v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  NSObject *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  NSObject *v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t j;
  uint64_t v262;
  void *v263;
  const char *v264;
  NSObject *v265;
  id v266;
  id v267;
  void *v268;
  id v269;
  id *v270;
  id *v271;
  id *v272;
  id *v273;
  id v274;
  id obj;
  id v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  id v289;
  void *v290;
  uint64_t v291;
  uint64_t v292;
  _BYTE v293[128];
  _BYTE v294[128];
  uint64_t v295;
  void *v296;
  _BYTE v297[128];
  uint64_t v298;
  const __CFString *v299;
  uint64_t v300;
  const __CFString *v301;
  uint8_t buf[4];
  void *v303;
  _QWORD v304[4];

  v304[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v290 = 0;
  v274 = (id)objc_opt_new();
  objc_msgSend_currentProperties(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  obj = (id)objc_msgSend_mutableCopy(v14, v15, v16, v17);

  if (objc_msgSend_allowFactoryReset(self, v18, v19, v20))
  {
    handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v24, OS_LOG_TYPE_DEFAULT, "Resetting to factory settings", buf, 2u);
    }

    objc_msgSend_setObject_forKeyedSubscript_(obj, v25, (uint64_t)CFSTR("1"), (uint64_t)CFSTR("SrvP"));
    objc_msgSend_getExcludedPropertiesForFactoryReset(self, v26, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectsForKeys_(obj, v30, (uint64_t)v29, v31);
    AMFDRGetOptions();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v32;
    if (v32)
    {
      v36 = v29;
      v37 = a5;
      objc_msgSend_objectForKeyedSubscript_(v32, v33, (uint64_t)CFSTR("Metadata"), v34);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend_mutableCopy(v38, v39, v40, v41);
      if (v45)
      {
        objc_msgSend_currentProperties(self, v42, v43, v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v46, v47, (uint64_t)CFSTR("mlb#"), v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          v304[0] = CFSTR("SerialNumber");
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v50, (uint64_t)v304, 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObjectsForKeys_(v45, v52, (uint64_t)v51, v53);

          objc_msgSend_currentProperties(self, v54, v55, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v57, v58, (uint64_t)CFSTR("mlb#"), v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v45, v61, (uint64_t)v60, (uint64_t)CFSTR("MLBNumber"));

          AMFDRSetOption();
        }
      }
      handleForCategory(0);
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v303 = v45;
        _os_log_impl(&dword_214503000, v62, OS_LOG_TYPE_DEFAULT, "Meta-data = %@", buf, 0xCu);
      }

      a5 = v37;
      v29 = v36;
    }

    v63 = 0;
    v64 = 0;
    goto LABEL_36;
  }
  if (objc_msgSend_isServicePart(self, v21, v22, v23))
  {
    if ((objc_msgSend_containsObject_(v10, v65, (uint64_t)CFSTR("MLB"), v66) & 1) == 0)
    {
      handleForCategory(0);
      v110 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
        sub_2145693D4();

      v111 = (void *)MEMORY[0x24BDD1540];
      v300 = *MEMORY[0x24BDD0FC8];
      v301 = CFSTR("KGB isServicePart without MLB SPC");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v112, (uint64_t)&v301, (uint64_t)&v300, 1);
      v113 = objc_claimAutoreleasedReturnValue();
      v114 = v111;
      v29 = v113;
      objc_msgSend_errorWithDomain_code_userInfo_(v114, v115, (uint64_t)CFSTR("com.apple.corerepair"), -30, v113);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    v289 = 0;
    objc_msgSend_getDataClassesAndInstancesOfKBBWith_propertiesDict_fdrError_(self, v67, (uint64_t)a4, (uint64_t)&v290, &v289);
    v29 = objc_claimAutoreleasedReturnValue();
    v68 = v289;
    if (v68)
    {
      v64 = v68;
      handleForCategory(0);
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        sub_2145693A8();
LABEL_17:

LABEL_35:
      v63 = 0;
LABEL_36:

      goto LABEL_37;
    }
    v265 = v29;
    v270 = a5;
    if (v290)
    {
      objc_msgSend_objectForKeyedSubscript_(v290, v69, (uint64_t)CFSTR("mlb#"), v70);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_KBBMLBSerialNumber(self, v140, v141, v142);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v139, v144, (uint64_t)v143, v145);

      if ((isEqualToString & 1) == 0)
      {
        v148 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_KBBSerialNumber(self, v69, v147, v70);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_KBBMLBSerialNumber(self, v150, v151, v152);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v290, v154, (uint64_t)CFSTR("mlb#"), v155);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v148, v157, (uint64_t)CFSTR("FGSN: %@, Entered KBB MLBSN: %@ doesn't match MLBSN in seal properties %@"), v158, v149, v153, v156);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_storeWarningStrings_(self, v160, (uint64_t)v159, v161);

      }
      if (v290)
      {
        objc_msgSend_objectForKeyedSubscript_(v290, v69, (uint64_t)CFSTR("SrvP"), v70);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        v165 = objc_msgSend_isEqualToString_(v162, v163, (uint64_t)CFSTR("1"), v164);

        if (v165)
        {
          handleForCategory(0);
          v166 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
            sub_21456937C();

          v167 = (void *)MEMORY[0x24BDD1540];
          v298 = *MEMORY[0x24BDD0FC8];
          v299 = CFSTR("KBB isServicePart");
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v168, (uint64_t)&v299, (uint64_t)&v298, 1);
          v71 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v167, v169, (uint64_t)CFSTR("com.apple.corerepair"), -29, v71);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          a5 = v270;
          v29 = v265;
          goto LABEL_17;
        }
      }
    }
    v273 = a6;
    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v69, (uint64_t)&unk_24D1B8548, v70);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v290 && objc_msgSend_count(v290, v170, v171, v172))
    {
      v267 = v10;
      v287 = 0u;
      v288 = 0u;
      v285 = 0u;
      v286 = 0u;
      v173 = v290;
      v175 = objc_msgSend_countByEnumeratingWithState_objects_count_(v173, v174, (uint64_t)&v285, (uint64_t)v297, 16);
      if (v175)
      {
        v178 = v175;
        v179 = *(_QWORD *)v286;
        do
        {
          for (i = 0; i != v178; ++i)
          {
            if (*(_QWORD *)v286 != v179)
              objc_enumerationMutation(v173);
            v181 = *(_QWORD *)(*((_QWORD *)&v285 + 1) + 8 * i);
            if (objc_msgSend_containsObject_(v77, v176, v181, v177))
            {
              objc_msgSend_objectForKeyedSubscript_(v290, v176, v181, v177);
              v185 = (void *)objc_claimAutoreleasedReturnValue();
              if (v185)
              {
                objc_msgSend_setObject_forKeyedSubscript_(obj, v182, (uint64_t)v185, v181);
              }
              else
              {
                objc_msgSend_null(MEMORY[0x24BDBCEF8], v182, v183, v184);
                v186 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(obj, v187, (uint64_t)v186, v181);

              }
            }
          }
          v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(v173, v176, (uint64_t)&v285, (uint64_t)v297, 16);
        }
        while (v178);
      }

      v10 = v267;
    }
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCE70], v170, (uint64_t)obj, v172);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setKBBTransferProperties_(self, v189, (uint64_t)v188, v190);

    objc_msgSend_setObject_forKeyedSubscript_(obj, v191, (uint64_t)CFSTR("0"), (uint64_t)CFSTR("SrvP"));
    v195 = objc_msgSend_mlbRepairChecks(self, v192, v193, v194);
    v76 = v265;
    if (v195)
    {
      v196 = v195;
      handleForCategory(0);
      v197 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v197, OS_LOG_TYPE_ERROR))
        sub_214569350();

      v198 = (void *)MEMORY[0x24BDD1540];
      v295 = *MEMORY[0x24BDD0FC8];
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v199, (uint64_t)CFSTR("MLB repair pre-check failed"), v200);
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      v296 = v201;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v202, (uint64_t)&v296, (uint64_t)&v295, 1);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v198, v204, (uint64_t)CFSTR("com.apple.corerepair"), v196, v203);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v63 = 0;
      a5 = v270;
      v29 = v265;
      goto LABEL_36;
    }
    AMFDRGetOptions();
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v205;
    if (v205)
    {
      objc_msgSend_objectForKeyedSubscript_(v205, v206, (uint64_t)CFSTR("Metadata"), v208);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      v216 = (void *)objc_msgSend_mutableCopy(v209, v210, v211, v212);
      if (v216)
      {
        v268 = v209;
        objc_msgSend_currentProperties(self, v213, v214, v215);
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v217, v218, (uint64_t)CFSTR("mlb#"), v219);
        v220 = (void *)objc_claimAutoreleasedReturnValue();

        if (v220)
        {
          objc_msgSend_currentProperties(self, v221, v222, v223);
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v224, v225, (uint64_t)CFSTR("mlb#"), v226);
          v227 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v216, v228, (uint64_t)v227, (uint64_t)CFSTR("MLBNumber"));

        }
        objc_msgSend_objectForKeyedSubscript_(v290, v221, (uint64_t)CFSTR("SrNm"), v223);
        v229 = (void *)objc_claimAutoreleasedReturnValue();

        if (v229)
        {
          objc_msgSend_objectForKeyedSubscript_(v290, v230, (uint64_t)CFSTR("SrNm"), v231);
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v216, v233, (uint64_t)v232, (uint64_t)CFSTR("SerialNumber"));

        }
        AMFDRSetOption();
        v209 = v268;
      }
      handleForCategory(0);
      v234 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v234, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v303 = v216;
        _os_log_impl(&dword_214503000, v234, OS_LOG_TYPE_DEFAULT, "Meta-data = %@", buf, 0xCu);
      }

    }
    if (!v265 || !objc_msgSend_count(v265, v206, v207, v208))
    {
      v63 = 0;
      goto LABEL_31;
    }
    v238 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend_allKeys(v265, v235, v236, v237);
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v238, v240, (uint64_t)v239, v241);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v242, (uint64_t)&unk_24D1B8560, v243);
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_intersectSet_(v63, v245, (uint64_t)v244, v246);

    handleForCategory(0);
    v247 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v247, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_allObjects(v63, v248, v249, v250);
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v303 = v251;
      _os_log_impl(&dword_214503000, v247, OS_LOG_TYPE_DEFAULT, "MakedataCLasses:%@", buf, 0xCu);

    }
    if (!v63 || !objc_msgSend_count(v63, v252, v253, v254))
      goto LABEL_31;
    v283 = 0u;
    v284 = 0u;
    v281 = 0u;
    v282 = 0u;
    v109 = v265;
    v256 = objc_msgSend_countByEnumeratingWithState_objects_count_(v109, v255, (uint64_t)&v281, (uint64_t)v294, 16);
    if (v256)
    {
      v259 = v256;
      v269 = v10;
      v260 = *(_QWORD *)v282;
      do
      {
        for (j = 0; j != v259; ++j)
        {
          if (*(_QWORD *)v282 != v260)
            objc_enumerationMutation(v109);
          v262 = *(_QWORD *)(*((_QWORD *)&v281 + 1) + 8 * j);
          if (objc_msgSend_containsObject_(v63, v257, v262, v258))
          {
            objc_msgSend_objectForKeyedSubscript_(v109, v257, v262, v258);
            v263 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v274, v264, (uint64_t)v263, v262);

          }
        }
        v259 = objc_msgSend_countByEnumeratingWithState_objects_count_(v109, v257, (uint64_t)&v281, (uint64_t)v294, 16);
      }
      while (v259);
      v76 = v109;
      v10 = v269;
      a6 = v273;
    }
    else
    {
      v76 = v109;
    }
LABEL_30:

LABEL_31:
    a5 = v270;
    goto LABEL_43;
  }
  handleForCategory(0);
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v72, OS_LOG_TYPE_DEFAULT, "MLB SPC ignored when not servivce Parts", buf, 2u);
  }

  AMFDRGetOptions();
  v73 = objc_claimAutoreleasedReturnValue();
  v76 = v73;
  if (v73)
  {
    objc_msgSend_objectForKeyedSubscript_(v73, v74, (uint64_t)CFSTR("Metadata"), v75);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = (void *)objc_msgSend_mutableCopy(v77, v78, v79, v80);
    if (v84)
    {
      objc_msgSend_currentProperties(self, v81, v82, v83);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v85, v86, (uint64_t)CFSTR("mlb#"), v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      if (v88)
      {
        objc_msgSend_currentProperties(self, v89, v90, v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v92, v93, (uint64_t)CFSTR("mlb#"), v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v84, v96, (uint64_t)v95, (uint64_t)CFSTR("MLBNumber"));

      }
      objc_msgSend_currentProperties(self, v89, v90, v91);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v97, v98, (uint64_t)CFSTR("SrNm"), v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();

      if (v100)
      {
        objc_msgSend_currentProperties(self, v101, v102, v103);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v104, v105, (uint64_t)CFSTR("SrNm"), v106);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v84, v108, (uint64_t)v107, (uint64_t)CFSTR("SerialNumber"));

      }
      AMFDRSetOption();
    }
    v270 = a5;
    handleForCategory(0);
    v109 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v303 = v84;
      _os_log_impl(&dword_214503000, v109, OS_LOG_TYPE_DEFAULT, "Meta-data = %@", buf, 0xCu);
    }
    v63 = 0;
    goto LABEL_30;
  }
  v63 = 0;
LABEL_43:

  if (objc_msgSend_containsObject_(v10, v117, (uint64_t)CFSTR("LCD"), v118))
  {
    v271 = a5;
    v279 = 0u;
    v280 = 0u;
    v277 = 0u;
    v278 = 0u;
    v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8578, v119, (uint64_t)&v277, (uint64_t)v293, 16);
    if (v120)
    {
      v123 = v120;
      v272 = a6;
      v266 = v10;
      v124 = *(_QWORD *)v278;
LABEL_46:
      v125 = 0;
      while (1)
      {
        if (*(_QWORD *)v278 != v124)
          objc_enumerationMutation(&unk_24D1B8578);
        v126 = *(_QWORD *)(*((_QWORD *)&v277 + 1) + 8 * v125);
        if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v121, v126, v122))
        {
          v276 = 0;
          v127 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v121, (uint64_t)v274, v126, &v276);
          v128 = v276;
          if (!v127 || v128 != 0)
            break;
        }
        if (v123 == ++v125)
        {
          v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8578, v121, (uint64_t)&v277, (uint64_t)v293, 16);
          if (v123)
            goto LABEL_46;
          v64 = 0;
          v10 = v266;
          a6 = v272;
          goto LABEL_64;
        }
      }
      v64 = v128;
      handleForCategory(0);
      v130 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
        sub_2145692F0();

      v10 = v266;
      a5 = v271;
      a6 = v272;
      if (!v64)
      {
        v134 = (void *)MEMORY[0x24BDD1540];
        v291 = *MEMORY[0x24BDD0FC8];
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v132, (uint64_t)CFSTR("Unable to copy current identifier for dataClass:%@"), v133, v126);
        v135 = objc_claimAutoreleasedReturnValue();
        v292 = v135;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v136, (uint64_t)&v292, (uint64_t)&v291, 1);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v134, v138, (uint64_t)CFSTR("com.apple.corerepair"), -26, v137);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = v135;
        goto LABEL_36;
      }
    }
    else
    {
      v64 = 0;
LABEL_64:
      a5 = v271;
    }
  }
  else
  {
    v64 = 0;
  }
LABEL_37:
  if (a5)
    objc_storeStrong(a5, obj);
  if (a6)
    *a6 = objc_retainAutorelease(v64);

  return v274;
}

- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3
{
  void *v3;
  NSObject *v4;

  v3 = (void *)objc_opt_new();
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_214569400();

  return v3;
}

- (BOOL)validateAndSetSerialNumbersUsingPartSPC:(id)a3 KGBSerialNumber:(id)a4 KBBSerialNumber:(id)a5 withError:(id *)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
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
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  BOOL v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  NSObject *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  NSObject *v65;
  const char *v66;
  void *v67;
  const char *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD v75[2];

  v75[1] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  objc_msgSend_currentProperties(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)CFSTR("SrNm"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_currentProperties(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)CFSTR("mlb#"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_componentsSeparatedByString_(v10, v25, (uint64_t)CFSTR(","), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v27, v28, v29, v30) || (unint64_t)objc_msgSend_count(v27, v31, v32, v33) >= 3)
  {
    handleForCategory(0);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_21456942C((uint64_t)v10, v37, v38, v39, v40, v41, v42, v43);

    v44 = (void *)MEMORY[0x24BDD1540];
    v74 = *MEMORY[0x24BDD0FC8];
    v75[0] = CFSTR("Serial number entered not valid");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v45, (uint64_t)v75, (uint64_t)&v74, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v44, v47, (uint64_t)CFSTR("com.apple.corerepair"), -34, v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (objc_msgSend_count(v27, v34, v35, v36) == 2)
  {
    objc_msgSend_objectAtIndexedSubscript_(v27, v50, 1, v51);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = 0;
  }
  objc_msgSend_objectAtIndexedSubscript_(v27, v50, 0, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_allowFactoryReset(self, v53, v54, v55) & 1) == 0)
  {
    if (v17)
    {
      if ((objc_msgSend_isEqualToString_(v17, v56, (uint64_t)v52, v57) & 1) == 0)
      {
        handleForCategory(0);
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          sub_2145694F0();

        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v59, (uint64_t)&v71, (uint64_t)&v70, 1, MEMORY[0x24BDD1540], *MEMORY[0x24BDD0FC8], CFSTR("Serial number passed in doesn't match what's on device"), v72, v73);
LABEL_25:
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v69, v68, (uint64_t)CFSTR("com.apple.corerepair"), -27, v67);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
        v49 = 0;
        goto LABEL_19;
      }
    }
    else if (!v24 || (objc_msgSend_isEqualToString_(v24, v56, (uint64_t)v9, v57) & 1) == 0)
    {
      handleForCategory(0);
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        sub_214569490();

      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v66, (uint64_t)&v73, (uint64_t)&v72, 1, MEMORY[0x24BDD1540], v70, v71, *MEMORY[0x24BDD0FC8], CFSTR("MLB Serial number passed in doesn't match what's on device"));
      goto LABEL_25;
    }
  }
  objc_msgSend_setKBBSerialNumber_(self, v56, (uint64_t)v52, v57);
  objc_msgSend_setKGBSerialNumber_(self, v60, (uint64_t)v9, v61);
  objc_msgSend_setKBBMLBSerialNumber_(self, v62, (uint64_t)v46, v63);

  v48 = 0;
  v49 = 1;
LABEL_19:

  if (a6)
    *a6 = objc_retainAutorelease(v48);

  return v49;
}

- (int64_t)performPostSealingStage:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  NSObject *v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  NSObject *v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  id v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  const char *v84;
  NSObject *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  int v108;
  const __CFString *v109;
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v108) = 0;
    _os_log_impl(&dword_214503000, v5, OS_LOG_TYPE_DEFAULT, "performPostSealingStage...", (uint8_t *)&v108, 2u);
  }

  v8 = objc_msgSend_containsObject_(v4, v6, (uint64_t)CFSTR("MLB"), v7);
  if (!v8)
    return 0;
  v12 = objc_msgSend_mlbRepairChecks(self, v9, v10, v11);
  if (!v12)
  {
    handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v108 = 138412290;
      v109 = CFSTR("Mod#");
      _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, "Syncing sysconfig: %@", (uint8_t *)&v108, 0xCu);
    }

    objc_msgSend_KBBTransferProperties(self, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)CFSTR("Mod#"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_alloc(MEMORY[0x24BDBCEC8]);
    v24 = (void *)objc_msgSend_initWithCapacity_(v21, v22, 16, v23);
    objc_msgSend_resetBytesInRange_(v24, v25, 0, 16);
    v29 = objc_msgSend_length(v20, v26, v27, v28);
    v30 = objc_retainAutorelease(v20);
    v34 = objc_msgSend_UTF8String(v30, v31, v32, v33);
    objc_msgSend_replaceBytesInRange_withBytes_(v24, v35, 0, v29, v34);
    LOBYTE(v29) = objc_msgSend_syncSysConfig_key_inBuffer_(self, v36, (uint64_t)CFSTR("Mod#"), 5036, v24);
    handleForCategory(0);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if ((v29 & 1) != 0)
    {
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v108 = 138412290;
        v109 = CFSTR("Regn");
        _os_log_impl(&dword_214503000, v38, OS_LOG_TYPE_DEFAULT, "Syncing sysconfig: %@", (uint8_t *)&v108, 0xCu);
      }

      objc_msgSend_KBBTransferProperties(self, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v42, v43, (uint64_t)CFSTR("Regn"), v44);
      v45 = objc_claimAutoreleasedReturnValue();

      v46 = objc_alloc(MEMORY[0x24BDBCEC8]);
      v49 = (void *)objc_msgSend_initWithCapacity_(v46, v47, 16, v48);
      objc_msgSend_resetBytesInRange_(v49, v50, 0, 16);
      v54 = objc_msgSend_length((void *)v45, v51, v52, v53);
      v38 = objc_retainAutorelease((id)v45);
      v58 = objc_msgSend_UTF8String(v38, v55, v56, v57);
      objc_msgSend_replaceBytesInRange_withBytes_(v49, v59, 0, v54, v58);
      LOBYTE(v45) = objc_msgSend_syncSysConfig_key_inBuffer_(self, v60, (uint64_t)CFSTR("Regn"), 31964, v49);
      handleForCategory(0);
      v61 = objc_claimAutoreleasedReturnValue();
      v62 = v61;
      if ((v45 & 1) != 0)
      {
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          v108 = 138412290;
          v109 = CFSTR("SrNm");
          _os_log_impl(&dword_214503000, v62, OS_LOG_TYPE_DEFAULT, "Syncing sysconfig: %@", (uint8_t *)&v108, 0xCu);
        }

        objc_msgSend_KBBTransferProperties(self, v63, v64, v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v66, v67, (uint64_t)CFSTR("SrNm"), v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        v70 = objc_alloc(MEMORY[0x24BDBCEC8]);
        v73 = (void *)objc_msgSend_initWithCapacity_(v70, v71, 16, v72);
        objc_msgSend_resetBytesInRange_(v73, v74, 0, 16);
        v78 = objc_msgSend_length(v69, v75, v76, v77);
        v62 = objc_retainAutorelease(v69);
        v82 = objc_msgSend_UTF8String(v62, v79, v80, v81);
        objc_msgSend_replaceBytesInRange_withBytes_(v73, v83, 0, v78, v82);
        v12 = 0;
        if ((objc_msgSend_syncSysConfig_key_inBuffer_(self, v84, (uint64_t)CFSTR("SrNm"), 46339, v73) & 1) == 0)
        {
          handleForCategory(0);
          v85 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            sub_214569550(v85, v86, v87, v88, v89, v90, v91, v92);

          v12 = 65;
        }

      }
      else
      {
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          sub_2145695C0(v62, v100, v101, v102, v103, v104, v105, v106);
        v12 = 64;
      }

    }
    else
    {
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        sub_214569630(v38, v93, v94, v95, v96, v97, v98, v99);
      v12 = 63;
    }

  }
  return v12;
}

- (BOOL)syncSysConfig:(id)a3 key:(unsigned int)a4 inBuffer:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v6 = *(_QWORD *)&a4;
  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  objc_msgSend_sharedAccess(CRSysConfig, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend_writeSystemConfig_inBuffer_(v12, v13, v6, (uint64_t)v8);

  if ((v6 & 1) != 0)
  {
    objc_msgSend_sharedAccess(CRSysConfig, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readSystemConfigAll(v17, v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)v7, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v24;
    if (v24)
    {
      if ((objc_msgSend_isEqualToData_(v24, v25, (uint64_t)v8, v26) & 1) != 0)
      {
        v28 = 1;
LABEL_13:

        goto LABEL_14;
      }
      handleForCategory(0);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v43 = 138412802;
        v44 = v7;
        v45 = 2112;
        v46 = v8;
        v47 = 2112;
        v48 = v27;
        _os_log_error_impl(&dword_214503000, v35, OS_LOG_TYPE_ERROR, "Sysconfig %@ mismatch after write, expect:%@ actual:%@", (uint8_t *)&v43, 0x20u);
      }
    }
    else
    {
      handleForCategory(0);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        sub_2145696A0((uint64_t)v7, v35, v36, v37, v38, v39, v40, v41);
    }

    v28 = 0;
    goto LABEL_13;
  }
  handleForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    sub_214569704((uint64_t)v7, v21, v29, v30, v31, v32, v33, v34);
  v28 = 0;
LABEL_14:

  return v28;
}

- (int64_t)mlbRepairChecks
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
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
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  int64_t v92;
  int v94;
  void *v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedAccess(CRSysConfig, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readSystemConfigAll(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  handleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v94 = 138412290;
    v95 = v9;
    _os_log_impl(&dword_214503000, v10, OS_LOG_TYPE_DEFAULT, "SysCfg Dict: %@", (uint8_t *)&v94, 0xCu);
  }

  handleForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_KBBTransferProperties(self, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = 138412290;
    v95 = v15;
    _os_log_impl(&dword_214503000, v11, OS_LOG_TYPE_DEFAULT, "KBB transfer properties: %@", (uint8_t *)&v94, 0xCu);

  }
  objc_msgSend_KBBTransferProperties(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)CFSTR("Mod#"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend_KBBTransferProperties(self, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v26, v27, (uint64_t)CFSTR("Regn"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_KBBTransferProperties(self, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v33, v34, (uint64_t)CFSTR("SrNm"), v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend_KBBTransferProperties(self, v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v40, v41, (uint64_t)CFSTR("Mod#"), v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend_length(v43, v44, v45, v46) <= 0x10
          && objc_msgSend_length(v43, v47, v48, v49))
        {
          objc_msgSend_KBBTransferProperties(self, v50, v51, v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v53, v54, (uint64_t)CFSTR("Regn"), v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend_length(v56, v57, v58, v59) <= 0x10
            && objc_msgSend_length(v56, v60, v61, v62))
          {
            objc_msgSend_KBBTransferProperties(self, v63, v64, v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v66, v67, (uint64_t)CFSTR("SrNm"), v68);
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            if ((unint64_t)objc_msgSend_length(v69, v70, v71, v72) <= 0x10
              && objc_msgSend_length(v69, v73, v74, v75))
            {
              objc_msgSend_objectForKeyedSubscript_(v9, v76, (uint64_t)CFSTR("Mod#"), v77);
              v78 = (void *)objc_claimAutoreleasedReturnValue();

              if (v78)
              {
                objc_msgSend_objectForKeyedSubscript_(v9, v79, (uint64_t)CFSTR("Regn"), v80);
                v81 = (void *)objc_claimAutoreleasedReturnValue();

                if (v81)
                {
                  objc_msgSend_objectForKeyedSubscript_(v9, v82, (uint64_t)CFSTR("SrNm"), v83);
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v9, v85, (uint64_t)CFSTR("XXSN"), v86);
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  v91 = v87;
                  if (v87)
                  {
                    if (v84)
                    {
                      v92 = 58;
                    }
                    else if ((unint64_t)objc_msgSend_length(v87, v88, v89, v90) <= 0x10)
                    {
                      v92 = 0;
                    }
                    else
                    {
                      v92 = 60;
                    }
                  }
                  else
                  {
                    v92 = 59;
                  }

                }
                else
                {
                  v92 = 62;
                }
              }
              else
              {
                v92 = 61;
              }
            }
            else
            {
              v92 = -54;
            }

          }
          else
          {
            v92 = -53;
          }

        }
        else
        {
          v92 = -52;
        }

      }
      else
      {
        v92 = -57;
      }
    }
    else
    {
      v92 = -56;
    }
  }
  else
  {
    v92 = -55;
  }

  return v92;
}

- (BOOL)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makeClasses:(id *)a5 makeInstances:(id *)a6 makePropertiesDict:(id *)a7 fdrError:(id *)a8
{
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  id *v41;
  id *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v47 = 0;
  objc_msgSend_getMakeDataClassesAndInstancesWithPartSPC_fdrRemote_makePropertiesDict_fdrError_(self, a2, (uint64_t)a3, (uint64_t)a4, &v47, a8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a8 || !*a8)
  {
    v13 = objc_opt_new();
    v21 = objc_opt_new();
    v22 = (void *)v21;
    if (v13)
      v23 = v21 == 0;
    else
      v23 = 1;
    v20 = !v23;
    if (v23)
    {
      handleForCategory(0);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        sub_214569768();
    }
    else
    {
      v41 = a6;
      v42 = a7;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v24 = v12;
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v43, (uint64_t)v48, 16);
      if (v26)
      {
        v29 = v26;
        v30 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v44 != v30)
              objc_enumerationMutation(v24);
            v32 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend_addObject_(v13, v27, v32, v28, v41, v42, (_QWORD)v43);
            objc_msgSend_objectForKeyedSubscript_(v24, v33, v32, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v22, v36, (uint64_t)v35, v37);

          }
          v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v43, (uint64_t)v48, 16);
        }
        while (v29);
      }

      if (a5)
        objc_storeStrong(a5, v13);
      if (v41)
        objc_storeStrong(v41, v22);
      if (!v42)
        goto LABEL_29;
      v38 = v47;
      v39 = *v42;
      *v42 = v38;
    }

LABEL_29:
    goto LABEL_30;
  }
  handleForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_214569794((uint64_t)a8, v13, v14, v15, v16, v17, v18, v19);
  v20 = 0;
LABEL_30:

  return v20;
}

- (NSString)KBBMLBSerialNumber
{
  return self->KBBMLBSerialNumber;
}

- (void)setKBBMLBSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->KBBMLBSerialNumber, a3);
}

- (NSDictionary)KBBTransferProperties
{
  return self->_KBBTransferProperties;
}

- (void)setKBBTransferProperties:(id)a3
{
  objc_storeStrong((id *)&self->_KBBTransferProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_KBBTransferProperties, 0);
  objc_storeStrong((id *)&self->KBBMLBSerialNumber, 0);
}

@end
