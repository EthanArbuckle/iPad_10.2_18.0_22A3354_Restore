@implementation SOKerberosExtensionData

- (SOKerberosExtensionData)initWithDictionary:(id)a3
{
  id v4;
  SOKerberosExtensionData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  uint64_t v18;
  NSNumber *pwNotificationDays;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  NSNumber *pwExpireOverride;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  uint64_t v31;
  NSString *pwChangeURL;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  uint64_t v37;
  NSNumber *pwReqLength;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v43;
  NSNumber *pwReqMinAge;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  uint64_t v49;
  NSNumber *pwReqHistory;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  uint64_t v55;
  NSString *pwReqText;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  uint64_t v61;
  NSData *pwReqRTFData;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  uint64_t v67;
  NSString *helpText;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  uint64_t v73;
  NSString *customUsernameLabel;
  void *v75;
  void *v76;
  char v77;
  void *v78;
  uint64_t v79;
  NSString *cacheName;
  void *v81;
  void *v82;
  char v83;
  void *v84;
  uint64_t v85;
  NSString *principalName;
  void *v87;
  void *v88;
  char v89;
  void *v90;
  uint64_t v91;
  NSString *siteCode;
  void *v93;
  void *v94;
  char v95;
  void *v96;
  uint64_t v97;
  NSString *certificateUUID;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  char v117;
  void *v118;
  uint64_t v119;
  NSNumber *replicationTime;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t i;
  uint64_t v130;
  uint64_t v131;
  NSArray *credentialBundleIdACL;
  void *v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t j;
  uint64_t v138;
  void *v139;
  void *v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t k;
  uint64_t v146;
  uint64_t v147;
  NSDictionary *domainRealmMapping;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  char v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  char v180;
  void *v181;
  uint64_t v182;
  NSString *password;
  void *v184;
  void *v185;
  void *v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t m;
  uint64_t v192;
  void *v193;
  uint64_t v194;
  NSArray *preferredKDCs;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  uint64_t v211;
  NSString *identityIssuerAutoSelectFilter;
  void *v213;
  void *v214;
  void *v215;
  uint64_t v216;
  NSNumber *allowSmartCard;
  void *v218;
  void *v219;
  void *v220;
  uint64_t v221;
  NSNumber *allowPassword;
  void *v223;
  void *v224;
  void *v225;
  uint64_t v226;
  NSNumber *startInSmartCardMode;
  SOKerberosExtensionData *v228;
  void *v230;
  void *v231;
  SOKerberosExtensionData *v232;
  id v233;
  id v234;
  void *v235;
  id obj;
  void *v237;
  uint64_t v238;
  id v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  objc_super v256;
  _BYTE v257[128];
  _BYTE v258[128];
  _BYTE v259[128];
  _BYTE v260[128];
  uint64_t v261;

  v261 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v256.receiver = self;
  v256.super_class = (Class)SOKerberosExtensionData;
  v5 = -[SOKerberosExtensionData init](&v256, sel_init);

  if (v5)
  {
    NSStringFromSelector(sel_pwReqComplexity);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      NSStringFromSelector(sel_pwReqComplexity);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_pwReqComplexity = objc_msgSend(v9, "BOOLValue");

    }
    else
    {
      v5->_pwReqComplexity = 0;
    }
    NSStringFromSelector(sel_syncLocalPassword);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      NSStringFromSelector(sel_syncLocalPassword);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_syncLocalPassword = objc_msgSend(v13, "BOOLValue");

    }
    else
    {
      v5->_syncLocalPassword = 0;
    }
    NSStringFromSelector(sel_pwNotificationDays);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      NSStringFromSelector(sel_pwNotificationDays);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      pwNotificationDays = v5->_pwNotificationDays;
      v5->_pwNotificationDays = (NSNumber *)v18;

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 15);
      v20 = objc_claimAutoreleasedReturnValue();
      v17 = v5->_pwNotificationDays;
      v5->_pwNotificationDays = (NSNumber *)v20;
    }

    NSStringFromSelector(sel_pwExpireOverride);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = objc_opt_isKindOfClass();

    if ((v23 & 1) != 0)
    {
      NSStringFromSelector(sel_pwExpireOverride);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v24);
      v25 = objc_claimAutoreleasedReturnValue();
      pwExpireOverride = v5->_pwExpireOverride;
      v5->_pwExpireOverride = (NSNumber *)v25;

    }
    NSStringFromSelector(sel_pwChangeURL);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v29 = objc_opt_isKindOfClass();

    if ((v29 & 1) != 0)
    {
      NSStringFromSelector(sel_pwChangeURL);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v30);
      v31 = objc_claimAutoreleasedReturnValue();
      pwChangeURL = v5->_pwChangeURL;
      v5->_pwChangeURL = (NSString *)v31;

    }
    NSStringFromSelector(sel_pwReqLength);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v35 = objc_opt_isKindOfClass();

    if ((v35 & 1) != 0)
    {
      NSStringFromSelector(sel_pwReqLength);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v36);
      v37 = objc_claimAutoreleasedReturnValue();
      pwReqLength = v5->_pwReqLength;
      v5->_pwReqLength = (NSNumber *)v37;

    }
    NSStringFromSelector(sel_pwReqMinAge);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v41 = objc_opt_isKindOfClass();

    if ((v41 & 1) != 0)
    {
      NSStringFromSelector(sel_pwReqMinAge);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v42);
      v43 = objc_claimAutoreleasedReturnValue();
      pwReqMinAge = v5->_pwReqMinAge;
      v5->_pwReqMinAge = (NSNumber *)v43;

    }
    NSStringFromSelector(sel_pwReqHistory);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v47 = objc_opt_isKindOfClass();

    if ((v47 & 1) != 0)
    {
      NSStringFromSelector(sel_pwReqHistory);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v48);
      v49 = objc_claimAutoreleasedReturnValue();
      pwReqHistory = v5->_pwReqHistory;
      v5->_pwReqHistory = (NSNumber *)v49;

    }
    NSStringFromSelector(sel_pwReqText);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v53 = objc_opt_isKindOfClass();

    if ((v53 & 1) != 0)
    {
      NSStringFromSelector(sel_pwReqText);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v54);
      v55 = objc_claimAutoreleasedReturnValue();
      pwReqText = v5->_pwReqText;
      v5->_pwReqText = (NSString *)v55;

    }
    NSStringFromSelector(sel_pwReqRTFData);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v59 = objc_opt_isKindOfClass();

    if ((v59 & 1) != 0)
    {
      NSStringFromSelector(sel_pwReqRTFData);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v60);
      v61 = objc_claimAutoreleasedReturnValue();
      pwReqRTFData = v5->_pwReqRTFData;
      v5->_pwReqRTFData = (NSData *)v61;

    }
    NSStringFromSelector(sel_helpText);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v65 = objc_opt_isKindOfClass();

    if ((v65 & 1) != 0)
    {
      NSStringFromSelector(sel_helpText);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v66);
      v67 = objc_claimAutoreleasedReturnValue();
      helpText = v5->_helpText;
      v5->_helpText = (NSString *)v67;

    }
    NSStringFromSelector(sel_customUsernameLabel);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v71 = objc_opt_isKindOfClass();

    if ((v71 & 1) != 0)
    {
      NSStringFromSelector(sel_customUsernameLabel);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v72);
      v73 = objc_claimAutoreleasedReturnValue();
      customUsernameLabel = v5->_customUsernameLabel;
      v5->_customUsernameLabel = (NSString *)v73;

    }
    NSStringFromSelector(sel_cacheName);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v77 = objc_opt_isKindOfClass();

    if ((v77 & 1) != 0)
    {
      NSStringFromSelector(sel_cacheName);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v78);
      v79 = objc_claimAutoreleasedReturnValue();
      cacheName = v5->_cacheName;
      v5->_cacheName = (NSString *)v79;

    }
    NSStringFromSelector(sel_principalName);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v83 = objc_opt_isKindOfClass();

    if ((v83 & 1) != 0)
    {
      NSStringFromSelector(sel_principalName);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v84);
      v85 = objc_claimAutoreleasedReturnValue();
      principalName = v5->_principalName;
      v5->_principalName = (NSString *)v85;

    }
    NSStringFromSelector(sel_siteCode);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v89 = objc_opt_isKindOfClass();

    if ((v89 & 1) != 0)
    {
      NSStringFromSelector(sel_siteCode);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v90);
      v91 = objc_claimAutoreleasedReturnValue();
      siteCode = v5->_siteCode;
      v5->_siteCode = (NSString *)v91;

    }
    NSStringFromSelector(sel_certificateUUID);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v95 = objc_opt_isKindOfClass();

    if ((v95 & 1) != 0)
    {
      NSStringFromSelector(sel_certificateUUID);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v96);
      v97 = objc_claimAutoreleasedReturnValue();
      certificateUUID = v5->_certificateUUID;
      v5->_certificateUUID = (NSString *)v97;

    }
    NSStringFromSelector(sel_useSiteAutoDiscovery);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (v100)
    {
      NSStringFromSelector(sel_useSiteAutoDiscovery);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_useSiteAutoDiscovery = objc_msgSend(v102, "BOOLValue");

    }
    else
    {
      v5->_useSiteAutoDiscovery = 1;
    }
    NSStringFromSelector(sel_allowAutomaticLogin);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    if (v104)
    {
      NSStringFromSelector(sel_allowAutomaticLogin);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_allowAutomaticLogin = objc_msgSend(v106, "BOOLValue");

    }
    else
    {
      v5->_allowAutomaticLogin = 1;
    }
    NSStringFromSelector(sel_requireUserPresence);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();

    if (v108)
    {
      NSStringFromSelector(sel_requireUserPresence);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_requireUserPresence = objc_msgSend(v110, "BOOLValue");

    }
    else
    {
      v5->_requireUserPresence = 0;
    }
    NSStringFromSelector(sel_monitorCredentialsCache);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    if (v112)
    {
      NSStringFromSelector(sel_monitorCredentialsCache);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v113);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_monitorCredentialsCache = objc_msgSend(v114, "BOOLValue");

    }
    else
    {
      v5->_monitorCredentialsCache = 1;
    }
    NSStringFromSelector(sel_replicationTime);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v117 = objc_opt_isKindOfClass();

    if ((v117 & 1) != 0)
    {
      NSStringFromSelector(sel_replicationTime);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v118);
      v119 = objc_claimAutoreleasedReturnValue();
      replicationTime = v5->_replicationTime;
      v5->_replicationTime = (NSNumber *)v119;

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 1800.0);
      v121 = objc_claimAutoreleasedReturnValue();
      v118 = v5->_replicationTime;
      v5->_replicationTime = (NSNumber *)v121;
    }

    NSStringFromSelector(sel_credentialBundleIdACL);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();

    if (v123)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v252 = 0u;
        v253 = 0u;
        v254 = 0u;
        v255 = 0u;
        v125 = v123;
        v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v252, v260, 16);
        if (v126)
        {
          v127 = v126;
          v128 = *(_QWORD *)v253;
          do
          {
            for (i = 0; i != v127; ++i)
            {
              if (*(_QWORD *)v253 != v128)
                objc_enumerationMutation(v125);
              v130 = *(_QWORD *)(*((_QWORD *)&v252 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v124, "addObject:", v130);
            }
            v127 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v252, v260, 16);
          }
          while (v127);
        }

        v131 = objc_msgSend(v124, "copy");
        credentialBundleIdACL = v5->_credentialBundleIdACL;
        v5->_credentialBundleIdACL = (NSArray *)v131;

      }
    }
    NSStringFromSelector(sel_domainRealmMapping);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    v235 = v134;
    if (v134)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v230 = v123;
        v232 = v5;
        v233 = v4;
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        v248 = 0u;
        v249 = 0u;
        v250 = 0u;
        v251 = 0u;
        v239 = v134;
        objc_msgSend(v239, "allKeys");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v135 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v248, v259, 16);
        if (v135)
        {
          v136 = v135;
          v238 = *(_QWORD *)v249;
          do
          {
            for (j = 0; j != v136; ++j)
            {
              if (*(_QWORD *)v249 != v238)
                objc_enumerationMutation(obj);
              v138 = *(_QWORD *)(*((_QWORD *)&v248 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v239, "objectForKeyedSubscript:", v138);
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              v244 = 0u;
              v245 = 0u;
              v246 = 0u;
              v247 = 0u;
              v141 = v140;
              v142 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v244, v258, 16);
              if (v142)
              {
                v143 = v142;
                v144 = *(_QWORD *)v245;
                do
                {
                  for (k = 0; k != v143; ++k)
                  {
                    if (*(_QWORD *)v245 != v144)
                      objc_enumerationMutation(v141);
                    v146 = *(_QWORD *)(*((_QWORD *)&v244 + 1) + 8 * k);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      objc_msgSend(v139, "addObject:", v146);
                  }
                  v143 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v244, v258, 16);
                }
                while (v143);
              }

              if (objc_msgSend(v139, "count"))
                objc_msgSend(v237, "setObject:forKeyedSubscript:", v139, v138);

            }
            v136 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v248, v259, 16);
          }
          while (v136);
        }

        v147 = objc_msgSend(v237, "copy");
        v5 = v232;
        domainRealmMapping = v232->_domainRealmMapping;
        v232->_domainRealmMapping = (NSDictionary *)v147;

        v4 = v233;
        v123 = v230;
      }
    }
    NSStringFromSelector(sel_isDefaultRealm);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v149);
    v150 = (void *)objc_claimAutoreleasedReturnValue();

    if (v150)
    {
      NSStringFromSelector(sel_isDefaultRealm);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v151);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_isDefaultRealm = objc_msgSend(v152, "BOOLValue");

    }
    else
    {
      v5->_isDefaultRealm = 0;
    }
    NSStringFromSelector(sel_allowPasswordChange);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v153);
    v154 = (void *)objc_claimAutoreleasedReturnValue();

    if (v154)
    {
      NSStringFromSelector(sel_allowPasswordChange);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v155);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_allowPasswordChange = objc_msgSend(v156, "BOOLValue");

    }
    else
    {
      v5->_allowPasswordChange = 1;
    }
    NSStringFromSelector(sel_delayUserSetup);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v157);
    v158 = (void *)objc_claimAutoreleasedReturnValue();

    if (v158)
    {
      NSStringFromSelector(sel_delayUserSetup);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v159);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_delayUserSetup = objc_msgSend(v160, "BOOLValue");

    }
    else
    {
      v5->_delayUserSetup = 0;
    }
    NSStringFromSelector(sel_requireTLSForLDAP);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();

    if (v162)
    {
      NSStringFromSelector(sel_requireTLSForLDAP);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v163);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_requireTLSForLDAP = objc_msgSend(v164, "BOOLValue");

    }
    else
    {
      v5->_requireTLSForLDAP = 0;
    }
    NSStringFromSelector(sel_includeManagedAppsInBundleIdACL);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();

    if (v166)
    {
      NSStringFromSelector(sel_includeManagedAppsInBundleIdACL);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_includeManagedAppsInBundleIdACL = objc_msgSend(v168, "BOOLValue");

    }
    else
    {
      v5->_includeManagedAppsInBundleIdACL = 0;
    }
    NSStringFromSelector(sel_includeKerberosAppsInBundleIdACL);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v169);
    v170 = (void *)objc_claimAutoreleasedReturnValue();

    if (v170)
    {
      NSStringFromSelector(sel_includeKerberosAppsInBundleIdACL);
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v171);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_includeKerberosAppsInBundleIdACL = objc_msgSend(v172, "BOOLValue");

    }
    else
    {
      v5->_includeKerberosAppsInBundleIdACL = 0;
    }
    NSStringFromSelector(sel_credentialUseMode);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v175 = objc_opt_isKindOfClass();

    if ((v175 & 1) != 0)
    {
      NSStringFromSelector(sel_credentialUseMode);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v176);
      v177 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v177, "isEqualToString:", CFSTR("kerberosDefault")))
        v5->_credentialUseMode = 0;
      if (objc_msgSend(v177, "isEqualToString:", CFSTR("whenNotSpecified")))
        v5->_credentialUseMode = 1;
      if (objc_msgSend(v177, "isEqualToString:", CFSTR("always")))
        v5->_credentialUseMode = 2;

    }
    else
    {
      v5->_credentialUseMode = 2;
    }
    if (objc_msgSend(MEMORY[0x24BE043A0], "isInternalBuild"))
    {
      NSStringFromSelector(sel_password);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v178);
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v180 = objc_opt_isKindOfClass();

      if ((v180 & 1) != 0)
      {
        NSStringFromSelector(sel_password);
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v181);
        v182 = objc_claimAutoreleasedReturnValue();
        password = v5->_password;
        v5->_password = (NSString *)v182;

      }
    }
    NSStringFromSelector(sel_preferredKDCs);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v184);
    v185 = (void *)objc_claimAutoreleasedReturnValue();

    if (v185)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v231 = v123;
        v234 = v4;
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        v240 = 0u;
        v241 = 0u;
        v242 = 0u;
        v243 = 0u;
        v187 = v185;
        v188 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v240, v257, 16);
        if (v188)
        {
          v189 = v188;
          v190 = *(_QWORD *)v241;
          do
          {
            for (m = 0; m != v189; ++m)
            {
              if (*(_QWORD *)v241 != v190)
                objc_enumerationMutation(v187);
              v192 = *(_QWORD *)(*((_QWORD *)&v240 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                +[SOKerberosServer serverWithString:](SOKerberosServer, "serverWithString:", v192);
                v193 = (void *)objc_claimAutoreleasedReturnValue();

                if (v193)
                  objc_msgSend(v186, "addObject:", v192);
              }
            }
            v189 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v240, v257, 16);
          }
          while (v189);
        }

        v194 = objc_msgSend(v186, "copy");
        preferredKDCs = v5->_preferredKDCs;
        v5->_preferredKDCs = (NSArray *)v194;

        v4 = v234;
        v123 = v231;
      }
    }
    NSStringFromSelector(sel_usePlatformSSOTGT);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v196);
    v197 = (void *)objc_claimAutoreleasedReturnValue();

    if (v197)
    {
      NSStringFromSelector(sel_usePlatformSSOTGT);
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v198);
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_usePlatformSSOTGT = objc_msgSend(v199, "BOOLValue");

    }
    else
    {
      v5->_usePlatformSSOTGT = 0;
    }
    NSStringFromSelector(sel_allowPlatformSSOAuthFallback);
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v200);
    v201 = (void *)objc_claimAutoreleasedReturnValue();

    if (v201)
    {
      NSStringFromSelector(sel_allowPlatformSSOAuthFallback);
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v202);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_allowPlatformSSOAuthFallback = objc_msgSend(v203, "BOOLValue");

    }
    else
    {
      v5->_allowPlatformSSOAuthFallback = 1;
    }
    NSStringFromSelector(sel_performKerberosOnly);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v204);
    v205 = (void *)objc_claimAutoreleasedReturnValue();

    if (v205)
    {
      NSStringFromSelector(sel_performKerberosOnly);
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v206);
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_performKerberosOnly = objc_msgSend(v207, "BOOLValue");

    }
    else
    {
      v5->_performKerberosOnly = 0;
    }
    NSStringFromSelector(sel_identityIssuerAutoSelectFilter);
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v208);
    v209 = (void *)objc_claimAutoreleasedReturnValue();

    if (v209)
    {
      NSStringFromSelector(sel_identityIssuerAutoSelectFilter);
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v210);
      v211 = objc_claimAutoreleasedReturnValue();
      identityIssuerAutoSelectFilter = v5->_identityIssuerAutoSelectFilter;
      v5->_identityIssuerAutoSelectFilter = (NSString *)v211;

    }
    else
    {
      v5->_performKerberosOnly = 0;
    }
    NSStringFromSelector(sel_allowSmartCard);
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v213);
    v214 = (void *)objc_claimAutoreleasedReturnValue();

    if (v214)
    {
      NSStringFromSelector(sel_allowSmartCard);
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v215);
      v216 = objc_claimAutoreleasedReturnValue();
      allowSmartCard = v5->_allowSmartCard;
      v5->_allowSmartCard = (NSNumber *)v216;

    }
    else
    {
      v215 = v5->_allowSmartCard;
      v5->_allowSmartCard = (NSNumber *)MEMORY[0x24BDBD1C8];
    }

    NSStringFromSelector(sel_allowPassword);
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v218);
    v219 = (void *)objc_claimAutoreleasedReturnValue();

    if (v219)
    {
      NSStringFromSelector(sel_allowPassword);
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v220);
      v221 = objc_claimAutoreleasedReturnValue();
      allowPassword = v5->_allowPassword;
      v5->_allowPassword = (NSNumber *)v221;

    }
    else
    {
      v220 = v5->_allowPassword;
      v5->_allowPassword = (NSNumber *)MEMORY[0x24BDBD1C8];
    }

    NSStringFromSelector(sel_startInSmartCardMode);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v223);
    v224 = (void *)objc_claimAutoreleasedReturnValue();

    if (v224)
    {
      NSStringFromSelector(sel_startInSmartCardMode);
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v225);
      v226 = objc_claimAutoreleasedReturnValue();
      startInSmartCardMode = v5->_startInSmartCardMode;
      v5->_startInSmartCardMode = (NSNumber *)v226;

    }
    else
    {
      v225 = v5->_startInSmartCardMode;
      v5->_startInSmartCardMode = (NSNumber *)MEMORY[0x24BDBD1C0];
    }

  }
  v228 = v5;

  return v228;
}

- (NSString)cacheName
{
  return self->_cacheName;
}

- (void)setCacheName:(id)a3
{
  objc_storeStrong((id *)&self->_cacheName, a3);
}

- (NSString)principalName
{
  return self->_principalName;
}

- (void)setPrincipalName:(id)a3
{
  objc_storeStrong((id *)&self->_principalName, a3);
}

- (NSString)siteCode
{
  return self->_siteCode;
}

- (void)setSiteCode:(id)a3
{
  objc_storeStrong((id *)&self->_siteCode, a3);
}

- (NSString)certificateUUID
{
  return self->_certificateUUID;
}

- (void)setCertificateUUID:(id)a3
{
  objc_storeStrong((id *)&self->_certificateUUID, a3);
}

- (BOOL)useSiteAutoDiscovery
{
  return self->_useSiteAutoDiscovery;
}

- (void)setUseSiteAutoDiscovery:(BOOL)a3
{
  self->_useSiteAutoDiscovery = a3;
}

- (NSArray)credentialBundleIdACL
{
  return self->_credentialBundleIdACL;
}

- (void)setCredentialBundleIdACL:(id)a3
{
  objc_storeStrong((id *)&self->_credentialBundleIdACL, a3);
}

- (BOOL)includeManagedAppsInBundleIdACL
{
  return self->_includeManagedAppsInBundleIdACL;
}

- (void)setIncludeManagedAppsInBundleIdACL:(BOOL)a3
{
  self->_includeManagedAppsInBundleIdACL = a3;
}

- (BOOL)includeKerberosAppsInBundleIdACL
{
  return self->_includeKerberosAppsInBundleIdACL;
}

- (void)setIncludeKerberosAppsInBundleIdACL:(BOOL)a3
{
  self->_includeKerberosAppsInBundleIdACL = a3;
}

- (NSDictionary)domainRealmMapping
{
  return self->_domainRealmMapping;
}

- (void)setDomainRealmMapping:(id)a3
{
  objc_storeStrong((id *)&self->_domainRealmMapping, a3);
}

- (BOOL)isDefaultRealm
{
  return self->_isDefaultRealm;
}

- (void)setIsDefaultRealm:(BOOL)a3
{
  self->_isDefaultRealm = a3;
}

- (BOOL)allowPasswordChange
{
  return self->_allowPasswordChange;
}

- (void)setAllowPasswordChange:(BOOL)a3
{
  self->_allowPasswordChange = a3;
}

- (BOOL)allowAutomaticLogin
{
  return self->_allowAutomaticLogin;
}

- (void)setAllowAutomaticLogin:(BOOL)a3
{
  self->_allowAutomaticLogin = a3;
}

- (BOOL)requireUserPresence
{
  return self->_requireUserPresence;
}

- (void)setRequireUserPresence:(BOOL)a3
{
  self->_requireUserPresence = a3;
}

- (NSString)pwChangeURL
{
  return self->_pwChangeURL;
}

- (void)setPwChangeURL:(id)a3
{
  objc_storeStrong((id *)&self->_pwChangeURL, a3);
}

- (NSNumber)pwExpireOverride
{
  return self->_pwExpireOverride;
}

- (void)setPwExpireOverride:(id)a3
{
  objc_storeStrong((id *)&self->_pwExpireOverride, a3);
}

- (NSNumber)pwNotificationDays
{
  return self->_pwNotificationDays;
}

- (void)setPwNotificationDays:(id)a3
{
  objc_storeStrong((id *)&self->_pwNotificationDays, a3);
}

- (BOOL)pwReqComplexity
{
  return self->_pwReqComplexity;
}

- (void)setPwReqComplexity:(BOOL)a3
{
  self->_pwReqComplexity = a3;
}

- (NSNumber)pwReqLength
{
  return self->_pwReqLength;
}

- (void)setPwReqLength:(id)a3
{
  objc_storeStrong((id *)&self->_pwReqLength, a3);
}

- (NSNumber)pwReqMinAge
{
  return self->_pwReqMinAge;
}

- (void)setPwReqMinAge:(id)a3
{
  objc_storeStrong((id *)&self->_pwReqMinAge, a3);
}

- (NSNumber)pwReqHistory
{
  return self->_pwReqHistory;
}

- (void)setPwReqHistory:(id)a3
{
  objc_storeStrong((id *)&self->_pwReqHistory, a3);
}

- (NSString)pwReqText
{
  return self->_pwReqText;
}

- (void)setPwReqText:(id)a3
{
  objc_storeStrong((id *)&self->_pwReqText, a3);
}

- (NSData)pwReqRTFData
{
  return self->_pwReqRTFData;
}

- (void)setPwReqRTFData:(id)a3
{
  objc_storeStrong((id *)&self->_pwReqRTFData, a3);
}

- (NSString)helpText
{
  return self->_helpText;
}

- (void)setHelpText:(id)a3
{
  objc_storeStrong((id *)&self->_helpText, a3);
}

- (NSString)customUsernameLabel
{
  return self->_customUsernameLabel;
}

- (void)setCustomUsernameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_customUsernameLabel, a3);
}

- (NSNumber)replicationTime
{
  return self->_replicationTime;
}

- (void)setReplicationTime:(id)a3
{
  objc_storeStrong((id *)&self->_replicationTime, a3);
}

- (BOOL)syncLocalPassword
{
  return self->_syncLocalPassword;
}

- (void)setSyncLocalPassword:(BOOL)a3
{
  self->_syncLocalPassword = a3;
}

- (BOOL)monitorCredentialsCache
{
  return self->_monitorCredentialsCache;
}

- (void)setMonitorCredentialsCache:(BOOL)a3
{
  self->_monitorCredentialsCache = a3;
}

- (BOOL)delayUserSetup
{
  return self->_delayUserSetup;
}

- (void)setDelayUserSetup:(BOOL)a3
{
  self->_delayUserSetup = a3;
}

- (int64_t)credentialUseMode
{
  return self->_credentialUseMode;
}

- (void)setCredentialUseMode:(int64_t)a3
{
  self->_credentialUseMode = a3;
}

- (BOOL)requireTLSForLDAP
{
  return self->_requireTLSForLDAP;
}

- (void)setRequireTLSForLDAP:(BOOL)a3
{
  self->_requireTLSForLDAP = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (NSArray)preferredKDCs
{
  return self->_preferredKDCs;
}

- (void)setPreferredKDCs:(id)a3
{
  objc_storeStrong((id *)&self->_preferredKDCs, a3);
}

- (BOOL)usePlatformSSOTGT
{
  return self->_usePlatformSSOTGT;
}

- (void)setUsePlatformSSOTGT:(BOOL)a3
{
  self->_usePlatformSSOTGT = a3;
}

- (BOOL)allowPlatformSSOAuthFallback
{
  return self->_allowPlatformSSOAuthFallback;
}

- (void)setAllowPlatformSSOAuthFallback:(BOOL)a3
{
  self->_allowPlatformSSOAuthFallback = a3;
}

- (BOOL)performKerberosOnly
{
  return self->_performKerberosOnly;
}

- (void)setPerformKerberosOnly:(BOOL)a3
{
  self->_performKerberosOnly = a3;
}

- (NSString)identityIssuerAutoSelectFilter
{
  return self->_identityIssuerAutoSelectFilter;
}

- (void)setIdentityIssuerAutoSelectFilter:(id)a3
{
  objc_storeStrong((id *)&self->_identityIssuerAutoSelectFilter, a3);
}

- (NSNumber)allowSmartCard
{
  return self->_allowSmartCard;
}

- (void)setAllowSmartCard:(id)a3
{
  objc_storeStrong((id *)&self->_allowSmartCard, a3);
}

- (NSNumber)allowPassword
{
  return self->_allowPassword;
}

- (void)setAllowPassword:(id)a3
{
  objc_storeStrong((id *)&self->_allowPassword, a3);
}

- (NSNumber)startInSmartCardMode
{
  return self->_startInSmartCardMode;
}

- (void)setStartInSmartCardMode:(id)a3
{
  objc_storeStrong((id *)&self->_startInSmartCardMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startInSmartCardMode, 0);
  objc_storeStrong((id *)&self->_allowPassword, 0);
  objc_storeStrong((id *)&self->_allowSmartCard, 0);
  objc_storeStrong((id *)&self->_identityIssuerAutoSelectFilter, 0);
  objc_storeStrong((id *)&self->_preferredKDCs, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_replicationTime, 0);
  objc_storeStrong((id *)&self->_customUsernameLabel, 0);
  objc_storeStrong((id *)&self->_helpText, 0);
  objc_storeStrong((id *)&self->_pwReqRTFData, 0);
  objc_storeStrong((id *)&self->_pwReqText, 0);
  objc_storeStrong((id *)&self->_pwReqHistory, 0);
  objc_storeStrong((id *)&self->_pwReqMinAge, 0);
  objc_storeStrong((id *)&self->_pwReqLength, 0);
  objc_storeStrong((id *)&self->_pwNotificationDays, 0);
  objc_storeStrong((id *)&self->_pwExpireOverride, 0);
  objc_storeStrong((id *)&self->_pwChangeURL, 0);
  objc_storeStrong((id *)&self->_domainRealmMapping, 0);
  objc_storeStrong((id *)&self->_credentialBundleIdACL, 0);
  objc_storeStrong((id *)&self->_certificateUUID, 0);
  objc_storeStrong((id *)&self->_siteCode, 0);
  objc_storeStrong((id *)&self->_principalName, 0);
  objc_storeStrong((id *)&self->_cacheName, 0);
}

@end
