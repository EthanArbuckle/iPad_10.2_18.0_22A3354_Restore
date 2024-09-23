void sub_100004ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_100004F18(uint64_t a1)
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

void sub_10000513C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "buttonEventMonitor"));
  objc_msgSend(v2, "removeTarget:", *(_QWORD *)(a1 + 32));

}

id sub_100005C00(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  NSObject *v6;

  v2 = reboot3(0x8000000000000000);
  if (!v2)
    return objc_msgSend(*(id *)(a1 + 32), "endTestWithStatusCode:error:", 0, 0);
  v4 = v2;
  v5 = handleForCategory(0, v3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000065D0(v4, v6);

  return objc_msgSend(*(id *)(a1 + 32), "endTestWithStatusCode:error:", -73, 0);
}

Class sub_100006294(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_10000C9E8)
  {
    v4 = off_100008270;
    v5 = 0;
    qword_10000C9E8 = _sl_dlopen(&v4, &v3);
    if (!qword_10000C9E8)
    {
      abort_report_np("%s", (const char *)v3);
LABEL_8:
      sub_100006640();
    }
    if (v3)
      free(v3);
  }
  result = objc_getClass("DSHardwareButtonEventMonitor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_8;
  qword_10000C9F0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100006388(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100006570(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006388((void *)&_mh_execute_header, a1, a3, "ButtonEventMonitor not available", a5, a6, a7, a8, 0);
  sub_100006398();
}

void sub_1000065A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006388((void *)&_mh_execute_header, a1, a3, "DiagnosticsSupport not available", a5, a6, a7, a8, 0);
  sub_100006398();
}

void sub_1000065D0(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Reboot failed with error: %d", (uint8_t *)v2, 8u);
  sub_100006398();
}

void sub_100006640()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "DSHardwareButtonEventMonitor");
  NSExtensionMain(v0);
}

id objc_msgSend_NSNumberFromKey_lowerBound_upperBound_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NSNumberFromKey:lowerBound:upperBound:defaultValue:failed:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addButton:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
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

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boldButton");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_buttonEventMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonEventMonitor");
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonTray");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_configurationWithHierarchicalColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithHierarchicalColor:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentViewController");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_endTestWithStatusCode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endTestWithStatusCode:error:");
}

id objc_msgSend_imageByApplyingSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageByApplyingSymbolConfiguration:");
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

id objc_msgSend_isLostMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLostMode");
}

id objc_msgSend_isNetworkError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNetworkError");
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftAnchor");
}

id objc_msgSend_linkButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "linkButton");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_removeTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeTarget:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightAnchor");
}

id objc_msgSend_setBoldButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBoldButton:");
}

id objc_msgSend_setButtonEventMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setButtonEventMonitor:");
}

id objc_msgSend_setContentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentViewController:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setLinkButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLinkButton:");
}

id objc_msgSend_setScrollingDisabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrollingDisabled:");
}

id objc_msgSend_setShouldShowPressHomeLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldShowPressHomeLabel:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_startWithPriority_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithPriority:completion:");
}

id objc_msgSend_stopWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopWithCompletion:");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBlueColor");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_testIdentifer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testIdentifer");
}

id objc_msgSend_testStatusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testStatusCode");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}
