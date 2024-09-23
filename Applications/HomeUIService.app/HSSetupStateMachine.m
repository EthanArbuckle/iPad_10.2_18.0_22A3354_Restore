@implementation HSSetupStateMachine

- (Class)configurationObjectClass
{
  return (Class)objc_opt_class(HSSetupStateMachineConfiguration, a2);
}

- (BOOL)configSupportsPairing:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  BOOL v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = objc_msgSend(v4, "stateMachineConfigurationGetLaunchReason:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "home"));
  if (v6)
    v7 = v5 == (id)4;
  else
    v7 = 1;
  v10 = !v7 && v5 != (id)5 && v5 != (id)6;

  return v10;
}

- (int64_t)stepFollowingStep:(int64_t)a3 withConfiguration:(id)a4
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  int64_t v18;
  void *v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  unsigned int v39;
  void *v40;

  v7 = a4;
  v8 = -[HSSetupStateMachine configurationObjectClass](self, "configurationObjectClass");
  v9 = v7;
  v10 = v9;
  if (v9)
  {
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;
    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class(v10, v15));

    }
  }
  else
  {
    v12 = 0;
  }

  v16 = -[HSSetupStateMachine configSupportsPairing:](self, "configSupportsPairing:", v12);
  if (a3 >= 9 && v16)
    objc_msgSend(v12, "setIsReadyToPair:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pairingError"));

  if (v17)
  {
LABEL_12:
    v18 = 53;
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
    v21 = (char *)objc_msgSend(v20, "stateMachineConfigurationGetLaunchReason:", v12);

    v18 = 3;
    switch(a3)
    {
      case 0:
        v18 = 12;
        switch((unint64_t)v21)
        {
          case 0uLL:
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
            v37 = objc_msgSend(v36, "stateMachineConfigurationIsLaunchedToSetupSpecificAccessory:", v12);

            if (v37)
              v18 = 4;
            else
              v18 = 1;
            break;
          case 1uLL:
            goto LABEL_13;
          case 2uLL:
            goto LABEL_19;
          case 3uLL:
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
            v39 = objc_msgSend(v38, "stateMachineConfigurationIsLaunchedToSetupMultipleAccessories:", v12);

            if (v39)
              v18 = 36;
            else
              v18 = 35;
            break;
          case 4uLL:
            v18 = 17;
            break;
          case 5uLL:
            goto LABEL_15;
          case 6uLL:
            goto LABEL_20;
          case 7uLL:
          case 8uLL:
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
            objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSSetupStateMachine.m"), 112, CFSTR("Unsupported Launch Reason %ld"), v21);

            goto LABEL_18;
          default:
            goto LABEL_18;
        }
        break;
      case 1:
LABEL_18:
        v18 = 2;
        break;
      case 2:
        break;
      case 3:
        v18 = 4;
        break;
      case 4:
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "setupDescription"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "setupAccessoryPayload"));

        if (v24)
        {
          v18 = 5;
        }
        else
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stateMachineConfigurationGetDiscoveredAccessory:", v12));

          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stateMachineConfigurationGetSetupCode:", v12));

          if (v33 && (!objc_msgSend(v33, "requiresSetupCode") || objc_msgSend(v35, "length")))
            v18 = 5;
          else
            v18 = 1;

        }
        break;
      case 5:
        v18 = 6;
        break;
      case 6:
        v18 = 7;
        break;
      case 7:
        if ((_os_feature_enabled_impl("Home", "MatteriPhoneOnlyPairing") & 1) != 0)
        {
          v18 = 8;
          break;
        }
        v30 = CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0) == 0;
        v31 = 8;
        goto LABEL_83;
      case 8:
        v18 = 9;
        break;
      case 9:
        v18 = 10;
        break;
      case 10:
        if ((_os_feature_enabled_impl("Home", "MatteriPhoneOnlyPairing") & 1) != 0)
        {
          v18 = 11;
        }
        else if (CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
        {
          v18 = 11;
        }
        else
        {
          v18 = 14;
        }
        break;
      case 11:
        v18 = 14;
        break;
      case 12:
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
        v26 = objc_msgSend(v25, "stateMachineConfigurationShouldJumpToDoneStep:", v12);

        if (v26)
          v18 = 52;
        else
          v18 = 13;
        break;
      case 13:
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addedAccessory"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "pendingConfigurationIdentifier"));

        v18 = +[HSSetupContentProvider hsProxCardSetupUIStepForString:](HSSetupContentProvider, "hsProxCardSetupUIStepForString:", v28);
        if (v18 <= 13)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addedAccessory"));

          if (!v29)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
            objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSSetupStateMachine.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("config.addedAccessory"));

          }
          v18 = 14;
        }

        break;
      case 14:
        v18 = 15;
        break;
      case 15:
        v18 = 16;
        break;
      case 16:
      case 17:
LABEL_15:
        v18 = 18;
        break;
      case 18:
        v30 = _os_feature_enabled_impl("HomeApp", "wallet_key_uwb") == 0;
        v31 = 19;
        goto LABEL_83;
      case 19:
        v18 = 20;
        break;
      case 20:
LABEL_20:
        v18 = 21;
        break;
      case 21:
        v18 = 22;
        break;
      case 22:
        if ((unint64_t)(v21 - 4) >= 3)
          v18 = 23;
        else
          v18 = 52;
        break;
      case 23:
        v18 = 24;
        break;
      case 24:
        v18 = 25;
        break;
      case 25:
        v18 = 26;
        break;
      case 26:
        v18 = 27;
        break;
      case 27:
        v18 = 28;
        break;
      case 28:
        v18 = 29;
        break;
      case 29:
        v18 = 30;
        break;
      case 30:
        v18 = 31;
        break;
      case 31:
        v18 = 32;
        break;
      case 32:
        v18 = 33;
        break;
      case 33:
        v18 = 34;
        break;
      case 34:
        v18 = 35;
        break;
      case 35:
        v18 = 36;
        break;
      case 36:
        v18 = 37;
        break;
      case 37:
        v18 = 38;
        break;
      case 38:
        v18 = 39;
        break;
      case 39:
        v18 = 40;
        break;
      case 40:
        v18 = 41;
        break;
      case 41:
        v18 = 42;
        break;
      case 42:
        v18 = 43;
        break;
      case 43:
        v18 = 44;
        break;
      case 44:
        v18 = 45;
        break;
      case 45:
        v18 = 46;
        break;
      case 46:
        v18 = 47;
        break;
      case 47:
LABEL_19:
        v18 = 48;
        break;
      case 48:
        v18 = 49;
        break;
      case 49:
        v18 = 50;
        break;
      case 50:
        if ((_os_feature_enabled_impl("Home", "MatteriPhoneOnlyPairing") & 1) != 0)
        {
          v18 = 51;
        }
        else
        {
          v30 = CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0) == 0;
          v31 = 51;
LABEL_83:
          if (v30)
            v18 = v31 + 1;
          else
            v18 = v31;
        }
        break;
      case 51:
        v18 = 52;
        break;
      default:
        goto LABEL_12;
    }
  }
LABEL_13:

  return v18;
}

- (id)shouldSkipStep:(int64_t)a3 withConfiguration:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  unsigned int v21;
  _BOOL8 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unsigned int v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  char *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  const __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  unsigned __int8 v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  void *v66;
  void *v67;
  unsigned int v68;
  void *v69;
  unsigned int v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  char *v79;
  uint64_t v80;
  NSObject *v81;
  uint64_t v82;
  id v83;
  void *v84;
  void *v85;
  unsigned int v86;
  void *v87;
  unsigned int v88;
  void *v89;
  unsigned int v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  int v94;
  const __CFString *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  NSObject *v105;
  uint64_t v106;
  id v107;
  const __CFString *v108;
  void *v109;
  __CFString *v110;
  void *v111;
  unsigned int v112;
  const __CFString *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  uint64_t v118;
  id v119;
  void *v120;
  void *v121;
  uint64_t v122;
  NSObject *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  NSObject *v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  NSObject *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const __CFString *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  NSObject *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const __CFString *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  NSObject *v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  __CFString *v167;
  void *v168;
  uint64_t v169;
  uint64_t v170;
  id v171;
  void *v172;
  void *v173;
  uint64_t v174;
  char *v175;
  uint64_t v176;
  char *v177;
  void *v178;
  __CFString *v179;
  __CFString *v180;
  char *v181;
  char *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  unsigned int v188;
  unsigned int v189;
  unsigned int v190;
  unsigned int v191;
  unsigned int v192;
  _QWORD v193[4];
  id v194;
  _QWORD v195[4];
  id v196;
  _QWORD v197[4];
  id v198;
  id v199;
  id v200;
  _QWORD v201[4];
  id v202;
  id v203;
  _QWORD v204[5];
  id v205;
  uint64_t v206;
  _QWORD v207[4];
  id v208;
  HSSetupStateMachine *v209;
  uint64_t v210;
  id v211;
  _QWORD v212[6];
  uint8_t buf[4];
  uint64_t v214;
  __int16 v215;
  const char *v216;
  __int16 v217;
  uint64_t v218;
  __int16 v219;
  _BYTE v220[10];
  const __CFString *v221;
  __int16 v222;
  const __CFString *v223;
  __int16 v224;
  _BYTE v225[10];
  void *v226;
  __int16 v227;
  void *v228;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  v8 = objc_msgSend(v7, "stateMachineConfigurationIsLaunchedToSetupSpecificAccessory:", v6);

  if (v8)
  {
    if (a3 > 9)
    {
      v11 = 0;
      if (a3 == 10 || a3 == 53)
      {
LABEL_11:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
        v15 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v12));
LABEL_12:
        v14 = (void *)v15;
        goto LABEL_13;
      }
    }
    else if (a3 == 1 || a3 == 4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stateMachineConfigurationGetSetupCode:", v6));
      v11 = objc_msgSend(v10, "length") != 0;

      goto LABEL_11;
    }
    v11 = 1;
    goto LABEL_11;
  }
  if (a3 == 12)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v12, "stateMachineConfigurationShouldSkipResumeSelectAccessoryStep:", v6)));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v13));

LABEL_13:
    goto LABEL_14;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  v18 = objc_msgSend(v17, "stateMachineConfigurationGetLaunchReason:", v6);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
  if ((objc_msgSend(v19, "hf_isNetworkRouter") & 1) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
    v21 = objc_msgSend(v20, "stateMachineConfigurationActiveTupleIsTopTuple");

    if (v21)
    {
      v23 = a3 > 10 && a3 != 47;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v23));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v24));

      goto LABEL_14;
    }
  }
  else
  {

  }
  switch(a3)
  {
    case 17:
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
      v188 = objc_msgSend(v25, "hf_currentUserIsAdministrator");
      if ((objc_msgSend(v25, "hasOnboardedForWalletKey") & 1) != 0)
      {
        v191 = 0;
      }
      else
      {
        v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "hf_walletKeyAccessories"));
        if (objc_msgSend(v101, "count"))
        {
          if (v188 && (objc_msgSend(v25, "hf_hasHomeHubSupportingWalletKey") & 1) != 0)
            v191 = 1;
          else
            v191 = objc_msgSend(v25, "hf_currentUserIsOwner");
        }
        else
        {
          v191 = 0;
        }

      }
      v131 = HFLogForCategory(66, v26);
      v132 = objc_claimAutoreleasedReturnValue(v131);
      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      {
        v133 = NSStringFromBOOL(v191);
        v181 = (char *)objc_claimAutoreleasedReturnValue(v133);
        v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "name"));
        v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "uniqueIdentifier"));
        v134 = NSStringFromBOOL(objc_msgSend(v25, "hasOnboardedForWalletKey"));
        v179 = (__CFString *)objc_claimAutoreleasedReturnValue(v134);
        v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "hf_walletKeyAccessories"));
        v136 = (const __CFString *)objc_msgSend(v135, "count");
        v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "hf_walletKeyAccessories"));
        v138 = (void *)objc_claimAutoreleasedReturnValue(+[HMAccessory hf_minimumDescriptionsOfAccessories:](HMAccessory, "hf_minimumDescriptionsOfAccessories:", v137));
        v139 = NSStringFromBOOL(objc_msgSend(v25, "hf_hasHomeHubSupportingWalletKey"));
        v140 = (void *)objc_claimAutoreleasedReturnValue(v139);
        v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "currentUser"));
        v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "hf_prettyDescription"));
        *(_DWORD *)buf = 136317186;
        v214 = (uint64_t)"-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
        v215 = 2112;
        v216 = v181;
        v217 = 2112;
        v218 = (uint64_t)v186;
        v219 = 2112;
        *(_QWORD *)v220 = v183;
        *(_WORD *)&v220[8] = 2112;
        v221 = v179;
        v222 = 2048;
        v223 = v136;
        v224 = 2112;
        *(_QWORD *)v225 = v138;
        *(_WORD *)&v225[8] = 2112;
        v226 = v140;
        v227 = 2112;
        v228 = v142;
        _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "(%s) showWalletKeyFeature = %@ | home <Name: %@, uniqueIdentifier: %@> | hasOnboardedForWalletKey = %@ | walletKeyAccessories (%ld) %@ | hasHomeHubSupportingWalletKey %@ | user %@", buf, 0x5Cu);

      }
      if ((objc_msgSend(v25, "hasOnboardedForAccessCode") & 1) != 0)
      {
        v190 = 0;
      }
      else
      {
        v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "hf_accessoriesSupportingAccessCodes"));
        if (objc_msgSend(v144, "count"))
        {
          if (v188 && (objc_msgSend(v25, "hf_hasHomeHubSupportingAccessCodes") & 1) != 0)
            v190 = 1;
          else
            v190 = objc_msgSend(v25, "hf_currentUserIsOwner");
        }
        else
        {
          v190 = 0;
        }

      }
      v145 = HFLogForCategory(50, v143);
      v146 = objc_claimAutoreleasedReturnValue(v145);
      if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
      {
        v147 = NSStringFromBOOL(v190);
        v182 = (char *)objc_claimAutoreleasedReturnValue(v147);
        v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "name"));
        v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "uniqueIdentifier"));
        v148 = NSStringFromBOOL(objc_msgSend(v25, "hasOnboardedForAccessCode"));
        v180 = (__CFString *)objc_claimAutoreleasedReturnValue(v148);
        v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "hf_accessoriesSupportingAccessCodes"));
        v150 = (const __CFString *)objc_msgSend(v149, "count");
        v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "hf_accessoriesSupportingAccessCodes"));
        v152 = (void *)objc_claimAutoreleasedReturnValue(+[HMAccessory hf_minimumDescriptionsOfAccessories:](HMAccessory, "hf_minimumDescriptionsOfAccessories:", v151));
        v153 = NSStringFromBOOL(objc_msgSend(v25, "hf_hasHomeHubSupportingAccessCodes"));
        v154 = (void *)objc_claimAutoreleasedReturnValue(v153);
        v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "currentUser"));
        v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "hf_prettyDescription"));
        *(_DWORD *)buf = 136317186;
        v214 = (uint64_t)"-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
        v215 = 2112;
        v216 = v182;
        v217 = 2112;
        v218 = (uint64_t)v187;
        v219 = 2112;
        *(_QWORD *)v220 = v184;
        *(_WORD *)&v220[8] = 2112;
        v221 = v180;
        v222 = 2048;
        v223 = v150;
        v224 = 2112;
        *(_QWORD *)v225 = v152;
        *(_WORD *)&v225[8] = 2112;
        v226 = v154;
        v227 = 2112;
        v228 = v156;
        _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEFAULT, "(%s) showAccessCodeFeature = %@ | home <Name: %@, uniqueIdentifier: %@> | hasOnboardedForAccessCode = %@ | accessoriesSupportingAccessCodes (%ld) %@ | hasHomeHubSupportingAccessCodes %@ | user %@", buf, 0x5Cu);

      }
      v158 = HFLogForCategory(33, v157);
      v159 = objc_claimAutoreleasedReturnValue(v158);
      v160 = v191 | v190;
      if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
      {
        v161 = NSStringFromBOOL(v160);
        v162 = (char *)objc_claimAutoreleasedReturnValue(v161);
        v163 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", 17));
        v164 = NSStringFromBOOL(v191);
        v165 = (void *)objc_claimAutoreleasedReturnValue(v164);
        v166 = NSStringFromBOOL(v190);
        v167 = (__CFString *)objc_claimAutoreleasedReturnValue(v166);
        *(_DWORD *)buf = 136316162;
        v214 = (uint64_t)"-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
        v215 = 2112;
        v216 = v162;
        v217 = 2112;
        v218 = (uint64_t)v163;
        v219 = 2112;
        *(_QWORD *)v220 = v165;
        *(_WORD *)&v220[8] = 2112;
        v221 = v167;
        _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_DEFAULT, "(%s) shouldShow = %@ for %@ because showWalletKeyFeature = %@ and showAccessCodeFeature = %@", buf, 0x34u);

      }
      v168 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v160 ^ 1));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v168));

      goto LABEL_14;
    case 18:
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
      v28 = objc_msgSend(v27, "hf_currentUserIsOwner");
      v192 = objc_msgSend(v27, "hf_currentUserIsAdministrator");
      v189 = objc_msgSend(v27, "hf_hasHomeHubSupportingWalletKey");
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
      v30 = objc_msgSend(v29, "supportsWalletKey") ^ 1;
      if (((v30 | v28) & 1) == 0)
      {
        if ((v189 & v192 & 1) != 0)
          v30 = 0;
        else
          v30 = objc_msgSend(v27, "hasOnboardedForWalletKey") ^ 1;
      }

      v104 = HFLogForCategory(66, v103);
      v105 = objc_claimAutoreleasedReturnValue(v104);
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        v107 = objc_msgSend((id)objc_opt_class(self, v106), "description");
        v185 = (void *)objc_claimAutoreleasedReturnValue(v107);
        if (v30)
          v108 = CFSTR("Skipping");
        else
          v108 = CFSTR("Not Skipping");
        v109 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", 18));
        v110 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
        v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
        v112 = objc_msgSend(v111, "supportsWalletKey");
        *(_DWORD *)buf = 138414338;
        v113 = CFSTR("doesn't support");
        v215 = 2080;
        v216 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
        v214 = (uint64_t)v185;
        v217 = 2112;
        if (v112)
          v113 = CFSTR("supports");
        v218 = (uint64_t)v108;
        v219 = 2112;
        *(_QWORD *)v220 = v109;
        *(_WORD *)&v220[8] = 2112;
        v221 = v110;
        v222 = 2112;
        v223 = v113;
        v224 = 1024;
        *(_DWORD *)v225 = v28;
        *(_WORD *)&v225[4] = 1024;
        *(_DWORD *)&v225[6] = v192;
        LOWORD(v226) = 1024;
        *(_DWORD *)((char *)&v226 + 2) = v189;
        _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "(%@:%s) %@ %@ because %@ %@ wallet key. isOwner: %{BOOL}d  isAdmin: %{BOOL}d  home hub supports wallet key:(%{BOOL}d)", buf, 0x50u);

      }
      if (v30)
      {
        v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v114));

      }
      else if (+[HFUtilities isAnIPad](HFUtilities, "isAnIPad"))
      {
        v116 = HFLogForCategory(66, v115);
        v117 = objc_claimAutoreleasedReturnValue(v116);
        if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
        {
          v119 = objc_msgSend((id)objc_opt_class(self, v118), "description");
          v120 = (void *)objc_claimAutoreleasedReturnValue(v119);
          v121 = (void *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", 18));
          *(_DWORD *)buf = 138412802;
          v214 = (uint64_t)v120;
          v215 = 2080;
          v216 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          v217 = 2112;
          v218 = (uint64_t)v121;
          _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "(%@:%s) Not skipping %@ for iPads", buf, 0x20u);

        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanFalse));
      }
      else
      {
        v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "hf_hasWalletKeyCompatibleDevice"));
        v212[0] = _NSConcreteStackBlock;
        v212[1] = 3221225472;
        v212[2] = sub_10000C218;
        v212[3] = &unk_1000A1210;
        v212[4] = self;
        v212[5] = 18;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "flatMap:", v212));

      }
      goto LABEL_14;
    case 19:
      if ((_os_feature_enabled_impl("HomeApp", "wallet_key_uwb") & 1) == 0)
      {
        v77 = HFLogForCategory(66, v31);
        v78 = objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          v79 = (char *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", 19));
          *(_DWORD *)buf = 136315394;
          v214 = (uint64_t)"-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          v215 = 2112;
          v216 = v79;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "(%s) Skipping %@ because feature flag is NOT enabled.", buf, 0x16u);

        }
        goto LABEL_68;
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
      if (v33)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
        v35 = objc_msgSend(v34, "supportsUWBUnlock");

        v37 = HFLogForCategory(66, v36);
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = (char *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", 19));
          v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
          v41 = (void *)v40;
          v42 = CFSTR("doesn't support");
          *(_DWORD *)buf = 136316162;
          v214 = (uint64_t)"-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          if (v35)
            v42 = CFSTR("supports");
          v43 = CFSTR("Skipping UWB prox card.");
          if (v35)
            v43 = &stru_1000A3BA0;
          v215 = 2112;
          v216 = v39;
          v217 = 2112;
          v218 = v40;
          v219 = 2112;
          *(_QWORD *)v220 = v42;
          *(_WORD *)&v220[8] = 2112;
          v221 = v43;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "(%s) step = %@. %@ %@ UWB unlock. %@", buf, 0x34u);

        }
        if ((v35 & 1) == 0)
        {
          v173 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v173));

          goto LABEL_143;
        }
        if ((+[HFUtilities isAnIPhone](HFUtilities, "isAnIPhone") & 1) != 0)
        {
          if ((MGGetBoolAnswer(CFSTR("DeviceProximityCapability")) & 1) != 0
            || (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest") & 1) != 0)
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "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"));
            v207[0] = _NSConcreteStackBlock;
            v207[1] = 3221225472;
            v207[2] = sub_10000C3B0;
            v207[3] = &unk_1000A1288;
            v210 = 19;
            v48 = v6;
            v211 = v18;
            v208 = v48;
            v209 = self;
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "flatMap:", v207));
            v204[0] = _NSConcreteStackBlock;
            v204[1] = 3221225472;
            v204[2] = sub_10000C898;
            v204[3] = &unk_1000A1260;
            v204[4] = self;
            v206 = 19;
            v205 = v48;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "recover:", v204));

LABEL_143:
            goto LABEL_14;
          }
          v176 = HFLogForCategory(66, v45);
          v128 = objc_claimAutoreleasedReturnValue(v176);
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
          {
            v177 = (char *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", 19));
            v178 = (void *)objc_claimAutoreleasedReturnValue(+[HUHomeUIServiceLaunchUserInfo launchReasonDescription:](HUHomeUIServiceLaunchUserInfo, "launchReasonDescription:", v18));
            *(_DWORD *)buf = 136315650;
            v214 = (uint64_t)"-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
            v215 = 2112;
            v216 = v177;
            v217 = 2112;
            v218 = (uint64_t)v178;
            _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEFAULT, "(%s) Skipping %@ because this device does not have UWB capability. Launch reason = %@", buf, 0x20u);

          }
        }
        else
        {
          v174 = HFLogForCategory(66, v44);
          v128 = objc_claimAutoreleasedReturnValue(v174);
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
          {
            v175 = (char *)objc_claimAutoreleasedReturnValue(+[HUHomeUIServiceLaunchUserInfo launchReasonDescription:](HUHomeUIServiceLaunchUserInfo, "launchReasonDescription:", v18));
            *(_DWORD *)buf = 136315394;
            v214 = (uint64_t)"-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
            v215 = 2112;
            v216 = v175;
            _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEFAULT, "(%s) Skipping %@ because this device is not iPhone. This prox card should only displayed on iPhones.", buf, 0x16u);

          }
        }
      }
      else
      {
        v127 = HFLogForCategory(66, v32);
        v128 = objc_claimAutoreleasedReturnValue(v127);
        if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
        {
          v129 = (char *)objc_claimAutoreleasedReturnValue(+[HSSetupContentProvider stringForHSProxCardSetupUIStep:](HSSetupContentProvider, "stringForHSProxCardSetupUIStep:", 19));
          *(_DWORD *)buf = 136315650;
          v214 = (uint64_t)"-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          v215 = 2112;
          v216 = v129;
          v217 = 2112;
          v218 = (uint64_t)v6;
          _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEFAULT, "(%s) Skipping %@ because config %@ has no home.", buf, 0x20u);

        }
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanTrue));
      goto LABEL_143;
    case 20:
      if ((+[HFUtilities isAnIPhone](HFUtilities, "isAnIPhone") & 1) == 0)
      {
        v80 = HFLogForCategory(66, v50);
        v81 = objc_claimAutoreleasedReturnValue(v80);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          v83 = objc_msgSend((id)objc_opt_class(self, v82), "description");
          v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
          *(_DWORD *)buf = 138412546;
          v214 = (uint64_t)v84;
          v215 = 2080;
          v216 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "(%@:%s) Skipping HSProxCardSetupUIStepWalletKeyExpressMode because this device is not iPhone", buf, 0x16u);

        }
        goto LABEL_137;
      }
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));

      if (!v51)
      {
        v130 = HFLogForCategory(66, v52);
        v78 = objc_claimAutoreleasedReturnValue(v130);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v214 = 20;
          v215 = 2112;
          v216 = (const char *)v6;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Skipping step because config has no home. step: %lu config: %@", buf, 0x16u);
        }
LABEL_68:

        v56 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanTrue));
        goto LABEL_138;
      }
      if ((+[HFUtilities isUsingiCloud](HFUtilities, "isUsingiCloud") & 1) == 0)
      {
        v169 = HFLogForCategory(66, v53);
        v81 = objc_claimAutoreleasedReturnValue(v169);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          v171 = objc_msgSend((id)objc_opt_class(self, v170), "description");
          v172 = (void *)objc_claimAutoreleasedReturnValue(v171);
          *(_DWORD *)buf = 138412546;
          v214 = (uint64_t)v172;
          v215 = 2080;
          v216 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "(%@:%s) Skipping HSProxCardSetupUIStepWalletKeyExpressMode because not signed into iCloud", buf, 0x16u);

        }
        goto LABEL_137;
      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "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"));
      v201[0] = _NSConcreteStackBlock;
      v201[1] = 3221225472;
      v201[2] = sub_10000C91C;
      v201[3] = &unk_1000A1210;
      v202 = v6;
      v203 = v18;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "flatMap:", v201));

      goto LABEL_14;
    case 21:
      if ((+[HFUtilities isUsingiCloud](HFUtilities, "isUsingiCloud") & 1) == 0 && !v18)
        goto LABEL_54;
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
      v86 = objc_msgSend(v85, "hf_currentUserIsOwner");

      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
      v88 = objc_msgSend(v87, "hf_hasHomeHubSupportingAccessCodes");

      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
      v90 = objc_msgSend(v89, "supportsAccessCodes");

      v92 = HFLogForCategory(50, v91);
      v93 = objc_claimAutoreleasedReturnValue(v92);
      v94 = v90 & (v86 | v88);
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        if (v94)
          v95 = CFSTR("Not");
        else
          v95 = &stru_1000A3BA0;
        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
        *(_DWORD *)buf = 138413570;
        v214 = (uint64_t)self;
        v215 = 2080;
        v216 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
        v217 = 2112;
        v218 = (uint64_t)v95;
        v219 = 1024;
        *(_DWORD *)v220 = objc_msgSend(v96, "supportsAccessCodes");
        *(_WORD *)&v220[4] = 1024;
        *(_DWORD *)&v220[6] = v86;
        LOWORD(v221) = 1024;
        *(_DWORD *)((char *)&v221 + 2) = v88;
        _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "(%@:%s) %@ Skipping PIN Code prox card. supportsAccessCodes:%{BOOL}d  currentUserIsOwner:%{BOOL}d  hubSupported:%{BOOL}d", buf, 0x32u);

      }
      v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v94 ^ 1u));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v97));

      goto LABEL_14;
    case 22:
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
      v58 = objc_msgSend(v57, "supportsAccessCodes");

      if ((v58 & 1) == 0)
        goto LABEL_54;
      if ((+[HFUtilities isUsingiCloud](HFUtilities, "isUsingiCloud") & 1) == 0)
      {
        v102 = HFLogForCategory(66, v59);
        v81 = objc_claimAutoreleasedReturnValue(v102);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v214 = (uint64_t)self;
          v215 = 2080;
          v216 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "(%@:%s) Skipping PIN code text field prox card because user isn't signed into iCloud.", buf, 0x16u);
        }
        goto LABEL_137;
      }
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "pinCodeManagerForHome:", v60));

      objc_initWeak((id *)buf, self);
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "hasValidConstraints"));
      v197[0] = _NSConcreteStackBlock;
      v197[1] = 3221225472;
      v197[2] = sub_10000D014;
      v197[3] = &unk_1000A12D8;
      objc_copyWeak(&v200, (id *)buf);
      v64 = v60;
      v198 = v64;
      v199 = v6;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "flatMap:", v197));

      objc_destroyWeak(&v200);
      objc_destroyWeak((id *)buf);

      goto LABEL_14;
    case 23:
      if ((+[HFUtilities isUsingiCloud](HFUtilities, "isUsingiCloud") & 1) == 0)
      {
        v98 = HFLogForCategory(66, v65);
        v81 = objc_claimAutoreleasedReturnValue(v98);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          v99 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachine description](self, "description"));
          *(_DWORD *)buf = 138412546;
          v214 = objc_opt_class(v99, v100);
          v215 = 2080;
          v216 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "(%@:%s) Skipping guest access PIN code prox card because user isn't signed into iCloud.", buf, 0x16u);

        }
LABEL_137:

        v56 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanTrue));
        goto LABEL_138;
      }
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
      v68 = objc_msgSend(v67, "hf_currentUserIsOwner");

      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
      v70 = objc_msgSend(v69, "hf_hasHomeHubSupportingAccessCodes");

      if (objc_msgSend(v66, "supportsAccessCodes") && ((v68 | v70) & 1) != 0)
      {
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "pinCodeManagerForHome:", v73));

        objc_initWeak((id *)buf, self);
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "guestPinCodes"));
        v195[0] = _NSConcreteStackBlock;
        v195[1] = 3221225472;
        v195[2] = sub_10000D204;
        v195[3] = &unk_1000A1300;
        objc_copyWeak(&v196, (id *)buf);
        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "flatMap:", v195));
        v193[0] = _NSConcreteStackBlock;
        v193[1] = 3221225472;
        v193[2] = sub_10000D39C;
        v193[3] = &unk_1000A1328;
        objc_copyWeak(&v194, (id *)buf);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "recover:", v193));
        objc_destroyWeak(&v194);

        objc_destroyWeak(&v196);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        v122 = HFLogForCategory(50, v71);
        v123 = objc_claimAutoreleasedReturnValue(v122);
        if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
        {
          v124 = (void *)objc_claimAutoreleasedReturnValue(-[HSSetupStateMachine description](self, "description"));
          *(_DWORD *)buf = 138413570;
          v214 = objc_opt_class(v124, v125);
          v215 = 2080;
          v216 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          v217 = 2112;
          v218 = (uint64_t)v66;
          v219 = 1024;
          *(_DWORD *)v220 = objc_msgSend(v66, "supportsAccessCodes");
          *(_WORD *)&v220[4] = 1024;
          *(_DWORD *)&v220[6] = v68;
          LOWORD(v221) = 1024;
          *(_DWORD *)((char *)&v221 + 2) = v70;
          _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "(%@:%s) Skipping guest access for %@. supportsAccessCodes: %{BOOL}d  currentUserIsOwner:%{BOOL}d  hubSupported:%{BOOL}d", buf, 0x32u);

        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanTrue));
      }

      goto LABEL_14;
    default:
      if (a3 == 42)
      {
        if (-[HSSetupStateMachine _sync_shouldSkipSiriVoiceTrainingStep:](self, "_sync_shouldSkipSiriVoiceTrainingStep:", v6))
        {
LABEL_54:
          v56 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &__kCFBooleanTrue));
          goto LABEL_138;
        }
      }
      else
      {
        if (a3 != 41)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[HSSetupStateMachine _sync_shouldSkipStep:withConfiguration:](self, "_sync_shouldSkipStep:withConfiguration:", a3, v6)));
          v15 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v12));
          goto LABEL_12;
        }
        if (-[HSSetupStateMachine _sync_shouldSkipSetupSiriStep:](self, "_sync_shouldSkipSetupSiriStep:", v6))
          goto LABEL_54;
      }
      v56 = objc_claimAutoreleasedReturnValue(-[HSSetupStateMachine _voiceProfileCheckFuture](self, "_voiceProfileCheckFuture"));
LABEL_138:
      v14 = (void *)v56;
LABEL_14:

      return v14;
  }
}

- (BOOL)_sync_shouldSkipStep:(int64_t)a3 withConfiguration:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  unsigned int v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  BOOL v33;
  void *v34;
  unsigned int v35;
  unsigned __int8 v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  unsigned int v58;
  void *v59;
  unsigned __int8 v60;
  void *v61;
  unsigned int v62;
  void *v63;
  unsigned int v64;
  void *v65;
  id v66;
  unsigned __int8 v67;
  BOOL v68;
  unsigned __int8 v69;
  void *v70;
  id v71;
  unsigned __int8 v72;
  _QWORD v74[4];
  id v75;
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  _BYTE v79[10];
  void *v80;
  __int16 v81;
  void *v82;

  v6 = a4;
  v7 = v6;
  LOBYTE(v8) = 0;
  switch(a3)
  {
    case 1:
    case 4:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "setupDescription"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "setupAccessoryPayload"));

      if (v11)
        goto LABEL_77;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stateMachineConfigurationGetDiscoveredAccessory:", v7));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stateMachineConfigurationGetSetupCode:", v7));

      LOBYTE(v8) = v13 && !objc_msgSend(v13, "requiresSetupCode") || objc_msgSend(v15, "length") != 0;
      goto LABEL_80;
    case 2:
    case 3:
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "setupDescription"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "setupAccessoryPayload"));

      if (v17)
        goto LABEL_77;
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v8, "stateMachineConfigurationGetDiscoveredAccessory:", v7));

      LOBYTE(v8) = v13 != 0;
      goto LABEL_81;
    case 5:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
      v18 = objc_msgSend(v13, "stateMachineConfigurationShouldSkipDetectedStep:", v7);
      goto LABEL_73;
    case 6:
    case 7:
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
      goto LABEL_19;
    case 8:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
      v18 = objc_msgSend(v13, "stateMachineConfigurationShouldSkipHomeHubUpgradeStep:", v7);
      goto LABEL_73;
    case 9:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
      v18 = objc_msgSend(v13, "stateMachineConfigurationShouldSkipHomeHubStep:", v7);
      goto LABEL_73;
    case 10:
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
      goto LABEL_19;
    case 11:
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
      v20 = objc_msgSend(v19, "hf_hasResidentDeviceCapableOfSupportingThreadBorderRouter");

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addedAccessory"));
      v22 = objc_msgSend(v21, "requiresThreadRouter");

      v24 = HFLogForCategory(58, v23);
      v8 = objc_claimAutoreleasedReturnValue(v24);
      v25 = os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT);
      if (!v22 || v20)
      {
        if (v25)
        {
          *(_DWORD *)buf = 136315650;
          v77 = "-[HSSetupStateMachine _sync_shouldSkipStep:withConfiguration:]";
          v78 = 1024;
          *(_DWORD *)v79 = v22;
          *(_WORD *)&v79[4] = 1024;
          *(_DWORD *)&v79[6] = v20;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "%s Skipping HSProxCardSetupUIThreadRouterWarning - accessoryIsSED: [%d], hasThreadEnabledResident: [%d]", buf, 0x18u);
        }

LABEL_77:
        LOBYTE(v8) = 1;
      }
      else
      {
        if (v25)
        {
          *(_DWORD *)buf = 136315650;
          v77 = "-[HSSetupStateMachine _sync_shouldSkipStep:withConfiguration:]";
          v78 = 1024;
          *(_DWORD *)v79 = v22;
          *(_WORD *)&v79[4] = 1024;
          *(_DWORD *)&v79[6] = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "%s Showing HSProxCardSetupUIThreadRouterWarning - accessoryIsSED: [%d], hasThreadEnabledResident: [%d]", buf, 0x18u);
        }

        LOBYTE(v8) = 0;
      }
      break;
    case 15:
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "roomName"));
LABEL_19:
      LOBYTE(v8) = v9 != 0;

      break;
    case 24:
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "hf_primaryService"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "serviceType"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[HFAssociatedServiceTypeFactory associatedServiceTypesSetFor:](HFAssociatedServiceTypeFactory, "associatedServiceTypesSetFor:", v28));

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addedAccessory"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[HSPCNameServicesViewController applicableServicesForAccessory:](HSPCNameServicesViewController, "applicableServicesForAccessory:", v30));
      v32 = objc_msgSend(v31, "count");

      if (v29)
        v33 = (unint64_t)v32 > 1;
      else
        v33 = 1;
      LOBYTE(v8) = v33;
      break;
    case 25:
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
      v35 = objc_msgSend(v34, "hf_isCamera");

      if (!v35 || !objc_msgSend(v7, "supportsRichConfiguration"))
        goto LABEL_77;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
      v36 = objc_msgSend(v13, "hf_currentUserIsAdministrator");
      goto LABEL_70;
    case 26:
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
      v38 = objc_msgSend(v37, "hf_isCamera");

      if (!v38)
        goto LABEL_77;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "hf_allUsersIncludingCurrentUser"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v40));

      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_10000DDD0;
      v74[3] = &unk_1000A1350;
      v42 = v7;
      v75 = v42;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "na_filter:", v74));

      v43 = objc_msgSend(v13, "count");
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "cameraProfile"));
      v45 = objc_msgSend(v44, "hf_cameraIsNotSetToRecord");

      v8 = 1;
      if ((unint64_t)v43 >= 2 && (v45 & 1) == 0)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "home"));
        v8 = objc_msgSend(v46, "hf_currentUserIsAdministrator") ^ 1;

      }
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "na_map:", &stru_1000A1390));
      v49 = HFLogForCategory(58, v48);
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = NSStringFromBOOL(v8);
        v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
        v53 = NSStringFromBOOL(v45 ^ 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
        *(_DWORD *)buf = 136315906;
        v77 = "-[HSSetupStateMachine _sync_shouldSkipStep:withConfiguration:]";
        v78 = 2112;
        *(_QWORD *)v79 = v52;
        *(_WORD *)&v79[8] = 2112;
        v80 = v47;
        v81 = 2112;
        v82 = v54;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "(%s) shouldSkip = %@ because users = %@, cameraIsRecording = %@", buf, 0x2Au);

      }
      goto LABEL_81;
    case 27:
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
      v56 = objc_msgSend(v55, "hf_isDoorbell");

      if (!v56)
        goto LABEL_77;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cameraProfile"));
      v18 = objc_msgSend(v13, "hf_cameraIsNotSetToRecord");
      goto LABEL_73;
    case 28:
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
      v58 = objc_msgSend(v57, "hf_isDoorbell");

      if (!v58
        || -[HSSetupStateMachine _sync_shouldSkipStep:withConfiguration:](self, "_sync_shouldSkipStep:withConfiguration:", 27, v7))
      {
        goto LABEL_77;
      }
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v8, "personManagerSettings"));
      v60 = objc_msgSend(v59, "isFaceClassificationEnabled");

      LOBYTE(v8) = v60 ^ 1;
      break;
    case 29:
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
      v62 = objc_msgSend(v61, "hf_isDoorbell");

      if (!v62)
        goto LABEL_77;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addedAccessory"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
      LOBYTE(v8) = +[HSPCChimeViewController shouldSkipForAccessory:inHome:](HSPCChimeViewController, "shouldSkipForAccessory:inHome:", v13, v15);
      goto LABEL_80;
    case 31:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "category"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "categoryType"));
      LODWORD(v8) = objc_msgSend(v63, "isEqualToString:", HMAccessoryCategoryTypeShowerHead) ^ 1;

      goto LABEL_80;
    case 32:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
      if (objc_msgSend(v13, "hf_isSprinkler"))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[HSPCNameZonesViewController applicableServicesForAccessory:](HSPCNameZonesViewController, "applicableServicesForAccessory:", v13));
        LOBYTE(v8) = objc_msgSend(v15, "count") == 0;
LABEL_80:

      }
      else
      {
        LOBYTE(v8) = 1;
      }
      goto LABEL_81;
    case 33:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));
      v64 = objc_msgSend(v13, "hf_isCategorizedAsBridge");
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[HSPCNameServicesViewController applicableServicesForAccessory:](HSPCNameServicesViewController, "applicableServicesForAccessory:", v13));
      v66 = objc_msgSend(v65, "count");

      v67 = objc_msgSend(v13, "hf_isProgrammableSwitch");
      v68 = (unint64_t)v66 < 2;
      if (v64)
        v68 = v66 == 0;
      LOBYTE(v8) = v68 | v67;
      goto LABEL_81;
    case 35:
      v69 = -[HSSetupStateMachine _shouldSkipUseSiriStep:](self, "_shouldSkipUseSiriStep:", v6);
      goto LABEL_68;
    case 36:
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
      v71 = objc_msgSend(v70, "stateMachineConfigurationGetLaunchReason:", v7);

      if (v71 != (id)3)
        goto LABEL_77;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
      v36 = objc_msgSend(v13, "stateMachineConfigurationIsLaunchedToSetupMultipleAccessories:", v7);
      goto LABEL_70;
    case 37:
      if (!-[HSSetupStateMachine _shouldShowSiriEndpointStep:](self, "_shouldShowSiriEndpointStep:", v6))
        goto LABEL_77;
      v72 = objc_msgSend(v7, "shouldShowSiriRecognitionLanguageSetup");
      goto LABEL_56;
    case 38:
      if (!-[HSSetupStateMachine _shouldShowSiriEndpointStep:](self, "_shouldShowSiriEndpointStep:", v6))
        goto LABEL_77;
      v72 = objc_msgSend(v7, "shouldShowVoiceSelectionSetup");
LABEL_56:
      LOBYTE(v8) = v72 ^ 1;
      break;
    case 39:
      v69 = -[HSSetupStateMachine _shouldSkipSiriUpdateRequiredStep:](self, "_shouldSkipSiriUpdateRequiredStep:", v6);
      goto LABEL_68;
    case 40:
      v69 = -[HSSetupStateMachine _shouldSkipSiriVoiceRecognitionStep:](self, "_shouldSkipSiriVoiceRecognitionStep:", v6);
      goto LABEL_68;
    case 41:
      v69 = -[HSSetupStateMachine _sync_shouldSkipSetupSiriStep:](self, "_sync_shouldSkipSetupSiriStep:", v6);
      goto LABEL_68;
    case 42:
      v69 = -[HSSetupStateMachine _sync_shouldSkipSiriVoiceTrainingStep:](self, "_sync_shouldSkipSiriVoiceTrainingStep:", v6);
      goto LABEL_68;
    case 43:
      v69 = -[HSSetupStateMachine _sync_shouldSkipPersonalRequestsStep:](self, "_sync_shouldSkipPersonalRequestsStep:", v6);
      goto LABEL_68;
    case 44:
      v69 = -[HSSetupStateMachine _sync_shouldSkipSiriForEveryoneStep:](self, "_sync_shouldSkipSiriForEveryoneStep:", v6);
      goto LABEL_68;
    case 45:
      v69 = -[HSSetupStateMachine _sync_shouldSkipUseAirPlayStep:](self, "_sync_shouldSkipUseAirPlayStep:", v6);
      goto LABEL_68;
    case 46:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
      v18 = objc_msgSend(v13, "stateMachineConfigurationShouldSkipBridgeAddedStep:", v7);
      goto LABEL_73;
    case 47:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
      v36 = objc_msgSend(v13, "stateMachineConfigurationShouldSetupBridgedAccessories:", v7);
      goto LABEL_70;
    case 48:
      v69 = -[HSSetupStateMachine _shouldSkipSafetyAndSecurityStep:](self, "_shouldSkipSafetyAndSecurityStep:", v6);
      goto LABEL_68;
    case 49:
      v69 = -[HSSetupStateMachine _shouldSkipRestrictedGuestAccessStep:](self, "_shouldSkipRestrictedGuestAccessStep:", v6);
LABEL_68:
      LOBYTE(v8) = v69;
      break;
    case 50:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
      v36 = objc_msgSend(v13, "stateMachineConfigurationShouldSetupRouters:", v7);
LABEL_70:
      LOBYTE(v8) = v36 ^ 1;
      goto LABEL_81;
    case 51:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
      v18 = objc_msgSend(v13, "stateMachineConfigurationShouldSkipAccessoryUpdateStep:", v7);
      goto LABEL_73;
    case 52:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
      v18 = objc_msgSend(v13, "stateMachineConfigurationShouldSkipDoneStep:", v7);
LABEL_73:
      LOBYTE(v8) = v18;
LABEL_81:

      break;
    default:
      break;
  }

  return v8;
}

- (BOOL)stepRequiresDismissalConfirmation:(int64_t)a3 withCoordinator:(id)a4 configuration:(id)a5
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if ((unint64_t)a3 > 0x35)
    goto LABEL_8;
  if (((1 << a3) & 0x2000000000021ELL) == 0)
  {
    if (((1 << a3) & 0x21) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addedAccessory"));
      v10 = v11 != 0;

      goto LABEL_9;
    }
    if (a3 == 52)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeTuple"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accessory"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allAccessories"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));
      v10 = v13 != v15;

      goto LABEL_9;
    }
LABEL_8:
    v10 = 1;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)stepRequiresIdentifyButton:(int64_t)a3 withCoordinator:(id)a4 configuration:(id)a5
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if ((unint64_t)a3 > 0x18)
    goto LABEL_6;
  if (((1 << a3) & 0x1016000) == 0)
  {
    if (a3 == 5)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addedAccessory"));
      v10 = v11 != 0;

      goto LABEL_7;
    }
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v10 = 1;
LABEL_7:

  return v10;
}

- (BOOL)_shouldSkipSafetyAndSecurityStep:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSString *v13;
  void *v14;
  BOOL v15;
  int v17;
  HSSetupStateMachine *v18;
  __int16 v19;
  void *v20;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
  v7 = objc_msgSend(v6, "stateMachineConfigurationGetLaunchReason:", v5);

  if (v7 == (id)2
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addedAccessory")),
        v9 = objc_msgSend(v8, "hf_isAudioAnalysisSupportedDevice"),
        v8,
        v9))
  {
    v11 = HFLogForCategory(58, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v17 = 138412546;
      v18 = self;
      v19 = 2112;
      v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Showing Safety and Security card based on launch reason AND added accessory supports Audio Analysis", (uint8_t *)&v17, 0x16u);

    }
    v15 = 0;
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (BOOL)_shouldSkipRestrictedGuestAccessStep:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  BOOL v14;
  int v16;
  HSSetupStateMachine *v17;
  __int16 v18;
  void *v19;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addedAccessory"));
  if ((objc_msgSend(v6, "hf_isRestrictedGuestAllowedAccessory") & 1) == 0)
  {

    goto LABEL_7;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));
  v8 = objc_msgSend(v7, "hf_hasAtLeastOneRestrictedGuest");

  if (!v8)
  {
LABEL_7:
    v14 = 1;
    goto LABEL_8;
  }
  v10 = HFLogForCategory(58, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v16 = 138412546;
    v17 = self;
    v18 = 2112;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ Showing Restricted Guest access card based on the added accessory being a supported accessory AND at least one RG already existing in the home.", (uint8_t *)&v16, 0x16u);

  }
  v14 = 0;
LABEL_8:

  return v14;
}

- (BOOL)_shouldSkipUseSiriStep:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  NSString *v15;
  void *v16;
  void *v17;
  const char *v18;
  NSString *v19;
  int v21;
  HSSetupStateMachine *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addedAccessory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hf_siriEndpointProfile"));

  if (!v7)
  {
    v11 = _os_feature_enabled_impl("Home", "SiriEndpoints");
    v13 = HFLogForCategory(60, v12);
    v10 = objc_claimAutoreleasedReturnValue(v13);
    v14 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if ((v11 & 1) != 0)
    {
      if (v14)
      {
        v15 = NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addedAccessory"));
        v21 = 138412802;
        v22 = self;
        v23 = 2112;
        v24 = v16;
        v25 = 2112;
        v26 = v17;
        v18 = "%@:%@ Siri endpoint profile does not exist. Added accessory is %@";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v21, 0x20u);

      }
    }
    else if (v14)
    {
      v19 = NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addedAccessory"));
      v21 = 138412802;
      v22 = self;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      v18 = "%@:%@ Feature flag for Siri Endpoints is OFF. Added accessory is %@";
      goto LABEL_8;
    }

    LOBYTE(v10) = 1;
    goto LABEL_10;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addedAccessory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "home"));
  LODWORD(v10) = objc_msgSend(v9, "hf_hasHomePods") ^ 1;

LABEL_10:
  return (char)v10;
}

- (BOOL)_shouldSkipSiriUpdateRequiredStep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned __int8 v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addedAccessory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hf_siriEndpointProfile"));

  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addedAccessory")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home")),
        v9 = objc_msgSend(v8, "hf_hasHomePods"),
        v8,
        v7,
        v9)
    && !-[HSSetupStateMachine _shouldSkipUseSiriFlow:](self, "_shouldSkipUseSiriFlow:", v4))
  {
    v10 = objc_msgSend(v6, "supportsOnboarding");
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)_shouldSkipSiriVoiceRecognitionStep:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[HSSetupStateMachine _shouldShowSiriEndpointStep:](self, "_shouldShowSiriEndpointStep:", v4)
    && !-[HSSetupStateMachine _shouldSkipUseSiriFlow:](self, "_shouldSkipUseSiriFlow:", v4)
    && -[HSSetupStateMachine _deviceIsOnAMultiUserLanguage](self, "_deviceIsOnAMultiUserLanguage"))
  {
    v5 = -[HSSetupStateMachine _isVoiceRecognitionEnabled:](self, "_isVoiceRecognitionEnabled:", v4);
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)_sync_shouldSkipSetupSiriStep:(id)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  if (-[HSSetupStateMachine _shouldShowSiriEndpointStep:](self, "_shouldShowSiriEndpointStep:", v4)
    && !-[HSSetupStateMachine _shouldSkipUseSiriFlow:](self, "_shouldSkipUseSiriFlow:", v4)
    && -[HSSetupStateMachine _deviceIsOnAMultiUserLanguage](self, "_deviceIsOnAMultiUserLanguage"))
  {
    v5 = objc_msgSend(v4, "shouldSkipVoiceProfileSetup");
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)_sync_shouldSkipSiriVoiceTrainingStep:(id)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  if (-[HSSetupStateMachine _shouldShowSiriEndpointStep:](self, "_shouldShowSiriEndpointStep:", v4)
    && !-[HSSetupStateMachine _shouldSkipUseSiriFlow:](self, "_shouldSkipUseSiriFlow:", v4)
    && -[HSSetupStateMachine _deviceIsOnAMultiUserLanguage](self, "_deviceIsOnAMultiUserLanguage"))
  {
    v5 = objc_msgSend(v4, "shouldSkipVoiceProfileSetup");
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)_sync_shouldSkipPersonalRequestsStep:(id)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  if (-[HSSetupStateMachine _shouldShowSiriEndpointStep:](self, "_shouldShowSiriEndpointStep:", v4)
    && !-[HSSetupStateMachine _shouldSkipUseSiriFlow:](self, "_shouldSkipUseSiriFlow:", v4)
    && -[HSSetupStateMachine _deviceIsOnAMultiUserLanguage](self, "_deviceIsOnAMultiUserLanguage"))
  {
    v5 = objc_msgSend(v4, "shouldSkipVoiceProfileSetup");
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)_sync_shouldSkipSiriForEveryoneStep:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  if (-[HSSetupStateMachine _shouldShowSiriEndpointStep:](self, "_shouldShowSiriEndpointStep:", v4)
    && !-[HSSetupStateMachine _shouldSkipUseSiriFlow:](self, "_shouldSkipUseSiriFlow:", v4)
    && -[HSSetupStateMachine _deviceIsOnAMultiUserLanguage](self, "_deviceIsOnAMultiUserLanguage"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
    v6 = objc_msgSend(v5, "isMultiUserEnabled");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)_sync_shouldSkipUseAirPlayStep:(id)a3
{
  return 1;
}

- (BOOL)_shouldShowSiriEndpointStep:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addedAccessory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hf_siriEndpointProfile"));

  if (v5 && objc_msgSend(v5, "supportsOnboarding"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addedAccessory"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
    v8 = objc_msgSend(v7, "hf_hasHomePods");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isVoiceRecognitionEnabled:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSString *v15;
  void *v16;
  int v18;
  HSSetupStateMachine *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unsigned int v23;

  v5 = a3;
  v6 = objc_alloc((Class)HFUserItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentUser"));
  v10 = objc_msgSend(v6, "initWithHome:user:nameStyle:", v7, v9, 0);

  v11 = objc_msgSend(v10, "isIdentifyVoiceEnabled");
  v13 = HFLogForCategory(60, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v18 = 138412802;
    v19 = self;
    v20 = 2112;
    v21 = v16;
    v22 = 1024;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Is voice recognition enabled? %{BOOL}d", (uint8_t *)&v18, 0x1Cu);

  }
  return v11;
}

- (BOOL)_shouldSkipUseSiriFlow:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "onboardingSelections"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "onboardingSelections"));
    v6 = objc_msgSend(v5, "allowHeySiri") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_deviceIsOnAMultiUserLanguage
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  NSObject *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguages"));
  if (v4)
  {
    v5 = +[HUHomeFeatureOnboardingUtilities isDeviceUsingASupportedVoiceRecognitionSiriLanguage:shouldFallbackToBestSupportedLanguage:](HUHomeFeatureOnboardingUtilities, "isDeviceUsingASupportedVoiceRecognitionSiriLanguage:shouldFallbackToBestSupportedLanguage:", v4, 1);
  }
  else
  {
    v6 = HFLogForCategory(60, v3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005E250(a2, v7);

    v5 = 0;
  }

  return v5;
}

- (id)_voiceProfileCheckFuture
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HUHomeFeatureOnboardingUtilities checkVoiceProfileAvailabiltyForLanguage:](HUHomeFeatureOnboardingUtilities, "checkVoiceProfileAvailabiltyForLanguage:", 0));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000EA9C;
  v8[3] = &unk_1000A1210;
  v8[4] = self;
  v8[5] = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flatMap:", v8));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recover:", &stru_1000A13B0));

  return v6;
}

@end
