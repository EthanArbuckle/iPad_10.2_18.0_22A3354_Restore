@implementation RecoverDeviceUIExtensionRemoteViewController

- (BOOL)useAlternateStringForWiFI
{
  return MGGetBoolAnswer(CFSTR("wapi"), a2);
}

- (unsigned)runningInStoreDemoMode
{
  return CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), 0);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  OS_dispatch_queue *v22;
  OS_dispatch_queue *recoverDeviceOperationsQueue;
  void *v24;
  NSObject *v25;
  void *v26;
  BOOL v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  NSObject *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned __int8 v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  NSObject *v58;
  void *v59;
  _BOOL4 v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  _BOOL4 v65;
  void *v66;
  _BOOL4 v67;
  void *v68;
  NSObject *v69;
  void *v70;
  unsigned int v71;
  void *v72;
  _BOOL4 v73;
  void *v74;
  NSObject *v75;
  const __CFString *v76;
  void *v77;
  _BOOL4 v78;
  void *v79;
  void *v80;
  _BOOL4 v81;
  void *v82;
  void *v83;
  _BOOL4 v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  _BOOL4 v91;
  void *v92;
  void *v93;
  _BOOL4 v94;
  void *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  NSObject *v113;
  void *v114;
  unsigned int v115;
  uint64_t v116;
  id v117;
  id location;
  uint8_t buf[4];
  _BYTE v120[10];
  void *v121;
  _QWORD v122[3];
  _QWORD v123[3];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  location = 0;
  objc_initWeak(&location, self);
  v8 = objc_msgSend(objc_alloc((Class)SUCoreLog), "initWithCategory:", CFSTR("RecoverDeviceUI"));
  -[RecoverDeviceUIExtensionRemoteViewController setLogger:](self, "setLogger:", v8);

  if (-[RecoverDeviceUIExtensionRemoteViewController runningInStoreDemoMode](self, "runningInStoreDemoMode") == 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "oslog"));

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Skipping tap-to-recover prompt for device running in StoreDemoMode", buf, 2u);
    }
LABEL_89:

    goto LABEL_90;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "oslog"));

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Device running in regular mode. Proceeding with tap-to-recover prompt", buf, 2u);
  }

  -[RecoverDeviceUIExtensionRemoteViewController setSetupCompleted:](self, "setSetupCompleted:", 0);
  -[RecoverDeviceUIExtensionRemoteViewController setOverallResultCard:](self, "setOverallResultCard:", 0);
  -[RecoverDeviceUIExtensionRemoteViewController setAuthenticationAttempt:](self, "setAuthenticationAttempt:", 0);
  v13 = objc_alloc_init((Class)SKDevice);
  -[RecoverDeviceUIExtensionRemoteViewController setSetupkitDevice:](self, "setSetupkitDevice:", v13);

  v14 = objc_alloc_init((Class)SKSetupClient);
  -[RecoverDeviceUIExtensionRemoteViewController setSetupkitClient:](self, "setSetupkitClient:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController setupkitClient](self, "setupkitClient"));
  objc_msgSend(v15, "setSetupType:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController setupkitClient](self, "setupkitClient"));
  objc_msgSend(v16, "setSkipWifi:", 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController setupkitClient](self, "setupkitClient"));
  objc_msgSend(v17, "setPasswordType:", 2);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController setupkitClient](self, "setupkitClient"));
  objc_msgSend(v18, "setConditionalPersistent:", 1);

  v122[0] = CFSTR("NeRDVersionKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 2));
  v123[0] = v19;
  v123[1] = &__kCFBooleanTrue;
  v122[1] = CFSTR("NeRDSupportsMessaging");
  v122[2] = CFSTR("NeRDSupportsOOBMessaging");
  v123[2] = &__kCFBooleanTrue;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v123, v122, 3));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController setupkitClient](self, "setupkitClient"));
  objc_msgSend(v21, "setClientConfig:", v20);

  v22 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.RecoverDeviceUI.mainOperationsQueue", 0);
  recoverDeviceOperationsQueue = self->_recoverDeviceOperationsQueue;
  self->_recoverDeviceOperationsQueue = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "oslog"));

  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "ConfigureWithContext invoked", buf, 2u);
  }

  if (!v6
    || (v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo")),
        v27 = v26 == 0,
        v26,
        v27))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "oslog"));

    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Invalid userinfo object passed to RecoverDeviceUI", buf, 2u);
    }
  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "oslog"));

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Valid context/info object", buf, 2u);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("device")));

    if (v31 && (v32 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v31, v32) & 1) != 0))
    {
      v33 = objc_alloc((Class)CBDevice);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v34 = -[NSObject initWithDictionary:error:](v33, "initWithDictionary:error:", v31, 0);
        -[RecoverDeviceUIExtensionRemoteViewController setDeviceObj:](self, "setDeviceObj:", v34);
      }
      else
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
        v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "oslog"));

        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "CBDevice implementation missing appropriate initialization function", buf, 2u);
        }
      }

    }
    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "oslog"));

      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Invalid dictionary in userinfo object passed to RecoverDeviceUI", buf, 2u);
      }
    }

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
  v39 = v38 == 0;

  if (v39)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "oslog"));

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to initialize deviceObj for RecoverDeviceUI", buf, 2u);
    }
    goto LABEL_89;
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
  v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "oslog"));

  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
    v43 = objc_msgSend(v42, "nearbyActionType");
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
    v45 = objc_msgSend(v44, "nearbyActionFlags");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v120 = v43;
    *(_WORD *)&v120[4] = 1024;
    *(_DWORD *)&v120[6] = v45;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "nearbyActionType:%d nearbyActionFlags:%d", buf, 0xEu);

  }
  if (os_variant_has_internal_content("RecoverDeviceUI"))
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "stringForKey:", CFSTR("ForceAuthTag")));

    if (v47)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
      v49 = objc_msgSend(v48, "nearbyActionFlags");

      if ((v49 & 0x80) == 0)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
        v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "oslog"));

        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "ForceAuthTag default is set, but server don't have auth tag, ignoring", buf, 2u);
        }
LABEL_70:

        goto LABEL_90;
      }
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "nearbyAuthTag"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "dataUsingEncoding:", 4));
      v56 = objc_msgSend(v54, "isEqual:", v55);

      if (!v56)
      {
        v86 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
        v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "oslog"));

        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v87 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "dataUsingEncoding:", 4));
          v88 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "nearbyAuthTag"));
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v120 = v87;
          *(_WORD *)&v120[8] = 2112;
          v121 = v89;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "ForceAuthTag default is set to %@, but server have different auth tag %@, ignoring", buf, 0x16u);

        }
        goto LABEL_70;
      }
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
      v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "oslog"));

      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "ForceAuthTag default is set, and server have matching auth tag, continue", buf, 2u);
      }

    }
  }
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
  v60 = objc_msgSend(v59, "nearbyActionType") == 85;

  if (v60)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
    v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "oslog"));

    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "extended mode detected", buf, 2u);
    }

    -[RecoverDeviceUIExtensionRemoteViewController setExtendedMode:](self, "setExtendedMode:", 1);
  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
  if (objc_msgSend(v63, "nearbyActionDeviceClass") == 1)
  {

  }
  else
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
    v65 = objc_msgSend(v64, "nearbyActionDeviceClass") == 3;

    if (!v65)
      goto LABEL_52;
  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
  v67 = (int)objc_msgSend(v66, "rssi") < -45;

  if (v67)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
    v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "oslog"));

    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
      v71 = objc_msgSend(v70, "rssi");
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v120 = v71;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "showing prox card, but rssi is %d", buf, 8u);

    }
  }
LABEL_52:
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
  v73 = objc_msgSend(v72, "nearbyActionDeviceClass") == 6;

  if (v73)
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
    v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "oslog"));

    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Device needing recovery is an Apple Watch", buf, 2u);
    }
    v76 = CFSTR("DEVICE_TYPE_WATCH");
  }
  else
  {
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
    v78 = objc_msgSend(v77, "nearbyActionDeviceClass") == 11;

    if (v78)
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
      v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "oslog"));

      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Device needing recovery was found", buf, 2u);
      }
      v76 = CFSTR("DEVICE_TYPE_VISION");
    }
    else
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
      v81 = objc_msgSend(v80, "nearbyActionDeviceClass") == 4;

      if (v81)
      {
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
        v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "oslog"));

        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Device needing recovery is an Apple TV", buf, 2u);
        }
        v76 = CFSTR("DEVICE_TYPE_ATV");
      }
      else
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
        v84 = objc_msgSend(v83, "nearbyActionDeviceClass") == 1;

        if (v84)
        {
          v85 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
          v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "oslog"));

          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Device needing recovery is an iPhone", buf, 2u);
          }
          v76 = CFSTR("DEVICE_TYPE_IPHONE");
        }
        else
        {
          v90 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
          v91 = objc_msgSend(v90, "nearbyActionDeviceClass") == 3;

          if (!v91)
          {
            v112 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
            v113 = objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "oslog"));

            if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
            {
              v114 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
              v115 = objc_msgSend(v114, "nearbyActionDeviceClass");
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v120 = v115;
              _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "Device needing recovery is unknown/unsupported: %d", buf, 8u);

            }
            goto LABEL_90;
          }
          v92 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
          v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "oslog"));

          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Device needing recovery is an iPad", buf, 2u);
          }
          v76 = CFSTR("DEVICE_TYPE_IPAD");
        }
      }
    }
  }

  -[RecoverDeviceUIExtensionRemoteViewController setKLocalizedDeviceType:](self, "setKLocalizedDeviceType:", v76);
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
  v94 = (objc_msgSend(v93, "nearbyActionFlags") & 0x40) == 0;

  if (v94)
  {
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
    v96 = objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "oslog"));

    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "Device already recovering, skipping wifi setup step", buf, 2u);
    }

    if (!-[RecoverDeviceUIExtensionRemoteViewController matchesRecentlyRecoveredDevice](self, "matchesRecentlyRecoveredDevice"))
    {
      v111 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "oslog"));

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Device isn't known to us. Bailing", buf, 2u);
      }
      goto LABEL_89;
    }
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController setupkitClient](self, "setupkitClient"));
    objc_msgSend(v97, "setSkipWifi:", 1);

    v98 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
    v99 = objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "oslog"));

    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "Device is known to us", buf, 2u);
    }

  }
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "identifier"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController setupkitDevice](self, "setupkitDevice"));
  objc_msgSend(v102, "setIdentifier:", v101);

  v103 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController setupkitDevice](self, "setupkitDevice"));
  objc_msgSend(v103, "setBlePSM:", 130);

  v104 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController setupkitDevice](self, "setupkitDevice"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController setupkitClient](self, "setupkitClient"));
  objc_msgSend(v105, "setPeerDevice:", v104);

  objc_copyWeak(&v117, &location);
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController setupkitClient](self, "setupkitClient", _NSConcreteStackBlock, 3221225472, __80__RecoverDeviceUIExtensionRemoteViewController_configureWithContext_completion___block_invoke, &unk_10001C3E8));
  objc_msgSend(v106, "setEventHandler:", &v116);

  v107 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
  v108 = objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "oslog"));

  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "identifier"));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v120 = v110;
    _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "RecoverDeviceUI successfully initialized. Identifier is %@", buf, 0xCu);

  }
  if (v7)
    v7[2](v7);
  objc_destroyWeak(&v117);
LABEL_90:
  objc_destroyWeak(&location);

}

void __80__RecoverDeviceUIExtensionRemoteViewController_configureWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setupKitEventHandler:", v3);

}

- (void)_setupKitEventHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController recoverDeviceOperationsQueue](self, "recoverDeviceOperationsQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __70__RecoverDeviceUIExtensionRemoteViewController__setupKitEventHandler___block_invoke;
  v7[3] = &unk_10001C410;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __70__RecoverDeviceUIExtensionRemoteViewController__setupKitEventHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  unsigned int v4;
  int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  unsigned int v39;
  int v40;
  const __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  int isKindOfClass;
  void *v45;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  unsigned int v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unsigned int v61;
  void *v62;
  void *v63;
  unsigned int v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  unsigned int v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  unsigned int v76;
  void *v77;
  const char *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  unsigned int v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  unsigned int v90;
  void *v91;
  _BOOL4 v92;
  const __CFString *v93;
  const __CFString *v94;
  uint8_t buf[4];
  _BYTE v96[18];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oslog"));

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "eventType");
    v5 = objc_msgSend(*(id *)(a1 + 40), "eventType");
    if (v5 > 109)
    {
      if (v5 > 199)
      {
        if (v5 <= 201)
        {
          if (v5 == 200)
            v6 = CFSTR("CaptiveNetworkPresent");
          else
            v6 = CFSTR("CaptiveNetworkNavigation");
          goto LABEL_40;
        }
        if (v5 == 202)
        {
          v6 = CFSTR("CaptiveNetworkAuthenticated");
          goto LABEL_40;
        }
        if (v5 == 300)
        {
          v6 = CFSTR("BasicConfigUpdated");
          goto LABEL_40;
        }
      }
      else if (v5 > 129)
      {
        if (v5 == 130)
        {
          v6 = CFSTR("AuthenticationResponse");
          goto LABEL_40;
        }
        if (v5 == 140)
        {
          v6 = CFSTR("AuthenticationCompleted");
          goto LABEL_40;
        }
      }
      else
      {
        if (v5 == 110)
        {
          v6 = CFSTR("AuthenticationPresent");
          goto LABEL_40;
        }
        if (v5 == 120)
        {
          v6 = CFSTR("AuthenticationRequest");
          goto LABEL_40;
        }
      }
    }
    else if (v5 > 39)
    {
      if (v5 <= 41)
      {
        if (v5 == 40)
          v6 = CFSTR("ConnectionStarted");
        else
          v6 = CFSTR("ConnectionEnded");
        goto LABEL_40;
      }
      if (v5 == 42)
      {
        v6 = CFSTR("Error");
        goto LABEL_40;
      }
      if (v5 == 100)
      {
        v6 = CFSTR("AuthenticationTypeChanged");
        goto LABEL_40;
      }
    }
    else if (v5 > 19)
    {
      if (v5 == 20)
      {
        v6 = CFSTR("Completed");
        goto LABEL_40;
      }
      if (v5 == 30)
      {
        v6 = CFSTR("Invalidated");
        goto LABEL_40;
      }
    }
    else
    {
      if (!v5)
      {
        v6 = CFSTR("Unknown");
        goto LABEL_40;
      }
      if (v5 == 10)
      {
        v6 = CFSTR("Started");
LABEL_40:
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v96 = v4;
        *(_WORD *)&v96[4] = 2112;
        *(_QWORD *)&v96[6] = v6;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SetupKitEventHandler invoked for event : %d (%@)", buf, 0x12u);
        goto LABEL_41;
      }
    }
    v6 = CFSTR("?");
    goto LABEL_40;
  }
LABEL_41:

  objc_msgSend(*(id *)(a1 + 32), "doneWaitingForServerResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "error"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "oslog"));

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "error"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v96 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Got error from SetupKit: %@", buf, 0xCu);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "setupCompleted"))
      v11 = 3;
    else
      v11 = 0;
    v12 = *(void **)(a1 + 32);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "error"));
    objc_msgSend(v12, "showOverallResultCard:resultType:", v13, v11);

    return;
  }
  v14 = objc_msgSend(*(id *)(a1 + 40), "eventType");
  if (v14 <= 139)
  {
    if (v14 != 20)
    {
      if (v14 == 120)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "oslog"));

        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Handling request to show authentication prompt", buf, 2u);
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupkitClient"));
        v18 = objc_msgSend(v17, "skipWifi");

        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "oslog"));

          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found recovering device that while similar to a device we recovered, wasn't recovered by us. Can't show progress", buf, 2u);
          }

          v21 = 10001;
        }
        else
        {
          v42 = *(_QWORD *)(a1 + 40);
          v43 = objc_opt_class(SKAuthenticationRequestEvent);
          isKindOfClass = objc_opt_isKindOfClass(v42, v43);
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
          v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "oslog"));

          v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
          if ((isKindOfClass & 1) != 0)
          {
            if (v47)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Attempting to display auth screen", buf, 2u);
            }

            v49 = a1 + 32;
            v48 = *(void **)(a1 + 32);
            v22 = *(id *)(v49 + 8);
            objc_msgSend(v48, "showCollectCodeCard:inFlags:inThrottleSeconds:", -[NSObject passwordType](v22, "passwordType"), -[NSObject pairingFlags](v22, "pairingFlags"), -[NSObject throttleSeconds](v22, "throttleSeconds"));
            goto LABEL_157;
          }
          if (v47)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "SKEventTypeAuthenticationRequest does not match expected class.", buf, 2u);
          }

          v21 = 10002;
        }
        v22 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TapToRecoverProxCardError"), v21, 0));
        objc_msgSend(*(id *)(a1 + 32), "showOverallResultCard:resultType:", v22, 0);
LABEL_157:

        return;
      }
LABEL_72:
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "oslog"));

      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        goto LABEL_157;
      v39 = objc_msgSend(*(id *)(a1 + 40), "eventType");
      v40 = objc_msgSend(*(id *)(a1 + 40), "eventType");
      if (v40 > 109)
      {
        if (v40 > 199)
        {
          if (v40 <= 201)
          {
            if (v40 == 200)
              v41 = CFSTR("CaptiveNetworkPresent");
            else
              v41 = CFSTR("CaptiveNetworkNavigation");
            goto LABEL_156;
          }
          if (v40 == 202)
          {
            v41 = CFSTR("CaptiveNetworkAuthenticated");
            goto LABEL_156;
          }
          if (v40 == 300)
          {
            v41 = CFSTR("BasicConfigUpdated");
            goto LABEL_156;
          }
        }
        else if (v40 > 129)
        {
          if (v40 == 130)
          {
            v41 = CFSTR("AuthenticationResponse");
            goto LABEL_156;
          }
          if (v40 == 140)
          {
            v41 = CFSTR("AuthenticationCompleted");
            goto LABEL_156;
          }
        }
        else
        {
          if (v40 == 110)
          {
            v41 = CFSTR("AuthenticationPresent");
            goto LABEL_156;
          }
          if (v40 == 120)
          {
            v41 = CFSTR("AuthenticationRequest");
            goto LABEL_156;
          }
        }
      }
      else if (v40 > 39)
      {
        if (v40 <= 41)
        {
          if (v40 == 40)
            v41 = CFSTR("ConnectionStarted");
          else
            v41 = CFSTR("ConnectionEnded");
          goto LABEL_156;
        }
        if (v40 == 42)
        {
          v41 = CFSTR("Error");
          goto LABEL_156;
        }
        if (v40 == 100)
        {
          v41 = CFSTR("AuthenticationTypeChanged");
          goto LABEL_156;
        }
      }
      else if (v40 > 19)
      {
        if (v40 == 20)
        {
          v41 = CFSTR("Completed");
          goto LABEL_156;
        }
        if (v40 == 30)
        {
          v41 = CFSTR("Invalidated");
          goto LABEL_156;
        }
      }
      else
      {
        if (!v40)
        {
          v41 = CFSTR("Unknown");
          goto LABEL_156;
        }
        if (v40 == 10)
        {
          v41 = CFSTR("Started");
LABEL_156:
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v96 = v39;
          *(_WORD *)&v96[4] = 2112;
          *(_QWORD *)&v96[6] = v41;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Unhandled event %d (%@) recieved by setupKitEventHandler", buf, 0x12u);
          goto LABEL_157;
        }
      }
      v41 = CFSTR("?");
      goto LABEL_156;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serverConfig"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("NeRDIntent")));
    if (objc_msgSend(v35, "isEqual:", CFSTR("NeRDIntentStatus")))
    {

    }
    else
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serverConfig"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("NeRDIntent")));
      v61 = objc_msgSend(v60, "isEqual:", CFSTR("NeRDIntentRecovery"));

      if (!v61)
        goto LABEL_90;
    }
    objc_msgSend(*(id *)(a1 + 32), "persistRecoveringDevice");
LABEL_90:
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serverConfig"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("NeRDIntent")));
    v64 = objc_msgSend(v63, "isEqual:", CFSTR("NeRDIntentRecoveryMenu"));

    v65 = *(void **)(a1 + 32);
    if (v64)
    {
      if ((objc_msgSend(v65, "setupCompleted") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "setSetupCompleted:", 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
        v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "oslog"));

        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Remote device setup complete, showing menu", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "showMenuCard");
      }
    }
    else
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "serverConfig"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("NeRDSupportsMessaging")));
      v70 = objc_msgSend(v69, "BOOLValue");

      v71 = *(void **)(a1 + 32);
      if (v70)
      {
        if ((objc_msgSend(v71, "setupCompleted") & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "setSetupCompleted:", 1);
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
          v73 = objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "oslog"));

          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Remote device setup complete, showing progress", buf, 2u);
          }

          objc_msgSend(*(id *)(a1 + 32), "showProgressCard:", 0);
        }
      }
      else
      {
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "logger"));
        v80 = objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "oslog"));

        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Remote device setup complete, messaging not supported, finish", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "showOverallResultCard:resultType:", 0, 1);
      }
    }
    return;
  }
  if (v14 != 140)
  {
    if (v14 != 300)
      goto LABEL_72;
    v22 = *(id *)(a1 + 40);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "oslog"));

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject basicConfig](v22, "basicConfig"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v96 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Remote device sent config: %@", buf, 0xCu);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject basicConfig](v22, "basicConfig"));
    objc_msgSend(*(id *)(a1 + 32), "setServerConfig:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject basicConfig](v22, "basicConfig"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeRDVersionKey")));
    v29 = (uint64_t)objc_msgSend(v28, "integerValue");

    if (v29 >= 3)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "oslog"));

      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v96 = v29;
        *(_WORD *)&v96[8] = 2048;
        *(_QWORD *)&v96[10] = 2;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Remote device got higher version: %ld, our version is: %ld", buf, 0x16u);
      }

LABEL_65:
      v32 = 10003;
LABEL_66:
      v33 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TapToRecoverProxCardError"), v32, 0));
      objc_msgSend(*(id *)(a1 + 32), "showOverallResultCard:resultType:", v33, 0);
LABEL_120:

      goto LABEL_157;
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject basicConfig](v22, "basicConfig"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("NeRDIntent")));
    if ((objc_msgSend(v51, "isEqual:", CFSTR("NeRDIntentStatus")) & 1) != 0)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupkitClient"));
      v53 = objc_msgSend(v52, "skipWifi");

      if (v53)
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
        v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "oslog"));

        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Remote device wants to send status, showing progress", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "setSetupCompleted:", 1);
        v56 = *(void **)(a1 + 32);
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject basicConfig](v22, "basicConfig"));
        objc_msgSend(v56, "showProgressCard:", v57);

        v58 = *(void **)(a1 + 32);
        v93 = CFSTR("NeRDOOBCommand");
        v94 = CFSTR("NeRDOOBCommandStatus");
        v33 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1));
        objc_msgSend(v58, "sendMessage:completionHandler:", v33, 0);
        goto LABEL_120;
      }
    }
    else
    {

    }
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject basicConfig](v22, "basicConfig"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("NeRDIntent")));
    v76 = objc_msgSend(v75, "isEqual:", CFSTR("NeRDIntentRecovery"));

    if (v76)
    {
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "oslog"));

      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        goto LABEL_120;
      *(_WORD *)buf = 0;
      v78 = "Remote device wants to do recovery";
    }
    else
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject basicConfig](v22, "basicConfig"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("NeRDIntent")));
      v83 = objc_msgSend(v82, "isEqual:", CFSTR("NeRDIntentRecoveryMenu"));

      if (v83)
      {
        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
        v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "oslog"));

        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          goto LABEL_120;
        *(_WORD *)buf = 0;
        v78 = "Remote device wants to show recovery menu";
      }
      else
      {
        v85 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject basicConfig](v22, "basicConfig"));
        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("NeRDIntent")));

        v87 = *(void **)(a1 + 32);
        if (v86)
        {
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "logger"));
          v89 = objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "oslog"));

          if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "Remote device got unknown intent, failing", buf, 2u);
          }

          goto LABEL_65;
        }
        v90 = objc_msgSend(v87, "extendedMode");
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
        v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "oslog"));

        v92 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
        if (v90)
        {
          if (v92)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Remote device got no intent and in extended mode, failing", buf, 2u);
          }

          v32 = 10005;
          goto LABEL_66;
        }
        if (!v92)
          goto LABEL_120;
        *(_WORD *)buf = 0;
        v78 = "Remote device got no intent and in regular mode, assuming recovery intent";
      }
    }
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v78, buf, 2u);
    goto LABEL_120;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
  v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "oslog"));

  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "AuthCompletionHandler called with success", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "updateCodeCardToSettingUpState");
}

- (id)progressDismissButtonAction
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10001C720, 0));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __75__RecoverDeviceUIExtensionRemoteViewController_progressDismissButtonAction__block_invoke;
  v7[3] = &unk_10001C460;
  v7[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v4, 0, v7));

  return v5;
}

void __75__RecoverDeviceUIExtensionRemoteViewController_progressDismissButtonAction__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __75__RecoverDeviceUIExtensionRemoteViewController_progressDismissButtonAction__block_invoke_2;
  block[3] = &unk_10001C438;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __75__RecoverDeviceUIExtensionRemoteViewController_progressDismissButtonAction__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v6[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oslog"));

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissing card after setup completion", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavController"));
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  return objc_msgSend(*(id *)(a1 + 32), "setShowingProgress:", 0);
}

- (id)deviceKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stableIdentifier"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceObj](self, "deviceObj"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stableIdentifier"));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
  }
  return v6;
}

- (void)cleanupOldRecoveredDevices
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryForKey:", CFSTR("com.apple.RecoverDeviceUI.RecoveringDeviceKey")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (v4)
  {
    v22 = v4;
    v23 = v5;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v11, v22));
          v13 = objc_opt_class(NSDate);
          if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0
            && (objc_msgSend(v24, "timeIntervalSinceDate:", v12), v14 < 28800.0))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
            v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "oslog"));

            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v30 = v11;
              v31 = 2112;
              v32 = v12;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Keeping key for device %@, which was added on: %@", buf, 0x16u);
            }

            objc_msgSend(v23, "setObject:forKeyedSubscript:", v12, v11);
          }
          else
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
            v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "oslog"));

            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v30 = v11;
              v31 = 2112;
              v32 = v12;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Cleaning up key for device %@, which was added on: %@", buf, 0x16u);
            }

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v8);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = v23;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v23));
    objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("com.apple.RecoverDeviceUI.RecoveringDeviceKey"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v21, "synchronize");

    v4 = v22;
  }

}

- (void)persistRecoveringDevice
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  NSObject *v18;

  -[RecoverDeviceUIExtensionRemoteViewController cleanupOldRecoveredDevices](self, "cleanupOldRecoveredDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceKey](self, "deviceKey"));
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "oslog"));

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v3;
      v17 = 2112;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Persisting recovered device: %@ with current time: %@", (uint8_t *)&v15, 0x16u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dictionaryForKey:", CFSTR("com.apple.RecoverDeviceUI.RecoveringDeviceKey")));
    v9 = objc_msgSend(v8, "mutableCopy");

    if (!v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "oslog"));

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No recovered device ids found, Creating a new dictionary", (uint8_t *)&v15, 2u);
      }

      v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v12, "setObject:forKey:", v9, CFSTR("com.apple.RecoverDeviceUI.RecoveringDeviceKey"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v13, "synchronize");

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "oslog"));

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No key to identify the device was found, not persisting", (uint8_t *)&v15, 2u);
    }
  }

}

- (BOOL)matchesRecentlyRecoveredDevice
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  NSObject *v17;

  -[RecoverDeviceUIExtensionRemoteViewController cleanupOldRecoveredDevices](self, "cleanupOldRecoveredDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController deviceKey](self, "deviceKey"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionaryForKey:", CFSTR("com.apple.RecoverDeviceUI.RecoveringDeviceKey")));

    if (v5
      && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v3)),
          v6,
          v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "oslog"));

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v3));
        v14 = 138412546;
        v15 = v3;
        v16 = 2112;
        v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device %@ found in recovered device ids (added on: %@)", (uint8_t *)&v14, 0x16u);

      }
      v10 = 1;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "oslog"));

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412546;
        v15 = v3;
        v16 = 2112;
        v17 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device %@ is not a recently recovered device. Recently recovered: %@", (uint8_t *)&v14, 0x16u);
      }
      v10 = 0;
    }

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "oslog"));

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No key to identify the device was found, not persisting", (uint8_t *)&v14, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)overallResultSUButtonAction
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("UPDATE_NOW"), &stru_10001C720, 0));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __75__RecoverDeviceUIExtensionRemoteViewController_overallResultSUButtonAction__block_invoke;
  v7[3] = &unk_10001C460;
  v7[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v4, 0, v7));

  return v5;
}

void __75__RecoverDeviceUIExtensionRemoteViewController_overallResultSUButtonAction__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __75__RecoverDeviceUIExtensionRemoteViewController_overallResultSUButtonAction__block_invoke_2;
  block[3] = &unk_10001C438;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __75__RecoverDeviceUIExtensionRemoteViewController_overallResultSUButtonAction__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v6[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oslog"));

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Moving to software update pane", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavController"));
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global);

  return objc_msgSend(*(id *)(a1 + 32), "setOverallResultCard:", 0);
}

void __75__RecoverDeviceUIExtensionRemoteViewController_overallResultSUButtonAction__block_invoke_284(id a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=General&path=SOFTWARE_UPDATE_LINK&ShowDefaultAudiencePane=YES")));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v2, 0);

}

- (id)overallResultOKButtonAction
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10001C720, 0));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __75__RecoverDeviceUIExtensionRemoteViewController_overallResultOKButtonAction__block_invoke;
  v7[3] = &unk_10001C460;
  v7[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v4, 0, v7));

  return v5;
}

void __75__RecoverDeviceUIExtensionRemoteViewController_overallResultOKButtonAction__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __75__RecoverDeviceUIExtensionRemoteViewController_overallResultOKButtonAction__block_invoke_2;
  block[3] = &unk_10001C438;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __75__RecoverDeviceUIExtensionRemoteViewController_overallResultOKButtonAction__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v6[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oslog"));

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissing card after setup completion", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavController"));
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  return objc_msgSend(*(id *)(a1 + 32), "setOverallResultCard:", 0);
}

- (id)getOverallResultTitleStringForError:(id)a3 resultType:(int)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  char *v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController recoverDeviceOperationsQueue](self, "recoverDeviceOperationsQueue"));
  dispatch_assert_queue_V2(v7);

  if (!v6)
  {
    if (a4 == 4)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
      v11 = (void *)v13;
      v14 = CFSTR("OVERALL_RESULT_RECOVERY_SUCCESS_TITLE");
    }
    else if (a4 == 8)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
      v11 = (void *)v13;
      v14 = CFSTR("OVERALL_RESULT_REBOOT_SUCCESS_TITLE");
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
      if (a4 == 6)
      {
        v11 = (void *)v13;
        v14 = CFSTR("OVERALL_RESULT_EACS_SUCCESS_TITLE");
      }
      else
      {
        v11 = (void *)v13;
        v14 = CFSTR("OVERALL_RESULT_SUCCESS_TITLE");
      }
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v14, v13));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v27, &stru_10001C720, 0));
    v19 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v28));

    goto LABEL_28;
  }
  switch(a4)
  {
    case 2:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("OVERALL_RESULT_RECOVERY_FAILURE_TITLE"), v9));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_10001C720, 0));

      goto LABEL_10;
    case 3:
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v15;
      v16 = CFSTR("OVERALL_RESULT_RECOVERY_DISCONNECT_TITLE");
      goto LABEL_13;
    case 5:
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v15;
      v16 = CFSTR("OVERALL_RESULT_EACS_FAILURE_TITLE");
      goto LABEL_13;
    case 7:
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v15;
      v16 = CFSTR("OVERALL_RESULT_REBOOT_FAILURE_TITLE");
LABEL_13:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_10001C720, 0));
      break;
    default:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OVERALL_RESULT_SETUP_FAILURE_TITLE"), &stru_10001C720, 0));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9));
LABEL_10:

      break;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("TapToRecoverProxCardError"));

  if (v18)
  {
    if (objc_msgSend(v6, "code") == (id)10003)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SOFTWARE_UPDATE"), &stru_10001C720, 0));
LABEL_28:

      v11 = (void *)v19;
    }
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    v21 = objc_msgSend(v20, "isEqualToString:", NSOSStatusErrorDomain);

    if (v21)
    {
      v22 = (char *)objc_msgSend(v6, "code");
      if ((unint64_t)(v22 - 301000) <= 0x22 && ((1 << (v22 + 56)) & 0x400000011) != 0)
      {
        v23 = -[RecoverDeviceUIExtensionRemoteViewController useAlternateStringForWiFI](self, "useAlternateStringForWiFI");
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v24 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
        v25 = (void *)v24;
        if (v23)
          v26 = CFSTR("OVERALL_RESULT_FAILURE_WLAN_TITLE");
        else
          v26 = CFSTR("OVERALL_RESULT_FAILURE_WIFI_TITLE");
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v26, v24));
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v29, &stru_10001C720, 0));

        v11 = v25;
        goto LABEL_28;
      }
    }
  }

  return v11;
}

- (id)getOverallResultSubTitleStringForError:(id)a3 resultType:(int)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const __CFString *v15;
  unsigned int v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  unsigned int v34;
  char *v35;
  void *v36;
  NSObject *v37;
  unsigned int v38;
  const __CFString *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  NSObject *v51;
  uint32_t v52;
  void *v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unsigned int v65;
  uint8_t buf[4];
  id v67;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController recoverDeviceOperationsQueue](self, "recoverDeviceOperationsQueue"));
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    switch(a4)
    {
      case 2:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
        v10 = (void *)v9;
        v11 = CFSTR("OVERALL_RESULT_RECOVERY_FAILURE_DESCRIPTION");
        goto LABEL_15;
      case 3:
        v16 = -[RecoverDeviceUIExtensionRemoteViewController useAlternateStringForWiFI](self, "useAlternateStringForWiFI");
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        if (v16)
          v17 = CFSTR("OVERALL_RESULT_RECOVERY_DISCONNECT_DESCRIPTION_WLAN");
        else
          v17 = CFSTR("OVERALL_RESULT_RECOVERY_DISCONNECT_DESCRIPTION");
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", v17));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v10, v18));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v23, &stru_10001C720, 0));

        goto LABEL_22;
      case 5:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
        v10 = (void *)v9;
        v11 = CFSTR("OVERALL_RESULT_EACS_FAILURE_DESCRIPTION");
        goto LABEL_15;
      case 7:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
        v10 = (void *)v9;
        v11 = CFSTR("OVERALL_RESULT_REBOOT_FAILURE_DESCRIPTION");
        goto LABEL_15;
      default:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
        v10 = (void *)v9;
        v11 = CFSTR("OVERALL_RESULT_FAILURE_DESCRIPTION");
LABEL_15:
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v11, v9));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v18, &stru_10001C720, 0));
LABEL_22:

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("TapToRecoverProxCardError"));

        if (!v25)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
          v34 = objc_msgSend(v33, "isEqualToString:", NSOSStatusErrorDomain);

          if (!v34)
            goto LABEL_56;
          v35 = (char *)objc_msgSend(v6, "code");
          if ((unint64_t)(v35 - 301000) <= 0x22 && ((1 << (v35 + 56)) & 0x400000011) != 0
            || v35 == (char *)-71158)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
            v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "oslog"));

            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v67 = objc_msgSend(v6, "code");
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Error Description: WiFi is unavailable/unsupported/not connected to network : %ld", buf, 0xCu);
            }

            v38 = -[RecoverDeviceUIExtensionRemoteViewController useAlternateStringForWiFI](self, "useAlternateStringForWiFI");
            v29 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            if (v38)
              v39 = CFSTR("OVERALL_RESULT_FAILURE_WLAN_UNAVAILABLE");
            else
              v39 = CFSTR("OVERALL_RESULT_FAILURE_WIFI_UNAVAILABLE");
            v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", v39));
            v47 = objc_claimAutoreleasedReturnValue(-[NSObject localizedStringForKey:value:table:](v29, "localizedStringForKey:value:table:", v46, &stru_10001C720, 0));

            v19 = (void *)v47;
            goto LABEL_55;
          }
          v61 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
          v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "oslog"));

          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v67 = objc_msgSend(v6, "code");
            v49 = "Error Description: Generic/Unsupported error code from NSOSStatusErrorDomain(%ld). Using default subtitle";
            v51 = v29;
            v52 = 12;
            goto LABEL_50;
          }
          goto LABEL_55;
        }
        v26 = (uint64_t)objc_msgSend(v6, "code");
        if (v26 <= 10000)
        {
          if (!v26)
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
            v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "oslog"));

            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v49 = "Error Description: No error code specified. Using default subtitle";
              goto LABEL_49;
            }
LABEL_55:

            goto LABEL_56;
          }
          if (v26 == 10000)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
            v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "oslog"));

            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Error Description: Too many code entry attempts", buf, 2u);
            }

            v29 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v30 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
            v31 = (void *)v30;
            v32 = CFSTR("OVERALL_RESULT_FAILURE_TOO_MANY_CODE_ATTEMPTS_DESCRIPTION");
            goto LABEL_54;
          }
LABEL_45:
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
          v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "oslog"));

          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v49 = "Error Description: Generic error code. Using default subtitle";
LABEL_49:
            v51 = v29;
            v52 = 2;
LABEL_50:
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, v49, buf, v52);
            goto LABEL_55;
          }
          goto LABEL_55;
        }
        if (v26 == 10001)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
          v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "oslog"));

          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Error Description: Expected a paired device but BLE server sent auth request", buf, 2u);
          }

          v29 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v30 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
          v31 = (void *)v30;
          v32 = CFSTR("OVERALL_RESULT_FAILURE_CONNECTED_TO_ANOTHER");
          goto LABEL_54;
        }
        if (v26 != 10003)
          goto LABEL_45;
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "oslog"));

        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Error Description: version mismatch", buf, 2u);
        }

        v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "model"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "uppercaseString"));
        v45 = objc_msgSend(v44, "containsString:", CFSTR("IPHONE"));

        if (v45)
        {
          v29 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v30 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
          v31 = (void *)v30;
          v32 = CFSTR("OVERALL_RESULT_FAILURE_VERSION_IPHONE");
LABEL_54:
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v32, v30));
          v56 = objc_claimAutoreleasedReturnValue(-[NSObject localizedStringForKey:value:table:](v29, "localizedStringForKey:value:table:", v55, &stru_10001C720, 0));

          v19 = (void *)v56;
          goto LABEL_55;
        }
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "model"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "uppercaseString"));
        v65 = objc_msgSend(v64, "containsString:", CFSTR("IPAD"));

        if (v65)
        {
          v29 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v30 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
          v31 = (void *)v30;
          v32 = CFSTR("OVERALL_RESULT_FAILURE_VERSION_IPAD");
          goto LABEL_54;
        }
LABEL_56:
        if (os_variant_has_internal_content("RecoverDeviceUI"))
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
          v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingFormat:", CFSTR("\n[Internal Only]: %@"), v57));

          v19 = (void *)v58;
        }
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "oslog"));

        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v67 = v19;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Subtitle is: %@", buf, 0xCu);
        }
        break;
    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "oslog"));

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No error object passed in to covert to subtitle string", buf, 2u);
    }

    if (a4 == 8)
    {
      v14 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = CFSTR("OVERALL_RESULT_REBOOT_DESCRIPTION");
    }
    else if (a4 == 6)
    {
      v14 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = CFSTR("OVERALL_RESULT_EACS_DESCRIPTION");
    }
    else
    {
      v14 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (a4 == 4)
        v15 = CFSTR("OVERALL_RESULT_RECOVERY_DESCRIPTION");
      else
        v15 = CFSTR("OVERALL_RESULT_SUCCESS_DESCRIPTION");
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", v15));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v20, v21));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject localizedStringForKey:value:table:](v14, "localizedStringForKey:value:table:", v22, &stru_10001C720, 0));

  }
  return v19;
}

- (id)getOverallResultActionForError:(id)a3 resultType:(int)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint8_t v13[16];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("TapToRecoverProxCardError"));

  if (v7 && objc_msgSend(v5, "code") == (id)10003)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "oslog"));

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error Description: version mismatch", v13, 2u);
    }

    v10 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController overallResultSUButtonAction](self, "overallResultSUButtonAction"));
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController overallResultOKButtonAction](self, "overallResultOKButtonAction"));
  }
  v11 = (void *)v10;

  return v11;
}

- (id)getOverallResultUIImageForError:(id)a3 resultType:(int)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  const __CFString *v14;
  void *v15;
  unsigned int v16;
  id v17;
  const __CFString *v18;
  void *v19;
  unsigned int v20;
  char *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;

  v6 = a3;
  if (v6)
  {
    if (a4 == 3)
    {
      v7 = objc_alloc((Class)UIImageView);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("wifi.exclamationmark")));
      v9 = objc_msgSend(v7, "initWithImage:", v8);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color"));
      objc_msgSend(v9, "setTintColor:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 80.0));
      objc_msgSend(v9, "setPreferredSymbolConfiguration:", v11);

    }
    else
    {
      v9 = 0;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("TapToRecoverProxCardError"));

    if (v16)
    {
      if (objc_msgSend(v6, "code") != (id)10003)
        goto LABEL_16;
      v17 = objc_alloc((Class)UIImageView);
      v18 = CFSTR("gear");
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      v20 = objc_msgSend(v19, "isEqualToString:", NSOSStatusErrorDomain);

      if (!v20)
        goto LABEL_16;
      v21 = (char *)objc_msgSend(v6, "code");
      if (((unint64_t)(v21 - 301000) > 0x22 || ((1 << (v21 + 56)) & 0x400000011) == 0)
        && v21 != (char *)-71158)
      {
        goto LABEL_16;
      }
      v17 = objc_alloc((Class)UIImageView);
      v18 = CFSTR("wifi.slash");
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v18));
    v23 = objc_msgSend(v17, "initWithImage:", v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color"));
    objc_msgSend(v23, "setTintColor:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 80.0));
    objc_msgSend(v23, "setPreferredSymbolConfiguration:", v25);

    v9 = v23;
LABEL_16:
    if (!v9)
      v9 = (id)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController uiImage](self, "uiImage"));
    goto LABEL_22;
  }
  v12 = a4 - 1;
  v9 = 0;
  switch(v12)
  {
    case 0:
    case 5:
      break;
    case 3:
      v13 = objc_alloc((Class)UIImageView);
      v14 = CFSTR("gear");
      goto LABEL_20;
    case 7:
      v13 = objc_alloc((Class)UIImageView);
      v14 = CFSTR("arrowtriangle.backward.circle");
LABEL_20:
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v14));
      v9 = objc_msgSend(v13, "initWithImage:", v29);

      v28 = objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
      goto LABEL_21;
    default:
      v26 = objc_alloc((Class)UIImageView);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark.circle.fill")));
      v9 = objc_msgSend(v26, "initWithImage:", v27);

      v28 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
LABEL_21:
      v30 = (void *)v28;
      objc_msgSend(v9, "setTintColor:", v28);

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 64.0));
      objc_msgSend(v9, "setPreferredSymbolConfiguration:", v31);

      break;
  }
LABEL_22:

  return v9;
}

- (void)updateProgressCardOnMainQueueWithInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NeRDState")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NeRDProgress")));

  if (!v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("PROGRESS_FETCHING");
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEqual:", CFSTR("NeRDStateScanning")))
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("PROGRESS_STATE_SCANNING");
LABEL_11:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", v9, &stru_10001C720, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController progressText](self, "progressText"));
    objc_msgSend(v11, "setText:", v10);

LABEL_12:
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "isEqual:", CFSTR("NeRDStateDownloading")))
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("PROGRESS_STATE_DOWNLOADING");
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEqual:", CFSTR("NeRDStatePreparing")))
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("PROGRESS_STATE_PREPARING");
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEqual:", CFSTR("NeRDStateInstalling")))
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("PROGRESS_STATE_INSTALLING");
    goto LABEL_11;
  }
  if ((objc_msgSend(v5, "isEqual:", CFSTR("NeRDStateInstalled")) & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "oslog"));

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unknown state (%@)!  file a bug", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:
  if (v6)
  {
    v12 = (double)(unint64_t)objc_msgSend(v6, "unsignedIntegerValue") * 0.01;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController progressView](self, "progressView"));
    *(float *)&v14 = v12;
    objc_msgSend(v13, "setProgress:animated:", 1, v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController progressView](self, "progressView"));
    objc_msgSend(v15, "setNeedsLayout");

  }
}

- (void)showProgressCard:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController recoverDeviceOperationsQueue](self, "recoverDeviceOperationsQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __65__RecoverDeviceUIExtensionRemoteViewController_showProgressCard___block_invoke;
  v7[3] = &unk_10001C410;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __65__RecoverDeviceUIExtensionRemoteViewController_showProgressCard___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v2 = objc_alloc_init((Class)PRXIconContentViewController);
  objc_msgSend(*(id *)(a1 + 32), "setProgressCard:", v2);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __65__RecoverDeviceUIExtensionRemoteViewController_showProgressCard___block_invoke_2;
  v4[3] = &unk_10001C410;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

void __65__RecoverDeviceUIExtensionRemoteViewController_showProgressCard___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
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
  id v47;
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
  _QWORD v63[6];
  _QWORD v64[3];

  objc_msgSend(*(id *)(a1 + 32), "setShowingProgress:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressCard"));
  objc_msgSend(v2, "setDismissalType:", 3);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "kLocalizedDeviceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("PROGRESS_CARD_TITLE"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_10001C720, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressCard"));
  objc_msgSend(v7, "setTitle:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("PROGRESS_CARD_USAGE_INSTRUCTIONS")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "kLocalizedDeviceType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v9, v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v11, &stru_10001C720, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressCard"));
  objc_msgSend(v13, "setSubtitle:", v12);

  v14 = objc_msgSend(objc_alloc((Class)UIProgressView), "initWithProgressViewStyle:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setProgressView:", v14);

  v15 = objc_msgSend(objc_alloc((Class)PRXLabel), "initWithStyle:", 1);
  LODWORD(v12) = objc_msgSend(*(id *)(a1 + 32), "isCompanionSameDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if ((_DWORD)v12)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("PROGRESS_CARD_VIEW_AGAIN_OTHER")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v17, &stru_10001C720, 0));
    objc_msgSend(v15, "setText:", v18);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("PROGRESS_CARD_VIEW_AGAIN")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "kLocalizedDeviceType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v17, v18));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v19, &stru_10001C720, 0));
    objc_msgSend(v15, "setText:", v20);

  }
  v21 = objc_alloc_init((Class)UILabel);
  objc_msgSend(*(id *)(a1 + 32), "setProgressText:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressText"));
  objc_msgSend(v22, "setTextAlignment:", 1);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressText"));
  objc_msgSend(v24, "setTextColor:", v23);

  +[UIFont smallSystemFontSize](UIFont, "smallSystemFontSize");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressText"));
  objc_msgSend(v26, "setFont:", v25);

  v27 = objc_alloc((Class)UIStackView);
  v64[0] = v15;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressView"));
  v64[1] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressText"));
  v64[2] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 3));
  v31 = objc_msgSend(v27, "initWithArrangedSubviews:", v30);

  objc_msgSend(v31, "setCustomSpacing:afterView:", v15, 30.0);
  objc_msgSend(v31, "setAxis:", 1);
  objc_msgSend(v31, "setSpacing:", 6.0);
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressCard"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "contentView"));
  objc_msgSend(v33, "addSubview:", v31);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressCard"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "contentView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "mainContentGuide"));

  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintGreaterThanOrEqualToAnchor:", v61));
  v63[0] = v59;
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bottomAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bottomAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintLessThanOrEqualToAnchor:", v56));
  v63[1] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "centerYAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "centerYAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v53));
  v63[2] = v52;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "centerXAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "centerXAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v50));
  v63[3] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
  v58 = v36;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
  v63[4] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "leadingAnchor"));
  v60 = v15;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v42));
  v63[5] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 6));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v44);

  objc_msgSend(*(id *)(a1 + 32), "updateProgressCardOnMainQueueWithInfo:", *(_QWORD *)(a1 + 40));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressCard"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressDismissButtonAction"));
  v47 = objc_msgSend(v45, "addAction:", v46);

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavController"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressCard"));
  objc_msgSend(v48, "pushViewController:animated:", v49, 1);

}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  RecoverDeviceUIExtensionRemoteViewController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController recoverDeviceOperationsQueue](self, "recoverDeviceOperationsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __78__RecoverDeviceUIExtensionRemoteViewController_sendMessage_completionHandler___block_invoke;
  block[3] = &unk_10001C540;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __78__RecoverDeviceUIExtensionRemoteViewController_sendMessage_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  _UNKNOWN **v12;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "setupkitClient"));
    v3 = *(_QWORD *)(a1 + 32);
    v11 = SKOptionTimeoutSeconds;
    v12 = &off_10001DBC0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __78__RecoverDeviceUIExtensionRemoteViewController_sendMessage_completionHandler___block_invoke_396;
    v9[3] = &unk_10001C4F0;
    v5 = &v10;
    v6 = *(id *)(a1 + 48);
    v9[4] = *(_QWORD *)(a1 + 40);
    v10 = v6;
    -[NSObject sendEventID:eventMessage:options:completionHandler:](v2, "sendEventID:eventMessage:options:completionHandler:", CFSTR("osrEventID"), v3, v4, v9);

  }
  else
  {
    if (!*(_QWORD *)(a1 + 48))
      return;
    v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "recoverDeviceOperationsQueue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __78__RecoverDeviceUIExtensionRemoteViewController_sendMessage_completionHandler___block_invoke_3;
    v7[3] = &unk_10001C518;
    v5 = &v8;
    v8 = *(id *)(a1 + 48);
    dispatch_async(v2, v7);
  }

}

void __78__RecoverDeviceUIExtensionRemoteViewController_sendMessage_completionHandler___block_invoke_396(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recoverDeviceOperationsQueue"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __78__RecoverDeviceUIExtensionRemoteViewController_sendMessage_completionHandler___block_invoke_2;
    v5[3] = &unk_10001C4C8;
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __78__RecoverDeviceUIExtensionRemoteViewController_sendMessage_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __78__RecoverDeviceUIExtensionRemoteViewController_sendMessage_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)backToMenuButton
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  RecoverDeviceUIExtensionRemoteViewController *v19;
  NSAttributedStringKey v20;
  void *v21;

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __64__RecoverDeviceUIExtensionRemoteViewController_backToMenuButton__block_invoke;
  v17[3] = &unk_10001C568;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[PRXButton buttonWithProximityType:](PRXButton, "buttonWithProximityType:", 0));
  v18 = v3;
  v19 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v17));
  objc_msgSend(v3, "addAction:forControlEvents:", v4, 0x2000);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  objc_msgSend(v5, "setTitleAlignment:", 2);
  v6 = objc_alloc((Class)NSAttributedString);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("GO_BACK"), &stru_10001C720, 0));
  v20 = NSFontAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 17.0, UIFontWeightMedium));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scaledFontForFont:compatibleWithTraitCollection:", v10, 0));
  v21 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  v13 = objc_msgSend(v6, "initWithString:attributes:", v8, v12);

  objc_msgSend(v5, "setAttributedTitle:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  objc_msgSend(v5, "setBaseForegroundColor:", v14);

  objc_msgSend(v3, "setConfiguration:", v5);
  v15 = v3;

  return v15;
}

id __64__RecoverDeviceUIExtensionRemoteViewController_backToMenuButton__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "showMenuCard");
}

- (void)showRecoveryCard
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController recoverDeviceOperationsQueue](self, "recoverDeviceOperationsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64__RecoverDeviceUIExtensionRemoteViewController_showRecoveryCard__block_invoke;
  block[3] = &unk_10001C438;
  block[4] = self;
  dispatch_async(v3, block);

}

void __64__RecoverDeviceUIExtensionRemoteViewController_showRecoveryCard__block_invoke(uint64_t a1)
{
  id v2;
  _QWORD block[5];

  v2 = objc_alloc_init((Class)PRXIconContentViewController);
  objc_msgSend(*(id *)(a1 + 32), "setRecoveryCard:", v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64__RecoverDeviceUIExtensionRemoteViewController_showRecoveryCard__block_invoke_2;
  block[3] = &unk_10001C438;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void __64__RecoverDeviceUIExtensionRemoteViewController_showRecoveryCard__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
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
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recoveryCard"));
  objc_msgSend(v2, "setDismissalType:", 3);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MENU_SYSTEM_RECOVERY_BUTTON_TITLE"), &stru_10001C720, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recoveryCard"));
  objc_msgSend(v5, "setTitle:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "kLocalizedDeviceType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("SYSTEM_RECOVERY_DETAILS"), v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_10001C720, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recoveryCard"));
  objc_msgSend(v10, "setSubtitle:", v9);

  v11 = objc_alloc((Class)UIImageView);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("gear")));
  v13 = objc_msgSend(v11, "initWithImage:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color"));
  objc_msgSend(v13, "setTintColor:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 80.0));
  objc_msgSend(v13, "setPreferredSymbolConfiguration:", v15);

  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recoveryCard"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contentView"));
  objc_msgSend(v17, "addSubview:", v13);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recoveryCard"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mainContentGuide"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:", v21));
  v48[0] = v22;
  v23 = v13;
  v45 = v13;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerYAnchor"));
  v44 = v20;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerYAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
  v48[1] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerXAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerXAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
  v48[2] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recoveryCard"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("START_RECOVERY_BUTTON_TEXT"), &stru_10001C720, 0));
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = __64__RecoverDeviceUIExtensionRemoteViewController_showRecoveryCard__block_invoke_3;
  v47[3] = &unk_10001C460;
  v47[4] = *(_QWORD *)(a1 + 32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v33, 0, v47));
  v35 = objc_msgSend(v31, "addAction:", v34);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recoveryCard"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("GO_BACK"), &stru_10001C720, 0));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = __64__RecoverDeviceUIExtensionRemoteViewController_showRecoveryCard__block_invoke_414;
  v46[3] = &unk_10001C460;
  v46[4] = *(_QWORD *)(a1 + 32);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v38, 1, v46));
  v40 = objc_msgSend(v36, "addAction:", v39);

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavController"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recoveryCard"));
  objc_msgSend(v41, "pushViewController:animated:", v42, 1);

}

id __64__RecoverDeviceUIExtensionRemoteViewController_showRecoveryCard__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  uint8_t v14[8];
  const __CFString *v15;
  const __CFString *v16;

  objc_msgSend(a2, "setEnabled:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recoveryCard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MENU_SYSTEM_RECOVERY_IN_PROGRESS_TEXT"), &stru_10001C720, 0));
  objc_msgSend(v3, "showActivityIndicatorWithStatus:", v5);

  v6 = *(void **)(a1 + 32);
  v15 = CFSTR("NeRDCommand");
  v16 = CFSTR("NeRDCommandRecover");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  objc_msgSend(v6, "sendMessage:completionHandler:", v7, 0);

  objc_msgSend(*(id *)(a1 + 32), "persistRecoveringDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serverConfig"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NeRDSupportsMessaging")));
  LODWORD(v5) = objc_msgSend(v9, "BOOLValue");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "oslog"));

  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v5)
  {
    if (v12)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "recovery button pressed, showing progress", v14, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "showProgressCard:", 0);
  }
  else
  {
    if (v12)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "recovery button pressed, messaging not supported, finish", v14, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "showOverallResultCard:resultType:", 0, 1);
  }
}

id __64__RecoverDeviceUIExtensionRemoteViewController_showRecoveryCard__block_invoke_414(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setEnabled:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "showMenuCard");
}

- (id)menuSystemRecoveryButton
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  RecoverDeviceUIExtensionRemoteViewController *v20;
  NSAttributedStringKey v21;
  void *v22;

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __72__RecoverDeviceUIExtensionRemoteViewController_menuSystemRecoveryButton__block_invoke;
  v18[3] = &unk_10001C568;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[PRXButton buttonWithProximityType:](PRXButton, "buttonWithProximityType:", 1));
  v19 = v3;
  v20 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v18));
  objc_msgSend(v3, "addAction:forControlEvents:", v4, 0x2000);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  objc_msgSend(v5, "setTitleAlignment:", 2);
  v6 = objc_alloc((Class)NSAttributedString);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MENU_SYSTEM_RECOVERY_BUTTON_TEXT"), &stru_10001C720, 0));
  v21 = NSFontAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 17.0, UIFontWeightMedium));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scaledFontForFont:compatibleWithTraitCollection:", v10, 0));
  v22 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  v13 = objc_msgSend(v6, "initWithString:attributes:", v8, v12);

  objc_msgSend(v5, "setAttributedTitle:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v5, "setBaseForegroundColor:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward")));
  objc_msgSend(v5, "setImage:", v15);

  objc_msgSend(v5, "setImagePlacement:", 8);
  objc_msgSend(v5, "setImagePadding:", 10.0);
  objc_msgSend(v3, "setConfiguration:", v5);
  v16 = v3;

  return v16;
}

id __72__RecoverDeviceUIExtensionRemoteViewController_menuSystemRecoveryButton__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "showRecoveryCard");
}

- (void)showEACSApprovalCard
{
  id v3;
  _QWORD block[5];

  v3 = objc_alloc_init((Class)PRXIconContentViewController);
  -[RecoverDeviceUIExtensionRemoteViewController setEacsApprovalCard:](self, "setEacsApprovalCard:", v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __68__RecoverDeviceUIExtensionRemoteViewController_showEACSApprovalCard__block_invoke;
  block[3] = &unk_10001C438;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void __68__RecoverDeviceUIExtensionRemoteViewController_showEACSApprovalCard__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  _QWORD v35[2];
  NSAttributedStringKey v36;
  void *v37;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eacsApprovalCard"));
  objc_msgSend(v2, "setDismissalType:", 3);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MENU_EACS_BUTTON_TITLE"), &stru_10001C720, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eacsApprovalCard"));
  objc_msgSend(v5, "setTitle:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("EACS_APPROVAL_SUBTITLE"), &stru_10001C720, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eacsApprovalCard"));
  objc_msgSend(v8, "setSubtitle:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PRXButton buttonWithProximityType:](PRXButton, "buttonWithProximityType:", 1));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = __68__RecoverDeviceUIExtensionRemoteViewController_showEACSApprovalCard__block_invoke_2;
  v32[3] = &unk_10001C568;
  v10 = *(_QWORD *)(a1 + 32);
  v33 = v9;
  v34 = v10;
  v31 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v32));
  objc_msgSend(v31, "addAction:forControlEvents:", v11, 0x2000);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  objc_msgSend(v12, "setTitleAlignment:", 2);
  v13 = objc_alloc((Class)NSAttributedString);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "kLocalizedDeviceType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("EACS_APPROVAL_BUTTON_YES"), v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", v15, &stru_10001C720, 0));
  v36 = NSFontAttributeName;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 17.0, UIFontWeightMedium));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "scaledFontForFont:compatibleWithTraitCollection:", v18, 0));
  v37 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
  v21 = objc_msgSend(v13, "initWithString:attributes:", v16, v20);

  v22 = v21;
  objc_msgSend(v12, "setAttributedTitle:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  objc_msgSend(v12, "setBaseForegroundColor:", v23);

  objc_msgSend(v31, "setConfiguration:", v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eacsApprovalCard"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contentView"));
  v35[0] = v31;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "backToMenuButton"));
  v35[1] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));
  objc_msgSend(v25, "setActionButtons:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eacsApprovalCard"));
  objc_msgSend(v28, "pushViewController:animated:", v29, 1);

}

void __68__RecoverDeviceUIExtensionRemoteViewController_showEACSApprovalCard__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;

  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "eacsApprovalCard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MENU_EACS_IN_PROGRESS_TEXT"), &stru_10001C720, 0));
  objc_msgSend(v2, "showActivityIndicatorWithStatus:", v4);

  objc_msgSend(*(id *)(a1 + 40), "setPerformingEACS:", 1);
  v5 = *(void **)(a1 + 40);
  v7 = CFSTR("NeRDCommand");
  v8 = CFSTR("NeRDCommandEACS");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  objc_msgSend(v5, "sendMessage:completionHandler:", v6, 0);

}

- (void)showEACSCard
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController recoverDeviceOperationsQueue](self, "recoverDeviceOperationsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __60__RecoverDeviceUIExtensionRemoteViewController_showEACSCard__block_invoke;
  block[3] = &unk_10001C438;
  block[4] = self;
  dispatch_async(v3, block);

}

void __60__RecoverDeviceUIExtensionRemoteViewController_showEACSCard__block_invoke(uint64_t a1)
{
  id v2;
  _QWORD block[5];

  v2 = objc_alloc_init((Class)PRXIconContentViewController);
  objc_msgSend(*(id *)(a1 + 32), "setEacsCard:", v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __60__RecoverDeviceUIExtensionRemoteViewController_showEACSCard__block_invoke_2;
  block[3] = &unk_10001C438;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void __60__RecoverDeviceUIExtensionRemoteViewController_showEACSCard__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
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
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eacsCard"));
  objc_msgSend(v2, "setDismissalType:", 3);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MENU_EACS_BUTTON_TITLE"), &stru_10001C720, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eacsCard"));
  objc_msgSend(v5, "setTitle:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "kLocalizedDeviceType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("EACS_DETAILS"), v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_10001C720, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eacsCard"));
  objc_msgSend(v10, "setSubtitle:", v9);

  v11 = objc_alloc((Class)UIImageView);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("iphone.slash")));
  v13 = objc_msgSend(v11, "initWithImage:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color"));
  objc_msgSend(v13, "setTintColor:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 80.0));
  objc_msgSend(v13, "setPreferredSymbolConfiguration:", v15);

  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eacsCard"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contentView"));
  objc_msgSend(v17, "addSubview:", v13);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eacsCard"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mainContentGuide"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:", v21));
  v48[0] = v22;
  v23 = v13;
  v45 = v13;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerYAnchor"));
  v44 = v20;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerYAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
  v48[1] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerXAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerXAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
  v48[2] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eacsCard"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("START_EACS_BUTTON_TEXT"), &stru_10001C720, 0));
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = __60__RecoverDeviceUIExtensionRemoteViewController_showEACSCard__block_invoke_3;
  v47[3] = &unk_10001C460;
  v47[4] = *(_QWORD *)(a1 + 32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v33, 0, v47));
  v35 = objc_msgSend(v31, "addAction:", v34);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eacsCard"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("GO_BACK"), &stru_10001C720, 0));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = __60__RecoverDeviceUIExtensionRemoteViewController_showEACSCard__block_invoke_4;
  v46[3] = &unk_10001C460;
  v46[4] = *(_QWORD *)(a1 + 32);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v38, 1, v46));
  v40 = objc_msgSend(v36, "addAction:", v39);

  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavController"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eacsCard"));
  objc_msgSend(v41, "pushViewController:animated:", v42, 1);

}

id __60__RecoverDeviceUIExtensionRemoteViewController_showEACSCard__block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setEnabled:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "showEACSApprovalCard");
}

id __60__RecoverDeviceUIExtensionRemoteViewController_showEACSCard__block_invoke_4(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setEnabled:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "showMenuCard");
}

- (id)menuEACSButton
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  RecoverDeviceUIExtensionRemoteViewController *v20;
  NSAttributedStringKey v21;
  void *v22;

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __62__RecoverDeviceUIExtensionRemoteViewController_menuEACSButton__block_invoke;
  v18[3] = &unk_10001C568;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[PRXButton buttonWithProximityType:](PRXButton, "buttonWithProximityType:", 1));
  v19 = v3;
  v20 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v18));
  objc_msgSend(v3, "addAction:forControlEvents:", v4, 0x2000);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  objc_msgSend(v5, "setTitleAlignment:", 2);
  v6 = objc_alloc((Class)NSAttributedString);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MENU_EACS_BUTTON_TEXT"), &stru_10001C720, 0));
  v21 = NSFontAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 17.0, UIFontWeightMedium));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scaledFontForFont:compatibleWithTraitCollection:", v10, 0));
  v22 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
  v13 = objc_msgSend(v6, "initWithString:attributes:", v8, v12);

  objc_msgSend(v5, "setAttributedTitle:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v5, "setBaseForegroundColor:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward")));
  objc_msgSend(v5, "setImage:", v15);

  objc_msgSend(v5, "setImagePlacement:", 8);
  objc_msgSend(v5, "setImagePadding:", 10.0);
  objc_msgSend(v3, "setConfiguration:", v5);
  v16 = v3;

  return v16;
}

id __62__RecoverDeviceUIExtensionRemoteViewController_menuEACSButton__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "showEACSCard");
}

- (id)menuRebootButton
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  RecoverDeviceUIExtensionRemoteViewController *v19;
  NSAttributedStringKey v20;
  void *v21;

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __64__RecoverDeviceUIExtensionRemoteViewController_menuRebootButton__block_invoke;
  v17[3] = &unk_10001C568;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[PRXButton buttonWithProximityType:](PRXButton, "buttonWithProximityType:", 1));
  v18 = v3;
  v19 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v17));
  objc_msgSend(v3, "addAction:forControlEvents:", v4, 0x2000);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  objc_msgSend(v5, "setTitleAlignment:", 2);
  v6 = objc_alloc((Class)NSAttributedString);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MENU_REBOOT_BUTTON_TEXT"), &stru_10001C720, 0));
  v20 = NSFontAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 17.0, UIFontWeightMedium));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scaledFontForFont:compatibleWithTraitCollection:", v10, 0));
  v21 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  v13 = objc_msgSend(v6, "initWithString:attributes:", v8, v12);

  objc_msgSend(v5, "setAttributedTitle:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v5, "setBaseForegroundColor:", v14);

  objc_msgSend(v3, "setConfiguration:", v5);
  v15 = v3;

  return v15;
}

void __64__RecoverDeviceUIExtensionRemoteViewController_menuRebootButton__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  const __CFString *v10;
  const __CFString *v11;

  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "menuCard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "kLocalizedDeviceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("MENU_REBOOT_IN_PROGRESS_TEXT"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_10001C720, 0));
  objc_msgSend(v2, "showActivityIndicatorWithStatus:", v6);

  v7 = *(void **)(a1 + 40);
  v10 = CFSTR("NeRDCommand");
  v11 = CFSTR("NeRDCommandReboot");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __64__RecoverDeviceUIExtensionRemoteViewController_menuRebootButton__block_invoke_2;
  v9[3] = &unk_10001C590;
  v9[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "sendMessage:completionHandler:", v8, v9);

}

void __64__RecoverDeviceUIExtensionRemoteViewController_menuRebootButton__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint8_t v9[16];

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "logger"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "oslog"));

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "failed to send reboot command", v9, 2u);
    }

    v4 = *(void **)(a1 + 32);
    v7 = v3;
    v8 = 7;
  }
  else
  {
    v7 = 0;
    v8 = 8;
  }
  objc_msgSend(v4, "showOverallResultCard:resultType:", v7, v8);

}

- (void)menuOptionChosen:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  const __CFString *v11;
  const __CFString *v12;

  switch(a3)
  {
    case 4:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController menuCard](self, "menuCard"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("MENU_REBOOT_IN_PROGRESS_TEXT"), v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_10001C720, 0));
      objc_msgSend(v4, "showActivityIndicatorWithStatus:", v8);

      v11 = CFSTR("NeRDCommand");
      v12 = CFSTR("NeRDCommandReboot");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = __65__RecoverDeviceUIExtensionRemoteViewController_menuOptionChosen___block_invoke;
      v10[3] = &unk_10001C590;
      v10[4] = self;
      -[RecoverDeviceUIExtensionRemoteViewController sendMessage:completionHandler:](self, "sendMessage:completionHandler:", v9, v10);

      break;
    case 2:
      -[RecoverDeviceUIExtensionRemoteViewController showEACSCard](self, "showEACSCard");
      break;
    case 1:
      -[RecoverDeviceUIExtensionRemoteViewController showRecoveryCard](self, "showRecoveryCard");
      break;
  }
}

void __65__RecoverDeviceUIExtensionRemoteViewController_menuOptionChosen___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint8_t v9[16];

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "logger"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "oslog"));

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "failed to send reboot command", v9, 2u);
    }

    v4 = *(void **)(a1 + 32);
    v7 = v3;
    v8 = 7;
  }
  else
  {
    v7 = 0;
    v8 = 8;
  }
  objc_msgSend(v4, "showOverallResultCard:resultType:", v7, v8);

}

- (void)showMenuCard
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __60__RecoverDeviceUIExtensionRemoteViewController_showMenuCard__block_invoke;
  block[3] = &unk_10001C438;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __60__RecoverDeviceUIExtensionRemoteViewController_showMenuCard__block_invoke(uint64_t a1)
{
  RecoverDeviceMenuViewController *v2;
  void *v3;
  RecoverDeviceMenuViewController *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
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
  id v26;
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
  id v60;
  _QWORD v61[5];
  _QWORD v62[4];

  v2 = [RecoverDeviceMenuViewController alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "kLocalizedDeviceType"));
  v4 = -[RecoverDeviceMenuViewController initWithOptions:forDevice:](v2, "initWithOptions:forDevice:", 5, v3);
  objc_msgSend(*(id *)(a1 + 32), "setMenuViewController:", v4);

  v5 = objc_alloc((Class)PRXScrollableContentView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "menuViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tableView"));
  v60 = objc_msgSend(v5, "initWithCardStyle:scrollView:", 0, v7);

  v8 = objc_msgSend(objc_alloc((Class)PRXCardContentViewController), "initWithContentView:", v60);
  objc_msgSend(*(id *)(a1 + 32), "setMenuCard:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "menuCard"));
  objc_msgSend(v9, "setDismissalType:", 3);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MENU_CARD_TITLE"), &stru_10001C720, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "menuCard"));
  objc_msgSend(v12, "setTitle:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "kLocalizedDeviceType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("MENU_CARD_SUBTITLE"), v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_10001C720, 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "menuCard"));
  objc_msgSend(v17, "setSubtitle:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "menuCard"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "menuViewController"));
  objc_msgSend(v18, "addChildViewController:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "menuViewController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tableView"));
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "menuViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "menuCard"));
  objc_msgSend(v22, "didMoveToParentViewController:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "menuCard"));
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = __60__RecoverDeviceUIExtensionRemoteViewController_showMenuCard__block_invoke_2;
  v61[3] = &unk_10001C460;
  v61[4] = *(_QWORD *)(a1 + 32);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", CFSTR("Continue"), 0, v61));
  v26 = objc_msgSend(v24, "addAction:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "menuCard"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "actionButtons"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", 0));

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "menuCard"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "contentView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "mainContentGuide"));

  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "menuViewController"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "tableView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "topAnchor"));
  v58 = v33;
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintGreaterThanOrEqualToAnchor:", v55));
  v62[0] = v54;
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "menuViewController"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "tableView"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "bottomAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bottomAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintGreaterThanOrEqualToAnchor:", v49));
  v62[1] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "menuViewController"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "tableView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "trailingAnchor"));
  v35 = v30;
  v51 = v30;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v36));
  v62[2] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "menuViewController"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "tableView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v41));
  v62[3] = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v62, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavController"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "menuCard"));
  objc_msgSend(v44, "pushViewController:animated:", v45, 1);

}

void __60__RecoverDeviceUIExtensionRemoteViewController_showMenuCard__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "menuViewController"));
  objc_msgSend(v1, "menuOptionChosen:", objc_msgSend(v2, "selectedOption"));

}

- (void)handleOSRMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  RecoverDeviceUIExtensionRemoteViewController *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  id v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "oslog"));

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Got OSR message %@", buf, 0xCu);
  }

  if (-[RecoverDeviceUIExtensionRemoteViewController setupCompleted](self, "setupCompleted"))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NeRDState")));
    if (-[NSObject isEqual:](v7, "isEqual:", CFSTR("NeRDStateEACSSuccess")))
    {
      if (!-[RecoverDeviceUIExtensionRemoteViewController performingEACS](self, "performingEACS"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "oslog"));

        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not performing EACS, bug?", buf, 2u);
        }

      }
      -[RecoverDeviceUIExtensionRemoteViewController showOverallResultCard:resultType:](self, "showOverallResultCard:resultType:", 0, 6);
    }
    if (-[NSObject isEqual:](v7, "isEqual:", CFSTR("NeRDStateInstalled")))
    {
      -[RecoverDeviceUIExtensionRemoteViewController showOverallResultCard:resultType:](self, "showOverallResultCard:resultType:", 0, 4);
      goto LABEL_27;
    }
    if (-[NSObject isEqual:](v7, "isEqual:", CFSTR("NeRDStateEACSFailed")))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NeRDError")));
      v12 = v11;
      if (v11)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NeRDErrorDomain")));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("NeRDErrorCode")));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, objc_msgSend(v14, "integerValue"), 0));

      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TapToRecoverProxCardError"), 10005, 0));
      }
      v19 = self;
      v20 = v15;
      v21 = 5;
LABEL_26:
      -[RecoverDeviceUIExtensionRemoteViewController showOverallResultCard:resultType:](v19, "showOverallResultCard:resultType:", v20, v21);

      goto LABEL_27;
    }
    if (-[NSObject isEqual:](v7, "isEqual:", CFSTR("NeRDStateFailed")))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NeRDError")));
      v12 = v16;
      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("NeRDErrorDomain")));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("NeRDErrorCode")));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v17, objc_msgSend(v18, "integerValue"), 0));

      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TapToRecoverProxCardError"), 10005, 0));
      }
      v19 = self;
      v20 = v15;
      v21 = 2;
      goto LABEL_26;
    }
    if (-[RecoverDeviceUIExtensionRemoteViewController showingProgress](self, "showingProgress"))
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = __65__RecoverDeviceUIExtensionRemoteViewController_handleOSRMessage___block_invoke;
      v22[3] = &unk_10001C410;
      v22[4] = self;
      v23 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v22);

    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "oslog"));

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setup not completed, dropping message", buf, 2u);
    }
  }
LABEL_27:

}

id __65__RecoverDeviceUIExtensionRemoteViewController_handleOSRMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateProgressCardOnMainQueueWithInfo:", *(_QWORD *)(a1 + 40));
}

- (void)showOverallResultCard:(id)a3 resultType:(int)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController recoverDeviceOperationsQueue](self, "recoverDeviceOperationsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __81__RecoverDeviceUIExtensionRemoteViewController_showOverallResultCard_resultType___block_invoke;
  block[3] = &unk_10001C5E0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

void __81__RecoverDeviceUIExtensionRemoteViewController_showOverallResultCard_resultType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  objc_msgSend(*(id *)(a1 + 32), "setShowingProgress:", 0);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getOverallResultTitleStringForError:resultType:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48)));
  v3 = (void *)v20[5];
  v20[5] = v2;

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getOverallResultSubTitleStringForError:resultType:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48)));
  v5 = (void *)v14[5];
  v14[5] = v4;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __81__RecoverDeviceUIExtensionRemoteViewController_showOverallResultCard_resultType___block_invoke_448;
  block[3] = &unk_10001C5B8;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v6;
  v12 = *(_DWORD *)(a1 + 48);
  v9 = v7;
  v10 = &v19;
  v11 = &v13;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

}

void __81__RecoverDeviceUIExtensionRemoteViewController_showOverallResultCard_resultType___block_invoke_448(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  const __CFString *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[3];
  uint8_t buf[4];
  const __CFString *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  uint64_t v44;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "overallResultCard"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "oslog"));

  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already showing overall status, not showing again", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = CFSTR("Failure");
      v8 = *(_DWORD *)(a1 + 64);
      if (!v6)
        v7 = CFSTR("Success");
      *(_DWORD *)buf = 138412802;
      v40 = v7;
      v41 = 1024;
      v42 = v8;
      v43 = 2112;
      v44 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Overall status is %@, type:%d, err:%@", buf, 0x1Cu);
    }

    v4 = objc_alloc_init((Class)PRXIconContentViewController);
    objc_msgSend(*(id *)(a1 + 32), "setOverallResultCard:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "overallResultCard"));
    objc_msgSend(v9, "setDismissalType:", 3);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getOverallResultUIImageForError:resultType:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64)));
    v11 = *(void **)(a1 + 32);
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "overallResultCard"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentView"));
      objc_msgSend(v13, "addSubview:", v10);

      objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 72.0));
      objc_msgSend(v10, "setPreferredSymbolConfiguration:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "overallResultCard"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentView"));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mainContentGuide"));

      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject topAnchor](v17, "topAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintGreaterThanOrEqualToAnchor:", v36));
      v38[0] = v35;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject centerYAnchor](v17, "centerYAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v18));
      v38[1] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerXAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject centerXAnchor](v17, "centerXAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
      v38[2] = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 3));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "logger"));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "oslog"));

      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to get overallResult UIImage", buf, 2u);
      }
    }

    v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "overallResultCard"));
    objc_msgSend(v26, "setTitle:", v25);

    v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "overallResultCard"));
    objc_msgSend(v28, "setSubtitle:", v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "overallResultCard"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getOverallResultActionForError:resultType:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64)));
    v31 = objc_msgSend(v29, "addAction:", v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavController"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "overallResultCard"));
    objc_msgSend(v32, "pushViewController:animated:", v33, 1);

  }
}

- (void)updateCodeCardToSettingUpState
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController recoverDeviceOperationsQueue](self, "recoverDeviceOperationsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __78__RecoverDeviceUIExtensionRemoteViewController_updateCodeCardToSettingUpState__block_invoke;
  block[3] = &unk_10001C438;
  block[4] = self;
  dispatch_async(v3, block);

}

void __78__RecoverDeviceUIExtensionRemoteViewController_updateCodeCardToSettingUpState__block_invoke(uint64_t a1)
{
  id v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "setIgnoreAdditionalCodes:", 1);
  v2 = objc_alloc_init((Class)PRXIconContentViewController);
  objc_msgSend(*(id *)(a1 + 32), "setSettingUpDeviceCard:", v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __78__RecoverDeviceUIExtensionRemoteViewController_updateCodeCardToSettingUpState__block_invoke_2;
  block[3] = &unk_10001C438;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void __78__RecoverDeviceUIExtensionRemoteViewController_updateCodeCardToSettingUpState__block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "enterCodeCard"));
  objc_msgSend(v1, "showActivityIndicatorWithStatus:", &stru_10001C720);

}

- (BOOL)isCompanionSameDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  unsigned int v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
  v7 = objc_msgSend(v6, "containsString:", CFSTR("IPHONE"));
  if (v7)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "model"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uppercaseString"));
    if ((objc_msgSend(v4, "containsString:", CFSTR("IPHONE")) & 1) != 0)
    {
      v8 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
  if (objc_msgSend(v9, "containsString:", CFSTR("IPAD")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "model"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uppercaseString"));
    v8 = objc_msgSend(v12, "containsString:", CFSTR("IPAD"));

  }
  else
  {
    v8 = 0;
  }

  if (v7)
    goto LABEL_8;
LABEL_9:

  return v8;
}

- (void)showCollectCodeCard:(int)a3 inFlags:(unsigned int)a4 inThrottleSeconds:(int)a5
{
  NSObject *v8;
  _QWORD v9[5];
  unsigned int v10;
  int v11;

  v8 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController recoverDeviceOperationsQueue](self, "recoverDeviceOperationsQueue", *(_QWORD *)&a3));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __94__RecoverDeviceUIExtensionRemoteViewController_showCollectCodeCard_inFlags_inThrottleSeconds___block_invoke;
  v9[3] = &unk_10001C630;
  v9[4] = self;
  v10 = a4;
  v11 = a5;
  dispatch_async(v8, v9);

}

void __94__RecoverDeviceUIExtensionRemoteViewController_showCollectCodeCard_inFlags_inThrottleSeconds___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[6];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oslog"));

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Got request to show code card", buf, 2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __94__RecoverDeviceUIExtensionRemoteViewController_showCollectCodeCard_inFlags_inThrottleSeconds___block_invoke_453;
  v4[3] = &unk_10001C630;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = *(_QWORD *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

void __94__RecoverDeviceUIExtensionRemoteViewController_showCollectCodeCard_inFlags_inThrottleSeconds___block_invoke_453(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[5];
  uint8_t buf[4];
  int v68;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "enterCodeCard"));

  if (!v2)
  {
    v3 = objc_alloc_init((Class)PRXPasscodeEntryViewController);
    objc_msgSend(*(id *)(a1 + 32), "setEnterCodeCard:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "enterCodeCard"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AUTHENTICATION_CARD_TITLE"), &stru_10001C720, 0));
    objc_msgSend(v4, "setTitle:", v6);

    LODWORD(v5) = objc_msgSend(*(id *)(a1 + 32), "isCompanionSameDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "enterCodeCard"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "kLocalizedDeviceType"));
    v10 = (void *)v9;
    v11 = CFSTR("AUTHENTICATION_CARD_DESCRIPTION");
    if ((_DWORD)v5)
      v11 = CFSTR("AUTHENTICATION_CARD_DESCRIPTION_OTHER");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v11, v9));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v12, &stru_10001C720, 0));
    objc_msgSend(v7, "setSubtitle:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "enterCodeCard"));
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = __94__RecoverDeviceUIExtensionRemoteViewController_showCollectCodeCard_inFlags_inThrottleSeconds___block_invoke_2;
    v66[3] = &unk_10001C608;
    v66[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v14, "setTextEntryCompletionHandler:", v66);
    objc_msgSend(v14, "setNumberOfDigits:", 6);
    objc_msgSend(v14, "setDismissalType:", 3);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "visibleViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "enterCodeCard"));

  v18 = *(void **)(a1 + 32);
  if (v16 == v17)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "logger"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "oslog"));

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Passcode card already visible", buf, 2u);
    }
  }
  else
  {
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "proxCardNavController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "enterCodeCard"));
    -[NSObject pushViewController:animated:](v19, "pushViewController:animated:", v20, 1);

  }
  v22 = *(_DWORD *)(a1 + 40);
  if ((v22 & 0x20000) != 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "oslog"));

    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = *(_DWORD *)(a1 + 44);
      *(_DWORD *)buf = 67109120;
      v68 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Additional authentication attempts throttled for an additional %d seconds", buf, 8u);
    }

    v40 = *(void **)(a1 + 32);
    if (*(int *)(a1 + 44) >= 1)
    {
      if ((objc_msgSend(v40, "ignoreAdditionalCodes") & 1) == 0)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "enterCodeCard"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "passcodeEntryView"));
        objc_msgSend(v42, "setText:", &stru_10001C720);

        objc_msgSend(*(id *)(a1 + 32), "setIgnoreAdditionalCodes:", 1);
      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "kLocalizedDeviceType"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("INVALID_CODE_ENTERED_THROTTLED"), v44));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", v45, &stru_10001C720, 0));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v46, *(unsigned int *)(a1 + 44)));

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "enterCodeCard"));
      objc_msgSend(v36, "setSubtitle:", v34);
      goto LABEL_30;
    }
    objc_msgSend(v40, "setIgnoreAdditionalCodes:", 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
    v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "oslog"));

    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "No longer throttled. Can accept new code now", buf, 2u);
    }

    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "enterCodeCard"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "kLocalizedDeviceType"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("INVALID_CODE_ENTERED"), v55));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "localizedStringForKey:value:table:", v56, &stru_10001C720, 0));
    objc_msgSend(v53, "setSubtitle:", v57);

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "enterCodeCard"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "passcodeEntryView"));
    v36 = v35;
LABEL_29:
    objc_msgSend(v35, "setText:", &stru_10001C720);
LABEL_30:

    goto LABEL_31;
  }
  v23 = *(void **)(a1 + 32);
  if ((v22 & 0x10000) == 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "logger"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "oslog"));

    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Not throttled and no error. Setting subtitle back to default", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setIgnoreAdditionalCodes:", 0);
    v26 = objc_msgSend(*(id *)(a1 + 32), "isCompanionSameDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "enterCodeCard"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "kLocalizedDeviceType"));
    v30 = (void *)v29;
    v31 = CFSTR("AUTHENTICATION_CARD_DESCRIPTION");
    if (v26)
      v31 = CFSTR("AUTHENTICATION_CARD_DESCRIPTION_OTHER");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v31, v29));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", v32, &stru_10001C720, 0));
    objc_msgSend(v27, "setSubtitle:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "enterCodeCard"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "passcodeEntryView"));
    v36 = v35;
    goto LABEL_29;
  }
  v47 = objc_msgSend(v23, "authenticationAttempt");
  v48 = *(void **)(a1 + 32);
  if ((unint64_t)v47 < 5)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "enterCodeCard"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "passcodeEntryView"));
    objc_msgSend(v59, "setText:", &stru_10001C720);

    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
    v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "oslog"));

    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Previously entered passcode was incorrect", buf, 2u);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "enterCodeCard"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "kLocalizedDeviceType"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("INVALID_CODE_ENTERED"), v63));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "localizedStringForKey:value:table:", v64, &stru_10001C720, 0));
    objc_msgSend(v34, "setSubtitle:", v65);

  }
  else
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "logger"));
    v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "oslog"));

    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Too many incorrect passcode attempts", buf, 2u);
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TapToRecoverProxCardError"), 10000, 0));
    objc_msgSend(*(id *)(a1 + 32), "showOverallResultCard:resultType:", v34, 0);
  }
LABEL_31:

}

void __94__RecoverDeviceUIExtensionRemoteViewController_showCollectCodeCard_inFlags_inThrottleSeconds___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  unsigned int v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "ignoreAdditionalCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "oslog"));

  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      v14 = 138412290;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ignoring user entered code %@ due to flag", (uint8_t *)&v14, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "enterCodeCard"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "passcodeEntryView"));
    objc_msgSend(v9, "setText:", &stru_10001C720);

  }
  else
  {
    if (v7)
    {
      v14 = 138412290;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User entered code %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setAuthenticationAttempt:", (char *)objc_msgSend(*(id *)(a1 + 32), "authenticationAttempt") + 1);
    v10 = objc_msgSend(*(id *)(a1 + 32), "authenticationAttempt");
    v11 = *(void **)(a1 + 32);
    if ((unint64_t)v10 < 5)
    {
      objc_msgSend(v11, "waitForServerResponse");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupkitClient"));
      objc_msgSend(v8, "tryPassword:", v3);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "logger"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "oslog"));

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Too many passcode attempts", (uint8_t *)&v14, 2u);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TapToRecoverProxCardError"), 10000, 0));
      objc_msgSend(*(id *)(a1 + 32), "showOverallResultCard:resultType:", v8, 0);
    }
  }

}

- (void)recoverButtonPressed
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController recoverDeviceOperationsQueue](self, "recoverDeviceOperationsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __68__RecoverDeviceUIExtensionRemoteViewController_recoverButtonPressed__block_invoke;
  block[3] = &unk_10001C438;
  block[4] = self;
  dispatch_async(v3, block);

}

void __68__RecoverDeviceUIExtensionRemoteViewController_recoverButtonPressed__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[4];
  uint64_t v7;
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oslog"));

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User asked to recover remote device", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupkitClient"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __68__RecoverDeviceUIExtensionRemoteViewController_recoverButtonPressed__block_invoke_466;
  v6[3] = &unk_10001C658;
  v7 = *(_QWORD *)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __68__RecoverDeviceUIExtensionRemoteViewController_recoverButtonPressed__block_invoke_2;
  v5[3] = &unk_10001C590;
  v5[4] = v7;
  objc_msgSend(v4, "registerEventID:options:eventHandler:completionHandler:", CFSTR("osrEventID"), 0, v6, v5);

}

id __68__RecoverDeviceUIExtensionRemoteViewController_recoverButtonPressed__block_invoke_466(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleOSRMessage:");
}

void __68__RecoverDeviceUIExtensionRemoteViewController_recoverButtonPressed__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "logger"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "oslog"));

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed registering for osr events", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "showOverallResultCard:resultType:", v3, 0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "setupkitClient"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __68__RecoverDeviceUIExtensionRemoteViewController_recoverButtonPressed__block_invoke_468;
    v8[3] = &unk_10001C590;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "activateWithCompletion:", v8);

  }
}

void __68__RecoverDeviceUIExtensionRemoteViewController_recoverButtonPressed__block_invoke_468(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "code");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "oslog"));

    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5 == (id)-6721)
    {
      if (v8)
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setupkit client is already activated.", (uint8_t *)&v11, 2u);
      }

    }
    else
    {
      if (v8)
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to activate setupkit client: %@", (uint8_t *)&v11, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "showOverallResultCard:resultType:", v4, 0);
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "oslog"));

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully activated setupkit client", (uint8_t *)&v11, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "waitForServerResponse");
  }

}

- (id)notNowButtonAction
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOT_NOW"), &stru_10001C720, 0));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __66__RecoverDeviceUIExtensionRemoteViewController_notNowButtonAction__block_invoke;
  v7[3] = &unk_10001C460;
  v7[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v4, 1, v7));

  return v5;
}

void __66__RecoverDeviceUIExtensionRemoteViewController_notNowButtonAction__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __66__RecoverDeviceUIExtensionRemoteViewController_notNowButtonAction__block_invoke_2;
  block[3] = &unk_10001C438;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __66__RecoverDeviceUIExtensionRemoteViewController_notNowButtonAction__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oslog"));

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissing card by user request", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavController"));
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)showLearnMoreCard
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController recoverDeviceOperationsQueue](self, "recoverDeviceOperationsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __65__RecoverDeviceUIExtensionRemoteViewController_showLearnMoreCard__block_invoke;
  block[3] = &unk_10001C438;
  block[4] = self;
  dispatch_async(v3, block);

}

void __65__RecoverDeviceUIExtensionRemoteViewController_showLearnMoreCard__block_invoke(uint64_t a1)
{
  id v2;
  _QWORD block[5];

  v2 = objc_alloc_init((Class)PRXIconContentViewController);
  objc_msgSend(*(id *)(a1 + 32), "setLearnMoreCard:", v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __65__RecoverDeviceUIExtensionRemoteViewController_showLearnMoreCard__block_invoke_2;
  block[3] = &unk_10001C438;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void __65__RecoverDeviceUIExtensionRemoteViewController_showLearnMoreCard__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "learnMoreCard"));
  objc_msgSend(v2, "setDismissalType:", 3);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE_TITLE"), &stru_10001C720, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "learnMoreCard"));
  objc_msgSend(v5, "setTitle:", v4);

  LODWORD(v4) = objc_msgSend(*(id *)(a1 + 32), "useAlternateStringForWiFI");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if ((_DWORD)v4)
    v7 = CFSTR("LEARN_MORE_SUBTITLE_WLAN");
  else
    v7 = CFSTR("LEARN_MORE_SUBTITLE");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "kLocalizedDeviceType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v8, v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v10, &stru_10001C720, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "learnMoreCard"));
  objc_msgSend(v12, "setSubtitle:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "learnMoreCard"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recoverButtonAction"));
  v15 = objc_msgSend(v13, "addAction:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "learnMoreCard"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "notNowButtonAction"));
  v18 = objc_msgSend(v16, "addAction:", v17);

  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxCardNavController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "learnMoreCard"));
  objc_msgSend(v20, "pushViewController:animated:", v19, 1);

}

- (id)recoverButtonAction
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CONTINUE_BUTTON_TEXT"), &stru_10001C720, 0));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __67__RecoverDeviceUIExtensionRemoteViewController_recoverButtonAction__block_invoke;
  v7[3] = &unk_10001C460;
  v7[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v4, 0, v7));

  return v5;
}

id __67__RecoverDeviceUIExtensionRemoteViewController_recoverButtonAction__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "setEnabled:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "initialCard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAIN_CARD_CONNECTING"), &stru_10001C720, 0));
  objc_msgSend(v3, "showActivityIndicatorWithStatus:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "recoverButtonPressed");
}

- (id)learnMoreButtonAction
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE_BUTTON_TEXT"), &stru_10001C720, 0));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __69__RecoverDeviceUIExtensionRemoteViewController_learnMoreButtonAction__block_invoke;
  v7[3] = &unk_10001C460;
  v7[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v4, 1, v7));

  return v5;
}

id __69__RecoverDeviceUIExtensionRemoteViewController_learnMoreButtonAction__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setEnabled:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "showLearnMoreCard");
}

- (void)setInitialCardForSetup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
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
  _QWORD v47[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("MAIN_CARD_TITLE"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_10001C720, 0));

  if (-[RecoverDeviceUIExtensionRemoteViewController extendedMode](self, "extendedMode"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("MAIN_CARD_TITLE_EXT"), v8));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_10001C720, 0));

    v6 = (void *)v10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController initialCard](self, "initialCard"));
  objc_msgSend(v11, "setTitle:", v6);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("MAIN_CARD_DESCRIPTION")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v13, v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v15, &stru_10001C720, 0));

  v46 = v6;
  if (os_variant_has_internal_content("RecoverDeviceUI"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_10001C720, 0));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("[Internal Only]: Please put %@ into DFU and restore"), v19));

    v16 = (void *)v20;
  }
  v43 = v16;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController initialCard](self, "initialCard"));
  objc_msgSend(v21, "setSubtitle:", v16);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController initialCard](self, "initialCard"));
  objc_msgSend(v22, "setDismissalType:", 3);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController initialCard](self, "initialCard"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController recoverButtonAction](self, "recoverButtonAction"));
  v25 = objc_msgSend(v23, "addAction:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController initialCard](self, "initialCard"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController learnMoreButtonAction](self, "learnMoreButtonAction"));
  v28 = objc_msgSend(v26, "addAction:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController uiImage](self, "uiImage"));
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController initialCard](self, "initialCard"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "contentView"));
  objc_msgSend(v31, "addSubview:", v29);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController initialCard](self, "initialCard"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "contentView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "mainContentGuide"));

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintGreaterThanOrEqualToAnchor:", v44));
  v47[0] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "centerYAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "centerYAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v37));
  v47[1] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "centerXAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "centerXAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
  v47[2] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v42);

}

- (void)setInitialCardForResume
{
  void *v3;
  void *v4;
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
  _QWORD v30[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController initialCard](self, "initialCard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("MAIN_CARD_TITLE_EXT"), v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_10001C720, 0));
  objc_msgSend(v3, "setTitle:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController initialCard](self, "initialCard"));
  objc_msgSend(v8, "setDismissalType:", 3);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController uiImage](self, "uiImage"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController initialCard](self, "initialCard"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentView"));
  objc_msgSend(v11, "addSubview:", v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController initialCard](self, "initialCard"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mainContentGuide"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintGreaterThanOrEqualToAnchor:", v27));
  v30[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerYAnchor"));
  v17 = v14;
  v29 = v14;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerYAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  v30[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerXAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerXAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
  v30[2] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController initialCard](self, "initialCard"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("MAIN_CARD_CONNECTING"), &stru_10001C720, 0));
  objc_msgSend(v24, "showActivityIndicatorWithStatus:", v26);

}

- (void)viewDidLoad
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RecoverDeviceUIExtensionRemoteViewController;
  -[RecoverDeviceUIExtensionRemoteViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "oslog"));

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "RecoverDeviceUI ViewDidLoad", v5, 2u);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[16];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "oslog"));

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "RecoverDeviceUI ViewDidAppear", buf, 2u);
  }

  v7 = objc_alloc_init((Class)PRXIconContentViewController);
  -[RecoverDeviceUIExtensionRemoteViewController setInitialCard:](self, "setInitialCard:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController setupkitClient](self, "setupkitClient"));
  v9 = objc_msgSend(v8, "skipWifi");

  if ((v9 & 1) != 0)
    -[RecoverDeviceUIExtensionRemoteViewController setInitialCardForResume](self, "setInitialCardForResume");
  else
    -[RecoverDeviceUIExtensionRemoteViewController setInitialCardForSetup](self, "setInitialCardForSetup");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "oslog"));

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to display first prox card", buf, 2u);
  }

  v15.receiver = self;
  v15.super_class = (Class)RecoverDeviceUIExtensionRemoteViewController;
  -[RecoverDeviceUIExtensionRemoteViewController viewDidAppear:](&v15, "viewDidAppear:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController initialCard](self, "initialCard"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController presentProxCardFlowWithDelegate:initialViewController:](self, "presentProxCardFlowWithDelegate:initialViewController:", self, v12));
  -[RecoverDeviceUIExtensionRemoteViewController setProxCardNavController:](self, "setProxCardNavController:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController setupkitClient](self, "setupkitClient"));
  LODWORD(v13) = objc_msgSend(v14, "skipWifi");

  if ((_DWORD)v13)
    -[RecoverDeviceUIExtensionRemoteViewController recoverButtonPressed](self, "recoverButtonPressed");

}

- (id)uiImage
{
  void *v3;
  unsigned int v4;
  id v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_TYPE_WATCH"));

  if (!v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("DEVICE_TYPE_ATV"));

    if (v9)
    {
      v5 = objc_alloc((Class)UIImageView);
      v10 = CFSTR("appletv.badge.exclamationmark");
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("DEVICE_TYPE_VISION"));

      if (v12)
      {
        v5 = objc_alloc((Class)UIImageView);
        v10 = CFSTR("visionpro.badge.exclamationmark");
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("DEVICE_TYPE_IPHONE"));

        if (v14)
        {
          v5 = objc_alloc((Class)UIImageView);
          v10 = CFSTR("iphone.badge.exclamationmark");
        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController kLocalizedDeviceType](self, "kLocalizedDeviceType"));
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("DEVICE_TYPE_IPAD"));

          v5 = objc_alloc((Class)UIImageView);
          if (!v16)
          {
            v6 = CFSTR("xmark.octagon.fill");
            goto LABEL_3;
          }
          v10 = CFSTR("ipad.badge.exclamationmark");
        }
      }
    }
    v7 = objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", v10));
    goto LABEL_13;
  }
  v5 = objc_alloc((Class)UIImageView);
  v6 = CFSTR("exclamationmark.applewatch");
LABEL_3:
  v7 = objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v6));
LABEL_13:
  v17 = (void *)v7;
  v18 = objc_msgSend(v5, "initWithImage:", v7);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color"));
  objc_msgSend(v18, "setTintColor:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 120.0));
  objc_msgSend(v18, "setPreferredSymbolConfiguration:", v20);

  return v18;
}

- (void)setupStop
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController recoverDeviceOperationsQueue](self, "recoverDeviceOperationsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __57__RecoverDeviceUIExtensionRemoteViewController_setupStop__block_invoke;
  block[3] = &unk_10001C438;
  block[4] = self;
  dispatch_async(v3, block);

}

void __57__RecoverDeviceUIExtensionRemoteViewController_setupStop__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupkitClient"));

  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "oslog"));

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "setupkitClient exist. Invalidating client", v8, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupkitClient"));
    objc_msgSend(v5, "deregisterEventID:completionHandler:", CFSTR("osrEventID"), &__block_literal_global_508);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupkitClient"));
    objc_msgSend(v6, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "setSetupkitClient:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupTimer"));
    objc_msgSend(v7, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "setSetupTimer:", 0);
  }
}

- (void)waitForServerResponse
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController recoverDeviceOperationsQueue](self, "recoverDeviceOperationsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __69__RecoverDeviceUIExtensionRemoteViewController_waitForServerResponse__block_invoke;
  block[3] = &unk_10001C438;
  block[4] = self;
  dispatch_async(v3, block);

}

void __69__RecoverDeviceUIExtensionRemoteViewController_waitForServerResponse__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oslog"));

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "will wait for server response", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupTimer"));
  objc_msgSend(v4, "invalidate");

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __69__RecoverDeviceUIExtensionRemoteViewController_waitForServerResponse__block_invoke_510;
  v8[3] = &unk_10001C6C0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:repeats:block:](NSTimer, "timerWithTimeInterval:repeats:block:", 0, v8, 10.0));
  objc_msgSend(*(id *)(a1 + 32), "setSetupTimer:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupTimer"));
  objc_msgSend(v6, "addTimer:forMode:", v7, NSRunLoopCommonModes);

}

void __69__RecoverDeviceUIExtensionRemoteViewController_waitForServerResponse__block_invoke_510(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oslog"));

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "timed out waiting for server response", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setupStop");
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recoverDeviceOperationsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __69__RecoverDeviceUIExtensionRemoteViewController_waitForServerResponse__block_invoke_511;
  block[3] = &unk_10001C438;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v4, block);

}

void __69__RecoverDeviceUIExtensionRemoteViewController_waitForServerResponse__block_invoke_511(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TapToRecoverProxCardError"), 10004, 0));
  objc_msgSend(v1, "showOverallResultCard:resultType:", v2, 3);

}

- (void)doneWaitingForServerResponse
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController recoverDeviceOperationsQueue](self, "recoverDeviceOperationsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __76__RecoverDeviceUIExtensionRemoteViewController_doneWaitingForServerResponse__block_invoke;
  block[3] = &unk_10001C438;
  block[4] = self;
  dispatch_async(v3, block);

}

id __76__RecoverDeviceUIExtensionRemoteViewController_doneWaitingForServerResponse__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v6[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oslog"));

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "done waiting for server response", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setupTimer"));
  objc_msgSend(v4, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "setSetupTimer:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RecoverDeviceUIExtensionRemoteViewController;
  -[RecoverDeviceUIExtensionRemoteViewController viewDidDisappear:](&v7, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController logger](self, "logger"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "oslog"));

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RecoverDeviceUI ViewDidDissapear", v6, 2u);
  }

  -[RecoverDeviceUIExtensionRemoteViewController setupStop](self, "setupStop");
}

- (void)proxCardFlowWillPresent
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "setStatusBarHidden:withDuration:", 1, 0.0);

}

- (void)proxCardFlowDidDismiss
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RecoverDeviceUIExtensionRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "dismiss");

}

- (unint64_t)supportedInterfaceOrientations
{
  return PRXSupportedInterfaceOrientations(self, 1);
}

- (UINavigationController)proxCardNavController
{
  return self->_proxCardNavController;
}

- (void)setProxCardNavController:(id)a3
{
  objc_storeStrong((id *)&self->_proxCardNavController, a3);
}

- (CBDevice)deviceObj
{
  return self->_deviceObj;
}

- (void)setDeviceObj:(id)a3
{
  objc_storeStrong((id *)&self->_deviceObj, a3);
}

- (NSString)kLocalizedDeviceType
{
  return self->_kLocalizedDeviceType;
}

- (void)setKLocalizedDeviceType:(id)a3
{
  objc_storeStrong((id *)&self->_kLocalizedDeviceType, a3);
}

- (SKSetupClient)setupkitClient
{
  return self->_setupkitClient;
}

- (void)setSetupkitClient:(id)a3
{
  objc_storeStrong((id *)&self->_setupkitClient, a3);
}

- (SKDevice)setupkitDevice
{
  return self->_setupkitDevice;
}

- (void)setSetupkitDevice:(id)a3
{
  objc_storeStrong((id *)&self->_setupkitDevice, a3);
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (OS_dispatch_queue)recoverDeviceOperationsQueue
{
  return self->_recoverDeviceOperationsQueue;
}

- (PRXCardContentViewController)initialCard
{
  return self->_initialCard;
}

- (void)setInitialCard:(id)a3
{
  objc_storeStrong((id *)&self->_initialCard, a3);
}

- (PRXCardContentViewController)learnMoreCard
{
  return self->_learnMoreCard;
}

- (void)setLearnMoreCard:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreCard, a3);
}

- (PRXCardContentViewController)enterCodeCard
{
  return self->_enterCodeCard;
}

- (void)setEnterCodeCard:(id)a3
{
  objc_storeStrong((id *)&self->_enterCodeCard, a3);
}

- (PRXCardContentViewController)settingUpDeviceCard
{
  return self->_settingUpDeviceCard;
}

- (void)setSettingUpDeviceCard:(id)a3
{
  objc_storeStrong((id *)&self->_settingUpDeviceCard, a3);
}

- (PRXCardContentViewController)progressCard
{
  return self->_progressCard;
}

- (void)setProgressCard:(id)a3
{
  objc_storeStrong((id *)&self->_progressCard, a3);
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (UILabel)progressText
{
  return self->_progressText;
}

- (void)setProgressText:(id)a3
{
  objc_storeStrong((id *)&self->_progressText, a3);
}

- (PRXCardContentViewController)menuCard
{
  return self->_menuCard;
}

- (void)setMenuCard:(id)a3
{
  objc_storeStrong((id *)&self->_menuCard, a3);
}

- (RecoverDeviceMenuViewController)menuViewController
{
  return self->_menuViewController;
}

- (void)setMenuViewController:(id)a3
{
  objc_storeStrong((id *)&self->_menuViewController, a3);
}

- (PRXCardContentViewController)recoveryCard
{
  return self->_recoveryCard;
}

- (void)setRecoveryCard:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryCard, a3);
}

- (PRXCardContentViewController)eacsCard
{
  return self->_eacsCard;
}

- (void)setEacsCard:(id)a3
{
  objc_storeStrong((id *)&self->_eacsCard, a3);
}

- (PRXCardContentViewController)eacsApprovalCard
{
  return self->_eacsApprovalCard;
}

- (void)setEacsApprovalCard:(id)a3
{
  objc_storeStrong((id *)&self->_eacsApprovalCard, a3);
}

- (PRXCardContentViewController)overallResultCard
{
  return self->_overallResultCard;
}

- (void)setOverallResultCard:(id)a3
{
  objc_storeStrong((id *)&self->_overallResultCard, a3);
}

- (unint64_t)authenticationAttempt
{
  return self->_authenticationAttempt;
}

- (void)setAuthenticationAttempt:(unint64_t)a3
{
  self->_authenticationAttempt = a3;
}

- (BOOL)setupCompleted
{
  return self->_setupCompleted;
}

- (void)setSetupCompleted:(BOOL)a3
{
  self->_setupCompleted = a3;
}

- (BOOL)recoveryCompleted
{
  return self->_recoveryCompleted;
}

- (void)setRecoveryCompleted:(BOOL)a3
{
  self->_recoveryCompleted = a3;
}

- (BOOL)ignoreAdditionalCodes
{
  return self->_ignoreAdditionalCodes;
}

- (void)setIgnoreAdditionalCodes:(BOOL)a3
{
  self->_ignoreAdditionalCodes = a3;
}

- (BOOL)showingProgress
{
  return self->_showingProgress;
}

- (void)setShowingProgress:(BOOL)a3
{
  self->_showingProgress = a3;
}

- (BOOL)performingEACS
{
  return self->_performingEACS;
}

- (void)setPerformingEACS:(BOOL)a3
{
  self->_performingEACS = a3;
}

- (BOOL)extendedMode
{
  return self->_extendedMode;
}

- (void)setExtendedMode:(BOOL)a3
{
  self->_extendedMode = a3;
}

- (NSDictionary)serverConfig
{
  return self->_serverConfig;
}

- (void)setServerConfig:(id)a3
{
  objc_storeStrong((id *)&self->_serverConfig, a3);
}

- (NSTimer)setupTimer
{
  return self->_setupTimer;
}

- (void)setSetupTimer:(id)a3
{
  objc_storeStrong((id *)&self->_setupTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupTimer, 0);
  objc_storeStrong((id *)&self->_serverConfig, 0);
  objc_storeStrong((id *)&self->_overallResultCard, 0);
  objc_storeStrong((id *)&self->_eacsApprovalCard, 0);
  objc_storeStrong((id *)&self->_eacsCard, 0);
  objc_storeStrong((id *)&self->_recoveryCard, 0);
  objc_storeStrong((id *)&self->_menuViewController, 0);
  objc_storeStrong((id *)&self->_menuCard, 0);
  objc_storeStrong((id *)&self->_progressText, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_progressCard, 0);
  objc_storeStrong((id *)&self->_settingUpDeviceCard, 0);
  objc_storeStrong((id *)&self->_enterCodeCard, 0);
  objc_storeStrong((id *)&self->_learnMoreCard, 0);
  objc_storeStrong((id *)&self->_initialCard, 0);
  objc_storeStrong((id *)&self->_recoverDeviceOperationsQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_setupkitDevice, 0);
  objc_storeStrong((id *)&self->_setupkitClient, 0);
  objc_storeStrong((id *)&self->_kLocalizedDeviceType, 0);
  objc_storeStrong((id *)&self->_deviceObj, 0);
  objc_storeStrong((id *)&self->_proxCardNavController, 0);
}

@end
