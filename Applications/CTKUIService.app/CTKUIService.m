id sub_10000512C()
{
  if (qword_10000CF88 != -1)
    dispatch_once(&qword_10000CF88, &stru_100008288);
  return (id)qword_10000CF90;
}

void sub_1000054EC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_100005528(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_denyTokenAccess");

}

void sub_100005554(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_grantTokenAccess");

}

void sub_1000057AC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = sub_10000512C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100005B2C((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

id sub_100005810(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void sub_1000058CC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.CryptoTokenKit", "tkui");
  v2 = (void *)qword_10000CF90;
  qword_10000CF90 = (uint64_t)v1;

}

void sub_1000058FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
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

void sub_1000059BC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000058FC((void *)&_mh_execute_header, a2, a3, "Could not decode info. Received error: '%@'", a5, a6, a7, a8, 2u);
}

void sub_100005A24(uint64_t a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 8), "clientDisplayName"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 8), "providerDisplayName"));
  v6 = (void *)v5;
  v7 = *(_QWORD *)(a1 + 24);
  v8 = CFSTR("unknown");
  if (v7 == 2)
    v8 = CFSTR("denied");
  v9 = 138412802;
  v10 = v4;
  v11 = 2112;
  v12 = v5;
  if (v7 == 1)
    v8 = CFSTR("granted");
  v13 = 2112;
  v14 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Request to allow '%@' access to token provided by '%@' was '%@'", (uint8_t *)&v9, 0x20u);

}

void sub_100005B2C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000058FC((void *)&_mh_execute_header, a2, a3, "Could not access UI server. Received error: %@", a5, a6, a7, a8, 2u);
}

id objc_msgSend__connectToHostWithEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectToHostWithEndpoint:");
}

id objc_msgSend__denyTokenAccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_denyTokenAccess");
}

id objc_msgSend__grantTokenAccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_grantTokenAccess");
}

id objc_msgSend__invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidate");
}

id objc_msgSend__presentAlert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentAlert");
}

id objc_msgSend__presentAlertWithClientName_providerName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentAlertWithClientName:providerName:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__setEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEndpoint:");
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

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_clientDisplayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientDisplayName");
}

id objc_msgSend_containsTraitsInCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsTraitsInCollection:");
}

id objc_msgSend_correlationID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "correlationID");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivate");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_providerDisplayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerDisplayName");
}

id objc_msgSend_registerTokenAccessRequestCorrelationID_access_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerTokenAccessRequestCorrelationID:access:reply:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_traitCollectionWithUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollectionWithUserInterfaceStyle:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcEndpoint");
}
