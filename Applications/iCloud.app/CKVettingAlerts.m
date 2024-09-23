@implementation CKVettingAlerts

+ (id)alertContentForFirstJoinAlertWithRecordName:(id)a3 appName:(id)a4 bundleID:(id)a5 shareMetadata:(id)a6 currentUserName:(id)a7 currentUserFormattedUsername:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  unsigned int v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  SEL v91;
  SEL v92;
  id v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  _QWORD v100[2];
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[2];

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v99 = a7;
  v98 = a8;
  v18 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "containerID"));
  v22 = (unint64_t)objc_msgSend(v21, "specialContainerType");

  if (v22 <= 0x1D)
  {
    if (((1 << v22) & 0x32200000) != 0)
    {
      v91 = a2;
      v93 = a1;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "share"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CKShareTypeKey));

      v95 = v20;
      if (objc_msgSend(v20, "length"))
      {
        v31 = v15;
        v32 = sub_10000ED90(CFSTR("TITLED_DOCUMENT_OPEN_TITLE"), CFSTR("%@%@"), v25, v26, v27, v28, v29, v30, (uint64_t)v20);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      }
      else
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts appSpecificLocKeyForBundleID:shareType:prefix:](CKVettingAlerts, "appSpecificLocKeyForBundleID:shareType:prefix:", v16, v24, CFSTR("UNTITLED_DOCUMENT_OPEN_TITLE_")));
        v31 = v15;
        v41 = sub_10000ED90(v34, CFSTR("%@"), v35, v36, v37, v38, v39, v40, (uint64_t)v15);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v41);

      }
      v96 = v16;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts appSpecificLocKeyForBundleID:shareType:prefix:](CKVettingAlerts, "appSpecificLocKeyForBundleID:shareType:prefix:", v16, v24, CFSTR("PRIVATE_DOCUMENT_OPEN_BODY_")));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ownerIdentity"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "nameComponents"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts mediumNameFromComponents:](CKVettingAlerts, "mediumNameFromComponents:", v44));
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts mediumNameFromComponents:](CKVettingAlerts, "mediumNameFromComponents:", v99));
      v52 = sub_10000ED90(v42, CFSTR("%@%@%@"), v46, v47, v48, v49, v50, v51, (uint64_t)v45);
      v53 = (void *)objc_claimAutoreleasedReturnValue(v52);

      v15 = v31;
      if (!v33 || !v53)
      {
        v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v87, "handleFailureInMethod:object:file:lineNumber:description:", v91, v93, CFSTR("CKVettingAlerts.m"), 101, CFSTR("Failed to construct alertTitle: %@ and/or alertBody: %@ for %@"), v33, v53, v31);

      }
      v102[0] = CFSTR("ckVettingAlertTitle");
      v102[1] = CFSTR("ckVettingAlertBody");
      v103[0] = v33;
      v103[1] = v53;
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v103, v102, 2));

      v20 = v95;
      v16 = v96;
      goto LABEL_9;
    }
    if (v22 == 4)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CKVettingAlerts.m"), 77, CFSTR("ShareAcceptor isn't responsible for iWork FirstJoinAlert"));

      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CKVettingAlerts.m"), 131, CFSTR("Appeasing the compiler, should never get here"));

      v54 = &__NSDictionary0__struct;
      goto LABEL_9;
    }
  }
  v92 = a2;
  v97 = v16;
  v94 = a1;
  if (objc_msgSend(v20, "length"))
    v64 = sub_10000ED90(CFSTR("TITLED_NONIWORK_DOCUMENT_OPEN_TITLE"), CFSTR("%@"), v58, v59, v60, v61, v62, v63, (uint64_t)v20);
  else
    v64 = sub_10000ED90(CFSTR("UNTITLED_NONIWORK_DOCUMENT_OPEN_TITLE"), CFSTR("%@"), v58, v59, v60, v61, v62, v63, (uint64_t)v15);
  v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "share"));
  v67 = objc_msgSend(v66, "allowsAnonymousPublicAccess");

  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ownerIdentity"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "nameComponents"));
  v70 = objc_claimAutoreleasedReturnValue(+[CKVettingAlerts mediumNameFromComponents:](CKVettingAlerts, "mediumNameFromComponents:", v69));
  v77 = (void *)v70;
  if (v67)
  {
    v78 = sub_10000ED90(CFSTR("PUBLIC_ANONYMOUS_SHARING_OPEN_BODY"), CFSTR("%@"), v71, v72, v73, v74, v75, v76, v70);
    v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
  }
  else
  {
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts mediumNameFromComponents:](CKVettingAlerts, "mediumNameFromComponents:", v99));
    v86 = sub_10000ED90(CFSTR("GENERIC_APP_SHARING_OPEN_BODY"), CFSTR("%@%@%@"), v80, v81, v82, v83, v84, v85, (uint64_t)v77);
    v79 = (void *)objc_claimAutoreleasedReturnValue(v86);

  }
  if (!v65 || !v79)
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v88, "handleFailureInMethod:object:file:lineNumber:description:", v92, v94, CFSTR("CKVettingAlerts.m"), 126, CFSTR("Filed to construct alertTitle: %@ and/or alertBody: %@ for generic share"), v65, v79);

  }
  v100[0] = CFSTR("ckVettingAlertTitle");
  v100[1] = CFSTR("ckVettingAlertBody");
  v101[0] = v65;
  v101[1] = v79;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v101, v100, 2));

  v16 = v97;
LABEL_9:

  return v54;
}

+ (id)alertContentForFullVettingBindingPromptWithBundleID:(id)a3 shareName:(id)a4 ownerName:(id)a5 shareType:(id)a6 isSourceICS:(BOOL)a7
{
  return +[CKVettingAlerts _alertContentForVettingBindingPromptWithBundleID:shareName:ownerName:shareType:isShortcut:isSourceICS:](CKVettingAlerts, "_alertContentForVettingBindingPromptWithBundleID:shareName:ownerName:shareType:isShortcut:isSourceICS:", a3, a4, a5, a6, 0, a7);
}

+ (id)alertContentForShortcutVettingBindingPromptWithBundleID:(id)a3 shareName:(id)a4 ownerName:(id)a5 shareType:(id)a6 isSourceICS:(BOOL)a7
{
  return +[CKVettingAlerts _alertContentForVettingBindingPromptWithBundleID:shareName:ownerName:shareType:isShortcut:isSourceICS:](CKVettingAlerts, "_alertContentForVettingBindingPromptWithBundleID:shareName:ownerName:shareType:isShortcut:isSourceICS:", a3, a4, a5, a6, 1, a7);
}

+ (id)getAlertOptionsFromOptions:(id)a3 isSourceICS:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v7, "addEntriesFromDictionary:", v6);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCFUserNotificationAlertTopMostKey);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationForcesModalAlertAppearance);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SBUserNotificationDisplayActionButtonOnLockScreen);
    v8 = objc_msgSend(v7, "copy");

  }
  else
  {
    v8 = v5;
  }

  return v8;
}

+ (id)getLaunchingOptionsFromOptions:(id)a3 isSourceICS:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v7, "addEntriesFromDictionary:", v6);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, FBSOpenApplicationOptionKeyUnlockDevice);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, FBSOpenApplicationOptionKeyPromptUnlockDevice);
    v8 = objc_msgSend(v7, "copy");

  }
  else
  {
    v8 = v5;
  }

  return v8;
}

+ (id)_alertContentForVettingBindingPromptWithBundleID:(id)a3 shareName:(id)a4 ownerName:(id)a5 shareType:(id)a6 isShortcut:(BOOL)a7 isSourceICS:(BOOL)a8
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  _QWORD v41[4];
  _QWORD v42[4];

  v40 = a8;
  v8 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v39 = v14;
  if (v14)
  {
    if (v8)
      v16 = CFSTR("VETTING_ALERT_SINGLE_MATCH_BODY_");
    else
      v16 = CFSTR("VETTING_ALERT_BODY_");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts appSpecificLocKeyForBundleID:shareType:prefix:](CKVettingAlerts, "appSpecificLocKeyForBundleID:shareType:prefix:", v12, v15, v16));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts mediumNameFromComponents:](CKVettingAlerts, "mediumNameFromComponents:", v14));
    v18 = CKLocalizedString(v17, CFSTR("%@"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  }
  else
  {
    if (v8)
      v20 = CFSTR("VETTING_ALERT_SINGLE_MATCH_BODY_UNKNOWN_USER_");
    else
      v20 = CFSTR("VETTING_ALERT_BODY_UNKNOWN_USER_");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts appSpecificLocKeyForBundleID:shareType:prefix:](CKVettingAlerts, "appSpecificLocKeyForBundleID:shareType:prefix:", v12, v15, v20));
    v21 = CKLocalizedString(v17, &stru_100024D00);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v21);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VETTING_ALERT_TITLE%@_"), CFSTR("_IOS")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts appSpecificLocKeyForBundleID:shareType:prefix:](CKVettingAlerts, "appSpecificLocKeyForBundleID:shareType:prefix:", v12, v15, v22));
  v36 = v13;
  v24 = CKLocalizedString(v23, CFSTR("%@"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v38 = v15;
  v41[0] = kCFUserNotificationAlertHeaderKey;
  v41[1] = kCFUserNotificationAlertMessageKey;
  v42[0] = v25;
  v42[1] = v19;
  v41[2] = kCFUserNotificationDefaultButtonTitleKey;
  if (v8)
    v26 = CFSTR("SEND_EMAIL_BUTTON");
  else
    v26 = CFSTR("CONTINUE");
  v27 = CKLocalizedString(v26, &stru_100024D00);
  v37 = v13;
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v42[2] = v28;
  v41[3] = kCFUserNotificationAlternateButtonTitleKey;
  v29 = CKLocalizedString(CFSTR("CANCEL"), &stru_100024D00);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v42[3] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 4, v36));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts platformSpecificAlertOptionsWithOptions:bundleIdentifier:](CKVettingAlerts, "platformSpecificAlertOptionsWithOptions:bundleIdentifier:", v31, v12));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts getAlertOptionsFromOptions:isSourceICS:](CKVettingAlerts, "getAlertOptionsFromOptions:isSourceICS:", v32, v40));
  return v33;
}

+ (id)deviceTypeSpecificSuffix
{
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;

  v4 = CKDeviceClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("iPhone")))
  {
    v6 = CFSTR("_IPHONE");
LABEL_7:
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("_IOS"), "stringByAppendingString:", v6));
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("iPad")))
  {
    v6 = CFSTR("_IPAD");
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("iPod")))
  {
    v6 = CFSTR("_IPOD_TOUCH");
    goto LABEL_7;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v9 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Device class %@ is not yet supported by CloudKit Vetting Alerts", buf, 0xCu);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CKVettingAlerts.m"), 240, CFSTR("Unsupported device class: %@"), v5);

  v7 = CFSTR("_IOS");
LABEL_8:

  return v7;
}

+ (id)alertContentForAppDownload:(id)a3 shareMetadata:(id)a4 isSourceICS:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "deviceTypeSpecificSuffix"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts _alertContentForAppStoreOperationWithApp:shareMetadata:keyPrefix:titleKeySuffix:bodyKeySuffix:isSourceICS:](CKVettingAlerts, "_alertContentForAppStoreOperationWithApp:shareMetadata:keyPrefix:titleKeySuffix:bodyKeySuffix:isSourceICS:", v9, v8, CFSTR("GET_APP_"), CFSTR("_IOS"), v10, v5));

  return v11;
}

+ (id)alertContentForAppUpdate:(id)a3 shareMetadata:(id)a4 isSourceICS:(BOOL)a5
{
  return +[CKVettingAlerts _alertContentForAppStoreOperationWithApp:shareMetadata:keyPrefix:titleKeySuffix:bodyKeySuffix:isSourceICS:](CKVettingAlerts, "_alertContentForAppStoreOperationWithApp:shareMetadata:keyPrefix:titleKeySuffix:bodyKeySuffix:isSourceICS:", a3, a4, CFSTR("UPDATE_APP_"), CFSTR("_IOS"), CFSTR("_IOS"), a5);
}

+ (id)alertContentForAppStoreAppLookupFailureWithShareName:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSErrorDomain v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "deviceTypeSpecificSuffix"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("APP_STORE_FAILURE_TITLE"), "stringByAppendingString:", CFSTR("_IOS")));
  v10 = CKLocalizedString(v9, CFSTR("%@"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (NSErrorDomain)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain", v7));
  if (v12 == NSURLErrorDomain)
  {
    if (objc_msgSend(v6, "code") == (id)-1009)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("APP_STORE_GET_APP_FAILURE_OFFLINE_BODY%@"), v8));
      v33[0] = v11;
      v32[0] = CFSTR("ckVettingAlertTitle");
      v32[1] = CFSTR("ckVettingAlertBody");
      v16 = CKLocalizedString(v15, &stru_100024D00);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v33[1] = v17;
      v18 = v33;
      v19 = v32;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("APP_STORE_GET_APP_FAILURE_STORE_NOT_AVAILABLE_BODY%@"), v8));
      v30[0] = CFSTR("ckVettingAlertTitle");
      v30[1] = CFSTR("ckVettingAlertBody");
      v31[0] = v11;
      v24 = CKLocalizedString(v15, &stru_100024D00);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v31[1] = v17;
      v18 = v31;
      v19 = v30;
    }
    goto LABEL_10;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  v14 = v13;
  if (v13 != (void *)CKUnderlyingErrorDomain)
  {

LABEL_8:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("APP_STORE_GET_APP_FAILURE_STORE_NOT_AVAILABLE_BODY%@"), v8));
    v26[0] = CFSTR("ckVettingAlertTitle");
    v26[1] = CFSTR("ckVettingAlertBody");
    v27[0] = v11;
    v23 = CKLocalizedString(v15, &stru_100024D00);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v27[1] = v17;
    v18 = v27;
    v19 = v26;
LABEL_10:
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v19, 2));

    goto LABEL_11;
  }
  v20 = objc_msgSend(v6, "code");

  if (v20 != (id)1024)
    goto LABEL_8;
  v28[0] = CFSTR("ckVettingAlertTitle");
  v28[1] = CFSTR("ckVettingAlertBody");
  v29[0] = v11;
  v21 = CKLocalizedString(CFSTR("APP_STORE_GET_APP_FAILURE_APP_NOT_AVAILABLE_BODY"), &stru_100024D00);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v29[1] = v15;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 2));
LABEL_11:

  return v22;
}

+ (id)alertContentForAppStoreUpdateLookupFailureWithShareName:(id)a3 appName:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSErrorDomain v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void **v18;
  const __CFString **v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v26;
  const __CFString *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  const __CFString *v40;
  void *v41;
  void *v42;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("APP_STORE_FAILURE_TITLE"), "stringByAppendingString:", CFSTR("_IOS")));
  v11 = CKLocalizedString(v10, CFSTR("%@"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (NSErrorDomain)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain", v9));
  if (v13 == NSURLErrorDomain)
  {
    v26 = v7;
    if (objc_msgSend(v8, "code") == (id)-1009)
    {
      v16 = CKLocalizedString(CFSTR("APP_STORE_UPDATE_APP_FAILURE_OFFLINE_BODY"), CFSTR("%@"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v39 = CFSTR("ckVettingAlertTitle");
      v40 = CFSTR("ckVettingAlertBody");
      v41 = v12;
      v42 = v17;
      v18 = &v41;
      v19 = &v39;
    }
    else
    {
      v23 = CKLocalizedString(CFSTR("APP_STORE_UPDATE_APP_FAILURE_STORE_NOT_AVAILABLE_BODY"), CFSTR("%@"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v35 = CFSTR("ckVettingAlertTitle");
      v36 = CFSTR("ckVettingAlertBody");
      v37 = v12;
      v38 = v17;
      v18 = &v37;
      v19 = &v35;
    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
    v15 = v14;
    if (v14 != (void *)CKUnderlyingErrorDomain)
    {

LABEL_8:
      v26 = v7;
      v22 = CKLocalizedString(CFSTR("APP_STORE_UPDATE_APP_FAILURE_STORE_NOT_AVAILABLE_BODY"), CFSTR("%@"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v27 = CFSTR("ckVettingAlertTitle");
      v28 = CFSTR("ckVettingAlertBody");
      v29 = v12;
      v30 = v17;
      v18 = &v29;
      v19 = &v27;
      goto LABEL_10;
    }
    v20 = objc_msgSend(v8, "code");

    if (v20 != (id)1024)
      goto LABEL_8;
    v26 = v7;
    v21 = CKLocalizedString(CFSTR("APP_STORE_UPDATE_APP_FAILURE_APP_NOT_AVAILABLE_BODY"), CFSTR("%@"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v31 = CFSTR("ckVettingAlertTitle");
    v32 = CFSTR("ckVettingAlertBody");
    v33 = v12;
    v34 = v17;
    v18 = &v33;
    v19 = &v31;
  }
LABEL_10:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v19, 2, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38,
                    v39,
                    v40,
                    v41,
                    v42));

  return v24;
}

+ (id)_alertContentForAppStoreOperationWithApp:(id)a3 shareMetadata:(id)a4 keyPrefix:(id)a5 titleKeySuffix:(id)a6 bodyKeySuffix:(id)a7 isSourceICS:(BOOL)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  _BOOL4 v36;
  _QWORD v37[4];
  _QWORD v38[4];

  v36 = a8;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = a5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@TITLE%@"), v15, a6));
  v17 = CKLocalizedString(v16, CFSTR("%@"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ownerIdentity", v12));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "nameComponents"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@BODY%@"), v15, v14));

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ownerIdentity"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "nameComponents"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts mediumNameFromComponents:](CKVettingAlerts, "mediumNameFromComponents:", v23));
    v24 = CKLocalizedString(v21, CFSTR("%@%@"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@BODY_UNKNOWN_USER%@"), v15, v14));

    v35 = v12;
    v26 = CKLocalizedString(v21, CFSTR("%@"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v26);
  }

  v37[0] = kCFUserNotificationAlertHeaderKey;
  v37[1] = kCFUserNotificationAlertMessageKey;
  v38[0] = v18;
  v38[1] = v25;
  v37[2] = kCFUserNotificationDefaultButtonTitleKey;
  v27 = CKLocalizedString(CFSTR("GO_TO_APP_STORE"), &stru_100024D00);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v38[2] = v28;
  v37[3] = kCFUserNotificationAlternateButtonTitleKey;
  v29 = CKLocalizedString(CFSTR("NOT_NOW"), &stru_100024D00);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v38[3] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 4, v35));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts platformSpecificAlertOptionsWithOptions:bundleIdentifier:](CKVettingAlerts, "platformSpecificAlertOptionsWithOptions:bundleIdentifier:", v31, 0));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts getAlertOptionsFromOptions:isSourceICS:](CKVettingAlerts, "getAlertOptionsFromOptions:isSourceICS:", v32, v36));
  return v33;
}

+ (id)alertContentForInitiateVettingError:(id)a3 shareTitle:(id)a4 isEmail:(BOOL)a5 address:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __CFString *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  __CFString *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  __CFString *v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  void *v79;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD v84[2];
  _QWORD v85[2];

  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VETTING_FAILURE_ALERT_TITLE_CANT_SEND_LINK%@")));
  v19 = sub_10000ED90(v12, &stru_100024D00, v13, v14, v15, v16, v17, v18, (uint64_t)CFSTR("_IOS"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v27 = sub_10000ED90(CFSTR("VETTING_FAILURE_ALERT_BODY_INITIATE_GENERIC_ERROR"), &stru_100024D00, v21, v22, v23, v24, v25, v26, v81);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
  v30 = objc_msgSend(v29, "isEqualToString:", CKErrorDomain);

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

    v33 = objc_msgSend(v32, "code");
    switch((unint64_t)v33)
    {
      case 0x1F46uLL:
        v82 = (uint64_t)v11;
        if (v7)
          v40 = CFSTR("VETTING_FAILURE_ALERT_BODY_INITIATE_TOO_MANY_VETS_EMAIL");
        else
          v40 = CFSTR("VETTING_FAILURE_ALERT_BODY_INITIATE_TOO_MANY_VETS_NUMBER");
        goto LABEL_15;
      case 0x1F47uLL:
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "userInfo"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", CKErrorAccountPrimaryEmailKey));

        if (v7)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("VETTING_FAILURE_ALERT_TITLE_INITIATE_VETTED_TO_CALLER_ERROR_EMAIL"), "stringByAppendingString:", CFSTR("_IOS")));

          v50 = sub_10000ED90(v43, &stru_100024D00, v44, v45, v46, v47, v48, v49, v82);
          v51 = objc_claimAutoreleasedReturnValue(v50);

          if (!v42 || (objc_msgSend(v42, "isEqualToString:", &stru_100024D00) & 1) != 0)
          {
            v83 = (uint64_t)v11;
            v58 = CFSTR("VETTING_FAILURE_ALERT_BODY_INITIATE_VETTED_TO_CALLER_ERROR_EMAIL_NO_APPLE_ID");
LABEL_20:
            v75 = CFSTR("%@");
            goto LABEL_27;
          }
          v83 = (uint64_t)v11;
          v58 = CFSTR("VETTING_FAILURE_ALERT_BODY_INITIATE_VETTED_TO_CALLER_ERROR_EMAIL");
        }
        else
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("VETTING_FAILURE_ALERT_TITLE_INITIATE_VETTED_TO_CALLER_ERROR_PHONE"), "stringByAppendingString:", CFSTR("_IOS")));

          v74 = sub_10000ED90(v43, &stru_100024D00, v68, v69, v70, v71, v72, v73, v82);
          v51 = objc_claimAutoreleasedReturnValue(v74);

          if (!v42 || (objc_msgSend(v42, "isEqualToString:", &stru_100024D00) & 1) != 0)
          {
            v83 = (uint64_t)v11;
            v58 = CFSTR("VETTING_FAILURE_ALERT_BODY_INITIATE_VETTED_TO_CALLER_ERROR_PHONE_NO_APPLE_ID");
            goto LABEL_20;
          }
          v83 = (uint64_t)v11;
          v58 = CFSTR("VETTING_FAILURE_ALERT_BODY_INITIATE_VETTED_TO_CALLER_ERROR_PHONE");
        }
        v75 = CFSTR("%@%@");
LABEL_27:
        v77 = sub_10000ED90(v58, v75, v52, v53, v54, v55, v56, v57, v83);
        v78 = objc_claimAutoreleasedReturnValue(v77);

        v28 = (void *)v78;
LABEL_28:

        v20 = (void *)v51;
        v12 = v43;
LABEL_29:

        break;
      case 0x1F48uLL:
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer matterhornName](CKContainer, "matterhornName"));
        if (v7)
          v65 = sub_10000ED90(CFSTR("VETTING_FAILURE_ALERT_BODY_INITIATE_VETTED_TO_OTHER_EMAIL"), CFSTR("%@%@"), v59, v60, v61, v62, v63, v64, (uint64_t)v11);
        else
          v65 = sub_10000ED90(CFSTR("VETTING_FAILURE_ALERT_BODY_INITIATE_VETTED_TO_OTHER_NUMBER"), CFSTR("%@%@"), v59, v60, v61, v62, v63, v64, (uint64_t)v11);
        v76 = objc_claimAutoreleasedReturnValue(v65);

        v51 = (uint64_t)v20;
        v28 = (void *)v76;
        goto LABEL_23;
      case 0x1F49uLL:
        goto LABEL_29;
      case 0x1F4AuLL:
        v40 = CFSTR("VETTING_FAILURE_ALERT_BODY_INITIATE_SERVER_ERROR");
        v66 = &stru_100024D00;
        goto LABEL_16;
      default:
        if (v33 != (id)5005)
          goto LABEL_29;
        v82 = (uint64_t)v10;
        v40 = CFSTR("VETTING_FAILURE_ALERT_BODY_INITIATE_PCS_ERROR");
LABEL_15:
        v66 = CFSTR("%@");
LABEL_16:
        v67 = sub_10000ED90(v40, v66, v34, v35, v36, v37, v38, v39, v82);
        v42 = v28;
        v51 = (uint64_t)v20;
        v28 = (void *)objc_claimAutoreleasedReturnValue(v67);
LABEL_23:
        v43 = v12;
        goto LABEL_28;
    }
  }
  v84[0] = CFSTR("ckVettingAlertTitle");
  v84[1] = CFSTR("ckVettingAlertBody");
  v85[0] = v20;
  v85[1] = v28;
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v85, v84, 2));

  return v79;
}

+ (id)_sanitizedShareURLSlug:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a3;
  if (qword_10002A768 != -1)
    dispatch_once(&qword_10002A768, &stru_100024AB0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "CKURLSlug"));
  if (objc_msgSend((id)qword_10002A770, "containsObject:", v4))
    v5 = v4;
  else
    v5 = CFSTR("share");

  return v5;
}

+ (id)alertContentForCompleteVettingError:(id)a3 shareTitle:(id)a4 email:(id)a5 phone:(id)a6 reconstructedShareURL:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  unsigned int v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  const __CFString *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  __CFString *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  id v108;
  __CFString *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  const __CFString *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  id v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  id v152;
  void *v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  id v161;
  void *v162;
  id v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  id v170;
  __CFString *v171;
  NSString *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  id v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  id v203;
  void *v204;
  void *v205;
  id v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  uint64_t v218;
  __CFString *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  __CFString *v224;
  _QWORD v225[2];
  _QWORD v226[2];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = CFSTR("_WITH_SHARE_NAME");
  if (!v13)
    v17 = CFSTR("_WITHOUT_SHARE_NAME");
  v224 = v17;
  v221 = v16;
  v223 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sanitizedShareURLSlug:", v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("VETTING_FAILURE_ALERT_TITLE_COMPLETE_GENERIC_ERROR"), "stringByAppendingString:", CFSTR("_IOS")));
  v25 = sub_10000ED90(v18, &stru_100024D00, v19, v20, v21, v22, v23, v24, v208);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v33 = sub_10000ED90(CFSTR("VETTING_FAILURE_ALERT_BODY_COMPLETE_GENERIC_ERROR_ADDRESS"), &stru_100024D00, v27, v28, v29, v30, v31, v32, v209);
  v40 = (void *)objc_claimAutoreleasedReturnValue(v33);
  if (v14)
  {
    v41 = sub_10000ED90(CFSTR("VETTING_FAILURE_ALERT_BODY_COMPLETE_GENERIC_ERROR_EMAIL"), &stru_100024D00, v34, v35, v36, v37, v38, v39, v210);
    v42 = objc_claimAutoreleasedReturnValue(v41);

    v40 = (void *)v42;
  }
  v222 = v15;
  if (v15)
  {
    v43 = sub_10000ED90(CFSTR("VETTING_FAILURE_ALERT_BODY_COMPLETE_GENERIC_ERROR_PHONE"), &stru_100024D00, v34, v35, v36, v37, v38, v39, v210);
    v44 = objc_claimAutoreleasedReturnValue(v43);

    v40 = (void *)v44;
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domain"));
  v46 = objc_msgSend(v45, "isEqualToString:", CKErrorDomain);

  if (v46)
  {
    v47 = (uint64_t)v13;
    v48 = v14;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

    v220 = v50;
    v51 = objc_msgSend(v50, "code");
    v14 = v48;
    v13 = (id)v47;
    switch((unint64_t)v51)
    {
      case 0x1F42uLL:
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("VETTING_FAILURE_ALERT_TITLE_COMPLETE_TOKEN_INVALID"), "stringByAppendingString:", CFSTR("_IOS")));

        v75 = sub_10000ED90(v68, &stru_100024D00, v69, v70, v71, v72, v73, v74, v210);
        v60 = objc_claimAutoreleasedReturnValue(v75);

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VETTING_FAILURE_ALERT_BODY_COMPLETE_TOKEN_INVALID%@"), v224));
        if (v14)
          v67 = sub_10000ED90(v18, CFSTR("%@%@"), v76, v77, v78, v79, v80, v81, (uint64_t)v14);
        else
          v67 = sub_10000ED90(v18, CFSTR("%@%@"), v76, v77, v78, v79, v80, v81, (uint64_t)v222);
        goto LABEL_31;
      case 0x1F43uLL:
      case 0x1F44uLL:
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("VETTING_FAILURE_ALERT_TITLE_COMPLETE_GENERIC_ERROR"), "stringByAppendingString:", CFSTR("_IOS")));

        v59 = sub_10000ED90(v52, &stru_100024D00, v53, v54, v55, v56, v57, v58, v210);
        v60 = objc_claimAutoreleasedReturnValue(v59);

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VETTING_FAILURE_ALERT_BODY_COMPLETE_VETTING_RECORD_ERROR%@%@"), v224, CFSTR("_IOS")));
        v67 = sub_10000ED90(v18, CFSTR("%@"), v61, v62, v63, v64, v65, v66, v47);
LABEL_31:
        v104 = v40;
        v40 = (void *)objc_claimAutoreleasedReturnValue(v67);
        goto LABEL_63;
      case 0x1F45uLL:
      case 0x1F46uLL:
      case 0x1F47uLL:
      case 0x1F48uLL:
      case 0x1F4AuLL:
        goto LABEL_64;
      case 0x1F49uLL:
        v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VETTING_FAILURE_ALERT_TITLE_COMPLETE_DRYRUN_KEYSWAP_FAILED%@_%@")));

        v89 = sub_10000ED90(v82, &stru_100024D00, v83, v84, v85, v86, v87, v88, (uint64_t)CFSTR("_IOS"));
        v90 = objc_claimAutoreleasedReturnValue(v89);

        if ((objc_msgSend(v223, "isEqualToString:", kCKPhotosSharedLibraryShareURLSlug) & 1) != 0
          || objc_msgSend(v223, "isEqualToString:", kCKFreeformShareURLSlug))
        {
          v91 = CFSTR("PHONE");
          if (!v222)
            v91 = CFSTR("EMAIL");
          v92 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("VETTING_FAILURE_ALERT_BODY_COMPLETE_DRYRUN_KEYSWAP_FAILED_"), "stringByAppendingFormat:", CFSTR("%@_%@"), v223, v91));
        }
        else
        {
          if (v222)
            v128 = CFSTR("PHONE");
          else
            v128 = CFSTR("EMAIL");
          v92 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VETTING_FAILURE_ALERT_BODY_COMPLETE_DRYRUN_KEYSWAP_FAILED%@_IOS_%@"), v224, v128));
        }
        v18 = (void *)v92;

        v135 = sub_10000ED90(v18, CFSTR("%@"), v129, v130, v131, v132, v133, v134, v47);
        v104 = v40;
        v40 = (void *)objc_claimAutoreleasedReturnValue(v135);
        v60 = v90;
        goto LABEL_63;
      case 0x1F4BuLL:
        if (v14)
        {
          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("VETTING_FAILURE_ALERT_TITLE_COMPLETE_TOKEN_AUTH_FAILED_EMAIL"), "stringByAppendingString:", CFSTR("_IOS")));
          v100 = sub_10000ED90(v93, &stru_100024D00, v94, v95, v96, v97, v98, v99, v210);
          v101 = objc_claimAutoreleasedReturnValue(v100);

          v60 = v101;
          v102 = CFSTR("VETTING_FAILURE_ALERT_BODY_COMPLETE_TOKEN_AUTH_FAILED_EMAIL");
        }
        else
        {
          v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("VETTING_FAILURE_ALERT_TITLE_COMPLETE_TOKEN_AUTH_FAILED_PHONE"), "stringByAppendingString:", CFSTR("_IOS")));
          v118 = sub_10000ED90(v111, &stru_100024D00, v112, v113, v114, v115, v116, v117, v210);
          v119 = objc_claimAutoreleasedReturnValue(v118);

          v60 = v119;
          v102 = CFSTR("VETTING_FAILURE_ALERT_BODY_COMPLETE_TOKEN_AUTH_FAILED_PHONE");
        }
        v104 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v102, "stringByAppendingString:", CFSTR("_IOS")));
        v126 = sub_10000ED90(v104, &stru_100024D00, v120, v121, v122, v123, v124, v125, v211);
        v127 = objc_claimAutoreleasedReturnValue(v126);

        v40 = (void *)v127;
        goto LABEL_63;
      case 0x1F4CuLL:
        v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v220, "userInfo"));
        v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

        v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "domain"));
        if (!objc_msgSend(v105, "isEqualToString:", CKErrorDomain))
          goto LABEL_22;
        v106 = objc_msgSend(v104, "code");

        if (v106 == (id)2)
        {
          v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "userInfo"));
          v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));
          v218 = objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", v221));

          v104 = (void *)v218;
LABEL_22:

        }
        v108 = objc_msgSend(v14, "length");
        v109 = CFSTR("_EMAIL");
        if (!v108)
          v109 = CFSTR("_PHONE");
        v219 = v109;
        v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "domain"));
        if (objc_msgSend(v110, "isEqualToString:", CKErrorDomain))
        {
          if (objc_msgSend(v104, "code") == (id)3)
          {

            goto LABEL_40;
          }
          v136 = objc_msgSend(v104, "code");

          if (v136 == (id)4)
          {
LABEL_40:
            v217 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("VETTING_FAILURE_ALERT_TITLE_COMPLETE_SHARE_METADATA_FETCH_FAILED"), "stringByAppendingFormat:", CFSTR("%@_%@"), CFSTR("_IOS"), v223));
            v143 = sub_10000ED90(v217, &stru_100024D00, v137, v138, v139, v140, v141, v142, v212);
            v215 = objc_claimAutoreleasedReturnValue(v143);

            if ((objc_msgSend(v223, "isEqualToString:", kCKPhotosSharedLibraryShareURLSlug) & 1) != 0
              || objc_msgSend(v223, "isEqualToString:", kCKFreeformShareURLSlug))
            {
              v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("VETTING_FAILURE_ALERT_BODY_COMPLETE_SHARE_METADATA_FETCH_FAILED_OFFLINE_"), "stringByAppendingFormat:", CFSTR("%@%@"), v223, v219));
            }
            else
            {
              v144 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VETTING_FAILURE_ALERT_BODY_COMPLETE_SHARE_METADATA_FETCH_FAILED_OFFLINE%@%@"), v224, v219));
            }
            v202 = v144;
            v203 = sub_10000ED90(v144, CFSTR("%@"), v145, v146, v147, v148, v149, v150, (uint64_t)v13);
            v188 = objc_claimAutoreleasedReturnValue(v203);

            v40 = v202;
            v60 = v215;
            v171 = v219;
            goto LABEL_61;
          }
        }
        else
        {

        }
        v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "domain"));
        if (objc_msgSend(v151, "isEqualToString:", CKErrorDomain))
        {
          v152 = objc_msgSend(v104, "code");

          if (v152 == (id)11)
          {
            if (objc_msgSend(CFSTR("_IOS"), "isEqualToString:", CFSTR("_IOS"))
              && objc_msgSend(v223, "isEqualToString:", CFSTR("share")))
            {
              v153 = v223;
              v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("VETTING_FAILURE_ALERT_TITLE_COMPLETE_SHARE_METADATA_FETCH_FAILED_ITEM_UNAVAILABLE"), "stringByAppendingFormat:", CFSTR("%@%@_%@"), v224, CFSTR("_IOS"), v223));
              v161 = sub_10000ED90(v154, CFSTR("%@"), v155, v156, v157, v158, v159, v160, (uint64_t)v13);
            }
            else
            {
              v153 = v223;
              v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("VETTING_FAILURE_ALERT_TITLE_COMPLETE_SHARE_METADATA_FETCH_FAILED_ITEM_UNAVAILABLE"), "stringByAppendingFormat:", CFSTR("%@_%@"), CFSTR("_IOS"), v223));
              v161 = sub_10000ED90(v154, &stru_100024D00, v189, v190, v191, v192, v193, v194, v214);
            }
            v216 = objc_claimAutoreleasedReturnValue(v161);

            if ((objc_msgSend(v153, "isEqualToString:", kCKPhotosSharedLibraryShareURLSlug) & 1) != 0
              || objc_msgSend(v153, "isEqualToString:", kCKFreeformShareURLSlug))
            {
              v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("VETTING_FAILURE_ALERT_BODY_COMPLETE_SHARE_METADATA_FETCH_FAILED_ITEM_UNAVAILABLE_"), "stringByAppendingFormat:", CFSTR("%@%@"), v153, v219));
            }
            else
            {
              v195 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VETTING_FAILURE_ALERT_BODY_COMPLETE_SHARE_METADATA_FETCH_FAILED_ITEM_UNAVAILABLE%@%@"), v224, v219));
            }
            v204 = v195;
            v60 = v216;
            v207 = sub_10000ED90(v195, CFSTR("%@"), v196, v197, v198, v199, v200, v201, (uint64_t)v13);
            v188 = objc_claimAutoreleasedReturnValue(v207);
            v171 = v219;
LABEL_62:

            v40 = (void *)v188;
LABEL_63:

            v26 = (void *)v60;
LABEL_64:

            break;
          }
        }
        else
        {

        }
        v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "domain"));
        if (objc_msgSend(v162, "isEqualToString:", CKErrorDomain))
        {
          v163 = objc_msgSend(v104, "code");

          if (v163 == (id)1000)
          {
            v217 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("VETTING_FAILURE_ALERT_TITLE_COMPLETE_SHARE_METADATA_FETCH_FAILED"), "stringByAppendingFormat:", CFSTR("%@_%@")));
            v170 = sub_10000ED90(v217, &stru_100024D00, v164, v165, v166, v167, v168, v169, (uint64_t)CFSTR("_IOS"));
            v60 = objc_claimAutoreleasedReturnValue(v170);

            v171 = v219;
            v172 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VETTING_FAILURE_ALERT_BODY_COMPLETE_SHARE_METADATA_FETCH_FAILED_SERVER_ERROR%@%@"), v224, v219);
LABEL_54:
            v180 = (void *)objc_claimAutoreleasedReturnValue(v172);
            v187 = sub_10000ED90(v180, CFSTR("%@"), v181, v182, v183, v184, v185, v186, (uint64_t)v13);
            v188 = objc_claimAutoreleasedReturnValue(v187);

            v40 = v180;
LABEL_61:
            v204 = v217;
            goto LABEL_62;
          }
        }
        else
        {

        }
        v217 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("VETTING_FAILURE_ALERT_TITLE_COMPLETE_SHARE_METADATA_FETCH_FAILED"), "stringByAppendingFormat:", CFSTR("%@_%@"), CFSTR("_IOS"), v223));
        v179 = sub_10000ED90(v217, &stru_100024D00, v173, v174, v175, v176, v177, v178, v213);
        v60 = objc_claimAutoreleasedReturnValue(v179);

        v171 = v219;
        v172 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("VETTING_FAILURE_ALERT_BODY_COMPLETE_SHARE_METADATA_FETCH_FAILED_UNKNOWN%@%@"), v224, v219);
        goto LABEL_54;
      default:
        v14 = (id)v47;
        v13 = (id)v47;
        goto LABEL_64;
    }
  }
  v225[0] = CFSTR("ckVettingAlertTitle");
  v225[1] = CFSTR("ckVettingAlertBody");
  v226[0] = v26;
  v226[1] = v40;
  v205 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v226, v225, 2));

  return v205;
}

+ (id)alertContentForShareMetadataErrorWithURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v24;
  _QWORD v25[2];
  _QWORD v26[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "CKURLSlug"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("ITEM_UNAVAILABLE_FAILURE_ALERT_TITLE"), "stringByAppendingFormat:", CFSTR("%@_")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts appSpecificLocKeyForURLSlug:prefix:](CKVettingAlerts, "appSpecificLocKeyForURLSlug:prefix:", v3, v4));

  v25[0] = CFSTR("ckVettingAlertTitle");
  v12 = sub_10000ED90(v5, &stru_100024D00, v6, v7, v8, v9, v10, v11, (uint64_t)CFSTR("_IOS"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v25[1] = CFSTR("ckVettingAlertBody");
  v26[0] = v13;
  v20 = sub_10000ED90(CFSTR("ITEM_UNAVAILABLE_FAILURE_ALERT_BODY"), &stru_100024D00, v14, v15, v16, v17, v18, v19, v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v26[1] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));

  return v22;
}

+ (id)alertContentForICloudAccountError:(id)a3 shareMetadata:(id)a4 shareURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
  if (objc_msgSend(v10, "isEqualToString:", CKErrorDomain))
  {
    if (objc_msgSend(v7, "code") == (id)9)
    {

LABEL_6:
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("SIGN_IN_TO_ICLOUD_TITLE"), "stringByAppendingString:", CFSTR("_IOS")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer matterhornName](CKContainer, "matterhornName"));
      v14 = CKLocalizedString(v12, CFSTR("%@"));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue(v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("SIGN_IN_TO_ICLOUD_BODY"), "stringByAppendingFormat:", CFSTR("%@_"), CFSTR("_IOS")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "CKURLSlug"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts appSpecificLocKeyForURLSlug:prefix:](CKVettingAlerts, "appSpecificLocKeyForURLSlug:prefix:", v17, v16));
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer matterhornName](CKContainer, "matterhornName"));
      v19 = CKLocalizedString(v18, CFSTR("%@"));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(v19);

      v57[0] = CFSTR("ckVettingAlertTitle");
      v57[1] = CFSTR("ckVettingAlertBody");
      v58[0] = v15;
      v58[1] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, v57, 2, v47));

      goto LABEL_23;
    }
    v11 = objc_msgSend(v7, "code");

    if (v11 == (id)115)
      goto LABEL_6;
  }
  else
  {

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
  if (!objc_msgSend(v22, "isEqualToString:", CKUnderlyingErrorDomain))
  {

LABEL_13:
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "domain"));
    if (objc_msgSend(v36, "isEqualToString:", CKErrorDomain))
    {
      v37 = objc_msgSend(v7, "code");

      if (v37 == (id)110)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("UPDATE_APPLE_ID_SETTINGS_TITLE"), "stringByAppendingFormat:", CFSTR("%@"), CFSTR("_IOS")));
        v39 = CKLocalizedString(v38, &stru_100024D00);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(v39);

        v40 = CKLocalizedString(CFSTR("UPDATE_APPLE_ID_SETTINGS_BODY"), &stru_100024D00);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(v40);
        v53[0] = CFSTR("ckVettingAlertTitle");
        v53[1] = CFSTR("ckVettingAlertBody");
        v54[0] = v15;
        v54[1] = v20;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v53, 2));
        goto LABEL_23;
      }
    }
    else
    {

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "CKURLSlug"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentForGenericErrorWithURLSlug:](CKVettingAlerts, "alertContentForGenericErrorWithURLSlug:", v41));

    v20 = &stru_100024D00;
    v15 = &stru_100024D00;
    goto LABEL_23;
  }
  v23 = objc_msgSend(v7, "code");

  if (v23 != (id)1023)
    goto LABEL_13;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CKErrorDisabledAppLocalizedName));

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("ENABLE_IN_ICLOUD_TITLE"), "stringByAppendingString:", CFSTR("_IOS")));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer matterhornName](CKContainer, "matterhornName"));
  v27 = CKLocalizedString(v26, CFSTR("%@"));
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue(v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ownerIdentity", v48));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "nameComponents"));

  if (v25)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "CKURLSlug"));
    if (v29)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts appSpecificLocKeyForURLSlug:prefix:](CKVettingAlerts, "appSpecificLocKeyForURLSlug:prefix:", v30, CFSTR("ENABLE_IN_ICLOUD_BODY_")));

      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ownerIdentity"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "nameComponents"));
      v33 = v25;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts mediumNameFromComponents:](CKVettingAlerts, "mediumNameFromComponents:", v32));
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer matterhornName](CKContainer, "matterhornName"));
      v49 = v34;
      v35 = CKLocalizedString(v31, CFSTR("%@%@%@"));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(v35);

      v25 = v33;
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts appSpecificLocKeyForURLSlug:prefix:](CKVettingAlerts, "appSpecificLocKeyForURLSlug:prefix:", v30, CFSTR("ENABLE_IN_ICLOUD_BODY_UNKNOWN_USER_")));

      v49 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer matterhornName](CKContainer, "matterhornName"));
      v44 = CKLocalizedString(v31, CFSTR("%@%@"));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(v44);

    }
  }
  else if (v29)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ownerIdentity"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "nameComponents"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts mediumNameFromComponents:](CKVettingAlerts, "mediumNameFromComponents:", v42));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer matterhornName](CKContainer, "matterhornName"));
    v43 = CKLocalizedString(CFSTR("ENABLE_IN_ICLOUD_BODY_noapp"), CFSTR("%@%@"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(v43);

  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer matterhornName](CKContainer, "matterhornName"));
    v49 = v31;
    v45 = CKLocalizedString(CFSTR("ENABLE_IN_ICLOUD_BODY_UNKNOWN_USER_noapp"), CFSTR("%@"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(v45);
  }

  v55[0] = CFSTR("ckVettingAlertTitle");
  v55[1] = CFSTR("ckVettingAlertBody");
  v56[0] = v15;
  v56[1] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 2, v49));

LABEL_23:
  return v21;
}

+ (id)alertContentDictionaryForDeviceOfflineErrorWithURLSlug:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DEVICE_OFFLINE_TITLE%@_"), CFSTR("_IOS")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts appSpecificLocKeyForURLSlug:prefix:](CKVettingAlerts, "appSpecificLocKeyForURLSlug:prefix:", v3, v4));
  v6 = CKLocalizedString(v5, &stru_100024D00);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DEVICE_OFFLINE_BODY%@_"), CFSTR("_IOS")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts appSpecificLocKeyForURLSlug:prefix:](CKVettingAlerts, "appSpecificLocKeyForURLSlug:prefix:", v3, v8));

  v10 = CKLocalizedString(v9, &stru_100024D00);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v14[0] = CFSTR("ckVettingAlertTitle");
  v14[1] = CFSTR("ckVettingAlertBody");
  v15[0] = v7;
  v15[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));

  return v12;
}

+ (id)alertContentDictionaryForServiceUnavailableErrorWithURLSlug:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SERVER_ERROR_TITLE%@_"), CFSTR("_IOS")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts appSpecificLocKeyForURLSlug:prefix:](CKVettingAlerts, "appSpecificLocKeyForURLSlug:prefix:", v3, v4));
  v6 = CKLocalizedString(v5, &stru_100024D00);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SERVER_ERROR_BODY%@_"), CFSTR("_IOS")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts appSpecificLocKeyForURLSlug:prefix:](CKVettingAlerts, "appSpecificLocKeyForURLSlug:prefix:", v3, v8));

  v10 = CKLocalizedString(v9, &stru_100024D00);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v14[0] = CFSTR("ckVettingAlertTitle");
  v14[1] = CFSTR("ckVettingAlertBody");
  v15[0] = v7;
  v15[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));

  return v12;
}

+ (id)alertContentForAppSelectionWithShareName:(id)a3 ownerName:(id)a4 currentUserName:(id)a5 currentUserFormattedUsername:(id)a6 dropDownTitles:(id)a7 isSourceICS:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return +[CKVettingAlerts _alertContentForDropDownSelectionWithShareName:ownerName:currentUserName:currentUserFormattedUsername:dropDownTitles:locKeyPrefix:isSourceICS:](CKVettingAlerts, "_alertContentForDropDownSelectionWithShareName:ownerName:currentUserName:currentUserFormattedUsername:dropDownTitles:locKeyPrefix:isSourceICS:", a3, a4, a5, a6, a7, CFSTR("APP_SELECTION_ALERT_"), v9);
}

+ (id)alertContentForAppStoreAppSelectionWithShareName:(id)a3 ownerName:(id)a4 currentUserName:(id)a5 currentUserFormattedUsername:(id)a6 dropDownTitles:(id)a7 isSourceICS:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return +[CKVettingAlerts _alertContentForDropDownSelectionWithShareName:ownerName:currentUserName:currentUserFormattedUsername:dropDownTitles:locKeyPrefix:isSourceICS:](CKVettingAlerts, "_alertContentForDropDownSelectionWithShareName:ownerName:currentUserName:currentUserFormattedUsername:dropDownTitles:locKeyPrefix:isSourceICS:", a3, a4, a5, a6, a7, CFSTR("APP_STORE_SELECTION_ALERT_"), v9);
}

+ (id)_alertContentForDropDownSelectionWithShareName:(id)a3 ownerName:(id)a4 currentUserName:(id)a5 currentUserFormattedUsername:(id)a6 dropDownTitles:(id)a7 locKeyPrefix:(id)a8 isSourceICS:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[5];
  _QWORD v43[5];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v41 = a7;
  v18 = a8;
  if (v14)
  {
    v19 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@TITLE%@"), v18, CFSTR("_IOS")));
    v20 = (void *)v19;
    v21 = CFSTR("%@");
  }
  else
  {
    v19 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@UNTITLED_TITLE%@"), v18, CFSTR("_IOS")));
    v20 = (void *)v19;
    v21 = &stru_100024D00;
  }
  v22 = CKLocalizedString(v19, v21);
  v40 = (void *)objc_claimAutoreleasedReturnValue(v22);

  v39 = v17;
  v38 = v16;
  if (v15)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@BODY%@"), v18, CFSTR("_IOS")));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts mediumNameFromComponents:](CKVettingAlerts, "mediumNameFromComponents:", v15));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts mediumNameFromComponents:](CKVettingAlerts, "mediumNameFromComponents:", v16));
    v25 = CKLocalizedString(v23, CFSTR("%@%@%@"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@UNKNOWN_USER_BODY%@"), v18, CFSTR("_IOS")));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts mediumNameFromComponents:](CKVettingAlerts, "mediumNameFromComponents:", v16));
    v37 = v17;
    v27 = CKLocalizedString(v23, CFSTR("%@%@"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v27);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@OPEN_BUTTON_MAC"), v18, v37));
  v29 = CKLocalizedString(v28, &stru_100024D00);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v42[0] = kCFUserNotificationAlertHeaderKey;
  v42[1] = kCFUserNotificationAlertMessageKey;
  v43[0] = v40;
  v43[1] = v26;
  v43[2] = v30;
  v42[2] = kCFUserNotificationDefaultButtonTitleKey;
  v42[3] = kCFUserNotificationAlternateButtonTitleKey;
  v31 = CKLocalizedString(CFSTR("NOT_NOW"), &stru_100024D00);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v42[4] = kCFUserNotificationPopUpTitlesKey;
  v43[3] = v32;
  v43[4] = v41;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 5));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts platformSpecificAlertOptionsWithOptions:bundleIdentifier:](CKVettingAlerts, "platformSpecificAlertOptionsWithOptions:bundleIdentifier:", v33, 0));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts getAlertOptionsFromOptions:isSourceICS:](CKVettingAlerts, "getAlertOptionsFromOptions:isSourceICS:", v34, a9));
  return v35;
}

+ (void)showFailureAlert:(id)a3 isSourceICS:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFDictionary *v14;
  __CFUserNotification *v15;
  void *v16;
  void *v17;
  CFOptionFlags v18;
  _QWORD v19[3];
  _QWORD v20[3];

  v4 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ckVettingAlertTitle")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ckVettingAlertBody")));

  if (!v8)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CKVettingAlerts.m"), 696, CFSTR("Error alert title empty"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CKVettingAlerts.m"), 697, CFSTR("Error alert body empty"));

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v19[0] = kCFUserNotificationAlertHeaderKey;
  v19[1] = kCFUserNotificationAlertMessageKey;
  v20[0] = v8;
  v20[1] = v9;
  v19[2] = kCFUserNotificationDefaultButtonTitleKey;
  v10 = CKLocalizedString(CFSTR("OK"), &stru_100024D00);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v20[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 3));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts platformSpecificAlertOptionsWithOptions:bundleIdentifier:](CKVettingAlerts, "platformSpecificAlertOptionsWithOptions:bundleIdentifier:", v12, 0));

  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts getAlertOptionsFromOptions:isSourceICS:](CKVettingAlerts, "getAlertOptionsFromOptions:isSourceICS:", v13, v4));
  v15 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v14);
  v18 = 0;
  CFUserNotificationReceiveResponse(v15, 604800.0, &v18);
  CFRelease(v15);

}

+ (void)showICloudAccountSettingAlert:(id)a3 appName:(id)a4 previewRequested:(BOOL *)a5 isSourceICS:(BOOL)a6
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  const __CFDictionary *v23;
  __CFUserNotification *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  id v29;
  NSObject *v30;
  BOOL v31;
  void *v32;
  void *v34;
  id v35;
  CFOptionFlags responseFlags;
  uint8_t buf[4];
  id v38;
  _QWORD v39[4];
  _QWORD v40[4];

  v6 = a6;
  v8 = a4;
  v9 = a3;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE")));
  v10 = CKLocalizedString(CFSTR("GO_TO_SETTINGS_IOS"), &stru_100024D00);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (v8)
  {
    v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PREVIEW_BUTTON_IOS_%@"), v8));
    v13 = (void *)v12;
    if (v12)
    {
      v14 = CKLocalizedString(v12, &stru_100024D00);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
    v13 = 0;
  }
  v16 = CKLocalizedString(CFSTR("NOT_NOW"), &stru_100024D00);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v39[0] = kCFUserNotificationAlertHeaderKey;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ckVettingAlertTitle")));
  v40[0] = v18;
  v39[1] = kCFUserNotificationAlertMessageKey;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ckVettingAlertBody")));

  v40[1] = v19;
  v40[2] = v11;
  v32 = (void *)v11;
  v39[2] = kCFUserNotificationDefaultButtonTitleKey;
  v39[3] = kCFUserNotificationAlternateButtonTitleKey;
  v40[3] = v17;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 4));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts getAlertOptionsFromOptions:isSourceICS:](CKVettingAlerts, "getAlertOptionsFromOptions:isSourceICS:", v20, v6));
  if (v15)
  {
    v22 = objc_msgSend(v21, "mutableCopy");
    objc_msgSend(v22, "setObject:forKey:", v15, kCFUserNotificationOtherButtonTitleKey);

    v21 = v22;
  }
  v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts platformSpecificAlertOptionsWithOptions:bundleIdentifier:](CKVettingAlerts, "platformSpecificAlertOptionsWithOptions:bundleIdentifier:", v21, 0));

  v24 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v23);
  responseFlags = 0;
  CFUserNotificationReceiveResponse(v24, 604800.0, &responseFlags);
  if ((responseFlags & 3) == 2)
  {
    v31 = 1;
  }
  else
  {
    if ((responseFlags & 3) == 0)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v25 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Redirecting user to iCloud preferences", buf, 2u);
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts getLaunchingOptionsFromOptions:isSourceICS:](CKVettingAlerts, "getLaunchingOptionsFromOptions:isSourceICS:", 0, v6));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
      v35 = 0;
      v28 = objc_msgSend(v27, "openSensitiveURL:withOptions:error:", v34, v26, &v35);
      v29 = v35;

      if ((v28 & 1) == 0)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        v30 = ck_log_facility_ck;
        if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v29;
          _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to open iCloud settings: %@", buf, 0xCu);
        }
      }

    }
    v31 = 0;
  }
  CFRelease(v24);
  if (a5)
    *a5 = v31;

}

+ (void)showDropDownAlert:(id)a3 defaultResponseBlock:(id)a4 alternateResponseBlock:(id)a5 errorBlock:(id)a6
{
  void (**v9)(id, CFOptionFlags);
  void (**v10)(_QWORD);
  void (**v11)(_QWORD);
  __CFUserNotification *v12;
  CFOptionFlags responseFlags;

  v9 = (void (**)(id, CFOptionFlags))a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = (void (**)(_QWORD))a6;
  v12 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, (CFDictionaryRef)a3);
  responseFlags = 0;
  CFUserNotificationReceiveResponse(v12, 604800.0, &responseFlags);
  if ((responseFlags & 3) == 1)
  {
    v10[2](v10);
  }
  else if ((responseFlags & 3) != 0)
  {
    v11[2](v11);
  }
  else
  {
    v9[2](v9, responseFlags >> 24);
  }
  CFRelease(v12);

}

+ (id)platformSpecificAlertOptionsWithOptions:(id)a3 bundleIdentifier:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_msgSend(a3, "mutableCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resourceURL"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, kCFUserNotificationLocalizationURLKey);

  return v4;
}

+ (id)alertContentForGenericInitiateVettingError
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("VETTING_FAILURE_ALERT_TITLE_CANT_SEND_LINK"), "stringByAppendingString:", CFSTR("_IOS")));
  v23[0] = CFSTR("ckVettingAlertTitle");
  v9 = sub_10000ED90(v2, &stru_100024D00, v3, v4, v5, v6, v7, v8, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v23[1] = CFSTR("ckVettingAlertBody");
  v24[0] = v10;
  v17 = sub_10000ED90(CFSTR("VETTING_FAILURE_ALERT_BODY_INITIATE_GENERIC_ERROR"), &stru_100024D00, v11, v12, v13, v14, v15, v16, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v24[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2));

  return v19;
}

+ (id)mediumNameFromComponents:(id)a3
{
  void *v3;
  __CFString *v4;

  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:style:options:](NSPersonNameComponentsFormatter, "localizedStringFromPersonNameComponents:style:options:", a3, 2, 0));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" ")));

  }
  else
  {
    v4 = &stru_100024D00;
  }
  return v4;
}

+ (id)alertContentForGenericErrorWithURLSlug:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GENERIC_ERROR_BODY_TRY_AGAIN%@_"), CFSTR("_IOS")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts appSpecificLocKeyForURLSlug:prefix:](CKVettingAlerts, "appSpecificLocKeyForURLSlug:prefix:", v3, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GENERIC_ERROR_TITLE%@_"), CFSTR("_IOS")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts appSpecificLocKeyForURLSlug:prefix:](CKVettingAlerts, "appSpecificLocKeyForURLSlug:prefix:", v3, v6));

  v14[0] = CFSTR("ckVettingAlertTitle");
  v8 = CKLocalizedString(v7, &stru_100024D00);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v14[1] = CFSTR("ckVettingAlertBody");
  v15[0] = v9;
  v10 = CKLocalizedString(v5, &stru_100024D00);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v15[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));

  return v12;
}

+ (id)appSpecificLocKeyForBundleID:(id)a3 shareType:(id)a4 prefix:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSString *v14;
  void *v15;
  uint64_t v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (qword_10002A778 != -1)
    dispatch_once(&qword_10002A778, &stru_100024AD0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10002A780, "objectForKey:", v7));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10002A780, "objectForKeyedSubscript:", v7));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10002A788, "objectForKeyedSubscript:", v11));
    v13 = objc_msgSend(v12, "containsObject:", v8);

    if (v13)
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@_%@"), v9, v11, v8);
    else
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v9, v11, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@Generic"), v9));
  }

  return v15;
}

+ (id)appSpecificLocKeyForURLSlug:(id)a3 prefix:(id)a4
{
  id v5;
  id v6;
  NSString *v7;
  void *v8;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v6, v5);
  else
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@share"), v6, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

@end
