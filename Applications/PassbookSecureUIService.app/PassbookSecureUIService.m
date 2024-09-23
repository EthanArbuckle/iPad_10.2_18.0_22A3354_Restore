int main(int argc, const char **argv, const char **envp)
{
  void *v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;
  objc_class *v9;
  NSString *v10;
  NSString *v11;

  v5 = objc_autoreleasePoolPush();
  v6 = (objc_class *)objc_opt_class(PassbookSecureUIServiceApplication);
  v7 = NSStringFromClass(v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (objc_class *)objc_opt_class(PassbookSecureUIServiceAppDelegate);
  v10 = NSStringFromClass(v9);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue(v10);
  objc_autoreleasePoolPop(v5);
  LODWORD(argv) = UIApplicationMain(argc, (char **)argv, v8, v11);

  return (int)argv;
}

void sub_1000038C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1000038E4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_1000038F8(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v5;
  void (*v6)(void);
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (PKPaymentTransactionShouldAuthenticateForMechanism(v7, 1))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "authenticationContext"));
      *((_QWORD *)WeakRetained + 5) = objc_msgSend(v5, "paymentPINFormat");

      objc_storeStrong((id *)WeakRetained + 4, a2);
      objc_msgSend(*((id *)WeakRetained + 20), "setDelegate:", *(_QWORD *)(a1 + 32));
    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v6();

}

uint64_t sub_100003A54(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = *(_QWORD *)(a1 + 48);
  if (objc_msgSend(*(id *)(a1 + 32), "isViewLoaded"))
    objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", 2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_1000041DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id *location)
{
  uint64_t v18;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v18 - 104));
  _Unwind_Resume(a1);
}

void sub_100004200(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_footerButtonPressed");

}

void sub_100004A1C(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472;
  v1[2] = sub_100004AB4;
  v1[3] = &unk_10000C430;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  +[UIView pkui_animateUsingOptions:animations:completion:](UIView, "pkui_animateUsingOptions:animations:completion:", 4, v1, 0);
  objc_destroyWeak(&v2);
}

void sub_100004AA0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100004AB4(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[12], "setAlpha:", 1.0);
    WeakRetained = v2;
  }

}

void sub_100004B70(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  BOOL v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
  v4 = v2;
  v5 = v3;
  if (v4 == v5)
  {

LABEL_10:
    v9 = a1 + 32;
    v8 = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(v9 + 8);
    v11 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = v10;

    return;
  }
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  v12 = v5;
  if (v6)
  {

    return;
  }
  v7 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v7)
    goto LABEL_10;
}

void sub_100005210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  id *v11;
  uint64_t v12;

  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 104));
  _Unwind_Resume(a1);
}

void sub_100005258(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[2];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = PKAnalyticsSubjectSecureUIService;
    v4[0] = PKAnalyticsReportEventKey;
    v4[1] = PKAnalyticsReportButtonTagKey;
    v5[0] = PKAnalyticsReportEventTypeButtonTap;
    v5[1] = PKAnalyticsReportResetPaymentPINCancelButtonTag;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 2));
    +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", v2, v3);

    objc_msgSend(WeakRetained[23], "becomeFirstResponder");
  }

}

void sub_100005350(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = PKAnalyticsSubjectSecureUIService;
    v11[0] = PKAnalyticsReportEventKey;
    v11[1] = PKAnalyticsReportButtonTagKey;
    v4 = *(_QWORD *)(a1 + 32);
    v12[0] = PKAnalyticsReportEventTypeButtonTap;
    v12[1] = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
    +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", v3, v5);

    objc_msgSend(WeakRetained, "_transitionToState:", 1);
    v6 = WeakRetained[21];
    if (objc_msgSend(v6, "isInstalled"))
    {
      v7 = WeakRetained[20];
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[2], "uniqueID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transactionsAppLaunchTokenForPassWithUniqueIdentifier:", v8));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[PKPaymentNotificationAppURLHelper appURLForTransactionNotification:excludeTransactionIdentifier:pass:pathSuffix:appLaunchToken:](PKPaymentNotificationAppURLHelper, "appURLForTransactionNotification:excludeTransactionIdentifier:pass:pathSuffix:appLaunchToken:", WeakRetained[4], 1, WeakRetained[2], CFSTR("/resetPaymentCredential"), v9));
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "openApplication:withLaunchOptions:launchURL:", *(_QWORD *)(a1 + 40), 1, v10);

  }
}

id sub_100005588(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_encryptPasscodeInput");
  return objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", 1);
}

void sub_10000585C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100005878(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005940;
  v6[3] = &unk_10000C4F8;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_encryptPIN:withCertificates:completion:", v5, v3, v6);
  objc_destroyWeak(&v7);

}

void sub_10000592C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100005940(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 22);
    objc_msgSend(v5, "passcodeViewController:didGenerateEncryptedPasscode:", v4, v6);

  }
}

void sub_100005AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005ABC(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_5;
  if (!v3)
  {
    v8 = objc_loadWeakRetained(WeakRetained + 22);
    objc_msgSend(v8, "passcodeViewControllerDidEndSessionExchange:", v5);

LABEL_5:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_6;
  }
  v6 = WeakRetained[20];
  v7 = *(_QWORD *)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005BE8;
  v9[3] = &unk_10000C548;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v6, "retrievePINEncryptionCertificateForPassUniqueIdentifier:sessionExchangeToken:withCompletion:", v7, v3, v9);

  objc_destroyWeak(&v11);
LABEL_6:

}

void sub_100005BD4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100005BE8(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 22);
    objc_msgSend(v5, "passcodeViewControllerDidEndSessionExchange:", v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_100005D9C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100005DB8(id *a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  v5 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_5;
  if (!v3)
  {
    v6 = objc_loadWeakRetained(WeakRetained + 22);
    objc_msgSend(v6, "passcodeViewControllerDidEndSessionExchange:", v5);

LABEL_5:
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_6;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005EF8;
  v7[3] = &unk_10000C598;
  objc_copyWeak(&v11, a1 + 7);
  v10 = a1[6];
  v8 = a1[4];
  v9 = a1[5];
  +[PKSecureElement accessSecureElementManagerSessionWithSessionExchangeToken:handler:](PKSecureElement, "accessSecureElementManagerSessionWithSessionExchangeToken:handler:", v3, v7);

  objc_destroyWeak(&v11);
LABEL_6:

}

void sub_100005EE4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100005EF8(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t Object;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      v6 = WeakRetained[4];
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v15 = 0;
      v9 = PKEncryptTransactionAuthenticationPasscodeWithSession(v7, v6, v8, v3, &v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = v15;
      if (v11)
      {
        Object = PKLogFacilityTypeGetObject(28);
        v13 = objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v11;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to encrypt PIN with error %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v10 = 0;
    }
    v14 = objc_loadWeakRetained(v5 + 22);
    objc_msgSend(v14, "passcodeViewControllerDidEndSessionExchange:", v5);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_10000659C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000065B8(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  uint64_t Object;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];
  _QWORD block[5];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000066B4;
      block[3] = &unk_10000C5E8;
      block[4] = WeakRetained;
      v11 = *(id *)(a1 + 32);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_9;
    }
    Object = PKLogFacilityTypeGetObject(28);
    v7 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PIN view service failed to preflight collect passcode vc.", v9, 2u);
    }

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
LABEL_9:

}

uint64_t sub_1000066B4(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t result;
  uint64_t v5;

  v2 = *(_QWORD **)(a1 + 32);
  v5 = v2[1];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  objc_msgSend(v2, "setViewControllers:animated:", v3, 1);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t sub_100006814(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend__clearPasscodeField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_clearPasscodeField");
}

id objc_msgSend__createPasscodeField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createPasscodeField");
}

id objc_msgSend__encryptPIN_withCertificates_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_encryptPIN:withCertificates:completion:");
}

id objc_msgSend__encryptPasscodeInput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_encryptPasscodeInput");
}

id objc_msgSend__footerButtonPressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_footerButtonPressed");
}

id objc_msgSend__hostAuditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hostAuditToken");
}

id objc_msgSend__isHostProcessEntitled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isHostProcessEntitled");
}

id objc_msgSend__passcodeInputFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_passcodeInputFinished");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__retrievePINEncryptionCertificateForPassUniqueIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_retrievePINEncryptionCertificateForPassUniqueIdentifier:completion:");
}

id objc_msgSend__transitionToState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_transitionToState:");
}

id objc_msgSend__updateFailureLabelVisibility(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateFailureLabelVisibility");
}

id objc_msgSend_accessSecureElementManagerSessionWithSessionExchangeToken_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessSecureElementManagerSessionWithSessionExchangeToken:handler:");
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithHandler:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_appURLForTransactionNotification_excludeTransactionIdentifier_pass_pathSuffix_appLaunchToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appURLForTransactionNotification:excludeTransactionIdentifier:pass:pathSuffix:appLaunchToken:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authenticationContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationContext");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_beginSubjectReporting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginSubjectReporting:");
}

id objc_msgSend_beginSubjectReporting_withArchivedParent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginSubjectReporting:withArchivedParent:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_buttonWithConfiguration_primaryAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithConfiguration:primaryAction:");
}

id objc_msgSend_compactBankLogoDarkImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compactBankLogoDarkImage");
}

id objc_msgSend_compactBankLogoLightImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compactBankLogoLightImage");
}

id objc_msgSend_configureWithTransparentBackground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureWithTransparentBackground");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_currencyAmount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currencyAmount");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayName");
}

id objc_msgSend_endSubjectReporting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endSubjectReporting:");
}

id objc_msgSend_forceDisplayIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceDisplayIfNeeded");
}

id objc_msgSend_formattedStringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formattedStringValue");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "image");
}

id objc_msgSend_imageAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageAsset");
}

id objc_msgSend_imageWithPKImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithPKImage:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithPass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPass:");
}

id objc_msgSend_initWithPassUniqueIdentifier_transactionIdentifier_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPassUniqueIdentifier:transactionIdentifier:delegate:");
}

id objc_msgSend_initWithPinCodeLength_style_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPinCodeLength:style:delegate:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInstalled");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isViewLoaded");
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "labelColor");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_merchant(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "merchant");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_openApplication_withLaunchOptions_launchURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openApplication:withLaunchOptions:launchURL:");
}

id objc_msgSend_organizationName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "organizationName");
}

id objc_msgSend_passWithUniqueID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passWithUniqueID:");
}

id objc_msgSend_passcodeViewController_didGenerateEncryptedPasscode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeViewController:didGenerateEncryptedPasscode:");
}

id objc_msgSend_passcodeViewController_requestSessionExchangeToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeViewController:requestSessionExchangeToken:");
}

id objc_msgSend_passcodeViewControllerDidCancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeViewControllerDidCancel");
}

id objc_msgSend_passcodeViewControllerDidCancel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeViewControllerDidCancel:");
}

id objc_msgSend_passcodeViewControllerDidEndSessionExchange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeViewControllerDidEndSessionExchange");
}

id objc_msgSend_passcodeViewControllerDidEndSessionExchange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeViewControllerDidEndSessionExchange:");
}

id objc_msgSend_passcodeViewControllerDidGenerateEncryptedPasscode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeViewControllerDidGenerateEncryptedPasscode:");
}

id objc_msgSend_passcodeViewControllerRequestSessionExchangeTokenWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeViewControllerRequestSessionExchangeTokenWithHandler:");
}

id objc_msgSend_paymentPINFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "paymentPINFormat");
}

id objc_msgSend_paymentPass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "paymentPass");
}

id objc_msgSend_pinCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pinCode");
}

id objc_msgSend_pk_zString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pk_zString");
}

id objc_msgSend_pkui_animateUsingOptions_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pkui_animateUsingOptions:animations:completion:");
}

id objc_msgSend_pkui_plainConfigurationWithTitle_font_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pkui_plainConfigurationWithTitle:font:");
}

id objc_msgSend_preflightWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightWithCompletion:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingViewController");
}

id objc_msgSend_registerImage_withTraitCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerImage:withTraitCollection:");
}

id objc_msgSend_reloadApplicationStateIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadApplicationStateIfNecessary");
}

id objc_msgSend_resetWithTransactionAuthenticationFailure_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetWithTransactionAuthenticationFailure:completion:");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resignFirstResponder");
}

id objc_msgSend_retrievePINEncryptionCertificateForPassUniqueIdentifier_sessionExchangeToken_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrievePINEncryptionCertificateForPassUniqueIdentifier:sessionExchangeToken:withCompletion:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCornerCurve_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerCurve:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDevicePasscodeEntry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevicePasscodeEntry:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
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

id objc_msgSend_setHyphenatePinCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHyphenatePinCode:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setPinCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPinCode:");
}

id objc_msgSend_setPreferredAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredAction:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setSecureTextEntry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecureTextEntry:");
}

id objc_msgSend_setStandardAppearance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStandardAppearance:");
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

id objc_msgSend_setTextInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextInsets:");
}

id objc_msgSend_setViewControllers_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllers:animated:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_sizeForInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeForInterfaceOrientation:");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAnimating");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAnimating");
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:");
}

id objc_msgSend_subject_sendEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subject:sendEvent:");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "superview");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemRedColor");
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemWhiteColor");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_traitCollectionWithUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollectionWithUserInterfaceStyle:");
}

id objc_msgSend_transactionWithTransactionIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transactionWithTransactionIdentifier:completion:");
}

id objc_msgSend_transactionsAppLaunchTokenForPassWithUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transactionsAppLaunchTokenForPassWithUniqueIdentifier:");
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueID");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceStyle");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewIfLoaded");
}
