void sub_1000020F8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v9));

  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@=%@"), v8, v10));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

}

void sub_100002C68(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CarrierSpaceOAuthResult"));
  v8[0] = CFSTR("status_domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a1));
  v8[1] = CFSTR("status_code");
  v9[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a2));
  v9[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  AnalyticsSendEvent(v4, v7);

}

void sub_100002D68(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a1;
  v1 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "error"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v6 = objc_msgSend(v5, "isEqualToString:", NSCocoaErrorDomain);

    if (v6)
    {
      if (objc_msgSend(v4, "code") == (id)3840)
      {
        v7 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3));
        if (v7)
          goto LABEL_7;
      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "errorDescription"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "errorDescription"));
    objc_msgSend(v1, "setObject:forKeyedSubscript:", v9, CFSTR("oauth_error"));

    v7 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
    if (v7)
    {
LABEL_7:
      v10 = (void *)v7;
LABEL_10:
      objc_msgSend(v1, "setObject:forKeyedSubscript:", v2, CFSTR("status_domain"));
      objc_msgSend(v1, "setObject:forKeyedSubscript:", v10, CFSTR("status_code"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CarrierSpaceOAuthResult"));
      AnalyticsSendEvent(v12, v1);

      goto LABEL_11;
    }
  }
  if (objc_msgSend(v13, "statusCode") != (id)200)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v13, "statusCode")));
    v2 = (void *)v11;
    if (v10)
      goto LABEL_10;
  }
LABEL_11:

}

uint64_t sub_100003044(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100003634(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100003644(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(CTCarrierSpaceAuthAppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

id sub_1000036C4()
{
  if (qword_1000124E8 != -1)
    dispatch_once(&qword_1000124E8, &stru_10000C400);
  return (id)qword_1000124E0;
}

void sub_100003704(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.carrierspaceauth", "log");
  v2 = (void *)qword_1000124E0;
  qword_1000124E0 = (uint64_t)v1;

}

uint64_t sub_100003734()
{
  return MGGetBoolAnswer(CFSTR("apple-internal-install"));
}

id *sub_100003B90(id *result, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
    return (id *)objc_msgSend(result[4], "_presentAlertController:", 1);
  return result;
}

void sub_100003CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003D1C(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[5];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100003DA8;
    v4[3] = &unk_10000C450;
    v5 = WeakRetained;
    objc_msgSend(v3, "userDidAcceptPlanTerms:completion:", 1, v4);

  }
}

id sub_100003DA8(uint64_t a1)
{
  id result;
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  result = objc_msgSend(*(id *)(a1 + 32), "_loadAuthUrl");
  if ((result & 1) == 0)
  {
    v3 = sub_1000036C4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unable to load auth URL after user accepted plan terms", v5, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_deactivate");
  }
  return result;
}

void sub_100003E24(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[5];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100003EB0;
    v4[3] = &unk_10000C450;
    v5 = WeakRetained;
    objc_msgSend(v3, "userDidAcceptPlanTerms:completion:", 0, v4);

  }
}

id sub_100003EB0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivate");
}

id sub_100004508(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivate");
}

void sub_100004664(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100004680(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  v2 = sub_1000036C4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Notified that we have exited auth flow, going to dismiss alert", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100004744;
    v6[3] = &unk_10000C4E0;
    v7 = WeakRetained;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v6);

  }
}

id sub_100004744(uint64_t a1)
{
  void *v1;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "dismiss");

  return objc_msgSend(UIApp, "terminateWithSuccess");
}

void sub_100004948(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  objc_msgSend(v1, "makeKeyAndVisible");

}

id sub_100004AC8(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004B20;
  v3[3] = &unk_10000C450;
  v3[4] = v1;
  return objc_msgSend(v1, "_sendAuthFailure:completion:", 9, v3);
}

id sub_100004B20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivate");
}

void sub_100004B28(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "visibleViewController"));
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

id sub_100004C38(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "name"));
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v7)
    *a4 = 1;
  return v7;
}

void sub_100004D80(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_getValueFromContextForKey:", CFSTR("kCTCarrierSpaceCarrierName")));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AlertControllerFactory alertControllerWithBiometryType:forCarrier:completion:](AlertControllerFactory, "alertControllerWithBiometryType:forCarrier:completion:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 40)));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "visibleViewController"));
  objc_msgSend(v3, "presentViewController:animated:completion:", v2, 1, 0);

}

id sub_100005068(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "setShouldCache:", a2);
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000050D4;
  v6[3] = &unk_10000C450;
  v6[4] = v3;
  return objc_msgSend(v3, "_sendAuthInfo:completion:", v4, v6);
}

id sub_1000050D4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivate");
}

void sub_10000529C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000052C4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  AuthTokenResponse *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10 = -[AuthTokenResponse initWithData:urlResponse:error:]([AuthTokenResponse alloc], "initWithData:urlResponse:error:", v11, v7, v8);
    objc_msgSend(WeakRetained, "_handleTokenResponse:", v10);

  }
}

id sub_10000592C(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005984;
  v3[3] = &unk_10000C450;
  v3[4] = v1;
  return objc_msgSend(v1, "_sendAuthFailure:completion:", 10, v3);
}

id sub_100005984(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivate");
}

id sub_100005B4C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivate");
}

id sub_100005CE0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deactivate");
}

void sub_100005D8C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005D9C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100005DDC(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  sub_100005DA8();
  sub_100005D9C((void *)&_mh_execute_header, a2, v4, "Auth code exchange failed with error: %@", v5);

  sub_100005DD0();
}

void sub_100005E5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005DBC();
  sub_100005D8C((void *)&_mh_execute_header, v0, v1, "Got openURL callback with no in-flight request, ignoring", v2, v3, v4, v5, v6);
  sub_100005DB4();
}

void sub_100005E88()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100005DA8();
  sub_100005D9C((void *)&_mh_execute_header, v0, v1, "Redirect URL did not contain auth code! URL %@", v2);
  sub_100005DC8();
}

void sub_100005EEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005DBC();
  sub_100005D8C((void *)&_mh_execute_header, v0, v1, "Expected a 'state' query item, but wasn't found", v2, v3, v4, v5, v6);
  sub_100005DB4();
}

void sub_100005F18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005DBC();
  sub_100005D8C((void *)&_mh_execute_header, v0, v1, "Unable to decode state value!", v2, v3, v4, v5, v6);
  sub_100005DB4();
}

void sub_100005F44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005DBC();
  sub_100005D8C((void *)&_mh_execute_header, v0, v1, "Decoded dictionary in state parameter does not match!", v2, v3, v4, v5, v6);
  sub_100005DB4();
}

void sub_100005F70()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100005DA8();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Received unexpected redirect URL '%@', expected '%@'", v2, 0x16u);
  sub_100005DC8();
}

void sub_100005FEC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100005DA8();
  sub_100005D9C((void *)&_mh_execute_header, v0, v1, "Load error: %@", v2);
  sub_100005DC8();
}

void sub_100006050(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend(a1, "statusCode");
  sub_100005DA8();
  sub_100005D9C((void *)&_mh_execute_header, a2, v3, "Server returned error in response: %ld", v4);
  sub_100005DD0();
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLProtocol_didFailWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLProtocol:didFailWithError:");
}

id objc_msgSend_URLProtocolDidFinishLoading_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLProtocolDidFinishLoading:");
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLQueryAllowedCharacterSet");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__actionForErrorType_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_actionForErrorType:completion:");
}

id objc_msgSend__addOptionalParametersForAuthCodeRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addOptionalParametersForAuthCodeRequest:");
}

id objc_msgSend__base64EncodedDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_base64EncodedDictionary:");
}

id objc_msgSend__configure(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configure");
}

id objc_msgSend__deactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deactivate");
}

id objc_msgSend__decodeBase64Dictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_decodeBase64Dictionary:");
}

id objc_msgSend__evaluateBiometry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_evaluateBiometry:");
}

id objc_msgSend__exchangeAuthCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_exchangeAuthCode:");
}

id objc_msgSend__generateStateDict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generateStateDict");
}

id objc_msgSend__getNSURLSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getNSURLSessionConfiguration");
}

id objc_msgSend__getURLFromContextForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getURLFromContextForKey:");
}

id objc_msgSend__getValueFromContextForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getValueFromContextForKey:");
}

id objc_msgSend__handleTokenResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleTokenResponse:");
}

id objc_msgSend__itemWithName_items_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_itemWithName:items:");
}

id objc_msgSend__loadAuthUrl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadAuthUrl");
}

id objc_msgSend__loadPlanTermsUrl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadPlanTermsUrl");
}

id objc_msgSend__loadRemoteUIController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadRemoteUIController");
}

id objc_msgSend__loadURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadURL:");
}

id objc_msgSend__messageForErrorType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_messageForErrorType:");
}

id objc_msgSend__presentAlertController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentAlertController:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__sendAuthFailure_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendAuthFailure:completion:");
}

id objc_msgSend__sendAuthInfo_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendAuthInfo:completion:");
}

id objc_msgSend__titleForErrorType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_titleForErrorType:");
}

id objc_msgSend__urlRequestForBaseURL_params_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_urlRequestForBaseURL:params:");
}

id objc_msgSend__validateRedirectURL_withExpectedURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateRedirectURL:withExpectedURL:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithContext:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_alertControllerWithBiometryType_forCarrier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithBiometryType:forCarrier:completion:");
}

id objc_msgSend_alertControllerWithError_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithError:completion:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authenticationDidFail_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationDidFail:completion:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_biometryType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "biometryType");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_canEvaluatePolicy_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canEvaluatePolicy:error:");
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "client");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ephemeralSessionConfiguration");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorDescription");
}

id objc_msgSend_errorForCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorForCode:");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "events");
}

id objc_msgSend_expiryDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expiryDate");
}

id objc_msgSend_handleAppURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleAppURL:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBaseURL_clientID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBaseURL:clientID:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithData_urlResponse_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:urlResponse:error:");
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNibName:bundle:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithServiceName_viewControllerClassName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceName:viewControllerClassName:");
}

id objc_msgSend_initWithTitle_message_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:message:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_launchContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchContext");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadURL_postBody_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadURL:postBody:completion:");
}

id objc_msgSend_loadView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadView");
}

id objc_msgSend_loader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loader");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_messageLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageLabel");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_newHandleWithDefinition_configurationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newHandleWithDefinition:configurationContext:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openSensitiveURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:error:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryItems");
}

id objc_msgSend_redirectURI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "redirectURI");
}

id objc_msgSend_refreshToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshToken");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_sessionWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:");
}

id objc_msgSend_setAccessToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessToken:");
}

id objc_msgSend_setAlertViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlertViewController:");
}

id objc_msgSend_setAllowNonSecureHTTP_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowNonSecureHTTP:");
}

id objc_msgSend_setCachePolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCachePolicy:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredAutoLockDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredAutoLockDuration:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setExpiresAt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExpiresAt:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHandlerForElementName_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHandlerForElementName:handler:");
}

id objc_msgSend_setIccid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIccid:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNavigationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNavigationController:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setProtocolClasses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProtocolClasses:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setRefreshToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRefreshToken:");
}

id objc_msgSend_setScope_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScope:");
}

id objc_msgSend_setSessionConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionConfiguration:");
}

id objc_msgSend_setShouldCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldCache:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStatusBarHidden_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarHidden:withDuration:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setUserInAuthFlow_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInAuthFlow:completion:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_set_sourceApplicationSecondaryIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_sourceApplicationSecondaryIdentifier:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sortUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingSelector:");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAnimating");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAnimating");
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "token");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_urlRequestForBaseURL_clientID_authCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlRequestForBaseURL:clientID:authCode:");
}

id objc_msgSend_userDidAcceptPlanTerms_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userDidAcceptPlanTerms:completion:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_visibleViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleViewController");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}
