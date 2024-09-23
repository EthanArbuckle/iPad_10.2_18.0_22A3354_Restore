void sub_10000452C(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  id v3;
  NSObject *v4;
  int v5;
  OS_xpc_object *v6;

  v2 = a2;
  v3 = sub_1000052CC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "presenter connection event: %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_100004FFC(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  _xpc_connection_s *v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  xpc_object_t values;
  char *keys[2];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    keys[0] = "result";
    values = xpc_int64_create(1);
    v2 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_xpc_connection_s **)(v3 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000512C;
    v8[3] = &unk_100008230;
    v8[4] = v3;
    xpc_connection_send_message_with_reply(v4, v2, (dispatch_queue_t)&_dispatch_main_q, v8);

  }
  else
  {
    v5 = sub_1000052CC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(keys[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No connection to presenter, dismissing self", (uint8_t *)keys, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "windowScene"));
    objc_msgSend(v7, "invalidate");

  }
}

void sub_10000512C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  char *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t v10[16];

  v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    v6 = xpc_copy_description(v3);
    v7 = sub_1000052CC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000550C((uint64_t)v6, v8, v9);

    free(v6);
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "windowScene"));
    -[NSObject invalidate](v5, "invalidate");
  }
  else
  {
    v4 = sub_1000052CC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received reply to our result message, awaiting invalidation", v10, 2u);
    }
  }

}

void sub_1000052C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id sub_1000052CC()
{
  if (qword_10000D6A8 != -1)
    dispatch_once(&qword_10000D6A8, &stru_100008298);
  return (id)qword_10000D6B0;
}

void sub_10000530C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.appprotection", "UIHost");
  v2 = (void *)qword_10000D6B0;
  qword_10000D6B0 = (uint64_t)v1;

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
  objc_autoreleasePoolPop(v4);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  return v8;
}

void sub_1000053FC(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "configurationContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v6 = 138412290;
  v7 = v4;
  sub_1000052C0((void *)&_mh_execute_header, a2, v5, "no bundleID provided for scene activation: %@", (uint8_t *)&v6);

}

void sub_1000054A0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 134217984;
  v4 = a1;
  sub_1000052C0((void *)&_mh_execute_header, a2, a3, "unknown feature %lld", (uint8_t *)&v3);
}

void sub_10000550C(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 136315138;
  v4 = a1;
  sub_1000052C0((void *)&_mh_execute_header, a2, a3, "Error on connection to presenter, dismissing self: %s", (uint8_t *)&v3);
}

id objc_msgSend_applicationWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationWithBundleIdentifier:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_configurationContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationContext");
}

id objc_msgSend_connectToInvokerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectToInvokerEndpoint:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_initForApplication_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForApplication:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_presentEducationViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentEducationViewController:");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windowScene");
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcEndpoint");
}
