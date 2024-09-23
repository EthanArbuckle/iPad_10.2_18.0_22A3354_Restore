@implementation CWFLocalDeviceDiscovery

- (CWFLocalDeviceDiscovery)init
{
  CWFLocalDeviceDiscovery *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int hasPrefix;
  char v22;
  __CFString *v23;
  __CFString *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSCharacterSet *tokenizationCharacterSet;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)CWFLocalDeviceDiscovery;
  v2 = -[CWFLocalDeviceDiscovery init](&v53, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("CWFLocalNetworkDeviceDiscoveryQueue", v3);
    objc_msgSend_setMrcQueue_(v2, v5, (uint64_t)v4, v6, v7);

    objc_msgSend_currentLocale(MEMORY[0x1E0C99DC8], v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localeIdentifier(v12, v13, v14, v15, v16);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    hasPrefix = objc_msgSend_hasPrefix_(v17, v18, (uint64_t)CFSTR("en"), v19, v20);
    v22 = hasPrefix;
    if (hasPrefix)
      v23 = v17;
    else
      v23 = CFSTR("en");
    v24 = v23;
    v2->_lexiconEnglish = (_LXLexicon *)sub_1B0679674(v24);
    if ((v22 & 1) == 0)
      v2->_lexiconUserLocale = (_LXLexicon *)sub_1B0679674(v17);
    objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E0CB3780], v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_punctuationCharacterSet(MEMORY[0x1E0CB3500], v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_formUnionWithCharacterSet_(v29, v35, (uint64_t)v34, v36, v37);

    objc_msgSend_symbolCharacterSet(MEMORY[0x1E0CB3500], v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_formUnionWithCharacterSet_(v29, v43, (uint64_t)v42, v44, v45);

    v50 = objc_msgSend_copy(v29, v46, v47, v48, v49);
    tokenizationCharacterSet = v2->_tokenizationCharacterSet;
    v2->_tokenizationCharacterSet = (NSCharacterSet *)v50;

  }
  return v2;
}

- (void)dealloc
{
  _LXLexicon *lexiconEnglish;
  _LXLexicon *lexiconUserLocale;
  objc_super v5;

  lexiconEnglish = self->_lexiconEnglish;
  if (lexiconEnglish)
    CFRelease(lexiconEnglish);
  lexiconUserLocale = self->_lexiconUserLocale;
  if (lexiconUserLocale)
    CFRelease(lexiconUserLocale);
  v5.receiver = self;
  v5.super_class = (Class)CWFLocalDeviceDiscovery;
  -[CWFLocalDeviceDiscovery dealloc](&v5, sel_dealloc);
}

- (void)activate
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  OS_mrc_cached_local_records_inquiry *v11;
  OS_mrc_cached_local_records_inquiry *mrcInquiry;
  OS_mrc_cached_local_records_inquiry *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;

  CWFGetOSLog();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    CWFGetOSLog();
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    _os_log_send_and_compose_impl();

  CWFGetOSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (MEMORY[0x1E0DE7618])
  {
    if (v6)
    {
      CWFGetOSLog();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      _os_log_send_and_compose_impl();

    v11 = (OS_mrc_cached_local_records_inquiry *)mrc_cached_local_records_inquiry_create();
    mrcInquiry = self->_mrcInquiry;
    self->_mrcInquiry = v11;

    v13 = self->_mrcInquiry;
    objc_msgSend_mrcQueue(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1B5E0A2D0](v13, v18);

    mrc_cached_local_records_inquiry_set_result_handler();
    MEMORY[0x1B5E0A2AC](self->_mrcInquiry);
  }
  else
  {
    if (v6)
    {
      CWFGetOSLog();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v19 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      _os_log_send_and_compose_impl();

    objc_msgSend__callHandlerWithValidResults_filtered_(self, v20, 0, 0, v21);
  }
}

- (void)invalidate
{
  void *v3;
  NSObject *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  OS_mrc_cached_local_records_inquiry *mrcInquiry;

  CWFGetOSLog();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    CWFGetOSLog();
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    _os_log_send_and_compose_impl();

  objc_msgSend_setHandler_(self, v6, 0, v7, v8);
  if (self->_mrcInquiry)
  {
    mrc_cached_local_records_inquiry_invalidate();
    mrcInquiry = self->_mrcInquiry;
    self->_mrcInquiry = 0;

  }
}

- (void)_callHandlerWithValidResults:(id)a3 filtered:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_handler(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  CWFGetOSLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v12)
  {
    if (v13)
    {
      CWFGetOSLog();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = MEMORY[0x1E0C81028];
      v17 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315138;
      v23 = "-[CWFLocalDeviceDiscovery _callHandlerWithValidResults:filtered:]";
      _os_log_send_and_compose_impl();
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1B067A370;
    block[3] = &unk_1E6133340;
    block[4] = self;
    v20 = v6;
    v21 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (v13)
    {
      CWFGetOSLog();
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315138;
      v23 = "-[CWFLocalDeviceDiscovery _callHandlerWithValidResults:filtered:]";
      _os_log_send_and_compose_impl();
    }

  }
}

- (void)_processMRCRecord:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  CWFLocalNetworkDevice *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  CWFLocalNetworkDevice *v45;
  void *v46;
  NSObject *v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  CWFLocalNetworkDevice *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  CWFLocalNetworkDevice *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  NSObject *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  NSObject *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  NSObject *v100;
  id v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  CWFLocalNetworkDevice *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  _LXLexicon *lexiconEnglish;
  void *v123;
  NSObject *v124;
  id v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  id v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  id v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  NSObject *v178;
  id v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  CWFLocalNetworkDevice *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  NSObject *v225;
  id v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  void *v231;
  NSObject *v232;
  id v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  id v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  NSObject *v244;
  uint64_t i;
  const char *v246;
  void *v247;
  NSObject *v248;
  NSObject *v249;
  const char *v250;
  const char *v251;
  uint64_t v252;
  int *v253;
  uint64_t v254;
  void *v255;
  id obj;
  uint64_t v257;
  void *v258;
  uint64_t v259;
  void *v260;
  CWFLocalNetworkDevice *v261;
  uint64_t v262;
  void *v263;
  void *v265;
  id v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  _BYTE v279[128];
  int v280;
  const char *v281;
  __int16 v282;
  CWFLocalNetworkDevice *v283;
  __int16 v284;
  void *v285;
  _BYTE v286[128];
  _BYTE v287[128];
  uint64_t v288;

  v288 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_set(MEMORY[0x1E0C99E20], v4, v5, v6, v7);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v8, v9, v10, v11);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  v275 = 0u;
  v276 = 0u;
  v277 = 0u;
  v278 = 0u;
  v258 = v3;
  objc_msgSend_allKeys(v3, v12, v13, v14, v15);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v259 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v275, (uint64_t)v287, 16);
  if (!v259)
    goto LABEL_77;
  v257 = *(_QWORD *)v276;
  do
  {
    v20 = 0;
    do
    {
      if (*(_QWORD *)v276 != v257)
        objc_enumerationMutation(obj);
      v262 = v20;
      v21 = *(_QWORD *)(*((_QWORD *)&v275 + 1) + 8 * v20);
      objc_msgSend_objectForKey_(v258, v17, v21, v18, v19, v253, v254);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_set(MEMORY[0x1E0C99E20], v23, v24, v25, v26);
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_set(MEMORY[0x1E0C99E20], v27, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_alloc_init(CWFLocalNetworkDevice);
      v260 = (void *)v21;
      objc_msgSend_setWithObject_(MEMORY[0x1E0C99E60], v33, v21, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v261 = v32;
      objc_msgSend_setSourceAddresses_(v32, v37, (uint64_t)v36, v38, v39);

      v273 = 0u;
      v274 = 0u;
      v271 = 0u;
      v272 = 0u;
      v266 = v22;
      v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v266, v40, (uint64_t)&v271, (uint64_t)v286, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v272;
        do
        {
          v44 = 0;
          do
          {
            if (*(_QWORD *)v272 != v43)
              objc_enumerationMutation(v266);
            v45 = *(CWFLocalNetworkDevice **)(*((_QWORD *)&v271 + 1) + 8 * v44);
            CWFGetOSLog();
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (v46)
            {
              CWFGetOSLog();
              v47 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v47 = MEMORY[0x1E0C81028];
              v48 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v280 = 136315394;
              v281 = "-[CWFLocalDeviceDiscovery _processMRCRecord:]";
              v282 = 2112;
              v283 = v45;
              LODWORD(v254) = 22;
              v253 = &v280;
              _os_log_send_and_compose_impl();
            }

            objc_msgSend_serviceName(v45, v49, v50, v51, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend_length(v53, v54, v55, v56, v57);

            if (v58)
            {
              objc_msgSend_serviceName(v45, v59, v60, v61, v62);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v31, v64, (uint64_t)v63, v65, v66);

            }
            objc_msgSend_deviceName(v45, v59, v60, v61, v62, v253, v254);
            v67 = (CWFLocalNetworkDevice *)objc_claimAutoreleasedReturnValue();
            v72 = v67;
            if (v67 && objc_msgSend_length(v67, v68, v69, v70, v71))
            {
              objc_msgSend_rawString(v45, v73, v74, v75, v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = objc_msgSend__stringContainsFilteredServiceName(v77, v78, v79, v80, v81);

              if (v82)
              {
                CWFGetOSLog();
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                if (v87)
                {
                  CWFGetOSLog();
                  v88 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v88 = MEMORY[0x1E0C81028];
                  v101 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend_rawString(v45, v102, v103, v104, v105);
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  v280 = 136315650;
                  v281 = "-[CWFLocalDeviceDiscovery _processMRCRecord:]";
                  v282 = 2112;
                  v283 = v72;
                  v284 = 2112;
                  v285 = v106;
                  LODWORD(v254) = 32;
                  v253 = &v280;
                  _os_log_send_and_compose_impl();

                }
                objc_msgSend_rawString(v45, v107, v108, v109, v110);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_filteredName_reason_(CWFLocalNetworkFilteredName, v112, (uint64_t)v111, 1, v113, v253, v254);
LABEL_48:
                v149 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v265, v150, (uint64_t)v149, v151, v152);

                goto LABEL_49;
              }
              if (objc_msgSend__stringContainsGeneratedName(v72, v83, v84, v85, v86))
              {
                CWFGetOSLog();
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                if (v93)
                {
                  CWFGetOSLog();
                  v94 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v94 = MEMORY[0x1E0C81028];
                  v125 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend_rawString(v45, v126, v127, v128, v129);
                  v130 = (void *)objc_claimAutoreleasedReturnValue();
                  v280 = 136315650;
                  v281 = "-[CWFLocalDeviceDiscovery _processMRCRecord:]";
                  v282 = 2112;
                  v283 = v72;
                  v284 = 2112;
                  v285 = v130;
                  LODWORD(v254) = 32;
                  v253 = &v280;
                  _os_log_send_and_compose_impl();

                }
                objc_msgSend_rawString(v45, v131, v132, v133, v134);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_filteredName_reason_(CWFLocalNetworkFilteredName, v135, (uint64_t)v111, 3, v136, v253, v254);
                goto LABEL_48;
              }
              if (objc_msgSend__stringContainsUnwantedCharactersAtStartOrEnd(v72, v89, v90, v91, v92))
              {
                CWFGetOSLog();
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                if (v99)
                {
                  CWFGetOSLog();
                  v100 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v100 = MEMORY[0x1E0C81028];
                  v137 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend_rawString(v45, v138, v139, v140, v141);
                  v142 = (void *)objc_claimAutoreleasedReturnValue();
                  v280 = 136315650;
                  v281 = "-[CWFLocalDeviceDiscovery _processMRCRecord:]";
                  v282 = 2112;
                  v283 = v72;
                  v284 = 2112;
                  v285 = v142;
                  LODWORD(v254) = 32;
                  v253 = &v280;
                  _os_log_send_and_compose_impl();

                }
                objc_msgSend_rawString(v45, v143, v144, v145, v146);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_filteredName_reason_(CWFLocalNetworkFilteredName, v147, (uint64_t)v111, 2, v148, v253, v254);
                goto LABEL_48;
              }
              objc_msgSend__stringByRemovingUnwantedCharacters(v72, v95, v96, v97, v98);
              v114 = (CWFLocalNetworkDevice *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend_length(v114, v115, v116, v117, v118))
              {
                lexiconEnglish = self->_lexiconEnglish;
                if (!lexiconEnglish
                  || (objc_msgSend__filterName_forLexicon_(self, v119, (uint64_t)v114, (uint64_t)lexiconEnglish, v121) & 1) == 0
                  && ((lexiconEnglish = self->_lexiconUserLocale) == 0
                   || !objc_msgSend__filterName_forLexicon_(self, v119, (uint64_t)v114, (uint64_t)lexiconEnglish, v121)))
                {
                  objc_msgSend__stringByReplacingHyphensWithSpaces(v114, v119, v120, (uint64_t)lexiconEnglish, v121);
                  v72 = (CWFLocalNetworkDevice *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend_addObject_(v263, v154, (uint64_t)v72, v155, v156);
                  goto LABEL_49;
                }
                CWFGetOSLog();
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                if (v123)
                {
                  CWFGetOSLog();
                  v124 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v124 = MEMORY[0x1E0C81028];
                  v157 = MEMORY[0x1E0C81028];
                }

                if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
                {
                  v280 = 136315394;
                  v281 = "-[CWFLocalDeviceDiscovery _processMRCRecord:]";
                  v282 = 2112;
                  v283 = v114;
                  LODWORD(v254) = 22;
                  v253 = &v280;
                  _os_log_send_and_compose_impl();
                }

                objc_msgSend_rawString(v45, v158, v159, v160, v161);
                v162 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_filteredName_reason_(CWFLocalNetworkFilteredName, v163, (uint64_t)v162, 4, v164);
                v165 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v265, v166, (uint64_t)v165, v167, v168);

              }
              v72 = v114;
            }
LABEL_49:

            ++v44;
          }
          while (v42 != v44);
          v169 = objc_msgSend_countByEnumeratingWithState_objects_count_(v266, v153, (uint64_t)&v271, (uint64_t)v286, 16);
          v42 = v169;
        }
        while (v169);
      }

      objc_msgSend_setServiceNames_(v261, v170, (uint64_t)v31, v171, v172);
      if (objc_msgSend_count(v263, v173, v174, v175, v176))
      {
        CWFGetOSLog();
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        if (v177)
        {
          CWFGetOSLog();
          v178 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v178 = MEMORY[0x1E0C81028];
          v179 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend__prettyDescription(v263, v180, v181, v182, v183);
          v184 = (CWFLocalNetworkDevice *)objc_claimAutoreleasedReturnValue();
          v280 = 136315394;
          v281 = "-[CWFLocalDeviceDiscovery _processMRCRecord:]";
          v282 = 2112;
          v283 = v184;
          LODWORD(v254) = 22;
          v253 = &v280;
          _os_log_send_and_compose_impl();

        }
        if (objc_msgSend_count(v263, v185, v186, v187, v188) == 1)
        {
          objc_msgSend_anyObject(v263, v189, v190, v191, v192);
          v193 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setName_(v261, v194, (uint64_t)v193, v195, v196);
        }
        else
        {
          objc_msgSend_allObjects(v263, v189, v190, v191, v192);
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_sortedArrayUsingComparator_(v197, v198, (uint64_t)&unk_1E6132740, v199, v200);
          v193 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_firstObject(v193, v201, v202, v203, v204);
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setName_(v261, v206, (uint64_t)v205, v207, v208);

        }
        if (objc_msgSend__isLocalAddress(v260, v209, v210, v211, v212))
        {
          objc_msgSend_name(v261, v213, v214, v215, v216);
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_filteredName_reason_(CWFLocalNetworkFilteredName, v218, (uint64_t)v217, 5, v219);
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v265, v221, (uint64_t)v220, v222, v223);

          CWFGetOSLog();
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          if (v224)
          {
            CWFGetOSLog();
            v225 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v225 = MEMORY[0x1E0C81028];
            v226 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v225, OS_LOG_TYPE_DEFAULT))
          {
            v280 = 136315394;
            v281 = "-[CWFLocalDeviceDiscovery _processMRCRecord:]";
            v282 = 2112;
            v283 = v261;
            LODWORD(v254) = 22;
            v253 = &v280;
            _os_log_send_and_compose_impl();
          }

        }
        else
        {
          objc_msgSend_addObject_(v255, v213, (uint64_t)v261, v215, v216);
        }
      }

      v20 = v262 + 1;
    }
    while (v262 + 1 != v259);
    v259 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v275, (uint64_t)v287, 16);
  }
  while (v259);
LABEL_77:

  objc_msgSend__combineDevicesWithDifferentSourceAddresses_(self, v227, (uint64_t)v255, v228, v229);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  CWFGetOSLog();
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  if (v231)
  {
    CWFGetOSLog();
    v232 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v232 = MEMORY[0x1E0C81028];
    v233 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v232, OS_LOG_TYPE_DEFAULT))
  {
    v238 = objc_msgSend_count(v230, v234, v235, v236, v237);
    v280 = 136315394;
    v281 = "-[CWFLocalDeviceDiscovery _processMRCRecord:]";
    v282 = 2048;
    v283 = (CWFLocalNetworkDevice *)v238;
    _os_log_send_and_compose_impl();
  }

  v269 = 0u;
  v270 = 0u;
  v267 = 0u;
  v268 = 0u;
  v239 = v230;
  v241 = objc_msgSend_countByEnumeratingWithState_objects_count_(v239, v240, (uint64_t)&v267, (uint64_t)v279, 16);
  if (v241)
  {
    v242 = v241;
    v243 = *(_QWORD *)v268;
    v244 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v242; ++i)
      {
        if (*(_QWORD *)v268 != v243)
          objc_enumerationMutation(v239);
        v246 = *(const char **)(*((_QWORD *)&v267 + 1) + 8 * i);
        CWFGetOSLog();
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        if (v247)
        {
          CWFGetOSLog();
          v248 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v249 = v244;
          v248 = v244;
        }

        if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
        {
          v280 = 138412290;
          v281 = v246;
          _os_log_send_and_compose_impl();
        }

      }
      v242 = objc_msgSend_countByEnumeratingWithState_objects_count_(v239, v250, (uint64_t)&v267, (uint64_t)v279, 16);
    }
    while (v242);
  }

  objc_msgSend__callHandlerWithValidResults_filtered_(self, v251, (uint64_t)v239, (uint64_t)v265, v252);
}

- (id)_combineDevicesWithDifferentSourceAddresses:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t j;
  void *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  CWFLocalNetworkDevice *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  int *v141;
  uint64_t v142;
  id v143;
  uint64_t v144;
  void *v145;
  void *v146;
  uint64_t v147;
  id obj;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _BYTE v164[128];
  _BYTE v165[128];
  int v166;
  const char *v167;
  __int16 v168;
  void *v169;
  _BYTE v170[128];
  uint64_t v171;

  v171 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v3, v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v163 = 0u;
    v143 = v7;
    v9 = v7;
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v160, (uint64_t)v170, 16);
    if (v11)
    {
      v16 = v11;
      v17 = *(_QWORD *)v161;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v161 != v17)
            objc_enumerationMutation(v9);
          v19 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * i);
          objc_msgSend_name(v19, v12, v13, v14, v15, v141, v142);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend_sanitizedName(v19, v21, v22, v23, v24);
            v25 = objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v8, v26, (uint64_t)v25, v27, v28);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (v33)
              objc_msgSend_objectForKey_(v8, v29, (uint64_t)v25, v31, v32);
            else
              objc_msgSend_set(MEMORY[0x1E0C99E20], v29, v30, v31, v32);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_addObject_(v35, v36, (uint64_t)v19, v37, v38);
            objc_msgSend_setObject_forKey_(v8, v39, (uint64_t)v35, (uint64_t)v25, v40);

          }
          else
          {
            CWFGetOSLog();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              CWFGetOSLog();
              v25 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v25 = MEMORY[0x1E0C81028];
              v41 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              v166 = 136315394;
              v167 = "-[CWFLocalDeviceDiscovery _combineDevicesWithDifferentSourceAddresses:]";
              v168 = 2112;
              v169 = v19;
              LODWORD(v142) = 22;
              v141 = &v166;
              _os_log_send_and_compose_impl();
            }
          }

        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v160, (uint64_t)v170, 16);
      }
      while (v16);
    }

    objc_msgSend_set(MEMORY[0x1E0C99E20], v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    objc_msgSend_allKeys(v8, v47, v48, v49, v50);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v156, (uint64_t)v165, 16);
    if (v52)
    {
      v56 = v52;
      v57 = *(_QWORD *)v157;
      v145 = v46;
      v146 = v8;
      v144 = *(_QWORD *)v157;
      do
      {
        v58 = 0;
        v147 = v56;
        do
        {
          if (*(_QWORD *)v157 != v57)
            objc_enumerationMutation(obj);
          v59 = *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * v58);
          objc_msgSend_objectForKey_(v8, v53, v59, v54, v55, v141, v142);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v60, v61, v62, v63, v64) == 1)
          {
            objc_msgSend_anyObject(v60, v65, v66, v67, v68);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v46, v70, (uint64_t)v69, v71, v72);
          }
          else
          {
            v149 = v59;
            v151 = v58;
            objc_msgSend_set(MEMORY[0x1E0C99E20], v65, v66, v67, v68);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_set(MEMORY[0x1E0C99E20], v73, v74, v75, v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v152 = 0u;
            v153 = 0u;
            v154 = 0u;
            v155 = 0u;
            v150 = v60;
            v78 = v60;
            v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v79, (uint64_t)&v152, (uint64_t)v164, 16);
            if (v80)
            {
              v85 = v80;
              v86 = *(_QWORD *)v153;
              do
              {
                for (j = 0; j != v85; ++j)
                {
                  if (*(_QWORD *)v153 != v86)
                    objc_enumerationMutation(v78);
                  v88 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * j);
                  objc_msgSend_serviceNames(v88, v81, v82, v83, v84);
                  v89 = objc_claimAutoreleasedReturnValue();
                  if (v89)
                  {
                    v94 = (void *)v89;
                    objc_msgSend_serviceNames(v88, v90, v91, v92, v93);
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    v100 = objc_msgSend_count(v95, v96, v97, v98, v99);

                    if (v100)
                    {
                      objc_msgSend_serviceNames(v88, v90, v91, v92, v93);
                      v101 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_allObjects(v101, v102, v103, v104, v105);
                      v106 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_addObjectsFromArray_(v69, v107, (uint64_t)v106, v108, v109);

                    }
                  }
                  objc_msgSend_sourceAddresses(v88, v90, v91, v92, v93);
                  v110 = objc_claimAutoreleasedReturnValue();
                  if (v110)
                  {
                    v111 = (void *)v110;
                    objc_msgSend_sourceAddresses(v88, v81, v82, v83, v84);
                    v112 = (void *)objc_claimAutoreleasedReturnValue();
                    v117 = objc_msgSend_count(v112, v113, v114, v115, v116);

                    if (v117)
                    {
                      objc_msgSend_sourceAddresses(v88, v81, v82, v83, v84);
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_allObjects(v118, v119, v120, v121, v122);
                      v123 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_addObjectsFromArray_(v77, v124, (uint64_t)v123, v125, v126);

                    }
                  }
                }
                v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v81, (uint64_t)&v152, (uint64_t)v164, 16);
              }
              while (v85);
            }

            v127 = objc_alloc_init(CWFLocalNetworkDevice);
            objc_msgSend_setName_(v127, v128, v149, v129, v130);
            objc_msgSend_setServiceNames_(v127, v131, (uint64_t)v69, v132, v133);
            objc_msgSend_setSourceAddresses_(v127, v134, (uint64_t)v77, v135, v136);
            v46 = v145;
            objc_msgSend_addObject_(v145, v137, (uint64_t)v127, v138, v139);

            v8 = v146;
            v56 = v147;
            v57 = v144;
            v60 = v150;
            v58 = v151;
          }

          ++v58;
        }
        while (v58 != v56);
        v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v53, (uint64_t)&v156, (uint64_t)v165, 16);
      }
      while (v56);
    }

    v7 = v143;
  }
  else
  {
    v46 = 0;
  }

  return v46;
}

- (BOOL)_filterName:(id)a3 forLexicon:(_LXLexicon *)a4
{
  char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  NSObject *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  BOOL v41;
  id v42;
  _QWORD v44[4];
  char *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  _LXLexicon *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  int v62;
  const char *v63;
  __int16 v64;
  char *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  const __CFString *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  objc_msgSend__tokenizeStringForSpecialCharacters_(self, v7, (uint64_t)v6, v8, v9);
  v10 = (char *)objc_claimAutoreleasedReturnValue();
  CWFGetOSLog();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CWFGetOSLog();
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v62 = 138412546;
    v63 = v6;
    v64 = 2112;
    v65 = v10;
    _os_log_send_and_compose_impl();
  }

  if (objc_msgSend_count(v10, v14, v15, v16, v17))
  {
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v57 = 0;
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = sub_1B067B970;
    v44[3] = &unk_1E6133CA0;
    v49 = a4;
    v18 = v6;
    v45 = v18;
    v46 = &v58;
    v47 = &v50;
    v48 = &v54;
    objc_msgSend_enumerateObjectsUsingBlock_(v10, v19, (uint64_t)v44, v20, v21);
    if (*((_BYTE *)v59 + 24) || (v26 = v55[3], v26 > 1) || v26 == objc_msgSend_count(v10, v22, v23, v24, v25))
    {
      CWFGetOSLog();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        CWFGetOSLog();
        v28 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = MEMORY[0x1E0C81028];
        v31 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v36 = *((unsigned __int8 *)v59 + 24);
        v37 = v51[3];
        v38 = v55[3];
        v39 = objc_msgSend_count(v10, v32, v33, v34, v35);
        v40 = CFSTR("NO");
        v62 = 136316418;
        v63 = "-[CWFLocalDeviceDiscovery _filterName:forLexicon:]";
        v64 = 2112;
        v65 = v18;
        if (v38 == v39)
          v40 = CFSTR("YES");
        v66 = 1024;
        v67 = v36;
        v68 = 2048;
        v69 = v37;
        v70 = 2048;
        v71 = v38;
        v72 = 2112;
        v73 = v40;
        _os_log_send_and_compose_impl();
      }

      v41 = 1;
    }
    else
    {
      v41 = 0;
    }

    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
  }
  else
  {
    CWFGetOSLog();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      CWFGetOSLog();
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = MEMORY[0x1E0C81028];
      v42 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v62 = 138412290;
      v63 = v6;
      _os_log_send_and_compose_impl();
    }

    v41 = 1;
  }

  return v41;
}

- (id)_tokenizeStringForSpecialCharacters:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *context;
  id v57;
  unint64_t v58;

  v3 = a3;
  objc_msgSend_set(MEMORY[0x1E0C99E20], v4, v5, v6, v7);
  v57 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v3, v8, v9, v10, v11))
  {
    context = (void *)MEMORY[0x1B5E0A33C]();
    v58 = objc_msgSend_length(v3, v12, v13, v14, v15);
    v19 = v58 - 2;
    if (v58 >= 2)
    {
      v20 = 0;
      v21 = 0;
      do
      {
        v22 = v20 + 1;
        v23 = objc_msgSend_characterAtIndex_(v3, v16, v20 + 1, v17, v18);
        objc_msgSend_tokenizationCharacterSet(self, v24, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v23) = objc_msgSend_characterIsMember_(v28, v29, v23, v30, v31);

        if ((v19 == v20) | v23)
        {
          v32 = v58;
          if (v19 != v20)
            v32 = v20 + 1;
          objc_msgSend_substringWithRange_(v3, v16, v21, v32 - v21, v18);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_tokenizationCharacterSet(self, v34, v35, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByTrimmingCharactersInSet_(v33, v39, (uint64_t)v38, v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_lowercaseString(v42, v43, v44, v45, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend_length(v47, v48, v49, v50, v51) >= 2)
            objc_msgSend_addObject_(v57, v52, (uint64_t)v47, v53, v54);

        }
        else
        {
          v22 = v21;
        }
        ++v20;
        v21 = v22;
      }
      while (v58 - 1 != v20);
    }
    objc_autoreleasePoolPop(context);
  }

  return v57;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)mrcQueue
{
  return self->_mrcQueue;
}

- (void)setMrcQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mrcQueue, a3);
}

- (NSCharacterSet)tokenizationCharacterSet
{
  return self->_tokenizationCharacterSet;
}

- (void)setTokenizationCharacterSet:(id)a3
{
  objc_storeStrong((id *)&self->_tokenizationCharacterSet, a3);
}

- (NSDictionary)filteredNames
{
  return self->_filteredNames;
}

- (OS_mrc_cached_local_records_inquiry)mrcInquiry
{
  return self->_mrcInquiry;
}

- (void)setMrcInquiry:(id)a3
{
  objc_storeStrong((id *)&self->_mrcInquiry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mrcInquiry, 0);
  objc_storeStrong((id *)&self->_filteredNames, 0);
  objc_storeStrong((id *)&self->_tokenizationCharacterSet, 0);
  objc_storeStrong((id *)&self->_mrcQueue, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
