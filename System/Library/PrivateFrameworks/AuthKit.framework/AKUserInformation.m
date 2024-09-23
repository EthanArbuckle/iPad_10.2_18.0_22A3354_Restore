@implementation AKUserInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKUserInformation)initWithResponseBody:(id)a3
{
  id v4;
  AKUserInformation *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSNumber *v11;
  NSNumber *isMdmInfoRequired;
  void *v13;
  NSNumber *v14;
  NSNumber *isUnderage;
  void *v16;
  NSNumber *v17;
  NSNumber *isSiwaForChildEnabled;
  void *v19;
  uint64_t v20;
  void *v21;
  NSNumber *v22;
  NSNumber *activeHMECount;
  void *v24;
  NSNumber *v25;
  NSNumber *inActiveHMECount;
  void *v27;
  NSNumber *v28;
  NSNumber *isSenior;
  void *v30;
  NSNumber *v31;
  NSNumber *ageOfMajority;
  void *v33;
  NSNumber *v34;
  NSNumber *isLegacyStudent;
  uint64_t v36;
  NSString *masterKeyID;
  uint64_t v38;
  void *v39;
  NSString *v40;
  NSObject *accountName;
  uint64_t v42;
  void *v43;
  NSString *v44;
  NSObject *primaryEmailAddress;
  void *v46;
  uint64_t v47;
  NSObject *p_super;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  NSString *v56;
  NSObject *givenName;
  void *v58;
  NSString *v59;
  NSObject *familyName;
  uint64_t v61;
  void *v62;
  NSNumber *v63;
  NSObject *v64;
  NSNumber *phoneAsAppleID;
  uint64_t v66;
  void *v67;
  NSString *v68;
  NSObject *appleIDCountryCode;
  void *v70;
  NSNumber *v71;
  NSNumber *hasUsedAuthorization;
  void *v73;
  NSNumber *v74;
  NSNumber *privateAttestationEnabled;
  void *v76;
  NSNumber *v77;
  NSNumber *vettedPrimaryEmail;
  NSObject *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  NSObject *v83;
  void *v84;
  uint64_t v85;
  NSObject *v86;
  void *v87;
  uint64_t v88;
  NSObject *v89;
  void *v90;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;
  void *v94;
  NSString *v95;
  NSObject *forwardingEmail;
  void *v97;
  NSNumber *v98;
  NSNumber *previouslyWantedPrivateEmail;
  void *v100;
  NSString *v101;
  NSObject *previouslySelectedEmail;
  uint64_t v103;
  void *v104;
  NSString *v105;
  NSObject *authorizedApplicationsListVersion;
  uint64_t v107;
  void *v108;
  NSString *v109;
  NSObject *privateEmailListVersion;
  void *v111;
  NSNumber *v112;
  NSObject *v113;
  void *v114;
  NSNumber *v115;
  NSObject *v116;
  void *v117;
  NSNumber *v118;
  NSObject *v119;
  void *v120;
  NSNumber *v121;
  NSObject *v122;
  void *v123;
  NSNumber *v124;
  NSObject *v125;
  void *v126;
  NSNumber *v127;
  NSObject *v128;
  void *v129;
  NSNumber *v130;
  NSObject *v131;
  void *v132;
  NSNumber *v133;
  NSObject *v134;
  void *v135;
  void *v136;
  void *v137;
  NSObject *v138;
  NSNumber *v139;
  void *v140;
  NSObject *v141;
  NSObject *v142;
  void *v143;
  NSNumber *v144;
  NSObject *v145;
  void *v146;
  NSString *v147;
  NSObject *notificationEmail;
  void *v149;
  NSNumber *v150;
  NSNumber *isProximityAuthEligible;
  NSObject *v152;
  NSObject *v153;
  NSObject *v154;
  id v155;
  NSNumber *v156;
  NSNumber *webAccessEnabled;
  id v158;
  NSNumber *v159;
  NSNumber *serverExperimentalFeatures;
  id v161;
  NSNumber *v162;
  NSNumber *passkeyEligible;
  id v164;
  NSNumber *v165;
  NSNumber *passkeyPresent;
  id v167;
  NSNumber *v168;
  NSNumber *groupKitEligibility;
  id v170;
  NSNumber *v171;
  NSNumber *passcodeAuthEnabled;
  id v173;
  NSNumber *v174;
  NSNumber *askToBuy;
  void *v176;
  void *v177;
  const __CFString *v178;
  id v179;
  id v180;
  NSNumber *v181;
  NSNumber *hasSOSActiveDevice;
  id v183;
  NSNumber *v184;
  NSNumber *SOSNeeded;
  id v186;
  NSString *v187;
  NSString *deviceListVersion;
  id v189;
  NSNumber *v190;
  NSNumber *birthYear;
  id v192;
  NSNumber *v193;
  NSNumber *birthMonth;
  id v195;
  NSNumber *v196;
  NSNumber *birthDay;
  void *v198;
  NSString *v199;
  NSObject *configDataVersion;
  id v201;
  NSNumber *v202;
  NSNumber *hasModernRecoveryKey;
  id v204;
  NSNumber *v205;
  NSNumber *thirdPartyRegulatoryOverride;
  id v207;
  NSNumber *v208;
  NSNumber *criticalAccountEditsAllowed;
  id v210;
  NSNumber *v211;
  NSNumber *adpCohort;
  void *v213;
  id v214;
  NSNumber *v215;
  NSNumber *piggybackingApprovalEligible;
  AKUserInformation *v217;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  uint8_t buf[8];
  objc_super v261;

  v4 = a3;
  v261.receiver = self;
  v261.super_class = (Class)AKUserInformation;
  v5 = -[AKUserInformation init](&v261, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ut"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(v6, "unsignedIntegerValue");
    else
      v7 = 0;
    v5->_appleIDSecurityLevel = v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("authmode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = objc_msgSend(v8, "unsignedIntegerValue");
    else
      v9 = 0;
    v5->_authMode = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mdmInfoRequired"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v247 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    isMdmInfoRequired = v5->_isMdmInfoRequired;
    v5->_isMdmInfoRequired = v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("underAge"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    isUnderage = v5->_isUnderage;
    v5->_isUnderage = v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSiwaEnabled"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    isSiwaForChildEnabled = v5->_isSiwaForChildEnabled;
    v5->_isSiwaForChildEnabled = v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userAgeRange"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = objc_msgSend(v19, "unsignedIntegerValue");
    else
      v20 = 0;
    v5->_userAgeRange = v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activeHMECount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    activeHMECount = v5->_activeHMECount;
    v5->_activeHMECount = v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inActiveHMECount"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v246 = v13;
    v242 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
    inActiveHMECount = v5->_inActiveHMECount;
    v5->_inActiveHMECount = v25;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSenior"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;
    isSenior = v5->_isSenior;
    v5->_isSenior = v28;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ageOfMajority"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v240 = v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;
    ageOfMajority = v5->_ageOfMajority;
    v5->_ageOfMajority = v31;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("studentAccount"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v239 = v33;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v33;
    else
      v34 = 0;
    isLegacyStudent = v5->_isLegacyStudent;
    v5->_isLegacyStudent = v34;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mkid"));
    v36 = objc_claimAutoreleasedReturnValue();
    masterKeyID = v5->_masterKeyID;
    v5->_masterKeyID = (NSString *)v36;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accountName"));
    v38 = objc_claimAutoreleasedReturnValue();
    v248 = v8;
    v259 = (void *)v38;
    if (v38)
    {
      v39 = (void *)v38;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = v39;
        accountName = v5->_accountName;
        v5->_accountName = v40;
      }
      else
      {
        _AKLogSystem();
        accountName = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(accountName, OS_LOG_TYPE_ERROR))
          -[AKUserInformation initWithResponseBody:].cold.45();
      }
    }
    else
    {
      _AKLogSystem();
      accountName = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(accountName, OS_LOG_TYPE_ERROR))
        -[AKUserInformation initWithResponseBody:].cold.44();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primaryEmail"));
    v42 = objc_claimAutoreleasedReturnValue();
    v249 = v6;
    v238 = (void *)v42;
    if (v42)
    {
      v43 = (void *)v42;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = v43;
        primaryEmailAddress = v5->_primaryEmailAddress;
        v5->_primaryEmailAddress = v44;
      }
      else
      {
        _AKLogSystem();
        primaryEmailAddress = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(primaryEmailAddress, OS_LOG_TYPE_ERROR))
          -[AKUserInformation initWithResponseBody:].cold.43();
      }
    }
    else
    {
      _AKLogSystem();
      primaryEmailAddress = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(primaryEmailAddress, OS_LOG_TYPE_ERROR))
        -[AKUserInformation initWithResponseBody:].cold.42();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aliases"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = objc_msgSend(v46, "copy");
        p_super = &v5->_accountAliases->super;
        v5->_accountAliases = (NSArray *)v47;
      }
      else
      {
        _AKLogSystem();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          -[AKUserInformation initWithResponseBody:].cold.41();
      }
    }
    else
    {
      _AKLogSystem();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.40();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("additionalInfo"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v236 = v49;
    if (v49)
    {
      v50 = objc_msgSend(v49, "copy");
      v51 = &v5->_additionalInfo->super;
      v5->_additionalInfo = (NSDictionary *)v50;
    }
    else
    {
      _AKLogSystem();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.39();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rep"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v245 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v53 = objc_msgSend(v52, "unsignedIntegerValue");
    else
      v53 = 0;
    v5->_repairState = v53;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstName"));
    v54 = objc_claimAutoreleasedReturnValue();
    v235 = v52;
    v257 = (void *)v54;
    if (v54)
    {
      v55 = (void *)v54;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v56 = v55;
        givenName = v5->_givenName;
        v5->_givenName = v56;
      }
      else
      {
        _AKLogSystem();
        givenName = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(givenName, OS_LOG_TYPE_ERROR))
          -[AKUserInformation initWithResponseBody:].cold.38();
      }
    }
    else
    {
      _AKLogSystem();
      givenName = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(givenName, OS_LOG_TYPE_ERROR))
        -[AKUserInformation initWithResponseBody:].cold.37();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastName"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v59 = v58;
        familyName = v5->_familyName;
        v5->_familyName = v59;
      }
      else
      {
        _AKLogSystem();
        familyName = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(familyName, OS_LOG_TYPE_ERROR))
          -[AKUserInformation initWithResponseBody:].cold.36();
      }
    }
    else
    {
      _AKLogSystem();
      familyName = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(familyName, OS_LOG_TYPE_ERROR))
        -[AKUserInformation initWithResponseBody:].cold.35();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneAsAppleId"));
    v61 = objc_claimAutoreleasedReturnValue();
    v256 = (void *)v61;
    if (v61)
    {
      v62 = (void *)v61;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v63 = v62;
        v64 = &v5->_phoneAsAppleID->super.super;
        v5->_phoneAsAppleID = v63;
      }
      else
      {
        phoneAsAppleID = v5->_phoneAsAppleID;
        v5->_phoneAsAppleID = 0;

        _AKLogSystem();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          -[AKUserInformation initWithResponseBody:].cold.34();
      }
    }
    else
    {
      _AKLogSystem();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.33();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countryCode"));
    v66 = objc_claimAutoreleasedReturnValue();
    v255 = (void *)v66;
    if (v66)
    {
      v67 = (void *)v66;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v68 = v67;
        appleIDCountryCode = v5->_appleIDCountryCode;
        v5->_appleIDCountryCode = v68;
      }
      else
      {
        _AKLogSystem();
        appleIDCountryCode = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(appleIDCountryCode, OS_LOG_TYPE_ERROR))
          -[AKUserInformation initWithResponseBody:].cold.32();
      }
    }
    else
    {
      _AKLogSystem();
      appleIDCountryCode = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(appleIDCountryCode, OS_LOG_TYPE_ERROR))
        -[AKUserInformation initWithResponseBody:].cold.31();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appleIdSignInEnabled"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v241 = v27;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v71 = v70;
    else
      v71 = 0;
    hasUsedAuthorization = v5->_hasUsedAuthorization;
    v5->_hasUsedAuthorization = v71;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("privateAttestationEnabled"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v232 = v73;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v74 = v73;
    else
      v74 = 0;
    privateAttestationEnabled = v5->_privateAttestationEnabled;
    v5->_privateAttestationEnabled = v74;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("primaryEmailVetted"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v233 = v70;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v77 = v76;
      vettedPrimaryEmail = v5->_vettedPrimaryEmail;
      v5->_vettedPrimaryEmail = v77;
    }
    else
    {
      _AKLogSystem();
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.30();

      vettedPrimaryEmail = v5->_vettedPrimaryEmail;
      v5->_vettedPrimaryEmail = 0;
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reachableEmails"));
    v80 = objc_claimAutoreleasedReturnValue();
    v254 = (void *)v80;
    if (v80)
    {
      v81 = (void *)v80;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v82 = objc_msgSend(v81, "copy");
        v83 = &v5->_reachableEmails->super;
        v5->_reachableEmails = (NSArray *)v82;
      }
      else
      {
        _AKLogSystem();
        v83 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
          -[AKUserInformation initWithResponseBody:].cold.29();
      }
    }
    else
    {
      _AKLogSystem();
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.28();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hsa2Phones"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v230 = v84;
    if (objc_msgSend(v84, "count"))
    {
      v85 = objc_msgSend(v84, "copy");
      v86 = &v5->_trustedPhoneNumbers->super;
      v5->_trustedPhoneNumbers = (NSArray *)v85;
    }
    else
    {
      _AKLogSystem();
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.27();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("securityKeys"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v253 = v87;
    if (objc_msgSend(v87, "count"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v88 = objc_msgSend(v87, "copy");
        v89 = &v5->_securityKeys->super;
        v5->_securityKeys = (NSArray *)v88;
      }
      else
      {
        _AKLogSystem();
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          -[AKUserInformation initWithResponseBody:].cold.26();
      }
    }
    else
    {
      _AKLogSystem();
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.25();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("loginHandles"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v229 = v90;
    if (objc_msgSend(v90, "count"))
    {
      v91 = objc_msgSend(v90, "copy");
      v92 = &v5->_loginHandles->super;
      v5->_loginHandles = (NSArray *)v91;
    }
    else
    {
      _AKLogSystem();
      v92 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.24();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("forwardTo"));
    v93 = objc_claimAutoreleasedReturnValue();
    v252 = (void *)v93;
    if (v93)
    {
      v94 = (void *)v93;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v95 = v94;
        forwardingEmail = v5->_forwardingEmail;
        v5->_forwardingEmail = v95;
      }
      else
      {
        _AKLogSystem();
        forwardingEmail = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(forwardingEmail, OS_LOG_TYPE_ERROR))
          -[AKUserInformation initWithResponseBody:].cold.23();
      }
    }
    else
    {
      _AKLogSystem();
      forwardingEmail = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(forwardingEmail, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.22();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previouslySelectedAsPrivateEmail"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v98 = v97;
    else
      v98 = 0;
    v228 = v97;
    previouslyWantedPrivateEmail = v5->_previouslyWantedPrivateEmail;
    v5->_previouslyWantedPrivateEmail = v98;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previouslySelectedEmail"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v258 = v100;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v101 = v100;
      previouslySelectedEmail = v5->_previouslySelectedEmail;
      v5->_previouslySelectedEmail = v101;
    }
    else
    {
      _AKLogSystem();
      previouslySelectedEmail = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(previouslySelectedEmail, OS_LOG_TYPE_ERROR))
        -[AKUserInformation initWithResponseBody:].cold.21();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("authorizedAppListVersion"));
    v103 = objc_claimAutoreleasedReturnValue();
    v251 = (void *)v103;
    if (v103)
    {
      v104 = (void *)v103;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v105 = v104;
        authorizedApplicationsListVersion = v5->_authorizedApplicationsListVersion;
        v5->_authorizedApplicationsListVersion = v105;
      }
      else
      {
        _AKLogSystem();
        authorizedApplicationsListVersion = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(authorizedApplicationsListVersion, OS_LOG_TYPE_ERROR))
          -[AKUserInformation initWithResponseBody:].cold.20();
      }
    }
    else
    {
      _AKLogSystem();
      authorizedApplicationsListVersion = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(authorizedApplicationsListVersion, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.19();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hmeListVersion"));
    v107 = objc_claimAutoreleasedReturnValue();
    v250 = (void *)v107;
    if (v107)
    {
      v108 = (void *)v107;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v109 = v108;
        privateEmailListVersion = v5->_privateEmailListVersion;
        v5->_privateEmailListVersion = v109;
      }
      else
      {
        _AKLogSystem();
        privateEmailListVersion = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(privateEmailListVersion, OS_LOG_TYPE_ERROR))
          -[AKUserInformation initWithResponseBody:].cold.18();
      }
    }
    else
    {
      _AKLogSystem();
      privateEmailListVersion = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(privateEmailListVersion, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19202F000, privateEmailListVersion, OS_LOG_TYPE_DEFAULT, "No private email list version set for this account", buf, 2u);
      }
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeCustodian"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v227 = v111;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v112 = v111;
      v113 = &v5->_canBeCustodian->super.super;
      v5->_canBeCustodian = v112;
    }
    else
    {
      _AKLogSystem();
      v113 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.17();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canHaveCustodian"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v226 = v114;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v115 = v114;
      v116 = &v5->_canHaveCustodian->super.super;
      v5->_canHaveCustodian = v115;
    }
    else
    {
      _AKLogSystem();
      v116 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.16();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("custodianEnabled"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v225 = v117;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v118 = v117;
      v119 = &v5->_custodianEnabled->super.super;
      v5->_custodianEnabled = v118;
    }
    else
    {
      _AKLogSystem();
      v119 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.15();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("custodianLastUpdateDate"));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v224 = v120;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v121 = v120;
      v122 = &v5->_custodianLastModified->super.super;
      v5->_custodianLastModified = v121;
    }
    else
    {
      _AKLogSystem();
      v122 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.14();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canBeBeneficiary"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v223 = v123;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v124 = v123;
      v125 = &v5->_canBeBeneficiary->super.super;
      v5->_canBeBeneficiary = v124;
    }
    else
    {
      _AKLogSystem();
      v125 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.13();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("canHaveBeneficiary"));
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v222 = v126;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v127 = v126;
      v128 = &v5->_canHaveBeneficiary->super.super;
      v5->_canHaveBeneficiary = v127;
    }
    else
    {
      _AKLogSystem();
      v128 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.12();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("beneficiaryLastUpdateDate"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v221 = v129;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v130 = v129;
      v131 = &v5->_beneficiaryLastModified->super.super;
      v5->_beneficiaryLastModified = v130;
    }
    else
    {
      _AKLogSystem();
      v131 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.11();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appleManagedAccount"));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v243 = v21;
    v220 = v132;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v133 = v132;
      v134 = &v5->_hasMDM->super.super;
      v5->_hasMDM = v133;
    }
    else
    {
      _AKLogSystem();
      v134 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v134, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.10();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("orgType"));
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v244 = v19;
    v231 = v76;
    if (v135)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v136 = v58;
        if (objc_msgSend(v135, "isEqual:", CFSTR("EDU")))
        {
          v137 = v46;
          v138 = &v5->_managedOrganizationType->super.super;
          v139 = (NSNumber *)&unk_1E2E9A400;
        }
        else
        {
          v137 = v46;
          if (objc_msgSend(v135, "isEqual:", CFSTR("ENT")))
          {
            v138 = &v5->_managedOrganizationType->super.super;
            v139 = (NSNumber *)&unk_1E2E9A418;
          }
          else
          {
            _AKLogSystem();
            v141 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
              -[AKUserInformation initWithResponseBody:].cold.8();

            v138 = &v5->_managedOrganizationType->super.super;
            v139 = (NSNumber *)&unk_1E2E9A430;
          }
        }
        v5->_managedOrganizationType = v139;
      }
      else
      {
        _AKLogSystem();
        v138 = objc_claimAutoreleasedReturnValue();
        v136 = v58;
        v137 = v46;
        if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
          -[AKUserInformation initWithResponseBody:].cold.9();
      }

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("orgName"));
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_storeStrong((id *)&v5->_managedOrganizationName, v140);
      }
      else
      {
        _AKLogSystem();
        v142 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
          -[AKUserInformation initWithResponseBody:].cold.7();

      }
      v46 = v137;
      v58 = v136;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("orgName"));
      v140 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v219 = v140;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("notificationEmailAvailable"));
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    if (v143)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v144 = v143;
        v145 = &v5->_isNotificationEmailAvailable->super.super;
        v5->_isNotificationEmailAvailable = v144;
      }
      else
      {
        _AKLogSystem();
        v145 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
          -[AKUserInformation initWithResponseBody:].cold.6();
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("notificationEmail"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    if (v146)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v147 = v146;
        notificationEmail = v5->_notificationEmail;
        v5->_notificationEmail = v147;
      }
      else
      {
        _AKLogSystem();
        notificationEmail = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(notificationEmail, OS_LOG_TYPE_ERROR))
          -[AKUserInformation initWithResponseBody:].cold.5();
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isProximityAuthEligible"));
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v150 = v149;
      isProximityAuthEligible = v5->_isProximityAuthEligible;
      v5->_isProximityAuthEligible = v150;
    }
    else
    {
      _AKLogSystem();
      v152 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v152, OS_LOG_TYPE_DEBUG))
        -[AKUserInformation initWithResponseBody:].cold.4();

      isProximityAuthEligible = v5->_isProximityAuthEligible;
      v5->_isProximityAuthEligible = 0;
    }

    _AKLogSystem();
    v153 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v153, OS_LOG_TYPE_DEBUG))
      -[AKUserInformation initWithResponseBody:].cold.3();
    v234 = v58;

    -[AKUserInformation _parseCustodianInfo:](v5, "_parseCustodianInfo:", v4);
    _AKLogSystem();
    v154 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
      -[AKUserInformation initWithResponseBody:].cold.2();

    -[AKUserInformation _parseBeneficiaryInfo:](v5, "_parseBeneficiaryInfo:", v4);
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("webAccessEnabled"));
    v155 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v156 = (NSNumber *)v155;
    else
      v156 = 0;

    webAccessEnabled = v5->_webAccessEnabled;
    v5->_webAccessEnabled = v156;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverExperimentalFeatures"));
    v158 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v159 = (NSNumber *)v158;
    else
      v159 = 0;

    serverExperimentalFeatures = v5->_serverExperimentalFeatures;
    v5->_serverExperimentalFeatures = v159;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("passkeyEligible"));
    v161 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v162 = (NSNumber *)v161;
    else
      v162 = 0;

    passkeyEligible = v5->_passkeyEligible;
    v5->_passkeyEligible = v162;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("passkeyPresent"));
    v164 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v165 = (NSNumber *)v164;
    else
      v165 = 0;

    passkeyPresent = v5->_passkeyPresent;
    v5->_passkeyPresent = v165;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupkitEligibilityInd"));
    v167 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v168 = (NSNumber *)v167;
    else
      v168 = 0;

    groupKitEligibility = v5->_groupKitEligibility;
    v5->_groupKitEligibility = v168;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("passcodeAuthEnabled"));
    v170 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v171 = (NSNumber *)v170;
    else
      v171 = 0;

    passcodeAuthEnabled = v5->_passcodeAuthEnabled;
    v5->_passcodeAuthEnabled = v171;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("askToBuy"));
    v173 = (id)objc_claimAutoreleasedReturnValue();
    v237 = v46;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v174 = (NSNumber *)v173;
    else
      v174 = 0;

    askToBuy = v5->_askToBuy;
    v5->_askToBuy = v174;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SOSCompatibilityOptInNeeded"));
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (v176)
    {
      v177 = v4;
      v178 = CFSTR("SOSCompatibilityOptInNeeded");
    }
    else
    {
      v178 = CFSTR("hasSOSActiveDevice");
      v177 = v4;
    }
    objc_msgSend(v177, "objectForKeyedSubscript:", v178);
    v179 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v180 = v179;
    else
      v180 = 0;

    v181 = (NSNumber *)v180;
    hasSOSActiveDevice = v5->_hasSOSActiveDevice;
    v5->_hasSOSActiveDevice = v181;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SOSNeeded"));
    v183 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v184 = (NSNumber *)v183;
    else
      v184 = 0;

    SOSNeeded = v5->_SOSNeeded;
    v5->_SOSNeeded = v184;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceListVersion"));
    v186 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v187 = (NSString *)v186;
    else
      v187 = 0;

    deviceListVersion = v5->_deviceListVersion;
    v5->_deviceListVersion = v187;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("yob"));
    v189 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v190 = (NSNumber *)v189;
    else
      v190 = 0;

    birthYear = v5->_birthYear;
    v5->_birthYear = v190;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("birthMM"));
    v192 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v193 = (NSNumber *)v192;
    else
      v193 = 0;

    birthMonth = v5->_birthMonth;
    v5->_birthMonth = v193;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("birthDD"));
    v195 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v196 = (NSNumber *)v195;
    else
      v196 = 0;

    birthDay = v5->_birthDay;
    v5->_birthDay = v196;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configDataVersion"));
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    if (v198)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v199 = v198;
        configDataVersion = v5->_configDataVersion;
        v5->_configDataVersion = v199;
      }
      else
      {
        _AKLogSystem();
        configDataVersion = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(configDataVersion, OS_LOG_TYPE_ERROR))
          -[AKUserInformation initWithResponseBody:].cold.1();
      }
    }
    else
    {
      _AKLogSystem();
      configDataVersion = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(configDataVersion, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19202F000, configDataVersion, OS_LOG_TYPE_DEFAULT, "No config data version set for this account", buf, 2u);
      }
    }

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasRK"));
    v201 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v202 = (NSNumber *)v201;
    else
      v202 = 0;

    hasModernRecoveryKey = v5->_hasModernRecoveryKey;
    v5->_hasModernRecoveryKey = v202;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("3PRegulatoryOverride"));
    v204 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v205 = (NSNumber *)v204;
    else
      v205 = 0;

    thirdPartyRegulatoryOverride = v5->_thirdPartyRegulatoryOverride;
    v5->_thirdPartyRegulatoryOverride = v205;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isCriticalAccountEditAllowed"));
    v207 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v208 = (NSNumber *)v207;
    else
      v208 = 0;

    criticalAccountEditsAllowed = v5->_criticalAccountEditsAllowed;
    v5->_criticalAccountEditsAllowed = v208;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adpCh"));
    v210 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v211 = (NSNumber *)v210;
    else
      v211 = 0;

    adpCohort = v5->_adpCohort;
    v5->_adpCohort = v211;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pbae"));
    v213 = (void *)objc_claimAutoreleasedReturnValue();

    if (v213)
    {
      objc_opt_class();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pbae"));
      v214 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v215 = (NSNumber *)v214;
      else
        v215 = 0;

      piggybackingApprovalEligible = v5->_piggybackingApprovalEligible;
      v5->_piggybackingApprovalEligible = v215;

    }
  }
  v217 = v5;

  return v217;
}

- (AKUserInformation)initWithCoder:(id)a3
{
  id v4;
  AKUserInformation *v5;
  uint64_t v6;
  NSString *givenName;
  uint64_t v8;
  NSString *familyName;
  uint64_t v10;
  NSString *forwardingEmail;
  uint64_t v12;
  NSString *primaryEmailAddress;
  uint64_t v14;
  NSString *accountName;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *accountAliases;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *reachableEmails;
  uint64_t v26;
  NSString *previouslySelectedEmail;
  uint64_t v28;
  NSNumber *ageOfMajority;
  uint64_t v30;
  NSString *authorizedApplicationsListVersion;
  uint64_t v32;
  NSString *masterKeyID;
  uint64_t v34;
  NSNumber *vettedPrimaryEmail;
  uint64_t v36;
  NSNumber *phoneAsAppleID;
  uint64_t v38;
  NSNumber *isUnderage;
  uint64_t v40;
  NSNumber *isSiwaForChildEnabled;
  uint64_t v42;
  NSNumber *isSenior;
  uint64_t v44;
  NSNumber *isLegacyStudent;
  uint64_t v46;
  NSNumber *hasUsedAuthorization;
  uint64_t v48;
  NSNumber *privateAttestationEnabled;
  uint64_t v50;
  NSNumber *previouslyWantedPrivateEmail;
  uint64_t v52;
  NSNumber *isMdmInfoRequired;
  uint64_t v54;
  NSString *selectedEmail;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  NSDictionary *additionalInfo;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  NSArray *trustedPhoneNumbers;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  NSArray *securityKeys;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  NSArray *loginHandles;
  uint64_t v80;
  NSString *privateEmailListVersion;
  uint64_t v82;
  NSNumber *canBeCustodian;
  uint64_t v84;
  NSNumber *canHaveCustodian;
  uint64_t v86;
  NSNumber *custodianEnabled;
  uint64_t v88;
  NSNumber *custodianLastModified;
  uint64_t v90;
  NSNumber *canBeBeneficiary;
  uint64_t v92;
  NSNumber *canHaveBeneficiary;
  uint64_t v94;
  NSNumber *beneficiaryLastModified;
  uint64_t v96;
  NSString *appleIDCountryCode;
  uint64_t v98;
  NSNumber *hasMDM;
  uint64_t v100;
  NSNumber *managedOrganizationType;
  uint64_t v102;
  NSString *managedOrganizationName;
  uint64_t v104;
  NSNumber *isNotificationEmailAvailable;
  uint64_t v106;
  NSString *notificationEmail;
  uint64_t v108;
  NSNumber *webAccessEnabled;
  uint64_t v110;
  NSNumber *serverExperimentalFeatures;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  NSArray *custodianInfos;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  NSArray *beneficiaryInfo;
  uint64_t v124;
  NSNumber *passkeyEligible;
  uint64_t v126;
  NSNumber *passkeyPresent;
  uint64_t v128;
  NSNumber *isProximityAuthEligible;
  uint64_t v130;
  NSNumber *groupKitEligibility;
  uint64_t v132;
  NSNumber *passcodeAuthEnabled;
  uint64_t v134;
  NSNumber *askToBuy;
  uint64_t v136;
  NSNumber *hasSOSActiveDevice;
  uint64_t v138;
  NSNumber *SOSNeeded;
  uint64_t v140;
  NSString *deviceListVersion;
  uint64_t v142;
  NSString *configDataVersion;
  uint64_t v144;
  NSNumber *birthYear;
  uint64_t v146;
  NSNumber *birthDay;
  uint64_t v148;
  NSNumber *birthMonth;
  uint64_t v150;
  NSNumber *hasModernRecoveryKey;
  uint64_t v152;
  NSNumber *thirdPartyRegulatoryOverride;
  uint64_t v154;
  NSNumber *criticalAccountEditsAllowed;
  uint64_t v156;
  NSNumber *adpCohort;
  uint64_t v158;
  NSNumber *piggybackingApprovalEligible;
  objc_super v161;

  v4 = a3;
  v161.receiver = self;
  v161.super_class = (Class)AKUserInformation;
  v5 = -[AKUserInformation init](&v161, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_givenName"));
    v6 = objc_claimAutoreleasedReturnValue();
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_familyName"));
    v8 = objc_claimAutoreleasedReturnValue();
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_forwardingEmail"));
    v10 = objc_claimAutoreleasedReturnValue();
    forwardingEmail = v5->_forwardingEmail;
    v5->_forwardingEmail = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_primaryEmailAddress"));
    v12 = objc_claimAutoreleasedReturnValue();
    primaryEmailAddress = v5->_primaryEmailAddress;
    v5->_primaryEmailAddress = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accountName"));
    v14 = objc_claimAutoreleasedReturnValue();
    accountName = v5->_accountName;
    v5->_accountName = (NSString *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("_accountAliases"));
    v19 = objc_claimAutoreleasedReturnValue();
    accountAliases = v5->_accountAliases;
    v5->_accountAliases = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("_reachableEmails"));
    v24 = objc_claimAutoreleasedReturnValue();
    reachableEmails = v5->_reachableEmails;
    v5->_reachableEmails = (NSArray *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_previouslySelectedEmail"));
    v26 = objc_claimAutoreleasedReturnValue();
    previouslySelectedEmail = v5->_previouslySelectedEmail;
    v5->_previouslySelectedEmail = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ageOfMajority"));
    v28 = objc_claimAutoreleasedReturnValue();
    ageOfMajority = v5->_ageOfMajority;
    v5->_ageOfMajority = (NSNumber *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_authorizedApplicationsListVersion"));
    v30 = objc_claimAutoreleasedReturnValue();
    authorizedApplicationsListVersion = v5->_authorizedApplicationsListVersion;
    v5->_authorizedApplicationsListVersion = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_masterKeyID"));
    v32 = objc_claimAutoreleasedReturnValue();
    masterKeyID = v5->_masterKeyID;
    v5->_masterKeyID = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_vettedPrimaryEmail"));
    v34 = objc_claimAutoreleasedReturnValue();
    vettedPrimaryEmail = v5->_vettedPrimaryEmail;
    v5->_vettedPrimaryEmail = (NSNumber *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_phoneAsAppleID"));
    v36 = objc_claimAutoreleasedReturnValue();
    phoneAsAppleID = v5->_phoneAsAppleID;
    v5->_phoneAsAppleID = (NSNumber *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isUnderage"));
    v38 = objc_claimAutoreleasedReturnValue();
    isUnderage = v5->_isUnderage;
    v5->_isUnderage = (NSNumber *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isSiwAEnabled"));
    v40 = objc_claimAutoreleasedReturnValue();
    isSiwaForChildEnabled = v5->_isSiwaForChildEnabled;
    v5->_isSiwaForChildEnabled = (NSNumber *)v40;

    v5->_userAgeRange = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_userAgeRange"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isSenior"));
    v42 = objc_claimAutoreleasedReturnValue();
    isSenior = v5->_isSenior;
    v5->_isSenior = (NSNumber *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isLegacyStudent"));
    v44 = objc_claimAutoreleasedReturnValue();
    isLegacyStudent = v5->_isLegacyStudent;
    v5->_isLegacyStudent = (NSNumber *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hasUsedAuthorization"));
    v46 = objc_claimAutoreleasedReturnValue();
    hasUsedAuthorization = v5->_hasUsedAuthorization;
    v5->_hasUsedAuthorization = (NSNumber *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_privateAttestationEnabled"));
    v48 = objc_claimAutoreleasedReturnValue();
    privateAttestationEnabled = v5->_privateAttestationEnabled;
    v5->_privateAttestationEnabled = (NSNumber *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_previouslyWantedPrivateEmail"));
    v50 = objc_claimAutoreleasedReturnValue();
    previouslyWantedPrivateEmail = v5->_previouslyWantedPrivateEmail;
    v5->_previouslyWantedPrivateEmail = (NSNumber *)v50;

    v5->_appleIDSecurityLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_appleIDSecurityLevel"));
    v5->_authMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_authMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isMdmInfoRequired"));
    v52 = objc_claimAutoreleasedReturnValue();
    isMdmInfoRequired = v5->_isMdmInfoRequired;
    v5->_isMdmInfoRequired = (NSNumber *)v52;

    v5->_repairState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_repairState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_selectedEmail"));
    v54 = objc_claimAutoreleasedReturnValue();
    selectedEmail = v5->_selectedEmail;
    v5->_selectedEmail = (NSString *)v54;

    v56 = (void *)MEMORY[0x1E0C99E60];
    v57 = objc_opt_class();
    v58 = objc_opt_class();
    v59 = objc_opt_class();
    v60 = objc_opt_class();
    objc_msgSend(v56, "setWithObjects:", v57, v58, v59, v60, objc_opt_class(), 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v61, CFSTR("_additionalInfo"));
    v62 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v5->_additionalInfo;
    v5->_additionalInfo = (NSDictionary *)v62;

    v64 = (void *)MEMORY[0x1E0C99E60];
    v65 = objc_opt_class();
    objc_msgSend(v64, "setWithObjects:", v65, objc_opt_class(), 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v66, CFSTR("_trustedPhoneNumbers"));
    v67 = objc_claimAutoreleasedReturnValue();
    trustedPhoneNumbers = v5->_trustedPhoneNumbers;
    v5->_trustedPhoneNumbers = (NSArray *)v67;

    v69 = (void *)MEMORY[0x1E0C99E60];
    v70 = objc_opt_class();
    v71 = objc_opt_class();
    objc_msgSend(v69, "setWithObjects:", v70, v71, objc_opt_class(), 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v72, CFSTR("_securityKeys"));
    v73 = objc_claimAutoreleasedReturnValue();
    securityKeys = v5->_securityKeys;
    v5->_securityKeys = (NSArray *)v73;

    v75 = (void *)MEMORY[0x1E0C99E60];
    v76 = objc_opt_class();
    objc_msgSend(v75, "setWithObjects:", v76, objc_opt_class(), 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v77, CFSTR("_loginHandles"));
    v78 = objc_claimAutoreleasedReturnValue();
    loginHandles = v5->_loginHandles;
    v5->_loginHandles = (NSArray *)v78;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_privateEmailListVersion"));
    v80 = objc_claimAutoreleasedReturnValue();
    privateEmailListVersion = v5->_privateEmailListVersion;
    v5->_privateEmailListVersion = (NSString *)v80;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_canBeCustodian"));
    v82 = objc_claimAutoreleasedReturnValue();
    canBeCustodian = v5->_canBeCustodian;
    v5->_canBeCustodian = (NSNumber *)v82;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_canHaveCustodian"));
    v84 = objc_claimAutoreleasedReturnValue();
    canHaveCustodian = v5->_canHaveCustodian;
    v5->_canHaveCustodian = (NSNumber *)v84;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianEnabled"));
    v86 = objc_claimAutoreleasedReturnValue();
    custodianEnabled = v5->_custodianEnabled;
    v5->_custodianEnabled = (NSNumber *)v86;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianLastModified"));
    v88 = objc_claimAutoreleasedReturnValue();
    custodianLastModified = v5->_custodianLastModified;
    v5->_custodianLastModified = (NSNumber *)v88;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_canBeBeneficiary"));
    v90 = objc_claimAutoreleasedReturnValue();
    canBeBeneficiary = v5->_canBeBeneficiary;
    v5->_canBeBeneficiary = (NSNumber *)v90;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_canHaveBeneficiary"));
    v92 = objc_claimAutoreleasedReturnValue();
    canHaveBeneficiary = v5->_canHaveBeneficiary;
    v5->_canHaveBeneficiary = (NSNumber *)v92;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryLastModified"));
    v94 = objc_claimAutoreleasedReturnValue();
    beneficiaryLastModified = v5->_beneficiaryLastModified;
    v5->_beneficiaryLastModified = (NSNumber *)v94;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_appleIDCountryCode"));
    v96 = objc_claimAutoreleasedReturnValue();
    appleIDCountryCode = v5->_appleIDCountryCode;
    v5->_appleIDCountryCode = (NSString *)v96;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hasMDM"));
    v98 = objc_claimAutoreleasedReturnValue();
    hasMDM = v5->_hasMDM;
    v5->_hasMDM = (NSNumber *)v98;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_managedOrganizationType"));
    v100 = objc_claimAutoreleasedReturnValue();
    managedOrganizationType = v5->_managedOrganizationType;
    v5->_managedOrganizationType = (NSNumber *)v100;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_managedOrganizationName"));
    v102 = objc_claimAutoreleasedReturnValue();
    managedOrganizationName = v5->_managedOrganizationName;
    v5->_managedOrganizationName = (NSString *)v102;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isNotificationEmailAvailable"));
    v104 = objc_claimAutoreleasedReturnValue();
    isNotificationEmailAvailable = v5->_isNotificationEmailAvailable;
    v5->_isNotificationEmailAvailable = (NSNumber *)v104;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_notificationEmail"));
    v106 = objc_claimAutoreleasedReturnValue();
    notificationEmail = v5->_notificationEmail;
    v5->_notificationEmail = (NSString *)v106;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_webAccessEnabled"));
    v108 = objc_claimAutoreleasedReturnValue();
    webAccessEnabled = v5->_webAccessEnabled;
    v5->_webAccessEnabled = (NSNumber *)v108;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serverExperimentalFeatures"));
    v110 = objc_claimAutoreleasedReturnValue();
    serverExperimentalFeatures = v5->_serverExperimentalFeatures;
    v5->_serverExperimentalFeatures = (NSNumber *)v110;

    v112 = (void *)MEMORY[0x1E0C99E60];
    v113 = objc_opt_class();
    v114 = objc_opt_class();
    objc_msgSend(v112, "setWithObjects:", v113, v114, objc_opt_class(), 0);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v115, CFSTR("_custodianInfos"));
    v116 = objc_claimAutoreleasedReturnValue();
    custodianInfos = v5->_custodianInfos;
    v5->_custodianInfos = (NSArray *)v116;

    v118 = (void *)MEMORY[0x1E0C99E60];
    v119 = objc_opt_class();
    v120 = objc_opt_class();
    objc_msgSend(v118, "setWithObjects:", v119, v120, objc_opt_class(), 0);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v121, CFSTR("_beneficiaryInfo"));
    v122 = objc_claimAutoreleasedReturnValue();
    beneficiaryInfo = v5->_beneficiaryInfo;
    v5->_beneficiaryInfo = (NSArray *)v122;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_passkeyEligible"));
    v124 = objc_claimAutoreleasedReturnValue();
    passkeyEligible = v5->_passkeyEligible;
    v5->_passkeyEligible = (NSNumber *)v124;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_passkeyPresent"));
    v126 = objc_claimAutoreleasedReturnValue();
    passkeyPresent = v5->_passkeyPresent;
    v5->_passkeyPresent = (NSNumber *)v126;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isProximityAuthEligible"));
    v128 = objc_claimAutoreleasedReturnValue();
    isProximityAuthEligible = v5->_isProximityAuthEligible;
    v5->_isProximityAuthEligible = (NSNumber *)v128;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_groupKitEligibility"));
    v130 = objc_claimAutoreleasedReturnValue();
    groupKitEligibility = v5->_groupKitEligibility;
    v5->_groupKitEligibility = (NSNumber *)v130;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_passcodeAuthEnabled"));
    v132 = objc_claimAutoreleasedReturnValue();
    passcodeAuthEnabled = v5->_passcodeAuthEnabled;
    v5->_passcodeAuthEnabled = (NSNumber *)v132;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_askToBuy"));
    v134 = objc_claimAutoreleasedReturnValue();
    askToBuy = v5->_askToBuy;
    v5->_askToBuy = (NSNumber *)v134;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hasSOSActiveDevice"));
    v136 = objc_claimAutoreleasedReturnValue();
    hasSOSActiveDevice = v5->_hasSOSActiveDevice;
    v5->_hasSOSActiveDevice = (NSNumber *)v136;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_SOSNeeded"));
    v138 = objc_claimAutoreleasedReturnValue();
    SOSNeeded = v5->_SOSNeeded;
    v5->_SOSNeeded = (NSNumber *)v138;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deviceListVersion"));
    v140 = objc_claimAutoreleasedReturnValue();
    deviceListVersion = v5->_deviceListVersion;
    v5->_deviceListVersion = (NSString *)v140;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_configDataVersion"));
    v142 = objc_claimAutoreleasedReturnValue();
    configDataVersion = v5->_configDataVersion;
    v5->_configDataVersion = (NSString *)v142;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_birthYear"));
    v144 = objc_claimAutoreleasedReturnValue();
    birthYear = v5->_birthYear;
    v5->_birthYear = (NSNumber *)v144;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_birthDay"));
    v146 = objc_claimAutoreleasedReturnValue();
    birthDay = v5->_birthDay;
    v5->_birthDay = (NSNumber *)v146;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_birthMonth"));
    v148 = objc_claimAutoreleasedReturnValue();
    birthMonth = v5->_birthMonth;
    v5->_birthMonth = (NSNumber *)v148;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hasModernRecoveryKey"));
    v150 = objc_claimAutoreleasedReturnValue();
    hasModernRecoveryKey = v5->_hasModernRecoveryKey;
    v5->_hasModernRecoveryKey = (NSNumber *)v150;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_thirdPartyRegulatoryOverride"));
    v152 = objc_claimAutoreleasedReturnValue();
    thirdPartyRegulatoryOverride = v5->_thirdPartyRegulatoryOverride;
    v5->_thirdPartyRegulatoryOverride = (NSNumber *)v152;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_criticalAccountEditsAllowed"));
    v154 = objc_claimAutoreleasedReturnValue();
    criticalAccountEditsAllowed = v5->_criticalAccountEditsAllowed;
    v5->_criticalAccountEditsAllowed = (NSNumber *)v154;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_adpCohort"));
    v156 = objc_claimAutoreleasedReturnValue();
    adpCohort = v5->_adpCohort;
    v5->_adpCohort = (NSNumber *)v156;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_piggybackingApprovalEligible"));
    v158 = objc_claimAutoreleasedReturnValue();
    piggybackingApprovalEligible = v5->_piggybackingApprovalEligible;
    v5->_piggybackingApprovalEligible = (NSNumber *)v158;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *givenName;
  id v5;

  givenName = self->_givenName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", givenName, CFSTR("_givenName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_familyName, CFSTR("_familyName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_forwardingEmail, CFSTR("_forwardingEmail"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryEmailAddress, CFSTR("_primaryEmailAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountName, CFSTR("_accountName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountAliases, CFSTR("_accountAliases"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reachableEmails, CFSTR("_reachableEmails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previouslySelectedEmail, CFSTR("_previouslySelectedEmail"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ageOfMajority, CFSTR("_ageOfMajority"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authorizedApplicationsListVersion, CFSTR("_authorizedApplicationsListVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_masterKeyID, CFSTR("_masterKeyID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vettedPrimaryEmail, CFSTR("_vettedPrimaryEmail"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneAsAppleID, CFSTR("_phoneAsAppleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isUnderage, CFSTR("_isUnderage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isSiwaForChildEnabled, CFSTR("_isSiwAEnabled"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_userAgeRange, CFSTR("_userAgeRange"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isSenior, CFSTR("_isSenior"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isLegacyStudent, CFSTR("_isLegacyStudent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hasUsedAuthorization, CFSTR("_hasUsedAuthorization"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privateAttestationEnabled, CFSTR("_privateAttestationEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previouslyWantedPrivateEmail, CFSTR("_previouslyWantedPrivateEmail"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_appleIDSecurityLevel, CFSTR("_appleIDSecurityLevel"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_authMode, CFSTR("_authMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isMdmInfoRequired, CFSTR("_isMdmInfoRequired"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_repairState, CFSTR("_repairState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selectedEmail, CFSTR("_selectedEmail"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_additionalInfo, CFSTR("_additionalInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trustedPhoneNumbers, CFSTR("_trustedPhoneNumbers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_securityKeys, CFSTR("_securityKeys"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_loginHandles, CFSTR("_loginHandles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privateEmailListVersion, CFSTR("_privateEmailListVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_canBeCustodian, CFSTR("_canBeCustodian"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_canHaveCustodian, CFSTR("_canHaveCustodian"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_custodianEnabled, CFSTR("_custodianEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_custodianLastModified, CFSTR("_custodianLastModified"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_canBeBeneficiary, CFSTR("_canBeBeneficiary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_canHaveBeneficiary, CFSTR("_canHaveBeneficiary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beneficiaryLastModified, CFSTR("_beneficiaryLastModified"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleIDCountryCode, CFSTR("_appleIDCountryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hasMDM, CFSTR("_hasMDM"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_managedOrganizationType, CFSTR("_managedOrganizationType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_managedOrganizationName, CFSTR("_managedOrganizationName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isNotificationEmailAvailable, CFSTR("_isNotificationEmailAvailable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_notificationEmail, CFSTR("_notificationEmail"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_webAccessEnabled, CFSTR("_webAccessEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverExperimentalFeatures, CFSTR("_serverExperimentalFeatures"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_custodianInfos, CFSTR("_custodianInfos"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beneficiaryInfo, CFSTR("_beneficiaryInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passkeyEligible, CFSTR("_passkeyEligible"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passkeyPresent, CFSTR("_passkeyPresent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isProximityAuthEligible, CFSTR("_isProximityAuthEligible"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupKitEligibility, CFSTR("_groupKitEligibility"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passcodeAuthEnabled, CFSTR("_passcodeAuthEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_askToBuy, CFSTR("_askToBuy"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hasSOSActiveDevice, CFSTR("_hasSOSActiveDevice"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_SOSNeeded, CFSTR("_SOSNeeded"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceListVersion, CFSTR("_deviceListVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_configDataVersion, CFSTR("_configDataVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_birthYear, CFSTR("_birthYear"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_birthDay, CFSTR("_birthDay"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_birthMonth, CFSTR("_birthMonth"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hasModernRecoveryKey, CFSTR("_hasModernRecoveryKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thirdPartyRegulatoryOverride, CFSTR("_thirdPartyRegulatoryOverride"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_criticalAccountEditsAllowed, CFSTR("_criticalAccountEditsAllowed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_adpCohort, CFSTR("_adpCohort"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_piggybackingApprovalEligible, CFSTR("_piggybackingApprovalEligible"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  AKUserInformation *v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;

  v4 = objc_alloc_init(AKUserInformation);
  v5 = (void *)-[NSString copy](self->_givenName, "copy");
  -[AKUserInformation setGivenName:](v4, "setGivenName:", v5);

  v6 = (void *)-[NSString copy](self->_familyName, "copy");
  -[AKUserInformation setFamilyName:](v4, "setFamilyName:", v6);

  v7 = (void *)-[NSString copy](self->_forwardingEmail, "copy");
  -[AKUserInformation setForwardingEmail:](v4, "setForwardingEmail:", v7);

  v8 = (void *)-[NSString copy](self->_primaryEmailAddress, "copy");
  -[AKUserInformation setPrimaryEmailAddress:](v4, "setPrimaryEmailAddress:", v8);

  v9 = (void *)-[NSString copy](self->_accountName, "copy");
  -[AKUserInformation setAccountName:](v4, "setAccountName:", v9);

  v10 = (void *)-[NSArray copy](self->_accountAliases, "copy");
  -[AKUserInformation setAccountAliases:](v4, "setAccountAliases:", v10);

  v11 = (void *)-[NSArray copy](self->_reachableEmails, "copy");
  -[AKUserInformation setReachableEmails:](v4, "setReachableEmails:", v11);

  v12 = (void *)-[NSString copy](self->_authorizedApplicationsListVersion, "copy");
  -[AKUserInformation setAuthorizedApplicationsListVersion:](v4, "setAuthorizedApplicationsListVersion:", v12);

  v13 = (void *)-[NSString copy](self->_masterKeyID, "copy");
  -[AKUserInformation setMasterKeyID:](v4, "setMasterKeyID:", v13);

  v14 = (void *)-[NSNumber copy](self->_vettedPrimaryEmail, "copy");
  -[AKUserInformation setVettedPrimaryEmail:](v4, "setVettedPrimaryEmail:", v14);

  v15 = (void *)-[NSNumber copy](self->_phoneAsAppleID, "copy");
  -[AKUserInformation setPhoneAsAppleID:](v4, "setPhoneAsAppleID:", v15);

  v16 = (void *)-[NSNumber copy](self->_hasUsedAuthorization, "copy");
  -[AKUserInformation setHasUsedAuthorization:](v4, "setHasUsedAuthorization:", v16);

  v17 = (void *)-[NSNumber copy](self->_privateAttestationEnabled, "copy");
  -[AKUserInformation setPrivateAttestationEnabled:](v4, "setPrivateAttestationEnabled:", v17);

  v18 = (void *)-[NSNumber copy](self->_isUnderage, "copy");
  -[AKUserInformation setIsUnderage:](v4, "setIsUnderage:", v18);

  v19 = (void *)-[NSNumber copy](self->_isSiwaForChildEnabled, "copy");
  -[AKUserInformation setIsSiwaForChildEnabled:](v4, "setIsSiwaForChildEnabled:", v19);

  -[AKUserInformation setUserAgeRange:](v4, "setUserAgeRange:", self->_userAgeRange);
  v20 = (void *)-[NSNumber copy](self->_isSenior, "copy");
  -[AKUserInformation setIsSenior:](v4, "setIsSenior:", v20);

  v21 = (void *)-[NSNumber copy](self->_ageOfMajority, "copy");
  -[AKUserInformation setAgeOfMajority:](v4, "setAgeOfMajority:", v21);

  v22 = (void *)-[NSString copy](self->_previouslySelectedEmail, "copy");
  -[AKUserInformation setPreviouslySelectedEmail:](v4, "setPreviouslySelectedEmail:", v22);

  v23 = (void *)-[NSNumber copy](self->_previouslyWantedPrivateEmail, "copy");
  -[AKUserInformation setPreviouslyWantedPrivateEmail:](v4, "setPreviouslyWantedPrivateEmail:", v23);

  v24 = (void *)-[NSNumber copy](self->_isLegacyStudent, "copy");
  -[AKUserInformation setIsLegacyStudent:](v4, "setIsLegacyStudent:", v24);

  -[AKUserInformation setAppleIDSecurityLevel:](v4, "setAppleIDSecurityLevel:", self->_appleIDSecurityLevel);
  -[AKUserInformation setAuthMode:](v4, "setAuthMode:", self->_authMode);
  v25 = (void *)-[NSNumber copy](self->_isMdmInfoRequired, "copy");
  -[AKUserInformation setIsMdmInfoRequired:](v4, "setIsMdmInfoRequired:", v25);

  -[AKUserInformation setRepairState:](v4, "setRepairState:", self->_repairState);
  v26 = (void *)-[NSString copy](self->_selectedEmail, "copy");
  -[AKUserInformation setSelectedEmail:](v4, "setSelectedEmail:", v26);

  v27 = (void *)-[NSDictionary copy](self->_additionalInfo, "copy");
  -[AKUserInformation setAdditionalInfo:](v4, "setAdditionalInfo:", v27);

  v28 = (void *)-[NSArray copy](self->_trustedPhoneNumbers, "copy");
  -[AKUserInformation setTrustedPhoneNumbers:](v4, "setTrustedPhoneNumbers:", v28);

  v29 = (void *)-[NSArray copy](self->_securityKeys, "copy");
  -[AKUserInformation setSecurityKeys:](v4, "setSecurityKeys:", v29);

  v30 = (void *)-[NSArray copy](self->_loginHandles, "copy");
  -[AKUserInformation setLoginHandles:](v4, "setLoginHandles:", v30);

  v31 = (void *)-[NSNumber copy](self->_canBeCustodian, "copy");
  -[AKUserInformation setCanBeCustodian:](v4, "setCanBeCustodian:", v31);

  v32 = (void *)-[NSNumber copy](self->_canHaveCustodian, "copy");
  -[AKUserInformation setCanHaveCustodian:](v4, "setCanHaveCustodian:", v32);

  v33 = (void *)-[NSNumber copy](self->_canBeBeneficiary, "copy");
  -[AKUserInformation setCanBeBeneficiary:](v4, "setCanBeBeneficiary:", v33);

  v34 = (void *)-[NSNumber copy](self->_canHaveBeneficiary, "copy");
  -[AKUserInformation setCanHaveBeneficiary:](v4, "setCanHaveBeneficiary:", v34);

  v35 = (void *)-[NSString copy](self->_privateEmailListVersion, "copy");
  -[AKUserInformation setPrivateEmailListVersion:](v4, "setPrivateEmailListVersion:", v35);

  v36 = (void *)-[NSNumber copy](self->_custodianEnabled, "copy");
  -[AKUserInformation setCustodianEnabled:](v4, "setCustodianEnabled:", v36);

  v37 = (void *)-[NSNumber copy](self->_custodianLastModified, "copy");
  -[AKUserInformation setCustodianLastModified:](v4, "setCustodianLastModified:", v37);

  v38 = (void *)-[NSNumber copy](self->_beneficiaryLastModified, "copy");
  -[AKUserInformation setBeneficiaryLastModified:](v4, "setBeneficiaryLastModified:", v38);

  v39 = (void *)-[NSString copy](self->_appleIDCountryCode, "copy");
  -[AKUserInformation setAppleIDCountryCode:](v4, "setAppleIDCountryCode:", v39);

  -[AKUserInformation setHasMDM:](v4, "setHasMDM:", self->_hasMDM);
  v40 = (void *)-[NSNumber copy](self->_managedOrganizationType, "copy");
  -[AKUserInformation setManagedOrganizationType:](v4, "setManagedOrganizationType:", v40);

  v41 = (void *)-[NSString copy](self->_managedOrganizationName, "copy");
  -[AKUserInformation setManagedOrganizationName:](v4, "setManagedOrganizationName:", v41);

  v42 = (void *)-[NSNumber copy](self->_isNotificationEmailAvailable, "copy");
  -[AKUserInformation setIsNotificationEmailAvailable:](v4, "setIsNotificationEmailAvailable:", v42);

  v43 = (void *)-[NSString copy](self->_notificationEmail, "copy");
  -[AKUserInformation setNotificationEmail:](v4, "setNotificationEmail:", v43);

  v44 = (void *)-[NSNumber copy](self->_webAccessEnabled, "copy");
  -[AKUserInformation setWebAccessEnabled:](v4, "setWebAccessEnabled:", v44);

  v45 = (void *)-[NSNumber copy](self->_serverExperimentalFeatures, "copy");
  -[AKUserInformation setServerExperimentalFeatures:](v4, "setServerExperimentalFeatures:", v45);

  v46 = (void *)-[NSArray copy](self->_custodianInfos, "copy");
  -[AKUserInformation setCustodianInfos:](v4, "setCustodianInfos:", v46);

  v47 = (void *)-[NSArray copy](self->_beneficiaryInfo, "copy");
  -[AKUserInformation setBeneficiaryInfo:](v4, "setBeneficiaryInfo:", v47);

  v48 = (void *)-[NSNumber copy](self->_passkeyEligible, "copy");
  -[AKUserInformation setPasskeyEligible:](v4, "setPasskeyEligible:", v48);

  v49 = (void *)-[NSNumber copy](self->_passkeyPresent, "copy");
  -[AKUserInformation setPasskeyPresent:](v4, "setPasskeyPresent:", v49);

  v50 = (void *)-[NSNumber copy](self->_isProximityAuthEligible, "copy");
  -[AKUserInformation setIsProximityAuthEligible:](v4, "setIsProximityAuthEligible:", v50);

  v51 = (void *)-[NSNumber copy](self->_groupKitEligibility, "copy");
  -[AKUserInformation setGroupKitEligibility:](v4, "setGroupKitEligibility:", v51);

  v52 = (void *)-[NSNumber copy](self->_passcodeAuthEnabled, "copy");
  -[AKUserInformation setPasscodeAuthEnabled:](v4, "setPasscodeAuthEnabled:", v52);

  v53 = (void *)-[NSNumber copy](self->_askToBuy, "copy");
  -[AKUserInformation setAskToBuy:](v4, "setAskToBuy:", v53);

  v54 = (void *)-[NSNumber copy](self->_hasSOSActiveDevice, "copy");
  -[AKUserInformation setHasSOSActiveDevice:](v4, "setHasSOSActiveDevice:", v54);

  v55 = (void *)-[NSNumber copy](self->_SOSNeeded, "copy");
  -[AKUserInformation setSOSNeeded:](v4, "setSOSNeeded:", v55);

  v56 = (void *)-[NSString copy](self->_deviceListVersion, "copy");
  -[AKUserInformation setDeviceListVersion:](v4, "setDeviceListVersion:", v56);

  v57 = (void *)-[NSString copy](self->_configDataVersion, "copy");
  -[AKUserInformation setConfigDataVersion:](v4, "setConfigDataVersion:", v57);

  v58 = (void *)-[NSNumber copy](self->_birthYear, "copy");
  -[AKUserInformation setBirthYear:](v4, "setBirthYear:", v58);

  v59 = (void *)-[NSNumber copy](self->_birthDay, "copy");
  -[AKUserInformation setBirthDay:](v4, "setBirthDay:", v59);

  v60 = (void *)-[NSNumber copy](self->_birthMonth, "copy");
  -[AKUserInformation setBirthMonth:](v4, "setBirthMonth:", v60);

  v61 = (void *)-[NSNumber copy](self->_hasModernRecoveryKey, "copy");
  -[AKUserInformation setHasModernRecoveryKey:](v4, "setHasModernRecoveryKey:", v61);

  v62 = (void *)-[NSNumber copy](self->_thirdPartyRegulatoryOverride, "copy");
  -[AKUserInformation setThirdPartyRegulatoryOverride:](v4, "setThirdPartyRegulatoryOverride:", v62);

  v63 = (void *)-[NSNumber copy](self->_criticalAccountEditsAllowed, "copy");
  -[AKUserInformation setCriticalAccountEditsAllowed:](v4, "setCriticalAccountEditsAllowed:", v63);

  v64 = (void *)-[NSNumber copy](self->_adpCohort, "copy");
  -[AKUserInformation setAdpCohort:](v4, "setAdpCohort:", v64);

  v65 = (void *)-[NSNumber copy](self->_piggybackingApprovalEligible, "copy");
  -[AKUserInformation setPiggybackingApprovalEligible:](v4, "setPiggybackingApprovalEligible:", v65);

  return v4;
}

- (void)_parseCustodianInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  NSArray *v13;
  NSArray *custodianInfos;
  _QWORD v15[4];
  NSObject *v16;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("custodianInfos"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __41__AKUserInformation__parseCustodianInfo___block_invoke;
    v15[3] = &unk_1E2E60768;
    v9 = v8;
    v16 = v9;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v15);
    v10 = -[NSObject count](v9, "count");
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12)
        -[AKUserInformation _parseCustodianInfo:].cold.3();
    }
    else if (v12)
    {
      -[AKUserInformation _parseCustodianInfo:].cold.2();
    }

    v13 = -[NSObject copy](v9, "copy");
    custodianInfos = self->_custodianInfos;
    self->_custodianInfos = v13;

  }
  else
  {
    _AKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AKUserInformation _parseCustodianInfo:].cold.1();
  }

}

void __41__AKUserInformation__parseCustodianInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_opt_class();
  v14 = v3;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_23:

    v4 = v14;
    goto LABEL_24;
  }
  v4 = v14;
  if (v14)
  {
    objc_opt_class();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("custodianUuid"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    objc_opt_class();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("status"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    objc_opt_class();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("wrappingKeyHash"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    objc_opt_class();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("prkcHash"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    if (v6 && v8)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v13, "setValue:forKey:", v6, CFSTR("custodianUuid"));
      objc_msgSend(v13, "setValue:forKey:", v8, CFSTR("status"));
      if (v10)
        objc_msgSend(v13, "setValue:forKey:", v10, CFSTR("wrappingKeyHash"));
      if (v12)
        objc_msgSend(v13, "setValue:forKey:", v12, CFSTR("prkcHash"));
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);

    }
    goto LABEL_23;
  }
LABEL_24:

}

- (void)_parseBeneficiaryInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  NSArray *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSArray *v14;
  NSArray *beneficiaryInfo;
  _QWORD v16[4];
  NSArray *v17;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("beneficiaryInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  if (v7 && objc_msgSend(v7, "count"))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __43__AKUserInformation__parseBeneficiaryInfo___block_invoke;
    v16[3] = &unk_1E2E60768;
    v9 = (NSArray *)v8;
    v17 = v9;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v16);
    v10 = -[NSArray count](v9, "count");
    _AKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12)
        -[AKUserInformation _parseBeneficiaryInfo:].cold.3();
    }
    else if (v12)
    {
      -[AKUserInformation _parseBeneficiaryInfo:].cold.2();
    }

    v14 = (NSArray *)-[NSArray copy](v9, "copy");
    beneficiaryInfo = self->_beneficiaryInfo;
    self->_beneficiaryInfo = v14;

  }
  else
  {
    _AKLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[AKUserInformation _parseBeneficiaryInfo:].cold.1();

    v9 = self->_beneficiaryInfo;
    self->_beneficiaryInfo = 0;
  }

}

void __43__AKUserInformation__parseBeneficiaryInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_27:

    goto LABEL_28;
  }
  if (v4)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("beneficiaryUuid"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("claimCodeHash"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wrappedKey"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wrappedKeyHash"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    if (v6)
    {
      _AKLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __43__AKUserInformation__parseBeneficiaryInfo___block_invoke_cold_1();

      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v14, "setValue:forKey:", v6, CFSTR("beneficiaryUuid"));
      if (v8)
        objc_msgSend(v14, "setValue:forKey:", v8, CFSTR("claimCodeHash"));
      if (v10 && (objc_msgSend(v10, "isEqual:", &stru_1E2E647A8) & 1) == 0)
        objc_msgSend(v14, "setValue:forKey:", v10, CFSTR("wrappedKey"));
      if (v12)
        objc_msgSend(v14, "setValue:forKey:", v12, CFSTR("wrappedKeyHash"));
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);

    }
    goto LABEL_27;
  }
LABEL_28:

}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v7;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p {\n\tgivenName: %@,\n\tfamilyName: %@,\n\tforwardingEmail: %@,\n\tprimaryEmailAddress: %@,\n\taccountName: %@,\n\taccountAliases: %@,\n\treachableEmails: %@,\n\tauthorizedApplicationsListVersion: %@,\n\tmasterKeyID: %@,\n\tvettedPrimaryEmail: %@,\n\tphoneAsAppleID: %@,\n\tisUnderage: %@,\n\tisSiwaForChildEnabled: %@,\n\tuserAgeRange: %lu,\n\tisSenior: %@,\n\tageOfMajority: %@,\n\tisLegacyStudent: %@,\n\tappleIDCountryCode: %@,\n\thasUsedAuthorization: %@, \n\tprivateAttestationEnabled: %@, \n\tappleIDSecurityLevel: %lu,\n\tauthMode: %lu,\n\tisMdmInfoRequired: %@,\n\trepairState: %lu,\n\tselectedEmail: %@,\n\tcanBeCustodian: %@,\n\tcanHaveCustodian: %@,\n\tcustodianEnabled: %@,\n\tcanBeBeneficiary: %@,\n\tcanHaveBeneficiary: %@,\n\thasMDM: %@,\n\tmanagedOrganizationType: %@,\n\tmanagedOrganizationName: %@,\n\tisNotificationEmailAvailable: %@,\n\tnotificationEmail: %@,\n\tadditionalInfo: %@,\n\ttrustedPhoneNumbers: %@,\n\tsecurityKeys: %@,\n\tloginHandles: %@,\n\tprivateEmailListVersion: %@,\n\tisProximityAuthEligible: %@,\n\twebAccessEnabled: %@,\n\tserverExperimentalFeatures: %@,\n\tcustodianInfos: %@,\n\tbeneficiaryInfo: %@,\n\tpasskeyEligible: %@,\n\tpasskeyPresent: %@,\n\tgroupKitEligibility: %@,\n\tpasscodeAuthEnabled: %@,\n\taskToBuy: %@,\n\thasSOSActiveDevice: %@,\n\tSOSNeeded: %@,\n\tdeviceListVersion: %@,\n\tconfigDataVersion: %@,\n\tbirthYear: %@,\n\tcriticalAccountEditsAllowed: %@,\n\thasModernRecoveryKey: %@,\n\tadpCohort: %@,\n\tthirdPartyRegulatoryOverride: %@,\n\tpiggybackingApprovalEligible: %@,\n}>"), v4, self, self->_givenName, self->_familyName, self->_forwardingEmail, self->_primaryEmailAddress, self->_accountName, self->_accountAliases, self->_reachableEmails, self->_authorizedApplicationsListVersion, self->_masterKeyID, self->_vettedPrimaryEmail, self->_phoneAsAppleID, self->_isUnderage, self->_isSiwaForChildEnabled, self->_userAgeRange,
    self->_isSenior,
    self->_ageOfMajority,
    self->_isLegacyStudent,
    self->_appleIDCountryCode,
    self->_hasUsedAuthorization,
    self->_privateAttestationEnabled,
    self->_appleIDSecurityLevel,
    self->_authMode,
    self->_isMdmInfoRequired,
    self->_repairState,
    self->_selectedEmail,
    self->_canBeCustodian,
    self->_canHaveCustodian,
    self->_custodianEnabled,
    self->_canBeBeneficiary,
    self->_canHaveBeneficiary,
    self->_hasMDM,
    self->_managedOrganizationType,
    self->_managedOrganizationName,
    self->_isNotificationEmailAvailable,
    self->_notificationEmail,
    self->_additionalInfo,
    self->_trustedPhoneNumbers,
    self->_securityKeys,
    self->_loginHandles,
    self->_privateEmailListVersion,
    self->_isProximityAuthEligible,
    self->_webAccessEnabled,
    self->_serverExperimentalFeatures,
    self->_custodianInfos,
    self->_beneficiaryInfo,
    self->_passkeyEligible,
    self->_passkeyPresent,
    self->_groupKitEligibility,
    self->_passcodeAuthEnabled,
    self->_askToBuy,
    self->_hasSOSActiveDevice,
    self->_SOSNeeded,
    self->_deviceListVersion,
    self->_configDataVersion,
    self->_birthYear,
    self->_criticalAccountEditsAllowed,
    self->_hasModernRecoveryKey,
    self->_adpCohort);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSNumber)silentEscrowRecordRepairEnabled
{
  id v3;
  id v4;

  objc_opt_class();
  -[NSDictionary objectForKeyedSubscript:](self->_additionalInfo, "objectForKeyedSubscript:", CFSTR("silentEscrowRecordRepairEnabled"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSNumber *)v4;
}

- (void)setSilentEscrowRecordRepairEnabled:(id)a3
{
  NSDictionary *additionalInfo;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *v10;
  id v11;

  additionalInfo = self->_additionalInfo;
  v5 = a3;
  v6 = (void *)-[NSDictionary mutableCopy](additionalInfo, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v8;

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, CFSTR("silentEscrowRecordRepairEnabled"));
  v9 = (NSDictionary *)objc_msgSend(v11, "copy");
  v10 = self->_additionalInfo;
  self->_additionalInfo = v9;

}

- (NSNumber)silentBurnCDPRepairEnabled
{
  id v3;
  id v4;

  objc_opt_class();
  -[NSDictionary objectForKeyedSubscript:](self->_additionalInfo, "objectForKeyedSubscript:", CFSTR("silenBurnMiniBuddyEnabled"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSNumber *)v4;
}

- (void)setSilentBurnCDPRepairEnabled:(id)a3
{
  NSDictionary *additionalInfo;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *v10;
  id v11;

  additionalInfo = self->_additionalInfo;
  v5 = a3;
  v6 = (void *)-[NSDictionary mutableCopy](additionalInfo, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v8;

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, CFSTR("silenBurnMiniBuddyEnabled"));
  v9 = (NSDictionary *)objc_msgSend(v11, "copy");
  v10 = self->_additionalInfo;
  self->_additionalInfo = v9;

}

- (BOOL)isManagedAppleID
{
  return self->_appleIDSecurityLevel == 5;
}

- (id)sharedEmailForManagedAppleID
{
  NSString *v3;

  if (-[AKUserInformation isManagedAppleID](self, "isManagedAppleID")
    && -[NSNumber BOOLValue](self->_isNotificationEmailAvailable, "BOOLValue"))
  {
    v3 = -[NSString length](self->_notificationEmail, "length");
    if (v3)
      v3 = self->_notificationEmail;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSNumber)criticalAccountEditsAllowed
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;

  v2 = -[NSNumber BOOLValue](self->_criticalAccountEditsAllowed, "BOOLValue");
  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "criticalAccountEditsAllowedOverride");

  v5 = AKConfigApplyOverride(v4, v2);
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[AKUserInformation criticalAccountEditsAllowed].cold.1(v5, v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSNumber)activeHMECount
{
  return self->_activeHMECount;
}

- (NSNumber)inActiveHMECount
{
  return self->_inActiveHMECount;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)forwardingEmail
{
  return self->_forwardingEmail;
}

- (void)setForwardingEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)previouslySelectedEmail
{
  return self->_previouslySelectedEmail;
}

- (void)setPreviouslySelectedEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)primaryEmailAddress
{
  return self->_primaryEmailAddress;
}

- (void)setPrimaryEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)accountAliases
{
  return self->_accountAliases;
}

- (void)setAccountAliases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)reachableEmails
{
  return self->_reachableEmails;
}

- (void)setReachableEmails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)authorizedApplicationsListVersion
{
  return self->_authorizedApplicationsListVersion;
}

- (void)setAuthorizedApplicationsListVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)masterKeyID
{
  return self->_masterKeyID;
}

- (void)setMasterKeyID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)vettedPrimaryEmail
{
  return self->_vettedPrimaryEmail;
}

- (void)setVettedPrimaryEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)phoneAsAppleID
{
  return self->_phoneAsAppleID;
}

- (void)setPhoneAsAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)isUnderage
{
  return self->_isUnderage;
}

- (void)setIsUnderage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)isSiwaForChildEnabled
{
  return self->_isSiwaForChildEnabled;
}

- (void)setIsSiwaForChildEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (unint64_t)userAgeRange
{
  return self->_userAgeRange;
}

- (void)setUserAgeRange:(unint64_t)a3
{
  self->_userAgeRange = a3;
}

- (NSNumber)isSenior
{
  return self->_isSenior;
}

- (void)setIsSenior:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)ageOfMajority
{
  return self->_ageOfMajority;
}

- (void)setAgeOfMajority:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)isLegacyStudent
{
  return self->_isLegacyStudent;
}

- (void)setIsLegacyStudent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)hasUsedAuthorization
{
  return self->_hasUsedAuthorization;
}

- (void)setHasUsedAuthorization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)privateAttestationEnabled
{
  return self->_privateAttestationEnabled;
}

- (void)setPrivateAttestationEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)previouslyWantedPrivateEmail
{
  return self->_previouslyWantedPrivateEmail;
}

- (void)setPreviouslyWantedPrivateEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (unint64_t)appleIDSecurityLevel
{
  return self->_appleIDSecurityLevel;
}

- (void)setAppleIDSecurityLevel:(unint64_t)a3
{
  self->_appleIDSecurityLevel = a3;
}

- (unint64_t)authMode
{
  return self->_authMode;
}

- (void)setAuthMode:(unint64_t)a3
{
  self->_authMode = a3;
}

- (NSNumber)isMdmInfoRequired
{
  return self->_isMdmInfoRequired;
}

- (void)setIsMdmInfoRequired:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (unint64_t)repairState
{
  return self->_repairState;
}

- (void)setRepairState:(unint64_t)a3
{
  self->_repairState = a3;
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void)setAdditionalInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSArray)trustedPhoneNumbers
{
  return self->_trustedPhoneNumbers;
}

- (void)setTrustedPhoneNumbers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSArray)securityKeys
{
  return self->_securityKeys;
}

- (void)setSecurityKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSArray)loginHandles
{
  return self->_loginHandles;
}

- (void)setLoginHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)privateEmailListVersion
{
  return self->_privateEmailListVersion;
}

- (void)setPrivateEmailListVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSNumber)webAccessEnabled
{
  return self->_webAccessEnabled;
}

- (void)setWebAccessEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSNumber)serverExperimentalFeatures
{
  return self->_serverExperimentalFeatures;
}

- (void)setServerExperimentalFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSNumber)isProximityAuthEligible
{
  return self->_isProximityAuthEligible;
}

- (void)setIsProximityAuthEligible:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSArray)custodianInfos
{
  return self->_custodianInfos;
}

- (void)setCustodianInfos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSArray)beneficiaryInfo
{
  return self->_beneficiaryInfo;
}

- (void)setBeneficiaryInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSNumber)passkeyEligible
{
  return self->_passkeyEligible;
}

- (void)setPasskeyEligible:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSNumber)passkeyPresent
{
  return self->_passkeyPresent;
}

- (void)setPasskeyPresent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSNumber)passcodeAuthEnabled
{
  return self->_passcodeAuthEnabled;
}

- (void)setPasscodeAuthEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSNumber)askToBuy
{
  return self->_askToBuy;
}

- (void)setAskToBuy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSNumber)hasSOSActiveDevice
{
  return self->_hasSOSActiveDevice;
}

- (void)setHasSOSActiveDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSNumber)SOSNeeded
{
  return self->_SOSNeeded;
}

- (void)setSOSNeeded:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSString)deviceListVersion
{
  return self->_deviceListVersion;
}

- (void)setDeviceListVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSString)configDataVersion
{
  return self->_configDataVersion;
}

- (void)setConfigDataVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (NSNumber)hasModernRecoveryKey
{
  return self->_hasModernRecoveryKey;
}

- (void)setHasModernRecoveryKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSNumber)thirdPartyRegulatoryOverride
{
  return self->_thirdPartyRegulatoryOverride;
}

- (void)setThirdPartyRegulatoryOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSNumber)adpCohort
{
  return self->_adpCohort;
}

- (void)setAdpCohort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSString)appleIDCountryCode
{
  return self->_appleIDCountryCode;
}

- (void)setAppleIDCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSNumber)custodianEnabled
{
  return self->_custodianEnabled;
}

- (void)setCustodianEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSNumber)canHaveCustodian
{
  return self->_canHaveCustodian;
}

- (void)setCanHaveCustodian:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (NSNumber)canBeCustodian
{
  return self->_canBeCustodian;
}

- (void)setCanBeCustodian:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSNumber)canHaveBeneficiary
{
  return self->_canHaveBeneficiary;
}

- (void)setCanHaveBeneficiary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSNumber)canBeBeneficiary
{
  return self->_canBeBeneficiary;
}

- (void)setCanBeBeneficiary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSNumber)custodianLastModified
{
  return self->_custodianLastModified;
}

- (void)setCustodianLastModified:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSNumber)beneficiaryLastModified
{
  return self->_beneficiaryLastModified;
}

- (void)setBeneficiaryLastModified:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSNumber)hasMDM
{
  return self->_hasMDM;
}

- (void)setHasMDM:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSString)selectedEmail
{
  return self->_selectedEmail;
}

- (void)setSelectedEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSNumber)managedOrganizationType
{
  return self->_managedOrganizationType;
}

- (void)setManagedOrganizationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (NSString)managedOrganizationName
{
  return self->_managedOrganizationName;
}

- (void)setManagedOrganizationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (NSNumber)isNotificationEmailAvailable
{
  return self->_isNotificationEmailAvailable;
}

- (void)setIsNotificationEmailAvailable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (NSString)notificationEmail
{
  return self->_notificationEmail;
}

- (void)setNotificationEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (NSNumber)silentEscrowRecordRepairEnabledV2
{
  return self->_silentEscrowRecordRepairEnabledV2;
}

- (void)setSilentEscrowRecordRepairEnabledV2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (NSNumber)groupKitEligibility
{
  return self->_groupKitEligibility;
}

- (void)setGroupKitEligibility:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (NSNumber)birthYear
{
  return self->_birthYear;
}

- (void)setBirthYear:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (NSNumber)birthDay
{
  return self->_birthDay;
}

- (void)setBirthDay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (NSNumber)birthMonth
{
  return self->_birthMonth;
}

- (void)setBirthMonth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (void)setCriticalAccountEditsAllowed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (NSNumber)piggybackingApprovalEligible
{
  return self->_piggybackingApprovalEligible;
}

- (void)setPiggybackingApprovalEligible:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_piggybackingApprovalEligible, 0);
  objc_storeStrong((id *)&self->_criticalAccountEditsAllowed, 0);
  objc_storeStrong((id *)&self->_birthMonth, 0);
  objc_storeStrong((id *)&self->_birthDay, 0);
  objc_storeStrong((id *)&self->_birthYear, 0);
  objc_storeStrong((id *)&self->_groupKitEligibility, 0);
  objc_storeStrong((id *)&self->_silentEscrowRecordRepairEnabledV2, 0);
  objc_storeStrong((id *)&self->_notificationEmail, 0);
  objc_storeStrong((id *)&self->_isNotificationEmailAvailable, 0);
  objc_storeStrong((id *)&self->_managedOrganizationName, 0);
  objc_storeStrong((id *)&self->_managedOrganizationType, 0);
  objc_storeStrong((id *)&self->_selectedEmail, 0);
  objc_storeStrong((id *)&self->_hasMDM, 0);
  objc_storeStrong((id *)&self->_beneficiaryLastModified, 0);
  objc_storeStrong((id *)&self->_custodianLastModified, 0);
  objc_storeStrong((id *)&self->_canBeBeneficiary, 0);
  objc_storeStrong((id *)&self->_canHaveBeneficiary, 0);
  objc_storeStrong((id *)&self->_canBeCustodian, 0);
  objc_storeStrong((id *)&self->_canHaveCustodian, 0);
  objc_storeStrong((id *)&self->_custodianEnabled, 0);
  objc_storeStrong((id *)&self->_appleIDCountryCode, 0);
  objc_storeStrong((id *)&self->_adpCohort, 0);
  objc_storeStrong((id *)&self->_thirdPartyRegulatoryOverride, 0);
  objc_storeStrong((id *)&self->_hasModernRecoveryKey, 0);
  objc_storeStrong((id *)&self->_configDataVersion, 0);
  objc_storeStrong((id *)&self->_deviceListVersion, 0);
  objc_storeStrong((id *)&self->_SOSNeeded, 0);
  objc_storeStrong((id *)&self->_hasSOSActiveDevice, 0);
  objc_storeStrong((id *)&self->_askToBuy, 0);
  objc_storeStrong((id *)&self->_passcodeAuthEnabled, 0);
  objc_storeStrong((id *)&self->_passkeyPresent, 0);
  objc_storeStrong((id *)&self->_passkeyEligible, 0);
  objc_storeStrong((id *)&self->_beneficiaryInfo, 0);
  objc_storeStrong((id *)&self->_custodianInfos, 0);
  objc_storeStrong((id *)&self->_isProximityAuthEligible, 0);
  objc_storeStrong((id *)&self->_serverExperimentalFeatures, 0);
  objc_storeStrong((id *)&self->_webAccessEnabled, 0);
  objc_storeStrong((id *)&self->_privateEmailListVersion, 0);
  objc_storeStrong((id *)&self->_loginHandles, 0);
  objc_storeStrong((id *)&self->_securityKeys, 0);
  objc_storeStrong((id *)&self->_trustedPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_isMdmInfoRequired, 0);
  objc_storeStrong((id *)&self->_previouslyWantedPrivateEmail, 0);
  objc_storeStrong((id *)&self->_privateAttestationEnabled, 0);
  objc_storeStrong((id *)&self->_hasUsedAuthorization, 0);
  objc_storeStrong((id *)&self->_isLegacyStudent, 0);
  objc_storeStrong((id *)&self->_ageOfMajority, 0);
  objc_storeStrong((id *)&self->_isSenior, 0);
  objc_storeStrong((id *)&self->_isSiwaForChildEnabled, 0);
  objc_storeStrong((id *)&self->_isUnderage, 0);
  objc_storeStrong((id *)&self->_phoneAsAppleID, 0);
  objc_storeStrong((id *)&self->_vettedPrimaryEmail, 0);
  objc_storeStrong((id *)&self->_masterKeyID, 0);
  objc_storeStrong((id *)&self->_authorizedApplicationsListVersion, 0);
  objc_storeStrong((id *)&self->_reachableEmails, 0);
  objc_storeStrong((id *)&self->_accountAliases, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_primaryEmailAddress, 0);
  objc_storeStrong((id *)&self->_previouslySelectedEmail, 0);
  objc_storeStrong((id *)&self->_forwardingEmail, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_inActiveHMECount, 0);
  objc_storeStrong((id *)&self->_activeHMECount, 0);
}

- (void)initWithResponseBody:.cold.1()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "Config data version value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithResponseBody:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Parsing beneficiaryInfo.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Parsing custodianInfo.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "isProximityAuthEligible is missing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.5()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "Managed organization notificationEmail value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithResponseBody:.cold.6()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "Managed organization isNotificationEmailAvailable value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithResponseBody:.cold.7()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "Managed organization name value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithResponseBody:.cold.8()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_19202F000, v0, OS_LOG_TYPE_ERROR, "Managed organization type has an invalid value: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)initWithResponseBody:.cold.9()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "Managed organization type value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithResponseBody:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "hasMDM is missing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "beneficiaryLastModified is missing or has invalid type.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "canHaveBeneficiary is missing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "canBeBeneficiary is missing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "CustodianLastModified is missing or has invalid type.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "custodianEnabled is missing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "CanHaveCustodian is missing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "CanBeCustodian is missing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.18()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "Private email list version value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithResponseBody:.cold.19()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "No authorized applications list version set for this account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.20()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "Authorized applications list version value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithResponseBody:.cold.21()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "Previously selected email value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithResponseBody:.cold.22()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "No Forwarding email set for this account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.23()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "Forwarding email value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithResponseBody:.cold.24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "No login handles for account.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.25()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "No security keys for account.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.26()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "Security Keys value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithResponseBody:.cold.27()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "No trusted phone numbers for account.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "No reachable emails for account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.29()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "User reachable emails value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithResponseBody:.cold.30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "User vetted primary email is missing, Possibly unverified or Mako Account.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.31()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "User Apple ID country code is missing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.32()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "User apple id country code value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithResponseBody:.cold.33()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Mako Account Identifier Missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.34()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "Mako Account Identifier value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithResponseBody:.cold.35()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "User family name is missing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.36()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "User family name value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithResponseBody:.cold.37()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "User given name is missing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.38()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "User given name name value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithResponseBody:.cold.39()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "No additional Info.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "No aliases.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.41()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "Aliases array value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithResponseBody:.cold.42()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Primary email address is missing, probably MAKO account.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.43()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "Primary email address value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithResponseBody:.cold.44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Account name is missing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)initWithResponseBody:.cold.45()
{
  objc_class *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_6_2();
  NSStringFromClass(v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_3(&dword_19202F000, v2, v3, "Account name value has an invalid type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)_parseCustodianInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "No custodian info in response.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_parseCustodianInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "No valid Custodian Info found in custodianInfos array.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_parseCustodianInfo:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Valid Custodian Info found in custodianInfos array %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_parseBeneficiaryInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "No beneficiary info for account.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_parseBeneficiaryInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "No valid Beneficiary Info found in beneficiaryInfoArray.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_parseBeneficiaryInfo:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Beneficiary Info found for account %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__AKUserInformation__parseBeneficiaryInfo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Adding beneficiaryInfo for UUID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)criticalAccountEditsAllowed
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_19202F000, a2, OS_LOG_TYPE_DEBUG, "criticalAccountEditsAllowed finalValue: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_7();
}

@end
