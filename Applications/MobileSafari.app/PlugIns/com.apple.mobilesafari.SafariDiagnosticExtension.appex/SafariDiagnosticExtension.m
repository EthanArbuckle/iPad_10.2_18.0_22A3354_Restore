@implementation SafariDiagnosticExtension

- (id)_readOnlyTabCollection
{
  if (qword_10000CC58 != -1)
    dispatch_once(&qword_10000CC58, &stru_100008328);
  return (id)qword_10000CC50;
}

+ (id)_tabCollection
{
  if (qword_10000CC68 != -1)
    dispatch_once(&qword_10000CC68, &stru_100008348);
  return (id)qword_10000CC60;
}

+ (id)tabGroupManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000014A4;
  block[3] = &unk_100008368;
  block[4] = a1;
  if (qword_10000CC78 != -1)
    dispatch_once(&qword_10000CC78, block);
  return (id)qword_10000CC70;
}

+ (id)sharedProfileDelegate
{
  if (qword_10000CC88 != -1)
    dispatch_once(&qword_10000CC88, &stru_100008388);
  return (id)qword_10000CC80;
}

+ (id)defaultWebExtensionsController
{
  if (qword_10000CC98 != -1)
    dispatch_once(&qword_10000CC98, &stru_1000083A8);
  return (id)qword_10000CC90;
}

+ (id)defaultContentBlockerManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000169C;
  block[3] = &unk_100008368;
  block[4] = a1;
  if (qword_10000CCA8 != -1)
    dispatch_once(&qword_10000CCA8, block);
  return (id)qword_10000CCA0;
}

+ (void)initialize
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  v2 = _SFSafariContainerPath(a1);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v2));
  setenv("HOME", (const char *)objc_msgSend(v3, "fileSystemRepresentation"), 1);
  v7 = objc_retainAutorelease(v3);
  v4 = setenv("CFFIXED_USER_HOME", (const char *)objc_msgSend(v7, "fileSystemRepresentation"), 1);
  v5 = _SFSafariTemporaryDirectoryPath(v4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v5));
  setenv("TMPDIR", (const char *)objc_msgSend(v6, "fileSystemRepresentation"), 1);

}

- (SafariDiagnosticExtension)init
{
  SafariDiagnosticExtension *v2;
  SafariDiagnosticExtension *v3;
  SafariDiagnosticExtension *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *databaseQueue;
  SafariDiagnosticExtension *v7;
  _QWORD block[4];
  SafariDiagnosticExtension *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SafariDiagnosticExtension;
  v2 = -[SafariDiagnosticExtension init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100001864;
    block[3] = &unk_1000083D0;
    v4 = v2;
    v10 = v4;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    v5 = dispatch_queue_create("com.apple.MobileSafari.SafariDiagnosticExtension.DatabaseQueue", 0);
    databaseQueue = v4->_databaseQueue;
    v4->_databaseQueue = (OS_dispatch_queue *)v5;

    v7 = v4;
  }

  return v3;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
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
  NSObject *v20;
  id v21;
  int v23;
  id v24;

  v4 = a3;
  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  v5 = qword_10000CC40;
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting to gather diagnostic extension attachments", (uint8_t *)&v23, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("DEExtensionAttachmentsParamConsentProvidedKey"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _openTabsAttachment](self, "_openTabsAttachment"));
    if (v8)
      objc_msgSend(v6, "addObject:", v8);
    if (+[WBSFeatureAvailability isInternalInstall](WBSFeatureAvailability, "isInternalInstall"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _cloudKitDataAttachment](self, "_cloudKitDataAttachment"));
      objc_msgSend(v6, "safari_addObjectUnlessNil:", v9);

    }
  }
  v10 = v7 ^ 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _tabsDatabaseAttachmentsItemHidingSensitiveData:](self, "_tabsDatabaseAttachmentsItemHidingSensitiveData:", v10));
  objc_msgSend(v6, "safari_addObjectsFromArrayUnlessNil:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _tabCollectionDataAttachmentItemHidingSensitiveData:](self, "_tabCollectionDataAttachmentItemHidingSensitiveData:", v10));
  objc_msgSend(v6, "safari_addObjectUnlessNil:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _contentBlockerListAttachment](self, "_contentBlockerListAttachment"));
  if (v13)
    objc_msgSend(v6, "addObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _webExtensionsListAttachment](self, "_webExtensionsListAttachment"));
  if (v14)
    objc_msgSend(v6, "addObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _currentLayoutModeAttachment](self, "_currentLayoutModeAttachment"));
  objc_msgSend(v6, "safari_addObjectUnlessNil:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _bookmarksAttachmentItem](self, "_bookmarksAttachmentItem"));
  if (v16)
    objc_msgSend(v6, "addObject:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _migrationEligibilityLogItem](self, "_migrationEligibilityLogItem"));
  if (v17)
    objc_msgSend(v6, "addObject:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _getAttachmentsWithDisplayNamePattern:](self, "_getAttachmentsWithDisplayNamePattern:", CFSTR("com\\.apple\\.WebKit.*")));
  objc_msgSend(v6, "addObjectsFromArray:", v18);

  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  v19 = (void *)qword_10000CC40;
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    v21 = objc_msgSend(v6, "count");
    v23 = 134217984;
    v24 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Finished gathering %lu diagnostic extension attachments", (uint8_t *)&v23, 0xCu);

  }
  return v6;
}

- (id)_currentLayoutModeAttachment
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  NSString *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v20;

  if (_SFDeviceIsPad(self, a2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults safari_browserDefaults](NSUserDefaults, "safari_browserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", SFEnableStandaloneTabBarKey);

    v5 = CFSTR("Compact");
    if (v4)
      v5 = CFSTR("Separate");
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Current Tab Bar Layout: %@"), v5);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SFFeatureManager sharedFeatureManager](SFFeatureManager, "sharedFeatureManager"));
    v8 = objc_msgSend(v7, "preferredCapsuleLayoutStyle");

    v9 = CFSTR("Top");
    if (v8 != (id)2)
      v9 = 0;
    if (v8 == (id)1)
      v9 = CFSTR("BottomWithToolbar");
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Current Capsule Layout: %@"), v9);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "safari_filenameFormattedString"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _temporaryDirectory](self, "_temporaryDirectory"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Safari Current Layout State_%@.log"), v12));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", v14));

  v20 = 0;
  LODWORD(v14) = objc_msgSend(v10, "writeToFile:atomically:encoding:error:", v15, 1, 4, &v20);
  v16 = v20;
  v17 = v16;
  if (!(_DWORD)v14 || v16)
  {
    if (qword_10000CC48 != -1)
      dispatch_once(&qword_10000CC48, &stru_100008308);
    if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_ERROR))
      sub_100004B58();
    v18 = 0;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPath:](DEAttachmentItem, "attachmentWithPath:", v15));
    objc_msgSend(v18, "setDeleteOnAttach:", &__kCFBooleanTrue);
  }

  return v18;
}

- (void)_addTabGroup:(id)a3 inWindow:(id)a4 toLog:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeTabUUIDForTabGroupWithUUID:", v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tabWithUUID:", v18));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
  objc_msgSend(v9, "appendFormat:", CFSTR("%@\n"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tabs"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100001F98;
  v19[3] = &unk_1000083F8;
  v20 = v7;
  v21 = v11;
  v22 = v8;
  v23 = v9;
  v14 = v9;
  v15 = v8;
  v16 = v11;
  v17 = v7;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v19);

}

- (void)_addWindow:(id)a3 withActiveTabGroup:(id)a4 toLog:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid"));
  objc_msgSend(v9, "appendFormat:", CFSTR("Browser Window : %@\n\n"), v10);
  if (+[WBSFeatureAvailability isSafariProfilesEnabled](WBSFeatureAvailability, "isSafariProfilesEnabled"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "profileIdentifier"));
    objc_msgSend(v9, "appendFormat:", CFSTR("Active Profile: %@\n\n"), v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localTabGroup"));
  -[SafariDiagnosticExtension _addTabGroup:inWindow:toLog:](self, "_addTabGroup:inWindow:toLog:", v12, v15, v9);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localTabGroup"));
  v14 = WBSIsEqual(v8, v13);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(v9, "appendString:", CFSTR("\n"));
    -[SafariDiagnosticExtension _addTabGroup:inWindow:toLog:](self, "_addTabGroup:inWindow:toLog:", v8, v15, v9);
  }
  objc_msgSend(v9, "appendString:", CFSTR("\n\n"));

}

- (id)_openTabsAttachment
{
  NSObject *v2;
  const char *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  void *v34;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[16];
  _QWORD v45[2];
  _BYTE v46[128];

  if (+[WBSFeatureAvailability isSafariProfilesEnabled](WBSFeatureAvailability, "isSafariProfilesEnabled"))
  {
    if (qword_10000CC48 != -1)
      dispatch_once(&qword_10000CC48, &stru_100008308);
    v2 = qword_10000CC40;
    if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v3 = "Starting to gather open tabs, tab groups, and profiles";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, v3, buf, 2u);
    }
  }
  else
  {
    if (qword_10000CC48 != -1)
      dispatch_once(&qword_10000CC48, &stru_100008308);
    v2 = qword_10000CC40;
    if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v3 = "Starting to gather open tabs and tab groups";
      goto LABEL_10;
    }
  }
  v4 = objc_alloc_init((Class)WBReadonlyTabCollection);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowStates"));
  if (objc_msgSend(v5, "count"))
  {
    v36 = objc_alloc_init((Class)NSMutableString);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "safari_filenameFormattedString"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _temporaryDirectory](self, "_temporaryDirectory"));
    v30 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Safari URLs for All Tabs_%@.log"), v7));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v9));

    v29 = v4;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allNamedTabGroupsUnsorted"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v31 = v5;
    obj = v5;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "activeTabGroupUUID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localTabGroup"));
          v45[0] = v16;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "privateTabGroup"));
          v45[1] = v17;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 2));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "arrayByAddingObjectsFromArray:", v18));

          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_100002778;
          v38[3] = &unk_100008420;
          v39 = v15;
          v20 = v15;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "safari_firstObjectPassingTest:", v38));
          -[SafariDiagnosticExtension _addWindow:withActiveTabGroup:toLog:](self, "_addWindow:withActiveTabGroup:toLog:", v14, v21, v36);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v11);
    }

    objc_msgSend(v36, "appendString:", CFSTR("\n"));
    v37 = 0;
    v22 = objc_msgSend(v36, "writeToFile:atomically:encoding:error:", v32, 1, 4, &v37);
    v23 = v37;
    if ((v22 & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPath:](DEAttachmentItem, "attachmentWithPath:", v32));
      objc_msgSend(v24, "setDeleteOnAttach:", &__kCFBooleanTrue);
      if (qword_10000CC48 != -1)
        dispatch_once(&qword_10000CC48, &stru_100008308);
      v4 = v29;
      v25 = v30;
      v5 = v31;
      v26 = qword_10000CC40;
      if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Finished gathering open tabs", buf, 2u);
      }
    }
    else
    {
      v25 = v30;
      v5 = v31;
      if (qword_10000CC48 != -1)
        dispatch_once(&qword_10000CC48, &stru_100008308);
      v4 = v29;
      if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_ERROR))
        sub_100004BDC();
      v24 = 0;
    }

  }
  else
  {
    if (qword_10000CC48 != -1)
      dispatch_once(&qword_10000CC48, &stru_100008308);
    v27 = qword_10000CC40;
    if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No windows are currently open", buf, 2u);
    }
    v24 = 0;
  }

  return v24;
}

- (void)contentBlockerManagerExtensionListDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  v5 = qword_10000CC40;
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Content Blocker extension list changed", v6, 2u);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphoreWaitingForChangeInContentBlockers);

}

- (id)_contentBlockerListAttachment
{
  NSObject *v3;
  id v4;
  OS_dispatch_semaphore *semaphoreWaitingForChangeInContentBlockers;
  dispatch_time_t v6;
  void *v7;
  id v8;
  id v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  NSObject *v26;
  void *v27;
  unsigned __int8 v28;
  id v29;
  NSObject *v30;
  SafariDiagnosticExtension *v32;
  id obj;
  uint64_t v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[16];
  _BYTE v42[128];

  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  v3 = qword_10000CC40;
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting to gather content blockers", buf, 2u);
  }
  v4 = objc_msgSend((id)objc_opt_class(self), "defaultContentBlockerManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v32 = self;
  semaphoreWaitingForChangeInContentBlockers = self->_semaphoreWaitingForChangeInContentBlockers;
  v6 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait((dispatch_semaphore_t)semaphoreWaitingForChangeInContentBlockers, v6);
  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_DEBUG))
    sub_100004CE4();
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "extensions"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v8)
  {
    v9 = v8;
    v34 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        v11 = v7;
        if (*(_QWORD *)v38 != v34)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "displayNameForExtension:", v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_plugIn"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v13, v15));

        v17 = objc_msgSend(v35, "extensionIsEnabled:", v12);
        v18 = CFSTR("disabled:");
        if (v17)
          v18 = CFSTR("enabled:");
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v18, v16));
        v7 = v11;
        objc_msgSend(v11, "addObject:", v19);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v7, "count"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "safari_filenameFormattedString"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _temporaryDirectory](v32, "_temporaryDirectory"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Safari Content Blockers_%@.log"), v21));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingPathComponent:", v23));

    if (objc_msgSend(v7, "count"))
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n")));
    else
      v25 = CFSTR("No Content Blockers found.");
    v36 = 0;
    v28 = -[__CFString writeToFile:atomically:encoding:error:](v25, "writeToFile:atomically:encoding:error:", v24, 1, 4, &v36);
    v29 = v36;
    if ((v28 & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPath:](DEAttachmentItem, "attachmentWithPath:", v24));
      objc_msgSend(v27, "setDeleteOnAttach:", &__kCFBooleanTrue);
      if (qword_10000CC48 != -1)
        dispatch_once(&qword_10000CC48, &stru_100008308);
      v30 = qword_10000CC40;
      if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Finished gathering content blockers", buf, 2u);
      }
    }
    else
    {
      if (qword_10000CC48 != -1)
        dispatch_once(&qword_10000CC48, &stru_100008308);
      if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_ERROR))
        sub_100004C60();
      v27 = 0;
    }

  }
  else
  {
    if (qword_10000CC48 != -1)
      dispatch_once(&qword_10000CC48, &stru_100008308);
    v26 = qword_10000CC40;
    if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "No content blocker extensions found", buf, 2u);
    }
    v27 = 0;
  }

  return v27;
}

- (void)extensionsControllerExtensionListDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  v5 = qword_10000CC40;
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Web extensions list changed", v6, 2u);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphoreWaitingForChangeInWebExtensions);

}

- (id)_webExtensionsListAttachment
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  _QWORD block[5];
  id v19;
  uint8_t buf[16];

  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  v3 = qword_10000CC40;
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting to gather web extensions", buf, 2u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003158;
  block[3] = &unk_100008448;
  block[4] = self;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v19 = v4;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "safari_filenameFormattedString"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _temporaryDirectory](self, "_temporaryDirectory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Safari Web Extensions_%@.log"), v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n")));
    v17 = 0;
    v11 = objc_msgSend(v10, "writeToFile:atomically:encoding:error:", v9, 1, 4, &v17);
    v12 = v17;
    if ((v11 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPath:](DEAttachmentItem, "attachmentWithPath:", v9));
      objc_msgSend(v13, "setDeleteOnAttach:", &__kCFBooleanTrue);
      if (qword_10000CC48 != -1)
        dispatch_once(&qword_10000CC48, &stru_100008308);
      v14 = qword_10000CC40;
      if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Finished gathering web extensions", buf, 2u);
      }
    }
    else
    {
      if (qword_10000CC48 != -1)
        dispatch_once(&qword_10000CC48, &stru_100008308);
      if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_ERROR))
        sub_100004D10();
      v13 = 0;
    }

  }
  else
  {
    if (qword_10000CC48 != -1)
      dispatch_once(&qword_10000CC48, &stru_100008308);
    v15 = qword_10000CC40;
    if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "No web extensions found", buf, 2u);
    }
    v13 = 0;
  }

  return v13;
}

- (id)_migrationEligibilityLogItem
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint8_t v19[16];
  uint8_t v20[8];
  id v21;
  uint8_t buf[16];

  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  v2 = qword_10000CC40;
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Starting to gather bookmarks migration diagnostics", buf, 2u);
  }
  v3 = SafariCloudBookmarksMigrationCoordinatorLogsDirectoryURL();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "safari_filenameFormattedString"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cloudBookmarksMigrationEligibility_%@.log"), v6));
  v8 = NSTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v10, 0));

  v21 = 0;
  LOBYTE(v10) = +[WBSFileLogger collectLogsInDirectory:withName:intoFile:error:](WBSFileLogger, "collectLogsInDirectory:withName:intoFile:error:", v4, CFSTR("migrationEligibility"), v11, &v21);
  v12 = v21;
  v13 = v12;
  if ((v10 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPathURL:](DEAttachmentItem, "attachmentWithPathURL:", v11));
    objc_msgSend(v14, "setDeleteOnAttach:", &__kCFBooleanTrue);
    if (qword_10000CC48 != -1)
      dispatch_once(&qword_10000CC48, &stru_100008308);
    v15 = qword_10000CC40;
    if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Finished gathering bookmarks migration diagnostics", v19, 2u);
    }
  }
  else
  {
    if (v12)
    {
      if (qword_10000CC48 != -1)
        dispatch_once(&qword_10000CC48, &stru_100008308);
      v16 = (void *)qword_10000CC40;
      if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_ERROR))
        sub_100004DC0(v16, v13);
    }
    else
    {
      if (qword_10000CC48 != -1)
        dispatch_once(&qword_10000CC48, &stru_100008308);
      v17 = qword_10000CC40;
      if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "No migration elibility logs to collect", v20, 2u);
      }
    }
    v14 = 0;
  }

  return v14;
}

- (id)_bookmarksAttachmentItem
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  dispatch_semaphore_t v12;
  NSObject *v13;
  dispatch_time_t v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v23;
  _QWORD v24[4];
  NSObject *v25;
  uint8_t *v26;
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t v33[4];
  void *v34;

  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  v3 = qword_10000CC40;
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting to gather bookmarks diagnostics", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "safari_filenameFormattedString"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Bookmarks_Diagnostic_%@.json"), v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _temporaryDirectory](self, "_temporaryDirectory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("file://"), "stringByAppendingString:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));

  v11 = objc_alloc_init((Class)WBSSafariBookmarksSyncAgentProxy);
  v12 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  v28 = buf;
  v29 = 0x3032000000;
  v30 = sub_100003AFC;
  v31 = sub_100003B0C;
  v32 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100003B14;
  v24[3] = &unk_100008470;
  v26 = buf;
  v13 = v12;
  v25 = v13;
  objc_msgSend(v11, "collectDiagnosticsDataWithCompletionHandler:", v24);
  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_DEBUG))
    sub_100004F08();
  v14 = dispatch_time(0, 90000000000);
  if (dispatch_semaphore_wait(v13, v14))
  {
    if (qword_10000CC48 != -1)
      dispatch_once(&qword_10000CC48, &stru_100008308);
    if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_ERROR))
      sub_100004EDC();
LABEL_14:
    v15 = 0;
    goto LABEL_32;
  }
  v16 = (void *)*((_QWORD *)v28 + 5);
  if (!v16)
  {
    if (qword_10000CC48 != -1)
      dispatch_once(&qword_10000CC48, &stru_100008308);
    if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_ERROR))
      sub_100004E4C();
    goto LABEL_14;
  }
  v23 = 0;
  v17 = objc_msgSend(v16, "writeToURL:options:error:", v10, 1, &v23);
  v18 = v23;
  if ((v17 & 1) != 0)
  {
    if (qword_10000CC48 != -1)
      dispatch_once(&qword_10000CC48, &stru_100008308);
    v19 = qword_10000CC40;
    if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v33 = 138543362;
      v34 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Finished writing bookmarks diagnostic data to %{public}@", v33, 0xCu);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPathURL:](DEAttachmentItem, "attachmentWithPathURL:", v10));
    objc_msgSend(v15, "setDeleteOnAttach:", &__kCFBooleanTrue);
  }
  else
  {
    if (qword_10000CC48 != -1)
      dispatch_once(&qword_10000CC48, &stru_100008308);
    v20 = (id)qword_10000CC40;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "safari_privacyPreservingDescription"));
      sub_100004E78((uint64_t)v10, v21, v33, v20);
    }

    v15 = 0;
  }

LABEL_32:
  _Block_object_dispose(buf, 8);

  return v15;
}

- (id)_tabsDatabaseAttachmentsItemHidingSensitiveData:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
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
  id v26;
  uint8_t buf[4];
  const __CFString *v28;

  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  v4 = qword_10000CC40;
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = CFSTR(" with sensitive data removed");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting to gather tabs database diagnostics%@.", buf, 0xCu);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "safari_filenameFormattedString"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _temporaryDirectory](self, "_temporaryDirectory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SafariTabs%@_%@.db"), CFSTR("_WithoutSensitiveData"), v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _readOnlyTabCollection](self, "_readOnlyTabCollection"));
  v26 = 0;
  v12 = objc_msgSend(v11, "copyTabsDatabase:hidingSensitiveData:error:", v10, 1, &v26);
  v13 = v26;

  if (v13 || (v12 & 1) == 0)
  {
    if (qword_10000CC48 != -1)
      dispatch_once(&qword_10000CC48, &stru_100008308);
    v24 = (void *)qword_10000CC40;
    if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_ERROR))
      sub_100004F60(v24, v13);
    v14 = 0;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPathURL:](DEAttachmentItem, "attachmentWithPathURL:", v10));
    objc_msgSend(v15, "setDeleteOnAttach:");
    objc_msgSend(v14, "addObject:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingString:", CFSTR("-wal")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPathURL:](DEAttachmentItem, "attachmentWithPathURL:", v18));

    objc_msgSend(v19, "setDeleteOnAttach:", &__kCFBooleanTrue);
    objc_msgSend(v14, "addObject:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingString:", CFSTR("-shm")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPathURL:](DEAttachmentItem, "attachmentWithPathURL:", v22));

    objc_msgSend(v23, "setDeleteOnAttach:", &__kCFBooleanTrue);
    objc_msgSend(v14, "addObject:", v23);

  }
  return v14;
}

- (id)_tabCollectionDataAttachmentItemHidingSensitiveData:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  const __CFString *v18;

  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  v4 = qword_10000CC40;
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = CFSTR("without titles and urls");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting to gather tab collection diagnostics %@", buf, 0xCu);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _readOnlyTabCollection](self, "_readOnlyTabCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tabCollectionDataSummaryLogHidingSensitiveData:", 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "safari_filenameFormattedString"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _temporaryDirectory](self, "_temporaryDirectory"));
  v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Safari%@ Tabs Database_%@.log"), CFSTR(" Scrubbed"), v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v10));

  v16 = 0;
  LOBYTE(v10) = objc_msgSend(v6, "writeToFile:atomically:encoding:error:", v11, 1, 4, &v16);
  v12 = v16;
  if ((v10 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPath:](DEAttachmentItem, "attachmentWithPath:", v11));
    objc_msgSend(v13, "setDeleteOnAttach:", &__kCFBooleanTrue);
    if (qword_10000CC48 != -1)
      dispatch_once(&qword_10000CC48, &stru_100008308);
    v14 = qword_10000CC40;
    if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Finished gathering open tabs", buf, 2u);
    }
  }
  else
  {
    if (qword_10000CC48 != -1)
      dispatch_once(&qword_10000CC48, &stru_100008308);
    if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_ERROR))
      sub_100004FEC();
    v13 = 0;
  }

  return v13;
}

- (id)_cloudKitDataAttachment
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  dispatch_time_t v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[4];
  NSObject *v17;
  uint8_t buf[4];
  void *v19;

  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  v3 = qword_10000CC40;
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting to gather CloudKit data", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "safari_filenameFormattedString"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CloudKit_data_%@.plist"), v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SafariDiagnosticExtension _temporaryDirectory](self, "_temporaryDirectory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8));
  v10 = objc_alloc_init((Class)WBSSafariBookmarksSyncAgentProxy);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000044F4;
  v16[3] = &unk_100008498;
  v11 = dispatch_semaphore_create(0);
  v17 = v11;
  objc_msgSend(v10, "dumpCloudKitDataPrintByDates:liveOnly:printTree:printPlist:writeToFile:atFileURL:completionHandler:", 0, 0, 0, 1, 1, v9, v16);
  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_DEBUG))
    sub_10000509C();
  v12 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    if (qword_10000CC48 != -1)
      dispatch_once(&qword_10000CC48, &stru_100008308);
    if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_ERROR))
      sub_100005070();
    v13 = 0;
  }
  else
  {
    if (qword_10000CC48 != -1)
      dispatch_once(&qword_10000CC48, &stru_100008308);
    v14 = qword_10000CC40;
    if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Finished writing CloudKit data to %{public}@", buf, 0xCu);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPathURL:](DEAttachmentItem, "attachmentWithPathURL:", v9));
    objc_msgSend(v13, "setDeleteOnAttach:", &__kCFBooleanTrue);
  }

  return v13;
}

- (id)_getAttachmentsWithDisplayNamePattern:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;

  v3 = a3;
  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  v4 = qword_10000CC40;
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting to gather crashes with display pattern '%{public}@'", buf, 0xCu);
  }
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v3, 1, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("(LowMemory|ExcResource|Sandbox|stacks|log-aggregated).*"), 1, 0));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100004794;
  v15[3] = &unk_1000084C0;
  v8 = v6;
  v16 = v8;
  v9 = v7;
  v17 = v9;
  v10 = v5;
  v18 = v10;
  OSAIterateSubmittableLogsWithBlock(0, v15);
  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  v11 = qword_10000CC40;
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Finished gathering crashes with known display pattern", buf, 2u);
  }
  v12 = v18;
  v13 = v10;

  return v13;
}

- (id)_temporaryDirectory
{
  if (qword_10000CCB8 != -1)
    dispatch_once(&qword_10000CCB8, &stru_1000084E0);
  return (id)qword_10000CCB0;
}

- (void)dealloc
{
  id v3;
  void *v4;
  objc_super v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "defaultContentBlockerManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)SafariDiagnosticExtension;
  -[SafariDiagnosticExtension dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_semaphoreWaitingForChangeInWebExtensions, 0);
  objc_storeStrong((id *)&self->_semaphoreWaitingForChangeInContentBlockers, 0);
}

@end
