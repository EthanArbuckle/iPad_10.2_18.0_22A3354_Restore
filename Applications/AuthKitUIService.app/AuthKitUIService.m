void sub_100002B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002B5C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;

  v3 = a2;
  v4 = _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10000645C((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissAndExit");

}

id sub_10000301C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissAndExit");
}

void sub_1000030C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  uint8_t buf[4];
  uint64_t v10;

  v3 = _AKLogSystem(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AKRemoteViewController showing alert for error %@", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKAlertHandler sharedInstance](AKAlertHandler, "sharedInstance"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000031BC;
  v8[3] = &unk_10000C348;
  v7 = *(_QWORD *)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "showAlertForError:withCompletion:", v7, v8);

}

void sub_1000031BC(uint64_t a1, int a2, uint64_t a3)
{
  void *v3;
  id v4;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:underlyingError:](NSError, "ak_errorWithCode:underlyingError:", -7034, a3));
    objc_msgSend(v3, "_callCompletionWithAuthorization:error:", 0, v4);

  }
}

id sub_1000033B4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "setAuthorizationViewController:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "endUIService");
}

void sub_1000033F0(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "authorizationViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewIfLoaded"));
  objc_msgSend(v6, "setFrame:", v1, v2, v3, v4);

}

uint64_t sub_100003470(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "authorizationViewController"));
  objc_msgSend(v2, "willMoveToParentViewController:", 0);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "authorizationViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v4, "removeFromSuperview");

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "authorizationViewController"));
  objc_msgSend(v5, "removeFromParentViewController");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1000035B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000035C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_100003AB0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_dismissAndExit");
}

uint64_t sub_100003B58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[2];

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v1 = qword_100012790;
  v7 = qword_100012790;
  if (!qword_100012790)
  {
    v8[0] = *(_OWORD *)off_10000C408;
    v8[1] = *(_OWORD *)&off_10000C418;
    v2 = _sl_dlopen(v8, a1);
    v5[3] = v2;
    qword_100012790 = v2;
    v1 = v2;
  }
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100003C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003C20()
{
  uint64_t v0;
  char *v1;
  char *v3;

  v3 = 0;
  v0 = sub_100003B58((uint64_t)&v3);
  v1 = v3;
  if (!v0)
  {
    v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_5;
  }
  if (v3)
LABEL_5:
    free(v1);
  return v0;
}

id sub_100003C78()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_100012798;
  v7 = qword_100012798;
  if (!qword_100012798)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100003D30;
    v3[3] = &unk_10000C430;
    v3[4] = &v4;
    sub_100003D30((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100003D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100003D30(uint64_t a1)
{
  Class result;
  AKPasswordResetRemoteViewController *v3;
  SEL v4;

  sub_100003C20();
  result = objc_getClass("AAUIProfilePictureStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_100012798 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (AKPasswordResetRemoteViewController *)sub_1000065DC();
    return (Class)-[AKPasswordResetRemoteViewController needsOptionsView](v3, v4);
  }
  return result;
}

void sub_100004018(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v2 = objc_msgSend(*(id *)(a1 + 32), "needsOptionsView");
  if ((_DWORD)v2)
  {
    v4 = _AKLogSystem(v2, v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User name is present in the context, so presenting options reset options view", v16, 2u);
    }

    v6 = (objc_class *)sub_100003B58(0);
    if (v6)
      v6 = (objc_class *)sub_100003C78();
    v7 = objc_alloc_init(v6);
    v8 = objc_msgSend(objc_alloc((Class)AKPasswordResetViewController), "initWithImageProvider:", v7);
    objc_msgSend(v8, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "setPasswordResetController:", v8);
    v9 = objc_alloc((Class)UINavigationController);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "passwordResetController"));
    v11 = objc_msgSend(v9, "initWithRootViewController:", v10);
    objc_msgSend(*(id *)(a1 + 32), "setRootNavigationController:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "rootNavigationController"));
    objc_msgSend(v12, "setModalInPresentation:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "rootNavigationController"));
    objc_msgSend(v13, "setModalPresentationStyle:", 2);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fullscreenBackDropViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "rootNavigationController"));
    objc_msgSend(v14, "presentViewController:animated:completion:", v15, 1, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_presentPasswordResetFlowForUsername:", 0);
  }
}

void sub_1000042B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000042D4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;

  v3 = a2;
  v5 = _AKLogSystem(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_100006600((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissAndExit");

}

void sub_1000049B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000049D8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004AB0;
  v9[3] = &unk_10000C458;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v6;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v7 = v5;
  v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

  objc_destroyWeak(&v13);
}

void sub_100004AB0(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "rootNavigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllers"));
    v7 = objc_msgSend(v6, "count");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootNavigationController"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewControllers"));
    v10 = objc_msgSend((id)v9, "count");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "passwordResetController"));
    v12 = objc_opt_class(AKPasswordResetViewController);
    LOBYTE(v9) = objc_opt_isKindOfClass(v11, v12);

    if ((v9 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "passwordResetController"));
      objc_msgSend(v13, "stopLoading");

    }
    if (!objc_msgSend(v4, "needsOptionsView"))
      goto LABEL_9;
    if (v10 != (id)1)
    {
      if (v7 == (id)2 && objc_msgSend(*(id *)(a1 + 32), "ak_isUserCancelError"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootNavigationController"));
        v15 = objc_msgSend(v14, "popToRootViewControllerAnimated:", 1);

        goto LABEL_13;
      }
LABEL_9:
      objc_msgSend(v4, "_passwordResetDidFinishWithResult:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    }
  }
  else
  {
    v16 = _AKLogSystem(0, v3);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000066F8(a1, v17, v18, v19, v20, v21, v22, v23);

  }
LABEL_13:

}

void sub_100004DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v21);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004E00(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = _AKLogSystem(WeakRetained, v2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismissing view service after password reset finished.", v14, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "fullscreenBackDropViewController"));
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 0, 0);

    objc_msgSend(WeakRetained, "setFullscreenBackDropViewController:", 0);
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 0, 0);
    objc_msgSend(WeakRetained, "endUIService");
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1000067E0(v5, v7, v8, v9, v10, v11, v12, v13);

  }
}

void sub_100004EDC(uint64_t a1, int a2)
{
  _QWORD v3[4];
  id v4;
  id v5;

  if (a2)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100004F70;
    v3[3] = &unk_10000C4D0;
    objc_copyWeak(&v5, (id *)(a1 + 40));
    v4 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);

    objc_destroyWeak(&v5);
  }
}

void sub_100004F70(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "rootNavigationController"));

    v3 = v7;
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootNavigationController"));
      objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, *(_QWORD *)(a1 + 32));

      objc_msgSend(v7, "setRootNavigationController:", 0);
      objc_msgSend(v7, "setPasswordResetController:", 0);
LABEL_6:
      v3 = v7;
      goto LABEL_7;
    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v3);
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t sub_10000514C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[2];

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v1 = qword_1000127A0;
  v7 = qword_1000127A0;
  if (!qword_1000127A0)
  {
    v8[0] = *(_OWORD *)off_10000C518;
    v8[1] = *(_OWORD *)&off_10000C528;
    v2 = _sl_dlopen(v8, a1);
    v5[3] = v2;
    qword_1000127A0 = v2;
    v1 = v2;
  }
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1000051FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005214()
{
  uint64_t v0;
  char *v1;
  char *v3;

  v3 = 0;
  v0 = sub_10000514C((uint64_t)&v3);
  v1 = v3;
  if (!v0)
  {
    v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_5;
  }
  if (v3)
LABEL_5:
    free(v1);
  return v0;
}

id sub_10000526C()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_1000127A8;
  v7 = qword_1000127A8;
  if (!qword_1000127A8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100005324;
    v3[3] = &unk_10000C430;
    v3[4] = &v4;
    sub_100005324((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000530C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100005324(uint64_t a1)
{
  Class result;

  sub_100005214();
  result = objc_getClass("RUIStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000127A8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100006810();
    return (Class)sub_100005378();
  }
  return result;
}

id sub_100005378()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_1000127B0;
  v7 = qword_1000127B0;
  if (!qword_1000127B0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100005430;
    v3[3] = &unk_10000C430;
    v3[4] = &v4;
    sub_100005430((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100005418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

AKPrivateEmailRemoteViewController *sub_100005430(uint64_t a1)
{
  AKPrivateEmailRemoteViewController *result;
  AKPrivateEmailRemoteViewController *v3;
  SEL v4;
  id v5;
  id v6;

  sub_100005214();
  result = (AKPrivateEmailRemoteViewController *)objc_getClass("RemoteUIControllerPreferences");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000127B0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (AKPrivateEmailRemoteViewController *)sub_100006834();
    return -[AKPrivateEmailRemoteViewController initWithPrivateEmailContext:altDSID:](v3, v4, v5, v6);
  }
  return result;
}

void sub_100005654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005678(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;

  v3 = a2;
  v5 = _AKLogSystem(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_100006600((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissAndExit");

}

id sub_1000059C4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showPrivateEmailFlow");
}

void sub_100005C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005C48(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005C58(uint64_t a1)
{

}

void sub_100005C60(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;

  v5 = a2;
  v6 = a3;
  v7 = AKURLBagKeyPrivateEmailUseAddress;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "resourceLoadDelegate"));
  objc_msgSend(v8, "setBagUrlKey:", v7);

  v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setResourceLoadDelegate:", v5);
  if (v5)
  {
    objc_msgSend(v5, "decorateWithPrivateEmailContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "inAppAuthUIProvider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("icloudPlus")));
    v12 = (objc_class *)sub_10000514C(0);
    v27 = v6;
    if (v12)
      v12 = (objc_class *)sub_100005378();
    v13 = [v12 alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.AuthKit")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("PRIVATE_EMAIL_LOADING"), &stru_10000C628, CFSTR("Localizable")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.AuthKit")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ICLOUD_PLUS_TEXT"), &stru_10000C628, CFSTR("Localizable")));
    v18 = objc_msgSend(v13, "initWithSpinner:spinnerLabel:navBarImage:navBarImageLabel:", 1, v15, v11, v17);
    objc_msgSend(v26, "setRuiPreferences:", v18);

    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(v19 + 16);
    v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100005F44;
    v28[3] = &unk_10000C540;
    v28[4] = v19;
    objc_msgSend(v20, "presentServerProvidedUIWithConfiguration:completion:", v21, v28);

    v6 = v27;
  }
  else
  {
    v22 = _AKLogSystem(v9, v10);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = *(_QWORD *)(a1 + 40);
      v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v30 = v25;
      v31 = 2112;
      v32 = v24;
      v33 = 2112;
      v34 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Nil LoadDelegate for config:%@,\nurl=%@,\nkey=%@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_callFlowEndedCompletionWithPrivateEmail:error:", 0, v6);
  }

}

void sub_100005F44(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v13 = a4;
  v6 = AKPrivateEmailAddressKey;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("X-Apple-I-Private-Email-Client-Bundle")));

  if (v8
    && (v10 = objc_alloc((Class)AKPrivateEmail),
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "key")),
        v12 = objc_msgSend(v10, "initWithAddress:forKey:withBundleId:", v8, v11, v9),
        v11,
        v12))
  {
    objc_msgSend(*(id *)(a1 + 32), "_callFlowEndedCompletionWithPrivateEmail:error:", v12, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_callFlowEndedCompletionWithPrivateEmail:error:", 0, v13);
  }

}

id sub_1000061C0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissAndExit");
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(AKUIServiceAppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

void sub_1000063F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000035C8((void *)&_mh_execute_header, a1, a3, "authorization view controller already being shown; ignoring",
    a5,
    a6,
    a7,
    a8,
    0);
  sub_1000035D8();
}

void sub_100006420(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Setting up look up host proxy", v1, 2u);
  sub_1000035D8();
}

void sub_10000645C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000035B8((void *)&_mh_execute_header, a2, a3, "listener lookup connection error %@", a5, a6, a7, a8, 2u);
}

void sub_1000064C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000035C8((void *)&_mh_execute_header, a1, a3, "authorization context data missing", a5, a6, a7, a8, 0);
  sub_1000035D8();
}

void sub_1000064F4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000035B8((void *)&_mh_execute_header, a2, a3, "authorization context error: %@", a5, a6, a7, a8, 2u);
}

void sub_10000655C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Host Proxy is set up in the subclass", v1, 2u);
}

void sub_10000659C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Setting up look up connection", v1, 2u);
}

uint64_t sub_1000065DC()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "AAUIProfilePictureStore");
  return sub_100006600(v0);
}

void sub_100006600(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000035B8((void *)&_mh_execute_header, a2, a3, "listener lookup connection error %@", a5, a6, a7, a8, 2u);
  sub_100005144();
}

void sub_100006664(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000035C8((void *)&_mh_execute_header, a1, a3, "Context data missing", a5, a6, a7, a8, 0);
  sub_1000035D8();
}

void sub_100006694(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000035B8((void *)&_mh_execute_header, a2, a3, "Context unarchiving error: %@", a5, a6, a7, a8, 2u);
  sub_100005144();
}

void sub_1000066F8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000035B8((void *)&_mh_execute_header, a2, a3, "Password reset remote controller before completing the authentication response with error: %@", a5, a6, a7, a8, 2u);
  sub_100005144();
}

void sub_100006760(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Password reset flow finished with result: %@, error: %@", (uint8_t *)&v3, 0x16u);
  sub_100005144();
}

void sub_1000067E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000035C8((void *)&_mh_execute_header, a1, a3, "Password reset remote controller deallocated before ending the oop", a5, a6, a7, a8, 0);
  sub_1000035D8();
}

uint64_t sub_100006810()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "RUIStyle");
  return sub_100006834(v0);
}

uint64_t sub_100006834()
{
  NSObject *v0;

  v0 = abort_report_np("Unable to find class %s", "RemoteUIControllerPreferences");
  return sub_100006858(v0);
}

void sub_100006858(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "authorization context data missing", v1, 2u);
}

void sub_100006898(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Calling host proxy (%@) with private email response", (uint8_t *)&v3, 0xCu);
  sub_100005144();
}

void sub_100006914(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000035B8((void *)&_mh_execute_header, a2, a3, "Sending private email failure back to daemon with error: %@", a5, a6, a7, a8, 2u);
  sub_100005144();
}

id objc_msgSend__animateUsingDefaultTimingWithOptions_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_animateUsingDefaultTimingWithOptions:animations:completion:");
}

id objc_msgSend__callCompletionWithAuthorization_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_callCompletionWithAuthorization:error:");
}

id objc_msgSend__callFlowEndedCompletionWithPrivateEmail_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_callFlowEndedCompletionWithPrivateEmail:error:");
}

id objc_msgSend__createNavigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createNavigationController");
}

id objc_msgSend__didCompleteWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_didCompleteWithError:");
}

id objc_msgSend__invalidateLookupConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidateLookupConnection");
}

id objc_msgSend__passwordResetDidFinishWithResult_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_passwordResetDidFinishWithResult:error:");
}

id objc_msgSend__prepareToPresentPrivateEmailFlow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareToPresentPrivateEmailFlow");
}

id objc_msgSend__presentPasswordResetFlowForUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentPasswordResetFlowForUsername:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__setEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEndpoint:");
}

id objc_msgSend__showTiburonFlow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showTiburonFlow");
}

id objc_msgSend__updateWithValuesFromContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateWithValuesFromContext:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_ak_errorWithCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ak_errorWithCode:");
}

id objc_msgSend_ak_errorWithCode_underlyingError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ak_errorWithCode:underlyingError:");
}

id objc_msgSend_ak_isUserCancelError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ak_isUserCancelError");
}

id objc_msgSend_ak_isUserInitiatedError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ak_isUserInitiatedError");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authenticateWithContext_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticateWithContext:completion:");
}

id objc_msgSend_authorizationRequestFinishedWithAuthorization_error_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authorizationRequestFinishedWithAuthorization:error:completion:");
}

id objc_msgSend_authorizationRequestInitiatedWithUserProvidedInformation_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authorizationRequestInitiatedWithUserProvidedInformation:completion:");
}

id objc_msgSend_authorizationViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authorizationViewController");
}

id objc_msgSend_bagForAltDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bagForAltDSID:");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "context");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_decorateWithPrivateEmailContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decorateWithPrivateEmailContext:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_dismissAndExit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissAndExit");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_endUIService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endUIService");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "events");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_fullscreenBackDropViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullscreenBackDropViewController");
}

id objc_msgSend_getServerUILoadDelegateWithContext_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getServerUILoadDelegateWithContext:completion:");
}

id objc_msgSend_handleCancellation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleCancellation:");
}

id objc_msgSend_hostProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostProxy");
}

id objc_msgSend_httpHeadersForRemoteUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "httpHeadersForRemoteUI");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_inAppAuthUIProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inAppAuthUIProvider");
}

id objc_msgSend_initWithAddress_forKey_withBundleId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAddress:forKey:withBundleId:");
}

id objc_msgSend_initWithAuthorizationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAuthorizationContext:");
}

id objc_msgSend_initWithImageProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImageProvider:");
}

id objc_msgSend_initWithKey_altDSID_clientAppBundleId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithKey:altDSID:clientAppBundleId:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithRequest_requestType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRequest:requestType:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithSpinner_spinnerLabel_navBarImage_navBarImageLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSpinner:spinnerLabel:navBarImage:navBarImageLabel:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isNativeTakeover(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNativeTakeover");
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "key");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lookupConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookupConnection");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_needsOptionsView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsOptionsView");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_passwordResetController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passwordResetController");
}

id objc_msgSend_passwordResetFinishedWithResult_error_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passwordResetFinishedWithResult:error:completion:");
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popToRootViewControllerAnimated:");
}

id objc_msgSend_presentServerProvidedUIWithConfiguration_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentServerProvidedUIWithConfiguration:completion:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationContext");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingViewController");
}

id objc_msgSend_privateEmailAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privateEmailAddress");
}

id objc_msgSend_privateEmailFetchCompletedWith_error_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privateEmailFetchCompletedWith:error:completion:");
}

id objc_msgSend_remoteObjectInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectInterface");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromParentViewController");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_resourceLoadDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourceLoadDelegate");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_rootNavigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootNavigationController");
}

id objc_msgSend_sendResponseWithUnHandledEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendResponseWithUnHandledEvents:");
}

id objc_msgSend_serviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceIdentifier");
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceType");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAllowsMenuButtonDismissal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsMenuButtonDismissal:");
}

id objc_msgSend_setAllowsSiri_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsSiri:");
}

id objc_msgSend_setAltDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAltDSID:");
}

id objc_msgSend_setAuthenticationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthenticationType:");
}

id objc_msgSend_setAuthorizationViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthorizationViewController:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBagUrlKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBagUrlKey:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setDismissalAnimationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissalAnimationStyle:");
}

id objc_msgSend_setForceInlinePresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForceInlinePresentation:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFullscreenBackDropViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFullscreenBackDropViewController:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHidesBackButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidesBackButton:");
}

id objc_msgSend_setHostProxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostProxy:");
}

id objc_msgSend_setHttpHeadersForRemoteUI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHttpHeadersForRemoteUI:");
}

id objc_msgSend_setIsEphemeral_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsEphemeral:");
}

id objc_msgSend_setIsNativeTakeover_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsNativeTakeover:");
}

id objc_msgSend_setIsRequestedFromOOPViewService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsRequestedFromOOPViewService:");
}

id objc_msgSend_setIsUsernameEditable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsUsernameEditable:");
}

id objc_msgSend_setLookupConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLookupConnection:");
}

id objc_msgSend_setModalInPresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalInPresentation:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNavigationBarHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNavigationBarHidden:");
}

id objc_msgSend_setNeedsCredentialRecovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsCredentialRecovery:");
}

id objc_msgSend_setPasswordResetController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasswordResetController:");
}

id objc_msgSend_setPresentationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresentationContext:");
}

id objc_msgSend_setPresentingViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresentingViewController:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setResourceLoadDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResourceLoadDelegate:");
}

id objc_msgSend_setRootNavigationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootNavigationController:");
}

id objc_msgSend_setRuiPreferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRuiPreferences:");
}

id objc_msgSend_setServiceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceIdentifier:");
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceType:");
}

id objc_msgSend_setShouldDisableFadeInAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldDisableFadeInAnimation:");
}

id objc_msgSend_setShouldPromptForPasswordOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldPromptForPasswordOnly:");
}

id objc_msgSend_setSwipeDismissalStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSwipeDismissalStyle:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUpHostProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpHostProxy");
}

id objc_msgSend_setUpLookupConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpLookupConnection:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setupRemoteProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupRemoteProxy");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_showAlertForError_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showAlertForError:withCompletion:");
}

id objc_msgSend_stopLoading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopLoading");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_urlAtKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlAtKey:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "username");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllers");
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewIfLoaded");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcEndpoint");
}
