@implementation CRFDRGen3DeviceHandler

+ (BOOL)isGen3ProductType:(int)a3
{
  BOOL result;
  uint64_t v4;

  result = 1;
  if (*(uint64_t *)&a3 > 3001488777)
  {
    if (*(uint64_t *)&a3 > 3885279869)
    {
      if (*(_QWORD *)&a3 == 3885279870)
        return result;
      v4 = 4201643249;
    }
    else
    {
      if (*(_QWORD *)&a3 == 3001488778)
        return result;
      v4 = 3585085679;
    }
  }
  else if (*(uint64_t *)&a3 > 1169082143)
  {
    if (*(_QWORD *)&a3 == 1169082144)
      return result;
    v4 = 2309863438;
  }
  else
  {
    if (*(_QWORD *)&a3 == 689804742)
      return result;
    v4 = 1060988941;
  }
  if (*(_QWORD *)&a3 != v4)
    return 0;
  return result;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  uint64_t v3;
  CRFDRGen3DeviceHandler *v4;

  if (objc_msgSend_isGen3ProductType_(CRFDRGen3DeviceHandler, a2, *(uint64_t *)&a3, v3))
    v4 = objc_alloc_init(CRFDRGen3DeviceHandler);
  else
    v4 = 0;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRFDRGen3DeviceHandler);
}

- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const char *v16;
  uint64_t v17;
  int v18;
  id v19;
  void *v20;
  int v21;
  id v22;
  NSObject *v23;
  id *v25;
  id obj;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v6;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v9)
  {
    v12 = v9;
    v25 = a4;
    v13 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend_isEqualToString_(v15, v10, (uint64_t)CFSTR("IPHONE COMP BATTERY"), v11, v25))
        {
          v28 = 0;
          v18 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v16, (uint64_t)v7, (uint64_t)CFSTR("vcrt"), &v28);
          v19 = v28;
          v20 = v19;
          if (!v18 || v19)
          {
            handleForCategory(0);
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
LABEL_19:
              sub_21456B91C();
LABEL_20:
            a4 = v25;

            goto LABEL_21;
          }
        }
        if (objc_msgSend_isEqualToString_(v15, v16, (uint64_t)CFSTR("IPHONE COMP DISPLAY"), v17))
        {
          v27 = 0;
          v21 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v10, (uint64_t)v7, (uint64_t)CFSTR("tcrt"), &v27);
          v22 = v27;
          v20 = v22;
          if (!v21 || v22)
          {
            handleForCategory(0);
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              goto LABEL_19;
            goto LABEL_20;
          }
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v29, (uint64_t)v33, 16);
      if (v12)
        continue;
      break;
    }
    v20 = 0;
    a4 = v25;
  }
  else
  {
    v20 = 0;
  }
LABEL_21:

  if (a4)
    *a4 = objc_retainAutorelease(v20);

  return v7;
}

- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  int v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v20;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v10 = objc_msgSend_containsObject_(v6, v8, (uint64_t)CFSTR("IPHONE COMP FACEID"), v9);

  if (v10
    && objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v11, (uint64_t)CFSTR("psd2"), v12))
  {
    v20 = 0;
    v14 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v13, (uint64_t)v7, (uint64_t)CFSTR("psd2"), &v20);
    v15 = v20;
    v16 = v15;
    if (!v14 || (v17 = 0, v15))
    {
      handleForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_21456B8BC();

      v17 = v16;
    }
  }
  else
  {
    v17 = 0;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v17);

  return v7;
}

- (id)getUpdatePropertyWithPartSPC:(id)a3 propertiesFromParam:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend_containsObject_(v5, v7, (uint64_t)CFSTR("IPHONE COMP CAMERA"), v8) & 1) != 0)
  {
    if (!v6)
      goto LABEL_10;
LABEL_6:
    objc_msgSend_objectForKeyedSubscript_(v6, v9, (uint64_t)CFSTR("PrCL"), v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
LABEL_10:
      v12 = 0;
      goto LABEL_15;
    }
    if (objc_msgSend_isFDRPropertySupported_(CRFDRBaseDeviceHandler, v14, (uint64_t)CFSTR("PrCL"), v15))
    {
      v18 = (void *)MEMORY[0x24BDBCE50];
      objc_msgSend_objectForKeyedSubscript_(v6, v16, (uint64_t)CFSTR("PrCL"), v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dataWithHexString_(v18, v20, (uint64_t)v19, v21);
      v22 = objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v32 = CFSTR("PrCL");
        v33[0] = v22;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v23, (uint64_t)v33, (uint64_t)&v32, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      handleForCategory(0);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_21456BE30(v22, v24, v25, v26, v27, v28, v29, v30);
    }
    v12 = 0;
    goto LABEL_14;
  }
  v11 = objc_msgSend_containsObject_(v5, v9, (uint64_t)CFSTR("IPHONE REAR ASSEMBLY"), v10);
  v12 = 0;
  if (v6 && (v11 & 1) != 0)
    goto LABEL_6;
LABEL_15:

  return v12;
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
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  const char *v73;
  uint64_t v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t j;
  uint64_t v92;
  const char *v93;
  int v94;
  id v95;
  BOOL v96;
  NSObject *v97;
  int v98;
  id v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t k;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  int v112;
  id v113;
  void *v115;
  void *v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t m;
  uint64_t v124;
  const char *v125;
  void *v126;
  int v127;
  id v128;
  const char *v129;
  uint64_t v130;
  BOOL v131;
  NSObject *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t n;
  uint64_t v139;
  const char *v140;
  int v141;
  id v142;
  BOOL v143;
  NSObject *v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t ii;
  uint64_t v152;
  const char *v153;
  int v154;
  id v155;
  BOOL v156;
  NSObject *v157;
  NSObject *v158;
  void *v160;
  const char *v161;
  uint64_t v162;
  int isEqualToString;
  NSObject *v164;
  const char *v165;
  uint64_t v166;
  void *v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  NSObject *v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  void *v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  NSObject *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  id v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  id v204;
  const char *v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t i;
  uint64_t v212;
  void *v213;
  void *v214;
  const char *v215;
  NSObject *v216;
  NSObject *v217;
  _BOOL4 v218;
  NSObject *v220;
  _BOOL4 v221;
  NSObject *v222;
  _BOOL4 v223;
  void *v224;
  uint64_t v225;
  void *v226;
  void *v227;
  id *v228;
  void *v229;
  void *v230;
  void *v231;
  id v232;
  id *v233;
  void *v234;
  id v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  id v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  id v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  id v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  id v255;
  id v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  id v265;
  void *v266;
  _BYTE v267[128];
  _BYTE v268[128];
  _BYTE v269[128];
  _BYTE v270[128];
  _BYTE v271[128];
  uint8_t v272[128];
  uint8_t buf[24];
  uint64_t v274;

  v274 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v266 = 0;
  v234 = (void *)objc_opt_new();
  objc_msgSend_currentProperties(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend_mutableCopy(v14, v15, v16, v17);

  AMFDRGetOptions();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v19;
  v233 = a6;
  if (v19)
  {
    v24 = v18;
    v25 = v10;
    v26 = v19;
    objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)CFSTR("Metadata"), v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend_mutableCopy(v27, v28, v29, v30);
    if (v34)
    {
      objc_msgSend_currentProperties(self, v31, v32, v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v35, v36, (uint64_t)CFSTR("mlb#"), v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        objc_msgSend_currentProperties(self, v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v42, v43, (uint64_t)CFSTR("mlb#"), v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v34, v46, (uint64_t)v45, (uint64_t)CFSTR("MLBNumber"));

      }
      objc_msgSend_currentProperties(self, v39, v40, v41);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v47, v48, (uint64_t)CFSTR("SrNm"), v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50)
      {
        objc_msgSend_currentProperties(self, v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v54, v55, (uint64_t)CFSTR("SrNm"), v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v34, v58, (uint64_t)v57, (uint64_t)CFSTR("SerialNumber"));

      }
      AMFDRSetOption();
    }
    handleForCategory(0);
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v34;
      _os_log_impl(&dword_214503000, v59, OS_LOG_TYPE_DEFAULT, "Meta-data = %@", buf, 0xCu);
    }

    v23 = v26;
    v10 = v25;
    v18 = v24;
    a6 = v233;
  }
  if (objc_msgSend_allowFactoryReset(self, v20, v21, v22))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v18, v60, (uint64_t)CFSTR("1"), (uint64_t)CFSTR("SrvP"));
    v63 = 0;
    v64 = 0;
    if (!a5)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (objc_msgSend_isServicePart(self, v60, v61, v62))
  {
    if ((objc_msgSend_containsObject_(v10, v67, (uint64_t)CFSTR("IPHONE REAR ASSEMBLY"), v68) & 1) == 0
      && (objc_msgSend_containsObject_(v10, v69, (uint64_t)CFSTR("IPHONE MID ASSEMBLY"), v70) & 1) == 0
      && (objc_msgSend_containsObject_(v10, v69, (uint64_t)CFSTR("IPHONE MCTUB"), v71) & 1) == 0)
    {
      sub_214512470((void *)0xFFFFFFFFFFFFFFE2, CFSTR("KGB isServicePart without MTUB SPC"), 0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0;
      if (!a5)
        goto LABEL_14;
      goto LABEL_13;
    }
    v265 = 0;
    objc_msgSend_getDataClassesAndInstancesOfKBBWith_propertiesDict_fdrError_(self, v69, (uint64_t)a4, (uint64_t)&v266, &v265);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v265;
    v229 = v63;
    if (v72)
    {
      v64 = v72;
      handleForCategory(0);
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        sub_21456BFC0(v75, v76, v77, v78, v79, v80, v81, v82);

      v63 = 0;
LABEL_184:

      if (!a5)
        goto LABEL_14;
      goto LABEL_13;
    }
    v232 = v10;
    v228 = a5;
    if (v266)
    {
      objc_msgSend_objectForKeyedSubscript_(v266, v73, (uint64_t)CFSTR("SrvP"), v74);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v160, v161, (uint64_t)CFSTR("1"), v162);

      if (isEqualToString)
      {
        sub_214512470((void *)0xFFFFFFFFFFFFFFE3, CFSTR("KBB isServicePart"), 0);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = 0;
LABEL_183:
        v10 = v232;
        goto LABEL_184;
      }
    }
    handleForCategory(0);
    v164 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v266;
      _os_log_impl(&dword_214503000, v164, OS_LOG_TYPE_DEFAULT, "temp makeProperties:%@", buf, 0xCu);
    }

    v10 = v232;
    if (v266)
    {
      objc_msgSend_objectForKeyedSubscript_(v266, v165, (uint64_t)CFSTR("drp#"), v166);
      v167 = (void *)objc_claimAutoreleasedReturnValue();

      if (v167)
      {
        objc_msgSend_objectForKeyedSubscript_(v266, v165, (uint64_t)CFSTR("drp#"), v168);
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v18, v170, (uint64_t)v169, (uint64_t)CFSTR("drp#"));

        handleForCategory(0);
        v171 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v18;
          _os_log_impl(&dword_214503000, v171, OS_LOG_TYPE_DEFAULT, "transferring properties:%@", buf, 0xCu);
        }

        objc_msgSend_objectForKeyedSubscript_(v18, v172, (uint64_t)CFSTR("drp#"), v173);
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setKbbCGSN_(self, v175, (uint64_t)v174, v176);

        v10 = v232;
      }
    }
    objc_msgSend_setObject_forKeyedSubscript_(v18, v165, (uint64_t)CFSTR("0"), (uint64_t)CFSTR("SrvP"));
    if (v63)
    {
      if (objc_msgSend_count(v63, v177, v178, v179))
      {
        if (objc_msgSend_supportMctubMinus(self, v180, v181, v182))
          v186 = &unk_24D1B87B8;
        else
          v186 = &unk_24D1B8728;
        v187 = (void *)MEMORY[0x24BDBCEF0];
        objc_msgSend_allKeys(v63, v183, v184, v185);
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setWithArray_(v187, v189, (uint64_t)v188, v190);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v191, (uint64_t)v186, v192);
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_intersectSet_(v63, v194, (uint64_t)v193, v195);

        handleForCategory(0);
        v196 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v196, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_allObjects(v63, v197, v198, v199);
          v200 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v200;
          _os_log_impl(&dword_214503000, v196, OS_LOG_TYPE_DEFAULT, "MakedataCLasses:%@", buf, 0xCu);

        }
        a6 = v233;
        if (!v63 || !objc_msgSend_count(v63, v201, v202, v203))
        {
          sub_214512470((void *)0xFFFFFFFFFFFFFFE6, CFSTR("Get Make DataClasses failed"), 0);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_183;
        }
        v224 = v18;
        v227 = v23;
        v263 = 0u;
        v264 = 0u;
        v261 = 0u;
        v262 = 0u;
        v204 = v229;
        v206 = objc_msgSend_countByEnumeratingWithState_objects_count_(v204, v205, (uint64_t)&v261, (uint64_t)v272, 16);
        if (v206)
        {
          v209 = v206;
          v210 = *(_QWORD *)v262;
          do
          {
            for (i = 0; i != v209; ++i)
            {
              if (*(_QWORD *)v262 != v210)
                objc_enumerationMutation(v204);
              v212 = *(_QWORD *)(*((_QWORD *)&v261 + 1) + 8 * i);
              if (objc_msgSend_containsObject_(v63, v207, v212, v208, v224)
                && objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v207, v212, v208))
              {
                objc_msgSend_objectForKeyedSubscript_(v204, v207, v212, v208);
                v213 = v63;
                v214 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v234, v215, (uint64_t)v214, v212);

                v63 = v213;
              }
            }
            v209 = objc_msgSend_countByEnumeratingWithState_objects_count_(v204, v207, (uint64_t)&v261, (uint64_t)v272, 16);
          }
          while (v209);
        }

        v10 = v232;
        v18 = v224;
        v23 = v227;
      }
      else
      {
        v63 = 0;
      }
    }

  }
  else
  {
    v228 = a5;
    v63 = 0;
  }
  v230 = v63;
  v83 = objc_msgSend_containsObject_(v10, v67, (uint64_t)CFSTR("IPHONE COMP DISPLAY"), v68, v224);
  v231 = v10;
  v225 = (uint64_t)v18;
  v226 = v23;
  if (v83)
  {
    v259 = 0u;
    v260 = 0u;
    v257 = 0u;
    v258 = 0u;
    v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8740, v84, (uint64_t)&v257, (uint64_t)v271, 16);
    if (v86)
    {
      v89 = v86;
      v90 = *(_QWORD *)v258;
      do
      {
        for (j = 0; j != v89; ++j)
        {
          if (*(_QWORD *)v258 != v90)
            objc_enumerationMutation(&unk_24D1B8740);
          v92 = *(_QWORD *)(*((_QWORD *)&v257 + 1) + 8 * j);
          if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v87, v92, v88, v225) & 1) != 0)
          {
            v256 = 0;
            v94 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v93, (uint64_t)v234, v92, &v256);
            v95 = v256;
            if (v94)
              v96 = v95 == 0;
            else
              v96 = 0;
            if (!v96)
            {
              v64 = v95;
              handleForCategory(0);
              v158 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
                goto LABEL_123;
              goto LABEL_168;
            }
          }
          else
          {
            handleForCategory(0);
            v97 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v92;
              _os_log_impl(&dword_214503000, v97, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
            }

          }
        }
        v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8740, v87, (uint64_t)&v257, (uint64_t)v271, 16);
      }
      while (v89);
    }
    v255 = 0;
    v18 = (void *)v225;
    v98 = objc_msgSend__addPropertyToMutableDictionary_property_withError_(self, v87, v225, (uint64_t)CFSTR("drp#"), &v255, v225);
    v99 = v255;
    v64 = v99;
    v23 = v226;
    if (!v98 || v99)
    {
      handleForCategory(0);
      v216 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v216, OS_LOG_TYPE_ERROR))
        sub_21456BF60();

      a6 = v233;
      a5 = v228;
      if (!v228)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  if ((objc_msgSend_containsObject_(v10, v84, (uint64_t)CFSTR("IPHONE COMP CAMERA"), v85, v225) & 1) != 0
    || objc_msgSend_containsObject_(v10, v100, (uint64_t)CFSTR("IPHONE COMP RCAM"), v102))
  {
    v251 = 0u;
    v252 = 0u;
    v104 = objc_msgSend_supportCameraDepth(self, v100, v101, v102) ? &unk_24D1B87A0 : &unk_24D1B8758;
    v253 = 0uLL;
    v254 = 0uLL;
    v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v103, (uint64_t)&v251, (uint64_t)v270, 16);
    if (v105)
    {
      v106 = v105;
      v107 = *(_QWORD *)v252;
      do
      {
        for (k = 0; k != v106; ++k)
        {
          if (*(_QWORD *)v252 != v107)
            objc_enumerationMutation(v104);
          v109 = *(_QWORD *)(*((_QWORD *)&v251 + 1) + 8 * k);
          if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v100, v109, v102))
          {
            v250 = 0;
            v112 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v110, (uint64_t)v234, v109, &v250);
            v113 = v250;
            if (!v112 || v113 != 0)
            {
              v64 = v113;
              handleForCategory(0);
              v158 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
LABEL_123:
                sub_21456B8BC();
LABEL_168:

              v10 = v231;
              goto LABEL_169;
            }
          }
          if (objc_msgSend_isEqual_(CFSTR("CmCl"), v110, v109, v111))
          {
            *(_QWORD *)buf = 0;
            v115 = (void *)AMFDRSealingMapCopyAssemblyIdentifierForClass();
            v116 = v115;
            v64 = *(void **)buf;
            if (*(_QWORD *)buf)
            {

LABEL_166:
              handleForCategory(0);
              v158 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
                sub_21456BF00();
              goto LABEL_168;
            }
            if (!v115)
              goto LABEL_166;
            AMFDRSetAssemblyIdentifierToVerify();

          }
        }
        v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v100, (uint64_t)&v251, (uint64_t)v270, 16);
        v23 = v226;
      }
      while (v106);
    }
  }
  v117 = v231;
  if (!objc_msgSend_containsObject_(v231, v100, (uint64_t)CFSTR("IPHONE COMP FACEID"), v102))
    goto LABEL_87;
  v248 = 0u;
  v249 = 0u;
  v246 = 0u;
  v247 = 0u;
  v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8770, v118, (uint64_t)&v246, (uint64_t)v269, 16);
  if (!v120)
    goto LABEL_87;
  v121 = v120;
  v122 = *(_QWORD *)v247;
  while (2)
  {
    for (m = 0; m != v121; ++m)
    {
      if (*(_QWORD *)v247 != v122)
        objc_enumerationMutation(&unk_24D1B8770);
      v124 = *(_QWORD *)(*((_QWORD *)&v246 + 1) + 8 * m);
      if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v118, v124, v119) & 1) == 0)
      {
        handleForCategory(0);
        v132 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v124;
          _os_log_impl(&dword_214503000, v132, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
        }
        goto LABEL_84;
      }
      v126 = v23;
      v245 = 0;
      v127 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v125, (uint64_t)v234, v124, &v245);
      v128 = v245;
      if (v127)
        v131 = v128 == 0;
      else
        v131 = 0;
      if (!v131)
      {
        v64 = v128;
        handleForCategory(0);
        v217 = objc_claimAutoreleasedReturnValue();
        v218 = os_log_type_enabled(v217, OS_LOG_TYPE_ERROR);
        v23 = v126;
        if (v218)
          sub_21456BEA0();

        v10 = v231;
        a6 = v233;
        a5 = v228;
        v18 = (void *)v225;
        goto LABEL_171;
      }
      v23 = v126;
      v117 = v231;
      if (objc_msgSend_isEqual_(CFSTR("PlCl"), v129, v124, v130))
      {
        v132 = AMFDRSealingMapCopyAssemblyIdentifierForClass();
        if (v132)
          AMFDRSetAssemblyIdentifierToVerify();
LABEL_84:

        continue;
      }
    }
    v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8770, v118, (uint64_t)&v246, (uint64_t)v269, 16);
    if (v121)
      continue;
    break;
  }
LABEL_87:
  if (objc_msgSend_containsObject_(v117, v118, (uint64_t)CFSTR("IPHONE BACK GLASS"), v119))
  {
    v244 = 0u;
    v242 = 0u;
    v243 = 0u;
    v241 = 0u;
    v135 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8788, v133, (uint64_t)&v241, (uint64_t)v268, 16);
    if (v135)
    {
      v136 = v135;
      v137 = *(_QWORD *)v242;
      while (2)
      {
        for (n = 0; n != v136; ++n)
        {
          if (*(_QWORD *)v242 != v137)
            objc_enumerationMutation(&unk_24D1B8788);
          v139 = *(_QWORD *)(*((_QWORD *)&v241 + 1) + 8 * n);
          if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v133, v139, v134) & 1) != 0)
          {
            v240 = 0;
            v141 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v140, (uint64_t)v234, v139, &v240);
            v142 = v240;
            if (v141)
              v143 = v142 == 0;
            else
              v143 = 0;
            if (!v143)
            {
              v64 = v142;
              handleForCategory(0);
              v220 = objc_claimAutoreleasedReturnValue();
              v221 = os_log_type_enabled(v220, OS_LOG_TYPE_ERROR);
              v18 = (void *)v225;
              if (v221)
                sub_21456BEA0();

              v10 = v231;
              a6 = v233;
              a5 = v228;
              goto LABEL_170;
            }
          }
          else
          {
            handleForCategory(0);
            v144 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v139;
              _os_log_impl(&dword_214503000, v144, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
            }

          }
        }
        v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8788, v133, (uint64_t)&v241, (uint64_t)v268, 16);
        if (v136)
          continue;
        break;
      }
    }
  }
  v10 = v231;
  if (objc_msgSend_containsObject_(v231, v133, (uint64_t)CFSTR("IPHONE COMP ENCL"), v134))
  {
    v238 = 0u;
    v239 = 0u;
    v236 = 0u;
    v237 = 0u;
    v146 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B87D0, v145, (uint64_t)&v236, (uint64_t)v267, 16);
    v23 = v226;
    v63 = v230;
    if (v146)
    {
      v149 = v146;
      v150 = *(_QWORD *)v237;
      while (2)
      {
        for (ii = 0; ii != v149; ++ii)
        {
          if (*(_QWORD *)v237 != v150)
            objc_enumerationMutation(&unk_24D1B87D0);
          v152 = *(_QWORD *)(*((_QWORD *)&v236 + 1) + 8 * ii);
          if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v147, v152, v148) & 1) != 0)
          {
            v235 = 0;
            v154 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v153, (uint64_t)v234, v152, &v235);
            v155 = v235;
            if (v154)
              v156 = v155 == 0;
            else
              v156 = 0;
            if (!v156)
            {
              v64 = v155;
              handleForCategory(0);
              v222 = objc_claimAutoreleasedReturnValue();
              v223 = os_log_type_enabled(v222, OS_LOG_TYPE_ERROR);
              v63 = v230;
              if (v223)
                sub_21456BEA0();

              goto LABEL_180;
            }
          }
          else
          {
            handleForCategory(0);
            v157 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v152;
              _os_log_impl(&dword_214503000, v157, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
            }

          }
          v63 = v230;
        }
        v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B87D0, v147, (uint64_t)&v236, (uint64_t)v267, 16);
        if (v149)
          continue;
        break;
      }
      v64 = 0;
LABEL_180:
      v10 = v231;
      a6 = v233;
      a5 = v228;
      v18 = (void *)v225;
      if (!v228)
        goto LABEL_14;
    }
    else
    {
      v64 = 0;
      a6 = v233;
      a5 = v228;
      v18 = (void *)v225;
      if (!v228)
        goto LABEL_14;
    }
LABEL_13:
    objc_storeStrong(a5, v18);
    goto LABEL_14;
  }
  v64 = 0;
LABEL_169:
  a6 = v233;
  a5 = v228;
  v18 = (void *)v225;
LABEL_170:
  v23 = v226;
LABEL_171:
  v63 = v230;
  if (a5)
    goto LABEL_13;
LABEL_14:
  if (a6)
    *a6 = objc_retainAutorelease(v64);
  v65 = v234;

  return v65;
}

- (BOOL)validateAndSetSerialNumbersUsingPartSPC:(id)a3 KGBSerialNumber:(id)a4 KBBSerialNumber:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  const char *v26;
  uint64_t v27;
  objc_super v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CRFDRGen3DeviceHandler;
  v29 = 0;
  v13 = -[CRFDRBaseDeviceHandler validateAndSetSerialNumbersUsingPartSPC:KGBSerialNumber:KBBSerialNumber:withError:](&v28, sel_validateAndSetSerialNumbersUsingPartSPC_KGBSerialNumber_KBBSerialNumber_withError_, v10, v11, v12, &v29);
  v16 = v29;
  if (!v13)
  {
    v23 = 0;
    if (!a6)
      goto LABEL_18;
    goto LABEL_17;
  }
  if ((objc_msgSend_containsObject_(v10, v14, (uint64_t)CFSTR("IPHONE REAR ASSEMBLY"), v15) & 1) == 0
    && (objc_msgSend_containsObject_(v10, v17, (uint64_t)CFSTR("IPHONE MID ASSEMBLY"), v19) & 1) == 0
    && !objc_msgSend_containsObject_(v10, v17, (uint64_t)CFSTR("IPHONE MCTUB"), v19)
    || v11 && v12 && objc_msgSend_length(v11, v17, v18, v19) && objc_msgSend_length(v12, v17, v20, v19))
  {
    if (!v11 || !v12 || !objc_msgSend_isEqualToString_(v11, v17, (uint64_t)v12, v19))
    {
      objc_msgSend_setKBBSerialNumber_(self, v17, (uint64_t)v12, v19);
      objc_msgSend_setKGBSerialNumber_(self, v26, (uint64_t)v11, v27);
      v23 = 1;
      if (!a6)
        goto LABEL_18;
      goto LABEL_17;
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v17, (uint64_t)CFSTR("KGBSrnm:%@ matches KBBSrnm:%@"), v19, v11, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -31;
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v17, (uint64_t)CFSTR("Missing required Srnm KGBSrnm:%@ KBBSrnm:%@"), v19, v11, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -32;
  }
  sub_214512470((void *)v22, v21, 0);
  v24 = objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v16 = (id)v24;
  if (a6)
LABEL_17:
    *a6 = objc_retainAutorelease(v16);
LABEL_18:

  return v23;
}

- (int64_t)validateDisplaySwapped:(id)a3 lessThan:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  int64_t v14;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int isServicePart;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  char v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  int v53;
  uint8_t v54[16];
  uint8_t v55[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v10 = v7;
  if (!v7 || objc_msgSend_isEqual_(v7, v8, (uint64_t)&unk_24D1B7C98, v9))
  {
    handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, "No requirement for display swapped duration check", buf, 2u);
    }
    v14 = 0;
    goto LABEL_6;
  }
  if (!objc_msgSend_containsObject_(v6, v11, (uint64_t)CFSTR("IPHONE COMP DISPLAY"), v12))
  {
    v14 = 0;
    goto LABEL_7;
  }
  v13 = MGCopyAnswer();
  objc_msgSend_convertToHexString(v13, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  isServicePart = objc_msgSend_isServicePart(self, v20, v21, v22);
  handleForCategory(0);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (!isServicePart)
  {
    if (v25)
    {
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_214503000, v24, OS_LOG_TYPE_DEFAULT, "Validate CG serial number with original MLB", v54, 2u);
    }

    v43 = (int)objc_msgSend_intValue(v10, v40, v41, v42);
    objc_msgSend_previousCGSN(self, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sealDate(self, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend_validateSwappedForDays_currentSN_previousSN_sealDate_(self, v52, v43, (uint64_t)v19, v47, v51);

    if (!v53)
    {
      v14 = -44;
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (v25)
  {
    *(_WORD *)v55 = 0;
    _os_log_impl(&dword_214503000, v24, OS_LOG_TYPE_DEFAULT, "Validate CG serial number with service MLB", v55, 2u);
  }

  v29 = (int)objc_msgSend_intValue(v10, v26, v27, v28);
  objc_msgSend_kbbCGSN(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kbbSealDate(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_validateSwappedForDays_currentSN_previousSN_sealDate_(self, v38, v29, (uint64_t)v19, v33, v37);

  if ((v39 & 1) != 0)
  {
LABEL_18:
    v14 = 0;
    goto LABEL_20;
  }
  v14 = -51;
LABEL_20:

LABEL_6:
LABEL_7:

  return v14;
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
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id *v48;
  id *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v54 = 0;
  objc_msgSend_getMakeDataClassesAndInstancesWithPartSPC_fdrRemote_makePropertiesDict_fdrError_(self, a2, (uint64_t)a3, (uint64_t)a4, &v54, a8);
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
        sub_21456B000(v39, v40, v41, v42, v43, v44, v45, v46);
    }
    else
    {
      v48 = a6;
      v49 = a7;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v24 = v12;
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v50, (uint64_t)v55, 16);
      if (v26)
      {
        v29 = v26;
        v30 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v51 != v30)
              objc_enumerationMutation(v24);
            v32 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_msgSend_addObject_(v13, v27, v32, v28, v48, v49, (_QWORD)v50);
            objc_msgSend_objectForKeyedSubscript_(v24, v33, v32, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v22, v36, (uint64_t)v35, v37);

          }
          v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v50, (uint64_t)v55, 16);
        }
        while (v29);
      }

      if (a5)
        objc_storeStrong(a5, v13);
      if (v48)
        objc_storeStrong(v48, v22);
      if (!v49)
        goto LABEL_29;
      v38 = v54;
      v39 = *v49;
      *v49 = v38;
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

- (id)spcInPartSPC:(id)a3 withDataClass:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const __CFString *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_supportCameraDepth(self, v8, v9, v10))
    v14 = &unk_24D1B87A0;
  else
    v14 = &unk_24D1B8758;
  if (objc_msgSend_supportMctubMinus(self, v11, v12, v13))
    v17 = &unk_24D1B87B8;
  else
    v17 = &unk_24D1B8728;
  if (!objc_msgSend_isEqual_(CFSTR("vcrt"), v15, (uint64_t)v7, v16)
    || (v20 = CFSTR("IPHONE COMP BATTERY"),
        (objc_msgSend_containsObject_(v6, v18, (uint64_t)CFSTR("IPHONE COMP BATTERY"), v19) & 1) == 0))
  {
    if (!objc_msgSend_isEqual_(CFSTR("tcrt"), v18, (uint64_t)v7, v19)
      || (v20 = CFSTR("IPHONE COMP DISPLAY"),
          (objc_msgSend_containsObject_(v6, v21, (uint64_t)CFSTR("IPHONE COMP DISPLAY"), v22) & 1) == 0))
    {
      if (!objc_msgSend_isEqual_(CFSTR("prpc"), v21, (uint64_t)v7, v22)
        || (v20 = CFSTR("IPHONE COMP FACEID"),
            (objc_msgSend_containsObject_(v6, v23, (uint64_t)CFSTR("IPHONE COMP FACEID"), v24) & 1) == 0))
      {
        if (!objc_msgSend_containsObject_(v14, v23, (uint64_t)v7, v24)
          || (v20 = CFSTR("IPHONE COMP CAMERA"),
              (objc_msgSend_containsObject_(v6, v25, (uint64_t)CFSTR("IPHONE COMP CAMERA"), v26) & 1) == 0)
          && (v20 = CFSTR("IPHONE COMP RCAM"),
              (objc_msgSend_containsObject_(v6, v27, (uint64_t)CFSTR("IPHONE COMP RCAM"), v28) & 1) == 0))
        {
          if (!objc_msgSend_containsObject_(&unk_24D1B8788, v25, (uint64_t)v7, v26)
            || (v20 = CFSTR("IPHONE BACK GLASS"),
                (objc_msgSend_containsObject_(v6, v29, (uint64_t)CFSTR("IPHONE BACK GLASS"), v30) & 1) == 0))
          {
            if (!objc_msgSend_containsObject_(&unk_24D1B8740, v29, (uint64_t)v7, v30)
              || (v20 = CFSTR("IPHONE COMP DISPLAY"),
                  (objc_msgSend_containsObject_(v6, v31, (uint64_t)CFSTR("IPHONE COMP DISPLAY"), v32) & 1) == 0))
            {
              if (!objc_msgSend_containsObject_(&unk_24D1B8770, v31, (uint64_t)v7, v32)
                || (v20 = CFSTR("IPHONE COMP FACEID"),
                    (objc_msgSend_containsObject_(v6, v33, (uint64_t)CFSTR("IPHONE COMP FACEID"), v34) & 1) == 0))
              {
                if (!objc_msgSend_containsObject_(&unk_24D1B87D0, v33, (uint64_t)v7, v34)
                  || (v20 = CFSTR("IPHONE COMP ENCL"),
                      (objc_msgSend_containsObject_(v6, v35, (uint64_t)CFSTR("IPHONE COMP ENCL"), v36) & 1) == 0))
                {
                  if (objc_msgSend_containsObject_(v17, v35, (uint64_t)v7, v36))
                  {
                    v20 = CFSTR("IPHONE REAR ASSEMBLY");
                    if ((objc_msgSend_containsObject_(v6, v37, (uint64_t)CFSTR("IPHONE REAR ASSEMBLY"), v38) & 1) == 0)
                    {
                      v20 = CFSTR("IPHONE MID ASSEMBLY");
                      if ((objc_msgSend_containsObject_(v6, v39, (uint64_t)CFSTR("IPHONE MID ASSEMBLY"), v40) & 1) == 0)
                      {
                        if (objc_msgSend_containsObject_(v6, v41, (uint64_t)CFSTR("IPHONE MCTUB"), v42))
                          v20 = CFSTR("IPHONE MCTUB");
                        else
                          v20 = 0;
                      }
                    }
                  }
                  else
                  {
                    v20 = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return (id)v20;
}

- (id)spcWithComponent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const __CFString *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;

  v4 = a3;
  if (objc_msgSend_supportCameraDepth(self, v5, v6, v7))
    v10 = &unk_24D1B87A0;
  else
    v10 = &unk_24D1B8758;
  if ((objc_msgSend_isEqual_(CFSTR("vcrt"), v8, (uint64_t)v4, v9) & 1) != 0)
  {
    v13 = CFSTR("IPHONE COMP BATTERY");
    goto LABEL_11;
  }
  if ((objc_msgSend_isEqual_(CFSTR("tcrt"), v11, (uint64_t)v4, v12) & 1) != 0)
    goto LABEL_10;
  if ((objc_msgSend_isEqual_(CFSTR("prpc"), v14, (uint64_t)v4, v15) & 1) != 0)
  {
LABEL_8:
    v13 = CFSTR("IPHONE COMP FACEID");
    goto LABEL_11;
  }
  if ((objc_msgSend_isEqual_(CFSTR("drp#"), v16, (uint64_t)v4, v17) & 1) != 0)
  {
LABEL_10:
    v13 = CFSTR("IPHONE COMP DISPLAY");
    goto LABEL_11;
  }
  if (objc_msgSend_containsObject_(v10, v18, (uint64_t)v4, v19))
  {
    if (objc_msgSend_supportCameraDepth(self, v21, v22, v23))
      v13 = CFSTR("IPHONE COMP RCAM");
    else
      v13 = CFSTR("IPHONE COMP CAMERA");
  }
  else
  {
    if ((objc_msgSend_containsObject_(&unk_24D1B8788, v21, (uint64_t)v4, v23) & 1) != 0)
    {
      v13 = CFSTR("IPHONE BACK GLASS");
      goto LABEL_11;
    }
    if ((objc_msgSend_containsObject_(&unk_24D1B8740, v24, (uint64_t)v4, v25) & 1) != 0)
      goto LABEL_10;
    if ((objc_msgSend_containsObject_(&unk_24D1B8770, v26, (uint64_t)v4, v27) & 1) != 0
      || (objc_msgSend_isEqual_(CFSTR("psd2"), v28, (uint64_t)v4, v29) & 1) != 0)
    {
      goto LABEL_8;
    }
    if (objc_msgSend_containsObject_(&unk_24D1B87D0, v30, (uint64_t)v4, v31))
      v13 = CFSTR("IPHONE COMP ENCL");
    else
      v13 = 0;
  }
LABEL_11:

  return (id)v13;
}

@end
