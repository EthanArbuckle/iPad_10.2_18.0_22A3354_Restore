void sub_1000038FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_10000394C(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "buttonEventMonitor"));
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "addTarget:action:forButtonEvents:propagate:", v3, "handleButtonEvent:", 0xFFFFFFFFLL, 0);

}

void sub_100003BD0(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  id v26;
  NSErrorUserInfoKey v27;
  const __CFString *v28;

  v2 = (void *)objc_opt_new(CRPreflightController);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100003EA4;
  v25[3] = &unk_10000C2B8;
  v3 = *(void **)(a1 + 40);
  v25[4] = *(_QWORD *)(a1 + 32);
  v26 = v3;
  objc_msgSend(v2, "preflight:withReply:", 0, v25);
  v4 = *(NSObject **)(a1 + 40);
  v5 = dispatch_time(0, 240000000000);
  if (dispatch_semaphore_wait(v4, v5))
  {
    v6 = CRErrorDomain;
    v27 = NSLocalizedDescriptionKey;
    v28 = CFSTR("Preflight time out");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, -80, v7));

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uiNeededKnownSemaphore"));
    dispatch_semaphore_signal(v9);

    v10 = *(void **)(a1 + 32);
LABEL_10:
    v20 = -80;
    goto LABEL_11;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "preflightSuccess"))
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "preflightResults"));
    if (v11)
    {
      v12 = (void *)v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "preflightError"));

      if (!v13)
      {
        objc_msgSend(*(id *)(a1 + 32), "setRepairSummaryNeeded:", 1);
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uiNeededKnownSemaphore"));
        dispatch_semaphore_signal(v23);

        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100004048;
        v24[3] = &unk_10000C2E0;
        v24[4] = *(_QWORD *)(a1 + 32);
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v24);
        goto LABEL_12;
      }
    }
  }
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "preflightError"));
  if (!v14
    || (v15 = (void *)v14,
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "preflightError")),
        v17 = objc_msgSend(v16, "code"),
        v16,
        v15,
        v17 != (id)-92))
  {
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uiNeededKnownSemaphore"));
    dispatch_semaphore_signal(v21);

    v22 = *(void **)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "preflightError"));
    v10 = v22;
    goto LABEL_10;
  }
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uiNeededKnownSemaphore"));
  dispatch_semaphore_signal(v18);

  v19 = *(void **)(a1 + 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "preflightError"));
  v10 = v19;
  v20 = -92;
LABEL_11:
  objc_msgSend(v10, "endTestWithStatusCode:error:", v20, v8);

LABEL_12:
}

void sub_100003EA4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = handleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 67109120;
    LODWORD(v16) = a2;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Preflight success: %d", (uint8_t *)&v15, 8u);
  }

  v11 = handleForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Preflight results: %@", (uint8_t *)&v15, 0xCu);
  }

  v13 = handleForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Preflight error: %@", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setPreflightSuccess:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setPreflightResults:", v7);
  objc_msgSend(*(id *)(a1 + 32), "setPreflightError:", v8);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

id sub_100004048(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateViewWithRepairSummary");
}

void sub_100004200(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "buttonEventMonitor"));
  objc_msgSend(v2, "removeTarget:", *(_QWORD *)(a1 + 32));

}

Class sub_100007388(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_100011D88)
  {
    v4 = off_10000C328;
    v5 = 0;
    qword_100011D88 = _sl_dlopen(&v4, &v3);
    if (!qword_100011D88)
    {
      abort_report_np("%s", (const char *)v3);
LABEL_8:
      sub_100007558();
    }
    if (v3)
      free(v3);
  }
  result = objc_getClass("DSHardwareButtonEventMonitor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_8;
  qword_100011D90 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000747C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000074A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007494();
  sub_10000747C((void *)&_mh_execute_header, v0, v1, "ButtonEventMonitor not available", v2, v3, v4, v5, v6);
  sub_10000748C();
}

void sub_1000074D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007494();
  sub_10000747C((void *)&_mh_execute_header, v0, v1, "DiagnosticsSupport not available", v2, v3, v4, v5, v6);
  sub_10000748C();
}

void sub_100007500()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007494();
  sub_10000747C((void *)&_mh_execute_header, v0, v1, "Missing partSPCs", v2, v3, v4, v5, v6);
  sub_10000748C();
}

void sub_10000752C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007494();
  sub_10000747C((void *)&_mh_execute_header, v0, v1, "Missing preflight RIK", v2, v3, v4, v5, v6);
  sub_10000748C();
}

void sub_100007558()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "DSHardwareButtonEventMonitor");
  MGGetBoolAnswer(v0);
}

id objc_msgSend__systemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemImageNamed:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addButton:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forButtonEvents_propagate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forButtonEvents:propagate:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boldButton");
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_buttonEventMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonEventMonitor");
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonTray");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_configurationWithHierarchicalColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithHierarchicalColor:");
}

id objc_msgSend_constraintEqualToAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:multiplier:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentView");
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentViewController");
}

id objc_msgSend_coordinator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinator");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultContentConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultContentConfiguration");
}

id objc_msgSend_deniedSPCs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deniedSPCs");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dequeueReusableCellWithIdentifier:forIndexPath:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_endTestWithStatusCode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endTestWithStatusCode:error:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_failSPCs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failSPCs");
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "font");
}

id objc_msgSend_getComponentString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getComponentString:");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_imageByApplyingSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageByApplyingSymbolConfiguration:");
}

id objc_msgSend_imageProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageProperties");
}

id objc_msgSend_initRepairSummaryTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initRepairSummaryTable");
}

id objc_msgSend_initWithComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithComponent:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithTitle_detailText_icon_adoptTableViewScrollView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:detailText:icon:adoptTableViewScrollView:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isServicePartWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isServicePartWithError:");
}

id objc_msgSend_linkButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "linkButton");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lockSPCs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockSPCs");
}

id objc_msgSend_lostSPCs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lostSPCs");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_moveToNextViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveToNextViewController");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_passSPCs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passSPCs");
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointSize");
}

id objc_msgSend_preflight_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflight:withReply:");
}

id objc_msgSend_preflightError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightError");
}

id objc_msgSend_preflightRIK(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightRIK");
}

id objc_msgSend_preflightResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightResults");
}

id objc_msgSend_preflightSuccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightSuccess");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeTarget:");
}

id objc_msgSend_repairSummaryNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "repairSummaryNeeded");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "row");
}

id objc_msgSend_sealedSPCs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sealedSPCs");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundView:");
}

id objc_msgSend_setBoldButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBoldButton:");
}

id objc_msgSend_setButtonEventMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setButtonEventMonitor:");
}

id objc_msgSend_setContentConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentConfiguration:");
}

id objc_msgSend_setContentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentViewController:");
}

id objc_msgSend_setCoordinator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCoordinator:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeniedSPCs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeniedSPCs:");
}

id objc_msgSend_setFailSPCs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFailSPCs:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHidesBackButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidesBackButton:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setLinkButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLinkButton:");
}

id objc_msgSend_setLockSPCs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLockSPCs:");
}

id objc_msgSend_setLostSPCs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLostSPCs:");
}

id objc_msgSend_setNavigationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNavigationController:");
}

id objc_msgSend_setPassSPCs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPassSPCs:");
}

id objc_msgSend_setPreflightError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreflightError:");
}

id objc_msgSend_setPreflightRIK_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreflightRIK:");
}

id objc_msgSend_setPreflightResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreflightResults:");
}

id objc_msgSend_setPreflightSuccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreflightSuccess:");
}

id objc_msgSend_setRepairSummaryNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRepairSummaryNeeded:");
}

id objc_msgSend_setScrollingDisabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrollingDisabled:");
}

id objc_msgSend_setSealedSPCs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSealedSPCs:");
}

id objc_msgSend_setSecondaryText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecondaryText:");
}

id objc_msgSend_setShouldShowPressHomeLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldShowPressHomeLabel:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setTableDataText2_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTableDataText2:");
}

id objc_msgSend_setTableDataText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTableDataText:");
}

id objc_msgSend_setTableImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTableImage:");
}

id objc_msgSend_setTableImageColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTableImageColor:");
}

id objc_msgSend_setTableView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTableView:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUiNeededKnownSemaphore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUiNeededKnownSemaphore:");
}

id objc_msgSend_setUnauthSPCs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnauthSPCs:");
}

id objc_msgSend_setViewControllers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllers:");
}

id objc_msgSend_spcResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spcResults:");
}

id objc_msgSend_startWithPriority_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithPriority:completion:");
}

id objc_msgSend_stopWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopWithCompletion:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBlueColor");
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGreenColor");
}

id objc_msgSend_systemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGroupedBackgroundColor");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemYellowColor");
}

id objc_msgSend_tableDataText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableDataText");
}

id objc_msgSend_tableDataText2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableDataText2");
}

id objc_msgSend_tableImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableImage");
}

id objc_msgSend_tableImageColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableImageColor");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableView");
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textProperties");
}

id objc_msgSend_uiNeededKnownSemaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uiNeededKnownSemaphore");
}

id objc_msgSend_unauthSPCs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unauthSPCs");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllers");
}
