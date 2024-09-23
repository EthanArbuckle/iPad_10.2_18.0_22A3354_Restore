void sub_1000023CC(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("0123456789*#+")));
  v2 = (void *)qword_10001CCD0;
  qword_10001CCD0 = v1;

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

void sub_100004080(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_1000040B4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "invalidate");

}

void sub_100005738(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_10000576C(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "invalidate");

}

void sub_10000743C(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void sub_100007500(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_10000788C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000078C0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismiss");

}

void sub_1000079B0(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_1000079E4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "invalidate");

}

id sub_100008044(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
  v3 = objc_msgSend(v2, "isInternalInstall");

  if (v3)
  {
    v4 = STKCommonLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received string: %{public}@", (uint8_t *)&v8, 0xCu);
    }

  }
  return objc_msgSend(*(id *)(a1 + 40), "_noteDidReceiveContent:", *(_QWORD *)(a1 + 32));
}

void sub_1000081A0(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];
  uint8_t buf[4];
  int v16;
  __int16 v17;
  uint64_t v18;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BSPlatform sharedInstance](BSPlatform, "sharedInstance"));
  v3 = objc_msgSend(v2, "isInternalInstall");

  if (v3)
  {
    v4 = STKCommonLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 67109378;
      v16 = v6;
      v17 = 2114;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received error code: %d, string: %{public}@", buf, 0x12u);
    }

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("USSD_ERROR"), &stru_100014540, CFSTR("SIMToolkitUI")));

  if (*(_QWORD *)(a1 + 32))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService"), v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", *(_QWORD *)(a1 + 32), &stru_100014540, CFSTR("SIMToolkitUI")));
    v14[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n")));

    v9 = (void *)v13;
  }
  objc_msgSend(*(id *)(a1 + 40), "_noteDidReceiveContent:", v9);

}

void sub_1000083C0(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("USSD_TERMINATED"), &stru_100014540, CFSTR("SIMToolkitUI")));
  objc_msgSend(v1, "_noteDidReceiveContent:", v2);

}

id sub_100008494(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAllowsResponse:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_setupResponseBar");
}

id sub_10000853C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
}

id sub_1000099B8(void *a1)
{
  id v1;
  void *v2;
  unsigned int v3;
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", STKUSSDSupplementaryServiceSettingTypeKey));
  v3 = objc_msgSend(v2, "intValue");

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", STKUSSDSupplementaryServiceNotificationDataKey));
  if (!v4)
    v4 = objc_alloc_init((Class)CTSuppServicesNotificationData);
  v5 = &stru_100014540;
  switch(v3)
  {
    case 1u:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callForwardingNumber"));
      if (objc_msgSend(v6, "length"))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Forwards to %@\n"), &stru_100014540, CFSTR("SIMToolkitUI")));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v6));

        v6 = v7;
      }
      else
      {
        v9 = &stru_100014540;
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("%@ Call Forwarding\n%@\n%@%@"), &stru_100014540, CFSTR("SIMToolkitUI")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callClassString"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callForwardingReasonString"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enabledString"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v12, v14, v9, v17));

      goto LABEL_19;
    case 3u:
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("%@ Call Waiting\n%@"), &stru_100014540, CFSTR("SIMToolkitUI")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callClassString"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enabledString"));
      v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v11, v12);
      goto LABEL_22;
    case 4u:
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("%@ Call Barring\n%@\n%@"), &stru_100014540, CFSTR("SIMToolkitUI")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callClassString"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callBarringFacilityString"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enabledString"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v11, v12, v14));
LABEL_19:

      goto LABEL_23;
    case 5u:
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("Supplementary Service Password\n%@"), &stru_100014540, CFSTR("SIMToolkitUI")));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ssServiceTypeString"));
      goto LABEL_16;
    case 6u:
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("Calling Line ID Restriction\n%@"), &stru_100014540, CFSTR("SIMToolkitUI")));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callingLineIDRestrictionString"));
      goto LABEL_16;
    case 7u:
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("Connected Line ID Restriction\n%@"), &stru_100014540, CFSTR("SIMToolkitUI")));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedLineIDRestrictionString"));
      goto LABEL_16;
    case 8u:
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("Calling Line Presentation\n%@"), &stru_100014540, CFSTR("SIMToolkitUI")));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callingLinePresentationString"));
      goto LABEL_16;
    case 9u:
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("Connected Line Presentation\n%@"), &stru_100014540, CFSTR("SIMToolkitUI")));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedLinePresentationString"));
      goto LABEL_16;
    case 0xAu:
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enabledString"));
      if (objc_msgSend(v16, "length"))
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("\n"), "stringByAppendingString:", v16));
      else
        v9 = &stru_100014540;

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("%@ Fixed Dialing%@"), &stru_100014540, CFSTR("SIMToolkitUI")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callClassString"));
      v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v12, v9);
LABEL_22:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v13);
LABEL_23:

      goto LABEL_24;
    case 0xBu:
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("Calling Name Presentation\n%@"), &stru_100014540, CFSTR("SIMToolkitUI")));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callingNamePresentationString"));
LABEL_16:
      v11 = (void *)v15;
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v15));
LABEL_24:

      break;
    default:
      break;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", STKUSSDSupplementaryServiceEventTypeKey));
  v19 = objc_msgSend(v18, "intValue");

  switch(v19)
  {
    case 1u:
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
      v21 = v20;
      v22 = CFSTR("Setting Interrogation Succeeded");
      goto LABEL_29;
    case 2u:
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
      v21 = v20;
      v22 = CFSTR("Setting Interrogation Failed");
LABEL_29:
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_100014540, CFSTR("SIMToolkitUI")));
      goto LABEL_33;
    case 3u:
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mmiProcedureString"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
      v25 = v24;
      v26 = CFSTR("Setting %@ Succeeded");
      goto LABEL_32;
    case 4u:
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mmiProcedureString"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
      v25 = v24;
      v26 = CFSTR("Setting %@ Failed");
LABEL_32:
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", v26, &stru_100014540, CFSTR("SIMToolkitUI")));
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v27, v21));

LABEL_33:
      break;
    default:
      v23 = &stru_100014540;
      break;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v23, "stringByAppendingString:", v5));

  return v28;
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGRectValue");
}

id objc_msgSend__linePresentationStringForValueNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_linePresentationStringForValueNumber:");
}

id objc_msgSend__noteDidReceiveContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_noteDidReceiveContent:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__replyView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_replyView");
}

id objc_msgSend__selectListItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_selectListItem:");
}

id objc_msgSend__sendsResponseUponDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendsResponseUponDisplay");
}

id objc_msgSend__sessionActionFromBSAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sessionActionFromBSAction:");
}

id objc_msgSend__setEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEndpoint:");
}

id objc_msgSend__setHidesShadow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setHidesShadow:");
}

id objc_msgSend__setLayoutDebuggingIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setLayoutDebuggingIdentifier:");
}

id objc_msgSend__setupResponseBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupResponseBar");
}

id objc_msgSend__simToolkitListItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_simToolkitListItems");
}

id objc_msgSend__updateCharsRemaining(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateCharsRemaining");
}

id objc_msgSend__updateNotifyText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateNotifyText:");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actions");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addLayoutGuide_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLayoutGuide:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addTarget_action_forEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forEvents:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "address");
}

id objc_msgSend_alertContainerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertContainerView");
}

id objc_msgSend_alertText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertText");
}

id objc_msgSend_allowsResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowsResponse");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_beginEditing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginEditing");
}

id objc_msgSend_behavior(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "behavior");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_blurEffectContainerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blurEffectContainerView");
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "body");
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boldSystemFontOfSize:");
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

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_callBarringFacility(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callBarringFacility");
}

id objc_msgSend_callBarringFacilityString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callBarringFacilityString");
}

id objc_msgSend_callClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callClass");
}

id objc_msgSend_callClassString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callClassString");
}

id objc_msgSend_callForwardingNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callForwardingNumber");
}

id objc_msgSend_callForwardingReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callForwardingReason");
}

id objc_msgSend_callForwardingReasonString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callForwardingReasonString");
}

id objc_msgSend_callingLineIDRestrictionString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callingLineIDRestrictionString");
}

id objc_msgSend_callingLineIdRestriction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callingLineIdRestriction");
}

id objc_msgSend_callingLinePresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callingLinePresentation");
}

id objc_msgSend_callingLinePresentationString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callingLinePresentationString");
}

id objc_msgSend_callingNamePresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callingNamePresentation");
}

id objc_msgSend_callingNamePresentationString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callingNamePresentationString");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_clearTimeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearTimeoutTimer");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_connectedLineIDRestrictionString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedLineIDRestrictionString");
}

id objc_msgSend_connectedLineIdRestriction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedLineIdRestriction");
}

id objc_msgSend_connectedLinePresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedLinePresentation");
}

id objc_msgSend_connectedLinePresentationString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedLinePresentationString");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToAnchor_multiplier_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:multiplier:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_contentContainerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentContainerView");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentSize");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentView");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentCalls(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalls");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_darkBlurView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "darkBlurView");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultHeight");
}

id objc_msgSend_defaultInterButtonSpacing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultInterButtonSpacing");
}

id objc_msgSend_defaultSideMarginForSingleButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSideMarginForSingleButton");
}

id objc_msgSend_defaultText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultText");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissButton");
}

id objc_msgSend_effectForBlurEffect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectForBlurEffect:");
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enabled");
}

id objc_msgSend_enabledString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enabledString");
}

id objc_msgSend_endEditing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endEditing");
}

id objc_msgSend_endEditing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endEditing:");
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fill");
}

id objc_msgSend_formattedAboutText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formattedAboutText");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForSelectedRow");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithDefaultSizeForOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDefaultSizeForOrientation:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_color_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:color:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithFrame_textContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:textContainer:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNibName:bundle:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStyle:reuseIdentifier:");
}

id objc_msgSend_initWithTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:");
}

id objc_msgSend_initWithTitle_icon_color_frame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:icon:color:frame:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_inputTextField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputTextField");
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertSubview:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isDigitsOnly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDigitsOnly");
}

id objc_msgSend_isHighPriority(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHighPriority");
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalInstall");
}

id objc_msgSend_isSecure(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSecure");
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSelected");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutFrame");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_learnMoreButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "learnMoreButton");
}

id objc_msgSend_leftNavigationButtonPressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftNavigationButtonPressed");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_listItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listItems");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_maximumInputLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumInputLength");
}

id objc_msgSend_messageTextLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageTextLabel");
}

id objc_msgSend_messageTitleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageTitleLabel");
}

id objc_msgSend_metricsForTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metricsForTextStyle:");
}

id objc_msgSend_minimumInputLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumInputLength");
}

id objc_msgSend_mmiProcedure(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mmiProcedure");
}

id objc_msgSend_mmiProcedureString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mmiProcedureString");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_newBottomBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newBottomBar");
}

id objc_msgSend_newTopBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newTopBar");
}

id objc_msgSend_notifyType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyType");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneNumber");
}

id objc_msgSend_phonePadCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phonePadCharacterSet");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_pushNavigationItem_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushNavigationItem:animated:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadData");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resignFirstResponder");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_roundedRectBezierPath_withRoundedCorners_withCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "row");
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaLayoutGuide");
}

id objc_msgSend_scaledFontForFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scaledFontForFont:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_sendResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendResponse:");
}

id objc_msgSend_sendSuccessWithResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendSuccessWithResponse:");
}

id objc_msgSend_sendSuccessWithSelectedItemIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendSuccessWithSelectedItemIndex:");
}

id objc_msgSend_sendSuccessWithSelectedResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendSuccessWithSelectedResponse:");
}

id objc_msgSend_sessionAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionAction");
}

id objc_msgSend_sessionData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionData");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAcceptsFloatingKeyboard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAcceptsFloatingKeyboard:");
}

id objc_msgSend_setAcceptsSplitKeyboard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAcceptsSplitKeyboard:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAllowsMenuButtonDismissal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsMenuButtonDismissal:");
}

id objc_msgSend_setAllowsResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsResponse:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAutocorrectionType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutocorrectionType:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundImage_forBarMetrics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundImage:forBarMetrics:");
}

id objc_msgSend_setBarStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBarStyle:");
}

id objc_msgSend_setBlursBackground_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlursBackground:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderStyle:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setButton2_andStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setButton2:andStyle:");
}

id objc_msgSend_setButton_andStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setButton:andStyle:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setContentEdgeInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentEdgeInsets:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentOffset:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDigitsOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDigitsOnly:");
}

id objc_msgSend_setEditable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEditable:");
}

id objc_msgSend_setEffect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEffect:");
}

id objc_msgSend_setEstimatedRowHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEstimatedRowHeight:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setInsertionPointColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInsertionPointColor:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setKeyboardAppearance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyboardAppearance:");
}

id objc_msgSend_setLearnsCorrections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLearnsCorrections:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setMaxLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxLength:");
}

id objc_msgSend_setMessageString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessageString:");
}

id objc_msgSend_setMinLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinLength:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRowHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRowHeight:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setSecureTextEntry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecureTextEntry:");
}

id objc_msgSend_setSelectable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectable:");
}

id objc_msgSend_setTableHeaderView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTableHeaderView:");
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

id objc_msgSend_setTextContainerInset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextContainerInset:");
}

id objc_msgSend_setTextLoupeVisibility_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextLoupeVisibility:");
}

id objc_msgSend_setTextViewText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextViewText:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleColor:forState:");
}

id objc_msgSend_setTitleVerticalOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleVerticalOffset:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setTranslucent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslucent:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shouldSendResponseUponDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldSendResponseUponDisplay");
}

id objc_msgSend_showsFromAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showsFromAddress");
}

id objc_msgSend_simLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "simLabel");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_ssServiceTypeString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ssServiceTypeString");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAnimating");
}

id objc_msgSend_startTimeoutTimerIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTimeoutTimerIfNecessary");
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAnimating");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_supplementaryServiceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supplementaryServiceType");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_textInputTraits(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textInputTraits");
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textLabel");
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeout");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_topBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topBar");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_validateAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateAction:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_wakeup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wakeup");
}

id objc_msgSend_wantsTextView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wantsTextView");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcEndpoint");
}

id objc_msgSend_zoomScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoomScale");
}
