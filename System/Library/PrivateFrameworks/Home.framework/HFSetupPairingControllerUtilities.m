@implementation HFSetupPairingControllerUtilities

+ (double)accessoryDiscoverySoftTimeout
{
  return 30.0;
}

+ (double)accessoryDiscoveryFatalTimeout
{
  return 120.0;
}

+ (id)descriptionForPairingPhase:(unint64_t)a3
{
  if (a3 > 0xA)
    return 0;
  else
    return off_1EA72D2D8[a3];
}

+ (BOOL)isPairingPhaseIdle:(unint64_t)a3
{
  return a3 - 8 < 0xFFFFFFFFFFFFFFF9;
}

+ (id)_accessoryNotFoundStatusDescriptionSuffixForSetupResult:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "setupPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_requiresEthernet");

  if (v4)
    return CFSTR("Ethernet");
  else
    return CFSTR("Generic");
}

+ (void)getStatusTitle:(id *)a3 statusDescription:(id *)a4 forPairingPhase:(unint64_t)a5 phaseStartDate:(id)a6 discoveredAccessory:(id)a7 setupResult:(id)a8 context:(id)a9 setupError:(id)a10
{
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  BOOL v28;
  unint64_t v29;
  void *v30;
  __CFString *v31;
  void *v32;
  __CFString *v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  __CFString *v50;
  void *v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  NSObject *v63;
  __CFString *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id v90;
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  id v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v16 = a7;
  v17 = a8;
  v90 = a9;
  v18 = a10;
  v19 = (void *)MEMORY[0x1E0C99D68];
  v20 = a6;
  objc_msgSend(v19, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timeIntervalSinceDate:", v20);
  v23 = v22;

  objc_msgSend(v17, "error");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v17;
  if (v24
    || (objc_msgSend(v16, "error"), v26 = (void *)objc_claimAutoreleasedReturnValue(), v26, v25 = v16, v26))
  {
    objc_msgSend(v25, "error");
    v27 = objc_claimAutoreleasedReturnValue();

    v18 = (id)v27;
  }
  if (v18)
    v28 = a5 == 1;
  else
    v28 = 0;
  if (v28)
    v29 = 9;
  else
    v29 = a5;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFSetupPairingControllerStatusDescriptionFailureGeneric"), CFSTR("HFSetupPairingControllerStatusDescriptionFailureGeneric"), 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v29)
  {
    case 0uLL:
    case 1uLL:
      _HFLocalizedStringWithDefaultValue(CFSTR("HFSetupPairingControllerStatusDescriptionNotStarted"), CFSTR("HFSetupPairingControllerStatusDescriptionNotStarted"), 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = CFSTR("HFSetupPairingControllerStatusTitleNotStarted");
      goto LABEL_83;
    case 2uLL:
      objc_msgSend((id)objc_opt_class(), "accessoryDiscoverySoftTimeout");
      if (v23 >= v34)
        v33 = CFSTR("HFSetupPairingControllerStatusTitleWaitingToDiscoverAccessorySoftTimeout");
      else
        v33 = CFSTR("HFSetupPairingControllerStatusTitleWaitingToDiscoverAccessory");
      objc_msgSend(a1, "_accessoryNotFoundStatusDescriptionSuffixForSetupResult:", v17);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFSetupPairingControllerStatusDescriptionWaitingToDiscoverAccessory_%@"), v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      _HFLocalizedStringWithDefaultValue(v36, v36, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_83;
    case 3uLL:
    case 4uLL:
    case 6uLL:
    case 7uLL:
      v31 = CFSTR("HFSetupPairingControllerStatusDescriptionSettingUp");
      goto LABEL_12;
    case 5uLL:
      v31 = CFSTR("HFSetupPairingControllerStatusDescriptionAddingToHome");
LABEL_12:
      _HFLocalizedStringWithDefaultValue(v31, v31, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = 0;
      goto LABEL_83;
    case 8uLL:
      objc_msgSend(v16, "name");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (!v43)
      {
        objc_msgSend(v90, "setupAccessoryDescription");
        a1 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "accessoryName");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
      }
      HFLocalizedStringWithFormat(CFSTR("HFSetupPairingControllerStatusDescriptionFailureAlreadyPaired"), CFSTR("%@"), v37, v38, v39, v40, v41, v42, (uint64_t)v44);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v43)
      {

      }
      v33 = CFSTR("HFSetupPairingControllerStatusTitleFailureAlreadyPaired");
      goto LABEL_83;
    case 9uLL:
      objc_msgSend(v18, "userInfo");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46)
        objc_msgSend(v18, "localizedDescription");
      else
        _HFLocalizedStringWithDefaultValue(CFSTR("HFSetupPairingControllerStatusDescriptionFailureGeneric"), CFSTR("HFSetupPairingControllerStatusDescriptionFailureGeneric"), 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "domain");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "isEqualToString:", *MEMORY[0x1E0CB8C70]);

      if (!v48)
      {
        objc_msgSend(v18, "domain");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("HFErrorDomain"));

        if (!v52)
        {
LABEL_78:
          v33 = CFSTR("HFSetupPairingControllerStatusTitleFailureGeneric");
          goto LABEL_83;
        }
        v53 = objc_msgSend(v18, "code");
        if (v53 != 33)
        {
          if (v53 == 22)
          {
            _HFLocalizedStringWithDefaultValue(CFSTR("HFSetupPairingControllerStatusDescriptionFailureAccessoryNotInPairingMode"), CFSTR("HFSetupPairingControllerStatusDescriptionFailureAccessoryNotInPairingMode"), 1);
            v54 = objc_claimAutoreleasedReturnValue();

            v33 = CFSTR("HFSetupPairingControllerStatusTitleFailureAccessoryNotInPairingMode");
            goto LABEL_82;
          }
          if (v53 == 6)
          {
            _HFLocalizedStringWithDefaultValue(CFSTR("HFSetupPairingControllerStatusDescriptionFailureAccessoryNotFound"), CFSTR("HFSetupPairingControllerStatusDescriptionFailureAccessoryNotFound"), 1);
            v54 = objc_claimAutoreleasedReturnValue();

            v33 = CFSTR("HFSetupPairingControllerStatusTitleFailureAccessoryNotFound");
LABEL_82:
            v32 = (void *)v54;
            goto LABEL_83;
          }
          HFLogForCategory(0x3AuLL);
          v63 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            goto LABEL_77;
          goto LABEL_96;
        }
        goto LABEL_52;
      }
      v49 = objc_msgSend(v18, "code");
      if (v49 > 77)
      {
        if (v49 <= 2001)
        {
          switch(v49)
          {
            case 'N':
              v50 = CFSTR("HFSetupPairingControllerStatusDescriptionFailureInternetConnectionRequired");
              goto LABEL_60;
            case 'Z':
              if (+[HFUtilities useWLANInsteadOfWiFi](HFUtilities, "useWLANInsteadOfWiFi"))
                v64 = CFSTR("HFSetupPairingControllerStatusDescriptionFailureIncompatibleNetwork_WLAN");
              else
                v64 = CFSTR("HFSetupPairingControllerStatusDescriptionFailureIncompatibleNetwork_WIFI");
              goto LABEL_80;
            case '[':
              goto LABEL_68;
            case '\\':
              objc_msgSend(v16, "accessory");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "home");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "residentDevices");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = objc_msgSend(v68, "count");

              if (v69)
              {
                _HFLocalizedStringWithDefaultValue(CFSTR("HFSetupPairingControllerStatusDescriptionFailureNoCompatibleHomeHub"), CFSTR("HFSetupPairingControllerStatusDescriptionFailureNoCompatibleHomeHub"), 1);
                v54 = objc_claimAutoreleasedReturnValue();

                v33 = CFSTR("HFSetupPairingControllerStatusTitleFailureNoCompatibleHomeHub");
              }
              else
              {
LABEL_68:
                _HFLocalizedStringWithDefaultValue(CFSTR("HFSetupPairingControllerStatusDescriptionFailureNoHomeHub"), CFSTR("HFSetupPairingControllerStatusDescriptionFailureNoHomeHub"), 1);
                v54 = objc_claimAutoreleasedReturnValue();

                v33 = CFSTR("HFSetupPairingControllerStatusTitleFailureNoHomeHub");
              }
              break;
              v64 = CFSTR("HFSetupPairingControllerStatusDescriptionFailureOwnershipFailure");
              goto LABEL_80;
            case 'a':
              v70 = (void *)MEMORY[0x1E0CBA1A8];
              objc_msgSend(v17, "setupPayload");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "category");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "categoryType");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "hf_userFriendlyLocalizedCapitalizedDescription:", v73);
              v74 = (void *)objc_claimAutoreleasedReturnValue();

              if (v74)
                HFLocalizedStringWithFormat(CFSTR("HFSetupPairingControllerStatusDescriptionFailureMaximumAccessoriesOfTypeInHome"), CFSTR("%@"), v75, v76, v77, v78, v79, v80, (uint64_t)v74);
              else
                _HFLocalizedStringWithDefaultValue(CFSTR("HFSetupPairingControllerStatusDescriptionFailureMaximumAccessoriesOfTypeInHome_Generic"), CFSTR("HFSetupPairingControllerStatusDescriptionFailureMaximumAccessoriesOfTypeInHome_Generic"), 1);
              v54 = objc_claimAutoreleasedReturnValue();

              v33 = CFSTR("HFSetupPairingControllerStatusTitleFailureMaximumAccessoriesOfTypeInHome");
              goto LABEL_82;
            case 'b':
              v64 = CFSTR("HFSetupPairingControllerStatusDescriptionFailureWifiCredentialGenerationFailed");
              goto LABEL_80;
            case 'c':
              v64 = CFSTR("HFSetupPairingControllerStatusDescriptionFailureEnterpriseNetworkNotSupported");
              goto LABEL_80;
            case 'd':
            case 'f':
              goto LABEL_59;
            default:
              goto LABEL_76;
          }
          goto LABEL_82;
        }
        if (v49 > 2014)
        {
          if (v49 == 2015)
          {
            objc_msgSend(a1, "_accessoryNotFoundStatusDescriptionSuffixForSetupResult:", v17);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFSetupPairingControllerStatusDescriptionWaitingToDiscoverAccessory_%@"), v81);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            _HFLocalizedStringWithDefaultValue(v82, v82, 1);
            v83 = objc_claimAutoreleasedReturnValue();

            v33 = CFSTR("HFSetupPairingControllerStatusTitleFailureAccessoryConnectionFailed");
            v32 = (void *)v83;
            goto LABEL_83;
          }
          if (v49 == 2016)
          {
            _HFLocalizedStringWithDefaultValue(CFSTR("HFSetupPairingControllerStatusDescriptionFailureAccessoryFailedToJoinNetwork"), CFSTR("HFSetupPairingControllerStatusDescriptionFailureAccessoryFailedToJoinNetwork"), 1);
            v54 = objc_claimAutoreleasedReturnValue();

            v33 = CFSTR("HFSetupPairingControllerStatusTitleFailureAccessoryFailedToJoinNetwork");
            goto LABEL_82;
          }
          goto LABEL_76;
        }
        if (v49 != 2002)
        {
          if (v49 == 2004)
          {
            _HFLocalizedStringWithDefaultValue(CFSTR("HFSetupPairingControllerStatusDescriptionFailureUnsupportedSetupPayload"), CFSTR("HFSetupPairingControllerStatusDescriptionFailureUnsupportedSetupPayload"), 1);
            v54 = objc_claimAutoreleasedReturnValue();

            v33 = CFSTR("HFSetupPairingControllerStatusTitleFailureUnsupportedSetupPayload");
            goto LABEL_82;
          }
LABEL_76:
          HFLogForCategory(0x3AuLL);
          v63 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
LABEL_77:

            goto LABEL_78;
          }
LABEL_96:
          objc_msgSend(v18, "domain");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v92 = v89;
          v93 = 2112;
          v94 = v18;
          _os_log_error_impl(&dword_1DD34E000, v63, OS_LOG_TYPE_ERROR, "Unexpected accessory %@ setup error %@", buf, 0x16u);

          goto LABEL_77;
        }
        v64 = CFSTR("HFSetupPairingControllerStatusDescriptionFailureIncorrectSetupCode");
        goto LABEL_80;
      }
      if (v49 > 53)
      {
        if (v49 == 54)
        {
LABEL_59:
          v50 = CFSTR("HFSetupPairingControllerStatusDescriptionFailureGenericNetwork");
LABEL_60:
          HFLocalizedWiFiString(v50);
          v65 = objc_claimAutoreleasedReturnValue();
          goto LABEL_81;
        }
        if (v49 != 55)
          goto LABEL_76;
        v64 = CFSTR("HFSetupPairingControllerStatusDescriptionFailureAuthenticationFailed");
LABEL_80:
        _HFLocalizedStringWithDefaultValue(v64, v64, 1);
        v65 = objc_claimAutoreleasedReturnValue();
LABEL_81:
        v54 = v65;

        v33 = CFSTR("HFSetupPairingControllerStatusTitleFailureGeneric");
        goto LABEL_82;
      }
      if (v49 == 3)
      {
LABEL_52:
        _HFLocalizedStringWithDefaultValue(CFSTR("HFSetupPairingControllerStatusDescriptionFailureInvalidCode"), CFSTR("HFSetupPairingControllerStatusDescriptionFailureInvalidCode"), 1);
        v54 = objc_claimAutoreleasedReturnValue();

        v33 = CFSTR("HFSetupPairingControllerStatusTitleFailureInvalidCode");
        goto LABEL_82;
      }
      if (v49 != 13)
        goto LABEL_76;
      objc_msgSend(v16, "name");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v61;
      if (!v61)
      {
        objc_msgSend(v90, "setupAccessoryDescription");
        a1 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "accessoryName");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
      }
      HFLocalizedStringWithFormat(CFSTR("HFSetupPairingControllerStatusDescriptionFailureAlreadyPaired"), CFSTR("%@"), v55, v56, v57, v58, v59, v60, (uint64_t)v62);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v61)
      {

      }
      v33 = CFSTR("HFSetupPairingControllerStatusTitleFailureAlreadyPaired");
LABEL_15:
      v32 = v30;
LABEL_83:
      HFLocalizedWiFiStringKeyForKey(v33);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      _HFLocalizedStringWithDefaultValue(v84, 0, 0);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      if (v85)
      {
        HFLocalizedWiFiString(v33);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_withoutName"), v33);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      _HFLocalizedStringWithDefaultValue(v86, 0, 0);
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      if (v87)
      {
        _HFLocalizedStringWithDefaultValue(v86, v86, 1);
        v88 = objc_claimAutoreleasedReturnValue();

        v85 = (void *)v88;
      }
      if (!v85)
      {
        _HFLocalizedStringWithDefaultValue(v33, 0, 0);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (a3)
        *a3 = objc_retainAutorelease(v85);
      if (a4)
        *a4 = objc_retainAutorelease(v32);

      return;
    case 0xAuLL:
      _HFLocalizedStringWithDefaultValue(CFSTR("HFSetupPairingControllerStatusDescriptionSuccess"), CFSTR("HFSetupPairingControllerStatusDescriptionSuccess"), 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = CFSTR("HFSetupPairingControllerStatusTitleSuccess");
      goto LABEL_83;
    default:
      v33 = 0;
      goto LABEL_15;
  }
}

+ (unint64_t)processFirstPartyAccessorySetupProgressChange:(int64_t)a3 currentPhase:(unint64_t)a4 context:(id)a5 discoveredAccessory:(id)a6 setupResult:(id)a7 home:(id)a8 callerClass:(Class)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return +[HFSetupPairingControllerUtilities processSetupAccessoryProgressChange:currentPhase:context:discoveredAccessory:setupResult:home:callerClass:thirdParty:](HFSetupPairingControllerUtilities, "processSetupAccessoryProgressChange:currentPhase:context:discoveredAccessory:setupResult:home:callerClass:thirdParty:", a3, a4, a5, a6, a7, a8, a9, v10);
}

+ (unint64_t)processThirdPartyAccessorySetupProgressChange:(int64_t)a3 currentPhase:(unint64_t)a4 context:(id)a5 discoveredAccessory:(id)a6 setupResult:(id)a7 callerClass:(Class)a8
{
  uint64_t v9;

  LOBYTE(v9) = 1;
  return +[HFSetupPairingControllerUtilities processSetupAccessoryProgressChange:currentPhase:context:discoveredAccessory:setupResult:home:callerClass:thirdParty:](HFSetupPairingControllerUtilities, "processSetupAccessoryProgressChange:currentPhase:context:discoveredAccessory:setupResult:home:callerClass:thirdParty:", a3, a4, a5, a6, a7, 0, a8, v9);
}

+ (unint64_t)processSetupAccessoryProgressChange:(int64_t)a3 currentPhase:(unint64_t)a4 context:(id)a5 discoveredAccessory:(id)a6 setupResult:(id)a7 home:(id)a8 callerClass:(Class)aClass thirdParty:(BOOL)a10
{
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  NSObject *v32;
  int v34;
  unint64_t v35;
  void *v36;
  id v37;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  int64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  unint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a6;
  v17 = a8;
  objc_msgSend(v15, "setupAccessoryDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0x3AuLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromClass(aClass);
    v37 = v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HMSetupAccessoryProgressAsString();
    v21 = v18;
    v22 = v15;
    v23 = a7;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFSetupPairingControllerUtilities descriptionForPairingPhase:](HFSetupPairingControllerUtilities, "descriptionForPairingPhase:", a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v40 = a1;
    v41 = 2112;
    v42 = v20;
    v43 = 2112;
    v44 = v24;
    v45 = 2048;
    v46 = a3;
    v47 = 2112;
    v48 = v25;
    v49 = 2048;
    v50 = a4;
    _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "%@ [%@] didUpdateProgress: %@ [%ld] with currentPhase: %@ [%lu]", buf, 0x3Eu);

    a7 = v23;
    v15 = v22;
    v18 = v21;

    v17 = v37;
  }

  if (a4 == 9)
  {
    HFLogForCategory(0x3AuLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v26, OS_LOG_TYPE_DEFAULT, "...but we're already in a 'failed' state, so ignoring the progress update", buf, 2u);
    }

    v27 = 9;
  }
  else
  {
    objc_msgSend(v16, "setCertificationStatus:", objc_msgSend(v18, "certificationStatus"));
    if (objc_msgSend(v16, "certificationStatus"))
    {
      objc_msgSend(v18, "accessoryName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setName:", v28);

      objc_msgSend(v18, "category");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCategory:", v29);

      objc_msgSend(v18, "manufacturerName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setManufacturer:", v30);

    }
    if (a4 == 6)
    {
LABEL_10:
      v27 = 6;
    }
    else
    {
      v27 = 5;
      switch(a3)
      {
        case 0:
        case 1:
        case 2:
          if (a4 == 4)
            v27 = 4;
          else
            v27 = 3;
          break;
        case 3:
          break;
        case 6:
          if (!a10)
            objc_msgSend(v17, "userDidRespondToConsentRequestForSetupAccessoryDescription:withResponse:", v18, 1);
          v31 = a4 == 1;
          goto LABEL_24;
        case 7:
        case 21:
        case 24:
          if (a7)
            v31 = a4 == 1;
          else
            v31 = 1;
LABEL_24:
          if (v31)
            v27 = 1;
          else
            v27 = 4;
          break;
        case 8:
        case 10:
          goto LABEL_10;
        case 9:
          v34 = objc_msgSend((id)objc_opt_class(), "_context:requiresUserConsentToReplaceInHome:", v15, v17);
          v35 = 7;
          if (!v34)
            v35 = a4;
          if ((v34 & 1) == 0 && !a10)
          {
            objc_msgSend(v17, "userDidRespondToConsentRequestForSetupAccessoryDescription:withResponse:", v18, 3);
            v35 = a4;
          }
          if (a4 == 1)
            v27 = v35;
          else
            v27 = 4;
          break;
        default:
          HFLogForCategory(0x3AuLL);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            HMSetupAccessoryProgressAsString();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v40 = v36;
            _os_log_error_impl(&dword_1DD34E000, v32, OS_LOG_TYPE_ERROR, "Unexpected accessory setup progress %@", buf, 0xCu);

          }
          v27 = a4;
          break;
      }
    }
  }

  return v27;
}

+ (BOOL)_context:(id)a3 requiresUserConsentToReplaceInHome:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "setupAccessoryDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB7AF8]);

  return v7;
}

+ (id)urlComponentHomeSettingsForAccessory:(id)a3 forHome:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "cameraProfiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    if (objc_msgSend(v5, "hf_isNetworkRouter"))
    {
      +[HFURLComponents networkRouterSettingsURLForHome:](HFURLComponents, "networkRouterSettingsURLForHome:", v6);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v11 = (void *)v12;
      goto LABEL_11;
    }
    objc_msgSend(v5, "hf_irrigationSystemServices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
LABEL_7:
      +[HFURLComponents accessoryDetailsURLForAccessory:home:](HFURLComponents, "accessoryDetailsURLForAccessory:home:", v5, v6);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "hf_isCategorizedAsBridge"))
    {
      +[HFURLComponents bridgeSettingsURLForAccessory:home:](HFURLComponents, "bridgeSettingsURLForAccessory:home:", v5, v6);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "hf_isSingleServiceAccessory"))
    {
      objc_msgSend(v5, "hf_primaryService");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!+[HFSetupPairingControllerUtilities _shouldViewProgSwitchVisibleService:](HFSetupPairingControllerUtilities, "_shouldViewProgSwitchVisibleService:", v5))goto LABEL_7;
      +[HFSetupPairingControllerUtilities _progSwitchVisibleServiceToView:](HFSetupPairingControllerUtilities, "_progSwitchVisibleServiceToView:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[HFURLComponents serviceDetailsURLForService:home:](HFURLComponents, "serviceDetailsURLForService:home:", v9, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  objc_msgSend(v5, "cameraProfiles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFURLComponents cameraProfileDetailsURLForCameraProfile:home:](HFURLComponents, "cameraProfileDetailsURLForCameraProfile:home:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_3:
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v11, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "queryItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), MEMORY[0x1E0C9AAB0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "queryItemWithName:value:", CFSTR("HFURLComponentsFromHUIS"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayByAddingObject:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setQueryItems:", v20);

  return v15;
}

+ (BOOL)_shouldViewProgSwitchVisibleService:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(v3, "hf_isProgrammableSwitch"))
  {
    objc_msgSend(v3, "hf_visibleServices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_progSwitchVisibleServiceToView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(a1, "_shouldViewProgSwitchVisibleService:", v4))
  {
    objc_msgSend(v4, "hf_visibleServices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_primaryService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "na_safeContainsObject:", v6);

    if (v7)
    {
      objc_msgSend(v4, "hf_primaryService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "hf_visibleServices");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "anyObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
