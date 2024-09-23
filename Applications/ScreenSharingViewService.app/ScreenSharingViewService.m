void sub_10000254C(void *a1)
{
  id v1;
  NSNumber *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;

  v1 = a1;
  if (v1)
  {
    v15 = CFSTR("pid");
    v2 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", getpid());
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    v16 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    objc_msgSend(v1, "pidNotification:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 0.25));
    objc_msgSend(v5, "runUntilDate:", v6);

  }
  else
  {
    v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v7)
      sub_100004984(v7, v8, v9, v10, v11, v12, v13, v14);
  }

}

void sub_100002674(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a1;
  v4 = a2;
  if (v3)
  {
    objc_msgSend(v3, "pauseResumeResponse:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 0.25));
    objc_msgSend(v5, "runUntilDate:", v6);

  }
  else
  {
    v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v7)
      sub_1000049BC(v7, v8, v9, v10, v11, v12, v13, v14);
  }

}

void sub_100002900(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x1000028DCLL);
}

void sub_10000290C(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "helperToolConnection"));
  objc_msgSend(v1, "setInvalidationHandler:", 0);

}

void sub_100002940(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  id v4;

  v2 = a2;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[NSError domain](v2, "domain"));
  v3 = -[NSError code](v2, "code");

  NSLog(CFSTR("connect failed: %@ / %d"), v4, v3);
}

id sub_100002E90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendResultAndTerminate:", 2);
}

id sub_100002E9C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendResultAndTerminate:", 1);
}

id sub_100002EA8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendResultAndTerminate:", 0);
}

id sub_100002EB4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendResultAndTerminate:", 3);
}

void sub_100003518(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(AppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

void sub_1000035EC(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a1;
  v4 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send result to server", v7, 2u);
  }
  objc_msgSend(v3, "termsAndConditionsResponse:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 0.25));
  objc_msgSend(v5, "runUntilDate:", v6);

}

void sub_10000391C(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1000038C4);
  }
  _Unwind_Resume(a1);
}

void sub_100003930(id a1)
{
  void *v1;
  id v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("iPad"));

  if (v2 != (id)0x7FFFFFFFFFFFFFFFLL)
    byte_10000D758 = 1;

}

void sub_1000039A0(uint64_t a1)
{
  void *v2;
  uint8_t v3[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "xpc connection invalidated", v3, 2u);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "helperToolConnection"));
  objc_msgSend(v2, "setInvalidationHandler:", 0);

}

void sub_100003A20(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  id v4;

  v2 = a2;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[NSError domain](v2, "domain"));
  v3 = -[NSError code](v2, "code");

  NSLog(CFSTR("connect failed: %@ / %d"), v4, v3);
}

void sub_100003F08(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "toolbar", 0));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "items"));

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
        v9 = objc_msgSend(v8, "length");

        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("3Linefeed"), &stru_100008398, 0));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", v12));
          objc_msgSend(v7, "setTitle:", v13);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

void sub_100004984(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003518((void *)&_mh_execute_header, &_os_log_default, a3, "SendPIDToScreenSharingServer called with nil helperTool", a5, a6, a7, a8, 0);
}

void sub_1000049BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003518((void *)&_mh_execute_header, &_os_log_default, a3, "SBSendPauseResumeResultToScreenSharingServer called with nil helperTool", a5, a6, a7, a8, 0);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "font");
}

id objc_msgSend_fontWithSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontWithSize:");
}

id objc_msgSend_helperTool(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "helperTool");
}

id objc_msgSend_helperToolConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "helperToolConnection");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isAppleSupportRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppleSupportRequest");
}

id objc_msgSend_isPausedNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPausedNumber");
}

id objc_msgSend_isScreenLockedNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isScreenLockedNumber");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "items");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "model");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pauseResumeResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseResumeResponse:");
}

id objc_msgSend_pidNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pidNotification:");
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointSize");
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popoverPresentationController");
}

id objc_msgSend_postResultNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postResultNotification:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_runUntilDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runUntilDate:");
}

id objc_msgSend_scrollRangeToVisible_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scrollRangeToVisible:");
}

id objc_msgSend_setContentOffset_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentOffset:animated:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setHelperTool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHelperTool:");
}

id objc_msgSend_setHelperToolBackChannelInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHelperToolBackChannelInterface:");
}

id objc_msgSend_setHelperToolConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHelperToolConnection:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsAppleSupportRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsAppleSupportRequest:");
}

id objc_msgSend_setIsPausedNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsPausedNumber:");
}

id objc_msgSend_setIsScreenLockedNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsScreenLockedNumber:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setShareSettingsRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShareSettingsRequest:");
}

id objc_msgSend_setSourceRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceRect:");
}

id objc_msgSend_setSourceView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceView:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setUserInfoSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfoSet:");
}

id objc_msgSend_setViewerName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewerName:");
}

id objc_msgSend_shareSettingsRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shareSettingsRequest");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_showControls(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showControls");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithContentsOfFile_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithContentsOfFile:encoding:error:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemFontOfSize:weight:");
}

id objc_msgSend_terminateWithSuccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminateWithSuccess");
}

id objc_msgSend_termsAndConditionsResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "termsAndConditionsResponse:");
}

id objc_msgSend_termsHeaderTextView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "termsHeaderTextView");
}

id objc_msgSend_termsIcon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "termsIcon");
}

id objc_msgSend_termsSubHeaderTextView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "termsSubHeaderTextView");
}

id objc_msgSend_termsTextView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "termsTextView");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_toolbar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toolbar");
}

id objc_msgSend_traitCollectionDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollectionDidChange:");
}

id objc_msgSend_userInfoSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfoSet");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewerName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewerName");
}
