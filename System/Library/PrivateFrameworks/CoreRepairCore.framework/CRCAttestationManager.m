@implementation CRCAttestationManager

- (BOOL)transformChallengeResponseWithError:(id *)a3 blockChallengeResponse:(id)a4 resultobtained:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  void *v65;
  const char *v66;
  BOOL v67;
  id *v69;
  id *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  void *v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v9 = v7;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v71, (uint64_t)v77, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v72;
    v69 = a5;
    v70 = a3;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v72 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v14);
      v16 = (void *)objc_opt_new();
      objc_msgSend_componentType(v15, v17, v18, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20)
        break;
      v24 = (void *)v20;
      objc_msgSend_identifier(v15, v21, v22, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
        break;
      objc_msgSend_componentType(v15, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v16, v30, (uint64_t)v29, (uint64_t)CFSTR("Type"));

      objc_msgSend_identifier(v15, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v16, v35, (uint64_t)v34, (uint64_t)CFSTR("Identifier"));

      objc_msgSend_signedResponse(v15, v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend_signedResponse(v15, v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v16, v44, (uint64_t)v43, (uint64_t)CFSTR("Response"));

      }
      objc_msgSend_properties(v15, v40, v41, v42);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        objc_msgSend_properties(v15, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v16, v50, (uint64_t)v49, (uint64_t)CFSTR("Properties"));

      }
      objc_msgSend_keyIndex(v15, v46, v47, v48);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        objc_msgSend_keyIndex(v15, v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v16, v56, (uint64_t)v55, (uint64_t)CFSTR("KeyIndex"));

      }
      objc_msgSend_addObject_(v8, v52, (uint64_t)v16, v54);

      if (v12 == ++v14)
      {
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v57, (uint64_t)&v71, (uint64_t)v77, 16);
        a5 = v69;
        a3 = v70;
        if (v12)
          goto LABEL_3;
        goto LABEL_16;
      }
    }
    handleForCategory(0);
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      sub_214568E44();

    v60 = (void *)MEMORY[0x24BDD1540];
    v75 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v61, (uint64_t)CFSTR("Invalid ChallengeResponse:%@"), v62, v15);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v63;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v64, (uint64_t)&v76, (uint64_t)&v75, 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v60, v66, (uint64_t)CFSTR("com.apple.corerepair"), -38, v65);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v67 = 0;
    a3 = v70;
    if (!v70)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_16:

  v58 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v8);
  v67 = 1;
  if (a3)
LABEL_21:
    *a3 = objc_retainAutorelease(v58);
LABEL_22:

  return v67;
}

- (BOOL)transformStrongWithError:(id *)a3 blockComponents:(id)a4 resultobtained:(id *)a5
{
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  BOOL v54;
  id *v56;
  id *v57;
  id obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v7;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v59, (uint64_t)v65, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v60;
    v56 = a5;
    v57 = a3;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v60 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v13);
      v15 = (void *)objc_opt_new();
      objc_msgSend_componentType(v14, v16, v17, v18);
      v19 = objc_claimAutoreleasedReturnValue();
      if (!v19)
        break;
      v23 = (void *)v19;
      objc_msgSend_identifier(v14, v20, v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
        break;
      objc_msgSend_componentType(v14, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v15, v29, (uint64_t)v28, (uint64_t)CFSTR("Type"));

      objc_msgSend_identifier(v14, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v15, v34, (uint64_t)v33, (uint64_t)CFSTR("Identifier"));

      objc_msgSend_fwVersion(v14, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        objc_msgSend_fwVersion(v14, v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v15, v43, (uint64_t)v42, (uint64_t)CFSTR("FWVersion"));

      }
      objc_msgSend_addObject_(v8, v39, (uint64_t)v15, v41);

      if (v11 == ++v13)
      {
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v44, (uint64_t)&v59, (uint64_t)v65, 16);
        a5 = v56;
        a3 = v57;
        if (v11)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    handleForCategory(0);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      sub_214568E44();

    v47 = (void *)MEMORY[0x24BDD1540];
    v63 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v48, (uint64_t)CFSTR("Invalid StrongComponent:%@"), v49, v14);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v50;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v51, (uint64_t)&v64, (uint64_t)&v63, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v47, v53, (uint64_t)CFSTR("com.apple.corerepair"), -38, v52);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = 0;
    a3 = v57;
    if (!v57)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_12:

  v45 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v8);
  v54 = 1;
  if (a3)
LABEL_17:
    *a3 = objc_retainAutorelease(v45);
LABEL_18:

  return v54;
}

- (void)issueClientCertificateWithCompletionOnQueue:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  int isFDRDataClassSupported;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t *v23;
  const char *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  __CFString *v30;
  id v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  id v39;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  CRCCertificate *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  __SecCertificate *v48;
  CFDataRef v49;
  const char *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  id v62;
  id v63;
  const char *v64;
  id *v65;
  int v66;
  const char *v67;
  id v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  id v97;
  id v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  NSObject *v119;
  const char *v120;
  id v121;
  id v122;
  const char *v123;
  id *v124;
  int v125;
  id v126;
  uint64_t v127;
  NSObject *v128;
  const char *v129;
  uint64_t v130;
  id *v131;
  const char *v132;
  int v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  CRCCertificate *v138;
  const char *v139;
  void *v140;
  id *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  id *v160;
  char v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  id *v165;
  id v166;
  id v167;
  uint64_t v168;
  id *v169;
  NSObject *v170;
  uint64_t v171;
  int v172;
  uint64_t v173;
  NSObject *v174;
  NSObject *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  NSObject *v182;
  NSObject *v183;
  void *v184;
  const char *v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  id v189;
  id *v190;
  int v191;
  const char *v192;
  uint64_t v193;
  id *v194;
  NSObject *v195;
  int v196;
  uint64_t v197;
  NSObject *v198;
  NSObject *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  id v210;
  CRCCertificate *v211;
  const char *v212;
  NSObject *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  id v220;
  void *v221;
  id v222;
  void *v223;
  void *v224;
  id v225;
  void *v226;
  void *v227;
  void *v228;
  id v229;
  void *v230;
  BOOL v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  id v236;
  void *v237;
  NSObject *queue;
  _QWORD v240[4];
  id v241;
  id v242;
  uint64_t *v243;
  uint64_t *v244;
  id v245;
  id v246;
  id v247;
  id v248;
  id v249;
  id v250;
  id v251;
  id v252;
  id v253;
  id v254;
  id v255;
  id v256;
  id v257;
  id obj;
  id v259;
  id v260;
  id v261;
  id v262;
  id v263;
  _QWORD v264[9];
  _QWORD block[11];
  char v266;
  uint64_t v267;
  _QWORD v268[4];
  id v269;
  uint64_t v270;
  uint64_t *v271;
  uint64_t v272;
  char v273;
  uint64_t v274;
  uint64_t *v275;
  uint64_t v276;
  uint64_t (*v277)(uint64_t, uint64_t);
  void (*v278)(uint64_t);
  id v279;
  uint64_t v280;
  uint64_t *v281;
  uint64_t v282;
  char v283;
  uint64_t v284;
  uint64_t *v285;
  uint64_t v286;
  char v287;
  _QWORD v288[5];
  id v289;
  uint64_t v290;
  uint64_t *v291;
  uint64_t v292;
  uint64_t (*v293)(uint64_t, uint64_t);
  void (*v294)(uint64_t);
  id v295;
  uint64_t v296;
  id *v297;
  uint64_t v298;
  uint64_t (*v299)(uint64_t, uint64_t);
  void (*v300)(uint64_t);
  id v301;
  uint64_t v302;
  uint64_t *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t *v307;
  uint64_t v308;
  uint64_t (*v309)(uint64_t, uint64_t);
  void (*v310)(uint64_t);
  id v311;
  uint64_t v312;
  uint64_t *v313;
  uint64_t v314;
  uint64_t (*v315)(uint64_t, uint64_t);
  void (*v316)(uint64_t);
  dispatch_group_t v317;
  uint64_t v318;
  uint64_t *v319;
  uint64_t v320;
  uint64_t (*v321)(uint64_t, uint64_t);
  void (*v322)(uint64_t);
  id v323;
  uint64_t v324;
  const __CFString *v325;
  uint64_t v326;
  const __CFString *v327;
  uint8_t buf[4];
  id v329;
  uint64_t v330;
  _QWORD v331[4];

  v331[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v318 = 0;
  v319 = &v318;
  v320 = 0x3032000000;
  v321 = sub_21451AA90;
  v322 = sub_21451AAA0;
  dispatch_get_global_queue(0, 0);
  v323 = (id)objc_claimAutoreleasedReturnValue();
  v312 = 0;
  v313 = &v312;
  v314 = 0x3032000000;
  v315 = sub_21451AA90;
  v316 = sub_21451AAA0;
  v317 = dispatch_group_create();
  v306 = 0;
  v307 = &v306;
  v308 = 0x3032000000;
  v309 = sub_21451AA90;
  v310 = sub_21451AAA0;
  v311 = 0;
  v302 = 0;
  v303 = &v302;
  v304 = 0x2020000000;
  v305 = 0;
  v296 = 0;
  v297 = (id *)&v296;
  v298 = 0x3032000000;
  v299 = sub_21451AA90;
  v300 = sub_21451AAA0;
  v301 = 0;
  v290 = 0;
  v291 = &v290;
  v292 = 0x3032000000;
  v293 = sub_21451AA90;
  v294 = sub_21451AAA0;
  v295 = 0;
  v288[0] = 0;
  v288[1] = v288;
  v288[2] = 0x3032000000;
  v288[3] = sub_21451AA90;
  v288[4] = sub_21451AAA0;
  v222 = v8;
  v289 = v222;
  v284 = 0;
  v285 = &v284;
  v286 = 0x2020000000;
  v287 = 0;
  v280 = 0;
  v281 = &v280;
  v282 = 0x2020000000;
  v283 = 0;
  v274 = 0;
  v275 = &v274;
  v276 = 0x3032000000;
  v277 = sub_21451AA90;
  v278 = sub_21451AAA0;
  v279 = 0;
  v228 = (void *)objc_opt_new();
  v270 = 0;
  v271 = &v270;
  v272 = 0x2020000000;
  v273 = 0;
  v267 = 0;
  v268[0] = &v267;
  v268[1] = 0x3032000000;
  v268[2] = sub_21451AA90;
  v268[3] = sub_21451AAA0;
  v269 = 0;
  objc_msgSend_date(MEMORY[0x24BDBCE60], v10, v11, v12);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v13, (uint64_t)CFSTR("ChMf"), v14);
  v266 = 0;
  v235 = (void *)objc_opt_new();
  v16 = v7;
  queue = v16;
  if (!v16)
    queue = (id)v319[5];
  v17 = v313[5];
  v18 = v319[5];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21451AAA8;
  block[3] = &unk_24D1AA1D8;
  block[4] = &v312;
  block[5] = v288;
  block[6] = &v280;
  block[7] = &v290;
  block[8] = &v318;
  block[9] = &v306;
  block[10] = &v302;
  dispatch_group_async(v17, v18, block);
  if ((isFDRDataClassSupported & 1) == 0)
  {
    v19 = v313[5];
    v20 = v319[5];
    v264[0] = MEMORY[0x24BDAC760];
    v264[1] = 3221225472;
    v264[2] = sub_21451AF1C;
    v264[3] = &unk_24D1AA200;
    v264[4] = self;
    v264[5] = &v312;
    v264[6] = &v270;
    v264[7] = &v267;
    v264[8] = &v274;
    dispatch_group_async(v19, v20, v264);
  }
  dispatch_group_wait((dispatch_group_t)v313[5], 0xFFFFFFFFFFFFFFFFLL);
  v23 = v291;
  if (*((_BYTE *)v281 + 24) || v291[5])
  {
    *((_BYTE *)v285 + 24) = *((_BYTE *)v281 + 24);
    objc_storeStrong(v297 + 5, (id)v23[5]);
    v236 = 0;
    v223 = 0;
    v225 = 0;
    v229 = 0;
    v230 = 0;
    v226 = 0;
    v227 = 0;
    v233 = 0;
    v234 = 0;
    v232 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = CFSTR("BAAFailed");
    goto LABEL_8;
  }
  objc_msgSend_setCompletedUnitCount_(self->progress, v21, 1, v22);
  objc_msgSend_timeIntervalSinceNow(v237, v33, v34, v35);
  if (!isFDRDataClassSupported)
  {
    v168 = v268[0];
    if (*((_BYTE *)v271 + 24) && (v169 = (id *)(v268[0] + 40), !*(_QWORD *)(v268[0] + 40)) && (v171 = v275[5]) != 0)
    {
      v261 = 0;
      v262 = 0;
      v172 = objc_msgSend_transformStrongWithError_blockComponents_resultobtained_(self, v36, (uint64_t)&v262, v171, &v261);
      objc_storeStrong(v169, v262);
      v236 = v261;
      *((_BYTE *)v271 + 24) = v172;
      v173 = v268[0];
      if (v172 && !*(_QWORD *)(v268[0] + 40))
      {
        v234 = 0;
        goto LABEL_15;
      }
      *((_BYTE *)v285 + 24) = 1;
      objc_storeStrong(v297 + 5, *(id *)(v173 + 40));
    }
    else
    {
      *((_BYTE *)v285 + 24) = 1;
      objc_storeStrong(v297 + 5, *(id *)(v168 + 40));
      v236 = 0;
    }
    v223 = 0;
    v225 = 0;
    v229 = 0;
    v230 = 0;
    v226 = 0;
    v227 = 0;
    v233 = 0;
    v234 = 0;
    v232 = 0;
    v26 = 0;
LABEL_61:
    v27 = 0;
    v28 = 0;
LABEL_74:
    v29 = 0;
LABEL_75:
    v30 = CFSTR("BAAIssued");
    goto LABEL_8;
  }
  v234 = (void *)objc_opt_new();
  v263 = 0;
  v236 = (id)objc_msgSend_copyChallengeRequestWithError_(v234, v37, (uint64_t)&v263, v38);
  v39 = v263;
  v40 = v263;
  v28 = v40;
  if (!v236 || v40 || !objc_msgSend_count(v236, v41, v42, v43))
  {
    handleForCategory(0);
    v170 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
      sub_214568EA4();

    *((_BYTE *)v285 + 24) = 1;
    objc_storeStrong(v297 + 5, v39);
    v223 = 0;
    v225 = 0;
    v229 = 0;
    v230 = 0;
    v226 = 0;
    v227 = 0;
    v232 = 0;
    v233 = 0;
    v26 = 0;
    goto LABEL_73;
  }
LABEL_15:
  v44 = [CRCCertificate alloc];
  v223 = (void *)objc_msgSend_initWithRefKey_certificates_certType_(v44, v45, v303[3], v307[5], 0);
  objc_msgSend_objectAtIndexedSubscript_((void *)v307[5], v46, 0, v47);
  v48 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
  v49 = SecCertificateCopyData(v48);
  objc_msgSend_setObject_forKeyedSubscript_(v235, v50, (uint64_t)v49, (uint64_t)CFSTR("BIKCertificate"));

  objc_msgSend_setObject_forKeyedSubscript_(v235, v51, (uint64_t)v236, (uint64_t)CFSTR("Components"));
  objc_msgSend_UUID(MEMORY[0x24BDD1880], v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v55, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v235, v60, (uint64_t)v59, (uint64_t)CFSTR("RequestID"));

  v260 = 0;
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x24BDD1770], v61, (uint64_t)v235, 100, 0, &v260);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v260;
  v63 = v260;
  v28 = v63;
  if (!v233 || v63)
  {
    handleForCategory(0);
    v174 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR))
      sub_214568ED0();

    *((_BYTE *)v285 + 24) = 1;
    objc_storeStrong(v297 + 5, v62);
    v229 = 0;
    v225 = 0;
    v226 = 0;
    v232 = 0;
    v26 = 0;
    goto LABEL_72;
  }
  v65 = (id *)(v268[0] + 40);
  obj = *(id *)(v268[0] + 40);
  v259 = 0;
  v66 = objc_msgSend_sendChallengeRequestWith_serverResponse_error_(self, v64, (uint64_t)v233, (uint64_t)&v259, &obj);
  v26 = v259;
  objc_storeStrong(v65, obj);
  *((_BYTE *)v271 + 24) = v66;
  if (!v66 || *(_QWORD *)(v268[0] + 40) || !v26)
  {
    handleForCategory(0);
    v175 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v175, OS_LOG_TYPE_ERROR))
      sub_214569054((uint64_t)v268, v175, v176, v177, v178, v179, v180, v181);

    *((_BYTE *)v285 + 24) = 1;
    objc_storeStrong(v297 + 5, *(id *)(v268[0] + 40));
    v229 = 0;
    v225 = 0;
    v226 = 0;
    v232 = 0;
    goto LABEL_79;
  }
  v257 = 0;
  objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x24BDD1770], v67, (uint64_t)v26, 0, 0, &v257);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v257;
  v28 = v257;
  if (v28 || !v232)
  {
    handleForCategory(0);
    v182 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR))
      sub_214568FF4();

    *((_BYTE *)v285 + 24) = 1;
    objc_storeStrong(v297 + 5, v68);
    v229 = 0;
    v225 = 0;
    v226 = 0;
LABEL_72:
    v227 = 0;
    v230 = 0;
LABEL_73:
    v27 = 0;
    goto LABEL_74;
  }
  objc_msgSend_setCompletedUnitCount_(self->progress, v69, 2, v70);
  objc_msgSend_objectForKeyedSubscript_(v232, v71, (uint64_t)CFSTR("Challenges"), v72);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v75)
    goto LABEL_85;
  objc_msgSend_objectForKeyedSubscript_(v232, v73, (uint64_t)CFSTR("Challenges"), v74);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v76, v77, v78, v79)
    || (objc_msgSend_objectForKeyedSubscript_(v232, v80, (uint64_t)CFSTR("SessionID"), v81),
        (v84 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_85;
  }
  objc_msgSend_objectForKeyedSubscript_(v232, v82, (uint64_t)CFSTR("SessionID"), v83);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v231 = objc_msgSend_length(v85, v86, v87, v88) == 0;

  if (v231)
  {
LABEL_85:
    handleForCategory(0);
    v183 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
      sub_214568F30();

    *((_BYTE *)v285 + 24) = 1;
    v184 = (void *)MEMORY[0x24BDD1540];
    v330 = *MEMORY[0x24BDD0FC8];
    v331[0] = CFSTR("Server response missing Challenge / Session ID");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v185, (uint64_t)v331, (uint64_t)&v330, 1);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v184, v187, (uint64_t)CFSTR("com.apple.corerepair"), -38, v186);
    v188 = objc_claimAutoreleasedReturnValue();
    v189 = v297[5];
    v297[5] = (id)v188;

    v229 = 0;
    v225 = 0;
    v226 = 0;
LABEL_79:
    v227 = 0;
    v230 = 0;
    goto LABEL_61;
  }
  objc_msgSend_objectForKeyedSubscript_(v232, v89, (uint64_t)CFSTR("Challenges"), v90);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v232, v91, (uint64_t)CFSTR("SessionID"), v92);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_date(MEMORY[0x24BDBCE60], v93, v94, v95);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isFDRDataClassSupported & 1) != 0)
  {
    v252 = 0;
    v229 = (id)objc_msgSend_copyAttestationRequestWithError_challenge_(v234, v96, (uint64_t)&v252, (uint64_t)v230);
    v97 = v252;
    v98 = v252;
    v28 = v98;
    if (v229 && !v98 && objc_msgSend_count(v229, v99, v100, v101))
    {
      v225 = 0;
      goto LABEL_31;
    }
    handleForCategory(0);
    v195 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
      sub_214568F5C();

    *((_BYTE *)v285 + 24) = 1;
    objc_storeStrong(v297 + 5, v97);
    v225 = 0;
    goto LABEL_73;
  }
  v190 = (id *)(v268[0] + 40);
  v255 = *(id *)(v268[0] + 40);
  v256 = 0;
  v191 = objc_msgSend_challengeComponentsWith_challengeResponse_error_(self, v96, (uint64_t)v230, (uint64_t)&v256, &v255);
  v225 = v256;
  objc_storeStrong(v190, v255);
  *((_BYTE *)v271 + 24) = v191;
  v193 = v268[0];
  if (!v191 || (v194 = (id *)(v268[0] + 40), *(_QWORD *)(v268[0] + 40)))
  {
    *((_BYTE *)v285 + 24) = 1;
    objc_storeStrong(v297 + 5, *(id *)(v193 + 40));
    v229 = 0;
    goto LABEL_61;
  }
  v253 = 0;
  v254 = 0;
  v196 = objc_msgSend_transformChallengeResponseWithError_blockChallengeResponse_resultobtained_(self, v192, (uint64_t)&v254, (uint64_t)v225, &v253);
  objc_storeStrong(v194, v254);
  v229 = v253;
  *((_BYTE *)v271 + 24) = v196;
  v197 = v268[0];
  if (!v196 || *(_QWORD *)(v268[0] + 40))
  {
    *((_BYTE *)v285 + 24) = 1;
    objc_storeStrong(v297 + 5, *(id *)(v197 + 40));
    goto LABEL_61;
  }
LABEL_31:
  v105 = v227;
  if (!v227)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v102, v103, v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_setObject_forKeyedSubscript_(v228, v102, (uint64_t)v105, (uint64_t)CFSTR("SessionID"));
  if (!v227)

  objc_msgSend_objectForKeyedSubscript_(v235, v106, (uint64_t)CFSTR("RequestID"), v107);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v111;
  if (!v111)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v108, v109, v110);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_setObject_forKeyedSubscript_(v228, v108, (uint64_t)v112, (uint64_t)CFSTR("RequestID"));
  if (!v111)

  objc_msgSend_setCompletedUnitCount_(self->progress, v113, 3, v114);
  objc_msgSend_timeIntervalSinceNow(v226, v115, v116, v117);
  objc_msgSend_setObject_forKeyedSubscript_(v228, v118, (uint64_t)v229, (uint64_t)CFSTR("Components"));
  handleForCategory(0);
  v119 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v329 = v228;
    _os_log_impl(&dword_214503000, v119, OS_LOG_TYPE_DEFAULT, "Cert Issue request:%@", buf, 0xCu);
  }

  v251 = 0;
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x24BDD1770], v120, (uint64_t)v228, 100, 0, &v251);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v251;
  v122 = v251;
  v28 = v122;
  if (!v27 || v122)
  {
    handleForCategory(0);
    v198 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v198, OS_LOG_TYPE_ERROR))
      sub_214568ED0();

    *((_BYTE *)v285 + 24) = 1;
    objc_storeStrong(v297 + 5, v121);
    v29 = 0;
    goto LABEL_75;
  }
  v124 = (id *)(v268[0] + 40);
  v249 = *(id *)(v268[0] + 40);
  v250 = v26;
  v125 = objc_msgSend_sendCertIssueRequestWith_serverCertResponse_error_(self, v123, (uint64_t)v27, (uint64_t)&v250, &v249);
  v126 = v250;

  objc_storeStrong(v124, v249);
  *((_BYTE *)v271 + 24) = v125;
  v127 = v268[0];
  if (!v125 || *(_QWORD *)(v268[0] + 40) || !v126)
  {
    *((_BYTE *)v285 + 24) = 1;
    objc_storeStrong(v297 + 5, *(id *)(v127 + 40));
    v28 = 0;
    v29 = 0;
    v26 = v126;
    goto LABEL_75;
  }
  handleForCategory(0);
  v128 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v329 = v126;
    _os_log_impl(&dword_214503000, v128, OS_LOG_TYPE_DEFAULT, "serverCertResponse:%@", buf, 0xCu);
  }

  objc_msgSend_setCompletedUnitCount_(self->progress, v129, 4, v130);
  v131 = (id *)(v268[0] + 40);
  v247 = *(id *)(v268[0] + 40);
  v248 = 0;
  v133 = objc_msgSend_transformServerCertResponseUsing_serverCertResponseArray_error_(self, v132, (uint64_t)v126, (uint64_t)&v248, &v247);
  v29 = v248;
  objc_storeStrong(v131, v247);
  *((_BYTE *)v271 + 24) = v133;
  v137 = v268[0];
  if (v133 && !*(_QWORD *)(v268[0] + 40) && v29)
  {
    if (objc_msgSend_count(v29, v134, v135, v136) == 2)
    {
      v138 = [CRCCertificate alloc];
      v140 = (void *)objc_msgSend_initWithRefKey_certificates_certType_(v138, v139, v303[3], (uint64_t)v29, 1);

      v141 = (id *)(v268[0] + 40);
      v246 = *(id *)(v268[0] + 40);
      objc_msgSend_extractCAAAttestationOIDDataWithError_(v140, v142, (uint64_t)&v246, v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v141, v246);

      if (v144)
      {
        objc_msgSend_referenceKey(v140, v145, v146, v147);
        objc_msgSend_certificates(v140, v148, v149, v150);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v151, v152, 0, v153);
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_certificates(v140, v154, v155, v156);
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v224, v157, 1, v158);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = (id *)(v268[0] + 40);
        v245 = *(id *)(v268[0] + 40);
        v161 = DeviceIdentityValidateIdentity();
        objc_storeStrong(v160, v245);
        *((_BYTE *)v271 + 24) = v161;

        v163 = v268[0];
        if (*((_BYTE *)v271 + 24) && !*(_QWORD *)(v268[0] + 40))
        {
          handleForCategory(0);
          v213 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_214503000, v213, OS_LOG_TYPE_DEFAULT, "CAA cert issue success, overwriting BAA cert", buf, 2u);
          }

          objc_msgSend_timeIntervalSinceNow(v237, v214, v215, v216);
          v28 = 0;
          *((_BYTE *)v285 + 24) = 1;
          v30 = CFSTR("CAAIssued");
          v223 = v140;
          goto LABEL_104;
        }
        *((_BYTE *)v285 + 24) = 1;
        v164 = *(void **)(v163 + 40);
        if (!v164)
        {
          v207 = (void *)MEMORY[0x24BDD1540];
          v324 = *MEMORY[0x24BDD0FC8];
          v325 = CFSTR("Cert EvaluateTrust failed");
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v162, (uint64_t)&v325, (uint64_t)&v324, 1);
          v167 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v207, v208, (uint64_t)CFSTR("com.apple.corerepair"), -41, v167);
          v209 = objc_claimAutoreleasedReturnValue();
          v210 = v297[5];
          v297[5] = (id)v209;

          goto LABEL_110;
        }
      }
      else
      {
        handleForCategory(0);
        v199 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v199, OS_LOG_TYPE_ERROR))
          sub_214568F88((uint64_t)v268, v199, v200, v201, v202, v203, v204, v205);

        *((_BYTE *)v285 + 24) = 1;
        v164 = *(void **)(v268[0] + 40);
        if (!v164)
        {
          v217 = (void *)MEMORY[0x24BDD1540];
          v326 = *MEMORY[0x24BDD0FC8];
          v327 = CFSTR("Server response missing CAA OID");
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v206, (uint64_t)&v327, (uint64_t)&v326, 1);
          v167 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v217, v218, (uint64_t)CFSTR("com.apple.corerepair"), -41, v167);
          v219 = objc_claimAutoreleasedReturnValue();
          v220 = v297[5];
          v297[5] = (id)v219;

          goto LABEL_110;
        }
      }
      v165 = v297;
      v166 = v164;
      v167 = v165[5];
      v165[5] = v166;
LABEL_110:

      v211 = [CRCCertificate alloc];
      v223 = (void *)objc_msgSend_initWithRefKey_certificates_certType_(v211, v212, v303[3], v307[5], 0);

      goto LABEL_103;
    }
    v137 = v268[0];
  }
  *((_BYTE *)v285 + 24) = 1;
  objc_storeStrong(v297 + 5, *(id *)(v137 + 40));
LABEL_103:
  v28 = 0;
  v30 = CFSTR("BAAIssued");
LABEL_104:
  v26 = v126;
LABEL_8:
  objc_msgSend_setCompletedUnitCount_(self->progress, v24, 5, v25);
  v240[0] = MEMORY[0x24BDAC760];
  v240[1] = 3221225472;
  v240[2] = sub_21451AFB8;
  v240[3] = &unk_24D1AA228;
  v31 = v9;
  v242 = v31;
  v243 = &v284;
  v32 = v223;
  v241 = v32;
  v244 = &v296;
  dispatch_async(queue, v240);
  if (MEMORY[0x24BE1A1C0])
  {
    AnalyticsSendEventLazy();

  }
  _Block_object_dispose(&v267, 8);

  _Block_object_dispose(&v270, 8);
  _Block_object_dispose(&v274, 8);

  _Block_object_dispose(&v280, 8);
  _Block_object_dispose(&v284, 8);

  _Block_object_dispose(v288, 8);
  _Block_object_dispose(&v290, 8);

  _Block_object_dispose(&v296, 8);
  _Block_object_dispose(&v302, 8);

  _Block_object_dispose(&v306, 8);
  _Block_object_dispose(&v312, 8);

  _Block_object_dispose(&v318, 8);
}

- (BOOL)getStrongComponentsWithError:(id *)a3 resultobtained:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  char v40;
  _QWORD v42[8];
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;

  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = sub_21451AA90;
  v64 = sub_21451AAA0;
  v65 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = sub_21451AA90;
  v58 = sub_21451AAA0;
  v59 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = sub_21451AA90;
  v48 = sub_21451AAA0;
  v49 = 0;
  v6 = objc_alloc(MEMORY[0x24BDD1988]);
  v8 = objc_msgSend_initWithMachServiceName_options_(v6, v7, (uint64_t)CFSTR("com.apple.corerepair"), 0);
  v9 = (void *)v61[5];
  v61[5] = v8;

  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v10, (uint64_t)&unk_254D7DB78, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteObjectInterface_((void *)v61[5], v13, (uint64_t)v12, v14);

  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend_setWithObjects_(v15, v22, v16, v23, v17, v18, v19, v20, v21, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteObjectInterface((void *)v61[5], v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v28, v29, (uint64_t)v24, (uint64_t)sel_getStrongComponentsWithReply_, 1, 1);

  objc_msgSend_resume((void *)v61[5], v30, v31, v32);
  v33 = (void *)v61[5];
  v34 = MEMORY[0x24BDAC760];
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = sub_21451B5A8;
  v43[3] = &unk_24D1AA010;
  v43[4] = &v54;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v33, v35, (uint64_t)v43, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v34;
  v42[1] = 3221225472;
  v42[2] = sub_21451B618;
  v42[3] = &unk_24D1AA278;
  v42[4] = &v54;
  v42[5] = &v50;
  v42[6] = &v44;
  v42[7] = &v60;
  objc_msgSend_getStrongComponentsWithReply_(v37, v38, (uint64_t)v42, v39);

  if (a3)
    *a3 = objc_retainAutorelease((id)v55[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v45[5]);
  v40 = *((_BYTE *)v51 + 24);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
  return v40;
}

- (BOOL)challengeComponentsWith:(id)a3 challengeResponse:(id *)a4 error:(id *)a5
{
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  CRChallengeObject *v18;
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
  void *v30;
  const char *v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  BOOL v74;
  void *v78;
  id obj;
  _QWORD v80[8];
  _QWORD v81[5];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  char v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t (*v105)(uint64_t, uint64_t);
  void (*v106)(uint64_t);
  id v107;
  uint8_t buf[4];
  void *v109;
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v102 = 0;
  v103 = &v102;
  v104 = 0x3032000000;
  v105 = sub_21451AA90;
  v106 = sub_21451AAA0;
  v107 = 0;
  v96 = 0;
  v97 = &v96;
  v98 = 0x3032000000;
  v99 = sub_21451AA90;
  v100 = sub_21451AAA0;
  v101 = 0;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v95 = 0;
  v86 = 0;
  v87 = &v86;
  v88 = 0x3032000000;
  v89 = sub_21451AA90;
  v90 = sub_21451AAA0;
  v91 = 0;
  v78 = (void *)objc_opt_new();
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v5;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v82, (uint64_t)v110, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v83;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v83 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v11);
        if (v12
          && (objc_msgSend_objectForKeyedSubscript_(*(void **)(*((_QWORD *)&v82 + 1) + 8 * v11), v7, (uint64_t)CFSTR("Type"), v8), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0)&& (objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)CFSTR("nonce"), v14), v16 = (void *)objc_claimAutoreleasedReturnValue(), v17 = v16 == 0, v16, v15, !v17))
        {
          v18 = [CRChallengeObject alloc];
          objc_msgSend_objectForKeyedSubscript_(v12, v19, (uint64_t)CFSTR("Type"), v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v12, v22, (uint64_t)CFSTR("nonce"), v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v12, v25, (uint64_t)CFSTR("KeyIndex"), v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v12, v28, (uint64_t)CFSTR("Properties"), v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend_initWithComponentType_challenge_keyIndex_properties_(v18, v31, (uint64_t)v21, (uint64_t)v24, v27, v30);

          if (v32)
            objc_msgSend_addObject_(v78, v33, (uint64_t)v32, v34);
        }
        else
        {
          handleForCategory(0);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v109 = v12;
            _os_log_error_impl(&dword_214503000, v32, OS_LOG_TYPE_ERROR, "Ignoring Invalid Challenge:%@", buf, 0xCu);
          }
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v82, (uint64_t)v110, 16);
    }
    while (v9);
  }

  v35 = objc_alloc(MEMORY[0x24BDD1988]);
  v37 = objc_msgSend_initWithMachServiceName_options_(v35, v36, (uint64_t)CFSTR("com.apple.corerepair"), 0);
  v38 = (void *)v103[5];
  v103[5] = v37;

  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v39, (uint64_t)&unk_254D7DB78, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteObjectInterface_((void *)v103[5], v42, (uint64_t)v41, v43);

  v44 = (void *)MEMORY[0x24BDBCF20];
  v45 = objc_opt_class();
  v46 = objc_opt_class();
  v47 = objc_opt_class();
  v48 = objc_opt_class();
  v49 = objc_opt_class();
  v50 = objc_opt_class();
  v51 = objc_opt_class();
  objc_msgSend_setWithObjects_(v44, v52, v45, v53, v46, v47, v48, v49, v50, v51, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteObjectInterface((void *)v103[5], v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v58, v59, (uint64_t)v54, (uint64_t)sel_challengeComponentsWith_withReply_, 0, 0);

  objc_msgSend_remoteObjectInterface((void *)v103[5], v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v63, v64, (uint64_t)v54, (uint64_t)sel_challengeComponentsWith_withReply_, 1, 1);

  objc_msgSend_resume((void *)v103[5], v65, v66, v67);
  v68 = (void *)v103[5];
  v69 = MEMORY[0x24BDAC760];
  v81[0] = MEMORY[0x24BDAC760];
  v81[1] = 3221225472;
  v81[2] = sub_21451BDBC;
  v81[3] = &unk_24D1AA010;
  v81[4] = &v96;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v68, v70, (uint64_t)v81, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v69;
  v80[1] = 3221225472;
  v80[2] = sub_21451BE2C;
  v80[3] = &unk_24D1AA278;
  v80[4] = &v92;
  v80[5] = &v96;
  v80[6] = &v86;
  v80[7] = &v102;
  objc_msgSend_challengeComponentsWith_withReply_(v72, v73, (uint64_t)v78, (uint64_t)v80);

  if (a5)
    *a5 = objc_retainAutorelease((id)v97[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v87[5]);
  v74 = *((_BYTE *)v93 + 24) != 0;

  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v96, 8);

  _Block_object_dispose(&v102, 8);
  return v74;
}

- (BOOL)sendChallengeRequestWith:(id)a3 serverResponse:(id *)a4 error:(id *)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  int isFDRDataClassSupported;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  char isEqualToString;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  char v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  BOOL v74;
  _QWORD block[6];
  _QWORD v78[8];
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  dispatch_group_t v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint8_t buf[4];
  int v108;
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v8, (uint64_t)CFSTR("ChMf"), v9);
  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v11, (uint64_t)CFSTR("https://sklaxm.apple.com/axiom/components/challenge"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = 0;
  v102 = &v101;
  v103 = 0x3032000000;
  v104 = sub_21451AA90;
  v105 = sub_21451AAA0;
  v106 = 0;
  dispatch_get_global_queue(0, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v95 = 0;
  v96 = &v95;
  v97 = 0x3032000000;
  v98 = sub_21451AA90;
  v99 = sub_21451AAA0;
  v100 = dispatch_group_create();
  v89 = 0;
  v90 = &v89;
  v91 = 0x3032000000;
  v92 = sub_21451AA90;
  v93 = sub_21451AAA0;
  v94 = 0;
  v83 = 0;
  v84 = &v83;
  v85 = 0x3032000000;
  v86 = sub_21451AA90;
  v87 = sub_21451AAA0;
  v88 = 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 1;
  if (!MGGetBoolAnswer())
  {
    v20 = 0;
    goto LABEL_10;
  }
  v17 = objc_alloc(MEMORY[0x24BDBCF50]);
  objc_msgSend_persistentDomainForName_(v17, v18, (uint64_t)CFSTR("com.apple.corerepair"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v20, v21, (uint64_t)CFSTR("ServerEnvironment"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v23, v24, (uint64_t)CFSTR("DEV"), v25);

  if ((isEqualToString & 1) != 0)
  {
    objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v27, (uint64_t)CFSTR("http://localhost:8080/axiom/components/challenge"), v28);
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(v20, v27, (uint64_t)CFSTR("ServerEnvironment"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_isEqualToString_(v29, v30, (uint64_t)CFSTR("UAT"), v31);

    if ((v32 & 1) != 0)
    {
      objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v33, (uint64_t)CFSTR("https://ma-axiom-uat.corp.apple.com/axiom/components/challenge"), v34);
    }
    else
    {
      objc_msgSend_objectForKeyedSubscript_(v20, v33, (uint64_t)CFSTR("ServerEnvironment"), v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend_isEqualToString_(v35, v36, (uint64_t)CFSTR("STG"), v37);

      if (!v38)
        goto LABEL_10;
      objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v15, (uint64_t)CFSTR("https://axiom-stg.corp.apple.com/axiom/components/challenge"), v16);
    }
  }
  v39 = objc_claimAutoreleasedReturnValue();

  v13 = (void *)v39;
LABEL_10:
  if (isFDRDataClassSupported)
  {
    objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v15, (uint64_t)CFSTR("https://axiom-stg.corp.apple.com/axiom/components/challenge"), v16);
    v40 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v40;
  }
  objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(MEMORY[0x24BDD16B0], v15, (uint64_t)v13, 0, 120.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHTTPMethod_(v41, v42, (uint64_t)CFSTR("POST"), v43);
  objc_msgSend_setValue_forHTTPHeaderField_(v41, v44, (uint64_t)CFSTR("*/*"), (uint64_t)CFSTR("Accept"));
  objc_msgSend_setValue_forHTTPHeaderField_(v41, v45, (uint64_t)CFSTR("application/xml"), (uint64_t)CFSTR("Content-Type"));
  v46 = (void *)MEMORY[0x24BDD17C8];
  v50 = objc_msgSend_length(v7, v47, v48, v49);
  objc_msgSend_stringWithFormat_(v46, v51, (uint64_t)CFSTR("%d"), v52, v50);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forHTTPHeaderField_(v41, v54, (uint64_t)v53, (uint64_t)CFSTR("Content-Length"));

  objc_msgSend_setHTTPBody_(v41, v55, (uint64_t)v7, v56);
  handleForCategory(0);
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    v61 = objc_msgSend_length(v7, v58, v59, v60);
    *(_DWORD *)buf = 67109120;
    v108 = v61;
    _os_log_impl(&dword_214503000, v57, OS_LOG_TYPE_DEFAULT, "content length is:%d", buf, 8u);
  }

  v62 = (void *)MEMORY[0x24BDD1850];
  objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x24BDD1858], v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(v62, v67, (uint64_t)v66, (uint64_t)self, 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = MEMORY[0x24BDAC760];
  v78[0] = MEMORY[0x24BDAC760];
  v78[1] = 3221225472;
  v78[2] = sub_21451C4DC;
  v78[3] = &unk_24D1AA088;
  v78[4] = &v89;
  v78[5] = &v83;
  v78[6] = &v79;
  v78[7] = &v95;
  objc_msgSend_dataTaskWithRequest_completionHandler_(v68, v70, (uint64_t)v41, (uint64_t)v78);
  v71 = objc_claimAutoreleasedReturnValue();
  v72 = (void *)v102[5];
  v102[5] = v71;

  v73 = v96[5];
  block[0] = v69;
  block[1] = 3221225472;
  block[2] = sub_21451C850;
  block[3] = &unk_24D1AA0B0;
  block[4] = &v95;
  block[5] = &v101;
  dispatch_group_async(v73, v14, block);
  dispatch_group_wait((dispatch_group_t)v96[5], 0xFFFFFFFFFFFFFFFFLL);
  if (a5)
    *a5 = objc_retainAutorelease((id)v90[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v84[5]);
  v74 = *((_BYTE *)v80 + 24) != 0;

  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);

  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(&v95, 8);

  _Block_object_dispose(&v101, 8);
  return v74;
}

- (BOOL)transformServerCertResponseUsing:(id)a3 serverCertResponseArray:(id *)a4 error:(id *)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  id v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  BOOL v66;
  id *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint8_t buf[4];
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v11 = (void *)objc_msgSend_mutableCopy(CFSTR("-----BEGIN CERTIFICATE-----"), v8, v9, v10);
  v15 = (void *)objc_msgSend_mutableCopy(CFSTR("-----BEGIN CERTIFICATE-----"), v12, v13, v14);
  v69 = (void *)objc_opt_new();
  v16 = objc_alloc(MEMORY[0x24BDD17C8]);
  v70 = v7;
  v18 = (void *)objc_msgSend_initWithData_encoding_(v16, v17, (uint64_t)v7, 4);
  objc_msgSend_componentsSeparatedByString_(v18, v19, (uint64_t)CFSTR("-----BEGIN CERTIFICATE-----"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v21;
  if (v21 && objc_msgSend_count(v21, v22, v23, v24) == 3)
  {
    v68 = a4;
    objc_msgSend_objectAtIndexedSubscript_(v25, v26, 1, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v11, v29, (uint64_t)v28, v30);

    objc_msgSend_objectAtIndexedSubscript_(v25, v31, 2, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v15, v34, (uint64_t)v33, v35);

    objc_msgSend_dataUsingEncoding_(v11, v36, 4, v37);
    v38 = (void *)SecCertificateCreateWithPEM();
    objc_msgSend_dataUsingEncoding_(v15, v39, 4, v40);
    v41 = (void *)SecCertificateCreateWithPEM();
    handleForCategory(0);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v74 = v38;
      _os_log_impl(&dword_214503000, v42, OS_LOG_TYPE_DEFAULT, "CAA leafRef : %@", buf, 0xCu);
    }

    handleForCategory(0);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v69;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v74 = v41;
      _os_log_impl(&dword_214503000, v43, OS_LOG_TYPE_DEFAULT, "CAA intermediateRef: %@", buf, 0xCu);
    }

    if (v38 && v41)
    {
      objc_msgSend_addObject_(v69, v45, (uint64_t)v38, v46);

      objc_msgSend_addObject_(v69, v47, (uint64_t)v41, v48);
    }
    v49 = 0;
    if (v68)
      *v68 = objc_retainAutorelease(v69);
    v66 = 1;
    if (!a5)
      goto LABEL_16;
LABEL_15:
    *a5 = objc_retainAutorelease(v49);
    goto LABEL_16;
  }
  v50 = v18;
  v51 = v15;
  v52 = v11;
  v53 = a5;
  handleForCategory(0);
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    sub_214569290();

  v55 = (void *)MEMORY[0x24BDD1540];
  v71 = *MEMORY[0x24BDD0FC8];
  v56 = (void *)MEMORY[0x24BDD17C8];
  v57 = objc_alloc(MEMORY[0x24BDD17C8]);
  v59 = (void *)objc_msgSend_initWithData_encoding_(v57, v58, (uint64_t)v70, 4);
  objc_msgSend_stringWithFormat_(v56, v60, (uint64_t)CFSTR("CAA attestation failed:%@"), v61, v59);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v62;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v63, (uint64_t)&v72, (uint64_t)&v71, 1);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v55, v65, (uint64_t)CFSTR("com.apple.corerepair"), -38, v64);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = 0;
  a5 = v53;
  v11 = v52;
  v15 = v51;
  v18 = v50;
  v44 = v69;
  if (a5)
    goto LABEL_15;
LABEL_16:

  return v66;
}

- (BOOL)sendCertIssueRequestWith:(id)a3 serverCertResponse:(id *)a4 error:(id *)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  int isFDRDataClassSupported;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  char isEqualToString;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  char v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  BOOL v74;
  _QWORD block[6];
  _QWORD v78[8];
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  dispatch_group_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint8_t buf[4];
  int v108;
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v8, (uint64_t)CFSTR("ChMf"), v9);
  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v11, (uint64_t)CFSTR("https://sklaxm.apple.com/axiom/components/attest"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = 0;
  v102 = &v101;
  v103 = 0x3032000000;
  v104 = sub_21451AA90;
  v105 = sub_21451AAA0;
  v106 = 0;
  v95 = 0;
  v96 = &v95;
  v97 = 0x3032000000;
  v98 = sub_21451AA90;
  v99 = sub_21451AAA0;
  v100 = 0;
  v89 = 0;
  v90 = &v89;
  v91 = 0x3032000000;
  v92 = sub_21451AA90;
  v93 = sub_21451AAA0;
  v94 = 0;
  v85 = 0;
  v86 = &v85;
  v87 = 0x2020000000;
  v88 = 1;
  dispatch_get_global_queue(0, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = sub_21451AA90;
  v83 = sub_21451AAA0;
  v84 = dispatch_group_create();
  if (!MGGetBoolAnswer())
  {
    v20 = 0;
    goto LABEL_10;
  }
  v17 = objc_alloc(MEMORY[0x24BDBCF50]);
  objc_msgSend_persistentDomainForName_(v17, v18, (uint64_t)CFSTR("com.apple.corerepair"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v20, v21, (uint64_t)CFSTR("ServerEnvironment"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v23, v24, (uint64_t)CFSTR("DEV"), v25);

  if ((isEqualToString & 1) != 0)
  {
    objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v27, (uint64_t)CFSTR("http://localhost:8080/axiom/components/attest"), v28);
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(v20, v27, (uint64_t)CFSTR("ServerEnvironment"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_isEqualToString_(v29, v30, (uint64_t)CFSTR("UAT"), v31);

    if ((v32 & 1) != 0)
    {
      objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v33, (uint64_t)CFSTR("https://ma-axiom-uat.corp.apple.com/axiom/components/attest"), v34);
    }
    else
    {
      objc_msgSend_objectForKeyedSubscript_(v20, v33, (uint64_t)CFSTR("ServerEnvironment"), v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend_isEqualToString_(v35, v36, (uint64_t)CFSTR("STG"), v37);

      if (!v38)
        goto LABEL_10;
      objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v15, (uint64_t)CFSTR("https://axiom-stg.corp.apple.com/axiom/components/attest"), v16);
    }
  }
  v39 = objc_claimAutoreleasedReturnValue();

  v13 = (void *)v39;
LABEL_10:
  if (isFDRDataClassSupported)
  {
    objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v15, (uint64_t)CFSTR("https://axiom-stg.corp.apple.com/axiom/components/attest"), v16);
    v40 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v40;
  }
  objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(MEMORY[0x24BDD16B0], v15, (uint64_t)v13, 0, 120.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHTTPMethod_(v41, v42, (uint64_t)CFSTR("POST"), v43);
  objc_msgSend_setValue_forHTTPHeaderField_(v41, v44, (uint64_t)CFSTR("*/*"), (uint64_t)CFSTR("Accept"));
  objc_msgSend_setValue_forHTTPHeaderField_(v41, v45, (uint64_t)CFSTR("application/xml"), (uint64_t)CFSTR("Content-Type"));
  v46 = (void *)MEMORY[0x24BDD17C8];
  v50 = objc_msgSend_length(v7, v47, v48, v49);
  objc_msgSend_stringWithFormat_(v46, v51, (uint64_t)CFSTR("%d"), v52, v50);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forHTTPHeaderField_(v41, v54, (uint64_t)v53, (uint64_t)CFSTR("Content-Length"));

  objc_msgSend_setHTTPBody_(v41, v55, (uint64_t)v7, v56);
  handleForCategory(0);
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    v61 = objc_msgSend_length(v7, v58, v59, v60);
    *(_DWORD *)buf = 67109120;
    v108 = v61;
    _os_log_impl(&dword_214503000, v57, OS_LOG_TYPE_DEFAULT, "content length is:%d", buf, 8u);
  }

  v62 = (void *)MEMORY[0x24BDD1850];
  objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x24BDD1858], v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(v62, v67, (uint64_t)v66, (uint64_t)self, 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = MEMORY[0x24BDAC760];
  v78[0] = MEMORY[0x24BDAC760];
  v78[1] = 3221225472;
  v78[2] = sub_21451D1B4;
  v78[3] = &unk_24D1AA088;
  v78[4] = &v95;
  v78[5] = &v89;
  v78[6] = &v85;
  v78[7] = &v79;
  objc_msgSend_dataTaskWithRequest_completionHandler_(v68, v70, (uint64_t)v41, (uint64_t)v78);
  v71 = objc_claimAutoreleasedReturnValue();
  v72 = (void *)v102[5];
  v102[5] = v71;

  v73 = v80[5];
  block[0] = v69;
  block[1] = 3221225472;
  block[2] = sub_21451D528;
  block[3] = &unk_24D1AA0B0;
  block[4] = &v79;
  block[5] = &v101;
  dispatch_group_async(v73, v14, block);
  dispatch_group_wait((dispatch_group_t)v80[5], 0xFFFFFFFFFFFFFFFFLL);
  if (a5)
    *a5 = objc_retainAutorelease((id)v96[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v90[5]);
  v74 = *((_BYTE *)v86 + 24) != 0;

  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);

  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(&v101, 8);

  return v74;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  __SecTrust *v16;
  const __CFArray *v17;
  const __CFArray *v18;
  __SecCertificate *ValueAtIndex;
  CFDataRef v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  int v34;
  CFDataRef v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void (**)(id, _QWORD, void *))a5;
  handleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v34) = 0;
    _os_log_impl(&dword_214503000, v8, OS_LOG_TYPE_DEFAULT, "didReceiveChallenge", (uint8_t *)&v34, 2u);
  }

  objc_msgSend_protectionSpace(v6, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (__SecTrust *)objc_msgSend_serverTrust(v12, v13, v14, v15);

  v17 = SecTrustCopyCertificateChain(v16);
  if (v17)
  {
    v18 = v17;
    if (CFArrayGetCount(v17) < 1)
      ValueAtIndex = 0;
    else
      ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(v18, 0);
    CFRelease(v18);
  }
  else
  {
    ValueAtIndex = 0;
  }
  v20 = SecCertificateCopyData(ValueAtIndex);
  handleForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 138412546;
    v35 = v20;
    v36 = 2112;
    v37 = v6;
    _os_log_impl(&dword_214503000, v21, OS_LOG_TYPE_DEFAULT, "Certificate:%@:%@", (uint8_t *)&v34, 0x16u);
  }

  v22 = (void *)MEMORY[0x24BDD1818];
  objc_msgSend_protectionSpace(v6, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_serverTrust(v26, v27, v28, v29);
  objc_msgSend_credentialForTrust_(v22, v31, v30, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v7[2](v7, 0, v33);
}

- (CRCAttestationManager)init
{
  const char *v2;
  uint64_t v3;
  CRCAttestationManager *v4;
  uint64_t v5;
  NSProgress *progress;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRCAttestationManager;
  v4 = -[CRCAttestationManager init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_progressWithTotalUnitCount_(MEMORY[0x24BDD1768], v2, 5, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    progress = v4->progress;
    v4->progress = (NSProgress *)v5;

  }
  return v4;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->progress, 0);
}

@end
