@implementation ShareAcceptor

- (ShareAcceptor)initWithCloudKitURL:(id)a3
{
  id v4;
  ShareAcceptor *v5;
  NSURL *v6;
  NSURL *url;
  RetrievingDialog *v8;
  RetrievingDialog *retrievingDialog;
  CKShareParticipant *singleOONMatch;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ShareAcceptor;
  v5 = -[ShareAcceptor init](&v12, "init");
  if (v5)
  {
    v6 = (NSURL *)objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = v6;

    v8 = objc_alloc_init(RetrievingDialog);
    retrievingDialog = v5->_retrievingDialog;
    v5->_retrievingDialog = v8;

    -[RetrievingDialog setDelegate:](v5->_retrievingDialog, "setDelegate:", v5);
    v5->_state = 0;
    singleOONMatch = v5->_singleOONMatch;
    v5->_singleOONMatch = 0;

  }
  return v5;
}

- (ShareAcceptor)initWithCloudKitURL:(id)a3 invitationToken:(id)a4 isSourceICS:(BOOL)a5 unitTestOverrides:(id)a6
{
  id v10;
  id v11;
  ShareAcceptor *v12;
  CKDeviceToDeviceShareInvitationToken *v13;
  CKDeviceToDeviceShareInvitationToken *invitationToken;

  v10 = a4;
  v11 = a6;
  v12 = -[ShareAcceptor initWithCloudKitURL:](self, "initWithCloudKitURL:", a3);
  if (v12)
  {
    v13 = (CKDeviceToDeviceShareInvitationToken *)objc_msgSend(v10, "copy");
    invitationToken = v12->_invitationToken;
    v12->_invitationToken = v13;

    v12->_isSourceICS = a5;
    if (__sTestOverridesAvailable)
      objc_storeStrong((id *)&v12->_unitTestOverrides, a6);
  }

  return v12;
}

- (ShareAcceptor)initWithShareMetadata:(id)a3 shareURL:(id)a4
{
  id v7;
  ShareAcceptor *v8;
  ShareAcceptor *v9;

  v7 = a3;
  v8 = -[ShareAcceptor initWithCloudKitURL:](self, "initWithCloudKitURL:", a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_shareMetadata, a3);

  return v9;
}

- (void)_cancel
{
  -[ShareAcceptor setCancelled:](self, "setCancelled:", 1);
}

- (BOOL)_shouldShowICloudLoginPrompt:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = qword_10002A728;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_10002A728, &stru_100024720);
  v5 = (void *)qword_10002A730;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "CKURLSlug"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lowercaseString"));
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v7) ^ 1;

  return (char)v5;
}

- (void)setState:(int64_t)a3
{
  ShareAcceptor *v4;
  int64_t state;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  char *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  char *v24;

  v4 = self;
  objc_sync_enter(v4);
  state = v4->_state;
  v4->_state = a3;
  objc_sync_exit(v4);

  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v6 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](v4, "url"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "CKURLThroughSlug"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](v4, "url"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "CKPathAfterSlug"));
    v12 = (&off_1000249F0)[state];
    v13 = (&off_1000249F0)[a3];
    v15 = 138544386;
    v16 = v9;
    v17 = 2160;
    v18 = 1752392040;
    v19 = 2112;
    v20 = v11;
    v21 = 2080;
    v22 = v12;
    v23 = 2080;
    v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Share acceptance for URL: %{public}@%{mask.hash}@, state change [%s] -> [%s]", (uint8_t *)&v15, 0x34u);

  }
  if (!-[ShareAcceptor shouldShowRetrievingDialogForState:](v4, "shouldShowRetrievingDialogForState:", a3))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor retrievingDialog](v4, "retrievingDialog"));
    objc_msgSend(v14, "abort");

  }
}

- (BOOL)shouldShowRetrievingDialogForState:(int64_t)a3
{
  return ((unint64_t)a3 > 0x17) | (0x2FFu >> a3) & 1;
}

- (BOOL)retrievingDialogShouldDisplay
{
  ShareAcceptor *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[ShareAcceptor state](v2, "state");
  objc_sync_exit(v2);

  return -[ShareAcceptor shouldShowRetrievingDialogForState:](v2, "shouldShowRetrievingDialogForState:", v3);
}

- (void)retrievingDialogCancelled
{
  -[ShareAcceptor _cancel](self, "_cancel");
}

- (BOOL)_urlIsAniWorkShareURL:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = qword_10002A738;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_10002A738, &stru_100024740);
  v5 = (void *)qword_10002A740;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "CKURLSlug"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lowercaseString"));
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v7);

  return (char)v5;
}

- (BOOL)_shouldSendURLToBladeRunner:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = qword_10002A748;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_10002A748, &stru_100024760);
  v5 = (void *)qword_10002A750;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "CKURLSlug"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lowercaseString"));
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v7);

  return (char)v5;
}

- (BOOL)_shouldSendURLToPhotos:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = qword_10002A758;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_10002A758, &stru_100024780);
  v5 = (void *)qword_10002A760;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "CKURLSlug"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lowercaseString"));
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v7);

  return (char)v5;
}

- (int64_t)_fallbackFlowICloudAccountSettings:(id *)a3 success:(BOOL *)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v24;

  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v7 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor fallbackFlowCause](self, "fallbackFlowCause"));
    *(_DWORD *)buf = 138543362;
    v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Fallback flow: User either not logged into iCloud or need to update Apple ID settings, error: %{public}@", buf, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor fallbackFlowCause](self, "fallbackFlowCause"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentForICloudAccountError:shareMetadata:shareURL:](CKVettingAlerts, "alertContentForICloudAccountError:shareMetadata:shareURL:", v10, v11, v12));

  buf[0] = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
  LODWORD(v11) = -[ShareAcceptor _shouldSendURLToBladeRunner:](self, "_shouldSendURLToBladeRunner:", v14);

  if ((_DWORD)v11)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "CKShareURLSlugBasedApplicationName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lowercaseString"));

    +[CKVettingAlerts showICloudAccountSettingAlert:appName:previewRequested:isSourceICS:](CKVettingAlerts, "showICloudAccountSettingAlert:appName:previewRequested:isSourceICS:", v13, v17, buf, -[ShareAcceptor isSourceICS](self, "isSourceICS"));
  }
  else
  {
    +[CKVettingAlerts showICloudAccountSettingAlert:appName:previewRequested:isSourceICS:](CKVettingAlerts, "showICloudAccountSettingAlert:appName:previewRequested:isSourceICS:", v13, 0, buf, -[ShareAcceptor isSourceICS](self, "isSourceICS"));
  }
  if (buf[0])
  {
    *a4 = 1;
    -[ShareAcceptor setWebFlowReason:](self, "setWebFlowReason:", CFSTR("notSignedIn"));
    v18 = 20;
  }
  else
  {
    *a4 = 0;
    if (a3)
    {
      v19 = CKUnderlyingErrorDomain;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor fallbackFlowCause](self, "fallbackFlowCause"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:error:format:](CKPrettyError, "errorWithDomain:code:error:format:", v19, 9, v20, CFSTR("Sign-in or change in iCloud Settings required before sharing URL can be processed: %@"), v21));

    }
    v18 = 23;
  }

  return v18;
}

- (BOOL)_fallbackFlowWarnNetworkUnavailable:(id *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v9[16];

  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v4 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Fallback flow: User is not connected to the internet", v9, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "CKURLSlug"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentDictionaryForDeviceOfflineErrorWithURLSlug:](CKVettingAlerts, "alertContentDictionaryForDeviceOfflineErrorWithURLSlug:", v6));
  +[CKVettingAlerts showFailureAlert:isSourceICS:](CKVettingAlerts, "showFailureAlert:isSourceICS:", v7, -[ShareAcceptor isSourceICS](self, "isSourceICS"));

  return 0;
}

- (BOOL)_fallbackFlowWarnServiceUnavailable:(id *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v9[16];

  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v4 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Fallback flow: Service unavailable", v9, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "CKURLSlug"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentDictionaryForServiceUnavailableErrorWithURLSlug:](CKVettingAlerts, "alertContentDictionaryForServiceUnavailableErrorWithURLSlug:", v6));
  +[CKVettingAlerts showFailureAlert:isSourceICS:](CKVettingAlerts, "showFailureAlert:isSourceICS:", v7, -[ShareAcceptor isSourceICS](self, "isSourceICS"));

  return 0;
}

- (BOOL)_fallbackFlowWarnShareUnavailable:(id *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;

  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor fallbackFlowCause](self, "fallbackFlowCause"));
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Fallback flow: Share does not exist or user does not have access, due to: %@", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentForShareMetadataErrorWithURL:](CKVettingAlerts, "alertContentForShareMetadataErrorWithURL:", v8));
  +[CKVettingAlerts showFailureAlert:isSourceICS:](CKVettingAlerts, "showFailureAlert:isSourceICS:", v9, -[ShareAcceptor isSourceICS](self, "isSourceICS"));

  if (a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKErrorDomain, 1000, CFSTR("Share not available for sharing URL: %@"), v10));

  }
  return 0;
}

- (BOOL)_fallbackFlowWebRedirect:(id *)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url", a3));
  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "CKURLThroughSlug"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "CKPathAfterSlug"));
    *(_DWORD *)buf = 138543874;
    v32 = v7;
    v33 = 2160;
    v34 = 1752392040;
    v35 = 2112;
    v36 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Opening the share URL %{public}@%{mask.hash}@ explicilty", buf, 0x20u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v4, 0));
  objc_msgSend(v9, "setScheme:", kCKURLComponentsScheme);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "query"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor webFlowReason](self, "webFlowReason"));

  if (v11)
  {
    if (v10)
    {
      if (objc_msgSend(v10, "rangeOfString:", CFSTR("redirectReason")) != (id)0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_16;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor webFlowReason](self, "webFlowReason"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("&%@=%@"), CFSTR("redirectReason"), v12));
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor webFlowReason](self, "webFlowReason"));
      v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("redirectReason"), v12));
    }
    v15 = v13;
    objc_msgSend(v9, "setQuery:", v13);
    goto LABEL_15;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v14 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "CKURLThroughSlug"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "CKPathAfterSlug"));
    *(_DWORD *)buf = 138543874;
    v32 = v16;
    v33 = 2160;
    v34 = 1752392040;
    v35 = 2112;
    v36 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Web flow invoked for: %{public}@%{mask.hash}@, but reason not set", buf, 0x20u);

LABEL_15:
  }
LABEL_16:
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));

  v20 = objc_alloc_init((Class)_LSOpenConfiguration);
  objc_msgSend(v20, "setAllowURLOverrides:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts getLaunchingOptionsFromOptions:isSourceICS:](CKVettingAlerts, "getLaunchingOptionsFromOptions:isSourceICS:", 0, -[ShareAcceptor isSourceICS](self, "isSourceICS")));
  objc_msgSend(v20, "setFrontBoardOptions:", v21);

  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v22 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "CKURLThroughSlug"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "CKPathAfterSlug"));
    *(_DWORD *)buf = 138544130;
    v32 = v24;
    v33 = 2160;
    v34 = 1752392040;
    v35 = 2112;
    v36 = v25;
    v37 = 2112;
    v38 = v20;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Sending URL to LaunchServices: %{public}@%{mask.hash}@with config: %@", buf, 0x2Au);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000060D8;
  v29[3] = &unk_1000247A8;
  v30 = v19;
  v27 = v19;
  objc_msgSend(v26, "openURL:configuration:completionHandler:", v27, v20, v29);

  return 0;
}

- (id)_iOSwatchOSHandleMultipleAppStoreCandidates:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allValues"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("URL")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Name")));
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentForAppDownload:shareMetadata:isSourceICS:](CKVettingAlerts, "alertContentForAppDownload:shareMetadata:isSourceICS:", v9, v10, -[ShareAcceptor isSourceICS](self, "isSourceICS")));
    -[ShareAcceptor _promptToOpenAppStoreLink:alertOptions:appURL:](self, "_promptToOpenAppStoreLink:alertOptions:appURL:", a4, v11, v8);

    v12 = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKErrorDomain, 1, CFSTR("Could not find a URL in the App Store data")));
  }

  return v12;
}

- (BOOL)_fallbackFlowDownloadApp:(id *)a3
{
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;

  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v6 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor registeredAppBundleIDs](self, "registeredAppBundleIDs"));
    *(_DWORD *)buf = 138412290;
    v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Fallback flow: none of the registered apps installed: %@. Prompting to opening the AppStore link for one of them", buf, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor registeredAppBundleIDs](self, "registeredAppBundleIDs"));
  v22 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor _findStoreDataForBundleIDs:error:](self, "_findStoreDataForBundleIDs:error:", v9, &v22));
  v11 = v22;

  if (v10)
  {
    if (!objc_msgSend(v10, "count"))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ShareAcceptor.m"), 498, CFSTR("Expected to get non-empty result from _findStoreDataForBundleIDs"));

    }
    if ((unint64_t)objc_msgSend(v10, "count") < 2)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allValues"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Name")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentForAppDownload:shareMetadata:isSourceICS:](CKVettingAlerts, "alertContentForAppDownload:shareMetadata:isSourceICS:", v14, v17, -[ShareAcceptor isSourceICS](self, "isSourceICS")));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("URL")));
      v15 = -[ShareAcceptor _promptToOpenAppStoreLink:alertOptions:appURL:](self, "_promptToOpenAppStoreLink:alertOptions:appURL:", a3, v18, v19);

    }
    else
    {
      v12 = objc_claimAutoreleasedReturnValue(-[ShareAcceptor _iOSwatchOSHandleMultipleAppStoreCandidates:error:](self, "_iOSwatchOSHandleMultipleAppStoreCandidates:error:", v10, a3));

      if (!v12)
      {
        v15 = 1;
        goto LABEL_14;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareName](self, "shareName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentForAppStoreAppLookupFailureWithShareName:error:](CKVettingAlerts, "alertContentForAppStoreAppLookupFailureWithShareName:error:", v13, v12));
      +[CKVettingAlerts showFailureAlert:isSourceICS:](CKVettingAlerts, "showFailureAlert:isSourceICS:", v14, -[ShareAcceptor isSourceICS](self, "isSourceICS"));
      v15 = 0;
      v11 = (id)v12;
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareName](self, "shareName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentForAppStoreAppLookupFailureWithShareName:error:](CKVettingAlerts, "alertContentForAppStoreAppLookupFailureWithShareName:error:", v13, v11));
    +[CKVettingAlerts showFailureAlert:isSourceICS:](CKVettingAlerts, "showFailureAlert:isSourceICS:", v14, -[ShareAcceptor isSourceICS](self, "isSourceICS"));
    v15 = 0;
  }

LABEL_14:
  return v15;
}

- (BOOL)_fallbackFlowDownloadAppUpdate:(id *)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v23;
  id v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor chosenAppBundleID](self, "chosenAppBundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor chosenAppBundleID](self, "chosenAppBundleID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v10 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor registeredAppBundleIDs](self, "registeredAppBundleIDs"));
    *(_DWORD *)buf = 138412546;
    v27 = v12;
    v28 = 2114;
    v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Fallback flow: one of the registered apps needs an update: %@. Opening the AppStore link for bundle ID %{public}@", buf, 0x16u);

  }
  v25 = v6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v24 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor _findStoreDataForBundleIDs:error:](self, "_findStoreDataForBundleIDs:error:", v13, &v24));
  v15 = v24;

  if (v14)
  {
    if (!objc_msgSend(v14, "count"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ShareAcceptor.m"), 539, CFSTR("Expected to get non-empty result from _findStoreDataForBundleIDs"));

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allValues"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentForAppUpdate:shareMetadata:isSourceICS:](CKVettingAlerts, "alertContentForAppUpdate:shareMetadata:isSourceICS:", v9, v18, -[ShareAcceptor isSourceICS](self, "isSourceICS")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("URL")));
    v21 = -[ShareAcceptor _promptToOpenAppStoreLink:alertOptions:appURL:](self, "_promptToOpenAppStoreLink:alertOptions:appURL:", a3, v19, v20);

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareName](self, "shareName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentForAppStoreUpdateLookupFailureWithShareName:appName:error:](CKVettingAlerts, "alertContentForAppStoreUpdateLookupFailureWithShareName:appName:error:", v17, v9, v15));
    +[CKVettingAlerts showFailureAlert:isSourceICS:](CKVettingAlerts, "showFailureAlert:isSourceICS:", v18, -[ShareAcceptor isSourceICS](self, "isSourceICS"));
    v21 = 1;
  }

  return v21;
}

- (id)_findStoreDataForBundleIDs:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  __CFString *v24;
  NSObject *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v7 = a3;
  if (!objc_msgSend(v7, "count"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ShareAcceptor.m"), 552, CFSTR("Expected at least one bundle ID when querying App Store data"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR(",")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://itunes.apple.com/lookup?bundleId=%@"), v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_100006C4C;
  v31 = sub_100006C5C;
  v32 = 0;
  v12 = dispatch_semaphore_create(0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](NSURLSession, "sharedSession"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100006C64;
  v22[3] = &unk_1000247D0;
  v14 = v11;
  v23 = v14;
  v24 = CFSTR("https://itunes.apple.com/app/apple-store/id%@?mt=8");
  v26 = &v27;
  v15 = v12;
  v25 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataTaskWithURL:completionHandler:", v10, v22));
  objc_msgSend(v16, "resume");
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  if (!objc_msgSend(v14, "count"))
  {
    v18 = (void *)v28[5];
    if (v18)
    {
      if (a4)
      {
        v19 = objc_retainAutorelease(v18);
LABEL_10:
        v17 = 0;
        *a4 = v19;
        goto LABEL_12;
      }
    }
    else if (a4)
    {
      v19 = (id)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:userInfo:](CKPrettyError, "errorWithDomain:code:userInfo:", CKUnderlyingErrorDomain, 1024, 0));
      goto LABEL_10;
    }
    v17 = 0;
    goto LABEL_12;
  }
  v17 = v14;
LABEL_12:

  _Block_object_dispose(&v27, 8);
  return v17;
}

- (BOOL)_promptToOpenAppStoreLink:(id *)a3 alertOptions:(id)a4 appURL:(id)a5
{
  const __CFDictionary *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  __CFUserNotification *v13;
  unsigned __int8 v14;
  id v15;
  id v16;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  CFOptionFlags responseFlags;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v8 = (const __CFDictionary *)a4;
  v9 = a5;
  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v10 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor registeredAppBundleIDs](self, "registeredAppBundleIDs"));
    *(_DWORD *)buf = 138412290;
    v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Fallback flow: prompting the user to go to the app store and obtain/update one of the registered apps %@", buf, 0xCu);

  }
  v13 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v8);
  responseFlags = 0;
  CFUserNotificationReceiveResponse(v13, 604800.0, &responseFlags);
  if ((responseFlags & 3) != 0)
  {
    CFRelease(v13);
    v14 = 1;
    if (!a3)
    {
LABEL_8:
      v16 = 0;
      goto LABEL_9;
    }
LABEL_7:
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ShareAcceptor fallbackFlowCause](self, "fallbackFlowCause")));
    *a3 = v15;

    goto LABEL_8;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v18 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Redirecting user to the app store with URL %{public}@", buf, 0xCu);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts getLaunchingOptionsFromOptions:isSourceICS:](CKVettingAlerts, "getLaunchingOptionsFromOptions:isSourceICS:", 0, -[ShareAcceptor isSourceICS](self, "isSourceICS")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v24 = 0;
  v14 = objc_msgSend(v20, "openURL:withOptions:error:", v9, v19, &v24);
  v16 = v24;

  if ((v14 & 1) == 0)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v21 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "absoluteString"));
      *(_DWORD *)buf = 138543618;
      v27 = v23;
      v28 = 2112;
      v29 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to open store URL %{public}@ with error %@", buf, 0x16u);

    }
  }

  CFRelease(v13);
  if (a3)
  {
    if (v16)
    {
      v16 = objc_retainAutorelease(v16);
      *a3 = v16;
      goto LABEL_9;
    }
    goto LABEL_7;
  }
LABEL_9:

  return v14;
}

- (int64_t)_checkRepresentativeDataclassEnabled:(id *)a3 appCandidatesPresent:(BOOL)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  NSObject *v12;
  int64_t v13;
  uint64_t v14;
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
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;
  void *v39;

  if (!a4)
    return 21;
  if (-[ShareAcceptor _checkDataclassError:](self, "_checkDataclassError:", a3))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
    v6 = objc_msgSend(v5, "mutableCopy");

    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = (id)TCCAccessCopyBundleIdentifiersDisabledForService(kTCCServiceLiverpool);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v9);
    }

    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v12 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "After filtering out the apps disabled for kTCCServiceLiverpool, new local apps list is %{public}@", buf, 0xCu);
    }
    if (objc_msgSend(v6, "count"))
    {
      v13 = 3;
    }
    else
    {
      v28 = CKUnderlyingErrorDomain;
      v33 = CKErrorDisabledAppLocalizedName;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allKeys"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v23));
      v34 = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:userInfo:format:](CKPrettyError, "errorWithDomain:code:userInfo:format:", v28, 1023, v25, CFSTR("Could not open an app which is disabled in iCloud settings")));
      -[ShareAcceptor setFallbackFlowCause:](self, "setFallbackFlowCause:", v26);

      v13 = 19;
    }
    -[ShareAcceptor setLocalBundleIDsToDisplayNames:](self, "setLocalBundleIDsToDisplayNames:", v6);
  }
  else
  {
    v14 = CKUnderlyingErrorDomain;
    v38 = CKErrorDisabledAppLocalizedName;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v16));
    v39 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:userInfo:format:](CKPrettyError, "errorWithDomain:code:userInfo:format:", v14, 1023, v18, CFSTR("Could not open an app which is disabled in iCloud settings")));
    -[ShareAcceptor setFallbackFlowCause:](self, "setFallbackFlowCause:", v19);

    v13 = 19;
  }

  return v13;
}

- (id)fetchMetadata
{
  ShareAcceptor *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  ShareAcceptor *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  ShareAcceptor *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  ShareAcceptor *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  uint8_t buf[4];
  void *v82;
  _BYTE v83[128];

  v2 = self;
  if (!__sTestOverridesAvailable
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor testTargetContainer](self, "testTargetContainer")),
        v3,
        !v3))
  {
    v6 = (void *)objc_opt_new(ACAccountStore, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountTypeWithAccountTypeIdentifier:", ACAccountTypeIdentifierAppleAccount));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountsWithAccountType:", v7));
    if (!objc_msgSend(v8, "count"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKUnderlyingErrorDomain, 1002, CFSTR("Cannot fetch share metadata without any iCloud account logged in")));
      v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "CKClientSuitableError"));

      v4 = 0;
LABEL_45:

      goto LABEL_46;
    }
    v70 = v7;
    v67 = v6;
    v72 = objc_alloc_init((Class)NSMutableDictionary);
    v73 = objc_alloc_init((Class)NSMutableDictionary);
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v69 = v8;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
    if (v10)
    {
      v11 = v10;
      v71 = 0;
      v12 = *(_QWORD *)v77;
      v13 = kAccountDataclassCKDatabaseService;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v77 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v15, "isProvisionedForDataclass:", v13, v67))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
            v75 = 0;
            v17 = v2;
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor _fetchShareMetadataForAccountID:error:](v2, "_fetchShareMetadataForAccountID:error:", v16, &v75));
            v19 = v75;
            v20 = v19;
            if (v18)
            {
              objc_msgSend(v72, "setObject:forKeyedSubscript:", v18, v16);
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "username"));
              v22 = (void *)v21;
              if (v21)
                v23 = (const __CFString *)v21;
              else
                v23 = CFSTR("Unknown User");
              objc_msgSend(v73, "setObject:forKeyedSubscript:", v16, v23);

            }
            else if (v19 && !v71)
            {
              v71 = v19;
            }

            v2 = v17;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
      }
      while (v11);
    }
    else
    {
      v71 = 0;
    }

    if (objc_msgSend(v72, "count") == (id)1)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "allKeys"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstObject"));
      -[ShareAcceptor setSelectedAccountID:](v2, "setSelectedAccountID:", v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "allValues"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "firstObject"));
      -[ShareAcceptor setShareMetadata:](v2, "setShareMetadata:", v28);

      v29 = 0;
      v6 = v67;
      v7 = v70;
    }
    else
    {
      v7 = v70;
      if ((unint64_t)objc_msgSend(v72, "count") >= 2)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[CKBehaviorOptions sharedOptions](CKBehaviorOptions, "sharedOptions"));
        if ((objc_msgSend(v30, "isAppleInternalInstall") & 1) != 0)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[CKBehaviorOptions sharedOptions](CKBehaviorOptions, "sharedOptions"));
          v32 = v2;
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "shareURLToAccountIDSystemAcceptationOverrides"));
          v34 = objc_msgSend(v33, "count");

          v2 = v32;
          v8 = v69;
          if (v34)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[CKBehaviorOptions sharedOptions](CKBehaviorOptions, "sharedOptions"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "shareURLToAccountIDSystemAcceptationOverrides"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](v32, "url"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "absoluteString"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", v38));

            if (!objc_msgSend(v39, "length")
              || (v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "allKeys")),
                  v41 = objc_msgSend(v40, "containsObject:", v39),
                  v40,
                  !v41))
            {
              v58 = (void *)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKUnderlyingErrorDomain, 1002, CFSTR("Cannot fetch share metadata with the provided override iCloud accountID"), v67));
              v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "CKClientSuitableError"));

              v4 = 0;
              v6 = v68;
LABEL_44:

              goto LABEL_45;
            }
            v2 = v32;
            -[ShareAcceptor setSelectedAccountID:](v32, "setSelectedAccountID:", v39);
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKey:", v39));
            -[ShareAcceptor setShareMetadata:](v32, "setShareMetadata:", v42);

            v29 = 0;
            v6 = v67;
LABEL_35:
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor selectedAccountID](v2, "selectedAccountID", v67));

            if (v43)
            {
              if (ck_log_initialization_predicate != -1)
                dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
              v44 = (void *)ck_log_facility_ck;
              if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
              {
                v59 = v44;
                v60 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor selectedAccountID](v2, "selectedAccountID"));
                *(_DWORD *)buf = 138412290;
                v82 = v60;
                _os_log_debug_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "Selected account ID is %@", buf, 0xCu);

              }
              v45 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor selectedAccountID](v2, "selectedAccountID"));
              v46 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](v2, "shareMetadata"));
              objc_msgSend(v46, "setSelectedAccountID:", v45);

              v47 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor selectedAccountID](v2, "selectedAccountID"));
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountWithIdentifier:", v47));
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "accountPropertyForKey:", ACAccountPropertyPersonaIdentifier));

              if (v49)
                CKAdoptPersonaID(v49);

            }
            v4 = v29;
            v5 = v4;
            goto LABEL_44;
          }
        }
        else
        {

          v8 = v69;
        }
        if (ck_log_initialization_predicate != -1)
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        v6 = v67;
        v51 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          v61 = v51;
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "allValues"));
          v63 = v2;
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "firstObject"));
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "share"));
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "recordID"));
          *(_DWORD *)buf = 138543362;
          v82 = v66;
          _os_log_debug_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "Multiple logged-in accounts are invited on share %{public}@. Dismissing the retrieving diaglog and prompting the user to choose.", buf, 0xCu);

          v2 = v63;
        }
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor retrievingDialog](v2, "retrievingDialog", v67));
        objc_msgSend(v52, "abort");

        v74 = 0;
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor _promptForAccountIDChoiceWithAccountIDsByUsername:error:](v2, "_promptForAccountIDChoiceWithAccountIDsByUsername:error:", v73, &v74));
        v54 = v74;
        v55 = v54;
        if (v53)
        {
          -[ShareAcceptor setSelectedAccountID:](v2, "setSelectedAccountID:", v53);
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKeyedSubscript:", v53));
          -[ShareAcceptor setShareMetadata:](v2, "setShareMetadata:", v56);

          v29 = 0;
        }
        else
        {
          if (!v54)
          {
            v57 = (void *)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKUnderlyingErrorDomain, 1002, CFSTR("Cannot fetch share metadata without any chosen iCloud account")));
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "CKClientSuitableError"));

          }
          v29 = v55;
          v55 = v29;
        }

        goto LABEL_35;
      }
      v29 = v71;
      v6 = v67;
    }
    v8 = v69;
    goto LABEL_35;
  }
  v80 = 0;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ShareAcceptor _fetchShareMetadataForAccountID:error:](v2, "_fetchShareMetadataForAccountID:error:", 0, &v80));
  v5 = v80;
  -[ShareAcceptor setShareMetadata:](v2, "setShareMetadata:", v4);
LABEL_46:

  return v5;
}

- (id)_promptForAccountIDChoiceWithAccountIDsByUsername:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFDictionary *v16;
  __CFUserNotification *v17;
  CFOptionFlags v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id *v24;
  id v25;
  CFOptionFlags responseFlags;
  _QWORD v27[5];
  _QWORD v28[5];

  v24 = a4;
  v25 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allKeys"));
  v27[0] = kCFUserNotificationAlertHeaderKey;
  v6 = CKLocalizedString(CFSTR("ACCOUNT_SELECTION_ALERT_TITLE"), &stru_100024D00);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v28[0] = v7;
  v27[1] = kCFUserNotificationAlertMessageKey;
  v8 = CKLocalizedString(CFSTR("ACCOUNT_SELECTION_ALERT_BODY"), &stru_100024D00);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v28[1] = v9;
  v27[2] = kCFUserNotificationAlternateButtonTitleKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v28[2] = v10;
  v27[3] = kCFUserNotificationOtherButtonTitleKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  v28[3] = v11;
  v27[4] = kCFUserNotificationDefaultButtonTitleKey;
  v12 = CKLocalizedString(CFSTR("NOT_NOW"), &stru_100024D00);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v28[4] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 5));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts platformSpecificAlertOptionsWithOptions:bundleIdentifier:](CKVettingAlerts, "platformSpecificAlertOptionsWithOptions:bundleIdentifier:", v14, 0));

  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts getAlertOptionsFromOptions:isSourceICS:](CKVettingAlerts, "getAlertOptionsFromOptions:isSourceICS:", v15, -[ShareAcceptor isSourceICS](self, "isSourceICS")));
  v17 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v16);
  responseFlags = 0;
  CFUserNotificationReceiveResponse(v17, 604800.0, &responseFlags);
  v18 = responseFlags & 3;
  if ((responseFlags & 3) != 0)
  {
    if (v18 == 2)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
      v19 = v25;
    }
    else
    {
      v19 = v25;
      if (v18 != 1)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKErrorDomain, 1, CFSTR("Could not create a user notification")));
        v22 = 0;
        goto LABEL_9;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v20, v24));

    v21 = 0;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKErrorDomain, 20, CFSTR("User cancelled account selection prompt")));
    v22 = 0;
    v19 = v25;
  }
LABEL_9:
  CFRelease(v17);
  if (v24 && v21)
    *v24 = objc_retainAutorelease(v21);

  return v22;
}

- (id)_fetchShareMetadataForAccountID:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  id v23;
  void *v24;
  unsigned int v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v35[4];
  NSObject *v36;
  uint64_t *v37;
  _QWORD v38[5];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;

  v6 = a3;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_100006C4C;
  v49 = sub_100006C5C;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_100006C4C;
  v43 = sub_100006C5C;
  v44 = 0;
  v7 = dispatch_semaphore_create(0);
  v8 = objc_alloc((Class)CKFetchShareMetadataOperation);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
  v55 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1));
  v11 = objc_msgSend(v8, "initWithShareURLs:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor invitationToken](self, "invitationToken"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
    v53 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor invitationToken](self, "invitationToken"));
    v54 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
    objc_msgSend(v11, "setShareInvitationTokensByShareURL:", v15);

  }
  objc_msgSend(v11, "setOverwriteContainerPCSServiceIfManatee:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "resolvedConfiguration"));
  objc_msgSend(v16, "setRequestOriginator:", 2);

  objc_msgSend(v11, "setShouldFetchRootRecord:", 0);
  if (__sTestOverridesAvailable)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor unitTestOverrides](self, "unitTestOverrides"));
    v18 = v17 == 0;

    if (!v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor unitTestOverrides](self, "unitTestOverrides"));
      objc_msgSend(v11, "addUnitTestOverrides:", v19);

    }
  }
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000087F0;
  v38[3] = &unk_1000247F8;
  v38[4] = &v39;
  objc_msgSend(v11, "setPerShareMetadataBlock:", v38);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100008804;
  v35[3] = &unk_100024820;
  v37 = &v45;
  v20 = v7;
  v36 = v20;
  objc_msgSend(v11, "setFetchShareMetadataCompletionBlock:", v35);
  if (!__sTestOverridesAvailable
    || (v21 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor testTargetContainer](self, "testTargetContainer")),
        v22 = v21 == 0,
        v21,
        v22))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
    v25 = -[ShareAcceptor _shouldSendURLToBladeRunner:](self, "_shouldSendURLToBladeRunner:", v24);

    if (v25)
    {
      v26 = objc_alloc((Class)CKContainerID);
      v27 = objc_msgSend(v26, "initWithContainerIdentifier:environment:", kCKCloudDocsContainerIdentifier, 1);
    }
    else
    {
      v27 = objc_msgSend(objc_alloc((Class)CKContainerID), "initWithContainerIdentifier:environment:", CFSTR("com.apple.cloudkit"), 1);
    }
    v28 = v27;
    v29 = objc_alloc_init((Class)CKContainerOptions);
    v30 = objc_msgSend(objc_alloc((Class)CKAccountOverrideInfo), "initWithAccountID:", v6);
    objc_msgSend(v29, "setAccountOverrideInfo:", v30);
    if (__sTestOverridesAvailable)
    {
      v51 = kCKDisplaysSystemAcceptPromptEntitlementKey;
      v52 = &__kCFBooleanTrue;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
      objc_msgSend(v29, "setFakeEntitlements:", v31);

    }
    v23 = objc_msgSend(objc_alloc((Class)CKContainer), "initWithContainerID:options:", v28, v29);

  }
  else
  {
    v23 = (id)objc_claimAutoreleasedReturnValue(-[ShareAcceptor testTargetContainer](self, "testTargetContainer"));
  }
  objc_msgSend(v23, "addOperation:", v11);
  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
  {
    v32 = (void *)v46[5];
    if (v32)
      *a4 = objc_retainAutorelease(v32);
  }
  v33 = (id)v40[5];

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v33;
}

- (CKContainer)metadataIndicatedContainer
{
  CKContainer *metadataIndicatedContainer;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  CKContainer *v11;
  CKContainer *v12;

  metadataIndicatedContainer = self->_metadataIndicatedContainer;
  if (!metadataIndicatedContainer)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ShareAcceptor selectedAccountID](self, "selectedAccountID"));

    if (v4)
    {
      v4 = objc_alloc_init((Class)CKContainerOptions);
      v5 = objc_alloc((Class)CKAccountOverrideInfo);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor selectedAccountID](self, "selectedAccountID"));
      v7 = objc_msgSend(v5, "initWithAccountID:", v6);

      objc_msgSend(v4, "setAccountOverrideInfo:", v7);
    }
    v8 = objc_alloc((Class)CKContainer);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "containerID"));
    v11 = (CKContainer *)objc_msgSend(v8, "initWithContainerID:options:", v10, v4);
    v12 = self->_metadataIndicatedContainer;
    self->_metadataIndicatedContainer = v11;

    metadataIndicatedContainer = self->_metadataIndicatedContainer;
  }
  return metadataIndicatedContainer;
}

- (BOOL)shareNeedsAcceptance
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
  if (objc_msgSend(v3, "participantRole") == (id)1)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
    v4 = objc_msgSend(v5, "participantStatus") != (id)2;

  }
  return v4;
}

- (id)_fetchCurrentUserNameComponents
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_100006C4C;
  v15 = sub_100006C5C;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor metadataIndicatedContainer](self, "metadataIndicatedContainer"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008AD0;
  v8[3] = &unk_100024848;
  v10 = &v11;
  v8[4] = self;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler:", v8);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)promptForSingleBundleID
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
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
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFDictionary *v43;
  __CFUserNotification *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint8_t buf[8];
  _QWORD v57[4];
  _QWORD v58[4];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
  v5 = objc_msgSend(v4, "count");

  if (v5 != (id)1)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ShareAcceptor.m"), 913, CFSTR("Expected a list with one bundle mapping in it, got this: %@"), v55);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "outOfNetworkMatches"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    -[ShareAcceptor setChosenAppBundleID:](self, "setChosenAppBundleID:", v11);

    return 0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor currentUserNameComponents](self, "currentUserNameComponents"));

  if (!v13)
  {
    v49 = objc_claimAutoreleasedReturnValue(-[ShareAcceptor _fetchCurrentUserNameComponents](self, "_fetchCurrentUserNameComponents"));
    if (v49)
    {
      v50 = (void *)v49;
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "CKURLSlug"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentForGenericErrorWithURLSlug:](CKVettingAlerts, "alertContentForGenericErrorWithURLSlug:", v52));
      +[CKVettingAlerts showFailureAlert:isSourceICS:](CKVettingAlerts, "showFailureAlert:isSourceICS:", v53, -[ShareAcceptor isSourceICS](self, "isSourceICS"));

      return v50;
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "containerID"));
  if (objc_msgSend(v15, "specialContainerType") == (id)5)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "share"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CKShareTypeKey));
    v19 = objc_msgSend(v18, "isEqualToString:", CKPhotosSharedLibraryShareType);

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allKeys"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
      -[ShareAcceptor setChosenAppBundleID:](self, "setChosenAppBundleID:", v22);

      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v23 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Hiding the document open dialog for sharing urls with photos shared library type", buf, 2u);
      }
      return 0;
    }
  }
  else
  {

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allKeys"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstObject"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareName](self, "shareName"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "allValues"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "firstObject"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor currentUserNameComponents](self, "currentUserNameComponents"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor currentUserFormattedUsername](self, "currentUserFormattedUsername"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentForFirstJoinAlertWithRecordName:appName:bundleID:shareMetadata:currentUserName:currentUserFormattedUsername:](CKVettingAlerts, "alertContentForFirstJoinAlertWithRecordName:appName:bundleID:shareMetadata:currentUserName:currentUserFormattedUsername:", v27, v30, v26, v31, v32, v33));

  v57[0] = kCFUserNotificationAlertHeaderKey;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("ckVettingAlertTitle")));
  v58[0] = v35;
  v57[1] = kCFUserNotificationAlertMessageKey;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("ckVettingAlertBody")));
  v58[1] = v36;
  v57[2] = kCFUserNotificationDefaultButtonTitleKey;
  v37 = CKLocalizedString(CFSTR("OPEN"), &stru_100024D00);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v58[2] = v38;
  v57[3] = kCFUserNotificationAlternateButtonTitleKey;
  v39 = CKLocalizedString(CFSTR("NOT_NOW"), &stru_100024D00);
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  v58[3] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, v57, 4));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts platformSpecificAlertOptionsWithOptions:bundleIdentifier:](CKVettingAlerts, "platformSpecificAlertOptionsWithOptions:bundleIdentifier:", v41, v26));

  v43 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts getAlertOptionsFromOptions:isSourceICS:](CKVettingAlerts, "getAlertOptionsFromOptions:isSourceICS:", v42, -[ShareAcceptor isSourceICS](self, "isSourceICS")));
  v44 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v43);
  *(_QWORD *)buf = 0;
  CFUserNotificationReceiveResponse(v44, 604800.0, (CFOptionFlags *)buf);
  if ((buf[0] & 3) != 1)
  {
    if ((buf[0] & 3) != 0)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKErrorDomain, 1, CFSTR("Could not create a user notification")));
      goto LABEL_21;
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "allKeys"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "firstObject"));
    -[ShareAcceptor setChosenAppBundleID:](self, "setChosenAppBundleID:", v47);

  }
  v48 = 0;
LABEL_21:
  CFRelease(v44);

  return v48;
}

- (BOOL)_getShareName
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
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "share"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CKShareTitleKey));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "share"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootRecord"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CKShareTitleKey));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
    v7 = v11;
    if (!v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "share"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordName"));
      -[ShareAcceptor setShareName:](self, "setShareName:", v15);

      goto LABEL_6;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rootRecord"));
  }
  v12 = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CKShareTitleKey));
  -[ShareAcceptor setShareName:](self, "setShareName:", v13);
LABEL_6:

  return 1;
}

- (void)_extractEmailAddressesFromProperties:(id)a3 into:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EmailAddresses")));

  if (v8)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EmailAddresses")));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v32;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v13);
          v15 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
          {
            objc_msgSend(v7, "addObject:", v14);
          }
          else
          {
            v16 = objc_opt_class(NSDictionary);
            if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0)
              -[ShareAcceptor _extractEmailAddressesFromProperties:into:](self, "_extractEmailAddressesFromProperties:into:", v14, v7);
          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v11);
    }

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EmailAddress")));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EmailAddress")));
    objc_msgSend(v7, "addObject:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EmailAliases")));

  if (v19)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EmailAliases"), 0));
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v28;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v28 != v23)
            objc_enumerationMutation(v20);
          -[ShareAcceptor _extractEmailAddressesFromProperties:into:](self, "_extractEmailAddressesFromProperties:into:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v24), v7);
          v24 = (char *)v24 + 1;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v22);
    }

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DAAccountEmailAddress")));

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DAAccountEmailAddress")));
    objc_msgSend(v7, "addObject:", v26);

  }
}

- (id)_trySelectingOONParticipant
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v34;
  id v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  int v54;
  _QWORD v55[4];
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];

  v3 = objc_alloc((Class)ACAccountStore);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor chosenAppBundleID](self, "chosenAppBundleID"));
  v5 = objc_msgSend(v3, "initWithEffectiveBundleID:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allAccountTypes"));
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100009C64;
  v55[3] = &unk_100024870;
  v35 = v5;
  v56 = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "CKFlatMap:", v55));

  if (objc_msgSend(v36, "count"))
  {
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = sub_100006C4C;
    v49 = sub_100006C5C;
    v50 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v8 = v36;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v61, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v42;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v42 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v11);
          if (objc_msgSend(v12, "isEnabledForDataclass:", CFSTR("com.apple.Dataclass.Mail")))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "username"));

            if (v13)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "username"));
              objc_msgSend(v7, "addObject:", v14);

              if (ck_log_initialization_predicate != -1)
                dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
              v15 = ck_log_facility_ck;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "username"));
                *(_DWORD *)buf = 138412290;
                v58 = v24;
                _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Considering username %@ as a vetting candidate", buf, 0xCu);

              }
            }
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ck_accountProperties"));

            if (v16)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountProperties"));
              -[ShareAcceptor _extractEmailAddressesFromProperties:into:](self, "_extractEmailAddressesFromProperties:into:", v17, v7);

              if (ck_log_initialization_predicate != -1)
                dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
              v18 = ck_log_facility_ck;
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ck_accountProperties"));
                *(_DWORD *)buf = 138412546;
                v58 = v25;
                v59 = 2112;
                v60 = v7;
                _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "After extracting emails from account properties %@ got %@", buf, 0x16u);

              }
            }
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ck_dataclassProperties"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("com.apple.Dataclass.Mail")));

            if (v20)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ck_dataclassProperties"));
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("com.apple.Dataclass.Mail")));
              -[ShareAcceptor _extractEmailAddressesFromProperties:into:](self, "_extractEmailAddressesFromProperties:into:", v22, v7);

              if (ck_log_initialization_predicate != -1)
                dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
              v23 = ck_log_facility_ck;
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ck_dataclassProperties"));
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("com.apple.Dataclass.Mail")));
                *(_DWORD *)buf = 138412546;
                v58 = v27;
                v59 = 2112;
                v60 = v7;
                _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "After extracting emails from dataclass properties %@ got %@", buf, 0x16u);

              }
            }
          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v61, 16);
      }
      while (v9);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "outOfNetworkMatches"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100009CE0;
    v37[3] = &unk_100024898;
    v30 = v7;
    v38 = v30;
    v39 = &v51;
    v40 = &v45;
    objc_msgSend(v29, "enumerateObjectsUsingBlock:", v37);

    if (*((_DWORD *)v52 + 6) == 1)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v31 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v34 = (void *)v46[5];
        *(_DWORD *)buf = 138412290;
        v58 = v34;
        _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Found exactly one matching participant for the user's enabled accounts, will use it for vetting: %@", buf, 0xCu);
      }
      v32 = (id)v46[5];
    }
    else
    {
      v32 = 0;
    }

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v51, 8);
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (id)_showVettingAlert
{
  return -[ShareAcceptor _iosShowVettingAlert](self, "_iosShowVettingAlert");
}

- (int64_t)initiateVetting
{
  void *v3;
  void *v4;
  int64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor _trySelectingOONParticipant](self, "_trySelectingOONParticipant"));
  -[ShareAcceptor setSingleOONMatch:](self, "setSingleOONMatch:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor singleOONMatch](self, "singleOONMatch"));
  if (v4)
    v5 = 12;
  else
    v5 = 13;

  return v5;
}

- (BOOL)_initiateVettingOfSingleOONMatch:(id *)a3
{
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
  const __CFDictionary *v17;
  __CFUserNotification *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v33;
  void *v34;
  dispatch_semaphore_t v35;
  uint64_t v37;
  _QWORD v38[5];
  id v39;
  NSObject *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  CFOptionFlags responseFlags[2];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor singleOONMatch](self, "singleOONMatch"));

  if (!v5)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ShareAcceptor.m"), 1084, CFSTR("singleOONMatch field is not set"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor registeredAppBundleIDs](self, "registeredAppBundleIDs"));
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareName](self, "shareName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ownerIdentity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nameComponents"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "share"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CKShareTypeKey));
  v16 = (void *)v37;
  v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentForShortcutVettingBindingPromptWithBundleID:shareName:ownerName:shareType:isSourceICS:](CKVettingAlerts, "alertContentForShortcutVettingBindingPromptWithBundleID:shareName:ownerName:shareType:isSourceICS:", v37, v9, v12, v15, -[ShareAcceptor isSourceICS](self, "isSourceICS")));

  v18 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v17);
  responseFlags[0] = 0;
  CFUserNotificationReceiveResponse(v18, 604800.0, responseFlags);
  if ((responseFlags[0] & 3) != 1)
  {
    if ((responseFlags[0] & 3) != 0)
    {
      if (a3)
        *a3 = (id)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKErrorDomain, 1, CFSTR("Could not create a user notification")));
    }
    else
    {
      v35 = dispatch_semaphore_create(0);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor singleOONMatch](self, "singleOONMatch"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "userIdentity"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lookupInfo"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "emailAddress"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor singleOONMatch](self, "singleOONMatch"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "userIdentity"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lookupInfo"));
      v26 = v25;
      if (v22)
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "emailAddress"));
      else
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "phoneNumber"));
      v34 = (void *)v27;

      v42 = 0;
      v43 = &v42;
      v44 = 0x3032000000;
      v45 = sub_100006C4C;
      v46 = sub_100006C5C;
      v47 = 0;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor singleOONMatch](self, "singleOONMatch"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "participantID"));
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_10000A290;
      v38[3] = &unk_100024980;
      v38[4] = self;
      v30 = v34;
      v39 = v30;
      v41 = &v42;
      v31 = v35;
      v40 = v31;
      -[ShareAcceptor _initiateVettingForParticipantID:address:andThen:](self, "_initiateVettingForParticipantID:address:andThen:", v29, v30, v38);

      dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
      if (a3)
        *a3 = objc_retainAutorelease((id)v43[5]);

      _Block_object_dispose(&v42, 8);
      v16 = (void *)v37;
    }
  }
  CFRelease(v18);

  return 0;
}

- (BOOL)_requestSelectionFromMultipleOONMatches:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor _showVettingAlert](self, "_showVettingAlert"));
  v6 = v5;
  if (v5 && objc_msgSend(v5, "code") != (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentForGenericInitiateVettingError](CKVettingAlerts, "alertContentForGenericInitiateVettingError"));
    +[CKVettingAlerts showFailureAlert:isSourceICS:](CKVettingAlerts, "showFailureAlert:isSourceICS:", v7, -[ShareAcceptor isSourceICS](self, "isSourceICS"));

  }
  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return 0;
}

- (id)_iosShowVettingAlert
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *i;
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
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
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
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFDictionary *v50;
  __CFUserNotification *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  unsigned __int8 v55;
  NSObject *v56;
  void *v58;
  void *v59;
  void *v60;
  ShareAcceptor *v62;
  id obj;
  uint64_t v64;
  void *v65;
  id v66;
  __CFString *v67;
  __CFString *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  id v77;
  CFOptionFlags responseFlags;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  uint64_t v84;
  _BYTE v85[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "outOfNetworkMatches"));
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ShareAcceptor.m"), 1163, CFSTR("Vetting initiated for non-OON share, %@"), v59);

  }
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v62 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "outOfNetworkMatches"));

  obj = v7;
  v66 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
  if (v66)
  {
    v64 = *(_QWORD *)v80;
    while (2)
    {
      for (i = 0; i != v66; i = (char *)i + 1)
      {
        if (*(_QWORD *)v80 != v64)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userIdentity"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lookupInfo"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "emailAddress"));
        if (v12)
        {

        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userIdentity"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lookupInfo"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "phoneNumber"));

          if (!v15)
          {
            v40 = CKUnderlyingErrorDomain;
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userIdentity"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "lookupInfo"));
            v42 = (id)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", v40, 8001, CFSTR("Got OON participant's lookup info without an email address or phone number: %@"), v39));
            goto LABEL_41;
          }
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "participantID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userIdentity"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lookupInfo"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "emailAddress"));
        if (v19)
        {
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userIdentity"));
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "lookupInfo"));
          v20 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "emailAddress"));
          v68 = (__CFString *)v20;
        }
        else
        {
          v20 = &stru_100024D00;
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userIdentity"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lookupInfo"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "phoneNumber"));
        if (v23)
        {
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userIdentity"));
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "lookupInfo"));
          v67 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "phoneNumber"));
          v24 = v67;
        }
        else
        {
          v24 = &stru_100024D00;
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%@"), v16, v20, v24));
        objc_msgSend(v65, "addObject:", v25);

        if (v23)
        {

        }
        if (v19)
        {

        }
      }
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
      if (v66)
        continue;
      break;
    }
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "componentsJoinedByString:", CFSTR(",")));
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
  obj = v26;
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByAddingPercentEncodingWithAllowedCharacters:", v75));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareName](v62, "shareName"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "stringByAddingPercentEncodingWithAllowedCharacters:", v27));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](v62, "shareMetadata"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "share"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "URL"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "absoluteString"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringByAddingPercentEncodingWithAllowedCharacters:", v33));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("prefs:root=APPLE_ACCOUNT&aaaction=oonAddressVetting&potentialMatches=%@&sharedItem=%@&shareURL=%@"), v70, v28, v34));
  v76 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v35));

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](v62, "localBundleIDsToDisplayNames"));
  if (objc_msgSend(v36, "count"))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](v62, "localBundleIDsToDisplayNames"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "allKeys"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "firstObject"));

  }
  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor registeredAppBundleIDs](v62, "registeredAppBundleIDs"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "firstObject"));
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareName](v62, "shareName"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](v62, "shareMetadata"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "ownerIdentity"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "nameComponents"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](v62, "shareMetadata"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "share"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CKShareTypeKey));
  v50 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentForFullVettingBindingPromptWithBundleID:shareName:ownerName:shareType:isSourceICS:](CKVettingAlerts, "alertContentForFullVettingBindingPromptWithBundleID:shareName:ownerName:shareType:isSourceICS:", v39, v43, v46, v49, -[ShareAcceptor isSourceICS](v62, "isSourceICS")));

  v51 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v50);
  responseFlags = 0;
  CFUserNotificationReceiveResponse(v51, 604800.0, &responseFlags);
  if ((responseFlags & 3) != 0)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](v62, "url"));
    v42 = (id)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKErrorDomain, 1, CFSTR("Share (%@) acceptance cancelled by the user. Email/phone number vetting cancelled."), v52));
    v41 = (void *)v76;
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v41 = (void *)v76;
    v53 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v84 = v76;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "Redirecting user to iCloud preferences using URL: %{public}@", buf, 0xCu);
    }
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts getLaunchingOptionsFromOptions:isSourceICS:](CKVettingAlerts, "getLaunchingOptionsFromOptions:isSourceICS:", 0, -[ShareAcceptor isSourceICS](v62, "isSourceICS")));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v77 = 0;
    v55 = objc_msgSend(v54, "openSensitiveURL:withOptions:error:", v76, v52, &v77);
    v42 = v77;

    if ((v55 & 1) == 0)
    {
      if (!v42)
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, v62, CFSTR("ShareAcceptor.m"), 1207, CFSTR("openSensitiveURL failed without error"));

      }
      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v56 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v84 = (uint64_t)v42;
        _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Failed to open iCloud settings: %@", buf, 0xCu);
      }
    }
  }

  CFRelease(v51);
LABEL_41:

  return v42;
}

- (void)_initiateVettingForParticipantID:(id)a3 address:(id)a4 andThen:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD *v15;
  id v16;
  _QWORD *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc((Class)CKInitiateParticipantVettingOperation);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
  v13 = objc_msgSend(v11, "initWithShareMetadata:participantID:address:", v12, v8, v9);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "resolvedConfiguration"));
  objc_msgSend(v14, "setRequestOriginator:", 2);

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_100006C4C;
  v23[4] = sub_100006C5C;
  v24 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000AF4C;
  v22[3] = &unk_1000248C0;
  v22[4] = v23;
  v15 = objc_retainBlock(v22);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000AF5C;
  v19[3] = &unk_1000248E8;
  v21 = v23;
  v16 = v10;
  v20 = v16;
  v17 = objc_retainBlock(v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor metadataIndicatedContainer](self, "metadataIndicatedContainer"));
  objc_msgSend(v13, "retryTimes:container:participantVettingInitiatedBlock:participantVettingInitiationCompletionBlock:", 2, v18, v15, v17);

  _Block_object_dispose(v23, 8);
}

- (id)_deduplicateBundleToNamesMapping:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  BOOL v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
  v6 = objc_msgSend(v5, "count");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B07C;
  v9[3] = &unk_100024908;
  v10 = v6 < objc_msgSend(v4, "count");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "CKMapKeysAndValues:", v9));

  return v7;
}

- (id)chooseFromMultipleBundleIDs
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor _deduplicateBundleToNamesMapping:](self, "_deduplicateBundleToNamesMapping:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor _iosShowAppSelectionDialogWithTitlesDictionary:](self, "_iosShowAppSelectionDialogWithTitlesDictionary:", v4));
  return v5;
}

- (id)_iosShowAppSelectionDialogWithTitlesDictionary:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  _UNKNOWN **v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  id v12;
  _UNKNOWN **v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v20;
  id obj;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = a3;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allValues"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v3)
  {
    v4 = v3;
    v22 = 0;
    v5 = 0;
    v6 = *(_QWORD *)v25;
    v7 = &ACAccountPropertyPersonaIdentifier_ptr;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v10 = objc_alloc((Class)v7[49]);
        v23 = 0;
        v11 = objc_msgSend(v10, "initWithBundleIdentifier:allowPlaceholder:error:", v9, 0, &v23);
        v12 = v23;
        if (v11)
        {
          if (!v5
            || (v13 = v7,
                v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "registrationDate")),
                v15 = objc_msgSend(v14, "compare:", v22),
                v14,
                v7 = v13,
                v15 == (id)1))
          {
            v16 = v9;

            v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "registrationDate"));
            v22 = (void *)v17;
            v5 = v16;
          }
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v4);
  }
  else
  {
    v22 = 0;
    v5 = 0;
  }

  -[ShareAcceptor setChosenAppBundleID:](self, "setChosenAppBundleID:", v5);
  return 0;
}

- (BOOL)_validateShareURL:(id *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url", a3));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKErrorDomain, 12, CFSTR("Asked to accept a nil url")));
    -[ShareAcceptor setFallbackFlowCause:](self, "setFallbackFlowCause:", v5);

    -[ShareAcceptor setState:](self, "setState:", 16);
  }
  return 1;
}

- (BOOL)_notifyBladeRunner:(id *)a3
{
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url", a3));
  v5 = -[ShareAcceptor _shouldSendURLToBladeRunner:](self, "_shouldSendURLToBladeRunner:", v4);

  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.bird"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CKXPCShareDaemon));
    objc_msgSend(v6, "setRemoteObjectInterface:", v7);

    objc_msgSend(v6, "resume");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteObjectProxy"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
    objc_msgSend(v8, "willAcceptShareAtURL:", v9);

  }
  return 1;
}

- (BOOL)_fetchMetadata:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  unsigned int v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  _BYTE v48[24];
  void *v49;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata", a3));

  if (v4)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor fetchMetadata](self, "fetchMetadata"));
  if (v5)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v6 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
      *(_DWORD *)v48 = 138543618;
      *(_QWORD *)&v48[4] = v8;
      *(_WORD *)&v48[12] = 2112;
      *(_QWORD *)&v48[14] = v5;
      v9 = "Received share metadata %{public}@, error %@";
      v10 = v7;
      v11 = 22;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, v48, v11);

    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v12 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v7 = v12;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
      *(_DWORD *)v48 = 138543362;
      *(_QWORD *)&v48[4] = v8;
      v9 = "Received share metadata %{public}@";
      v10 = v7;
      v11 = 12;
      goto LABEL_11;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata", *(_OWORD *)v48, *(_QWORD *)&v48[16]));

  if (v13)
    goto LABEL_58;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  if (objc_msgSend(v14, "isEqualToString:", CKErrorDomain))
  {
    v15 = objc_msgSend(v5, "code");

    if (v15 != (id)2)
      goto LABEL_17;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v17));

    v5 = (void *)v18;
  }

LABEL_17:
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  if (objc_msgSend(v19, "isEqualToString:", CKErrorDomain))
  {
    if (objc_msgSend(v5, "code") == (id)9)
    {

LABEL_22:
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
      v22 = -[ShareAcceptor _shouldShowICloudLoginPrompt:](self, "_shouldShowICloudLoginPrompt:", v21);

      if (v22)
      {
        if (ck_log_initialization_predicate != -1)
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        v23 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
        {
          v24 = v23;
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "CKURLThroughSlug"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "CKPathAfterSlug"));
          *(_DWORD *)v48 = 138543874;
          *(_QWORD *)&v48[4] = v26;
          *(_WORD *)&v48[12] = 2160;
          *(_QWORD *)&v48[14] = 1752392040;
          *(_WORD *)&v48[22] = 2112;
          v49 = v28;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Got unauthenticated response when fetching share metadata for URL %{public}@%{mask.hash}@, showing login prompt", v48, 0x20u);

        }
        goto LABEL_52;
      }
      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v38 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v39 = v38;
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "CKURLThroughSlug"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "CKPathAfterSlug"));
        *(_DWORD *)v48 = 138543874;
        *(_QWORD *)&v48[4] = v41;
        *(_WORD *)&v48[12] = 2160;
        *(_QWORD *)&v48[14] = 1752392040;
        *(_WORD *)&v48[22] = 2112;
        v49 = v43;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Got unauthenticated response when fetching share metadata for URL %{public}@%{mask.hash}@, forwarding to web", v48, 0x20u);

      }
      -[ShareAcceptor setFallbackFlowCause:](self, "setFallbackFlowCause:", v5);
      -[ShareAcceptor setWebFlowReason:](self, "setWebFlowReason:", CFSTR("notSignedIn"));
      goto LABEL_48;
    }
    v20 = objc_msgSend(v5, "code");

    if (v20 == (id)115)
      goto LABEL_22;
  }
  else
  {

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  if (!objc_msgSend(v29, "isEqualToString:", CKErrorDomain))
  {

LABEL_31:
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    if (objc_msgSend(v32, "isEqualToString:", CKErrorDomain))
    {
      if (objc_msgSend(v5, "code") == (id)3)
      {

LABEL_54:
        -[ShareAcceptor setFallbackFlowCause:](self, "setFallbackFlowCause:", v5);
        v31 = 17;
        goto LABEL_57;
      }
      v46 = objc_msgSend(v5, "code");

      if (v46 == (id)4)
        goto LABEL_54;
    }
    else
    {

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    if (objc_msgSend(v33, "isEqualToString:", CKErrorDomain) && objc_msgSend(v5, "code") == (id)12)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
      v35 = -[ShareAcceptor _urlIsALegacyiWorkShareURL:](self, "_urlIsALegacyiWorkShareURL:", v34);

      if (v35)
      {
        -[ShareAcceptor setFallbackFlowCause:](self, "setFallbackFlowCause:", v5);
LABEL_48:
        v31 = 20;
        goto LABEL_57;
      }
    }
    else
    {

    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    if (objc_msgSend(v36, "isEqualToString:", CKErrorDomain))
    {
      v37 = objc_msgSend(v5, "code");

      if (v37 == (id)20)
      {
        -[ShareAcceptor setFallbackFlowCause:](self, "setFallbackFlowCause:", 0);
        v31 = 23;
        goto LABEL_57;
      }
    }
    else
    {

    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    if (objc_msgSend(v44, "isEqualToString:", CKErrorDomain))
    {
      v45 = objc_msgSend(v5, "code");

      if (v45 == (id)110)
      {
LABEL_52:
        -[ShareAcceptor setFallbackFlowCause:](self, "setFallbackFlowCause:", v5);
        v31 = 19;
        goto LABEL_57;
      }
    }
    else
    {

    }
    -[ShareAcceptor setFallbackFlowCause:](self, "setFallbackFlowCause:", v5);
    v31 = 16;
    goto LABEL_57;
  }
  v30 = objc_msgSend(v5, "code");

  if (v30 != (id)6)
    goto LABEL_31;
  -[ShareAcceptor setFallbackFlowCause:](self, "setFallbackFlowCause:", v5);
  v31 = 18;
LABEL_57:
  -[ShareAcceptor setState:](self, "setState:", v31);
LABEL_58:
  if (__sTestOverridesAvailable
    && -[ShareAcceptor shouldTerminateAfterFetchingMetadata](self, "shouldTerminateAfterFetchingMetadata"))
  {
    -[ShareAcceptor setState:](self, "setState:", 23);
  }

  return 1;
}

- (BOOL)_urlIsALegacyiWorkShareURL:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[ShareAcceptor _urlIsAniWorkShareURL:](self, "_urlIsAniWorkShareURL:", v4))
    v5 = -[ShareAcceptor _urlHasALongToken:](self, "_urlHasALongToken:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)_urlHasALongToken:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;

  v3 = a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v4 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "CKURLThroughSlug"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "CKPathAfterSlug"));
    v25 = 138543874;
    v26 = v6;
    v27 = 2160;
    v28 = 1752392040;
    v29 = 2112;
    v30 = (uint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Verifying token length for URL %{public}@%{mask.hash}@", (uint8_t *)&v25, 0x20u);

  }
  v8 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent"));

  if ((unint64_t)objc_msgSend(v10, "length") > 3)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringFromIndex:", 3));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData CKDataFromBase64URLSafeString:](NSData, "CKDataFromBase64URLSafeString:", v16));
    v18 = objc_msgSend(v17, "length");
    v15 = (unint64_t)v18 > 0x10;
    if ((unint64_t)v18 >= 0x11)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v19 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v21 = v19;
        v22 = objc_msgSend(v17, "length");
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "CKURLThroughSlug"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "CKPathAfterSlug"));
        v25 = 134218754;
        v26 = v22;
        v27 = 2114;
        v28 = (uint64_t)v23;
        v29 = 2160;
        v30 = 1752392040;
        v31 = 2112;
        v32 = v24;
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Found shortSharingTokenData of length (%lu) for the URL %{public}@%{mask.hash}@. Forwarding to the web", (uint8_t *)&v25, 0x2Au);

      }
    }

  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v11 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "CKURLThroughSlug"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "CKPathAfterSlug"));
      v25 = 138543874;
      v26 = v13;
      v27 = 2160;
      v28 = 1752392040;
      v29 = 2112;
      v30 = (uint64_t)v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Warn: Couldn't get a short token for the URL %{public}@%{mask.hash}@", (uint8_t *)&v25, 0x20u);

    }
    v15 = 0;
  }

  return v15;
}

- (BOOL)_lookUpRegisteredBundleIDs:(id *)a3
{
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  dispatch_semaphore_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  _QWORD v33[4];
  NSObject *v34;
  uint64_t *v35;
  id v36;
  id location;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
  v7 = -[ShareAcceptor _shouldSendURLToBladeRunner:](self, "_shouldSendURLToBladeRunner:", v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "outOfNetworkMatches"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "CKBladerunnerShareURLSlugBasedApplicationBundleID"));

      if (!v12)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ShareAcceptor.m"), 1552, CFSTR("Got nil bundle id for URL: %@"), v32);

      }
      v45 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
      -[ShareAcceptor setRegisteredAppBundleIDs:](self, "setRegisteredAppBundleIDs:", v13);

    }
    else
    {
      v46 = CFSTR("com.apple.bird");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
      -[ShareAcceptor setRegisteredDaemonBundleIDs:](self, "setRegisteredDaemonBundleIDs:", v12);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
    v26 = -[ShareAcceptor _urlIsAniWorkShareURL:](self, "_urlIsAniWorkShareURL:", v25);

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "share"));
      objc_msgSend(v29, "setMutableURL:", v27);

    }
    return 1;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
  v15 = -[ShareAcceptor _shouldSendURLToPhotos:](self, "_shouldSendURLToPhotos:", v14);

  if (v15)
  {
    v44 = CFSTR("com.apple.mobileslideshow");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
    -[ShareAcceptor setRegisteredAppBundleIDs:](self, "setRegisteredAppBundleIDs:", v16);

    return 1;
  }
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_100006C4C;
  v42 = sub_100006C5C;
  v43 = 0;
  objc_initWeak(&location, self);
  v17 = dispatch_semaphore_create(0);
  v19 = (void *)objc_opt_new(CKFetchRegisteredBundleIDsOperation, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "resolvedConfiguration"));
  objc_msgSend(v20, "setRequestOriginator:", 2);

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10000C360;
  v33[3] = &unk_100024930;
  objc_copyWeak(&v36, &location);
  v35 = &v38;
  v21 = v17;
  v34 = v21;
  objc_msgSend(v19, "setFetchRegisteredBundleIDsCompletionBlock:", v33);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor metadataIndicatedContainer](self, "metadataIndicatedContainer"));
  objc_msgSend(v22, "addOperation:", v19);

  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  v23 = (void *)v39[5];
  v24 = v23 == 0;
  if (a3 && v23)
    *a3 = objc_retainAutorelease(v23);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v38, 8);

  return v24;
}

- (BOOL)_handleAppleInternalDaemon:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;

  v8 = a3;
  v9 = a4;
  -[ShareAcceptor setState:](self, "setState:", 23);
  if (v9)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v9);
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v10 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v12 = 138543362;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Daemon %{public}@ handled the share successfully, terminating", (uint8_t *)&v12, 0xCu);
    }
  }

  return v9 == 0;
}

- (BOOL)_handlePotentialAppleInternalDaemon:(id *)a3
{
  unsigned __int8 v3;
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  dispatch_semaphore_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  dispatch_time_t v23;
  intptr_t v24;
  uint64_t v25;
  NSObject *v26;
  dispatch_time_t v27;
  NSObject *v28;
  int v29;
  __int128 v31;
  id obj;
  uint64_t v34;
  id v35;
  _QWORD v36[6];
  NSObject *v37;
  _BYTE *v38;
  _QWORD v39[5];
  NSObject *v40;
  _BYTE *v41;
  _QWORD v42[5];
  _QWORD v43[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[4];
  id v49;
  _BYTE buf[24];
  uint64_t v51;
  __int128 v52;
  _BYTE v53[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor registeredDaemonBundleIDs](self, "registeredDaemonBundleIDs"));

  if (v5)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[ShareAcceptor registeredDaemonBundleIDs](self, "registeredDaemonBundleIDs"));
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v35)
    {
      v34 = *(_QWORD *)v45;
      *(_QWORD *)&v6 = 138544130;
      v31 = v6;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v45 != v34)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v7);
          if (ck_log_initialization_predicate != -1)
            dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
          v9 = (void *)ck_log_facility_ck;
          if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
          {
            v10 = v9;
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "CKURLThroughSlug"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "CKPathAfterSlug"));
            *(_DWORD *)buf = v31;
            *(_QWORD *)&buf[4] = v8;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v12;
            *(_WORD *)&buf[22] = 2160;
            v51 = 1752392040;
            LOWORD(v52) = 2112;
            *(_QWORD *)((char *)&v52 + 2) = v14;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Trying to call daemon %{public}@ for sharing URL %{public}@%{mask.hash}@", buf, 0x2Au);

          }
          v15 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", v8, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CKXPCShareDaemon));
          objc_msgSend(v15, "setRemoteObjectInterface:", v16);

          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_10000CCF4;
          v43[3] = &unk_100024660;
          v43[4] = v8;
          objc_msgSend(v15, "setInvalidationHandler:", v43);
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_10000CDC8;
          v42[3] = &unk_100024660;
          v42[4] = v8;
          objc_msgSend(v15, "setInterruptionHandler:", v42);
          objc_msgSend(v15, "resume");
          v17 = dispatch_semaphore_create(0);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v51 = (uint64_t)sub_100006C4C;
          *(_QWORD *)&v52 = sub_100006C5C;
          *((_QWORD *)&v52 + 1) = 0;
          if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.bird")))
            -[ShareAcceptor setState:](self, "setState:", 8);
          if (ck_log_initialization_predicate != -1)
            dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
          v18 = ck_log_facility_ck;
          if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v48 = 138543362;
            v49 = v15;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Invoking request on xpcconnection %{public}@", v48, 0xCu);
          }
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_10000CE9C;
          v39[3] = &unk_100024958;
          v39[4] = v8;
          v41 = buf;
          v19 = v17;
          v40 = v19;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v39));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          v36[2] = sub_10000CFB4;
          v36[3] = &unk_100024980;
          v38 = buf;
          v36[4] = v8;
          v36[5] = self;
          v22 = v19;
          v37 = v22;
          objc_msgSend(v20, "handleCloudKitShareMetadata:completionHandler:", v21, v36);

          v23 = dispatch_time(0, 200000000);
          v24 = dispatch_semaphore_wait(v22, v23);
          v25 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          if (!v24)
            goto LABEL_31;
          if (!v25)
          {
            if (ck_log_initialization_predicate != -1)
              dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
            v26 = ck_log_facility_ck;
            if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v48 = 138543362;
              v49 = v8;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Daemon %{public}@ seems to have started handling handleCloudKitShareMetadata call. Adjusting state to make sure 'Retrieving...' dialog doesn't show up/gets dismissed", v48, 0xCu);
            }
            -[ShareAcceptor setState:](self, "setState:", 8, v31);
          }
          v27 = dispatch_time(0, 60000000000);
          if (!dispatch_semaphore_wait(v22, v27))
          {
            v25 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
LABEL_31:
            v3 = -[ShareAcceptor _handleAppleInternalDaemon:response:error:](self, "_handleAppleInternalDaemon:response:error:", v8, v25, a3, v31);
            v29 = 0;
            goto LABEL_32;
          }
          if (ck_log_initialization_predicate != -1)
            dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
          v28 = ck_log_facility_ck;
          if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v48 = 138543362;
            v49 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Timed out waiting for daemon to handle share; soldiering on. %{public}@",
              v48,
              0xCu);
          }
          v29 = 1;
LABEL_32:

          _Block_object_dispose(buf, 8);
          if (!v29)
            goto LABEL_36;
          v7 = (char *)v7 + 1;
        }
        while (v35 != v7);
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v35);
    }
    v3 = 1;
LABEL_36:

  }
  else
  {
    v3 = 1;
  }
  return v3 & 1;
}

- (int64_t)_lookUpLocalBundleIDs:(id *)a3 success:(BOOL *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  void *v13;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor registeredAppBundleIDs](self, "registeredAppBundleIDs"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor registeredAppBundleIDs](self, "registeredAppBundleIDs"));
    v9 = CKSelectLocalAppNamesByBundleIDs();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    -[ShareAcceptor setLocalBundleIDsToDisplayNames:](self, "setLocalBundleIDsToDisplayNames:", v10);
    *a4 = 1;

    return 9;
  }
  else
  {
    if (a3)
    {
      v12 = CKUnderlyingErrorDomain;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", v12, 1000, CFSTR("No registered bundle IDs exist for share URL: %@"), v13));

    }
    *a4 = 0;
    return 23;
  }
}

- (BOOL)_promptAppSelection:(id *)a3
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v21;
  void *v22;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ShareAcceptor.m"), 1713, CFSTR("Got round to prompting for app selection, but no apps present. Share URL: %@"), v22);

  }
  if (-[ShareAcceptor shareNeedsAcceptance](self, "shareNeedsAcceptance")
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames")),
        v9 = objc_msgSend(v8, "count"),
        v8,
        (unint64_t)v9 >= 2))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
    v11 = objc_msgSend(v10, "count");

    if (v11 == (id)1)
      v12 = objc_claimAutoreleasedReturnValue(-[ShareAcceptor promptForSingleBundleID](self, "promptForSingleBundleID"));
    else
      v12 = objc_claimAutoreleasedReturnValue(-[ShareAcceptor chooseFromMultipleBundleIDs](self, "chooseFromMultipleBundleIDs"));
    v13 = (id)v12;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allKeys"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
    -[ShareAcceptor setChosenAppBundleID:](self, "setChosenAppBundleID:", v16);

    v13 = 0;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor chosenAppBundleID](self, "chosenAppBundleID"));

  if (!v17)
  {
    if (!v13)
    {
      v18 = CKUnderlyingErrorDomain;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
      v13 = (id)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", v18, 1000, CFSTR("No app selected (likely cancellation). While handling sharing URL: %@"), v19));

    }
    if (a3)
    {
      v13 = objc_retainAutorelease(v13);
      *a3 = v13;
    }
  }

  return v17 != 0;
}

- (BOOL)_verifySelectedApp:(id *)a3
{
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  void *v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor chosenAppBundleID](self, "chosenAppBundleID", a3));
  v21 = 0;
  v5 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v21);
  v6 = v21;
  if (v6)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v7 = ck_log_facility_ck;
    if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    v8 = "Failed to initialize LSApplicationRecord for selected app verification with bundle id %@.";
  }
  else
  {
    if (v5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "infoDictionary"));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "infoDictionary"));
        v11 = objc_msgSend(v10, "objectForKey:ofClass:", CFSTR("CKSharingSupported"), objc_opt_class(NSNumber));
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = objc_msgSend(v12, "BOOLValue");

        if ((v13 & 1) != 0)
          goto LABEL_20;
        goto LABEL_15;
      }
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v7 = ck_log_facility_ck;
    if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    v8 = "LSApplicationRecord with bundle id %@ is nil or has no infoDictionary.";
  }
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
LABEL_15:
  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
LABEL_17:
  v14 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor chosenAppBundleID](self, "chosenAppBundleID"));
    *(_DWORD *)buf = 138543362;
    v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "User needs to update app %{public}@ to a version that supports sharing", buf, 0xCu);

  }
  -[ShareAcceptor setState:](self, "setState:", 22);
  v17 = CKUnderlyingErrorDomain;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", v17, 1000, CFSTR("Selected app doesn't support sharing: %@. Share URL %@"), v4, v18));
  -[ShareAcceptor setFallbackFlowCause:](self, "setFallbackFlowCause:", v19);

LABEL_20:
  return 1;
}

- (BOOL)_checkDataclassError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor metadataIndicatedContainer](self, "metadataIndicatedContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "containerID"));
  v7 = objc_msgSend(v6, "specialContainerType");

  if (v7 == (id)5)
    return 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100006C4C;
  v25 = sub_100006C5C;
  v26 = 0;
  v9 = dispatch_semaphore_create(0);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor metadataIndicatedContainer](self, "metadataIndicatedContainer"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000D9FC;
  v13[3] = &unk_1000249A8;
  v15 = &v21;
  v16 = &v17;
  v11 = v9;
  v14 = v11;
  objc_msgSend(v10, "representativeDataclassEnabledWithCompletionHandler:", v13);

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  if (a3 && v22[5])
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKUnderlyingErrorDomain, 1000, CFSTR("Error while querying if our dataclass is enabled")));
  v8 = *((_BYTE *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v8;
}

- (int64_t)_handlePotentialOONMatches
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "outOfNetworkMatches"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
    return -[ShareAcceptor initiateVetting](self, "initiateVetting");
  else
    return 14;
}

- (BOOL)_launchApp:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_semaphore_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100006C4C;
  v24 = sub_100006C5C;
  v25 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIHandleCloudKitShareAction cloudKitShareActionWithShareMetadata:](UIHandleCloudKitShareAction, "cloudKitShareActionWithShareMetadata:", v5));

  v27 = FBSOpenApplicationOptionKeyActions;
  v26 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  v28 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts getLaunchingOptionsFromOptions:isSourceICS:](CKVettingAlerts, "getLaunchingOptionsFromOptions:isSourceICS:", v8, -[ShareAcceptor isSourceICS](self, "isSourceICS")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v9));
  v11 = dispatch_semaphore_create(0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor chosenAppBundleID](self, "chosenAppBundleID"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000DD48;
  v17[3] = &unk_1000249D0;
  v19 = &v20;
  v14 = v11;
  v18 = v14;
  objc_msgSend(v12, "openApplication:withOptions:completion:", v13, v10, v17);

  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  v15 = (void *)v21[5];
  if (a3 && v15)
    *a3 = objc_retainAutorelease(v15);

  _Block_object_dispose(&v20, 8);
  return v15 == 0;
}

- (BOOL)makeStateTransition:(id *)a3
{
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  int64_t v24;
  ShareAcceptor *v25;
  BOOL v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;

  v27 = 1;
  switch(-[ShareAcceptor state](self, "state"))
  {
    case 0:
      -[ShareAcceptor setState:](self, "setState:", 1);
      return -[ShareAcceptor _validateShareURL:](self, "_validateShareURL:", a3);
    case 1:
      -[ShareAcceptor setState:](self, "setState:", 2);
      return -[ShareAcceptor _notifyBladeRunner:](self, "_notifyBladeRunner:", a3);
    case 2:
      -[ShareAcceptor setState:](self, "setState:", 4);
      v27 = -[ShareAcceptor _fetchMetadata:](self, "_fetchMetadata:", a3);
      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v6 = (void *)ck_log_facility_ck;
      if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
        return v27;
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareMetadata](self, "shareMetadata"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "CKURLThroughSlug"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "CKPathAfterSlug"));
      *(_DWORD *)buf = 138413058;
      v29 = v8;
      v30 = 2114;
      v31 = v10;
      v32 = 2160;
      v33 = 1752392040;
      v34 = 2112;
      v35 = (uint64_t)v12;
      v13 = "Share metadata %@ ready, for sharing URL: %{public}@%{mask.hash}@";
      goto LABEL_25;
    case 3:
      -[ShareAcceptor setState:](self, "setState:", 10);
      v27 = -[ShareAcceptor _promptAppSelection:](self, "_promptAppSelection:", a3);
      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v14 = (void *)ck_log_facility_ck;
      if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
        return v27;
      v7 = v14;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor chosenAppBundleID](self, "chosenAppBundleID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "CKURLThroughSlug"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "CKPathAfterSlug"));
      *(_DWORD *)buf = 138544130;
      v29 = v8;
      v30 = 2114;
      v31 = v10;
      v32 = 2160;
      v33 = 1752392040;
      v34 = 2112;
      v35 = (uint64_t)v12;
      v13 = "User wants to open share in app %{public}@, for sharing URL: %{public}@%{mask.hash}@";
      goto LABEL_25;
    case 4:
      -[ShareAcceptor setState:](self, "setState:", 5);
      v27 = -[ShareAcceptor _getShareName](self, "_getShareName");
      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v15 = (void *)ck_log_facility_ck;
      if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
        return v27;
      v7 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor shareName](self, "shareName"));
      *(_DWORD *)buf = 138412290;
      v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Share name: %@", buf, 0xCu);

      goto LABEL_27;
    case 5:
      -[ShareAcceptor setState:](self, "setState:", 6);
      v27 = -[ShareAcceptor _lookUpRegisteredBundleIDs:](self, "_lookUpRegisteredBundleIDs:", a3);
      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v17 = (void *)ck_log_facility_ck;
      if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
        return v27;
      v7 = v17;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor registeredAppBundleIDs](self, "registeredAppBundleIDs"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor registeredDaemonBundleIDs](self, "registeredDaemonBundleIDs"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "CKURLThroughSlug"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "CKPathAfterSlug"));
      *(_DWORD *)buf = 138413314;
      v29 = v8;
      v30 = 2114;
      v31 = v9;
      v32 = 2114;
      v33 = (uint64_t)v18;
      v34 = 2160;
      v35 = 1752392040;
      v36 = 2112;
      v37 = v20;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Registered bundle IDs fetched: apps: %@ / daemons: %{public}@, for sharing URL: %{public}@%{mask.hash}@", buf, 0x34u);

      goto LABEL_26;
    case 6:
      -[ShareAcceptor setState:](self, "setState:", 7);
      return -[ShareAcceptor _handlePotentialAppleInternalDaemon:](self, "_handlePotentialAppleInternalDaemon:", a3);
    case 7:
      -[ShareAcceptor setState:](self, "setState:", -[ShareAcceptor _lookUpLocalBundleIDs:success:](self, "_lookUpLocalBundleIDs:success:", a3, &v27));
      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v21 = (void *)ck_log_facility_ck;
      if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
        return v27;
      v7 = v21;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "CKURLThroughSlug"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](self, "url"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "CKPathAfterSlug"));
      *(_DWORD *)buf = 138544130;
      v29 = v8;
      v30 = 2114;
      v31 = v10;
      v32 = 2160;
      v33 = 1752392040;
      v34 = 2112;
      v35 = (uint64_t)v12;
      v13 = "Local bundle IDs found: %{public}@, for sharing URL: %{public}@%{mask.hash}@";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v13, buf, 0x2Au);

LABEL_26:
LABEL_27:

      return v27;
    case 8:
    case 0xFLL:
      goto LABEL_44;
    case 9:
      -[ShareAcceptor setState:](self, "setState:", -[ShareAcceptor _handlePotentialOONMatches](self, "_handlePotentialOONMatches"));
      return 1;
    case 0xALL:
      -[ShareAcceptor setState:](self, "setState:", 11);
      return -[ShareAcceptor _verifySelectedApp:](self, "_verifySelectedApp:", a3);
    case 0xBLL:
      -[ShareAcceptor setState:](self, "setState:", 15);
      return -[ShareAcceptor _launchApp:](self, "_launchApp:", a3);
    case 0xCLL:
      -[ShareAcceptor setState:](self, "setState:", 23);
      return -[ShareAcceptor _initiateVettingOfSingleOONMatch:](self, "_initiateVettingOfSingleOONMatch:", a3);
    case 0xDLL:
      -[ShareAcceptor setState:](self, "setState:", 23);
      return -[ShareAcceptor _requestSelectionFromMultipleOONMatches:](self, "_requestSelectionFromMultipleOONMatches:", a3);
    case 0xELL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor localBundleIDsToDisplayNames](self, "localBundleIDsToDisplayNames"));
      -[ShareAcceptor setState:](self, "setState:", -[ShareAcceptor _checkRepresentativeDataclassEnabled:appCandidatesPresent:](self, "_checkRepresentativeDataclassEnabled:appCandidatesPresent:", a3, objc_msgSend(v22, "count") != 0));

      return 1;
    case 0x10:
      v23 = -[ShareAcceptor _fallbackFlowWarnShareUnavailable:](self, "_fallbackFlowWarnShareUnavailable:", a3);
      goto LABEL_43;
    case 0x11:
      v23 = -[ShareAcceptor _fallbackFlowWarnNetworkUnavailable:](self, "_fallbackFlowWarnNetworkUnavailable:", a3);
      goto LABEL_43;
    case 0x12:
      v23 = -[ShareAcceptor _fallbackFlowWarnServiceUnavailable:](self, "_fallbackFlowWarnServiceUnavailable:", a3);
      goto LABEL_43;
    case 0x13:
      v24 = -[ShareAcceptor _fallbackFlowICloudAccountSettings:success:](self, "_fallbackFlowICloudAccountSettings:success:", a3, &v27);
      v25 = self;
      goto LABEL_45;
    case 0x14:
      v23 = -[ShareAcceptor _fallbackFlowWebRedirect:](self, "_fallbackFlowWebRedirect:", a3);
      goto LABEL_43;
    case 0x15:
      v23 = -[ShareAcceptor _fallbackFlowDownloadApp:](self, "_fallbackFlowDownloadApp:", a3);
      goto LABEL_43;
    case 0x16:
      v23 = -[ShareAcceptor _fallbackFlowDownloadAppUpdate:](self, "_fallbackFlowDownloadAppUpdate:", a3);
LABEL_43:
      v27 = v23;
LABEL_44:
      v25 = self;
      v24 = 23;
LABEL_45:
      -[ShareAcceptor setState:](v25, "setState:", v24);
      break;
    default:
      return v27;
  }
  return v27;
}

- (void)acceptShareWithCompletionHandler:(id)a3
{
  ShareAcceptor *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  unsigned int v14;
  id v15;
  unsigned int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  char v27;
  int64_t v28;
  unsigned int v29;
  void *v30;
  void (**v32)(id, id);
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  char *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  id v47;

  v32 = (void (**)(id, id))a3;
  v4 = self;
  objc_sync_enter(v4);
  if (-[ShareAcceptor accepting](v4, "accepting"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v4, CFSTR("ShareAcceptor.m"), 1987, CFSTR("ShareAcceptor isn't meant to be used for multiple accepts."));

  }
  -[ShareAcceptor setAccepting:](v4, "setAccepting:", 1);
  objc_sync_exit(v4);

  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](v4, "url"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "CKURLThroughSlug"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](v4, "url"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "CKPathAfterSlug"));
    *(_DWORD *)buf = 138543874;
    v35 = v8;
    v36 = 2160;
    v37 = 1752392040;
    v38 = 2112;
    v39 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Accepting share for url %{public}@%{mask.hash}@", buf, 0x20u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor retrievingDialog](v4, "retrievingDialog"));
  objc_msgSend(v11, "schedule");

  v12 = 0;
  while (1)
  {
    v13 = -[ShareAcceptor state](v4, "state");
    v33 = v12;
    v14 = -[ShareAcceptor makeStateTransition:](v4, "makeStateTransition:", &v33);
    v15 = v33;

    v16 = -[ShareAcceptor cancelled](v4, "cancelled");
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v17 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](v4, "url"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "CKURLThroughSlug"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAcceptor url](v4, "url"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "CKPathAfterSlug"));
      v23 = (&off_1000249F0)[-[ShareAcceptor state](v4, "state")];
      v24 = CFSTR("false");
      if (v14)
        v25 = CFSTR("true");
      else
        v25 = CFSTR("false");
      *(_DWORD *)buf = 138544898;
      if (v16)
        v24 = CFSTR("true");
      v35 = v20;
      v36 = 2160;
      v37 = 1752392040;
      v38 = 2112;
      v39 = v22;
      v40 = 2080;
      v41 = v23;
      v42 = 2114;
      v43 = v25;
      v44 = 2114;
      v45 = v24;
      v46 = 2112;
      v47 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Share acceptance for URL: %{public}@%{mask.hash}@, completed [%s]. Success=%{public}@, cancelled: %{public}@, error: %@", buf, 0x48u);

    }
    if (((v14 ^ 1 | v16) & 1) != 0)
      break;
    if (-[ShareAcceptor state](v4, "state") == v13)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v4, CFSTR("ShareAcceptor.m"), 2010, CFSTR("State %s hasn't been advanced"), (&off_1000249F0)[v13]);

    }
    v12 = v15;
    if ((id)-[ShareAcceptor state](v4, "state") == (id)23)
    {
      v16 = 0;
      break;
    }
  }
  -[ShareAcceptor setState:](v4, "setState:", 23);
  if (v15)
    v27 = 1;
  else
    v27 = v14;
  if ((v27 & 1) == 0)
  {
    v28 = -[ShareAcceptor state](v4, "state");
    v15 = (id)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKUnderlyingErrorDomain, 1000, CFSTR("Failure accepting share while in [%s]"), (&off_1000249F0)[v28]));
  }
  if (v15)
    v29 = 0;
  else
    v29 = v16;
  if (v29 == 1)
    v15 = (id)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKUnderlyingErrorDomain, 1000, CFSTR("Acceptance cancelled by the user")));
  v32[2](v32, v15);

}

- (unint64_t)backgroundTaskID
{
  return self->_backgroundTaskID;
}

- (void)setBackgroundTaskID:(unint64_t)a3
{
  self->_backgroundTaskID = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)shouldTerminateAfterFetchingMetadata
{
  return self->_shouldTerminateAfterFetchingMetadata;
}

- (void)setShouldTerminateAfterFetchingMetadata:(BOOL)a3
{
  self->_shouldTerminateAfterFetchingMetadata = a3;
}

- (CKShareMetadata)shareMetadata
{
  return self->_shareMetadata;
}

- (void)setShareMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CKContainer)testTargetContainer
{
  return self->_testTargetContainer;
}

- (void)setTestTargetContainer:(id)a3
{
  objc_storeStrong((id *)&self->_testTargetContainer, a3);
}

- (RetrievingDialog)retrievingDialog
{
  return self->_retrievingDialog;
}

- (CKDeviceToDeviceShareInvitationToken)invitationToken
{
  return self->_invitationToken;
}

- (void)setInvitationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)shareName
{
  return self->_shareName;
}

- (void)setShareName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)registeredAppBundleIDs
{
  return self->_registeredAppBundleIDs;
}

- (void)setRegisteredAppBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)registeredDaemonBundleIDs
{
  return self->_registeredDaemonBundleIDs;
}

- (void)setRegisteredDaemonBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)localBundleIDsToDisplayNames
{
  return self->_localBundleIDsToDisplayNames;
}

- (void)setLocalBundleIDsToDisplayNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)chosenAppBundleID
{
  return self->_chosenAppBundleID;
}

- (void)setChosenAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CKShareParticipant)singleOONMatch
{
  return self->_singleOONMatch;
}

- (void)setSingleOONMatch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSPersonNameComponents)currentUserNameComponents
{
  return self->_currentUserNameComponents;
}

- (void)setCurrentUserNameComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)currentUserFormattedUsername
{
  return self->_currentUserFormattedUsername;
}

- (void)setCurrentUserFormattedUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setMetadataIndicatedContainer:(id)a3
{
  objc_storeStrong((id *)&self->_metadataIndicatedContainer, a3);
}

- (NSString)selectedAccountID
{
  return self->_selectedAccountID;
}

- (void)setSelectedAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (BOOL)hasValidConnection
{
  return self->_hasValidConnection;
}

- (void)setHasValidConnection:(BOOL)a3
{
  self->_hasValidConnection = a3;
}

- (BOOL)accepting
{
  return self->_accepting;
}

- (void)setAccepting:(BOOL)a3
{
  self->_accepting = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (NSError)fallbackFlowCause
{
  return self->_fallbackFlowCause;
}

- (void)setFallbackFlowCause:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackFlowCause, a3);
}

- (NSString)webFlowReason
{
  return self->_webFlowReason;
}

- (void)setWebFlowReason:(id)a3
{
  objc_storeStrong((id *)&self->_webFlowReason, a3);
}

- (BOOL)isSourceICS
{
  return self->_isSourceICS;
}

- (void)setIsSourceICS:(BOOL)a3
{
  self->_isSourceICS = a3;
}

- (NSDictionary)unitTestOverrides
{
  return self->_unitTestOverrides;
}

- (void)setUnitTestOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_unitTestOverrides, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTestOverrides, 0);
  objc_storeStrong((id *)&self->_webFlowReason, 0);
  objc_storeStrong((id *)&self->_fallbackFlowCause, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_selectedAccountID, 0);
  objc_storeStrong((id *)&self->_metadataIndicatedContainer, 0);
  objc_storeStrong((id *)&self->_currentUserFormattedUsername, 0);
  objc_storeStrong((id *)&self->_currentUserNameComponents, 0);
  objc_storeStrong((id *)&self->_singleOONMatch, 0);
  objc_storeStrong((id *)&self->_chosenAppBundleID, 0);
  objc_storeStrong((id *)&self->_localBundleIDsToDisplayNames, 0);
  objc_storeStrong((id *)&self->_registeredDaemonBundleIDs, 0);
  objc_storeStrong((id *)&self->_registeredAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_shareName, 0);
  objc_storeStrong((id *)&self->_invitationToken, 0);
  objc_storeStrong((id *)&self->_retrievingDialog, 0);
  objc_storeStrong((id *)&self->_testTargetContainer, 0);
  objc_storeStrong((id *)&self->_shareMetadata, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
