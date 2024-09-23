id SafariLibraryPath()
{
  if (qword_10000CC20 != -1)
    dispatch_once(&qword_10000CC20, &stru_1000082C8);
  return (id)qword_10000CC18;
}

void sub_100001100(id a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v1 = _SFSafariContainerPath(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library")));
  }
  else
  {
    v4 = SafariNonContaineredLibraryPath();
    v3 = objc_claimAutoreleasedReturnValue(v4);
  }
  v5 = (void *)qword_10000CC18;
  qword_10000CC18 = v3;

}

id SafariNonContaineredLibraryPath()
{
  if (qword_10000CC30 != -1)
    dispatch_once(&qword_10000CC30, &stru_1000082E8);
  return (id)qword_10000CC28;
}

void sub_100001198(id a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = objc_msgSend((id)CPSharedResourcesDirectory(a1), "stringByAppendingPathComponent:", CFSTR("Library"));
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_10000CC28;
  qword_10000CC28 = v2;

}

id SafariSettingsDirectoryPath()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v0 = (void *)qword_10000CC38;
  if (!qword_10000CC38)
  {
    v1 = SafariLibraryPath();
    v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Safari")));
    v4 = (void *)qword_10000CC38;
    qword_10000CC38 = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v5, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", qword_10000CC38, 0);

    v0 = (void *)qword_10000CC38;
  }
  return v0;
}

id SafariCloudBookmarksMigrationCoordinatorDirectoryURL()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = SafariSettingsDirectoryPath();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("CloudBookmarksMigrationCoordinator")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v2, 1));

  return v3;
}

id SafariCloudBookmarksMigrationCoordinatorLogsDirectoryURL()
{
  id v0;
  void *v1;
  void *v2;

  v0 = SafariCloudBookmarksMigrationCoordinatorDirectoryURL();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("Logs"), 1));

  return v2;
}

void sub_1000012F0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.mobilesafari", "DiagnosticExtension");
  v2 = (void *)qword_10000CC40;
  qword_10000CC40 = (uint64_t)v1;

}

void sub_100001360(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)WBReadonlyTabCollection);
  v2 = (void *)qword_10000CC50;
  qword_10000CC50 = (uint64_t)v1;

}

void sub_1000013C8(id a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;

  v1 = objc_alloc((Class)WBTabCollection);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[WBCollectionConfiguration safariTabCollectionConfiguration](WBCollectionConfiguration, "safariTabCollectionConfiguration"));
  v2 = objc_msgSend(v1, "initWithConfiguration:openDatabase:", v4, 1);
  v3 = (void *)qword_10000CC60;
  qword_10000CC60 = (uint64_t)v2;

}

void sub_1000014A4(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v2 = objc_alloc((Class)WBTabGroupManager);
  v3 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "_tabCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = objc_msgSend(v2, "initWithCollection:", v6);
  v5 = (void *)qword_10000CC70;
  qword_10000CC70 = (uint64_t)v4;

}

void sub_10000154C(id a1)
{
  SafariProfileDelegate *v1;
  void *v2;

  v1 = objc_alloc_init(SafariProfileDelegate);
  v2 = (void *)qword_10000CC80;
  qword_10000CC80 = (uint64_t)v1;

}

void sub_1000015B4(id a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;

  v1 = objc_alloc((Class)SFWebExtensionsController);
  v2 = objc_msgSend(v1, "initWithProfileServerID:userContentController:", WBSDefaultProfileIdentifier, 0);
  v3 = (void *)qword_10000CC90;
  qword_10000CC90 = (uint64_t)v2;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[SafariDiagnosticExtension sharedProfileDelegate](SafariDiagnosticExtension, "sharedProfileDelegate"));
  objc_msgSend((id)qword_10000CC90, "setProfileDelegate:", v4);

}

void sub_10000169C(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = objc_alloc((Class)SFContentBlockerManager);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultWebExtensionsController"));
  v3 = objc_msgSend(v2, "initWithUserContentController:webExtensionsController:", 0, v5);
  v4 = (void *)qword_10000CCA0;
  qword_10000CCA0 = (uint64_t)v3;

}

void sub_100001864(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v2 = dispatch_semaphore_create(0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  v5 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "defaultContentBlockerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v6, "addObserver:", *(_QWORD *)(a1 + 32));

  v7 = dispatch_semaphore_create(0);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  *(_QWORD *)(v8 + 16) = v7;

  v10 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "defaultWebExtensionsController");
  v11 = (id)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v11, "addObserver:", *(_QWORD *)(a1 + 32));

}

void sub_100001F98(uint64_t a1, void *a2)
{
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isPrivateBrowsing") & 1) != 0)
  {
    v3 = CFSTR("Private Tab");
    goto LABEL_4;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "url"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));

  if (v3)
  {
LABEL_4:
    if (!-[__CFString isEqual:](v3, "isEqual:", &stru_1000086E0))
      goto LABEL_6;
  }

  v3 = CFSTR("Start Page");
LABEL_6:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uuid"));
  if (objc_msgSend(v5, "length"))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v3, "stringByAppendingFormat:", CFSTR(" (%@)"), v5));

    v3 = (__CFString *)v6;
  }
  if (WBSIsEqual(v11, *(_QWORD *)(a1 + 40)))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "activeTabGroupUUID"));
    v9 = WBSIsEqual(v7, v8);

    if (v9)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR(" (Current)")));

      v3 = (__CFString *)v10;
    }
  }
  objc_msgSend(*(id *)(a1 + 56), "appendFormat:", CFSTR("%@\n"), v3);

}

uint64_t sub_100002778(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "uuid"));
  v4 = WBSIsEqual(v3, *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_100003158(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  id v6;
  id v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v2 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "defaultWebExtensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v5 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v4, v5);
  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_DEBUG))
    sub_100004D94();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allDiscoveredExtensions"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v20 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v20)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "webExtensionForExtension:", v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayName"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_plugIn"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v11, v13));

        v15 = objc_msgSend(v3, "extensionIsEnabled:", v9);
        v16 = *(void **)(a1 + 40);
        v17 = CFSTR("disabled:");
        if (v15)
          v17 = CFSTR("enabled:");
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v17, v14));
        objc_msgSend(v16, "addObject:", v18);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

}

void sub_100003AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003AFC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100003B0C(uint64_t a1)
{

}

void sub_100003B14(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_DEBUG))
    sub_100004F34();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000044F4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (qword_10000CC48 != -1)
    dispatch_once(&qword_10000CC48, &stru_100008308);
  if (os_log_type_enabled((os_log_t)qword_10000CC40, OS_LOG_TYPE_DEBUG))
    sub_1000050C8();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100004794(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent"));
  v4 = objc_msgSend(v3, "length");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firstMatchInString:options:range:", v3, 0, 0, v4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "firstMatchInString:options:range:", v3, 0, 0, v4));

    if (!v6)
    {
      v7 = *(void **)(a1 + 48);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPathURL:](DEAttachmentItem, "attachmentWithPathURL:", v9));
      objc_msgSend(v7, "addObject:", v8);

    }
  }

}

void sub_1000048A0(id a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = _SFSafariTemporaryDirectoryPath(a1);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_10000CCB0;
  qword_10000CCB0 = v2;

}

void sub_100004A90(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100004AA4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100004AF0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_100004B00(uint64_t a1, void *a2)
{
  return a2;
}

void sub_100004B08(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100004B40()
{
  uint64_t v0;

  return v0;
}

void sub_100004B58()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100004B1C();
  sub_100004B00(v1, v2);
  v3 = objc_msgSend((id)sub_100004B40(), "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100004AD8();
  sub_100004A90((void *)&_mh_execute_header, v5, v6, "Failed to write file with list of open tabs to %{public}@: %{public}@", v7, v8, v9, v10, v11);

  sub_100004AB4();
}

void sub_100004BDC()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100004B1C();
  sub_100004B00(v1, v2);
  v3 = objc_msgSend((id)sub_100004B40(), "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100004AD8();
  sub_100004A90((void *)&_mh_execute_header, v5, v6, "Failed to write file with list of open tabs to %{public}@, error: %{public}@", v7, v8, v9, v10, v11);

  sub_100004AB4();
}

void sub_100004C60()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100004B1C();
  sub_100004B00(v1, v2);
  v3 = objc_msgSend((id)sub_100004B40(), "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100004B28();
  sub_100004A90((void *)&_mh_execute_header, v5, v6, "Failed to write list of content blockers to %{public}@: %@{public}", v7, v8, v9, v10, v11);

  sub_100004AB4();
}

void sub_100004CE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004ACC();
  sub_100004AA4((void *)&_mh_execute_header, v0, v1, "Moving past content blocker semaphore", v2, v3, v4, v5, v6);
  sub_100004AC4();
}

void sub_100004D10()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100004B1C();
  sub_100004B00(v1, v2);
  v3 = objc_msgSend((id)sub_100004B40(), "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100004B28();
  sub_100004A90((void *)&_mh_execute_header, v5, v6, "Failed to write list of web extensions to %{public}@: %@{public}", v7, v8, v9, v10, v11);

  sub_100004AB4();
}

void sub_100004D94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004ACC();
  sub_100004AA4((void *)&_mh_execute_header, v0, v1, "Moving past web extensions semaphore", v2, v3, v4, v5, v6);
  sub_100004AC4();
}

void sub_100004DC0(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "safari_privacyPreservingDescription"));
  sub_100004B08((void *)&_mh_execute_header, v5, v6, "Error collecting migration eligibility logs: %{public}@", v7, v8, v9, v10, 2u);

  sub_100004B4C();
}

void sub_100004E4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004ACC();
  sub_100004AF0((void *)&_mh_execute_header, v0, v1, "Sync agent failed to collect bookmarks diagnostics data", v2, v3, v4, v5, v6);
  sub_100004AC4();
}

void sub_100004E78(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to write bookmarks diagnostics data to %{public}@ with error: %{public}@", buf, 0x16u);

}

void sub_100004EDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004ACC();
  sub_100004AF0((void *)&_mh_execute_header, v0, v1, "Timed out waiting for sync agent to collect bookmarks diagnostics data", v2, v3, v4, v5, v6);
  sub_100004AC4();
}

void sub_100004F08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004ACC();
  sub_100004AA4((void *)&_mh_execute_header, v0, v1, "Waiting for response from sync agent", v2, v3, v4, v5, v6);
  sub_100004AC4();
}

void sub_100004F34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004ACC();
  sub_100004AA4((void *)&_mh_execute_header, v0, v1, "Received response from sync agent", v2, v3, v4, v5, v6);
  sub_100004AC4();
}

void sub_100004F60(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "safari_privacyPreservingDescription"));
  sub_100004B08((void *)&_mh_execute_header, v5, v6, "Failed to delete sensitive data from database with error: %{public}@", v7, v8, v9, v10, 2u);

  sub_100004B4C();
}

void sub_100004FEC()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_100004B1C();
  sub_100004B00(v1, v2);
  v3 = objc_msgSend((id)sub_100004B40(), "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100004AD8();
  sub_100004A90((void *)&_mh_execute_header, v5, v6, "Failed to write file with tab collection diagnostics to %{public}@, error: %{public}@", v7, v8, v9, v10, v11);

  sub_100004AB4();
}

void sub_100005070()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004ACC();
  sub_100004AF0((void *)&_mh_execute_header, v0, v1, "Timed out waiting for sync agent to collect CloudKit data", v2, v3, v4, v5, v6);
  sub_100004AC4();
}

void sub_10000509C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004ACC();
  sub_100004AA4((void *)&_mh_execute_header, v0, v1, "Waiting for response from sync agent for CloudKit data", v2, v3, v4, v5, v6);
  sub_100004AC4();
}

void sub_1000050C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004ACC();
  sub_100004AA4((void *)&_mh_execute_header, v0, v1, "Received response from sync agent for ckbookmarks data", v2, v3, v4, v5, v6);
  sub_100004AC4();
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__addTabGroup_inWindow_toLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addTabGroup:inWindow:toLog:");
}

id objc_msgSend__addWindow_withActiveTabGroup_toLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addWindow:withActiveTabGroup:toLog:");
}

id objc_msgSend__bookmarksAttachmentItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bookmarksAttachmentItem");
}

id objc_msgSend__cloudKitDataAttachment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cloudKitDataAttachment");
}

id objc_msgSend__contentBlockerListAttachment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_contentBlockerListAttachment");
}

id objc_msgSend__currentLayoutModeAttachment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentLayoutModeAttachment");
}

id objc_msgSend__getAttachmentsWithDisplayNamePattern_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getAttachmentsWithDisplayNamePattern:");
}

id objc_msgSend__migrationEligibilityLogItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrationEligibilityLogItem");
}

id objc_msgSend__openTabsAttachment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openTabsAttachment");
}

id objc_msgSend__plugIn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_plugIn");
}

id objc_msgSend__readOnlyTabCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_readOnlyTabCollection");
}

id objc_msgSend__tabCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tabCollection");
}

id objc_msgSend__tabCollectionDataAttachmentItemHidingSensitiveData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tabCollectionDataAttachmentItemHidingSensitiveData:");
}

id objc_msgSend__tabsDatabaseAttachmentsItemHidingSensitiveData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tabsDatabaseAttachmentsItemHidingSensitiveData:");
}

id objc_msgSend__temporaryDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_temporaryDirectory");
}

id objc_msgSend__webExtensionsListAttachment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_webExtensionsListAttachment");
}

id objc_msgSend__web_createDirectoryAtPathWithIntermediateDirectories_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_activeTabGroupUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeTabGroupUUID");
}

id objc_msgSend_activeTabUUIDForTabGroupWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeTabUUIDForTabGroupWithUUID:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_allDiscoveredExtensions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allDiscoveredExtensions");
}

id objc_msgSend_allNamedTabGroupsUnsorted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allNamedTabGroupsUnsorted");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachmentWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachmentWithPath:");
}

id objc_msgSend_attachmentWithPathURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachmentWithPathURL:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_collectDiagnosticsDataWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectDiagnosticsDataWithCompletionHandler:");
}

id objc_msgSend_collectLogsInDirectory_withName_intoFile_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectLogsInDirectory:withName:intoFile:error:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_copyTabsDatabase_hidingSensitiveData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyTabsDatabase:hidingSensitiveData:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultContentBlockerManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultContentBlockerManager");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultWebExtensionsController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWebExtensionsController");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayName");
}

id objc_msgSend_displayNameForExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayNameForExtension:");
}

id objc_msgSend_dumpCloudKitDataPrintByDates_liveOnly_printTree_printPlist_writeToFile_atFileURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpCloudKitDataPrintByDates:liveOnly:printTree:printPlist:writeToFile:atFileURL:completionHandler:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_extensionIsEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionIsEnabled:");
}

id objc_msgSend_extensions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensions");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstMatchInString:options:range:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCollection:");
}

id objc_msgSend_initWithConfiguration_openDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfiguration:openDatabase:");
}

id objc_msgSend_initWithProfileServerID_userContentController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProfileServerID:userContentController:");
}

id objc_msgSend_initWithUserContentController_webExtensionsController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUserContentController:webExtensionsController:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalInstall");
}

id objc_msgSend_isPrivateBrowsing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPrivateBrowsing");
}

id objc_msgSend_isSafariProfilesEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSafariProfilesEnabled");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localTabGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localTabGroup");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_preferredCapsuleLayoutStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredCapsuleLayoutStyle");
}

id objc_msgSend_privateTabGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privateTabGroup");
}

id objc_msgSend_profileIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileIdentifier");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_safariTabCollectionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safariTabCollectionConfiguration");
}

id objc_msgSend_safari_addObjectUnlessNil_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safari_addObjectUnlessNil:");
}

id objc_msgSend_safari_addObjectsFromArrayUnlessNil_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safari_addObjectsFromArrayUnlessNil:");
}

id objc_msgSend_safari_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safari_BOOLForKey:");
}

id objc_msgSend_safari_browserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safari_browserDefaults");
}

id objc_msgSend_safari_filenameFormattedString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safari_filenameFormattedString");
}

id objc_msgSend_safari_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safari_firstObjectPassingTest:");
}

id objc_msgSend_safari_privacyPreservingDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safari_privacyPreservingDescription");
}

id objc_msgSend_setDeleteOnAttach_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeleteOnAttach:");
}

id objc_msgSend_setProfileDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProfileDelegate:");
}

id objc_msgSend_sharedFeatureManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedFeatureManager");
}

id objc_msgSend_sharedProfileDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedProfileDelegate");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_tabCollectionDataSummaryLogHidingSensitiveData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tabCollectionDataSummaryLogHidingSensitiveData:");
}

id objc_msgSend_tabWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tabWithUUID:");
}

id objc_msgSend_tabs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tabs");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_webExtensionForExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webExtensionForExtension:");
}

id objc_msgSend_windowStates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windowStates");
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}
