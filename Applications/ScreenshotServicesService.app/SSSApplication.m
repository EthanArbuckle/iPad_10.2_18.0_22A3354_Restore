@implementation SSSApplication

- (id)_pptTestInfos
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  _UNKNOWN **v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pathForResource:ofType:", CFSTR("testDefinitions"), CFSTR("plist")));

  v16 = (void *)v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithContentsOfFile:](NSArray, "arrayWithContentsOfFile:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("testName")));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("sssNumberOfRequiredScreenshots")));
        if (v13)
          v14 = (_UNKNOWN **)v13;
        else
          v14 = &off_100095BE0;
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  dispatch_time_t v11;
  BOOL v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SSSApplication _pptTestInfos](self, "_pptTestInfos"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));
  if (v9)
  {
    v10 = objc_alloc_init((Class)SSUIService);
    objc_msgSend(v10, "_runPPTNamed:numberOfRequiredScreenshots:", v6, objc_msgSend(v9, "unsignedIntegerValue"));
    v11 = dispatch_time(0, 100000000);
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, &stru_1000918F8);

    v12 = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SSSApplication;
    v12 = -[SSSApplication runTest:options:](&v14, "runTest:options:", v6, v7);
  }

  return v12;
}

+ (id)sharedSSSApplication
{
  return +[UIApplication sharedApplication](UIApplication, "sharedApplication");
}

- (id)_actionInActions:(id)a3 ofClass:(Class)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_isKindOfClass(v10, a4) & 1) != 0)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)_screenshotActionInActions:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  v6 = -[SSSApplication _actionInActions:ofClass:](self, "_actionInActions:ofClass:", v4, objc_opt_class(SSScreenshotAction, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)_imageIdentifierActionInActions:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  v6 = -[SSSApplication _actionInActions:ofClass:](self, "_actionInActions:ofClass:", v4, objc_opt_class(SSImageIdentifierAction, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)_metadataUpdateActionInActions:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  v6 = -[SSSApplication _actionInActions:ofClass:](self, "_actionInActions:ofClass:", v4, objc_opt_class(SSMetadataUpdateAction, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)_documentUpdateActionInActions:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  v6 = -[SSSApplication _actionInActions:ofClass:](self, "_actionInActions:ofClass:", v4, objc_opt_class(SSDocumentUpdateAction, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)_preheatActionInActions:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  v6 = -[SSSApplication _actionInActions:ofClass:](self, "_actionInActions:ofClass:", v4, objc_opt_class(SSPreheatAction, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)_handlePlatformSpecificActions:(id)a3 forScene:(id)a4 withTransitionContext:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  uint8_t buf[4];
  id v54;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[SSSApplication _screenshotActionInActions:](self, "_screenshotActionInActions:", v6));
  v10 = (void *)v7;
  if (v7)
  {
    v11 = _SSSignpostLog(v7, v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SendScreenshot", (const char *)&unk_10008BF43, buf, 2u);
    }

    v13 = os_log_create("com.apple.screenshotservices", "Performance");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "END \"SendScreenshot\", buf, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "info"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForSetting:", 1));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SSSApplication sssAppDelegate](self, "sssAppDelegate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "viewControllerManager"));
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_10001094C;
      v51[3] = &unk_100091920;
      v52 = v10;
      objc_msgSend(v17, "receiveEnvironmentDescription:completion:", v15, v51);

    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SSSApplication _imageIdentifierActionInActions:](self, "_imageIdentifierActionInActions:", v6));
  v19 = v18;
  if (v18)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "info"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForSetting:", 2));

    if (v21)
    {
      v22 = os_log_create("com.apple.screenshotservices", "XPC");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "loggableDescription"));
        *(_DWORD *)buf = 138412290;
        v54 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Service received image identifier update %@", buf, 0xCu);

      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
      objc_msgSend(v24, "processImageIdentifierUpdate:", v21);

    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SSSApplication _metadataUpdateActionInActions:](self, "_metadataUpdateActionInActions:", v6));
  v26 = v25;
  if (v25)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "info"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForSetting:", 5));

    if (v28)
    {
      v29 = os_log_create("com.apple.screenshotservices", "XPC");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "loggableDescription"));
        *(_DWORD *)buf = 138412290;
        v54 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Service received metadata update %@", buf, 0xCu);

      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
      v32 = objc_msgSend(v31, "processEnvironmentElementMetadataUpdate:", v28);

    }
    else
    {
      v32 = 0;
    }
    v33 = objc_alloc_init((Class)BSMutableSettings);
    objc_msgSend(v33, "setFlag:forSetting:", BSSettingFlagForBool(v32), 8);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[BSActionResponse responseWithInfo:](BSActionResponse, "responseWithInfo:", v33));
    objc_msgSend(v26, "sendResponse:", v34);

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SSSApplication _documentUpdateActionInActions:](self, "_documentUpdateActionInActions:", v6));
  v36 = v35;
  if (v35)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "info"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForSetting:", 6));

    if (v38)
    {
      v39 = os_log_create("com.apple.screenshotservices", "XPC");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "loggableDescription"));
        *(_DWORD *)buf = 138412290;
        v54 = v40;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Service received document update %@", buf, 0xCu);

      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
      objc_msgSend(v41, "processEnvironmentElementDocumentUpdate:", v38);

    }
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SSSApplication _preheatActionInActions:](self, "_preheatActionInActions:", v6));
  v43 = v42;
  if (v42)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "info"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForSetting:", 9));
    v46 = objc_msgSend(v45, "integerValue");

    v47 = os_log_create("com.apple.screenshotservices", "XPC");
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v54 = v46;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Service received preheat request for presentation mode: %td", buf, 0xCu);
    }

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[SSSApplication sssAppDelegate](self, "sssAppDelegate"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "viewControllerManager"));
    objc_msgSend(v49, "preheatWithPresentationMode:", v46);

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[BSActionResponse response](BSActionResponse, "response"));
    objc_msgSend(v43, "sendResponse:", v50);

  }
}

- (BOOL)_canAnimateDragCancelInApp
{
  return 1;
}

@end
