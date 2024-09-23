@implementation IMNetworkAvailability

- (IMNetworkAvailability)initWithFlags:(unint64_t)a3 options:(unint64_t)a4 timeout:(double)a5 wifiTimeout:(double)a6 completionBlock:(id)a7
{
  id v12;
  IMNetworkAvailability *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSString *guid;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id completionBlock;
  NSObject *v25;
  const __CFString *v26;
  NSObject *v27;
  const __CFString *v28;
  NSObject *v29;
  const __CFString *v30;
  NSObject *v31;
  const __CFString *v32;
  NSObject *v33;
  const __CFString *v34;
  objc_super v36;
  uint8_t buf[4];
  _BYTE v38[14];
  __int16 v39;
  IMNetworkAvailability *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v12 = a7;
  v36.receiver = self;
  v36.super_class = (Class)IMNetworkAvailability;
  v13 = -[IMNetworkAvailability init](&v36, sel_init);
  if (v13)
  {
    OSLogHandleForIDSCategory("NetworkAvailability");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v38 = a3;
      *(_WORD *)&v38[4] = 2048;
      *(double *)&v38[6] = a5;
      v39 = 2112;
      v40 = v13;
      _os_log_impl(&dword_19066D000, v14, OS_LOG_TYPE_DEFAULT, "Creating availabilty with: 0x%X    Timeout: %f  (%@)", buf, 0x1Cu);
    }

    v18 = objc_msgSend_copyStringGUID(MEMORY[0x1E0CB3940], v15, v16, v17);
    guid = v13->_guid;
    v13->_guid = (NSString *)v18;

    v23 = objc_msgSend_copy(v12, v20, v21, v22);
    completionBlock = v13->_completionBlock;
    v13->_completionBlock = (id)v23;

    v13->_flags = a3;
    v13->_options = a4;
    v13->_timeout = a5;
    v13->_wifiTimeout = a6;
    OSLogHandleForIDSCategory("NetworkAvailability");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      if ((v13->_flags & 2) != 0)
        v26 = CFSTR("YES");
      else
        v26 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v38 = v26;
      _os_log_impl(&dword_19066D000, v25, OS_LOG_TYPE_DEFAULT, "            Wants Cellular: %@", buf, 0xCu);
    }

    OSLogHandleForIDSCategory("NetworkAvailability");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      if ((v13->_flags & 1) != 0)
        v28 = CFSTR("YES");
      else
        v28 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v38 = v28;
      _os_log_impl(&dword_19066D000, v27, OS_LOG_TYPE_DEFAULT, "                Wants WiFi: %@", buf, 0xCu);
    }

    OSLogHandleForIDSCategory("NetworkAvailability");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      if ((v13->_options & 1) != 0)
        v30 = CFSTR("YES");
      else
        v30 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v38 = v30;
      _os_log_impl(&dword_19066D000, v29, OS_LOG_TYPE_DEFAULT, "       Allow Early Timeout: %@", buf, 0xCu);
    }

    OSLogHandleForIDSCategory("NetworkAvailability");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      if ((v13->_options & 2) != 0)
        v32 = CFSTR("YES");
      else
        v32 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v38 = v32;
      _os_log_impl(&dword_19066D000, v31, OS_LOG_TYPE_DEFAULT, "      Show Network Options: %@", buf, 0xCu);
    }

    OSLogHandleForIDSCategory("NetworkAvailability");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      if ((v13->_options & 4) != 0)
        v34 = CFSTR("YES");
      else
        v34 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v38 = v34;
      _os_log_impl(&dword_19066D000, v33, OS_LOG_TYPE_DEFAULT, "       Don't wait for wifi: %@", buf, 0xCu);
    }

  }
  return v13;
}

- (IMNetworkAvailability)initWithFlags:(unint64_t)a3 timeout:(double)a4 wifiTimeout:(double)a5 completionBlock:(id)a6
{
  return (IMNetworkAvailability *)MEMORY[0x1E0DE7D20](self, sel_initWithFlags_options_timeout_wifiTimeout_completionBlock_, a3, 0);
}

- (void)dealloc
{
  NSObject *v3;
  unint64_t flags;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  IMNetworkAvailability *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory("NetworkAvailability");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    flags = self->_flags;
    *(_DWORD *)buf = 67109378;
    v10 = flags;
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_19066D000, v3, OS_LOG_TYPE_DEFAULT, "Dealloc availabilty with: 0x%X  (%@)", buf, 0x12u);
  }

  self->_context = 0;
  objc_msgSend_invalidate(self->_timer, v5, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)IMNetworkAvailability;
  -[IMNetworkAvailability dealloc](&v8, sel_dealloc);
}

- (void)_cancel
{
  uint64_t v2;
  uint64_t v3;
  IMDispatchTimer *timer;
  IMDispatchTimer *v6;
  unint64_t flags;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint8_t v22[16];
  uint8_t buf[16];

  timer = self->_timer;
  if (timer)
  {
    objc_msgSend_invalidate(timer, a2, v2, v3);
    v6 = self->_timer;
    self->_timer = 0;

  }
  flags = self->_flags;
  if ((flags & 1) != 0)
  {
    OSLogHandleForIDSCategory("NetworkAvailability");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19066D000, v8, OS_LOG_TYPE_DEFAULT, "  => Removing assertion for WiFi desired", buf, 2u);
    }

    objc_msgSend_mobileNetworkManager(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeWiFiAutoAssociationClientToken_(v12, v13, (uint64_t)self->_guid, v14);

    flags = self->_flags;
  }
  if ((flags & 2) != 0)
  {
    OSLogHandleForIDSCategory("NetworkAvailability");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_19066D000, v15, OS_LOG_TYPE_DEFAULT, "  => Removing assertion for Cellular desired", v22, 2u);
    }

    objc_msgSend_mobileNetworkManager(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeCellularAutoAssociationClientToken_(v19, v20, (uint64_t)self->_guid, v21);

  }
}

- (BOOL)_isNetworkAvailablibityCheckingDone:(BOOL)a3 wantsWiFi:(BOOL)a4 wantsCellular:(BOOL)a5 cellular:(BOOL)a6 hasCellularDataConnection:(BOOL)a7 done:(BOOL)a8 withinTimeWindow:(BOOL)a9
{
  _BOOL4 v9;
  NSObject *v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  int v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v9 = a8;
  v21 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    if (a7 && a8 && !a6)
    {
      if (a4)
      {
        if (a3)
          return v9;
        OSLogHandleForIDSCategory("NetworkAvailability");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_19066D000, v12, OS_LOG_TYPE_DEFAULT, "Cellular is not yet reachable and we don't have a usable wifi, we're not done", (uint8_t *)&v17, 2u);
        }
      }
      else
      {
        OSLogHandleForIDSCategory("NetworkAvailability");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_19066D000, v12, OS_LOG_TYPE_DEFAULT, "Cellular is not yet reachable and we don't want wifi, we're not done", (uint8_t *)&v17, 2u);
        }
      }

      v9 = 0;
    }
    if (!a3 && !a6)
    {
      OSLogHandleForIDSCategory("NetworkAvailability");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = CFSTR("NO");
        if (a9)
          v15 = CFSTR("YES");
        else
          v15 = CFSTR("NO");
        if (v9)
          v14 = CFSTR("YES");
        v17 = 138412546;
        v18 = v15;
        v19 = 2112;
        v20 = v14;
        _os_log_impl(&dword_19066D000, v13, OS_LOG_TYPE_DEFAULT, "No available interfaces, withinTimeWindow: %@, done: %@", (uint8_t *)&v17, 0x16u);
      }

      LOBYTE(v9) = v9 && !a9;
    }
  }
  return v9;
}

- (void)_timerHit:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int isHostingWiFiHotSpot;
  unint64_t options;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int isWiFiEnabled;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  int isAirplaneModeEnabled;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  int valid;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  unint64_t flags;
  double v107;
  double v108;
  int v109;
  double wifiTimeout;
  double startTime;
  uint64_t v112;
  NSObject *v113;
  double v114;
  NSObject *v115;
  NSObject *v116;
  double timeout;
  NSObject *v118;
  NSObject *v119;
  const __CFString *v120;
  NSObject *v121;
  const __CFString *v122;
  NSObject *v123;
  const __CFString *v124;
  NSObject *v125;
  const __CFString *v126;
  NSObject *v127;
  const __CFString *v128;
  NSObject *v129;
  NSObject *v130;
  const __CFString *v131;
  NSObject *v132;
  const __CFString *v133;
  NSObject *v134;
  const __CFString *v135;
  NSObject *v136;
  const __CFString *v137;
  NSObject *v138;
  const __CFString *v139;
  NSObject *v140;
  NSObject *v141;
  const __CFString *v142;
  int v143;
  NSObject *v144;
  const __CFString *v145;
  NSObject *v146;
  const __CFString *v147;
  NSObject *v148;
  const __CFString *v149;
  NSObject *v150;
  NSObject *v151;
  const __CFString *v152;
  NSObject *v153;
  const __CFString *v154;
  NSObject *v155;
  const __CFString *v156;
  NSObject *v157;
  const __CFString *v158;
  NSObject *v159;
  const __CFString *v160;
  NSObject *v161;
  const __CFString *v162;
  NSObject *v163;
  NSObject *v164;
  const __CFString *v165;
  NSObject *v166;
  const __CFString *v167;
  NSObject *v168;
  const __CFString *v169;
  NSObject *v170;
  const __CFString *v171;
  NSObject *v172;
  NSObject *v173;
  const __CFString *v174;
  NSObject *v175;
  const __CFString *v176;
  NSObject *v177;
  const __CFString *v178;
  NSObject *v179;
  const __CFString *v180;
  int v181;
  NSObject *v182;
  const __CFString *v183;
  NSObject *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  int v188;
  int v189;
  int v190;
  int v191;
  int v192;
  int v193;
  _BOOL4 v194;
  int v195;
  uint64_t v196;
  int v197;
  int v198;
  unsigned int v199;
  uint64_t v200;
  NSObject *v201;
  NSObject *v202;
  double v203;
  const char *v204;
  int hasCellularDataConnection_done_withinTimeWindow;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  double v209;
  NSObject *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  NSObject *v214;
  NSObject *v215;
  NSObject *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  NSObject *v220;
  int v221;
  id v222;
  int v223;
  int isWiFiCaptive;
  unsigned int v225;
  int v226;
  int hasLTEDataConnection;
  int isDataConnectionActive;
  int v229;
  void *v230;
  int isDataSwitchEnabled;
  int v232;
  int isWiFiAssociated;
  unsigned int v234;
  unint64_t v235;
  uint8_t buf[4];
  IMNetworkAvailability *v237;
  uint64_t v238;

  v238 = *MEMORY[0x1E0C80C00];
  v222 = a3;
  OSLogHandleForIDSCategory("NetworkAvailability");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v237 = self;
    _os_log_impl(&dword_19066D000, v4, OS_LOG_TYPE_DEFAULT, "Timer hit: %@", buf, 0xCu);
  }

  objc_msgSend_mobileNetworkManager(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isHostingWiFiHotSpot = objc_msgSend_isHostingWiFiHotSpot(v8, v9, v10, v11);

  options = self->_options;
  objc_msgSend_mobileNetworkManager(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  isWiFiEnabled = objc_msgSend_isWiFiEnabled(v17, v18, v19, v20);

  objc_msgSend_mobileNetworkManager(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  isWiFiAssociated = objc_msgSend_isWiFiAssociated(v25, v26, v27, v28);

  objc_msgSend_mobileNetworkManager(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  isWiFiCaptive = objc_msgSend_isWiFiCaptive(v32, v33, v34, v35);

  objc_msgSend_mobileNetworkManager(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_willTryToAutoAssociateWiFiNetwork(v39, v40, v41, v42);

  objc_msgSend_mobileNetworkManager(self, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v223 = objc_msgSend_willTryToSearchForWiFiNetwork(v47, v48, v49, v50);

  v235 = self->_options;
  objc_msgSend_mobileNetworkManager(self, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  isAirplaneModeEnabled = objc_msgSend_isAirplaneModeEnabled(v54, v55, v56, v57);

  objc_msgSend_mobileNetworkManager(self, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  valid = objc_msgSend_inValidSIMState(v62, v63, v64, v65);

  objc_msgSend_mobileNetworkManager(self, v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v229 = objc_msgSend_dataConnectionExists(v70, v71, v72, v73);

  objc_msgSend_mobileNetworkManager(self, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  isDataSwitchEnabled = objc_msgSend_isDataSwitchEnabled(v77, v78, v79, v80);

  objc_msgSend_mobileNetworkManager(self, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  isDataConnectionActive = objc_msgSend_isDataConnectionActive(v84, v85, v86, v87);

  objc_msgSend_mobileNetworkManager(self, v88, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  hasLTEDataConnection = objc_msgSend_hasLTEDataConnection(v91, v92, v93, v94);

  objc_msgSend_reachabilityForInternetConnection(IMNetworkReachability, v95, v96, v97);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend_currentReachabilityStatus(v230, v98, v99, v100);
  v105 = isWiFiAssociated;
  if (v104 == 1)
    v105 = 1;
  v221 = v105;
  flags = self->_flags;
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v101, v102, v103);
  v108 = v107;
  v232 = isWiFiEnabled & (isHostingWiFiHotSpot ^ 1);
  v226 = v229 & ~isAirplaneModeEnabled & isDataSwitchEnabled & valid;
  if ((flags & 1) != 0)
  {
    v109 = isWiFiEnabled & (isHostingWiFiHotSpot ^ 1) & isWiFiAssociated;
    if (v104 != 1)
      v109 = 0;
    v234 = v109 & (isWiFiCaptive ^ 1) | isHostingWiFiHotSpot & (options >> 4);
  }
  else
  {
    v234 = 0;
  }
  wifiTimeout = self->_wifiTimeout;
  startTime = self->_startTime;
  v225 = v229 & ~isAirplaneModeEnabled & isDataSwitchEnabled & valid & isDataConnectionActive;
  if (v104 == 2)
    v112 = v229 & ~isAirplaneModeEnabled & isDataSwitchEnabled & valid & isDataConnectionActive & (flags >> 1);
  else
    v112 = 0;
  OSLogHandleForIDSCategory("NetworkAvailability");
  v113 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19066D000, v113, OS_LOG_TYPE_DEFAULT, "****************************** NETWORK AVAILABILITY CHECK ******************************", buf, 2u);
  }

  v114 = v108 - startTime;
  OSLogHandleForIDSCategory("NetworkAvailability");
  v115 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v237 = *(IMNetworkAvailability **)&v114;
    _os_log_impl(&dword_19066D000, v115, OS_LOG_TYPE_DEFAULT, "               Time Passed: %f", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v116 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
  {
    timeout = self->_timeout;
    *(_DWORD *)buf = 134217984;
    v237 = *(IMNetworkAvailability **)&timeout;
    _os_log_impl(&dword_19066D000, v116, OS_LOG_TYPE_DEFAULT, "                   Timeout: %f", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v118 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v237 = *(IMNetworkAvailability **)&wifiTimeout;
    _os_log_impl(&dword_19066D000, v118, OS_LOG_TYPE_DEFAULT, "              WiFi Timeout: %f", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v119 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
  {
    v120 = CFSTR("YES");
    if ((v235 & 1) == 0)
      v120 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v120;
    _os_log_impl(&dword_19066D000, v119, OS_LOG_TYPE_DEFAULT, "       Allow Early Timeout: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v121 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
  {
    v122 = CFSTR("NO");
    if ((options & 0x10) != 0)
      v122 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v122;
    _os_log_impl(&dword_19066D000, v121, OS_LOG_TYPE_DEFAULT, "        Allow WiFi HotSpot: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v123 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
  {
    v124 = CFSTR("YES");
    if ((v235 & 2) == 0)
      v124 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v124;
    _os_log_impl(&dword_19066D000, v123, OS_LOG_TYPE_DEFAULT, "      Show Network Options: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v125 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
  {
    v126 = CFSTR("NO");
    if ((v235 & 4) != 0)
      v126 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v126;
    _os_log_impl(&dword_19066D000, v125, OS_LOG_TYPE_DEFAULT, "             Wait For WiFi: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v127 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
  {
    v128 = CFSTR("NO");
    if ((v235 & 8) != 0)
      v128 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v128;
    _os_log_impl(&dword_19066D000, v127, OS_LOG_TYPE_DEFAULT, "      Wait For WiFi or LTE: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v129 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19066D000, v129, OS_LOG_TYPE_DEFAULT, "                              ", buf, 2u);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v130 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
  {
    v131 = CFSTR("NO");
    if (v232)
      v131 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v131;
    _os_log_impl(&dword_19066D000, v130, OS_LOG_TYPE_DEFAULT, "       WiFi Switch Enabled: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v132 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
  {
    v133 = CFSTR("NO");
    if (isDataSwitchEnabled)
      v133 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v133;
    _os_log_impl(&dword_19066D000, v132, OS_LOG_TYPE_DEFAULT, "       Data Switch Enabled: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v134 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
  {
    v135 = CFSTR("NO");
    if (isAirplaneModeEnabled)
      v135 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v135;
    _os_log_impl(&dword_19066D000, v134, OS_LOG_TYPE_DEFAULT, "     Airplane Mode Enabled: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v136 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
  {
    v137 = CFSTR("NO");
    if (isHostingWiFiHotSpot)
      v137 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v137;
    _os_log_impl(&dword_19066D000, v136, OS_LOG_TYPE_DEFAULT, "      WiFi HotSpot Enabled: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v138 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
  {
    v139 = CFSTR("NO");
    if (valid)
      v139 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v139;
    _os_log_impl(&dword_19066D000, v138, OS_LOG_TYPE_DEFAULT, "        In Valid SIM State: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v140 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19066D000, v140, OS_LOG_TYPE_DEFAULT, "                              ", buf, 2u);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v141 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
  {
    v142 = CFSTR("NO");
    if (v43)
      v142 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v142;
    _os_log_impl(&dword_19066D000, v141, OS_LOG_TYPE_DEFAULT, "  Will Auto-Associate WiFi: %@", buf, 0xCu);
  }

  v143 = v223 | v43;
  OSLogHandleForIDSCategory("NetworkAvailability");
  v144 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
  {
    v145 = CFSTR("NO");
    if (v143)
      v145 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v145;
    _os_log_impl(&dword_19066D000, v144, OS_LOG_TYPE_DEFAULT, "      Will Search For WiFi: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v146 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
  {
    v147 = CFSTR("NO");
    if (isWiFiAssociated)
      v147 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v147;
    _os_log_impl(&dword_19066D000, v146, OS_LOG_TYPE_DEFAULT, "           WiFi Associated: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v148 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
  {
    v149 = CFSTR("NO");
    if (isWiFiCaptive)
      v149 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v149;
    _os_log_impl(&dword_19066D000, v148, OS_LOG_TYPE_DEFAULT, "              WiFi Captive: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v150 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19066D000, v150, OS_LOG_TYPE_DEFAULT, "                              ", buf, 2u);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v151 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
  {
    v152 = CFSTR("NO");
    if (v226)
      v152 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v152;
    _os_log_impl(&dword_19066D000, v151, OS_LOG_TYPE_DEFAULT, "              Data Enabled: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v153 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
  {
    v154 = CFSTR("NO");
    if (v229)
      v154 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v154;
    _os_log_impl(&dword_19066D000, v153, OS_LOG_TYPE_DEFAULT, "    Data Connection Exists: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v155 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
  {
    v156 = CFSTR("NO");
    if (isDataConnectionActive)
      v156 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v156;
    _os_log_impl(&dword_19066D000, v155, OS_LOG_TYPE_DEFAULT, " Data Connection Is Active: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v157 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
  {
    v158 = CFSTR("NO");
    if (v225)
      v158 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v158;
    _os_log_impl(&dword_19066D000, v157, OS_LOG_TYPE_DEFAULT, "             Has Cell Data: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v159 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
  {
    v160 = CFSTR("NO");
    if (hasLTEDataConnection)
      v160 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v160;
    _os_log_impl(&dword_19066D000, v159, OS_LOG_TYPE_DEFAULT, "              Has LTE Data: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v161 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
  {
    v162 = CFSTR("NO");
    if (isDataSwitchEnabled)
      v162 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v162;
    _os_log_impl(&dword_19066D000, v161, OS_LOG_TYPE_DEFAULT, "       Data Switch Enabled: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v163 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19066D000, v163, OS_LOG_TYPE_DEFAULT, "                              ", buf, 2u);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v164 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
  {
    v165 = CFSTR("NO");
    if (v221)
      v165 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v165;
    _os_log_impl(&dword_19066D000, v164, OS_LOG_TYPE_DEFAULT, "       WiFi Network Active: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v166 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
  {
    v167 = CFSTR("NO");
    if (v104 == 1)
      v167 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v167;
    _os_log_impl(&dword_19066D000, v166, OS_LOG_TYPE_DEFAULT, "    WiFi Network Reachable: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v168 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
  {
    v169 = CFSTR("NO");
    if (v104 == 2)
      v169 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v169;
    _os_log_impl(&dword_19066D000, v168, OS_LOG_TYPE_DEFAULT, "               Data Active: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v170 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
  {
    v171 = CFSTR("NO");
    if (v104 == 2)
      v171 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v171;
    _os_log_impl(&dword_19066D000, v170, OS_LOG_TYPE_DEFAULT, "            Data Reachable: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v172 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19066D000, v172, OS_LOG_TYPE_DEFAULT, "                              ", buf, 2u);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v173 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
  {
    v174 = CFSTR("NO");
    if ((flags & 1) != 0)
      v174 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v174;
    _os_log_impl(&dword_19066D000, v173, OS_LOG_TYPE_DEFAULT, "                Wants WiFi: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v175 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
  {
    v176 = CFSTR("NO");
    if ((flags & 2) != 0)
      v176 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v176;
    _os_log_impl(&dword_19066D000, v175, OS_LOG_TYPE_DEFAULT, "            Wants Cellular: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v177 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
  {
    v178 = CFSTR("NO");
    if (v234)
      v178 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v178;
    _os_log_impl(&dword_19066D000, v177, OS_LOG_TYPE_DEFAULT, "           Has Usable WiFi: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v179 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v179, OS_LOG_TYPE_DEFAULT))
  {
    v180 = CFSTR("NO");
    if ((_DWORD)v112)
      v180 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v180;
    _os_log_impl(&dword_19066D000, v179, OS_LOG_TYPE_DEFAULT, "       Has Usable Cellular: %@", buf, 0xCu);
  }

  v181 = v112 & hasLTEDataConnection;
  OSLogHandleForIDSCategory("NetworkAvailability");
  v182 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
  {
    v183 = CFSTR("NO");
    if (v181)
      v183 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v237 = (IMNetworkAvailability *)v183;
    _os_log_impl(&dword_19066D000, v182, OS_LOG_TYPE_DEFAULT, "            Has Usable LTE: %@", buf, 0xCu);
  }

  OSLogHandleForIDSCategory("NetworkAvailability");
  v184 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v184, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19066D000, v184, OS_LOG_TYPE_DEFAULT, "****************************************************************************************", buf, 2u);
  }

  v188 = v112 & v232;
  if ((v235 & 1) != 0)
  {
    v193 = v188 & v143;
    v194 = v112;
    if (v193 == 1)
    {
      v194 = v112;
      if ((flags & 1) != 0)
      {
        v194 = (v235 & 0xC) == 0;
        if (v114 > wifiTimeout)
          v194 = 1;
      }
    }
    if ((v143 & 1) != 0)
      v195 = 0;
    else
      v195 = flags & ((flags & 2) == 0);
    v190 = v194 | v195;
    v191 = v232;
    v192 = v226;
  }
  else
  {
    v189 = v188 & flags;
    v190 = v112;
    v191 = v232;
    v192 = v226;
    if (v189 == 1)
    {
      v190 = (v235 & 0xC) == 0;
      if (v114 > wifiTimeout)
        v190 = 1;
    }
  }
  v196 = (flags >> 1) & 1;
  v197 = v196 & ~v192 & flags;
  if (v114 <= wifiTimeout)
    v197 = 0;
  v198 = v191 | v196;
  if ((flags & 1) == 0)
    v198 = 1;
  v199 = v234;
  if (((v198 | v234) & 1) != 0)
  {
    v200 = v197 | v234 | v190 | (v191 | v192) ^ 1 | v181 & ((v235 & 8) != 0);
  }
  else
  {
    OSLogHandleForIDSCategory("NetworkAvailability");
    v201 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v201, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19066D000, v201, OS_LOG_TYPE_DEFAULT, "Wifi is not enabled, but we only want wifi, marking as done.", buf, 2u);
    }

    v200 = 1;
    v199 = v234;
  }
  if (((v200 & flags & isWiFiAssociated ^ 1 | v199) & 1) == 0)
  {
    if ((flags & 2) == 0)
    {
      OSLogHandleForIDSCategory("NetworkAvailability");
      v202 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19066D000, v202, OS_LOG_TYPE_DEFAULT, "Wifi is not yet reachable and we don't want cellular, we're not done", buf, 2u);
      }
      goto LABEL_179;
    }
    if ((v235 & 4) != 0 && v114 < wifiTimeout)
    {
      OSLogHandleForIDSCategory("NetworkAvailability");
      v202 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19066D000, v202, OS_LOG_TYPE_DEFAULT, "Wifi is not yet reachable and we haven't timed out waiting for wifi, we're not done", buf, 2u);
      }
LABEL_179:

      v200 = 0;
    }
  }
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v185, v186, v187);
  hasCellularDataConnection_done_withinTimeWindow = objc_msgSend__isNetworkAvailablibityCheckingDone_wantsWiFi_wantsCellular_cellular_hasCellularDataConnection_done_withinTimeWindow_(self, v204, v234, flags & 1, (flags >> 1) & 1, v112, v225, v200, v203 <= self->_startTime + 4.0);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v206, v207, v208);
  if (((v209 <= self->_timeout + self->_startTime) & ~hasCellularDataConnection_done_withinTimeWindow) != 0)
  {
    OSLogHandleForIDSCategory("NetworkAvailability");
    v216 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v216, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19066D000, v216, OS_LOG_TYPE_DEFAULT, "        => Continuing", buf, 2u);
    }

    objc_msgSend__setTimer(self, v217, v218, v219);
  }
  else
  {
    OSLogHandleForIDSCategory("NetworkAvailability");
    v210 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19066D000, v210, OS_LOG_TYPE_DEFAULT, "        ******* Done", buf, 2u);
    }

    objc_msgSend__cancel(self, v211, v212, v213);
    if (self->_completionBlock)
    {
      if (v234)
      {
        OSLogHandleForIDSCategory("NetworkAvailability");
        v214 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19066D000, v214, OS_LOG_TYPE_DEFAULT, "  => WiFi is Usable", buf, 2u);
        }

        if (!(_DWORD)v112)
        {
LABEL_188:
          OSLogHandleForIDSCategory("NetworkAvailability");
          v215 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19066D000, v215, OS_LOG_TYPE_DEFAULT, "  => Cellular is *NOT* usable", buf, 2u);
          }
LABEL_199:

          (*((void (**)(void))self->_completionBlock + 2))();
          goto LABEL_200;
        }
      }
      else
      {
        OSLogHandleForIDSCategory("NetworkAvailability");
        v220 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v220, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19066D000, v220, OS_LOG_TYPE_DEFAULT, "  => WiFi is *NOT* usable", buf, 2u);
        }

        if (!(_DWORD)v112)
          goto LABEL_188;
      }
      OSLogHandleForIDSCategory("NetworkAvailability");
      v215 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19066D000, v215, OS_LOG_TYPE_DEFAULT, "  => Cellular is usable", buf, 2u);
      }
      goto LABEL_199;
    }
  }
LABEL_200:

}

- (void)_setTimer
{
  NSObject *v3;
  double timeout;
  IMDispatchTimer *v5;
  void *v6;
  const char *v7;
  IMDispatchTimer *v8;
  IMDispatchTimer *timer;
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_timer)
  {
    OSLogHandleForIDSCategory("NetworkAvailability");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      timeout = self->_timeout;
      *(_DWORD *)buf = 134218240;
      v12 = 0x3FF0000000000000;
      v13 = 2048;
      v14 = timeout;
      _os_log_impl(&dword_19066D000, v3, OS_LOG_TYPE_DEFAULT, "Starting timer with time interval: %f   (Timeout: %f)", buf, 0x16u);
    }

    v5 = [IMDispatchTimer alloc];
    im_primary_queue();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1906AF130;
    v10[3] = &unk_1E2C46490;
    v10[4] = self;
    v8 = (IMDispatchTimer *)objc_msgSend_initWithQueue_interval_repeats_handlerBlock_(v5, v7, (uint64_t)v6, 1, 1, v10);
    timer = self->_timer;
    self->_timer = v8;

  }
}

- (void)start
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  char isWiFiAssociated;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  char isWiFiCaptive;
  char v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  double v53;
  int v54;
  IMNetworkAvailability *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory("NetworkAvailability");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v54 = 138412290;
    v55 = self;
    _os_log_impl(&dword_19066D000, v3, OS_LOG_TYPE_DEFAULT, "Client requested start availability check: %@", (uint8_t *)&v54, 0xCu);
  }

  if (self->_startTime == 0.0)
  {
    if ((self->_flags & 1) != 0)
    {
      OSLogHandleForIDSCategory("NetworkAvailability");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v54) = 0;
        _os_log_impl(&dword_19066D000, v7, OS_LOG_TYPE_DEFAULT, "  => Asserting WiFi desired", (uint8_t *)&v54, 2u);
      }

      objc_msgSend_mobileNetworkManager(self, v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addWiFiAutoAssociationClientToken_(v11, v12, (uint64_t)self->_guid, v13);

      objc_msgSend_mobileNetworkManager(self, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend_isWiFiEnabled(v17, v18, v19, v20);

      objc_msgSend_mobileNetworkManager(self, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      isWiFiAssociated = objc_msgSend_isWiFiAssociated(v24, v25, v26, v27);

      objc_msgSend_mobileNetworkManager(self, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      isWiFiCaptive = objc_msgSend_isWiFiCaptive(v32, v33, v34, v35);

      if ((_DWORD)v11)
        v37 = isWiFiAssociated & (isWiFiCaptive ^ 1);
      else
        v37 = 0;
      if ((self->_options & 2) != 0 && (v37 & 1) == 0)
      {
        OSLogHandleForIDSCategory("NetworkAvailability");
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v54) = 0;
          _os_log_impl(&dword_19066D000, v38, OS_LOG_TYPE_DEFAULT, "  => Show Network Options", (uint8_t *)&v54, 2u);
        }

        objc_msgSend_mobileNetworkManager(self, v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_showNetworkOptions(v42, v43, v44, v45);

      }
    }
    if ((self->_flags & 2) != 0)
    {
      OSLogHandleForIDSCategory("NetworkAvailability");
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v54) = 0;
        _os_log_impl(&dword_19066D000, v46, OS_LOG_TYPE_DEFAULT, "  => Asserting Cellular desired", (uint8_t *)&v54, 2u);
      }

      objc_msgSend_mobileNetworkManager(self, v47, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addCellularAutoAssociationClientToken_(v50, v51, (uint64_t)self->_guid, v52);

    }
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v4, v5, v6);
    self->_startTime = v53;
  }
  objc_msgSend__timerHit_(self, v4, (uint64_t)self->_timer, v6);
}

- (void)cancel
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  IMNetworkAvailability *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory("NetworkAvailability");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_19066D000, v3, OS_LOG_TYPE_DEFAULT, "Client requested cancel availability check: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend__cancel(self, v4, v5, v6);
}

- (id)mobileNetworkManager
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_sharedInstance(IMMobileNetworkManager, a2, v2, v3);
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
