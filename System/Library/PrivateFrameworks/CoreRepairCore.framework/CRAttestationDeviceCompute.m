@implementation CRAttestationDeviceCompute

+ (id)getDataInstance
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  const __CFString *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)AMFDRSealingMapCopyInstanceForClass();
  handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v8 = CFSTR("ChMf");
      v9 = 2112;
      v10 = v2;
      _os_log_impl(&dword_214503000, v4, OS_LOG_TYPE_DEFAULT, "Instance of %@ from sealing map: %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_2145687F4();
  }

  AMSupportSafeRelease();
  return v2;
}

+ (id)getLiveChMf
{
  NSObject *v2;

  if (!copyFdrBlob())
    return 0;
  handleForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_214568820();

  return 0;
}

- (CRAttestationDeviceCompute)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  CRAttestationDeviceCompute *v5;
  uint64_t v6;
  NSString *instance;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSDictionary *liveChMf;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CRAttestationDeviceCompute;
  v5 = -[CRAttestationDeviceCompute init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend_getDataInstance(CRAttestationDeviceCompute, v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    instance = v5->instance;
    v5->instance = (NSString *)v6;

    objc_msgSend_getLiveChMf(CRAttestationDeviceCompute, v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    liveChMf = v5->liveChMf;
    v5->liveChMf = (NSDictionary *)v11;

  }
  return v5;
}

- (id)copyChallengeRequestWithError:(id *)a3
{
  void *v5;
  void *v6;
  NSString *instance;
  NSObject *v8;
  NSObject *v9;
  NSString *v10;
  NSDictionary *liveChMf;
  NSObject *v12;
  NSObject *v13;
  NSDictionary *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  const char *v46;
  void *v47;
  const char *v48;
  id *v50;
  id *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;
  const __CFString *v61;
  uint8_t buf[4];
  NSDictionary *v63;
  uint64_t v64;
  _QWORD v65[4];

  v65[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v54 = (void *)objc_opt_new();
  instance = self->instance;
  handleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!instance)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456884C();

    v44 = (void *)MEMORY[0x24BDD1540];
    v64 = *MEMORY[0x24BDD0FC8];
    v65[0] = CFSTR("Unable to fetch live instance");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v45, (uint64_t)v65, (uint64_t)&v64, 1);
LABEL_24:
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v44, v48, (uint64_t)CFSTR("com.apple.corerepair"), -72, v47);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a3)
      goto LABEL_26;
LABEL_25:
    *a3 = objc_retainAutorelease(v43);
    goto LABEL_26;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->instance;
    *(_DWORD *)buf = 138412290;
    v63 = (NSDictionary *)v10;
    _os_log_impl(&dword_214503000, v9, OS_LOG_TYPE_DEFAULT, "fetched live instance:%@", buf, 0xCu);
  }

  liveChMf = self->liveChMf;
  handleForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!liveChMf)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_214568878();

    v44 = (void *)MEMORY[0x24BDD1540];
    v60 = *MEMORY[0x24BDD0FC8];
    v61 = CFSTR("Unable to fetch live instance");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v46, (uint64_t)&v61, (uint64_t)&v60, 1);
    goto LABEL_24;
  }
  v50 = a3;
  v52 = v5;
  v53 = v6;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->liveChMf;
    *(_DWORD *)buf = 138412290;
    v63 = v14;
    _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, "Sealed system manifest %@", buf, 0xCu);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8500, v15, (uint64_t)&v55, (uint64_t)v59, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v56 != v19)
          objc_enumerationMutation(&unk_24D1B8500);
        v21 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        v22 = (void *)objc_opt_new();
        objc_msgSend_objectForKeyedSubscript_(self->liveChMf, v23, v21, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_base64EncodedStringWithOptions_(v25, v26, 0, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_setObject_forKeyedSubscript_(v22, v29, v21, (uint64_t)CFSTR("Type"));
        if (v28)
          objc_msgSend_setObject_forKeyedSubscript_(v22, v30, (uint64_t)v28, (uint64_t)CFSTR("Identifier"));
        objc_msgSend_addObject_(v54, v30, (uint64_t)v22, v31, v50);

      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8500, v32, (uint64_t)&v55, (uint64_t)v59, 16);
    }
    while (v18);
  }
  v5 = v52;
  objc_msgSend_setObject_forKeyedSubscript_(v52, v17, (uint64_t)v54, (uint64_t)CFSTR("SubComponents"), v50);
  objc_msgSend_setObject_forKeyedSubscript_(v52, v33, (uint64_t)CFSTR("ChMf"), (uint64_t)CFSTR("Type"));
  objc_msgSend_dataUsingEncoding_(self->instance, v34, 4, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(v36, v37, 0, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v52, v40, (uint64_t)v39, (uint64_t)CFSTR("Identifier"));

  v6 = v53;
  objc_msgSend_addObject_(v53, v41, (uint64_t)v52, v42);
  v43 = 0;
  a3 = v51;
  if (v51)
    goto LABEL_25;
LABEL_26:

  return v6;
}

- (id)copyAttestationRequestWithError:(id *)a3 challenge:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSString *instance;
  NSObject *v21;
  NSObject *v22;
  NSString *v23;
  NSDictionary *liveChMf;
  NSObject *v25;
  NSObject *v26;
  NSDictionary *v27;
  const char *v28;
  uint64_t i;
  id v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  int v52;
  NSObject *v53;
  void *v54;
  const char *v55;
  const char *v56;
  void *v57;
  void *v58;
  const char *v59;
  const char *v60;
  id *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t k;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  NSDictionary *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t m;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  const char *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  char isKindOfClass;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t n;
  void *v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  const char *v141;
  uint64_t v142;
  const char *v143;
  void *v144;
  char v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  const char *v156;
  uint64_t v157;
  id v159;
  void *v160;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  id obj;
  NSObject *obja;
  CRAttestationDeviceCompute *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  id v174;
  id v175;
  void *v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  uint64_t v201;
  uint64_t v202;
  id v203;
  uint64_t v204;
  _BYTE v205[128];
  _BYTE v206[128];
  _BYTE v207[128];
  _BYTE v208[128];
  uint64_t v209;
  const __CFString *v210;
  _BYTE v211[128];
  _BYTE v212[128];
  uint64_t v213;
  const __CFString *v214;
  uint8_t buf[4];
  NSDictionary *v216;
  uint64_t v217;

  v217 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v204 = 0;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v203 = 0;
  v8 = (void *)objc_opt_new();
  objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v9, (uint64_t)&unk_24D1B8500, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = (void *)objc_opt_new();
  v201 = 0;
  v202 = 0;
  v12 = (void *)objc_opt_new();
  CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  AMFDRCreateWithOptions();
  AMFDRSealingMapCopyManifestPropertiesForDevice();
  v16 = (void *)objc_msgSend_copy(0, v13, v14, v15);

  v17 = (void *)objc_opt_new();
  objc_msgSend_convertDataToHexInDictionary_(v17, v18, (uint64_t)v16, v19);
  v162 = (void *)objc_claimAutoreleasedReturnValue();

  v168 = self;
  instance = self->instance;
  handleForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!instance)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_21456884C();
    v57 = 0;
    goto LABEL_31;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v168->instance;
    *(_DWORD *)buf = 138412290;
    v216 = (NSDictionary *)v23;
    _os_log_impl(&dword_214503000, v22, OS_LOG_TYPE_DEFAULT, "fetched live instance:%@", buf, 0xCu);
  }

  liveChMf = v168->liveChMf;
  handleForCategory(0);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!liveChMf)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_214568878();

    v58 = (void *)MEMORY[0x24BDD1540];
    v213 = *MEMORY[0x24BDD0FC8];
    v214 = CFSTR("Unable to fetch live instance");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v59, (uint64_t)&v214, (uint64_t)&v213, 1);
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v58, v60, (uint64_t)CFSTR("com.apple.corerepair"), -72, v22);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
    v175 = 0;
    v61 = a3;
    goto LABEL_79;
  }
  v163 = v16;
  v164 = v11;
  v160 = v7;
  v165 = v6;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v27 = v168->liveChMf;
    *(_DWORD *)buf = 138412290;
    v216 = v27;
    _os_log_impl(&dword_214503000, v26, OS_LOG_TYPE_DEFAULT, "Sealed system manifest %@", buf, 0xCu);
  }

  v199 = 0u;
  v200 = 0u;
  v197 = 0u;
  v198 = 0u;
  v159 = v5;
  obj = v5;
  v172 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v197, (uint64_t)v212, 16);
  if (v172)
  {
    v170 = *(_QWORD *)v198;
    do
    {
      for (i = 0; i != v172; ++i)
      {
        if (*(_QWORD *)v198 != v170)
          objc_enumerationMutation(obj);
        v30 = *(id *)(*((_QWORD *)&v197 + 1) + 8 * i);
        v193 = 0u;
        v194 = 0u;
        v195 = 0u;
        v196 = 0u;
        v174 = v30;
        objc_msgSend_objectForKeyedSubscript_(v30, v31, (uint64_t)CFSTR("nonce"), v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v193, (uint64_t)v211, 16);
        if (v35)
        {
          v38 = v35;
          v39 = *(_QWORD *)v194;
          do
          {
            for (j = 0; j != v38; ++j)
            {
              if (*(_QWORD *)v194 != v39)
                objc_enumerationMutation(v33);
              v41 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * j);
              objc_msgSend_objectForKeyedSubscript_(v41, v36, (uint64_t)CFSTR("nonce"), v37, v159);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v41, v43, (uint64_t)CFSTR("Type"), v44);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v8, v46, (uint64_t)v42, (uint64_t)v45);

            }
            v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v193, (uint64_t)v211, 16);
          }
          while (v38);
        }

      }
      v172 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v197, (uint64_t)v212, 16);
    }
    while (v172);
  }

  v51 = (void *)objc_msgSend_copy(v8, v48, v49, v50);
  v52 = copyChallengeResponse();

  if (!v52)
  {
    v189 = 0u;
    v190 = 0u;
    v191 = 0u;
    v192 = 0u;
    v175 = v203;
    v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v175, v62, (uint64_t)&v189, (uint64_t)v208, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v190;
      do
      {
        for (k = 0; k != v64; ++k)
        {
          if (*(_QWORD *)v190 != v65)
            objc_enumerationMutation(v175);
          v67 = *(_QWORD *)(*((_QWORD *)&v189 + 1) + 8 * k);
          v68 = (void *)objc_opt_new();
          objc_msgSend_objectForKeyedSubscript_(v168->liveChMf, v69, v67, v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_base64EncodedStringWithOptions_(v71, v72, 0, v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_setObject_forKeyedSubscript_(v68, v75, v67, (uint64_t)CFSTR("Type"));
          if (v74)
            objc_msgSend_setObject_forKeyedSubscript_(v68, v76, (uint64_t)v74, (uint64_t)CFSTR("Identifier"));
          objc_msgSend_objectForKeyedSubscript_(v175, v76, v67, v77, v159);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_base64EncodedStringWithOptions_(v78, v79, 0, v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v68, v82, (uint64_t)v81, (uint64_t)CFSTR("Response"));

          objc_msgSend_addObject_(v165, v83, (uint64_t)v68, v84);
        }
        v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v175, v85, (uint64_t)&v189, (uint64_t)v208, 16);
      }
      while (v64);
    }

    v187 = 0u;
    v188 = 0u;
    v185 = 0u;
    v186 = 0u;
    v86 = v168->liveChMf;
    v88 = objc_msgSend_countByEnumeratingWithState_objects_count_(v86, v87, (uint64_t)&v185, (uint64_t)v207, 16);
    v11 = v164;
    if (v88)
    {
      v91 = v88;
      v92 = *(_QWORD *)v186;
      do
      {
        for (m = 0; m != v91; ++m)
        {
          if (*(_QWORD *)v186 != v92)
            objc_enumerationMutation(v86);
          v94 = *(_QWORD *)(*((_QWORD *)&v185 + 1) + 8 * m);
          if ((objc_msgSend_containsObject_(v11, v89, v94, v90, v159) & 1) == 0)
          {
            v95 = (void *)objc_opt_new();
            objc_msgSend_objectForKeyedSubscript_(v168->liveChMf, v96, v94, v97);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_base64EncodedStringWithOptions_(v98, v99, 0, v100);
            v101 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_setObject_forKeyedSubscript_(v95, v102, v94, (uint64_t)CFSTR("Type"));
            if (v101)
              objc_msgSend_setObject_forKeyedSubscript_(v95, v103, (uint64_t)v101, (uint64_t)CFSTR("Identifier"));
            objc_msgSend_addObject_(v165, v103, (uint64_t)v95, v104);

            v11 = v164;
          }
        }
        v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v86, v89, (uint64_t)&v185, (uint64_t)v207, 16);
      }
      while (v91);
    }

    v7 = v160;
    v6 = v165;
    objc_msgSend_setObject_forKeyedSubscript_(v160, v105, (uint64_t)v165, (uint64_t)CFSTR("SubComponents"));
    objc_msgSend_setObject_forKeyedSubscript_(v160, v106, (uint64_t)CFSTR("ChMf"), (uint64_t)CFSTR("Type"));
    objc_msgSend_dataUsingEncoding_(v168->instance, v107, 4, v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_base64EncodedStringWithOptions_(v109, v110, 0, v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v160, v113, (uint64_t)v112, (uint64_t)CFSTR("Identifier"));

    objc_msgSend_addObject_(v176, v114, (uint64_t)v160, v115);
    v183 = 0u;
    v184 = 0u;
    v181 = 0u;
    v182 = 0u;
    v22 = v162;
    v171 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v116, (uint64_t)&v181, (uint64_t)v206, 16);
    if (!v171)
    {
      v57 = 0;
      v5 = v159;
      v61 = a3;
      v16 = v163;
      goto LABEL_79;
    }
    v119 = *(_QWORD *)v182;
    v16 = v163;
    obja = v22;
    v169 = *(_QWORD *)v182;
LABEL_54:
    v120 = 0;
    while (1)
    {
      if (*(_QWORD *)v182 != v119)
        objc_enumerationMutation(v22);
      v121 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * v120);
      if ((objc_msgSend_isEqualToString_(v121, v117, (uint64_t)CFSTR("ChMf"), v118, v159) & 1) != 0)
        goto LABEL_75;
      v173 = v120;
      objc_msgSend_objectForKeyedSubscript_(v22, v117, (uint64_t)v121, v118);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;
      objc_msgSend_objectForKeyedSubscript_(v16, v124, (uint64_t)v121, v125);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v145 = objc_opt_isKindOfClass();

      v120 = v173;
      if ((v145 & 1) != 0)
      {
        v126 = (void *)objc_opt_new();
        objc_msgSend_objectForKeyedSubscript_(v16, v146, (uint64_t)v121, v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dataUsingEncoding_(v148, v149, 4, v150);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_base64EncodedStringWithOptions_(v151, v152, 0, v153);
        v154 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_setObject_forKeyedSubscript_(v126, v155, (uint64_t)v121, (uint64_t)CFSTR("Type"));
        if (v154)
          objc_msgSend_setObject_forKeyedSubscript_(v126, v156, (uint64_t)v154, (uint64_t)CFSTR("Identifier"));
        objc_msgSend_addObject_(v176, v156, (uint64_t)v126, v157);

LABEL_73:
        v119 = v169;
LABEL_74:

        v120 = v173;
      }
LABEL_75:
      if (++v120 == v171)
      {
        v171 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v117, (uint64_t)&v181, (uint64_t)v206, 16);
        if (!v171)
        {
          v57 = 0;
          goto LABEL_78;
        }
        goto LABEL_54;
      }
    }
    objc_msgSend_objectForKeyedSubscript_(v22, v124, (uint64_t)v121, v125);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = 0u;
    v178 = 0u;
    v179 = 0u;
    v180 = 0u;
    v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(v126, v127, (uint64_t)&v177, (uint64_t)v205, 16);
    if (v128)
    {
      v129 = v128;
      v130 = *(_QWORD *)v178;
      do
      {
        for (n = 0; n != v129; ++n)
        {
          if (*(_QWORD *)v178 != v130)
            objc_enumerationMutation(v126);
          v132 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * n);
          v133 = (void *)objc_opt_new();
          objc_msgSend_dataUsingEncoding_(v132, v134, 4, v135);
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_base64EncodedStringWithOptions_(v136, v137, 0, v138);
          v139 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_setObject_forKeyedSubscript_(v133, v140, (uint64_t)v121, (uint64_t)CFSTR("Type"));
          if (v139)
            objc_msgSend_setObject_forKeyedSubscript_(v133, v141, (uint64_t)v139, (uint64_t)CFSTR("Identifier"));
          objc_msgSend_addObject_(v176, v141, (uint64_t)v133, v142);

        }
        v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v126, v143, (uint64_t)&v177, (uint64_t)v205, 16);
      }
      while (v129);
      v6 = v165;
      v22 = obja;
      v16 = v163;
      goto LABEL_73;
    }
    goto LABEL_74;
  }
  handleForCategory(0);
  v53 = objc_claimAutoreleasedReturnValue();
  v6 = v165;
  v16 = v163;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    sub_2145688A4();

  v54 = (void *)MEMORY[0x24BDD1540];
  v209 = *MEMORY[0x24BDD0FC8];
  v210 = CFSTR("Unable to challenge response");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v55, (uint64_t)&v210, (uint64_t)&v209, 1);
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v54, v56, (uint64_t)CFSTR("com.apple.corerepair"), -42, v22);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = 0;
LABEL_78:
  v5 = v159;
  v7 = v160;
  v61 = a3;
  v11 = v164;
LABEL_79:

  if (v61)
    *v61 = objc_retainAutorelease(v57);

  return v176;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->liveChMf, 0);
  objc_storeStrong((id *)&self->instance, 0);
}

@end
