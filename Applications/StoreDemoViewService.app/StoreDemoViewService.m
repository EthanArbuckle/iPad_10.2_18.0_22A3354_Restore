void sub_1000020F4(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  v3 = sub_10000262C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100006484(v2, v4);

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

id sub_10000262C()
{
  if (qword_100012BE8 != -1)
    dispatch_once(&qword_100012BE8, &stru_10000C398);
  return (id)qword_100012BE0;
}

void sub_10000266C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.MobileStoreDemo", "Default");
  v2 = (void *)qword_100012BE0;
  qword_100012BE0 = (uint64_t)v1;

}

id sub_10000269C()
{
  if (qword_100012BF8 != -1)
    dispatch_once(&qword_100012BF8, &stru_10000C3B8);
  return (id)qword_100012BF0;
}

void sub_1000026DC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.MobileStoreDemo", "ScreenSaver");
  v2 = (void *)qword_100012BF0;
  qword_100012BF0 = (uint64_t)v1;

}

id sub_10000270C()
{
  if (qword_100012C08 != -1)
    dispatch_once(&qword_100012C08, &stru_10000C3D8);
  return (id)qword_100012C00;
}

void sub_10000274C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.MobileStoreDemo", "Message");
  v2 = (void *)qword_100012C00;
  qword_100012C00 = (uint64_t)v1;

}

id sub_10000277C()
{
  if (qword_100012C18 != -1)
    dispatch_once(&qword_100012C18, &stru_10000C3F8);
  return (id)qword_100012C10;
}

void sub_1000027BC(id a1)
{
  os_log_t v1;
  id v2;
  void *v3;

  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v1 = os_log_create("com.apple.MobileStoreDemo", "Signpost");
  }
  else
  {
    v1 = (os_log_t)&_os_log_disabled;
    v2 = &_os_log_disabled;
  }
  v3 = (void *)qword_100012C10;
  qword_100012C10 = (uint64_t)v1;

}

void sub_100002818(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  void *v10;

  v9 = a1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
  objc_msgSend(v10, "logWithFormat:andArgs:", v9, &a9);

}

void sub_1000028B4(id a1)
{
  MSDLogModel *v1;
  void *v2;

  v1 = objc_alloc_init(MSDLogModel);
  v2 = (void *)qword_100012C20;
  qword_100012C20 = (uint64_t)v1;

}

void sub_100002A50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100002DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002DF8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100002E08(uint64_t a1)
{

}

void sub_100002E10(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stringByAppendingFormat:", CFSTR("/%@"), a2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "description"));
  NSLog(CFSTR("Checking existing log file (full path) %@ against %@"), v14, v6);

  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "attributesOfItemAtPath:error:", v14, 0));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "fileCreationDate"));
  v11 = objc_msgSend(v10, "compare:", *(_QWORD *)(a1 + 40));

  if (v11 == (id)-1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "fileCreationDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
    NSLog(CFSTR("Removing %@ whose creation date is %@."), v14, v13);

    objc_msgSend(*(id *)(a1 + 48), "removeItemAtPath:error:", v14, 0);
  }
  *a4 = 0;

}

id sub_1000051B0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doCancelInstall");
}

id sub_1000051B8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timeout:", 0);
}

void sub_10000557C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1000055A0(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  id WeakRetained;
  uint8_t v8[16];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](MSDViewServiceModel, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "errorToReport"));

  v4 = sub_10000262C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Operation failed...", v8, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "operationFailed:", v3);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Operation completed...", buf, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "quit");
  }

}

void sub_100005698(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateErrorState");

}

void sub_1000056C4(uint64_t a1)
{
  void *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDViewServiceModel sharedInstance](MSDViewServiceModel, "sharedInstance"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "progress"));

  if (v8)
  {
    v3 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "progressBar"));
    objc_msgSend(v5, "setHidden:", 0);

    v6 = objc_loadWeakRetained(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "progressBar"));
    objc_msgSend(v8, "floatValue");
    objc_msgSend(v7, "setProgress:animated:", 1);

  }
}

id sub_100005A20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "quit");
}

void sub_100005CB8(id a1)
{
  MSDViewServiceModel *v1;
  void *v2;

  v1 = objc_alloc_init(MSDViewServiceModel);
  v2 = (void *)qword_100012C30;
  qword_100012C30 = (uint64_t)v1;

}

void sub_1000063CC(char a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Setting idle timer disabled: %d", (uint8_t *)v2, 8u);
}

void sub_100006444(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to corece UIScene into UIWindowScene.", v1, 2u);
}

void sub_100006484(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to destroy scene session: %{public}@", (uint8_t *)&v4, 0xCu);

}

void sub_100006518(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unknown key changed.", v1, 2u);
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

id objc_msgSend_addConstraint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addConstraint:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelButton");
}

id objc_msgSend_cancelOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelOperation");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_checkInBlockingUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInBlockingUI");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_configurationContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationContext");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentView");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeInterval:sinceDate:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayString");
}

id objc_msgSend_effectForBlurEffect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectForBlurEffect:");
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_enableLogToFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableLogToFile:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorMessage");
}

id objc_msgSend_errorMessageFromErrors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorMessageFromErrors");
}

id objc_msgSend_errorToReport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorToReport");
}

id objc_msgSend_errorView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorView");
}

id objc_msgSend_errors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errors");
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileCreationDate");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileNameForTodayUnder_prefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileNameForTodayUnder:prefix:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_fontWithName_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontWithName:size:");
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCalendarIdentifier:");
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContext:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithProgressViewStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProgressViewStyle:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertSubview:atIndex:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHidden");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedFailureReason");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_logFP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logFP");
}

id objc_msgSend_logMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logMessage:");
}

id objc_msgSend_logWithFormat_andArgs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logWithFormat:andArgs:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainLabel");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "month");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_observerAdded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "observerAdded");
}

id objc_msgSend_operationFailed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationFailed:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progress");
}

id objc_msgSend_progressBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressBar");
}

id objc_msgSend_quit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "quit");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_requestSceneSessionDestruction_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestSceneSessionDestruction:options:errorHandler:");
}

id objc_msgSend_restartTimerWithTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restartTimerWithTimeInterval:");
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaLayoutGuide");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCancelButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancelButton:");
}

id objc_msgSend_setConfigurationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfigurationContext:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setDisablesControlCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisablesControlCenter:");
}

id objc_msgSend_setDisablesSiri_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisablesSiri:");
}

id objc_msgSend_setDisplayString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayString:");
}

id objc_msgSend_setErrorMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setErrorMessage:");
}

id objc_msgSend_setErrorToReport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setErrorToReport:");
}

id objc_msgSend_setErrorView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setErrorView:");
}

id objc_msgSend_setErrors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setErrors:");
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

id objc_msgSend_setIdleTimerDisabled_forReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdleTimerDisabled:forReason:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLineSpacing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineSpacing:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLogFP_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogFP:");
}

id objc_msgSend_setMainLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMainLabel:");
}

id objc_msgSend_setMaximumLineHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumLineHeight:");
}

id objc_msgSend_setMinimumLineHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumLineHeight:");
}

id objc_msgSend_setMinimumPressDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumPressDuration:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberOfTouchesRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfTouchesRequired:");
}

id objc_msgSend_setObserverAdded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObserverAdded:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setProgress_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgress:animated:");
}

id objc_msgSend_setProgressBar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressBar:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setShowCancelButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowCancelButton:");
}

id objc_msgSend_setShowErrorTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowErrorTimer:");
}

id objc_msgSend_setStatusLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusLabel:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTrackTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrackTintColor:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_showCancelButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showCancelButton");
}

id objc_msgSend_showErrorTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showErrorTimer");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_statusLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusLabel");
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

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByExpandingTildeInPath");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timer");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_typeOfDemoDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeOfDemoDevice");
}

id objc_msgSend_updateErrorState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateErrorState");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "year");
}
