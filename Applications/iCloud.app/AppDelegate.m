@implementation AppDelegate

- (BOOL)_shouldLaunchAcceptFlowForShareURL:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = qword_10002A790;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_10002A790, &stru_100024BB8);
  v5 = (void *)qword_10002A798;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "CKURLSlug"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lowercaseString"));
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v7);

  return (char)v5;
}

- (void)initOnce
{
  AppDelegate *v2;
  NSObject *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  id v9;
  id v10;
  int v11;
  AppDelegate *v12;

  v2 = self;
  objc_sync_enter(v2);
  if (!-[AppDelegate isInitialized](v2, "isInitialized"))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v3 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v11 = 134217984;
      v12 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Initializing iCloud sharing AppDelegate: %p", (uint8_t *)&v11, 0xCu);
    }
    v4 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.cloudkit.sharebear.acceptqueue", v7);
    -[AppDelegate setAcceptQueue:](v2, "setAcceptQueue:", v8);

    v9 = objc_alloc_init((Class)NSMutableSet);
    -[AppDelegate setActiveSharingURLs:](v2, "setActiveSharingURLs:", v9);

    v10 = objc_alloc_init((Class)NSMutableDictionary);
    -[AppDelegate setActiveVettingURLToVettingAcceptor:](v2, "setActiveVettingURLToVettingAcceptor:", v10);

    -[AppDelegate setIsInitialized:](v2, "setIsInitialized:", 1);
  }
  objc_sync_exit(v2);

}

- (void)injectTestTargetContainer:(id)a3
{
  if (__sTestOverridesAvailable)
    -[AppDelegate setTestContainer:](self, "setTestContainer:", a3);
}

- (OS_dispatch_queue)acceptQueue
{
  -[AppDelegate initOnce](self, "initOnce");
  return self->_acceptQueue;
}

- (NSMutableSet)activeSharingURLs
{
  -[AppDelegate initOnce](self, "initOnce");
  return self->_activeSharingURLs;
}

- (NSMutableDictionary)activeVettingURLToVettingAcceptor
{
  -[AppDelegate initOnce](self, "initOnce");
  return self->_activeVettingURLToVettingAcceptor;
}

- (void)_synchronouslyAcceptShareWithAcceptor:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  dispatch_semaphore_t v11;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v6 = objc_claimAutoreleasedReturnValue(-[AppDelegate acceptQueue](self, "acceptQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100014F24;
  v9[3] = &unk_100024C08;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, v9);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_acceptShareWithAcceptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate activeSharingURLs](self, "activeSharingURLs"));
  v7 = objc_msgSend(v6, "CKSynchronizedAddIfAbsent:", v5);

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000153F0;
    v24[3] = &unk_100024660;
    v9 = v4;
    v25 = v9;
    objc_msgSend(v9, "setBackgroundTaskID:", objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.cloudkit.ShareBear.handleShareURL"), v24));

    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v10 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v11 = v10;
      v12 = objc_msgSend(v9, "backgroundTaskID");
      *(_DWORD *)buf = 134217984;
      v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Started background task of handling share URL, taskID is %lu", buf, 0xCu);

    }
    objc_initWeak((id *)buf, v9);
    objc_initWeak(&location, self);
    v13 = objc_claimAutoreleasedReturnValue(-[AppDelegate acceptQueue](self, "acceptQueue"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000154DC;
    v18[3] = &unk_100024C80;
    v19 = v9;
    v20 = v5;
    objc_copyWeak(&v21, &location);
    objc_copyWeak(&v22, (id *)buf);
    dispatch_async(v13, v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v14 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "CKURLThroughSlug"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "CKPathAfterSlug"));
      *(_DWORD *)buf = 138543874;
      v27 = v16;
      v28 = 2160;
      v29 = 1752392040;
      v30 = 2112;
      v31 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Sharing URL is already being handled, ignoring: %{public}@%{mask.hash}@", buf, 0x20u);

    }
  }

}

- (void)acceptShareWithURL:(id)a3 invitationToken:(id)a4 isSourceICS:(BOOL)a5 unitTestOverrides:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  ShareAcceptor *v15;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v15 = -[ShareAcceptor initWithCloudKitURL:invitationToken:isSourceICS:unitTestOverrides:]([ShareAcceptor alloc], "initWithCloudKitURL:invitationToken:isSourceICS:unitTestOverrides:", v12, v11, v6, v10);

  if (__sTestOverridesAvailable)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate testContainer](self, "testContainer"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate testContainer](self, "testContainer"));
      -[ShareAcceptor setTestTargetContainer:](v15, "setTestTargetContainer:", v14);

    }
    -[ShareAcceptor setShouldTerminateAfterFetchingMetadata:](v15, "setShouldTerminateAfterFetchingMetadata:", 1);
  }
  -[AppDelegate setShareAcceptor:](self, "setShareAcceptor:", v15);
  if (__sTestOverridesAvailable)
    -[AppDelegate _synchronouslyAcceptShareWithAcceptor:](self, "_synchronouslyAcceptShareWithAcceptor:", v15);
  else
    -[AppDelegate _acceptShareWithAcceptor:](self, "_acceptShareWithAcceptor:", v15);

}

- (void)acceptShareWithMetadata:(id)a3 shareURL:(id)a4
{
  id v6;
  id v7;
  ShareAcceptor *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[ShareAcceptor initWithShareMetadata:shareURL:]([ShareAcceptor alloc], "initWithShareMetadata:shareURL:", v7, v6);

  -[AppDelegate _acceptShareWithAcceptor:](self, "_acceptShareWithAcceptor:", v8);
}

- (void)vetURL:(id)a3
{
  id v4;
  VettingAcceptor *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  VettingAcceptor *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  VettingAcceptor *v16;
  id v17;
  id v18;
  id v19;
  id location;
  _QWORD v21[4];
  VettingAcceptor *v22;
  uint8_t buf[4];
  id v24;

  v4 = a3;
  v5 = -[VettingAcceptor initWithCloudKitURL:]([VettingAcceptor alloc], "initWithCloudKitURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate activeVettingURLToVettingAcceptor](self, "activeVettingURLToVettingAcceptor"));
  v7 = objc_msgSend(v6, "CKSynchronizedSetIfAbsentObject:forKey:", v5, v4);

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100015D0C;
    v21[3] = &unk_100024660;
    v9 = v5;
    v22 = v9;
    -[VettingAcceptor setBackgroundTaskID:](v9, "setBackgroundTaskID:", objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.cloudkit.ShareBear.handleVettingURL"), v21));

    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v10 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v11 = v10;
      v12 = -[VettingAcceptor backgroundTaskID](v9, "backgroundTaskID");
      *(_DWORD *)buf = 134217984;
      v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Started background task of handling vetting URL, taskID is %lu", buf, 0xCu);

    }
    objc_initWeak((id *)buf, v9);
    objc_initWeak(&location, self);
    v13 = objc_claimAutoreleasedReturnValue(-[AppDelegate acceptQueue](self, "acceptQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100015DF8;
    v15[3] = &unk_100024C80;
    v16 = v9;
    objc_copyWeak(&v18, &location);
    v17 = v4;
    objc_copyWeak(&v19, (id *)buf);
    dispatch_async(v13, v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v14 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Vetting URL is already being handled, ignoring: %@", buf, 0xCu);
    }
  }

}

- (BOOL)_handleURL:(id)a3 invitationToken:(id)a4 isSourceICS:(BOOL)a5 unitTestOverrides:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[AppDelegate _shouldLaunchAcceptFlowForShareURL:](self, "_shouldLaunchAcceptFlowForShareURL:", v10))
  {
    LOBYTE(v13) = 1;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v10, 1));
    objc_msgSend(v14, "setScheme:", kCKURLComponentsScheme);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URL"));
    -[AppDelegate acceptShareWithURL:invitationToken:isSourceICS:unitTestOverrides:](self, "acceptShareWithURL:invitationToken:isSourceICS:unitTestOverrides:", v15, v11, v7, v12);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "CKURLSlug"));
    v13 = objc_msgSend(v16, "isEqualToString:", kCKVettingURLSlug);

    if (v13)
    {
      -[AppDelegate vetURL:](self, "vetURL:", v10);
      LOBYTE(v13) = 1;
    }
  }

  return v13;
}

- (BOOL)_canBeAcceptedOnWatch:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "CKURLSlug"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));

  if ((objc_msgSend(v4, "isEqualToString:", kCKRemindersShareURLSlug) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", kCKGenericShareURLSlug);

  return v5;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_activity_scope_state_s v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create((void *)&_mh_execute_header, "ShareBear/AppDelegate/openURL", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v11, &v13);
  -[AppDelegate _handleURL:invitationToken:isSourceICS:unitTestOverrides:](self, "_handleURL:invitationToken:isSourceICS:unitTestOverrides:", v9, 0, 0, 0);
  os_activity_scope_leave(&v13);

  return 1;
}

- (id)_decodeURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  id v22;
  NSSet *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;

  v33 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "percentEncodedQuery"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("&")));
  if (!objc_msgSend(v5, "count"))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v19 = ck_log_facility_ck;
    if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      goto LABEL_27;
    *(_DWORD *)buf = 138412290;
    v41 = v33;
    v20 = "URL %@ does not have any query items. This is probably a stingray share";
    goto LABEL_26;
  }
  v30 = v4;
  v31 = v3;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v32 = v5;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v10), "componentsSeparatedByString:", CFSTR("=")));
        if (objc_msgSend(v11, "count") == (id)2)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByRemovingPercentEncoding"));

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 1));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByRemovingPercentEncoding"));

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByRemovingPercentEncoding"));
          if ((objc_msgSend(v16, "isEqualToString:", v15) & 1) == 0)
          {
            if (ck_log_initialization_predicate != -1)
              dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
            v17 = ck_log_facility_ck;
            if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v33;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Token from URL %@ is doubly encoded", buf, 0xCu);
            }
            v18 = v16;

            v15 = v18;
          }
          if (objc_msgSend(v13, "isEqualToString:", CFSTR("token")))
          {
            v22 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v15, 0);
            v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(CKDeviceToDeviceShareInvitationToken), 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
            v34 = 0;
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v24, v22, &v34));
            v25 = v34;

            v29 = v22;
            if (v25)
            {
              v4 = v30;
              v3 = v31;
              if (ck_log_initialization_predicate != -1)
                dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
              v26 = ck_log_facility_ck;
              if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v41 = v21;
                _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to unarchive device to device invitation token: %@", buf, 0xCu);
              }

              v21 = 0;
            }
            else
            {
              v4 = v30;
              v3 = v31;
              if (ck_log_initialization_predicate != -1)
                dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
              v27 = ck_log_facility_ck;
              if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v41 = v33;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Successfully unarchived token from URL: %@", buf, 0xCu);
              }
            }

            v5 = v32;
            goto LABEL_39;
          }

        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v8)
        continue;
      break;
    }
  }

  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v4 = v30;
  v3 = v31;
  v19 = ck_log_facility_ck;
  v5 = v32;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v33;
    v20 = "Did not get any token from URL %@";
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v20, buf, 0xCu);
  }
LABEL_27:
  v21 = 0;
LABEL_39:

  return v21;
}

- (BOOL)handleUniversalLinkInUserActivity:(id)a3
{
  return -[AppDelegate handleUniversalLinkInUserActivity:unitTestOverrides:](self, "handleUniversalLinkInUserActivity:unitTestOverrides:", a3, 0);
}

- (BOOL)handleUniversalLinkInUserActivity:(id)a3 unitTestOverrides:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v28;
  NSObject *v29;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  const __CFString *v42;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityType"));
  v9 = objc_msgSend(v8, "isEqual:", NSUserActivityTypeBrowsingWeb);

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "webpageURL"));
    if (v10)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      v29 = _os_activity_create((void *)&_mh_execute_header, "ShareBear/AppDelegate/handleUniversalLinkInUserActivity", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v29, &state);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate _decodeURL:](self, "_decodeURL:", v10));
      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v12 = ck_log_facility_ck;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = v11;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "CKURLThroughSlug"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "CKPathAfterSlug"));
        *(_DWORD *)buf = 138544130;
        v32 = v14;
        v33 = 2160;
        v34 = 1752392040;
        v35 = 2112;
        v36 = (uint64_t)v15;
        v37 = 2112;
        v38 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Handler called for CK sharing/vetting URL: %{public}@%{mask.hash}@, invitationToken %@", buf, 0x2Au);

        v11 = v13;
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("_sourceApplication")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKeyPath:", CFSTR("_originatingProcess.bundleIdentifier")));
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.InCallService")) & 1) != 0)
        v18 = 1;
      else
        v18 = (uint64_t)objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.InCallService"));
      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v22 = ck_log_facility_ck;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v28 = v11;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "CKURLThroughSlug"));
        v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "CKPathAfterSlug"));
        v25 = (void *)v24;
        v26 = CFSTR("NO");
        *(_DWORD *)buf = 138544642;
        v33 = 2160;
        v32 = v23;
        if ((_DWORD)v18)
          v26 = CFSTR("YES");
        v34 = 1752392040;
        v35 = 2112;
        v36 = v24;
        v37 = 2112;
        v38 = v16;
        v39 = 2112;
        v40 = v17;
        v41 = 2112;
        v42 = v26;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "URL: %{public}@%{mask.hash}@, sourceApplication %@, bundleID %@, isSourceICS: %@", buf, 0x3Eu);

        v11 = v28;
      }

      v20 = -[AppDelegate _handleURL:invitationToken:isSourceICS:unitTestOverrides:](self, "_handleURL:invitationToken:isSourceICS:unitTestOverrides:", v10, v11, v18, v7);
      os_activity_scope_leave(&state);

    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v21 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unexpected: webpageURL is nil", buf, 2u);
      }
      v20 = 0;
    }

  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v19 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "activityType is not NSUserActivityTypeBrowsingWeb - ignoring", buf, 2u);
    }
    v20 = 0;
  }

  return v20;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  return -[AppDelegate handleUniversalLinkInUserActivity:](self, "handleUniversalLinkInUserActivity:", a4);
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (BOOL)isInitialized
{
  return self->_isInitialized;
}

- (void)setIsInitialized:(BOOL)a3
{
  self->_isInitialized = a3;
}

- (void)setAcceptQueue:(id)a3
{
  objc_storeStrong((id *)&self->_acceptQueue, a3);
}

- (void)setActiveSharingURLs:(id)a3
{
  objc_storeStrong((id *)&self->_activeSharingURLs, a3);
}

- (void)setActiveVettingURLToVettingAcceptor:(id)a3
{
  objc_storeStrong((id *)&self->_activeVettingURLToVettingAcceptor, a3);
}

- (ShareAcceptor)shareAcceptor
{
  return self->_shareAcceptor;
}

- (void)setShareAcceptor:(id)a3
{
  objc_storeStrong((id *)&self->_shareAcceptor, a3);
}

- (CKContainer)testContainer
{
  return self->_testContainer;
}

- (void)setTestContainer:(id)a3
{
  objc_storeStrong((id *)&self->_testContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testContainer, 0);
  objc_storeStrong((id *)&self->_shareAcceptor, 0);
  objc_storeStrong((id *)&self->_activeVettingURLToVettingAcceptor, 0);
  objc_storeStrong((id *)&self->_activeSharingURLs, 0);
  objc_storeStrong((id *)&self->_acceptQueue, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
