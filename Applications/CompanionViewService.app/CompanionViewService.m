void sub_100001E24(void *a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[8];
  _QWORD v38[4];

  if (a1)
  {
    v2 = sub_100002214();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Presenting prox card flow", buf, 2u);
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, 80.0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("apple.logo")));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageWithConfiguration:", v36));

    v5 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v35);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    objc_msgSend(v5, "setTintColor:", v6);

    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = objc_alloc_init((Class)PRXIconContentViewController);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mainContentGuide"));

    v10 = sub_100002254((uint64_t)a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v7, "setTitle:", v11);

    v12 = sub_1000022B4(a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v7, "setSubtitle:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentView"));
    objc_msgSend(v14, "addSubview:", v5);

    objc_msgSend(v7, "setDismissalType:", 1);
    v15 = sub_1000023BC(a1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_msgSend(v7, "addAction:", v16);

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerXAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
    v38[0] = v32;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerYAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerYAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
    v38[1] = v28;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v31 = v9;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:", v19));
    v38[2] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
    v23 = a1;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:", v22));
    v38[3] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "presentProxCardFlowWithDelegate:initialViewController:", v23, v7));
    v27 = (void *)v23[3];
    v23[3] = v26;

  }
}

id sub_100002214()
{
  if (qword_100012198 != -1)
    dispatch_once(&qword_100012198, &stru_10000C398);
  return (id)qword_100012190;
}

id sub_100002254(uint64_t a1)
{
  void *v1;
  void *v2;

  if (a1)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("STORE_AUTHENTICATION_TITLE"), &stru_10000C4E8, 0));

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id sub_1000022B4(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "presentationContext"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "storeAuthenticationRequest"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "account"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "presentationContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceName"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("STORE_AUTHENTICATION_SUBTITLE"), &stru_10000C4E8, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9, v6));

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

id sub_1000023BC(id val)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  if (!val)
    return 0;
  objc_initWeak(&location, val);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_10000C4E8, 0));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000024D4;
  v5[3] = &unk_10000C308;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v2, 0, v5));
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

void sub_1000024B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000024D4(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;

  objc_msgSend(a2, "setEnabled:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_100002518(WeakRetained);

}

void sub_100002518(_QWORD *a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id buf[2];

  if (a1)
  {
    v2 = sub_100002214();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Continue button pressed.", (uint8_t *)buf, 2u);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "presentationContext"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeAuthenticationRequest"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "authenticationRequest"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "presentationContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeAuthenticationRequest"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "account"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("STORE_AUTHENTICATION_TOUCH_ID_TITLE"), &stru_10000C4E8, 0));
    objc_msgSend(v10, "setLocalizedName:", v12);

    v13 = objc_msgSend(objc_alloc((Class)AMSUIDelegateTokenTask), "initWithDelegateAuthenticateRequest:account:processInfo:presentingViewController:", v6, v9, v10, a1[3]);
    objc_initWeak(buf, a1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "perform"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000272C;
    v15[3] = &unk_10000C358;
    objc_copyWeak(&v16, buf);
    objc_msgSend(v14, "addFinishBlock:", v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);

  }
}

void sub_100002708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000272C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000027F0;
  block[3] = &unk_10000C330;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v12);
}

void sub_1000027F0(void **a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  sub_10000282C(WeakRetained, a1[4], a1[5]);

}

void sub_10000282C(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = sub_100002214();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = CUPrintNSObjectMasked(v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v13 = 138412290;
        v14 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Session finished: %@", (uint8_t *)&v13, 0xCu);

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "viewServicePresenter"));
      objc_msgSend(v12, "storeAuthenticationFinishedWithResult:", v5);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100006ED8((uint64_t)v6, v9);

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "viewServicePresenter"));
      objc_msgSend(v12, "storeAuthenticationFailedWithError:", v6);
    }

    sub_10000297C(a1, v6 == 0);
  }

}

void sub_10000297C(void *a1, char a2)
{
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  _QWORD v42[2];

  if (a1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, 80.0));
    if ((a2 & 1) != 0)
    {
      v5 = CFSTR("checkmark.circle");
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      v42[0] = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      v42[1] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 2));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v8));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configurationByApplyingConfiguration:", v9));

      v5 = CFSTR("person.crop.circle.badge.exclamationmark");
      v4 = (void *)v10;
    }
    v37 = v4;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v5));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageWithConfiguration:", v4));

    v12 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v40);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    objc_msgSend(v12, "setTintColor:", v13);

    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = objc_alloc_init((Class)PRXCardContentViewController);
    v15 = sub_100002254((uint64_t)a1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v14, "setTitle:", v16);

    v17 = sub_1000022B4(a1);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v14, "setSubtitle:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentView"));
    objc_msgSend(v19, "addSubview:", v12);

    v20 = sub_100002D84(a1);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = objc_msgSend(v14, "addAction:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mainContentGuide"));

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "centerXAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "centerXAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
    v41[0] = v36;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "centerYAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "centerYAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
    v41[1] = v32;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
    v35 = (id *)a1;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v26));
    v41[2] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:", v29));
    v41[3] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

    objc_msgSend(v35[3], "pushViewController:animated:", v14, 1);
  }
}

id sub_100002D84(id val)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  if (!val)
    return 0;
  objc_initWeak(&location, val);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_10000C4E8, 0));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100002E9C;
  v5[3] = &unk_10000C308;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v2, 0, v5));
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

void sub_100002E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002E9C(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
    WeakRetained = v2;
  }

}

void sub_1000030B8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.CompanionServices", "StoreAuthenticationViewController");
  v2 = (void *)qword_100012190;
  qword_100012190 = (uint64_t)v1;

}

void sub_100003404(id *a1)
{
  void *v2;
  void *v3;
  void ***v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id location;
  uint8_t buf[4];
  void *v23;

  if (a1 && !a1[3])
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "presentationContext"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "webAuthenticationRequest"));

    objc_initWeak(&location, a1);
    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_100003704;
    v19 = &unk_10000C3C0;
    objc_copyWeak(&v20, &location);
    v4 = objc_retainBlock(&v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callback", v16, v17, v18, v19));

    v6 = objc_alloc((Class)ASWebAuthenticationSession);
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callback"));
      v9 = objc_msgSend(v6, "initWithURL:callback:completionHandler:", v7, v8, v4);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "callbackScheme"));
      v9 = objc_msgSend(v6, "initWithURL:callbackURLScheme:completionHandler:", v7, v8, v4);
    }
    v10 = a1[3];
    a1[3] = v9;

    objc_msgSend(a1[3], "setPresentationContextProvider:", a1);
    objc_msgSend(a1[3], "setPrefersEphemeralWebBrowserSession:", 1);
    if ((objc_opt_respondsToSelector(a1[3], "setAdditionalHeaderFields:") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "additionalHeaderFields"));
      objc_msgSend(a1[3], "setAdditionalHeaderFields:", v11);

    }
    if ((objc_opt_respondsToSelector(a1[3], "setProxiedAssociatedDomains:") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "presentationContext"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "proxiedAppDomains"));
      objc_msgSend(a1[3], "setProxiedAssociatedDomains:", v13);

    }
    v14 = sub_100003894();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Starting session: %@", buf, 0xCu);
    }

    objc_msgSend(a1[3], "start");
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
}

void sub_1000036C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003704(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    sub_100003768(WeakRetained, v8, v5);

}

void sub_100003768(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void ***v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  id v16;
  id location;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_1000038D4;
    v13 = &unk_10000C330;
    objc_copyWeak(&v16, &location);
    v14 = v5;
    v15 = v6;
    v7 = objc_retainBlock(&v10);
    v8 = (void *)a1[4];
    a1[4] = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "presentedViewController", v10, v11, v12, v13));
    if (!v9)
      objc_msgSend(a1, "_viewControllerDismissed:", 0);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

void sub_100003878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100003894()
{
  if (qword_1000121A8 != -1)
    dispatch_once(&qword_1000121A8, &stru_10000C3E0);
  return (id)qword_1000121A0;
}

void sub_1000038D4(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v3 = sub_100003894();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = CUPrintNSObjectMasked(*(_QWORD *)(a1 + 32));
        v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
        v12 = 138412290;
        v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Session finished: %@", (uint8_t *)&v12, 0xCu);

      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "viewServicePresenter"));
      objc_msgSend(v7, "webAuthenticationFinishedWithCallbackURL:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      v8 = sub_100003A2C((uint64_t)WebAuthenticationViewController, *(void **)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v9 = sub_100003894();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100006ED8((uint64_t)v7, v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "viewServicePresenter"));
      objc_msgSend(v11, "webAuthenticationFailedWithError:", v7);

    }
  }

}

id sub_100003A2C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  objc_opt_self(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (objc_msgSend(v4, "isEqualToString:", ASWebAuthenticationSessionErrorDomain))
  {
    v5 = objc_msgSend(v3, "code");

    if (v5 == (id)1)
    {
      v6 = CPSErrorUnderlyingMake(104, v3, CFSTR("Web authentication canceled"));
      v7 = (id)objc_claimAutoreleasedReturnValue(v6);
      goto LABEL_8;
    }
  }
  else
  {

  }
  if (v3)
  {
    v7 = v3;
  }
  else
  {
    v8 = NSErrorF(CPSErrorDomain, 4294960596, "Web authentication failed");
    v7 = (id)objc_claimAutoreleasedReturnValue(v8);
  }
LABEL_8:
  v9 = v7;

  return v9;
}

void sub_100003C44(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.CompanionServices", "WebAuthVC");
  v2 = (void *)qword_1000121A0;
  qword_1000121A0 = (uint64_t)v1;

}

void sub_1000040D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000040FC(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "viewServicePresenter"));
    objc_msgSend(v7, "shareCompleted");
LABEL_5:

    goto LABEL_6;
  }
  if (!a2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "viewServicePresenter"));
    v8 = CPSErrorDomain;
    v11 = NSDebugDescriptionErrorKey;
    v12 = CFSTR("User dismissed share sheet without sharing.");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v8, 104, v9));
    objc_msgSend(v7, "shareFailedWithError:", v10);

    goto LABEL_5;
  }
LABEL_6:

}

void sub_100004268(void *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  uint8_t buf[4];
  id v38;

  if (a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "presentationContext"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "systemAuthenticationRequest"));
      *(_DWORD *)buf = 134217984;
      v38 = objc_msgSend(v3, "service");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Presenting confirm prox card flow for: %ld", buf, 0xCu);

    }
    v4 = sub_100004640(a1);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v5 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v35);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    objc_msgSend(v5, "setTintColor:", v6);

    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = objc_alloc_init((Class)PRXIconContentViewController);
    v8 = sub_1000047D4(a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v7, "setTitle:", v9);

    v10 = sub_100004920(a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v7, "setSubtitle:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentView"));
    objc_msgSend(v12, "addSubview:", v5);

    objc_msgSend(v7, "setDismissalType:", 1);
    v13 = sub_100004C48(a1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_msgSend(v7, "addAction:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mainContentGuide"));

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerXAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
    v36[0] = v32;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerYAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerYAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
    v36[1] = v28;
    v31 = v5;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:", v19));
    v36[2] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:", v22));
    v36[3] = v23;
    v24 = a1;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "presentProxCardFlowWithDelegate:initialViewController:", v24, v7));
    v27 = (void *)v24[3];
    v24[3] = v26;

  }
}

id sub_100004640(id a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  NSBundle *v11;
  void *v12;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "presentationContext"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "systemAuthenticationRequest"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "presentationContext"));
    v5 = v4;
    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "systemAuthenticationRequest"));
      v7 = objc_msgSend(v6, "service");

      if (v7 == (id)4)
      {
        v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v1));
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v1 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("recognize-my-voice-icon"), v12));

      }
      else
      {
        if (v7 == (id)3)
        {
          v8 = CFSTR("photos-icon");
        }
        else
        {
          if (v7 != (id)2)
          {
            v1 = 0;
            return v1;
          }
          v8 = CFSTR("shared-with-you-icon");
        }
        v1 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v8));
      }
    }
    else
    {
      v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "restrictedAccessRequest"));

      if (v1)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("figure.child.and.lock.fill")));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, 80.0));
        v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithConfiguration:", v10));

      }
    }
  }
  return v1;
}

id sub_1000047D4(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  if (!a1)
    goto LABEL_13;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "presentationContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "systemAuthenticationRequest"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "presentationContext"));
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "systemAuthenticationRequest"));
    v7 = objc_msgSend(v6, "service");

    if (v7 == (id)4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("RECOGNIZE_MY_VOICE_TITLE");
      goto LABEL_11;
    }
    if (v7 == (id)3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("PHOTOS_TITLE");
      goto LABEL_11;
    }
    if (v7 == (id)2)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = v8;
      v10 = CFSTR("SHARED_WITH_YOU_TITLE");
LABEL_11:
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_10000C4E8, 0));

      return v11;
    }
LABEL_13:
    v11 = 0;
    return v11;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "restrictedAccessRequest"));

  if (v11)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = v8;
    v10 = CFSTR("RESTRICTED_ACCESS_TITLE");
    goto LABEL_11;
  }
  return v11;
}

id sub_100004920(id a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "presentationContext"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "systemAuthenticationRequest"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "presentationContext"));
    v5 = v4;
    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "systemAuthenticationRequest"));

      v7 = objc_msgSend(v6, "service");
      if (v7 == (id)4)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = v8;
        v10 = CFSTR("RECOGNIZE_MY_VOICE_MESSAGE");
      }
      else
      {
        if (v7 == (id)3)
        {
          if ((objc_msgSend(v6, "options") & 2) != 0)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "aa_primaryAppleAccount"));

            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PHOTOS_CHANGES_MESSAGE"), &stru_10000C4E8, 0));
            v21 = sub_100005354(v1);
            v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
            v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "username"));
          }
          else
          {
            v16 = objc_msgSend(v6, "options");
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "aa_primaryAppleAccount"));

            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v13 = v18;
            if ((v16 & 4) != 0)
              v19 = CFSTR("PHOTOS_SHARED_ALBUMS_MESSAGE");
            else
              v19 = CFSTR("PHOTOS_MESSAGE");
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", v19, &stru_10000C4E8, 0));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "username"));
            v24 = sub_100005354(v1);
            v23 = objc_claimAutoreleasedReturnValue(v24);
          }
          v25 = (void *)v23;
          v1 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v22, v23));

          goto LABEL_20;
        }
        if (v7 != (id)2)
        {
          v1 = 0;
LABEL_22:

          return v1;
        }
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v9 = v8;
        v10 = CFSTR("SHARED_WITH_YOU_MESSAGE");
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_10000C4E8, 0));
      v14 = sub_100005354(v1);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v1 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v15));
LABEL_20:

      goto LABEL_21;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "restrictedAccessRequest"));

    if (v11)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("RESTRICTED_ACCESS_MESSAGE"), &stru_10000C4E8, 0));
      v12 = sub_100005354(v1);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v1 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v13));
LABEL_21:

      goto LABEL_22;
    }
    v1 = 0;
  }
  return v1;
}

id sub_100004C48(id val)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  if (!val)
    return 0;
  objc_initWeak(&location, val);
  v2 = sub_100004D3C(val);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004DD4;
  v6[3] = &unk_10000C308;
  objc_copyWeak(&v7, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v3, 0, v6));
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

void sub_100004D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100004D3C(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a1)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "presentationContext"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "restrictedAccessRequest"));

    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    if (v2)
      v5 = CFSTR("APPROVE");
    else
      v5 = CFSTR("CONFIRM");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_10000C4E8, 0));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

void sub_100004DD4(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_100004E00(WeakRetained);

}

void sub_100004E00(_BYTE *a1)
{
  void *v2;
  uint8_t v3[16];

  if (a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Enable button pressed.", v3, 2u);
    }
    a1[32] = 1;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "viewServicePresenter"));
    objc_msgSend(v2, "confirm");

    sub_100004E98(a1);
  }
}

void sub_100004E98(void *a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];

  if (a1)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, 80.0));
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark.circle")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageWithConfiguration:", v31));

    v3 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v30);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    objc_msgSend(v3, "setTintColor:", v4);

    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = objc_alloc_init((Class)PRXCardContentViewController);
    v6 = sub_1000047D4(a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "setTitle:", v7);

    v8 = sub_100004920(a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v5, "setSubtitle:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
    objc_msgSend(v10, "addSubview:", v3);

    v11 = sub_100005204(a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_msgSend(v5, "addAction:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mainContentGuide"));

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerXAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
    v32[0] = v27;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerYAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerYAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
    v32[1] = v24;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintGreaterThanOrEqualToAnchor:", v17));
    v32[2] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:", v20));
    v32[3] = v21;
    v23 = (id *)a1;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

    objc_msgSend(v23[3], "pushViewController:animated:", v5, 1);
  }
}

id sub_100005204(id val)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  if (!val)
    return 0;
  objc_initWeak(&location, val);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_10000C4E8, 0));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000531C;
  v5[3] = &unk_10000C308;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v2, 0, v5));
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

void sub_1000052F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000531C(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
    WeakRetained = v2;
  }

}

id sub_100005354(void *a1)
{
  void *v1;
  void *v2;

  if (a1)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "presentationContext"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "deviceName"));

  }
  else
  {
    v2 = 0;
  }
  return v2;
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

void sub_100005728(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSXPCListenerEndpoint *v11;

  if (a1)
  {
    if (a2)
    {
      v3 = a2;
      v11 = objc_opt_new(NSXPCListenerEndpoint);
      -[NSXPCListenerEndpoint _setEndpoint:](v11, "_setEndpoint:", v3);

      v4 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v11);
      v5 = a1[1];
      a1[1] = v4;

      objc_msgSend(a1[1], "_setQueue:", &_dispatch_main_q);
      v6 = a1[1];
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CPSViewServiceInterface presenterInterface](CPSViewServiceInterface, "presenterInterface"));
      objc_msgSend(v6, "setRemoteObjectInterface:", v7);

      objc_msgSend(a1[1], "setExportedObject:", a1);
      v8 = a1[1];
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CPSViewServiceInterface presentingInterface](CPSViewServiceInterface, "presentingInterface"));
      objc_msgSend(v8, "setExportedInterface:", v9);

      objc_msgSend(a1[1], "resume");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "viewServicePresenter"));
      objc_msgSend(v10, "establishConnection");

    }
  }
}

id sub_100005858(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;

  if (!a1)
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "userInfo"));
  v3 = objc_opt_self(NSData);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bs_safeObjectForKey:ofType:", CFSTR("presentationContextData"), v4));

  if (v5)
  {
    v6 = objc_opt_self(CPSViewServicePresentationContext);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v19 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v7, v5, &v19));
    v9 = v19;

    if (!v8)
    {
      v10 = sub_100005968();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100006F4C((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id sub_100005968()
{
  if (qword_1000121B8 != -1)
    dispatch_once(&qword_1000121B8, &stru_10000C488);
  return (id)qword_1000121B0;
}

void sub_1000059B4(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  v3 = sub_100005968();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100006FB0((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);

}

void sub_100005A1C(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  v3 = sub_100005968();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100007014((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);

}

void sub_100005AC4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.CompanionServices", "BaseVC");
  v2 = (void *)qword_1000121B0;
  qword_1000121B0 = (uint64_t)v1;

}

void sub_100005AF4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005B54(__CFString *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *length;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  uint8_t buf[4];
  void *v47;

  if (a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v1 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString presentationContext](a1, "presentationContext"));
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "dedicatedCameraRequest"));
      *(_DWORD *)buf = 138412290;
      v47 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Presenting dedicated camera prox card flow for: %@", buf, 0xCu);

    }
    v42 = objc_alloc_init((Class)PRXIconContentViewController);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DEDICATED_CAMERA_TITLE"), &stru_10000C4E8, 0));
    objc_msgSend(v42, "setTitle:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = sub_10000610C(a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("DEDICATED_CAMERA_MESSAGE"), v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uppercaseString"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v9, &stru_10000C4E8, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10));
    objc_msgSend(v42, "setSubtitle:", v11);

    objc_msgSend(v42, "setDismissalType:", 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, 80.0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("rectangle.inset.filled.and.camera")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageWithConfiguration:", v40));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageWithRenderingMode:", 2));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageWithTintColor:", v15));

    v16 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v39);
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "contentView"));
    objc_msgSend(v17, "addSubview:", v16);

    objc_initWeak((id *)buf, a1);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_10000C4E8, 0));
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100006154;
    v43[3] = &unk_10000C308;
    objc_copyWeak(&v44, (id *)buf);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v19, 0, v43));
    v21 = objc_msgSend(v42, "addAction:", v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mainContentGuide"));

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerXAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerXAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
    v45[0] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerYAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerYAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
    v45[1] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v26));
    v45[2] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:", v29));
    v45[3] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

    v32 = objc_claimAutoreleasedReturnValue(-[__CFString presentProxCardFlowWithDelegate:initialViewController:](a1, "presentProxCardFlowWithDelegate:initialViewController:", a1, v42));
    length = (void *)a1->length;
    a1->length = v32;

    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)buf);

  }
}

void sub_1000060AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  uint64_t v12;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 112));
  _Unwind_Resume(a1);
}

__CFString *sub_10000610C(__CFString *result)
{
  void *v1;
  void *v2;

  if (result)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString presentationContext](result, "presentationContext"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "dedicatedCameraRequest"));
    objc_msgSend(v2, "deviceType");

    return CFSTR("AppleTV");
  }
  return result;
}

void sub_100006154(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_100006180((uint64_t)WeakRetained);

}

void sub_100006180(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  uint8_t buf[4];
  void *v33;

  if (a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)a1, "presentationContext"));
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "dedicatedCameraRequest"));
      *(_DWORD *)buf = 138412290;
      v33 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Pushing bullets view controller for: %@", buf, 0xCu);

    }
    v28 = objc_alloc_init((Class)PRXIconContentViewController);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DEDICATED_CAMERA_TITLE"), &stru_10000C4E8, 0));
    objc_msgSend(v28, "setTitle:", v4);

    objc_msgSend(v28, "setDismissalType:", 1);
    v5 = sub_1000065B0((__CFString *)a1);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "contentView"));
    objc_msgSend(v6, "addSubview:", v27);

    objc_initWeak((id *)buf, (id)a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_10000C4E8, 0));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100006A58;
    v29[3] = &unk_10000C308;
    objc_copyWeak(&v30, (id *)buf);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v8, 0, v29));
    v10 = objc_msgSend(v28, "addAction:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "contentView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mainContentGuide"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:constant:", v24, 10.0));
    v31[0] = v23;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:constant:", v13, -20.0));
    v31[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
    v31[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v31[3] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

    objc_msgSend(*(id *)(a1 + 24), "pushViewController:animated:", v28, 1);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);

  }
}

void sub_100006574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

id sub_1000065B0(__CFString *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[3];

  if (!a1)
    return 0;
  v2 = objc_alloc_init((Class)UIStackView);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "setAxis:", 1);
  objc_msgSend(v2, "setAlignment:", 1);
  v43 = v2;
  objc_msgSend(v2, "setSpacing:", 30.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, 30.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("video.fill"), v3));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageWithRenderingMode:", 1));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = sub_10000610C(a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("DEDICATED_CAMERA_CAMERA_MICROPHONE_BULLET"), v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uppercaseString"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v9, &stru_10000C4E8, 0));
  v11 = sub_100006B24((uint64_t)a1, v45, v10);
  v44 = (void *)objc_claimAutoreleasedReturnValue(v11);

  objc_msgSend(v2, "addArrangedSubview:", v44);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, 30.0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v46[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v46[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  v46[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 3));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configurationByApplyingConfiguration:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("battery.powerplug"), v18));
  v20 = a1;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "imageWithRenderingMode:", 2));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = sub_10000610C(v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("DEDICATED_CAMERA_POWER_BULLET"), v24));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "uppercaseString"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", v26, &stru_10000C4E8, 0));
  v28 = v21;
  v29 = sub_100006B24((uint64_t)v20, v21, v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

  objc_msgSend(v43, "addArrangedSubview:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, 30.0));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("star.fill"), v31));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "imageWithRenderingMode:", 1));

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v35 = sub_10000610C(v20);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("DEDICATED_CAMERA_FAVORITES_BULLET"), v36));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "uppercaseString"));

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", v38, &stru_10000C4E8, 0));
  v40 = sub_100006B24((uint64_t)v20, v33, v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

  objc_msgSend(v43, "addArrangedSubview:", v41);
  return v43;
}

void sub_100006A58(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_100006A84(WeakRetained);

}

_BYTE *sub_100006A84(_BYTE *result)
{
  _BYTE *v1;
  void *v2;
  uint8_t v3[16];

  if (result)
  {
    v1 = result;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Confirm button pressed.", v3, 2u);
    }
    v1[32] = 1;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "viewServicePresenter"));
    objc_msgSend(v2, "confirm");

    return objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  return result;
}

id sub_100006B24(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];

  if (!a1)
    return 0;
  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v5);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v7) = 1148846080;
  objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  objc_msgSend(v6, "setContentMode:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PRXLabel labelWithStyle:](PRXLabel, "labelWithStyle:", 1));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setText:", v4);

  objc_msgSend(v8, "setTextAlignment:", 4);
  v9 = objc_alloc((Class)UIStackView);
  v17[0] = v6;
  v17[1] = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
  v11 = objc_msgSend(v9, "initWithArrangedSubviews:", v10);

  objc_msgSend(v11, "setSpacing:", 15.0);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "setAxis:", 0);
  objc_msgSend(v11, "setAlignment:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToConstant:", 45.0));
  v16 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  return v11;
}

void sub_100006ED8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Session failed: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100006F4C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005AF4((void *)&_mh_execute_header, a2, a3, "Failed to decode presentation context: %@", a5, a6, a7, a8, 2u);
  sub_100005B04();
}

void sub_100006FB0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005AF4((void *)&_mh_execute_header, a2, a3, "View service host proxy error: %@", a5, a6, a7, a8, 2u);
  sub_100005B04();
}

void sub_100007014(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005AF4((void *)&_mh_execute_header, a2, a3, "View service presenter proxy error: %@", a5, a6, a7, a8, 2u);
  sub_100005B04();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend__presentWebsite(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentWebsite");
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rootSheetPresentationController");
}

id objc_msgSend__setEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEndpoint:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend__systemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemImageNamed:");
}

id objc_msgSend__systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemImageNamed:withConfiguration:");
}

id objc_msgSend__url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_url");
}

id objc_msgSend__viewControllerDismissed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_viewControllerDismissed:");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "account");
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

id objc_msgSend_addArrangedSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addArrangedSubview:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_additionalHeaderFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "additionalHeaderFields");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authenticationRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationRequest");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bs_safeObjectForKey_ofType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bs_safeObjectForKey:ofType:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_callback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callback");
}

id objc_msgSend_callbackScheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callbackScheme");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_configurationByApplyingConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationByApplyingConfiguration:");
}

id objc_msgSend_configurationWithPaletteColors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithPaletteColors:");
}

id objc_msgSend_configurationWithPointSize_weight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithPointSize:weight:");
}

id objc_msgSend_confirm(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirm");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:constant:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:constant:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentView");
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentProcess");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_deactivateWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivateWithError:");
}

id objc_msgSend_dedicatedCameraRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dedicatedCameraRequest");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultStore");
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceName");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceType");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_establishConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "establishConnection");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:inBundle:");
}

id objc_msgSend_imageWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithConfiguration:");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_imageWithTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithTintColor:");
}

id objc_msgSend_initWithActivityItems_applicationActivities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActivityItems:applicationActivities:");
}

id objc_msgSend_initWithArrangedSubviews_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArrangedSubviews:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithDelegateAuthenticateRequest_account_processInfo_presentingViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegateAuthenticateRequest:account:processInfo:presentingViewController:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithPlatformImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPlatformImage:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithURL_callback_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:callback:completionHandler:");
}

id objc_msgSend_initWithURL_callbackURLScheme_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:callbackURLScheme:completionHandler:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "labelColor");
}

id objc_msgSend_labelWithStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "labelWithStyle:");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainContentGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainContentGuide");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "options");
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "perform");
}

id objc_msgSend_presentProxCardFlowWithDelegate_initialViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentProxCardFlowWithDelegate:initialViewController:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationContext");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_presenterInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presenterInterface");
}

id objc_msgSend_presentingInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingInterface");
}

id objc_msgSend_providerURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerURL");
}

id objc_msgSend_proxiedAppDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxiedAppDomains");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_restrictedAccessRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictedAccessRequest");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_setAdditionalHeaderFields_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdditionalHeaderFields:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAxis:");
}

id objc_msgSend_setCompletionWithItemsHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionWithItemsHandler:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDismissalType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissalType:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setLocalizedName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalizedName:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setPrefersEphemeralWebBrowserSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrefersEphemeralWebBrowserSession:");
}

id objc_msgSend_setPresentationContextProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresentationContextProvider:");
}

id objc_msgSend_setProxiedAssociatedDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxiedAssociatedDomains:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setSpecialization_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpecialization:");
}

id objc_msgSend_setStatusBarHidden_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarHidden:withDuration:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubtitle:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setThumbnail_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setThumbnail:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_shareCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shareCompleted");
}

id objc_msgSend_shareFailedWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shareFailedWithError:");
}

id objc_msgSend_sharingData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharingData");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_storeAuthenticationFailedWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeAuthenticationFailedWithError:");
}

id objc_msgSend_storeAuthenticationFinishedWithResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeAuthenticationFinishedWithResult:");
}

id objc_msgSend_storeAuthenticationRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeAuthenticationRequest");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_systemAuthenticationRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemAuthenticationRequest");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBlueColor");
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGreenColor");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemRedColor");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_tvProviderRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tvProviderRequest");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "username");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewServiceHost(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewServiceHost");
}

id objc_msgSend_viewServicePresenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewServicePresenter");
}

id objc_msgSend_webAuthenticationFailedWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webAuthenticationFailedWithError:");
}

id objc_msgSend_webAuthenticationFinishedWithCallbackURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webAuthenticationFinishedWithCallbackURL:");
}

id objc_msgSend_webAuthenticationRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webAuthenticationRequest");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcEndpoint");
}
