@implementation CRPreflightController

- (void)preflightPhase1:(id)a3 withReply:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void (**v9)(id, uint64_t, void *, char *);
  void *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  NSString *v18;
  NSString *socksHost;
  NSObject *v20;
  NSString *v21;
  void *v22;
  const char *v23;
  NSNumber *v24;
  NSNumber *socksPort;
  NSObject *v26;
  NSNumber *v27;
  const char *v28;
  CRUserDefaults *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  const __CFString *v37;
  int v38;
  id v39;
  id v40;
  char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  const char *v46;
  int v47;
  char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  id v86;
  char *v87;
  const char *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  int isEqual;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  NSObject *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  void *v113;
  const char *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  void *v138;
  const char *v139;
  void *v140;
  void *v141;
  __CFString *v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  void *v156;
  uint8_t buf[4];
  void *v158;
  uint64_t v159;

  v159 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v9 = (void (**)(id, uint64_t, void *, char *))a4;
  if (v6)
  {
    objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)CFSTR("miniPreflight"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      self->_miniPreflight = objc_msgSend_BOOLFromKey_defaultValue_failed_(v6, v11, (uint64_t)CFSTR("miniPreflight"), 0, 0);
      handleForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_miniPreflight)
          v14 = CFSTR("YES");
        else
          v14 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v158 = (void *)v14;
        _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, "Mini preflight: %@", buf, 0xCu);
      }

    }
    objc_msgSend_objectForKeyedSubscript_(v6, v11, (uint64_t)CFSTR("socksHost"), v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend_NSStringFromKey_defaultValue_failed_(v6, v16, (uint64_t)CFSTR("socksHost"), 0, 0);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      socksHost = self->_socksHost;
      self->_socksHost = v18;

      handleForCategory(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->_socksHost;
        *(_DWORD *)buf = 138412290;
        v158 = v21;
        _os_log_impl(&dword_214503000, v20, OS_LOG_TYPE_DEFAULT, "Socks host: %@", buf, 0xCu);
      }

    }
    objc_msgSend_objectForKeyedSubscript_(v6, v16, (uint64_t)CFSTR("socksPort"), v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend_NSNumberFromKey_lowerBound_upperBound_defaultValue_failed_(v6, v23, (uint64_t)CFSTR("socksPort"), (uint64_t)&unk_24D1B7B90, &unk_24D1B7BA8, 0, 0);
      v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      socksPort = self->_socksPort;
      self->_socksPort = v24;

      handleForCategory(0);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = self->_socksPort;
        *(_DWORD *)buf = 138412290;
        v158 = v27;
        _os_log_impl(&dword_214503000, v26, OS_LOG_TYPE_DEFAULT, "Socks port: %@", buf, 0xCu);
      }

    }
  }
  if (os_variant_has_internal_content())
  {
    v29 = [CRUserDefaults alloc];
    v32 = (void *)objc_msgSend_initWithSuiteName_(v29, v30, (uint64_t)CFSTR("com.apple.corerepaird.test"), v31);
    objc_msgSend_stringForKey_(v32, v33, (uint64_t)CFSTR("AxiomURL"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      handleForCategory(0);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v158 = v35;
        _os_log_impl(&dword_214503000, v36, OS_LOG_TYPE_DEFAULT, "Overriding serverUrlString: %@", buf, 0xCu);
      }

      v37 = v35;
    }
    else
    {
      v37 = CFSTR("https://sklaxm.apple.com/axiom/SSR");
    }

  }
  else
  {
    v37 = CFSTR("https://sklaxm.apple.com/axiom/SSR");
  }
  v151 = 0;
  v152 = 0;
  v150 = 0;
  v38 = objc_msgSend_deltaComponents_strongComponents_error_(self, v28, (uint64_t)&v152, (uint64_t)&v151, &v150);
  v39 = v152;
  v40 = v151;
  v41 = (char *)v150;
  v45 = v41;
  v141 = v40;
  v142 = (__CFString *)v37;
  if (!v38 || !v39 || v41)
  {
    handleForCategory(0);
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      sub_214567AEC();
    v115 = 0;
    v86 = 0;
    v52 = 0;
    v116 = 0;
    v143 = 0;
    v144 = 0;
    goto LABEL_62;
  }
  if (!objc_msgSend_count(v39, v42, v43, v44))
  {
    handleForCategory(0);
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v104, OS_LOG_TYPE_DEFAULT, "No delta components", buf, 2u);
    }
    v115 = 0;
    v86 = 0;
    v52 = 0;
    v116 = 0;
    v143 = 0;
    v144 = 0;
LABEL_47:
    v45 = 0;
    v117 = 1;
    goto LABEL_63;
  }
  v148 = 0;
  v149 = 0;
  v147 = 0;
  v47 = objc_msgSend_issueRepairCert_keyBlob_error_(self, v46, (uint64_t)&v149, (uint64_t)&v148, &v147);
  v144 = v149;
  v143 = v148;
  v48 = (char *)v147;
  v45 = v48;
  if (!v47 || v48)
  {
    handleForCategory(0);
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      sub_214567C18();
    v115 = 0;
    v86 = 0;
    v52 = 0;
    goto LABEL_61;
  }
  objc_msgSend_request(CRPreflightRequest, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend_miniPreflight(self, v53, v54, v55);
  v59 = (void *)MEMORY[0x24BDBCF48];
  if (v56)
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v57, (uint64_t)CFSTR("%@/%@"), v58, v37, CFSTR("minipreflight/phase1"));
  else
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v57, (uint64_t)CFSTR("%@/%@"), v58, v37, CFSTR("fullpreflight/phase1"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLWithString_(v59, v61, (uint64_t)v60, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServer_(v52, v64, (uint64_t)v63, v65);

  objc_msgSend_UUID(MEMORY[0x24BDD1880], v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v69, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestID_(v52, v74, (uint64_t)v73, v75);

  objc_msgSend_objectAtIndexedSubscript_(v144, v76, 0, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBikCertificate_(v52, v79, (uint64_t)v78, v80);

  objc_msgSend_setComponents_(v52, v81, (uint64_t)v40, v82);
  objc_msgSend_setPhase_(v52, v83, (uint64_t)CFSTR("Phase1"), v84);
  v145 = 0;
  v146 = 0;
  LODWORD(v73) = objc_msgSend_sendRequest_response_keyBlob_error_(self, v85, (uint64_t)v52, (uint64_t)&v146, v143, &v145);
  v86 = v146;
  v87 = (char *)v145;
  v45 = v87;
  if (!(_DWORD)v73 || v87)
  {
    handleForCategory(0);
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      sub_214567B98(v52, v45, (uint64_t)v104, v118);
    goto LABEL_60;
  }
  if (!objc_msgSend_isErrorResponse_(self, v88, (uint64_t)v86, v89))
  {
    v119 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v115 = v119;
    if (v143)
      objc_msgSend_setObject_forKeyedSubscript_(v119, v120, (uint64_t)v143, (uint64_t)CFSTR("keyBlob"));
    objc_msgSend_createPEMFromCerts_(self, v120, (uint64_t)v144, v121);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (v116)
      objc_msgSend_setObject_forKeyedSubscript_(v115, v122, (uint64_t)v116, (uint64_t)CFSTR("baaCert"));
    objc_msgSend_rawResponse(v86, v122, v123, v124);
    v45 = (char *)objc_claimAutoreleasedReturnValue();

    if (!v45)
    {
      v117 = 1;
      if (!v9)
        goto LABEL_65;
      goto LABEL_64;
    }
    objc_msgSend_rawResponse(v86, v125, v126, v127);
    v104 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v115, v128, (uint64_t)v104, (uint64_t)CFSTR("responsePhase1"));
    goto LABEL_47;
  }
  handleForCategory(0);
  v90 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v90, OS_LOG_TYPE_ERROR))
    sub_214567B18(v52, v90, v91, v92);

  objc_msgSend_errorCode(v86, v93, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v96, v97, (uint64_t)CFSTR("10262"), v98);

  v140 = (void *)MEMORY[0x24BDD1540];
  if (isEqual)
  {
    v155 = *MEMORY[0x24BDD0FC8];
    v103 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_phase(v52, v100, v101, v102);
    v104 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_rawResponse(v86, v105, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v103, v109, (uint64_t)CFSTR("%@: Error response: %@"), v110, v104, v108);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = v111;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v112, (uint64_t)&v156, (uint64_t)&v155, 1);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v140, v114, (uint64_t)CFSTR("com.apple.corerepair"), -92, v113);
    v45 = (char *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v153 = *MEMORY[0x24BDD0FC8];
    v129 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_phase(v52, v100, v101, v102);
    v104 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_rawResponse(v86, v130, v131, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v129, v134, (uint64_t)CFSTR("%@: Error response: %@"), v135, v104, v133);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = v136;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v137, (uint64_t)&v154, (uint64_t)&v153, 1);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v140, v139, (uint64_t)CFSTR("com.apple.corerepair"), -78, v138);
    v45 = (char *)objc_claimAutoreleasedReturnValue();

  }
LABEL_60:
  v115 = 0;
LABEL_61:
  v116 = 0;
LABEL_62:
  v117 = 0;
LABEL_63:

  if (v9)
LABEL_64:
    v9[2](v9, v117, v115, v45);
LABEL_65:

}

- (void)preflightPhase2:(id)a3 withReply:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void (**v9)(id, uint64_t, id, char *);
  void *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  NSString *v28;
  NSString *socksHost;
  NSObject *v30;
  NSString *v31;
  void *v32;
  const char *v33;
  NSNumber *v34;
  NSNumber *socksPort;
  NSObject *v36;
  NSNumber *v37;
  const char *v38;
  CRUserDefaults *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  const __CFString *v47;
  NSObject *v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  char *v53;
  uint64_t v54;
  int v55;
  id v56;
  char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  CRPreflightResponse *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  int v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  char *v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  const char *v169;
  void *v170;
  const char *v171;
  const char *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t i;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  char v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  const char *v218;
  void *v219;
  const char *v220;
  const char *v221;
  void *v222;
  const char *v223;
  const char *v224;
  void *v225;
  const char *v226;
  const char *v227;
  void *v228;
  const char *v229;
  const char *v230;
  void *v231;
  const char *v232;
  const char *v233;
  const char *v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  void *v240;
  const char *v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  const char *v245;
  void *v246;
  const char *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  int isEqual;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  __CFString *v258;
  id v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  id v264;
  id v265;
  id v266;
  id v267;
  id v268;
  id v269;
  id v270;
  char v271;
  uint64_t v272;
  void *v273;
  uint64_t v274;
  void *v275;
  _BYTE v276[128];
  uint64_t v277;
  void *v278;
  uint64_t v279;
  void *v280;
  uint64_t v281;
  void *v282;
  uint8_t buf[4];
  uint64_t v284;
  uint64_t v285;

  v285 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v9 = (void (**)(id, uint64_t, id, char *))a4;
  v271 = 0;
  if (!v6)
  {
    v18 = 0;
    v20 = 0;
LABEL_35:
    v257 = (void *)v20;
    handleForCategory(0);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      sub_214567C78();
    v49 = 0;
    v256 = 0;
    v50 = 0;
    v51 = 0;
    v52 = 0;
    v53 = 0;
    v54 = 0;
    v258 = CFSTR("https://sklaxm.apple.com/axiom/SSR");
    v259 = 0;
    goto LABEL_70;
  }
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)CFSTR("miniPreflight"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    self->_miniPreflight = objc_msgSend_BOOLFromKey_defaultValue_failed_(v6, v11, (uint64_t)CFSTR("miniPreflight"), 0, &v271);
    handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_miniPreflight)
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v284 = (uint64_t)v14;
      _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, "Mini preflight: %@", buf, 0xCu);
    }

  }
  objc_msgSend_objectForKeyedSubscript_(v6, v11, (uint64_t)CFSTR("keyBlob"), v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend_NSDataFromKey_defaultValue_failed_(v6, v16, (uint64_t)CFSTR("keyBlob"), 0, &v271);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    handleForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v284 = (uint64_t)v18;
      _os_log_impl(&dword_214503000, v19, OS_LOG_TYPE_DEFAULT, "keyBlob input: %@", buf, 0xCu);
    }

  }
  else
  {
    v18 = 0;
  }
  objc_msgSend_objectForKeyedSubscript_(v6, v16, (uint64_t)CFSTR("responsePhase1"), v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend_NSDictionaryFromKey_defaultValue_failed_(v6, v22, (uint64_t)CFSTR("responsePhase1"), 0, &v271);
    v20 = objc_claimAutoreleasedReturnValue();
    handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v284 = v20;
      _os_log_impl(&dword_214503000, v24, OS_LOG_TYPE_DEFAULT, "responsePhase1 input: %@", buf, 0xCu);
    }

  }
  else
  {
    v20 = 0;
  }
  objc_msgSend_objectForKeyedSubscript_(v6, v22, (uint64_t)CFSTR("socksHost"), v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend_NSStringFromKey_defaultValue_failed_(v6, v26, (uint64_t)CFSTR("socksHost"), 0, 0);
    v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    socksHost = self->_socksHost;
    self->_socksHost = v28;

    handleForCategory(0);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = self->_socksHost;
      *(_DWORD *)buf = 138412290;
      v284 = (uint64_t)v31;
      _os_log_impl(&dword_214503000, v30, OS_LOG_TYPE_DEFAULT, "Socks host: %@", buf, 0xCu);
    }

  }
  objc_msgSend_objectForKeyedSubscript_(v6, v26, (uint64_t)CFSTR("socksPort"), v27);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend_NSNumberFromKey_lowerBound_upperBound_defaultValue_failed_(v6, v33, (uint64_t)CFSTR("socksPort"), (uint64_t)&unk_24D1B7B90, &unk_24D1B7BA8, 0, 0);
    v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    socksPort = self->_socksPort;
    self->_socksPort = v34;

    handleForCategory(0);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = self->_socksPort;
      *(_DWORD *)buf = 138412290;
      v284 = (uint64_t)v37;
      _os_log_impl(&dword_214503000, v36, OS_LOG_TYPE_DEFAULT, "Socks port: %@", buf, 0xCu);
    }

  }
  if (!v18 || !v20)
    goto LABEL_35;
  if (os_variant_has_internal_content())
  {
    v39 = [CRUserDefaults alloc];
    v42 = (void *)objc_msgSend_initWithSuiteName_(v39, v40, (uint64_t)CFSTR("com.apple.corerepaird.test"), v41);
    objc_msgSend_stringForKey_(v42, v43, (uint64_t)CFSTR("AxiomURL"), v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      handleForCategory(0);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v284 = (uint64_t)v45;
        _os_log_impl(&dword_214503000, v46, OS_LOG_TYPE_DEFAULT, "Overriding serverUrlString: %@", buf, 0xCu);
      }

      v47 = v45;
    }
    else
    {
      v47 = CFSTR("https://sklaxm.apple.com/axiom/SSR");
    }

  }
  else
  {
    v47 = CFSTR("https://sklaxm.apple.com/axiom/SSR");
  }
  v269 = 0;
  v270 = 0;
  v268 = 0;
  v55 = objc_msgSend_deltaComponents_strongComponents_error_(self, v38, (uint64_t)&v270, (uint64_t)&v269, &v268);
  v50 = v270;
  v56 = v269;
  v57 = (char *)v268;
  v53 = v57;
  v257 = (void *)v20;
  v258 = (__CFString *)v47;
  v256 = v56;
  if (!v55 || !v50 || v57)
  {
    handleForCategory(0);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      sub_214567AEC();
    v49 = 0;
    v259 = 0;
    v51 = 0;
    goto LABEL_52;
  }
  if (!objc_msgSend_count(v50, v58, v59, v60))
  {
    handleForCategory(0);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v48, OS_LOG_TYPE_DEFAULT, "No delta components", buf, 2u);
    }
    v49 = 0;
    v259 = 0;
    v51 = 0;
    v52 = 0;
    v53 = 0;
    v54 = 1;
    goto LABEL_70;
  }
  v61 = [CRPreflightResponse alloc];
  v51 = (id)objc_msgSend_initWithDictionary_(v61, v62, v20, v63);
  objc_msgSend_componentChallenges(v51, v64, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v67)
  {
    v259 = 0;
    goto LABEL_57;
  }
  objc_msgSend_componentChallenges(v51, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v266 = 0;
  v267 = 0;
  v73 = objc_msgSend_challengeStrongComponents_responses_error_(self, v72, (uint64_t)v71, (uint64_t)&v267, &v266);
  v259 = v267;
  v53 = (char *)v266;

  if (!v73 || v53)
  {
    handleForCategory(0);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      sub_214567CA4();
    v49 = 0;
LABEL_52:
    v52 = 0;
LABEL_69:
    v54 = 0;
    goto LABEL_70;
  }
  v47 = v258;
LABEL_57:
  objc_msgSend_request(CRPreflightRequest, v68, v69, v70);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend_miniPreflight(self, v74, v75, v76);
  v80 = (void *)MEMORY[0x24BDBCF48];
  if (v77)
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v78, (uint64_t)CFSTR("%@/%@"), v79, v47, CFSTR("minipreflight/phase2"));
  else
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v78, (uint64_t)CFSTR("%@/%@"), v79, v47, CFSTR("fullpreflight/phase2"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLWithString_(v80, v82, (uint64_t)v81, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServer_(v52, v85, (uint64_t)v84, v86);

  objc_msgSend_requestID(v51, v87, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestID_(v52, v91, (uint64_t)v90, v92);

  objc_msgSend_sessionID(v51, v93, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSessionID_(v52, v97, (uint64_t)v96, v98);

  objc_msgSend_setComponents_(v52, v99, (uint64_t)v50, v100);
  objc_msgSend_setComponentResponses_(v52, v101, (uint64_t)v259, v102);
  objc_msgSend_activationChallenges(v51, v103, v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setActivationResponses_(v52, v107, (uint64_t)v106, v108);

  objc_msgSend_signatureChallenge(v51, v109, v110, v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSignatureChallenge_(v52, v113, (uint64_t)v112, v114);

  objc_msgSend_setPhase_(v52, v115, (uint64_t)CFSTR("Phase2"), v116);
  v264 = 0;
  v265 = 0;
  LODWORD(v81) = objc_msgSend_sendRequest_response_keyBlob_error_(self, v117, (uint64_t)v52, (uint64_t)&v265, v18, &v264);
  v51 = v265;
  v118 = (char *)v264;
  v53 = v118;
  if (!(_DWORD)v81 || v118)
  {
    handleForCategory(0);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      sub_214567B98(v52, v53, (uint64_t)v48, v140);
    goto LABEL_68;
  }
  if (objc_msgSend_isErrorResponse_(self, v119, (uint64_t)v51, v120))
  {
    handleForCategory(0);
    v124 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v124, OS_LOG_TYPE_ERROR))
      sub_214567B18(v52, v124, v125, v126);

    v251 = (void *)MEMORY[0x24BDD1540];
    v281 = *MEMORY[0x24BDD0FC8];
    v127 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_phase(v52, v128, v129, v130);
    v48 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_rawResponse(v51, v131, v132, v133);
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v127, v134, (uint64_t)CFSTR("%@: Error response: %@"), v135, v48, v250);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v282 = v136;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v137, (uint64_t)&v282, (uint64_t)&v281, 1);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v251, v139, (uint64_t)CFSTR("com.apple.corerepair"), -79, v138);
    v53 = (char *)objc_claimAutoreleasedReturnValue();

    goto LABEL_68;
  }
  objc_msgSend_status(v51, v121, v122, v123);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqual_(v141, v142, (uint64_t)CFSTR("200"), v143) & 1) != 0)
  {
    objc_msgSend_details(v51, v144, v145, v146);
    v147 = (void *)objc_claimAutoreleasedReturnValue();

    if (v147)
    {
      v252 = (void *)MEMORY[0x24BDD1540];
      v279 = *MEMORY[0x24BDD0FC8];
      v151 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_details(v51, v148, v149, v150);
      v48 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v151, v152, (uint64_t)CFSTR("Success status, but with failure details: %@"), v153, v48);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v280 = v154;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v155, (uint64_t)&v280, (uint64_t)&v279, 1);
LABEL_83:
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v252, v171, (uint64_t)CFSTR("com.apple.corerepair"), -79, v170);
      v53 = (char *)objc_claimAutoreleasedReturnValue();

LABEL_68:
      v49 = 0;
      goto LABEL_69;
    }
  }
  else
  {

  }
  objc_msgSend_status(v51, v148, v149, v150);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqual_(v156, v157, (uint64_t)CFSTR("207"), v158) & 1) != 0)
  {
    objc_msgSend_details(v51, v159, v160, v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v162)
    {
      v252 = (void *)MEMORY[0x24BDD1540];
      v277 = *MEMORY[0x24BDD0FC8];
      v166 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_details(v51, v163, v164, v165);
      v48 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v166, v167, (uint64_t)CFSTR("Partial success status, but without failure details: %@"), v168, v48);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v278 = v154;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v169, (uint64_t)&v278, (uint64_t)&v277, 1);
      goto LABEL_83;
    }
  }
  else
  {

  }
  v49 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend_setObject_forKeyedSubscript_(v49, v172, (uint64_t)v18, (uint64_t)CFSTR("keyBlob"));
  objc_msgSend_status(v51, v173, v174, v175);
  v176 = (void *)objc_claimAutoreleasedReturnValue();

  if (v176)
  {
    objc_msgSend_status(v51, v177, v178, v179);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v49, v181, (uint64_t)v180, (uint64_t)CFSTR("status"));

  }
  objc_msgSend_details(v51, v177, v178, v179);
  v182 = (void *)objc_claimAutoreleasedReturnValue();

  if (v182)
  {
    objc_msgSend_details(v51, v183, v184, v185);
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v49, v187, (uint64_t)v186, (uint64_t)CFSTR("details"));

  }
  objc_msgSend_status(v51, v183, v184, v185);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqual_(v188, v189, (uint64_t)CFSTR("200"), v190))
  {

  }
  else
  {
    objc_msgSend_status(v51, v191, v192, v193);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v194, v195, (uint64_t)CFSTR("207"), v196);

    if (!isEqual)
    {
      v255 = (void *)MEMORY[0x24BDD1540];
      v272 = *MEMORY[0x24BDD0FC8];
      v242 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_status(v51, v197, v198, v199);
      v48 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v242, v243, (uint64_t)CFSTR("Server response: %@"), v244, v48);
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      v273 = v249;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v245, (uint64_t)&v273, (uint64_t)&v272, 1);
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v255, v247, (uint64_t)CFSTR("com.apple.corerepair"), -79, v246);
      v53 = (char *)objc_claimAutoreleasedReturnValue();

      goto LABEL_69;
    }
  }
  v254 = v18;
  v262 = 0u;
  v263 = 0u;
  v260 = 0u;
  v261 = 0u;
  v50 = v50;
  v201 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v200, (uint64_t)&v260, (uint64_t)v276, 16);
  if (v201)
  {
    v204 = v201;
    v205 = *(_QWORD *)v261;
    do
    {
      for (i = 0; i != v204; ++i)
      {
        if (*(_QWORD *)v261 != v205)
          objc_enumerationMutation(v50);
        objc_msgSend_setState_(*(void **)(*((_QWORD *)&v260 + 1) + 8 * i), v202, 1, v203);
      }
      v204 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v202, (uint64_t)&v260, (uint64_t)v276, 16);
    }
    while (v204);
  }

  objc_msgSend_details(v51, v207, v208, v209);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v212 = objc_msgSend_setComponentsState_withResponseDetails_(self, v211, (uint64_t)v50, (uint64_t)v210);

  if ((v212 & 1) != 0)
  {
    v54 = 1;
    objc_msgSend_components_withState_(self, v213, (uint64_t)v50, 1);
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v49, v217, (uint64_t)v216, (uint64_t)CFSTR("passComponents"));

    objc_msgSend_components_withState_(self, v218, (uint64_t)v50, 2);
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v49, v220, (uint64_t)v219, (uint64_t)CFSTR("unauthComponents"));

    objc_msgSend_components_withState_(self, v221, (uint64_t)v50, 3);
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v49, v223, (uint64_t)v222, (uint64_t)CFSTR("lockComponents"));

    objc_msgSend_components_withState_(self, v224, (uint64_t)v50, 6);
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v49, v226, (uint64_t)v225, (uint64_t)CFSTR("failComponents"));

    objc_msgSend_components_withState_(self, v227, (uint64_t)v50, 5);
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v49, v229, (uint64_t)v228, (uint64_t)CFSTR("lostComponents"));

    objc_msgSend_components_withState_(self, v230, (uint64_t)v50, 4);
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v49, v232, (uint64_t)v231, (uint64_t)CFSTR("deniedComponents"));

    objc_msgSend_components_withState_(self, v233, (uint64_t)v50, 7);
    v48 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v49, v234, (uint64_t)v48, (uint64_t)CFSTR("sealedComponents"));
    v53 = 0;
  }
  else
  {
    v248 = (void *)MEMORY[0x24BDD1540];
    v274 = *MEMORY[0x24BDD0FC8];
    v235 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_details(v51, v213, v214, v215);
    v48 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v235, v236, (uint64_t)CFSTR("Failed to set components status: %@"), v237, v48);
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    v275 = v238;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v239, (uint64_t)&v275, (uint64_t)&v274, 1);
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v248, v241, (uint64_t)CFSTR("com.apple.corerepair"), -79, v240);
    v53 = (char *)objc_claimAutoreleasedReturnValue();

    v54 = 0;
  }
  v18 = v254;
LABEL_70:

  if (v9)
    v9[2](v9, v54, v49, v53);

}

- (void)preflight:(id)a3 withReply:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(id, _QWORD, uint64_t, uint64_t);
  uint64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  _QWORD v27[7];
  _QWORD v28[7];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;

  v6 = a3;
  v10 = (void (**)(id, _QWORD, uint64_t, uint64_t))a4;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_21450EFCC;
  v39 = sub_21450EFDC;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_21450EFCC;
  v33 = sub_21450EFDC;
  v34 = 0;
  if (v6)
    v11 = objc_msgSend_mutableCopy(v6, v7, v8, v9);
  else
    v11 = objc_opt_new();
  v13 = (void *)v11;
  v14 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = sub_21450EFE4;
  v28[3] = &unk_24D1A9F38;
  v28[4] = &v41;
  v28[5] = &v29;
  v28[6] = &v35;
  objc_msgSend_preflightPhase1_withReply_(self, v12, v11, (uint64_t)v28);
  if (*((_BYTE *)v42 + 24) && !v36[5])
  {
    objc_msgSend_objectForKeyedSubscript_((void *)v30[5], v15, (uint64_t)CFSTR("keyBlob"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend_objectForKeyedSubscript_((void *)v30[5], v18, (uint64_t)CFSTR("keyBlob"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v13, v21, (uint64_t)v20, (uint64_t)CFSTR("keyBlob"));

    }
    objc_msgSend_objectForKeyedSubscript_((void *)v30[5], v18, (uint64_t)CFSTR("responsePhase1"), v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend_objectForKeyedSubscript_((void *)v30[5], v23, (uint64_t)CFSTR("responsePhase1"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v13, v26, (uint64_t)v25, (uint64_t)CFSTR("responsePhase1"));

    }
    v27[0] = v14;
    v27[1] = 3221225472;
    v27[2] = sub_21450F050;
    v27[3] = &unk_24D1A9F38;
    v27[4] = &v41;
    v27[5] = &v29;
    v27[6] = &v35;
    objc_msgSend_preflightPhase2_withReply_(self, v23, (uint64_t)v13, (uint64_t)v27);
  }
  if (v10)
    v10[2](v10, *((unsigned __int8 *)v42 + 24), v30[5], v36[5]);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

}

- (id)sign:(id)a3 keyBlob:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  NSXPCConnection *v10;
  NSXPCConnection *connectionToService;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  id v24;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v7 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_21450EFCC;
  v31 = sub_21450EFDC;
  v32 = 0;
  v8 = objc_alloc(MEMORY[0x24BDD1988]);
  v10 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v8, v9, (uint64_t)CFSTR("com.apple.corerepair.preflightControl"), 0);
  connectionToService = self->_connectionToService;
  self->_connectionToService = v10;

  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v12, (uint64_t)&unk_254D80218, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteObjectInterface_(self->_connectionToService, v15, (uint64_t)v14, v16);

  objc_msgSend_resume(self->_connectionToService, v17, v18, v19);
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_connectionToService, v20, (uint64_t)&unk_24D1A9F78, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_21450F280;
  v26[3] = &unk_24D1A9FA0;
  v26[4] = self;
  v26[5] = &v27;
  objc_msgSend_sign_keyBlob_withReply_(v22, v23, (uint64_t)v6, (uint64_t)v7, v26);

  v24 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v24;
}

- (BOOL)verify:(id)a3 signature:(id)a4 keyBlob:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  NSXPCConnection *v13;
  NSXPCConnection *connectionToService;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v11 = objc_alloc(MEMORY[0x24BDD1988]);
  v13 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v11, v12, (uint64_t)CFSTR("com.apple.corerepair.preflightControl"), 0);
  connectionToService = self->_connectionToService;
  self->_connectionToService = v13;

  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v15, (uint64_t)&unk_254D80218, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteObjectInterface_(self->_connectionToService, v18, (uint64_t)v17, v19);

  objc_msgSend_resume(self->_connectionToService, v20, v21, v22);
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_connectionToService, v23, (uint64_t)&unk_24D1A9FC0, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = sub_21450F51C;
  v28[3] = &unk_24D1A9FE8;
  v28[4] = self;
  v28[5] = &v29;
  objc_msgSend_verify_signature_keyBlob_withReply_(v25, v26, (uint64_t)v8, (uint64_t)v9, v10, v28);

  LOBYTE(self) = *((_BYTE *)v30 + 24);
  _Block_object_dispose(&v29, 8);

  return (char)self;
}

- (id)components:(id)a3 withState:(int64_t)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  id v23;
  const char *v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v37 = (id)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v6 = v5;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(v6);
        v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend_state(v15, v9, v10, v11) == a4)
        {
          v16 = objc_alloc(MEMORY[0x24BDBCE50]);
          objc_msgSend_identifier(v15, v17, v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend_initWithBase64EncodedString_options_(v16, v21, (uint64_t)v20, 0);

          v23 = objc_alloc(MEMORY[0x24BDD17C8]);
          v25 = (void *)objc_msgSend_initWithData_encoding_(v23, v24, (uint64_t)v22, 4);
          v26 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend_type(v15, v27, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v26, v31, (uint64_t)CFSTR("%@-%@"), v32, v30, v25);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_addObject_(v37, v34, (uint64_t)v33, v35);
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v38, (uint64_t)v42, 16);
    }
    while (v12);
  }

  return v37;
}

- (BOOL)setComponentsState:(id)a3 withResponseDetails:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  BOOL v25;
  BOOL v26;
  int v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  int isEqual;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  int v58;
  const char *v59;
  BOOL v60;
  NSObject *v61;
  __int128 v63;
  id v64;
  uint64_t v65;
  NSObject *v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  int v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t v82[128];
  uint8_t buf[4];
  id v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    handleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v7, OS_LOG_TYPE_DEFAULT, "no details in response", buf, 2u);
    }
    goto LABEL_50;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    handleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_214567E24();
    v60 = 0;
    goto LABEL_59;
  }
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v7 = v6;
  v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v78, (uint64_t)v85, 16);
  if (!v69)
  {
LABEL_50:
    v60 = 1;
    goto LABEL_59;
  }
  v64 = v6;
  v10 = *(_QWORD *)v79;
  *(_QWORD *)&v9 = 138412290;
  v63 = v9;
  v66 = v7;
  v67 = v5;
  v65 = *(_QWORD *)v79;
  while (2)
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v79 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        handleForCategory(0);
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          sub_214567DC4();

LABEL_57:
        v60 = 0;
        goto LABEL_58;
      }
      v13 = v12;
      objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)CFSTR("Type"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v13, v17, (uint64_t)CFSTR("Identifier"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v13, v20, (uint64_t)CFSTR("status"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        v25 = v19 == 0;
      else
        v25 = 1;
      v26 = v25 || v22 == 0;
      v27 = !v26;
      v72 = v27;
      v70 = v11;
      v71 = v22;
      if (v26)
      {
        handleForCategory(0);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v63;
          v84 = v13;
          _os_log_error_impl(&dword_214503000, v32, OS_LOG_TYPE_ERROR, "details item in response malformed: %@", buf, 0xCu);
        }
      }
      else
      {
        v28 = v22;
        v68 = v13;
        if ((objc_msgSend_isEqual_(v22, v23, (uint64_t)CFSTR("10230"), v24) & 1) != 0)
        {
          v31 = 2;
        }
        else if ((objc_msgSend_isEqual_(v28, v29, (uint64_t)CFSTR("10260"), v30) & 1) != 0)
        {
          v31 = 3;
        }
        else if ((objc_msgSend_isEqual_(v28, v33, (uint64_t)CFSTR("10261"), v34) & 1) != 0)
        {
          v31 = 4;
        }
        else if ((objc_msgSend_isEqual_(v28, v35, (uint64_t)CFSTR("10262"), v36) & 1) != 0)
        {
          v31 = 5;
        }
        else
        {
          isEqual = objc_msgSend_isEqual_(v28, v37, (uint64_t)CFSTR("20100"), v38);
          v31 = 6;
          if (isEqual)
            v31 = 7;
        }
        v73 = v31;
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v32 = v5;
        v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v40, (uint64_t)&v74, (uint64_t)v82, 16);
        if (v41)
        {
          v45 = v41;
          v46 = *(_QWORD *)v75;
          do
          {
            for (i = 0; i != v45; ++i)
            {
              if (*(_QWORD *)v75 != v46)
                objc_enumerationMutation(v32);
              v48 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
              objc_msgSend_type(v48, v42, v43, v44, v63);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend_isEqual_(v49, v50, (uint64_t)v16, v51) & 1) != 0)
              {
                objc_msgSend_identifier(v48, v52, v53, v54);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = objc_msgSend_isEqual_(v55, v56, (uint64_t)v19, v57);

                if (v58)
                  objc_msgSend_setState_(v48, v42, v73, v44);
              }
              else
              {

              }
            }
            v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v42, (uint64_t)&v74, (uint64_t)v82, 16);
          }
          while (v45);
          v7 = v66;
          v5 = v67;
          v10 = v65;
        }
        v13 = v68;
      }

      if (!v72)
        goto LABEL_57;
      v11 = v70 + 1;
    }
    while (v70 + 1 != v69);
    v60 = 1;
    v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v59, (uint64_t)&v78, (uint64_t)v85, 16);
    if (v69)
      continue;
    break;
  }
LABEL_58:
  v6 = v64;
LABEL_59:

  return v60;
}

- (BOOL)deltaComponents:(id *)a3 strongComponents:(id *)a4 error:(id *)a5
{
  const char *v9;
  char RepairDelta_error;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  BOOL v31;
  uint64_t v32;
  CRPreflightRequestComponent *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  id *v48;
  id *v49;
  id v50;
  BOOL v51;
  id v52;
  void *v53;
  id v54;
  uint64_t v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  id v66;
  uint8_t v67[128];
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v54 = (id)objc_opt_new();
  v53 = (void *)objc_opt_new();
  v65 = 0;
  v66 = 0;
  RepairDelta_error = objc_msgSend_queryRepairDelta_error_(self, v9, (uint64_t)&v66, (uint64_t)&v65);
  v11 = v66;
  v12 = v65;
  v13 = v12;
  if (v12)
    v14 = 0;
  else
    v14 = RepairDelta_error;
  if (!v14)
  {
    handleForCategory(0);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      sub_214567F18();

    v45 = v13;
    if (!a5)
      goto LABEL_41;
LABEL_40:
    *a5 = objc_retainAutorelease(v45);
    goto LABEL_41;
  }
  v48 = a3;
  v49 = a4;
  v50 = v12;
  v51 = v14;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v52 = v11;
  obj = v11;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v61, (uint64_t)v76, 16);
  if (v16)
  {
    v19 = v16;
    v20 = *(_QWORD *)v62;
    do
    {
      v21 = 0;
      v55 = v19;
      do
      {
        if (*(_QWORD *)v62 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v21);
        objc_msgSend_objectForKeyedSubscript_(v22, v17, (uint64_t)CFSTR("key"), v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v22, v24, (uint64_t)CFSTR("identifier"), v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v22, v27, (uint64_t)CFSTR("asid"), v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        handleForCategory(0);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v69 = "-[CRPreflightController deltaComponents:strongComponents:error:]";
          v70 = 2112;
          v71 = v23;
          v72 = 2112;
          v73 = v26;
          v74 = 2112;
          v75 = v29;
          _os_log_debug_impl(&dword_214503000, v30, OS_LOG_TYPE_DEBUG, "%s: key: %@ identifier: %@ asid: %@", buf, 0x2Au);
        }

        if (v23)
          v31 = v26 == 0;
        else
          v31 = 1;
        if (!v31)
        {
          v32 = v20;
          v33 = [CRPreflightRequestComponent alloc];
          v35 = (void *)objc_msgSend_initWithComponentType_identifier_asid_(v33, v34, (uint64_t)v23, (uint64_t)v26, v29);
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B84E8, v36, (uint64_t)&v57, (uint64_t)v67, 16);
          if (v37)
          {
            v40 = v37;
            v41 = *(_QWORD *)v58;
            while (2)
            {
              for (i = 0; i != v40; ++i)
              {
                if (*(_QWORD *)v58 != v41)
                  objc_enumerationMutation(&unk_24D1B84E8);
                if (objc_msgSend_isEqual_(*(void **)(*((_QWORD *)&v57 + 1) + 8 * i), v38, (uint64_t)v23, v39))
                {
                  objc_msgSend_addObject_(v53, v38, (uint64_t)v35, v39);
                  goto LABEL_26;
                }
              }
              v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B84E8, v38, (uint64_t)&v57, (uint64_t)v67, 16);
              if (v40)
                continue;
              break;
            }
          }
LABEL_26:
          objc_msgSend_addObject_(v54, v38, (uint64_t)v35, v39);

          v20 = v32;
          v19 = v55;
        }

        ++v21;
      }
      while (v21 != v19);
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v61, (uint64_t)v76, 16);
    }
    while (v19);
  }

  handleForCategory(0);
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    sub_214567EB4();

  handleForCategory(0);
  v44 = objc_claimAutoreleasedReturnValue();
  v11 = v52;
  v14 = v51;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    sub_214567E50();

  v13 = v50;
  if (v48)
    *v48 = objc_retainAutorelease(v54);
  v45 = v53;
  a5 = v49;
  if (v49)
    goto LABEL_40;
LABEL_41:

  return v14;
}

- (BOOL)queryRepairDelta:(id *)a3 error:(id *)a4
{
  id v7;
  const char *v8;
  NSXPCConnection *v9;
  NSXPCConnection *connectionToService;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
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
  NSXPCConnection *v33;
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
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;

  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = sub_21450EFCC;
  v58 = sub_21450EFDC;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = sub_21450EFCC;
  v52 = sub_21450EFDC;
  v53 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v7 = objc_alloc(MEMORY[0x24BDD1988]);
  v9 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v7, v8, (uint64_t)CFSTR("com.apple.corerepair.preflightControl"), 0);
  connectionToService = self->_connectionToService;
  self->_connectionToService = v9;

  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v11, (uint64_t)&unk_254D80218, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteObjectInterface_(self->_connectionToService, v14, (uint64_t)v13, v15);

  v16 = (void *)MEMORY[0x24BDBCF20];
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend_setWithObjects_(v16, v22, v17, v23, v18, v19, v20, v21, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteObjectInterface(self->_connectionToService, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v28, v29, (uint64_t)v24, (uint64_t)sel_queryRepairDeltaWithReply_, 1, 1);

  objc_msgSend_resume(self->_connectionToService, v30, v31, v32);
  v33 = self->_connectionToService;
  v34 = MEMORY[0x24BDAC760];
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = sub_214510330;
  v43[3] = &unk_24D1AA010;
  v43[4] = &v48;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v33, v35, (uint64_t)v43, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v34;
  v42[1] = 3221225472;
  v42[2] = sub_2145103A0;
  v42[3] = &unk_24D1AA038;
  v42[6] = &v54;
  v42[7] = &v48;
  v42[4] = self;
  v42[5] = &v44;
  objc_msgSend_queryRepairDeltaWithReply_(v37, v38, (uint64_t)v42, v39);

  if (a3)
    *a3 = objc_retainAutorelease((id)v55[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v49[5]);
  v40 = *((_BYTE *)v45 + 24);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  return v40;
}

- (BOOL)issueRepairCert:(id *)a3 keyBlob:(id *)a4 error:(id *)a5
{
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  id v31;
  const char *v32;
  NSXPCConnection *v33;
  NSXPCConnection *connectionToService;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  NSXPCConnection *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  char v49;
  _QWORD v51[9];
  _QWORD v52[5];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;

  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = sub_21450EFCC;
  v73 = sub_21450EFDC;
  v74 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = sub_21450EFCC;
  v67 = sub_21450EFDC;
  v68 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = sub_21450EFCC;
  v61 = sub_21450EFDC;
  v62 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v9 = (void *)objc_opt_new();
  if (objc_msgSend_miniPreflight(self, v10, v11, v12))
    objc_msgSend_setObject_forKeyedSubscript_(v9, v13, MEMORY[0x24BDBD1C8], (uint64_t)CFSTR("miniPreflight"));
  objc_msgSend_socksHost(self, v13, v14, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend_socksPort(self, v16, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend_socksHost(self, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v9, v25, (uint64_t)v24, (uint64_t)CFSTR("socksHost"));

      objc_msgSend_socksPort(self, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v9, v30, (uint64_t)v29, (uint64_t)CFSTR("socksPort"));

    }
  }
  v31 = objc_alloc(MEMORY[0x24BDD1988]);
  v33 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v31, v32, (uint64_t)CFSTR("com.apple.corerepair.preflightControl"), 0);
  connectionToService = self->_connectionToService;
  self->_connectionToService = v33;

  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v35, (uint64_t)&unk_254D80218, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteObjectInterface_(self->_connectionToService, v38, (uint64_t)v37, v39);

  objc_msgSend_resume(self->_connectionToService, v40, v41, v42);
  v43 = self->_connectionToService;
  v44 = MEMORY[0x24BDAC760];
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = sub_214510848;
  v52[3] = &unk_24D1AA010;
  v52[4] = &v57;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v43, v45, (uint64_t)v52, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v44;
  v51[1] = 3221225472;
  v51[2] = sub_2145108B8;
  v51[3] = &unk_24D1AA060;
  v51[6] = &v63;
  v51[7] = &v69;
  v51[8] = &v57;
  v51[4] = self;
  v51[5] = &v53;
  objc_msgSend_issueRepairCert_withReply_(v47, v48, (uint64_t)v9, (uint64_t)v51);

  if (a3)
    *a3 = objc_retainAutorelease((id)v70[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v64[5]);
  if (a5)
    *a5 = objc_retainAutorelease((id)v58[5]);
  v49 = *((_BYTE *)v54 + 24);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v69, 8);

  return v49;
}

- (BOOL)challengeStrongComponents:(id)a3 responses:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  char v45;
  _QWORD v47[8];
  _QWORD v48[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;

  v8 = a3;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = sub_21450EFCC;
  v63 = sub_21450EFDC;
  v64 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = sub_21450EFCC;
  v53 = sub_21450EFDC;
  v54 = 0;
  v9 = (void *)objc_opt_new();
  objc_msgSend_setObject_forKeyedSubscript_(v9, v10, (uint64_t)v8, (uint64_t)CFSTR("challenges"));
  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend_setWithObjects_(v11, v16, v12, v17, v13, v14, v15, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc(MEMORY[0x24BDD1988]);
  v21 = (void *)objc_msgSend_initWithMachServiceName_options_(v19, v20, (uint64_t)CFSTR("com.apple.corerepair.preflightControl"), 0);
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v22, (uint64_t)&unk_254D80218, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteObjectInterface_(v21, v25, (uint64_t)v24, v26);

  objc_msgSend_remoteObjectInterface(v21, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v30, v31, (uint64_t)v18, (uint64_t)sel_challengeStrongComponents_withReply_, 0, 0);

  objc_msgSend_remoteObjectInterface(v21, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v35, v36, (uint64_t)v18, (uint64_t)sel_challengeStrongComponents_withReply_, 1, 1);

  objc_msgSend_resume(v21, v37, v38, v39);
  v40 = MEMORY[0x24BDAC760];
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = sub_214510D70;
  v48[3] = &unk_24D1AA010;
  v48[4] = &v59;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v21, v41, (uint64_t)v48, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v40;
  v47[1] = 3221225472;
  v47[2] = sub_214510DE0;
  v47[3] = &unk_24D1AA038;
  v47[6] = &v59;
  v47[7] = &v49;
  v47[4] = self;
  v47[5] = &v55;
  objc_msgSend_challengeStrongComponents_withReply_(v43, v44, (uint64_t)v9, (uint64_t)v47);

  if (a5)
    *a5 = objc_retainAutorelease((id)v60[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v50[5]);
  v45 = *((_BYTE *)v56 + 24);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);

  return v45;
}

- (BOOL)sendRequest:(id)a3 response:(id *)a4 keyBlob:(id)a5 error:(id *)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v38;
  NSObject *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  BOOL v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  NSObject *v104;
  void *v105;
  NSObject *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  id v114;
  NSObject *v115;
  CRPreflightResponse *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  NSObject *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  NSObject *v128;
  void *v129;
  void *v131;
  NSObject *queue;
  void *v133;
  void *v134;
  id v135;
  id v136;
  _QWORD block[6];
  _QWORD v138[8];
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  char v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  uint64_t (*v146)(uint64_t, uint64_t);
  void (*v147)(uint64_t);
  id v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t (*v152)(uint64_t, uint64_t);
  void (*v153)(uint64_t);
  id v154;
  uint64_t v155;
  uint64_t *v156;
  uint64_t v157;
  uint64_t (*v158)(uint64_t, uint64_t);
  void (*v159)(uint64_t);
  id v160;
  uint64_t v161;
  uint64_t *v162;
  uint64_t v163;
  uint64_t (*v164)(uint64_t, uint64_t);
  void (*v165)(uint64_t);
  dispatch_group_t v166;
  uint8_t v167[4];
  NSObject *v168;
  _QWORD v169[3];
  _QWORD v170[3];
  uint8_t buf[32];
  _BYTE v172[16];
  uint64_t v173;

  v173 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v135 = a5;
  dispatch_get_global_queue(0, 0);
  queue = objc_claimAutoreleasedReturnValue();
  v161 = 0;
  v162 = &v161;
  v163 = 0x3032000000;
  v164 = sub_21450EFCC;
  v165 = sub_21450EFDC;
  v166 = dispatch_group_create();
  v155 = 0;
  v156 = &v155;
  v157 = 0x3032000000;
  v158 = sub_21450EFCC;
  v159 = sub_21450EFDC;
  v160 = 0;
  v149 = 0;
  v150 = &v149;
  v151 = 0x3032000000;
  v152 = sub_21450EFCC;
  v153 = sub_21450EFDC;
  v154 = 0;
  v143 = 0;
  v144 = &v143;
  v145 = 0x3032000000;
  v146 = sub_21450EFCC;
  v147 = sub_21450EFDC;
  v148 = 0;
  v139 = 0;
  v140 = &v139;
  v141 = 0x2020000000;
  v142 = 1;
  if (!v9)
  {
    handleForCategory(0);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_214567FD8();
    goto LABEL_17;
  }
  objc_msgSend_server(v9, v10, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    handleForCategory(0);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_214568004();
LABEL_17:
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v131 = 0;
    v133 = 0;
    v134 = 0;
    v20 = 0;
    v16 = 0;
LABEL_18:
    v36 = 0;
    goto LABEL_19;
  }
  objc_msgSend_payload(v9, v13, v14, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    handleForCategory(0);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_214568030();
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v131 = 0;
    v133 = 0;
    v134 = 0;
    v20 = 0;
    goto LABEL_18;
  }
  if (v135)
  {
    objc_msgSend_signatureChallenge(v9, v17, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 == 0;

    if (v22)
    {
      v133 = 0;
      v31 = 0;
    }
    else
    {
      handleForCategory(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214503000, v23, OS_LOG_TYPE_DEFAULT, "Signing server nonce ...", buf, 2u);
      }

      objc_msgSend_signatureChallenge(v9, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sign_keyBlob_(self, v28, (uint64_t)v27, (uint64_t)v135);
      v134 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = v134;
      if (!v134)
      {
        handleForCategory(0);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          sub_214568250();
        v33 = 0;
        v34 = 0;
        v35 = 0;
        v131 = 0;
        v133 = 0;
        v134 = 0;
        goto LABEL_18;
      }
      objc_msgSend_base64EncodedStringWithOptions_(v134, v29, 0, v30);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v133)
      {
        handleForCategory(0);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          sub_21456827C();
        v33 = 0;
        v34 = 0;
        v35 = 0;
        v131 = 0;
        v133 = 0;
        goto LABEL_18;
      }
    }
    handleForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue();
    v134 = v31;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v39, OS_LOG_TYPE_DEFAULT, "Signing request ...", buf, 2u);
    }

    objc_msgSend_sign_keyBlob_(self, v40, (uint64_t)v20, (uint64_t)v135);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v41;
    if (!v41)
    {
      handleForCategory(0);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_2145681F8();
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v131 = 0;
      goto LABEL_18;
    }
    objc_msgSend_base64EncodedStringWithOptions_(v41, v42, 0, v43);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v35)
    {
      v131 = v38;
      handleForCategory(0);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_214568224();
      v33 = 0;
      v34 = 0;
      v35 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    v31 = 0;
    v133 = 0;
    v35 = 0;
    v38 = 0;
  }
  objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(MEMORY[0x24BDD16B0], v17, (uint64_t)v16, 0, 120.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHTTPMethod_(v33, v44, (uint64_t)CFSTR("POST"), v45);
  objc_msgSend_setValue_forHTTPHeaderField_(v33, v46, (uint64_t)CFSTR("*/*"), (uint64_t)CFSTR("Accept"));
  objc_msgSend_setValue_forHTTPHeaderField_(v33, v47, (uint64_t)CFSTR("application/xml"), (uint64_t)CFSTR("Content-Type"));
  v48 = (void *)MEMORY[0x24BDD17C8];
  v52 = objc_msgSend_length(v20, v49, v50, v51);
  objc_msgSend_stringWithFormat_(v48, v53, (uint64_t)CFSTR("%d"), v54, v52);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forHTTPHeaderField_(v33, v56, (uint64_t)v55, (uint64_t)CFSTR("Content-Length"));
  v131 = v38;
  v134 = v31;

  if (v133)
    objc_msgSend_setValue_forHTTPHeaderField_(v33, v57, (uint64_t)v133, (uint64_t)CFSTR("signature"));
  if (v35)
    objc_msgSend_setValue_forHTTPHeaderField_(v33, v57, (uint64_t)v35, (uint64_t)CFSTR("ax_request_body_signature"));
  objc_msgSend_setHTTPBody_(v33, v57, (uint64_t)v20, v58);
  handleForCategory(0);
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    v63 = objc_msgSend_length(v20, v60, v61, v62);
    sub_2145681BC((uint64_t)v172, v63, v59);
  }

  handleForCategory(0);
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_phase(v9, v65, v66, v67);
    objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v9, v68, v69, v70);
    objc_claimAutoreleasedReturnValue();
    sub_21456817C();
  }

  handleForCategory(0);
  v71 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_phase(v9, v72, v73, v74);
    objc_claimAutoreleasedReturnValue();
    objc_msgSend_base64EncodedStringWithOptions_(v20, v75, 0, v76);
    objc_claimAutoreleasedReturnValue();
    sub_21456813C();
  }

  objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x24BDD1858], v77, v78, v79);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_socksHost(self, v80, v81, v82);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (v86)
  {
    objc_msgSend_socksPort(self, v83, v84, v85);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v87 == 0;

    if (!v88)
    {
      v169[0] = CFSTR("SOCKSProxy");
      objc_msgSend_socksHost(self, v83, v89, v90);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v170[0] = v129;
      v169[1] = CFSTR("SOCKSPort");
      objc_msgSend_socksPort(self, v91, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v169[2] = CFSTR("SOCKSEnable");
      v170[1] = v94;
      v170[2] = MEMORY[0x24BDBD1C8];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v95, (uint64_t)v170, (uint64_t)v169, 3);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setConnectionProxyDictionary_(v34, v97, (uint64_t)v96, v98);

    }
  }
  objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(MEMORY[0x24BDD1850], v83, (uint64_t)v34, (uint64_t)self, 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = MEMORY[0x24BDAC760];
  v138[0] = MEMORY[0x24BDAC760];
  v138[1] = 3221225472;
  v138[2] = sub_214511A2C;
  v138[3] = &unk_24D1AA088;
  v138[4] = &v149;
  v138[5] = &v143;
  v138[6] = &v139;
  v138[7] = &v161;
  objc_msgSend_dataTaskWithRequest_completionHandler_(v99, v101, (uint64_t)v33, (uint64_t)v138);
  v102 = objc_claimAutoreleasedReturnValue();
  v103 = (void *)v156[5];
  v156[5] = v102;

  v104 = v162[5];
  block[0] = v100;
  block[1] = 3221225472;
  block[2] = sub_214511CEC;
  block[3] = &unk_24D1AA0B0;
  block[4] = &v161;
  block[5] = &v155;
  dispatch_group_async(v104, queue, block);
  dispatch_group_wait((dispatch_group_t)v162[5], 0xFFFFFFFFFFFFFFFFLL);
  if (a6)
    *a6 = objc_retainAutorelease((id)v150[5]);
  v105 = 0;
  if (a4)
  {
    v32 = 0;
    if (v144[5])
    {
      handleForCategory(0);
      v106 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_phase(v9, v107, v108, v109);
        objc_claimAutoreleasedReturnValue();
        objc_msgSend_base64EncodedStringWithOptions_((void *)v144[5], v110, 0, v111);
        objc_claimAutoreleasedReturnValue();
        sub_2145680FC();
      }

      v112 = v144[5];
      v136 = 0;
      objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x24BDD1770], v113, v112, 0, 0, &v136);
      v32 = objc_claimAutoreleasedReturnValue();
      v114 = v136;
      v105 = v114;
      if (!v32 || v114)
      {
        handleForCategory(0);
        v128 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
          sub_21456805C();

        if (a6)
          *a6 = objc_retainAutorelease(v105);
        *((_BYTE *)v140 + 24) = 0;
      }
      else
      {
        handleForCategory(0);
        v115 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v167 = 138412290;
          v168 = v32;
          _os_log_impl(&dword_214503000, v115, OS_LOG_TYPE_DEFAULT, "Server Data: %@", v167, 0xCu);
        }

        v116 = [CRPreflightResponse alloc];
        v119 = (void *)objc_msgSend_initWithDictionary_(v116, v117, (uint64_t)v32, v118);
        handleForCategory(0);
        v120 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_phase(v9, v121, v122, v123);
          objc_claimAutoreleasedReturnValue();
          objc_msgSend_description(v119, v124, v125, v126);
          objc_claimAutoreleasedReturnValue();
          sub_2145680BC();
        }

        v127 = objc_retainAutorelease(v119);
        *a4 = v127;

        v105 = 0;
      }
    }
  }
  else
  {
    v32 = 0;
  }
  v36 = *((_BYTE *)v140 + 24) != 0;

LABEL_19:
  _Block_object_dispose(&v139, 8);
  _Block_object_dispose(&v143, 8);

  _Block_object_dispose(&v149, 8);
  _Block_object_dispose(&v155, 8);

  _Block_object_dispose(&v161, 8);
  return v36;
}

- (BOOL)isErrorResponse:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v7 = v3;
  if (!v3)
  {
    handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_214568360();
    goto LABEL_9;
  }
  objc_msgSend_errorCode(v3, v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

    goto LABEL_7;
  }
  objc_msgSend_errorMessage(v7, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12)
  {
LABEL_7:
    handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_21456838C(v7, (const char *)v12, v13, v14);
LABEL_9:

    LOBYTE(v12) = 1;
  }

  return (char)v12;
}

- (id)createPEMFromCerts:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  id obj;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_string(MEMORY[0x24BDD16A8], v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v3;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v9)
  {
    v12 = v9;
    v38 = *(_QWORD *)v40;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v40 != v38)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v13);
        objc_msgSend_appendString_(v7, v10, (uint64_t)CFSTR("-----BEGIN CERTIFICATE-----\n"), v11);
        objc_msgSend_base64EncodedStringWithOptions_(v14, v15, 0, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend_length(v17, v18, v19, v20);
        if (v21)
        {
          v24 = v21;
          v25 = 0;
          v26 = v21;
          do
          {
            v27 = v26 - 64;
            if (v26 >= 0x40)
              objc_msgSend_substringWithRange_(v17, v22, v25, 64);
            else
              objc_msgSend_substringWithRange_(v17, v22, v25, v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_appendString_(v7, v29, (uint64_t)v28, v30);

            objc_msgSend_appendString_(v7, v31, (uint64_t)CFSTR("\n"), v32);
            v25 += 64;
            v26 = v27;
          }
          while (v25 < v24);
        }
        objc_msgSend_appendString_(v7, v22, (uint64_t)CFSTR("-----END CERTIFICATE-----\n"), v23);

        ++v13;
      }
      while (v13 != v12);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v39, (uint64_t)v43, 16);
    }
    while (v12);
  }

  objc_msgSend_dataUsingEncoding_(v7, v33, 4, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
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

- (NSXPCConnection)connectionToService
{
  return self->_connectionToService;
}

- (void)setConnectionToService:(id)a3
{
  objc_storeStrong((id *)&self->_connectionToService, a3);
}

- (BOOL)miniPreflight
{
  return self->_miniPreflight;
}

- (void)setMiniPreflight:(BOOL)a3
{
  self->_miniPreflight = a3;
}

- (NSString)socksHost
{
  return self->_socksHost;
}

- (void)setSocksHost:(id)a3
{
  objc_storeStrong((id *)&self->_socksHost, a3);
}

- (NSNumber)socksPort
{
  return self->_socksPort;
}

- (void)setSocksPort:(id)a3
{
  objc_storeStrong((id *)&self->_socksPort, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socksPort, 0);
  objc_storeStrong((id *)&self->_socksHost, 0);
  objc_storeStrong((id *)&self->_connectionToService, 0);
}

@end
