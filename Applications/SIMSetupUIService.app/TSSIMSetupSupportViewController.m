@implementation TSSIMSetupSupportViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *options;
  NSMutableDictionary *v12;
  uint64_t v13;
  void *v14;
  NSMutableDictionary *v15;
  uint64_t v16;
  void *v17;
  NSMutableDictionary *v18;
  uint64_t v19;
  void *v20;
  NSMutableDictionary *v21;
  uint64_t v22;
  void *v23;
  NSMutableDictionary *v24;
  uint64_t v25;
  void *v26;
  NSMutableDictionary *v27;
  uint64_t v28;
  void *v29;
  NSMutableDictionary *v30;
  uint64_t v31;
  void *v32;
  NSMutableDictionary *v33;
  uint64_t v34;
  void *v35;
  NSMutableDictionary *v36;
  uint64_t v37;
  void *v38;
  NSMutableDictionary *v39;
  uint64_t v40;
  void *v41;
  NSMutableDictionary *v42;
  uint64_t v43;
  void *v44;
  NSMutableDictionary *v45;
  uint64_t v46;
  void *v47;
  NSMutableDictionary *v48;
  uint64_t v49;
  void *v50;
  NSMutableDictionary *v51;
  uint64_t v52;
  void *v53;
  NSMutableDictionary *v54;
  uint64_t v55;
  void *v56;
  NSMutableDictionary *v57;
  uint64_t v58;
  void *v59;
  NSMutableDictionary *v60;
  uint64_t v61;
  void *v62;
  NSMutableDictionary *v63;
  uint64_t v64;
  void *v65;
  NSMutableDictionary *v66;
  uint64_t v67;
  void *v68;
  NSMutableDictionary *v69;
  uint64_t v70;
  void *v71;
  NSMutableDictionary *v72;
  uint64_t v73;
  void *v74;
  NSMutableDictionary *v75;
  uint64_t v76;
  void *v77;
  NSMutableDictionary *v78;
  uint64_t v79;
  void *v80;
  NSMutableDictionary *v81;
  uint64_t v82;
  void *v83;
  NSMutableDictionary *v84;
  uint64_t v85;
  void *v86;
  NSMutableDictionary *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  uint64_t v94;
  void *i;
  uint64_t v96;
  void *v97;
  unsigned __int8 v98;
  id v99;
  NSObject *v100;
  void *v101;
  TSScreenLockObserver *v102;
  TSScreenLockObserver *screenLockObserver;
  SSRemoteAlertMonitor *v104;
  void *v105;
  void *v106;
  SSRemoteAlertMonitor *v107;
  SSRemoteAlertMonitor *remoteAlertMonitor;
  void *v109;
  void (**v110)(_QWORD);
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint8_t buf[4];
  uint64_t v117;
  __int16 v118;
  void *v119;
  __int16 v120;
  const char *v121;
  _BYTE v122[128];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMSetupSupportViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v8, "setWallpaperTunnelActive:", 0);
  objc_msgSend(v8, "setWallpaperStyle:withDuration:", 1, 0.0);
  objc_msgSend(v8, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v8, "setAllowsMenuButtonDismissal:", 0);
  objc_msgSend(v8, "setAllowsAlertStacking:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  options = self->_options;
  self->_options = v10;

  v12 = self->_options;
  v13 = TSUserInfoForceDualSIMSetupKey;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoForceDualSIMSetupKey));
  -[NSMutableDictionary setValue:forKey:](v12, "setValue:forKey:", v14, v13);

  v15 = self->_options;
  v16 = TSUserInfoFlowTypeKey;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoFlowTypeKey));
  -[NSMutableDictionary setValue:forKey:](v15, "setValue:forKey:", v17, v16);

  v18 = self->_options;
  v19 = TSUserInfoWebsheetURLKey;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoWebsheetURLKey));
  -[NSMutableDictionary setValue:forKey:](v18, "setValue:forKey:", v20, v19);

  v21 = self->_options;
  v22 = TSUserInfoWebsheetPostdataKey;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoWebsheetPostdataKey));
  -[NSMutableDictionary setValue:forKey:](v21, "setValue:forKey:", v23, v22);

  v24 = self->_options;
  v25 = TSUserInfoConfirmationCodeRequiredKey;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoConfirmationCodeRequiredKey));
  -[NSMutableDictionary setValue:forKey:](v24, "setValue:forKey:", v26, v25);

  v27 = self->_options;
  v28 = TSUserInfoWebsheetRequestTypeKey;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoWebsheetRequestTypeKey));
  -[NSMutableDictionary setValue:forKey:](v27, "setValue:forKey:", v29, v28);

  v30 = self->_options;
  v31 = TSUserInfoEidKey;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoEidKey));
  -[NSMutableDictionary setValue:forKey:](v30, "setValue:forKey:", v32, v31);

  v33 = self->_options;
  v34 = TSUserInfoImeiKey;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoImeiKey));
  -[NSMutableDictionary setValue:forKey:](v33, "setValue:forKey:", v35, v34);

  v36 = self->_options;
  v37 = TSUserInfoImei2Key;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoImei2Key));
  -[NSMutableDictionary setValue:forKey:](v36, "setValue:forKey:", v38, v37);

  v39 = self->_options;
  v40 = TSUserInfoMeidKey;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoMeidKey));
  -[NSMutableDictionary setValue:forKey:](v39, "setValue:forKey:", v41, v40);

  v42 = self->_options;
  v43 = TSUserInfoCarrierNameKey;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoCarrierNameKey));
  -[NSMutableDictionary setValue:forKey:](v42, "setValue:forKey:", v44, v43);

  v45 = self->_options;
  v46 = TSUserInfoSubscriptionContextKey;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoSubscriptionContextKey));
  -[NSMutableDictionary setValue:forKey:](v45, "setValue:forKey:", v47, v46);

  v48 = self->_options;
  v49 = TSUserInfoRequireSetupDebugKey;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoRequireSetupDebugKey));
  -[NSMutableDictionary setValue:forKey:](v48, "setValue:forKey:", v50, v49);

  v51 = self->_options;
  v52 = TSUserInfoPlanLaunchOptionLiveIDKey;
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoPlanLaunchOptionLiveIDKey));
  -[NSMutableDictionary setValue:forKey:](v51, "setValue:forKey:", v53, v52);

  v54 = self->_options;
  v55 = TSUserInfoPlanIccidKey;
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoPlanIccidKey));
  -[NSMutableDictionary setValue:forKey:](v54, "setValue:forKey:", v56, v55);

  v57 = self->_options;
  v58 = TSUserInfoSkipIntroPaneForWebsheetFlowKey;
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoSkipIntroPaneForWebsheetFlowKey));
  -[NSMutableDictionary setValue:forKey:](v57, "setValue:forKey:", v59, v58);

  v60 = self->_options;
  v61 = TSUserInfoIccidKey;
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoIccidKey));
  -[NSMutableDictionary setValue:forKey:](v60, "setValue:forKey:", v62, v61);

  v63 = self->_options;
  v64 = TSUserInfoPhoneNumberKey;
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoPhoneNumberKey));
  -[NSMutableDictionary setValue:forKey:](v63, "setValue:forKey:", v65, v64);

  v66 = self->_options;
  v67 = TSUserInfoWaitForServiceKey;
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoWaitForServiceKey));
  -[NSMutableDictionary setValue:forKey:](v66, "setValue:forKey:", v68, v67);

  v69 = self->_options;
  v70 = TSUserInfoFallbackToActivationCodeKey;
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoFallbackToActivationCodeKey));
  -[NSMutableDictionary setValue:forKey:](v69, "setValue:forKey:", v71, v70);

  v72 = self->_options;
  v73 = TSUserInfoIgnoreTransportKey;
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoIgnoreTransportKey));
  -[NSMutableDictionary setValue:forKey:](v72, "setValue:forKey:", v74, v73);

  v75 = self->_options;
  v76 = TSUserInfoExternalizedContextKey;
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoExternalizedContextKey));
  -[NSMutableDictionary setValue:forKey:](v75, "setValue:forKey:", v77, v76);

  v78 = self->_options;
  v79 = TSUserInfoIsLocalConvertKey;
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSUserInfoIsLocalConvertKey));
  -[NSMutableDictionary setValue:forKey:](v78, "setValue:forKey:", v80, v79);

  v81 = self->_options;
  v82 = TSIsLocalConvertKey;
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSIsLocalConvertKey));
  -[NSMutableDictionary setValue:forKey:](v81, "setValue:forKey:", v83, v82);

  v84 = self->_options;
  v85 = TSHasLocalPlanKey;
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSHasLocalPlanKey));
  -[NSMutableDictionary setValue:forKey:](v84, "setValue:forKey:", v86, v85);

  v87 = self->_options;
  v88 = TSHostViewControllerKey;
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", TSHostViewControllerKey));
  -[NSMutableDictionary setValue:forKey:](v87, "setValue:forKey:", v89, v88);

  v90 = v9;
  if ((objc_msgSend(v9, "isEqualToDictionary:", self->_options) & 1) == 0)
  {
    v109 = v8;
    v110 = v7;
    v111 = v6;
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
    v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v112, v122, 16);
    if (v92)
    {
      v93 = v92;
      v94 = *(_QWORD *)v113;
      do
      {
        for (i = 0; i != v93; i = (char *)i + 1)
        {
          if (*(_QWORD *)v113 != v94)
            objc_enumerationMutation(v91);
          v96 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)i);
          v97 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_options, "allKeys"));
          v98 = objc_msgSend(v97, "containsObject:", v96);

          if ((v98 & 1) == 0)
          {
            v99 = sub_10000CE68();
            v100 = objc_claimAutoreleasedReturnValue(v99);
            if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
            {
              v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectForKeyedSubscript:", v96));
              *(_DWORD *)buf = 138412802;
              v117 = v96;
              v118 = 2112;
              v119 = v101;
              v120 = 2080;
              v121 = "-[TSSIMSetupSupportViewController configureWithContext:completion:]";
              _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_INFO, "[I] sanitized user option: {%@ : %@} @%s", buf, 0x20u);

            }
          }
        }
        v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v112, v122, 16);
      }
      while (v93);
    }

    v7 = v110;
    v6 = v111;
    v8 = v109;
  }
  v102 = -[TSScreenLockObserver initWithDelegate:]([TSScreenLockObserver alloc], "initWithDelegate:", self);
  screenLockObserver = self->_screenLockObserver;
  self->_screenLockObserver = v102;

  v104 = [SSRemoteAlertMonitor alloc];
  v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "bundleIdentifier"));
  v107 = -[SSRemoteAlertMonitor initWithBundleID:dismissHandler:](v104, "initWithBundleID:dismissHandler:", v106, &stru_10001C970);
  remoteAlertMonitor = self->_remoteAlertMonitor;
  self->_remoteAlertMonitor = v107;

  if (v7)
    v7[2](v7);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6;
  Block_layout *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  NSMutableDictionary *options;
  NSMutableDictionary *v23;
  uint64_t v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  unsigned int v28;
  NSMutableDictionary *v29;
  TSSIMSetupFlow *v30;
  TSSIMSetupFlow *v31;
  TSSIMSetupFlow *v32;
  id *v33;
  Block_layout *v34;
  void *v35;
  unsigned int v36;
  TSSIMSetupFlow *v37;
  TSSIMSetupFlow *v38;
  TSSIMSetupFlow *v39;
  void *v40;
  objc_class *v41;
  LAContext *v42;
  LAContext *laContext;
  void *v44;
  id v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  TSSIMSetupFlow *v54;
  TSSIMSetupFlow *setupFlow;
  TSSIMSetupFlow *v56;
  void *v57;
  unsigned int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  TSSIMSetupFlow *v63;
  TSSIMSetupFlow *v64;
  TSSIMSetupFlow *v65;
  void *v66;
  unsigned int v67;
  TSSIMSetupFlow *v68;
  TSSIMSetupFlow *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[5];
  Block_layout *v83;
  _QWORD v84[5];
  _QWORD v85[4];
  Block_layout *v86;
  id v87;
  _QWORD v88[4];
  Block_layout *v89;
  id v90;
  id location[5];
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;

  v6 = a3;
  v7 = (Block_layout *)a4;
  if (!v7)
  {
    v8 = sub_10000CE68();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10000FE40(v9, v10, v11, v12, v13, v14, v15, v16);

    v7 = &stru_10001C990;
  }
  v17 = TSUserInfoFlowTypeKey;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", TSUserInfoFlowTypeKey));
  v19 = objc_msgSend(v18, "intValue");

  if (v19 == 6)
  {
    -[TSSIMSetupSupportViewController _presentDeviceInfoViewController](self, "_presentDeviceInfoViewController");
    goto LABEL_7;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", v17));
  v21 = objc_msgSend(v20, "intValue");

  options = self->_options;
  if (v21 == 10)
  {
    v23 = options;
    v24 = TSUserInfoExternalizedContextKey;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", TSUserInfoExternalizedContextKey));

    if (v25)
    {
      v26 = v23;
    }
    else
    {
      v26 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](self->_options, "mutableCopy");
      v92 = 0;
      v93 = &v92;
      v94 = 0x2050000000;
      v40 = (void *)qword_1000278A0;
      v95 = qword_1000278A0;
      if (!qword_1000278A0)
      {
        location[0] = _NSConcreteStackBlock;
        location[1] = (id)3221225472;
        location[2] = sub_10000EBA4;
        location[3] = &unk_10001CA08;
        location[4] = &v92;
        sub_10000EBA4((uint64_t)location);
        v40 = (void *)v93[3];
      }
      v41 = objc_retainAutorelease(v40);
      _Block_object_dispose(&v92, 8);
      v42 = (LAContext *)objc_alloc_init(v41);
      laContext = self->_laContext;
      self->_laContext = v42;

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[LAContext externalizedContext](self->_laContext, "externalizedContext"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v44, v24);

      v45 = sub_10000CE68();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        sub_10000FD60(v46, v47, v48, v49, v50, v51, v52, v53);

    }
    v54 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue(+[TSSIMSetupFlow flowWithOptions:](TSSIMSetupFlow, "flowWithOptions:", v26));
    setupFlow = self->_setupFlow;
    self->_setupFlow = v54;

    -[TSSIMSetupFlow setDelegate:](self->_setupFlow, "setDelegate:", self);
    objc_initWeak(location, self);
    v56 = self->_setupFlow;
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = sub_10000DEBC;
    v88[3] = &unk_10001C8D0;
    v33 = &v90;
    objc_copyWeak(&v90, location);
    v89 = v7;
    -[TSSIMSetupFlow firstViewController:](v56, "firstViewController:", v88);
    v34 = v89;
    goto LABEL_22;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](options, "valueForKey:", v17));
  v28 = objc_msgSend(v27, "intValue");

  v29 = self->_options;
  if (v28 == 20)
  {
    v26 = v29;
    v30 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue(+[TSSIMSetupFlow flowWithOptions:](TSSIMSetupFlow, "flowWithOptions:", v26));
    v31 = self->_setupFlow;
    self->_setupFlow = v30;

    -[TSSIMSetupFlow setDelegate:](self->_setupFlow, "setDelegate:", self);
    objc_initWeak(location, self);
    v32 = self->_setupFlow;
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_10000DF9C;
    v85[3] = &unk_10001C8D0;
    v33 = &v87;
    objc_copyWeak(&v87, location);
    v86 = v7;
    -[TSSIMSetupFlow firstViewController:](v32, "firstViewController:", v85);
    v34 = v86;
LABEL_22:

    objc_destroyWeak(v33);
    objc_destroyWeak(location);

    goto LABEL_23;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v29, "valueForKey:", v17));
  v36 = objc_msgSend(v35, "intValue");

  if (v36 == 12)
  {
    v37 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue(+[TSSIMSetupFlow flowWithOptions:](TSSIMSetupFlow, "flowWithOptions:", self->_options));
    v38 = self->_setupFlow;
    self->_setupFlow = v37;

    -[TSSIMSetupFlow setDelegate:](self->_setupFlow, "setDelegate:", self);
    v39 = self->_setupFlow;
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_10000E07C;
    v84[3] = &unk_10001C9B8;
    v84[4] = self;
    -[TSSIMSetupFlow firstViewController:](v39, "firstViewController:", v84);
    goto LABEL_7;
  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", v17));
  v58 = objc_msgSend(v57, "intValue");
  v59 = TSFlowTypeActivationPolicyMismatch;

  if (v59 == v58)
  {
    -[TSSIMSetupSupportViewController _presentPolicyRejectionViewController](self, "_presentPolicyRejectionViewController");
    goto LABEL_7;
  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", v17));
  if (objc_msgSend(v60, "intValue") == 13)
    goto LABEL_31;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", v17));
  if (objc_msgSend(v61, "intValue") == 3)
  {
LABEL_30:

LABEL_31:
LABEL_32:
    v63 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue(+[TSSIMSetupFlow flowWithOptions:](TSSIMSetupFlow, "flowWithOptions:", self->_options));
    v64 = self->_setupFlow;
    self->_setupFlow = v63;

    -[TSSIMSetupFlow setDelegate:](self->_setupFlow, "setDelegate:", self);
    v65 = self->_setupFlow;
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_10000E088;
    v82[3] = &unk_10001C9E0;
    v82[4] = self;
    v83 = v7;
    -[TSSIMSetupFlow firstViewController:](v65, "firstViewController:", v82);

    goto LABEL_23;
  }
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", v17));
  if (objc_msgSend(v62, "intValue") == 18)
  {

    goto LABEL_30;
  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", v17));
  v67 = objc_msgSend(v66, "intValue");

  if (v67 == 21)
    goto LABEL_32;
  v68 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue(+[TSSIMSetupFlow flowWithOptions:](TSSIMSetupFlow, "flowWithOptions:", self->_options));
  v69 = self->_setupFlow;
  self->_setupFlow = v68;

  -[TSSIMSetupFlow setDelegate:](self->_setupFlow, "setDelegate:", self);
  v70 = objc_claimAutoreleasedReturnValue(-[TSSIMSetupFlow firstViewController](self->_setupFlow, "firstViewController"));
  if (!v70)
  {
    v73 = sub_10000CE68();
    v74 = objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      sub_10000FDD0(v74, v75, v76, v77, v78, v79, v80, v81);

    -[TSSIMSetupSupportViewController _deactivate](self, "_deactivate");
    goto LABEL_8;
  }
  v71 = (void *)v70;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", v17));
  -[TSSIMSetupSupportViewController _presentFirstController:isRemoteSignup:](self, "_presentFirstController:isRemoteSignup:", v71, objc_msgSend(v72, "intValue") == 7);

LABEL_7:
  -[TSScreenLockObserver registerForLockNotifications](self->_screenLockObserver, "registerForLockNotifications");
LABEL_8:
  v7->invoke(v7);
LABEL_23:

}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)handleButtonActions:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000E158;
  v3[3] = &unk_10001C780;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  _QWORD v7[5];

  v5 = sub_10000CE68();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10000FF8C(a3, v6);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E2A0;
  v7[3] = &unk_10001C7A8;
  v7[4] = self;
  -[TSSIMSetupSupportViewController dismissViewControllerWithTransition:completion:](self, "dismissViewControllerWithTransition:completion:", 7, v7);
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;

  v3 = a3;
  v5 = sub_10000CE68();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = v3;
    v9 = 2080;
    v10 = "-[TSSIMSetupSupportViewController setIdleTimerDisabled:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "set idle timer disabled : %d @%s", (uint8_t *)v8, 0x12u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMSetupSupportViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v7, "setIdleTimerDisabled:forReason:", v3, CFSTR("SIMSetupUIService"));

}

- (void)userDidTapCancel
{
  id v3;
  NSObject *v4;
  _QWORD v5[5];

  v3 = sub_10000CE68();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100010020(v4);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000E450;
  v5[3] = &unk_10001C7A8;
  v5[4] = self;
  -[TSSIMSetupSupportViewController dismissViewControllerWithTransition:completion:](self, "dismissViewControllerWithTransition:completion:", 7, v5);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSSIMSetupSupportViewController;
  -[TSSIMSetupSupportViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMSetupSupportViewController navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UINavigationBar appearance](UINavigationBar, "appearance"));
  objc_msgSend(v6, "_setHidesShadow:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UINavigationBar appearance](UINavigationBar, "appearance"));
  objc_msgSend(v7, "setTranslucent:", 0);

}

- (BOOL)shouldAutorotate
{
  return +[SSServiceUtilities isPad](SSServiceUtilities, "isPad");
}

- (unint64_t)supportedInterfaceOrientations
{
  if (+[SSServiceUtilities isPad](SSServiceUtilities, "isPad"))
    return 30;
  else
    return 2;
}

- (void)_presentFirstController:(id)a3 isRemoteSignup:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v6 = a3;
  v12 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v6);

  objc_msgSend(v12, "setModalTransitionStyle:", 0);
  if (v4)
  {
    objc_msgSend(v12, "setOverrideUserInterfaceStyle:", 2);
    objc_msgSend(v12, "setModalPresentationStyle:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationBar"));
    BPSApplyStyleToNavBar(v7);

  }
  else if (+[SSServiceUtilities isPad](SSServiceUtilities, "isPad"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationItem"));
    v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Cellular Data Account"), &stru_10001CAA0, CFSTR("Localizable")));
    objc_msgSend(v8, "setTitle:", v11);

    objc_msgSend(v12, "setModalPresentationStyle:", 2);
  }
  -[TSSIMSetupSupportViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

}

- (void)_presentPolicyRejectionViewController
{
  void *v3;
  TSSIMSetupFlow *v4;
  TSSIMSetupFlow *setupFlow;
  TSSIMSetupFlow *v6;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMSetupSupportViewController presentedViewController](self, "presentedViewController"));

  if (v3)
  {
    -[TSSIMSetupSupportViewController _deactivate](self, "_deactivate");
  }
  else
  {
    v4 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue(+[TSSIMSetupFlow flowWithOptions:](TSSIMSetupFlow, "flowWithOptions:", self->_options));
    setupFlow = self->_setupFlow;
    self->_setupFlow = v4;

    -[TSSIMSetupFlow setDelegate:](self->_setupFlow, "setDelegate:", self);
    v6 = self->_setupFlow;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000E790;
    v7[3] = &unk_10001C9B8;
    v7[4] = self;
    -[TSSIMSetupFlow firstViewController:](v6, "firstViewController:", v7);
  }
}

- (void)_presentDeviceInfoViewController
{
  void *v3;
  TSDeviceInfoViewController *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t CTGreenTeaOsLogHandle;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSSIMSetupSupportViewController presentedViewController](self, "presentedViewController"));

  if (v3)
  {
    -[TSSIMSetupSupportViewController _deactivate](self, "_deactivate");
  }
  else
  {
    v4 = -[TSDeviceInfoViewController initWithOptions:]([TSDeviceInfoViewController alloc], "initWithOptions:", self->_options);
    v5 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v4);
    v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_cancelButtonTapped");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationItem"));
    objc_msgSend(v8, "setLeftBarButtonItem:animated:", v6, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationBar"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    objc_msgSend(v11, "setBackgroundColor:", v12);

    objc_msgSend(v5, "setModalPresentationStyle:", 2);
    objc_msgSend(v5, "setModalTransitionStyle:", 0);
    -[TSSIMSetupSupportViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
    v13 = ct_green_tea_logger_create("DeviceInfo");
    CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
    v15 = objc_claimAutoreleasedReturnValue(CTGreenTeaOsLogHandle);
    v16 = v15;
    if (v15)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Displaying device information", v17, 2u);
      }
    }

    ct_green_tea_logger_destroy(v13);
  }
}

- (void)_deactivate
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EA50;
  block[3] = &unk_10001C7A8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_cancelButtonTapped
{
  -[TSSIMSetupSupportViewController dismissViewControllerWithTransition:completion:](self, "dismissViewControllerWithTransition:completion:", 7, 0);
  -[TSSIMSetupSupportViewController _deactivate](self, "_deactivate");
}

- (void)screenLockDidUpdate:(BOOL)a3
{
  void *v4;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "postNotificationName:object:", TSNotificationUserCanceled, TSNotificationUserCanceledReason_ScreenLockEvent);

    -[TSSIMSetupSupportViewController _cancelButtonTapped](self, "_cancelButtonTapped");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertMonitor, 0);
  objc_storeStrong((id *)&self->_screenLockObserver, 0);
  objc_storeStrong((id *)&self->_laContext, 0);
  objc_storeStrong((id *)&self->_pkNavigationController, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_setupFlow, 0);
}

@end
