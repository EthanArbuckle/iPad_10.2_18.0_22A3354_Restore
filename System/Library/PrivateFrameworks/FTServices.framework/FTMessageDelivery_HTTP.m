@implementation FTMessageDelivery_HTTP

- (FTMessageDelivery_HTTP)initWithAPSConnection:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  FTMessageDelivery_HTTP *v9;

  v4 = (void *)MEMORY[0x1E0D34E78];
  v5 = a3;
  objc_msgSend_sharedInstanceForBagType_(v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (FTMessageDelivery_HTTP *)objc_msgSend_initWithIDSServerBag_apsConnection_(self, v8, (uint64_t)v7, v5);

  return v9;
}

- (FTMessageDelivery_HTTP)initWithIDSServerBag:(id)a3
{
  return (FTMessageDelivery_HTTP *)objc_msgSend_initWithIDSServerBag_apsConnection_(self, a2, (uint64_t)a3, 0);
}

- (FTMessageDelivery_HTTP)initWithIDSServerBag:(id)a3 apsConnection:(id)a4
{
  void *v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  FTMessageDeliveryRemoteURLConnectionFactory *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  FTMessageDelivery_HTTP *v16;

  v6 = (void *)MEMORY[0x1E0D34E78];
  v7 = a4;
  v8 = a3;
  objc_msgSend_sharedInstanceForBagType_(v6, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(FTMessageDeliveryRemoteURLConnectionFactory);
  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (FTMessageDelivery_HTTP *)objc_msgSend_initWithIDSServerBag_iMessageServerBag_remoteConnectionFactory_mobileNetworkManager_apsConnection_retryBackoffProvider_timeoutBackoffProvider_(self, v15, (uint64_t)v8, v10, v11, v14, v7, &unk_1E4DD9B58, &unk_1E4DD9B98);

  return v16;
}

- (FTMessageDelivery_HTTP)initWithIDSServerBag:(id)a3 iMessageServerBag:(id)a4 remoteConnectionFactory:(id)a5 mobileNetworkManager:(id)a6 retryBackoffProvider:(id)a7 timeoutBackoffProvider:(id)a8
{
  return (FTMessageDelivery_HTTP *)objc_msgSend_initWithIDSServerBag_iMessageServerBag_remoteConnectionFactory_mobileNetworkManager_apsConnection_retryBackoffProvider_timeoutBackoffProvider_(self, a2, (uint64_t)a3, a4, a5, a6, 0, a7, a8);
}

- (FTMessageDelivery_HTTP)initWithIDSServerBag:(id)a3 iMessageServerBag:(id)a4 remoteConnectionFactory:(id)a5 mobileNetworkManager:(id)a6 apsConnection:(id)a7 retryBackoffProvider:(id)a8 timeoutBackoffProvider:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  FTMessageDelivery_HTTP *v20;
  FTMessageDelivery_HTTP *v21;
  uint64_t v22;
  id retryBackoffProvider;
  uint64_t v24;
  id timeoutBackoffProvider;
  const char *v26;
  uint64_t v27;
  IDSOffGridConnectionMonitor *v28;
  IDSOffGridConnectionMonitor *offGridConnectionMonitor;
  void *v30;
  const char *v31;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v35.receiver = self;
  v35.super_class = (Class)FTMessageDelivery_HTTP;
  v20 = -[FTMessageDelivery initWithAPSConnection:](&v35, sel_initWithAPSConnection_, a7);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_idsServerBag, a3);
    objc_storeStrong((id *)&v21->_iMessageServerBag, a4);
    objc_storeStrong((id *)&v21->_remoteConnectionFactory, a5);
    objc_storeStrong((id *)&v21->_mobileNetworkManager, a6);
    v22 = MEMORY[0x1A85A6380](v18);
    retryBackoffProvider = v21->_retryBackoffProvider;
    v21->_retryBackoffProvider = (id)v22;

    v24 = MEMORY[0x1A85A6380](v19);
    timeoutBackoffProvider = v21->_timeoutBackoffProvider;
    v21->_timeoutBackoffProvider = (id)v24;

    if (_os_feature_enabled_impl()
      && (objc_msgSend_shouldDisableFailFastWhenSatelliteIsAvailable(MEMORY[0x1E0D36AF8], v26, v27, v33, v34) & 1) == 0)
    {
      v28 = (IDSOffGridConnectionMonitor *)objc_alloc_init((Class)MEMORY[0x1A85A5DE0](CFSTR("IDSOffGridConnectionMonitor"), CFSTR("IDS")));
      offGridConnectionMonitor = v21->_offGridConnectionMonitor;
      v21->_offGridConnectionMonitor = v28;

    }
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v26, v27, v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v30, v31, (uint64_t)v21, sel__serverBagLoaded_, *MEMORY[0x1E0D34B98], 0);

  }
  return v21;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  objc_super v8;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v4, v5, (uint64_t)self, 0, 0);

  objc_msgSend_cancel(self->_remoteConnection, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)FTMessageDelivery_HTTP;
  -[FTMessageDelivery dealloc](&v8, sel_dealloc);
}

- (void)_urlRequestWithURL:(id)a3 andData:(id)a4 message:(id)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  NSObject *v40;
  BOOL v41;
  const char *v42;
  double v43;
  double v44;
  double v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  id v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  id v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  NSObject *v69;
  NSObject *v70;
  const char *v71;
  uint64_t v72;
  id v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  NSObject *v86;
  NSObject *v87;
  const char *v88;
  uint64_t v89;
  int isIDSMessage;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  __CFString *v107;
  const char *v108;
  uint64_t v109;
  __CFString *v110;
  BOOL v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  const char *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  const char *v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  void *v129;
  const char *v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t i;
  uint64_t v140;
  void *v141;
  const char *v142;
  void *v143;
  const char *v144;
  NSObject *v145;
  const char *v146;
  id v147;
  const char *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  void *v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  double v164;
  double v165;
  const char *v166;
  void *v167;
  const char *v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  double v172;
  double v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  double v179;
  double v180;
  NSObject *v181;
  int64_t v182;
  NSObject *v183;
  NSObject *v184;
  id v185;
  id v186;
  void *v187;
  void *v188;
  uint64_t v189;
  void *v190;
  id v191;
  id v192;
  void *v193;
  id v194;
  void *v195;
  id v196;
  __CFString *v197;
  void *v198;
  id v200;
  void *v201;
  id v202;
  id v203;
  _QWORD block[4];
  id v205;
  id v206;
  _QWORD v207[5];
  _QWORD v208[5];
  id v209;
  id v210;
  id v211;
  id v212;
  _BYTE *v213;
  void *v214;
  _QWORD v215[5];
  id v216;
  id v217;
  _BYTE *v218;
  id v219[2];
  id location;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  _QWORD v225[4];
  id v226;
  _BYTE buf[24];
  uint64_t (*v228)(uint64_t, uint64_t);
  void (*v229)(uint64_t);
  id v230;
  uint8_t v231[128];
  uint8_t v232[4];
  double v233;
  uint64_t v234;

  v234 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v196 = a4;
  v10 = a5;
  v194 = a6;
  v201 = v10;
  if (v9)
  {
    if ((objc_msgSend_wantsGZip(v10, v11, v12) & 1) != 0)
    {
      v192 = (id)objc_msgSend__FTCopyGzippedData(v196, v13, v14);

    }
    else
    {
      v192 = v196;
    }
    objc_msgSend_additionalQueryStringParameters(v10, v15, v16);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v191 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    OSLogHandleForIDSCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v195;
      _os_log_impl(&dword_1A4C7F000, v24, OS_LOG_TYPE_DEFAULT, " Query parameters: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v185 = v195;
      _IDSLogV();
    }
    if (objc_msgSend_count(v195, v25, v26, v185))
    {
      v225[0] = MEMORY[0x1E0C809B0];
      v225[1] = 3221225472;
      v225[2] = sub_1A4C9757C;
      v225[3] = &unk_1E4DD9698;
      v29 = v191;
      v226 = v29;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v195, v30, (uint64_t)v225);
      OSLogHandleForIDSCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v29;
        _os_log_impl(&dword_1A4C7F000, v31, OS_LOG_TYPE_DEFAULT, " Query string: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v186 = v29;
        _IDSLogV();
      }
      if (objc_msgSend_length(v29, v32, v33, v186))
      {
        objc_msgSend_absoluteString(v9, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingFormat_(v36, v37, (uint64_t)CFSTR("?%@"), v29);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v39, (uint64_t)v38);
        v193 = (void *)objc_claimAutoreleasedReturnValue();

        OSLogHandleForIDSCategory();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v193;
          _os_log_impl(&dword_1A4C7F000, v40, OS_LOG_TYPE_DEFAULT, "Generated final URL: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          v186 = v193;
          _IDSLogV();
        }

      }
      else
      {
        v193 = v9;
      }

    }
    else
    {
      v193 = v9;
    }
    v41 = self->_timeoutBackoffProvider == 0;
    objc_msgSend_timeout(v201, v27, v28, v186);
    v44 = v43;
    if (!v41)
    {
      v45 = (*((double (**)(void))self->_timeoutBackoffProvider + 2))();
      if (v44 >= v45)
        v44 = v45;
    }
    objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(MEMORY[0x1E0C92C28], v42, (uint64_t)v193, 1, v44);
    v202 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_wantsHTTPGet(v201, v46, v47) & 1) == 0)
    {
      objc_msgSend_setHTTPMethod_(v202, v48, (uint64_t)CFSTR("POST"));
      objc_msgSend_setHTTPBody_(v202, v50, (uint64_t)v192);
    }
    if ((objc_msgSend_isIDSMessage(v201, v48, v49) & 1) == 0)
      objc_msgSend_setHTTPBody_(v202, v51, (uint64_t)v196);
    if (objc_msgSend_httpDoNotDecodeData(v201, v51, v52))
    {
      v54 = objc_retainAutorelease(v202);
      objc_msgSend__CFURLRequest(v54, v55, v56);
      _CFURLRequestSetProtocolProperty();
    }
    objc_msgSend_setHTTPShouldHandleCookies_(v202, v53, 0);
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v57, v58);
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v193;
      _os_log_impl(&dword_1A4C7F000, v59, OS_LOG_TYPE_DEFAULT, "Building URL request with URL: %@", buf, 0xCu);
    }

    OSLogHandleForIDSCategory();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v60, OS_LOG_TYPE_DEFAULT, "Headers", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    OSLogHandleForIDSCategory();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_userAgent(self, v62, v63);
      v64 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v64;
      _os_log_impl(&dword_1A4C7F000, v61, OS_LOG_TYPE_DEFAULT, "       User Agent: %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        objc_msgSend_userAgent(self, v65, v66);
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        MarcoLog();

      }
      if (IMShouldLog())
      {
        objc_msgSend_userAgent(self, v67, v68);
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        IMLogString();

      }
    }
    OSLogHandleForIDSCategory();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v69, OS_LOG_TYPE_DEFAULT, "Headers", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV();
    OSLogHandleForIDSCategory();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_userAgent(self, v71, v72);
      v73 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v73;
      _os_log_impl(&dword_1A4C7F000, v70, OS_LOG_TYPE_DEFAULT, "       User Agent: %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_userAgent(self, v74, v75);
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV();

    }
    objc_msgSend_userAgent(self, v74, v75, v187);
    v197 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_length(v197, v76, v77))
    {

      v197 = CFSTR("FTMessageDelivery");
    }
    v80 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_sharedInstance(FTDeviceSupport, v78, v79);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userAgentString(v81, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v80, v85, (uint64_t)CFSTR("%@ %@"), v197, v84);
    v198 = (void *)objc_claimAutoreleasedReturnValue();

    OSLogHandleForIDSCategory();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v198;
      _os_log_impl(&dword_1A4C7F000, v86, OS_LOG_TYPE_DEFAULT, "            Agent: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v188 = v198;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v188 = v198;
        IMLogString();
      }
    }
    OSLogHandleForIDSCategory();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v198;
      _os_log_impl(&dword_1A4C7F000, v87, OS_LOG_TYPE_DEFAULT, "            Agent: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v188 = v198;
      _IDSLogV();
    }
    isIDSMessage = objc_msgSend_isIDSMessage(v201, v88, v89, v188);
    sub_1A4C97618();
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend_length(v91, v92, v93);

    if (isIDSMessage)
    {
      if (v94)
      {
        sub_1A4C97618();
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forHTTPHeaderField_(v202, v98, (uint64_t)v97, CFSTR("Accept-Language"));

      }
      if (objc_msgSend_length(CFSTR("gzip"), v95, v96))
        objc_msgSend_setValue_forHTTPHeaderField_(v202, v99, (uint64_t)CFSTR("gzip"), CFSTR("accept-encoding"));
      if (objc_msgSend_length(v198, v99, v100))
        objc_msgSend_setValue_forHTTPHeaderField_(v202, v101, (uint64_t)v198, CFSTR("user-agent"));
      if ((objc_msgSend_wantsHTTPGet(v201, v101, v102) & 1) == 0)
      {
        if (objc_msgSend_wantsGZip(v201, v103, v104) && objc_msgSend_length(CFSTR("gzip"), v105, v106))
          objc_msgSend_setValue_forHTTPHeaderField_(v202, v105, (uint64_t)CFSTR("gzip"), CFSTR("content-encoding"));
        objc_msgSend_overrideContentType(v201, v105, v106);
        v107 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v110 = v107;
        if (!v107)
          v107 = CFSTR("application/x-apple-plist");
        v111 = objc_msgSend_length(v107, v108, v109) == 0;

        if (!v111)
        {
          objc_msgSend_overrideContentType(v201, v112, v113);
          v114 = objc_claimAutoreleasedReturnValue();
          v116 = (void *)v114;
          if (v114)
            objc_msgSend_setValue_forHTTPHeaderField_(v202, v115, v114, CFSTR("content-type"));
          else
            objc_msgSend_setValue_forHTTPHeaderField_(v202, v115, (uint64_t)CFSTR("application/x-apple-plist"), CFSTR("content-type"));

        }
        v117 = (void *)MEMORY[0x1E0CB37E8];
        v118 = objc_msgSend_length(v192, v112, v113);
        objc_msgSend_numberWithInteger_(v117, v119, v118);
        v120 = (void *)objc_claimAutoreleasedReturnValue();

        if (v120)
        {
          v121 = (void *)MEMORY[0x1E0CB37E8];
          v122 = objc_msgSend_length(v192, v103, v104);
          objc_msgSend_numberWithInteger_(v121, v123, v122);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringValue(v124, v125, v126);
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setValue_forHTTPHeaderField_(v202, v128, (uint64_t)v127, CFSTR("content-length"));

        }
      }
    }
    else
    {
      if (v94)
      {
        sub_1A4C97618();
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forHTTPHeaderField_(v202, v130, (uint64_t)v129, CFSTR("Accept-Language"));

      }
      if (objc_msgSend_length(v198, v95, v96))
        objc_msgSend_setValue_forHTTPHeaderField_(v202, v103, (uint64_t)v198, CFSTR("user-agent"));
    }
    objc_msgSend_additionalMessageHeaders(v201, v103, v104);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v223 = 0u;
    v224 = 0u;
    v221 = 0u;
    v222 = 0u;
    objc_msgSend_allKeys(v131, v132, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v135, (uint64_t)&v221, v231, 16);
    if (v137)
    {
      v138 = *(_QWORD *)v222;
      do
      {
        for (i = 0; i != v137; ++i)
        {
          if (*(_QWORD *)v222 != v138)
            objc_enumerationMutation(v134);
          v140 = *(_QWORD *)(*((_QWORD *)&v221 + 1) + 8 * i);
          objc_msgSend_objectForKey_(v131, v136, v140, v189, v190);
          v141 = (void *)objc_claimAutoreleasedReturnValue();

          if (v141)
          {
            objc_msgSend_objectForKey_(v131, v142, v140);
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setValue_forHTTPHeaderField_(v202, v144, (uint64_t)v143, v140);

          }
          OSLogHandleForIDSCategory();
          v145 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_objectForKey_(v131, v146, v140);
            v147 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v140;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v147;
            _os_log_impl(&dword_1A4C7F000, v145, OS_LOG_TYPE_DEFAULT, "       %@: %@", buf, 0x16u);

          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (MarcoShouldLog())
            {
              objc_msgSend_objectForKey_(v131, v148, v140);
              v189 = v140;
              v190 = (void *)objc_claimAutoreleasedReturnValue();
              MarcoLog();

            }
            if (IMShouldLog())
            {
              objc_msgSend_objectForKey_(v131, v136, v140);
              v189 = v140;
              v190 = (void *)objc_claimAutoreleasedReturnValue();
              IMLogString();

            }
          }
        }
        v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v136, (uint64_t)&v221, v231, 16);
      }
      while (v137);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v228 = sub_1A4C9765C;
    v229 = sub_1A4C9766C;
    v230 = 0;
    v151 = (void *)objc_msgSend_uniqueID(v201, v149, v150);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v201);
    v215[0] = MEMORY[0x1E0C809B0];
    v215[1] = 3221225472;
    v215[2] = sub_1A4C97674;
    v215[3] = &unk_1E4DD9BE8;
    objc_copyWeak(v219, &location);
    v219[1] = v151;
    v215[4] = self;
    v152 = v201;
    v216 = v152;
    v153 = v202;
    v217 = v153;
    v218 = buf;
    v203 = (id)MEMORY[0x1A85A6380](v215);
    v208[0] = MEMORY[0x1E0C809B0];
    v208[1] = 3221225472;
    v208[2] = sub_1A4C97B0C;
    v208[3] = &unk_1E4DD9C60;
    v208[4] = self;
    v214 = v151;
    v154 = v153;
    v209 = v154;
    v213 = buf;
    v155 = v194;
    v212 = v155;
    v156 = v192;
    v210 = v156;
    v157 = v191;
    v211 = v157;
    v158 = (void *)MEMORY[0x1A85A6380](v208);
    v207[0] = MEMORY[0x1E0C809B0];
    v207[1] = 3221225472;
    v207[2] = sub_1A4C98844;
    v207[3] = &unk_1E4DD9CB0;
    v207[4] = buf;
    v159 = (void *)MEMORY[0x1A85A6380](v207);
    if (!objc_msgSend_isIDSMessage(v152, v160, v161))
    {
      im_primary_queue();
      v183 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1A4C988C8;
      block[3] = &unk_1E4DD9628;
      v206 = v155;
      v205 = v154;
      dispatch_async(v183, block);

LABEL_147:
      objc_destroyWeak(v219);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

      goto LABEL_148;
    }
    v200 = v152;
    objc_msgSend_anisetteHeadersTimeout(v200, v162, v163);
    v165 = v164;
    objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E0D34E78], v166, 0);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v167, v168, (uint64_t)CFSTR("anisette-headers-global-timeout"));
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v172 = -1.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_doubleValue(v169, v170, v171);
      v172 = v173;
    }
    objc_msgSend_objectForKey_(v167, v170, (uint64_t)CFSTR("anisette-headers-lenient-timeout"), v189);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_doubleValue(v174, v175, v176);
      if (v165 >= 0.0)
      {
        v180 = v179;
        if (v179 > 0.0 && objc_msgSend_allowsServerProvidedLenientAnisetteTimeout(v200, v177, v178))
        {
          OSLogHandleForIDSCategory();
          v181 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v232 = 134217984;
            v233 = v180;
            _os_log_impl(&dword_1A4C7F000, v181, OS_LOG_TYPE_DEFAULT, "Using server bag anisetteHeaderLenientTimeout: %f second(s)", v232, 0xCu);
          }

          v182 = (uint64_t)(v180 * 1000000000.0);
          if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
            goto LABEL_146;
LABEL_135:
          _IDSLogV();
LABEL_146:

          dispatch_time(0, v182);
          im_dispatch_async_with_timeout();
          goto LABEL_147;
        }
LABEL_139:
        if (v172 <= 0.0)
        {
          v182 = (uint64_t)(v165 * 1000000000.0);
          goto LABEL_146;
        }
        OSLogHandleForIDSCategory();
        v184 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v184, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v232 = 134217984;
          v233 = v172;
          _os_log_impl(&dword_1A4C7F000, v184, OS_LOG_TYPE_DEFAULT, "Using server bag anisetteHeaderGlobalTimeout: %f second(s)", v232, 0xCu);
        }

        v182 = (uint64_t)(v172 * 1000000000.0);
        if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
          goto LABEL_146;
        goto LABEL_135;
      }
    }
    else if (v165 >= 0.0)
    {
      goto LABEL_139;
    }
    v182 = 0;
    goto LABEL_146;
  }
  if (_IMWillLog())
  {
    v185 = v10;
    _IMAlwaysLog();
  }
  if (MarcoShouldLogCheckpoints())
  {
    v185 = v10;
    MarcoNoteCheckpoint();
  }
  if (objc_msgSend_logToRegistration(self, v17, v18, v185))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_1A4C7F000, v21, OS_LOG_TYPE_DEFAULT, "Cannot send message: Empty URL requested for message: %@, forcing a bag load", buf, 0xCu);
    }

  }
  objc_msgSend_forceBagLoad(self->_idsServerBag, v19, v20);
  objc_msgSend__cleanupURLConnection(self, v22, v23);
LABEL_148:

}

- (id)_processResultData:(id)a3 forMessage:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  const char *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  id v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1A85A61F4]();
  if (!objc_msgSend_length(v7, v10, v11))
  {
    v17 = 0;
    goto LABEL_5;
  }
  objc_msgSend_parsedIDSMessageResult(v8, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v17 = v14;
LABEL_5:
    objc_autoreleasePoolPop(v9);
    v18 = 0;
    goto LABEL_6;
  }
  v27[0] = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend__FTDecompressData(v7, v15, v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    v23 = (uint64_t)v22;
  else
    v23 = (uint64_t)v7;
  v26 = 0;
  objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v21, v23, 0, v27, &v26);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v26;

  objc_autoreleasePoolPop(v9);
  if (a5 && v18)
  {
    v18 = objc_retainAutorelease(v18);
    v19 = 0;
    *a5 = v18;
    goto LABEL_7;
  }
  v25 = (void *)MEMORY[0x1A85A61F4]();
  if (v8 && v17)
    objc_msgSend_handleResponseDictionary_(v8, v24, (uint64_t)v17);
  v17 = v17;
  objc_autoreleasePoolPop(v25);
LABEL_6:
  v19 = v17;
LABEL_7:

  return v19;
}

- (void)_updateWiFiAssertions
{
  uint64_t v2;
  int v4;
  FTMessageDeliveryHTTPMobileNetworkManager *mobileNetworkManager;

  v4 = objc_msgSend_busy(self, a2, v2);
  mobileNetworkManager = self->_mobileNetworkManager;
  if (v4)
    MEMORY[0x1E0DE7D20](mobileNetworkManager, sel_addWiFiAutoAssociationClientToken_, CFSTR("FTMessageDelivery"));
  else
    MEMORY[0x1E0DE7D20](mobileNetworkManager, sel_removeWiFiAutoAssociationClientToken_, CFSTR("FTMessageDelivery"));
}

- (void)_notifyDelegateAboutError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  id v15;

  v4 = a3;
  objc_msgSend__queue(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dequeueTopMessage(v7, v8, v9);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__cleanupURLConnection(self, v10, v11);
  objc_msgSend__informDelegateAboutMessage_error_result_resultCode_interface_(self, v12, (uint64_t)v15, v4, 0, 20000, 0);

  objc_msgSend__dequeueIfNeeded(self, v13, v14);
}

- (void)_informDelegatesOfMessage:(id)a3 result:(id)a4 resultCode:(int64_t)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;

  self->super._retries = 0;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend__queue(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeMessage_(v15, v16, (uint64_t)v12);

  objc_msgSend__informDelegateAboutMessage_error_result_resultCode_interface_(self, v17, (uint64_t)v12, v10, v11, a5, 0);
  objc_msgSend__cleanupURLConnection(self, v18, v19);
  objc_msgSend__dequeueIfNeeded(self, v20, v21);
}

- (void)_clearRetryTimer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FTMessageDelivery_HTTP;
  -[FTMessageDelivery _clearRetryTimer](&v3, sel__clearRetryTimer);
  self->_pendingRetryAfterAirplaneMode = 0;
}

- (void)invalidate
{
  const char *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  FTMessageDelivery_HTTP *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_pendingRetryAfterAirplaneMode = 0;
  objc_msgSend__clearRetryTimer(obj, v2, v3);
  objc_msgSend__queue(obj, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllMessages(v6, v7, v8);

  objc_msgSend__cleanupURLConnection(obj, v9, v10);
  objc_sync_exit(obj);

}

- (BOOL)_sendMessageAsynchronously:(id)a3 error:(id *)a4
{
  const char *v5;
  uint64_t v6;
  id v7;
  FTMessageDelivery_HTTP *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  const char *v27;
  id v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  id v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  FTMessageDeliveryRemoteURLConnection *remoteConnection;
  const char *v62;
  void *v64;
  void *v65;
  _QWORD v66[5];
  id v67;
  id v68;
  uint64_t v69;
  id v70;
  uint8_t buf[4];
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    if (objc_msgSend_logToRegistration(v8, v9, v10))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v7;
        _os_log_impl(&dword_1A4C7F000, v13, OS_LOG_TYPE_DEFAULT, "Requesting async send: %@", buf, 0xCu);
      }

    }
    objc_msgSend_bagKey(v7, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_messageBodyDataOverride(v7, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend_messageBodyDataOverride(v7, v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
    }
    else if (objc_msgSend_isIDSMessage(v7, v18, v19))
    {
      objc_msgSend_messageBodyUsingCache(v7, v20, v26);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v70 = 0;
      objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], v27, (uint64_t)v22, 100, 0, &v70);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v70;
      if (v28)
      {
        v29 = v28;
        OSLogHandleForIDSCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_localizedDescription(v29, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v72 = v33;
          _os_log_impl(&dword_1A4C7F000, v30, OS_LOG_TYPE_ERROR, "error = %@", buf, 0xCu);

        }
        if (!os_log_shim_legacy_logging_enabled())
        {
          v25 = 0;
          goto LABEL_24;
        }
        objc_msgSend_localizedDescription(v29, v34, v35);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSWarnV();

        objc_msgSend_localizedDescription(v29, v36, v37, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        _IDSLogV();

        objc_msgSend_localizedDescription(v29, v38, v39, v65);
        v40 = (id)objc_claimAutoreleasedReturnValue();
        _IDSLogTransport();
        v25 = 0;
LABEL_23:

LABEL_24:
        objc_sync_exit(v8);
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      v22 = 0;
      v21 = 0;
    }
    objc_msgSend_urlWithKey_(v8->_idsServerBag, v20, (uint64_t)v14);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLOverride(v7, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend_URLOverride(v7, v45, v46);
      v47 = objc_claimAutoreleasedReturnValue();

      v41 = (void *)v47;
    }
    v48 = objc_msgSend_length(v21, v45, v46);
    objc_msgSend_setSentByteCount_(v7, v49, v48);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRequestStart_(v7, v53, (uint64_t)v52);

    v56 = objc_msgSend_uniqueID(v7, v54, v55);
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = sub_1A4C99280;
    v66[3] = &unk_1E4DD9D50;
    v66[4] = v8;
    v69 = v56;
    v40 = v41;
    v67 = v40;
    v22 = v22;
    v68 = v22;
    v57 = (void *)MEMORY[0x1A85A6380](v66);
    objc_msgSend_remoteURLConnection(v8->_remoteConnectionFactory, v58, v59);
    v60 = objc_claimAutoreleasedReturnValue();
    remoteConnection = v8->_remoteConnection;
    v8->_remoteConnection = (FTMessageDeliveryRemoteURLConnection *)v60;

    objc_msgSend__urlRequestWithURL_andData_message_completionBlock_(v8, v62, (uint64_t)v40, v21, v7, v57);
    v29 = 0;
    v25 = 1;
    goto LABEL_23;
  }
  if (objc_msgSend_logToRegistration(self, v5, v6))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v23, v24);
    v8 = (FTMessageDelivery_HTTP *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, &v8->super.super, OS_LOG_TYPE_DEFAULT, "Cannot send nil message", buf, 2u);
    }
    v25 = 0;
    goto LABEL_25;
  }
  v25 = 0;
LABEL_26:

  return v25;
}

- (void)_dequeueIfNeeded
{
  FTMessageDelivery_HTTP *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  IDSServerBag *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  char hasRequiredKeys;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  const char *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  NSObject *v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  NSObject *v112;
  NSObject *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  NSObject *v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  uint8_t buf[4];
  void *v134;
  __int16 v135;
  NSObject *v136;
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend__updateWiFiAssertions(v2, v3, v4);
  objc_msgSend__queue(v2, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v7, v8, v9);

  if (v10)
  {
    objc_msgSend__queue(v2, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_topMessage(v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = v2->_idsServerBag;
    if (objc_msgSend_isIDSMessage(v16, v18, v19) && (objc_msgSend_isLoaded(v17, v20, v21) & 1) == 0)
    {
      if (objc_msgSend_logToRegistration(v2, v20, v21))
      {
        objc_msgSend_registration(MEMORY[0x1E0D36AA8], v60, v61);
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4C7F000, v62, OS_LOG_TYPE_DEFAULT, "Server bag is not loaded, waiting for it", buf, 2u);
        }

      }
      if (objc_msgSend_isServerAvailable(v17, v60, v61))
      {
        if (objc_msgSend_logToRegistration(v2, v63, v64))
        {
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v65, v66);
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4C7F000, v67, OS_LOG_TYPE_DEFAULT, " => Server is available", buf, 2u);
          }

        }
        if ((objc_msgSend_isLoading(v17, v65, v66) & 1) != 0)
        {
          if (!objc_msgSend_logToRegistration(v2, v68, v69))
          {
LABEL_63:

LABEL_64:
            goto LABEL_65;
          }
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v70, v71);
          v29 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
LABEL_62:

            goto LABEL_63;
          }
          *(_WORD *)buf = 0;
          v72 = " => Already loading";
        }
        else
        {
          objc_msgSend_startBagLoad(v17, v68, v69);
          if (!objc_msgSend_logToRegistration(v2, v106, v107))
            goto LABEL_63;
          objc_msgSend_registration(MEMORY[0x1E0D36AA8], v108, v109);
          v29 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            goto LABEL_62;
          *(_WORD *)buf = 0;
          v72 = " => Starting load";
        }
      }
      else
      {
        if (!objc_msgSend_logToRegistration(v2, v63, v64))
          goto LABEL_63;
        objc_msgSend_registration(MEMORY[0x1E0D36AA8], v89, v90);
        v29 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          goto LABEL_62;
        *(_WORD *)buf = 0;
        v72 = " => Server not available";
      }
      _os_log_impl(&dword_1A4C7F000, v29, OS_LOG_TYPE_DEFAULT, v72, buf, 2u);
      goto LABEL_62;
    }
    objc_msgSend__cleanupURLConnection(v2, v20, v21);
    if ((objc_msgSend_isValidMessage(v16, v22, v23) & 1) == 0)
    {
      objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v24, v25);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v54, v55);
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v134 = v36;
        _os_log_impl(&dword_1A4C7F000, v56, OS_LOG_TYPE_DEFAULT, "%@ Message not being delivered, invalid message", buf, 0xCu);
      }

      OSLogHandleForIDSCategory();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v134 = v36;
        _os_log_impl(&dword_1A4C7F000, v57, OS_LOG_TYPE_DEFAULT, "%@ Cancelling message delivery! invalid message!", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          v122 = v36;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          v122 = v36;
          IMLogString();
        }
      }
      objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v58, 5003, 0, v122);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__notifyDelegateAboutError_(v2, v59, (uint64_t)v50);
      v29 = 0;
      goto LABEL_60;
    }
    v132 = 0;
    hasRequiredKeys = objc_msgSend_hasRequiredKeys_(v16, v24, (uint64_t)&v132);
    v29 = v132;
    if ((hasRequiredKeys & 1) == 0)
    {
      objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v27, v28);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_warning(MEMORY[0x1E0D36AA8], v73, v74);
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        sub_1A4CBB020();

      OSLogHandleForIDSCategory();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v134 = v36;
        v135 = 2112;
        v136 = v29;
        _os_log_impl(&dword_1A4C7F000, v76, OS_LOG_TYPE_DEFAULT, "%@ Cancelling message delivery! Missing keys: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          v122 = v36;
          v123 = v29;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          v122 = v36;
          v123 = v29;
          IMLogString();
        }
      }
      if (objc_msgSend_payloadCanBeLogged(v16, v77, v78, v122, v123))
      {
        objc_msgSend_messageBodyUsingCache(v16, v79, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_description(v81, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        IDSLoggableDescriptionForObjectOnService();
        v85 = (void *)objc_claimAutoreleasedReturnValue();

        v130 = v36;
        v131 = v85;
        cut_dispatch_log_queue();

      }
      objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v79, 5008, 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__notifyDelegateAboutError_(v2, v86, (uint64_t)v50);
      goto LABEL_60;
    }
    if ((objc_msgSend_retryInAirplaneMode(v2, v27, v28) & 1) != 0
      || !objc_msgSend_isAirplaneModeEnabled(v2->_mobileNetworkManager, v30, v31)
      || (objc_msgSend_isWiFiUsable(v2->_mobileNetworkManager, v30, v32) & 1) != 0)
    {
      if (!objc_msgSend_shouldFailFastForMessage_(v2, v30, (uint64_t)v16))
      {
        if (!objc_msgSend_isTrafficDisabledOnVMForMessage_(v2, v34, (uint64_t)v16))
        {
          objc_msgSend__sendMessageAsynchronously_error_(v2, v91, (uint64_t)v16, 0);
          goto LABEL_61;
        }
        objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v91, v92);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_warning(MEMORY[0x1E0D36AA8], v93, v94);
        v95 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          sub_1A4CBAF60();

        if (objc_msgSend_payloadCanBeLogged(v16, v96, v97))
        {
          objc_msgSend_messageBodyUsingCache(v16, v98, v99);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_description(v100, v101, v102);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          IDSLoggableDescriptionForObjectOnService();
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          v124 = v36;
          v125 = v104;
          cut_dispatch_log_queue();

        }
        objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v98, 20000, 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__notifyDelegateAboutError_(v2, v105, (uint64_t)v50);
LABEL_60:

LABEL_61:
        objc_msgSend__updateWiFiAssertions(v2, v87, v88);
        goto LABEL_62;
      }
      objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_warning(MEMORY[0x1E0D36AA8], v37, v38);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        sub_1A4CBAF00();

      OSLogHandleForIDSCategory();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v134 = v36;
        _os_log_impl(&dword_1A4C7F000, v40, OS_LOG_TYPE_DEFAULT, "%@ Message not being delivered, network is unavailable, can attempt stewie", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          v122 = v36;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          v122 = v36;
          IMLogString();
        }
      }
      if (objc_msgSend_payloadCanBeLogged(v16, v41, v42, v122))
      {
        objc_msgSend_messageBodyUsingCache(v16, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_description(v45, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        IDSLoggableDescriptionForObjectOnService();
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v126 = v36;
        v127 = v49;
        cut_dispatch_log_queue();

      }
    }
    else
    {
      objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v30, v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_warning(MEMORY[0x1E0D36AA8], v110, v111);
      v112 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
        sub_1A4CBAFC0();

      OSLogHandleForIDSCategory();
      v113 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v134 = v36;
        _os_log_impl(&dword_1A4C7F000, v113, OS_LOG_TYPE_DEFAULT, "%@ Message not being delivered, airplane mode is enabled", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          v122 = v36;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          v122 = v36;
          IMLogString();
        }
      }
      if (objc_msgSend_payloadCanBeLogged(v16, v114, v115, v122))
      {
        objc_msgSend_messageBodyUsingCache(v16, v43, v116);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_description(v117, v118, v119);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        IDSLoggableDescriptionForObjectOnService();
        v121 = (void *)objc_claimAutoreleasedReturnValue();

        v128 = v36;
        v129 = v121;
        cut_dispatch_log_queue();

      }
    }
    objc_msgSend__errorForTDMessageDeliveryStatus_userInfo_(FTMessageDelivery, v43, 10000, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__notifyDelegateAboutError_(v2, v51, (uint64_t)v50);
    goto LABEL_60;
  }
  if (objc_msgSend_logToRegistration(v2, v11, v12))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v52, v53);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v16, OS_LOG_TYPE_DEFAULT, "Nothing left in queue, done", buf, 2u);
    }
    goto LABEL_64;
  }
LABEL_65:
  objc_sync_exit(v2);

}

- (void)_cleanupURLConnection
{
  FTMessageDelivery_HTTP *v2;
  const char *v3;
  uint64_t v4;
  NSObject *v5;
  FTMessageDeliveryRemoteURLConnection *remoteConnection;
  uint8_t v7[16];

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_remoteConnection && objc_msgSend_logToRegistration(v2, v3, v4))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v3, v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A4C7F000, v5, OS_LOG_TYPE_DEFAULT, "Cleaning out url connection", v7, 2u);
    }

  }
  objc_msgSend_cancel(v2->_remoteConnection, v3, v4);
  remoteConnection = v2->_remoteConnection;
  v2->_remoteConnection = 0;

  objc_sync_exit(v2);
}

- (BOOL)busy
{
  return self->_remoteConnection != 0;
}

- (BOOL)_tryRetryMessageWithTimeInterval:(double)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  unsigned int retries;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  double (**retryBackoffProvider)(id, _QWORD, double);
  double v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  int v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_logToRegistration(self, a2, v3))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      retries = self->super._retries;
      v25 = 67109120;
      LODWORD(v26) = retries;
      _os_log_impl(&dword_1A4C7F000, v8, OS_LOG_TYPE_DEFAULT, "Should retry, already tried: %d times", (uint8_t *)&v25, 8u);
    }

  }
  v10 = self->super._retries + 1;
  self->super._retries = v10;
  if (v10 > 0x59)
  {
    if (objc_msgSend_logToRegistration(self, v6, v7))
    {
      objc_msgSend_warning(MEMORY[0x1E0D36AA8], v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        sub_1A4CBB094(v17);

    }
  }
  else if (objc_msgSend_isAirplaneModeEnabled(self->_mobileNetworkManager, v6, v7)
         && (objc_msgSend_isWiFiUsable(self->_mobileNetworkManager, v11, v12) & 1) == 0)
  {
    if (objc_msgSend_logToRegistration(self, v11, v12))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v21, v22);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_1A4C7F000, v23, OS_LOG_TYPE_DEFAULT, "Not retrying right now, we're in airplane mode with no wifi", (uint8_t *)&v25, 2u);
      }

    }
    self->_pendingRetryAfterAirplaneMode = 1;
    self->_retryTimeAfterAirplaneMode = a3;
  }
  else
  {
    self->_pendingRetryAfterAirplaneMode = 0;
    retryBackoffProvider = (double (**)(id, _QWORD, double))self->_retryBackoffProvider;
    if (retryBackoffProvider)
      v14 = retryBackoffProvider[2](retryBackoffProvider, self->super._retries, a3);
    else
      v14 = 300.0;
    if (objc_msgSend_logToRegistration(self, v11, v12))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v18, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 134217984;
        v26 = v14;
        _os_log_impl(&dword_1A4C7F000, v20, OS_LOG_TYPE_DEFAULT, "Retrying - trying again in %f seconds", (uint8_t *)&v25, 0xCu);
      }

    }
    objc_msgSend__setRetryTimer_(self, v18, v19, v14);
  }
  return v10 < 0x5A;
}

- (void)queue:(id)a3 hitTimeoutForMessage:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  int v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  void *v44;
  const char *v45;
  id v46;
  uint8_t buf[4];
  _BYTE v48[10];
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend_wantsCFNetworkTimeout(v7, v8, v9))
  {
    if (objc_msgSend_logToRegistration(self, v10, v11))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v12, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v48 = v7;
        _os_log_impl(&dword_1A4C7F000, v14, OS_LOG_TYPE_DEFAULT, "Message timed out, but we're going to wait for CFNetwork: %@", buf, 0xCu);
      }

    }
    OSLogHandleForIDSCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v48 = v7;
      _os_log_impl(&dword_1A4C7F000, v15, OS_LOG_TYPE_DEFAULT, "Message timed out, but we're going to wait for CFNetwork: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
  }
  else if (objc_msgSend_wantsExtraTimeoutRetry(v7, v10, v11)
         && (v18 = objc_msgSend_timeoutRetries(v7, v16, v17), v18 < (int)objc_msgSend_maxTimeoutRetries(v7, v19, v20)))
  {
    v23 = objc_msgSend_timeoutRetries(v7, v21, v22);
    objc_msgSend_setTimeoutRetries_(v7, v24, (v23 + 1));
    if (objc_msgSend_logToRegistration(self, v25, v26))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v27, v28);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v48 = objc_msgSend_timeoutRetries(v7, v30, v31);
        *(_WORD *)&v48[4] = 1024;
        *(_DWORD *)&v48[6] = objc_msgSend_maxTimeoutRetries(v7, v32, v33);
        v49 = 2112;
        v50 = v7;
        _os_log_impl(&dword_1A4C7F000, v29, OS_LOG_TYPE_DEFAULT, "Message timed out, but we want extra timeout retries (%d/%d): %@", buf, 0x18u);
      }

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v34, v35);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v48 = 0x4000000000000000;
        _os_log_impl(&dword_1A4C7F000, v36, OS_LOG_TYPE_DEFAULT, "Retrying - trying again in %f seconds", buf, 0xCu);
      }

    }
    objc_msgSend__setRetryTimer_(self, v27, v28, 2.0);
  }
  else
  {
    OSLogHandleForIDSCategory();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v48 = v7;
      _os_log_impl(&dword_1A4C7F000, v37, OS_LOG_TYPE_DEFAULT, "Queue timed out delivery for message: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v46 = v7;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v46 = v7;
        IMLogString();
      }
    }
    if (objc_msgSend_logToRegistration(self, v38, v39, v46))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v40, v41);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v48 = v7;
        _os_log_impl(&dword_1A4C7F000, v42, OS_LOG_TYPE_DEFAULT, "Queue timed out delivery for message: %@", buf, 0xCu);
      }

    }
    objc_msgSend__clearRetryTimer(self, v40, v41);
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v43, *MEMORY[0x1E0CB32E8], -1001, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    self->super._retries = 0;
    objc_msgSend__notifyDelegateAboutError_(self, v45, (uint64_t)v44);

  }
}

- (void)cancelMessage:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  FTMessageDelivery_HTTP *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  int v19;
  const char *v20;
  uint64_t v21;
  id v22;
  _BOOL4 v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)FTMessageDelivery_HTTP;
  -[FTMessageDelivery cancelMessage:](&v31, sel_cancelMessage_, v4);
  if (v4)
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v4;
      _os_log_impl(&dword_1A4C7F000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling message in the queue: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v30 = v4;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v30 = v4;
        IMLogString();
      }
    }
    if (objc_msgSend_logToRegistration(self, v6, v7, v30))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v4;
        _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "Cancelling message in the queue: %@", buf, 0xCu);
      }

    }
    v11 = self;
    objc_sync_enter(v11);
    objc_msgSend__queue(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_messages(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_containsObject_(v17, v18, (uint64_t)v4);

    if (v19)
    {
      objc_msgSend_currentMessage(v11, v20, v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v23 = v22 == v4;

      if (v23)
      {
        v11->_pendingRetryAfterAirplaneMode = 0;
        objc_msgSend__cleanupURLConnection(v11, v24, v25);
      }
      objc_msgSend__queue(v11, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeMessage_(v26, v27, (uint64_t)v4);

      objc_msgSend__dequeueIfNeeded(v11, v28, v29);
    }
    objc_sync_exit(v11);

  }
}

- (BOOL)sendMessage:(id)a3
{
  id v4;
  FTMessageDelivery_HTTP *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  FTMessageDeliveryRemoteURLConnection *remoteConnection;
  int v34;
  id v35;
  __int16 v36;
  FTMessageDeliveryRemoteURLConnection *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend__setUsingOutgoingPush_(v4, v6, 0);
  objc_msgSend_setDeliveryMechanism_(v4, v7, 2);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v8, v9);
  objc_msgSend_setTimeSent_(v4, v10, v11);
  if (objc_msgSend_logToRegistration(v5, v12, v13))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 138412290;
      v35 = v4;
      _os_log_impl(&dword_1A4C7F000, v16, OS_LOG_TYPE_DEFAULT, "Adding message to the queue: %@", (uint8_t *)&v34, 0xCu);
    }

  }
  objc_msgSend__queue(v5, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addMessage_(v17, v18, (uint64_t)v4);

  if ((objc_msgSend_busy(v5, v19, v20) & 1) != 0)
  {
    if (objc_msgSend_logToRegistration(v5, v21, v22))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v23, v24);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend__queue(v5, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_topMessage(v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        remoteConnection = v5->_remoteConnection;
        v34 = 138412546;
        v35 = v31;
        v36 = 2112;
        v37 = remoteConnection;
        _os_log_impl(&dword_1A4C7F000, v25, OS_LOG_TYPE_DEFAULT, "  Busy delivering: %@  (%@)", (uint8_t *)&v34, 0x16u);

      }
    }
  }
  else
  {
    objc_msgSend__dequeueIfNeeded(v5, v21, v22);
  }
  objc_sync_exit(v5);

  return 1;
}

- (BOOL)sendMessageAtTopOfTheQueue:(id)a3
{
  id v4;
  FTMessageDelivery_HTTP *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  FTMessageDeliveryRemoteURLConnection *remoteConnection;
  int v32;
  id v33;
  __int16 v34;
  FTMessageDeliveryRemoteURLConnection *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v6, v7);
  objc_msgSend_setTimeSent_(v4, v8, v9);
  if (objc_msgSend_logToRegistration(v5, v10, v11))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 138412290;
      v33 = v4;
      _os_log_impl(&dword_1A4C7F000, v14, OS_LOG_TYPE_DEFAULT, "Adding message to the queue: %@", (uint8_t *)&v32, 0xCu);
    }

  }
  objc_msgSend__queue(v5, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addMessageAtHeadOfQueue_(v15, v16, (uint64_t)v4);

  if ((objc_msgSend_busy(v5, v17, v18) & 1) != 0)
  {
    if (objc_msgSend_logToRegistration(v5, v19, v20))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v21, v22);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend__queue(v5, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_topMessage(v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        remoteConnection = v5->_remoteConnection;
        v32 = 138412546;
        v33 = v29;
        v34 = 2112;
        v35 = remoteConnection;
        _os_log_impl(&dword_1A4C7F000, v23, OS_LOG_TYPE_DEFAULT, "  Busy delivering: %@  (%@)", (uint8_t *)&v32, 0x16u);

      }
    }
  }
  else
  {
    objc_msgSend__dequeueIfNeeded(v5, v19, v20);
  }
  objc_sync_exit(v5);

  return 1;
}

- (void)_serverBagLoaded:(id)a3
{
  id v4;
  FTMessageDelivery_HTTP *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  FTMessageDeliveryRemoteURLConnection *remoteConnection;
  int v23;
  void *v24;
  __int16 v25;
  FTMessageDeliveryRemoteURLConnection *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (objc_msgSend_logToRegistration(v5, v6, v7))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "Server bag loaded", (uint8_t *)&v23, 2u);
    }

  }
  if ((objc_msgSend_busy(v5, v8, v9) & 1) != 0)
  {
    if (objc_msgSend_logToRegistration(v5, v11, v12))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v13, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend__queue(v5, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_topMessage(v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        remoteConnection = v5->_remoteConnection;
        v23 = 138412546;
        v24 = v21;
        v25 = 2112;
        v26 = remoteConnection;
        _os_log_impl(&dword_1A4C7F000, v15, OS_LOG_TYPE_DEFAULT, "  Busy delivering: %@  (%@)", (uint8_t *)&v23, 0x16u);

      }
    }
  }
  else
  {
    objc_msgSend__dequeueIfNeeded(v5, v11, v12);
  }
  objc_sync_exit(v5);

}

- (BOOL)shouldFailFastForMessage:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void **v9;
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  char isConnectionSuitableForIMLOverStewie;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  BOOL v22;

  v4 = a3;
  if (!_os_feature_enabled_impl()
    || (objc_msgSend_shouldDisableFailFastWhenSatelliteIsAvailable(MEMORY[0x1E0D36AF8], v5, v6) & 1) != 0)
  {
    goto LABEL_20;
  }
  if (!qword_1ECF9D760)
  {
    v9 = (void **)MEMORY[0x1A85A5DEC]("IDSServiceNameiMessage", CFSTR("IDS"));
    if (v9)
      v10 = *v9;
    else
      v10 = 0;
    objc_storeStrong((id *)&qword_1ECF9D760, v10);
  }
  if (!qword_1ECF9D770)
  {
    v11 = (void **)MEMORY[0x1A85A5DEC]("IDSServiceNameiMessageLite", CFSTR("IDS"));
    if (v11)
      v12 = *v11;
    else
      v12 = 0;
    objc_storeStrong((id *)&qword_1ECF9D770, v12);
  }
  objc_msgSend_topic(v4, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToIgnoringCase_(v13, v14, qword_1ECF9D760) & 1) != 0)
  {
    isConnectionSuitableForIMLOverStewie = objc_msgSend_isConnectionSuitableForIMLOverStewie(self->_offGridConnectionMonitor, v15, v16);
  }
  else
  {
    objc_msgSend_topic(v4, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToIgnoringCase_(v18, v19, qword_1ECF9D770) & 1) == 0)
    {

      goto LABEL_20;
    }
    isConnectionSuitableForIMLOverStewie = objc_msgSend_isConnectionSuitableForIMLOverStewie(self->_offGridConnectionMonitor, v20, v21);

  }
  if ((isConnectionSuitableForIMLOverStewie & 1) == 0)
  {
LABEL_20:
    v22 = 0;
    goto LABEL_21;
  }
  v22 = 1;
LABEL_21:

  return v22;
}

- (void)networkStateChanged
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  double retryTimeAfterAirplaneMode;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  objc_super v18;
  uint8_t buf[4];
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)FTMessageDelivery_HTTP;
  -[FTMessageDelivery networkStateChanged](&v18, sel_networkStateChanged);
  if (self->_pendingRetryAfterAirplaneMode)
  {
    self->_pendingRetryAfterAirplaneMode = 0;
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v3, OS_LOG_TYPE_DEFAULT, "We're out of airplane mode, and we have a pending retry", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    if (objc_msgSend_logToRegistration(self, v4, v5))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v8, OS_LOG_TYPE_DEFAULT, "We're out of airplane mode, and we have a pending retry", buf, 2u);
      }

    }
    retryTimeAfterAirplaneMode = self->_retryTimeAfterAirplaneMode;
    if (retryTimeAfterAirplaneMode < 10.0)
    {
      LODWORD(retryTimeAfterAirplaneMode) = self->super._retries;
      v10 = (double)*(unint64_t *)&retryTimeAfterAirplaneMode / 10.0;
      v11 = v10 + 1.0;
      v12 = v10 <= 3.0;
      v13 = 4.0;
      if (v12)
        v13 = v11;
      retryTimeAfterAirplaneMode = __exp10(v13);
    }
    if (retryTimeAfterAirplaneMode <= 43200.0)
      v14 = retryTimeAfterAirplaneMode;
    else
      v14 = 43200.0;
    if (objc_msgSend_logToRegistration(self, v6, v7))
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v20 = v14;
        _os_log_impl(&dword_1A4C7F000, v17, OS_LOG_TYPE_DEFAULT, "Retrying - trying again in %f seconds", buf, 0xCu);
      }

    }
    objc_msgSend__setRetryTimer_(self, v15, v16, v14);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iMessageServerBag, 0);
  objc_storeStrong((id *)&self->_idsServerBag, 0);
  objc_storeStrong(&self->_timeoutBackoffProvider, 0);
  objc_storeStrong(&self->_retryBackoffProvider, 0);
  objc_storeStrong((id *)&self->_offGridConnectionMonitor, 0);
  objc_storeStrong((id *)&self->_mobileNetworkManager, 0);
  objc_storeStrong((id *)&self->_remoteConnection, 0);
  objc_storeStrong((id *)&self->_remoteConnectionFactory, 0);
}

@end
