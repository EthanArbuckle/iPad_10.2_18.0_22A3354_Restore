void sub_100006BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006BC4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100006BD4(uint64_t a1)
{

}

id sub_100006BDC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t sub_100006BE8(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeFromSuperview");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_100007058(id *a1)
{
  id v2;
  void *v3;

  v2 = objc_msgSend(a1[4], "_lockStyleForPasscodeType:", objc_msgSend(a1[5], "type"));
  if (objc_msgSend(a1[6], "rawValue"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SBUIPasscodeLockViewFactory lightPasscodeLockViewForStyle:](SBUIPasscodeLockViewFactory, "lightPasscodeLockViewForStyle:", v2));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SBUIPasscodeLockViewFactory passcodeLockViewForStyle:](SBUIPasscodeLockViewFactory, "passcodeLockViewForStyle:", v2));
  return v3;
}

TouchIdAlertController *sub_1000072E8(uint64_t a1)
{
  TouchIdAlertController *v2;
  uint64_t v3;
  NSBundle *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSBundle *v13;

  if (*(_QWORD *)(a1 + 40) == LACBiometryTypeTouchID)
  {
    v2 = objc_alloc_init(TouchIdAlertController);
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(*(_QWORD *)(a1 + 32), v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TOUCH_ID_REQUIRED"), &stru_10007CCD0, CFSTR("MobileUI")));
    -[TouchIdAlertController setTitle:](v2, "setTitle:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TouchIdAlertController _headerContentViewController](v2, "_headerContentViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    objc_msgSend(v9, "setTintColor:", v7);

  }
  else
  {
    v2 = objc_alloc_init(FaceIdAlertViewController);
    v10 = sub_10000745C();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[TouchIdAlertController setGlyph:](v2, "setGlyph:", v11);

    v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(*(_QWORD *)(a1 + 32), v12));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FACE_ID_REQUIRED"), &stru_10007CCD0, CFSTR("MobileUI")));
    -[TouchIdAlertController setTitle:](v2, "setTitle:", v8);
  }

  return v2;
}

id sub_10000745C()
{
  id v0;
  id v1;

  v0 = +[LAUIPearlGlyphStaticConfiguration createSystemApertureConfiguration](LAUIPearlGlyphStaticConfiguration, "createSystemApertureConfiguration");
  objc_msgSend(v0, "setInitialStyle:", 2);
  v1 = objc_msgSend(objc_alloc((Class)LAUIPearlGlyphView), "initWithConfiguration:", v0);

  return v1;
}

void sub_1000074B0(id a1, UIAlertAction *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LACUIDTOUtilities dtoLearnMoreLinkURL](LACUIDTOUtilities, "dtoLearnMoreLinkURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[URLOpener sharedInstance](URLOpener, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "openURL:", v2));

  if (v4)
  {
    v5 = LACLogUI();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100055A78((uint64_t)v2, (uint64_t)v4, v6);

  }
}

DTOBiometryAlertFactory *sub_100007548()
{
  return objc_alloc_init(DTOBiometryAlertFactory);
}

UIViewController *sub_100007634(uint64_t a1)
{
  UIViewController *v2;
  UIView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;

  v2 = objc_opt_new(UIViewController);
  v3 = objc_opt_new(UIView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v3, "widthAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToConstant:", 272.0));
  objc_msgSend(v5, "setActive:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v3, "heightAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToConstant:", 88.0));
  objc_msgSend(v7, "setActive:", 1);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  -[UIView addSubview:](v3, "addSubview:", WeakRetained);

  v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v3, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 18.0));
  objc_msgSend(v13, "setActive:", 1);

  v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v3, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  objc_msgSend(v17, "setActive:", 1);

  v18 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "centerXAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v3, "centerXAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  objc_msgSend(v21, "setActive:", 1);

  v22 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "widthAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToConstant:", 65.0));
  objc_msgSend(v24, "setActive:", 1);

  v25 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "heightAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToConstant:", 65.0));
  objc_msgSend(v27, "setActive:", 1);

  -[UIViewController setView:](v2, "setView:", v3);
  return v2;
}

id sub_100007BD4(uint64_t a1)
{
  NSMutableArray *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;

  v2 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  -[NSMutableArray addObject:](v2, "addObject:", v3);

  if (-[NSMutableArray count](v2, "count"))
  {
    v4 = 50;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v2, "firstObject"));
      -[NSMutableArray removeObjectAtIndex:](v2, "removeObjectAtIndex:", 0);
      v7 = objc_opt_class(UILabel, v6);
      if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "title"));
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

        if ((v10 & 1) != 0)
          break;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews"));
      -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", v11);

      v5 = 0;
      if (!-[NSMutableArray count](v2, "count"))
        break;
    }
    while (v4-- > 1);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_100007DD0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "superview"));
  objc_msgSend(v3, "setAlpha:", 0.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  CGAffineTransformMakeScale(&v8, 0.88, 0.88);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  v7 = v8;
  objc_msgSend(v6, "setTransform:", &v7);

}

id sub_100007EAC(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 1.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);

  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, *(_QWORD *)(a1 + 40));
}

void sub_100008AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008B1C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cancelIfPossible");

}

void sub_100008B48(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "uiEvent:options:", 0, 0);

}

void sub_100008FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008FD0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleToastPresented");

}

void sub_100009100(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "uiEvent:options:", 0, 0);

}

void sub_1000094A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1000094CC(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setDismissingTemporarily:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertController"));
    objc_msgSend(v3, "_setHeaderContentViewController:", 0);

    objc_msgSend(v4, "_presentAlertAnimated:specialUi:", 0, *(unsigned __int8 *)(a1 + 40));
    WeakRetained = v4;
  }

}

void sub_100009538(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentAlertAnimated:specialUi:", 1, *(unsigned __int8 *)(a1 + 40));

}

void sub_100009AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100009B14(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;

  v2 = LACLogFaceIDUI(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Will dismiss %{public}@", (uint8_t *)&v6, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, &stru_100079BC8);
}

void sub_100009BD0(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  unsigned __int8 v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "dismissingTemporarily");
    v2 = v5;
    if ((v3 & 1) == 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "toastController"));
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, &stru_100079BE8);

      v2 = v5;
    }
  }

}

void sub_100009C40(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  char v11;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[32];
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "presentedViewController"));

      if (v5 != v6)
      {
        v7 = v4[32];
        v8 = *(unsigned __int8 *)(a1 + 40);
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100009D38;
        v9[3] = &unk_100079BA8;
        v11 = *(_BYTE *)(a1 + 41);
        objc_copyWeak(&v10, v2);
        objc_msgSend(v4, "presentViewController:animated:completion:", v7, v8, v9);
        objc_destroyWeak(&v10);
      }
    }
  }

}

void sub_100009D24(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100009D38(uint64_t a1)
{
  id WeakRetained;

  if (!*(_BYTE *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_shake:", *(unsigned __int8 *)(a1 + 40));

  }
}

void sub_10000AC98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  id *v50;
  uint64_t v51;

  objc_destroyWeak(v50);
  objc_destroyWeak(location);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose((const void *)(v51 - 160), 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose((const void *)(v51 - 232), 8);
  _Block_object_dispose((const void *)(v51 - 200), 8);
  objc_destroyWeak((id *)(v51 - 168));
  _Unwind_Resume(a1);
}

void sub_10000AD74(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSBundle *v9;
  void *v10;
  uint64_t v11;
  NSBundle *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 161) && *(_BYTE *)(v2 + 162) || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", &off_10007E240));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[LAUtils truncateString:maxLength:](LAUtils, "truncateString:maxLength:", v3, 32));

    if (v4
      && (v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet")), v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v6)), v4, v6, *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1, v7))
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("Enter Passcode")))
      {
        v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(*(_QWORD *)(a1 + 32), v8));
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ENTER_PASSCODE_ONLY"), &stru_10007CCD0, CFSTR("MobileUI")));

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        v7 = (void *)v11;
      }
    }
    else
    {
      v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(*(_QWORD *)(a1 + 32), v5));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ENTER_PASSWORD"), &stru_10007CCD0, CFSTR("MobileUI")));

    }
    if (objc_msgSend(v7, "length"))
    {
      v14 = *(void **)(*(_QWORD *)(a1 + 32) + 256);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000AFEC;
      v15[3] = &unk_100079C58;
      v15[4] = *(_QWORD *)(a1 + 48);
      objc_copyWeak(&v16, (id *)(a1 + 88));
      objc_msgSend(v14, "_addActionWithTitle:style:handler:shouldDismissHandler:", v7, 0, v15, &stru_100079C98);
      objc_destroyWeak(&v16);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    }

  }
}

void sub_10000AFD8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000AFEC(uint64_t a1)
{
  int v1;
  id WeakRetained;
  id v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (v1)
    objc_msgSend(WeakRetained, "_uiCancelWithUnderlyingError");
  else
    objc_msgSend(WeakRetained, "_enterPassword");

}

BOOL sub_10000B038(id a1)
{
  return 0;
}

void sub_10000B040(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "pearlUIState");

  if (v3 != (id)3)
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "setPearlUIState:", 3);

    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "uiEvent:options:", 6, 0);

  }
}

BOOL sub_10000B0D4(id a1)
{
  return 0;
}

void sub_10000B0DC(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "uiCancelWithError:", WeakRetained[21]);
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[LACUIDTOUtilities dtoLearnMoreLinkURL](LACUIDTOUtilities, "dtoLearnMoreLinkURL"));
    objc_msgSend(v3, "uiOpenURL:", v2);

    WeakRetained = v3;
  }

}

void sub_10000B144(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (*((_QWORD *)WeakRetained + 22) && *((_BYTE *)WeakRetained + 161))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[LAErrorHelper errorWithCode:message:](LAErrorHelper, "errorWithCode:message:", -3, CFSTR("Fallback authentication mechanism selected.")));
      objc_msgSend(v4, "uiFailureWithError:", v3);

    }
    else if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      objc_msgSend(WeakRetained, "_uiCancelWithUnderlyingError");
    }
    else
    {
      objc_msgSend(WeakRetained, "uiCancel");
    }
    WeakRetained = v4;
  }

}

BOOL sub_10000B1F4(id a1)
{
  return 0;
}

void sub_10000B6A4(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setGlyphState:animated:", 3, 1);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setSuspended:", 1);

}

id sub_10000BB4C(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "setAnimating:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setAnimating:", 0);
}

void sub_10000BB94(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BBF0;
  block[3] = &unk_100079A08;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10000BBF0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updatePearlViews");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "setAnimating:", 1);
}

void sub_10000C2D0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_10000C2EC(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_destroyViewControllers");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10000C4C8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t sub_10000C4F4(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_destroyViewControllers");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10000C53C(uint64_t a1, double a2)
{
  id WeakRetained;
  id v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C5D0;
  v6[3] = &unk_100079DC8;
  v5 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(WeakRetained, "_dismissToastWithDelay:completion:", v6, a2);

}

id sub_10000C5D0(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)FaceIdViewController;
  return objc_msgSendSuper2(&v3, "dismissChildWithCompletionHandler:", v1);
}

void sub_10000C78C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C7A8(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(double))(v2 + 16))(0.0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setDismissingTemporarily:", 0);

}

void sub_10000DC7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, id *a14)
{
  id *v14;
  uint64_t v15;

  objc_destroyWeak(v14);
  objc_destroyWeak(location);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)(v15 - 112));
  _Unwind_Resume(a1);
}

void sub_10000DCD0(uint64_t a1, void *a2)
{
  id v4;
  id WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), a2);
  v4 = a2;
  objc_msgSend(v4, "setSecureTextEntry:", 1);
  objc_msgSend(v4, "setPlaceholder:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setKeyboardAppearance:", 1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v4, "setDelegate:", WeakRetained);

}

void sub_10000DD54(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cancel");

}

void sub_10000DD80(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_passwordEntered");

}

void sub_10000DDAC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_passwordNext");

}

void sub_10000DDD8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_passwordConfirm");

}

id sub_10000DE04(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), 1, 0);
}

id sub_10000DF80(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureAndShowAlertController");
}

id sub_10000E0D4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureAndShowAlertController");
}

void sub_10000E5D0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentUI:", 0);

}

void sub_10000EC54(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_10000EC90(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    if (WeakRetained[24])
      objc_msgSend(WeakRetained, "_uiCancelWithUnderlyingError");
    else
      objc_msgSend(WeakRetained, "uiFallback");
    WeakRetained = v2;
  }

}

void sub_10000ECE0(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_uiCancelWithUnderlyingError");
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[LACUIDTOUtilities dtoLearnMoreLinkURL](LACUIDTOUtilities, "dtoLearnMoreLinkURL"));
    objc_msgSend(v3, "uiOpenURL:", v2);

    WeakRetained = v3;
  }

}

void sub_10000ED3C(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "uiCancel");
    WeakRetained = v2;
  }

}

void sub_10000ED6C(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_uiCancelWithUnderlyingError");
    WeakRetained = v2;
  }

}

id sub_10000F8E8(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)TouchIdViewController;
  return objc_msgSendSuper2(&v3, "dismissChildWithCompletionHandler:", v1);
}

id sub_10000FC4C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_configureUI");
}

id sub_10000FEF8(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)TouchIdViewControllerWithCoachings;
  return objc_msgSendSuper2(&v3, "_addFrontMostSubview:", v1);
}

double sub_10001010C(uint64_t a1)
{
  void *v1;
  _BOOL4 v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "traitCollection"));
  v2 = objc_msgSend(v1, "userInterfaceStyle") == (id)2;

  return fmin(fmax((0.75 - dbl_10005FDB0[v2]) / (1.0 - dbl_10005FDB0[v2]), 0.0), 1.0);
}

id sub_1000101E8(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "updateFrame");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setAnimating:", 1);
}

uint64_t sub_100010238()
{
  if (qword_1000921A8 != -1)
    dispatch_once(&qword_1000921A8, &stru_100079EE8);
  return byte_1000921A0;
}

void sub_100010278(id a1)
{
  uint64_t v1;
  NSObject *v2;

  if (MGIsQuestionValid(CFSTR("DeviceSupportsSecureDoubleClick")))
  {
    byte_1000921A0 = MGGetBoolAnswer(CFSTR("DeviceSupportsSecureDoubleClick"));
  }
  else
  {
    v1 = LACLogTouchIDUI();
    v2 = objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      sub_100055C08(v2);

  }
}

id sub_1000102E0()
{
  __objc2_class **v0;

  if (qword_1000921A8 != -1)
    dispatch_once(&qword_1000921A8, &stru_100079EE8);
  if (byte_1000921A0)
    v0 = &off_100079238;
  else
    v0 = off_100079230;
  return objc_alloc(*v0);
}

id sub_100010340(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v9 = a4;
  v10 = a3;
  v11 = a2;
  v12 = a1;
  v13 = sub_1000102E0();
  v14 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(v13), "initWithInternalInfo:mechanism:backoffCounter:remoteUIHost:allowsLandscape:", v12, v11, v10, v9, a5);

  return v14;
}

id sub_1000106A4(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "_cancelForApplicationChangeIfNeeded");
}

void sub_100010858(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100010874(uint64_t a1)
{
  void *v1;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_storeWeak(&qword_1000921B0, 0);
    v1 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;

  }
}

void sub_100010B7C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_100010BD0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetUI");

}

void sub_100010BFC(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetUI");

  v2 = (void *)qword_1000921B8;
  qword_1000921B8 = 0;

}

void sub_100010C34(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id WeakRetained;

  v3 = a2;
  v6 = LALogForCategory(0, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_100055E2C();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetUI");

}

void sub_100010CA8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSObject *v14;

  v8 = a2;
  v9 = a3;
  v12 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), a2);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), a3);
  }
  else
  {
    v13 = LALogForCategory(0, v10, v11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100055E8C();

    objc_msgSend(*(id *)(a1 + 32), "_resetUI");
  }

}

void sub_100010D74(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "didReceiveAuthenticationData");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

id sub_1000114C0(uint64_t a1, void *a2, int a3)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSBundle *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v4, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (a3)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", v5));

    v5 = (id)v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v5, &stru_10007CCD0, CFSTR("MobileUI")));

  return v10;
}

void sub_1000119A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1000119CC(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("immediate dismiss requested, tid: %u"), *(unsigned int *)(a1 + 48)));
  objc_msgSend(WeakRetained, "_dismissRootWithReason:completion:", v2, *(_QWORD *)(a1 + 32));

}

void sub_100011A38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  int v12;
  uint8_t buf[4];
  int v14;

  v4 = LALogForCategory(0, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_DWORD *)(a1 + 56);
    *(_DWORD *)buf = 67109120;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Executing disappearBlock, tid:%u", buf, 8u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 1;
  v7 = objc_retainBlock(*(id *)(a1 + 40));
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = v7;

  v9 = *(void **)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100011B9C;
  v10[3] = &unk_100079FD8;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v12 = *(_DWORD *)(a1 + 56);
  objc_msgSend(v9, "_performOnMainQueueWhenAppeared:", v10);
  objc_destroyWeak(&v11);
}

void sub_100011B80(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100011B9C(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("dismiss requested, tid: %u"), *(unsigned int *)(a1 + 40)));
  objc_msgSend(WeakRetained, "_dismissRootWithReason:completion:", v2, 0);

}

void sub_100012010(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[LAErrorHelper errorWithCode:message:](LAErrorHelper, "errorWithCode:message:", -4, CFSTR("Caller moved to background.")));
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void sub_100012080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  __objc2_class *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  _QWORD *v49;
  void *v50;
  id v51;
  _QWORD v52[5];
  id v53;
  uint8_t buf[4];
  _BYTE v55[20];
  int v56;

  v4 = LALogForCategory(0, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v55 = v6;
    *(_WORD *)&v55[4] = 1024;
    *(_DWORD *)&v55[6] = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Preparing a new child controller: %d, tid:%u", buf, 0xEu);
  }

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 40);
  if (!v9)
  {
    switch(*(_QWORD *)(a1 + 56))
    {
      case 1:
        v18 = sub_1000102E0();
        v19 = (id)objc_claimAutoreleasedReturnValue(v18);
        goto LABEL_18;
      case 2:
        v24 = sub_10001A950(*(void **)(a1 + 40));
        v19 = (id)objc_claimAutoreleasedReturnValue(v24);
        goto LABEL_18;
      case 3:
        v25 = sub_100017534(*(void **)(a1 + 40));
        v19 = (id)objc_claimAutoreleasedReturnValue(v25);
        goto LABEL_18;
      case 4:
        v26 = PasswordViewController;
        goto LABEL_17;
      case 5:
        v26 = FaceIdViewController;
        goto LABEL_17;
      case 6:
        v26 = RatchetCoolOffViewController;
LABEL_17:
        v19 = [v26 alloc];
LABEL_18:
        v27 = *(_QWORD *)(a1 + 32);
        v28 = *(void **)(v27 + 8);
        *(_QWORD *)(v27 + 8) = v19;

        v29 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "initWithInternalInfo:parent:allowsLandscape:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24));
        v30 = *(_QWORD *)(a1 + 32);
        v31 = *(void **)(v30 + 8);
        *(_QWORD *)(v30 + 8) = v29;

        v15 = *(_QWORD *)(a1 + 32);
        goto LABEL_19;
      default:
        v20 = *(void **)(v8 + 8);
        *(_QWORD *)(v8 + 8) = 0;

        if (*(_QWORD *)(a1 + 48))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unexpected controller type (%d)."), *(_QWORD *)(a1 + 56)));
          v22 = *(_QWORD *)(a1 + 48);
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[LAErrorHelper internalErrorWithMessage:](LAErrorHelper, "internalErrorWithMessage:", v21));
          (*(void (**)(uint64_t, _QWORD, void *))(v22 + 16))(v22, 0, v23);

        }
        return;
    }
  }
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "childControllerFor:type:allowsLandscape:", *(_QWORD *)(v8 + 32), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(v8 + 24)));
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 8);
  *(_QWORD *)(v11 + 8) = v10;

  v15 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v15 + 8))
  {
LABEL_19:
    *(_BYTE *)(v15 + 49) = 1;
    v32 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v32 + 16))
    {
      v33 = LALogForCategory(0, v13, v14);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = *(_QWORD *)(a1 + 32);
        v36 = *(_QWORD *)(v35 + 16);
        v37 = *(_QWORD *)(v35 + 8);
        v38 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v55 = v36;
        *(_WORD *)&v55[4] = 2114;
        *(_QWORD *)&v55[6] = v37;
        *(_WORD *)&v55[14] = 1024;
        *(_DWORD *)&v55[16] = v38;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Forwarding cached event %d to %{public}@, tid:%u", buf, 0x18u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mechanismEvent:reply:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), &stru_10007A048);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
      v32 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v32 + 8), "setModalPresentationStyle:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "window"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "_rootSheetPresentationController"));
    objc_msgSend(v41, "_setShouldScaleDownBehindDescendantSheets:", 0);

    v44 = LALogForCategory(0, v42, v43);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      v46 = *(_QWORD *)(a1 + 32);
      v47 = *(_QWORD *)(v46 + 8);
      v48 = *(_DWORD *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)v55 = v47;
      *(_WORD *)&v55[8] = 2114;
      *(_QWORD *)&v55[10] = v46;
      *(_WORD *)&v55[18] = 1024;
      v56 = v48;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%{public}@ is being presented by %{public}@, tid:%u", buf, 0x1Cu);
    }

    v49 = *(_QWORD **)(a1 + 32);
    v50 = (void *)v49[1];
    v51 = objc_msgSend(v50, "shouldPresentWithAnimation");
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100012544;
    v52[3] = &unk_10007A070;
    v52[4] = *(_QWORD *)(a1 + 32);
    v53 = *(id *)(a1 + 48);
    objc_msgSend(v49, "presentViewController:animated:completion:", v50, v51, v52);

  }
  else
  {
    v16 = LALogForCategory(0, v13, v14);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "New child controller is nil - nothing to show.", buf, 2u);
    }

  }
}

uint64_t sub_100012544(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 0;
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

void sub_100012700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id WeakRetained;
  _QWORD v26[4];
  id v27;
  id v28;
  int v29;
  uint8_t buf[4];
  int v31;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("dismissing child for tid:%u"), *(unsigned int *)(a1 + 64)));
    objc_msgSend(WeakRetained, "_dismissChild:andRoot:reason:completion:", v4, 0, v5, *(_QWORD *)(a1 + 48));

  }
  else
  {
    v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 51);
    v7 = LALogForCategory(0, a2, a3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        v10 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 67109120;
        v31 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Appeared, performing task, tid:%u", buf, 8u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      if (v9)
      {
        v11 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 67109120;
        v31 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Scheduling block when controller appears, tid:%u", buf, 8u);
      }

      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 152))
      {
        v14 = LALogForCategory(0, v12, v13);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = *(_DWORD *)(a1 + 64);
          *(_DWORD *)buf = 67109120;
          v31 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "compound notification, tid:%u", buf, 8u);
        }

        v17 = objc_retainBlock(*(id *)(*(_QWORD *)(a1 + 40) + 152));
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_1000129A8;
        v26[3] = &unk_10007A0C0;
        v29 = *(_DWORD *)(a1 + 64);
        v27 = *(id *)(a1 + 48);
        v28 = v17;
        v18 = v17;
        v19 = objc_retainBlock(v26);
        v20 = *(_QWORD *)(a1 + 40);
        v21 = *(void **)(v20 + 152);
        *(_QWORD *)(v20 + 152) = v19;

      }
      else
      {
        v22 = objc_retainBlock(*(id *)(a1 + 48));
        v23 = *(_QWORD *)(a1 + 40);
        v24 = *(void **)(v23 + 152);
        *(_QWORD *)(v23 + 152) = v22;

      }
    }
  }
}

uint64_t sub_1000129A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = LALogForCategory(0, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100055F54(a1, v5, v6, v7, v8, v9, v10, v11);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v14 = LALogForCategory(0, v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_100055EEC(a1, v15, v16, v17, v18, v19, v20, v21);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100012C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012C54(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsStatusBarAppearanceUpdate");

}

void sub_100013550(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;

  v2 = a2;
  v5 = LALogForCategory(0, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10005601C();

}

void sub_100013654(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100013678(uint64_t a1, void *a2, void *a3)
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
  block[2] = sub_10001373C;
  block[3] = &unk_10007A160;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v12);
}

void sub_10001373C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleIdleExitResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void sub_100013EEC(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 50))
  {
    v5 = LALogForCategory(0, v2, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100056168();

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransitionViewController rootController](TransitionViewController, "rootController"));
    objc_msgSend(v7, "_dismissRemoteUIWithCompletionHandler:", 0);

  }
}

void sub_100014074(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_mechanismEvent:value:reply:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t sub_100014360(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100014A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100014A50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t result;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;

  v4 = LALogForCategory(0, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138543618;
    v10 = WeakRetained;
    v11 = 2114;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ was dismissed (%{public}@)", (uint8_t *)&v9, 0x16u);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100014B2C(uint64_t a1)
{
  id WeakRetained;

  if (*(_BYTE *)(a1 + 56))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_dismissRootWithReason:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void sub_1000153A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000153C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_1000153D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_100015980(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100016914(id a1)
{
  URLOpener *v1;
  void *v2;

  v1 = objc_alloc_init(URLOpener);
  v2 = (void *)qword_1000921C8;
  qword_1000921C8 = (uint64_t)v1;

}

id sub_100017534(void *a1)
{
  void *v1;
  unsigned int v2;
  __objc2_class **v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("CTKPIN")));
  v2 = objc_msgSend(v1, "BOOLValue");

  v3 = off_100079330;
  if (!v2)
    v3 = &off_100079210;
  return objc_alloc(*v3);
}

void sub_10001758C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.LocalAuthentication", "PinViewController");
  v2 = (void *)qword_1000921E0;
  qword_1000921E0 = (uint64_t)v1;

}

void sub_100018E4C(uint64_t a1, uint64_t a2)
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  int v10;
  char v11;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_switchToBackoffScreen:", a2);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 202) = 0;
  }
  else
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018F08;
    block[3] = &unk_10007A268;
    v11 = *(_BYTE *)(a1 + 52);
    v10 = *(_DWORD *)(a1 + 48);
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = v6;
    dispatch_async(v4, block);

  }
}

id sub_100018F08(uint64_t a1)
{
  int v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  if (!*(_BYTE *)(a1 + 52))
  {
LABEL_9:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[LAPasscodeHelper sharedInstance](LAPasscodeHelper, "sharedInstance"));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "cachedExternalizedContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "externalizedContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "internalInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("UserId")));
    v11 = objc_msgSend(*(id *)(a1 + 40), "policy");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "options"));
    v4 = (uint64_t)objc_msgSend(v5, "verifyPasswordUsingAKS:acmContext:userId:policy:options:bioLockoutRecovery:", v6, v8, v10, v11, v12, 0);

    goto LABEL_11;
  }
  v2 = *(_DWORD *)(a1 + 48);
  if (v2 != -14 && v2 != -3)
  {
    if (v2)
    {
      v4 = 3;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  v4 = 1;
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "reset");
  return _objc_msgSend(*(id *)(a1 + 40), "_processPasscodeEntryResult:", v4);
}

id sub_100019380(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setHidden:", 1);
}

void sub_100019398(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100019418;
  v6[3] = &unk_10007A2B8;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

}

void sub_100019418(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 160);
  if (v1)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000194B4;
    v4[3] = &unk_10007A2B8;
    v4[4] = v2;
    v5 = v1;
    objc_msgSend(v3, "animateToFailureStateWithCompletion:", v4);

  }
  else
  {
    objc_msgSend(*(id *)(v2 + 160), "animateToFailureStateWithCompletion:", &stru_10007A2D8);
  }
}

void sub_1000194B4(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100019520;
  v2[3] = &unk_10007A2B8;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

}

id sub_100019520(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_switchToBackoffScreen:", *(_QWORD *)(a1 + 40));
}

void sub_100019530(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000195B0;
  v5[3] = &unk_10007A2B8;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_1000195B0(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 160);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001962C;
  v4[3] = &unk_10007A2B8;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "animateToFailureStateWithCompletion:", v4);

}

void sub_10001962C(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100019698;
  v2[3] = &unk_10007A2B8;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

}

id sub_100019698(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_switchToBackoffScreen:", *(_QWORD *)(a1 + 40));
}

void sub_1000197F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001981C(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000198D4;
    v6[3] = &unk_10007A300;
    objc_copyWeak(&v8, v4);
    v7 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

    objc_destroyWeak(&v8);
  }

}

void sub_1000198D4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
      objc_msgSend(WeakRetained, "_switchToBackoffScreen:");
    else
      objc_msgSend(WeakRetained, "_showPasscodeScreen");
    WeakRetained = v3;
  }

}

id sub_100019F68(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "authenticationTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "authenticationSubtitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PasscodeViewState activeStateWithTitle:subtitle:accessoryView:](PasscodeViewState, "activeStateWithTitle:subtitle:accessoryView:", v2, v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208)));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_style"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "withStyle:", v5));

  return v6;
}

id sub_10001A150(uint64_t a1, uint64_t a2)
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(*(_QWORD *)(a1 + 32), a2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MINUTES_TO_UNBLOCK"), &stru_10007CCD0, CFSTR("MobileUI")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, *(unsigned int *)(a1 + 40)));

  return v6;
}

void sub_10001A76C(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001A7E4;
  v3[3] = &unk_10007A028;
  v4 = v1;
  objc_msgSend(v2, "animateToSucessStateWithCompletion:", v3);

}

void sub_10001A7E4(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A870;
  block[3] = &unk_10007A028;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_10001A870(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id sub_10001A884(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setState:animated:", 4, 1);
}

id sub_10001A8A0(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setState:animated:", 2, 1);
}

id sub_10001A950(void *a1)
{
  void *v1;
  void *v2;
  unsigned int v3;
  __objc2_class **v4;
  id v5;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKey:", CFSTR("Options")));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKey:", &off_10007E600));
  v3 = objc_msgSend(v2, "BOOLValue");
  v4 = &off_100079338;
  if (!v3)
    v4 = off_100079208;
  v5 = objc_alloc(*v4);

  return v5;
}

id sub_10001A9CC(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v9 = a4;
  v10 = a3;
  v11 = a2;
  v12 = a1;
  v13 = sub_10001A950(v12);
  v14 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(v13), "initWithInternalInfo:mechanism:backoffCounter:remoteUIHost:allowsLandscape:", v12, v11, v10, v9, a5);

  return v14;
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;
  uint64_t v9;

  v4 = objc_autoreleasePoolPush();
  LALogSetProcessCategory(12);
  v6 = (objc_class *)objc_opt_class(AppDelegate, v5);
  v7 = NSStringFromClass(v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  v9 = UIApplicationMain(a1, a2, 0, v8);

  objc_autoreleasePoolPop(v4);
  return v9;
}

void sub_10001B89C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "pinEntered:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));

}

void sub_10001BD60(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v6 = WeakRetained;
      v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));

      WeakRetained = v6;
      if (v6 != v4)
      {
        objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
LABEL_7:
        WeakRetained = v6;
        goto LABEL_8;
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    v6 = WeakRetained;
    (*(void (**)(void))(v5 + 16))();
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t sub_10001C8C8()
{
  if (qword_1000921F0 != -1)
    dispatch_once(&qword_1000921F0, &stru_10007A370);
  return byte_1000921E9;
}

void sub_10001CA90(id a1)
{
  char v1;

  if (SBUIIsSystemApertureEnabled(a1))
    v1 = +[LAUtils isClarityBoardRunning](LAUtils, "isClarityBoardRunning") ^ 1;
  else
    v1 = 0;
  byte_1000921E9 = v1;
}

uint64_t sub_10001CAC8()
{
  return byte_1000921E8;
}

void sub_10001CAD4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10001D02C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001D050(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toastAnimationFadeIn:finished:", 1, 0);

}

void sub_10001D084(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toastAnimationFadeIn:finished:", 1, 1);

}

void sub_10001D3C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001D3E4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toastAnimationFadeIn:finished:", 0, 0);

}

void sub_10001D418(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toastAnimationFadeIn:finished:", 0, 1);

}

void sub_10001D68C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_10001D6B8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_shrinkAndRevokeWithCompletion:", *(_QWORD *)(a1 + 32));

}

void sub_10001D6F4(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[6], "superview"));
    objc_msgSend(v2, "setAlpha:", 0.0);

    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0));
    objc_msgSend(v4[6], "setBackgroundColor:", v3);

    objc_msgSend(v4, "_setTransformScale:", 1);
    WeakRetained = v4;
  }

}

void sub_10001D790(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_setTransformScale:", 0);
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 0, *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

id sub_10001D9A0(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "setAlpha:", 0.0);
}

void sub_10001D9E8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "revokePresentableWithCompletionHandler:", *(_QWORD *)(a1 + 32));

}

void sub_10001EB64(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10001EB88(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateLightweightConstraints");

}

id sub_10001F1E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "constraintEqualToAnchor:constant:", *(double *)(a1 + 48)));
  }
  else
  {
    v5 = objc_opt_class(NSLayoutDimension, a2);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "constraintEqualToConstant:", *(double *)(a1 + 48)));
    else
      v4 = 0;
  }
  return v4;
}

double sub_10001F72C()
{
  void *v0;
  void *v1;
  double v2;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "preferredContentSizeCategory"));

  v2 = 1.0;
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v1)
    && (objc_msgSend(v1, "isEqualToString:", UIContentSizeCategoryAccessibilityMedium) & 1) == 0)
  {
    if (objc_msgSend(v1, "isEqualToString:", UIContentSizeCategoryAccessibilityLarge))
      v2 = 1.0;
    else
      v2 = 1.5;
  }

  return v2;
}

id sub_10001F8B8(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "isActive");
  if ((_DWORD)result)
    return _objc_msgSend(*(id *)(a1 + 32), "updateGlyphConstraintsIfOrientationChanged");
  return result;
}

id sub_10001FDDC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLightweightConstraintsWithCoordinatedAnimations");
}

void sub_100020098(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000200B4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setBackdropEnabled:", *(unsigned __int8 *)(a1 + 40));

}

id sub_100021270(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[2];

  v2 = objc_alloc_init((Class)UIToolbar);
  objc_msgSend(v2, "setBarStyle:", 4);
  v3 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v7[0] = v3;
  v4 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, *(_QWORD *)(a1 + 32), "_submitPasscode:");
  v7[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  objc_msgSend(v2, "setItems:", v5);

  objc_msgSend(v2, "sizeToFit");
  return v2;
}

id sub_100021A10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;

  LODWORD(v2) = vcvtpd_s64_f64(*(double *)(a1 + 40) / 60.0);
  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(*(_QWORD *)(a1 + 32), a2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MINUTES_TO_UNBLOCK"), &stru_10007CCD0, CFSTR("MobileUI")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v2));

  return v6;
}

void sub_100021AC0(uint64_t a1)
{
  id WeakRetained;
  _BOOL8 v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 40))
      v3 = *(_BYTE *)(a1 + 41) != 0;
    else
      v3 = 0;
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setPasscodeFocused:", v3);
    WeakRetained = v4;
  }

}

void sub_100021CC0(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v2 = dispatch_time(0, 200000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021D50;
  v4[3] = &unk_10007A2B8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);

}

id sub_100021D50(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  return objc_msgSend(*(id *)(a1 + 40), "setText:", &stru_10007CCD0);
}

void sub_100022098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000220B4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 2);
    v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v5[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v5[1] = v4;
    v5[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v3, "setTransform:", v5);
  }

}

uint64_t sub_100022114(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000223C8(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___LAUIPasscodeService));
  v2 = (void *)qword_100092208;
  qword_100092208 = v1;

}

void sub_10002243C(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___LAUIPasscodeHost));
  v2 = (void *)qword_100092218;
  qword_100092218 = v1;

}

void sub_10002276C(id a1, BOOL a2, NSError *a3)
{
  uint64_t v4;
  uint64_t v5;
  NSError *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v16[16];

  v6 = a3;
  if (v6 || !a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100056590((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    v7 = LALogForCategory(0, v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Passcode verification succeeded", v16, 2u);
    }

  }
}

void sub_100022908(id a1, NSError *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100056600((uint64_t)a2, v3, v4, v5, v6, v7, v8, v9);
}

void sub_100022A54(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_backoffTimeout");
    v3 = v2;
    if (v2 > 0.0)
      objc_msgSend(v4, "_dispatchBackoffTimer");
    objc_msgSend(v4, "setBackoffTimeout:", v3);
    WeakRetained = v4;
  }

}

void sub_1000230E8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10002310C(uint64_t a1, char a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained && (a2 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "setAnimating:", 1);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000231E0;
    v7[3] = &unk_10007A300;
    objc_copyWeak(&v9, v4);
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v6, "_shakePasscodeFieldWithCompletion:", v7);

    objc_destroyWeak(&v9);
  }

}

void sub_1000231CC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000231E0(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = dispatch_time(0, 200000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100023290;
  v3[3] = &unk_10007A300;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);

  objc_destroyWeak(&v5);
}

void sub_100023290(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setAnimating:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setText:", &stru_10007CCD0);
    WeakRetained = v3;
  }

}

UIViewController *sub_100023EF4()
{
  UIViewController *v0;
  UIView *v1;
  void *v2;

  v0 = objc_opt_new(UIViewController);
  v1 = sub_100023F3C();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  -[UIViewController setView:](v0, "setView:", v2);

  return v0;
}

UIView *sub_100023F3C()
{
  id v0;
  void *v1;
  UIView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v0 = sub_1000240CC();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = objc_opt_new(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v2, "addSubview:", v1);
  objc_msgSend(v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v2, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 20.0));
  objc_msgSend(v5, "setActive:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v2, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  objc_msgSend(v8, "setActive:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v2, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  objc_msgSend(v11, "setActive:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v2, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  objc_msgSend(v14, "setActive:", 1);

  return v2;
}

id sub_1000240CC()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleLargeTitle, 2));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("touchid"), v0));
  v2 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v1);
  objc_msgSend(v2, "setContentMode:", 1);

  return v2;
}

uint64_t sub_100024BC4()
{
  id v0;
  Swift::String v1;
  Swift::String_optional v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  Swift::String v6;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v0 = (id)qword_100092228;
  v6._object = (void *)0xE000000000000000;
  v1._countAndFlagsBits = 0x4C45434E4143;
  v1._object = (void *)0xE600000000000000;
  v2.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100024C78()
{
  id v0;
  Swift::String v1;
  Swift::String_optional v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  Swift::String v6;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v0 = (id)qword_100092228;
  v6._object = (void *)0xE000000000000000;
  v1._countAndFlagsBits = 1162760004;
  v1._object = (void *)0xE400000000000000;
  v2.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100024D28()
{
  id v0;
  Swift::String v1;
  Swift::String_optional v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  Swift::String v6;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v0 = (id)qword_100092228;
  v6._object = (void *)0xE000000000000000;
  v1._countAndFlagsBits = 19279;
  v1._object = (void *)0xE200000000000000;
  v2.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100024DD4()
{
  id v0;
  Swift::String v1;
  Swift::String_optional v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  Swift::String v6;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v0 = (id)qword_100092228;
  v6._object = (void *)0xE000000000000000;
  v1._object = (void *)0x800000010006D6A0;
  v1._countAndFlagsBits = 0xD000000000000017;
  v2.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100024E90()
{
  id v0;
  Swift::String v1;
  Swift::String_optional v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  Swift::String v6;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v0 = (id)qword_100092228;
  v6._object = (void *)0xE000000000000000;
  v1._countAndFlagsBits = 0x494147415F595254;
  v1._object = (void *)0xE90000000000004ELL;
  v2.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100024F4C()
{
  id v0;
  Swift::String v1;
  Swift::String_optional v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  Swift::String v6;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v0 = (id)qword_100092228;
  v6._object = (void *)0xE000000000000000;
  v1._object = (void *)0x800000010006D6C0;
  v1._countAndFlagsBits = 0xD000000000000013;
  v2.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100025008()
{
  id v0;
  Swift::String v1;
  Swift::String_optional v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  Swift::String v6;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v0 = (id)qword_100092228;
  v6._object = (void *)0xE000000000000000;
  v1._object = (void *)0x800000010006D6E0;
  v1._countAndFlagsBits = 0xD000000000000013;
  v2.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_1000250C4()
{
  id v0;
  Swift::String v1;
  Swift::String_optional v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  Swift::String v6;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v0 = (id)qword_100092228;
  v6._object = (void *)0xE000000000000000;
  v1._object = (void *)0x800000010006D700;
  v1._countAndFlagsBits = 0xD000000000000015;
  v2.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100025180()
{
  id v0;
  Swift::String v1;
  Swift::String_optional v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  Swift::String v6;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v0 = (id)qword_100092228;
  v6._object = (void *)0xE000000000000000;
  v1._countAndFlagsBits = 5849424;
  v1._object = (void *)0xE300000000000000;
  v2.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100025230()
{
  id v0;
  Swift::String v1;
  Swift::String_optional v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  Swift::String v6;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v0 = (id)qword_100092228;
  v6._object = (void *)0xE000000000000000;
  v1._object = (void *)0x800000010006D720;
  v1._countAndFlagsBits = 0xD000000000000015;
  v2.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_1000252EC()
{
  id v0;
  Swift::String v1;
  Swift::String_optional v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  Swift::String v6;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v0 = (id)qword_100092228;
  v6._object = (void *)0xE000000000000000;
  v1._countAndFlagsBits = 0x49505F5245544E45;
  v1._object = (void *)0xE90000000000004ELL;
  v2.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_1000253A8()
{
  id v0;
  Swift::String v1;
  Swift::String_optional v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  Swift::String v6;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v0 = (id)qword_100092228;
  v6._object = (void *)0xE000000000000000;
  v1._countAndFlagsBits = 0x4C52414550;
  v1._object = (void *)0xE500000000000000;
  v2.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_10002545C()
{
  id v0;
  Swift::String v1;
  Swift::String_optional v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  Swift::String v6;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v0 = (id)qword_100092228;
  v6._object = (void *)0xE000000000000000;
  v1._countAndFlagsBits = 0x44495F4843554F54;
  v1._object = (void *)0xE800000000000000;
  v2.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100025514()
{
  id v0;
  Swift::String v1;
  Swift::String_optional v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  Swift::String v6;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v0 = (id)qword_100092228;
  v6._object = (void *)0xE000000000000000;
  v1._countAndFlagsBits = 0x41505F5245544E45;
  v1._object = (void *)0xEE0044524F575353;
  v2.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_1000255D8()
{
  id v0;
  Swift::String v1;
  Swift::String_optional v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  Swift::String v6;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v0 = (id)qword_100092228;
  v6._object = (void *)0xE000000000000000;
  v1._countAndFlagsBits = 0x425F454349564544;
  v1._object = (void *)0xEE0044454B434F4CLL;
  v2.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_10002569C(uint64_t a1)
{
  id v2;
  Swift::String v3;
  Swift::String_optional v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::String v11;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v2 = (id)qword_100092228;
  v11._object = (void *)0xE000000000000000;
  v3._object = (void *)0x800000010006D740;
  v3._countAndFlagsBits = 0xD000000000000012;
  v4.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v4.value._object = (void *)0xE800000000000000;
  v5._countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  v11._countAndFlagsBits = 0;
  v6 = NSLocalizedString(_:tableName:bundle:value:comment:)(v3, v4, (NSBundle)v2, v5, v11);

  v7 = sub_100025D1C(&qword_100090B40);
  v8 = swift_allocObject(v7, 72, 7);
  *(_OWORD *)(v8 + 16) = xmmword_10005FF40;
  *(_QWORD *)(v8 + 56) = &type metadata for Int;
  *(_QWORD *)(v8 + 64) = &protocol witness table for Int;
  *(_QWORD *)(v8 + 32) = a1;
  v9 = static String.localizedStringWithFormat(_:_:)(v6._countAndFlagsBits, v6._object, v8);
  swift_bridgeObjectRelease(v6._object);
  swift_bridgeObjectRelease(v8);
  return v9;
}

uint64_t sub_1000257C4(uint64_t a1, uint64_t a2)
{
  id v4;
  Swift::String v5;
  Swift::String_optional v6;
  Swift::String v7;
  Swift::String v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v13;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v4 = (id)qword_100092228;
  v13._object = (void *)0xE000000000000000;
  v5._object = (void *)0x800000010006D760;
  v5._countAndFlagsBits = 0xD000000000000019;
  v6.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v6.value._object = (void *)0xE800000000000000;
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  v13._countAndFlagsBits = 0;
  v8 = NSLocalizedString(_:tableName:bundle:value:comment:)(v5, v6, (NSBundle)v4, v7, v13);

  v9 = sub_100025D1C(&qword_100090B40);
  v10 = swift_allocObject(v9, 72, 7);
  *(_OWORD *)(v10 + 16) = xmmword_10005FF40;
  *(_QWORD *)(v10 + 56) = &type metadata for String;
  *(_QWORD *)(v10 + 64) = sub_100025D5C();
  *(_QWORD *)(v10 + 32) = a1;
  *(_QWORD *)(v10 + 40) = a2;
  swift_bridgeObjectRetain(a2);
  v11 = static String.localizedStringWithFormat(_:_:)(v8._countAndFlagsBits, v8._object, v10);
  swift_bridgeObjectRelease(v8._object);
  swift_bridgeObjectRelease(v10);
  return v11;
}

uint64_t sub_100025900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8;
  Swift::String v9;
  Swift::String_optional v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  Swift::String v18;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v8 = (id)qword_100092228;
  v18._object = (void *)0xE000000000000000;
  v9._countAndFlagsBits = 0x494B53415F505041;
  v9._object = (void *)0xEF485455415F474ELL;
  v10.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v10.value._object = (void *)0xE800000000000000;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  v18._countAndFlagsBits = 0;
  v12 = NSLocalizedString(_:tableName:bundle:value:comment:)(v9, v10, (NSBundle)v8, v11, v18);

  v13 = sub_100025D1C(&qword_100090B40);
  v14 = swift_allocObject(v13, 112, 7);
  *(_OWORD *)(v14 + 16) = xmmword_10005FF50;
  *(_QWORD *)(v14 + 56) = &type metadata for String;
  v15 = sub_100025D5C();
  *(_QWORD *)(v14 + 32) = a3;
  *(_QWORD *)(v14 + 40) = a4;
  *(_QWORD *)(v14 + 96) = &type metadata for String;
  *(_QWORD *)(v14 + 104) = v15;
  *(_QWORD *)(v14 + 64) = v15;
  *(_QWORD *)(v14 + 72) = a1;
  *(_QWORD *)(v14 + 80) = a2;
  swift_bridgeObjectRetain(a4);
  swift_bridgeObjectRetain(a2);
  v16 = static String.localizedStringWithFormat(_:_:)(v12._countAndFlagsBits, v12._object, v14);
  swift_bridgeObjectRelease(v12._object);
  swift_bridgeObjectRelease(v14);
  return v16;
}

uint64_t sub_100025A64()
{
  return sub_100025AB4(0);
}

uint64_t sub_100025A6C()
{
  return sub_100025AB4(1);
}

uint64_t sub_100025A74()
{
  return sub_100025AB4(2);
}

uint64_t sub_100025A7C()
{
  return sub_100025AB4(3);
}

uint64_t sub_100025A84()
{
  return sub_100025AB4(4);
}

uint64_t sub_100025A8C()
{
  return sub_100025AB4(5);
}

uint64_t sub_100025A94()
{
  return sub_100025AB4(6);
}

uint64_t sub_100025A9C()
{
  return sub_100025AB4(7);
}

uint64_t sub_100025AA4()
{
  return sub_100025AB4(8);
}

uint64_t sub_100025AAC()
{
  return sub_100025AB4(9);
}

uint64_t sub_100025AB4(Swift::Int a1)
{
  void *v2;
  Class isa;
  id v4;
  uint64_t v5;

  v2 = (void *)objc_opt_self(NSNumberFormatter);
  sub_100025DA0();
  isa = NSNumber.init(integerLiteral:)(a1).super.super.isa;
  v4 = objc_msgSend(v2, "localizedStringFromNumber:numberStyle:", isa, 1);

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  return v5;
}

uint64_t sub_100025B44()
{
  id v0;
  Swift::String v1;
  Swift::String_optional v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  Swift::String v6;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v0 = (id)qword_100092228;
  v6._object = (void *)0xE000000000000000;
  v1._object = (void *)0x800000010006D780;
  v1._countAndFlagsBits = 0xD00000000000001FLL;
  v2.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100025C00()
{
  id v0;
  Swift::String v1;
  Swift::String_optional v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  Swift::String v6;

  if (qword_100092220 != -1)
    swift_once(&qword_100092220, sub_100025CCC);
  v0 = (id)qword_100092228;
  v6._object = (void *)0xE000000000000000;
  v1._object = (void *)0x800000010006D7A0;
  v1._countAndFlagsBits = 0xD00000000000001ELL;
  v2.value._countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100025CBC()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

id sub_100025CCC()
{
  uint64_t v0;
  uint64_t ObjCClassFromMetadata;
  id result;

  v0 = _s8SentinelCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  result = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  qword_100092228 = (uint64_t)result;
  return result;
}

uint64_t sub_100025D1C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_100025D5C()
{
  unint64_t result;

  result = qword_100090B48;
  if (!qword_100090B48)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100090B48);
  }
  return result;
}

unint64_t sub_100025DA0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100090B50;
  if (!qword_100090B50)
  {
    v1 = objc_opt_self(NSNumber);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100090B50);
  }
  return result;
}

ValueMetadata *type metadata accessor for LocalizedStrings()
{
  return &type metadata for LocalizedStrings;
}

ValueMetadata *type metadata accessor for LocalizedStrings.AuthenticationReason()
{
  return &type metadata for LocalizedStrings.AuthenticationReason;
}

ValueMetadata *type metadata accessor for LocalizedStrings.Digits()
{
  return &type metadata for LocalizedStrings.Digits;
}

ValueMetadata *type metadata accessor for LocalizedStrings.Pearl()
{
  return &type metadata for LocalizedStrings.Pearl;
}

uint64_t _s8SentinelCMa()
{
  return objc_opt_self(_TtCE10CoreAuthUICSo8NSBundleP33_878C1D8B2DB2AF546D0F8F59967CB1428Sentinel);
}

id sub_100025E3C()
{
  return objc_msgSend(objc_allocWithZone((Class)LAContext), "init");
}

uint64_t variable initialization expression of AuthorizationRemoteViewController.terminateAssertion()
{
  return 0;
}

Swift::Bool __swiftcall LACUIDTOViewController._canShowWhileLocked()()
{
  return 1;
}

void sub_100025E78()
{
  void *v0;
  id v1;
  id v2;

  v1 = objc_msgSend(objc_allocWithZone((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v0, "setView:", v1);

  if (objc_msgSend((id)objc_opt_self(LAUtils), "isSharedIPad"))
  {
    v2 = objc_msgSend(objc_allocWithZone((Class)LALocalBackoffCounter), "init");
    objc_msgSend(v0, "setBackoffCounter:", v2);

  }
}

void sub_100025F70(char a1)
{
  char *v1;
  void *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType(v1);
  objc_msgSendSuper2(&v5, "viewWillAppear:", a1 & 1);
  sub_100025FD0(v1);
  v3 = *(void **)&v1[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager] = v4;

}

void sub_100025FD0(char *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  Class isa;
  id v16;
  id v17;
  void *v18;
  uint64_t ObjectType;
  id v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t ObjCClassFromMetadata;
  id v33;
  void *v34;
  NSString v35;
  id v36;
  NSString v37;
  id v38;
  void *v39;
  NSString v40;
  id v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  __int128 *v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  id v66;
  NSString v67;
  NSString v68;
  uint64_t v69;
  uint64_t v70;
  NSString v71;
  id v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  id v77;
  NSString v78;
  id v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  uint64_t v84;
  unint64_t v85;
  char v86;
  uint64_t v87;
  id v88;
  id v89;
  char v90;
  id v91;
  id v92;
  void *v93;
  uint64_t v94;
  unint64_t v95;
  char v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  id v102;
  Swift::Bool canShowWhile;
  uint64_t v104;
  id v105[2];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;

  v2 = objc_msgSend(a1, "internalInfo");
  if (!v2)
  {
    __break(1u);
    goto LABEL_107;
  }
  v3 = v2;
  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v2, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  strcpy((char *)v105, "Options");
  v105[1] = (id)0xE700000000000000;
  AnyHashable.init<A>(_:)(v105, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v4 + 16) && (v5 = sub_100027EF8((uint64_t)&v106), (v6 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v4 + 56) + 32 * v5, (uint64_t)&v108);
  }
  else
  {
    v108 = 0u;
    v109 = 0u;
  }
  swift_bridgeObjectRelease(v4);
  sub_100028114((uint64_t)&v106);
  if (*((_QWORD *)&v109 + 1))
  {
    v7 = sub_100025D1C(&qword_100090C38);
    if (swift_dynamicCast(v105, &v108, (char *)&type metadata for Any + 8, v7, 6))
    {
      v8 = v105[0];
      goto LABEL_11;
    }
  }
  else
  {
    sub_100027BE8((uint64_t)&v108);
  }
  v8 = (id)sub_100026D4C((uint64_t)&_swiftEmptyArrayStorage);
LABEL_11:
  v9 = objc_msgSend(*(id *)&a1[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_context], "externalizedContext");
  if (!v9)
  {
LABEL_107:
    __break(1u);
    goto LABEL_108;
  }
  v10 = v9;
  v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;

  v14 = objc_allocWithZone((Class)LACUIAuthenticatorServiceConfiguration);
  isa = Data._bridgeToObjectiveC()().super.isa;
  v16 = objc_msgSend(v14, "initWithContext:requirement:", isa, 2);
  sub_100028234(v11, v13);

  v17 = objc_msgSend(a1, "callerName");
  if (!v17)
  {
LABEL_108:
    __break(1u);
    goto LABEL_109;
  }
  v18 = v17;
  objc_msgSend(v16, "setTitle:", v17);

  ObjectType = swift_getObjectType(a1);
  v20 = objc_msgSend(a1, "options");
  if (!v20)
  {
LABEL_109:
    __break(1u);
    goto LABEL_110;
  }
  v21 = v20;
  v22 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v20, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  LODWORD(v105[0]) = 1037;
  AnyHashable.init<A>(_:)(v105, &type metadata for Int32, &protocol witness table for Int32);
  v104 = (uint64_t)v8;
  if (*(_QWORD *)(v22 + 16) && (v23 = sub_100027EF8((uint64_t)&v106), (v24 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v22 + 56) + 32 * v23, (uint64_t)&v108);
  }
  else
  {
    v108 = 0u;
    v109 = 0u;
  }
  swift_bridgeObjectRelease(v22);
  sub_100028114((uint64_t)&v106);
  if (*((_QWORD *)&v109 + 1))
  {
    if ((swift_dynamicCast(v105, &v108, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
    {
      v25 = v105[1];
      goto LABEL_39;
    }
  }
  else
  {
    sub_100027BE8((uint64_t)&v108);
  }
  if ((objc_msgSend((id)objc_opt_self(LAUtils), "isApplePayPolicy:", objc_msgSend(a1, "policy")) & 1) != 0)goto LABEL_23;
  v27 = objc_msgSend(a1, "options");
  if (!v27)
  {
LABEL_116:
    __break(1u);
    goto LABEL_117;
  }
  v28 = v27;
  v29 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v27, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  LODWORD(v105[0]) = 1053;
  AnyHashable.init<A>(_:)(v105, &type metadata for Int32, &protocol witness table for Int32);
  if (*(_QWORD *)(v29 + 16) && (v30 = sub_100027EF8((uint64_t)&v106), (v31 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v29 + 56) + 32 * v30, (uint64_t)&v108);
  }
  else
  {
    v108 = 0u;
    v109 = 0u;
  }
  swift_bridgeObjectRelease(v29);
  sub_100028114((uint64_t)&v106);
  if (*((_QWORD *)&v109 + 1))
  {
    if ((swift_dynamicCast(v105, &v108, (char *)&type metadata for Any + 8, &type metadata for Bool, 6) & 1) != 0
      && LOBYTE(v105[0]) == 1)
    {
LABEL_23:
      sub_100025180();
LABEL_36:
      v25 = v26;
      goto LABEL_39;
    }
  }
  else
  {
    sub_100027BE8((uint64_t)&v108);
  }
  if (objc_msgSend(a1, "policy") == (id)1010)
  {
    sub_100025230();
    goto LABEL_36;
  }
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(ObjectType);
  v33 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v34 = (void *)objc_opt_self(UIDevice);
  v35 = String._bridgeToObjectiveC()();
  v36 = objc_msgSend(v34, "modelSpecificLocalizedStringKeyForKey:", v35);

  if (!v36)
  {
LABEL_117:
    __break(1u);
    return;
  }
  v37 = String._bridgeToObjectiveC()();
  v38 = objc_msgSend(v33, "localizedStringForKey:value:table:", v36, 0, v37);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
  v25 = v39;

LABEL_39:
  v40 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v25);
  objc_msgSend(v16, "setSubtitle:", v40);

  v41 = objc_msgSend(a1, "internalInfo");
  if (!v41)
  {
LABEL_110:
    __break(1u);
    goto LABEL_111;
  }
  v42 = v41;
  v43 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v41, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  strcpy((char *)v105, "FallbackReason");
  HIBYTE(v105[1]) = -18;
  AnyHashable.init<A>(_:)(v105, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v43 + 16) && (v44 = sub_100027EF8((uint64_t)&v106), (v45 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v43 + 56) + 32 * v44, (uint64_t)&v108);
  }
  else
  {
    v108 = 0u;
    v109 = 0u;
  }
  swift_bridgeObjectRelease(v43);
  sub_100028114((uint64_t)&v106);
  if (!*((_QWORD *)&v109 + 1))
  {
    v58 = &v108;
LABEL_51:
    sub_100027BE8((uint64_t)v58);
    goto LABEL_59;
  }
  v46 = sub_1000287F0(0, &qword_100090C58, NSError_ptr);
  if ((swift_dynamicCast(v105, &v108, (char *)&type metadata for Any + 8, v46, 6) & 1) == 0)
    goto LABEL_59;
  v47 = v105[0];
  v48 = (void *)objc_opt_self(LAErrorHelper);
  v49 = v47;
  v50 = (void *)_convertErrorToNSError(_:)(v49);

  LODWORD(v48) = objc_msgSend(v48, "error:hasCode:", v50, -4);
  if (!(_DWORD)v48)
    goto LABEL_58;
  v51 = objc_msgSend(v49, "userInfo");
  v52 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v51, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);

  v53 = static String._unconditionallyBridgeFromObjectiveC(_:)(LAErrorSubcodeKey);
  v55 = v54;
  if (*(_QWORD *)(v52 + 16) && (v56 = sub_100027F7C(v53, v54), (v57 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v52 + 56) + 32 * v56, (uint64_t)&v106);
  }
  else
  {
    v106 = 0u;
    v107 = 0u;
  }
  swift_bridgeObjectRelease(v52);
  swift_bridgeObjectRelease(v55);
  if (!*((_QWORD *)&v107 + 1))
  {

    v58 = &v106;
    goto LABEL_51;
  }
  type metadata accessor for LAErrorSubcode();
  if (swift_dynamicCast(&v108, &v106, (char *)&type metadata for Any + 8, v59, 6))
  {
    if ((_QWORD)v108 == 13)
    {
      sub_100025B44();
LABEL_104:
      v66 = v60;

      if (!v66)
        goto LABEL_69;
LABEL_67:
      v67 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v66);
      goto LABEL_70;
    }
    if ((_QWORD)v108 == 14)
    {
      sub_100025C00();
      goto LABEL_104;
    }
  }
LABEL_58:

LABEL_59:
  v61 = objc_msgSend(a1, "options");
  if (!v61)
  {
LABEL_115:
    __break(1u);
    goto LABEL_116;
  }
  v62 = v61;
  v63 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v61, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v105[0] = (id)1031;
  AnyHashable.init<A>(_:)(v105, &type metadata for Int, &protocol witness table for Int);
  if (*(_QWORD *)(v63 + 16) && (v64 = sub_100027EF8((uint64_t)&v106), (v65 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v63 + 56) + 32 * v64, (uint64_t)&v108);
  }
  else
  {
    v108 = 0u;
    v109 = 0u;
  }
  swift_bridgeObjectRelease(v63);
  sub_100028114((uint64_t)&v106);
  if (*((_QWORD *)&v109 + 1))
  {
    if ((swift_dynamicCast(v105, &v108, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
      goto LABEL_69;
    v66 = v105[1];
    if (!v105[1])
      goto LABEL_69;
    goto LABEL_67;
  }
  sub_100027BE8((uint64_t)&v108);
LABEL_69:
  v67 = 0;
LABEL_70:
  objc_msgSend(v16, "setPrompt:", v67);

  v68 = String._bridgeToObjectiveC()();
  objc_msgSend(v16, "setPasswordFieldPlaceholder:", v68);

  sub_100024BC4();
  v70 = v69;
  v71 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v70);
  objc_msgSend(v16, "setCancelButtonTitle:", v71);

  v72 = objc_msgSend(a1, "internalInfo");
  if (!v72)
  {
LABEL_111:
    __break(1u);
    goto LABEL_112;
  }
  v73 = v72;
  v74 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v72, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  strcpy((char *)v105, "CallerName");
  BYTE3(v105[1]) = 0;
  HIDWORD(v105[1]) = -369098752;
  AnyHashable.init<A>(_:)(v105, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v74 + 16) && (v75 = sub_100027EF8((uint64_t)&v106), (v76 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v74 + 56) + 32 * v75, (uint64_t)&v108);
  }
  else
  {
    v108 = 0u;
    v109 = 0u;
  }
  swift_bridgeObjectRelease(v74);
  sub_100028114((uint64_t)&v106);
  if (*((_QWORD *)&v109 + 1))
  {
    if ((swift_dynamicCast(v105, &v108, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
    {
      v77 = v105[1];
      v78 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v77);
      goto LABEL_80;
    }
  }
  else
  {
    sub_100027BE8((uint64_t)&v108);
  }
  v78 = 0;
LABEL_80:
  objc_msgSend(v16, "setBundleIdentifier:", v78);

  objc_msgSend(v16, "setStyle:", 0);
  v79 = objc_msgSend(a1, "cachedExternalizedContext");
  v80 = objc_msgSend(a1, "backoffCounter");
  if (!v80)
  {
LABEL_112:
    __break(1u);
    goto LABEL_113;
  }
  v81 = v80;
  v82 = objc_msgSend(a1, "options");
  if (!v82)
  {
LABEL_113:
    __break(1u);
    goto LABEL_114;
  }
  v83 = v82;
  v84 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v82, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  LODWORD(v105[0]) = 1004;
  AnyHashable.init<A>(_:)(v105, &type metadata for Int32, &protocol witness table for Int32);
  if (*(_QWORD *)(v84 + 16) && (v85 = sub_100027EF8((uint64_t)&v106), (v86 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v84 + 56) + 32 * v85, (uint64_t)&v108);
  }
  else
  {
    v108 = 0u;
    v109 = 0u;
  }
  swift_bridgeObjectRelease(v84);
  sub_100028114((uint64_t)&v106);
  if (*((_QWORD *)&v109 + 1))
  {
    v87 = sub_1000287F0(0, (unint64_t *)&qword_100090B50, NSNumber_ptr);
    if ((swift_dynamicCast(v105, &v108, (char *)&type metadata for Any + 8, v87, 6) & 1) != 0)
    {
      v88 = v105[0];
      v89 = objc_msgSend(v105[0], "unsignedIntegerValue");

      v90 = 0;
      goto LABEL_91;
    }
  }
  else
  {
    sub_100027BE8((uint64_t)&v108);
  }
  v89 = 0;
  v90 = 1;
LABEL_91:
  v91 = objc_msgSend(a1, "policy");
  v92 = objc_msgSend(a1, "internalInfo");
  if (!v92)
  {
LABEL_114:
    __break(1u);
    goto LABEL_115;
  }
  v93 = v92;
  v94 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v92, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  *(_QWORD *)&v108 = 0x644972657355;
  *((_QWORD *)&v108 + 1) = 0xE600000000000000;
  AnyHashable.init<A>(_:)(&v108, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v94 + 16) && (v95 = sub_100027EF8((uint64_t)&v106), (v96 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v94 + 56) + 32 * v95, (uint64_t)&v108);
  }
  else
  {
    v108 = 0u;
    v109 = 0u;
  }
  swift_bridgeObjectRelease(v94);
  sub_100028114((uint64_t)&v106);
  if (*((_QWORD *)&v109 + 1))
  {
    v97 = sub_1000287F0(0, (unint64_t *)&qword_100090B50, NSNumber_ptr);
    if (swift_dynamicCast(v105, &v108, (char *)&type metadata for Any + 8, v97, 6))
      v98 = v105[0];
    else
      v98 = 0;
  }
  else
  {
    sub_100027BE8((uint64_t)&v108);
    v98 = 0;
  }
  v99 = swift_allocObject(&unk_10007A8B0, 24, 7);
  swift_unknownObjectWeakInit(v99 + 16, a1);
  v100 = v16;
  *(_QWORD *)&v106 = sub_1000396C0(v100, v79, v81, (uint64_t)v89, v90, (uint64_t)v91, v98, v104, (uint64_t)sub_10002829C, v99);
  v101 = swift_unknownObjectRetain(a1);
  sub_100039514(v101);
  v102 = (id)v106;
  canShowWhile = LACUIDTOViewController._canShowWhileLocked()();
  sub_100039890(a1, canShowWhile, v102);

}

unint64_t sub_100026D4C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100025D1C(&qword_100090C30);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100027F28(v7, (uint64_t)v16, (uint64_t *)&unk_100090D20);
    result = sub_100027EF8((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_100027F6C(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 72;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

BOOL sub_100026F04()
{
  sub_1000287F0(0, &qword_100091F90, UIDevice_ptr);
  return sub_1000557C4();
}

uint64_t sub_100026F7C()
{
  return 0;
}

void sub_100026F8C(uint64_t a1, uint64_t a2)
{
  char *v2;
  void *v3;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD *v14;
  id v15;
  _QWORD v16[5];
  _QWORD *v17;

  v3 = v2;
  sub_1000287F0(0, &qword_100091F90, UIDevice_ptr);
  if (sub_1000557C4())
  {
    v6 = (_QWORD *)swift_allocObject(&unk_10007A7C0, 40, 7);
    v6[2] = v2;
    v6[3] = a1;
    v6[4] = a2;
    v16[4] = sub_100027194;
    v17 = v6;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 1107296256;
    v16[2] = sub_100027144;
    v16[3] = &unk_10007A7D8;
    v7 = _Block_copy(v16);
    v8 = v17;
    v9 = v3;
    sub_100027180(a1, a2);
    swift_release(v8);
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, v7);
    _Block_release(v7);
  }
  else
  {
    v10 = *(void **)&v2[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager];
    if (v10)
    {
      v11 = (void *)objc_opt_self(LAErrorHelper);
      v12 = v10;
      v13 = objc_msgSend(v11, "errorWithCode:", -4);
      v14 = (_QWORD *)swift_allocObject(&unk_10007A798, 40, 7);
      v14[2] = v3;
      v14[3] = a1;
      v14[4] = a2;
      v15 = v3;
      sub_100027180(a1, a2);
      sub_10003976C((uint64_t)v13, (uint64_t (*)(uint64_t))sub_100027174, (uint64_t)v14);

      swift_release(v14);
    }
  }
}

uint64_t sub_100027144(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_100027174()
{
  sub_10002818C((uint64_t)&unk_10007A878);
}

uint64_t sub_100027180(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

void sub_100027194()
{
  uint64_t v0;
  char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD *v8;
  char *v9;
  id v10;

  v1 = *(char **)(v0 + 16);
  v2 = *(void **)&v1[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager];
  if (v2)
  {
    v5 = v0 + 24;
    v4 = *(_QWORD *)(v0 + 24);
    v3 = *(_QWORD *)(v5 + 8);
    v6 = (void *)objc_opt_self(LAErrorHelper);
    v10 = v2;
    v7 = objc_msgSend(v6, "errorWithCode:", -4);
    v8 = (_QWORD *)swift_allocObject(&unk_10007A838, 40, 7);
    v8[2] = v1;
    v8[3] = v4;
    v8[4] = v3;
    v9 = v1;
    sub_100027180(v4, v3);
    sub_10003976C((uint64_t)v7, (uint64_t (*)(uint64_t))sub_100028180, (uint64_t)v8);
    swift_release(v8);

  }
}

uint64_t sub_100027284(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100027294(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id sub_100027334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  objc_class *v5;
  id v11;
  Class isa;
  id v13;

  v11 = objc_allocWithZone(v5);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v13 = objc_msgSend(v11, "initWithInternalInfo:mechanism:backoffCounter:remoteUIHost:allowsLandscape:", isa, a2, a3, a4, a5 & 1);

  swift_unknownObjectRelease(a2);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);
  return v13;
}

id sub_1000273FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  char *v5;
  char *v6;
  objc_class *ObjectType;
  uint64_t v13;
  id v14;
  char *v15;
  Class isa;
  id v17;
  objc_super v19;

  v6 = v5;
  ObjectType = (objc_class *)swift_getObjectType(v6);
  v13 = OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_context;
  v14 = objc_allocWithZone((Class)LAContext);
  v15 = v6;
  *(_QWORD *)&v6[v13] = objc_msgSend(v14, "init");
  *(_QWORD *)&v15[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_failures] = 0;

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v19.receiver = v15;
  v19.super_class = ObjectType;
  v17 = objc_msgSendSuper2(&v19, "initWithInternalInfo:mechanism:backoffCounter:remoteUIHost:allowsLandscape:", isa, a2, a3, a4, a5 & 1);

  swift_unknownObjectRelease(a2);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);
  return v17;
}

id AuthorizationRemoteViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  NSString v7;
  id v8;

  v4 = v3;
  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(objc_allocWithZone(v4), "initWithNibName:bundle:", v7, a3);

  return v8;
}

id sub_10002763C(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  char *v4;
  objc_class *ObjectType;
  uint64_t v8;
  id v9;
  char *v10;
  NSString v11;
  id v12;
  objc_super v14;

  v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType(v3);
  v8 = OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_context;
  v9 = objc_allocWithZone((Class)LAContext);
  v10 = v4;
  *(_QWORD *)&v4[v8] = objc_msgSend(v9, "init");
  *(_QWORD *)&v10[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_failures] = 0;

  if (a2)
  {
    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v11 = 0;
  }
  v14.receiver = v10;
  v14.super_class = ObjectType;
  v12 = objc_msgSendSuper2(&v14, "initWithNibName:bundle:", v11, a3);

  return v12;
}

id AuthorizationRemoteViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithCoder:", a1);

  return v3;
}

id sub_1000277CC(void *a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v4;
  id v5;
  char *v6;
  id v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(v1);
  v4 = OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_context;
  v5 = objc_allocWithZone((Class)LAContext);
  v6 = v1;
  *(_QWORD *)&v1[v4] = objc_msgSend(v5, "init");
  *(_QWORD *)&v6[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_failures] = 0;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  v7 = objc_msgSendSuper2(&v9, "initWithCoder:", a1);

  return v7;
}

id sub_1000278A4(uint64_t a1, _QWORD *a2)
{
  objc_class *v2;
  NSDictionary v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v14;

  if (!a1)
  {
    v5.super.isa = 0;
    v6 = a2[3];
    if (v6)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v6 = a2[3];
  if (!v6)
    goto LABEL_5;
LABEL_3:
  v7 = sub_1000279D8(a2, v6);
  v8 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v10);
  v11 = _bridgeAnythingToObjectiveC<A>(_:)(v10, v6);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  sub_1000279FC(a2);
LABEL_6:
  v12 = objc_msgSend(objc_allocWithZone(v2), "initWithInternalInfo:parent:", v5.super.isa, v11);

  swift_unknownObjectRelease(v11);
  return v12;
}

_QWORD *sub_1000279D8(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000279FC(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

id sub_100027A1C(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  objc_class *ObjectType;
  uint64_t v7;
  id v8;
  char *v9;
  NSDictionary v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  id v18;
  objc_super v20;
  _QWORD v21[3];
  uint64_t v22;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType(v2);
  v7 = OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_context;
  v8 = objc_allocWithZone((Class)LAContext);
  v9 = v3;
  *(_QWORD *)&v3[v7] = objc_msgSend(v8, "init");
  *(_QWORD *)&v9[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_failures] = 0;

  if (a1)
  {
    v10.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v10.super.isa = 0;
  }
  sub_100027F28(a2, (uint64_t)v21, &qword_1000914C0);
  v11 = v22;
  if (v22)
  {
    v12 = sub_1000279D8(v21, v22);
    v13 = *(_QWORD *)(v11 - 8);
    __chkstk_darwin(v12);
    v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    v16 = _bridgeAnythingToObjectiveC<A>(_:)(v15, v11);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    sub_1000279FC(v21);
  }
  else
  {
    v16 = 0;
  }
  v20.receiver = v9;
  v20.super_class = ObjectType;
  v17 = objc_msgSendSuper2(&v20, "initWithInternalInfo:parent:", v10.super.isa, v16);

  swift_unknownObjectRelease(v16);
  v18 = v17;
  sub_100027BE8(a2);
  if (v18)

  return v18;
}

uint64_t sub_100027BE8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100025D1C(&qword_1000914C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_100027CC4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_100027D30()
{
  void *v0;
  id v1;
  void *v2;
  unint64_t v3;
  Class isa;

  v1 = objc_msgSend(v0, "mechanism");
  if (v1)
  {
    v2 = v1;
    v3 = sub_100026D4C((uint64_t)&_swiftEmptyArrayStorage);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
    objc_msgSend(v2, "uiEvent:options:", 9, isa);
    swift_unknownObjectRelease(v2);

  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for PasscodeSheetViewController()
{
  return objc_opt_self(_TtC10CoreAuthUI27PasscodeSheetViewController);
}

uint64_t sub_100027EB8(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100027EC8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100027EEC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

unint64_t sub_100027EF8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100028014(a1, v4);
}

uint64_t sub_100027F28(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100025D1C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_100027F6C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100027F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_1000285A0(a1, a2, v5);
}

unint64_t sub_100027FE0(unsigned int a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = static Hasher._hash(seed:bytes:count:)(*(_QWORD *)(v1 + 40), a1, 4);
  return sub_100028680(a1, v3);
}

unint64_t sub_100028014(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_1000280D8(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100028114((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1000280D8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100028114(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_10002814C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_100028180()
{
  sub_10002818C((uint64_t)&unk_10007A850);
}

void sub_10002818C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  objc_super v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (void *)v1[2];
  v2 = v1[3];
  if (v2)
  {
    v4 = v1[4];
    v11 = v2;
    v12 = v4;
    v8.receiver = _NSConcreteStackBlock;
    v8.super_class = (Class)1107296256;
    v9 = sub_100027144;
    v10 = a1;
    v5 = _Block_copy(&v8);
    v6 = v12;
    swift_retain(v4);
    swift_release(v6);
  }
  else
  {
    v5 = 0;
  }
  v7 = (objc_class *)type metadata accessor for PasscodeSheetViewController();
  v8.receiver = v3;
  v8.super_class = v7;
  objc_msgSendSuper2(&v8, "dismissChildWithCompletionHandler:", v5);
  _Block_release(v5);
}

uint64_t sub_100028234(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100028278()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10002829C(uint64_t a1)
{
  uint64_t v1;
  void *Strong;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  Class isa;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  Class v14;
  uint64_t v15;
  uint64_t inited;
  unint64_t v17;
  unint64_t v18;
  NSDictionary v19;
  uint64_t v20;
  _QWORD v21[2];
  _BYTE v22[104];

  swift_beginAccess(v1 + 16, &v20, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v1 + 16);
  if (Strong)
  {
    v4 = Strong;
    if (a1)
    {
      swift_errorRetain(a1);
      v5 = objc_msgSend(v4, "mechanism");
      if (v5)
      {
        v6 = v5;
        v7 = sub_100026D4C((uint64_t)&_swiftEmptyArrayStorage);
        isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v7);
        objc_msgSend(v6, "uiEvent:options:", 9, isa);
        swift_unknownObjectRelease(v6);

        v9 = (void *)objc_opt_self(LAErrorHelper);
        v10 = (void *)_convertErrorToNSError(_:)(a1);
        LODWORD(v9) = objc_msgSend(v9, "error:hasCode:", v10, -2);

        if ((_DWORD)v9)
        {
          objc_msgSend(v4, "uiCancel");
          swift_errorRelease(a1);
LABEL_10:

          return;
        }
        v19.super.isa = (Class)_convertErrorToNSError(_:)(a1);
        objc_msgSend(v4, "uiFailureWithError:", v19.super.isa);
        swift_errorRelease(a1);
LABEL_9:

        goto LABEL_10;
      }
      __break(1u);
    }
    else
    {
      v11 = objc_msgSend(Strong, "mechanism");
      if (v11)
      {
        v12 = v11;
        v13 = sub_100026D4C((uint64_t)&_swiftEmptyArrayStorage);
        v14 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v13);
        objc_msgSend(v12, "uiEvent:options:", 8, v14);
        swift_unknownObjectRelease(v12);

        v15 = sub_100025D1C(&qword_100090C40);
        inited = swift_initStackObject(v15, v22);
        *(_OWORD *)(inited + 16) = xmmword_10005FF40;
        v21[0] = 0x746C75736552;
        v21[1] = 0xE600000000000000;
        AnyHashable.init<A>(_:)(v21, &type metadata for String, &protocol witness table for String);
        v17 = sub_10002871C((uint64_t)&off_10007A760);
        *(_QWORD *)(inited + 96) = sub_100025D1C(&qword_100090C48);
        *(_QWORD *)(inited + 72) = v17;
        v18 = sub_100026D4C(inited);
        v19.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v18);
        objc_msgSend(v4, "uiSuccessWithResult:", v19.super.isa);
        goto LABEL_9;
      }
    }
    __break(1u);
  }
}

uint64_t sub_100028564(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1000285A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100028680(int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_10002871C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _BYTE *i;
  unsigned int v5;
  char v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_100025D1C(&qword_100090C50);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v1);
    for (i = (_BYTE *)(a1 + 36); ; i += 8)
    {
      v5 = *((_DWORD *)i - 1);
      v6 = *i;
      result = sub_100027FE0(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_DWORD *)(v3[6] + 4 * result) = v5;
      *(_BYTE *)(v3[7] + result) = v6;
      v9 = v3[2];
      v10 = __OFADD__(v9, 1);
      v11 = v9 + 1;
      if (v10)
        goto LABEL_10;
      v3[2] = v11;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

uint64_t sub_1000287F0(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

void type metadata accessor for LAErrorSubcode()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_100090C60)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_10007A8D8);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100090C60);
  }
}

const char *sub_10002888C()
{
  return "LocalAuthentication";
}

const char *sub_1000288A0()
{
  return "newDevicePasscodeAlert";
}

void sub_1000288B4()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_1000288D8()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

Swift::Int sub_100028918(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

unint64_t sub_100028958()
{
  unint64_t result;

  result = qword_100090C68;
  if (!qword_100090C68)
  {
    result = swift_getWitnessTable(&unk_100060044, &type metadata for FeatureFlags.LocalAuthentication);
    atomic_store(result, (unint64_t *)&qword_100090C68);
  }
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlags()
{
  return &type metadata for FeatureFlags;
}

uint64_t getEnumTagSinglePayload for FeatureFlags.LocalAuthentication(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for FeatureFlags.LocalAuthentication(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_100028A44 + 4 * byte_100060020[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100028A64 + 4 * byte_100060025[v4]))();
}

_BYTE *sub_100028A44(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100028A64(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100028A6C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100028A74(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100028A7C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100028A84(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlags.LocalAuthentication()
{
  return &type metadata for FeatureFlags.LocalAuthentication;
}

ValueMetadata *type metadata accessor for Defaults()
{
  return &type metadata for Defaults;
}

void *sub_100028AFC()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  _BYTE v5[24];

  v1 = (void **)(v0 + OBJC_IVAR____TtC10CoreAuthUI24RemoteAlertSceneDelegate_window);
  swift_beginAccess(v0 + OBJC_IVAR____TtC10CoreAuthUI24RemoteAlertSceneDelegate_window, v5, 0, 0);
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_100028BA4(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  _BYTE v5[24];

  v3 = (void **)(v1 + OBJC_IVAR____TtC10CoreAuthUI24RemoteAlertSceneDelegate_window);
  swift_beginAccess(v3, v5, 1, 0);
  v4 = *v3;
  *v3 = a1;

}

void *sub_100028BF4(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC10CoreAuthUI24RemoteAlertSceneDelegate_window, a1, 33, 0);
  return &j__swift_endAccess;
}

void *sub_100028C3C()
{
  _QWORD *v0;
  void *result;
  void *v2;
  id v3;
  uint64_t v4;

  result = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x58))();
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, "rootViewController");

    if (v3)
    {
      v4 = type metadata accessor for RemoteAlertRootViewController();
      result = (void *)swift_dynamicCastClass(v3, v4);
      if (result)
        return result;

    }
    return 0;
  }
  return result;
}

void sub_100028D38(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  void *v4;
  void *v5;
  id v6;
  id v7;
  char v8;

  v2 = v1;
  v4 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x58))();
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "windowScene");

    if (v6)
    {
      sub_1000287F0(0, &qword_100090C78, UIScene_ptr);
      v7 = a1;
      v8 = static NSObject.== infix(_:_:)();

      if ((v8 & 1) != 0)
        (*(void (**)(_QWORD))((swift_isaMask & *v2) + 0x60))(0);
    }
  }
}

void sub_100028E6C(void *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD *v11;

  v3 = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x70))();
  if (v3)
  {
    v11 = (_QWORD *)v3;
    v4 = objc_opt_self(SBSUIRemoteAlertScene);
    v5 = swift_dynamicCastObjCClass(a1, v4);
    if (v5)
    {
      v6 = (void *)v5;
      v7 = a1;
      v8 = sub_100028F60(v6);
      v9 = objc_msgSend(objc_allocWithZone((Class)LACUIScenePresentationRequest), "initWithUserInterfaceRequest:", v8);

      (*(void (**)(id))((swift_isaMask & *v11) + 0x50))(v9);
      v10 = v9;
    }
    else
    {
      v10 = v11;
    }

  }
}

id sub_100028F60(void *a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  Class isa;
  id v8;

  v2 = objc_msgSend(objc_allocWithZone((Class)LACUserInterfaceRequestCoder), "init");
  v3 = objc_msgSend(a1, "configurationContext");
  if (v3 && (v4 = v3, v5 = objc_msgSend(v3, "userInfo"), v4, v5))
  {
    v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  }
  else
  {
    v6 = sub_100026D4C((uint64_t)&_swiftEmptyArrayStorage);
  }
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  v8 = objc_msgSend(v2, "decode:", isa);

  if (!v8)
    v8 = objc_msgSend((id)objc_opt_self(LACUserInterfaceRequest), "unknownInstance");

  return v8;
}

void sub_1000291A0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  char v3;
  void *v4;
  id v5;

  sub_100029218(a2);
  if ((v3 & 1) != 0)
  {
    v4 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x70))();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "handleSceneButton:", 0);

    }
  }
}

void sub_100029218(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  unsigned __int8 v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  void *v28;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v2 = a1;
    else
      v2 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = __CocoaSet.makeIterator()(v2);
    v4 = sub_1000287F0(0, &qword_100090D08, SBUIRemoteAlertButtonAction_ptr);
    v5 = sub_100029830();
    v6 = Set.Iterator.init(_cocoa:)(v27, v3, v4, v5);
    v1 = v27[0];
    v25 = v27[1];
    v7 = v27[2];
    v8 = v27[3];
    v9 = v27[4];
  }
  else
  {
    v10 = -1 << *(_BYTE *)(a1 + 32);
    v25 = a1 + 56;
    v7 = ~v10;
    v11 = -v10;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v9 = v12 & *(_QWORD *)(a1 + 56);
    v6 = (_QWORD *)swift_bridgeObjectRetain(a1);
    v8 = 0;
  }
  v24 = (unint64_t)(v7 + 64) >> 6;
  while (1)
  {
    v17 = v8;
    if ((v1 & 0x8000000000000000) == 0)
      break;
    v21 = __CocoaSet.Iterator.next()(v6);
    if (!v21)
      goto LABEL_34;
    v22 = v21;
    v26 = v21;
    v23 = sub_1000287F0(0, &qword_100090D08, SBUIRemoteAlertButtonAction_ptr);
    swift_unknownObjectRetain(v22);
    swift_dynamicCast(&v28, &v26, (char *)&type metadata for Swift.AnyObject + 8, v23, 7);
    v15 = v28;
    swift_unknownObjectRelease(v22);
    if (!v15)
      goto LABEL_34;
LABEL_13:
    v16 = objc_msgSend(v15, "events");

    if ((v16 & 0x10) != 0)
      goto LABEL_34;
  }
  if (v9)
  {
    v13 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    v14 = v13 | (v8 << 6);
LABEL_12:
    v15 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v14);
    if (!v15)
      goto LABEL_34;
    goto LABEL_13;
  }
  v18 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v18 >= v24)
      goto LABEL_34;
    v19 = *(_QWORD *)(v25 + 8 * v18);
    ++v8;
    if (!v19)
    {
      v8 = v17 + 2;
      if (v17 + 2 >= v24)
        goto LABEL_34;
      v19 = *(_QWORD *)(v25 + 8 * v8);
      if (!v19)
      {
        v8 = v17 + 3;
        if (v17 + 3 >= v24)
          goto LABEL_34;
        v19 = *(_QWORD *)(v25 + 8 * v8);
        if (!v19)
        {
          v8 = v17 + 4;
          if (v17 + 4 >= v24)
            goto LABEL_34;
          v19 = *(_QWORD *)(v25 + 8 * v8);
          if (!v19)
          {
            v8 = v17 + 5;
            if (v17 + 5 >= v24)
              goto LABEL_34;
            v19 = *(_QWORD *)(v25 + 8 * v8);
            if (!v19)
            {
              v20 = v17 + 6;
              while (v24 != v20)
              {
                v19 = *(_QWORD *)(v25 + 8 * v20++);
                if (v19)
                {
                  v8 = v20 - 1;
                  goto LABEL_31;
                }
              }
LABEL_34:
              sub_100029888(v1);
              return;
            }
          }
        }
      }
    }
LABEL_31:
    v9 = (v19 - 1) & v19;
    v14 = __clz(__rbit64(v19)) + (v8 << 6);
    goto LABEL_12;
  }
  __break(1u);
}

id sub_1000295D8()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id sub_1000295F8()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC10CoreAuthUI24RemoteAlertSceneDelegate_window] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10002967C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_1000296BC(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v2 = v1;
  v4 = objc_opt_self(SBSUIRemoteAlertScene);
  v5 = swift_dynamicCastObjCClass(a1, v4);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = a1;
    objc_msgSend(v6, "setDesiredHardwareButtonEvents:", 16);
    type metadata accessor for SecureWindow();
    v15 = v7;
    v8 = sub_10002E100(v6);
    v9 = (*(uint64_t (**)(id))((swift_isaMask & *v2) + 0x60))(v8);
    v10 = *(uint64_t (**)(void))((swift_isaMask & *v2) + 0x58);
    v11 = ((uint64_t (*)(uint64_t))v10)(v9);
    if (v11)
    {
      v12 = (void *)v11;
      type metadata accessor for RemoteAlertRootViewController();
      v13 = sub_100043890((uint64_t)objc_msgSend(objc_allocWithZone((Class)LACUISceneSpringBoardAdapter), "initWithScene:", v6));
      objc_msgSend(v12, "setRootViewController:", v13);

    }
    v14 = (void *)v10();
    objc_msgSend(v14, "makeKeyAndVisible");

  }
}

uint64_t type metadata accessor for RemoteAlertSceneDelegate()
{
  return objc_opt_self(_TtC10CoreAuthUI24RemoteAlertSceneDelegate);
}

unint64_t sub_100029830()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100090D10;
  if (!qword_100090D10)
  {
    v1 = sub_1000287F0(255, &qword_100090D08, SBUIRemoteAlertButtonAction_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100090D10);
  }
  return result;
}

uint64_t sub_100029888(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100029890(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100025D1C((uint64_t *)&unk_100090D20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000298D8()
{
  _QWORD *v0;

  v0 = sub_1000419B8();
  return sub_1000419D0(*v0);
}

id sub_100029900()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  _BOOL8 v5;
  id v6;

  v0 = (void *)objc_opt_self(Passcode);
  v1 = objc_msgSend(v0, "currentPasscode");
  v2 = objc_msgSend(v1, "length");

  v3 = objc_msgSend(v0, "currentPasscode");
  v4 = objc_msgSend(v3, "type");

  v5 = v4 == (id)3;
  if (v2 == (id)NSNotFound.getter())
    v6 = 0;
  else
    v6 = v2;
  return objc_msgSend(objc_allocWithZone((Class)PasscodeEmbeddedCustomizableViewController), "initWithPasscodeLength:alphanumeric:", v6, v5);
}

uint64_t sub_1000299B8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext);
  sub_10002B39C(v1, *(_QWORD *)(v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext + 8));
  return v1;
}

void *sub_1000299F4()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_userId);
  v2 = v1;
  return v1;
}

uint64_t sub_100029A20()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_policy);
}

uint64_t sub_100029A30()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0
                                            + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_options));
}

uint64_t sub_100029A40()
{
  uint64_t v0;

  return swift_unknownObjectRetain(*(_QWORD *)(v0
                                             + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_backoffCounter));
}

uint64_t sub_100029A50()
{
  return 0;
}

uint64_t sub_100029A5C()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate;
  swift_beginAccess(v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate, v3, 0, 0);
  return swift_unknownObjectWeakLoadStrong(v1);
}

uint64_t sub_100029AA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  _BYTE v7[24];

  v5 = v2 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate;
  swift_beginAccess(v5, v7, 1, 0);
  *(_QWORD *)(v5 + 8) = a2;
  swift_unknownObjectWeakAssign(v5, a1);
  return swift_unknownObjectRelease(a1);
}

void (*sub_100029B10(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t Strong;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess(v1 + v4, v3, 33, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = Strong;
  v3[4] = v7;
  return sub_100029B84;
}

void sub_100029B84(uint64_t a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD **)a1;
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48);
  *(_QWORD *)(v6 + 8) = v5;
  swift_unknownObjectWeakAssign(v6, v4);
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease(v3[3]);
    swift_endAccess(v3);
  }
  else
  {
    swift_endAccess(v3);
    swift_unknownObjectRelease(v4);
  }
  free(v3);
}

id sub_100029BF8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  uint64_t v4;
  id v5;
  id v6;
  id v8;
  _BYTE v9[40];
  __int128 v10;
  __int128 v11;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_options);
  LODWORD(v8) = 1004;
  AnyHashable.init<A>(_:)(&v8, &type metadata for Int32, &protocol witness table for Int32);
  if (*(_QWORD *)(v1 + 16) && (v2 = sub_100027EF8((uint64_t)v9), (v3 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v1 + 56) + 32 * v2, (uint64_t)&v10);
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
  }
  sub_100028114((uint64_t)v9);
  if (!*((_QWORD *)&v11 + 1))
  {
    sub_10002BD8C((uint64_t)&v10, &qword_1000914C0);
    return 0;
  }
  v4 = sub_1000287F0(0, (unint64_t *)&qword_100090B50, NSNumber_ptr);
  if ((swift_dynamicCast(&v8, &v10, (char *)&type metadata for Any + 8, v4, 6) & 1) == 0)
    return 0;
  v5 = v8;
  v6 = objc_msgSend(v8, "unsignedIntegerValue");

  return v6;
}

uint64_t sub_100029D04()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_failures;
  swift_beginAccess(v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_failures, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_100029D48(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_failures);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

uint64_t (*sub_100029D90(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_failures, a1, 33, 0);
  return j__swift_endAccess;
}

id sub_100029DD4(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  id v13;
  id v14;

  v13 = objc_allocWithZone(v6);
  v14 = sub_10002BA20(a1, a2, a3, a4, a5, a6);
  swift_unknownObjectRelease(a6);

  sub_100028234(a1, a2);
  return v14;
}

id sub_100029E64(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v10;

  v10 = sub_10002BA20(a1, a2, a3, a4, a5, a6);
  swift_unknownObjectRelease(a6);

  sub_100028234(a1, a2);
  return v10;
}

id sub_100029EE8()
{
  char *v0;
  char *v1;
  id v2;
  id result;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  Class isa;

  v1 = v0;
  v2 = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  objc_msgSend(v1, "setView:", v2);

  result = objc_msgSend(v1, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_15;
  }
  v4 = result;
  v5 = *(void **)&v1[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_passcodeController];
  result = objc_msgSend(v5, "view");
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v6 = result;
  objc_msgSend(v4, "addSubview:", result);

  result = objc_msgSend(v5, "view");
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v7 = result;
  objc_msgSend(result, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = sub_100025D1C(&qword_100090DF0);
  v9 = swift_allocObject(v8, 72, 7);
  *(_OWORD *)(v9 + 16) = xmmword_100060130;
  result = objc_msgSend(v5, "view");
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v10 = result;
  v11 = objc_msgSend(result, "leadingAnchor");

  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v12 = result;
  v13 = objc_msgSend(result, "leadingAnchor");

  v14 = objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 10.0);
  *(_QWORD *)(v9 + 32) = v14;
  result = objc_msgSend(v5, "view");
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v15 = result;
  v16 = objc_msgSend(result, "trailingAnchor");

  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v17 = result;
  v18 = objc_msgSend(result, "trailingAnchor");

  v19 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, -10.0);
  *(_QWORD *)(v9 + 40) = v19;
  result = objc_msgSend(v5, "view");
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v20 = result;
  v21 = objc_msgSend(result, "topAnchor");

  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v22 = result;
  v23 = objc_msgSend(result, "topAnchor");

  v24 = objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  *(_QWORD *)(v9 + 48) = v24;
  result = objc_msgSend(v5, "view");
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v25 = result;
  v26 = objc_msgSend(result, "bottomAnchor");

  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v27 = result;
  v28 = objc_msgSend(result, "bottomAnchor");

  v29 = objc_msgSend(v26, "constraintEqualToAnchor:", v28);
  *(_QWORD *)(v9 + 56) = v29;
  result = objc_msgSend(v5, "view");
  if (result)
  {
    v30 = result;
    v31 = (void *)objc_opt_self(NSLayoutConstraint);
    v32 = objc_msgSend(v30, "heightAnchor");

    v33 = objc_msgSend(v32, "constraintEqualToConstant:", 80.0);
    *(_QWORD *)(v9 + 64) = v33;
    specialized Array._endMutation()();
    sub_1000287F0(0, (unint64_t *)&qword_100090DF8, NSLayoutConstraint_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v9);
    objc_msgSend(v31, "activateConstraints:", isa);

    objc_msgSend(v1, "addChildViewController:", v5);
    objc_msgSend(v5, "didMoveToParentViewController:", v1);
    objc_msgSend(v5, "setDelegate:", v1);
    return objc_msgSend(v5, "setPasscodeFocused:", 1);
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_10002A3F4(char a1)
{
  char *v1;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  objc_super v8;

  v8.receiver = v1;
  v8.super_class = (Class)swift_getObjectType(v1);
  objc_msgSendSuper2(&v8, "viewWillAppear:", a1 & 1);
  v3 = *(void **)&v1[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_backoffCounter];
  v4 = swift_allocObject(&unk_10007AA18, 24, 7);
  swift_unknownObjectWeakInit(v4 + 16, v1);
  v6[4] = sub_10002BD6C;
  v7 = v4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_10002AD04;
  v6[3] = &unk_10007AA30;
  v5 = _Block_copy(v6);
  swift_release(v7);
  objc_msgSend(v3, "currentBackoffErrorWithReply:", v5);
  _Block_release(v5);
}

uint64_t sub_10002A4D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *Strong;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD aBlock[5];
  uint64_t v28;
  char v29[24];

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  result = __chkstk_darwin(v8);
  v12 = (char *)&aBlock[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v13 = a2 + 16;
    sub_1000287F0(0, (unint64_t *)&qword_100091FA0, OS_dispatch_queue_ptr);
    v14 = swift_errorRetain(a1);
    v15 = static OS_dispatch_queue.main.getter(v14);
    v26 = v5;
    v16 = (void *)v15;
    v17 = swift_allocObject(&unk_10007AA18, 24, 7);
    swift_beginAccess(v13, v29, 0, 0);
    Strong = (void *)swift_unknownObjectWeakLoadStrong(v13);
    swift_unknownObjectWeakInit(v17 + 16, Strong);

    v19 = swift_allocObject(&unk_10007AB60, 32, 7);
    *(_QWORD *)(v19 + 16) = v17;
    *(_QWORD *)(v19 + 24) = a1;
    aBlock[4] = sub_10002BFFC;
    v28 = v19;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100027144;
    aBlock[3] = &unk_10007AB78;
    v20 = _Block_copy(aBlock);
    v21 = v28;
    swift_errorRetain(a1);
    v22 = swift_release(v21);
    static DispatchQoS.unspecified.getter(v22);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v23 = sub_10002C054((unint64_t *)&qword_1000915D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v24 = sub_100025D1C((uint64_t *)&unk_100091FB0);
    v25 = sub_10002C094();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v24, v25, v4, v23);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v7, v20);
    _Block_release(v20);

    swift_errorRelease(a1);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  return result;
}

uint64_t sub_10002A73C(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(_BYTE *, uint64_t);
  NSObject *v29;
  os_log_type_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  os_log_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  char *v47;
  char *v48;
  void *v49;
  double v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  char *v56;
  id v57;
  _BYTE v58[4];
  int v59;
  os_log_t v60;
  void (*v61)(_BYTE *, uint64_t);
  uint64_t v62;
  _QWORD *v63;
  char *v64;
  uint64_t v65;
  char *v66;
  __int128 aBlock;
  __int128 v68;
  uint64_t (*v69)();
  uint64_t v70;

  v2 = v1;
  v4 = sub_100025D1C(&qword_100091F40);
  __chkstk_darwin(v4);
  v6 = &v58[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = &v58[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = __chkstk_darwin(v9);
  v14 = &v58[-v13];
  __chkstk_darwin(v12);
  v16 = &v58[-v15];
  v65 = a1;
  v17 = (void *)_convertErrorToNSError(_:)(a1);
  v18 = objc_msgSend(v17, "userInfo");

  v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v18, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(LAPasswordRetryTime);
  v22 = v21;
  if (!*(_QWORD *)(v19 + 16) || (v23 = sub_100027F7C(v20, v21), (v24 & 1) == 0))
  {
    aBlock = 0u;
    v68 = 0u;
    swift_bridgeObjectRelease(v22);
    swift_bridgeObjectRelease(v19);
    goto LABEL_9;
  }
  sub_100028564(*(_QWORD *)(v19 + 56) + 32 * v23, (uint64_t)&aBlock);
  swift_bridgeObjectRelease(v22);
  swift_bridgeObjectRelease(v19);
  if (!*((_QWORD *)&v68 + 1))
  {
LABEL_9:
    sub_10002BD8C((uint64_t)&aBlock, &qword_1000914C0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    return sub_10002BD8C((uint64_t)v6, &qword_100091F40);
  }
  v25 = swift_dynamicCast(v6, &aBlock, (char *)&type metadata for Any + 8, v7, 6);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, v25 ^ 1u, 1, v7);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    return sub_10002BD8C((uint64_t)v6, &qword_100091F40);
  v26 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32))(v16, v6, v7);
  Date.init()(v26);
  v27 = Date.compare(_:)(v14);
  v28 = *(void (**)(_BYTE *, uint64_t))(v8 + 8);
  v28(v14, v7);
  if (v27 == 1)
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v11, v16, v7);
    v64 = v2;
    v29 = Logger.logObject.getter();
    v30 = static os_log_type_t.info.getter();
    v31 = v30;
    if (os_log_type_enabled(v29, v30))
    {
      v32 = swift_slowAlloc(22, -1);
      v63 = (_QWORD *)swift_slowAlloc(8, -1);
      v33 = swift_slowAlloc(32, -1);
      v62 = v33;
      *(_DWORD *)v32 = 138543618;
      v60 = v29;
      v61 = v28;
      v34 = v64;
      v66 = v64;
      *(_QWORD *)&aBlock = v33;
      v35 = v64;
      v59 = v31;
      v36 = v35;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v66, &aBlock, v32 + 4, v32 + 12);
      *v63 = v34;

      *(_WORD *)(v32 + 12) = 2082;
      v37 = sub_10002C054(&qword_100090E00, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
      v38 = dispatch thunk of CustomStringConvertible.description.getter(v7, v37);
      v40 = v39;
      v66 = (char *)sub_10002B3E0(v38, v39, (uint64_t *)&aBlock);
      v28 = v61;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v66, &aBlock, v32 + 14, v32 + 22);
      swift_bridgeObjectRelease(v40);
      v28(v11, v7);
      v41 = v60;
      _os_log_impl((void *)&_mh_execute_header, v60, (os_log_type_t)v59, "%{public}@ is blocked until %{public}s", (uint8_t *)v32, 0x16u);
      v42 = sub_100025D1C(&qword_1000911C0);
      v43 = v63;
      swift_arrayDestroy(v63, 1, v42);
      swift_slowDealloc(v43, -1, -1);
      v44 = v62;
      swift_arrayDestroy(v62, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v44, -1, -1);
      swift_slowDealloc(v32, -1, -1);

    }
    else
    {
      v47 = v64;

      v45 = ((uint64_t (*)(_BYTE *, uint64_t))v28)(v11, v7);
    }
    v48 = v64;
    v49 = *(void **)&v64[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_passcodeController];
    Date.init()(v45);
    v50 = Date.timeIntervalSince(_:)(v14);
    v28(v14, v7);
    objc_msgSend(v49, "setBackoffTimeout:showBackoffTitle:passcodeFocused:", 0, 1, v50);
    v51 = (void *)objc_opt_self(NSTimer);
    v52 = swift_allocObject(&unk_10007AA68, 32, 7);
    v53 = v65;
    *(_QWORD *)(v52 + 16) = v48;
    *(_QWORD *)(v52 + 24) = v53;
    v69 = sub_10002BDF4;
    v70 = v52;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v68 = sub_10002AF68;
    *((_QWORD *)&v68 + 1) = &unk_10007AA80;
    v54 = _Block_copy(&aBlock);
    v55 = v70;
    v56 = v48;
    swift_errorRetain(v53);
    swift_release(v55);
    v57 = objc_msgSend(v51, "scheduledTimerWithTimeInterval:repeats:block:", 0, v54, 1.0);
    _Block_release(v54);

  }
  else
  {
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_passcodeController], "setBackoffTimeout:showBackoffTitle:passcodeFocused:", 0, 1, 0.0);
  }
  return ((uint64_t (*)(_BYTE *, uint64_t))v28)(v16, v7);
}

void sub_10002AD04(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void *);
  id v5;

  v4 = *(void (**)(void *))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4(a2);
  swift_release(v3);

}

id sub_10002AD98(char a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_passcodeController), "setPasscodeFocused:", a1 & 1);
}

void sub_10002ADB8(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v4;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(v4);
  sub_10002C138(a1, a2, *(_QWORD *)(v4 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext), *(_QWORD *)(v4 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext + 8), *(void **)(v4 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_userId), *(_QWORD *)(v4 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_policy), *(_QWORD *)(v4 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_options), a3, a4, ObjectType, (uint64_t)&off_10007AAA8);
}

void sub_10002AF68(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

uint64_t sub_10002AFB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  _BYTE v8[24];

  v3 = v1 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate;
  swift_beginAccess(v1 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate, v8, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(v3);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)(v3 + 8);
    ObjectType = swift_getObjectType(result);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 8))(a1, ObjectType, v6);
    return swift_unknownObjectRelease(v5);
  }
  return result;
}

uint64_t sub_10002B038()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  _BYTE v6[24];

  v1 = v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate;
  swift_beginAccess(v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate, v6, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(v1);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(v1 + 8);
    ObjectType = swift_getObjectType(result);
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(ObjectType, v4);
    return swift_unknownObjectRelease(v3);
  }
  return result;
}

uint64_t sub_10002B0A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  _BYTE v8[24];

  v3 = v1 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate;
  swift_beginAccess(v1 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate, v8, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(v3);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)(v3 + 8);
    ObjectType = swift_getObjectType(result);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(a1, ObjectType, v6);
    return swift_unknownObjectRelease(v5);
  }
  return result;
}

uint64_t sub_10002B124(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  _BYTE v8[24];

  v3 = v1 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate;
  swift_beginAccess(v1 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate, v8, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(v3);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)(v3 + 8);
    ObjectType = swift_getObjectType(result);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, ObjectType, v6);
    return swift_unknownObjectRelease(v5);
  }
  return result;
}

void sub_10002B1A4()
{
  _swift_stdlib_reportUnimplementedInitializer("CoreAuthUI.PasscodeAlertContentViewController", 45, "init(nibName:bundle:)", 21, 0);
  __break(1u);
}

id sub_10002B2A4()
{
  return sub_100029BF8();
}

uint64_t (*sub_10002B2BC(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_failures, a1, 33, 0);
  return j_j__swift_endAccess;
}

void sub_10002B304(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, uint64_t a6, uint64_t a7, void (*a8)(_QWORD), uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(v11);
  sub_10002C138(a1, a2, a3, a4, a5, a6, a7, a8, a9, ObjectType, a11);
}

uint64_t sub_10002B39C(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10002B3E0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10002B4B0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100028564((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_100028564((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000279FC(v12);
  return v7;
}

uint64_t sub_10002B4B0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_10002B668(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_10002B668(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10002B6FC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10002B8D4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10002B8D4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10002B6FC(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_10002B870(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_10002B870(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_100025D1C((uint64_t *)&unk_100091320);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10002B8D4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100025D1C((uint64_t *)&unk_100091320);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

id sub_10002BA20(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  char *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  char *v20;
  uint64_t *v21;
  id v22;
  objc_class *ObjectType;
  objc_super v26;

  ObjectType = (objc_class *)swift_getObjectType(v6);
  v12 = v6;
  v13 = sub_1000419B8();
  sub_1000419D0(*v13);
  v14 = (void *)objc_opt_self(Passcode);
  v15 = objc_msgSend(v14, "currentPasscode");
  v16 = objc_msgSend(v15, "length");

  v17 = objc_msgSend(v14, "currentPasscode");
  v18 = objc_msgSend(v17, "type");

  if (v16 == (id)NSNotFound.getter())
    v16 = 0;
  v19 = OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_passcodeController;
  *(_QWORD *)&v12[v19] = objc_msgSend(objc_allocWithZone((Class)PasscodeEmbeddedCustomizableViewController), "initWithPasscodeLength:alphanumeric:", v16, v18 == (id)3);
  v20 = &v12[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate];
  *((_QWORD *)v20 + 1) = 0;
  swift_unknownObjectWeakInit(v20, 0);
  *(_QWORD *)&v12[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_failures] = 0;
  v21 = (uint64_t *)&v12[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext];
  *v21 = a1;
  v21[1] = a2;
  *(_QWORD *)&v12[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_userId] = a3;
  *(_QWORD *)&v12[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_policy] = a4;
  *(_QWORD *)&v12[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_options] = a5;
  *(_QWORD *)&v12[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_backoffCounter] = a6;
  sub_10002B39C(a1, a2);
  v22 = a3;
  swift_unknownObjectRetain(a6);

  v26.receiver = v12;
  v26.super_class = ObjectType;
  return objc_msgSendSuper2(&v26, "initWithNibName:bundle:", 0, 0);
}

void sub_10002BBF8()
{
  char *v0;
  _QWORD *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  _BOOL8 v7;
  id v8;
  uint64_t v9;
  char *v10;

  v1 = sub_1000419B8();
  sub_1000419D0(*v1);
  v2 = (void *)objc_opt_self(Passcode);
  v3 = objc_msgSend(v2, "currentPasscode");
  v4 = objc_msgSend(v3, "length");

  v5 = objc_msgSend(v2, "currentPasscode");
  v6 = objc_msgSend(v5, "type");

  v7 = v6 == (id)3;
  if (v4 == (id)NSNotFound.getter())
    v8 = 0;
  else
    v8 = v4;
  v9 = OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_passcodeController;
  *(_QWORD *)&v0[v9] = objc_msgSend(objc_allocWithZone((Class)PasscodeEmbeddedCustomizableViewController), "initWithPasscodeLength:alphanumeric:", v8, v7);
  v10 = &v0[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate];
  *((_QWORD *)v10 + 1) = 0;
  swift_unknownObjectWeakInit(v10, 0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_failures] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010006DE50, "CoreAuthUI/PasscodeAlertContentViewController.swift", 51, 2, 49, 0);
  __break(1u);
}

uint64_t sub_10002BD48()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002BD6C(uint64_t a1)
{
  uint64_t v1;

  return sub_10002A4D8(a1, v1);
}

uint64_t sub_10002BD74(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002BD84(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10002BD8C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100025D1C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10002BDC8()
{
  uint64_t v0;

  swift_errorRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002BDF4()
{
  uint64_t v0;

  return sub_10002A73C(*(_QWORD *)(v0 + 24));
}

uint64_t sub_10002BE18(uint64_t a1)
{
  swift_unknownObjectWeakDestroy(a1);
  return a1;
}

uint64_t sub_10002BE3C()
{
  return type metadata accessor for PasscodeAlertContentViewController(0);
}

uint64_t type metadata accessor for PasscodeAlertContentViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_1000923C0;
  if (!qword_1000923C0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PasscodeAlertContentViewController);
  return result;
}

uint64_t sub_10002BE80(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[9];

  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[2] = &unk_1000601B8;
    v4[3] = &unk_1000601D0;
    v4[4] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[5] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[6] = &unk_1000601E8;
    v4[7] = &unk_100060200;
    v4[8] = (char *)&value witness table for Builtin.Int64 + 64;
    result = swift_updateClassMetadata2(a1, 256, 9, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

void type metadata accessor for LAPolicy()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1000920A0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_10007AB18);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000920A0);
  }
}

uint64_t sub_10002BF94()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002BFB8(char a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 16) + 16))(*(_QWORD *)(v1 + 16), a1 & 1);
}

uint64_t sub_10002BFD0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_errorRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_10002BFFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  _BYTE v5[24];

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 16) + 16;
  swift_beginAccess(v2, v5, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = (void *)Strong;
    sub_10002A73C(v1);

  }
}

uint64_t sub_10002C054(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10002C094()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000915E0;
  if (!qword_1000915E0)
  {
    v1 = sub_10002C0E0((uint64_t *)&unk_100091FB0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000915E0);
  }
  return result;
}

uint64_t sub_10002C0E0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_10002C138(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, uint64_t a6, uint64_t a7, void (*a8)(_QWORD), uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  void *v20;
  id v21;
  NSString v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  Class isa;
  void *v28;
  NSString v29;
  id v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  void (*v35)(_QWORD);
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  _QWORD *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  void *v56;
  uint64_t v57;
  void (*v58)(_QWORD);
  _QWORD aBlock[5];
  _QWORD *v60;

  v53 = a6;
  v54 = a3;
  v55 = a4;
  v56 = a5;
  v57 = a10;
  v58 = a8;
  v15 = type metadata accessor for String.Encoding(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = objc_msgSend((id)objc_opt_self(LAPasscodeHelper), "sharedInstance");
  if (v19)
  {
    v20 = v19;
    v51 = a7;
    v52 = a9;
    v21 = objc_allocWithZone((Class)LACSecureData);
    swift_bridgeObjectRetain(a2);
    v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
    v50 = objc_msgSend(v21, "initWithString:", v22);

    v23 = swift_allocObject(&unk_10007ABE0, 20, 7);
    *(_DWORD *)(v23 + 16) = 0;
    if (objc_msgSend((id)objc_opt_self(LAUtils), "isSharedIPad"))
    {
      static String.Encoding.utf8.getter();
      v24 = String.data(using:allowLossyConversion:)(v18, 0, a1, a2);
      v26 = v25;
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      if (v26 >> 60 == 15)
      {
        isa = 0;
      }
      else
      {
        isa = Data._bridgeToObjectiveC()().super.isa;
        sub_10002C9A0(v24, v26);
      }
      v31 = MKBUnlockDevice(isa, 0);

      *(_DWORD *)(v23 + 16) = v31;
    }
    v32 = v57;
    v49 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(a11 + 8))(v57, a11);
    v33 = swift_allocObject(&unk_10007AC08, 24, 7);
    swift_unknownObjectWeakInit(v33 + 16, v11);
    v34 = (_QWORD *)swift_allocObject(&unk_10007AC30, 120, 7);
    v34[2] = v32;
    v34[3] = a11;
    v35 = v58;
    v34[4] = v33;
    v34[5] = v35;
    v37 = v52;
    v36 = v53;
    v34[6] = v52;
    v34[7] = v23;
    v38 = v50;
    v39 = v51;
    v34[8] = v20;
    v34[9] = v38;
    v40 = v54;
    v41 = v55;
    v34[10] = v54;
    v34[11] = v41;
    v42 = v56;
    v34[12] = v56;
    v34[13] = v36;
    v34[14] = v39;
    aBlock[4] = sub_10002C944;
    v60 = v34;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10002AD04;
    aBlock[3] = &unk_10007AC48;
    v43 = _Block_copy(aBlock);
    v44 = v60;
    swift_retain(v37);
    swift_retain(v23);
    v45 = v20;
    v46 = v38;
    sub_10002B39C(v40, v41);
    v47 = v42;
    swift_bridgeObjectRetain(v39);
    swift_release(v44);
    v48 = v49;
    objc_msgSend(v49, "currentBackoffErrorWithReply:", v43);
    _Block_release(v43);

    swift_release(v23);
    swift_unknownObjectRelease(v48);
  }
  else
  {
    v28 = (void *)objc_opt_self(LAErrorHelper);
    v29 = String._bridgeToObjectiveC()();
    v30 = objc_msgSend(v28, "internalErrorWithMessage:", v29);

    if (v30)
    {
      (*(void (**)(id, uint64_t, uint64_t))(a11 + 64))(v30, v57, a11);

      v58(0);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_10002C4C4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 20, 7);
}

uint64_t sub_10002C4D4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002C4F8(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8, unint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(_QWORD);
  uint64_t Strong;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  uint64_t v54;
  const void *v55;
  void *v56;
  _QWORD *v57;
  uint64_t v59;
  char *v60;
  unint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(_QWORD);
  uint64_t v75;
  void *v76;
  _QWORD aBlock[5];
  _QWORD *v78;
  char v79[32];

  v69 = a6;
  v70 = a8;
  v67 = a7;
  v68 = a5;
  v74 = a3;
  v75 = a4;
  v66 = type metadata accessor for DispatchWorkItemFlags(0);
  v73 = *(_QWORD *)(v66 - 8);
  __chkstk_darwin(v66);
  v17 = (char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for DispatchQoS(0);
  v71 = *(_QWORD *)(v18 - 8);
  v72 = v18;
  __chkstk_darwin(v18);
  v20 = (char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for DispatchQoS.QoSClass(0);
  v22 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v24 = (char *)&v59 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = a2 + 16;
  if (a1)
  {
    v26 = v74;
    swift_beginAccess(a2 + 16, aBlock, 0, 0);
    Strong = swift_unknownObjectWeakLoadStrong(a2 + 16);
    if (Strong)
    {
      v28 = Strong;
      v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(a14 + 80);
      swift_errorRetain(a1);
      v29(a1, a13, a14);
      swift_unknownObjectRelease(v28);
    }
    else
    {
      swift_errorRetain(a1);
    }
    v26(0);
    return swift_errorRelease(a1);
  }
  else
  {
    v64 = a12;
    v63 = a11;
    v62 = a10;
    v61 = a9;
    sub_10002C9B4();
    (*(void (**)(char *, _QWORD, uint64_t))(v22 + 104))(v24, enum case for DispatchQoS.QoSClass.default(_:), v21);
    v65 = static OS_dispatch_queue.global(qos:)(v24);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
    v30 = swift_allocObject(&unk_10007AC08, 24, 7);
    v31 = v30 + 16;
    v32 = v30;
    swift_beginAccess(v25, v79, 0, 0);
    v33 = swift_unknownObjectWeakLoadStrong(v25);
    swift_unknownObjectWeakInit(v31, v33);
    swift_unknownObjectRelease(v33);
    v34 = (_QWORD *)swift_allocObject(&unk_10007AC80, 120, 7);
    v34[2] = a13;
    v34[3] = a14;
    v60 = v17;
    v35 = v32;
    v37 = v68;
    v36 = v69;
    v34[4] = v32;
    v34[5] = v37;
    v38 = v75;
    v34[6] = v74;
    v34[7] = v38;
    v39 = v67;
    v34[8] = v36;
    v34[9] = v39;
    v40 = v70;
    v41 = v61;
    v34[10] = v70;
    v34[11] = v41;
    v42 = v62;
    v43 = v63;
    v34[12] = v62;
    v34[13] = v43;
    v44 = v64;
    v34[14] = v64;
    aBlock[4] = sub_10002CA4C;
    v78 = v34;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10002C984;
    aBlock[3] = &unk_10007AC98;
    v74 = (void (*)(_QWORD))_Block_copy(aBlock);
    v45 = v39;
    v46 = v35;
    swift_retain(v35);
    swift_retain(v37);
    swift_retain(v38);
    v47 = v36;
    sub_10002B39C(v40, v41);
    v48 = v42;
    v49 = swift_bridgeObjectRetain(v44);
    static DispatchQoS.unspecified.getter(v49);
    v76 = &_swiftEmptyArrayStorage;
    v50 = sub_10002CFD8();
    v51 = sub_100025D1C((uint64_t *)&unk_100091FB0);
    v52 = sub_10002C094();
    v53 = v60;
    v54 = v66;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v76, v51, v52, v66, v50);
    v55 = v74;
    v56 = (void *)v65;
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v20, v53, v74);
    _Block_release(v55);

    (*(void (**)(char *, uint64_t))(v73 + 8))(v53, v54);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v20, v72);
    v57 = v78;
    swift_release(v46);
    return swift_release(v57);
  }
}

uint64_t sub_10002C8E8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 48));
  swift_release(*(_QWORD *)(v0 + 56));

  sub_100028234(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 112));
  return swift_deallocObject(v0, 120, 7);
}

uint64_t sub_10002C944(uint64_t a1)
{
  uint64_t v1;

  return sub_10002C4F8(a1, *(_QWORD *)(v1 + 32), *(void (**)(_QWORD))(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(void **)(v1 + 64), *(void **)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(void **)(v1 + 96), *(_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10002C988(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002C998(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10002C9A0(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100028234(result, a2);
  return result;
}

unint64_t sub_10002C9B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091FA0;
  if (!qword_100091FA0)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100091FA0);
  }
  return result;
}

uint64_t sub_10002C9F0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 56));

  sub_100028234(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 112));
  return swift_deallocObject(v0, 120, 7);
}

void sub_10002CA4C()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t Strong;
  uint64_t v8;
  int v9;
  uint64_t v11;
  uint64_t v12;
  Class isa;
  uint64_t v14;
  Class v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t inited;
  unint64_t v20;
  unint64_t v21;
  void (*v22)(uint64_t *, _QWORD);
  _QWORD *v23;
  unint64_t v24;
  char v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  void *v34;
  NSString v35;
  id v36;
  void *v37;
  NSString v38;
  void (*v39)(uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43[24];
  char v44[24];
  char v45[104];
  uint64_t aBlock;
  unint64_t v47;
  void (*v48)(uint64_t, void *);
  void *v49;
  uint64_t (*v50)(uint64_t);
  _QWORD *v51;

  v41 = v0[2];
  v42 = v0[3];
  v1 = v0[5];
  v2 = (void *)v0[8];
  v39 = (void (*)(uint64_t))v0[6];
  v40 = v0[7];
  v3 = v0[9];
  v4 = v0[12];
  v5 = v0[13];
  v6 = v0[4] + 16;
  swift_beginAccess(v6, v44, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v6);
  if (Strong)
  {
    v8 = Strong;
    if (objc_msgSend((id)objc_opt_self(LAUtils), "isSharedIPad"))
    {
      swift_beginAccess(v1 + 16, v43, 0, 0);
      v9 = *(_DWORD *)(v1 + 16);
      if (v9 == -14 || v9 == -3)
      {
        v12 = v41;
        v11 = v42;
        goto LABEL_14;
      }
      if (v9)
      {
        v12 = v41;
        v11 = v42;
        goto LABEL_21;
      }
    }
    isa = Data._bridgeToObjectiveC()().super.isa;
    v14 = nullsub_12(v5);
    v15 = Dictionary._bridgeToObjectiveC()().super.isa;
    v16 = objc_msgSend(v2, "verifyPasswordUsingAKS:acmContext:userId:policy:options:bioLockoutRecovery:", v3, isa, v4, v14, v15, 0);

    if (v16 == (id)2)
    {
      (*(void (**)(uint64_t, uint64_t))(v42 + 56))(v41, v42);
      v26 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v42 + 8))(v41, v42);
      v31 = swift_allocObject(&unk_10007AC08, 24, 7);
      swift_unknownObjectWeakInit(v31 + 16, v8);
      v32 = (_QWORD *)swift_allocObject(&unk_10007ACD0, 56, 7);
      v32[2] = v41;
      v32[3] = v42;
      v32[4] = v31;
      v32[5] = v39;
      v32[6] = v40;
      v50 = sub_10002D4DC;
      v51 = v32;
      aBlock = (uint64_t)_NSConcreteStackBlock;
      v47 = 1107296256;
      v48 = sub_10002AD04;
      v49 = &unk_10007ACE8;
      v29 = _Block_copy(&aBlock);
      v33 = v51;
      swift_retain(v40);
      swift_release(v33);
      objc_msgSend(v26, "actionBackoffWithReply:", v29, v39, v40);
      goto LABEL_19;
    }
    v12 = v41;
    v11 = v42;
    if (v16 != (id)1)
    {
      if (!v16)
      {
        v17 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v42 + 8))(v41, v42);
        objc_msgSend(v17, "actionSuccess");
        swift_unknownObjectRelease(v17);
        v18 = sub_100025D1C(&qword_100090C40);
        inited = swift_initStackObject(v18, v45);
        *(_OWORD *)(inited + 16) = xmmword_10005FF40;
        aBlock = 0x746C75736552;
        v47 = 0xE600000000000000;
        AnyHashable.init<A>(_:)(&aBlock, &type metadata for String, &protocol witness table for String);
        v20 = sub_10002871C((uint64_t)&off_10007ABA8);
        *(_QWORD *)(inited + 96) = sub_100025D1C(&qword_100090C48);
        *(_QWORD *)(inited + 72) = v20;
        v21 = sub_100026D4C(inited);
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v42 + 48))(v21, v41, v42);
        swift_bridgeObjectRelease(v21);
        v39(1);
LABEL_26:
        swift_unknownObjectRelease(v8);
        return;
      }
LABEL_21:
      (*(void (**)(uint64_t, uint64_t))(v11 + 56))(v12, v11);
      v34 = (void *)objc_opt_self(LAErrorHelper);
      v35 = String._bridgeToObjectiveC()();
      v36 = objc_msgSend(v34, "internalErrorWithMessage:", v35);

      if (v36)
      {
        (*(void (**)(id, uint64_t, uint64_t))(v11 + 64))(v36, v12, v11);
LABEL_25:

        goto LABEL_26;
      }
      goto LABEL_29;
    }
LABEL_14:
    (*(void (**)(uint64_t, uint64_t))(v11 + 56))(v12, v11);
    v22 = (void (*)(uint64_t *, _QWORD))(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v11 + 40))(&aBlock, v12, v11);
    if (*v23 == -1)
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    ++*v23;
    v22(&aBlock, 0);
    v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 16))(v12, v11);
    if ((v25 & 1) == 0 && (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 24))(v12, v11) >= v24)
    {
      v37 = (void *)objc_opt_self(LAErrorHelper);
      v38 = String._bridgeToObjectiveC()();
      v36 = objc_msgSend(v37, "errorWithCode:message:", -1, v38);

      if (v36)
      {
        (*(void (**)(id, uint64_t, uint64_t))(v11 + 72))(v36, v12, v11);
        goto LABEL_25;
      }
LABEL_30:
      __break(1u);
      return;
    }
    v26 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v12, v11);
    v27 = swift_allocObject(&unk_10007AC08, 24, 7);
    swift_unknownObjectWeakInit(v27 + 16, v8);
    v28 = (_QWORD *)swift_allocObject(&unk_10007AD20, 56, 7);
    v28[2] = v12;
    v28[3] = v11;
    v28[4] = v27;
    v28[5] = v39;
    v28[6] = v40;
    v50 = sub_10002D518;
    v51 = v28;
    aBlock = (uint64_t)_NSConcreteStackBlock;
    v47 = 1107296256;
    v48 = sub_10002AD04;
    v49 = &unk_10007AD38;
    v29 = _Block_copy(&aBlock);
    v30 = v51;
    swift_retain(v40);
    swift_release(v30);
    objc_msgSend(v26, "actionFailureWithReply:", v29, v39, v40);
LABEL_19:
    _Block_release(v29);
    swift_unknownObjectRelease(v26);
    goto LABEL_26;
  }
}

unint64_t sub_10002CFD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000915D0;
  if (!qword_1000915D0)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_1000915D0);
  }
  return result;
}

uint64_t sub_10002D020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t Strong;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD aBlock[5];
  _QWORD *v37;
  char v38[24];

  v31 = a3;
  v32 = a6;
  v10 = type metadata accessor for DispatchWorkItemFlags(0);
  v35 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DispatchQoS(0);
  v33 = *(_QWORD *)(v13 - 8);
  v34 = v13;
  __chkstk_darwin(v13);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = a2 + 16;
  v17 = sub_10002C9B4();
  v18 = (void *)static OS_dispatch_queue.main.getter(v17);
  v19 = swift_allocObject(&unk_10007AC08, 24, 7);
  swift_beginAccess(v16, v38, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v16);
  swift_unknownObjectWeakInit(v19 + 16, Strong);
  swift_unknownObjectRelease(Strong);
  v21 = (_QWORD *)swift_allocObject(&unk_10007AD70, 64, 7);
  v22 = v32;
  v21[2] = a5;
  v21[3] = v22;
  v23 = v31;
  v21[4] = a1;
  v21[5] = v23;
  v21[6] = a4;
  v21[7] = v19;
  aBlock[4] = sub_10002D56C;
  v37 = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100027144;
  aBlock[3] = &unk_10007AD88;
  v24 = _Block_copy(aBlock);
  v25 = v37;
  swift_errorRetain(a1);
  swift_retain(a4);
  v26 = swift_release(v25);
  static DispatchQoS.unspecified.getter(v26);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v27 = sub_10002CFD8();
  v28 = sub_100025D1C((uint64_t *)&unk_100091FB0);
  v29 = sub_10002C094();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v28, v29, v10, v27);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v15, v12, v24);
  _Block_release(v24);

  (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v15, v34);
}

uint64_t sub_10002D270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t Strong;
  _QWORD *v25;
  void *v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD aBlock[5];
  _QWORD *v39;
  char v40[24];

  v12 = type metadata accessor for DispatchWorkItemFlags(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for DispatchQoS(0);
  result = __chkstk_darwin(v16);
  v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v33 = a3;
    v34 = v18;
    v21 = a2 + 16;
    v35 = result;
    sub_10002C9B4();
    v22 = swift_errorRetain(a1);
    v36 = static OS_dispatch_queue.main.getter(v22);
    v23 = swift_allocObject(&unk_10007AC08, 24, 7);
    v37 = v13;
    swift_beginAccess(v21, v40, 0, 0);
    Strong = swift_unknownObjectWeakLoadStrong(v21);
    swift_unknownObjectWeakInit(v23 + 16, Strong);
    swift_unknownObjectRelease(Strong);
    v25 = (_QWORD *)swift_allocObject(&unk_10007ADC0, 64, 7);
    v25[2] = a5;
    v25[3] = a6;
    v25[4] = v23;
    v25[5] = a1;
    v25[6] = v33;
    v25[7] = a4;
    aBlock[4] = sub_10002D668;
    v39 = v25;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100027144;
    aBlock[3] = &unk_10007ADD8;
    v26 = _Block_copy(aBlock);
    v27 = v39;
    swift_errorRetain(a1);
    swift_retain(a4);
    v28 = swift_release(v27);
    static DispatchQoS.unspecified.getter(v28);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v29 = sub_10002CFD8();
    v30 = sub_100025D1C((uint64_t *)&unk_100091FB0);
    v31 = sub_10002C094();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v30, v31, v12, v29);
    v32 = (void *)v36;
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v20, v15, v26);
    _Block_release(v26);

    swift_errorRelease(a1);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v15, v12);
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v20, v35);
  }
  return result;
}

uint64_t sub_10002D4DC(uint64_t a1)
{
  return sub_10002D524(a1, sub_10002D270);
}

uint64_t sub_10002D4EC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10002D518(uint64_t a1)
{
  return sub_10002D524(a1, sub_10002D020);
}

uint64_t sub_10002D524(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[4], v2[5], v2[6], v2[2], v2[3]);
}

uint64_t sub_10002D538()
{
  _QWORD *v0;

  swift_errorRelease(v0[4]);
  swift_release(v0[6]);
  swift_release(v0[7]);
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10002D56C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t (*v2)(_QWORD);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t Strong;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  _BYTE v10[24];

  v1 = v0[4];
  v2 = (uint64_t (*)(_QWORD))v0[5];
  if (!v1)
    return v2(0);
  v3 = v0[2];
  v4 = v0[3];
  v5 = v0[7] + 16;
  swift_beginAccess(v5, v10, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = Strong;
    v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 80);
    swift_errorRetain(v1);
    v8(v1, v3, v4);
    swift_unknownObjectRelease(v7);
  }
  else
  {
    swift_errorRetain(v1);
  }
  v2(0);
  return swift_errorRelease(v1);
}

uint64_t sub_10002D634()
{
  _QWORD *v0;

  swift_release(v0[4]);
  swift_errorRelease(v0[5]);
  swift_release(v0[7]);
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10002D668()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v5;
  uint64_t Strong;
  uint64_t v7;
  _BYTE v9[24];

  v1 = v0[2];
  v2 = v0[3];
  v3 = v0[5];
  v4 = (uint64_t (*)(_QWORD))v0[6];
  v5 = v0[4] + 16;
  swift_beginAccess(v5, v9, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = Strong;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 80))(v3, v1, v2);
    swift_unknownObjectRelease(v7);
  }
  return v4(0);
}

id sub_10002D774()
{
  char *v0;
  void *v1;
  objc_class *ObjectType;
  uint64_t *v3;
  void (*v4)(void *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType(v0);
  v3 = (uint64_t *)&v0[OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion];
  v4 = *(void (**)(void *))&v0[OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion];
  if (v4)
  {
    v5 = v3[1];
    swift_retain(v5);
    v4(v1);
    sub_100027EB8((uint64_t)v4, v5);
    v6 = *v3;
    v7 = v3[1];
    *v3 = 0;
    v3[1] = 0;
    sub_100027EB8(v6, v7);
  }
  v9.receiver = v1;
  v9.super_class = ObjectType;
  return objc_msgSendSuper2(&v9, "dealloc");
}

uint64_t sub_10002D8C0()
{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion);
  v2 = *(void (**)(uint64_t))(v0 + OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion);
  if (v2)
  {
    v3 = v1[1];
    swift_retain(v3);
    v2(v0);
    sub_100027EB8((uint64_t)v2, v3);
    v4 = *v1;
    v5 = v1[1];
    *v1 = 0;
    v1[1] = 0;
    return sub_100027EB8(v4, v5);
  }
  return result;
}

id sub_10002D930()
{
  return objc_msgSend((id)objc_opt_self(NSHashTable), "weakObjectsHashTable");
}

id sub_10002D9F8()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TerminationService()), "init");
  qword_100093B38 = (uint64_t)result;
  return result;
}

uint64_t *sub_10002DA24()
{
  if (qword_1000923D0 != -1)
    swift_once(&qword_1000923D0, sub_10002D9F8);
  return &qword_100093B38;
}

id sub_10002DA64()
{
  _BYTE v1[24];

  if (qword_1000923D0 != -1)
    swift_once(&qword_1000923D0, sub_10002D9F8);
  swift_beginAccess(&qword_100093B38, v1, 0, 0);
  return (id)qword_100093B38;
}

void sub_10002DB38(uint64_t a1)
{
  void *v2;
  _BYTE v3[24];

  if (qword_1000923D0 != -1)
    swift_once(&qword_1000923D0, sub_10002D9F8);
  swift_beginAccess(&qword_100093B38, v3, 1, 0);
  v2 = (void *)qword_100093B38;
  qword_100093B38 = a1;

}

uint64_t (*sub_10002DC24(uint64_t a1))(_QWORD)
{
  if (qword_1000923D0 != -1)
    swift_once(&qword_1000923D0, sub_10002D9F8);
  swift_beginAccess(&qword_100093B38, a1, 33, 0);
  return j__swift_endAccess;
}

id sub_10002DC90()
{
  uint64_t v0;

  *(_BYTE *)(v0 + OBJC_IVAR____TtC10CoreAuthUI18TerminationService_terminationScheduled) = 1;
  return sub_10002DCA4();
}

id sub_10002DCA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id result;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD aBlock[6];

  v1 = type metadata accessor for DispatchWorkItemFlags(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS.QoSClass(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI18TerminationService_assertions), "count");
  if (!result && *(_BYTE *)(v0 + OBJC_IVAR____TtC10CoreAuthUI18TerminationService_terminationScheduled) == 1)
  {
    sub_10002C9B4();
    (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for DispatchQoS.QoSClass.background(_:), v9);
    v19 = static OS_dispatch_queue.global(qos:)(v12);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    aBlock[4] = sub_10002E0A0;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10002C984;
    aBlock[3] = &unk_10007AE28;
    v14 = _Block_copy(aBlock);
    static DispatchQoS.unspecified.getter(v14);
    v20 = &_swiftEmptyArrayStorage;
    v15 = sub_10002CFD8();
    v16 = sub_100025D1C((uint64_t *)&unk_100091FB0);
    v17 = sub_10002C094();
    dispatch thunk of SetAlgebra.init<A>(_:)(&v20, v16, v17, v1, v15);
    v18 = (void *)v19;
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v4, v14);
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return result;
}

id sub_10002DF1C()
{
  uint64_t v0;
  uint64_t v1;
  objc_class *v2;
  char *v3;
  void (**v4)(uint64_t);
  id v5;
  objc_super v7;

  v1 = swift_allocObject(&unk_10007AE10, 24, 7);
  swift_unknownObjectWeakInit(v1 + 16, v0);
  v2 = (objc_class *)type metadata accessor for TerminateAssertion();
  v3 = (char *)objc_allocWithZone(v2);
  v4 = (void (**)(uint64_t))&v3[OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion];
  *v4 = sub_10002E010;
  v4[1] = (void (*)(uint64_t))v1;
  swift_retain_n(v1, 2);
  sub_100027EB8(0, 0);
  v7.receiver = v3;
  v7.super_class = v2;
  v5 = objc_msgSendSuper2(&v7, "init");
  swift_release_n(v1, 2);
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI18TerminationService_assertions), "addObject:", v5);
  return v5;
}

uint64_t sub_10002DFEC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10002E010(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  _BYTE v6[24];

  v3 = v1 + 16;
  swift_beginAccess(v3, v6, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    objc_msgSend(*(id *)(Strong + OBJC_IVAR____TtC10CoreAuthUI18TerminationService_assertions), "removeObject:", a1);
    sub_10002DCA4();

  }
}

uint64_t type metadata accessor for TerminateAssertion()
{
  return objc_opt_self(_TtC10CoreAuthUI18TerminateAssertion);
}

void sub_10002E0A0()
{
  exit(0);
}

uint64_t type metadata accessor for TerminationService()
{
  return objc_opt_self(_TtC10CoreAuthUI18TerminationService);
}

uint64_t sub_10002E0E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002E0F0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id sub_10002E100(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithWindowScene:", a1);

  return v3;
}

id sub_10002E140(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SecureWindow();
  v3 = objc_msgSendSuper2(&v5, "initWithWindowScene:", a1);

  return v3;
}

uint64_t type metadata accessor for SecureWindow()
{
  return objc_opt_self(_TtC10CoreAuthUI12SecureWindow);
}

id sub_10002E1F0(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), "initWithFrame:", a1, a2, a3, a4);
}

id sub_10002E240(double a1, double a2, double a3, double a4)
{
  void *v4;
  objc_super v10;

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for SecureWindow();
  return objc_msgSendSuper2(&v10, "initWithFrame:", a1, a2, a3, a4);
}

id sub_10002E30C(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SecureWindow();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_10002E39C(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), "initWithContentRect:", a1, a2, a3, a4);
}

id sub_10002E3EC(double a1, double a2, double a3, double a4)
{
  void *v4;
  objc_super v10;

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for SecureWindow();
  return objc_msgSendSuper2(&v10, "initWithContentRect:", a1, a2, a3, a4);
}

id sub_10002E4B8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecureWindow();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10002E4E8(unint64_t a1)
{
  if (a1 >= 7)
    return 2;
  else
    return (0x1000100010202uLL >> (8 * a1));
}

BOOL sub_10002E508(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_10002E518(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

Swift::Int sub_10002E53C(char a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

BOOL sub_10002E580(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10002E598()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10002E5DC()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10002E604(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_10002E648()
{
  unint64_t result;

  result = qword_1000920E0;
  if (!qword_1000920E0)
  {
    result = swift_getWitnessTable(&unk_1000602DC, &type metadata for AuthenticationFallbackMethod);
    atomic_store(result, (unint64_t *)&qword_1000920E0);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for AuthenticationFallbackMethod(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AuthenticationFallbackMethod(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AuthenticationFallbackMethod(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_10002E774 + 4 * byte_1000602D5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10002E7A8 + 4 * asc_1000602D0[v4]))();
}

uint64_t sub_10002E7A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002E7B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10002E7B8);
  return result;
}

uint64_t sub_10002E7C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10002E7CCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10002E7D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002E7D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002E7E4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10002E7EC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AuthenticationFallbackMethod()
{
  return &type metadata for AuthenticationFallbackMethod;
}

void *sub_10002E808()
{
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0
    && _CocoaArrayWrapper.endIndex.getter(&_swiftEmptyArrayStorage))
  {
    return (void *)sub_10002FBA8((uint64_t)&_swiftEmptyArrayStorage);
  }
  else
  {
    return &_swiftEmptySetSingleton;
  }
}

id sub_10002E84C(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  void *v6;
  char *v7;
  id v8;
  objc_super v10;

  v5 = (char *)objc_allocWithZone(v2);
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0
    && _CocoaArrayWrapper.endIndex.getter(&_swiftEmptyArrayStorage))
  {
    v6 = (void *)sub_10002FBA8((uint64_t)&_swiftEmptyArrayStorage);
  }
  else
  {
    v6 = &_swiftEmptySetSingleton;
  }
  *(_QWORD *)&v5[OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_cancellables] = v6;
  v7 = &v5[OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_viewModel];
  *(_QWORD *)v7 = a1;
  *((_QWORD *)v7 + 1) = a2;
  swift_unknownObjectRetain(a1);

  v10.receiver = v5;
  v10.super_class = v2;
  v8 = objc_msgSendSuper2(&v10, "initWithNibName:bundle:", 0, 0);
  swift_unknownObjectRelease(a1);
  return v8;
}

id sub_10002E918(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  objc_class *ObjectType;
  char *v7;
  void *v8;
  char *v9;
  id v10;
  objc_super v12;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType(v2);
  v7 = v3;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0
    && _CocoaArrayWrapper.endIndex.getter(&_swiftEmptyArrayStorage))
  {
    v8 = (void *)sub_10002FBA8((uint64_t)&_swiftEmptyArrayStorage);
  }
  else
  {
    v8 = &_swiftEmptySetSingleton;
  }
  *(_QWORD *)&v7[OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_cancellables] = v8;
  v9 = &v7[OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_viewModel];
  *(_QWORD *)v9 = a1;
  *((_QWORD *)v9 + 1) = a2;
  swift_unknownObjectRetain(a1);

  v12.receiver = v7;
  v12.super_class = ObjectType;
  v10 = objc_msgSendSuper2(&v12, "initWithNibName:bundle:", 0, 0);
  swift_unknownObjectRelease(a1);
  return v10;
}

void sub_10002E9EC()
{
  char *v0;
  void *v1;

  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0
    && _CocoaArrayWrapper.endIndex.getter(&_swiftEmptyArrayStorage))
  {
    v1 = (void *)sub_10002FBA8((uint64_t)&_swiftEmptyArrayStorage);
  }
  else
  {
    v1 = &_swiftEmptySetSingleton;
  }
  *(_QWORD *)&v0[OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_cancellables] = v1;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x6C706D6920746F4ELL, 0xEF6465746E656D65, "CoreAuthUI/RatchetCoolOffContentViewController.swift", 52, 2, 22, 0);
  __break(1u);
}

uint64_t sub_10002EB48()
{
  void *v0;
  id v1;
  void *v2;
  objc_super v4;

  v4.receiver = v0;
  v4.super_class = (Class)swift_getObjectType(v0);
  objc_msgSendSuper2(&v4, "viewDidLoad");
  v1 = objc_msgSend(v0, "interactivePopGestureRecognizer");
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "setEnabled:", 0);

  }
  objc_msgSend(v0, "setNavigationBarHidden:animated:", 1, 0);
  return sub_10002EBD4();
}

uint64_t sub_10002EBD4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t ObjectType;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[3];

  v44 = sub_100025D1C(&qword_100090F58);
  __chkstk_darwin(v44);
  v2 = (char *)&v38 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_100025D1C(&qword_100090F60);
  v3 = __chkstk_darwin(v39);
  v40 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v6 = (char *)&v38 - v5;
  v7 = sub_100025D1C(&qword_100090F68);
  v38 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_100025D1C(&qword_100090F70);
  v43 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100025D1C(&qword_100090F78);
  v13 = *(_QWORD *)(v12 - 8);
  v45 = v12;
  v46 = v13;
  __chkstk_darwin(v12);
  v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_viewModel + 8);
  ObjectType = swift_getObjectType(*(_QWORD *)(v0
                                             + OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_viewModel));
  v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 16))(ObjectType, v16);
  v47[0] = v18;
  v19 = sub_100025D1C(&qword_100090F80);
  v20 = sub_10002FF9C(&qword_100090F88, &qword_100090F80, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v21 = sub_10002C054(&qword_100090F90, type metadata accessor for RatchetCoolOffContentViewModelState, (uint64_t)&unk_100060668);
  Publisher<>.removeDuplicates()(v19, v20, v21);
  swift_release(v18);
  v22 = sub_10002FF9C(&qword_100090F98, &qword_100090F68, (uint64_t)&protocol conformance descriptor for Publishers.RemoveDuplicates<A>);
  Publisher.map<A>(_:)(sub_10002F2A0, 0, v7, v39, v22);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v9, v7);
  v23 = type metadata accessor for RatchetCoolOffContentViewModelState(0);
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56);
  v24(v6, 1, 1, v23);
  v25 = (uint64_t)v40;
  v24(v40, 1, 1, v23);
  v26 = v44;
  v27 = (uint64_t)&v2[*(int *)(v44 + 48)];
  sub_10002FE5C((uint64_t)v6, (uint64_t)v2);
  sub_10002FE5C(v25, v27);
  v28 = sub_10002FF9C(&qword_100090FA0, &qword_100090F70, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
  v29 = v41;
  Publisher.scan<A>(_:_:)(v2, sub_10002F2E4, 0, v41, v26, v28);
  sub_10002BD8C((uint64_t)v2, &qword_100090F58);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v29);
  v30 = swift_allocObject(&unk_10007AF28, 24, 7);
  v31 = v42;
  swift_unknownObjectWeakInit(v30 + 16, v42);
  v32 = swift_allocObject(&unk_10007AF50, 32, 7);
  *(_QWORD *)(v32 + 16) = sub_10002FEC8;
  *(_QWORD *)(v32 + 24) = v30;
  v33 = sub_10002FF9C(&qword_100090FA8, &qword_100090F78, (uint64_t)&protocol conformance descriptor for Publishers.Scan<A, B>);
  v34 = v45;
  v35 = Publisher<>.sink(receiveValue:)(sub_10002FF58, v32, v45, v33);
  swift_release(v32);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v15, v34);
  v36 = v31 + OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_cancellables;
  swift_beginAccess(v31 + OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_cancellables, v47, 33, 0);
  AnyCancellable.store(in:)(v36);
  swift_endAccess(v47);
  return swift_release(v35);
}

id sub_10002F0B4(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  uint64_t ObjCClassFromMetadata;
  uint64_t v4;

  ObjCClassFromMetadata = a2;
  if (!a1)
  {
    v4 = 0;
    if (!a2)
      return objc_msgSend(objc_allocWithZone(v2), "initWithNavigationBarClass:toolbarClass:", v4, ObjCClassFromMetadata);
    goto LABEL_3;
  }
  v4 = ((uint64_t (*)(void))swift_getObjCClassFromMetadata)();
  if (ObjCClassFromMetadata)
LABEL_3:
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata(ObjCClassFromMetadata);
  return objc_msgSend(objc_allocWithZone(v2), "initWithNavigationBarClass:toolbarClass:", v4, ObjCClassFromMetadata);
}

void sub_10002F118()
{
  _swift_stdlib_reportUnimplementedInitializer("CoreAuthUI.RatchetCoolOffContentViewController", 46, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
}

id sub_10002F170(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithRootViewController:", a1);

  return v3;
}

void sub_10002F1B0()
{
  _swift_stdlib_reportUnimplementedInitializer("CoreAuthUI.RatchetCoolOffContentViewController", 46, "init(rootViewController:)", 25, 0);
  __break(1u);
}

void sub_10002F20C()
{
  _swift_stdlib_reportUnimplementedInitializer("CoreAuthUI.RatchetCoolOffContentViewController", 46, "init(nibName:bundle:)", 21, 0);
  __break(1u);
}

uint64_t sub_10002F2A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  sub_10003009C(a1, a2);
  v3 = type metadata accessor for RatchetCoolOffContentViewModelState(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(a2, 0, 1, v3);
}

uint64_t sub_10002F2E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v6 = sub_100025D1C(&qword_100090F58);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(int *)(v7 + 48);
  v11 = a3 + v10;
  v12 = (uint64_t)&v9[v10];
  v13 = a1 + v10;
  sub_10002FFDC(a1, (uint64_t)v9);
  sub_10002FFDC(v13, v12);
  sub_10002FE5C(v12, a3);
  sub_10002FFDC(a2, v11);
  return sub_10002BD8C((uint64_t)v9, &qword_100090F60);
}

uint64_t sub_10002F3AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v22;
  _QWORD v23[6];

  v4 = sub_100025D1C(&qword_100090F60);
  v5 = __chkstk_darwin(v4);
  v6 = __chkstk_darwin(v5);
  v7 = __chkstk_darwin(v6);
  v8 = __chkstk_darwin(v7);
  __chkstk_darwin(v8);
  v10 = (char *)v23 - v9;
  v11 = sub_100025D1C(&qword_100090F58);
  __chkstk_darwin(v11);
  v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LACUIAuthCountdownConfiguration(0);
  v23[4] = *(_QWORD *)(v14 - 8);
  v23[5] = v14;
  v15 = __chkstk_darwin(v14);
  v23[2] = (char *)v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  __chkstk_darwin(v17);
  v23[1] = (char *)v23 - v18;
  v19 = (uint64_t)&v13[*(int *)(v11 + 48)];
  sub_10002FFDC(a1, (uint64_t)v13);
  sub_10002FFDC(a2, v19);
  v20 = type metadata accessor for RatchetCoolOffContentViewModelState(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 48))(v19, 1, v20) != 1)
  {
    sub_10002FFDC(v19, (uint64_t)v10);
    v22 = (char *)&loc_10002F5B8 + *((int *)qword_10002FA08 + swift_getEnumCaseMultiPayload(v10, v20));
    __asm { BR              X10 }
  }
  return sub_10002BD8C((uint64_t)v13, &qword_100090F58);
}

id sub_10002FA18(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, "didMoveToParentViewController:", a1);
}

id sub_10002FA38(void *a1)
{
  void *v1;

  objc_msgSend(a1, "addChildViewController:", v1);
  return objc_msgSend(v1, "willMoveToParentViewController:", a1);
}

uint64_t sub_10002FAD8(double a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_viewModel + 8);
  ObjectType = swift_getObjectType(*(_QWORD *)(v1
                                             + OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_viewModel));
  return (*(uint64_t (**)(uint64_t, uint64_t, double))(v3 + 24))(ObjectType, v3, a1);
}

uint64_t sub_10002FBA0()
{
  return 1;
}

uint64_t sub_10002FBA8(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = result;
  v2 = (unint64_t)result >> 62;
  if ((unint64_t)result >> 62)
  {
    if (result < 0)
      v6 = result;
    else
      v6 = result & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(result);
    v3 = _CocoaArrayWrapper.endIndex.getter(v6);
    result = swift_bridgeObjectRelease(v1);
    if (v3)
    {
LABEL_3:
      sub_100025D1C(&qword_100090FB8);
      result = static _SetStorage.allocate(capacity:)(v3);
      v4 = (_QWORD *)result;
      v23 = v1;
      if (!v2)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v3 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
  }
  v4 = &_swiftEmptySetSingleton;
  v23 = v1;
  if (!v2)
  {
LABEL_4:
    v5 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v5)
      return (uint64_t)v4;
    goto LABEL_15;
  }
LABEL_11:
  if (v1 < 0)
    v7 = v1;
  else
    v7 = v1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v1);
  v5 = _CocoaArrayWrapper.endIndex.getter(v7);
  result = swift_bridgeObjectRelease(v1);
  if (!v5)
    return (uint64_t)v4;
LABEL_15:
  v8 = 0;
  v9 = (char *)(v4 + 7);
  v22 = v5;
  while ((v23 & 0xC000000000000001) != 0)
  {
    result = specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v23);
    v10 = __OFADD__(v8++, 1);
    if (v10)
      goto LABEL_32;
LABEL_24:
    v24 = result;
    v26 = result;
    v11 = v4[5];
    v12 = type metadata accessor for AnyCancellable(0);
    v13 = sub_10002C054(&qword_100090FC0, (uint64_t (*)(uint64_t))&type metadata accessor for AnyCancellable, (uint64_t)&protocol conformance descriptor for AnyCancellable);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v11, v12, v13);
    v14 = -1 << *((_BYTE *)v4 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    v17 = *(_QWORD *)&v9[8 * (v15 >> 6)];
    v18 = 1 << v15;
    if (((1 << v15) & v17) != 0)
    {
      v19 = ~v14;
      sub_10002C054(&qword_100090FC8, (uint64_t (*)(uint64_t))&type metadata accessor for AnyCancellable, (uint64_t)&protocol conformance descriptor for AnyCancellable);
      do
      {
        v25 = *(_QWORD *)(v4[6] + 8 * v15);
        result = dispatch thunk of static Equatable.== infix(_:_:)(&v25, &v26);
        if ((result & 1) != 0)
        {
          result = swift_release(v24);
          v5 = v22;
          goto LABEL_17;
        }
        v15 = (v15 + 1) & v19;
        v16 = v15 >> 6;
        v17 = *(_QWORD *)&v9[8 * (v15 >> 6)];
        v18 = 1 << v15;
      }
      while ((v17 & (1 << v15)) != 0);
      v5 = v22;
    }
    *(_QWORD *)&v9[8 * v16] = v18 | v17;
    *(_QWORD *)(v4[6] + 8 * v15) = v24;
    v20 = v4[2];
    v10 = __OFADD__(v20, 1);
    v21 = v20 + 1;
    if (v10)
      goto LABEL_33;
    v4[2] = v21;
LABEL_17:
    if (v8 == v5)
      return (uint64_t)v4;
  }
  if (v8 >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_34;
  result = swift_retain(*(_QWORD *)(v23 + 32 + 8 * v8));
  v10 = __OFADD__(v8++, 1);
  if (!v10)
    goto LABEL_24;
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for RatchetCoolOffContentViewController()
{
  return objc_opt_self(_TtC10CoreAuthUI35RatchetCoolOffContentViewController);
}

uint64_t sub_10002FE5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100025D1C(&qword_100090F60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002FEA4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10002FEC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t Strong;
  void *v7;
  _BYTE v8[24];

  v5 = v2 + 16;
  swift_beginAccess(v5, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = (void *)Strong;
    sub_10002F3AC(a1, a2);

  }
}

uint64_t sub_10002FF34()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002FF58(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;

  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  v4 = sub_100025D1C(&qword_100090F58);
  return v3(a1, a1 + *(int *)(v4 + 48));
}

uint64_t sub_10002FF9C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10002C0E0(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002FFDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100025D1C(&qword_100090F60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100030024()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100090FB0;
  if (!qword_100090FB0)
  {
    v1 = objc_opt_self(UIViewController);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100090FB0);
  }
  return result;
}

uint64_t sub_100030060(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RatchetCoolOffContentViewModelState(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003009C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RatchetCoolOffContentViewModelState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1000300E0()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001DLL, 0x800000010006E250, "CoreAuthUI/RatchetCoolOffFactory.swift", 38, 2, 20, 0);
  __break(1u);
}

id sub_100030190(uint64_t a1, uint64_t a2)
{
  id v4;
  unint64_t v5;

  type metadata accessor for RatchetCoolOffContentViewModel(0);
  swift_bridgeObjectRetain(a1);
  swift_unknownObjectRetain(a2);
  v4 = sub_100036074(a1, a2);
  type metadata accessor for RatchetCoolOffContentViewController();
  v5 = sub_100030204();
  return sub_10002E84C((uint64_t)v4, v5);
}

unint64_t sub_100030204()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100090FD0;
  if (!qword_100090FD0)
  {
    v1 = type metadata accessor for RatchetCoolOffContentViewModel(255);
    result = swift_getWitnessTable(&unk_100060690, v1);
    atomic_store(result, (unint64_t *)&qword_100090FD0);
  }
  return result;
}

uint64_t type metadata accessor for RatchetCoolOffFactory()
{
  return objc_opt_self(_TtC10CoreAuthUI21RatchetCoolOffFactory);
}

id sub_10003031C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TransitionViewModel(0)), "init");
  qword_100093B40 = (uint64_t)result;
  return result;
}

uint64_t *sub_10003034C()
{
  if (qword_1000924E0 != -1)
    swift_once(&qword_1000924E0, sub_10003031C);
  return &qword_100093B40;
}

id sub_10003038C()
{
  if (qword_1000924E0 != -1)
    swift_once(&qword_1000924E0, sub_10003031C);
  return (id)qword_100093B40;
}

id sub_10003040C()
{
  return objc_msgSend((id)objc_opt_self(NSHashTable), "hashTableWithOptions:", 5);
}

id sub_100030484()
{
  uint64_t v0;
  id *v1;
  _BYTE v3[24];

  v1 = (id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates);
  swift_beginAccess(v0 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates, v3, 0, 0);
  return *v1;
}

void sub_100030524(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  _BYTE v5[24];

  v3 = (void **)(v1 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates);
  swift_beginAccess(v3, v5, 1, 0);
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_100030574(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates, a1, 33, 0);
  return j__swift_endAccess;
}

uint64_t sub_1000305B8(uint64_t a1)
{
  return sub_100030644(a1, &qword_100091008);
}

uint64_t sub_1000305C4()
{
  return sub_100030698((uint64_t)&unk_100060528, (uint64_t)&unk_100060550);
}

uint64_t sub_1000305D8(uint64_t a1)
{
  return sub_100030644(a1, &qword_100091070);
}

uint64_t sub_1000305E4()
{
  return sub_100030698((uint64_t)&unk_100060498, (uint64_t)&unk_1000604C0);
}

uint64_t sub_1000305F8(uint64_t a1)
{
  return sub_100030644(a1, &qword_100091078);
}

uint64_t sub_100030604()
{
  return sub_100030698((uint64_t)&unk_100060450, (uint64_t)&unk_100060478);
}

uint64_t sub_100030618(uint64_t a1)
{
  return sub_100030644(a1, &qword_1000910E0);
}

uint64_t sub_100030624()
{
  return sub_100030698((uint64_t)&unk_1000604E0, (uint64_t)&unk_100060508);
}

uint64_t sub_100030638(uint64_t a1)
{
  return sub_100030644(a1, &qword_1000910E8);
}

uint64_t sub_100030644(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = a1;
  v2 = sub_100025D1C(a2);
  return Published.init(initialValue:)(&v4, v2);
}

uint64_t sub_100030684()
{
  return sub_100030698((uint64_t)&unk_100060408, (uint64_t)&unk_100060430);
}

uint64_t sub_100030698(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v7;

  v4 = ((uint64_t (*)(void))swift_getKeyPath)();
  KeyPath = swift_getKeyPath(a2);
  static Published.subscript.getter(&v7, v2, v4, KeyPath);
  swift_release(v4);
  swift_release(KeyPath);
  return v7;
}

uint64_t sub_100030700(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v4;
  char v5;

  v4 = a1;
  v5 = a2 & 1;
  v2 = sub_100025D1C(&qword_1000910F0);
  return Published.init(initialValue:)(&v4, v2);
}

uint64_t sub_10003074C()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100060578);
  v2 = swift_getKeyPath(&unk_1000605A0);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_1000307C0()
{
  return 0;
}

uint64_t sub_1000307CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(unsigned __int8 *, _QWORD *);
  uint64_t v5;
  _QWORD v7[2];

  if (a1)
  {
    v3 = a1;
    a1 = swift_allocObject(&unk_10007AF78, 32, 7);
    *(_QWORD *)(a1 + 16) = v3;
    *(_QWORD *)(a1 + 24) = a2;
    v4 = sub_100030918;
  }
  else
  {
    v4 = 0;
  }
  v7[0] = v4;
  v7[1] = a1;
  v5 = sub_100025D1C(&qword_1000910F8);
  return Published.init(initialValue:)(v7, v5);
}

uint64_t (*sub_10003084C())()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];

  KeyPath = swift_getKeyPath(&unk_1000605C0);
  v2 = swift_getKeyPath(&unk_1000605E8);
  static Published.subscript.getter(v7, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  v3 = v7[0];
  if (!v7[0])
    return 0;
  v4 = v7[1];
  v5 = swift_allocObject(&unk_10007B268, 32, 7);
  *(_QWORD *)(v5 + 16) = v3;
  *(_QWORD *)(v5 + 24) = v4;
  return sub_100035024;
}

uint64_t sub_1000308F4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100030918(unsigned __int8 *a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
}

void *sub_100030940()
{
  return &_swiftEmptySetSingleton;
}

id sub_10003094C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  _QWORD *v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  objc_class *ObjectType;
  objc_super v60;
  uint64_t v61;
  uint64_t v62;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType(v0);
  v2 = sub_100025D1C((uint64_t *)&unk_100091140);
  v57 = *(_QWORD *)(v2 - 8);
  v58 = v2;
  __chkstk_darwin(v2);
  v56 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100025D1C(&qword_100091138);
  v54 = *(_QWORD *)(v4 - 8);
  v55 = v4;
  __chkstk_darwin(v4);
  v53 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100025D1C(&qword_100091130);
  v51 = *(_QWORD *)(v6 - 8);
  v52 = v6;
  __chkstk_darwin(v6);
  v50 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100025D1C(&qword_100091128);
  v48 = *(_QWORD *)(v8 - 8);
  v49 = v8;
  __chkstk_darwin(v8);
  v47 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100025D1C(&qword_100091120);
  v45 = *(_QWORD *)(v10 - 8);
  v46 = v10;
  __chkstk_darwin(v10);
  v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = sub_100025D1C(&qword_100091118);
  v13 = *(_QWORD *)(v44 - 8);
  __chkstk_darwin(v44);
  v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_100025D1C(&qword_100091110);
  v17 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v19 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates;
  v21 = (void *)objc_opt_self(NSHashTable);
  v22 = v1;
  *(_QWORD *)&v1[v20] = objc_msgSend(v21, "hashTableWithOptions:", 5);
  v23 = &v22[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__connection];
  v61 = 0;
  v24 = sub_100025D1C(&qword_100091008);
  Published.init(initialValue:)(&v61, v24);
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v23, v19, v16);
  v25 = &v22[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__remoteUIHost];
  v61 = 0;
  v26 = sub_100025D1C(&qword_100091070);
  Published.init(initialValue:)(&v61, v26);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v25, v15, v44);
  v27 = &v22[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__mechanism];
  v61 = 0;
  v28 = sub_100025D1C(&qword_100091078);
  Published.init(initialValue:)(&v61, v28);
  (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v27, v12, v46);
  v29 = &v22[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__backoffCounter];
  v61 = 0;
  v30 = sub_100025D1C(&qword_1000910E0);
  v31 = v47;
  Published.init(initialValue:)(&v61, v30);
  (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v29, v31, v49);
  v32 = &v22[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__internalInfo];
  v61 = 0;
  v33 = sub_100025D1C(&qword_1000910E8);
  v34 = v50;
  Published.init(initialValue:)(&v61, v33);
  (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v32, v34, v52);
  v35 = &v22[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__controllerToShow];
  v61 = 0;
  LOBYTE(v62) = 1;
  v36 = sub_100025D1C(&qword_1000910F0);
  v37 = v53;
  Published.init(initialValue:)(&v61, v36);
  (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v35, v37, v55);
  v38 = &v22[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__completionHandler];
  v61 = 0;
  v62 = 0;
  v39 = sub_100025D1C(&qword_1000910F8);
  v40 = v56;
  Published.init(initialValue:)(&v61, v39);
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v38, v40, v58);
  *(_QWORD *)&v22[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_disposeBag] = &_swiftEmptySetSingleton;
  v41 = sub_1000419B8();
  sub_1000419D0(*v41);

  v60.receiver = v22;
  v60.super_class = ObjectType;
  return objc_msgSendSuper2(&v60, "init");
}

char *sub_100030DD4(unint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSDictionary v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  Swift::String v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  Swift::String v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  char *v41;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  __objc2_class *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  Class isa;
  char v53;
  char v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  _DWORD *v62;
  _DWORD *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  os_log_type_t v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint32_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  _QWORD v85[4];
  uint64_t v86;
  uint64_t v87;

  v4 = v3;
  KeyPath = swift_getKeyPath(&unk_100060408);
  v9 = swift_getKeyPath(&unk_100060430);
  static Published.subscript.getter(&v84, v4, KeyPath, v9);
  swift_release(KeyPath);
  swift_release(v9);
  v10 = (uint64_t)v84;
  if (v84)
  {
    v11 = swift_getKeyPath(&unk_100060450);
    v12 = swift_getKeyPath(&unk_100060478);
    static Published.subscript.getter(&v84, v4, v11, v12);
    swift_release(v11);
    swift_release(v12);
    v13 = v84;
    if (v84)
    {
      v14 = swift_getKeyPath(&unk_100060498);
      v15 = swift_getKeyPath(&unk_1000604C0);
      static Published.subscript.getter(&v84, v4, v14, v15);
      swift_release(v14);
      swift_release(v15);
      v16 = v84;
      if (v84)
      {
        switch(a2)
        {
          case 1:
            switch(a1)
            {
              case 0uLL:
              case 2uLL:
              case 4uLL:
                v17.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
                swift_bridgeObjectRelease(v10);
                v18 = swift_getKeyPath(&unk_1000604E0);
                v19 = swift_getKeyPath(&unk_100060508);
                static Published.subscript.getter(&v84, v4, v18, v19);
                swift_release(v18);
                swift_release(v19);
                v20 = v84;
                v21 = sub_100010340(v17.super.isa, v13, v84, v16, a3 & 1);
                goto LABEL_35;
              case 3uLL:
                type metadata accessor for BiometryCompanionViewController(0);
                v78 = swift_getKeyPath(&unk_1000604E0);
                v79 = swift_getKeyPath(&unk_100060508);
                static Published.subscript.getter(&v84, v4, v78, v79);
                swift_release(v78);
                swift_release(v79);
                v41 = (char *)sub_100027334(v10, (uint64_t)v13, (uint64_t)v84, (uint64_t)v16, a3 & 1);
                v80 = &v41[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType];
                swift_beginAccess(&v41[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType], &v84, 1, 0);
                *(_QWORD *)v80 = 1;
                return v41;
              case 5uLL:
                goto LABEL_43;
              default:
                v74 = swift_bridgeObjectRelease(v10);
                v59 = Logger.logObject.getter(v74);
                v60 = static os_log_type_t.error.getter();
                if (!os_log_type_enabled(v59, v60))
                  goto LABEL_51;
                v61 = (uint8_t *)swift_slowAlloc(12, -1);
                *(_DWORD *)v61 = 134217984;
                v84 = (void *)a1;
                UnsafeMutableRawBufferPointer.copyMemory(from:)(&v84, v85, v61 + 4, v61 + 12);
                v66 = "Unsupported SBUIRemoteAlertViewControllerPresentationMode %ld";
                goto LABEL_49;
            }
          case 2:
            v85[2] = &type metadata for FeatureFlags.LocalAuthentication;
            v85[3] = sub_100034494();
            v53 = isFeatureEnabled(_:)(&v84);
            sub_1000279FC(&v84);
            if ((v53 & 1) != 0)
            {
              switch(a1)
              {
                case 0uLL:
                case 2uLL:
                  goto LABEL_34;
                case 3uLL:
                  type metadata accessor for ComplementaryPasscodeViewController();
                  v82 = swift_getKeyPath(&unk_1000604E0);
                  v83 = swift_getKeyPath(&unk_100060508);
                  static Published.subscript.getter(&v84, v4, v82, v83);
                  swift_release(v82);
                  swift_release(v83);
                  return (char *)sub_100027334(v10, (uint64_t)v13, (uint64_t)v84, (uint64_t)v16, a3 & 1);
                case 4uLL:
                case 5uLL:
                  v81 = swift_bridgeObjectRelease(v10);
                  v59 = Logger.logObject.getter(v81);
                  v68 = static os_log_type_t.info.getter();
                  if (!os_log_type_enabled(v59, v68))
                    goto LABEL_51;
                  v61 = (uint8_t *)swift_slowAlloc(2, -1);
                  *(_WORD *)v61 = 0;
                  v66 = "We present passcode view controller on primary display only";
                  goto LABEL_58;
                default:
                  goto LABEL_47;
              }
            }
            if (!v55 & v54)
              goto LABEL_47;
            if (((1 << a1) & 0x15) != 0)
            {
LABEL_34:
              v17.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease(v10);
              v56 = swift_getKeyPath(&unk_1000604E0);
              v57 = swift_getKeyPath(&unk_100060508);
              static Published.subscript.getter(&v84, v4, v56, v57);
              swift_release(v56);
              swift_release(v57);
              v20 = v84;
              v21 = sub_10001A9CC(v17.super.isa, v13, v84, v16, a3 & 1);
LABEL_35:
              v41 = (char *)v21;

              swift_unknownObjectRelease(v20);
              swift_unknownObjectRelease(v16);
              swift_unknownObjectRelease(v13);
              return v41;
            }
            if (((1 << a1) & 0x28) == 0)
              goto LABEL_47;
            v67 = swift_bridgeObjectRelease(v10);
            v59 = Logger.logObject.getter(v67);
            v68 = static os_log_type_t.info.getter();
            if (!os_log_type_enabled(v59, v68))
              goto LABEL_51;
            v61 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v61 = 0;
            v66 = "newDevicePasscodeAlert feature flag is disabled, showing old passcode on device display only";
LABEL_58:
            v70 = v59;
            v71 = v68;
            v72 = v61;
            v73 = 2;
            goto LABEL_50;
          case 3:
            if (a1 > 5)
              goto LABEL_47;
            if (((1 << a1) & 0x15) != 0)
            {
              v43 = swift_getKeyPath(&unk_1000604E0);
              v44 = swift_getKeyPath(&unk_100060508);
              static Published.subscript.getter(&v84, v4, v43, v44);
              swift_release(v43);
              swift_release(v44);
              v45 = v84;
              v46 = PinViewController;
              goto LABEL_29;
            }
            if (((1 << a1) & 0x28) == 0)
              goto LABEL_47;
            v58 = swift_bridgeObjectRelease(v10);
            v59 = Logger.logObject.getter(v58);
            v60 = static os_log_type_t.debug.getter();
            if (!os_log_type_enabled(v59, v60))
              goto LABEL_51;
            v61 = (uint8_t *)swift_slowAlloc(12, -1);
            *(_DWORD *)v61 = 134349056;
            v62 = v61 + 12;
            v63 = v61 + 4;
            v64 = 3;
            goto LABEL_42;
          case 4:
            if (a1 > 5)
              goto LABEL_47;
            if (((1 << a1) & 0x15) != 0)
            {
              v47 = swift_getKeyPath(&unk_1000604E0);
              v48 = swift_getKeyPath(&unk_100060508);
              static Published.subscript.getter(&v84, v4, v47, v48);
              swift_release(v47);
              swift_release(v48);
              v45 = v84;
              v46 = PasswordViewController;
LABEL_29:
              v51 = objc_allocWithZone((Class)v46);
              isa = Dictionary._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease(v10);
              v41 = (char *)objc_msgSend(v51, "initWithInternalInfo:mechanism:backoffCounter:remoteUIHost:allowsLandscape:", isa, v13, v45, v16, a3 & 1);

              swift_unknownObjectRelease(v13);
              swift_unknownObjectRelease(v45);
              swift_unknownObjectRelease(v16);
              return v41;
            }
            if (((1 << a1) & 0x28) != 0)
            {
              v65 = swift_bridgeObjectRelease(v10);
              v59 = Logger.logObject.getter(v65);
              v60 = static os_log_type_t.debug.getter();
              if (os_log_type_enabled(v59, v60))
              {
                v61 = (uint8_t *)swift_slowAlloc(12, -1);
                *(_DWORD *)v61 = 134349056;
                v62 = v61 + 12;
                v63 = v61 + 4;
                v64 = 4;
LABEL_42:
                v84 = (void *)v64;
                UnsafeMutableRawBufferPointer.copyMemory(from:)(&v84, v85, v63, v62);
                v66 = "We do not support showing content on external display for this type %{public}ld";
                goto LABEL_49;
              }
            }
            else
            {
LABEL_47:
              v69 = swift_bridgeObjectRelease(v10);
              v59 = Logger.logObject.getter(v69);
              v60 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v59, v60))
              {
                v61 = (uint8_t *)swift_slowAlloc(12, -1);
                *(_DWORD *)v61 = 134349056;
                v84 = (void *)a1;
                UnsafeMutableRawBufferPointer.copyMemory(from:)(&v84, v85, v61 + 4, v61 + 12);
                v66 = "Unsupported SBUIRemoteAlertViewControllerPresentationMode %{public}ld";
LABEL_49:
                v70 = v59;
                v71 = v60;
                v72 = v61;
                v73 = 12;
LABEL_50:
                _os_log_impl((void *)&_mh_execute_header, v70, v71, v66, v72, v73);
                swift_slowDealloc(v61, -1, -1);
              }
            }
LABEL_51:

            swift_unknownObjectRelease(v16);
            swift_unknownObjectRelease(v13);
            return 0;
          case 5:
            switch(a1)
            {
              case 0uLL:
              case 2uLL:
              case 4uLL:
                v49 = swift_getKeyPath(&unk_1000604E0);
                v50 = swift_getKeyPath(&unk_100060508);
                static Published.subscript.getter(&v84, v4, v49, v50);
                swift_release(v49);
                swift_release(v50);
                v45 = v84;
                v46 = FaceIdViewController;
                goto LABEL_29;
              case 3uLL:
                type metadata accessor for BiometryCompanionViewController(0);
                v75 = swift_getKeyPath(&unk_1000604E0);
                v76 = swift_getKeyPath(&unk_100060508);
                static Published.subscript.getter(&v84, v4, v75, v76);
                swift_release(v75);
                swift_release(v76);
                v41 = (char *)sub_100027334(v10, (uint64_t)v13, (uint64_t)v84, (uint64_t)v16, a3 & 1);
                v77 = &v41[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType];
                swift_beginAccess(&v41[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType], &v84, 1, 0);
                *(_QWORD *)v77 = 2;
                break;
              case 5uLL:
LABEL_43:
                swift_bridgeObjectRelease(v10);
                swift_unknownObjectRelease(v13);
                swift_unknownObjectRelease(v16);
                return 0;
              default:
                goto LABEL_47;
            }
            return v41;
          default:
            goto LABEL_47;
        }
      }
      swift_bridgeObjectRelease(v10);
      swift_unknownObjectRelease(v13);
    }
    else
    {
      swift_bridgeObjectRelease(v10);
    }
  }
  v84 = 0;
  v85[0] = 0xE000000000000000;
  v22 = swift_getKeyPath(&unk_100060408);
  v23 = swift_getKeyPath(&unk_100060430);
  static Published.subscript.getter(&v87, v4, v22, v23);
  swift_release(v22);
  swift_release(v23);
  v24 = v87;
  swift_bridgeObjectRelease(v87);
  if (!v24)
  {
    v25._countAndFlagsBits = 0x6C616E7265746E69;
    v25._object = (void *)0xEC0000006F666E49;
    String.append(_:)(v25);
  }
  v26 = swift_getKeyPath(&unk_100060450);
  v27 = swift_getKeyPath(&unk_100060478);
  static Published.subscript.getter(&v87, v4, v26, v27);
  swift_release(v26);
  swift_release(v27);
  v28 = v87;
  swift_unknownObjectRelease(v87);
  if (!v28)
  {
    v29._countAndFlagsBits = 0x696E616863656D20;
    v29._object = (void *)0xEA00000000006D73;
    String.append(_:)(v29);
  }
  v30 = swift_getKeyPath(&unk_100060498);
  v31 = swift_getKeyPath(&unk_1000604C0);
  static Published.subscript.getter(&v87, v4, v30, v31);
  swift_release(v30);
  swift_release(v31);
  v32 = v87;
  swift_unknownObjectRelease(v87);
  if (!v32)
  {
    v33._countAndFlagsBits = 0x5565746F6D657220;
    v33._object = (void *)0xED000074736F4849;
    String.append(_:)(v33);
  }
  v35 = (uint64_t)v84;
  v34 = v85[0];
  v36 = swift_bridgeObjectRetain(v85[0]);
  v37 = Logger.logObject.getter(v36);
  v38 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc(12, -1);
    v40 = swift_slowAlloc(32, -1);
    v87 = v40;
    *(_DWORD *)v39 = 136315138;
    swift_bridgeObjectRetain(v34);
    v86 = sub_10002B3E0(v35, v34, &v87);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87, v39 + 4, v39 + 12);
    swift_bridgeObjectRelease_n(v34, 3);
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "Missing needed informations: %s", v39, 0xCu);
    swift_arrayDestroy(v40, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v40, -1, -1);
    swift_slowDealloc(v39, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(v34, 2);
  }

  return 0;
}

uint64_t sub_100031BCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  void (*v83)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  char *v118;
  char *v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  char *v129;
  char *v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  char *v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  id v149;

  v1 = v0;
  v2 = sub_100025D1C(&qword_1000911C8);
  __chkstk_darwin(v2);
  v145 = (char *)&v103 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for NSRunLoop.SchedulerTimeType.Stride(0);
  v146 = *(_QWORD *)(v4 - 8);
  v147 = v4;
  __chkstk_darwin(v4);
  v144 = (char *)&v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v143 = (id)sub_100025D1C(&qword_1000911D0);
  __chkstk_darwin(v143);
  v138 = (char *)&v103 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100025D1C(&qword_1000911D8);
  v8 = *(_QWORD *)(v7 - 8);
  v134 = v7;
  v135 = v8;
  __chkstk_darwin(v7);
  v129 = (char *)&v103 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v142 = sub_100025D1C(&qword_1000911E0);
  __chkstk_darwin(v142);
  v130 = (char *)&v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = sub_100025D1C(&qword_1000911E8);
  v127 = *(_QWORD *)(v123 - 8);
  __chkstk_darwin(v123);
  v118 = (char *)&v103 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v137 = sub_100025D1C(&qword_1000911F0);
  __chkstk_darwin(v137);
  v120 = (char *)&v103 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v116 = sub_100025D1C(&qword_1000911F8);
  __chkstk_darwin(v116);
  v114 = (char *)&v103 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = sub_100025D1C(&qword_100091200);
  v112 = *(_QWORD *)(v110 - 8);
  __chkstk_darwin(v110);
  v15 = (char *)&v103 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = sub_100025D1C(&qword_100091208);
  __chkstk_darwin(v115);
  v109 = (char *)&v103 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100025D1C(&qword_100091210);
  v106 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v19 = (char *)&v103 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = sub_100025D1C(&qword_100091218);
  __chkstk_darwin(v113);
  v105 = (char *)&v103 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_100025D1C(&qword_100091220);
  v22 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v24 = (char *)&v103 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = sub_100025D1C(&qword_100091228);
  __chkstk_darwin(v111);
  v104 = (char *)&v103 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = sub_100025D1C(&qword_100091230);
  __chkstk_darwin(v121);
  v108 = (char *)&v103 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v122 = sub_100025D1C(&qword_100091238);
  v124 = *(_QWORD *)(v122 - 8);
  __chkstk_darwin(v122);
  v117 = (char *)&v103 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v125 = sub_100025D1C(&qword_100091240);
  v126 = *(_QWORD *)(v125 - 8);
  __chkstk_darwin(v125);
  v119 = (char *)&v103 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v131 = sub_100025D1C(&qword_100091248);
  v133 = *(_QWORD *)(v131 - 8);
  __chkstk_darwin(v131);
  v148 = (char *)&v103 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v136 = sub_100025D1C(&qword_100091250);
  v139 = *(_QWORD *)(v136 - 8);
  __chkstk_darwin(v136);
  v128 = (char *)&v103 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_100025D1C(&qword_100091258);
  v32 = *(_QWORD *)(v31 - 8);
  v140 = v31;
  v141 = v32;
  __chkstk_darwin(v31);
  v132 = (char *)&v103 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess(v0 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__connection, &v149, 33, 0);
  v34 = sub_100025D1C(&qword_100091110);
  Published.projectedValue.getter(v34);
  swift_endAccess(&v149);
  v35 = sub_1000287F0(0, &qword_100091260, NSXPCConnection_ptr);
  v36 = sub_10002FF9C(&qword_100091268, &qword_100091220, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  Publisher.compactMap<A>(_:)(sub_100032A3C, 0, v21, v35, v36);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  swift_beginAccess(v1 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__remoteUIHost, &v149, 33, 0);
  v37 = sub_100025D1C(&qword_100091118);
  Published.projectedValue.getter(v37);
  swift_endAccess(&v149);
  v38 = sub_100025D1C(&qword_100091108);
  v39 = sub_10002FF9C(&qword_100091270, &qword_100091210, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  v40 = v105;
  Publisher.compactMap<A>(_:)(sub_1000354DC, 0, v17, v38, v39);
  (*(void (**)(char *, uint64_t))(v106 + 8))(v19, v17);
  swift_beginAccess(v1 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__mechanism, &v149, 33, 0);
  v41 = sub_100025D1C(&qword_100091120);
  Published.projectedValue.getter(v41);
  swift_endAccess(&v149);
  v42 = sub_100025D1C(&qword_100091278);
  v43 = sub_10002FF9C(&qword_100091280, &qword_100091200, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  v44 = v109;
  v45 = v110;
  Publisher.compactMap<A>(_:)(sub_100032A48, 0, v110, v42, v43);
  (*(void (**)(char *, uint64_t))(v112 + 8))(v15, v45);
  swift_beginAccess(v1 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__backoffCounter, &v149, 33, 0);
  v46 = sub_100025D1C(&qword_100091128);
  v47 = v114;
  Published.projectedValue.getter(v46);
  swift_endAccess(&v149);
  v48 = sub_10002FF9C(&qword_100091288, &qword_100091228, (uint64_t)&protocol conformance descriptor for Publishers.CompactMap<A, B>);
  v49 = sub_10002FF9C(&qword_100091290, &qword_100091218, (uint64_t)&protocol conformance descriptor for Publishers.CompactMap<A, B>);
  v50 = sub_10002FF9C(&qword_100091298, &qword_100091208, (uint64_t)&protocol conformance descriptor for Publishers.CompactMap<A, B>);
  v51 = sub_10002FF9C((unint64_t *)&unk_1000912A0, &qword_1000911F8, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  v52 = v108;
  Publishers.CombineLatest4.init(_:_:_:_:)(v104, v40, v44, v47, v111, v113, v115, v116, v48, v49, v50, v51);
  swift_beginAccess(v1 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__internalInfo, &v149, 33, 0);
  v53 = sub_100025D1C(&qword_100091130);
  v54 = v118;
  Published.projectedValue.getter(v53);
  swift_endAccess(&v149);
  v55 = sub_100025D1C(&qword_100090C38);
  v56 = sub_10002FF9C(&qword_1000912B0, &qword_1000911E8, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  v57 = v120;
  v58 = v123;
  Publisher.compactMap<A>(_:)(sub_100032A54, 0, v123, v55, v56);
  (*(void (**)(char *, uint64_t))(v127 + 8))(v54, v58);
  v59 = v1;
  v107 = v1;
  swift_beginAccess(v1 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__controllerToShow, &v149, 33, 0);
  v60 = sub_100025D1C(&qword_100091138);
  v61 = v129;
  Published.projectedValue.getter(v60);
  swift_endAccess(&v149);
  type metadata accessor for LARemoteUIController();
  v63 = v62;
  v64 = sub_10002FF9C(&qword_1000912B8, &qword_1000911D8, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  v65 = v130;
  v66 = v134;
  Publisher.compactMap<A>(_:)(sub_100032A60, 0, v134, v63, v64);
  (*(void (**)(char *, uint64_t))(v135 + 8))(v61, v66);
  swift_beginAccess(v59 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__completionHandler, &v149, 33, 0);
  v67 = sub_100025D1C((uint64_t *)&unk_100091140);
  v68 = v138;
  Published.projectedValue.getter(v67);
  swift_endAccess(&v149);
  v69 = sub_10002FF9C(&qword_1000912C0, &qword_100091230, (uint64_t)&protocol conformance descriptor for Publishers.CombineLatest4<A, B, C, D>);
  v70 = sub_10002FF9C(&qword_1000912C8, &qword_1000911F0, (uint64_t)&protocol conformance descriptor for Publishers.CompactMap<A, B>);
  v71 = sub_10002FF9C(&qword_1000912D0, &qword_1000911E0, (uint64_t)&protocol conformance descriptor for Publishers.CompactMap<A, B>);
  v72 = sub_10002FF9C(&qword_1000912D8, &qword_1000911D0, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
  v102 = v70;
  v73 = v117;
  Publishers.CombineLatest4.init(_:_:_:_:)(v52, v57, v65, v68, v121, v137, v142, v143, v69, v102, v71, v72);
  v74 = sub_100025D1C(&qword_1000912E0);
  v75 = sub_10002FF9C(&qword_1000912E8, &qword_100091238, (uint64_t)&protocol conformance descriptor for Publishers.CombineLatest4<A, B, C, D>);
  v76 = v119;
  v77 = v122;
  Publisher.map<A>(_:)(sub_100032A74, 0, v122, v74, v75);
  (*(void (**)(char *, uint64_t))(v124 + 8))(v73, v77);
  v78 = sub_100025D1C(&qword_1000912F0);
  v79 = v125;
  Publishers.Map.map<A>(_:)(sub_100032AE8, 0, v125, v78);
  v80 = (*(uint64_t (**)(char *, uint64_t))(v126 + 8))(v76, v79);
  v81 = v144;
  NSRunLoop.SchedulerTimeType.Stride.init(floatLiteral:)(v80, 0.1);
  v143 = (id)objc_opt_self(NSRunLoop);
  v149 = objc_msgSend(v143, "mainRunLoop");
  v82 = type metadata accessor for NSRunLoop.SchedulerOptions(0);
  v83 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v82 - 8) + 56);
  v84 = (uint64_t)v145;
  v83(v145, 1, 1, v82);
  v85 = sub_1000287F0(0, &qword_1000912F8, NSRunLoop_ptr);
  v86 = sub_10002FF9C(&qword_100091300, &qword_100091248, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
  v87 = sub_1000350BC();
  v88 = v128;
  v89 = v131;
  v90 = v86;
  v91 = v148;
  Publisher.debounce<A>(for:scheduler:options:)(v81, &v149, v84, v131, v85, v90, v87);
  sub_10002BD8C(v84, &qword_1000911C8);

  (*(void (**)(char *, uint64_t))(v146 + 8))(v81, v147);
  (*(void (**)(char *, uint64_t))(v133 + 8))(v91, v89);
  v149 = objc_msgSend(v143, "mainRunLoop");
  v83((char *)v84, 1, 1, v82);
  v92 = sub_10002FF9C(&qword_100091310, &qword_100091250, (uint64_t)&protocol conformance descriptor for Publishers.Debounce<A, B>);
  v93 = v132;
  v94 = v136;
  Publisher.receive<A>(on:options:)(&v149, v84, v136, v85, v92, v87);
  sub_10002BD8C(v84, &qword_1000911C8);

  (*(void (**)(char *, uint64_t))(v139 + 8))(v88, v94);
  v95 = swift_allocObject(&unk_10007AFA0, 24, 7);
  v96 = v107;
  swift_unknownObjectWeakInit(v95 + 16, v107);
  v97 = sub_10002FF9C(&qword_100091318, &qword_100091258, (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
  v98 = v140;
  v99 = Publisher<>.sink(receiveValue:)(sub_100035114, v95, v140, v97);
  swift_release(v95);
  (*(void (**)(char *, uint64_t))(v141 + 8))(v93, v98);
  v100 = v96 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_disposeBag;
  swift_beginAccess(v96 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_disposeBag, &v149, 33, 0);
  AnyCancellable.store(in:)(v100);
  swift_endAccess(&v149);
  return swift_release(v99);
}

id sub_100032A3C@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *a1;
  *a2 = v2;
  return v2;
}

uint64_t sub_100032A48@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_unknownObjectRetain(v2);
}

uint64_t sub_100032A54@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_bridgeObjectRetain(v2);
}

uint64_t sub_100032A60@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2;

  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)a2 = *(_QWORD *)result;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_100032A74@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = *(void **)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  *a2 = *(_QWORD *)a1;
  a2[1] = v2;
  a2[2] = v5;
  a2[3] = v4;
  a2[4] = v7;
  a2[5] = v6;
  a2[6] = v8;
  a2[7] = v9;
  swift_unknownObjectRetain(v4);
  swift_bridgeObjectRetain(v7);
  v10 = v3;
  swift_unknownObjectRetain(v2);
  swift_unknownObjectRetain(v5);
  return sub_100027180(v8, v9);
}

uint64_t sub_100032AE8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1[2];
  v3 = a1[4];
  v4 = a1[6];
  v5 = a1[7];
  *a2 = a1[5];
  a2[1] = v3;
  a2[2] = v2;
  a2[3] = v4;
  a2[4] = v5;
  swift_unknownObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  return sub_100027180(v4, v5);
}

void sub_100032B38(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  id v7;

  v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v7 = a3;
  v6(a2, a3);
  swift_release(v5);

}

void sub_100032B98()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t KeyPath;
  uint64_t v6;
  void **v7;
  id v8;
  NSString v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  void **v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void (*v41)(uint64_t, char *, uint64_t);
  uint64_t v42;
  char *v43;
  void (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  void **aBlock;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  __chkstk_darwin(v1);
  v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100060528);
  v6 = swift_getKeyPath(&unk_100060550);
  static Published.subscript.getter(&aBlock, v0, KeyPath, v6);
  swift_release(KeyPath);
  swift_release(v6);
  v7 = aBlock;

  if (!v7)
  {
    sub_100031BCC();
    v8 = objc_allocWithZone((Class)NSXPCConnection);
    v9 = String._bridgeToObjectiveC()();
    v10 = (void **)objc_msgSend(v8, "initWithMachServiceName:options:", v9, 0);

    v11 = swift_getKeyPath(&unk_100060528);
    v12 = swift_getKeyPath(&unk_100060550);
    aBlock = v10;
    v13 = v0;
    static Published.subscript.setter(&aBlock, v13, v11, v12);
    v14 = swift_getKeyPath(&unk_100060528);
    v15 = swift_getKeyPath(&unk_100060550);
    static Published.subscript.getter(&aBlock, v13, v14, v15);
    swift_release(v14);
    swift_release(v15);
    v16 = aBlock;
    if (aBlock)
    {
      v17 = objc_msgSend((id)objc_opt_self(LAInternalProtocols), "interfaceWithInternalProtocol:", &OBJC_PROTOCOL___LARemoteUIHost);
      objc_msgSend(v16, "setRemoteObjectInterface:", v17);

      v18 = swift_allocObject(&unk_10007AFA0, 24, 7);
      swift_unknownObjectWeakInit(v18 + 16, v13);
      v50 = sub_1000344FC;
      v51 = v18;
      aBlock = _NSConcreteStackBlock;
      v47 = 1107296256;
      v48 = sub_100027144;
      v49 = &unk_10007AFB8;
      v19 = _Block_copy(&aBlock);
      swift_release(v51);
      objc_msgSend(v16, "setInterruptionHandler:", v19);
      _Block_release(v19);
      v20 = swift_allocObject(&unk_10007AFA0, 24, 7);
      swift_unknownObjectWeakInit(v20 + 16, v13);
      v50 = sub_100034520;
      v51 = v20;
      aBlock = _NSConcreteStackBlock;
      v47 = 1107296256;
      v48 = sub_100027144;
      v49 = &unk_10007AFE0;
      v21 = _Block_copy(&aBlock);
      swift_release(v51);
      objc_msgSend(v16, "setInvalidationHandler:", v21);
      _Block_release(v21);
      objc_msgSend(v16, "resume");
      v22 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
      v43 = &v13[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_log];
      v44 = v22;
      ((void (*)(char *))v22)((char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
      v23 = *(unsigned __int8 *)(v2 + 80);
      v24 = (v23 + 16) & ~v23;
      v40 = v24 + v3;
      v42 = v23 | 7;
      v25 = swift_allocObject(&unk_10007B018, v24 + v3, v23 | 7);
      v41 = *(void (**)(uint64_t, char *, uint64_t))(v2 + 32);
      v41(v25 + v24, (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
      v50 = sub_100034710;
      v51 = v25;
      aBlock = _NSConcreteStackBlock;
      v47 = 1107296256;
      v48 = sub_10002AF68;
      v49 = &unk_10007B030;
      v26 = _Block_copy(&aBlock);
      swift_release(v51);
      v27 = objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
      _Block_release(v26);
      _bridgeAnyObjectToAny(_:)(&aBlock, v27);
      swift_unknownObjectRelease(v27);
      v28 = sub_100025D1C(&qword_100091108);
      if (swift_dynamicCast(&v45, &aBlock, (char *)&type metadata for Any + 8, v28, 6))
        v29 = v45;
      else
        v29 = 0;
      v30 = swift_getKeyPath(&unk_100060498);
      v31 = swift_getKeyPath(&unk_1000604C0);
      v45 = v29;
      v32 = v13;
      static Published.subscript.setter(&v45, v32, v30, v31);
      v33 = swift_getKeyPath(&unk_100060498);
      v34 = swift_getKeyPath(&unk_1000604C0);
      static Published.subscript.getter(&aBlock, v32, v33, v34);
      swift_release(v33);
      swift_release(v34);
      v35 = aBlock;
      if (aBlock)
      {
        v36 = swift_allocObject(&unk_10007AFA0, 24, 7);
        swift_unknownObjectWeakInit(v36 + 16, v32);
        v44(v4, v43, v1);
        v37 = (v40 + 7) & 0xFFFFFFFFFFFFFFF8;
        v38 = swift_allocObject(&unk_10007B068, v37 + 8, v42);
        v41(v38 + v24, v4, v1);
        *(_QWORD *)(v38 + v37) = v36;
        v50 = sub_100034910;
        v51 = v38;
        aBlock = _NSConcreteStackBlock;
        v47 = 1107296256;
        v48 = sub_1000331A0;
        v49 = &unk_10007B080;
        v39 = _Block_copy(&aBlock);
        swift_release(v51);
        objc_msgSend(v35, "connectRemoteUI:reply:", v32, v39);

        swift_unknownObjectRelease(v35);
        _Block_release(v39);
      }
      else
      {

      }
    }
  }
}

uint64_t sub_100033128(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;

  v3 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
    v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a2, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v4 = 0;
  swift_retain(v2);
  v3(v4);
  swift_release(v2);
  return swift_bridgeObjectRelease(v4);
}

uint64_t sub_1000331A0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, void *);
  id v9;

  v8 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  swift_retain(v7);
  swift_unknownObjectRetain(a2);
  swift_unknownObjectRetain(a3);
  v9 = a4;
  v8(a2, a3, a4);
  swift_release(v7);

  swift_unknownObjectRelease(a3);
  return swift_unknownObjectRelease(a2);
}

uint64_t sub_100033254()
{
  void *v0;
  uint64_t KeyPath;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  id v10[3];

  KeyPath = swift_getKeyPath(&unk_100060528);
  v2 = swift_getKeyPath(&unk_100060550);
  static Published.subscript.getter(v10, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  v3 = v10[0];
  objc_msgSend(v10[0], "suspend");

  v4 = swift_getKeyPath(&unk_100060528);
  v5 = swift_getKeyPath(&unk_100060550);
  v10[0] = 0;
  v6 = v0;
  static Published.subscript.setter(v10, v6, v4, v5);
  v7 = &v6[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_disposeBag];
  swift_beginAccess(&v6[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_disposeBag], v10, 1, 0);
  v8 = *(_QWORD *)v7;
  *(_QWORD *)v7 = &_swiftEmptySetSingleton;
  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_10003351C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD v4[2];

  memset(v4, 0, sizeof(v4));
  sub_10003355C(a1, (uint64_t)v4, a2, a3);
  return sub_10002BD8C((uint64_t)v4, &qword_1000914C0);
}

uint64_t sub_10003355C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  void **v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, _QWORD *);
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[3];
  _QWORD *v32;
  uint64_t (*v33)();
  uint64_t v34;
  char v35[24];

  v29 = a1;
  v30 = a2;
  v7 = swift_allocObject(&unk_10007B0B8, 32, 7);
  *(_QWORD *)(v7 + 16) = a3;
  *(_QWORD *)(v7 + 24) = a4;
  v8 = (void **)(v4 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates);
  swift_beginAccess(v8, v35, 0, 0);
  v9 = *v8;
  sub_100027180(a3, a4);
  v10 = objc_msgSend(v9, "allObjects");
  v11 = sub_100025D1C(&qword_100091150);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);

  if (!((unint64_t)v12 >> 62))
  {
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(v12);
    if (v13)
      goto LABEL_3;
LABEL_16:
    swift_bridgeObjectRelease_n(v12, 2);
    return swift_release(v7);
  }
  if (v12 < 0)
    v27 = v12;
  else
    v27 = v12 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v12);
  result = _CocoaArrayWrapper.endIndex.getter(v27);
  v13 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v13 >= 1)
  {
    v15 = 0;
    v28 = v12 & 0xC000000000000001;
    do
    {
      if (v28)
      {
        v25 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v15, v12);
      }
      else
      {
        v25 = *(void **)(v12 + 8 * v15 + 32);
        swift_unknownObjectRetain(v25);
      }
      sub_100034C88(v30, (uint64_t)aBlock);
      v26 = v32;
      if (v32)
      {
        v16 = sub_1000279D8(aBlock, (uint64_t)v32);
        v17 = v12;
        v18 = *(v26 - 1);
        __chkstk_darwin(v16);
        v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v18 + 16))(v20);
        v21 = _bridgeAnythingToObjectiveC<A>(_:)(v20, v26);
        v22 = *(void (**)(char *, _QWORD *))(v18 + 8);
        v12 = v17;
        v22(v20, v26);
        sub_1000279FC(aBlock);
      }
      else
      {
        v21 = 0;
      }
      ++v15;
      v33 = sub_100034CD0;
      v34 = v7;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100027144;
      v32 = &unk_10007B0D0;
      v23 = _Block_copy(aBlock);
      v24 = v34;
      swift_retain(v7);
      swift_release(v24);
      objc_msgSend(v25, "viewModelDidReceiveMechanismEvent:value:reply:", v29, v21, v23);
      _Block_release(v23);
      swift_unknownObjectRelease(v25);
      swift_unknownObjectRelease(v21);
    }
    while (v13 != v15);
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_100033990(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  void **v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[5];
  uint64_t v22;
  char v23[24];

  v7 = swift_allocObject(&unk_10007B0B8, 32, 7);
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = (void **)(v3 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates);
  swift_beginAccess(v8, v23, 0, 0);
  v9 = *v8;
  sub_100027180(a2, a3);
  v10 = objc_msgSend(v9, "allObjects");
  v11 = sub_100025D1C(&qword_100091150);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);

  if (!((unint64_t)v12 >> 62))
  {
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(v12);
    if (v13)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease_n(v12, 2);
    return swift_release(v7);
  }
  if (v12 < 0)
    v20 = v12;
  else
    v20 = v12 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v12);
  result = _CocoaArrayWrapper.endIndex.getter(v20);
  v13 = result;
  if (!result)
    goto LABEL_13;
LABEL_3:
  if (v13 >= 1)
  {
    v15 = 0;
    v16 = a1 & 1;
    do
    {
      if ((v12 & 0xC000000000000001) != 0)
      {
        v17 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v15, v12);
      }
      else
      {
        v17 = *(void **)(v12 + 8 * v15 + 32);
        swift_unknownObjectRetain(v17);
      }
      ++v15;
      aBlock[4] = sub_100034CD0;
      v22 = v7;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100027144;
      aBlock[3] = &unk_10007B0F8;
      v18 = _Block_copy(aBlock);
      v19 = v22;
      swift_retain(v7);
      swift_release(v19);
      objc_msgSend(v17, "viewModelDidReceiveDismissWasInvalidated:completionHandler:", v16, v18);
      _Block_release(v18);
      swift_unknownObjectRelease(v17);
    }
    while (v13 != v15);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_100033C2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  os_log_type_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t KeyPath;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(unsigned __int8 *, _QWORD *);
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(unsigned __int8 *, _QWORD *);
  uint64_t v33;

  v5 = v4;
  v10 = static os_log_type_t.debug.getter();
  v11 = swift_bridgeObjectRetain_n(a2, 2);
  v12 = Logger.logObject.getter(v11);
  if (os_log_type_enabled(v12, v10))
  {
    v28 = v5;
    v29 = a3;
    v30 = a4;
    v13 = swift_slowAlloc(22, -1);
    v14 = swift_slowAlloc(32, -1);
    v31 = a1;
    v32 = (uint64_t (*)(unsigned __int8 *, _QWORD *))v14;
    *(_DWORD *)v13 = 134349314;
    result = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v13 + 4, v13 + 12);
    *(_WORD *)(v13 + 12) = 2082;
    if (!a2)
    {
      __break(1u);
      return result;
    }
    v16 = swift_bridgeObjectRetain(a2);
    v17 = Dictionary.description.getter(v16, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
    v19 = v18;
    swift_bridgeObjectRelease(a2);
    v31 = sub_10002B3E0(v17, v19, (uint64_t *)&v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v13 + 14, v13 + 22);
    swift_bridgeObjectRelease_n(a2, 2);
    swift_bridgeObjectRelease(v19);
    _os_log_impl((void *)&_mh_execute_header, v12, v10, "transition to controller: %{public}ld, internalInfo: %{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v13, -1, -1);

    a3 = v29;
    a4 = v30;
    v5 = v28;
  }
  else
  {
    swift_bridgeObjectRelease_n(a2, 2);

  }
  KeyPath = swift_getKeyPath(&unk_100060578);
  v21 = swift_getKeyPath(&unk_1000605A0);
  v32 = (uint64_t (*)(unsigned __int8 *, _QWORD *))a1;
  LOBYTE(v33) = 0;
  v22 = v5;
  static Published.subscript.setter(&v32, v22, KeyPath, v21);
  v23 = swift_getKeyPath(&unk_1000605C0);
  v24 = swift_getKeyPath(&unk_1000605E8);
  if (a3)
  {
    v25 = swift_allocObject(&unk_10007B130, 32, 7);
    *(_QWORD *)(v25 + 16) = a3;
    *(_QWORD *)(v25 + 24) = a4;
    v26 = sub_1000354D8;
  }
  else
  {
    v26 = 0;
    v25 = 0;
  }
  v32 = v26;
  v33 = v25;
  v27 = v22;
  sub_100027180(a3, a4);
  return static Published.subscript.setter(&v32, v27, v23, v24);
}

void sub_100033F98(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = _convertErrorToNSError(_:)(a2);
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, a1 & 1);

}

uint64_t sub_100033FF0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100034140(a1, (uint64_t)&unk_100060408, (uint64_t)&unk_100060430, a2);
}

uint64_t sub_100034004(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_1000340B0(a1, a2, a3, a4, (uint64_t)&unk_100060408, (uint64_t)&unk_100060430, (void (*)(uint64_t))&_swift_bridgeObjectRetain);
}

uint64_t sub_100034020@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100034140(a1, (uint64_t)&unk_100060450, (uint64_t)&unk_100060478, a2);
}

uint64_t sub_100034034(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_1000340B0(a1, a2, a3, a4, (uint64_t)&unk_100060450, (uint64_t)&unk_100060478, (void (*)(uint64_t))&_swift_unknownObjectRetain);
}

uint64_t sub_100034050@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100034140(a1, (uint64_t)&unk_100060498, (uint64_t)&unk_1000604C0, a2);
}

uint64_t sub_100034064(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_1000340B0(a1, a2, a3, a4, (uint64_t)&unk_100060498, (uint64_t)&unk_1000604C0, (void (*)(uint64_t))&_swift_unknownObjectRetain);
}

uint64_t sub_100034080@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100034140(a1, (uint64_t)&unk_1000604E0, (uint64_t)&unk_100060508, a2);
}

uint64_t sub_100034094(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_1000340B0(a1, a2, a3, a4, (uint64_t)&unk_1000604E0, (uint64_t)&unk_100060508, (void (*)(uint64_t))&_swift_unknownObjectRetain);
}

uint64_t sub_1000340B0(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t))
{
  uint64_t v9;
  void *v10;
  uint64_t KeyPath;
  uint64_t v12;
  uint64_t v14;

  v9 = *a1;
  v10 = *a2;
  KeyPath = swift_getKeyPath(a5);
  v12 = swift_getKeyPath(a6);
  v14 = v9;
  a7(v9);
  return static Published.subscript.setter(&v14, v10, KeyPath, v12);
}

uint64_t sub_10003412C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_100034140(a1, (uint64_t)&unk_100060528, (uint64_t)&unk_100060550, a2);
}

uint64_t sub_100034140@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, _QWORD *a4@<X8>)
{
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v6 = *a1;
  KeyPath = swift_getKeyPath(a2);
  v8 = swift_getKeyPath(a3);
  static Published.subscript.getter(&v10, v6, KeyPath, v8);
  swift_release(KeyPath);
  result = swift_release(v8);
  *a4 = v10;
  return result;
}

uint64_t sub_1000341B8(void **a1, void **a2)
{
  void *v2;
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  id v6;
  void *v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100060528);
  v5 = swift_getKeyPath(&unk_100060550);
  v8 = v2;
  v6 = v2;
  return static Published.subscript.setter(&v8, v3, KeyPath, v5);
}

uint64_t sub_100034228@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  char v7;
  uint64_t v8;
  char v9;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100060578);
  v5 = swift_getKeyPath(&unk_1000605A0);
  static Published.subscript.getter(&v8, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  v7 = v9;
  *(_QWORD *)a2 = v8;
  *(_BYTE *)(a2 + 8) = v7;
  return result;
}

uint64_t sub_1000342AC(uint64_t *a1, void **a2)
{
  uint64_t v2;
  char v3;
  void *v4;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v8;
  char v9;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  v4 = *a2;
  KeyPath = swift_getKeyPath(&unk_100060578);
  v6 = swift_getKeyPath(&unk_1000605A0);
  v8 = v2;
  v9 = v3;
  return static Published.subscript.setter(&v8, v4, KeyPath, v6);
}

double sub_100034328@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  double result;
  __int128 v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_1000605C0);
  v5 = swift_getKeyPath(&unk_1000605E8);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  result = *(double *)&v7;
  *a2 = v7;
  return result;
}

uint64_t sub_1000343A4(uint64_t *a1, void **a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  void *v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(unsigned __int8 *, _QWORD *);
  _QWORD v13[2];

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject(&unk_10007B240, 32, 7);
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_100035024;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *a2;
  KeyPath = swift_getKeyPath(&unk_1000605C0);
  v9 = swift_getKeyPath(&unk_1000605E8);
  if (v3)
  {
    v10 = swift_allocObject(&unk_10007B218, 32, 7);
    *(_QWORD *)(v10 + 16) = v6;
    *(_QWORD *)(v10 + 24) = v5;
    v11 = sub_1000354D8;
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  v13[0] = v11;
  v13[1] = v10;
  sub_100027180(v3, v4);
  return static Published.subscript.setter(v13, v7, KeyPath, v9);
}

unint64_t sub_100034494()
{
  unint64_t result;

  result = qword_100091100;
  if (!qword_100091100)
  {
    result = swift_getWitnessTable(&unk_1000600AC, &type metadata for FeatureFlags.LocalAuthentication);
    atomic_store(result, (unint64_t *)&qword_100091100);
  }
  return result;
}

uint64_t sub_1000344D8()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000344FC()
{
  sub_10003452C("Interruption handler called in %{public}@");
}

uint64_t sub_100034508(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100034518(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_100034520()
{
  sub_10003452C("Invalidation handler called in %{public}@");
}

void sub_10003452C(char *a1)
{
  uint64_t v1;
  void *Strong;
  void *v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  char *format;
  id v13;
  _BYTE v14[24];

  swift_beginAccess(v1 + 16, v14, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v1 + 16);
  if (Strong)
  {
    v4 = Strong;
    v5 = Strong;
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v6, v7))
    {
      format = a1;
      v8 = (uint8_t *)swift_slowAlloc(12, -1);
      v9 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v8 = 138543362;
      v13 = v5;
      v10 = v5;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, v14, v8 + 4, v8 + 12);
      *v9 = v4;

      _os_log_impl((void *)&_mh_execute_header, v6, v7, format, v8, 0xCu);
      v11 = sub_100025D1C(&qword_1000911C0);
      swift_arrayDestroy(v9, 1, v11);
      swift_slowDealloc(v9, -1, -1);
      swift_slowDealloc(v8, -1, -1);
    }
    else
    {

    }
  }
}

uint64_t sub_1000346B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_100034710(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  type metadata accessor for Logger(0);
  swift_errorRetain(a1);
  v2 = swift_errorRetain(a1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v5 = 138543362;
    v7 = _convertErrorToNSError(_:)(a1);
    v9 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v9, &v10, v5 + 4, v5 + 12);
    *v6 = v7;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Could not obtaint remote object with error %{public}@", v5, 0xCu);
    v8 = sub_100025D1C(&qword_1000911C0);
    swift_arrayDestroy(v6, 1, v8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }
}

uint64_t sub_10003489C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(_QWORD *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

void sub_100034910(void **a1, void **a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t Strong;
  void *v18;
  uint64_t KeyPath;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void **v27;
  uint64_t v28;
  void *v29;
  void **v30;
  void **aBlock;
  _QWORD v32[4];
  uint64_t v33;
  char v34[24];

  v7 = type metadata accessor for Logger(0);
  v8 = *(_QWORD *)(v3
                 + ((*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64)
                   + ((*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80))
                   + 7) & 0xFFFFFFFFFFFFF8))
     + 16;
  if (a3)
  {
    swift_errorRetain(a3);
    v9 = swift_errorRetain(a3);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      v30 = a2;
      v13 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v12 = 138543362;
      v14 = _convertErrorToNSError(_:)(a3);
      aBlock = (void **)v14;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v32, v12 + 4, v12 + 12);
      *v13 = v14;
      swift_errorRelease(a3);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Could not connect to remote object with error %{public}@", v12, 0xCu);
      v15 = sub_100025D1C(&qword_1000911C0);
      swift_arrayDestroy(v13, 1, v15);
      v16 = v13;
      a2 = v30;
      swift_slowDealloc(v16, -1, -1);
      swift_slowDealloc(v12, -1, -1);
      swift_errorRelease(a3);

    }
    else
    {

      swift_errorRelease(a3);
      swift_errorRelease(a3);
    }
  }
  swift_beginAccess(v8, v34, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v8);
  if (Strong)
  {
    v18 = (void *)Strong;
    KeyPath = swift_getKeyPath(&unk_100060450);
    v20 = swift_getKeyPath(&unk_100060478);
    aBlock = a1;
    swift_unknownObjectRetain(a1);
    v21 = v18;
    static Published.subscript.setter(&aBlock, v21, KeyPath, v20);
    v22 = swift_getKeyPath(&unk_1000604E0);
    v23 = swift_getKeyPath(&unk_100060508);
    aBlock = a2;
    swift_unknownObjectRetain(a2);
    v24 = v21;
    static Published.subscript.setter(&aBlock, v24, v22, v23);
    v25 = swift_getKeyPath(&unk_100060450);
    v26 = swift_getKeyPath(&unk_100060478);
    static Published.subscript.getter(&aBlock, v24, v25, v26);
    swift_release(v26);
    swift_release(v25);
    v27 = aBlock;
    if (aBlock)
    {
      v28 = swift_allocObject(&unk_10007AFA0, 24, 7);
      swift_unknownObjectWeakInit(v28 + 16, v24);
      v32[3] = sub_100035028;
      v33 = v28;
      aBlock = _NSConcreteStackBlock;
      v32[0] = 1107296256;
      v32[1] = sub_100033128;
      v32[2] = &unk_10007B280;
      v29 = _Block_copy(&aBlock);
      swift_release(v33);
      objc_msgSend(v27, "internalInfoWithReply:", v29);

      swift_unknownObjectRelease(v27);
      _Block_release(v29);
    }
    else
    {

    }
  }
}

uint64_t sub_100034C5C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100034C88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100025D1C(&qword_1000914C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100034CD4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  _BYTE v10[24];

  v1 = v0;
  v2 = (_QWORD *)(v0 + 16);
  swift_beginAccess(v0 + 16, v10, 0, 0);
  v3 = *(void (**)(uint64_t))(v0 + 16);
  if (v3)
  {
    v4 = *(_QWORD *)(v0 + 24);
    v5 = swift_retain(*(_QWORD *)(v1 + 24));
    v3(v5);
    sub_100027EB8((uint64_t)v3, v4);
  }
  swift_beginAccess(v2, &v9, 1, 0);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  *v2 = 0;
  v2[1] = 0;
  return sub_100027EB8(v6, v7);
}

uint64_t sub_100034D5C()
{
  return type metadata accessor for TransitionViewModel(0);
}

uint64_t type metadata accessor for TransitionViewModel(uint64_t a1)
{
  uint64_t result;

  result = qword_1000925A0;
  if (!qword_1000925A0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TransitionViewModel);
  return result;
}

void sub_100034DA0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD v18[10];

  v18[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  sub_100034F58(319, &qword_100091180, &qword_100091008);
  if (v3 <= 0x3F)
  {
    v18[1] = *(_QWORD *)(v2 - 8) + 64;
    sub_100034F58(319, &qword_100091188, &qword_100091070);
    if (v5 <= 0x3F)
    {
      v18[2] = *(_QWORD *)(v4 - 8) + 64;
      sub_100034F58(319, &qword_100091190, &qword_100091078);
      if (v7 <= 0x3F)
      {
        v18[3] = *(_QWORD *)(v6 - 8) + 64;
        sub_100034F58(319, &qword_100091198, &qword_1000910E0);
        if (v9 <= 0x3F)
        {
          v18[4] = *(_QWORD *)(v8 - 8) + 64;
          sub_100034F58(319, &qword_1000911A0, &qword_1000910E8);
          if (v11 <= 0x3F)
          {
            v18[5] = *(_QWORD *)(v10 - 8) + 64;
            sub_100034F58(319, &qword_1000911A8, &qword_1000910F0);
            if (v13 <= 0x3F)
            {
              v18[6] = *(_QWORD *)(v12 - 8) + 64;
              sub_100034F58(319, &qword_1000911B0, &qword_1000910F8);
              if (v15 <= 0x3F)
              {
                v18[7] = *(_QWORD *)(v14 - 8) + 64;
                v18[8] = (char *)&value witness table for Builtin.BridgeObject + 64;
                v16 = type metadata accessor for Logger(319);
                if (v17 <= 0x3F)
                {
                  v18[9] = *(_QWORD *)(v16 - 8) + 64;
                  swift_updateClassMetadata2(a1, 256, 10, v18, a1 + 80);
                }
              }
            }
          }
        }
      }
    }
  }
}

void sub_100034F58(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = sub_10002C0E0(a3);
    v6 = type metadata accessor for Published(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

void type metadata accessor for LARemoteUIController()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1000911B8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_10007B158);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000911B8);
  }
}

uint64_t sub_100034FF8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10003501C(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_100033F98(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_100035028(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[24];

  v3 = v1 + 16;
  swift_beginAccess(v3, v9, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(v3);
  if (result)
  {
    v5 = result;
    KeyPath = swift_getKeyPath(&unk_100060408);
    v7 = swift_getKeyPath(&unk_100060430);
    v8 = a1;
    swift_bridgeObjectRetain(a1);
    return static Published.subscript.setter(&v8, v5, KeyPath, v7);
  }
  return result;
}

unint64_t sub_1000350BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091308;
  if (!qword_100091308)
  {
    v1 = sub_1000287F0(255, &qword_1000912F8, NSRunLoop_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSRunLoop, v1);
    atomic_store(result, (unint64_t *)&qword_100091308);
  }
  return result;
}

uint64_t sub_100035114(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t Strong;
  void *v7;
  void **v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  Class isa;
  NSDictionary v23;
  uint64_t v24;
  uint64_t (*v25)();
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[5];
  uint64_t v31;
  char v32[24];
  char v33[32];

  v27 = *a1;
  v28 = a1[1];
  v2 = a1[3];
  v29 = a1[2];
  v3 = a1[4];
  if (v2)
  {
    v4 = swift_allocObject(&unk_10007B2E0, 32, 7);
    *(_QWORD *)(v4 + 16) = v2;
    *(_QWORD *)(v4 + 24) = v3;
    v25 = sub_100035024;
    v26 = v4;
  }
  else
  {
    v25 = 0;
    v26 = 0;
  }
  v5 = v1 + 16;
  swift_beginAccess(v5, v33, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (!Strong)
  {
    sub_100027180(v2, v3);
    return sub_100027EB8((uint64_t)v25, v26);
  }
  v7 = (void *)Strong;
  v8 = (void **)(Strong + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates);
  swift_beginAccess(Strong + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates, v32, 0, 0);
  v9 = *v8;
  sub_100027180(v2, v3);
  swift_bridgeObjectRetain(v28);
  swift_unknownObjectRetain(v29);
  v10 = v9;

  v11 = objc_msgSend(v10, "allObjects");
  v12 = sub_100025D1C(&qword_100091150);
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);

  if (!((unint64_t)v13 >> 62))
  {
    v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(v13);
    if (v14)
      goto LABEL_7;
LABEL_21:
    swift_unknownObjectRelease(v29);
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(v28);
    sub_100027EB8((uint64_t)v25, v26);
    return swift_bridgeObjectRelease(v13);
  }
  if (v13 < 0)
    v24 = v13;
  else
    v24 = v13 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v13);
  result = _CocoaArrayWrapper.endIndex.getter(v24);
  v14 = result;
  if (!result)
    goto LABEL_21;
LABEL_7:
  if (v14 >= 1)
  {
    v16 = 0;
    do
    {
      if ((v13 & 0xC000000000000001) != 0)
      {
        v21 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v16, v13);
      }
      else
      {
        v21 = *(void **)(v13 + 8 * v16 + 32);
        swift_unknownObjectRetain(v21);
      }
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      objc_msgSend(v21, "viewModelDidReceiveAuthenticationDataWithInternalInfo:mechanism:", isa, v29);

      v23.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
      if (v2)
      {
        aBlock[4] = v25;
        v31 = v26;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_100032B38;
        aBlock[3] = &unk_10007B2A8;
        v17 = _Block_copy(aBlock);
        v18 = v2;
        v19 = v31;
        swift_retain(v26);
        v20 = v19;
        v2 = v18;
        swift_release(v20);
      }
      else
      {
        v17 = 0;
      }
      ++v16;
      objc_msgSend(v21, "showWithController:internalInfo:completionHandler:", v27, v23.super.isa, v17);
      _Block_release(v17);

      swift_unknownObjectRelease(v21);
    }
    while (v14 != v16);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

uint64_t sub_100035444(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(char *, uint64_t *);
  uint64_t v5;
  char v6;

  v3 = *(uint64_t (**)(char *, uint64_t *))(v2 + 16);
  v6 = a1;
  v5 = a2;
  return v3(&v6, &v5);
}

uint64_t sub_1000354E4()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate;
  swift_beginAccess(v0 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate, v3, 0, 0);
  return swift_unknownObjectWeakLoadStrong(v1);
}

uint64_t sub_10003552C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[24];

  v3 = v1 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate;
  swift_beginAccess(v3, v5, 1, 0);
  swift_unknownObjectWeakAssign(v3, a1);
  return swift_unknownObjectRelease(a1);
}

void (*sub_100035584(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess(v1 + v4, v3, 33, 0);
  v3[3] = swift_unknownObjectWeakLoadStrong(v5);
  return sub_1000355F4;
}

void sub_1000355F4(uint64_t a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = *(_QWORD **)a1;
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  swift_unknownObjectWeakAssign(*(_QWORD *)(*(_QWORD *)a1 + 32) + *(_QWORD *)(*(_QWORD *)a1 + 40), v4);
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease(v3[3]);
    swift_endAccess(v3);
  }
  else
  {
    swift_endAccess(v3);
    swift_unknownObjectRelease(v4);
  }
  free(v3);
}

uint64_t sub_100035660()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = v0;
  v2 = type metadata accessor for RatchetCoolOffContentViewModelState(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel____lazy_storage___state;
  v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel____lazy_storage___state);
  if (v6)
  {
    v7 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel____lazy_storage___state);
  }
  else
  {
    sub_100035744((uint64_t)v4);
    swift_storeEnumTagMultiPayload(v4, v2, 0);
    v8 = sub_100025D1C(&qword_100091398);
    swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
    v7 = CurrentValueSubject.init(_:)(v4);
    v9 = *(_QWORD *)(v1 + v5);
    *(_QWORD *)(v1 + v5) = v7;
    swift_retain(v7);
    swift_release(v9);
    v6 = 0;
  }
  swift_retain(v6);
  return v7;
}

uint64_t sub_100035744@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  void (*v31)(char *, uint64_t);
  unint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v50;
  unint64_t v51;
  char v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  char v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[3];
  _QWORD v69[3];
  _BYTE v70[40];
  __int128 v71;
  __int128 v72;

  v2 = v1;
  v65 = a1;
  v3 = sub_100025D1C(&qword_100091F40);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v63 - v7;
  v9 = type metadata accessor for Date(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v63 - v14;
  v16 = sub_100035F60();
  LODWORD(v71) = 1076;
  AnyHashable.init<A>(_:)(&v71, &type metadata for Int32, &protocol witness table for Int32);
  if (*(_QWORD *)(v16 + 16) && (v17 = sub_100027EF8((uint64_t)v70), (v18 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v16 + 56) + 32 * v17, (uint64_t)&v71);
  }
  else
  {
    v71 = 0u;
    v72 = 0u;
  }
  swift_bridgeObjectRelease(v16);
  sub_100028114((uint64_t)v70);
  if (*((_QWORD *)&v72 + 1))
  {
    v19 = swift_dynamicCast(v69, &v71, (char *)&type metadata for Any + 8, &type metadata for String, 6);
    v20 = v69[0];
    if (!v19)
      v20 = 0;
    v64 = v20;
    if (v19)
      v21 = v69[1];
    else
      v21 = 0;
  }
  else
  {
    sub_10002BD8C((uint64_t)&v71, &qword_1000914C0);
    v64 = 0;
    v21 = 0;
  }
  v22 = v2 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_expirationDate;
  swift_beginAccess(v2 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_expirationDate, v69, 0, 0);
  sub_100027F28(v22, (uint64_t)v8, &qword_100091F40);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v23(v8, 1, v9) == 1)
  {
    sub_10002BD8C((uint64_t)v8, &qword_100091F40);
    v24 = v2 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_gracePeriodExpirationDate;
    swift_beginAccess(v2 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_gracePeriodExpirationDate, v68, 0, 0);
    sub_100027F28(v24, (uint64_t)v6, &qword_100091F40);
    v25 = v23(v6, 1, v9);
    sub_10002BD8C((uint64_t)v6, &qword_100091F40);
    if (v25 == 1)
    {
      v26 = sub_100035F60();
      LODWORD(v71) = 1069;
      AnyHashable.init<A>(_:)(&v71, &type metadata for Int32, &protocol witness table for Int32);
      if (*(_QWORD *)(v26 + 16) && (v27 = sub_100027EF8((uint64_t)v70), (v28 & 1) != 0))
      {
        sub_100028564(*(_QWORD *)(v26 + 56) + 32 * v27, (uint64_t)&v71);
      }
      else
      {
        v71 = 0u;
        v72 = 0u;
      }
      swift_bridgeObjectRelease(v26);
      sub_100028114((uint64_t)v70);
      if (*((_QWORD *)&v72 + 1))
      {
        v36 = swift_dynamicCast(&v66, &v71, (char *)&type metadata for Any + 8, &type metadata for String, 6);
        if (v36)
          v37 = v66;
        else
          v37 = 0;
        if (v36)
          v38 = v67;
        else
          v38 = 0;
      }
      else
      {
        sub_10002BD8C((uint64_t)&v71, &qword_1000914C0);
        v37 = 0;
        v38 = 0;
      }
      v43 = sub_100035F60();
      LODWORD(v71) = 1070;
      AnyHashable.init<A>(_:)(&v71, &type metadata for Int32, &protocol witness table for Int32);
      if (*(_QWORD *)(v43 + 16) && (v44 = sub_100027EF8((uint64_t)v70), (v45 & 1) != 0))
      {
        sub_100028564(*(_QWORD *)(v43 + 56) + 32 * v44, (uint64_t)&v71);
      }
      else
      {
        v71 = 0u;
        v72 = 0u;
      }
      swift_bridgeObjectRelease(v43);
      sub_100028114((uint64_t)v70);
      if (*((_QWORD *)&v72 + 1))
      {
        v46 = swift_dynamicCast(&v66, &v71, (char *)&type metadata for Any + 8, &type metadata for String, 6);
        if (v46)
          v47 = v66;
        else
          v47 = 0;
        if (v46)
          v48 = v67;
        else
          v48 = 0;
      }
      else
      {
        sub_10002BD8C((uint64_t)&v71, &qword_1000914C0);
        v47 = 0;
        v48 = 0;
      }
      v50 = sub_100035F60();
      LODWORD(v71) = 1088;
      AnyHashable.init<A>(_:)(&v71, &type metadata for Int32, &protocol witness table for Int32);
      if (*(_QWORD *)(v50 + 16) && (v51 = sub_100027EF8((uint64_t)v70), (v52 & 1) != 0))
      {
        sub_100028564(*(_QWORD *)(v50 + 56) + 32 * v51, (uint64_t)&v71);
      }
      else
      {
        v71 = 0u;
        v72 = 0u;
      }
      swift_bridgeObjectRelease(v50);
      sub_100028114((uint64_t)v70);
      if (*((_QWORD *)&v72 + 1))
      {
        v53 = swift_dynamicCast(&v66, &v71, (char *)&type metadata for Any + 8, &type metadata for String, 6);
        if (v53)
          v54 = v66;
        else
          v54 = 0;
        if (v53)
          v55 = v67;
        else
          v55 = 0;
      }
      else
      {
        sub_10002BD8C((uint64_t)&v71, &qword_1000914C0);
        v54 = 0;
        v55 = 0;
      }
      v56 = OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_isStrictModeEnabled;
      if ((*(_BYTE *)(v2 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_isStrictModeEnabled) & 1) == 0)
      {
        swift_bridgeObjectRelease(v55);
        swift_bridgeObjectRetain(v48);
        v54 = v47;
        v55 = v48;
      }
      if (v55)
      {
        swift_bridgeObjectRelease(v48);
      }
      else
      {
        v54 = v47;
        v55 = v48;
      }
      v57 = sub_100035F60();
      LODWORD(v71) = 1071;
      AnyHashable.init<A>(_:)(&v71, &type metadata for Int32, &protocol witness table for Int32);
      if (*(_QWORD *)(v57 + 16) && (v58 = sub_100027EF8((uint64_t)v70), (v59 & 1) != 0))
      {
        sub_100028564(*(_QWORD *)(v57 + 56) + 32 * v58, (uint64_t)&v71);
      }
      else
      {
        v71 = 0u;
        v72 = 0u;
      }
      swift_bridgeObjectRelease(v57);
      sub_100028114((uint64_t)v70);
      if (*((_QWORD *)&v72 + 1))
      {
        v60 = swift_dynamicCast(&v66, &v71, (char *)&type metadata for Any + 8, &type metadata for Bool, 6);
        v61 = v64;
        if (v60)
          v62 = v66;
        else
          v62 = 0;
      }
      else
      {
        sub_10002BD8C((uint64_t)&v71, &qword_1000914C0);
        v62 = 0;
        v61 = v64;
      }
      static LACUIAuthCountdownConfiguration.begin(title:message:strictModeEnabled:showsLocationWarning:customCancelTitle:)(v37, v38, v54, v55, *(unsigned __int8 *)(v2 + v56), v62, v61, v21);
      swift_bridgeObjectRelease(v55);
      swift_bridgeObjectRelease(v38);
    }
    else
    {
      static LACUIAuthCountdownConfiguration.gracePeriod(customCancelTitle:)(v64, v21);
    }
    return swift_bridgeObjectRelease(v21);
  }
  else
  {
    v29 = (*(uint64_t (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
    static Date.now.getter(v29);
    v30 = static Date.> infix(_:_:)(v15, v13);
    v31 = *(void (**)(char *, uint64_t))(v10 + 8);
    v31(v13, v9);
    if ((v30 & 1) != 0)
    {
      v32 = sub_100035F60();
      LODWORD(v71) = 1072;
      AnyHashable.init<A>(_:)(&v71, &type metadata for Int32, &protocol witness table for Int32);
      if (*(_QWORD *)(v32 + 16) && (v33 = sub_100027EF8((uint64_t)v70), (v34 & 1) != 0))
      {
        sub_100028564(*(_QWORD *)(v32 + 56) + 32 * v33, (uint64_t)&v71);
      }
      else
      {
        v71 = 0u;
        v72 = 0u;
      }
      swift_bridgeObjectRelease(v32);
      sub_100028114((uint64_t)v70);
      if (*((_QWORD *)&v72 + 1))
      {
        v39 = swift_dynamicCast(v68, &v71, (char *)&type metadata for Any + 8, &type metadata for String, 6);
        v40 = v39 == 0;
        if (v39)
          v41 = v68[0];
        else
          v41 = 0;
        if (v40)
          v42 = 0;
        else
          v42 = v68[1];
      }
      else
      {
        sub_10002BD8C((uint64_t)&v71, &qword_1000914C0);
        v41 = 0;
        v42 = 0;
      }
      static LACUIAuthCountdownConfiguration.countdown(message:delayExpiration:customCancelTitle:)(v41, v42, v15, v64, v21);
      swift_bridgeObjectRelease(v21);
      v35 = v42;
    }
    else
    {
      static LACUIAuthCountdownConfiguration.ready(message:customCancelTitle:)(0, 0xE000000000000000, v64, v21);
      v35 = v21;
    }
    swift_bridgeObjectRelease(v35);
    return ((uint64_t (*)(char *, uint64_t))v31)(v15, v9);
  }
}

uint64_t sub_100035EB8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = sub_100035660();
  v0 = sub_100025D1C(&qword_100091398);
  v1 = sub_100037438();
  v2 = Publisher.eraseToAnyPublisher()(v0, v1);
  swift_release(v4);
  return v2;
}

uint64_t sub_100035F24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

unint64_t sub_100035F60()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v5;
  _QWORD v7[3];
  _BYTE v8[40];
  __int128 v9;
  __int128 v10;

  v7[0] = 0x736E6F6974704FLL;
  v7[1] = 0xE700000000000000;
  AnyHashable.init<A>(_:)(v7, &type metadata for String, &protocol witness table for String);
  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_internalInfo);
  swift_beginAccess(v0 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_internalInfo, v7, 32, 0);
  v2 = *v1;
  if (*(_QWORD *)(*v1 + 16) && (v3 = sub_100027EF8((uint64_t)v8), (v4 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v2 + 56) + 32 * v3, (uint64_t)&v9);
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
  }
  swift_endAccess(v7);
  sub_100028114((uint64_t)v8);
  if (*((_QWORD *)&v10 + 1))
  {
    v5 = sub_100025D1C(&qword_100090C38);
    if (swift_dynamicCast(v7, &v9, (char *)&type metadata for Any + 8, v5, 6))
      return v7[0];
  }
  else
  {
    sub_10002BD8C((uint64_t)&v9, &qword_1000914C0);
  }
  return sub_100026D4C((uint64_t)&_swiftEmptyArrayStorage);
}

id sub_100036074(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return sub_1000360B4(a1, a2);
}

id sub_1000360B4(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  objc_class *ObjectType;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(void);
  char *v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  id v25;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char *v40;
  char *v41;
  uint64_t v42;
  objc_super v43;
  unint64_t v44;
  unint64_t v45;
  _QWORD v46[5];
  __int128 v47;
  __int128 v48;
  char v49[32];

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType(v3);
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100025D1C(&qword_100091F40);
  __chkstk_darwin(v11);
  v41 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = &v3[OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate];
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate], 0);
  *(_QWORD *)&v3[OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel____lazy_storage___state] = 0;
  v14 = (uint64_t)&v3[OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_expirationDate];
  v15 = *(void (**)(void))(v8 + 56);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v15)(&v3[OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_expirationDate], 1, 1, v7);
  v40 = &v3[OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_gracePeriodExpirationDate];
  v15();
  *(_QWORD *)&v3[OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_internalInfo] = a1;
  swift_beginAccess(v13, v49, 1, 0);
  v42 = a2;
  swift_unknownObjectWeakAssign(v13, a2);
  v44 = 0x6F6974704F4F5444;
  v45 = 0xEA0000000000736ELL;
  v16 = v3;
  swift_bridgeObjectRetain(a1);
  AnyHashable.init<A>(_:)(&v44, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(a1 + 16) && (v17 = sub_100027EF8((uint64_t)v46), (v18 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(a1 + 56) + 32 * v17, (uint64_t)&v47);
  }
  else
  {
    v47 = 0u;
    v48 = 0u;
  }
  swift_bridgeObjectRelease(a1);
  sub_100028114((uint64_t)v46);
  if (!*((_QWORD *)&v48 + 1))
  {
    sub_10002BD8C((uint64_t)&v47, &qword_1000914C0);
LABEL_12:
    v47 = 0u;
    v48 = 0u;
    sub_10002BD8C((uint64_t)&v47, &qword_1000914C0);
    v47 = 0u;
    v48 = 0u;
    sub_10002BD8C((uint64_t)&v47, &qword_1000914C0);
    v47 = 0u;
    v48 = 0u;
    v23 = v42;
LABEL_13:
    sub_10002BD8C((uint64_t)&v47, &qword_1000914C0);
    goto LABEL_14;
  }
  v19 = sub_100025D1C(&qword_100090C38);
  if ((swift_dynamicCast(&v44, &v47, (char *)&type metadata for Any + 8, v19, 6) & 1) == 0)
    goto LABEL_12;
  v20 = v44;
  if (!v44)
    goto LABEL_12;
  v44 = 0x4466664F6C6F6F43;
  v45 = 0xEF6E6F6974617275;
  swift_bridgeObjectRetain(v20);
  AnyHashable.init<A>(_:)(&v44, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v20 + 16) && (v21 = sub_100027EF8((uint64_t)v46), (v22 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v20 + 56) + 32 * v21, (uint64_t)&v47);
  }
  else
  {
    v47 = 0u;
    v48 = 0u;
  }
  swift_bridgeObjectRelease(v20);
  sub_100028114((uint64_t)v46);
  if (*((_QWORD *)&v48 + 1))
  {
    v27 = swift_dynamicCast(v46, &v47, (char *)&type metadata for Any + 8, &type metadata for Double, 6);
    if ((v27 & 1) != 0)
    {
      v28 = *(double *)v46;
      v29 = static Date.now.getter(v27);
      v30 = (uint64_t)v41;
      Date.addingTimeInterval(_:)(v29, v28);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v15)(v30, 0, 1, v7);
      swift_beginAccess(v14, v46, 33, 0);
      sub_100037484(v30, v14);
      swift_endAccess(v46);
    }
  }
  else
  {
    sub_10002BD8C((uint64_t)&v47, &qword_1000914C0);
  }
  v44 = 0xD000000000000013;
  v45 = 0x800000010006E5E0;
  swift_bridgeObjectRetain(v20);
  AnyHashable.init<A>(_:)(&v44, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v20 + 16) && (v31 = sub_100027EF8((uint64_t)v46), (v32 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v20 + 56) + 32 * v31, (uint64_t)&v47);
  }
  else
  {
    v47 = 0u;
    v48 = 0u;
  }
  swift_bridgeObjectRelease(v20);
  sub_100028114((uint64_t)v46);
  if (*((_QWORD *)&v48 + 1))
  {
    v33 = swift_dynamicCast(v46, &v47, (char *)&type metadata for Any + 8, &type metadata for Double, 6);
    if ((v33 & 1) != 0)
    {
      v34 = *(double *)v46;
      v35 = static Date.now.getter(v33);
      v36 = (uint64_t)v41;
      Date.addingTimeInterval(_:)(v35, v34);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v15)(v36, 0, 1, v7);
      v37 = (uint64_t)v40;
      swift_beginAccess(v40, v46, 33, 0);
      sub_100037484(v36, v37);
      swift_endAccess(v46);
    }
  }
  else
  {
    sub_10002BD8C((uint64_t)&v47, &qword_1000914C0);
  }
  v44 = 0xD000000000000011;
  v45 = 0x800000010006E5C0;
  AnyHashable.init<A>(_:)(&v44, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v20 + 16))
  {
    v38 = sub_100027EF8((uint64_t)v46);
    v23 = v42;
    if ((v39 & 1) != 0)
    {
      sub_100028564(*(_QWORD *)(v20 + 56) + 32 * v38, (uint64_t)&v47);
    }
    else
    {
      v47 = 0u;
      v48 = 0u;
    }
  }
  else
  {
    v47 = 0u;
    v48 = 0u;
    v23 = v42;
  }
  swift_bridgeObjectRelease(v20);
  sub_100028114((uint64_t)v46);
  if (!*((_QWORD *)&v48 + 1))
    goto LABEL_13;
  if (swift_dynamicCast(v46, &v47, (char *)&type metadata for Any + 8, &type metadata for Bool, 6))
  {
    v24 = v46[0];
    goto LABEL_15;
  }
LABEL_14:
  v24 = 0;
LABEL_15:
  v16[OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_isStrictModeEnabled] = v24;

  v43.receiver = v16;
  v43.super_class = ObjectType;
  v25 = objc_msgSendSuper2(&v43, "init");
  sub_1000366C0();

  swift_unknownObjectRelease(v23);
  return v25;
}

uint64_t sub_1000366C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v28;
  uint64_t v29;
  char v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  char v38[24];
  char v39[24];

  v1 = type metadata accessor for Date(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v37 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v36 = (char *)&v34 - v5;
  v6 = type metadata accessor for RatchetCoolOffContentViewModelState(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100025D1C(&qword_100091F40);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v34 - v13;
  v15 = v0;
  v16 = v0 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_gracePeriodExpirationDate;
  swift_beginAccess(v0 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_gracePeriodExpirationDate, v39, 0, 0);
  sub_100027F28(v16, (uint64_t)v14, &qword_100091F40);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 48);
  v35 = v1;
  LODWORD(v16) = v17(v14, 1, v1);
  sub_10002BD8C((uint64_t)v14, &qword_100091F40);
  if ((_DWORD)v16 != 1)
  {
    v23 = sub_100035660();
    sub_100035744((uint64_t)v8);
    v24 = v8;
    v25 = v6;
    v26 = 1;
    goto LABEL_5;
  }
  v18 = v2;
  v34 = v6;
  v20 = v36;
  v19 = v37;
  v21 = v15 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_expirationDate;
  swift_beginAccess(v21, v38, 0, 0);
  sub_100027F28(v21, (uint64_t)v12, &qword_100091F40);
  v22 = v35;
  if (v17(v12, 1, v35) == 1)
  {
    sub_10002BD8C((uint64_t)v12, &qword_100091F40);
    v23 = sub_100035660();
    sub_100035744((uint64_t)v8);
    v24 = v8;
    v25 = v34;
    v26 = 0;
LABEL_5:
    swift_storeEnumTagMultiPayload(v24, v25, v26);
    CurrentValueSubject.value.setter(v8);
    return swift_release(v23);
  }
  v28 = v20;
  v29 = (*(uint64_t (**)(char *, char *, uint64_t))(v18 + 32))(v20, v12, v22);
  static Date.now.getter(v29);
  v30 = static Date.> infix(_:_:)(v20, v19);
  v31 = *(void (**)(char *, uint64_t))(v18 + 8);
  v31(v19, v22);
  v32 = sub_100035660();
  sub_100035744((uint64_t)v8);
  if ((v30 & 1) != 0)
    v33 = 2;
  else
    v33 = 3;
  swift_storeEnumTagMultiPayload(v8, v34, v33);
  CurrentValueSubject.value.setter(v8);
  swift_release(v32);
  return ((uint64_t (*)(char *, uint64_t))v31)(v28, v22);
}

uint64_t sub_1000369B4(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v16[24];

  v2 = v1;
  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = sub_100025D1C(&qword_100091F40);
  v9 = __chkstk_darwin(v8);
  v11 = &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v12 = static Date.now.getter(v9);
  Date.addingTimeInterval(_:)(v12, a1);
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v11, 0, 1, v4);
  v13 = v2 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_expirationDate;
  swift_beginAccess(v2 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_expirationDate, v16, 33, 0);
  sub_100037484((uint64_t)v11, v13);
  swift_endAccess(v16);
  return sub_1000366C0();
}

void sub_100036ADC()
{
  _swift_stdlib_reportUnimplementedInitializer("CoreAuthUI.RatchetCoolOffContentViewModel", 41, "init()", 6, 0);
  __break(1u);
}

uint64_t sub_100036BB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  char *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *Strong;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void (*v42)(char *, uint64_t);
  char *v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[24];

  v45 = a1;
  v1 = sub_100025D1C(&qword_1000913B8);
  __chkstk_darwin(v1);
  v43 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for LACUIAuthCountdownConfiguration.ActionButtonIdentifier(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v43 - v8;
  v10 = type metadata accessor for LACUIAuthButtonConfiguration(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LACUIAuthActionCountdown(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v45, v14);
  v18 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v17, v14);
  if (v18 == enum case for LACUIAuthActionCountdown.buttonTapped(_:))
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))(v17, v14);
    v19 = (*(uint64_t (**)(char *, char *, uint64_t))(v11 + 32))(v13, v17, v10);
    v20 = LACUIAuthButtonConfiguration.id.getter(v19);
    v21 = (uint64_t)v43;
    LACUIAuthCountdownConfiguration.ActionButtonIdentifier.init(rawValue:)(v20);
    v22 = v10;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v21, 1, v3) == 1)
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      return sub_10002BD8C(v21, &qword_1000913B8);
    }
    v24 = v3;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v9, v21, v3);
    v25 = v7;
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v24);
    v26 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v24);
    if (v26 == enum case for LACUIAuthCountdownConfiguration.ActionButtonIdentifier.beginSecurityDelay(_:))
    {
      v27 = v44;
      v28 = v44 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate;
      swift_beginAccess(v44 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate, v46, 0, 0);
      Strong = (void *)swift_unknownObjectWeakLoadStrong(v28);
      if (Strong)
      {
        v30 = Strong;
        objc_msgSend(Strong, "ratchetCoolOffContentDidTapOnBeginDelay:", v27);
LABEL_20:
        swift_unknownObjectRelease(v30);
      }
    }
    else
    {
      v31 = v44;
      if (v26 == enum case for LACUIAuthCountdownConfiguration.ActionButtonIdentifier.learnMore(_:))
      {
        v32 = v44 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate;
        swift_beginAccess(v44 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate, v46, 0, 0);
        v33 = (void *)swift_unknownObjectWeakLoadStrong(v32);
        if (v33)
        {
          v30 = v33;
          objc_msgSend(v33, "ratchetCoolOffContentDidTapOnLearnMore:", v31);
          goto LABEL_20;
        }
      }
      else if (v26 == enum case for LACUIAuthCountdownConfiguration.ActionButtonIdentifier.done(_:))
      {
        v34 = v44 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate;
        swift_beginAccess(v44 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate, v46, 0, 0);
        v35 = (void *)swift_unknownObjectWeakLoadStrong(v34);
        if (v35)
        {
          v30 = v35;
          objc_msgSend(v35, "ratchetCoolOffContentDidTapOnDone:", v31);
          goto LABEL_20;
        }
      }
      else
      {
        if (v26 != enum case for LACUIAuthCountdownConfiguration.ActionButtonIdentifier.continue(_:)
          && v26 != enum case for LACUIAuthCountdownConfiguration.ActionButtonIdentifier.continueInGracePeriod(_:))
        {
          if (v26 == enum case for LACUIAuthCountdownConfiguration.ActionButtonIdentifier.cancel(_:))
          {
            v38 = v44 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate;
            swift_beginAccess(v44 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate, v46, 0, 0);
            v39 = (void *)swift_unknownObjectWeakLoadStrong(v38);
            if (!v39)
              goto LABEL_21;
            v30 = v39;
            objc_msgSend(v39, "ratchetCoolOffContentDidTapOnCancel:", v31);
          }
          else
          {
            if (v26 != enum case for LACUIAuthCountdownConfiguration.ActionButtonIdentifier.customCancel(_:))
            {
              v42 = *(void (**)(char *, uint64_t))(v4 + 8);
              v42(v9, v24);
              (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v22);
              return ((uint64_t (*)(char *, uint64_t))v42)(v25, v24);
            }
            v40 = v44 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate;
            swift_beginAccess(v44 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate, v46, 0, 0);
            v41 = (void *)swift_unknownObjectWeakLoadStrong(v40);
            if (!v41)
              goto LABEL_21;
            v30 = v41;
            objc_msgSend(v41, "ratchetCoolOffContentDidTapOnCustomCancel:", v31);
          }
          goto LABEL_20;
        }
        v36 = v44 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate;
        swift_beginAccess(v44 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate, v46, 0, 0);
        v37 = (void *)swift_unknownObjectWeakLoadStrong(v36);
        if (v37)
        {
          v30 = v37;
          objc_msgSend(v37, "ratchetCoolOffContentDidTapOnContinue:", v31);
          goto LABEL_20;
        }
      }
    }
LABEL_21:
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v24);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v22);
  }
  if (v18 == enum case for LACUIAuthActionCountdown.delayElapsed(_:))
    return sub_1000366C0();
  else
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

void sub_100037074(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  _QWORD v19[5];
  uint64_t v20;

  v20 = a2;
  v3 = type metadata accessor for LACUIAuthCountdownConfiguration(0);
  v19[3] = *(_QWORD *)(v3 - 8);
  v19[4] = v3;
  v4 = __chkstk_darwin(v3);
  v19[2] = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v4);
  v19[1] = (char *)v19 - v7;
  v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  v9 = type metadata accessor for RatchetCoolOffContentViewModelState(0);
  v10 = __chkstk_darwin(v9);
  v11 = __chkstk_darwin(v10);
  v12 = __chkstk_darwin(v11);
  __chkstk_darwin(v12);
  v13 = sub_100025D1C((uint64_t *)&unk_100091490);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (uint64_t)&v16[*(int *)(v14 + 48)];
  sub_10003009C(a1, (uint64_t)v16);
  sub_10003009C(v20, v17);
  v18 = (char *)sub_10003723C + 4 * byte_100060660[swift_getEnumCaseMultiPayload(v16, v9)];
  __asm { BR              X10 }
}

uint64_t sub_10003723C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);

  sub_10003009C(v0, v2);
  if (swift_getEnumCaseMultiPayload(v1, v4))
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 - 104) + 8))(v2, *(_QWORD *)(v5 - 96));
    sub_10002BD8C(v0, (uint64_t *)&unk_100091490);
    v6 = 0;
  }
  else
  {
    v7 = *(_QWORD *)(v5 - 104);
    v8 = *(_QWORD *)(v5 - 96);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v3, v1, v8);
    v6 = ((uint64_t (*)(uint64_t, uint64_t))static LACUIAuthCountdownConfiguration.== infix(_:_:))(v2, v3);
    v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v9(v3, v8);
    v9(v2, v8);
    sub_100030060(v0);
  }
  return v6 & 1;
}

unint64_t sub_100037438()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000913A0;
  if (!qword_1000913A0)
  {
    v1 = sub_10002C0E0(&qword_100091398);
    result = swift_getWitnessTable(&protocol conformance descriptor for CurrentValueSubject<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000913A0);
  }
  return result;
}

uint64_t sub_100037484(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100025D1C(&qword_100091F40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000374CC(uint64_t a1)
{
  unint64_t result;

  result = sub_1000374F0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000374F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000913C0;
  if (!qword_1000913C0)
  {
    v1 = type metadata accessor for RatchetCoolOffContentViewModel(255);
    result = swift_getWitnessTable(&unk_1000606AC, v1);
    atomic_store(result, (unint64_t *)&qword_1000913C0);
  }
  return result;
}

uint64_t type metadata accessor for RatchetCoolOffContentViewModel(uint64_t a1)
{
  return sub_1000377E0(a1, (uint64_t *)&unk_100092760, (uint64_t)&nominal type descriptor for RatchetCoolOffContentViewModel);
}

uint64_t sub_10003754C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_10003759C + 4 * byte_100060664[swift_getEnumCaseMultiPayload(a2, a3)];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain(v6);
  return v7;
}

uint64_t sub_100037690(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = swift_getEnumCaseMultiPayload(a1, a2);
  if (result <= 3)
  {
    v4 = type metadata accessor for LACUIAuthCountdownConfiguration(0);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  return result;
}

uint64_t sub_1000376DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t EnumCaseMultiPayload;
  uint64_t v7;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  v7 = type metadata accessor for LACUIAuthCountdownConfiguration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
  swift_storeEnumTagMultiPayload(a1, a3, EnumCaseMultiPayload);
  return a1;
}

uint64_t sub_10003774C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_100030060(a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    v7 = type metadata accessor for LACUIAuthCountdownConfiguration(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, a3, EnumCaseMultiPayload);
  }
  return a1;
}

uint64_t type metadata accessor for RatchetCoolOffContentViewModelState(uint64_t a1)
{
  return sub_1000377E0(a1, (uint64_t *)&unk_100092750, (uint64_t)&nominal type descriptor for RatchetCoolOffContentViewModelState);
}

uint64_t sub_1000377E0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t sub_100037814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t EnumCaseMultiPayload;
  uint64_t v7;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  v7 = type metadata accessor for LACUIAuthCountdownConfiguration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
  swift_storeEnumTagMultiPayload(a1, a3, EnumCaseMultiPayload);
  return a1;
}

uint64_t sub_100037884(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_100030060(a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    v7 = type metadata accessor for LACUIAuthCountdownConfiguration(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, a3, EnumCaseMultiPayload);
  }
  return a1;
}

uint64_t sub_100037904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_100037910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_100037920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

uint64_t sub_100037930(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[4];

  result = type metadata accessor for LACUIAuthCountdownConfiguration(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = v4[0];
    v4[2] = v4[0];
    v4[3] = v4[0];
    swift_initEnumMetadataMultiPayload(a1, 256, 4, v4);
    return 0;
  }
  return result;
}

uint64_t sub_100037998()
{
  return type metadata accessor for RatchetCoolOffContentViewModel(0);
}

void sub_1000379A0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4[0] = "\b";
  v4[1] = &unk_100060778;
  v4[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
  sub_100037A3C(319);
  if (v3 <= 0x3F)
  {
    v5 = *(_QWORD *)(v2 - 8) + 64;
    v6 = v5;
    v7 = &unk_100060790;
    swift_updateClassMetadata2(a1, 256, 6, v4, a1 + 80);
  }
}

void sub_100037A3C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100091488)
  {
    v2 = type metadata accessor for Date(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100091488);
  }
}

uint64_t variable initialization expression of AuthorizationRemoteViewController.log()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];

  v0 = sub_100025D1C(&qword_1000914A0);
  v1 = swift_allocObject(v0, 56, 7);
  *(_OWORD *)(v1 + 16) = xmmword_1000607B0;
  *(_QWORD *)(v1 + 32) = *(_QWORD *)sub_1000419B8();
  *(_QWORD *)(v1 + 40) = *(_QWORD *)sub_1000419C4();
  *(_QWORD *)(v1 + 48) = *(_QWORD *)sub_100041C40();
  v6[0] = v1;
  v2 = sub_100037B68();
  v3 = sub_100025D1C(&qword_1000914B0);
  v4 = sub_1000390B0(&qword_1000914B8, &qword_1000914B0);
  dispatch thunk of SetAlgebra.init<A>(_:)(v6, v3, v4, &type metadata for LogCategory, v2);
  return sub_1000419D0(v6[1]);
}

unint64_t sub_100037B68()
{
  unint64_t result;

  result = qword_1000914A8;
  if (!qword_1000914A8)
  {
    result = swift_getWitnessTable(&unk_100060BA0, &type metadata for LogCategory);
    atomic_store(result, (unint64_t *)&qword_1000914A8);
  }
  return result;
}

uint64_t AuthorizationRemoteViewController.authenticatorHost.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  _OWORD v14[2];
  _QWORD aBlock[3];
  void *v16;
  void (*v17)(uint64_t);
  uint64_t v18;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  __chkstk_darwin(v1);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, (uint64_t)v0 + OBJC_IVAR___AuthorizationRemoteViewController_log, v1);
  v5 = *(unsigned __int8 *)(v2 + 80);
  v6 = (v5 + 16) & ~v5;
  v7 = swift_allocObject(&unk_10007B348, v6 + v3, v5 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v7 + v6, v4, v1);
  v17 = sub_100037DBC;
  v18 = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002AD04;
  v16 = &unk_10007B360;
  v8 = _Block_copy(aBlock);
  swift_release(v18);
  v9 = objc_msgSend(v0, "_remoteViewControllerProxyWithErrorHandler:", v8);
  _Block_release(v8);
  if (v9)
  {
    _bridgeAnyObjectToAny(_:)(v14, v9);
    swift_unknownObjectRelease(v9);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_100037F64((uint64_t)v14, (uint64_t)aBlock);
  if (v16)
  {
    v10 = sub_100025D1C(&qword_100091528);
    if (swift_dynamicCast(&v13, aBlock, (char *)&type metadata for Any + 8, v10, 6))
      return v13;
    else
      return 0;
  }
  else
  {
    sub_100027BE8((uint64_t)aBlock);
    return 0;
  }
}

uint64_t sub_100037D5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_100037DBC(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  type metadata accessor for Logger(0);
  if (a1)
  {
    swift_errorRetain(a1);
    v2 = swift_errorRetain(a1);
    v3 = Logger.logObject.getter(v2);
    v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc(12, -1);
      v6 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v5 = 138543362;
      v7 = _convertErrorToNSError(_:)(a1);
      v9 = v7;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v9, &v10, v5 + 4, v5 + 12);
      *v6 = v7;
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Could not obtain remote object with error %{public}@", v5, 0xCu);
      v8 = sub_100025D1C(&qword_1000911C0);
      swift_arrayDestroy(v6, 1, v8);
      swift_slowDealloc(v6, -1, -1);
      swift_slowDealloc(v5, -1, -1);
      swift_errorRelease(a1);

    }
    else
    {

      swift_errorRelease(a1);
      swift_errorRelease(a1);
    }
  }
}

uint64_t sub_100037F4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100037F5C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100037F64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100025D1C(&qword_1000914C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id static AuthorizationRemoteViewController._exportedInterface()()
{
  return sub_100037FD8(&protocolRef_LACUIAuthenticatorService);
}

id static AuthorizationRemoteViewController._remoteViewControllerInterface()()
{
  return sub_100037FD8(&protocolRef_LACUIAuthenticatorHost);
}

id sub_100037FD8(_QWORD *a1)
{
  return objc_msgSend((id)objc_opt_self(NSXPCInterface), "interfaceWithProtocol:", *a1);
}

id sub_100038020(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return objc_msgSend((id)objc_opt_self(NSXPCInterface), "interfaceWithProtocol:", *a3);
}

void AuthorizationRemoteViewController.presentUI(configuration:)(void *a1)
{
  char *v1;
  char *v2;
  uint64_t *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  char *v19;
  Swift::Bool canShowWhile;
  void *v21;
  char v22[24];
  char *v23;

  v2 = v1;
  v4 = sub_10002DA24();
  swift_beginAccess(v4, v22, 0, 0);
  v5 = (id)*v4;
  v6 = sub_10002DF1C();

  v7 = *(void **)&v2[OBJC_IVAR___AuthorizationRemoteViewController_terminateAssertion];
  *(_QWORD *)&v2[OBJC_IVAR___AuthorizationRemoteViewController_terminateAssertion] = v6;

  v8 = swift_allocObject(&unk_10007B3C0, 24, 7);
  swift_unknownObjectWeakInit(v8 + 16, v2);
  v9 = a1;
  swift_retain(v8);
  v10 = sub_100039688();
  v11 = sub_1000396AC();
  v12 = sub_1000396B4();
  v13 = sub_1000396C0(v9, 0, v10, 0, 1, v11, 0, v12, (uint64_t)sub_1000390F0, v8);
  v14 = swift_release(v8);
  v23 = v13;
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Authorization Sheet will appear", v17, 2u);
    swift_slowDealloc(v17, -1, -1);
  }

  v18 = swift_unknownObjectRetain(v2);
  sub_100039514(v18);
  v19 = v23;
  canShowWhile = LACUIDTOViewController._canShowWhileLocked()();
  sub_100039890(v2, canShowWhile, v19);

  v21 = *(void **)&v2[OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager];
  *(_QWORD *)&v2[OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager] = v19;

}

void sub_100038224(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *Strong;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  _BYTE v13[24];
  _BYTE v14[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v14, 0, 0);
  Strong = (_QWORD *)swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = Strong;
    v6 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *Strong) + 0x98))();

    if (v6)
    {
      if (a2)
        v7 = (void *)_convertErrorToNSError(_:)(a2);
      else
        v7 = 0;
      v8 = swift_allocObject(&unk_10007B3C0, 24, 7);
      swift_beginAccess(v3, v13, 0, 0);
      v9 = (void *)swift_unknownObjectWeakLoadStrong(v3);
      swift_unknownObjectWeakInit(v8 + 16, v9);

      v11[4] = sub_1000393F8;
      v12 = v8;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 1107296256;
      v11[2] = sub_100027144;
      v11[3] = &unk_10007B4F0;
      v10 = _Block_copy(v11);
      swift_release(v12);
      objc_msgSend(v6, "authenticatorServiceDidFinishWithError:reply:", v7, v10);
      swift_unknownObjectRelease(v6);
      _Block_release(v10);

    }
  }
}

id AuthorizationRemoteViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  id v13;
  objc_super v15;
  _QWORD v16[2];

  *(_QWORD *)&v3[OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___AuthorizationRemoteViewController_terminateAssertion] = 0;
  v6 = sub_100025D1C(&qword_1000914A0);
  v7 = swift_allocObject(v6, 56, 7);
  *(_OWORD *)(v7 + 16) = xmmword_1000607B0;
  v8 = v3;
  *(_QWORD *)(v7 + 32) = *(_QWORD *)sub_1000419B8();
  *(_QWORD *)(v7 + 40) = *(_QWORD *)sub_1000419C4();
  *(_QWORD *)(v7 + 48) = *(_QWORD *)sub_100041C40();
  v16[0] = v7;
  v9 = sub_100037B68();
  v10 = sub_100025D1C(&qword_1000914B0);
  v11 = sub_1000390B0(&qword_1000914B8, &qword_1000914B0);
  dispatch thunk of SetAlgebra.init<A>(_:)(v16, v10, v11, &type metadata for LogCategory, v9);
  sub_1000419D0(v16[1]);

  if (a2)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v8;
  v15.super_class = (Class)type metadata accessor for AuthorizationRemoteViewController(0);
  v13 = objc_msgSendSuper2(&v15, "initWithNibName:bundle:", v12, a3);

  return v13;
}

uint64_t type metadata accessor for AuthorizationRemoteViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_100092778;
  if (!qword_100092778)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AuthorizationRemoteViewController);
  return result;
}

id AuthorizationRemoteViewController.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  objc_super v11;
  _QWORD v12[2];

  *(_QWORD *)&v1[OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___AuthorizationRemoteViewController_terminateAssertion] = 0;
  v3 = sub_100025D1C(&qword_1000914A0);
  v4 = swift_allocObject(v3, 56, 7);
  *(_OWORD *)(v4 + 16) = xmmword_1000607B0;
  v5 = v1;
  *(_QWORD *)(v4 + 32) = *(_QWORD *)sub_1000419B8();
  *(_QWORD *)(v4 + 40) = *(_QWORD *)sub_1000419C4();
  *(_QWORD *)(v4 + 48) = *(_QWORD *)sub_100041C40();
  v12[0] = v4;
  v6 = sub_100037B68();
  v7 = sub_100025D1C(&qword_1000914B0);
  v8 = sub_1000390B0(&qword_1000914B8, &qword_1000914B0);
  dispatch thunk of SetAlgebra.init<A>(_:)(v12, v7, v8, &type metadata for LogCategory, v6);
  sub_1000419D0(v12[1]);

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for AuthorizationRemoteViewController(0);
  v9 = objc_msgSendSuper2(&v11, "initWithCoder:", a1);

  return v9;
}

id AuthorizationRemoteViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AuthorizationRemoteViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

void AuthorizationRemoteViewController.start(with:reply:)(void *a1, void (*a2)(id))
{
  id v4;
  id v5;
  id v6;

  v4 = objc_msgSend(a1, "validateConfiguration");
  if (v4)
  {
    v5 = v4;
    v6 = v4;
    a2(v5);

  }
  else
  {
    AuthorizationRemoteViewController.presentUI(configuration:)(a1);
    a2(0);
  }
}

uint64_t AuthorizationRemoteViewController.stop(reply:)(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t (*v7)();
  uint64_t v8;
  uint64_t v9;

  v3 = *(void **)(v1 + OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager);
  if (v3)
  {
    v4 = (void *)objc_opt_self(LAErrorHelper);
    v5 = v3;
    v6 = objc_msgSend(v4, "errorWithCode:", -4);
    v7 = sub_10003975C();
    v9 = v8;
    sub_10003976C((uint64_t)v6, (uint64_t (*)(uint64_t))v7, v8);

    swift_release(v9);
  }
  return a1(0);
}

void sub_1000389F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_100038D70(a2, a3, a4, a5);
}

uint64_t sub_100038A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[5];
  _QWORD *v27;

  v8 = type metadata accessor for DispatchWorkItemFlags(0);
  v25 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for DispatchQoS(0);
  v11 = *(_QWORD *)(v24 - 8);
  __chkstk_darwin(v24);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1000287F0(0, (unint64_t *)&qword_100091FA0, OS_dispatch_queue_ptr);
  v15 = (void *)static OS_dispatch_queue.main.getter(v14);
  v16 = (_QWORD *)swift_allocObject(&unk_10007B438, 48, 7);
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  v16[5] = a4;
  aBlock[4] = sub_100038FF0;
  v27 = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100027144;
  aBlock[3] = &unk_10007B450;
  v17 = _Block_copy(aBlock);
  v18 = v27;
  swift_errorRetain(a1);
  swift_retain(a3);
  swift_retain(a4);
  v19 = swift_release(v18);
  static DispatchQoS.unspecified.getter(v19);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v20 = sub_10002CFD8();
  v21 = sub_100025D1C((uint64_t *)&unk_100091FB0);
  v22 = sub_1000390B0((unint64_t *)&qword_1000915E0, (uint64_t *)&unk_100091FB0);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v21, v22, v8, v20);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v13, v10, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v24);
}

uint64_t sub_100038CC8(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t (*v7)();
  uint64_t v8;
  uint64_t v9;

  v3 = *(void **)(a1 + OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager);
  if (v3)
  {
    v4 = (void *)objc_opt_self(LAErrorHelper);
    v5 = v3;
    v6 = objc_msgSend(v4, "errorWithCode:", -4);
    v7 = sub_10003975C();
    v9 = v8;
    sub_10003976C((uint64_t)v6, (uint64_t (*)(uint64_t))v7, v8);

    swift_release(v9);
  }
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, 0);
}

void sub_100038D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  void *v7;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  _QWORD v17[5];
  _QWORD *v18;

  v7 = *(void **)((char *)v4 + OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager);
  if (v7)
  {
    v10 = v7;
    sub_10003978C(a1, a2, (uint64_t)v10);

  }
  v11 = (*(uint64_t (**)(void))((swift_isaMask & *v4) + 0x98))();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = swift_allocObject(&unk_10007B3C0, 24, 7);
    swift_unknownObjectWeakInit(v13 + 16, v4);
    v14 = (_QWORD *)swift_allocObject(&unk_10007B3E8, 40, 7);
    v14[2] = a3;
    v14[3] = a4;
    v14[4] = v13;
    v17[4] = sub_100038FB0;
    v18 = v14;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 1107296256;
    v17[2] = sub_10002AD04;
    v17[3] = &unk_10007B400;
    v15 = _Block_copy(v17);
    v16 = v18;
    swift_retain(a4);
    swift_release(v16);
    objc_msgSend(v12, "authenticatorServiceDidObtainAuthenticationWithReply:", v15);
    swift_unknownObjectRelease(v12);
    _Block_release(v15);
  }
}

uint64_t sub_100038EBC()
{
  return type metadata accessor for AuthorizationRemoteViewController(0);
}

uint64_t sub_100038EC4(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = "\b";
  v4[1] = "\b";
  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_100038F3C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100038F60()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100038F84()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100038FB0(uint64_t a1)
{
  uint64_t *v1;

  return sub_100038A0C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100038FBC()
{
  _QWORD *v0;

  swift_errorRelease(v0[2]);
  swift_release(v0[4]);
  swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

void sub_100038FF0()
{
  _QWORD *v0;
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  void *v5;
  id v6;
  uint64_t (*v7)();
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[24];

  v1 = (void (*)(uint64_t))v0[3];
  if (v0[2])
  {
    v1(0);
  }
  else
  {
    v2 = v0[5] + 16;
    v1(1);
    swift_beginAccess(v2, v10, 0, 0);
    Strong = swift_unknownObjectWeakLoadStrong(v2);
    if (Strong)
    {
      v4 = (void *)Strong;
      v5 = *(void **)(Strong + OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager);
      v6 = v5;

      if (v5)
      {
        v7 = sub_10003975C();
        v9 = v8;
        sub_10003976C(0, (uint64_t (*)(uint64_t))v7, v8);
        swift_release(v9);

      }
    }
  }
}

uint64_t sub_1000390B0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_10002C0E0(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1000390F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _BYTE v12[24];

  swift_beginAccess(v1 + 16, v12, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1 + 16);
  if (Strong)
  {
    v4 = (char *)Strong;
    v5 = Logger.logObject.getter(Strong);
    v6 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Authorization Sheet did finish", v7, 2u);
      swift_slowDealloc(v7, -1, -1);
    }

    v8 = *(void **)&v4[OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager];
    if (v8)
    {
      v9 = swift_allocObject(&unk_10007B3C0, 24, 7);
      swift_unknownObjectWeakInit(v9 + 16, v4);
      v10 = swift_allocObject(&unk_10007B488, 32, 7);
      *(_QWORD *)(v10 + 16) = v9;
      *(_QWORD *)(v10 + 24) = a1;
      v11 = v8;
      swift_retain(v9);
      swift_errorRetain(a1);
      sub_10003976C(a1, (uint64_t (*)(uint64_t))sub_100039260, v10);
      swift_release(v10);
      swift_release(v9);

    }
  }
}

void sub_100039260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD aBlock[5];
  uint64_t v9;
  char v10[24];

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  swift_beginAccess(v2 + 16, v10, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2 + 16);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = swift_allocObject(&unk_10007B4B0, 32, 7);
    *(_QWORD *)(v5 + 16) = v2;
    *(_QWORD *)(v5 + 24) = v1;
    sub_1000287F0(0, &qword_100091F90, UIDevice_ptr);
    swift_retain(v2);
    swift_errorRetain(v1);
    swift_retain(v2);
    swift_errorRetain(v1);
    if (sub_1000557C4())
    {
      aBlock[4] = sub_1000393F0;
      v9 = v5;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100027144;
      aBlock[3] = &unk_10007B4C8;
      v6 = _Block_copy(aBlock);
      v7 = v9;
      swift_retain(v5);
      swift_release(v7);
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v6);
      _Block_release(v6);
    }
    else
    {
      sub_100038224(v2, v1);
    }
    swift_release(v5);
    swift_release(v2);
    swift_errorRelease(v1);

  }
}

uint64_t sub_1000393C4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_errorRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_1000393F0()
{
  uint64_t v0;

  sub_100038224(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_1000393F8()
{
  uint64_t v0;
  uint64_t Strong;
  void *v2;
  void *v3;
  id v4;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  _BYTE v8[24];

  swift_beginAccess(v0 + 16, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v0 + 16);
  if (Strong)
  {
    v2 = (void *)Strong;
    v3 = *(void **)(Strong + OBJC_IVAR___AuthorizationRemoteViewController_terminateAssertion);
    v4 = v3;

    if (v3)
    {
      sub_10002D8C0();

    }
  }
  v5 = sub_10002DA24();
  swift_beginAccess(v5, &v7, 0, 0);
  v6 = (id)*v5;
  sub_10002DC90();

}

void AuthorizationRemoteViewController.dismiss(_:)()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t sub_1000394C8(uint64_t a1)
{
  uint64_t v1;
  _BYTE v3[24];

  v1 = a1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate;
  swift_beginAccess(a1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate, v3, 0, 0);
  return swift_unknownObjectWeakLoadStrong(v1);
}

uint64_t sub_100039514(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  _BYTE v5[24];

  v3 = *v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate;
  swift_beginAccess(v3, v5, 1, 0);
  swift_unknownObjectWeakAssign(v3, a1);
  return swift_unknownObjectRelease(a1);
}

void (*sub_100039574(_QWORD *a1))(uint64_t a1, char a2)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  v4 = *v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate;
  swift_beginAccess(v4, v3, 0, 0);
  v3[9] = swift_unknownObjectWeakLoadStrong(v4);
  return sub_1000395EC;
}

void sub_1000395EC(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 72);
  v4 = **(_QWORD **)(*(_QWORD *)a1 + 80);
  v5 = v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate;
  if ((a2 & 1) != 0)
  {
    swift_beginAccess(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate, v2 + 3, 1, 0);
    swift_unknownObjectWeakAssign(v5, v3);
    v3 = v2[9];
  }
  else
  {
    swift_beginAccess(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate, v2 + 6, 1, 0);
    swift_unknownObjectWeakAssign(v5, v3);
  }
  swift_unknownObjectRelease(v3);
  free(v2);
}

id sub_100039688()
{
  return objc_msgSend(objc_allocWithZone((Class)LALocalBackoffCounter), "init");
}

uint64_t sub_1000396AC()
{
  return 2;
}

unint64_t sub_1000396B4()
{
  return sub_100026D4C((uint64_t)&_swiftEmptyArrayStorage);
}

char *sub_1000396C0(void *a1, void *a2, void *a3, uint64_t a4, char a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  char v17;

  v17 = a5 & 1;
  type metadata accessor for AuthorizationViewModel(0);
  return sub_100050920(a1, a2, a3, a4, v17, a6, a7, a8, a9, a10);
}

uint64_t (*sub_10003975C())()
{
  return nullsub_12;
}

uint64_t sub_10003976C(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  return sub_100051F28(a1, a2, a3);
}

void sub_10003978C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  Class isa;
  uint64_t v16;

  v6 = type metadata accessor for String.Encoding(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void **)(a3 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
  static String.Encoding.utf8.getter(v8);
  v12 = String.data(using:allowLossyConversion:)(v10, 0, a1, a2);
  v14 = v13;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  isa = 0;
  if (v14 >> 60 != 15)
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10002C9A0(v12, v14);
  }
  objc_msgSend(v11, "setCredential:type:", isa, -9);

}

void sub_100039890(void *a1, char a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  Class isa;
  _QWORD v59[4];

  v6 = type metadata accessor for UIHostingControllerSizingOptions(0);
  __chkstk_darwin(v6);
  v8 = (char *)v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100043E14();
  v11 = v10;
  v12 = type metadata accessor for AuthorizationViewModel(0);
  v13 = sub_100039E04();
  v14 = static ObservableObject.environmentStore.getter(v12, v13);
  v59[0] = v9;
  v59[1] = v11;
  v59[2] = v14;
  v59[3] = a3;
  v15 = objc_allocWithZone((Class)sub_100025D1C(&qword_1000915F0));
  a3;
  v16 = (void *)UIHostingController.init(rootView:)(v59);
  v17 = objc_msgSend(v16, "view");
  if (!v17)
  {
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v18 = v17;
  v19 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
  objc_msgSend(v18, "setBackgroundColor:", v19);

  sub_1000287F0(0, &qword_100091F90, UIDevice_ptr);
  if (sub_1000557C4() && !sub_1000501B8())
  {
    static UIHostingControllerSizingOptions.preferredContentSize.getter();
    dispatch thunk of UIHostingController.sizingOptions.setter(v8);
    objc_msgSend(v16, "setModalPresentationStyle:", 2);
    objc_msgSend(a1, "presentViewController:animated:completion:", v16, a2 & 1, 0);
    goto LABEL_17;
  }
  v20 = objc_msgSend(a1, "view");
  if (!v20)
    goto LABEL_19;
  v21 = v20;
  v22 = objc_msgSend(v16, "view");
  if (!v22)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v23 = v22;
  objc_msgSend(v21, "addSubview:", v22);

  objc_msgSend(a1, "addChildViewController:", v16);
  objc_msgSend(v16, "didMoveToParentViewController:", a1);
  v24 = objc_msgSend(v16, "view");
  if (!v24)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v25 = v24;
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v26 = sub_100025D1C(&qword_100090DF0);
  v27 = swift_allocObject(v26, 64, 7);
  *(_OWORD *)(v27 + 16) = xmmword_100060820;
  v28 = objc_msgSend(v16, "view");
  if (!v28)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v29 = v28;
  v30 = objc_msgSend(v28, "leadingAnchor");

  v31 = objc_msgSend(a1, "view");
  if (!v31)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v32 = v31;
  v33 = objc_msgSend(v31, "leadingAnchor");

  v34 = objc_msgSend(v30, "constraintEqualToAnchor:", v33);
  *(_QWORD *)(v27 + 32) = v34;
  v35 = objc_msgSend(v16, "view");
  if (!v35)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v36 = v35;
  v37 = objc_msgSend(v35, "trailingAnchor");

  v38 = objc_msgSend(a1, "view");
  if (!v38)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v39 = v38;
  v40 = objc_msgSend(v38, "trailingAnchor");

  v41 = objc_msgSend(v37, "constraintEqualToAnchor:", v40);
  *(_QWORD *)(v27 + 40) = v41;
  v42 = objc_msgSend(v16, "view");
  if (!v42)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v43 = v42;
  v44 = objc_msgSend(v42, "topAnchor");

  v45 = objc_msgSend(a1, "view");
  if (!v45)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v46 = v45;
  v47 = objc_msgSend(v45, "topAnchor");

  v48 = objc_msgSend(v44, "constraintEqualToAnchor:", v47);
  *(_QWORD *)(v27 + 48) = v48;
  v49 = objc_msgSend(v16, "view");
  if (!v49)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v50 = v49;
  v51 = objc_msgSend(v49, "bottomAnchor");

  v52 = objc_msgSend(a1, "view");
  if (v52)
  {
    v53 = v52;
    v54 = (void *)objc_opt_self(NSLayoutConstraint);
    v55 = objc_msgSend(v53, "bottomAnchor");

    v56 = objc_msgSend(v51, "constraintEqualToAnchor:", v55);
    *(_QWORD *)(v27 + 56) = v56;
    v59[0] = v27;
    specialized Array._endMutation()();
    v57 = v59[0];
    sub_1000287F0(0, (unint64_t *)&qword_100090DF8, NSLayoutConstraint_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v57);
    objc_msgSend(v54, "activateConstraints:", isa);

LABEL_17:
    return;
  }
LABEL_29:
  __break(1u);
}

unint64_t sub_100039E04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000915E8;
  if (!qword_1000915E8)
  {
    v1 = type metadata accessor for AuthorizationViewModel(255);
    result = swift_getWitnessTable(&unk_100061998, v1);
    atomic_store(result, (unint64_t *)&qword_1000915E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationViewManager()
{
  return &type metadata for AuthorizationViewManager;
}

uint64_t sub_100039E5C()
{
  uint64_t v0;
  uint64_t v2;

  v0 = sub_100025D1C(&qword_1000915F8);
  Binding.wrappedValue.getter(&v2, v0);
  return v2;
}

uint64_t sub_100039EA8(char a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_BYTE *)(v1 + 24);
  v7 = *(_QWORD *)(v1 + 8);
  v8 = v2;
  v9 = v3;
  v6 = a1;
  v4 = sub_100025D1C(&qword_1000915F8);
  return Binding.wrappedValue.setter(&v6, v4);
}

void (*sub_100039EF8(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = *(_QWORD *)(v1 + 8);
  v5 = *(_QWORD *)(v1 + 16);
  v3[3] = v4;
  v3[4] = v5;
  v6 = *(_BYTE *)(v1 + 24);
  *((_BYTE *)v3 + 19) = v6;
  *v3 = v4;
  v3[1] = v5;
  *((_BYTE *)v3 + 16) = v6;
  swift_retain(v4);
  swift_retain(v5);
  v7 = sub_100025D1C(&qword_1000915F8);
  v3[5] = v7;
  Binding.wrappedValue.getter((_QWORD *)((char *)v3 + 17), v7);
  return sub_100039F7C;
}

void sub_100039F7C(uint64_t a1)
{
  _QWORD *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v1 = *(_QWORD **)a1;
  v2 = *(_BYTE *)(*(_QWORD *)a1 + 17);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v5 = *(_BYTE *)(*(_QWORD *)a1 + 19);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  *v1 = v6;
  v1[1] = v4;
  *((_BYTE *)v1 + 16) = v5;
  *((_BYTE *)v1 + 18) = v2;
  Binding.wrappedValue.setter((char *)v1 + 18, v3);
  swift_release(v6);
  swift_release(v4);
  free(v1);
}

uint64_t sub_100039FD8()
{
  uint64_t v0;
  uint64_t v2;

  v0 = sub_100025D1C(&qword_1000915F8);
  Binding.projectedValue.getter(&v2, v0);
  return v2;
}

uint64_t sub_10003A028()
{
  return sub_10003A260((uint64_t (*)(uint64_t))&Binding.wrappedValue.getter);
}

uint64_t type metadata accessor for PasscodeEmbeddedView(uint64_t a1)
{
  return sub_1000377E0(a1, (uint64_t *)&unk_1000928B0, (uint64_t)&nominal type descriptor for PasscodeEmbeddedView);
}

uint64_t sub_10003A048(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_100025D1C(&qword_100091F40);
  __chkstk_darwin(v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PasscodeEmbeddedView(0);
  sub_100027F28(a1, (uint64_t)v4, &qword_100091F40);
  v5 = sub_100025D1C(&qword_100091600);
  Binding.wrappedValue.setter(v4, v5);
  return sub_10002BD8C(a1, &qword_100091F40);
}

void (*sub_10003A0F0(void **a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  size_t v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = *(_QWORD *)(*(_QWORD *)(sub_100025D1C(&qword_100091F40) - 8) + 64);
  *a1 = malloc(v3);
  v4 = malloc(v3);
  a1[1] = v4;
  v5 = sub_100025D1C(&qword_100091600);
  a1[2] = (void *)v5;
  v6 = malloc(*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
  a1[3] = v6;
  v7 = type metadata accessor for PasscodeEmbeddedView(0);
  sub_100027F28(v1 + *(int *)(v7 + 24), (uint64_t)v6, &qword_100091600);
  Binding.wrappedValue.getter(v4, v5);
  return sub_10003A1B0;
}

void sub_10003A1B0(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;

  v3 = *(_QWORD *)(a1 + 16);
  v2 = *(void **)(a1 + 24);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  if ((a2 & 1) != 0)
  {
    sub_100027F28(*(_QWORD *)(a1 + 8), (uint64_t)v4, &qword_100091F40);
    Binding.wrappedValue.setter(v4, v3);
    sub_10002BD8C((uint64_t)v2, &qword_100091600);
    v6 = (uint64_t)v5;
    v7 = &qword_100091F40;
  }
  else
  {
    Binding.wrappedValue.setter(*(_QWORD *)(a1 + 8), v3);
    v7 = &qword_100091600;
    v6 = (uint64_t)v2;
  }
  sub_10002BD8C(v6, v7);
  free(v2);
  free(v5);
  free(v4);
}

uint64_t sub_10003A254()
{
  return sub_10003A260((uint64_t (*)(uint64_t))&Binding.projectedValue.getter);
}

uint64_t sub_10003A260(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;

  type metadata accessor for PasscodeEmbeddedView(0);
  v2 = sub_100025D1C(&qword_100091600);
  return a1(v2);
}

uint64_t sub_10003A2AC@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  _BYTE v35[24];

  v33 = a8;
  v31 = a6;
  v32 = a7;
  v34 = a10;
  v18 = sub_100025D1C(&qword_100091608);
  __chkstk_darwin(v18);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = objc_allocWithZone((Class)type metadata accessor for PasscodeEmbeddedParentViewController(0));
  sub_100027180(a11, a12);
  v22 = sub_10003A94C(a1, a2, a3, a4, a5, a11, a12);
  v24 = v31;
  v23 = v32;
  *(_QWORD *)a9 = v22;
  *(_QWORD *)(a9 + 8) = v24;
  *(_QWORD *)(a9 + 16) = v23;
  *(_BYTE *)(a9 + 24) = v33;
  v25 = type metadata accessor for PasscodeEmbeddedView(0);
  v26 = v34;
  sub_100027F28(v34, a9 + *(int *)(v25 + 24), &qword_100091600);
  sub_10003AB14(a9, (uint64_t)v20);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v20, 0, 1, v25);
  v27 = (uint64_t)&v22[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView];
  swift_beginAccess(&v22[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView], v35, 33, 0);
  swift_retain(v24);
  swift_retain(v23);
  v28 = v22;
  sub_10003AB58((uint64_t)v20, v27);
  swift_endAccess(v35);
  sub_100027EB8(a11, a12);

  swift_release(v23);
  swift_release(v24);
  return sub_10002BD8C(v26, &qword_100091600);
}

char *sub_10003A470(uint64_t a1, char a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  objc_class *v7;
  id v15;

  v15 = objc_allocWithZone(v7);
  return sub_10003A94C(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_10003A4E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v10[24];

  v3 = sub_100025D1C(&qword_100091608);
  __chkstk_darwin(v3);
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_10003AB14(a1, (uint64_t)v5);
  v6 = type metadata accessor for PasscodeEmbeddedView(0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 0, 1, v6);
  v7 = v1 + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView;
  swift_beginAccess(v1 + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView, v10, 33, 0);
  sub_10003AB58((uint64_t)v5, v7);
  return swift_endAccess(v10);
}

uint64_t type metadata accessor for PasscodeEmbeddedParentViewController(uint64_t a1)
{
  return sub_1000377E0(a1, (uint64_t *)&unk_1000928C0, (uint64_t)&nominal type descriptor for PasscodeEmbeddedParentViewController);
}

id sub_10003A5C4()
{
  id *v0;

  return *v0;
}

id sub_10003A5CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD v22[3];
  char v23;
  uint64_t v24;

  v2 = v1;
  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)v22 - v9;
  v11 = sub_100025D1C(&qword_100091F40);
  __chkstk_darwin(v11);
  v13 = (_QWORD *)((char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for PasscodeEmbeddedView(0);
  v14 = sub_100025D1C(&qword_100091600);
  Binding.wrappedValue.getter(v13, v14);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4))
  {
    sub_10002BD8C((uint64_t)v13, &qword_100091F40);
    v15 = 0.0;
  }
  else
  {
    (*(void (**)(char *, _QWORD *, uint64_t))(v5 + 16))(v10, v13, v4);
    v16 = sub_10002BD8C((uint64_t)v13, &qword_100091F40);
    Date.init()(v16);
    v15 = Date.timeIntervalSince(_:)(v8);
    v17 = *(void (**)(char *, uint64_t))(v5 + 8);
    v17(v8, v4);
    v17(v10, v4);
  }
  v18 = *(_QWORD *)(v2 + 16);
  v19 = *(_BYTE *)(v2 + 24);
  v22[1] = *(_QWORD *)(v2 + 8);
  v22[2] = v18;
  v23 = v19;
  v20 = sub_100025D1C(&qword_1000915F8);
  Binding.wrappedValue.getter(&v24, v20);
  return objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeViewController), "setBackoffTimeout:showBackoffTitle:passcodeFocused:", 0, v24, v15);
}

id sub_10003A798(char a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeViewController), "setBackoffTimeout:showBackoffTitle:passcodeFocused:", 0, a1 & 1);
}

uint64_t sub_10003A7CC(uint64_t a1, char a2)
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)(a1, a2 & 1);
}

uint64_t sub_10003A804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_10003C910(&qword_100091710, (uint64_t)&unk_100060860);
  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10003A864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_10003C910(&qword_100091710, (uint64_t)&unk_100060860);
  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10003A8C4()
{
  return static View._viewListCount(inputs:)();
}

void sub_10003A8DC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10003C910(&qword_100091710, (uint64_t)&unk_100060860);
  UIViewControllerRepresentable.body.getter(a1, v2);
  __break(1u);
}

uint64_t sub_10003A910@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = type metadata accessor for PasscodeEmbeddedView(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

char *sub_10003A94C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  char *v7;
  char *v8;
  objc_class *ObjectType;
  char *v15;
  uint64_t v16;
  uint64_t *v17;
  id v18;
  char *v19;
  id v20;
  id v21;
  NSString v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  void *v26;
  char *v27;
  id v28;
  objc_super v31;

  v8 = v7;
  ObjectType = (objc_class *)swift_getObjectType(v8);
  v15 = &v8[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView];
  v16 = type metadata accessor for PasscodeEmbeddedView(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  v17 = (uint64_t *)&v8[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_verifyPasscode];
  *v17 = 0;
  v17[1] = 0;
  v18 = objc_allocWithZone((Class)PasscodeEmbeddedCustomizableViewController);
  v19 = v8;
  v20 = objc_msgSend(v18, "initWithPasscodeLength:alphanumeric:", a1, a2 & 1);
  *(_QWORD *)&v19[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeViewController] = v20;
  v21 = v20;
  if (a4)
  {
    v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a4);
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v20, "setPlaceholderText:", v22);

  v23 = *v17;
  v24 = v17[1];
  *v17 = a6;
  v17[1] = a7;
  sub_100027180(a6, a7);
  sub_100027EB8(v23, v24);
  v19[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_dismissKeyboardOnDissappear] = a5 & 1;

  v31.receiver = v19;
  v31.super_class = ObjectType;
  v25 = (char *)objc_msgSendSuper2(&v31, "initWithNibName:bundle:", 0, 0);
  v26 = *(void **)&v25[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeViewController];
  v27 = v25;
  v28 = v26;
  objc_msgSend(v28, "setDelegate:", v27);
  sub_100027EB8(a6, a7);

  return v27;
}

uint64_t sub_10003AB14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PasscodeEmbeddedView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003AB58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100025D1C(&qword_100091608);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_10003ABA0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  char *v3;

  v1 = &v0[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView];
  v2 = type metadata accessor for PasscodeEmbeddedView(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = &v0[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_verifyPasscode];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010006DE50, "CoreAuthUI/PasscodeEmbeddedView.swift", 37, 2, 60, 0);
  __break(1u);
}

void sub_10003ACF0()
{
  char *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  Class isa;

  v1 = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  objc_msgSend(v0, "setView:", v1);

  v2 = objc_msgSend(v0, "view");
  if (!v2)
  {
    __break(1u);
    goto LABEL_14;
  }
  v3 = v2;
  v4 = *(void **)&v0[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeViewController];
  v5 = objc_msgSend(v4, "view");
  if (!v5)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v6 = v5;
  objc_msgSend(v3, "addSubview:", v5);

  objc_msgSend(v0, "addChildViewController:", v4);
  objc_msgSend(v4, "didMoveToParentViewController:", v0);
  v7 = objc_msgSend(v4, "view");
  if (!v7)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v8 = v7;
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = sub_100025D1C(&qword_100090DF0);
  v10 = swift_allocObject(v9, 64, 7);
  *(_OWORD *)(v10 + 16) = xmmword_100060820;
  v11 = objc_msgSend(v4, "view");
  if (!v11)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v12 = v11;
  v13 = objc_msgSend(v11, "trailingAnchor");

  v14 = objc_msgSend(v0, "view");
  if (!v14)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v15 = v14;
  v16 = objc_msgSend(v14, "trailingAnchor");

  v17 = objc_msgSend(v13, "constraintEqualToAnchor:", v16);
  *(_QWORD *)(v10 + 32) = v17;
  v18 = objc_msgSend(v4, "view");
  if (!v18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v19 = v18;
  v20 = objc_msgSend(v18, "leadingAnchor");

  v21 = objc_msgSend(v0, "view");
  if (!v21)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v22 = v21;
  v23 = objc_msgSend(v21, "leadingAnchor");

  v24 = objc_msgSend(v20, "constraintEqualToAnchor:", v23);
  *(_QWORD *)(v10 + 40) = v24;
  v25 = objc_msgSend(v4, "view");
  if (!v25)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v26 = v25;
  v27 = objc_msgSend(v25, "topAnchor");

  v28 = objc_msgSend(v0, "view");
  if (!v28)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v29 = v28;
  v30 = objc_msgSend(v28, "topAnchor");

  v31 = objc_msgSend(v27, "constraintEqualToAnchor:", v30);
  *(_QWORD *)(v10 + 48) = v31;
  v32 = objc_msgSend(v4, "view");
  if (!v32)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v33 = v32;
  v34 = objc_msgSend(v32, "bottomAnchor");

  v35 = objc_msgSend(v0, "view");
  if (v35)
  {
    v36 = v35;
    v37 = (void *)objc_opt_self(NSLayoutConstraint);
    v38 = objc_msgSend(v36, "bottomAnchor");

    v39 = objc_msgSend(v34, "constraintEqualToAnchor:", v38);
    *(_QWORD *)(v10 + 56) = v39;
    specialized Array._endMutation()();
    sub_10003B11C();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v10);
    objc_msgSend(v37, "activateConstraints:", isa);

    return;
  }
LABEL_23:
  __break(1u);
}

unint64_t sub_10003B11C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100090DF8;
  if (!qword_100090DF8)
  {
    v1 = objc_opt_self(NSLayoutConstraint);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100090DF8);
  }
  return result;
}

uint64_t sub_10003B18C(char a1)
{
  void *v1;
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType(v1);
  v4 = sub_100025D1C(&qword_100091FC0);
  __chkstk_darwin(v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13.receiver = v1;
  v13.super_class = ObjectType;
  objc_msgSendSuper2(&v13, "viewWillAppear:", a1 & 1);
  v7 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  type metadata accessor for MainActor(0);
  v8 = v1;
  v9 = static MainActor.shared.getter();
  v10 = (_QWORD *)swift_allocObject(&unk_10007B550, 40, 7);
  v10[2] = v9;
  v10[3] = &protocol witness table for MainActor;
  v10[4] = v8;
  v11 = sub_10003B510((uint64_t)v6, (uint64_t)&unk_100091620, (uint64_t)v10);
  return swift_release(v11);
}

uint64_t sub_10003B294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[8] = a1;
  v4[9] = a4;
  v5 = type metadata accessor for PasscodeEmbeddedView(0);
  v4[10] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[11] = v6;
  v4[12] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4[13] = type metadata accessor for MainActor(0);
  v4[14] = static MainActor.shared.getter();
  return swift_task_switch(sub_10003B30C, 0, 0);
}

uint64_t sub_10003B30C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 104);
  *(_QWORD *)(v0 + 120) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10003B36C, v2, v3);
}

uint64_t sub_10003B36C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 72);
  swift_release(*(_QWORD *)(v0 + 120));
  v4 = v3 + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView;
  swift_beginAccess(v4, v0 + 16, 0, 0);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v4, 1, v1);
  if (!v5)
  {
    v6 = *(_QWORD *)(v0 + 96);
    sub_10003AB14(v4, v6);
    v7 = *(_QWORD *)(v6 + 16);
    v8 = *(_BYTE *)(v6 + 24);
    *(_QWORD *)(v0 + 40) = *(_QWORD *)(v6 + 8);
    *(_QWORD *)(v0 + 48) = v7;
    *(_BYTE *)(v0 + 56) = v8;
    *(_BYTE *)(v0 + 57) = 1;
    v9 = sub_100025D1C(&qword_1000915F8);
    Binding.wrappedValue.setter(v0 + 57, v9);
    sub_10003C950(v6);
  }
  v10 = *(_QWORD *)(v0 + 104);
  **(_BYTE **)(v0 + 64) = v5 != 0;
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  return swift_task_switch(sub_10003B478, v11, v12);
}

uint64_t sub_10003B478()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  swift_release(*(_QWORD *)(v0 + 112));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10003B4B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc(dword_10009161C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003CAD8;
  return sub_10003B294(a1, v6, v7, v4);
}

uint64_t sub_10003B510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10002BD8C(a1, &qword_100091FC0);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_10007B618, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  v17 = sub_100025D1C((uint64_t *)&unk_1000920D0);
  if (v14 | v12)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v12;
    v20[3] = v14;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v8, v18, v17, &unk_100091720, v16);
}

id sub_10003B778(char a1)
{
  void *v1;
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id result;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType(v1);
  v4 = sub_100025D1C(&qword_100091FC0);
  __chkstk_darwin(v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13.receiver = v1;
  v13.super_class = ObjectType;
  result = objc_msgSendSuper2(&v13, "viewWillDisappear:", a1 & 1);
  if (*((_BYTE *)v1 + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_dismissKeyboardOnDissappear) == 1)
  {
    v8 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
    type metadata accessor for MainActor(0);
    v9 = v1;
    v10 = static MainActor.shared.getter();
    v11 = (_QWORD *)swift_allocObject(&unk_10007B578, 40, 7);
    v11[2] = v10;
    v11[3] = &protocol witness table for MainActor;
    v11[4] = v9;
    v12 = sub_10003B510((uint64_t)v6, (uint64_t)&unk_100091630, (uint64_t)v11);
    return (id)swift_release(v12);
  }
  return result;
}

uint64_t sub_10003B894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[8] = a1;
  v4[9] = a4;
  v5 = type metadata accessor for PasscodeEmbeddedView(0);
  v4[10] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[11] = v6;
  v4[12] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4[13] = type metadata accessor for MainActor(0);
  v4[14] = static MainActor.shared.getter();
  return swift_task_switch(sub_10003B90C, 0, 0);
}

uint64_t sub_10003B90C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 104);
  *(_QWORD *)(v0 + 120) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10003B96C, v2, v3);
}

uint64_t sub_10003B96C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 72);
  swift_release(*(_QWORD *)(v0 + 120));
  v4 = v3 + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView;
  swift_beginAccess(v4, v0 + 16, 0, 0);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v4, 1, v1);
  if (!v5)
  {
    v6 = *(_QWORD *)(v0 + 96);
    sub_10003AB14(v4, v6);
    v7 = *(_QWORD *)(v6 + 16);
    v8 = *(_BYTE *)(v6 + 24);
    *(_QWORD *)(v0 + 40) = *(_QWORD *)(v6 + 8);
    *(_QWORD *)(v0 + 48) = v7;
    *(_WORD *)(v0 + 56) = v8;
    v9 = sub_100025D1C(&qword_1000915F8);
    Binding.wrappedValue.setter(v0 + 57, v9);
    sub_10003C950(v6);
  }
  v10 = *(_QWORD *)(v0 + 104);
  **(_BYTE **)(v0 + 64) = v5 != 0;
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  return swift_task_switch(sub_10003CADC, v11, v12);
}

uint64_t sub_10003BA70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc(dword_10009162C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003CAD8;
  return sub_10003B894(a1, v6, v7, v4);
}

uint64_t sub_10003BBF0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4
                                                                 + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_verifyPasscode);
  if (v5)
  {
    v9 = result;
    v10 = *(_QWORD *)(v4 + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_verifyPasscode + 8);
    swift_retain(v10);
    v5(v9, a2, a3, a4);
    return sub_100027EB8((uint64_t)v5, v10);
  }
  return result;
}

void sub_10003BD60()
{
  _swift_stdlib_reportUnimplementedInitializer("CoreAuthUI.PasscodeEmbeddedParentViewController", 47, "init(nibName:bundle:)", 21, 0);
  __break(1u);
}

uint64_t sub_10003BE10()
{
  return sub_10003C910(&qword_100091638, (uint64_t)&unk_1000608D8);
}

void *sub_10003BE34()
{
  return &protocol witness table for Never;
}

char *sub_10003BE40(char *a1, char **a2, uint64_t a3)
{
  int v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain(v5);
  }
  else
  {
    v6 = a2[1];
    v7 = a2[2];
    *((_QWORD *)a1 + 1) = v6;
    *((_QWORD *)a1 + 2) = v7;
    a1[24] = *((_BYTE *)a2 + 24);
    v8 = *(int *)(a3 + 24);
    v9 = &a1[v8];
    v10 = (uint64_t)a2 + v8;
    v11 = *(uint64_t *)((char *)a2 + v8);
    v12 = *(uint64_t *)((char *)a2 + v8 + 8);
    *(_QWORD *)v9 = v11;
    *((_QWORD *)v9 + 1) = v12;
    v13 = v5;
    swift_retain(v6);
    swift_retain(v7);
    swift_retain(v11);
    swift_retain(v12);
    v14 = *(int *)(sub_100025D1C(&qword_100091600) + 32);
    v15 = &v9[v14];
    v16 = (const void *)(v10 + v14);
    v17 = type metadata accessor for Date(0);
    v18 = *(_QWORD *)(v17 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      v19 = sub_100025D1C(&qword_100091F40);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
  }
  return a1;
}

uint64_t sub_10003BF7C(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  swift_release(*(_QWORD *)(a1 + 8));
  swift_release(*(_QWORD *)(a1 + 16));
  v4 = (_QWORD *)(a1 + *(int *)(a2 + 24));
  swift_release(*v4);
  swift_release(v4[1]);
  v5 = (char *)v4 + *(int *)(sub_100025D1C(&qword_100091600) + 32);
  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  return result;
}

uint64_t sub_10003C02C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  char *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = *(void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = *(int *)(a3 + 24);
  v8 = (_QWORD *)(a1 + v7);
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a2 + v7);
  v11 = *(_QWORD *)(a2 + v7 + 8);
  *v8 = v10;
  v8[1] = v11;
  v12 = v4;
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v10);
  swift_retain(v11);
  v13 = *(int *)(sub_100025D1C(&qword_100091600) + 32);
  v14 = (char *)v8 + v13;
  v15 = (const void *)(v9 + v13);
  v16 = type metadata accessor for Date(0);
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    v18 = sub_100025D1C(&qword_100091F40);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t sub_10003C144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(void *, uint64_t, uint64_t);
  int v26;
  int v27;
  uint64_t v28;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v10;
  swift_retain(v10);
  swift_release(v9);
  v11 = *(_QWORD *)(a2 + 16);
  v12 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  swift_retain(v11);
  swift_release(v12);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v13 = *(int *)(a3 + 24);
  v14 = a1 + v13;
  v15 = (uint64_t *)(a2 + v13);
  v16 = *(_QWORD *)(a1 + v13);
  v17 = *v15;
  *(_QWORD *)(a1 + v13) = *v15;
  swift_retain(v17);
  swift_release(v16);
  v18 = v15[1];
  v19 = *(_QWORD *)(v14 + 8);
  *(_QWORD *)(v14 + 8) = v18;
  swift_retain(v18);
  swift_release(v19);
  v20 = *(int *)(sub_100025D1C(&qword_100091600) + 32);
  v21 = (void *)(v14 + v20);
  v22 = (char *)v15 + v20;
  v23 = type metadata accessor for Date(0);
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v24 + 48);
  v26 = v25(v21, 1, v23);
  v27 = v25(v22, 1, v23);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(void *, char *, uint64_t))(v24 + 24))(v21, v22, v23);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v24 + 8))(v21, v23);
    goto LABEL_6;
  }
  if (v27)
  {
LABEL_6:
    v28 = sub_100025D1C(&qword_100091F40);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  return a1;
}

uint64_t sub_10003C2E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(int *)(a3 + 24);
  v5 = (_QWORD *)(a1 + v4);
  v6 = a2 + v4;
  v7 = *(_QWORD *)(a2 + v4 + 8);
  *v5 = *(_QWORD *)(a2 + v4);
  v5[1] = v7;
  v8 = *(int *)(sub_100025D1C(&qword_100091600) + 32);
  v9 = (char *)v5 + v8;
  v10 = (const void *)(v6 + v8);
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = sub_100025D1C(&qword_100091F40);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t sub_10003C3CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(void *, uint64_t, uint64_t);
  int v20;
  int v21;
  uint64_t v22;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release(v7);
  v8 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release(v8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v9 = *(int *)(a3 + 24);
  v10 = a1 + v9;
  v11 = (_QWORD *)(a2 + v9);
  v12 = *(_QWORD *)(a1 + v9);
  *(_QWORD *)(a1 + v9) = *v11;
  swift_release(v12);
  v13 = *(_QWORD *)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v11[1];
  swift_release(v13);
  v14 = *(int *)(sub_100025D1C(&qword_100091600) + 32);
  v15 = (void *)(v10 + v14);
  v16 = (char *)v11 + v14;
  v17 = type metadata accessor for Date(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v18 + 48);
  v20 = v19(v15, 1, v17);
  v21 = v19(v16, 1, v17);
  if (!v20)
  {
    if (!v21)
    {
      (*(void (**)(void *, char *, uint64_t))(v18 + 40))(v15, v16, v17);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v18 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    v22 = sub_100025D1C(&qword_100091F40);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  return a1;
}

uint64_t sub_10003C544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003C550);
}

uint64_t sub_10003C550(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_100025D1C(&qword_100091600);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t sub_10003C5D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003C5DC);
}

char *sub_10003C5DC(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_100025D1C(&qword_100091600);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

void sub_10003C654(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = &unk_100060958;
  sub_10003C6D4(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
  }
}

void sub_10003C6D4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100091698)
  {
    v2 = sub_10002C0E0(&qword_100091F40);
    v3 = type metadata accessor for Binding(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100091698);
  }
}

uint64_t sub_10003C72C()
{
  return type metadata accessor for PasscodeEmbeddedParentViewController(0);
}

void sub_10003C734(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[4];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  sub_10003C7C4(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    v4[2] = &unk_100060998;
    v4[3] = &unk_1000609B0;
    swift_updateClassMetadata2(a1, 256, 4, v4, a1 + 80);
  }
}

void sub_10003C7C4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000916F8)
  {
    v2 = type metadata accessor for PasscodeEmbeddedView(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000916F8);
  }
}

uint64_t sub_10003C818()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003C844()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10003C870(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc(dword_10009161C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003C8C8;
  return sub_10003B294(a1, v6, v7, v4);
}

uint64_t sub_10003C8C8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10003C910(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for PasscodeEmbeddedView(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10003C950(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PasscodeEmbeddedView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003C98C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_10003C9F4;
  return v5(v2 + 32);
}

uint64_t sub_10003C9F4()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 24));
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_10003CA44()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003CA68(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10009171C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003C8C8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100091718 + dword_100091718))(a1, v4);
}

void sub_10003CAE8(char a1)
{
  char *v1;
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType(v1);
  objc_msgSendSuper2(&v5, "viewWillAppear:", a1 & 1);
  v3 = sub_10003CB48(v1);
  v4 = *(void **)&v1[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager] = v3;

}

id sub_10003CB48(char *a1)
{
  id result;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  Class isa;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  NSString v19;
  uint64_t v20;
  uint64_t v21;
  NSString v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  void *v33;
  NSString v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSString v49;
  uint64_t v50;
  uint64_t v51;
  NSString v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  unint64_t v57;
  NSString v58;
  uint64_t v59;
  id v60;
  id v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  id v65;
  Swift::Bool canShowWhile;
  id v67;
  unint64_t v68;
  id v69[5];
  __int128 v70;
  __int128 v71;

  result = objc_msgSend(*(id *)&a1[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_context], "externalizedContext");
  if (!result)
  {
    __break(1u);
    goto LABEL_49;
  }
  v3 = result;
  v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;

  v7 = objc_allocWithZone((Class)LACUIAuthenticatorServiceConfiguration);
  isa = Data._bridgeToObjectiveC()().super.isa;
  v9 = objc_msgSend(v7, "initWithContext:requirement:", isa, 3);
  sub_100028234(v4, v6);

  result = objc_msgSend(a1, "options");
  if (!result)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  v10 = result;
  v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v67 = (id)1051;
  AnyHashable.init<A>(_:)(&v67, &type metadata for Int, &protocol witness table for Int);
  if (*(_QWORD *)(v11 + 16) && (v12 = sub_100027EF8((uint64_t)v69), (v13 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v11 + 56) + 32 * v12, (uint64_t)&v70);
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
  }
  swift_bridgeObjectRelease(v11);
  sub_100028114((uint64_t)v69);
  if (*((_QWORD *)&v71 + 1))
  {
    v14 = sub_1000287F0(0, &qword_100090C58, NSError_ptr);
    if ((swift_dynamicCast(&v67, &v70, (char *)&type metadata for Any + 8, v14, 6) & 1) != 0)
    {
      v15 = v67;
      v16 = objc_msgSend(v67, "localizedDescription");

      static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
      v18 = v17;

      goto LABEL_12;
    }
  }
  else
  {
    sub_100027BE8((uint64_t)&v70);
  }
  v18 = 0xE000000000000000;
LABEL_12:
  v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v18);
  objc_msgSend(v9, "setPrompt:", v19);

  objc_msgSend(v9, "setPasscodeLength:", LACustomPasswordTypeCustomDigits);
  sub_100024BC4();
  v21 = v20;
  v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v21);
  objc_msgSend(v9, "setCancelButtonTitle:", v22);

  result = objc_msgSend(a1, "callerName");
  if (!result)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  v23 = result;
  objc_msgSend(v9, "setTitle:", result);

  result = objc_msgSend(a1, "options");
  if (!result)
  {
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  v24 = result;
  v25 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v67 = (id)1031;
  AnyHashable.init<A>(_:)(&v67, &type metadata for Int, &protocol witness table for Int);
  if (*(_QWORD *)(v25 + 16) && (v26 = sub_100027EF8((uint64_t)v69), (v27 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v25 + 56) + 32 * v26, (uint64_t)&v70);
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
  }
  swift_bridgeObjectRelease(v25);
  sub_100028114((uint64_t)v69);
  if (*((_QWORD *)&v71 + 1))
  {
    if ((swift_dynamicCast(&v67, &v70, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
      goto LABEL_29;
  }
  else
  {
    sub_100027BE8((uint64_t)&v70);
  }
  result = objc_msgSend(a1, "options");
  if (!result)
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  v28 = result;
  v29 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v67 = (id)2;
  AnyHashable.init<A>(_:)(&v67, &type metadata for Int, &protocol witness table for Int);
  if (*(_QWORD *)(v29 + 16) && (v30 = sub_100027EF8((uint64_t)v69), (v31 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v29 + 56) + 32 * v30, (uint64_t)&v70);
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
  }
  swift_bridgeObjectRelease(v29);
  sub_100028114((uint64_t)v69);
  if (!*((_QWORD *)&v71 + 1))
  {
    sub_100027BE8((uint64_t)&v70);
    goto LABEL_35;
  }
  if ((swift_dynamicCast(&v67, &v70, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
  {
LABEL_35:
    result = objc_msgSend(a1, "callerName");
    if (!result)
    {
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
    v45 = result;
    v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
    v42 = v47;

    sub_1000257C4(v46, v42);
    v44 = v48;
    goto LABEL_37;
  }
LABEL_29:
  v32 = v68;
  v33 = (void *)objc_opt_self(LAUtils);
  v34 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v32);
  v35 = objc_msgSend(v33, "truncateString:maxLength:", v34, 512);

  if (!v35)
    goto LABEL_35;
  v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
  v38 = v37;

  if (String.count.getter(v36, v38) < 1)
  {
    swift_bridgeObjectRelease(v38);
    goto LABEL_35;
  }
  result = objc_msgSend(a1, "callerName");
  if (result)
  {
    v39 = result;
    v40 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
    v42 = v41;

    sub_100025900(v36, v38, v40, v42);
    v44 = v43;
    swift_bridgeObjectRelease(v38);
LABEL_37:
    swift_bridgeObjectRelease(v42);
    v49 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v44);
    objc_msgSend(v9, "setSubtitle:", v49);

    sub_1000252EC();
    v51 = v50;
    v52 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v51);
    objc_msgSend(v9, "setPasswordFieldPlaceholder:", v52);

    objc_msgSend(v9, "setStyle:", 0);
    result = objc_msgSend(a1, "internalInfo");
    if (result)
    {
      v53 = result;
      v54 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

      v67 = (id)0x614E72656C6C6143;
      v68 = 0xEA0000000000656DLL;
      AnyHashable.init<A>(_:)(&v67, &type metadata for String, &protocol witness table for String);
      if (*(_QWORD *)(v54 + 16) && (v55 = sub_100027EF8((uint64_t)v69), (v56 & 1) != 0))
      {
        sub_100028564(*(_QWORD *)(v54 + 56) + 32 * v55, (uint64_t)&v70);
      }
      else
      {
        v70 = 0u;
        v71 = 0u;
      }
      swift_bridgeObjectRelease(v54);
      sub_100028114((uint64_t)v69);
      if (*((_QWORD *)&v71 + 1))
      {
        if ((swift_dynamicCast(&v67, &v70, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
        {
          v57 = v68;
          v58 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v57);
LABEL_47:
          objc_msgSend(v9, "setBundleIdentifier:", v58);

          v59 = swift_allocObject(&unk_10007B6D8, 24, 7);
          swift_unknownObjectWeakInit(v59 + 16, a1);
          v60 = v9;
          swift_retain(v59);
          v61 = sub_100039688();
          v62 = sub_1000396AC();
          v63 = sub_1000396B4();
          v64 = sub_1000396C0(v60, 0, v61, 0, 1, v62, 0, v63, (uint64_t)sub_10003EAFC, v59);
          swift_release(v59);
          v69[0] = v64;
          swift_unknownObjectRetain(a1);
          sub_100039514((uint64_t)a1);
          v65 = v69[0];
          canShowWhile = LACUIDTOViewController._canShowWhileLocked()();
          sub_100039890(a1, canShowWhile, v65);

          return v65;
        }
      }
      else
      {
        sub_100027BE8((uint64_t)&v70);
      }
      v58 = 0;
      goto LABEL_47;
    }
    goto LABEL_52;
  }
LABEL_55:
  __break(1u);
  return result;
}

void sub_10003D43C(uint64_t a1, uint64_t a2)
{
  char *v2;
  void *v3;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD v16[5];
  _QWORD *v17;

  v3 = v2;
  sub_1000287F0(0, &qword_100091F90, UIDevice_ptr);
  if (sub_1000557C4())
  {
    v6 = swift_allocObject(&unk_10007B6D8, 24, 7);
    swift_unknownObjectWeakInit(v6 + 16, v3);
    v7 = (_QWORD *)swift_allocObject(&unk_10007B728, 40, 7);
    v7[2] = v6;
    v7[3] = a1;
    v7[4] = a2;
    v16[4] = sub_10003D678;
    v17 = v7;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 1107296256;
    v16[2] = sub_100027144;
    v16[3] = &unk_10007B740;
    v8 = _Block_copy(v16);
    v9 = v17;
    sub_100027180(a1, a2);
    swift_release(v9);
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v8);
    _Block_release(v8);
  }
  else
  {
    v10 = *(void **)&v2[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager];
    if (v10)
    {
      v11 = (void *)objc_opt_self(LAErrorHelper);
      v12 = v10;
      v13 = objc_msgSend(v11, "errorWithCode:", -4);
      v14 = swift_allocObject(&unk_10007B6D8, 24, 7);
      swift_unknownObjectWeakInit(v14 + 16, v3);
      v15 = (_QWORD *)swift_allocObject(&unk_10007B700, 40, 7);
      v15[2] = v14;
      v15[3] = a1;
      v15[4] = a2;
      sub_100027180(a1, a2);
      swift_retain(v14);
      sub_10003976C((uint64_t)v13, (uint64_t (*)(uint64_t))sub_10003D668, (uint64_t)v15);

      swift_release(v14);
      swift_release(v15);
    }
  }
}

uint64_t sub_10003D640()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10003D668()
{
  sub_10003EA24((uint64_t)&unk_10007B7E0);
}

void sub_10003D678()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t Strong;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _BYTE v14[24];

  v1 = v0[2];
  v2 = v0[3];
  v3 = v0[4];
  v4 = v1 + 16;
  swift_beginAccess(v1 + 16, v14, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v4);
  if (Strong)
  {
    v6 = (void *)Strong;
    v7 = *(void **)(Strong + OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager);
    if (v7)
    {
      v8 = v7;

      v9 = objc_msgSend((id)objc_opt_self(LAErrorHelper), "errorWithCode:", -4);
      v10 = swift_allocObject(&unk_10007B6D8, 24, 7);
      swift_beginAccess(v4, &v13, 0, 0);
      v11 = (void *)swift_unknownObjectWeakLoadStrong(v4);
      swift_unknownObjectWeakInit(v10 + 16, v11);

      v12 = (_QWORD *)swift_allocObject(&unk_10007B7A0, 40, 7);
      v12[2] = v10;
      v12[3] = v2;
      v12[4] = v3;
      swift_retain(v10);
      sub_100027180(v2, v3);
      sub_10003976C((uint64_t)v9, (uint64_t (*)(uint64_t))sub_10003EA18, (uint64_t)v12);
      swift_release(v12);
      swift_release(v10);

      v6 = v8;
    }

  }
}

uint64_t sub_10003D7D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10003D7E8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id sub_10003D888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  char *v5;
  char *v6;
  objc_class *ObjectType;
  uint64_t v13;
  id v14;
  char *v15;
  Class isa;
  id v17;
  objc_super v19;

  v6 = v5;
  ObjectType = (objc_class *)swift_getObjectType(v6);
  v13 = OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_context;
  v14 = objc_allocWithZone((Class)LAContext);
  v15 = v6;
  *(_QWORD *)&v6[v13] = objc_msgSend(v14, "init");
  *(_QWORD *)&v15[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager] = 0;

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v19.receiver = v15;
  v19.super_class = ObjectType;
  v17 = objc_msgSendSuper2(&v19, "initWithInternalInfo:mechanism:backoffCounter:remoteUIHost:allowsLandscape:", isa, a2, a3, a4, a5 & 1);

  swift_unknownObjectRelease(a2);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);
  return v17;
}

id sub_10003DB08(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  char *v4;
  objc_class *ObjectType;
  uint64_t v8;
  id v9;
  char *v10;
  NSString v11;
  id v12;
  objc_super v14;

  v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType(v3);
  v8 = OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_context;
  v9 = objc_allocWithZone((Class)LAContext);
  v10 = v4;
  *(_QWORD *)&v4[v8] = objc_msgSend(v9, "init");
  *(_QWORD *)&v10[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager] = 0;

  if (a2)
  {
    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v11 = 0;
  }
  v14.receiver = v10;
  v14.super_class = ObjectType;
  v12 = objc_msgSendSuper2(&v14, "initWithNibName:bundle:", v11, a3);

  return v12;
}

id sub_10003DC4C(void *a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v4;
  id v5;
  char *v6;
  id v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(v1);
  v4 = OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_context;
  v5 = objc_allocWithZone((Class)LAContext);
  v6 = v1;
  *(_QWORD *)&v1[v4] = objc_msgSend(v5, "init");
  *(_QWORD *)&v6[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager] = 0;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  v7 = objc_msgSendSuper2(&v9, "initWithCoder:", a1);

  return v7;
}

id sub_10003DD18(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  objc_class *ObjectType;
  uint64_t v7;
  id v8;
  char *v9;
  NSDictionary v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  id v18;
  objc_super v20;
  _QWORD v21[3];
  uint64_t v22;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType(v2);
  v7 = OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_context;
  v8 = objc_allocWithZone((Class)LAContext);
  v9 = v3;
  *(_QWORD *)&v3[v7] = objc_msgSend(v8, "init");
  *(_QWORD *)&v9[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager] = 0;

  if (a1)
  {
    v10.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v10.super.isa = 0;
  }
  sub_100027F28(a2, (uint64_t)v21, &qword_1000914C0);
  v11 = v22;
  if (v22)
  {
    v12 = sub_1000279D8(v21, v22);
    v13 = *(_QWORD *)(v11 - 8);
    __chkstk_darwin(v12);
    v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    v16 = _bridgeAnythingToObjectiveC<A>(_:)(v15, v11);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    sub_1000279FC(v21);
  }
  else
  {
    v16 = 0;
  }
  v20.receiver = v9;
  v20.super_class = ObjectType;
  v17 = objc_msgSendSuper2(&v20, "initWithInternalInfo:parent:", v10.super.isa, v16);

  swift_unknownObjectRelease(v16);
  v18 = v17;
  sub_100027BE8(a2);
  if (v18)

  return v18;
}

id sub_10003DFAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  char *v4;
  char *v5;
  id result;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t inited;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  Class isa;
  void *v28;
  id v29;
  uint64_t (*v30)();
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34[176];
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  __int128 v38;
  __int128 v39;

  v5 = v4;
  result = objc_msgSend(v4, "options");
  if (!result)
  {
    __break(1u);
LABEL_25:
    __break(1u);
    return result;
  }
  v10 = result;
  v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v35 = 1046;
  AnyHashable.init<A>(_:)(&v35, &type metadata for Int, &protocol witness table for Int);
  if (*(_QWORD *)(v11 + 16) && (v12 = sub_100027EF8((uint64_t)&v36), (v13 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v11 + 56) + 32 * v12, (uint64_t)&v38);
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
  }
  swift_bridgeObjectRelease(v11);
  sub_100028114((uint64_t)&v36);
  if (*((_QWORD *)&v39 + 1))
  {
    if ((swift_dynamicCast(&v35, &v38, (char *)&type metadata for Any + 8, &type metadata for Int, 6) & 1) != 0)
    {
      v14 = v35;
      if (String.count.getter(a2, a3) < v14)
        return (id)a4(0);
    }
  }
  else
  {
    sub_100027BE8((uint64_t)&v38);
  }
  result = objc_msgSend(v5, "options");
  if (!result)
    goto LABEL_25;
  v15 = result;
  v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v35 = 1047;
  AnyHashable.init<A>(_:)(&v35, &type metadata for Int, &protocol witness table for Int);
  if (*(_QWORD *)(v16 + 16) && (v17 = sub_100027EF8((uint64_t)&v36), (v18 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v16 + 56) + 32 * v17, (uint64_t)&v38);
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
  }
  swift_bridgeObjectRelease(v16);
  sub_100028114((uint64_t)&v36);
  if (*((_QWORD *)&v39 + 1))
  {
    if ((swift_dynamicCast(&v35, &v38, (char *)&type metadata for Any + 8, &type metadata for Int, 6) & 1) != 0)
    {
      v19 = v35;
      if (v19 < String.count.getter(a2, a3))
        return (id)a4(0);
    }
  }
  else
  {
    sub_100027BE8((uint64_t)&v38);
  }
  v20 = sub_100025D1C(&qword_100090C40);
  inited = swift_initStackObject(v20, v34);
  *(_OWORD *)(inited + 16) = xmmword_10005FF50;
  v36 = 0x746C75736552;
  v37 = 0xE600000000000000;
  AnyHashable.init<A>(_:)(&v36, &type metadata for String, &protocol witness table for String);
  v22 = sub_100025D1C(&qword_100091738);
  v23 = a4;
  v24 = swift_initStackObject(v22, &v33);
  *(_OWORD *)(v24 + 16) = xmmword_10005FF40;
  *(_QWORD *)(v24 + 32) = 5;
  *(_BYTE *)(v24 + 40) = 1;
  v25 = sub_10003E4E8(v24);
  swift_setDeallocating(v24);
  *(_QWORD *)(inited + 96) = sub_100025D1C(&qword_100091740);
  *(_QWORD *)(inited + 72) = v25;
  v36 = 5130576;
  v37 = 0xE300000000000000;
  AnyHashable.init<A>(_:)(&v36, &type metadata for String, &protocol witness table for String);
  *(_QWORD *)(inited + 168) = &type metadata for String;
  *(_QWORD *)(inited + 144) = a2;
  *(_QWORD *)(inited + 152) = a3;
  swift_bridgeObjectRetain(a3);
  v26 = sub_100026D4C(inited);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v26);
  objc_msgSend(v5, "uiSuccessWithResult:", isa);

  result = (id)v23(1);
  v28 = *(void **)&v5[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager];
  if (v28)
  {
    v29 = v28;
    v30 = sub_10003975C();
    v32 = v31;
    sub_10003976C(0, (uint64_t (*)(uint64_t))v30, v31);

    return (id)swift_release(v32);
  }
  return result;
}

unint64_t sub_10003E41C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = static Hasher._hash(seed:_:)(*(_QWORD *)(v1 + 40), a1);
  return sub_10003E44C(a1, v3);
}

unint64_t sub_10003E44C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_10003E4E8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _BYTE *i;
  uint64_t v5;
  char v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_100025D1C(&qword_100091770);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v1);
    for (i = (_BYTE *)(a1 + 40); ; i += 16)
    {
      v5 = *((_QWORD *)i - 1);
      v6 = *i;
      result = sub_10003E41C(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_QWORD *)(v3[6] + 8 * result) = v5;
      *(_BYTE *)(v3[7] + result) = v6;
      v9 = v3[2];
      v10 = __OFADD__(v9, 1);
      v11 = v9 + 1;
      if (v10)
        goto LABEL_10;
      v3[2] = v11;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

uint64_t type metadata accessor for PINSheetViewController()
{
  return objc_opt_self(_TtC10CoreAuthUI22PINSheetViewController);
}

void sub_10003E5DC(uint64_t a1, uint64_t a2, char *a3, void (**a4)(_QWORD, _QWORD))
{
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t inited;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  Class isa;
  void *v27;
  id v28;
  uint64_t (*v29)();
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[176];
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;

  v8 = objc_msgSend(a3, "options");
  if (!v8)
  {
    _Block_release(a4);
    __break(1u);
LABEL_25:
    _Block_release(a4);
    __break(1u);
    return;
  }
  v9 = v8;
  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v8, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v34 = 1046;
  AnyHashable.init<A>(_:)(&v34, &type metadata for Int, &protocol witness table for Int);
  if (*(_QWORD *)(v10 + 16) && (v11 = sub_100027EF8((uint64_t)&v35), (v12 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v10 + 56) + 32 * v11, (uint64_t)&v37);
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
  }
  swift_bridgeObjectRelease(v10);
  sub_100028114((uint64_t)&v35);
  if (*((_QWORD *)&v38 + 1))
  {
    if ((swift_dynamicCast(&v34, &v37, (char *)&type metadata for Any + 8, &type metadata for Int, 6) & 1) != 0)
    {
      v13 = v34;
      if (String.count.getter(a1, a2) < v13)
        goto LABEL_19;
    }
  }
  else
  {
    sub_100027BE8((uint64_t)&v37);
  }
  v14 = objc_msgSend(a3, "options");
  if (!v14)
    goto LABEL_25;
  v15 = v14;
  v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v14, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v34 = 1047;
  AnyHashable.init<A>(_:)(&v34, &type metadata for Int, &protocol witness table for Int);
  if (*(_QWORD *)(v16 + 16) && (v17 = sub_100027EF8((uint64_t)&v35), (v18 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v16 + 56) + 32 * v17, (uint64_t)&v37);
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
  }
  swift_bridgeObjectRelease(v16);
  sub_100028114((uint64_t)&v35);
  if (*((_QWORD *)&v38 + 1))
  {
    if ((swift_dynamicCast(&v34, &v37, (char *)&type metadata for Any + 8, &type metadata for Int, 6) & 1) != 0)
    {
      v19 = v34;
      if (v19 < String.count.getter(a1, a2))
      {
LABEL_19:
        a4[2](a4, 0);
        return;
      }
    }
  }
  else
  {
    sub_100027BE8((uint64_t)&v37);
  }
  v20 = sub_100025D1C(&qword_100090C40);
  inited = swift_initStackObject(v20, v33);
  *(_OWORD *)(inited + 16) = xmmword_10005FF50;
  v35 = 0x746C75736552;
  v36 = 0xE600000000000000;
  AnyHashable.init<A>(_:)(&v35, &type metadata for String, &protocol witness table for String);
  v22 = sub_100025D1C(&qword_100091738);
  v23 = swift_initStackObject(v22, &v32);
  *(_OWORD *)(v23 + 16) = xmmword_10005FF40;
  *(_QWORD *)(v23 + 32) = 5;
  *(_BYTE *)(v23 + 40) = 1;
  v24 = sub_10003E4E8(v23);
  swift_setDeallocating(v23);
  *(_QWORD *)(inited + 96) = sub_100025D1C(&qword_100091740);
  *(_QWORD *)(inited + 72) = v24;
  v35 = 5130576;
  v36 = 0xE300000000000000;
  AnyHashable.init<A>(_:)(&v35, &type metadata for String, &protocol witness table for String);
  *(_QWORD *)(inited + 168) = &type metadata for String;
  *(_QWORD *)(inited + 144) = a1;
  *(_QWORD *)(inited + 152) = a2;
  swift_bridgeObjectRetain(a2);
  v25 = sub_100026D4C(inited);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v25);
  objc_msgSend(a3, "uiSuccessWithResult:", isa);

  a4[2](a4, 1);
  v27 = *(void **)&a3[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager];
  if (v27)
  {
    v28 = v27;
    v29 = sub_10003975C();
    v31 = v30;
    sub_10003976C(0, (uint64_t (*)(uint64_t))v29, v30);

    swift_release(v31);
  }
}

uint64_t sub_10003E9BC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003E9E4()
{
  _QWORD *v0;

  swift_release(v0[2]);
  if (v0[3])
    swift_release(v0[4]);
  return swift_deallocObject(v0, 40, 7);
}

void sub_10003EA18()
{
  sub_10003EA24((uint64_t)&unk_10007B7B8);
}

void sub_10003EA24(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t Strong;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  objc_super aBlock;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[24];

  v3 = v1[2];
  v4 = v1[3];
  v5 = v1[4];
  v6 = v3 + 16;
  swift_beginAccess(v3 + 16, v17, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v6);
  if (Strong)
  {
    v8 = (void *)Strong;
    if (v4)
    {
      v15 = v4;
      v16 = v5;
      aBlock.receiver = _NSConcreteStackBlock;
      aBlock.super_class = (Class)1107296256;
      v13 = sub_100027144;
      v14 = a1;
      v9 = _Block_copy(&aBlock);
      v10 = v16;
      swift_retain(v5);
      swift_release(v10);
    }
    else
    {
      v9 = 0;
    }
    v11 = (objc_class *)type metadata accessor for PINSheetViewController();
    aBlock.receiver = v8;
    aBlock.super_class = v11;
    objc_msgSendSuper2(&aBlock, "dismissChildWithCompletionHandler:", v9);
    _Block_release(v9);

  }
}

void sub_10003EAFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;
  void *Strong;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BYTE v11[24];

  if (a1)
  {
    v3 = v1 + 16;
    v4 = (void *)objc_opt_self(LAErrorHelper);
    swift_errorRetain(a1);
    v5 = (void *)_convertErrorToNSError(_:)(a1);
    LODWORD(v4) = objc_msgSend(v4, "error:hasCode:", v5, -2);

    if ((_DWORD)v4)
    {
      swift_beginAccess(v3, v11, 0, 0);
      Strong = (void *)swift_unknownObjectWeakLoadStrong(v3);
      if (Strong)
      {
        v7 = Strong;
        objc_msgSend(Strong, "uiCancel");
        swift_errorRelease(a1);

        return;
      }
    }
    else
    {
      swift_beginAccess(v3, v11, 0, 0);
      v8 = swift_unknownObjectWeakLoadStrong(v3);
      if (v8)
      {
        v9 = (void *)v8;
        v10 = (void *)_convertErrorToNSError(_:)(a1);
        objc_msgSend(v9, "uiFailureWithError:", v10);
        swift_errorRelease(a1);

        return;
      }
    }
    swift_errorRelease(a1);
  }
}

char *sub_10003EC18()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *result;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  char v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  char v19;
  os_log_type_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  _QWORD *v27;
  id v28;
  unsigned int v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char *v35;
  uint64_t v36;
  NSString v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  uint64_t v58;
  NSString v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  unint64_t v72;
  unint64_t v73;
  char *v74;
  uint64_t v75;
  id v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char v80[24];
  _QWORD v81[2];
  _QWORD v82[3];
  uint64_t v83;
  uint64_t v84[4];
  __int128 v85;
  __int128 v86;
  _BYTE v87[9];

  v1 = v0;
  v78 = type metadata accessor for CharacterSet(0);
  v2 = *(_QWORD *)(v78 - 8);
  __chkstk_darwin(v78);
  v77 = (char *)&v75 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = (char *)objc_msgSend(v0, "options");
  if (!result)
  {
    __break(1u);
    goto LABEL_78;
  }
  v5 = result;
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  LODWORD(v82[0]) = 1010;
  AnyHashable.init<A>(_:)(v82, &type metadata for Int32, &protocol witness table for Int32);
  if (*(_QWORD *)(v6 + 16) && (v7 = sub_100027EF8((uint64_t)&v83), (v8 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v6 + 56) + 32 * v7, (uint64_t)&v85);
  }
  else
  {
    v85 = 0u;
    v86 = 0u;
  }
  swift_bridgeObjectRelease(v6);
  sub_100028114((uint64_t)&v83);
  if (*((_QWORD *)&v86 + 1))
  {
    if (swift_dynamicCast(v82, &v85, (char *)&type metadata for Any + 8, &type metadata for Bool, 6))
    {
      v9 = v82[0];
      goto LABEL_11;
    }
  }
  else
  {
    sub_10002BD8C((uint64_t)&v85, &qword_1000914C0);
  }
  v9 = 1;
LABEL_11:
  v87[0] = v9;
  result = (char *)objc_msgSend(v1, "options");
  if (!result)
  {
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  v10 = result;
  v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  LODWORD(v82[0]) = 1011;
  AnyHashable.init<A>(_:)(v82, &type metadata for Int32, &protocol witness table for Int32);
  if (*(_QWORD *)(v11 + 16) && (v12 = sub_100027EF8((uint64_t)&v83), (v13 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v11 + 56) + 32 * v12, (uint64_t)&v85);
  }
  else
  {
    v85 = 0u;
    v86 = 0u;
  }
  swift_bridgeObjectRelease(v11);
  sub_100028114((uint64_t)&v83);
  if (!*((_QWORD *)&v86 + 1))
  {
    sub_10002BD8C((uint64_t)&v85, &qword_1000914C0);
    v17 = 0;
    if ((v87[0] & 1) == 0)
      goto LABEL_25;
LABEL_24:
    v19 = 1;
    goto LABEL_27;
  }
  v14 = sub_1000287F0(0, (unint64_t *)&qword_100090B50, NSNumber_ptr);
  v15 = swift_dynamicCast(v82, &v85, (char *)&type metadata for Any + 8, v14, 6);
  v16 = (void *)v82[0];
  if (v15)
    v17 = (void *)v82[0];
  else
    v17 = 0;
  if ((v87[0] & 1) != 0)
    goto LABEL_24;
  if (!v17)
  {
LABEL_25:
    v18 = 0;
    goto LABEL_26;
  }
  v18 = objc_msgSend(v17, "BOOLValue");
  v17 = v16;
LABEL_26:
  v19 = v18 ^ 1;
LABEL_27:
  v87[0] = v19;
  v20 = static os_log_type_t.default.getter();
  v21 = v17;
  v22 = v1;
  v23 = v21;
  v24 = v22;
  v25 = Logger.logObject.getter(v24);
  if (os_log_type_enabled(v25, v20))
  {
    v76 = v23;
    v79 = v2;
    v26 = swift_slowAlloc(24, -1);
    v27 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v26 = 138543874;
    v83 = (uint64_t)v24;
    v28 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, v84, v26 + 4, v26 + 12);
    *v27 = v24;

    *(_WORD *)(v26 + 12) = 1026;
    swift_beginAccess(v87, v80, 0, 0);
    LODWORD(v83) = v87[0];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, (char *)&v83 + 4, v26 + 14, v26 + 18);
    *(_WORD *)(v26 + 18) = 1026;
    if (v17)
    {
      v23 = v76;
      v29 = objc_msgSend(v76, "BOOLValue");

    }
    else
    {
      v29 = 0;
      v23 = v76;
    }
    LODWORD(v83) = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, (char *)&v83 + 4, v26 + 20, v26 + 24);

    _os_log_impl((void *)&_mh_execute_header, v25, v20, "%{public}@ buttons - cancel: %{BOOL,public}d fallback: %{BOOL,public}d", (uint8_t *)v26, 0x18u);
    v30 = sub_100025D1C(&qword_1000911C0);
    swift_arrayDestroy(v27, 1, v30);
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v26, -1, -1);
    v2 = v79;

    if (!v17)
      goto LABEL_39;
  }
  else
  {

    if (!v17)
      goto LABEL_39;
  }
  if (!objc_msgSend(v23, "BOOLValue"))
  {
LABEL_39:
    v35 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_57;
  }
  result = (char *)objc_msgSend(v24, "options");
  if (result)
  {
    v31 = result;
    v32 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    LODWORD(v82[0]) = 1;
    AnyHashable.init<A>(_:)(v82, &type metadata for Int32, &protocol witness table for Int32);
    if (*(_QWORD *)(v32 + 16) && (v33 = sub_100027EF8((uint64_t)&v83), (v34 & 1) != 0))
    {
      sub_100028564(*(_QWORD *)(v32 + 56) + 32 * v33, (uint64_t)&v85);
    }
    else
    {
      v85 = 0u;
      v86 = 0u;
    }
    swift_bridgeObjectRelease(v32);
    sub_100028114((uint64_t)&v83);
    if (*((_QWORD *)&v86 + 1))
    {
      if ((swift_dynamicCast(v82, &v85, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
      {
        v36 = v82[1];
        v37 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v36);
LABEL_46:
        v38 = objc_msgSend((id)objc_opt_self(LAUtils), "truncateString:maxLength:", v37, 32);

        if (v38)
        {
          v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
          v41 = v40;

          v83 = v39;
          v84[0] = v41;
          v42 = v77;
          static CharacterSet.whitespacesAndNewlines.getter();
          v43 = sub_100041220();
          v44 = StringProtocol.trimmingCharacters(in:)(v42, &type metadata for String, v43);
          v46 = v45;
          (*(void (**)(char *, uint64_t))(v2 + 8))(v42, v78);
          swift_bridgeObjectRelease(v84[0]);
        }
        else
        {
          v44 = sub_100025514();
          v46 = v47;
        }
        v79 = v2;
        if (v44 == 0x6150207265746E45 && v46 == 0xEE0065646F637373
          || (_stringCompareWithSmolCheck(_:_:expecting:)(v44, v46, 0x6150207265746E45, 0xEE0065646F637373, 0) & 1) != 0)
        {
          v48 = v23;
          swift_bridgeObjectRelease(v46);
          v44 = sub_100024F4C();
          v46 = v49;
        }
        else
        {
          v48 = v23;
        }
        v50 = swift_allocObject(&unk_10007B950, 24, 7);
        swift_unknownObjectWeakInit(v50 + 16, v24);
        v35 = sub_1000410D0(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
        v52 = *((_QWORD *)v35 + 2);
        v51 = *((_QWORD *)v35 + 3);
        if (v52 >= v51 >> 1)
          v35 = sub_1000410D0((char *)(v51 > 1), v52 + 1, 1, v35);
        *((_QWORD *)v35 + 2) = v52 + 1;
        v53 = &v35[40 * v52];
        *((_QWORD *)v53 + 4) = v44;
        *((_QWORD *)v53 + 5) = v46;
        *((_QWORD *)v53 + 6) = 0;
        *((_QWORD *)v53 + 7) = sub_100041264;
        *((_QWORD *)v53 + 8) = v50;
        v23 = v48;
        v2 = v79;
LABEL_57:
        swift_beginAccess(v87, v82, 0, 0);
        if (v87[0] != 1)
        {
LABEL_76:

          return v35;
        }
        result = (char *)objc_msgSend(v24, "options");
        if (result)
        {
          v54 = result;
          v55 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

          LODWORD(v81[0]) = 1018;
          AnyHashable.init<A>(_:)(v81, &type metadata for Int32, &protocol witness table for Int32);
          if (*(_QWORD *)(v55 + 16) && (v56 = sub_100027EF8((uint64_t)&v83), (v57 & 1) != 0))
          {
            sub_100028564(*(_QWORD *)(v55 + 56) + 32 * v56, (uint64_t)&v85);
          }
          else
          {
            v85 = 0u;
            v86 = 0u;
          }
          swift_bridgeObjectRelease(v55);
          sub_100028114((uint64_t)&v83);
          if (*((_QWORD *)&v86 + 1))
          {
            if ((swift_dynamicCast(v81, &v85, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
            {
              v58 = v81[1];
              v59 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease(v58);
LABEL_68:
              v60 = objc_msgSend((id)objc_opt_self(LAUtils), "truncateString:maxLength:", v59, 32);

              if (v60)
              {
                v61 = static String._unconditionallyBridgeFromObjectiveC(_:)(v60);
                v63 = v62;

                v83 = v61;
                v84[0] = v63;
                v64 = v77;
                static CharacterSet.whitespacesAndNewlines.getter();
                v65 = sub_100041220();
                v66 = StringProtocol.trimmingCharacters(in:)(v64, &type metadata for String, v65);
                v68 = v67;
                (*(void (**)(char *, uint64_t))(v2 + 8))(v64, v78);
                swift_bridgeObjectRelease(v84[0]);
              }
              else
              {
                v66 = sub_100024BC4();
                v68 = v69;
              }
              v70 = swift_allocObject(&unk_10007B950, 24, 7);
              swift_unknownObjectWeakInit(v70 + 16, v24);
              v71 = v23;
              if ((swift_isUniquelyReferenced_nonNull_native(v35) & 1) == 0)
                v35 = sub_1000410D0(0, *((_QWORD *)v35 + 2) + 1, 1, v35);
              v73 = *((_QWORD *)v35 + 2);
              v72 = *((_QWORD *)v35 + 3);
              if (v73 >= v72 >> 1)
                v35 = sub_1000410D0((char *)(v72 > 1), v73 + 1, 1, v35);
              *((_QWORD *)v35 + 2) = v73 + 1;
              v74 = &v35[40 * v73];
              *((_QWORD *)v74 + 4) = v66;
              *((_QWORD *)v74 + 5) = v68;
              *((_QWORD *)v74 + 6) = 1;
              *((_QWORD *)v74 + 7) = sub_100041214;
              *((_QWORD *)v74 + 8) = v70;
              v23 = v71;
              goto LABEL_76;
            }
          }
          else
          {
            sub_10002BD8C((uint64_t)&v85, &qword_1000914C0);
          }
          v59 = 0;
          goto LABEL_68;
        }
        goto LABEL_79;
      }
    }
    else
    {
      sub_10002BD8C((uint64_t)&v85, &qword_1000914C0);
    }
    v37 = 0;
    goto LABEL_46;
  }
LABEL_80:
  __break(1u);
  return result;
}

uint64_t sub_10003F620()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType;
  swift_beginAccess(v0 + OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_10003F664(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

uint64_t (*sub_10003F6AC(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType, a1, 33, 0);
  return j__swift_endAccess;
}

void sub_10003F6F0(char a1)
{
  char *v1;
  void *v2;
  char *v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  unint64_t v14;
  id v15;
  NSString v16;
  id v17;
  id v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSString v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  char *v38;
  void *v39;
  void **aBlock;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  void *v43;
  uint64_t (*v44)();
  uint64_t v45;
  objc_super v46;
  char v47[24];
  objc_super v48;

  v2 = v1;
  v48.receiver = v1;
  v48.super_class = (Class)swift_getObjectType(v1);
  objc_msgSendSuper2(&v48, "viewDidAppear:", a1 & 1);
  v4 = &v1[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType];
  swift_beginAccess(&v1[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType], v47, 0, 0);
  v5 = *(_QWORD *)v4;
  v6 = (objc_class *)type metadata accessor for BiometryAlertViewController();
  v7 = (char *)objc_allocWithZone(v6);
  *(_QWORD *)&v7[OBJC_IVAR____TtC10CoreAuthUIP33_AABE3714D9C58676A24E916892CB721E27BiometryAlertViewController_biometryType] = v5;
  v46.receiver = v7;
  v46.super_class = v6;
  v8 = objc_msgSendSuper2(&v46, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (*(_QWORD *)v4 == 1)
  {
    v13 = v8;
    sub_10002545C();
    v12 = v14;
  }
  else if (*(_QWORD *)v4 == 2)
  {
    v10 = v8;
    sub_1000253A8();
    v12 = v11;
  }
  else
  {
    v15 = v8;
    v12 = 0xE000000000000000;
  }
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  objc_msgSend(v9, "setTitle:", v16);

  v17 = v9;
  v18 = objc_msgSend(v2, "callerName");
  objc_msgSend(v17, "setMessage:", v18);

  v19 = sub_10003EC18();
  v20 = v19;
  v21 = *((_QWORD *)v19 + 2);
  if (v21)
  {
    v39 = v2;
    swift_bridgeObjectRetain(v19);
    v38 = v20;
    v22 = (uint64_t *)(v20 + 64);
    do
    {
      v26 = *(v22 - 3);
      v28 = *(v22 - 2);
      v27 = *(v22 - 1);
      v29 = *v22;
      swift_bridgeObjectRetain(v26);
      sub_100027180(v27, v29);
      v30 = String._bridgeToObjectiveC()();
      if (v27)
      {
        v44 = (uint64_t (*)())v27;
        v45 = v29;
        aBlock = _NSConcreteStackBlock;
        v41 = 1107296256;
        v42 = sub_100027144;
        v43 = &unk_10007B830;
        v23 = _Block_copy(&aBlock);
        v24 = v45;
        swift_retain(v29);
        swift_release(v24);
      }
      else
      {
        v23 = 0;
      }
      v22 += 5;
      v44 = sub_100026F7C;
      v45 = 0;
      aBlock = _NSConcreteStackBlock;
      v41 = 1107296256;
      v42 = sub_10003FB10;
      v43 = &unk_10007B808;
      v25 = _Block_copy(&aBlock);
      objc_msgSend(v17, "_addActionWithTitle:style:handler:shouldDismissHandler:", v30, v28, v23, v25);
      _Block_release(v25);
      _Block_release(v23);
      swift_bridgeObjectRelease(v26);

      sub_100027EB8(v27, v29);
      --v21;
    }
    while (v21);
    v20 = v38;
    swift_bridgeObjectRelease(v38);
    v2 = v39;
  }
  swift_bridgeObjectRelease(v20);
  v31 = v17;
  v32 = objc_msgSend(v31, "actions");
  v33 = sub_1000287F0(0, &qword_100091780, UIAlertAction_ptr);
  v34 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v32, v33);

  if ((unint64_t)v34 >> 62)
  {
    if (v34 < 0)
      v37 = v34;
    else
      v37 = v34 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v34);
    v35 = (void *)_CocoaArrayWrapper.endIndex.getter(v37);
    swift_bridgeObjectRelease(v34);
    if (!v35)
      goto LABEL_19;
  }
  else
  {
    v35 = *(void **)((v34 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v35)
    {
LABEL_19:
      swift_bridgeObjectRelease(v34);
      objc_msgSend(v31, "setPreferredAction:", v35);

      objc_msgSend(v31, "setPreferredStyle:", 1);
      objc_msgSend(v2, "presentViewController:animated:completion:", v31, 1, 0);

      return;
    }
  }
  if ((v34 & 0xC000000000000001) != 0)
  {
    v36 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v34);
    goto LABEL_18;
  }
  if (*(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v36 = *(id *)(v34 + 32);
LABEL_18:
    v35 = v36;
    goto LABEL_19;
  }
  __break(1u);
}

uint64_t type metadata accessor for BiometryAlertViewController()
{
  return objc_opt_self(_TtC10CoreAuthUIP33_AABE3714D9C58676A24E916892CB721E27BiometryAlertViewController);
}

uint64_t sub_10003FB10(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  LOBYTE(v1) = v1(v3);
  swift_release(v2);
  return v1 & 1;
}

uint64_t sub_10003FB48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10003FB58(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_10003FBA0(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_class *ObjectType;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  id v11;
  void *v12;
  _QWORD *v13;
  void **v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  void (*v18)();
  _QWORD *v19;
  objc_super v20;

  ObjectType = (objc_class *)swift_getObjectType(v2);
  v6 = objc_msgSend(v2, "presentedViewController");
  if (v6)
  {
    v7 = v6;
    v8 = (_QWORD *)swift_allocObject(&unk_10007B890, 40, 7);
    v8[2] = v2;
    v8[3] = a1;
    v8[4] = a2;
    v18 = sub_10003FD58;
    v19 = v8;
    v14 = _NSConcreteStackBlock;
    v15 = 1107296256;
    v16 = sub_100027144;
    v17 = &unk_10007B8A8;
    v9 = _Block_copy(&v14);
    v10 = v19;
    v11 = v2;
    sub_100027180(a1, a2);
    swift_release(v10);
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, v9);
    _Block_release(v9);

  }
  else
  {
    if (a1)
    {
      v18 = (void (*)())a1;
      v19 = (_QWORD *)a2;
      v14 = _NSConcreteStackBlock;
      v15 = 1107296256;
      v16 = sub_100027144;
      v17 = &unk_10007B858;
      v12 = _Block_copy(&v14);
      v13 = v19;
      swift_retain(a2);
      swift_release(v13);
    }
    else
    {
      v12 = 0;
    }
    v20.receiver = v2;
    v20.super_class = ObjectType;
    objc_msgSendSuper2(&v20, "dismissChildWithCompletionHandler:", v12);
    _Block_release(v12);
  }
}

uint64_t sub_10003FD24()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_10003FD58()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  objc_super v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (void *)v0[2];
  v1 = v0[3];
  if (v1)
  {
    v3 = v0[4];
    v10 = v1;
    v11 = v3;
    v7.receiver = _NSConcreteStackBlock;
    v7.super_class = (Class)1107296256;
    v8 = sub_100027144;
    v9 = &unk_10007B918;
    v4 = _Block_copy(&v7);
    v5 = v11;
    swift_retain(v3);
    swift_release(v5);
  }
  else
  {
    v4 = 0;
  }
  v6 = (objc_class *)type metadata accessor for BiometryCompanionViewController(0);
  v7.receiver = v2;
  v7.super_class = v6;
  objc_msgSendSuper2(&v7, "dismissChildWithCompletionHandler:", v4);
  _Block_release(v4);
}

id sub_10003FEA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  void *v5;
  void *v6;
  objc_class *ObjectType;
  char *v13;
  _QWORD *v14;
  Class isa;
  id v16;
  objc_super v18;

  v6 = v5;
  ObjectType = (objc_class *)swift_getObjectType(v6);
  v13 = v6;
  v14 = sub_1000419B8();
  sub_1000419D0(*v14);
  *(_QWORD *)&v13[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType] = 0;

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v18.receiver = v13;
  v18.super_class = ObjectType;
  v16 = objc_msgSendSuper2(&v18, "initWithInternalInfo:mechanism:backoffCounter:remoteUIHost:allowsLandscape:", isa, a2, a3, a4, a5 & 1);

  swift_unknownObjectRelease(a2);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);
  return v16;
}

id sub_1000400FC(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  objc_class *ObjectType;
  char *v8;
  _QWORD *v9;
  NSString v10;
  id v11;
  objc_super v13;

  v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType(v3);
  v8 = v4;
  v9 = sub_1000419B8();
  sub_1000419D0(*v9);
  *(_QWORD *)&v8[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType] = 0;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = v8;
  v13.super_class = ObjectType;
  v11 = objc_msgSendSuper2(&v13, "initWithNibName:bundle:", v10, a3);

  return v11;
}

id sub_100040228(void *a1)
{
  void *v1;
  objc_class *ObjectType;
  char *v4;
  _QWORD *v5;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(v1);
  v4 = v1;
  v5 = sub_1000419B8();
  sub_1000419D0(*v5);
  *(_QWORD *)&v4[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType] = 0;

  v8.receiver = v4;
  v8.super_class = ObjectType;
  v6 = objc_msgSendSuper2(&v8, "initWithCoder:", a1);

  return v6;
}

id sub_100040350(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  objc_class *ObjectType;
  char *v7;
  _QWORD *v8;
  NSDictionary v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16;
  id v17;
  objc_super v19;
  _QWORD v20[3];
  uint64_t v21;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType(v2);
  v7 = v3;
  v8 = sub_1000419B8();
  sub_1000419D0(*v8);
  *(_QWORD *)&v7[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType] = 0;

  if (a1)
  {
    v9.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v9.super.isa = 0;
  }
  sub_100027F28(a2, (uint64_t)v20, &qword_1000914C0);
  v10 = v21;
  if (v21)
  {
    v11 = sub_1000279D8(v20, v21);
    v12 = *(_QWORD *)(v10 - 8);
    __chkstk_darwin(v11);
    v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v12 + 16))(v14);
    v15 = _bridgeAnythingToObjectiveC<A>(_:)(v14, v10);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v10);
    sub_1000279FC(v20);
  }
  else
  {
    v15 = 0;
  }
  v19.receiver = v7;
  v19.super_class = ObjectType;
  v16 = objc_msgSendSuper2(&v19, "initWithInternalInfo:parent:", v9.super.isa, v15);

  swift_unknownObjectRelease(v15);
  v17 = v16;
  sub_10002BD8C(a2, &qword_1000914C0);
  if (v17)

  return v17;
}

uint64_t sub_1000405E4()
{
  return type metadata accessor for BiometryCompanionViewController(0);
}

uint64_t type metadata accessor for BiometryCompanionViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_1000928D8;
  if (!qword_1000928D8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for BiometryCompanionViewController);
  return result;
}

uint64_t sub_100040628(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.Int64 + 64;
    result = swift_updateClassMetadata2(a1, 256, 2, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

void sub_1000406F8()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  objc_super v8;

  v1 = v0;
  v8.receiver = v0;
  v8.super_class = (Class)swift_getObjectType(v0);
  objc_msgSendSuper2(&v8, "viewDidLoad");
  v7 = *(_QWORD *)&v0[OBJC_IVAR____TtC10CoreAuthUIP33_AABE3714D9C58676A24E916892CB721E27BiometryAlertViewController_biometryType];
  v2 = objc_allocWithZone((Class)sub_100025D1C(&qword_1000917E0));
  v3 = (void *)UIHostingController.init(rootView:)(&v7);
  v4 = objc_msgSend(v3, "view");
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
    objc_msgSend(v5, "setBackgroundColor:", v6);

    objc_msgSend(v1, "_setHeaderContentViewController:", v3);
  }
  else
  {
    __break(1u);
  }
}

void type metadata accessor for LABiometryType(uint64_t a1)
{
  sub_10004181C(a1, &qword_1000917D8, (uint64_t)&unk_10007B8E0);
}

uint64_t sub_100040868()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10004088C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  __int128 v20;
  uint64_t v21;
  char v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _OWORD v42[3];

  v4 = sub_100025D1C(&qword_1000917F8);
  __chkstk_darwin(v4);
  v6 = (_QWORD *)((char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_100025D1C(&qword_100091800);
  __chkstk_darwin(v7);
  v9 = (char *)v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100025D1C(&qword_100091808);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v6 = static Alignment.center.getter(v11);
  v6[1] = v14;
  v15 = sub_100025D1C(&qword_100091810);
  v16 = sub_100040AD8(a1, (uint64_t)v6 + *(int *)(v15 + 44));
  v17 = static Alignment.center.getter(v16);
  _FrameLayout.init(width:height:alignment:)(v42, 0x4056800000000000, 0, 0x4051800000000000, 0, v17, v18);
  sub_100027F28((uint64_t)v6, (uint64_t)v9, &qword_1000917F8);
  v19 = &v9[*(int *)(v7 + 36)];
  v20 = v42[1];
  *(_OWORD *)v19 = v42[0];
  *((_OWORD *)v19 + 1) = v20;
  *((_OWORD *)v19 + 2) = v42[2];
  v21 = sub_10002BD8C((uint64_t)v6, &qword_1000917F8);
  v22 = static Edge.Set.top.getter(v21);
  v23 = EdgeInsets.init(_all:)(30.0);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  sub_100027F28((uint64_t)v9, (uint64_t)v13, &qword_100091800);
  v30 = &v13[*(int *)(v10 + 36)];
  *v30 = v22;
  *((double *)v30 + 1) = v23;
  *((_QWORD *)v30 + 2) = v25;
  *((_QWORD *)v30 + 3) = v27;
  *((_QWORD *)v30 + 4) = v29;
  v30[40] = 0;
  v31 = sub_10002BD8C((uint64_t)v9, &qword_100091800);
  v32 = static Edge.Set.bottom.getter(v31);
  v33 = EdgeInsets.init(_all:)(5.0);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  sub_100027F28((uint64_t)v13, a2, &qword_100091808);
  v40 = a2 + *(int *)(sub_100025D1C(&qword_100091818) + 36);
  *(_BYTE *)v40 = v32;
  *(double *)(v40 + 8) = v33;
  *(_QWORD *)(v40 + 16) = v35;
  *(_QWORD *)(v40 + 24) = v37;
  *(_QWORD *)(v40 + 32) = v39;
  *(_BYTE *)(v40 + 40) = 0;
  return sub_10002BD8C((uint64_t)v13, &qword_100091808);
}

uint64_t sub_100040AD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *KeyPath;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _OWORD v88[2];
  uint64_t v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t v95;

  v83 = a1;
  v85 = a2;
  v2 = sub_100025D1C(&qword_100091820);
  __chkstk_darwin(v2);
  KeyPath = (char *)&v78 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Image.ResizingMode(0);
  v81 = *(_QWORD *)(v4 - 8);
  v82 = v4;
  __chkstk_darwin(v4);
  v80 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100025D1C(&qword_100091828);
  __chkstk_darwin(v6);
  v8 = (char *)&v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v78 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100025D1C(&qword_100091830);
  __chkstk_darwin(v12);
  v14 = (char *)&v78 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_100025D1C(&qword_100091838);
  v15 = __chkstk_darwin(v79);
  v87 = (uint64_t)&v78 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v86 = (uint64_t)&v78 - v17;
  v18 = &v11[*(int *)(v9 + 20)];
  v19 = enum case for RoundedCornerStyle.continuous(_:);
  v20 = type metadata accessor for RoundedCornerStyle(0);
  v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 104);
  v22 = v21(v18, v19, v20);
  __asm { FMOV            V0.2D, #10.0 }
  v78 = _Q0;
  *(_OWORD *)v11 = _Q0;
  v28 = static Color.blue.getter(v22);
  v29 = Color.opacity(_:)(0.1);
  swift_release(v28);
  sub_100041740((uint64_t)v11, (uint64_t)v14);
  *(_QWORD *)&v14[*(int *)(v12 + 52)] = v29;
  *(_WORD *)&v14[*(int *)(v12 + 56)] = 256;
  sub_100041784((uint64_t)v11);
  v30 = v21(&v11[*(int *)(v9 + 20)], v19, v20);
  *(_OWORD *)v11 = v78;
  v31 = static Color.blue.getter(v30);
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)(v88, 0, 0, &_swiftEmptyArrayStorage, 3.0, 10.0, 0.0);
  sub_100041740((uint64_t)v11, (uint64_t)v8);
  v32 = &v8[*(int *)(sub_100025D1C(&qword_100091840) + 36)];
  v33 = v88[1];
  *(_OWORD *)v32 = v88[0];
  *((_OWORD *)v32 + 1) = v33;
  *((_QWORD *)v32 + 4) = v89;
  v34 = sub_100025D1C(&qword_100091848);
  *(_QWORD *)&v8[*(int *)(v34 + 52)] = v31;
  *(_WORD *)&v8[*(int *)(v34 + 56)] = 256;
  v35 = ((uint64_t (*)(void))static Alignment.center.getter)();
  v37 = v36;
  v38 = (uint64_t *)&v8[*(int *)(sub_100025D1C(&qword_100091850) + 36)];
  *v38 = v35;
  v38[1] = v37;
  v39 = sub_100041784((uint64_t)v11);
  v40 = static Alignment.center.getter(v39);
  v42 = v41;
  v43 = v87;
  v44 = v87 + *(int *)(v79 + 36);
  sub_100027F28((uint64_t)v8, v44, &qword_100091828);
  v45 = (uint64_t *)(v44 + *(int *)(sub_100025D1C(&qword_100091858) + 36));
  *v45 = v40;
  v45[1] = v42;
  sub_100027F28((uint64_t)v14, v43, &qword_100091830);
  sub_10002BD8C((uint64_t)v8, &qword_100091828);
  sub_10002BD8C((uint64_t)v14, &qword_100091830);
  v46 = v86;
  sub_1000417C0(v43, v86);
  v47 = 0xE000000000000000;
  v48 = 0x646965636166;
  if (v83 == 2)
    v47 = 0xE600000000000000;
  else
    v48 = 0;
  if (v83 == 1)
    v49 = 0x64696863756F74;
  else
    v49 = v48;
  if (v83 == 1)
    v50 = 0xE700000000000000;
  else
    v50 = v47;
  v51 = Image.init(systemName:)(v49, v50);
  v53 = v80;
  v52 = v81;
  v54 = v82;
  (*(void (**)(char *, _QWORD, uint64_t))(v81 + 104))(v80, enum case for Image.ResizingMode.stretch(_:), v82);
  v83 = Image.resizable(capInsets:resizingMode:)(v53, v51, 0.0, 0.0, 0.0, 0.0);
  swift_release(v51);
  v55 = (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v53, v54);
  v56 = static Font.Weight.light.getter(v55);
  v57 = type metadata accessor for Font.Design(0);
  v58 = (uint64_t)KeyPath;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(KeyPath, 1, 1, v57);
  v82 = static Font.system(size:weight:design:)(*(_QWORD *)&v56, 0, v58, 16.0);
  sub_10002BD8C(v58, &qword_100091820);
  KeyPath = (char *)swift_getKeyPath(&unk_100060AC8);
  v59 = static Color.blue.getter(KeyPath);
  v60 = swift_getKeyPath(&unk_100060AF8);
  v61 = static Alignment.center.getter(v60);
  _FrameLayout.init(width:height:alignment:)(&v90, 0x403C000000000000, 0, 0x403C000000000000, 0, v61, v62);
  v63 = v90;
  LOBYTE(v53) = v91;
  v64 = v92;
  v65 = v93;
  v66 = v94;
  v67 = v95;
  v68 = v46;
  v69 = v87;
  sub_100027F28(v68, v87, &qword_100091838);
  v70 = v69;
  v71 = v85;
  sub_100027F28(v70, v85, &qword_100091838);
  v72 = v71 + *(int *)(sub_100025D1C(&qword_100091860) + 48);
  v73 = v83;
  v74 = KeyPath;
  *(_QWORD *)v72 = v83;
  *(_QWORD *)(v72 + 8) = v74;
  v75 = v82;
  *(_QWORD *)(v72 + 16) = v82;
  *(_QWORD *)(v72 + 24) = v60;
  *(_QWORD *)(v72 + 32) = v59;
  *(_QWORD *)(v72 + 40) = v63;
  *(_BYTE *)(v72 + 48) = (_BYTE)v53;
  *(_QWORD *)(v72 + 56) = v64;
  *(_BYTE *)(v72 + 64) = v65;
  *(_QWORD *)(v72 + 72) = v66;
  *(_QWORD *)(v72 + 80) = v67;
  v76 = v73;
  swift_retain(v73);
  swift_retain(v74);
  swift_retain(v75);
  swift_retain(v60);
  swift_retain(v59);
  sub_10002BD8C(v86, &qword_100091838);
  swift_release(v59);
  swift_release(v60);
  swift_release(v75);
  swift_release(v74);
  swift_release(v76);
  return sub_10002BD8C(v87, &qword_100091838);
}

uint64_t sub_1000410C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_10004088C(*v1, a1);
}

char *sub_1000410D0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_100025D1C(&qword_1000917F0);
      v11 = (char *)swift_allocObject(v10, 40 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 40);
      v13 = v11 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[40 * v8 + 32])
          memmove(v13, a4 + 32, 40 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_100041368(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000411F0()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100041214()
{
  sub_100041270((SEL *)&selRef_uiCancel);
}

unint64_t sub_100041220()
{
  unint64_t result;

  result = qword_1000917E8;
  if (!qword_1000917E8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000917E8);
  }
  return result;
}

void sub_100041264()
{
  sub_100041270((SEL *)&selRef_uiFallback);
}

void sub_100041270(SEL *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *Strong;
  void *v5;
  _BYTE v6[24];

  v3 = v1 + 16;
  swift_beginAccess(v3, v6, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = Strong;
    objc_msgSend(Strong, *a1);

  }
}

uint64_t sub_1000412C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000412F0(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_100041318@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100041340(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_100041368(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v5 = a4 + 40 * a1 + 32;
  v6 = a3 + 40 * v4;
  if (v5 >= v6 || v5 + 40 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v6;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for BiometryCompanionViewController.AlertAction(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for BiometryCompanionViewController.AlertAction(_QWORD *a1)
{
  uint64_t result;

  result = swift_bridgeObjectRelease(a1[1]);
  if (a1[3])
    return swift_release(a1[4]);
  return result;
}

_QWORD *initializeWithCopy for BiometryCompanionViewController.AlertAction(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v6 = a2 + 3;
  v5 = a2[3];
  swift_bridgeObjectRetain(v4);
  if (v5)
  {
    v7 = a2[4];
    a1[3] = v5;
    a1[4] = v7;
    swift_retain(v7);
  }
  else
  {
    *(_OWORD *)(a1 + 3) = *v6;
  }
  return a1;
}

_QWORD *assignWithCopy for BiometryCompanionViewController.AlertAction(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = a1[3];
  a1[2] = a2[2];
  v7 = a2[3];
  if (!v6)
  {
    if (v7)
    {
      v10 = a2[4];
      a1[3] = v7;
      a1[4] = v10;
      swift_retain(v10);
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
    return a1;
  }
  if (!v7)
  {
    swift_release(a1[4]);
    goto LABEL_7;
  }
  v8 = a2[4];
  v9 = a1[4];
  a1[3] = v7;
  a1[4] = v8;
  swift_retain(v8);
  swift_release(v9);
  return a1;
}

__n128 initializeWithTake for BiometryCompanionViewController.AlertAction(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_QWORD *assignWithTake for BiometryCompanionViewController.AlertAction(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2[1];
  v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  v6 = a2[3];
  v7 = a1[3];
  a1[2] = a2[2];
  if (!v7)
  {
    if (v6)
    {
      v10 = a2[4];
      a1[3] = v6;
      a1[4] = v10;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
    return a1;
  }
  if (!v6)
  {
    swift_release(a1[4]);
    goto LABEL_7;
  }
  v8 = a2[4];
  v9 = a1[4];
  a1[3] = v6;
  a1[4] = v8;
  swift_release(v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for BiometryCompanionViewController.AlertAction(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BiometryCompanionViewController.AlertAction(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BiometryCompanionViewController.AlertAction()
{
  return &type metadata for BiometryCompanionViewController.AlertAction;
}

ValueMetadata *type metadata accessor for GlyphView()
{
  return &type metadata for GlyphView;
}

uint64_t sub_100041730(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100073E0C, 1);
}

uint64_t sub_100041740(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100041784(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000417C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100025D1C(&qword_100091838);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void type metadata accessor for Style(uint64_t a1)
{
  sub_10004181C(a1, &qword_100091868, (uint64_t)&unk_10007BA28);
}

void sub_10004181C(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_100041860()
{
  return sub_1000418B8(&qword_100091870, &qword_100091818, (void (*)(void))sub_100041894);
}

uint64_t sub_100041894()
{
  return sub_1000418B8(&qword_100091878, &qword_100091808, (void (*)(void))sub_100041920);
}

uint64_t sub_1000418B8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10002C0E0(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100041920()
{
  return sub_1000418B8(&qword_100091880, &qword_100091800, (void (*)(void))sub_100041944);
}

unint64_t sub_100041944()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091888;
  if (!qword_100091888)
  {
    v1 = sub_10002C0E0(&qword_1000917F8);
    result = swift_getWitnessTable(&protocol conformance descriptor for ZStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100091888);
  }
  return result;
}

uint64_t sub_1000419B0()
{
  return 3;
}

void *sub_1000419B8()
{
  return &unk_100060B50;
}

void *sub_1000419C4()
{
  return &unk_100060B58;
}

uint64_t sub_1000419D4@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v28[24];

  v4 = sub_100025D1C(&qword_1000918C0);
  v5 = __chkstk_darwin(v4);
  v7 = &v28[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v5);
  v9 = &v28[-v8 - 8];
  if (qword_100092980 != -1)
    swift_once(&qword_100092980, sub_1000420B0);
  v10 = sub_100041C54(a1);
  v12 = v11;
  swift_beginAccess(&qword_100092988, v28, 32, 0);
  v13 = qword_100092988;
  if (*(_QWORD *)(qword_100092988 + 16) && (v14 = sub_100027F7C(v10, v12), (v15 & 1) != 0))
  {
    v16 = v14;
    v17 = *(_QWORD *)(v13 + 56);
    v18 = type metadata accessor for Logger(0);
    v19 = *(_QWORD *)(v18 - 8);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v19 + 16))(v9, v17 + *(_QWORD *)(v19 + 72) * v16, v18);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v9, 0, 1, v18);
  }
  else
  {
    v18 = type metadata accessor for Logger(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v9, 1, 1, v18);
  }
  swift_bridgeObjectRelease(v12);
  swift_endAccess(v28);
  type metadata accessor for Logger(0);
  v20 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v20 + 48))(v9, 1, v18) == 1)
  {
    v21 = sub_100041C54(a1);
    Logger.init(subsystem:category:)(0xD00000000000001DLL, 0x800000010006EA80, v21, v22);
    sub_1000430B0((uint64_t)v9);
  }
  else
  {
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v20 + 32))(a2, v9, v18);
  }
  v23 = sub_100041C54(a1);
  v25 = v24;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v20 + 16))(v7, a2, v18);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v7, 0, 1, v18);
  swift_beginAccess(&qword_100092988, v28, 33, 0);
  sub_10004226C((uint64_t)v7, v23, v25);
  return swift_endAccess(v28);
}

void *sub_100041C40()
{
  return &unk_100060B60;
}

uint64_t sub_100041C4C()
{
  return 4;
}

uint64_t sub_100041C54(char a1)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;
  char *v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  if ((a1 & 1) == 0)
  {
    v2 = (char *)&_swiftEmptyArrayStorage;
    if ((a1 & 2) == 0)
      goto LABEL_12;
    goto LABEL_7;
  }
  v2 = sub_100042E8C(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
  v4 = *((_QWORD *)v2 + 2);
  v3 = *((_QWORD *)v2 + 3);
  if (v4 >= v3 >> 1)
    v2 = sub_100042E8C((char *)(v3 > 1), v4 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v4 + 1;
  v5 = &v2[16 * v4];
  *((_QWORD *)v5 + 4) = 0x6369767265534955;
  *((_QWORD *)v5 + 5) = 0xE900000000000065;
  if ((a1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
      v2 = sub_100042E8C(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
    v7 = *((_QWORD *)v2 + 2);
    v6 = *((_QWORD *)v2 + 3);
    if (v7 >= v6 >> 1)
      v2 = sub_100042E8C((char *)(v6 > 1), v7 + 1, 1, v2);
    *((_QWORD *)v2 + 2) = v7 + 1;
    v8 = &v2[16 * v7];
    *((_QWORD *)v8 + 4) = 0x7463617265746E49;
    *((_QWORD *)v8 + 5) = 0xEB00000000657669;
  }
LABEL_12:
  if ((a1 & 4) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
      v2 = sub_100042E8C(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
    v10 = *((_QWORD *)v2 + 2);
    v9 = *((_QWORD *)v2 + 3);
    if (v10 >= v9 >> 1)
      v2 = sub_100042E8C((char *)(v9 > 1), v10 + 1, 1, v2);
    *((_QWORD *)v2 + 2) = v10 + 1;
    v11 = &v2[16 * v10];
    strcpy(v11 + 32, "Authorization");
    *((_WORD *)v11 + 23) = -4864;
  }
  v12 = sub_100025D1C(&qword_100091890);
  v13 = sub_100042028();
  v14 = BidirectionalCollection<>.joined(separator:)(44, 0xE100000000000000, v12, v13);
  swift_bridgeObjectRelease(v2);
  return v14;
}

_QWORD *sub_100041E60@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_100041E6C(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_100041E74@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_100041E88@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_100041E9C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100041EB0(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_100041EE0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_100041F0C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_100041F30(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_100041F44(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_100041F58(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_100041F6C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100041F80(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_100041F94(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_100041FA8(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_100041FBC()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_100041FCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

_QWORD *sub_100041FE4(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_100041FF8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100042008(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_100042014(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

unint64_t sub_100042028()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091898;
  if (!qword_100091898)
  {
    v1 = sub_10002C0E0(&qword_100091890);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100091898);
  }
  return result;
}

uint64_t sub_100042074@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_100043078(a1);
  result = swift_bridgeObjectRelease(a1);
  *a2 = v4;
  return result;
}

unint64_t sub_1000420B0()
{
  unint64_t result;

  result = sub_1000420D4((uint64_t)&_swiftEmptyArrayStorage);
  qword_100092988 = result;
  return result;
}

unint64_t sub_1000420D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t result;
  char v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = sub_100025D1C(&qword_1000918D0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (uint64_t *)((char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v26 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v26);
    return (unint64_t)v8;
  }
  sub_100025D1C(&qword_1000918C8);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = (char *)v5 + *(int *)(v2 + 48);
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v28 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_1000430F0(v13, (uint64_t)v5);
    v15 = *v5;
    v16 = v5[1];
    result = sub_100027F7C(*v5, v16);
    if ((v18 & 1) != 0)
      break;
    v19 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v20 = (uint64_t *)(v8[6] + 16 * result);
    *v20 = v15;
    v20[1] = v16;
    v21 = v8[7];
    v22 = type metadata accessor for Logger(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v19, v10, v22);
    v23 = v8[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
      goto LABEL_12;
    v8[2] = v25;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      v26 = v28;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_10004226C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = v3;
  v8 = sub_100025D1C(&qword_1000918C0);
  __chkstk_darwin(v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Logger(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_1000430B0(a1);
    sub_1000423D0(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease(a3);
    return sub_1000430B0((uint64_t)v10);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v19 = *v4;
    *v4 = 0x8000000000000000;
    sub_100042A64((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    v17 = *v4;
    *v4 = v19;
    swift_bridgeObjectRelease(a3);
    return swift_bridgeObjectRelease(v17);
  }
}

uint64_t sub_1000423D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  unint64_t v9;
  char v10;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v4 = v3;
  v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  v9 = sub_100027F7C(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v12 = *v4;
    v19 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100042C30();
      v12 = v19;
    }
    swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v9 + 8));
    v13 = *(_QWORD *)(v12 + 56);
    v14 = type metadata accessor for Logger(0);
    v15 = *(_QWORD *)(v14 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v15 + 32))(a3, v13 + *(_QWORD *)(v15 + 72) * v9, v14);
    sub_100042868(v9, v12);
    v16 = *v4;
    *v4 = v12;
    swift_bridgeObjectRelease(v16);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v15 + 56))(a3, 0, 1, v14);
  }
  else
  {
    v18 = type metadata accessor for Logger(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a3, 1, 1, v18);
  }
}

Swift::Int sub_100042500(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  Swift::Int result;
  int64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  int64_t v42;
  _QWORD *v43;
  int v44;
  char *v45;
  uint64_t v46;
  _QWORD v47[9];

  v3 = v2;
  v46 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v46 - 8);
  __chkstk_darwin(v46);
  v45 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v3;
  if (*(_QWORD *)(*v3 + 24) > a1)
    a1 = *(_QWORD *)(*v3 + 24);
  sub_100025D1C(&qword_1000918C8);
  v44 = a2;
  v9 = static _DictionaryStorage.resize(original:capacity:move:)(v8, a1, a2);
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v41 = v3;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v43 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v42 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain(v8);
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_24;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v42)
      goto LABEL_36;
    v23 = v43[v22];
    ++v17;
    if (!v23)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v42)
        goto LABEL_36;
      v23 = v43[v17];
      if (!v23)
        break;
    }
LABEL_23:
    v14 = (v23 - 1) & v23;
    v21 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_24:
    v25 = *(_QWORD *)(v8 + 56);
    v26 = v8;
    v27 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v21);
    v29 = *v27;
    v28 = v27[1];
    v30 = *(_QWORD *)(v6 + 72);
    v31 = v25 + v30 * v21;
    if ((v44 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v45, v31, v46);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v45, v31, v46);
      swift_bridgeObjectRetain(v28);
    }
    Hasher.init(_seed:)(v47, *(_QWORD *)(v10 + 40));
    String.hash(into:)(v47, v29, v28);
    result = Hasher._finalize()();
    v32 = -1 << *(_BYTE *)(v10 + 32);
    v33 = result & ~v32;
    v34 = v33 >> 6;
    if (((-1 << v33) & ~*(_QWORD *)(v15 + 8 * (v33 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v15 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v37 = v34 == v36;
        if (v34 == v36)
          v34 = 0;
        v35 |= v37;
        v38 = *(_QWORD *)(v15 + 8 * v34);
      }
      while (v38 == -1);
      v18 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v18);
    *v19 = v29;
    v19[1] = v28;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v10 + 56) + v30 * v18, v45, v46);
    ++*(_QWORD *)(v10 + 16);
    v8 = v26;
  }
  v24 = v22 + 2;
  if (v24 < v42)
  {
    v23 = v43[v24];
    if (!v23)
    {
      while (1)
      {
        v17 = v24 + 1;
        if (__OFADD__(v24, 1))
          goto LABEL_43;
        if (v17 >= v42)
          goto LABEL_36;
        v23 = v43[v17];
        ++v24;
        if (v23)
          goto LABEL_23;
      }
    }
    v17 = v24;
    goto LABEL_23;
  }
LABEL_36:
  swift_release(v8);
  v3 = v41;
  if ((v44 & 1) != 0)
  {
    v39 = 1 << *(_BYTE *)(v8 + 32);
    if (v39 >= 64)
      bzero(v43, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    else
      *v43 = -1 << v39;
    *(_QWORD *)(v8 + 16) = 0;
  }
LABEL_41:
  result = swift_release(v8);
  *v3 = v10;
  return result;
}

unint64_t sub_100042868(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Int v12;
  unint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  unint64_t v21;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD v29[9];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        v9 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v10 = *v9;
        v11 = v9[1];
        Hasher.init(_seed:)(v29, *(_QWORD *)(a2 + 40));
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v29, v10, v11);
        v12 = Hasher._finalize()();
        result = swift_bridgeObjectRelease(v11);
        v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v13 < v8)
          goto LABEL_11;
LABEL_12:
        v14 = *(_QWORD *)(a2 + 48);
        v15 = (_OWORD *)(v14 + 16 * v3);
        v16 = (_OWORD *)(v14 + 16 * v6);
        if (v3 != v6 || v15 >= v16 + 1)
          *v15 = *v16;
        v17 = *(_QWORD *)(a2 + 56);
        v18 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for Logger(0) - 8) + 72);
        v19 = v18 * v3;
        result = v17 + v18 * v3;
        v20 = v18 * v6;
        v21 = v17 + v18 * v6 + v18;
        if (v19 < v20 || result >= v21)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v19 == v20)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v13 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v13)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v23 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v24 = *v23;
    v25 = (-1 << v3) - 1;
  }
  else
  {
    v23 = (uint64_t *)(v4 + 8 * (result >> 6));
    v25 = *v23;
    v24 = (-1 << result) - 1;
  }
  *v23 = v25 & v24;
  v26 = *(_QWORD *)(a2 + 16);
  v27 = __OFSUB__(v26, 1);
  v28 = v26 - 1;
  if (v27)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v28;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_100042A64(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_100027F7C(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7];
        v20 = type metadata accessor for Logger(0);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v12, a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_100042C30();
      goto LABEL_7;
    }
    sub_100042500(v15, a4 & 1);
    v22 = sub_100027F7C(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_100042BA0(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain(a3);
    }
  }
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_100042BA0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = type metadata accessor for Logger(0);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, a4, v10);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

void *sub_100042C30()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v34 - 8);
  __chkstk_darwin(v34);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100025D1C(&qword_1000918C8);
  v31 = v0;
  v4 = *v0;
  v5 = static _DictionaryStorage.copy(original:)(*v0);
  v6 = *(_QWORD *)(v4 + 16);
  v35 = v5;
  if (!v6)
  {
    result = (void *)swift_release(v4);
    v29 = v35;
    v28 = v31;
LABEL_28:
    *v28 = v29;
    return result;
  }
  v7 = v5;
  result = (void *)(v5 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    v7 = v35;
  }
  v32 = v4 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v4 + 16);
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v33 = (unint64_t)(v12 + 63) >> 6;
  v15 = v34;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      v11 = v25 + 1;
      if (v25 + 1 >= v33)
        goto LABEL_26;
      v26 = *(_QWORD *)(v32 + 8 * v11);
      if (!v26)
        break;
    }
LABEL_25:
    v14 = (v26 - 1) & v26;
    v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(_QWORD *)(v4 + 56) + v22, v15);
    v23 = v35;
    v24 = (_QWORD *)(*(_QWORD *)(v35 + 48) + v18);
    *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v23 + 56) + v22, v3, v15);
    result = (void *)swift_bridgeObjectRetain(v20);
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release(v4);
    v28 = v31;
    v29 = v35;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v32 + 8 * v27);
  if (v26)
  {
    v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v11 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v11);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

char *sub_100042E8C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100025D1C(&qword_1000918B8);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v14);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

unint64_t sub_100042F90()
{
  unint64_t result;

  result = qword_1000918A0;
  if (!qword_1000918A0)
  {
    result = swift_getWitnessTable(&unk_100060C68, &type metadata for LogCategory);
    atomic_store(result, (unint64_t *)&qword_1000918A0);
  }
  return result;
}

unint64_t sub_100042FDC()
{
  unint64_t result;

  result = qword_1000918A8;
  if (!qword_1000918A8)
  {
    result = swift_getWitnessTable(&unk_100060CA0, &type metadata for LogCategory);
    atomic_store(result, (unint64_t *)&qword_1000918A8);
  }
  return result;
}

unint64_t sub_100043024()
{
  unint64_t result;

  result = qword_1000918B0;
  if (!qword_1000918B0)
  {
    result = swift_getWitnessTable(&unk_100060CC8, &type metadata for LogCategory);
    atomic_store(result, (unint64_t *)&qword_1000918B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for LogCategory()
{
  return &type metadata for LogCategory;
}

uint64_t sub_100043078(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_1000430B0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100025D1C(&qword_1000918C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000430F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100025D1C(&qword_1000918D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

double sub_10004313C()
{
  return 10.0;
}

void sub_100043144(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*sub_10004314C())()
{
  return nullsub_12;
}

uint64_t sub_10004315C(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*sub_100043164())()
{
  return nullsub_12;
}

double sub_100043174(double a1, double a2)
{
  return a2;
}

void sub_10004317C(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 16) = a1;
}

uint64_t (*sub_100043184())()
{
  return nullsub_12;
}

CGFloat sub_100043194@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D2>, double a4@<D3>)
{
  long double v6;
  CGFloat result;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;

  v6 = sin(a4 * 3.14159265 * (double)a1);
  CGAffineTransformMakeTranslation(&v10, v6 * a3, 0.0);
  result = v10.a;
  v8 = *(_OWORD *)&v10.c;
  v9 = *(_OWORD *)&v10.tx;
  *(_OWORD *)a2 = *(_OWORD *)&v10.a;
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)(a2 + 24) = v8;
  *(_QWORD *)(a2 + 40) = 0;
  *(_OWORD *)(a2 + 48) = v9;
  *(_QWORD *)(a2 + 64) = 0x3FF0000000000000;
  return result;
}

unint64_t sub_100043214()
{
  unint64_t result;

  result = qword_1000918D8;
  if (!qword_1000918D8)
  {
    result = swift_getWitnessTable(&unk_100060D58, &type metadata for Shake);
    atomic_store(result, (unint64_t *)&qword_1000918D8);
  }
  return result;
}

unint64_t sub_10004325C()
{
  unint64_t result;

  result = qword_1000918E0;
  if (!qword_1000918E0)
  {
    result = swift_getWitnessTable(&unk_100060DA8, &type metadata for Shake);
    atomic_store(result, (unint64_t *)&qword_1000918E0);
  }
  return result;
}

CGFloat sub_1000432A0@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double v3;
  long double v4;
  CGFloat result;
  __int128 v6;
  __int128 v7;
  CGAffineTransform v8;

  v3 = *(double *)v1;
  v4 = sin(*(double *)(v1 + 16) * 3.14159265 * (double)*(uint64_t *)(v1 + 8));
  CGAffineTransformMakeTranslation(&v8, v3 * v4, 0.0);
  result = v8.a;
  v6 = *(_OWORD *)&v8.c;
  v7 = *(_OWORD *)&v8.tx;
  *(_OWORD *)a1 = *(_OWORD *)&v8.a;
  *(_QWORD *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 64) = 0x3FF0000000000000;
  return result;
}

unint64_t sub_100043328()
{
  unint64_t result;

  result = qword_1000918E8;
  if (!qword_1000918E8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_1000918E8);
  }
  return result;
}

double sub_10004336C@<D0>(double *a1@<X8>)
{
  uint64_t v1;
  double result;

  result = *(double *)(v1 + 16);
  *a1 = result;
  return result;
}

double sub_100043378(double *a1)
{
  uint64_t v1;
  double result;

  result = *a1;
  *(double *)(v1 + 16) = *a1;
  return result;
}

uint64_t sub_100043388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10;

  v10 = sub_100043530();
  return static GeometryEffect._makeView(modifier:inputs:body:)(a1, a2, a3, a4, a5, v10);
}

uint64_t sub_1000433F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10;

  v10 = sub_100043530();
  return static GeometryEffect._makeViewList(modifier:inputs:body:)(a1, a2, a3, a4, a5, v10);
}

uint64_t sub_100043458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8;

  v8 = sub_100043530();
  return static GeometryEffect._viewListCount(inputs:body:)(a1, a2, a3, a4, v8);
}

void sub_1000434B0()
{
  ViewModifier<>.body(content:)();
  __break(1u);
}

__n128 initializeBufferWithCopyOfBuffer for Shake(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for Shake(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Shake(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for Shake()
{
  return &type metadata for Shake;
}

unint64_t sub_100043530()
{
  unint64_t result;

  result = qword_1000918F0;
  if (!qword_1000918F0)
  {
    result = swift_getWitnessTable(&unk_100060D18, &type metadata for Shake);
    atomic_store(result, (unint64_t *)&qword_1000918F0);
  }
  return result;
}

void sub_100043574(void *a1)
{
  void *v1;
  void *v2;
  id v4;
  unsigned int v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t *v15;
  unsigned int v16;
  uint64_t v17;
  DTOBiometryAlertFactory *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  Swift::String v25;
  Swift::String v26;
  id v27;

  v2 = v1;
  v4 = objc_msgSend(a1, "userInterfaceRequest");
  v5 = objc_msgSend(v4, "identifier");

  switch(v5)
  {
    case 1u:
      v6 = objc_allocWithZone((Class)type metadata accessor for LACUIDTOSensorNotTrustedScenePresentationHandler(0));
      v7 = (void *)LACUIDTOSensorNotTrustedScenePresentationHandler.init()();
      if (v7)
        goto LABEL_7;
      goto LABEL_15;
    case 2u:
      v8 = objc_allocWithZone((Class)type metadata accessor for LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler(0));
      v7 = (void *)LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.init()();
      if (!v7)
        goto LABEL_15;
      goto LABEL_7;
    case 3u:
      v9 = objc_allocWithZone((Class)type metadata accessor for LACUIOnenessUnsatisfiablePresentationHandler(0));
      v7 = (void *)LACUIOnenessUnsatisfiablePresentationHandler.init(request:)(a1);
      if (v7)
        goto LABEL_7;
      goto LABEL_15;
    case 5u:
      v14 = (void *)objc_opt_self(LACMobileGestalt);
      if ((objc_msgSend(v14, "deviceHasFaceID") & 1) != 0)
      {
        v15 = (uint64_t *)&LACBiometryTypeFaceID;
      }
      else if (objc_msgSend(v14, "deviceHasTouchID"))
      {
        v15 = (uint64_t *)&LACBiometryTypeTouchID;
      }
      else
      {
        v16 = objc_msgSend(v14, "deviceHasOpticID");
        v15 = (uint64_t *)&LACBiometryTypeNone;
        if (v16)
          v15 = (uint64_t *)&LACBiometryTypeOpticID;
      }
      v17 = *v15;
      v18 = sub_100007548();
      v19 = objc_allocWithZone((Class)type metadata accessor for LACUIDTOBiometryRequiredScenePresentationHandler(0));
      v7 = (void *)LACUIDTOBiometryRequiredScenePresentationHandler.init(biometryType:alertFactory:)(v17, v18);
      if (!v7)
        goto LABEL_15;
LABEL_7:
      v10 = objc_msgSend(v2, "scene");
      v11 = objc_allocWithZone((Class)LACUIScenePresentationContext);
      v12 = v2;
      v27 = objc_msgSend(v11, "initWithPresenter:scene:", v12, v10);

      swift_unknownObjectRelease(v10);
      objc_msgSend(v7, "handle:inContext:", a1, v27);
      v13 = v7;
      break;
    default:
LABEL_15:
      v20 = objc_msgSend(v2, "scene");
      _StringGuts.grow(_:)(24);
      swift_bridgeObjectRelease(0xE000000000000000);
      v21 = objc_msgSend(a1, "description");
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
      v24 = v23;

      v25._countAndFlagsBits = v22;
      v25._object = v24;
      String.append(_:)(v25);
      swift_bridgeObjectRelease(v24);
      v26._countAndFlagsBits = 0x756F6620746F6E20;
      v26._object = (void *)0xEA0000000000646ELL;
      String.append(_:)(v26);
      v27 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(0xEC00000020726F66);
      objc_msgSend(v20, "deactivateWithReason:", v27);
      v13 = v20;
      break;
  }
  swift_unknownObjectRelease(v13);

}

id sub_100043890(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithScene:", a1);
  swift_unknownObjectRelease(a1);
  return v3;
}

id sub_1000438D4(uint64_t a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for RemoteAlertRootViewController();
  v3 = objc_msgSendSuper2(&v5, "initWithScene:", a1);
  swift_unknownObjectRelease(a1);
  return v3;
}

id sub_100043968(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  NSString v6;
  id v7;
  objc_super v9;

  if (a2)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for RemoteAlertRootViewController();
  v7 = objc_msgSendSuper2(&v9, "initWithNibName:bundle:", v6, a3);

  return v7;
}

id sub_100043A80(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for RemoteAlertRootViewController();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_100043B10()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteAlertRootViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RemoteAlertRootViewController()
{
  return objc_opt_self(_TtC10CoreAuthUI29RemoteAlertRootViewController);
}

id sub_100043B60(void *a1, uint64_t a2)
{
  id result;
  uint64_t v4;
  uint64_t v5;

  if (a1)
    return a1;
  v4 = type metadata accessor for AuthorizationViewModel(0);
  v5 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
  result = (id)EnvironmentObject.error()(0, a2, v4, v5);
  __break(1u);
  return result;
}

uint64_t sub_100043BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = type metadata accessor for AuthorizationViewModel(0);
  v5 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
  return EnvironmentObject.projectedValue.getter(a1, a2, v4, v5);
}

_QWORD *sub_100043C18@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *result;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  char v24;

  sub_1000287F0(0, &qword_100091F90, UIDevice_ptr);
  if (sub_1000557C4())
    goto LABEL_4;
  if (a1)
  {
    v6 = a1;
    v7 = sub_1000501B8();

    if (!v7)
    {
      v11 = type metadata accessor for AuthorizationViewModel(0);
      v12 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
      v20 = EnvironmentObject.init()(v11, v12);
      v21 = v13;
      v22 = 1;
      goto LABEL_6;
    }
LABEL_4:
    v8 = type metadata accessor for AuthorizationViewModel(0);
    v9 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
    v20 = EnvironmentObject.init()(v8, v9);
    v21 = v10;
    v22 = 0;
LABEL_6:
    v14 = sub_100043D8C();
    v15 = sub_100043DD0();
    result = _ConditionalContent<>.init(storage:)(&v23, &v20, &type metadata for AuthorizationContentView, &type metadata for AuthorizationView, v14, v15);
    v17 = v24;
    *(_OWORD *)a3 = v23;
    *(_BYTE *)(a3 + 16) = v17;
    return result;
  }
  v18 = type metadata accessor for AuthorizationViewModel(0);
  v19 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
  result = (_QWORD *)EnvironmentObject.error()(0, a2, v18, v19);
  __break(1u);
  return result;
}

unint64_t sub_100043D8C()
{
  unint64_t result;

  result = qword_100092D90;
  if (!qword_100092D90)
  {
    result = swift_getWitnessTable(&unk_100060F5C, &type metadata for AuthorizationContentView);
    atomic_store(result, (unint64_t *)&qword_100092D90);
  }
  return result;
}

unint64_t sub_100043DD0()
{
  unint64_t result;

  result = qword_100092D98[0];
  if (!qword_100092D98[0])
  {
    result = swift_getWitnessTable(&unk_100060F0C, &type metadata for AuthorizationView);
    atomic_store(result, qword_100092D98);
  }
  return result;
}

uint64_t sub_100043E14()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for AuthorizationViewModel(0);
  v1 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
  return EnvironmentObject.init()(v0, v1);
}

uint64_t sub_100043E5C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100073ECC, 1);
}

_QWORD *sub_100043E6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100043C18(*(void **)v1, *(_QWORD *)(v1 + 8), a1);
}

__n128 initializeWithTake for AuthorizationViewWrapper(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationViewWrapper()
{
  return &type metadata for AuthorizationViewWrapper;
}

unint64_t sub_100043E9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091920;
  if (!qword_100091920)
  {
    v1 = sub_10002C0E0(&qword_100091928);
    sub_100043D8C();
    sub_100043DD0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100091920);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for AuthorizationView(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  return a1;
}

void destroy for AuthorizationView(id *a1)
{

}

uint64_t assignWithCopy for AuthorizationView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for AuthorizationView(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for AuthorizationView()
{
  return &type metadata for AuthorizationView;
}

ValueMetadata *type metadata accessor for AuthorizationContentView()
{
  return &type metadata for AuthorizationContentView;
}

uint64_t sub_100043FE0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100074040, 1);
}

uint64_t sub_100043FF0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  char v23;
  double v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (**v31)();
  id v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;

  v35 = a2;
  v5 = sub_100025D1C(&qword_1000919D0);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v34 - v9;
  v11 = sub_100025D1C(&qword_1000919D8);
  v12 = __chkstk_darwin(v11);
  v14 = (uint64_t *)((char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v14 = static Alignment.center.getter(v12);
  v14[1] = v15;
  v16 = type metadata accessor for AuthorizationViewModel(0);
  v17 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
  v18 = EnvironmentObject.init()(v16, v17);
  if (a1)
  {
    v20 = (void *)v18;
    v21 = v19;
    v22 = a1;
    v23 = sub_10004DBE0();

    if ((v23 & 1) != 0)
      v24 = 1.0;
    else
      v24 = 0.0;
    v25 = (char *)v14 + *(int *)(sub_100025D1C(&qword_1000919E0) + 44);
    *(_QWORD *)v10 = static HorizontalAlignment.center.getter();
    *((_QWORD *)v10 + 1) = 0;
    v10[16] = 1;
    v26 = sub_100025D1C(&qword_1000919E8);
    sub_100044268(a1, &v10[*(int *)(v26 + 44)]);
    sub_100027F28((uint64_t)v10, (uint64_t)v8, &qword_1000919D0);
    *(_QWORD *)v25 = v20;
    *((_QWORD *)v25 + 1) = v21;
    *((double *)v25 + 2) = v24;
    v27 = sub_100025D1C(&qword_1000919F0);
    sub_100027F28((uint64_t)v8, (uint64_t)&v25[*(int *)(v27 + 48)], &qword_1000919D0);
    v28 = v20;
    sub_10002BD8C((uint64_t)v10, &qword_1000919D0);
    sub_10002BD8C((uint64_t)v8, &qword_1000919D0);

    v29 = swift_allocObject(&unk_10007BEE8, 32, 7);
    v30 = v35;
    *(_QWORD *)(v29 + 16) = a1;
    *(_QWORD *)(v29 + 24) = v30;
    sub_100027F28((uint64_t)v14, a3, &qword_1000919D8);
    v31 = (uint64_t (**)())(a3 + *(int *)(sub_100025D1C(&qword_1000919F8) + 36));
    *v31 = sub_100045930;
    v31[1] = (uint64_t (*)())v29;
    v31[2] = 0;
    v31[3] = 0;
    v32 = v22;
    return sub_10002BD8C((uint64_t)v14, &qword_1000919D8);
  }
  else
  {
    result = EnvironmentObject.error()(0, v35, v16, v17);
    __break(1u);
  }
  return result;
}

uint64_t sub_100044268@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  id v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;

  v54 = a2;
  v49 = sub_100025D1C(&qword_100091A00);
  __chkstk_darwin(v49);
  v4 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Material(0);
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  __chkstk_darwin(v5);
  v50 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MoveTransition(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v46 - v12;
  v47 = sub_100025D1C(&qword_100091A08);
  __chkstk_darwin(v47);
  v15 = (uint64_t *)((char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v55 = sub_100025D1C(&qword_100091A10);
  v53 = *(_QWORD *)(v55 - 8);
  __chkstk_darwin(v55);
  v48 = (uint64_t)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100025D1C(&qword_100091A18);
  v18 = __chkstk_darwin(v17);
  v20 = (char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v46 - v21;
  v23 = a1;
  v24 = sub_10004DBE0();

  v25 = 1;
  if ((v24 & 1) != 0)
  {
    v26 = type metadata accessor for AuthorizationViewModel(0);
    v27 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
    v28 = (void *)EnvironmentObject.init()(v26, v27);
    v46 = v29;
    MoveTransition.init(edge:)(2);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    v30 = sub_10002C054(&qword_100091A28, (uint64_t (*)(uint64_t))&type metadata accessor for MoveTransition, (uint64_t)&protocol conformance descriptor for MoveTransition);
    v31 = AnyTransition.init<A>(_:)(v11, v7, v30);
    v32 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    v33 = v50;
    v34 = static Material.thick.getter(v32);
    v35 = static Edge.Set.all.getter(v34);
    v37 = v51;
    v36 = v52;
    (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v4, v33, v52);
    v4[*(int *)(v49 + 36)] = v35;
    sub_100027F28((uint64_t)v4, (uint64_t)v15 + *(int *)(v47 + 36), &qword_100091A00);
    v38 = v46;
    *v15 = v28;
    v15[1] = v38;
    v15[2] = v31;
    v39 = v28;
    swift_retain(v31);
    sub_10002BD8C((uint64_t)v4, &qword_100091A00);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v33, v36);
    swift_release(v31);

    v40 = static SafeAreaRegions.container.getter();
    LOBYTE(v39) = static Edge.Set.bottom.getter(v40);
    v41 = v48;
    sub_100027F28((uint64_t)v15, v48, &qword_100091A08);
    v42 = v41 + *(int *)(v55 + 36);
    *(_QWORD *)v42 = v40;
    *(_BYTE *)(v42 + 8) = (_BYTE)v39;
    sub_10002BD8C((uint64_t)v15, &qword_100091A08);
    sub_10004B2A0(v41, (uint64_t)v22, &qword_100091A10);
    v25 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v53 + 56))(v22, v25, 1, v55);
  sub_100027F28((uint64_t)v22, (uint64_t)v20, &qword_100091A18);
  v43 = v54;
  *v54 = 0;
  *((_BYTE *)v43 + 8) = 1;
  v44 = sub_100025D1C(&qword_100091A20);
  sub_100027F28((uint64_t)v20, (uint64_t)v43 + *(int *)(v44 + 48), &qword_100091A18);
  sub_10002BD8C((uint64_t)v22, &qword_100091A18);
  return sub_10002BD8C((uint64_t)v20, &qword_100091A18);
}

uint64_t sub_100044680(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[5];
  uint64_t v26;

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v24 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v11 = a1;
    sub_10004DC1C(1);

    v12 = sub_1000287F0(0, (unint64_t *)&qword_100091FA0, OS_dispatch_queue_ptr);
    v13 = (void *)static OS_dispatch_queue.main.getter(v12);
    v14 = swift_allocObject(&unk_10007BF10, 24, 7);
    swift_unknownObjectWeakInit(v14 + 16, v11);
    aBlock[4] = sub_1000459E4;
    v26 = v14;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100027144;
    aBlock[3] = &unk_10007BF28;
    v15 = _Block_copy(aBlock);
    v16 = swift_release(v26);
    static DispatchQoS.unspecified.getter(v16);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v17 = sub_10002C054((unint64_t *)&qword_1000915D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v18 = sub_100025D1C((uint64_t *)&unk_100091FB0);
    v19 = sub_10002FF9C((unint64_t *)&qword_1000915E0, (uint64_t *)&unk_100091FB0, (uint64_t)&protocol conformance descriptor for [A]);
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v18, v19, v4, v17);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v6, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    v21 = type metadata accessor for AuthorizationViewModel(0);
    v22 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
    result = EnvironmentObject.error()(0, a2, v21, v22);
    __break(1u);
  }
  return result;
}

uint64_t sub_1000448F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100043FF0(*(void **)v1, *(_QWORD *)(v1 + 8), a1);
}

uint64_t sub_1000448FC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100074018, 1);
}

void sub_10004490C(_BYTE *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  BOOL v29;
  float v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  _BYTE *v35;
  double v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;

  v50 = a2;
  v5 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v5);
  v7 = (double *)((char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v51 = type metadata accessor for Material(0);
  v8 = *(_QWORD *)(v51 - 8);
  __chkstk_darwin(v51);
  v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = sub_100025D1C(&qword_100091930);
  __chkstk_darwin(v49);
  v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100025D1C(&qword_100091938);
  __chkstk_darwin(v13);
  v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_100025D1C(&qword_100091940);
  __chkstk_darwin(v48);
  v17 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100025D1C(&qword_100091948);
  v19 = __chkstk_darwin(v18);
  v21 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v55 = v5;
    v56 = a3;
    v22 = a1[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad];
    v52 = v19;
    if ((v22 & 1) != 0)
    {
      v23 = type metadata accessor for AuthorizationViewModel(0);
      v24 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
      v53 = EnvironmentObject.init()(v23, v24);
      v54 = v25;
    }
    else
    {
      v53 = 1;
      v54 = 0;
    }
    *(_QWORD *)v15 = static HorizontalAlignment.center.getter();
    *((_QWORD *)v15 + 1) = 0;
    v15[16] = 1;
    v26 = sub_100025D1C(&qword_100091950);
    v27 = sub_100044D6C(a1, v50, (uint64_t)&v15[*(int *)(v26 + 44)]);
    static Material.thick.getter(v27);
    if (a1[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad] != 1
      || (v28 = a1, v29 = sub_1000501B8(), v28, v30 = 1.0, v29))
    {
      v30 = 0.0;
    }
    v31 = v51;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v12, v10, v51);
    *(float *)&v12[*(int *)(v49 + 36)] = v30;
    v32 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v31);
    v33 = static Edge.Set.all.getter(v32);
    v34 = (uint64_t)&v17[*(int *)(v48 + 36)];
    sub_100027F28((uint64_t)v12, v34, &qword_100091930);
    *(_BYTE *)(v34 + *(int *)(sub_100025D1C(&qword_100091958) + 36)) = v33;
    sub_100027F28((uint64_t)v15, (uint64_t)v17, &qword_100091938);
    sub_10002BD8C((uint64_t)v12, &qword_100091930);
    sub_10002BD8C((uint64_t)v15, &qword_100091938);
    v35 = a1;
    v36 = sub_10004FD28();

    v37 = (char *)v7 + *(int *)(v55 + 20);
    v38 = enum case for RoundedCornerStyle.continuous(_:);
    v39 = type metadata accessor for RoundedCornerStyle(0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 104))(v37, v38, v39);
    *v7 = v36;
    v7[1] = v36;
    v40 = (uint64_t)&v21[*(int *)(v52 + 36)];
    sub_10004B214((uint64_t)v7, v40, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
    *(_WORD *)(v40 + *(int *)(sub_100025D1C(&qword_100091960) + 36)) = 256;
    sub_100027F28((uint64_t)v17, (uint64_t)v21, &qword_100091940);
    sub_10004B258((uint64_t)v7, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
    sub_10002BD8C((uint64_t)v17, &qword_100091940);
    v41 = sub_100045070();
    sub_10002BD8C((uint64_t)v21, &qword_100091948);
    v42 = v56;
    v44 = (void *)v53;
    v43 = v54;
    *v56 = v53;
    v42[1] = v43;
    v42[2] = v41;
    sub_10004553C(v44);
    sub_10004554C(v44);
  }
  else
  {
    v45 = type metadata accessor for AuthorizationViewModel(0);
    v46 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
    EnvironmentObject.error()(0, v50, v45, v46);
    __break(1u);
  }
}

uint64_t sub_100044D6C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  id v30;
  uint64_t v31;
  int *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  char v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;

  v39 = a3;
  v5 = type metadata accessor for AuthorizationHeaderView(0);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (_QWORD *)((char *)&v37 - v9);
  v11 = swift_allocObject(&unk_10007BEC0, 32, 7);
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  v12 = type metadata accessor for AuthorizationViewModel(0);
  v13 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
  v14 = a1;
  *v10 = EnvironmentObject.init()(v12, v13);
  v10[1] = v15;
  v10[2] = sub_1000457CC;
  v10[3] = v11;
  *(_QWORD *)&v45 = 0x4034000000000000;
  v16 = sub_1000457D0();
  ScaledMetric.init(wrappedValue:)(&v45, &type metadata for CGFloat, v16);
  v17 = v14;
  v38 = sub_1000501B8();

  v18 = v17;
  LOBYTE(v14) = sub_100050558();

  v19 = EnvironmentObject.init()(v12, v13);
  v21 = v19;
  v22 = v20;
  if ((v14 & 1) != 0)
  {
    v40 = v19;
    v41 = v20;
    v23 = sub_100045814();
    v24 = sub_100045858();
    v43 = 0;
    v42 = 0uLL;
    v44 = 0;
  }
  else
  {
    v40 = 0;
    v41 = 0;
    State.init(wrappedValue:)(&v45, &v40, &type metadata for AuthorizationRegisterPasswordContentView.Mode);
    v40 = v21;
    v41 = v22;
    v42 = v45;
    v43 = v46;
    v44 = 1;
    v23 = sub_100045814();
    v24 = sub_100045858();
  }
  _ConditionalContent<>.init(storage:)(&v45, &v40, &type metadata for AuthorizationEnterPasswordContentView, &type metadata for AuthorizationRegisterPasswordContentView, v23, v24);
  v25 = v45;
  v26 = v46;
  v27 = v47;
  v28 = v48;
  v29 = v49;
  v30 = v18;
  v37 = sub_1000501B8();

  sub_10004B214((uint64_t)v10, (uint64_t)v8, type metadata accessor for AuthorizationHeaderView);
  v31 = v39;
  sub_10004B214((uint64_t)v8, v39, type metadata accessor for AuthorizationHeaderView);
  v32 = (int *)sub_100025D1C(&qword_1000919C8);
  v33 = v31 + v32[12];
  *(_QWORD *)v33 = 0;
  *(_BYTE *)(v33 + 8) = 0;
  *(_BYTE *)(v33 + 9) = !v38;
  v34 = v31 + v32[16];
  *(_OWORD *)v34 = v25;
  *(_QWORD *)(v34 + 16) = v26;
  *(_QWORD *)(v34 + 24) = v27;
  *(_QWORD *)(v34 + 32) = v28;
  *(_BYTE *)(v34 + 40) = v29;
  v35 = v31 + v32[20];
  *(_QWORD *)v35 = 0;
  *(_BYTE *)(v35 + 8) = 0;
  *(_BYTE *)(v35 + 9) = !v37;
  sub_10004589C((void *)v25, *((uint64_t *)&v25 + 1), v26, v27, v28, v29);
  sub_10004B258((uint64_t)v10, type metadata accessor for AuthorizationHeaderView);
  sub_1000458E0((void *)v25, *((uint64_t *)&v25 + 1), v26, v27, v28, v29);
  return sub_10004B258((uint64_t)v8, type metadata accessor for AuthorizationHeaderView);
}

uint64_t sub_100045070()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double Width;
  id v19;
  double v20;
  double v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v26;
  CGRect v27;

  v1 = v0;
  v2 = sub_100025D1C(&qword_100091968);
  __chkstk_darwin(v2);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100025D1C(&qword_100091970);
  __chkstk_darwin(v5);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000287F0(0, &qword_100091F90, UIDevice_ptr);
  if (sub_1000557C4())
  {
    v8 = (void *)objc_opt_self(UIScreen);
    v9 = objc_msgSend(v8, "mainScreen");
    objc_msgSend(v9, "nativeBounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    v27.origin.x = v11;
    v27.origin.y = v13;
    v27.size.width = v15;
    v27.size.height = v17;
    Width = CGRectGetWidth(v27);
    v19 = objc_msgSend(v8, "mainScreen");
    objc_msgSend(v19, "nativeScale");
    v21 = v20;

    sub_100027F28(v1, (uint64_t)v7, &qword_100091948);
    *(double *)&v7[*(int *)(v5 + 36)] = Width / v21 * 0.55;
    v22 = sub_1000456E0();
    v23 = v7;
    v24 = v5;
  }
  else
  {
    sub_100027F28(v0, (uint64_t)v4, &qword_100091948);
    v22 = sub_1000418B8(&qword_100091978, &qword_100091968, (void (*)(void))sub_10004555C);
    v23 = v4;
    v24 = v2;
  }
  return AnyView.init<A>(_:)(v23, v24, v22);
}

_BYTE *sub_100045260@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v4 = *(_BYTE **)v2;
  v5 = *(_QWORD *)(v2 + 8);
  v6 = static Alignment.center.getter(a1);
  v8 = v7;
  sub_10004490C(v4, v5, (uint64_t *)&v14);
  v13 = v14;
  v9 = v15;
  v10 = swift_allocObject(&unk_10007BE70, 32, 7);
  *(_QWORD *)(v10 + 16) = v4;
  *(_QWORD *)(v10 + 24) = v5;
  v11 = swift_allocObject(&unk_10007BE98, 32, 7);
  *(_QWORD *)(v11 + 16) = v4;
  *(_QWORD *)(v11 + 24) = v5;
  *(_QWORD *)a2 = v6;
  *(_QWORD *)(a2 + 8) = v8;
  *(_OWORD *)(a2 + 16) = v13;
  *(_QWORD *)(a2 + 32) = v9;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = sub_100045354;
  *(_QWORD *)(a2 + 64) = v10;
  *(_QWORD *)(a2 + 72) = sub_10004546C;
  *(_QWORD *)(a2 + 88) = 0;
  *(_QWORD *)(a2 + 96) = 0;
  *(_QWORD *)(a2 + 80) = v11;
  return v4;
}

uint64_t sub_100045330()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_100045354()
{
  uint64_t v0;
  char *v1;
  char *v2;
  void *v3;
  char *v4;
  id v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12[24];

  v1 = *(char **)(v0 + 16);
  if (v1)
  {
    if ((v1[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad] & 1) != 0)
    {
      v2 = &v1[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_expectsDismissOnIpad];
      swift_beginAccess(&v1[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_expectsDismissOnIpad], v12, 0, 0);
      if ((*v2 & 1) == 0)
      {
        v3 = (void *)objc_opt_self(LAErrorHelper);
        v4 = v1;
        v5 = objc_msgSend(v3, "errorWithCode:", -2);
        v6 = sub_10003975C();
        v8 = v7;
        sub_100051F28((uint64_t)v5, (uint64_t (*)(uint64_t))v6, v7);
        swift_release(v8);

      }
    }
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 24);
    v10 = type metadata accessor for AuthorizationViewModel(0);
    v11 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
    EnvironmentObject.error()(0, v9, v10, v11);
    __break(1u);
  }
}

void sub_10004546C()
{
  uint64_t v0;
  void *v1;
  id v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    if ((*((_BYTE *)v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad) & 1) != 0
      || (v2 = v1, v3 = sub_1000501B8(), v2, v3))
    {
      v7 = v1;
      sub_10004E328(1);

    }
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 24);
    v5 = type metadata accessor for AuthorizationViewModel(0);
    v6 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
    EnvironmentObject.error()(0, v4, v5, v6);
    __break(1u);
  }
}

id sub_10004553C(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

void sub_10004554C(id a1)
{
  if (a1 != (id)1)

}

unint64_t sub_10004555C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091980;
  if (!qword_100091980)
  {
    v1 = sub_10002C0E0(&qword_100091948);
    sub_1000455E0();
    sub_10002FF9C(&qword_1000919B0, &qword_100091960, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100091980);
  }
  return result;
}

unint64_t sub_1000455E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091988;
  if (!qword_100091988)
  {
    v1 = sub_10002C0E0(&qword_100091940);
    sub_100045664();
    sub_10002FF9C(&qword_1000919A8, &qword_100091958, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100091988);
  }
  return result;
}

unint64_t sub_100045664()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091990;
  if (!qword_100091990)
  {
    v1 = sub_10002C0E0(&qword_100091938);
    sub_10002FF9C(&qword_100091998, &qword_1000919A0, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100091990);
  }
  return result;
}

unint64_t sub_1000456E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000919B8;
  if (!qword_1000919B8)
  {
    v1 = sub_10002C0E0(&qword_100091970);
    sub_10004555C();
    sub_10004574C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000919B8);
  }
  return result;
}

unint64_t sub_10004574C()
{
  unint64_t result;

  result = qword_100092F20;
  if (!qword_100092F20)
  {
    result = swift_getWitnessTable(&unk_1000611D8, &type metadata for MaxWidth);
    atomic_store(result, (unint64_t *)&qword_100092F20);
  }
  return result;
}

uint64_t type metadata accessor for AuthorizationHeaderView(uint64_t a1)
{
  uint64_t result;

  result = qword_100092F38;
  if (!qword_100092F38)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AuthorizationHeaderView);
  return result;
}

unint64_t sub_1000457D0()
{
  unint64_t result;

  result = qword_1000919C0;
  if (!qword_1000919C0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_1000919C0);
  }
  return result;
}

unint64_t sub_100045814()
{
  unint64_t result;

  result = qword_100092F28;
  if (!qword_100092F28)
  {
    result = swift_getWitnessTable(&unk_100061188, &type metadata for AuthorizationEnterPasswordContentView);
    atomic_store(result, (unint64_t *)&qword_100092F28);
  }
  return result;
}

unint64_t sub_100045858()
{
  unint64_t result;

  result = qword_100092F30;
  if (!qword_100092F30)
  {
    result = swift_getWitnessTable(&unk_100061138, &type metadata for AuthorizationRegisterPasswordContentView);
    atomic_store(result, (unint64_t *)&qword_100092F30);
  }
  return result;
}

id sub_10004589C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  id v7;

  if ((a6 & 1) == 0)
    return a1;
  swift_retain(a5);
  v7 = a1;
  return (id)swift_bridgeObjectRetain(a4);
}

void sub_1000458E0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{

  if ((a6 & 1) != 0)
  {
    swift_bridgeObjectRelease(a4);
    swift_release(a5);
  }
}

uint64_t sub_100045930()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[6];

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  v3 = static Animation.easeOut(duration:)(0.45);
  v5[2] = v2;
  v5[3] = v1;
  withAnimation<A>(_:_:)(v3, sub_100045998, v5, (char *)&type metadata for () + 8);
  return swift_release(v3);
}

uint64_t sub_100045998()
{
  uint64_t v0;

  return sub_100044680(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1000459C0()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000459E4()
{
  uint64_t v0;
  uint64_t Strong;
  void *v2;
  _BYTE v3[24];

  swift_beginAccess(v0 + 16, v3, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v0 + 16);
  if (Strong)
  {
    v2 = (void *)Strong;
    sub_10004E328(1);

  }
}

uint64_t sub_100045A38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100045A48(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

ValueMetadata *type metadata accessor for AuthorizationBackgroundView()
{
  return &type metadata for AuthorizationBackgroundView;
}

uint64_t getEnumTagSinglePayload for AuthorizationRegisterPasswordContentView.Mode(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AuthorizationRegisterPasswordContentView.Mode(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_100045B08(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_100045B20(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationRegisterPasswordContentView.Mode()
{
  return &type metadata for AuthorizationRegisterPasswordContentView.Mode;
}

ValueMetadata *type metadata accessor for MaxWidth()
{
  return &type metadata for MaxWidth;
}

uint64_t destroy for AuthorizationRegisterPasswordContentView(uint64_t a1)
{

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  return swift_release(*(_QWORD *)(a1 + 32));
}

uint64_t initializeWithCopy for AuthorizationRegisterPasswordContentView(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  v6 = v3;
  swift_bridgeObjectRetain(v4);
  swift_retain(v5);
  return a1;
}

uint64_t assignWithCopy for AuthorizationRegisterPasswordContentView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v8);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v10;
  swift_retain(v10);
  swift_release(v9);
  return a1;
}

uint64_t assignWithTake for AuthorizationRegisterPasswordContentView(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  v5 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for AuthorizationRegisterPasswordContentView(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AuthorizationRegisterPasswordContentView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationRegisterPasswordContentView()
{
  return &type metadata for AuthorizationRegisterPasswordContentView;
}

uint64_t _s10CoreAuthUI24AuthorizationViewWrapperVwet_0(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s10CoreAuthUI24AuthorizationViewWrapperVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationEnterPasswordContentView()
{
  return &type metadata for AuthorizationEnterPasswordContentView;
}

char *sub_100045E3C(char *a1, char **a2, uint64_t a3)
{
  int v4;
  char *v5;
  _OWORD *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain(v5);
  }
  else
  {
    v8 = a2 + 2;
    v9 = a2[2];
    *((_QWORD *)a1 + 1) = a2[1];
    v10 = v5;
    if (v9)
    {
      v11 = a2[3];
      *((_QWORD *)a1 + 2) = v9;
      *((_QWORD *)a1 + 3) = v11;
      swift_retain(v11);
    }
    else
    {
      *((_OWORD *)a1 + 1) = *v8;
    }
    v12 = *(int *)(a3 + 24);
    v13 = &a1[v12];
    v14 = (uint64_t)a2 + v12;
    v15 = sub_100025D1C(&qword_100091A30);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_100045F04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  if (*(_QWORD *)(a1 + 16))
    swift_release(*(_QWORD *)(a1 + 24));
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_100025D1C(&qword_100091A30);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_100045F60(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *(void **)a2;
  v7 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v7;
  v9 = (_OWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 16);
  v10 = v6;
  if (v8)
  {
    v11 = *(_QWORD *)(a2 + 24);
    a1[2] = v8;
    a1[3] = v11;
    swift_retain(v11);
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v9;
  }
  v12 = *(int *)(a3 + 24);
  v13 = (char *)a1 + v12;
  v14 = a2 + v12;
  v15 = sub_100025D1C(&qword_100091A30);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

uint64_t sub_100045FFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v10 = *(_QWORD *)(a2 + 16);
  if (!v9)
  {
    if (v10)
    {
      v13 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v10;
      *(_QWORD *)(a1 + 24) = v13;
      swift_retain(v13);
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    goto LABEL_8;
  }
  if (!v10)
  {
    swift_release(*(_QWORD *)(a1 + 24));
    goto LABEL_7;
  }
  v11 = *(_QWORD *)(a2 + 24);
  v12 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 24) = v11;
  swift_retain(v11);
  swift_release(v12);
LABEL_8:
  v14 = *(int *)(a3 + 24);
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = sub_100025D1C(&qword_100091A30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

uint64_t sub_1000460D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v5;
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  }
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_100025D1C(&qword_100091A30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

uint64_t sub_10004615C(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v7 = a2[2];
  v8 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = a2[1];
  if (!v8)
  {
    if (v7)
    {
      v11 = a2[3];
      *(_QWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 24) = v11;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    goto LABEL_8;
  }
  if (!v7)
  {
    swift_release(*(_QWORD *)(a1 + 24));
    goto LABEL_7;
  }
  v9 = a2[3];
  v10 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v9;
  swift_release(v10);
LABEL_8:
  v12 = *(int *)(a3 + 24);
  v13 = a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_100025D1C(&qword_100091A30);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_100046228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100046234);
}

uint64_t sub_100046234(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_100025D1C(&qword_100091A30);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v9);
  }
}

uint64_t sub_1000462C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000462CC);
}

char *sub_1000462CC(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v7 = sub_100025D1C(&qword_100091A30);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

void sub_100046344(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = &unk_100061058;
  v4[1] = &unk_100061058;
  sub_1000463B8(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
  }
}

void sub_1000463B8(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100091A90)
  {
    v2 = sub_1000457D0();
    v3 = type metadata accessor for ScaledMetric(a1, &type metadata for CGFloat, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100091A90);
  }
}

uint64_t sub_100046410()
{
  return sub_1000418B8(&qword_100091AC8, &qword_100091AD0, (void (*)(void))sub_100046444);
}

unint64_t sub_100046444()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091AD8;
  if (!qword_100091AD8)
  {
    v1 = sub_10002C0E0(&qword_100091AE0);
    sub_10002FF9C(&qword_100091AE8, &qword_100091AF0, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100091AD8);
  }
  return result;
}

unint64_t sub_1000464CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091AF8;
  if (!qword_100091AF8)
  {
    v1 = sub_10002C0E0(&qword_1000919F8);
    sub_10002FF9C(&qword_100091B00, &qword_1000919D8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100091AF8);
  }
  return result;
}

uint64_t sub_100046550(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100074150, 1);
}

uint64_t sub_100046560@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  char *v81;
  char v82;
  char *v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  unint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  _QWORD *v110;
  uint64_t v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t v114;
  __int128 v115;
  uint64_t v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  _QWORD *v125;
  uint64_t v126;
  unint64_t v127;
  unint64_t v128;
  char *v129;
  char v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  char *v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t KeyPath;
  uint64_t v151;
  uint64_t *v152;
  _QWORD *v153;
  uint64_t v154;
  uint64_t *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t result;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  char *v163;
  uint64_t v164;
  char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  _QWORD *v172;
  char *v173;
  uint64_t v174;
  uint64_t v175;
  char *v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  char *v195;
  char *v196;
  uint64_t *v197;
  _QWORD *v198;
  _OWORD v199[11];
  _OWORD v200[2];
  _OWORD v201[13];
  char v202;

  v184 = a2;
  v197 = a3;
  v194 = sub_100025D1C(&qword_100091B20);
  v4 = *(_QWORD *)(v194 - 8);
  __chkstk_darwin(v194);
  v6 = (char *)&v161 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100025D1C(&qword_100091B28);
  v8 = __chkstk_darwin(v7);
  v196 = (char *)&v161 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v195 = (char *)&v161 - v10;
  v170 = sub_100025D1C(&qword_100091B30);
  __chkstk_darwin(v170);
  v171 = (uint64_t)&v161 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v190 = sub_100025D1C(&qword_100091B38);
  __chkstk_darwin(v190);
  v172 = (uint64_t *)((char *)&v161 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v178 = sub_100025D1C(&qword_100091B40);
  __chkstk_darwin(v178);
  v177 = (char *)&v161 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100025D1C(&qword_100091B48);
  v164 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v163 = (char *)&v161 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v169 = sub_100025D1C(&qword_100091B50);
  __chkstk_darwin(v169);
  v165 = (char *)&v161 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for BorderedProminentButtonStyle(0);
  v174 = *(_QWORD *)(v17 - 8);
  v175 = v17;
  __chkstk_darwin(v17);
  v173 = (char *)&v161 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_100025D1C(&qword_100091B58);
  v182 = *(_QWORD *)(v19 - 8);
  v183 = v19;
  __chkstk_darwin(v19);
  v181 = (char *)&v161 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_100025D1C(&qword_100091B60);
  v166 = *(_QWORD *)(v21 - 8);
  v167 = v21;
  __chkstk_darwin(v21);
  v23 = (char *)&v161 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v180 = sub_100025D1C(&qword_100091B68);
  v24 = __chkstk_darwin(v180);
  v26 = (char *)&v161 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  v168 = (uint64_t)&v161 - v27;
  v186 = sub_100025D1C(&qword_100091B70);
  __chkstk_darwin(v186);
  v188 = (uint64_t)&v161 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v179 = sub_100025D1C(&qword_100091B78);
  __chkstk_darwin(v179);
  v30 = (uint64_t *)((char *)&v161 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  v187 = sub_100025D1C(&qword_100091B80);
  __chkstk_darwin(v187);
  v32 = (uint64_t *)((char *)&v161 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  v33 = sub_100025D1C(&qword_100091B88);
  v34 = __chkstk_darwin(v33);
  v192 = (uint64_t)&v161 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v34);
  v198 = (uint64_t *)((char *)&v161 - v36);
  if (!a1)
  {
    v159 = type metadata accessor for AuthorizationViewModel(0);
    v160 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
    result = EnvironmentObject.error()(0, v184, v159, v160);
    __break(1u);
    return result;
  }
  v185 = a1;
  v37 = a1;
  v189 = sub_10004E824();
  v191 = v38;

  v39 = v37;
  LOBYTE(v37) = sub_10005000C();

  v193 = v4;
  v176 = v6;
  if ((v37 & 1) != 0)
  {
    v40 = swift_allocObject(&unk_10007C210, 24, 7);
    *(_QWORD *)(v40 + 16) = v39;
    v41 = type metadata accessor for AuthorizationViewModel(0);
    v42 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
    v43 = v39;
    v44 = (void *)EnvironmentObject.init()(v41, v42);
    *v30 = v44;
    v30[1] = v45;
    v30[2] = sub_10004A308;
    v30[3] = v40;
    swift_storeEnumTagMultiPayload(v30, v179, 0);
    v46 = sub_100049EBC();
    v47 = sub_100049F00();
    v48 = v44;
    swift_retain(v40);
    _ConditionalContent<>.init(storage:)(v32, v30, &type metadata for AuthorizationPasscodeView, v180, v46, v47);
    v49 = v188;
    sub_100027F28((uint64_t)v32, v188, &qword_100091B80);
    swift_storeEnumTagMultiPayload(v49, v186, 0);
    v50 = sub_100049E50();
    v51 = sub_100049FF0();
    _ConditionalContent<>.init(storage:)(v198, v49, v187, v190, v50, v51);
    sub_10002BD8C((uint64_t)v32, &qword_100091B80);
    swift_release(v40);

    v53 = (uint64_t)v195;
    v52 = (uint64_t)v196;
    v54 = v194;
  }
  else
  {
    v162 = v39;
    v55 = v39;
    v56 = sub_10004DDA8();

    if ((v56 & 1) != 0)
    {
      v57 = swift_allocObject(&unk_10007C1E8, 32, 7);
      v58 = v184;
      *(_QWORD *)(v57 + 16) = v185;
      *(_QWORD *)(v57 + 24) = v58;
      __chkstk_darwin(v57);
      *(&v161 - 2) = v60;
      *(&v161 - 1) = v59;
      v61 = v55;
      v62 = v181;
      v63 = Button.init(action:label:)(sub_10004A1E8, v57, sub_10004A248, &v161 - 4, &type metadata for Text, &protocol witness table for Text);
      v64 = v173;
      BorderedProminentButtonStyle.init()(v63);
      v65 = sub_10002FF9C(&qword_100091BA8, &qword_100091B58, (uint64_t)&protocol conformance descriptor for Button<A>);
      v66 = sub_10002C054(&qword_100091BB0, (uint64_t (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle, (uint64_t)&protocol conformance descriptor for BorderedProminentButtonStyle);
      v67 = v183;
      v68 = v175;
      View.buttonStyle<A>(_:)(v64, v183, v175, v65, v66);
      (*(void (**)(char *, uint64_t))(v174 + 8))(v64, v68);
      v69 = (*(uint64_t (**)(char *, uint64_t))(v182 + 8))(v62, v67);
      LOBYTE(v62) = static Edge.Set.bottom.getter(v69);
      v71 = v166;
      v70 = v167;
      (*(void (**)(char *, char *, uint64_t))(v166 + 16))(v26, v23, v167);
      v72 = v180;
      v73 = &v26[*(int *)(v180 + 36)];
      *v73 = (char)v62;
      *(_OWORD *)(v73 + 8) = 0u;
      *(_OWORD *)(v73 + 24) = 0u;
      v73[40] = 1;
      (*(void (**)(char *, uint64_t))(v71 + 8))(v23, v70);
      v74 = (uint64_t)v26;
      v75 = v168;
      sub_10004B2A0(v74, v168, &qword_100091B68);
      sub_100027F28(v75, (uint64_t)v30, &qword_100091B68);
      swift_storeEnumTagMultiPayload(v30, v179, 1);
      v76 = sub_100049EBC();
      v77 = sub_100049F00();
      _ConditionalContent<>.init(storage:)(v32, v30, &type metadata for AuthorizationPasscodeView, v72, v76, v77);
      v78 = v188;
      sub_100027F28((uint64_t)v32, v188, &qword_100091B80);
      swift_storeEnumTagMultiPayload(v78, v186, 0);
      v79 = sub_100049E50();
      v80 = sub_100049FF0();
      _ConditionalContent<>.init(storage:)(v198, v78, v187, v190, v79, v80);
      sub_10002BD8C((uint64_t)v32, &qword_100091B80);
      sub_10002BD8C(v75, &qword_100091B68);
    }
    else
    {
      v81 = v55;
      v82 = sub_10004F244();

      if ((v82 & 1) != 0)
      {
        v83 = v81;
        v84 = sub_10004F244();

        v85 = 1;
        v53 = (uint64_t)v195;
        v52 = (uint64_t)v196;
        v39 = v162;
        if ((v84 & 1) != 0)
        {
          *(_QWORD *)&v201[0] = sub_100024E90();
          *((_QWORD *)&v201[0] + 1) = v86;
          v87 = swift_allocObject(&unk_10007C1C0, 32, 7);
          v88 = v184;
          *(_QWORD *)(v87 + 16) = v185;
          *(_QWORD *)(v87 + 24) = v88;
          v89 = sub_100041220();
          v90 = v83;
          v91 = v181;
          v92 = Button<>.init<A>(_:action:)(v201, sub_10004A168, v87, &type metadata for String, v89);
          LODWORD(v180) = static Edge.Set.all.getter(v92);
          v93 = v182;
          v94 = (uint64_t)v177;
          v95 = v14;
          v96 = v183;
          (*(void (**)(char *, char *, uint64_t))(v182 + 16))(v177, v91, v183);
          v97 = v94 + *(int *)(v178 + 36);
          *(_BYTE *)v97 = v180;
          *(_OWORD *)(v97 + 8) = 0u;
          *(_OWORD *)(v97 + 24) = 0u;
          *(_BYTE *)(v97 + 40) = 1;
          v98 = v96;
          v14 = v95;
          v99 = (*(uint64_t (**)(char *, uint64_t))(v93 + 8))(v91, v98);
          v100 = v173;
          BorderedProminentButtonStyle.init()(v99);
          v101 = sub_100049DCC();
          v102 = sub_10002C054(&qword_100091BB0, (uint64_t (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle, (uint64_t)&protocol conformance descriptor for BorderedProminentButtonStyle);
          v103 = v163;
          v104 = v175;
          View.buttonStyle<A>(_:)(v100, v178, v175, v101, v102);
          (*(void (**)(char *, uint64_t))(v174 + 8))(v100, v104);
          sub_10002BD8C(v94, &qword_100091B40);
          (*(void (**)(char *, char *, uint64_t))(v164 + 32))(v165, v103, v14);
          v85 = 0;
        }
        v105 = (uint64_t)v165;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v164 + 56))(v165, v85, 1, v14);
        v106 = v171;
        sub_100027F28(v105, v171, &qword_100091B50);
        swift_storeEnumTagMultiPayload(v106, v170, 0);
        v107 = sub_100025D1C(&qword_100091B90);
        v108 = sub_100049CFC();
        v109 = sub_10002FF9C(&qword_100091BB8, &qword_100091B90, (uint64_t)&protocol conformance descriptor for VStack<A>);
        v110 = v172;
        _ConditionalContent<>.init(storage:)(v172, v106, v169, v107, v108, v109);
        v111 = v188;
        sub_100027F28((uint64_t)v110, v188, &qword_100091B38);
        swift_storeEnumTagMultiPayload(v111, v186, 1);
        v112 = sub_100049E50();
        v113 = sub_100049FF0();
        _ConditionalContent<>.init(storage:)(v198, v111, v187, v190, v112, v113);
        sub_10002BD8C((uint64_t)v110, &qword_100091B38);
        sub_10002BD8C(v105, &qword_100091B50);
        v54 = v194;
        goto LABEL_12;
      }
      v114 = static HorizontalAlignment.center.getter();
      sub_100047458(v185, (uint64_t)v199);
      *(_OWORD *)((char *)&v201[9] + 7) = v199[9];
      *(_OWORD *)((char *)&v201[10] + 7) = v199[10];
      *(_OWORD *)((char *)&v201[11] + 7) = v200[0];
      v201[12] = *(_OWORD *)((char *)v200 + 9);
      *(_OWORD *)((char *)&v201[5] + 7) = v199[5];
      *(_OWORD *)((char *)&v201[6] + 7) = v199[6];
      *(_OWORD *)((char *)&v201[7] + 7) = v199[7];
      *(_OWORD *)((char *)&v201[8] + 7) = v199[8];
      *(_OWORD *)((char *)&v201[1] + 7) = v199[1];
      *(_OWORD *)((char *)&v201[2] + 7) = v199[2];
      *(_OWORD *)((char *)&v201[3] + 7) = v199[3];
      *(_OWORD *)((char *)&v201[4] + 7) = v199[4];
      *(_OWORD *)((char *)v201 + 7) = v199[0];
      v115 = v201[8];
      v116 = v171;
      *(_OWORD *)(v171 + 161) = v201[9];
      v117 = v201[11];
      *(_OWORD *)(v116 + 177) = v201[10];
      *(_OWORD *)(v116 + 193) = v117;
      *(_OWORD *)(v116 + 209) = v201[12];
      v118 = v201[4];
      *(_OWORD *)(v116 + 97) = v201[5];
      v119 = v201[7];
      *(_OWORD *)(v116 + 113) = v201[6];
      *(_OWORD *)(v116 + 129) = v119;
      *(_OWORD *)(v116 + 145) = v115;
      v120 = v201[0];
      *(_OWORD *)(v116 + 33) = v201[1];
      v121 = v201[3];
      *(_OWORD *)(v116 + 49) = v201[2];
      *(_OWORD *)(v116 + 65) = v121;
      *(_OWORD *)(v116 + 81) = v118;
      v202 = 1;
      *(_QWORD *)v116 = v114;
      *(_QWORD *)(v116 + 8) = 0;
      *(_BYTE *)(v116 + 16) = 1;
      *(_OWORD *)(v116 + 17) = v120;
      swift_storeEnumTagMultiPayload(v116, v170, 1);
      sub_100049C90((uint64_t)v199);
      v122 = sub_100025D1C(&qword_100091B90);
      v123 = sub_100049CFC();
      v124 = sub_10002FF9C(&qword_100091BB8, &qword_100091B90, (uint64_t)&protocol conformance descriptor for VStack<A>);
      v125 = v172;
      _ConditionalContent<>.init(storage:)(v172, v116, v169, v122, v123, v124);
      v126 = v188;
      sub_100027F28((uint64_t)v125, v188, &qword_100091B38);
      swift_storeEnumTagMultiPayload(v126, v186, 1);
      v127 = sub_100049E50();
      v128 = sub_100049FF0();
      _ConditionalContent<>.init(storage:)(v198, v126, v187, v190, v127, v128);
      sub_10002BD8C((uint64_t)v125, &qword_100091B38);
      sub_10004A074((uint64_t)v199);
    }
    v53 = (uint64_t)v195;
    v52 = (uint64_t)v196;
    v54 = v194;
    v39 = v162;
  }
LABEL_12:
  v129 = v39;
  v130 = sub_10004F404();

  v131 = 1;
  if ((v130 & 1) != 0)
  {
    v132 = v129;
    v133 = sub_1000508AC();
    v135 = v134;

    *(_QWORD *)&v201[0] = v133;
    *((_QWORD *)&v201[0] + 1) = v135;
    v136 = swift_allocObject(&unk_10007C198, 32, 7);
    v137 = v184;
    *(_QWORD *)(v136 + 16) = v185;
    *(_QWORD *)(v136 + 24) = v137;
    v138 = sub_100041220();
    v139 = v132;
    v140 = v54;
    v141 = v181;
    v142 = Button<>.init<A>(_:action:)(v201, sub_10004A0E0, v136, &type metadata for String, v138);
    LOBYTE(v132) = static Edge.Set.bottom.getter(v142);
    v144 = v182;
    v143 = v183;
    v145 = (uint64_t)v177;
    (*(void (**)(char *, char *, uint64_t))(v182 + 16))(v177, v141, v183);
    v146 = v145 + *(int *)(v178 + 36);
    *(_BYTE *)v146 = (_BYTE)v132;
    *(_OWORD *)(v146 + 8) = 0u;
    *(_OWORD *)(v146 + 24) = 0u;
    *(_BYTE *)(v146 + 40) = 1;
    v147 = v141;
    v54 = v140;
    v148 = (*(uint64_t (**)(char *, uint64_t))(v144 + 8))(v147, v143);
    v149 = static Font.subheadline.getter(v148);
    KeyPath = swift_getKeyPath(&unk_100061228);
    v151 = (uint64_t)v176;
    sub_100027F28(v145, (uint64_t)v176, &qword_100091B40);
    v152 = (uint64_t *)(v151 + *(int *)(v140 + 36));
    *v152 = KeyPath;
    v152[1] = v149;
    sub_10002BD8C(v145, &qword_100091B40);
    sub_10004B2A0(v151, v53, &qword_100091B20);
    v131 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v193 + 56))(v53, v131, 1, v54);
  v153 = v198;
  v154 = v192;
  sub_100027F28((uint64_t)v198, v192, &qword_100091B88);
  sub_100027F28(v53, v52, &qword_100091B28);
  v155 = v197;
  v156 = v191;
  *v197 = v189;
  v155[1] = v156;
  v157 = sub_100025D1C(&qword_100091BD8);
  sub_100027F28(v154, (uint64_t)v155 + *(int *)(v157 + 48), &qword_100091B88);
  sub_100027F28(v52, (uint64_t)v155 + *(int *)(v157 + 64), &qword_100091B28);
  swift_bridgeObjectRetain(v156);
  sub_10002BD8C(v53, &qword_100091B28);
  sub_10002BD8C((uint64_t)v153, &qword_100091B88);
  sub_10002BD8C(v52, &qword_100091B28);
  sub_10002BD8C(v154, &qword_100091B88);
  return swift_bridgeObjectRelease(v156);
}

id *sub_100047458@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unsigned __int8 v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  id v44;
  double v45;
  char v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v65;
  int v66;
  int v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  char *v78;
  _DWORD v79[2];
  _DWORD v80[2];
  _DWORD v81[2];
  _DWORD v82[2];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  char v91;
  char v92;
  id v93[2];
  char v94;
  _BYTE v95[7];
  uint64_t v96;
  char v97;
  _BYTE v98[7];
  uint64_t v99;
  uint64_t v100;
  char v101;
  _BYTE v102[7];
  double v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  _BYTE v108[7];
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _BYTE v112[7];
  unsigned __int8 v113;
  _BYTE v114[7];
  _BYTE v115[7];
  unsigned __int8 v116;
  _BYTE v117[7];
  unsigned __int8 v118;
  void *v119;
  char v120;
  uint64_t v121;
  unsigned __int8 v122;
  uint64_t v123;
  uint64_t v124;

  v4 = sub_100025D1C(&qword_100091820);
  __chkstk_darwin(v4);
  v6 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = type metadata accessor for Font.TextStyle(0);
  v7 = *(_QWORD *)(v71 - 8);
  __chkstk_darwin(v71);
  v9 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(id *)&a1[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context];
  v11 = a1;
  v78 = sub_10004D730(v10, (uint64_t)a1);
  v12 = static Alignment.center.getter(v78);
  v14 = _FrameLayout.init(width:height:alignment:)(&v119, 0x4049000000000000, 0, 0x4049000000000000, 0, v12, v13);
  LOBYTE(v10) = v120;
  v76 = v119;
  v77 = v121;
  v15 = v122;
  v74 = v124;
  v75 = v123;
  v73 = static Edge.Set.bottom.getter(v14);
  v16 = EdgeInsets.init(_all:)(12.0);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = v11;
  sub_10004EF14();

  sub_10004313C();
  v24 = sub_1000419B0();
  v25 = nullsub_12(v24);
  v27 = v26;
  v72 = v25;
  v29 = v28;
  v118 = v10;
  v116 = v15;
  v113 = 0;
  v30 = v23;
  v31 = sub_10004FED0();
  v33 = v32;

  v34 = v71;
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for Font.TextStyle.subheadline(_:), v71);
  v35 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v6, 1, 1, v35);
  v36 = static Font.system(_:design:weight:)(v9, v6, 0, 1);
  sub_10002BD8C((uint64_t)v6, &qword_100091820);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v34);
  v37 = Text.font(_:)(v36, v31, v33, 0, &_swiftEmptyArrayStorage);
  v69 = v38;
  v70 = v37;
  v40 = v39;
  v71 = v41;
  swift_bridgeObjectRelease(v33);
  v42 = swift_release(v36);
  v68 = static Edge.Set.bottom.getter(v42);
  v43 = v30;
  v44 = sub_10004FE88();

  v45 = 10.0;
  if (v44 != (id)1)
  {
    v45 = 0.0;
    if (v43[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad])
      v45 = 10.0;
  }
  v46 = v40 & 1;
  v47 = EdgeInsets.init(_all:)(v45);
  v82[0] = *(_DWORD *)v117;
  *(_DWORD *)((char *)v82 + 3) = *(_DWORD *)&v117[3];
  v65 = v118;
  v66 = v116;
  v81[0] = *(_DWORD *)v115;
  *(_DWORD *)((char *)v81 + 3) = *(_DWORD *)&v115[3];
  v80[0] = *(_DWORD *)v114;
  *(_DWORD *)((char *)v80 + 3) = *(_DWORD *)&v114[3];
  v67 = v113;
  *(_DWORD *)((char *)v79 + 3) = *(_DWORD *)&v112[3];
  v79[0] = *(_DWORD *)v112;
  v48 = v75;
  *(_QWORD *)&v83 = v78;
  *((_QWORD *)&v83 + 1) = v76;
  LOBYTE(v84) = v118;
  DWORD1(v84) = *(_DWORD *)&v117[3];
  *(_DWORD *)((char *)&v84 + 1) = *(_DWORD *)v117;
  *((_QWORD *)&v84 + 1) = v77;
  LOBYTE(v85) = v116;
  DWORD1(v85) = *(_DWORD *)&v115[3];
  *(_DWORD *)((char *)&v85 + 1) = *(_DWORD *)v115;
  v49 = v74;
  *((_QWORD *)&v85 + 1) = v75;
  *(_QWORD *)&v86 = v74;
  v50 = v73;
  BYTE8(v86) = v73;
  HIDWORD(v86) = *(_DWORD *)&v114[3];
  *(_DWORD *)((char *)&v86 + 9) = *(_DWORD *)v114;
  *(double *)&v87 = v16;
  *((_QWORD *)&v87 + 1) = v18;
  *(_QWORD *)&v88 = v20;
  *((_QWORD *)&v88 + 1) = v22;
  LOBYTE(v89) = v113;
  DWORD1(v89) = *(_DWORD *)&v112[3];
  *(_DWORD *)((char *)&v89 + 1) = *(_DWORD *)v112;
  *((_QWORD *)&v89 + 1) = v27;
  v51 = v72;
  *(_QWORD *)&v90 = v72;
  *((_QWORD *)&v90 + 1) = v29;
  v52 = v83;
  v53 = v84;
  v54 = v86;
  *(_OWORD *)(a2 + 32) = v85;
  *(_OWORD *)(a2 + 48) = v54;
  *(_OWORD *)a2 = v52;
  *(_OWORD *)(a2 + 16) = v53;
  v55 = v87;
  v56 = v88;
  v57 = v90;
  *(_OWORD *)(a2 + 96) = v89;
  *(_OWORD *)(a2 + 112) = v57;
  *(_OWORD *)(a2 + 64) = v55;
  *(_OWORD *)(a2 + 80) = v56;
  v92 = v40 & 1;
  v91 = 0;
  v59 = v69;
  v58 = v70;
  *(_QWORD *)(a2 + 128) = v70;
  *(_QWORD *)(a2 + 136) = v59;
  *(_BYTE *)(a2 + 144) = v46;
  v60 = v71;
  *(_QWORD *)(a2 + 152) = v71;
  *(_BYTE *)(a2 + 160) = v68;
  *(double *)(a2 + 168) = v47;
  *(_QWORD *)(a2 + 176) = v61;
  *(_QWORD *)(a2 + 184) = v62;
  *(_QWORD *)(a2 + 192) = v63;
  *(_BYTE *)(a2 + 200) = 0;
  sub_10004A3A8((id *)&v83);
  sub_100049CEC(v58, v59, v46);
  swift_bridgeObjectRetain(v60);
  sub_10004A0D0(v58, v59, v46);
  swift_bridgeObjectRelease(v60);
  v93[0] = v78;
  v93[1] = v76;
  v94 = v65;
  *(_DWORD *)v95 = v82[0];
  *(_DWORD *)&v95[3] = *(_DWORD *)((char *)v82 + 3);
  v96 = v77;
  v97 = v66;
  *(_DWORD *)v98 = v81[0];
  *(_DWORD *)&v98[3] = *(_DWORD *)((char *)v81 + 3);
  v99 = v48;
  v100 = v49;
  v101 = v50;
  *(_DWORD *)v102 = v80[0];
  *(_DWORD *)&v102[3] = *(_DWORD *)((char *)v80 + 3);
  v103 = v16;
  v104 = v18;
  v105 = v20;
  v106 = v22;
  v107 = v67;
  *(_DWORD *)&v108[3] = *(_DWORD *)((char *)v79 + 3);
  *(_DWORD *)v108 = v79[0];
  v109 = v27;
  v110 = v51;
  v111 = v29;
  return sub_10004A3D0(v93);
}

uint64_t sub_100047928@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v4 = *(char **)v1;
  v3 = *(_QWORD *)(v1 + 8);
  *(_QWORD *)a1 = static HorizontalAlignment.center.getter();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v5 = sub_100025D1C(&qword_100091B18);
  return sub_100046560(v4, v3, (uint64_t *)(a1 + *(int *)(v5 + 44)));
}

uint64_t sub_100047980(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1[1];
  v4 = a2[1];
  if (!v3)
    return v4 == 0;
  if (!v4)
    return 0;
  if (*a1 == *a2 && v3 == v4)
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)();
}

void sub_1000479CC(char **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  char v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  char v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  char v53;
  __int128 v54;
  char *v55;
  uint64_t v56;
  __int128 v57;

  v54 = *((_OWORD *)a1 + 1);
  v55 = a1[4];
  sub_10004A3F8(&v54, &v57);
  sub_10004B2A0((uint64_t)&v55, (uint64_t)&v56, &qword_100091BE0);
  v50 = v54;
  *(_QWORD *)&v51 = v55;
  v4 = sub_100025D1C(&qword_100091BE8);
  State.wrappedValue.getter(&v43, v4);
  v5 = v44;
  if (v44)
  {
    v6 = *a1;
    if (*a1)
    {
      v7 = v43;
      v8 = objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration], "verifyPrompt");
      if (v8)
      {
        v9 = v8;
        v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
        v12 = v11;

      }
      else
      {
        v10 = 0;
        v12 = 0;
      }
      v19 = swift_allocObject(&unk_10007C238, 72, 7);
      *(_QWORD *)(v19 + 16) = v7;
      *(_QWORD *)(v19 + 24) = v5;
      v20 = *((_OWORD *)a1 + 1);
      *(_OWORD *)(v19 + 32) = *(_OWORD *)a1;
      *(_OWORD *)(v19 + 48) = v20;
      *(_QWORD *)(v19 + 64) = a1[4];
      sub_10004A5EC((uint64_t)&v57);
      sub_10004A614(&v56);
      v21 = type metadata accessor for AuthorizationViewModel(0);
      v22 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
      v23 = v6;
      v24 = (void *)EnvironmentObject.init()(v21, v22);
      v26 = v25;
      v27 = v24;
      swift_retain(v19);
      v43 = v10;
      v44 = v12;
      v45 = v24;
      v46 = v26;
      v47 = sub_10004A444;
      v48 = v19;
      v49 = 1;
LABEL_12:
      v35 = sub_100025D1C(&qword_100091BF0);
      v36 = sub_10002FF9C(&qword_100091BF8, &qword_100091BF0, (uint64_t)&protocol conformance descriptor for TupleView<A>);
      _ConditionalContent<>.init(storage:)(&v50, &v43, v35, v35, v36, v36);
      swift_release(v19);

      v37 = v51;
      v38 = v52;
      v39 = v53;
      *(_OWORD *)a2 = v50;
      *(_OWORD *)(a2 + 16) = v37;
      *(_OWORD *)(a2 + 32) = v38;
      *(_BYTE *)(a2 + 48) = v39;
      return;
    }
  }
  else
  {
    v13 = *a1;
    if (*a1)
    {
      v14 = objc_msgSend(*(id *)&v13[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration], "prompt");
      if (v14)
      {
        v15 = v14;
        v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
        v18 = v17;

      }
      else
      {
        v16 = 0;
        v18 = 0;
      }
      v19 = swift_allocObject(&unk_10007C260, 56, 7);
      v28 = *((_OWORD *)a1 + 1);
      *(_OWORD *)(v19 + 16) = *(_OWORD *)a1;
      *(_OWORD *)(v19 + 32) = v28;
      *(_QWORD *)(v19 + 48) = a1[4];
      v29 = v13;
      sub_10004A5EC((uint64_t)&v57);
      sub_10004A614(&v56);
      v30 = type metadata accessor for AuthorizationViewModel(0);
      v31 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
      v32 = (void *)EnvironmentObject.init()(v30, v31);
      v34 = v33;
      v27 = v32;
      swift_retain(v19);
      v43 = v16;
      v44 = v18;
      v45 = v32;
      v46 = v34;
      v47 = sub_10004A670;
      v48 = v19;
      v49 = 0;
      goto LABEL_12;
    }
  }
  v40 = a1[1];
  v41 = type metadata accessor for AuthorizationViewModel(0);
  v42 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
  EnvironmentObject.error()(0, v40, v41, v42);
  __break(1u);
}

__n128 sub_100047D20@<Q0>(uint64_t a1@<X8>)
{
  char **v1;
  uint64_t v3;
  char v4;
  __n128 result;
  __int128 v6;
  __int128 v7;
  _OWORD v8[3];
  char v9;

  v3 = static HorizontalAlignment.center.getter();
  sub_1000479CC(v1, (uint64_t)v8);
  v4 = v9;
  result = (__n128)v8[0];
  v6 = v8[1];
  v7 = v8[2];
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(_OWORD *)(a1 + 40) = v6;
  *(_OWORD *)(a1 + 56) = v7;
  *(_BYTE *)(a1 + 72) = v4;
  return result;
}

uint64_t sub_100047D88@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;

  v35 = a2;
  v36 = a3;
  v4 = type metadata accessor for OpacityTransition(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v33 - v9;
  v11 = sub_100025D1C(&qword_100091C00);
  v33 = *(_QWORD *)(v11 - 8);
  v34 = v11;
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = static Color.black.getter(v12);
  if (a1)
  {
    v16 = v15;
    v17 = a1;
    v18 = sub_10004FDD4();

    v19 = Color.opacity(_:)(v18);
    v20 = swift_release(v16);
    v21 = static SafeAreaRegions.all.getter(v20);
    v22 = static Edge.Set.all.getter(v21);
    OpacityTransition.init()();
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
    v23 = sub_10002C054(&qword_100091C08, (uint64_t (*)(uint64_t))&type metadata accessor for OpacityTransition, (uint64_t)&protocol conformance descriptor for OpacityTransition);
    v24 = AnyTransition.init<A>(_:)(v8, v4, v23);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    v37 = v19;
    v38 = v21;
    v39 = v22;
    v40 = v24;
    v25 = swift_allocObject(&unk_10007C2B0, 32, 7);
    v26 = v35;
    *(_QWORD *)(v25 + 16) = a1;
    *(_QWORD *)(v25 + 24) = v26;
    v27 = v17;
    v28 = sub_100025D1C(&qword_100091C10);
    v29 = sub_10004A9A4();
    View.onTapGesture(count:perform:)(1, sub_1000457CC, v25, v28, v29);
    swift_release(v25);
    swift_release(v37);
    swift_release(v40);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v33 + 32))(v36, v14, v34);
  }
  else
  {
    v31 = type metadata accessor for AuthorizationViewModel(0);
    v32 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
    result = EnvironmentObject.error()(0, v35, v31, v32);
    __break(1u);
  }
  return result;
}

uint64_t sub_100047FE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100047D88(*(void **)v1, *(_QWORD *)(v1 + 8), a1);
}

uint64_t sub_100047FE8@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  unsigned __int8 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;
  _OWORD *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t KeyPath;
  double v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  char v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t result;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  char *v111;
  char *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  id *v127;
  uint64_t *v128;
  char v129;
  _BYTE v130[7];
  _BYTE v131[7];
  char v132;
  _BYTE v133[7];
  _BYTE v134[7];
  char v135;
  char v136;
  _BYTE v137[168];
  _BYTE v138[168];
  _QWORD v139[2];
  char v140;
  _BYTE v141[7];
  uint64_t v142;
  uint64_t v143;
  char v144;
  _BYTE v145[7];
  char v146;
  _BYTE v147[7];
  double v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  char v152;
  _BYTE v153[7];
  char v154;
  _BYTE v155[7];
  __int128 v156;
  __int128 v157;
  char v158;
  _BYTE v159[7];
  uint64_t v160;
  uint64_t v161;
  char v162;
  _BYTE v163[168];
  uint64_t v164;
  char v165;
  uint64_t v166;
  char v167;
  uint64_t v168;
  uint64_t v169;

  v4 = sub_100025D1C(&qword_100091820);
  __chkstk_darwin(v4);
  v6 = (char *)&v107 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Font.TextStyle(0);
  v114 = *(_QWORD *)(v7 - 8);
  v115 = v7;
  __chkstk_darwin(v7);
  v113 = (char *)&v107 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = sub_100025D1C(&qword_100091960);
  __chkstk_darwin(v118);
  v121 = (uint64_t)&v107 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v117);
  v120 = (char *)&v107 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Image.ResizingMode(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v107 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v116 = sub_100025D1C(&qword_100091C48);
  __chkstk_darwin(v116);
  v16 = (char *)&v107 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100025D1C(&qword_100091C50);
  v122 = *(_QWORD *)(v17 - 8);
  v123 = v17;
  __chkstk_darwin(v17);
  v119 = (uint64_t)&v107 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_100025D1C(&qword_100091C58);
  v20 = __chkstk_darwin(v19);
  v125 = (uint64_t)&v107 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v23 = (char *)&v107 - v22;
  v24 = sub_100025D1C(&qword_100091C60);
  v25 = __chkstk_darwin(v24);
  v124 = (uint64_t)&v107 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  v127 = a1;
  v128 = (uint64_t *)((char *)&v107 - v27);
  if (*a1)
  {
    v28 = *a1;
    v29 = sub_1000501E8();

    if ((v29 & 1) != 0)
    {
      v30 = sub_100025D1C(&qword_100091C70);
      (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v128, 1, 1, v30);
    }
    else
    {
      v31 = static HorizontalAlignment.center.getter();
      v32 = v128;
      *v128 = v31;
      v32[1] = 0;
      *((_BYTE *)v32 + 16) = 0;
      v33 = sub_100025D1C(&qword_100091C68);
      sub_100048940((uint64_t)v127, (uint64_t)v32 + *(int *)(v33 + 44));
      v34 = sub_100025D1C(&qword_100091C70);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v32, 0, 1, v34);
    }
    v126 = a2;
    v35 = v28;
    v36 = sub_10005030C();

    if (v36)
    {
      v110 = v36;
      v37 = Image.init(uiImage:)();
      (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, enum case for Image.ResizingMode.stretch(_:), v11);
      v38 = Image.resizable(capInsets:resizingMode:)(v14, v37, 0.0, 0.0, 0.0, 0.0);
      swift_release(v37);
      v39 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      v40 = static Alignment.center.getter(v39);
      _FrameLayout.init(width:height:alignment:)(&v164, 0x4049000000000000, 0, 0x4049000000000000, 0, v40, v41);
      v42 = v164;
      v43 = v165;
      v111 = v6;
      v112 = v23;
      v44 = v167;
      v45 = v168;
      v108 = v169;
      v109 = v166;
      v46 = v120;
      v47 = &v120[*(int *)(v117 + 20)];
      v48 = enum case for RoundedCornerStyle.continuous(_:);
      v49 = type metadata accessor for RoundedCornerStyle(0);
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 104))(v47, v48, v49);
      __asm { FMOV            V0.2D, #10.0 }
      *v46 = _Q0;
      v55 = v121;
      sub_10004B214((uint64_t)v46, v121, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
      *(_WORD *)(v55 + *(int *)(v118 + 36)) = 256;
      sub_100027F28(v55, (uint64_t)&v16[*(int *)(v116 + 36)], &qword_100091960);
      *(_QWORD *)v16 = v38;
      *((_QWORD *)v16 + 1) = v42;
      v16[16] = v43;
      *((_QWORD *)v16 + 3) = v109;
      v16[32] = v44;
      *((_QWORD *)v16 + 5) = v45;
      v6 = v111;
      v23 = v112;
      *((_QWORD *)v16 + 6) = v108;
      swift_retain(v38);
      sub_10002BD8C(v55, &qword_100091960);
      sub_10004B258((uint64_t)v46, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
      v56 = swift_release(v38);
      LOBYTE(v38) = static Edge.Set.top.getter(v56);
      v57 = EdgeInsets.init(_all:)(10.0);
      v59 = v58;
      v61 = v60;
      v63 = v62;
      v64 = v119;
      sub_100027F28((uint64_t)v16, v119, &qword_100091C48);

      v65 = v123;
      v66 = v64 + *(int *)(v123 + 36);
      *(_BYTE *)v66 = v38;
      *(double *)(v66 + 8) = v57;
      *(_QWORD *)(v66 + 16) = v59;
      *(_QWORD *)(v66 + 24) = v61;
      *(_QWORD *)(v66 + 32) = v63;
      *(_BYTE *)(v66 + 40) = 0;
      sub_10002BD8C((uint64_t)v16, &qword_100091C48);
      sub_10004B2A0(v64, (uint64_t)v23, &qword_100091C50);
      v67 = 0;
    }
    else
    {
      v67 = 1;
      v65 = v123;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v122 + 56))(v23, v67, 1, v65);
    if (*v127)
    {
      v68 = *v127;
      v69 = sub_10005027C();
      v71 = v70;

      if (v71)
      {
        v72 = HIBYTE(v71) & 0xF;
        if ((v71 & 0x2000000000000000) == 0)
          v72 = v69 & 0xFFFFFFFFFFFFLL;
        if (v72)
        {
          v74 = v113;
          v73 = v114;
          v75 = v115;
          (*(void (**)(char *, _QWORD, uint64_t))(v114 + 104))(v113, enum case for Font.TextStyle.body(_:), v115);
          v76 = type metadata accessor for Font.Design(0);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v76 - 8) + 56))(v6, 1, 1, v76);
          v77 = static Font.system(_:design:weight:)(v74, v6, 0, 1);
          sub_10002BD8C((uint64_t)v6, &qword_100091820);
          (*(void (**)(char *, uint64_t))(v73 + 8))(v74, v75);
          v78 = Text.font(_:)(v77, v69, v71, 0, &_swiftEmptyArrayStorage);
          v80 = v79;
          v82 = v81;
          v84 = v83;
          swift_bridgeObjectRelease(v71);
          swift_release(v77);
          KeyPath = swift_getKeyPath(&unk_100061258);
          LOBYTE(v77) = static Edge.Set.vertical.getter(KeyPath);
          v86 = EdgeInsets.init(_all:)(10.0);
          v88 = v87;
          v90 = v89;
          v92 = v91;
          v94 = v23;
          v95 = static Edge.Set.horizontal.getter(v93);
          v135 = v82 & 1;
          v132 = 0;
          v129 = 1;
          v96 = swift_getKeyPath(&unk_100061288);
          *(_DWORD *)v141 = *(_DWORD *)v137;
          *(_DWORD *)&v141[3] = *(_DWORD *)&v137[3];
          *(_DWORD *)v145 = *(_DWORD *)v134;
          *(_DWORD *)&v145[3] = *(_DWORD *)&v134[3];
          *(_DWORD *)v147 = *(_DWORD *)v133;
          *(_DWORD *)&v147[3] = *(_DWORD *)&v133[3];
          *(_DWORD *)&v153[3] = *(_DWORD *)&v131[3];
          *(_DWORD *)v153 = *(_DWORD *)v131;
          *(_DWORD *)&v155[3] = *(_DWORD *)&v130[3];
          *(_DWORD *)v155 = *(_DWORD *)v130;
          v136 = 0;
          v139[0] = v78;
          v139[1] = v80;
          v140 = v135;
          v142 = v84;
          v143 = KeyPath;
          v144 = 1;
          v146 = v77;
          v148 = v86;
          v149 = v88;
          v150 = v90;
          v151 = v92;
          v152 = v132;
          v154 = v95;
          v23 = v94;
          v157 = 0u;
          v156 = 0u;
          v158 = v129;
          *(_DWORD *)v159 = *(_DWORD *)v138;
          *(_DWORD *)&v159[3] = *(_DWORD *)&v138[3];
          v160 = v96;
          v161 = 5;
          v162 = 0;
          nullsub_12(v139);
LABEL_16:
          sub_10004B2A0((uint64_t)v139, (uint64_t)v163, &qword_100091C78);
          v97 = v128;
          v98 = v124;
          sub_100027F28((uint64_t)v128, v124, &qword_100091C60);
          v99 = v125;
          sub_100027F28((uint64_t)v23, v125, &qword_100091C58);
          sub_10004B2A0((uint64_t)v163, (uint64_t)v137, &qword_100091C78);
          v100 = v126;
          sub_100027F28(v98, v126, &qword_100091C60);
          v101 = sub_100025D1C(&qword_100091C80);
          sub_100027F28(v99, v100 + *(int *)(v101 + 48), &qword_100091C58);
          v102 = v100 + *(int *)(v101 + 64);
          sub_10004B2A0((uint64_t)v137, (uint64_t)v138, &qword_100091C78);
          sub_10004B2A0((uint64_t)v138, v102, &qword_100091C78);
          sub_10004AAFC((uint64_t)v138, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_10004AAAC);
          sub_10002BD8C((uint64_t)v23, &qword_100091C58);
          sub_10002BD8C((uint64_t)v97, &qword_100091C60);
          sub_10004B2A0((uint64_t)v137, (uint64_t)v139, &qword_100091C78);
          sub_10004AAFC((uint64_t)v139, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_10004AB68);
          sub_10002BD8C(v99, &qword_100091C58);
          return sub_10002BD8C(v98, &qword_100091C60);
        }
        swift_bridgeObjectRelease(v71);
      }
      sub_10004AA8C((uint64_t)v139);
      goto LABEL_16;
    }
    v104 = v127[1];
  }
  else
  {
    v104 = v127[1];
  }
  v105 = type metadata accessor for AuthorizationViewModel(0);
  v106 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
  result = EnvironmentObject.error()(0, v104, v105, v106);
  __break(1u);
  return result;
}

uint64_t sub_100048940@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;

  v44 = a2;
  v3 = type metadata accessor for Divider(0);
  v43 = *(_QWORD *)(v3 - 8);
  v4 = __chkstk_darwin(v3);
  v42 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v41 = (char *)&v41 - v6;
  v7 = sub_100025D1C(&qword_100091C88);
  __chkstk_darwin(v7);
  v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100025D1C(&qword_100091C90);
  __chkstk_darwin(v10);
  v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100025D1C(&qword_100091C98);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v14);
  v19 = (char *)&v41 - v18;
  *(_QWORD *)v9 = static VerticalAlignment.center.getter(v17);
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v20 = sub_100025D1C(&qword_100091CA0);
  v21 = sub_100048C44(a1, (uint64_t)&v9[*(int *)(v20 + 44)]);
  LOBYTE(a1) = static Edge.Set.horizontal.getter(v21);
  sub_100027F28((uint64_t)v9, (uint64_t)v12, &qword_100091C88);
  v22 = &v12[*(int *)(v10 + 36)];
  *v22 = a1;
  *(_OWORD *)(v22 + 8) = 0u;
  *(_OWORD *)(v22 + 24) = 0u;
  v22[40] = 1;
  v23 = sub_10002BD8C((uint64_t)v9, &qword_100091C88);
  LOBYTE(v10) = static Edge.Set.vertical.getter(v23);
  v24 = EdgeInsets.init(_all:)(8.0);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  sub_100027F28((uint64_t)v12, (uint64_t)v16, &qword_100091C90);
  v31 = &v16[*(int *)(v13 + 36)];
  *v31 = v10;
  *((double *)v31 + 1) = v24;
  *((_QWORD *)v31 + 2) = v26;
  *((_QWORD *)v31 + 3) = v28;
  *((_QWORD *)v31 + 4) = v30;
  v31[40] = 0;
  sub_10002BD8C((uint64_t)v12, &qword_100091C90);
  v32 = sub_10004B2A0((uint64_t)v16, (uint64_t)v19, &qword_100091C98);
  v33 = v41;
  Divider.init()(v32);
  sub_100027F28((uint64_t)v19, (uint64_t)v16, &qword_100091C98);
  v34 = v42;
  v35 = v43;
  v36 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
  v36(v42, v33, v3);
  v37 = v44;
  sub_100027F28((uint64_t)v16, v44, &qword_100091C98);
  v38 = sub_100025D1C(&qword_100091CA8);
  v36((char *)(v37 + *(int *)(v38 + 48)), v34, v3);
  v39 = *(void (**)(char *, uint64_t))(v35 + 8);
  v39(v33, v3);
  sub_10002BD8C((uint64_t)v19, &qword_100091C98);
  v39(v34, v3);
  return sub_10002BD8C((uint64_t)v16, &qword_100091C98);
}

uint64_t sub_100048C44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t KeyPath;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t result;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD v84[4];

  v4 = type metadata accessor for Font.TextStyle(0);
  v77 = *(_QWORD *)(v4 - 8);
  v78 = v4;
  __chkstk_darwin(v4);
  v76 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AuthorizationHeaderView(0);
  v69 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v70 = v7;
  v71 = (uint64_t)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100025D1C(&qword_100091B58);
  v74 = *(_QWORD *)(v8 - 8);
  v75 = v8;
  __chkstk_darwin(v8);
  v73 = (char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100025D1C(&qword_100091CB0);
  v80 = *(_QWORD *)(v10 - 8);
  v81 = v10;
  __chkstk_darwin(v10);
  v72 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100025D1C(&qword_100091CB8);
  v13 = __chkstk_darwin(v12);
  v83 = (uint64_t)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v82 = (uint64_t)&v68 - v15;
  v16 = sub_100025D1C(&qword_100091820);
  __chkstk_darwin(v16);
  v18 = (char *)&v68 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)a1)
  {
    v19 = *(id *)a1;
    v20 = sub_100050210();
    v22 = v21;

    v23 = sub_100025D1C(&qword_100091A30);
    v24 = ScaledMetric.wrappedValue.getter(v84, v23);
    v25 = *(double *)v84;
    v26 = static Font.Weight.semibold.getter(v24);
    v27 = enum case for Font.Design.default(_:);
    v28 = type metadata accessor for Font.Design(0);
    v29 = *(_QWORD *)(v28 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 104))(v18, v27, v28);
    v68 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56);
    v68(v18, 0, 1, v28);
    v30 = static Font.system(size:weight:design:)(*(_QWORD *)&v26, 0, v18, v25);
    sub_10002BD8C((uint64_t)v18, &qword_100091820);
    v31 = Text.font(_:)(v30, v20, v22, 0, &_swiftEmptyArrayStorage);
    v33 = v32;
    v79 = v34;
    v36 = v35;
    swift_bridgeObjectRelease(v22);
    swift_release(v30);
    if (*(_QWORD *)a1)
    {
      v37 = *(id *)a1;
      v38 = sub_10005026C();
      v40 = v39;

      if (v40)
      {
        v41 = HIBYTE(v40) & 0xF;
        if ((v40 & 0x2000000000000000) == 0)
          v41 = v38 & 0xFFFFFFFFFFFFLL;
        if (v41)
        {
          v84[0] = v38;
          v84[1] = v40;
          v42 = v71;
          sub_10004B214(a1, v71, type metadata accessor for AuthorizationHeaderView);
          v43 = *(unsigned __int8 *)(v69 + 80);
          v44 = (v43 + 16) & ~v43;
          v45 = swift_allocObject(&unk_10007C2D8, v44 + v70, v43 | 7);
          sub_10004AD00(v42, v45 + v44);
          v46 = sub_100041220();
          v71 = v36;
          v47 = v73;
          Button<>.init<A>(_:action:)(v84, sub_10004AD44, v45, &type metadata for String, v46);
          v49 = v76;
          v48 = v77;
          v50 = v78;
          (*(void (**)(char *, _QWORD, uint64_t))(v77 + 104))(v76, enum case for Font.TextStyle.body(_:), v78);
          v68(v18, 1, 1, v28);
          v51 = static Font.system(_:design:weight:)(v49, v18, 0, 1);
          sub_10002BD8C((uint64_t)v18, &qword_100091820);
          (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v50);
          KeyPath = swift_getKeyPath(&unk_100061228);
          v54 = v74;
          v53 = v75;
          v55 = (uint64_t)v72;
          (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v72, v47, v75);
          v56 = v81;
          v57 = (uint64_t *)(v55 + *(int *)(v81 + 36));
          *v57 = KeyPath;
          v57[1] = v51;
          v58 = v47;
          v36 = v71;
          (*(void (**)(char *, uint64_t))(v54 + 8))(v58, v53);
          v59 = v82;
          sub_10004B2A0(v55, v82, &qword_100091CB0);
          v60 = 0;
LABEL_10:
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v80 + 56))(v59, v60, 1, v56);
          v61 = v79 & 1;
          v62 = v83;
          sub_100027F28(v59, v83, &qword_100091CB8);
          *(_QWORD *)a2 = v31;
          *(_QWORD *)(a2 + 8) = v33;
          *(_BYTE *)(a2 + 16) = v61;
          *(_QWORD *)(a2 + 24) = v36;
          *(_QWORD *)(a2 + 32) = 0;
          *(_BYTE *)(a2 + 40) = 1;
          v63 = sub_100025D1C(&qword_100091CC0);
          sub_100027F28(v62, a2 + *(int *)(v63 + 64), &qword_100091CB8);
          sub_100049CEC(v31, v33, v61);
          swift_bridgeObjectRetain(v36);
          sub_10002BD8C(v59, &qword_100091CB8);
          sub_10002BD8C(v62, &qword_100091CB8);
          sub_10004A0D0(v31, v33, v61);
          return swift_bridgeObjectRelease(v36);
        }
        swift_bridgeObjectRelease(v40);
      }
      v60 = 1;
      v56 = v81;
      v59 = v82;
      goto LABEL_10;
    }
  }
  v65 = *(_QWORD *)(a1 + 8);
  v66 = type metadata accessor for AuthorizationViewModel(0);
  v67 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
  result = EnvironmentObject.error()(0, v65, v66, v67);
  __break(1u);
  return result;
}

uint64_t sub_1000491C8@<X0>(uint64_t a1@<X8>)
{
  id *v1;
  uint64_t v3;

  *(_QWORD *)a1 = static HorizontalAlignment.center.getter();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v3 = sub_100025D1C(&qword_100091C40);
  return sub_100047FE8(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_100049210(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100074128, 1);
}

uint64_t sub_100049220(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100074100, 1);
}

uint64_t sub_100049230(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000740D8, 1);
}

uint64_t sub_100049240(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000740B0, 1);
}

uint64_t sub_100049250@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t KeyPath;
  __int128 v26;
  int v27;
  void *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _BYTE *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _OWORD *v40;
  __int128 v41;
  uint64_t v42;
  char v43;
  _BYTE *v44;
  uint64_t result;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[4];
  _BOOL4 v50;
  uint64_t v51;
  uint64_t v52;
  _BOOL4 v53;
  id v54;
  uint64_t v55;
  _QWORD *v56;
  _BYTE *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;

  v58 = a4;
  v59 = a3;
  v62 = a5;
  v7 = sub_100025D1C(&qword_100091600);
  __chkstk_darwin(v7);
  v56 = &v49[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = type metadata accessor for PasscodeEmbeddedView(0);
  __chkstk_darwin(v9);
  v57 = &v49[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v60 = sub_100025D1C(&qword_100091D18);
  __chkstk_darwin(v60);
  v12 = &v49[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v61 = sub_100025D1C(&qword_100091D20);
  __chkstk_darwin(v61);
  v14 = &v49[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1)
  {
    v15 = a1;
    v54 = sub_1000502F4();

    v16 = v15;
    v17 = sub_1000500D0();

    v55 = LACustomPasswordTypeAlphanumeric;
    v53 = v17 == LACustomPasswordTypeAlphanumeric;
    v18 = v16;
    v19 = sub_10004EB9C();
    v51 = v20;
    v52 = v19;

    v21 = v18;
    v50 = sub_100050558();

    v22 = type metadata accessor for AuthorizationViewModel(0);
    v23 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
    v24 = (void *)EnvironmentObject.projectedValue.getter(a1, a2, v22, v23);
    KeyPath = swift_getKeyPath(&unk_100061398);
    EnvironmentObject.Wrapper.subscript.getter(&v63, KeyPath, v24, v23);
    swift_release(KeyPath);

    v26 = v63;
    v27 = v64;
    v28 = (void *)EnvironmentObject.projectedValue.getter(a1, a2, v22, v23);
    v29 = swift_getKeyPath(&unk_1000613C0);
    v30 = v56;
    EnvironmentObject.Wrapper.subscript.getter(v56, v29, v28, v23);

    swift_release(v29);
    v31 = swift_retain(v58);
    v48 = (uint64_t)v30;
    v32 = v57;
    sub_10003A2AC((uint64_t)v54, v53, v52, v51, v50, v26, *((uint64_t *)&v26 + 1), v27, (uint64_t)v57, v48, v59, v31);
    v33 = v21;
    v34 = sub_1000500D0();

    if (LACustomPasswordTypeCustomDigits == v34 || v55 == v34)
      v37 = 0x4050400000000000;
    else
      v37 = 0x4039000000000000;
    v38 = static Alignment.center.getter(v35);
    _FrameLayout.init(width:height:alignment:)(&v63, 0, 1, v37, 0, v38, v39);
    sub_10004B214((uint64_t)v32, (uint64_t)v12, type metadata accessor for PasscodeEmbeddedView);
    v40 = &v12[*(int *)(v60 + 36)];
    v41 = v64;
    *v40 = v63;
    v40[1] = v41;
    v40[2] = v65;
    v42 = sub_10004B258((uint64_t)v32, type metadata accessor for PasscodeEmbeddedView);
    v43 = static Edge.Set.horizontal.getter(v42);
    sub_100027F28((uint64_t)v12, (uint64_t)v14, &qword_100091D18);
    v44 = &v14[*(int *)(v61 + 36)];
    *v44 = v43;
    *(_OWORD *)(v44 + 8) = 0u;
    *(_OWORD *)(v44 + 24) = 0u;
    v44[40] = 1;
    sub_10002BD8C((uint64_t)v12, &qword_100091D18);
    return sub_10004B2A0((uint64_t)v14, v62, &qword_100091D20);
  }
  else
  {
    v46 = type metadata accessor for AuthorizationViewModel(0);
    v47 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
    result = EnvironmentObject.error()(0, a2, v46, v47);
    __break(1u);
  }
  return result;
}

uint64_t sub_10004964C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_10004E314();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100049678(char *a1)
{
  return sub_10004E328(*a1);
}

uint64_t sub_10004969C@<X0>(_QWORD *a1@<X8>)
{
  return sub_10004E54C(a1);
}

uint64_t sub_1000496BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = sub_100025D1C(&qword_100091F40);
  __chkstk_darwin(v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100027F28(a1, (uint64_t)v4, &qword_100091F40);
  return sub_10004E5B0((uint64_t)v4);
}

uint64_t sub_100049740@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v3 = sub_100025D1C(&qword_100091D08);
  __chkstk_darwin(v3);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100049250(*(void **)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t)v5);
  v7 = static Edge.Set.bottom.getter(v6);
  v8 = EdgeInsets.init(_all:)(21.0);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  sub_100027F28((uint64_t)v5, a1, &qword_100091D08);
  v15 = a1 + *(int *)(sub_100025D1C(&qword_100091D10) + 36);
  *(_BYTE *)v15 = v7;
  *(double *)(v15 + 8) = v8;
  *(_QWORD *)(v15 + 16) = v10;
  *(_QWORD *)(v15 + 24) = v12;
  *(_QWORD *)(v15 + 32) = v14;
  *(_BYTE *)(v15 + 40) = 0;
  return sub_10002BD8C((uint64_t)v5, &qword_100091D08);
}

double sub_100049824@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t KeyPath;
  char v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  double result;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  _BYTE v50[7];
  _BYTE v51[7];
  char v52;
  _BYTE v53[7];
  _BYTE v54[7];
  _BYTE v55[7];
  char v56;
  char v57;
  _BYTE v58[7];
  _BYTE v59[7];
  _BYTE v60[192];
  _QWORD v61[2];
  char v62;
  _BYTE v63[7];
  uint64_t v64;
  uint64_t v65;
  char v66;
  _BYTE v67[7];
  char v68;
  _BYTE v69[7];
  double v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  _BYTE v75[7];
  char v76;
  _BYTE v77[7];
  __int128 v78;
  __int128 v79;
  char v80;
  _BYTE v81[7];
  uint64_t v82;
  uint64_t v83;
  char v84;
  _BYTE v85[7];
  uint64_t v86;
  uint64_t v87;
  _OWORD v88[2];
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _OWORD v97[2];

  v6 = sub_100025D1C(&qword_100091820);
  __chkstk_darwin(v6);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Font.TextStyle(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
    goto LABEL_6;
  v13 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v13 = a1 & 0xFFFFFFFFFFFFLL;
  if (v13)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for Font.TextStyle.body(_:), v9);
    v14 = type metadata accessor for Font.Design(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v8, 1, 1, v14);
    swift_bridgeObjectRetain(a2);
    v15 = static Font.system(_:design:weight:)(v12, v8, 0, 1);
    sub_10002BD8C((uint64_t)v8, &qword_100091820);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    v16 = Text.font(_:)(v15, a1, a2, 0, &_swiftEmptyArrayStorage);
    v46 = v17;
    v47 = v16;
    v19 = v18;
    v48 = v20;
    swift_bridgeObjectRelease(a2);
    swift_release(v15);
    KeyPath = swift_getKeyPath(&unk_100061258);
    v22 = static Edge.Set.bottom.getter(KeyPath);
    v23 = EdgeInsets.init(_all:)(10.0);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    LOBYTE(v15) = static Edge.Set.horizontal.getter(v30);
    v56 = v19 & 1;
    v52 = 0;
    v49 = 1;
    v44 = swift_getKeyPath(&unk_100061288);
    v31 = v56;
    v32 = v52;
    v33 = v49;
    v57 = 0;
    v45 = static Color.secondary.getter();
    v34 = swift_getKeyPath(&unk_1000613E8);
    *(_DWORD *)v81 = *(_DWORD *)v58;
    *(_DWORD *)&v81[3] = *(_DWORD *)&v58[3];
    v61[0] = v47;
    v61[1] = v46;
    v62 = v31;
    *(_DWORD *)v63 = *(_DWORD *)v55;
    *(_DWORD *)&v63[3] = *(_DWORD *)&v55[3];
    v64 = v48;
    v65 = KeyPath;
    v66 = 1;
    *(_DWORD *)&v67[3] = *(_DWORD *)&v54[3];
    *(_DWORD *)v67 = *(_DWORD *)v54;
    v68 = v22;
    *(_DWORD *)&v69[3] = *(_DWORD *)&v53[3];
    *(_DWORD *)v69 = *(_DWORD *)v53;
    v70 = v23;
    v71 = v25;
    v72 = v27;
    v73 = v29;
    v74 = v32;
    *(_DWORD *)&v75[3] = *(_DWORD *)&v51[3];
    *(_DWORD *)v75 = *(_DWORD *)v51;
    v76 = v15;
    *(_DWORD *)&v77[3] = *(_DWORD *)&v50[3];
    *(_DWORD *)v77 = *(_DWORD *)v50;
    v79 = 0u;
    v78 = 0u;
    v80 = v33;
    v82 = v44;
    v83 = 3;
    v84 = v57;
    *(_DWORD *)&v85[3] = *(_DWORD *)&v59[3];
    *(_DWORD *)v85 = *(_DWORD *)v59;
    v86 = v34;
    v87 = v45;
    sub_10004B4B4((uint64_t)v61);
  }
  else
  {
LABEL_6:
    sub_10004B294((uint64_t)v61);
  }
  sub_10004B2A0((uint64_t)v61, (uint64_t)v60, &qword_100091D28);
  v35 = sub_100025D1C(&qword_100091D30);
  v36 = sub_10004B2E4();
  _ConditionalContent<>.init(storage:)(v88, v60, v35, &type metadata for EmptyView, v36, &protocol witness table for EmptyView);
  v37 = v96;
  a3[8] = v95;
  a3[9] = v37;
  a3[10] = v97[0];
  *(_OWORD *)((char *)a3 + 169) = *(_OWORD *)((char *)v97 + 9);
  v38 = v92;
  a3[4] = v91;
  a3[5] = v38;
  v39 = v94;
  a3[6] = v93;
  a3[7] = v39;
  v40 = v88[1];
  *a3 = v88[0];
  a3[1] = v40;
  result = *(double *)&v89;
  v42 = v90;
  a3[2] = v89;
  a3[3] = v42;
  return result;
}

double sub_100049BC8@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_100049824(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), a1);
}

uint64_t sub_100049BD8()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

double sub_100049BF0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  __int128 v10;
  double result;
  _OWORD v12[2];
  __int128 v13;

  v5 = *v2;
  v6 = static Alignment.center.getter(a1);
  _FrameLayout.init(width:height:alignment:)(v12, v5, 0, 0, 1, v6, v7);
  v8 = sub_100025D1C(&qword_100091B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a2, a1, v8);
  v9 = (_OWORD *)(a2 + *(int *)(sub_100025D1C(&qword_100091B10) + 36));
  v10 = v12[1];
  *v9 = v12[0];
  v9[1] = v10;
  result = *(double *)&v13;
  v9[2] = v13;
  return result;
}

uint64_t sub_100049C90(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 128);
  v3 = *(_QWORD *)(a1 + 136);
  v4 = *(_BYTE *)(a1 + 144);
  v5 = *(_QWORD *)(a1 + 152);
  v6 = *(id *)a1;
  sub_100049CEC(v2, v3, v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t sub_100049CEC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

unint64_t sub_100049CFC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_100091B98;
  if (!qword_100091B98)
  {
    v1 = sub_10002C0E0(&qword_100091B50);
    v2[0] = sub_10002C0E0(&qword_100091B40);
    v2[1] = type metadata accessor for BorderedProminentButtonStyle(255);
    v2[2] = sub_100049DCC();
    v2[3] = sub_10002C054(&qword_100091BB0, (uint64_t (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle, (uint64_t)&protocol conformance descriptor for BorderedProminentButtonStyle);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100091B98);
  }
  return result;
}

unint64_t sub_100049DCC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091BA0;
  if (!qword_100091BA0)
  {
    v1 = sub_10002C0E0(&qword_100091B40);
    sub_10002FF9C(&qword_100091BA8, &qword_100091B58, (uint64_t)&protocol conformance descriptor for Button<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100091BA0);
  }
  return result;
}

unint64_t sub_100049E50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091BC0;
  if (!qword_100091BC0)
  {
    v1 = sub_10002C0E0(&qword_100091B80);
    sub_100049EBC();
    sub_100049F00();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100091BC0);
  }
  return result;
}

unint64_t sub_100049EBC()
{
  unint64_t result;

  result = qword_100093250[0];
  if (!qword_100093250[0])
  {
    result = swift_getWitnessTable(&unk_100061348, &type metadata for AuthorizationPasscodeView);
    atomic_store(result, qword_100093250);
  }
  return result;
}

unint64_t sub_100049F00()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_100091BC8;
  if (!qword_100091BC8)
  {
    v1 = sub_10002C0E0(&qword_100091B68);
    v2[0] = sub_10002C0E0(&qword_100091B58);
    v2[1] = type metadata accessor for BorderedProminentButtonStyle(255);
    v2[2] = sub_10002FF9C(&qword_100091BA8, &qword_100091B58, (uint64_t)&protocol conformance descriptor for Button<A>);
    v2[3] = sub_10002C054(&qword_100091BB0, (uint64_t (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle, (uint64_t)&protocol conformance descriptor for BorderedProminentButtonStyle);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100091BC8);
  }
  return result;
}

unint64_t sub_100049FF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091BD0;
  if (!qword_100091BD0)
  {
    v1 = sub_10002C0E0(&qword_100091B38);
    sub_100049CFC();
    sub_10002FF9C(&qword_100091BB8, &qword_100091B90, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100091BD0);
  }
  return result;
}

uint64_t sub_10004A074(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 128);
  v3 = *(_QWORD *)(a1 + 136);
  v4 = *(_BYTE *)(a1 + 144);
  v5 = *(_QWORD *)(a1 + 152);

  sub_10004A0D0(v2, v3, v4);
  swift_bridgeObjectRelease(v5);
  return a1;
}

uint64_t sub_10004A0D0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

void sub_10004A0E0()
{
  uint64_t v0;
  void *v1;
  Swift::Bool canShowWhile;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    v6 = v1;
    canShowWhile = LACUIDTOViewController._canShowWhileLocked()();
    sub_100052ABC(canShowWhile);

  }
  else
  {
    v3 = *(_QWORD *)(v0 + 24);
    v4 = type metadata accessor for AuthorizationViewModel(0);
    v5 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
    EnvironmentObject.error()(0, v3, v4, v5);
    __break(1u);
  }
}

void sub_10004A168()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    v5 = v1;
    sub_100052A40();

  }
  else
  {
    v2 = *(_QWORD *)(v0 + 24);
    v3 = type metadata accessor for AuthorizationViewModel(0);
    v4 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
    EnvironmentObject.error()(0, v2, v3, v4);
    __break(1u);
  }
}

uint64_t sub_10004A1E8()
{
  uint64_t v0;
  uint64_t v1;
  _OWORD v3[3];

  v3[1] = *(_OWORD *)(v0 + 16);
  v1 = static Animation.default.getter();
  withAnimation<A>(_:_:)(v1, sub_10004A328, v3, (char *)&type metadata for () + 8);
  return swift_release(v1);
}

void sub_10004A248(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(void **)(v1 + 16);
  if (v3)
  {
    v4 = v3;
    v5 = sub_100050278();
    v7 = v6;

    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = v7;
    *(_BYTE *)(a1 + 16) = 0;
    *(_QWORD *)(a1 + 24) = &_swiftEmptyArrayStorage;
  }
  else
  {
    v8 = *(_QWORD *)(v1 + 24);
    v9 = type metadata accessor for AuthorizationViewModel(0);
    v10 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
    EnvironmentObject.error()(0, v8, v9, v10);
    __break(1u);
  }
}

uint64_t sub_10004A2E4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_10004A308(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  return sub_100052754(a1, a2, a3, a4);
}

void sub_10004A328()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    v2 = v1;
    sub_10004DDE4(0);

  }
  else
  {
    v3 = *(_QWORD *)(v0 + 24);
    v4 = type metadata accessor for AuthorizationViewModel(0);
    v5 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
    EnvironmentObject.error()(0, v3, v4, v5);
    __break(1u);
  }
}

id *sub_10004A3A8(id *a1)
{
  id v2;

  v2 = *a1;
  return a1;
}

id *sub_10004A3D0(id *a1)
{

  return a1;
}

_OWORD *sub_10004A3F8(_OWORD *a1, _OWORD *a2)
{
  *a2 = *a1;
  return a2;
}

uint64_t sub_10004A408()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));
  swift_release(*(_QWORD *)(v0 + 64));
  return swift_deallocObject(v0, 72, 7);
}

void sub_10004A444(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;

  v9 = *(_QWORD *)(v4 + 16);
  v10 = *(_QWORD *)(v4 + 24);
  v11 = v9 == a1 && v10 == a2;
  if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v9, v10, 0) & 1) != 0)
  {
    v12 = *(void **)(v4 + 32);
    if (v12)
    {
      v20 = *(_OWORD *)(v4 + 48);
      v21 = *(_QWORD *)(v4 + 64);
      sub_10004A3F8(&v20, &v23);
      sub_10004B2A0((uint64_t)&v21, (uint64_t)&v22, &qword_100091BE0);
      v13 = swift_allocObject(&unk_10007C288, 72, 7);
      v14 = *(_OWORD *)(v4 + 48);
      *(_OWORD *)(v13 + 16) = *(_OWORD *)(v4 + 32);
      *(_OWORD *)(v13 + 32) = v14;
      *(_QWORD *)(v13 + 48) = *(_QWORD *)(v4 + 64);
      *(_QWORD *)(v13 + 56) = a3;
      *(_QWORD *)(v13 + 64) = a4;
      v15 = v12;
      sub_10004A5EC((uint64_t)&v23);
      sub_10004A614(&v22);
      swift_retain(a4);
      sub_100052754(a1, a2, (void (*)(_QWORD))sub_10004A7D8, v13);
      swift_release(v13);

    }
    else
    {
      v17 = *(_QWORD *)(v4 + 40);
      v18 = type metadata accessor for AuthorizationViewModel(0);
      v19 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
      EnvironmentObject.error()(0, v17, v18, v19);
      __break(1u);
    }
  }
  else
  {
    v20 = *(_OWORD *)(v4 + 48);
    v21 = *(_QWORD *)(v4 + 64);
    v23 = 0uLL;
    v16 = sub_100025D1C(&qword_100091BE8);
    State.wrappedValue.setter(&v23, v16);
    a3(0);
  }
}

uint64_t sub_10004A5EC(uint64_t a1)
{
  swift_bridgeObjectRetain(*(_QWORD *)(a1 + 8));
  return a1;
}

_QWORD *sub_10004A614(_QWORD *a1)
{
  swift_retain(*a1);
  return a1;
}

uint64_t sub_10004A63C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10004A670(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  __int128 v21;
  uint64_t v22;

  v4 = v3;
  v5 = *(void **)(v3 + 16);
  if (v5)
  {
    v9 = v5;
    v10 = sub_1000502F4();

    if ((uint64_t)v10 <= 0
      || (v11 = String.count.getter(a1, a2),
          v12 = v9,
          v13 = sub_1000502F4(),
          v12,
          (id)v11 == v13))
    {
      v21 = *(_OWORD *)(v4 + 32);
      v22 = *(_QWORD *)(v4 + 48);
      v20[0] = a1;
      v20[1] = a2;
      swift_bridgeObjectRetain(a2);
      v14 = sub_100025D1C(&qword_100091BE8);
      State.wrappedValue.setter(v20, v14);
      v15 = 1;
    }
    else
    {
      v15 = 0;
    }
    return a3(v15);
  }
  else
  {
    v17 = *(_QWORD *)(v3 + 24);
    v18 = type metadata accessor for AuthorizationViewModel(0);
    v19 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
    result = EnvironmentObject.error()(0, v17, v18, v19);
    __break(1u);
  }
  return result;
}

uint64_t sub_10004A79C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));
  swift_release(*(_QWORD *)(v0 + 64));
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10004A7D8(char a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  void *v3;
  id v4;
  uint64_t (*v5)();
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];
  __int128 v15;
  uint64_t v16;

  v2 = *(uint64_t (**)(uint64_t))(v1 + 56);
  if ((a1 & 1) == 0)
  {
    v15 = *(_OWORD *)(v1 + 32);
    v16 = *(_QWORD *)(v1 + 48);
    v14[0] = 0;
    v14[1] = 0;
    v9 = sub_100025D1C(&qword_100091BE8);
    State.wrappedValue.setter(v14, v9);
    v8 = 0;
    return v2(v8);
  }
  v3 = *(void **)(v1 + 16);
  if (v3)
  {
    v4 = v3;
    v5 = sub_10003975C();
    v7 = v6;
    sub_100051F28(0, (uint64_t (*)(uint64_t))v5, v6);
    swift_release(v7);

    v8 = 1;
    return v2(v8);
  }
  v11 = *(_QWORD *)(v1 + 24);
  v12 = type metadata accessor for AuthorizationViewModel(0);
  v13 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
  result = EnvironmentObject.error()(0, v11, v12, v13);
  __break(1u);
  return result;
}

void sub_10004A8C8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t (*v4)();
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    v2 = (void *)objc_opt_self(LAErrorHelper);
    v10 = v1;
    v3 = objc_msgSend(v2, "errorWithCode:", -2);
    v4 = sub_10003975C();
    v6 = v5;
    sub_100051F28((uint64_t)v3, (uint64_t (*)(uint64_t))v4, v5);
    swift_release(v6);

  }
  else
  {
    v7 = *(_QWORD *)(v0 + 24);
    v8 = type metadata accessor for AuthorizationViewModel(0);
    v9 = sub_10002C054((unint64_t *)&qword_1000915E8, type metadata accessor for AuthorizationViewModel, (uint64_t)&unk_100061998);
    EnvironmentObject.error()(0, v7, v8, v9);
    __break(1u);
  }
}

unint64_t sub_10004A9A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091C18;
  if (!qword_100091C18)
  {
    v1 = sub_10002C0E0(&qword_100091C10);
    sub_10004AA28();
    sub_10002FF9C(&qword_100091C30, &qword_100091C38, (uint64_t)&protocol conformance descriptor for _TraitWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100091C18);
  }
  return result;
}

unint64_t sub_10004AA28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091C20;
  if (!qword_100091C20)
  {
    v1 = sub_10002C0E0(&qword_100091C28);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100091C20);
  }
  return result;
}

double sub_10004AA8C(uint64_t a1)
{
  double result;

  *(_BYTE *)(a1 + 160) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_10004AAAC(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  if (a4)
  {
    sub_100049CEC(result, a2, a3 & 1);
    swift_bridgeObjectRetain(a4);
    swift_retain(a5);
    return swift_retain(a19);
  }
  return result;
}

uint64_t sub_10004AAFC(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 160);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    v4);
  return a1;
}

uint64_t sub_10004AB68(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  if (a4)
  {
    sub_10004A0D0(result, a2, a3 & 1);
    swift_release(a19);
    swift_release(a5);
    return swift_bridgeObjectRelease(a4);
  }
  return result;
}

uint64_t sub_10004ABB8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10004ABE0(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_10004AC04@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10004AC34(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_10004AC60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for AuthorizationHeaderView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = v0 + v4;

  if (*(_QWORD *)(v0 + v4 + 16))
    swift_release(*(_QWORD *)(v6 + 24));
  v7 = v6 + *(int *)(v1 + 24);
  v8 = sub_100025D1C(&qword_100091A30);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10004AD00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AuthorizationHeaderView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004AD44()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t (*v3)(void);

  result = type metadata accessor for AuthorizationHeaderView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(result - 8) + 80);
  v3 = *(uint64_t (**)(void))(v0 + ((v2 + 16) & ~v2) + 16);
  if (v3)
    return v3();
  return result;
}

uint64_t destroy for AuthorizationPasscodeView(uint64_t a1)
{

  return swift_release(*(_QWORD *)(a1 + 24));
}

_QWORD *initializeWithCopy for AuthorizationPasscodeView(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  v6 = v3;
  swift_retain(v5);
  return a1;
}

uint64_t assignWithCopy for AuthorizationPasscodeView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v7;
  swift_retain(v7);
  swift_release(v9);
  return a1;
}

__n128 initializeWithTake for AuthorizationPasscodeView(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for AuthorizationPasscodeView(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for AuthorizationPasscodeView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AuthorizationPasscodeView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationPasscodeView()
{
  return &type metadata for AuthorizationPasscodeView;
}

_QWORD *initializeBufferWithCopyOfBuffer for AuthorizationPromptView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for AuthorizationPromptView(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *_s10CoreAuthUI40AuthorizationRegisterPasswordContentViewV4ModeOwca_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

_QWORD *assignWithTake for AuthorizationPromptView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AuthorizationPromptView(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AuthorizationPromptView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationPromptView()
{
  return &type metadata for AuthorizationPromptView;
}

unint64_t sub_10004B0A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091CC8;
  if (!qword_100091CC8)
  {
    v1 = sub_10002C0E0(&qword_100091B10);
    sub_10002FF9C(&qword_100091CD0, &qword_100091B08, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100091CC8);
  }
  return result;
}

uint64_t sub_10004B124()
{
  return sub_10002FF9C(&qword_100091CD8, &qword_100091CE0, (uint64_t)&protocol conformance descriptor for VStack<A>);
}

uint64_t sub_10004B150()
{
  return sub_10002FF9C(&qword_100091CE8, &qword_100091CF0, (uint64_t)&protocol conformance descriptor for VStack<A>);
}

uint64_t sub_10004B17C()
{
  _QWORD v1[2];

  v1[0] = sub_10002C0E0(&qword_100091C10);
  v1[1] = sub_10004A9A4();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.onTapGesture(count:perform:)>>, 1);
}

uint64_t sub_10004B1C8()
{
  return sub_10002FF9C(&qword_100091CF8, &qword_100091D00, (uint64_t)&protocol conformance descriptor for VStack<A>);
}

uint64_t sub_10004B1F4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000741A0, 1);
}

uint64_t sub_10004B204(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100074178, 1);
}

uint64_t sub_10004B214(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10004B258(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10004B294(uint64_t result)
{
  *(_BYTE *)(result + 184) = 1;
  return result;
}

uint64_t sub_10004B2A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100025D1C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_10004B2E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091D38;
  if (!qword_100091D38)
  {
    v1 = sub_10002C0E0(&qword_100091D30);
    sub_10004B368();
    sub_10002FF9C(&qword_100091DA0, &qword_100091DA8, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100091D38);
  }
  return result;
}

unint64_t sub_10004B368()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091D40;
  if (!qword_100091D40)
  {
    v1 = sub_10002C0E0(&qword_100091D48);
    sub_1000418B8(&qword_100091D50, &qword_100091D58, (void (*)(void))sub_10004B40C);
    sub_10002FF9C(&qword_100091D90, &qword_100091D98, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100091D40);
  }
  return result;
}

uint64_t sub_10004B40C()
{
  return sub_1000418B8(&qword_100091D60, &qword_100091D68, (void (*)(void))sub_10004B430);
}

unint64_t sub_10004B430()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091D70;
  if (!qword_100091D70)
  {
    v1 = sub_10002C0E0(&qword_100091D78);
    sub_10002FF9C(&qword_100091D80, &qword_100091D88, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100091D70);
  }
  return result;
}

uint64_t sub_10004B4B4(uint64_t result)
{
  *(_BYTE *)(result + 184) = 0;
  return result;
}

uint64_t sub_10004B4BC()
{
  return sub_1000418B8(&qword_100091DB0, &qword_100091D10, (void (*)(void))sub_10004B4F0);
}

unint64_t sub_10004B4F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091DB8;
  if (!qword_100091DB8)
  {
    v1 = sub_10002C0E0(&qword_100091D08);
    sub_1000418B8(&qword_100091DC0, &qword_100091D20, (void (*)(void))sub_10004B574);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100091DB8);
  }
  return result;
}

unint64_t sub_10004B574()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091DC8;
  if (!qword_100091DC8)
  {
    v1 = sub_10002C0E0(&qword_100091D18);
    sub_10002C054(&qword_100091638, type metadata accessor for PasscodeEmbeddedView, (uint64_t)&unk_1000608D8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100091DC8);
  }
  return result;
}

unint64_t sub_10004B5FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100091DD0;
  if (!qword_100091DD0)
  {
    v1 = sub_10002C0E0(&qword_100091DD8);
    sub_10004B2E4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100091DD0);
  }
  return result;
}

uint64_t sub_10004B6A8()
{
  uint64_t v0;
  _QWORD *v1;

  v0 = type metadata accessor for Logger(0);
  sub_10004CFD8(v0, qword_100093398);
  sub_10004C1D0(v0, (uint64_t)qword_100093398);
  v1 = sub_1000419B8();
  return sub_1000419D0(*v1);
}

void sub_10004B6FC()
{
  void *v0;
  id v1;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  objc_msgSendSuper2(&v2, "viewDidLoad");
  if (objc_msgSend((id)objc_opt_self(LAUtils), "isSharedIPad"))
  {
    v1 = objc_msgSend(objc_allocWithZone((Class)LALocalBackoffCounter), "init");
    objc_msgSend(v0, "setBackoffCounter:", v1);

  }
}

void sub_10004B828(char a1)
{
  void *v1;
  void *v2;
  objc_class *ObjectType;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  objc_class *v29;
  char *v30;
  char *v31;
  uint64_t *v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  void *v41;
  uint64_t v42;
  id v43;
  unint64_t v44;
  unint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  id v51;
  uint64_t v52;
  Swift::String_optional v53;
  Swift::String v54;
  uint64_t v55;
  void *v56;
  NSString v57;
  id v58;
  NSString v59;
  id v60;
  void *v61;
  NSString v62;
  id v63;
  char *v64;
  uint64_t ObjCClassFromMetadata;
  id v66;
  Swift::String v67;
  Swift::String_optional v68;
  Swift::String v69;
  void *object;
  NSString v71;
  uint64_t v72;
  void *v73;
  void *v74;
  unint64_t v75;
  id v76;
  void **aBlock;
  uint64_t v78;
  uint64_t (*v79)(uint64_t);
  void *v80;
  void *v81;
  uint64_t v82;
  objc_super v83;
  objc_super v84;
  _QWORD v85[2];
  __int128 v86;
  __int128 v87;
  Swift::String v88;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType(v2);
  v84.receiver = v2;
  v84.super_class = ObjectType;
  objc_msgSendSuper2(&v84, "viewDidAppear:", a1 & 1);
  v5 = objc_msgSend(v2, "backoffCounter");
  if (!v5)
  {
    if (qword_100093390 != -1)
      swift_once(&qword_100093390, sub_10004B6A8);
    v20 = type metadata accessor for Logger(0);
    v21 = sub_10004C1D0(v20, (uint64_t)qword_100093398);
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Backoff counter cannot be nil!", v24, 2u);
      swift_slowDealloc(v24, -1, -1);
    }
    goto LABEL_46;
  }
  v6 = v5;
  v7 = objc_msgSend(v2, "cachedExternalizedContext");
  if (!v7)
  {
    __break(1u);
    goto LABEL_48;
  }
  v8 = v7;
  v9 = objc_msgSend(v7, "externalizedContext");

  if (!v9)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v9);
  v12 = v11;

  v13 = objc_msgSend(v2, "internalInfo");
  if (!v13)
  {
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  v14 = v13;
  v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v13, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  *(_QWORD *)&v86 = 0x644972657355;
  *((_QWORD *)&v86 + 1) = 0xE600000000000000;
  AnyHashable.init<A>(_:)(&v86, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v15 + 16) && (v16 = sub_100027EF8((uint64_t)&aBlock), (v17 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v15 + 56) + 32 * v16, (uint64_t)&v86);
  }
  else
  {
    v86 = 0u;
    v87 = 0u;
  }
  swift_bridgeObjectRelease(v15);
  sub_100028114((uint64_t)&aBlock);
  v76 = v6;
  if (*((_QWORD *)&v87 + 1))
  {
    v18 = sub_100025DA0();
    if (swift_dynamicCast(v85, &v86, (char *)&type metadata for Any + 8, v18, 6))
      v19 = v85[0];
    else
      v19 = 0;
  }
  else
  {
    sub_100027BE8((uint64_t)&v86);
    v19 = 0;
  }
  v25 = objc_msgSend(v2, "policy");
  v26 = objc_msgSend(v2, "options");
  if (!v26)
    goto LABEL_50;
  v27 = v26;
  v28 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v26, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v29 = (objc_class *)type metadata accessor for PasscodeAlertViewController();
  v30 = (char *)objc_allocWithZone(v29);
  v31 = &v30[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_delegate];
  *((_QWORD *)v31 + 1) = 0;
  swift_unknownObjectWeakInit(v31, 0);
  v32 = (uint64_t *)&v30[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_externalizedContext];
  *v32 = v10;
  v32[1] = v12;
  *(_QWORD *)&v30[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_userId] = v19;
  *(_QWORD *)&v30[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_policy] = v25;
  *(_QWORD *)&v30[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_options] = v28;
  *(_QWORD *)&v30[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_backoffCounter] = v76;
  v83.receiver = v30;
  v83.super_class = v29;
  v33 = v76;
  swift_unknownObjectRetain(v76);
  v34 = objc_msgSendSuper2(&v83, "initWithNibName:bundle:", 0, 0);
  v35 = swift_getObjectType(v2);
  v36 = objc_msgSend(v2, "options");
  if (!v36)
  {
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  v37 = v36;
  v38 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v36, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  LODWORD(v85[0]) = 1037;
  AnyHashable.init<A>(_:)(v85, &type metadata for Int32, &protocol witness table for Int32);
  if (*(_QWORD *)(v38 + 16) && (v39 = sub_100027EF8((uint64_t)&aBlock), (v40 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v38 + 56) + 32 * v39, (uint64_t)&v86);
  }
  else
  {
    v86 = 0u;
    v87 = 0u;
  }
  swift_bridgeObjectRelease(v38);
  sub_100028114((uint64_t)&aBlock);
  if (*((_QWORD *)&v87 + 1))
  {
    if ((swift_dynamicCast(v85, &v86, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
    {
      v41 = (void *)v85[1];
LABEL_45:
      v62 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v41);
      objc_msgSend(v34, "setTitle:", v62);

      v22 = v34;
      v63 = objc_msgSend(v2, "callerName");
      -[NSObject setMessage:](v22, "setMessage:", v63);

      -[NSObject setPreferredStyle:](v22, "setPreferredStyle:", 1);
      v64 = (char *)v22
          + OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_delegate;
      *((_QWORD *)v64 + 1) = &off_10007C580;
      swift_unknownObjectWeakAssign(v64, v2);
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata(ObjectType);
      v66 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
      v88._object = (void *)0xE000000000000000;
      v67._countAndFlagsBits = 0x4C45434E4143;
      v67._object = (void *)0xE600000000000000;
      v68.value._countAndFlagsBits = 0x4955656C69626F4DLL;
      v68.value._object = (void *)0xE800000000000000;
      v69._countAndFlagsBits = 0;
      v69._object = (void *)0xE000000000000000;
      v88._countAndFlagsBits = 0;
      object = NSLocalizedString(_:tableName:bundle:value:comment:)(v67, v68, (NSBundle)v66, v69, v88)._object;

      v71 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(object);
      v72 = swift_allocObject(&unk_10007C4A0, 24, 7);
      swift_unknownObjectWeakInit(v72 + 16, v2);
      v81 = sub_10004CE40;
      v82 = v72;
      aBlock = _NSConcreteStackBlock;
      v78 = 1107296256;
      v79 = sub_100027144;
      v80 = &unk_10007C4B8;
      v73 = _Block_copy(&aBlock);
      swift_release(v82);
      v81 = sub_100026F7C;
      v82 = 0;
      aBlock = _NSConcreteStackBlock;
      v78 = 1107296256;
      v79 = sub_10003FB10;
      v80 = &unk_10007C4E0;
      v74 = _Block_copy(&aBlock);
      -[NSObject _addActionWithTitle:style:handler:shouldDismissHandler:](v22, "_addActionWithTitle:style:handler:shouldDismissHandler:", v71, 1, v73, v74);
      _Block_release(v74);
      _Block_release(v73);

      objc_msgSend(v2, "presentViewController:animated:completion:", v22, 1, 0);
      swift_unknownObjectRelease(v33);
LABEL_46:

      return;
    }
  }
  else
  {
    sub_100027BE8((uint64_t)&v86);
  }
  if ((objc_msgSend((id)objc_opt_self(LAUtils), "isApplePayPolicy:", objc_msgSend(v2, "policy")) & 1) != 0)goto LABEL_29;
  v46 = objc_msgSend(v2, "options");
  if (!v46)
    goto LABEL_52;
  v47 = v46;
  v48 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v46, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  LODWORD(v85[0]) = 1053;
  AnyHashable.init<A>(_:)(v85, &type metadata for Int32, &protocol witness table for Int32);
  if (*(_QWORD *)(v48 + 16) && (v49 = sub_100027EF8((uint64_t)&aBlock), (v50 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v48 + 56) + 32 * v49, (uint64_t)&v86);
  }
  else
  {
    v86 = 0u;
    v87 = 0u;
  }
  swift_bridgeObjectRelease(v48);
  sub_100028114((uint64_t)&aBlock);
  if (*((_QWORD *)&v87 + 1))
  {
    if ((swift_dynamicCast(v85, &v86, (char *)&type metadata for Any + 8, &type metadata for Bool, 6) & 1) != 0
      && LOBYTE(v85[0]) == 1)
    {
LABEL_29:
      v42 = swift_getObjCClassFromMetadata(v35);
      v43 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", v42);
      v75 = 0xE000000000000000;
      v44 = 5849424;
      v45 = 0xE300000000000000;
LABEL_42:
      v53.value._countAndFlagsBits = 0x4955656C69626F4DLL;
      v53.value._object = (void *)0xE800000000000000;
      v54._countAndFlagsBits = 0;
      v54._object = (void *)0xE000000000000000;
      v55 = 0;
      v41 = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v44, v53, (NSBundle)v43, v54, *(Swift::String *)(&v75 + -8))._object;

      goto LABEL_45;
    }
  }
  else
  {
    sub_100027BE8((uint64_t)&v86);
  }
  v51 = objc_msgSend(v2, "policy");
  v52 = swift_getObjCClassFromMetadata(v35);
  v43 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", v52);
  if (v51 == (id)1010)
  {
    v75 = 0xE000000000000000;
    v45 = 0x800000010006D720;
    v44 = 0xD000000000000015;
    goto LABEL_42;
  }
  v56 = (void *)objc_opt_self(UIDevice);
  v57 = String._bridgeToObjectiveC()();
  v58 = objc_msgSend(v56, "modelSpecificLocalizedStringKeyForKey:", v57);

  if (v58)
  {
    v59 = String._bridgeToObjectiveC()();
    v60 = objc_msgSend(v43, "localizedStringForKey:value:table:", v58, 0, v59);

    static String._unconditionallyBridgeFromObjectiveC(_:)(v60);
    v41 = v61;

    v33 = v76;
    goto LABEL_45;
  }
LABEL_53:
  __break(1u);
}

uint64_t sub_10004C1D0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_10004C228(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_class *ObjectType;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  id v11;
  void *v12;
  _QWORD *v13;
  void **v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  void (*v18)();
  _QWORD *v19;
  objc_super v20;

  ObjectType = (objc_class *)swift_getObjectType(v2);
  v6 = objc_msgSend(v2, "presentedViewController");
  if (v6)
  {
    v7 = v6;
    v8 = (_QWORD *)swift_allocObject(&unk_10007C540, 40, 7);
    v8[2] = v2;
    v8[3] = a1;
    v8[4] = a2;
    v18 = sub_10004CEE4;
    v19 = v8;
    v14 = _NSConcreteStackBlock;
    v15 = 1107296256;
    v16 = sub_100027144;
    v17 = &unk_10007C558;
    v9 = _Block_copy(&v14);
    v10 = v19;
    v11 = v2;
    sub_100027180(a1, a2);
    swift_release(v10);
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, v9);
    _Block_release(v9);

  }
  else
  {
    if (a1)
    {
      v18 = (void (*)())a1;
      v19 = (_QWORD *)a2;
      v14 = _NSConcreteStackBlock;
      v15 = 1107296256;
      v16 = sub_100027144;
      v17 = &unk_10007C508;
      v12 = _Block_copy(&v14);
      v13 = v19;
      swift_retain(a2);
      swift_release(v13);
    }
    else
    {
      v12 = 0;
    }
    v20.receiver = v2;
    v20.super_class = ObjectType;
    objc_msgSendSuper2(&v20, "dismissChildWithCompletionHandler:", v12);
    _Block_release(v12);
  }
}

id sub_10004C444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  void *v5;
  objc_class *ObjectType;
  Class isa;
  id v13;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType(v5);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v15.receiver = v5;
  v15.super_class = ObjectType;
  v13 = objc_msgSendSuper2(&v15, "initWithInternalInfo:mechanism:backoffCounter:remoteUIHost:allowsLandscape:", isa, a2, a3, a4, a5 & 1);

  swift_unknownObjectRelease(a2);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);
  return v13;
}

id sub_10004C630(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  objc_class *ObjectType;
  NSString v7;
  id v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(v3);
  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v10.receiver = v3;
  v10.super_class = ObjectType;
  v8 = objc_msgSendSuper2(&v10, "initWithNibName:bundle:", v7, a3);

  return v8;
}

id sub_10004C770(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType(v1);
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_10004C804(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_class *ObjectType;
  NSDictionary v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  objc_super v16;
  _QWORD v17[3];
  uint64_t v18;

  ObjectType = (objc_class *)swift_getObjectType(v2);
  if (a1)
  {
    v6.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v6.super.isa = 0;
  }
  sub_100034C88(a2, (uint64_t)v17);
  v7 = v18;
  if (v18)
  {
    v8 = sub_1000279D8(v17, v18);
    v9 = *(_QWORD *)(v7 - 8);
    __chkstk_darwin(v8);
    v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    v12 = _bridgeAnythingToObjectiveC<A>(_:)(v11, v7);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    sub_1000279FC(v17);
  }
  else
  {
    v12 = 0;
  }
  v16.receiver = v2;
  v16.super_class = ObjectType;
  v13 = objc_msgSendSuper2(&v16, "initWithInternalInfo:parent:", v6.super.isa, v12);

  swift_unknownObjectRelease(v12);
  v14 = v13;
  sub_100027BE8(a2);
  if (v14)

  return v14;
}

id sub_10004CA10()
{
  void *v0;
  id result;
  id v2;

  result = objc_msgSend(v0, "mechanism");
  if (result)
  {
    v2 = result;
    objc_msgSend(result, "uiEvent:options:", 9, 0);
    return (id)swift_unknownObjectRelease(v2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10004CA64()
{
  void *v0;
  id v1;
  id v2;
  Class isa;

  v1 = objc_msgSend(v0, "mechanism");
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "uiEvent:options:", 8, 0);
    swift_unknownObjectRelease(v2);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v0, "uiSuccessWithResult:", isa);

  }
  else
  {
    __break(1u);
  }
}

void sub_10004CB14(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)_convertErrorToNSError(_:)(a1);
  objc_msgSend(v1, "uiFailureWithError:", v2);

}

void sub_10004CBD0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char *v9;
  char *v10;
  uint64_t Strong;
  uint64_t v12;
  char *v13;
  char v14[24];
  objc_super v15;

  v1 = v0;
  v15.receiver = v0;
  v15.super_class = (Class)swift_getObjectType(v0);
  objc_msgSendSuper2(&v15, "viewDidLoad");
  type metadata accessor for PasscodeAlertContentViewController(0);
  v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_externalizedContext];
  v3 = *(_QWORD *)&v0[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_externalizedContext
                    + 8];
  v4 = *(void **)&v0[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_userId];
  v5 = *(_QWORD *)&v0[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_policy];
  v6 = *(_QWORD *)&v0[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_options];
  v7 = *(_QWORD *)&v0[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_backoffCounter];
  sub_10002B39C(*(_QWORD *)&v1[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_externalizedContext], *(_QWORD *)&v1[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_externalizedContext+ 8]);
  v8 = v4;
  swift_bridgeObjectRetain(v6);
  swift_unknownObjectRetain(v7);
  v9 = (char *)sub_100029DD4(v2, v3, v4, v5, v6, v7);
  v10 = &v1[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_delegate];
  Strong = swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_delegate]);
  v12 = *((_QWORD *)v10 + 1);
  v13 = &v9[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate];
  swift_beginAccess(&v9[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate], v14, 1, 0);
  *((_QWORD *)v13 + 1) = v12;
  swift_unknownObjectWeakAssign(v13, Strong);
  swift_unknownObjectRelease(Strong);
  objc_msgSend(v1, "setContentViewController:", v9);

}

uint64_t type metadata accessor for PasscodeAlertViewController()
{
  return objc_opt_self(_TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController);
}

uint64_t sub_10004CE1C()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10004CE40()
{
  uint64_t v0;
  void *Strong;
  void *v2;
  _BYTE v3[24];

  swift_beginAccess(v0 + 16, v3, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v0 + 16);
  if (Strong)
  {
    v2 = Strong;
    objc_msgSend(Strong, "uiCancel");

  }
}

uint64_t sub_10004CE98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10004CEA8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10004CEB0()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_10004CEE4()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  objc_super v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (void *)v0[2];
  v1 = v0[3];
  if (v1)
  {
    v3 = v0[4];
    v10 = v1;
    v11 = v3;
    v7.receiver = _NSConcreteStackBlock;
    v7.super_class = (Class)1107296256;
    v8 = sub_100027144;
    v9 = &unk_10007C5D0;
    v4 = _Block_copy(&v7);
    v5 = v11;
    swift_retain(v3);
    swift_release(v5);
  }
  else
  {
    v4 = 0;
  }
  v6 = (objc_class *)type metadata accessor for ComplementaryPasscodeViewController();
  v7.receiver = v2;
  v7.super_class = v6;
  objc_msgSendSuper2(&v7, "dismissChildWithCompletionHandler:", v4);
  _Block_release(v4);
}

uint64_t type metadata accessor for ComplementaryPasscodeViewController()
{
  return objc_opt_self(_TtC10CoreAuthUI35ComplementaryPasscodeViewController);
}

uint64_t sub_10004CFB4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t *sub_10004CFD8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t sub_10004D038()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for Logger(0);
  sub_10004CFD8(v0, qword_1000934B8);
  sub_10004C1D0(v0, (uint64_t)qword_1000934B8);
  v1 = sub_1000419B0();
  return sub_1000419D0(v1);
}

id sub_10004D154()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC10CoreAuthUI13SceneDelegate_window] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10004D1D8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_10004D218(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v3 = v2;
  if (objc_msgSend((id)objc_opt_self(LAUtils), "usesFrontBoardServicesForRemoteUI"))
  {
    if (qword_1000934B0 != -1)
      swift_once(&qword_1000934B0, sub_10004D038);
    v6 = type metadata accessor for Logger(0);
    sub_10004C1D0(v6, (uint64_t)qword_1000934B8);
    v7 = a2;
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(12, -1);
      v31 = v3;
      v11 = swift_slowAlloc(32, -1);
      v33 = v11;
      *(_DWORD *)v10 = 136315138;
      v12 = objc_msgSend(v7, "persistentIdentifier");
      v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
      v15 = v14;

      v32 = sub_10002B3E0(v13, v15, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v10 + 4, v10 + 12);

      swift_bridgeObjectRelease(v15);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Will connect to scene: %s", v10, 0xCu);
      swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
      v16 = v11;
      v3 = v31;
      swift_slowDealloc(v16, -1, -1);
      swift_slowDealloc(v10, -1, -1);

    }
    else
    {

    }
    v17 = objc_opt_self(UIWindowScene);
    v18 = swift_dynamicCastObjCClass(a1, v17);
    if (v18)
    {
      v19 = v18;
      v20 = objc_allocWithZone((Class)UIWindow);
      v21 = a1;
      v22 = objc_msgSend(v20, "initWithWindowScene:", v19);
      v23 = OBJC_IVAR____TtC10CoreAuthUI13SceneDelegate_window;
      v24 = *(void **)(v3 + OBJC_IVAR____TtC10CoreAuthUI13SceneDelegate_window);
      *(_QWORD *)(v3 + OBJC_IVAR____TtC10CoreAuthUI13SceneDelegate_window) = v22;

      v25 = *(void **)(v3 + v23);
      if (v25)
      {
        v26 = objc_allocWithZone((Class)TransitionViewController);
        v27 = v25;
        v28 = objc_msgSend(v26, "init");
        objc_msgSend(v27, "setRootViewController:", v28);

        v29 = *(void **)(v3 + v23);
      }
      else
      {
        v29 = 0;
      }
      v30 = v29;
      objc_msgSend(v30, "makeKeyAndVisible");

    }
  }
}

void sub_10004D4E8(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  if (objc_msgSend((id)objc_opt_self(LAUtils), "usesFrontBoardServicesForRemoteUI"))
  {
    if (qword_1000934B0 != -1)
      swift_once(&qword_1000934B0, sub_10004D038);
    v2 = type metadata accessor for Logger(0);
    sub_10004C1D0(v2, (uint64_t)qword_1000934B8);
    v12 = a1;
    v3 = Logger.logObject.getter(v12);
    v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc(12, -1);
      v6 = swift_slowAlloc(32, -1);
      v14 = v6;
      *(_DWORD *)v5 = 136315138;
      v7 = objc_msgSend(v12, "session");
      v8 = objc_msgSend(v7, "persistentIdentifier");

      v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
      v11 = v10;

      v13 = sub_10002B3E0(v9, v11, &v14);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v5 + 4, v5 + 12);

      swift_bridgeObjectRelease(v11);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Did disconnect from scene: %s", v5, 0xCu);
      swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v6, -1, -1);
      swift_slowDealloc(v5, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(_TtC10CoreAuthUI13SceneDelegate);
}

char *sub_10004D730(void *a1, uint64_t a2)
{
  id v4;

  v4 = objc_allocWithZone((Class)type metadata accessor for AuthenticationParentView());
  return sub_10004D8E4(a1, a2);
}

char *sub_10004D76C(void *a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return sub_10004D8E4(a1, a2);
}

uint64_t type metadata accessor for AuthenticationParentView()
{
  return objc_opt_self(_TtC10CoreAuthUI24AuthenticationParentView);
}

uint64_t sub_10004D7E0(uint64_t a1, char a2)
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)(a1, a2 & 1);
}

uint64_t sub_10004D820(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10004DB9C();
  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10004D870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10004DB9C();
  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10004D8C0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10004DB9C();
  UIViewRepresentable.body.getter(a1, v2);
  __break(1u);
}

char *sub_10004D8E4(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  objc_class *ObjectType;
  id v7;
  char *v8;
  id v9;
  id v10;
  char *v11;
  void *v12;
  char *v13;
  id v14;
  objc_super v16;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType(v3);
  v7 = objc_allocWithZone((Class)LAUIAuthenticationView);
  v8 = v3;
  v9 = objc_msgSend(v7, "initWithFrame:mechanisms:context:", 4, a1, 0.0, 0.0, 50.0, 50.0);
  *(_QWORD *)&v8[OBJC_IVAR____TtC10CoreAuthUI24AuthenticationParentView_authenticationView] = v9;
  objc_msgSend(v9, "setStyle:", 1);
  v10 = v9;
  objc_msgSend(v10, "setDelegate:", a2);

  v16.receiver = v8;
  v16.super_class = ObjectType;
  v11 = (char *)objc_msgSendSuper2(&v16, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v12 = *(void **)&v11[OBJC_IVAR____TtC10CoreAuthUI24AuthenticationParentView_authenticationView];
  v13 = v11;
  v14 = v12;
  objc_msgSend(v13, "addSubview:", v14);

  swift_unknownObjectRelease(a2);
  return v13;
}

void sub_10004DA2C()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010006DE50, "CoreAuthUI/AuthenticationView.swift", 35, 2, 33, 0);
  __break(1u);
}

void sub_10004DADC()
{
  _swift_stdlib_reportUnimplementedInitializer("CoreAuthUI.AuthenticationParentView", 35, "init(frame:)", 12, 0);
  __break(1u);
}

unint64_t sub_10004DB48()
{
  unint64_t result;

  result = qword_100091EF8;
  if (!qword_100091EF8)
  {
    result = swift_getWitnessTable(&unk_1000615C0, &type metadata for AuthenticationView);
    atomic_store(result, (unint64_t *)&qword_100091EF8);
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthenticationView()
{
  return &type metadata for AuthenticationView;
}

unint64_t sub_10004DB9C()
{
  unint64_t result;

  result = qword_100091F28;
  if (!qword_100091F28)
  {
    result = swift_getWitnessTable(&unk_100061530, &type metadata for AuthenticationView);
    atomic_store(result, (unint64_t *)&qword_100091F28);
  }
  return result;
}

uint64_t sub_10004DBE0()
{
  return sub_10004F418((uint64_t)&unk_100061680, (uint64_t)&unk_1000616A8);
}

uint64_t sub_10004DBF4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10004F494(a1, (uint64_t)&unk_100061680, (uint64_t)&unk_1000616A8, a2);
}

uint64_t sub_10004DC08(char *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_10004F520(a1, a2, a3, a4, (uint64_t)&unk_100061680, (uint64_t)&unk_1000616A8);
}

uint64_t sub_10004DC1C(char a1)
{
  return sub_10004F59C(a1, (uint64_t)&unk_100061680, (uint64_t)&unk_1000616A8);
}

uint64_t (*sub_10004DC30(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t KeyPath;
  uint64_t v5;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  KeyPath = swift_getKeyPath(&unk_100061680);
  v3[4] = KeyPath;
  v5 = swift_getKeyPath(&unk_1000616A8);
  v3[5] = v5;
  v3[6] = static Published.subscript.modify(v3, v1, KeyPath, v5);
  return sub_10004DCA8;
}

uint64_t sub_10004DCAC()
{
  return sub_10004F6D8(OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showAuthorizationView, &qword_100091F30);
}

uint64_t sub_10004DCC0(uint64_t a1)
{
  return sub_10004F758(a1, &qword_100091F38, OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showAuthorizationView, &qword_100091F30);
}

void (*sub_10004DCDC(_QWORD *a1))(uint64_t, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = sub_100025D1C(&qword_100091F38);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showAuthorizationView[0];
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33, 0);
  v9 = sub_100025D1C(&qword_100091F30);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_10004DDA4;
}

uint64_t sub_10004DDA8()
{
  return sub_10004F418((uint64_t)&unk_1000616C8, (uint64_t)&unk_1000616F0);
}

uint64_t sub_10004DDBC@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10004F494(a1, (uint64_t)&unk_1000616C8, (uint64_t)&unk_1000616F0, a2);
}

uint64_t sub_10004DDD0(char *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_10004F520(a1, a2, a3, a4, (uint64_t)&unk_1000616C8, (uint64_t)&unk_1000616F0);
}

uint64_t sub_10004DDE4(char a1)
{
  return sub_10004F59C(a1, (uint64_t)&unk_1000616C8, (uint64_t)&unk_1000616F0);
}

uint64_t (*sub_10004DDF8(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t KeyPath;
  uint64_t v5;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  KeyPath = swift_getKeyPath(&unk_1000616C8);
  v3[4] = KeyPath;
  v5 = swift_getKeyPath(&unk_1000616F0);
  v3[5] = v5;
  v3[6] = static Published.subscript.modify(v3, v1, KeyPath, v5);
  return sub_10004DCA8;
}

uint64_t sub_10004DE70()
{
  return sub_10004F6D8(OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryIntentButton, &qword_100091F30);
}

uint64_t sub_10004DE84(uint64_t a1)
{
  return sub_10004F758(a1, &qword_100091F38, OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryIntentButton, &qword_100091F30);
}

void (*sub_10004DEA0(_QWORD *a1))(uint64_t, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = sub_100025D1C(&qword_100091F38);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryIntentButton[0];
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33, 0);
  v9 = sub_100025D1C(&qword_100091F30);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_10004DDA4;
}

uint64_t sub_10004DF68(char a1)
{
  char v2;

  v2 = a1;
  return Published.init(initialValue:)(&v2, &type metadata for Bool);
}

uint64_t sub_10004DF94()
{
  return sub_10004F418((uint64_t)&unk_100061710, (uint64_t)&unk_100061738);
}

uint64_t sub_10004DFA8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10004F494(a1, (uint64_t)&unk_100061710, (uint64_t)&unk_100061738, a2);
}

uint64_t sub_10004DFBC(char *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_10004F520(a1, a2, a3, a4, (uint64_t)&unk_100061710, (uint64_t)&unk_100061738);
}

uint64_t sub_10004DFD0(char a1)
{
  return sub_10004F59C(a1, (uint64_t)&unk_100061710, (uint64_t)&unk_100061738);
}

uint64_t (*sub_10004DFE4(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t KeyPath;
  uint64_t v5;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  KeyPath = swift_getKeyPath(&unk_100061710);
  v3[4] = KeyPath;
  v5 = swift_getKeyPath(&unk_100061738);
  v3[5] = v5;
  v3[6] = static Published.subscript.modify(v3, v1, KeyPath, v5);
  return sub_10004DCA8;
}

uint64_t sub_10004E05C()
{
  return sub_10004F6D8(OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowCustomPasswordView, &qword_100091F30);
}

uint64_t sub_10004E070(uint64_t a1)
{
  return sub_10004F758(a1, &qword_100091F38, OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowCustomPasswordView, &qword_100091F30);
}

void (*sub_10004E08C(_QWORD *a1))(uint64_t, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = sub_100025D1C(&qword_100091F38);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowCustomPasswordView[0];
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33, 0);
  v9 = sub_100025D1C(&qword_100091F30);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_10004DDA4;
}

uint64_t sub_10004E154()
{
  return sub_10004F418((uint64_t)&unk_100061758, (uint64_t)&unk_100061780);
}

uint64_t sub_10004E168@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10004F494(a1, (uint64_t)&unk_100061758, (uint64_t)&unk_100061780, a2);
}

uint64_t sub_10004E17C(char *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_10004F520(a1, a2, a3, a4, (uint64_t)&unk_100061758, (uint64_t)&unk_100061780);
}

uint64_t sub_10004E190(char a1)
{
  return sub_10004F59C(a1, (uint64_t)&unk_100061758, (uint64_t)&unk_100061780);
}

uint64_t (*sub_10004E1A4(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t KeyPath;
  uint64_t v5;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  KeyPath = swift_getKeyPath(&unk_100061758);
  v3[4] = KeyPath;
  v5 = swift_getKeyPath(&unk_100061780);
  v3[5] = v5;
  v3[6] = static Published.subscript.modify(v3, v1, KeyPath, v5);
  return sub_10004DCA8;
}

uint64_t sub_10004E21C()
{
  return sub_10004F6D8(&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowDevicePasscodeView, &qword_100091F30);
}

uint64_t sub_10004E230(uint64_t a1)
{
  return sub_10004F758(a1, &qword_100091F38, &OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowDevicePasscodeView, &qword_100091F30);
}

void (*sub_10004E24C(_QWORD *a1))(uint64_t, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = sub_100025D1C(&qword_100091F38);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowDevicePasscodeView;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33, 0);
  v9 = sub_100025D1C(&qword_100091F30);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_10004DDA4;
}

uint64_t sub_10004E314()
{
  return sub_10004F418((uint64_t)&unk_1000617A0, (uint64_t)&unk_1000617C8);
}

uint64_t sub_10004E328(char a1)
{
  return sub_10004F59C(a1, (uint64_t)&unk_1000617A0, (uint64_t)&unk_1000617C8);
}

uint64_t (*sub_10004E33C(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t KeyPath;
  uint64_t v5;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  KeyPath = swift_getKeyPath(&unk_1000617A0);
  v3[4] = KeyPath;
  v5 = swift_getKeyPath(&unk_1000617C8);
  v3[5] = v5;
  v3[6] = static Published.subscript.modify(v3, v1, KeyPath, v5);
  return sub_10004DCA8;
}

uint64_t sub_10004E3B4()
{
  return sub_10004F6D8(OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passcodeFocused, &qword_100091F30);
}

uint64_t sub_10004E3C8(uint64_t a1)
{
  return sub_10004F758(a1, &qword_100091F38, OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passcodeFocused, &qword_100091F30);
}

void (*sub_10004E3E4(_QWORD *a1))(uint64_t, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = sub_100025D1C(&qword_100091F38);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passcodeFocused[0];
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33, 0);
  v9 = sub_100025D1C(&qword_100091F30);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_10004DDA4;
}

uint64_t sub_10004E4AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = sub_100025D1C(&qword_100091F40);
  __chkstk_darwin(v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100027F28(a1, (uint64_t)v4, &qword_100091F40);
  Published.init(initialValue:)(v4, v2);
  return sub_10002BD8C(a1, &qword_100091F40);
}

uint64_t sub_10004E54C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_1000617E8);
  v4 = swift_getKeyPath(&unk_100061810);
  static Published.subscript.getter(a1, v1, KeyPath, v4);
  swift_release(KeyPath);
  return swift_release(v4);
}

uint64_t sub_10004E5B0(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v9;

  v3 = sub_100025D1C(&qword_100091F40);
  __chkstk_darwin(v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_1000617E8);
  v7 = swift_getKeyPath(&unk_100061810);
  sub_100027F28(a1, (uint64_t)v5, &qword_100091F40);
  static Published.subscript.setter(v5, v1, KeyPath, v7);
  return sub_10002BD8C(a1, &qword_100091F40);
}

uint64_t (*sub_10004E670(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t KeyPath;
  uint64_t v5;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  KeyPath = swift_getKeyPath(&unk_1000617E8);
  v3[4] = KeyPath;
  v5 = swift_getKeyPath(&unk_100061810);
  v3[5] = v5;
  v3[6] = static Published.subscript.modify(v3, v1, KeyPath, v5);
  return sub_10004DCA8;
}

uint64_t sub_10004E6E8()
{
  return sub_10004F6D8(OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__blockedUntilDate, &qword_100091F48);
}

uint64_t sub_10004E6FC(uint64_t a1)
{
  return sub_10004F758(a1, &qword_100091F50, OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__blockedUntilDate, &qword_100091F48);
}

void (*sub_10004E718(_QWORD *a1))(uint64_t, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = sub_100025D1C(&qword_100091F50);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__blockedUntilDate[0];
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33, 0);
  v9 = sub_100025D1C(&qword_100091F48);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_10004DDA4;
}

uint64_t sub_10004E7E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[2];

  v4[0] = a1;
  v4[1] = a2;
  v2 = sub_100025D1C(&qword_100091F58);
  return Published.init(initialValue:)(v4, v2);
}

uint64_t sub_10004E824()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100061830);
  v2 = swift_getKeyPath(&unk_100061858);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

double sub_10004E894@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  double result;
  __int128 v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100061830);
  v5 = swift_getKeyPath(&unk_100061858);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  result = *(double *)&v7;
  *a2 = v7;
  return result;
}

uint64_t sub_10004E910(uint64_t *a1, void **a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t KeyPath;
  uint64_t v6;
  _QWORD v8[2];

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  KeyPath = swift_getKeyPath(&unk_100061830);
  v6 = swift_getKeyPath(&unk_100061858);
  v8[0] = v3;
  v8[1] = v2;
  swift_bridgeObjectRetain(v2);
  return static Published.subscript.setter(v8, v4, KeyPath, v6);
}

uint64_t sub_10004E98C(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t KeyPath;
  uint64_t v6;
  _QWORD v8[2];

  KeyPath = swift_getKeyPath(&unk_100061830);
  v6 = swift_getKeyPath(&unk_100061858);
  v8[0] = a1;
  v8[1] = a2;
  return static Published.subscript.setter(v8, v2, KeyPath, v6);
}

uint64_t (*sub_10004EA00(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t KeyPath;
  uint64_t v5;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  KeyPath = swift_getKeyPath(&unk_100061830);
  v3[4] = KeyPath;
  v5 = swift_getKeyPath(&unk_100061858);
  v3[5] = v5;
  v3[6] = static Published.subscript.modify(v3, v1, KeyPath, v5);
  return sub_10004DCA8;
}

uint64_t sub_10004EA78()
{
  return sub_10004F6D8(OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__promptText, &qword_100091F60);
}

uint64_t sub_10004EA8C(uint64_t a1)
{
  return sub_10004F758(a1, &qword_100091F68, OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__promptText, &qword_100091F60);
}

void (*sub_10004EAA8(_QWORD *a1))(uint64_t, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = sub_100025D1C(&qword_100091F68);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__promptText[0];
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33, 0);
  v9 = sub_100025D1C(&qword_100091F60);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_10004DDA4;
}

uint64_t sub_10004EB70(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a1;
  v3[1] = a2;
  return Published.init(initialValue:)(v3, &type metadata for String);
}

uint64_t sub_10004EB9C()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100061878);
  v2 = swift_getKeyPath(&unk_1000618A0);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_10004EC0C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100061878);
  v5 = swift_getKeyPath(&unk_1000618A0);
  static Published.subscript.getter(v8, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  v7 = v8[1];
  *a2 = v8[0];
  a2[1] = v7;
  return result;
}

uint64_t sub_10004EC88(uint64_t *a1, void **a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t KeyPath;
  uint64_t v6;
  _QWORD v8[2];

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  KeyPath = swift_getKeyPath(&unk_100061878);
  v6 = swift_getKeyPath(&unk_1000618A0);
  v8[0] = v3;
  v8[1] = v2;
  swift_bridgeObjectRetain(v2);
  return static Published.subscript.setter(v8, v4, KeyPath, v6);
}

uint64_t sub_10004ED04(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t KeyPath;
  uint64_t v6;
  _QWORD v8[2];

  KeyPath = swift_getKeyPath(&unk_100061878);
  v6 = swift_getKeyPath(&unk_1000618A0);
  v8[0] = a1;
  v8[1] = a2;
  return static Published.subscript.setter(v8, v2, KeyPath, v6);
}

uint64_t (*sub_10004ED78(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t KeyPath;
  uint64_t v5;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  KeyPath = swift_getKeyPath(&unk_100061878);
  v3[4] = KeyPath;
  v5 = swift_getKeyPath(&unk_1000618A0);
  v3[5] = v5;
  v3[6] = static Published.subscript.modify(v3, v1, KeyPath, v5);
  return sub_10004DCA8;
}

uint64_t sub_10004EDF0()
{
  return sub_10004F6D8(&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passwordFieldPlaceholder, &qword_100091F70);
}

uint64_t sub_10004EE04(uint64_t a1)
{
  return sub_10004F758(a1, &qword_100091F78, &OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passwordFieldPlaceholder, &qword_100091F70);
}

void (*sub_10004EE20(_QWORD *a1))(uint64_t, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = sub_100025D1C(&qword_100091F78);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passwordFieldPlaceholder;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33, 0);
  v9 = sub_100025D1C(&qword_100091F70);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_10004DDA4;
}

uint64_t sub_10004EEE8(uint64_t a1)
{
  uint64_t v2;

  v2 = a1;
  return Published.init(initialValue:)(&v2, &type metadata for Int);
}

uint64_t sub_10004EF14()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_1000618C0);
  v2 = swift_getKeyPath(&unk_1000618E8);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_10004EF84@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_1000618C0);
  v5 = swift_getKeyPath(&unk_1000618E8);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_10004F000(uint64_t *a1, void **a2)
{
  uint64_t v2;
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_1000618C0);
  v5 = swift_getKeyPath(&unk_1000618E8);
  v7 = v2;
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_10004F06C(uint64_t a1)
{
  void *v1;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v6;

  KeyPath = swift_getKeyPath(&unk_1000618C0);
  v4 = swift_getKeyPath(&unk_1000618E8);
  v6 = a1;
  return static Published.subscript.setter(&v6, v1, KeyPath, v4);
}

uint64_t (*sub_10004F0D4(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t KeyPath;
  uint64_t v5;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  KeyPath = swift_getKeyPath(&unk_1000618C0);
  v3[4] = KeyPath;
  v5 = swift_getKeyPath(&unk_1000618E8);
  v3[5] = v5;
  v3[6] = static Published.subscript.modify(v3, v1, KeyPath, v5);
  return sub_10004DCA8;
}

uint64_t sub_10004F14C()
{
  return sub_10004F6D8(OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__wrongBioAttempts, &qword_100091F80);
}

uint64_t sub_10004F160(uint64_t a1)
{
  return sub_10004F758(a1, &qword_100091F88, OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__wrongBioAttempts, &qword_100091F80);
}

void (*sub_10004F17C(_QWORD *a1))(uint64_t, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = sub_100025D1C(&qword_100091F88);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__wrongBioAttempts[0];
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33, 0);
  v9 = sub_100025D1C(&qword_100091F80);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_10004DDA4;
}

uint64_t sub_10004F244()
{
  return sub_10004F418((uint64_t)&unk_100061908, (uint64_t)&unk_100061930);
}

uint64_t sub_10004F258@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10004F494(a1, (uint64_t)&unk_100061908, (uint64_t)&unk_100061930, a2);
}

uint64_t sub_10004F26C(char *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_10004F520(a1, a2, a3, a4, (uint64_t)&unk_100061908, (uint64_t)&unk_100061930);
}

uint64_t sub_10004F280(char a1)
{
  return sub_10004F59C(a1, (uint64_t)&unk_100061908, (uint64_t)&unk_100061930);
}

uint64_t (*sub_10004F294(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t KeyPath;
  uint64_t v5;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  KeyPath = swift_getKeyPath(&unk_100061908);
  v3[4] = KeyPath;
  v5 = swift_getKeyPath(&unk_100061930);
  v3[5] = v5;
  v3[6] = static Published.subscript.modify(v3, v1, KeyPath, v5);
  return sub_10004DCA8;
}

uint64_t sub_10004F30C()
{
  return sub_10004F6D8(OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryRetryButton, &qword_100091F30);
}

uint64_t sub_10004F320(uint64_t a1)
{
  return sub_10004F758(a1, &qword_100091F38, OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryRetryButton, &qword_100091F30);
}

void (*sub_10004F33C(_QWORD *a1))(uint64_t, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = sub_100025D1C(&qword_100091F38);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryRetryButton[0];
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33, 0);
  v9 = sub_100025D1C(&qword_100091F30);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_10004DDA4;
}

uint64_t sub_10004F404()
{
  return sub_10004F418((uint64_t)&unk_100061950, (uint64_t)&unk_100061978);
}

uint64_t sub_10004F418(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  KeyPath = swift_getKeyPath(a1);
  v5 = swift_getKeyPath(a2);
  static Published.subscript.getter(&v7, v2, KeyPath, v5);
  swift_release(KeyPath);
  swift_release(v5);
  return v7;
}

uint64_t sub_10004F480@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10004F494(a1, (uint64_t)&unk_100061950, (uint64_t)&unk_100061978, a2);
}

uint64_t sub_10004F494@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, _BYTE *a4@<X8>)
{
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v6 = *a1;
  KeyPath = swift_getKeyPath(a2);
  v8 = swift_getKeyPath(a3);
  static Published.subscript.getter(&v10, v6, KeyPath, v8);
  swift_release(KeyPath);
  result = swift_release(v8);
  *a4 = v10;
  return result;
}

uint64_t sub_10004F50C(char *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_10004F520(a1, a2, a3, a4, (uint64_t)&unk_100061950, (uint64_t)&unk_100061978);
}

uint64_t sub_10004F520(char *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v7;
  void *v8;
  uint64_t KeyPath;
  uint64_t v10;
  char v12;

  v7 = *a1;
  v8 = *a2;
  KeyPath = swift_getKeyPath(a5);
  v10 = swift_getKeyPath(a6);
  v12 = v7;
  return static Published.subscript.setter(&v12, v8, KeyPath, v10);
}

uint64_t sub_10004F588(char a1)
{
  return sub_10004F59C(a1, (uint64_t)&unk_100061950, (uint64_t)&unk_100061978);
}

uint64_t sub_10004F59C(char a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t KeyPath;
  uint64_t v7;
  char v9;

  KeyPath = swift_getKeyPath(a2);
  v7 = swift_getKeyPath(a3);
  v9 = a1;
  return static Published.subscript.setter(&v9, v3, KeyPath, v7);
}

uint64_t (*sub_10004F600(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t KeyPath;
  uint64_t v5;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  KeyPath = swift_getKeyPath(&unk_100061950);
  v3[4] = KeyPath;
  v5 = swift_getKeyPath(&unk_100061978);
  v3[5] = v5;
  v3[6] = static Published.subscript.modify(v3, v1, KeyPath, v5);
  return sub_10004DCA8;
}

void sub_10004F678(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (void *)*a1;
  v2 = *(_QWORD *)(*a1 + 40);
  v3 = *(_QWORD *)(*a1 + 32);
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release(v2);
  swift_release(v3);
  free(v1);
}

uint64_t sub_10004F6C4()
{
  return sub_10004F6D8(&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showFallbackButton, &qword_100091F30);
}

uint64_t sub_10004F6D8(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  _BYTE v6[24];

  swift_beginAccess(v2 + *a1, v6, 33, 0);
  v4 = sub_100025D1C(a2);
  Published.projectedValue.getter(v4);
  return swift_endAccess(v6);
}

uint64_t sub_10004F73C(uint64_t a1)
{
  return sub_10004F758(a1, &qword_100091F38, &OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showFallbackButton, &qword_100091F30);
}

uint64_t sub_10004F758(uint64_t a1, uint64_t *a2, _QWORD *a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE v15[24];

  v8 = sub_100025D1C(a2);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  swift_beginAccess(v4 + *a3, v15, 33, 0);
  v12 = sub_100025D1C(a4);
  Published.projectedValue.setter(v11, v12);
  swift_endAccess(v15);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
}

void (*sub_10004F830(_QWORD *a1))(uint64_t, char)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = sub_100025D1C(&qword_100091F38);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showFallbackButton;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess(v1 + v8, v3, 33, 0);
  v9 = sub_100025D1C(&qword_100091F30);
  v3[16] = v9;
  Published.projectedValue.getter(v9);
  swift_endAccess(v3);
  return sub_10004DDA4;
}

void sub_10004F8F8(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = v3[15];
  v6 = v3[16];
  v7 = (void *)v3[13];
  v8 = (void *)v3[14];
  v10 = v3[11];
  v9 = (void *)v3[12];
  v11 = v3[9];
  v12 = v3[10];
  v13 = v11 + v5;
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess(v13, v3 + 3, 33, 0);
    Published.projectedValue.setter(v9, v6);
    swift_endAccess(v3 + 3);
    v14 = *(void (**)(void *, uint64_t))(v10 + 8);
    v14(v7, v12);
  }
  else
  {
    swift_beginAccess(v11 + v5, v3 + 6, 33, 0);
    Published.projectedValue.setter(v7, v6);
    swift_endAccess(v3 + 6);
    v14 = *(void (**)(void *, uint64_t))(v10 + 8);
  }
  v14(v8, v12);
  free(v8);
  free(v7);
  free(v9);
  free(v3);
}

double sub_10004FA10()
{
  return 0.15;
}

uint64_t sub_10004FA20()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad);
}

uint64_t sub_10004FA30()
{
  uint64_t v0;

  return swift_unknownObjectRetain(*(_QWORD *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_backoffCounter));
}

id sub_10004FA40()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration);
}

uint64_t sub_10004FA50()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_failureLimit);
}

uint64_t sub_10004FA68()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_failures;
  swift_beginAccess(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_failures, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_10004FAAC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_failures);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

uint64_t (*sub_10004FAF4(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_failures, a1, 33, 0);
  return j_j__swift_endAccess;
}

id sub_10004FB38()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
}

uint64_t sub_10004FB48()
{
  uint64_t v0;
  unsigned __int8 *v1;
  _BYTE v3[24];

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_expectsDismissOnIpad);
  swift_beginAccess(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_expectsDismissOnIpad, v3, 0, 0);
  return *v1;
}

uint64_t sub_10004FB8C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_expectsDismissOnIpad);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

uint64_t (*sub_10004FBD4(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_expectsDismissOnIpad, a1, 33, 0);
  return j__swift_endAccess;
}

uint64_t sub_10004FC18()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate;
  swift_beginAccess(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate, v3, 0, 0);
  return swift_unknownObjectWeakLoadStrong(v1);
}

uint64_t sub_10004FC60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[24];

  v3 = v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate;
  swift_beginAccess(v3, v5, 1, 0);
  swift_unknownObjectWeakAssign(v3, a1);
  return swift_unknownObjectRelease(a1);
}

void (*sub_10004FCB8(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess(v1 + v4, v3, 33, 0);
  v3[3] = swift_unknownObjectWeakLoadStrong(v5);
  return sub_1000355F4;
}

double sub_10004FD28()
{
  uint64_t v0;
  _BYTE *v1;
  double result;

  v1 = (_BYTE *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___cornerRadius);
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___cornerRadius + 8) & 1) == 0)
    return *(double *)v1;
  result = 0.0;
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad))
    result = 8.0;
  *(double *)v1 = result;
  v1[8] = 0;
  return result;
}

void sub_10004FD6C(double a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___cornerRadius;
  *(double *)v2 = a1;
  *(_BYTE *)(v2 + 8) = 0;
}

_QWORD *(*sub_10004FD84(uint64_t a1))(_QWORD *result)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 8) = v1;
  *(double *)a1 = sub_10004FD28();
  return sub_10004FDB8;
}

_QWORD *sub_10004FDB8(_QWORD *result)
{
  uint64_t v1;

  v1 = result[1] + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___cornerRadius;
  *(_QWORD *)v1 = *result;
  *(_BYTE *)(v1 + 8) = 0;
  return result;
}

double sub_10004FDD4()
{
  uint64_t v0;
  _BYTE *v1;
  double result;

  v1 = (_BYTE *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___backgroundOpacity);
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___backgroundOpacity + 8) & 1) == 0)
    return *(double *)v1;
  result = 0.8;
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad))
    result = 0.000001;
  *(double *)v1 = result;
  v1[8] = 0;
  return result;
}

void sub_10004FE20(double a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___backgroundOpacity;
  *(double *)v2 = a1;
  *(_BYTE *)(v2 + 8) = 0;
}

_QWORD *(*sub_10004FE38(uint64_t a1))(_QWORD *result)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 8) = v1;
  *(double *)a1 = sub_10004FDD4();
  return sub_10004FE6C;
}

_QWORD *sub_10004FE6C(_QWORD *result)
{
  uint64_t v1;

  v1 = result[1] + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___backgroundOpacity;
  *(_QWORD *)v1 = *result;
  *(_BYTE *)(v1 + 8) = 0;
  return result;
}

id sub_10004FE88()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
  objc_msgSend(v1, "canEvaluatePolicy:error:", 1, 0);
  return objc_msgSend(v1, "biometryType");
}

uint64_t sub_10004FED0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___biometrySubtitle);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___biometrySubtitle + 8);
  if (!v2)
  {
    v4 = *(void **)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
    objc_msgSend(v4, "canEvaluatePolicy:error:", 1, 0);
    v5 = objc_msgSend(v4, "biometryType");
    if (v5 == (id)1)
    {
      v6 = sub_10002545C();
    }
    else
    {
      if (v5 != (id)2)
      {
        v3 = 0;
        v8 = 0xE000000000000000;
        goto LABEL_9;
      }
      v6 = sub_1000253A8();
    }
    v3 = v6;
    v8 = v7;
LABEL_9:
    v9 = v1[1];
    *v1 = v3;
    v1[1] = v8;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRelease(v9);
    v2 = 0;
    goto LABEL_10;
  }
  v3 = *v1;
LABEL_10:
  swift_bridgeObjectRetain(v2);
  return v3;
}

uint64_t sub_10004FF9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___biometrySubtitle);
  v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___biometrySubtitle + 8);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease(v4);
}

uint64_t (*sub_10004FFB8(uint64_t *a1))(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;

  a1[2] = v1;
  *a1 = sub_10004FED0();
  a1[1] = v3;
  return sub_10004FFEC;
}

uint64_t sub_10004FFEC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v1 = a1[1];
  v2 = *a1;
  v3 = (_QWORD *)(a1[2] + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___biometrySubtitle);
  v4 = v3[1];
  *v3 = v2;
  v3[1] = v1;
  return swift_bridgeObjectRelease(v4);
}

uint64_t sub_10005000C()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  KeyPath = swift_getKeyPath(&unk_100061710);
  v2 = swift_getKeyPath(&unk_100061738);
  static Published.subscript.getter((uint64_t *)((char *)&v6 + 1), v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  if ((v6 & 0x100) != 0)
    return 1;
  v4 = swift_getKeyPath(&unk_100061758);
  v5 = swift_getKeyPath(&unk_100061780);
  static Published.subscript.getter(&v6, v0, v4, v5);
  swift_release(v4);
  swift_release(v5);
  return v6;
}

uint64_t sub_1000500D0()
{
  uint64_t v0;
  _BYTE *v1;
  id v2;
  uint64_t *v3;
  uint64_t result;

  v1 = (_BYTE *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___passwordType);
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___passwordType + 8) != 1)
    return *(_QWORD *)v1;
  v2 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration), "passcodeLength");
  if ((unint64_t)v2 + 1 > 7)
    v3 = (uint64_t *)&LACustomPasswordTypeAlphanumeric;
  else
    v3 = (uint64_t *)*(&off_10007CB78 + (_QWORD)v2 + 1);
  result = *v3;
  *(_QWORD *)v1 = *v3;
  v1[8] = 0;
  return result;
}

uint64_t sub_100050150(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___passwordType;
  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = 0;
  return result;
}

_QWORD *(*sub_100050168(uint64_t *a1))(_QWORD *result)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_1000500D0();
  return sub_10005019C;
}

_QWORD *sub_10005019C(_QWORD *result)
{
  uint64_t v1;

  v1 = result[1] + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___passwordType;
  *(_QWORD *)v1 = *result;
  *(_BYTE *)(v1 + 8) = 0;
  return result;
}

BOOL sub_1000501B8()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration), "style") == (id)1;
}

id sub_1000501E8()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration), "headerHidden");
}

uint64_t sub_100050210()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration), "title"));
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);

  return v2;
}

uint64_t sub_10005026C()
{
  return sub_100050288((SEL *)&selRef_cancelButtonTitle);
}

uint64_t sub_10005027C()
{
  return sub_100050288((SEL *)&selRef_subtitle);
}

uint64_t sub_100050288(SEL *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration), *a1));
  if (!v2)
    return 0;
  v3 = v2;
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v4;
}

id sub_1000502F4()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration), "passcodeLength");
}

id sub_10005030C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;

  v1 = v0;
  v2 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___appIcon;
  v3 = *(void **)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___appIcon);
  v4 = v3;
  if (v3 == (void *)1)
  {
    v5 = *(void **)(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration);
    v6 = objc_msgSend(v5, "iconPath");
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend((id)objc_opt_self(LACUIIcon), "imageForPath:", v6);
    }
    else
    {
      v9 = objc_msgSend(v5, "bundleIdentifier");
      if (!v9)
      {
        v13 = Logger.logObject.getter(0);
        v14 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v13, v14))
        {
          v15 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, v14, "The icon path and bundle identifier are nil", v15, 2u);
          swift_slowDealloc(v15, -1, -1);
        }

        v4 = objc_msgSend((id)objc_opt_self(LACUIIcon), "genericIcon");
        goto LABEL_7;
      }
      v7 = v9;
      v8 = objc_msgSend((id)objc_opt_self(LACUIIcon), "imageForBundleIdentifier:", v9);
    }
    v4 = v8;

LABEL_7:
    v10 = *(void **)(v1 + v2);
    *(_QWORD *)(v1 + v2) = v4;
    v11 = v4;
    sub_10004554C(v10);
  }
  sub_10004553C(v3);
  return v4;
}

void sub_1000504AC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___appIcon);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___appIcon) = a1;
  sub_10004554C(v2);
}

void (*sub_1000504C4(id *a1))(uint64_t a1, char a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_10005030C();
  return sub_1000504F8;
}

void sub_1000504F8(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(void **)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(void **)(v3 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___appIcon);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___appIcon) = *(_QWORD *)a1;
  if ((a2 & 1) != 0)
  {
    v5 = v2;
    sub_10004554C(v4);

  }
  else
  {
    sub_10004554C(v4);
  }
}

BOOL sub_100050558()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration), "mode") == 0;
}

uint64_t sub_100050588()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t KeyPath;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t result;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v1 = v0;
  v2 = type metadata accessor for Calendar(0);
  v39 = *(_QWORD *)(v2 - 8);
  v40 = v2;
  __chkstk_darwin(v2);
  v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DateComponents(0);
  v37 = *(_QWORD *)(v5 - 8);
  v38 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100025D1C(&qword_100091F40);
  __chkstk_darwin(v8);
  v10 = (uint64_t *)((char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v37 - v16;
  KeyPath = swift_getKeyPath(&unk_1000617E8);
  v19 = swift_getKeyPath(&unk_100061810);
  static Published.subscript.getter(v10, v1, KeyPath, v19);
  swift_release(KeyPath);
  swift_release(v19);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_10002BD8C((uint64_t)v10, &qword_100091F40);
    return 0;
  }
  v20 = (*(uint64_t (**)(char *, _QWORD *, uint64_t))(v12 + 32))(v17, v10, v11);
  static Calendar.current.getter(v20);
  v21 = sub_100025D1C(&qword_100091F98);
  v22 = type metadata accessor for Calendar.Component(0);
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(unsigned __int8 *)(v23 + 80);
  v25 = (v24 + 32) & ~v24;
  v26 = swift_allocObject(v21, v25 + *(_QWORD *)(v23 + 72), v24 | 7);
  *(_OWORD *)(v26 + 16) = xmmword_10005FF40;
  v27 = v26 + v25;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v23 + 104))(v27, enum case for Calendar.Component.minute(_:), v22);
  v28 = sub_10005436C(v26);
  swift_setDeallocating(v26);
  swift_arrayDestroy(v27, 1, v22);
  v29 = swift_deallocClassInstance(v26, 32, 7);
  Date.init()(v29);
  Calendar.dateComponents(_:from:to:)(v28, v15, v17);
  swift_bridgeObjectRelease(v28);
  v30 = *(void (**)(char *, uint64_t))(v12 + 8);
  v30(v15, v11);
  v31 = (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v4, v40);
  v32 = DateComponents.minute.getter(v31);
  v34 = v33;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v7, v38);
  if ((v34 & 1) != 0 || v32 < 0)
  {
    v30(v17, v11);
    return 0;
  }
  result = v32 + 1;
  if (!__OFADD__(v32, 1))
  {
    v36 = sub_10002569C(result);
    v30(v17, v11);
    return v36;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000508AC()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 == (id)1)
    return sub_100025008();
  if (v1)
    return sub_100024F4C();
  return sub_1000250C4();
}

char *sub_100050920(void *a1, void *a2, void *a3, uint64_t a4, char a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  objc_class *v10;
  int v17;
  id v18;

  v17 = a5 & 1;
  v18 = objc_allocWithZone(v10);
  return sub_1000509B8(a1, a2, a3, a4, v17, a6, a7, a8, a9, a10);
}

char *sub_1000509B8(void *a1, void *a2, void *a3, uint64_t a4, int a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t *v41;
  _QWORD *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  char *v55;
  id v56;
  id v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  id v61;
  Class isa;
  id v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  void *v71;
  char *v72;
  id v73;
  id v74;
  _QWORD *v75;
  uint64_t KeyPath;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  _QWORD *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  unsigned __int8 v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  id v98;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  objc_class *ObjectType;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  void **aBlock;
  uint64_t v122;
  void (*v123)(uint64_t, void *);
  void *v124;
  uint64_t (*v125)(uint64_t);
  uint64_t v126;
  objc_super v127;
  _QWORD v128[3];

  v102 = a8;
  v103 = a7;
  v101 = a6;
  LODWORD(v117) = a5;
  v115 = a1;
  v116 = a4;
  v114 = a2;
  v119 = a10;
  v120 = a3;
  v118 = a9;
  ObjectType = (objc_class *)swift_getObjectType(v10);
  v11 = sub_100025D1C(&qword_100091F80);
  v112 = *(_QWORD *)(v11 - 8);
  v113 = v11;
  __chkstk_darwin(v11);
  v111 = (char *)&v100 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = sub_100025D1C(&qword_100091F60);
  v109 = *(_QWORD *)(v110 - 8);
  __chkstk_darwin(v110);
  v108 = (char *)&v100 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = sub_100025D1C(&qword_100091F48);
  v106 = *(_QWORD *)(v107 - 8);
  __chkstk_darwin(v107);
  v15 = (char *)&v100 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = sub_100025D1C(&qword_100091F40);
  v16 = __chkstk_darwin(v105);
  v18 = (char *)&v100 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v20 = (char *)&v100 - v19;
  v21 = sub_100025D1C(&qword_100091F30);
  v22 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v24 = (char *)&v100 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = &v10[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showAuthorizationView];
  LOBYTE(aBlock) = 0;
  v26 = v10;
  Published.init(initialValue:)(&aBlock, &type metadata for Bool);
  v27 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
  v27(v25, v24, v21);
  v28 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryIntentButton];
  LOBYTE(aBlock) = 0;
  Published.init(initialValue:)(&aBlock, &type metadata for Bool);
  v27(v28, v24, v21);
  v29 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowCustomPasswordView];
  LOBYTE(aBlock) = 0;
  Published.init(initialValue:)(&aBlock, &type metadata for Bool);
  v27(v29, v24, v21);
  v30 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowDevicePasscodeView];
  LOBYTE(aBlock) = 0;
  Published.init(initialValue:)(&aBlock, &type metadata for Bool);
  v27(v30, v24, v21);
  v31 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passcodeFocused];
  LOBYTE(aBlock) = 0;
  Published.init(initialValue:)(&aBlock, &type metadata for Bool);
  v27(v31, v24, v21);
  v32 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__blockedUntilDate];
  v33 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v20, 1, 1, v33);
  sub_100027F28((uint64_t)v20, (uint64_t)v18, &qword_100091F40);
  Published.init(initialValue:)(v18, v105);
  sub_10002BD8C((uint64_t)v20, &qword_100091F40);
  (*(void (**)(char *, char *, uint64_t))(v106 + 32))(v32, v15, v107);
  v34 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__promptText];
  aBlock = 0;
  v122 = 0;
  v35 = sub_100025D1C(&qword_100091F58);
  v36 = v108;
  Published.init(initialValue:)(&aBlock, v35);
  (*(void (**)(char *, char *, uint64_t))(v109 + 32))(v34, v36, v110);
  v37 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__wrongBioAttempts];
  aBlock = 0;
  v38 = v111;
  Published.init(initialValue:)(&aBlock, &type metadata for Int);
  (*(void (**)(char *, char *, uint64_t))(v112 + 32))(v37, v38, v113);
  v39 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryRetryButton];
  LOBYTE(aBlock) = 0;
  Published.init(initialValue:)(&aBlock, &type metadata for Bool);
  v27(v39, v24, v21);
  v40 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showFallbackButton];
  LOBYTE(aBlock) = 0;
  Published.init(initialValue:)(&aBlock, &type metadata for Bool);
  v27(v40, v24, v21);
  v41 = (uint64_t *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion];
  *v41 = 0;
  v41[1] = 0;
  *(_QWORD *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_dismissAnimationDuration] = 0x3FC3333333333333;
  v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_dismissed] = 0;
  v42 = sub_1000419B8();
  sub_1000419D0(*v42);
  v43 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad;
  sub_1000287F0(0, &qword_100091F90, UIDevice_ptr);
  v26[v43] = sub_1000557C4();
  *(_QWORD *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_failures] = 0;
  v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_expectsDismissOnIpad] = 0;
  swift_unknownObjectWeakInit(&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate], 0);
  v44 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___cornerRadius];
  *(_QWORD *)v44 = 0;
  v44[8] = 1;
  v45 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___backgroundOpacity];
  *(_QWORD *)v45 = 0;
  v45[8] = 1;
  v46 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___biometrySubtitle];
  *(_QWORD *)v46 = 0;
  *((_QWORD *)v46 + 1) = 0;
  v47 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___passwordType];
  *(_QWORD *)v47 = 0;
  v47[8] = 1;
  *(_QWORD *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___appIcon] = 1;
  v48 = *v41;
  v49 = v41[1];
  v50 = v118;
  v51 = v119;
  *v41 = v118;
  v41[1] = v51;
  sub_100027180(v50, v51);
  sub_100027EB8(v48, v49);
  v52 = v120;
  *(_QWORD *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_backoffCounter] = v120;
  v53 = v114;
  v54 = v115;
  *(_QWORD *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_cachedContext] = v114;
  *(_QWORD *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration] = v54;
  v55 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_failureLimit];
  *(_QWORD *)v55 = v116;
  v55[8] = v117 & 1;
  v117 = v53;
  swift_unknownObjectRetain(v52);
  v56 = v54;
  v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_fallbackMethod] = sub_10002E4E8((unint64_t)objc_msgSend(v56, "requirement"));
  v57 = objc_msgSend(v56, "contextData");
  v58 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v60 = v59;

  v61 = objc_allocWithZone((Class)LAContext);
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100028234(v58, v60);
  v63 = objc_msgSend(v61, "initWithExternalizedContext:", isa);

  if (!v63)
  {
    __break(1u);
    JUMPOUT(0x100051490);
  }
  *(_QWORD *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context] = v63;
  *(_QWORD *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_policy] = v101;
  v64 = v103;
  *(_QWORD *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_userId] = v103;
  *(_QWORD *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_options] = v102;
  v65 = v64;
  v66 = objc_msgSend(v56, "passwordFieldPlaceholder");
  v67 = static String._unconditionallyBridgeFromObjectiveC(_:)(v66);
  v69 = v68;

  swift_beginAccess(&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passwordFieldPlaceholder], &aBlock, 33, 0);
  v128[0] = v67;
  v128[1] = v69;
  Published.init(initialValue:)(v128, &type metadata for String);
  swift_endAccess(&aBlock);

  v127.receiver = v26;
  v127.super_class = ObjectType;
  v70 = (char *)objc_msgSendSuper2(&v127, "init");
  v71 = *(void **)&v70[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration];
  v72 = v70;
  switch((unint64_t)objc_msgSend(v71, "requirement"))
  {
    case 1uLL:
    case 5uLL:
      goto LABEL_10;
    case 2uLL:
      KeyPath = swift_getKeyPath(&unk_100061710);
      v77 = swift_getKeyPath(&unk_100061738);
      LOBYTE(aBlock) = 0;
      v78 = v72;
      static Published.subscript.setter(&aBlock, v78, KeyPath, v77);
      v79 = swift_getKeyPath(&unk_100061758);
      v80 = swift_getKeyPath(&unk_100061780);
      LOBYTE(aBlock) = 1;
      static Published.subscript.setter(&aBlock, v78, v79, v80);
      v81 = objc_msgSend((id)objc_opt_self(Passcode), "currentPasscode");
      v82 = objc_msgSend(v81, "type");

      if ((unint64_t)v82 > 3)
        v83 = &LACustomPasswordTypeAlphanumeric;
      else
        v83 = *(&off_10007CBB8 + (_QWORD)v82);
      objc_msgSend(v71, "setPasscodeLength:", *v83);
      break;
    case 3uLL:
      v84 = swift_getKeyPath(&unk_100061710);
      v85 = swift_getKeyPath(&unk_100061738);
      LOBYTE(aBlock) = 1;
      v86 = v72;
      static Published.subscript.setter(&aBlock, v86, v84, v85);
      v87 = swift_getKeyPath(&unk_100061758);
      v88 = swift_getKeyPath(&unk_100061780);
      LOBYTE(aBlock) = 0;
      v89 = v86;
      v90 = v87;
      v91 = v88;
      goto LABEL_14;
    case 4uLL:
    case 6uLL:
      v73 = objc_msgSend((id)objc_opt_self(Passcode), "currentPasscode");
      v74 = objc_msgSend(v73, "type");

      if ((unint64_t)v74 > 3)
        v75 = &LACustomPasswordTypeAlphanumeric;
      else
        v75 = *(&off_10007CBB8 + (_QWORD)v74);
      objc_msgSend(v71, "setPasscodeLength:", *v75);
LABEL_10:
      v92 = *(void **)&v72[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context];
      objc_msgSend(v92, "canEvaluatePolicy:error:", 1, 0);
      if (objc_msgSend(v92, "biometryType") == (id)2)
        v93 = objc_msgSend(v71, "requiresIntent");
      else
        v93 = 0;
      v94 = swift_getKeyPath(&unk_1000616C8);
      v95 = swift_getKeyPath(&unk_1000616F0);
      LOBYTE(aBlock) = v93;
      v89 = v72;
      v90 = v94;
      v91 = v95;
LABEL_14:
      static Published.subscript.setter(&aBlock, v89, v90, v91);
      break;
    default:
      break;
  }
  sub_1000514A8(0);
  v96 = swift_allocObject(&unk_10007C718, 24, 7);
  swift_unknownObjectWeakInit(v96 + 16, v72);
  v125 = sub_1000545F8;
  v126 = v96;
  aBlock = _NSConcreteStackBlock;
  v122 = 1107296256;
  v123 = sub_10002AD04;
  v124 = &unk_10007C730;
  v97 = _Block_copy(&aBlock);
  swift_release(v126);
  v98 = v120;
  objc_msgSend(v120, "currentBackoffErrorWithReply:", v97);
  sub_100027EB8(v118, v119);

  swift_unknownObjectRelease(v98);
  _Block_release(v97);
  return v72;
}

uint64_t sub_1000514A8(char a1)
{
  char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t KeyPath;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;

  v2 = v1;
  if ((a1 & 1) != 0)
  {
    v3 = sub_1000255D8();
LABEL_3:
    v5 = v3;
    v6 = v4;
LABEL_21:
    KeyPath = swift_getKeyPath(&unk_100061830);
    v28 = swift_getKeyPath(&unk_100061858);
    v41 = v5;
    v42 = v6;
    v29 = v2;
    v30 = KeyPath;
    v31 = v28;
    return static Published.subscript.setter(&v41, v29, v30, v31);
  }
  v7 = *(void **)&v1[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration];
  if (objc_msgSend(v7, "mode"))
    goto LABEL_5;
  v11 = objc_msgSend(v7, "prompt");
  if (v11)
  {
    v12 = v11;
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    v15 = v14;

    swift_bridgeObjectRelease(v15);
    v16 = HIBYTE(v15) & 0xF;
    if ((v15 & 0x2000000000000000) == 0)
      v16 = v13 & 0xFFFFFFFFFFFFLL;
    if (v16)
      goto LABEL_5;
  }
  if (*((_BYTE *)v2 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_fallbackMethod) == 2)
    goto LABEL_5;
  LOBYTE(v41) = *((_BYTE *)v2 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_fallbackMethod);
  v40 = 1;
  sub_10002E648();
  if ((dispatch thunk of static Equatable.== infix(_:_:)(&v41, &v40) & 1) == 0)
    goto LABEL_5;
  v17 = swift_getKeyPath(&unk_100061710);
  v18 = swift_getKeyPath(&unk_100061738);
  static Published.subscript.getter(&v41, v2, v17, v18);
  swift_release(v17);
  swift_release(v18);
  if ((v41 & 1) == 0)
  {
    v19 = swift_getKeyPath(&unk_100061758);
    v20 = swift_getKeyPath(&unk_100061780);
    static Published.subscript.getter(&v41, v2, v19, v20);
    swift_release(v19);
    swift_release(v20);
    if (v41 != 1)
    {
LABEL_5:
      v8 = objc_msgSend(v7, "prompt");
      if (v8)
      {
        v9 = v8;
        v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
        v6 = v10;

      }
      else
      {
        v5 = 0;
        v6 = 0;
      }
      goto LABEL_21;
    }
  }
  v21 = sub_1000500D0();
  v22 = LACustomPasswordTypeFourDigits;
  v23 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v24 = objc_msgSend(v23, "userInterfaceIdiom");

  if (v22 == v21 || LACustomPasswordTypeSixDigits == v21)
  {
    if (v24 == (id)1)
    {
      v3 = sub_100025008();
    }
    else if (v24)
    {
      v3 = sub_100024F4C();
    }
    else
    {
      v3 = sub_1000250C4();
    }
    goto LABEL_3;
  }
  if (v24 == (id)1)
  {
    v25 = sub_100025008();
  }
  else if (v24)
  {
    v25 = sub_100024F4C();
  }
  else
  {
    v25 = sub_1000250C4();
  }
  v33 = v25;
  v34 = v26;
  v35 = swift_getKeyPath(&unk_100061878);
  v36 = swift_getKeyPath(&unk_1000618A0);
  v41 = v33;
  v42 = v34;
  v37 = v2;
  static Published.subscript.setter(&v41, v37, v35, v36);
  v38 = swift_getKeyPath(&unk_100061830);
  v39 = swift_getKeyPath(&unk_100061858);
  v41 = 0;
  v42 = 0;
  v29 = v37;
  v30 = v38;
  v31 = v39;
  return static Published.subscript.setter(&v41, v29, v30, v31);
}

uint64_t sub_1000517E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *Strong;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD aBlock[5];
  uint64_t v28;
  char v29[24];

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  result = __chkstk_darwin(v8);
  v12 = (char *)&aBlock[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v13 = a2 + 16;
    sub_1000287F0(0, (unint64_t *)&qword_100091FA0, OS_dispatch_queue_ptr);
    v14 = swift_errorRetain(a1);
    v15 = static OS_dispatch_queue.main.getter(v14);
    v26 = v5;
    v16 = (void *)v15;
    v17 = swift_allocObject(&unk_10007C718, 24, 7);
    swift_beginAccess(v13, v29, 0, 0);
    Strong = (void *)swift_unknownObjectWeakLoadStrong(v13);
    swift_unknownObjectWeakInit(v17 + 16, Strong);

    v19 = swift_allocObject(&unk_10007CB38, 32, 7);
    *(_QWORD *)(v19 + 16) = v17;
    *(_QWORD *)(v19 + 24) = a1;
    aBlock[4] = sub_100055700;
    v28 = v19;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100027144;
    aBlock[3] = &unk_10007CB50;
    v20 = _Block_copy(aBlock);
    v21 = v28;
    swift_errorRetain(a1);
    v22 = swift_release(v21);
    static DispatchQoS.unspecified.getter(v22);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v23 = sub_10002C054((unint64_t *)&qword_1000915D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v24 = sub_100025D1C((uint64_t *)&unk_100091FB0);
    v25 = sub_10002C094();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v24, v25, v4, v23);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v7, v20);
    _Block_release(v20);

    swift_errorRelease(a1);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  return result;
}

uint64_t sub_100051A48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[5];
  uint64_t v24;

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v22 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000287F0(0, (unint64_t *)&qword_100091FA0, OS_dispatch_queue_ptr);
  v11 = (void *)static OS_dispatch_queue.main.getter();
  v12 = swift_allocObject(&unk_10007C718, 24, 7);
  swift_unknownObjectWeakInit(v12 + 16, v2);
  v13 = swift_allocObject(&unk_10007C768, 32, 7);
  *(_QWORD *)(v13 + 16) = v12;
  *(_QWORD *)(v13 + 24) = a1;
  aBlock[4] = sub_10005461C;
  v24 = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100027144;
  aBlock[3] = &unk_10007C780;
  v14 = _Block_copy(aBlock);
  v15 = v24;
  swift_errorRetain(a1);
  v16 = swift_release(v15);
  static DispatchQoS.unspecified.getter(v16);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v17 = sub_10002C054((unint64_t *)&qword_1000915D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v18 = sub_100025D1C((uint64_t *)&unk_100091FB0);
  v19 = sub_10002C094();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v18, v19, v4, v17);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v6, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_100051C70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void **aBlock;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  uint64_t (*v32)();
  _QWORD *v33;

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  result = __chkstk_darwin(v8);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(a2 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_dismissed) & 1) == 0)
  {
    *(_BYTE *)(a2 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_dismissed) = 1;
    v13 = *(_BYTE *)(a2 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad);
    v14 = sub_1000287F0(0, (unint64_t *)&qword_100091FA0, OS_dispatch_queue_ptr);
    v27 = static OS_dispatch_queue.main.getter(v14);
    v15 = swift_allocObject(&unk_10007C718, 24, 7);
    swift_unknownObjectWeakInit(v15 + 16, a2);
    if ((v13 & 1) != 0)
    {
      v16 = (_QWORD *)swift_allocObject(&unk_10007CA48, 48, 7);
      v16[2] = v15;
      v16[3] = a1;
      v16[4] = nullsub_12;
      v16[5] = 0;
      v32 = sub_10005575C;
      v33 = v16;
      aBlock = _NSConcreteStackBlock;
      v29 = 1107296256;
      v17 = &unk_10007CA60;
    }
    else
    {
      v18 = (_QWORD *)swift_allocObject(&unk_10007C9F8, 56, 7);
      v18[2] = 0x3FC3333333333333;
      v18[3] = v15;
      v18[4] = a1;
      v18[5] = nullsub_12;
      v18[6] = 0;
      v32 = sub_100054628;
      v33 = v18;
      aBlock = _NSConcreteStackBlock;
      v29 = 1107296256;
      v17 = &unk_10007CA10;
    }
    v30 = sub_100027144;
    v31 = v17;
    v19 = _Block_copy(&aBlock);
    v20 = v33;
    swift_errorRetain(a1);
    v21 = swift_release(v20);
    static DispatchQoS.unspecified.getter(v21);
    aBlock = (void **)&_swiftEmptyArrayStorage;
    v22 = sub_10002C054((unint64_t *)&qword_1000915D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v23 = sub_100025D1C((uint64_t *)&unk_100091FB0);
    v24 = sub_10002C094();
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v23, v24, v4, v22);
    v25 = (void *)v27;
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v7, v19);
    _Block_release(v19);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  return result;
}

uint64_t sub_100051F28(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void **aBlock;
  uint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  uint64_t (*v39)();
  _QWORD *v40;

  v4 = v3;
  v8 = type metadata accessor for DispatchWorkItemFlags(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for DispatchQoS(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_dismissed) & 1) != 0)
    return a2(v14);
  v33 = v9;
  v34 = v14;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_dismissed) = 1;
  v18 = *(unsigned __int8 *)(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad);
  v19 = sub_1000287F0(0, (unint64_t *)&qword_100091FA0, OS_dispatch_queue_ptr);
  v32 = static OS_dispatch_queue.main.getter(v19);
  v20 = swift_allocObject(&unk_10007C718, 24, 7);
  swift_unknownObjectWeakInit(v20 + 16, v4);
  if (v18 == 1)
  {
    v21 = (_QWORD *)swift_allocObject(&unk_10007C808, 48, 7);
    v21[2] = v20;
    v21[3] = a1;
    v21[4] = a2;
    v21[5] = a3;
    v39 = sub_100054630;
    v40 = v21;
    aBlock = _NSConcreteStackBlock;
    v36 = 1107296256;
    v22 = &unk_10007C820;
  }
  else
  {
    v23 = (_QWORD *)swift_allocObject(&unk_10007C7B8, 56, 7);
    v23[2] = 0x3FC3333333333333;
    v23[3] = v20;
    v23[4] = a1;
    v23[5] = a2;
    v23[6] = a3;
    v39 = sub_100054628;
    v40 = v23;
    aBlock = _NSConcreteStackBlock;
    v36 = 1107296256;
    v22 = &unk_10007C7D0;
  }
  v37 = sub_100027144;
  v38 = v22;
  v24 = _Block_copy(&aBlock);
  v25 = v40;
  swift_errorRetain(a1);
  swift_retain(a3);
  v26 = swift_release(v25);
  static DispatchQoS.unspecified.getter(v26);
  aBlock = (void **)&_swiftEmptyArrayStorage;
  v27 = sub_10002C054((unint64_t *)&qword_1000915D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v28 = sub_100025D1C((uint64_t *)&unk_100091FB0);
  v29 = sub_10002C094();
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v28, v29, v8, v27);
  v30 = (void *)v32;
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v16, v11, v24);
  _Block_release(v24);

  (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, v34);
}

uint64_t sub_1000521F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BYTE *v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  _BYTE v22[24];
  _BYTE v23[24];
  _BYTE v24[24];

  v5 = a1 + 16;
  swift_beginAccess(a1 + 16, v24, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = Strong;
    KeyPath = swift_getKeyPath(&unk_1000617A0);
    v9 = swift_getKeyPath(&unk_1000617C8);
    v23[0] = 0;
    static Published.subscript.setter(v23, v7, KeyPath, v9);
  }
  swift_beginAccess(v5, v23, 0, 0);
  v10 = swift_unknownObjectWeakLoadStrong(v5);
  if (v10)
  {
    v11 = (void *)v10;
    v12 = (_BYTE *)(v10 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_expectsDismissOnIpad);
    swift_beginAccess(v10 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_expectsDismissOnIpad, v22, 1, 0);
    *v12 = 1;

  }
  swift_beginAccess(v5, &v21, 0, 0);
  v13 = swift_unknownObjectWeakLoadStrong(v5);
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (uint64_t *)(v13 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
    v16 = *(void (**)(uint64_t))(v13 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
    if (v16)
    {
      v17 = v15[1];
      swift_retain(v17);
      v16(a2);
      sub_100027EB8((uint64_t)v16, v17);
      v18 = *v15;
      v19 = v15[1];
      *v15 = 0;
      v15[1] = 0;
      sub_100027EB8(v18, v19);
    }

  }
  return a3();
}

uint64_t sub_100052358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *Strong;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD aBlock[5];
  _QWORD *v55;
  char v56[32];
  char v57[32];

  v48 = a4;
  v47 = a3;
  v46 = a2;
  v50 = type metadata accessor for DispatchWorkItemFlags(0);
  v53 = *(_QWORD *)(v50 - 8);
  __chkstk_darwin(v50);
  v49 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v51 = *(_QWORD *)(v8 - 8);
  v52 = v8;
  __chkstk_darwin(v8);
  v45 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchTime(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v44 - v16;
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&v44 - v19;
  v21 = a1 + 16;
  v22 = static Animation.easeIn(duration:)(v18, a5);
  v23 = swift_allocObject(&unk_10007C718, 24, 7);
  swift_beginAccess(v21, v57, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v21);
  swift_unknownObjectWeakInit(v23 + 16, Strong);

  v25 = sub_100025D1C((uint64_t *)&unk_1000920D0);
  withAnimation<A>(_:_:)(v22, sub_100055574, v23, v25);
  swift_release(v22);
  swift_release(v23);
  v26 = sub_1000287F0(0, (unint64_t *)&qword_100091FA0, OS_dispatch_queue_ptr);
  v27 = (void *)static OS_dispatch_queue.main.getter(v26);
  static DispatchTime.now()();
  + infix(_:_:)(v14, a5);
  v28 = *(void (**)(char *, uint64_t))(v11 + 8);
  v28(v14, v10);
  + infix(_:_:)(v17, 0.4);
  v28(v17, v10);
  v29 = swift_allocObject(&unk_10007C718, 24, 7);
  swift_beginAccess(v21, v56, 0, 0);
  v30 = (void *)swift_unknownObjectWeakLoadStrong(v21);
  swift_unknownObjectWeakInit(v29 + 16, v30);

  v31 = (_QWORD *)swift_allocObject(&unk_10007CA98, 48, 7);
  v32 = v46;
  v31[2] = v29;
  v31[3] = v32;
  v33 = v48;
  v31[4] = v47;
  v31[5] = v33;
  aBlock[4] = sub_100055648;
  v55 = v31;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100027144;
  aBlock[3] = &unk_10007CAB0;
  v34 = _Block_copy(aBlock);
  v35 = v55;
  swift_errorRetain(v32);
  swift_retain(v33);
  v36 = swift_release(v35);
  v37 = v45;
  static DispatchQoS.unspecified.getter(v36);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v38 = sub_10002C054((unint64_t *)&qword_1000915D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v39 = sub_100025D1C((uint64_t *)&unk_100091FB0);
  v40 = sub_10002C094();
  v42 = v49;
  v41 = v50;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v39, v40, v50, v38);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v20, v37, v42, v34);
  _Block_release(v34);

  (*(void (**)(char *, uint64_t))(v53 + 8))(v42, v41);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v37, v52);
  return ((uint64_t (*)(char *, uint64_t))v28)(v20, v10);
}

id sub_100052754(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t KeyPath;
  uint64_t v11;
  void *v12;
  id v13;
  id result;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSString v22;
  void *v23;
  uint64_t v24;
  _QWORD aBlock[5];
  uint64_t v26;
  char v27[24];

  ObjectType = swift_getObjectType(v4);
  KeyPath = swift_getKeyPath(&unk_100061758);
  v11 = swift_getKeyPath(&unk_100061780);
  static Published.subscript.getter(aBlock, v4, KeyPath, v11);
  swift_release(KeyPath);
  swift_release(v11);
  if (LOBYTE(aBlock[0]) == 1)
  {
    v12 = *(void **)(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_cachedContext);
    if (v12 && (v13 = objc_msgSend(v12, "externalizedContext")) != 0
      || (result = objc_msgSend(*(id *)(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context), "externalizedContext"), (v13 = result) != 0))
    {
      v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v13);
      v17 = v16;

      sub_10002C138(a1, a2, v15, v17, *(void **)(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_userId), *(_QWORD *)(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_policy), *(_QWORD *)(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_options), a3, a4, ObjectType, (uint64_t)&off_10007C910);
      return (id)sub_100028234(v15, v17);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    v18 = swift_getKeyPath(&unk_100061710);
    v19 = swift_getKeyPath(&unk_100061738);
    static Published.subscript.getter(aBlock, v4, v18, v19);
    swift_release(v18);
    swift_release(v19);
    if (LOBYTE(aBlock[0]) == 1)
    {
      v20 = v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate;
      swift_beginAccess(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate, v27, 0, 0);
      result = (id)swift_unknownObjectWeakLoadStrong(v20);
      if (result)
      {
        v21 = result;
        if ((objc_msgSend(result, "respondsToSelector:", "viewModel:didReceiveCustomPassword:handler:") & 1) != 0)
        {
          v22 = String._bridgeToObjectiveC()();
          aBlock[4] = a3;
          v26 = a4;
          aBlock[0] = _NSConcreteStackBlock;
          aBlock[1] = 1107296256;
          aBlock[2] = sub_100052A04;
          aBlock[3] = &unk_10007C848;
          v23 = _Block_copy(aBlock);
          swift_retain(a4);
          objc_msgSend(v21, "viewModel:didReceiveCustomPassword:handler:", v4, v22, v23);
          _Block_release(v23);

          v24 = v26;
          swift_unknownObjectRelease(v21);
          return (id)swift_release(v24);
        }
        else
        {
          return (id)swift_unknownObjectRelease(v21);
        }
      }
    }
    else
    {
      return (id)((uint64_t (*)(_QWORD))a3)(0);
    }
  }
  return result;
}

uint64_t sub_100052A04(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

id sub_100052A40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v1 = static Animation.default.getter();
  withAnimation<A>(_:_:)(v1, sub_10005463C, &v3, (char *)&type metadata for () + 8);
  swift_release(v1);
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context), "retryProcessedEvent:reply:", 7, 0);
}

uint64_t sub_100052ABC(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD aBlock[5];
  uint64_t v37;

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v34 = *(_QWORD *)(v8 - 8);
  v35 = v8;
  __chkstk_darwin(v8);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchTime(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v33 - v16;
  if ((a1 & 1) != 0)
  {
    v18 = static Animation.linear(duration:)(0.05);
    v19 = __chkstk_darwin(v18);
    *(&v33 - 2) = v2;
    withAnimation<A>(_:_:)(v19, sub_1000547A8, &v33 - 4, (char *)&type metadata for () + 8);
    return swift_release(v18);
  }
  else
  {
    v21 = *(void **)(v2 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
    objc_msgSend(v21, "canEvaluatePolicy:error:", 1, 0);
    if (objc_msgSend(v21, "biometryType") == (id)2)
      v22 = 1.0;
    else
      v22 = 0.0;
    v23 = sub_1000287F0(0, (unint64_t *)&qword_100091FA0, OS_dispatch_queue_ptr);
    v24 = static OS_dispatch_queue.main.getter(v23);
    v33 = v5;
    v25 = (void *)v24;
    static DispatchTime.now()();
    + infix(_:_:)(v15, v22);
    v26 = *(void (**)(char *, uint64_t))(v12 + 8);
    v26(v15, v11);
    v27 = swift_allocObject(&unk_10007C718, 24, 7);
    swift_unknownObjectWeakInit(v27 + 16, v2);
    aBlock[4] = sub_1000546EC;
    v37 = v27;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100027144;
    aBlock[3] = &unk_10007C870;
    v28 = _Block_copy(aBlock);
    v29 = swift_release(v37);
    static DispatchQoS.unspecified.getter(v29);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v30 = sub_10002C054((unint64_t *)&qword_1000915D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v31 = sub_100025D1C((uint64_t *)&unk_100091FB0);
    v32 = sub_10002C094();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v31, v32, v4, v30);
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v17, v10, v7, v28);
    _Block_release(v28);

    (*(void (**)(char *, uint64_t))(v33 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v35);
    return ((uint64_t (*)(char *, uint64_t))v26)(v17, v11);
  }
}

uint64_t sub_100052DF4()
{
  unsigned __int8 *v0;
  int v1;
  uint64_t KeyPath;
  uint64_t v3;
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  char *v8;
  char v10;
  char v11;
  char v12;
  char v13;

  v1 = v0[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_fallbackMethod];
  if (v1 == 2)
  {
    KeyPath = swift_getKeyPath(&unk_100061710);
    v3 = swift_getKeyPath(&unk_100061738);
    v13 = 0;
    v4 = v0;
    static Published.subscript.setter(&v13, v4, KeyPath, v3);
    v5 = swift_getKeyPath(&unk_100061758);
    v6 = swift_getKeyPath(&unk_100061780);
    v12 = 0;
    v7 = v4;
    v8 = &v12;
  }
  else if ((v1 & 1) != 0)
  {
    v5 = swift_getKeyPath(&unk_100061758);
    v6 = swift_getKeyPath(&unk_100061780);
    v11 = 1;
    v7 = v0;
    v8 = &v11;
  }
  else
  {
    v5 = swift_getKeyPath(&unk_100061710);
    v6 = swift_getKeyPath(&unk_100061738);
    v10 = 1;
    v7 = v0;
    v8 = &v10;
  }
  return static Published.subscript.setter(v8, v7, v5, v6);
}

uint64_t sub_100052F20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t Strong;
  uint64_t v22;
  uint64_t KeyPath;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  int v33;
  void (*v34)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  char *v36;
  uint64_t v37;
  void *v38;
  char v39;
  uint64_t v40;
  char *v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v73;
  void (*v74)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v75;
  uint64_t v76;
  __int128 aBlock;
  __int128 v78;
  uint64_t (*v79)();
  uint64_t v80;
  _BYTE v81[24];
  _BYTE v82[24];
  char v83[24];
  char v84[32];

  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v7 = (char *)&v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100025D1C(&qword_100091F40);
  v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v75 = (uint64_t)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v76 = (uint64_t)&v73 - v11;
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v73 - v13;
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v73 - v16;
  __chkstk_darwin(v15);
  v19 = (char *)&v73 - v18;
  v20 = a1 + 16;
  swift_beginAccess(a1 + 16, v84, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a1 + 16);
  if (Strong)
  {
    v22 = Strong;
    KeyPath = swift_getKeyPath(&unk_1000617A0);
    v24 = swift_getKeyPath(&unk_1000617C8);
    LOBYTE(aBlock) = 0;
    static Published.subscript.setter(&aBlock, v22, KeyPath, v24);
  }
  v73 = a2;
  v25 = (void *)_convertErrorToNSError(_:)(a2);
  v26 = objc_msgSend(v25, "userInfo");

  v27 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v26, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(LAPasswordRetryTime);
  v30 = v29;
  if (*(_QWORD *)(v27 + 16) && (v31 = sub_100027F7C(v28, v29), (v32 & 1) != 0))
  {
    sub_100028564(*(_QWORD *)(v27 + 56) + 32 * v31, (uint64_t)&aBlock);
  }
  else
  {
    aBlock = 0u;
    v78 = 0u;
  }
  swift_bridgeObjectRelease(v30);
  swift_bridgeObjectRelease(v27);
  if (*((_QWORD *)&v78 + 1))
  {
    v33 = swift_dynamicCast(v19, &aBlock, (char *)&type metadata for Any + 8, v4, 6);
    v34 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v35 = v33 ^ 1u;
    v36 = v19;
  }
  else
  {
    sub_10002BD8C((uint64_t)&aBlock, &qword_1000914C0);
    v34 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v36 = v19;
    v35 = 1;
  }
  v74 = v34;
  v34((uint64_t)v36, v35, 1, v4);
  swift_beginAccess(v20, v83, 0, 0);
  v37 = swift_unknownObjectWeakLoadStrong(v20);
  if (v37)
  {
    v38 = (void *)v37;
    sub_100027F28((uint64_t)v19, (uint64_t)v17, &qword_100091F40);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v17, 1, v4) == 1)
    {
      sub_10002BD8C((uint64_t)v17, &qword_100091F40);
      v39 = 0;
    }
    else
    {
      Date.init()();
      v40 = Date.compare(_:)(v7);
      v41 = v19;
      v42 = *(void (**)(char *, uint64_t))(v5 + 8);
      v42(v7, v4);
      v42(v17, v4);
      v19 = v41;
      v39 = v40 == 1;
    }
    sub_1000514A8(v39);

  }
  sub_100027F28((uint64_t)v19, (uint64_t)v14, &qword_100091F40);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v14, 1, v4) == 1)
  {
    sub_10002BD8C((uint64_t)v14, &qword_100091F40);
LABEL_21:
    swift_beginAccess(v20, &aBlock, 0, 0);
    v61 = swift_unknownObjectWeakLoadStrong(v20);
    if (v61)
    {
      v62 = (void *)v61;
      v63 = v76;
      v74(v76, 1, 1, v4);
      v64 = swift_getKeyPath(&unk_1000617E8);
      v65 = swift_getKeyPath(&unk_100061810);
      v66 = v75;
      sub_100027F28(v63, v75, &qword_100091F40);
      v67 = v62;
      static Published.subscript.setter(v66, v67, v64, v65);
      sub_10002BD8C(v63, &qword_100091F40);

    }
    swift_beginAccess(v20, v82, 0, 0);
    v68 = swift_unknownObjectWeakLoadStrong(v20);
    if (v68)
    {
      v69 = v68;
      v70 = swift_getKeyPath(&unk_1000617A0);
      v71 = swift_getKeyPath(&unk_1000617C8);
      v81[0] = 1;
      static Published.subscript.setter(v81, v69, v70, v71);
    }
    return sub_10002BD8C((uint64_t)v19, &qword_100091F40);
  }
  Date.init()();
  v43 = Date.compare(_:)(v7);
  v44 = (uint64_t)v19;
  v45 = *(void (**)(char *, uint64_t))(v5 + 8);
  v45(v7, v4);
  v45(v14, v4);
  v19 = (char *)v44;
  if (v43 != 1)
    goto LABEL_21;
  swift_beginAccess(v20, v82, 0, 0);
  v46 = swift_unknownObjectWeakLoadStrong(v20);
  if (v46)
  {
    v47 = (void *)v46;
    v48 = v76;
    sub_100027F28(v44, v76, &qword_100091F40);
    v49 = swift_getKeyPath(&unk_1000617E8);
    v50 = swift_getKeyPath(&unk_100061810);
    v51 = v75;
    sub_100027F28(v48, v75, &qword_100091F40);
    v52 = v47;
    static Published.subscript.setter(v51, v52, v49, v50);
    sub_10002BD8C(v48, &qword_100091F40);

  }
  v53 = (void *)objc_opt_self(NSTimer);
  v54 = swift_allocObject(&unk_10007C718, 24, 7);
  swift_beginAccess(v20, v81, 0, 0);
  v55 = (void *)swift_unknownObjectWeakLoadStrong(v20);
  swift_unknownObjectWeakInit(v54 + 16, v55);

  v56 = swift_allocObject(&unk_10007CAE8, 32, 7);
  v57 = v73;
  *(_QWORD *)(v56 + 16) = v54;
  *(_QWORD *)(v56 + 24) = v57;
  v79 = sub_100055700;
  v80 = v56;
  *(_QWORD *)&aBlock = _NSConcreteStackBlock;
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v78 = sub_10002AF68;
  *((_QWORD *)&v78 + 1) = &unk_10007CB00;
  v58 = _Block_copy(&aBlock);
  v59 = v80;
  swift_errorRetain(v57);
  swift_release(v59);
  v60 = objc_msgSend(v53, "scheduledTimerWithTimeInterval:repeats:block:", 0, v58, 1.0);
  _Block_release(v58);

  return sub_10002BD8C((uint64_t)v19, &qword_100091F40);
}

uint64_t sub_1000535C4()
{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(_QWORD);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
  v2 = *(void (**)(_QWORD))(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
  if (v2)
  {
    v3 = v1[1];
    swift_retain(v3);
    v2(0);
    sub_100027EB8((uint64_t)v2, v3);
    v4 = *v1;
    v5 = v1[1];
    *v1 = 0;
    v1[1] = 0;
    return sub_100027EB8(v4, v5);
  }
  return result;
}

void *sub_100053630()
{
  uint64_t v0;
  uint64_t v1;
  void *result;
  void *v3;
  _BYTE v4[24];

  v1 = v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate;
  swift_beginAccess(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate, v4, 0, 0);
  result = (void *)swift_unknownObjectWeakLoadStrong(v1);
  if (result)
  {
    v3 = result;
    if ((objc_msgSend(result, "respondsToSelector:", "viewModelDidRejectDevicePasscode:") & 1) != 0)
      objc_msgSend(v3, "viewModelDidRejectDevicePasscode:", v0);
    return (void *)swift_unknownObjectRelease(v3);
  }
  return result;
}

uint64_t sub_1000536BC(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (uint64_t *)(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
  v3 = *(void (**)(uint64_t))(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
  if (v3)
  {
    v4 = result;
    v5 = v2[1];
    swift_retain(v5);
    v3(v4);
    sub_100027EB8((uint64_t)v3, v5);
    v6 = *v2;
    v7 = v2[1];
    *v2 = 0;
    v2[1] = 0;
    return sub_100027EB8(v6, v7);
  }
  return result;
}

void sub_10005372C()
{
  _swift_stdlib_reportUnimplementedInitializer("CoreAuthUI.AuthorizationViewModel", 33, "init()", 6, 0);
  __break(1u);
}

uint64_t sub_1000539CC@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t result;

  ObjectType = swift_getObjectType(v2);
  result = ObservableObject<>.objectWillChange.getter(ObjectType, a1);
  *a2 = result;
  return result;
}

uint64_t sub_100053A0C(uint64_t a1, uint64_t a2)
{
  return sub_100054864(a2);
}

uint64_t sub_100053AB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD aBlock[5];
  uint64_t v20;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000287F0(0, (unint64_t *)&qword_100091FA0, OS_dispatch_queue_ptr);
  v11 = (void *)static OS_dispatch_queue.main.getter(v10);
  v12 = swift_allocObject(&unk_10007C718, 24, 7);
  swift_unknownObjectWeakInit(v12 + 16, v1);
  aBlock[4] = sub_100054B60;
  v20 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100027144;
  aBlock[3] = &unk_10007C898;
  v13 = _Block_copy(aBlock);
  v14 = swift_release(v20);
  static DispatchQoS.unspecified.getter(v14);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v15 = sub_10002C054((unint64_t *)&qword_1000915D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v16 = sub_100025D1C((uint64_t *)&unk_100091FB0);
  v17 = sub_10002C094();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v16, v17, v2, v15);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v5, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_100053CE0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD v22[4];

  v1 = sub_100025D1C(&qword_100091FC0);
  __chkstk_darwin(v1);
  v3 = (char *)v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for TaskPriority(0);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  v6 = (_QWORD *)swift_allocObject(&unk_10007C8D0, 40, 7);
  v6[2] = 0;
  v7 = v6 + 2;
  v6[3] = 0;
  v6[4] = v0;
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  v9 = v0;
  if (v8 == 1)
  {
    sub_10002BD8C((uint64_t)v3, &qword_100091FC0);
    v10 = 0;
    v11 = 0;
    v12 = 7168;
  }
  else
  {
    v13 = TaskPriority.rawValue.getter(v9);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    v12 = v13 | 0x1C00;
    v14 = *v7;
    if (*v7)
    {
      v15 = v6[3];
      ObjectType = swift_getObjectType(*v7);
      swift_unknownObjectRetain(v14);
      v10 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v15);
      v11 = v17;
      swift_unknownObjectRelease(v14);
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
  }
  v18 = swift_allocObject(&unk_10007C8F8, 32, 7);
  *(_QWORD *)(v18 + 16) = &unk_100091FD0;
  *(_QWORD *)(v18 + 24) = v6;
  if (v11 | v10)
  {
    v22[0] = 0;
    v22[1] = 0;
    v19 = v22;
    v22[2] = v10;
    v22[3] = v11;
  }
  else
  {
    v19 = 0;
  }
  v20 = swift_task_create(v12, v19, (char *)&type metadata for () + 8, &unk_100091FE0, v18);
  return swift_release(v20);
}

uint64_t sub_100053EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a4;
  return swift_task_switch(sub_100053EC8, 0, 0);
}

uint64_t sub_100053EC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 32) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100053F30, v2, v3);
}

uint64_t sub_100053F30()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_release(*(_QWORD *)(v0 + 32));
  sub_100053F74(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void (*sub_100053F74(uint64_t a1))(id *, _QWORD)
{
  void *v2;
  void (*result)(id *, _QWORD);
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t KeyPath;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15[4];

  v2 = *(void **)(a1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
  objc_msgSend(v2, "canEvaluatePolicy:error:", 1, 0);
  result = (void (*)(id *, _QWORD))objc_msgSend(v2, "biometryType");
  if (result == (void (*)(id *, _QWORD))2)
  {
    v4 = *(void **)(a1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
    v15[0] = 0;
    objc_msgSend(v4, "canEvaluatePolicy:error:", 1, v15);
    v5 = v15[0];
    v6 = v15[0];
    if (v5)
    {
      v7 = v6;
      sub_100054864((uint64_t)v6);
      return (void (*)(id *, _QWORD))swift_errorRelease(v7);
    }
    else
    {
      KeyPath = swift_getKeyPath(&unk_1000618C0);
      v9 = swift_getKeyPath(&unk_1000618E8);
      result = (void (*)(id *, _QWORD))static Published.subscript.modify(v15, a1, KeyPath, v9);
      if (__OFADD__(*v10, 1))
      {
        __break(1u);
      }
      else
      {
        ++*v10;
        result(v15, 0);
        swift_release(KeyPath);
        v11 = swift_release(v9);
        v12 = __chkstk_darwin(v11);
        v14[2] = a1;
        v13 = static Animation.default.getter(v12);
        withAnimation<A>(_:_:)(v13, sub_100055110, v14, (char *)&type metadata for () + 8);
        return (void (*)(id *, _QWORD))swift_release(v13);
      }
    }
  }
  return result;
}

NSNumber sub_100054120()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100054128(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v6 = 0;
  v7 = 1;
  result = static Int._forceBridgeFromObjectiveC(_:result:)(a1, &v6);
  v4 = v6;
  v5 = v7;
  if (v7)
    v4 = 0;
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_100054178(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v7;
  char v8;

  v7 = 0;
  v8 = 1;
  v3 = static Int._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v7);
  v4 = v7;
  v5 = v8;
  if (v8)
    v4 = 0;
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v5;
  return v3 & 1;
}

uint64_t sub_1000541CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static Int._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  return result;
}

uint64_t sub_1000541F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_10002C054(&qword_1000920C0, (uint64_t (*)(uint64_t))type metadata accessor for LACustomPasswordType, (uint64_t)&unk_100061BBC);
  v3 = sub_10002C054(&qword_1000920C8, (uint64_t (*)(uint64_t))type metadata accessor for LACustomPasswordType, (uint64_t)&unk_100061B64);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for Int);
}

uint64_t sub_100054284()
{
  _QWORD *v0;

  return Int.hashValue.getter(*v0);
}

void sub_10005428C()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

uint64_t sub_1000542B4(uint64_t a1)
{
  _QWORD *v1;

  return static Hasher._hash(seed:_:)(a1, *v1);
}

uint64_t sub_1000542BC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100054320;
  return v6(a1);
}

uint64_t sub_100054320()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void *sub_10005436C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  void *result;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;

  v2 = type metadata accessor for Calendar.Component(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v29 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    sub_100025D1C(&qword_1000920E8);
    v10 = static _SetStorage.allocate(capacity:)(v9);
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v30 = v9;
    v31 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v33 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v34 = v10 + 56;
    while (1)
    {
      v32 = v11;
      v33(v8, v31 + v13 * v11, v2);
      v14 = *(_QWORD *)(v10 + 40);
      v15 = sub_10002C054(&qword_1000920F0, (uint64_t (*)(uint64_t))&type metadata accessor for Calendar.Component, (uint64_t)&protocol conformance descriptor for Calendar.Component);
      v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v2, v15);
      v17 = ~(-1 << *(_BYTE *)(v10 + 32));
      v18 = v16 & v17;
      v19 = (v16 & (unint64_t)v17) >> 6;
      v20 = *(_QWORD *)(v34 + 8 * v19);
      v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        do
        {
          v33(v6, *(_QWORD *)(v10 + 48) + v18 * v13, v2);
          sub_10002C054(&qword_1000920F8, (uint64_t (*)(uint64_t))&type metadata accessor for Calendar.Component, (uint64_t)&protocol conformance descriptor for Calendar.Component);
          v22 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v8);
          v23 = v3;
          v24 = *(void (**)(char *, uint64_t))(v3 + 8);
          v24(v6, v2);
          if ((v22 & 1) != 0)
          {
            v24(v8, v2);
            v3 = v23;
            v9 = v30;
            goto LABEL_4;
          }
          v18 = (v18 + 1) & v17;
          v19 = v18 >> 6;
          v20 = *(_QWORD *)(v34 + 8 * (v18 >> 6));
          v21 = 1 << v18;
          v3 = v23;
        }
        while ((v20 & (1 << v18)) != 0);
        v9 = v30;
      }
      *(_QWORD *)(v34 + 8 * v19) = v21 | v20;
      result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v18 * v13, v8, v2);
      v26 = *(_QWORD *)(v10 + 16);
      v27 = __OFADD__(v26, 1);
      v28 = v26 + 1;
      if (v27)
        break;
      *(_QWORD *)(v10 + 16) = v28;
LABEL_4:
      v11 = v32 + 1;
      if (v32 + 1 == v9)
        return (void *)v10;
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptySetSingleton;
  }
  return result;
}

uint64_t sub_1000545D4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000545F8(uint64_t a1)
{
  uint64_t v1;

  return sub_1000517E4(a1, v1);
}

uint64_t sub_100054600(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100054610(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10005461C()
{
  uint64_t v0;

  return sub_100052F20(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_100054630()
{
  uint64_t v0;

  return sub_1000521F4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t (**)(void))(v0 + 32));
}

uint64_t sub_10005463C()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  char v9;

  v1 = *(void **)(v0 + 16);
  KeyPath = swift_getKeyPath(&unk_100061908);
  v3 = swift_getKeyPath(&unk_100061930);
  v9 = 0;
  v4 = v1;
  static Published.subscript.setter(&v9, v4, KeyPath, v3);
  v5 = swift_getKeyPath(&unk_100061950);
  v6 = swift_getKeyPath(&unk_100061978);
  v8 = 0;
  return static Published.subscript.setter(&v8, v4, v5, v6);
}

uint64_t sub_1000546EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *Strong;
  _BYTE v6[24];

  v1 = v0 + 16;
  v2 = static Animation.linear(duration:)(0.05);
  v3 = swift_allocObject(&unk_10007C718, 24, 7);
  swift_beginAccess(v1, v6, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v1);
  swift_unknownObjectWeakInit(v3 + 16, Strong);

  withAnimation<A>(_:_:)(v2, sub_100055434, v3, (char *)&type metadata for () + 8);
  swift_release(v3);
  return swift_release(v2);
}

uint64_t sub_1000547A8()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  char v9;

  v1 = *(void **)(v0 + 16);
  sub_100052DF4();
  sub_1000514A8(0);
  KeyPath = swift_getKeyPath(&unk_100061908);
  v3 = swift_getKeyPath(&unk_100061930);
  v9 = 0;
  v4 = v1;
  static Published.subscript.setter(&v9, v4, KeyPath, v3);
  v5 = swift_getKeyPath(&unk_100061950);
  v6 = swift_getKeyPath(&unk_100061978);
  v8 = 0;
  return static Published.subscript.setter(&v8, v4, v5, v6);
}

uint64_t sub_100054864(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  id v18;
  BOOL v19;
  double v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD aBlock[5];
  uint64_t v38;

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v36 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v34 = *(_QWORD *)(v7 - 8);
  v35 = v7;
  __chkstk_darwin(v7);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchTime(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v33 - v15;
  v17 = *(void **)(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
  objc_msgSend(v17, "canEvaluatePolicy:error:", 1, 0);
  v18 = objc_msgSend(v17, "biometryType");
  if (a1)
    v19 = 0;
  else
    v19 = v18 == (id)1;
  if (v19)
    v20 = 1.0;
  else
    v20 = 0.5;
  v21 = sub_1000287F0(0, (unint64_t *)&qword_100091FA0, OS_dispatch_queue_ptr);
  v33 = static OS_dispatch_queue.main.getter(v21);
  static DispatchTime.now()();
  + infix(_:_:)(v14, v20);
  v22 = *(void (**)(char *, uint64_t))(v11 + 8);
  v22(v14, v10);
  v23 = swift_allocObject(&unk_10007C718, 24, 7);
  swift_unknownObjectWeakInit(v23 + 16, v2);
  v24 = swift_allocObject(&unk_10007C9A8, 32, 7);
  *(_QWORD *)(v24 + 16) = v23;
  *(_QWORD *)(v24 + 24) = a1;
  aBlock[4] = sub_100055318;
  v38 = v24;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100027144;
  aBlock[3] = &unk_10007C9C0;
  v25 = _Block_copy(aBlock);
  v26 = v38;
  swift_errorRetain(a1);
  v27 = swift_release(v26);
  static DispatchQoS.unspecified.getter(v27);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v28 = sub_10002C054((unint64_t *)&qword_1000915D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v29 = sub_100025D1C((uint64_t *)&unk_100091FB0);
  v30 = sub_10002C094();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v29, v30, v4, v28);
  v31 = (void *)v33;
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v16, v9, v6, v25);
  _Block_release(v25);

  (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v9, v35);
  return ((uint64_t (*)(char *, uint64_t))v22)(v16, v10);
}

void sub_100054B60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[31];
  _BYTE v12[24];

  v1 = v0 + 16;
  swift_beginAccess(v0 + 16, v12, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v0 + 16);
  if (Strong)
  {
    v3 = (void *)Strong;
    v4 = *(void **)(Strong + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
    objc_msgSend(v4, "canEvaluatePolicy:error:", 1, 0);
    v5 = objc_msgSend(v4, "biometryType");

    if (v5 == (id)1)
    {
      v6 = objc_msgSend(objc_allocWithZone((Class)UIImpactFeedbackGenerator), "initWithStyle:", 2);
      objc_msgSend(v6, "impactOccurred");

      v7 = swift_allocObject(&unk_10007C718, 24, 7);
      swift_beginAccess(v1, v11, 0, 0);
      v8 = (void *)swift_unknownObjectWeakLoadStrong(v1);
      swift_unknownObjectWeakInit(v7 + 16, v8);

      v9 = static Animation.default.getter();
      v10 = sub_100025D1C((uint64_t *)&unk_1000920D0);
      withAnimation<A>(_:_:)(v9, sub_100055238, v7, v10);
      swift_release(v9);
      swift_release(v7);
    }
  }
}

uint64_t sub_100054CB4()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100054CE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc(dword_100091FCC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003C8C8;
  v5[2] = a1;
  v5[3] = v4;
  return swift_task_switch(sub_100053EC8, 0, 0);
}

uint64_t sub_100054D44()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100054D68(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100091FDC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003C8C8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100091FD8 + dword_100091FD8))(a1, v4);
}

void *sub_100054DD8()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100054DE4()
{
  return type metadata accessor for AuthorizationViewModel(0);
}

uint64_t type metadata accessor for AuthorizationViewModel(uint64_t a1)
{
  uint64_t result;

  result = qword_1000937D0;
  if (!qword_1000937D0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AuthorizationViewModel);
  return result;
}

void sub_100054E28(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD v15[33];

  sub_100055048(319, &qword_100092010, (uint64_t)&type metadata for Bool, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Published);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(v2 - 8) + 64;
    v15[0] = v4;
    v15[1] = v4;
    v15[2] = v4;
    v15[3] = v4;
    v15[4] = v4;
    sub_100034F58(319, &qword_100092018, &qword_100091F40);
    if (v6 <= 0x3F)
    {
      v15[5] = *(_QWORD *)(v5 - 8) + 64;
      sub_100034F58(319, &qword_100092020, &qword_100091F58);
      if (v8 <= 0x3F)
      {
        v15[6] = *(_QWORD *)(v7 - 8) + 64;
        sub_100055048(319, &qword_100092028, (uint64_t)&type metadata for String, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Published);
        if (v10 <= 0x3F)
        {
          v15[7] = *(_QWORD *)(v9 - 8) + 64;
          sub_100055048(319, &qword_100092030, (uint64_t)&type metadata for Int, (uint64_t (*)(_QWORD, uint64_t))&type metadata accessor for Published);
          if (v12 <= 0x3F)
          {
            v15[8] = *(_QWORD *)(v11 - 8) + 64;
            v15[9] = v4;
            v15[10] = v4;
            v15[11] = &unk_100061A08;
            v15[14] = &unk_100061A20;
            v15[15] = (char *)&value witness table for Builtin.BridgeObject + 64;
            v15[12] = &unk_100061A20;
            v15[13] = (char *)&value witness table for Builtin.Int64 + 64;
            v15[16] = &unk_100061A38;
            v15[17] = (char *)&value witness table for Builtin.Int64 + 64;
            v15[18] = &unk_100061A50;
            v13 = type metadata accessor for Logger(319);
            if (v14 <= 0x3F)
            {
              v15[19] = *(_QWORD *)(v13 - 8) + 64;
              v15[20] = &unk_100061A50;
              v15[21] = &unk_100061A68;
              v15[22] = (char *)&value witness table for Builtin.UnknownObject + 64;
              v15[23] = &unk_100061A80;
              v15[24] = (char *)&value witness table for Builtin.Int64 + 64;
              v15[25] = (char *)&value witness table for Builtin.UnknownObject + 64;
              v15[26] = &unk_100061A50;
              v15[27] = &unk_100061A98;
              v15[28] = &unk_100061A80;
              v15[29] = &unk_100061A80;
              v15[30] = &unk_100061A08;
              v15[31] = &unk_100061A80;
              v15[32] = &unk_100061AB0;
              swift_updateClassMetadata2(a1, 256, 33, v15, a1 + 80);
            }
          }
        }
      }
    }
  }
}

void type metadata accessor for LACustomPasswordType(uint64_t a1)
{
  sub_100055048(a1, &qword_100092098, (uint64_t)&unk_10007C980, (uint64_t (*)(_QWORD, uint64_t))&_swift_getForeignTypeMetadata);
}

void sub_100055048(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

uint64_t sub_10005508C()
{
  return sub_10002C054(&qword_1000920A8, (uint64_t (*)(uint64_t))type metadata accessor for LACustomPasswordType, (uint64_t)&unk_100061B2C);
}

uint64_t sub_1000550B8()
{
  return sub_10002C054(&qword_1000920B0, (uint64_t (*)(uint64_t))type metadata accessor for LACustomPasswordType, (uint64_t)&unk_100061B04);
}

uint64_t sub_1000550E4()
{
  return sub_10002C054(&qword_1000920B8, (uint64_t (*)(uint64_t))type metadata accessor for LACustomPasswordType, (uint64_t)&unk_100061B94);
}

uint64_t sub_100055110()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  BOOL v12;
  char v13;

  v1 = *(void **)(v0 + 16);
  KeyPath = swift_getKeyPath(&unk_100061908);
  v3 = swift_getKeyPath(&unk_100061930);
  v13 = 1;
  v4 = v1;
  static Published.subscript.setter(&v13, v4, KeyPath, v3);
  v5 = swift_getKeyPath(&unk_1000618C0);
  v6 = swift_getKeyPath(&unk_1000618E8);
  static Published.subscript.getter(&v11, v4, v5, v6);
  swift_release(v6);
  swift_release(v5);
  v7 = v11 >= 2 && v4[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_fallbackMethod] != 2;
  v8 = swift_getKeyPath(&unk_100061950);
  v9 = swift_getKeyPath(&unk_100061978);
  v12 = v7;
  return static Published.subscript.setter(&v12, v4, v8, v9);
}

void sub_100055238(BOOL *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  void *Strong;
  uint64_t KeyPath;
  uint64_t v6;
  void (*v7)(_BYTE *, _QWORD);
  _QWORD *v8;
  _BYTE v9[32];
  _BYTE v10[24];

  v3 = v1 + 16;
  swift_beginAccess(v3, v10, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v3);
  if (!Strong)
    goto LABEL_4;
  KeyPath = swift_getKeyPath(&unk_1000618C0);
  v6 = swift_getKeyPath(&unk_1000618E8);
  v7 = (void (*)(_BYTE *, _QWORD))static Published.subscript.modify(v9, Strong, KeyPath, v6);
  if (!__OFADD__(*v8, 1))
  {
    ++*v8;
    v7(v9, 0);
    swift_release(v6);
    swift_release(KeyPath);

LABEL_4:
    *a1 = Strong == 0;
    return;
  }
  __break(1u);
}

void sub_100055318()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  uint64_t *v6;
  void (*v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = v1 + 16;
  swift_beginAccess(v1 + 16, v11, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    if (v2)
    {
      if (*(_BYTE *)(Strong + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_fallbackMethod) == 2)
        sub_100051C70(v2, Strong);
      else
        sub_100052ABC(0);
    }
    else
    {
      v6 = (uint64_t *)(Strong + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
      v7 = *(void (**)(_QWORD))(Strong + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
      if (v7)
      {
        v8 = v6[1];
        swift_retain(v8);
        v7(0);
        sub_100027EB8((uint64_t)v7, v8);
        v9 = *v6;
        v10 = v6[1];
        *v6 = 0;
        v6[1] = 0;
        sub_100027EB8(v9, v10);
      }
    }

  }
}

uint64_t sub_1000553EC()
{
  _QWORD *v0;

  swift_release(v0[3]);
  swift_errorRelease(v0[4]);
  swift_release(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100055420()
{
  uint64_t v0;

  return sub_100052358(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(double *)(v0 + 16));
}

uint64_t sub_100055434()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _BYTE v15[24];
  _BYTE v16[24];
  _BYTE v17[24];
  _BYTE v18[24];

  v1 = v0 + 16;
  swift_beginAccess(v0 + 16, v18, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v0 + 16);
  if (Strong)
  {
    v3 = (void *)Strong;
    sub_100052DF4();

  }
  swift_beginAccess(v1, v17, 0, 0);
  v4 = swift_unknownObjectWeakLoadStrong(v1);
  if (v4)
  {
    v5 = (void *)v4;
    sub_1000514A8(0);

  }
  swift_beginAccess(v1, v16, 0, 0);
  v6 = swift_unknownObjectWeakLoadStrong(v1);
  if (v6)
  {
    v7 = v6;
    KeyPath = swift_getKeyPath(&unk_100061908);
    v9 = swift_getKeyPath(&unk_100061930);
    v15[0] = 0;
    static Published.subscript.setter(v15, v7, KeyPath, v9);
  }
  swift_beginAccess(v1, v15, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(v1);
  if (result)
  {
    v11 = result;
    v12 = swift_getKeyPath(&unk_100061950);
    v13 = swift_getKeyPath(&unk_100061978);
    v14 = 0;
    return static Published.subscript.setter(&v14, v11, v12, v13);
  }
  return result;
}

uint64_t sub_100055574@<X0>(BOOL *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t KeyPath;
  uint64_t v7;
  char v8;
  _BYTE v9[24];

  v3 = v1 + 16;
  swift_beginAccess(v3, v9, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(v3);
  v5 = result;
  if (result)
  {
    KeyPath = swift_getKeyPath(&unk_100061680);
    v7 = swift_getKeyPath(&unk_1000616A8);
    v8 = 0;
    result = static Published.subscript.setter(&v8, v5, KeyPath, v7);
  }
  *a1 = v5 == 0;
  return result;
}

uint64_t sub_100055614()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_errorRelease(v0[3]);
  swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100055648()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  uint64_t *v6;
  void (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[24];

  v1 = v0[3];
  v2 = (uint64_t (*)(void))v0[4];
  v3 = v0[2] + 16;
  swift_beginAccess(v3, v12, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    v6 = (uint64_t *)(Strong + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
    v7 = *(void (**)(uint64_t))(Strong + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
    if (v7)
    {
      v8 = v6[1];
      swift_retain(v8);
      v7(v1);
      sub_100027EB8((uint64_t)v7, v8);
      v9 = *v6;
      v10 = v6[1];
      *v6 = 0;
      v6[1] = 0;
      sub_100027EB8(v9, v10);
    }

  }
  return v2();
}

void sub_100055700()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  _BYTE v5[24];

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 16) + 16;
  swift_beginAccess(v2, v5, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = (void *)Strong;
    sub_100051A48(v1);

  }
}

BOOL sub_1000557C4()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  return v1 == (id)1;
}

id sub_10005581C()
{
  uint64_t v0;
  uint64_t ObjCClassFromMetadata;
  id result;

  v0 = type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  result = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  qword_100093AE8 = (uint64_t)result;
  return result;
}

uint64_t sub_10005586C(uint64_t a1)
{
  return sub_1000558E0(a1, qword_100093B90, 0x687361446E6970, 0xE700000000000000);
}

uint64_t sub_10005588C()
{
  return sub_100055994(&qword_100093AF0, (uint64_t)qword_100093B90, (uint64_t)sub_10005586C);
}

uint64_t sub_1000558A8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000559F0(&qword_100093AF0, (uint64_t)qword_100093B90, (uint64_t)sub_10005586C, a1);
}

uint64_t sub_1000558C4(uint64_t a1)
{
  return sub_1000558E0(a1, qword_100093BA8, 0x746F446E6970, 0xE600000000000000);
}

uint64_t sub_1000558E0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for ImageResource(0);
  sub_10004CFD8(v7, a2);
  sub_10004C1D0(v7, (uint64_t)a2);
  if (qword_100093AE0 != -1)
    swift_once(&qword_100093AE0, sub_10005581C);
  return ImageResource.init(name:bundle:)(a3, a4, (id)qword_100093AE8);
}

uint64_t sub_100055978()
{
  return sub_100055994(&qword_100093AF8, (uint64_t)qword_100093BA8, (uint64_t)sub_1000558C4);
}

uint64_t sub_100055994(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  if (*a1 != -1)
    swift_once(a1, a3);
  v4 = type metadata accessor for ImageResource(0);
  return sub_10004C1D0(v4, a2);
}

uint64_t sub_1000559D4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000559F0(&qword_100093AF8, (uint64_t)qword_100093BA8, (uint64_t)sub_1000558C4, a1);
}

uint64_t sub_1000559F0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  if (*a1 != -1)
    swift_once(a1, a3);
  v6 = type metadata accessor for ImageResource(0);
  v7 = sub_10004C1D0(v6, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a4, v7, v6);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC10CoreAuthUIP33_D311C9B47CBDDBD4D74A0DA145FFA55E19ResourceBundleClass);
}

void sub_100055A78(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to open URL: %{public}@ error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_100055AFC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to unarchive tint color: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100055B70(int a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;

  v3 = 136315650;
  v4 = "-[FaceIdViewController _processCoachingFeedback:]";
  v5 = 1024;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s %d on %@", (uint8_t *)&v3, 0x1Cu);
}

void sub_100055C08(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Can't query SecureDoubleClick.", v1, 2u);
}

void sub_100055C48(NSObject *a1)
{
  id WeakRetained;
  uint8_t v3[24];

  WeakRetained = objc_loadWeakRetained(&qword_1000921B0);
  sub_1000153BC();
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "Skipping recovery of stale root controller %{public}@", v3, 0xCu);

}

void sub_100055CDC(uint64_t a1, NSObject *a2)
{
  id WeakRetained;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;

  WeakRetained = objc_loadWeakRetained(&qword_1000921B0);
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = WeakRetained;
  sub_1000153D8((void *)&_mh_execute_header, a2, v5, "%{public}@ must replace a stale root controller %{public}@", (uint8_t *)&v6);

}

void sub_100055D84()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_1000153BC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%{public}@ dealloc", v1, 0xCu);
  sub_1000153B4();
}

void sub_100055DF0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Timed out waiting for internal info", v1, 2u);
  sub_1000153E4();
}

void sub_100055E2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000153BC();
  sub_1000153A4((void *)&_mh_execute_header, v0, v1, "XPC error connecting to remoteUIHost: %{public}@", v2, v3, v4, v5, v6);
  sub_1000153B4();
}

void sub_100055E8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000153BC();
  sub_1000153A4((void *)&_mh_execute_header, v0, v1, "Error connecting to remoteUIHost: %{public}@", v2, v3, v4, v5, v6);
  sub_1000153B4();
}

void sub_100055EEC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000153C8((void *)&_mh_execute_header, a2, a3, "executing part 2, tid:%u", a5, a6, a7, a8, 0);
  sub_1000153E4();
}

void sub_100055F54(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000153C8((void *)&_mh_execute_header, a2, a3, "executing part 1, tid:%u", a5, a6, a7, a8, 0);
  sub_1000153E4();
}

void sub_100055FBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000153BC();
  sub_1000153A4((void *)&_mh_execute_header, v0, v1, "Simulating a stale root controller: %@", v2, v3, v4, v5, v6);
  sub_1000153B4();
}

void sub_10005601C()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_1000153BC();
  v3 = 2114;
  v4 = v0;
  sub_1000153D8((void *)&_mh_execute_header, v1, (uint64_t)v1, "Found error (%{public}@) while destroying %{public}@", v2);
  sub_1000153B4();
}

void sub_100056094()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000153BC();
  sub_1000153A4((void *)&_mh_execute_header, v0, v1, "CoreAuthUI won't idle-exit: %{public}@", v2, v3, v4, v5, v6);
  sub_1000153B4();
}

void sub_1000560F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000153A4((void *)&_mh_execute_header, a1, a3, "CoreAuthUI failed to idle-exit by %.0f ms, retrying...", a5, a6, a7, a8, 0);
  sub_1000153B4();
}

void sub_100056168()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000153BC();
  sub_1000153A4((void *)&_mh_execute_header, v0, v1, "%{public}@ triggered UI watchdog", v2, v3, v4, v5, v6);
  sub_1000153B4();
}

void sub_1000561C8(char a1, _BYTE *a2, os_log_t log)
{
  const char *v3;
  const char *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;

  v3 = "all";
  if ((a1 & 1) != 0)
    v3 = "portrait";
  v4 = "YES";
  if (!*a2)
    v4 = "NO";
  v5 = 136315394;
  v6 = v3;
  v7 = 2080;
  v8 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "supportedInterfaceOrientations: %s, _allowsLandscape: %s", (uint8_t *)&v5, 0x16u);
  sub_1000153B4();
}

void sub_10005627C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100015980((void *)&_mh_execute_header, a1, a3, "Failed to unarchive tint color. Received empty payload.", a5, a6, a7, a8, 0);
}

void sub_1000562B0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to unarchive tint color. Received: '%{public}@'.", (uint8_t *)&v2, 0xCu);
}

void sub_100056324(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100015980((void *)&_mh_execute_header, a1, a3, "Failed to unarchive tint color. Received unexpected payload type.", a5, a6, a7, a8, 0);
}

void sub_100056358()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001CAE8();
  sub_10001CAD4((void *)&_mh_execute_header, v0, v1, "Failed to post %{public}@: %{public}@");
}

void sub_1000563BC()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001CAE8();
  sub_10001CAD4((void *)&_mh_execute_header, v0, v1, "Failed to revoke %{public}@: %{public}@");
}

void sub_100056420(uint64_t a1, id *a2, NSObject *a3)
{
  unsigned int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  unsigned int v9;

  v5 = objc_msgSend(*a2, "count");
  v6 = 138543618;
  v7 = a1;
  v8 = 1024;
  v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%{public}@ was revoked and will complete when the presentable disappears, tracking %u completion handlers.", (uint8_t *)&v6, 0x12u);
}

void sub_1000564BC(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;

  v3 = NSStringFromLAPasscodeType();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unrecognized passcode type: %@", (uint8_t *)&v5, 0xCu);

}

void sub_100056550(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unknown interface orientation.", v1, 2u);
}

void sub_100056590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000153A4((void *)&_mh_execute_header, &_os_log_default, a3, "Could not set credential (%@)", a5, a6, a7, a8, 2u);
}

void sub_100056600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000153A4((void *)&_mh_execute_header, &_os_log_default, a3, "Could not obtain remote proxy: %@", a5, a6, a7, a8, 2u);
}

void sub_100056670()
{
  __assert_rtn("-[ScreenDimmingView setDimLevel:]", "ScreenDimmingView.m", 36, "dimLevel >= 0 && dimLevel <= 1");
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGRectValue");
}

id objc_msgSend_SBUISA_systemApertureObstructedAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SBUISA_systemApertureObstructedAreaLayoutGuide");
}

id objc_msgSend__activateKeypadView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activateKeypadView");
}

id objc_msgSend__addActionWithTitle_style_handler_shouldDismissHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addActionWithTitle:style:handler:shouldDismissHandler:");
}

id objc_msgSend__adjustToastSizeForAccessibilityIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_adjustToastSizeForAccessibilityIfNeeded");
}

id objc_msgSend__anchorToastViewToView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_anchorToastViewToView:");
}

id objc_msgSend__animationForState_propertyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animationForState:propertyName:");
}

id objc_msgSend__backdropRenderingHintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_backdropRenderingHintColor");
}

id objc_msgSend__backdropStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_backdropStyle");
}

id objc_msgSend__backgroundStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_backgroundStyle");
}

id objc_msgSend__backoffTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_backoffTimeout");
}

id objc_msgSend__cancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancel");
}

id objc_msgSend__cancelIfPossible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelIfPossible");
}

id objc_msgSend__centeringAnchorWithObstructedLayoutGuide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_centeringAnchorWithObstructedLayoutGuide:");
}

id objc_msgSend__checkClearForIdleExit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkClearForIdleExit");
}

id objc_msgSend__checkDismissalCompletion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkDismissalCompletion");
}

id objc_msgSend__clearTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearTimer");
}

id objc_msgSend__coachingTextForFeedback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coachingTextForFeedback:");
}

id objc_msgSend__configureAndShowAlertController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureAndShowAlertController");
}

id objc_msgSend__createBlurView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createBlurView");
}

id objc_msgSend__deactivateKeypadView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deactivateKeypadView");
}

id objc_msgSend__destroyViewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_destroyViewControllers");
}

id objc_msgSend__dismissAlertWithDelay_temporarily_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissAlertWithDelay:temporarily:completion:");
}

id objc_msgSend__dismissChild_andRoot_reason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissChild:andRoot:reason:completion:");
}

id objc_msgSend__dismissCoachingViews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissCoachingViews");
}

id objc_msgSend__dismissKeypad(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissKeypad");
}

id objc_msgSend__dismissRemoteUIWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissRemoteUIWithCompletionHandler:");
}

id objc_msgSend__dismissRootWithReason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissRootWithReason:completion:");
}

id objc_msgSend__dismissToastWithDelay_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissToastWithDelay:completion:");
}

id objc_msgSend__dismissUIWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissUIWithCompletionHandler:");
}

id objc_msgSend__dispatchBackoffTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dispatchBackoffTimer");
}

id objc_msgSend__dispatchTapBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dispatchTapBlock:");
}

id objc_msgSend__effectForBlurEffect_vibrancyStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_effectForBlurEffect:vibrancyStyle:");
}

id objc_msgSend__embedSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_embedSubview:");
}

id objc_msgSend__enterPassword(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enterPassword");
}

id objc_msgSend__enterPin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enterPin");
}

id objc_msgSend__glyphAnchorWithObstructedLayoutGuide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_glyphAnchorWithObstructedLayoutGuide:");
}

id objc_msgSend__handleBioLockout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleBioLockout:");
}

id objc_msgSend__handleBiometryNoMatch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleBiometryNoMatch");
}

id objc_msgSend__handleBiometryRequiredEnterPasscode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleBiometryRequiredEnterPasscode");
}

id objc_msgSend__handleBiometryRequiredFailure(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleBiometryRequiredFailure");
}

id objc_msgSend__handleIdleExitResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleIdleExitResponse:error:");
}

id objc_msgSend__handleMatch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMatch");
}

id objc_msgSend__handleNoMatchOrSensorInactive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleNoMatchOrSensorInactive:");
}

id objc_msgSend__handleSensorActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSensorActive");
}

id objc_msgSend__handleToastPresented(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleToastPresented");
}

id objc_msgSend__hasBlurredBackground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasBlurredBackground");
}

id objc_msgSend__hasTranslucentBackground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasTranslucentBackground");
}

id objc_msgSend__headerContentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_headerContentViewController");
}

id objc_msgSend__hideGlyphWithSpecialUi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hideGlyphWithSpecialUi:");
}

id objc_msgSend__holdPresentingViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_holdPresentingViewController");
}

id objc_msgSend__interfaceOrientationFromObstructedArea_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_interfaceOrientationFromObstructedArea:");
}

id objc_msgSend__isCollapsingFromFullExpansion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isCollapsingFromFullExpansion");
}

id objc_msgSend__isEarlyExpansion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isEarlyExpansion");
}

id objc_msgSend__isRootControllerClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isRootControllerClass");
}

id objc_msgSend__isSensorActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSensorActive");
}

id objc_msgSend__isSuccessfulState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSuccessfulState:");
}

id objc_msgSend__layoutGlyph(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutGlyph");
}

id objc_msgSend__layoutSubviewsWithKeyboard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutSubviewsWithKeyboard:");
}

id objc_msgSend__leadingViewStateFromGlyphState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_leadingViewStateFromGlyphState:");
}

id objc_msgSend__lightweightJindoContainerSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lightweightJindoContainerSize");
}

id objc_msgSend__lightweightJindoContentShiftOnLeading_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lightweightJindoContentShiftOnLeading:");
}

id objc_msgSend__lightweightJindoContentSizeForExpansion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lightweightJindoContentSizeForExpansion:");
}

id objc_msgSend__lightweightJindoExpansion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lightweightJindoExpansion");
}

id objc_msgSend__lightweightJindoExpansionForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lightweightJindoExpansionForState:");
}

id objc_msgSend__lockStyleForPasscodeType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lockStyleForPasscodeType:");
}

id objc_msgSend__mechanismEvent_value_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mechanismEvent:value:reply:");
}

id objc_msgSend__notifyPasscodeVerificationFinishedWithSuccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyPasscodeVerificationFinishedWithSuccess:");
}

id objc_msgSend__opacityForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_opacityForState:");
}

id objc_msgSend__passwordConfirm(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_passwordConfirm");
}

id objc_msgSend__passwordEntered(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_passwordEntered");
}

id objc_msgSend__passwordNext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_passwordNext");
}

id objc_msgSend__performOnMainQueueWhenAppeared_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performOnMainQueueWhenAppeared:");
}

id objc_msgSend__presentAlertAnimated_specialUi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentAlertAnimated:specialUi:");
}

id objc_msgSend__presentToast(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentToast");
}

id objc_msgSend__presentUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentUI:");
}

id objc_msgSend__processCoachingFeedback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processCoachingFeedback:");
}

id objc_msgSend__releasePresentingViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_releasePresentingViewController");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__remoteViewControllerProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remoteViewControllerProxyWithErrorHandler:");
}

id objc_msgSend__removePreviousBackgroundFromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removePreviousBackgroundFromView:");
}

id objc_msgSend__resetUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetUI");
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rootSheetPresentationController");
}

id objc_msgSend__roundRectToPixel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_roundRectToPixel:");
}

id objc_msgSend__roundToPixel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_roundToPixel:");
}

id objc_msgSend__sceneSessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sceneSessions");
}

id objc_msgSend__scheduleIdleExit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleIdleExit");
}

id objc_msgSend__setActionButtons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setActionButtons");
}

id objc_msgSend__setActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setActions:");
}

id objc_msgSend__setActivityWatchdog(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setActivityWatchdog");
}

id objc_msgSend__setBackdropEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setBackdropEnabled:");
}

id objc_msgSend__setBackdropEnabled_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setBackdropEnabled:animated:");
}

id objc_msgSend__setContainerIgnoresDirectTouchEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContainerIgnoresDirectTouchEvents:");
}

id objc_msgSend__setCredential_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCredential:");
}

id objc_msgSend__setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFont:");
}

id objc_msgSend__setGlyphState_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setGlyphState:animated:");
}

id objc_msgSend__setGlyphToNoMatchWithSpecialUi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setGlyphToNoMatchWithSpecialUi:");
}

id objc_msgSend__setHeaderContentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHeaderContentViewController:");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend__setState_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setState:animated:");
}

id objc_msgSend__setTransformScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTransformScale:");
}

id objc_msgSend__setup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setup");
}

id objc_msgSend__setupAlertController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupAlertController");
}

id objc_msgSend__setupAlertControllerActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupAlertControllerActions:");
}

id objc_msgSend__setupCoachingView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupCoachingView");
}

id objc_msgSend__setupConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupConnection");
}

id objc_msgSend__setupDimming(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupDimming");
}

id objc_msgSend__setupForFixedLength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupForFixedLength");
}

id objc_msgSend__setupForVariableLength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupForVariableLength");
}

id objc_msgSend__setupGlyph(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupGlyph");
}

id objc_msgSend__setupGlyphWrapper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupGlyphWrapper:");
}

id objc_msgSend__setupHeaderContentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupHeaderContentViewController");
}

id objc_msgSend__setupSubviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupSubviews");
}

id objc_msgSend__setupToastView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupToastView");
}

id objc_msgSend__setupToastWithGlyph_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupToastWithGlyph:");
}

id objc_msgSend__setupView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupView");
}

id objc_msgSend__shake_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shake:");
}

id objc_msgSend__shakePasscodeFieldWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shakePasscodeFieldWithCompletion:");
}

id objc_msgSend__shouldCancelForApplicationChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldCancelForApplicationChange");
}

id objc_msgSend__shouldHideStatusBarForController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldHideStatusBarForController:");
}

id objc_msgSend__shouldRegisterForApplicationChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldRegisterForApplicationChange");
}

id objc_msgSend__shouldSimulateStaleRootController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldSimulateStaleRootController");
}

id objc_msgSend__shouldSkipStaleRootControllerRecovery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldSkipStaleRootControllerRecovery");
}

id objc_msgSend__showBackOffView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showBackOffView");
}

id objc_msgSend__showBackoffScreenWithMinsUntilUnblocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showBackoffScreenWithMinsUntilUnblocked:");
}

id objc_msgSend__showFailAlert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showFailAlert");
}

id objc_msgSend__showPasscodeScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showPasscodeScreen");
}

id objc_msgSend__showPasscodeView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showPasscodeView");
}

id objc_msgSend__shrinkAndRevokeWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shrinkAndRevokeWithCompletion:");
}

id objc_msgSend__spinnerStateForGlyphState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_spinnerStateForGlyphState:");
}

id objc_msgSend__style(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_style");
}

id objc_msgSend__switchToBackoffScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_switchToBackoffScreen:");
}

id objc_msgSend__systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemImageNamed:withConfiguration:");
}

id objc_msgSend__textColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_textColor");
}

id objc_msgSend__tintColorForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tintColorForState:");
}

id objc_msgSend__toastAnimationFadeIn_finished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_toastAnimationFadeIn:finished:");
}

id objc_msgSend__toastViewContraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_toastViewContraints");
}

id objc_msgSend__uiCancelWithUnderlyingError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_uiCancelWithUnderlyingError");
}

id objc_msgSend__updateConstraint_ofView_anchor1_anchor2_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateConstraint:ofView:anchor1:anchor2:constant:");
}

id objc_msgSend__updateCurrentAppearanceIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCurrentAppearanceIfNeeded");
}

id objc_msgSend__updateLightweightConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLightweightConstraints");
}

id objc_msgSend__updateLightweightConstraintsWithCoordinatedAnimations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLightweightConstraintsWithCoordinatedAnimations");
}

id objc_msgSend__updateLightweightContentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLightweightContentSize");
}

id objc_msgSend__updateOpacityForState_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateOpacityForState:animated:");
}

id objc_msgSend__updatePearlViews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePearlViews");
}

id objc_msgSend__updateStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateStyle");
}

id objc_msgSend__updateTintColorForState_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateTintColorForState:animated:");
}

id objc_msgSend__updateUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateUI");
}

id objc_msgSend__useDotPattern(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_useDotPattern");
}

id objc_msgSend__useWhitePasscodeScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_useWhitePasscodeScreen");
}

id objc_msgSend__verifyTextField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_verifyTextField:");
}

id objc_msgSend_accessoryView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessoryView");
}

id objc_msgSend_actionBackoffWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionBackoffWithReply:");
}

id objc_msgSend_actionFailureWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionFailureWithReply:");
}

id objc_msgSend_actionSuccess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionSuccess");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actions");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activate");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activeStateWithTitle_subtitle_accessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeStateWithTitle:subtitle:accessoryView:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addArrangedSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addArrangedSubview:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConstraint:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addTextFieldWithConfigurationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTextFieldWithConfigurationHandler:");
}

id objc_msgSend_alertActionsFromOptions_event_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertActionsFromOptions:event:");
}

id objc_msgSend_alertController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertController");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_alertTintFromOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertTintFromOptions:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_alphanumericFieldPlaceholder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alphanumericFieldPlaceholder");
}

id objc_msgSend_alphanumericFieldTextAlignment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alphanumericFieldTextAlignment");
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_animateToFailureStateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateToFailureStateWithCompletion:");
}

id objc_msgSend_animateToSucessStateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateToSucessStateWithCompletion:");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_animateWithDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:");
}

id objc_msgSend_animating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animating");
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_appeared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appeared");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applyBackgroundForStyle_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyBackgroundForStyle:toView:");
}

id objc_msgSend_arrangedSubviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrangedSubviews");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authenticationSubtitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticationSubtitle");
}

id objc_msgSend_authenticationTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticationTitle");
}

id objc_msgSend_backOffStateWithTitle_subtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backOffStateWithTitle:subtitle:");
}

id objc_msgSend_backgroundStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundStyle");
}

id objc_msgSend_backoffCounter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backoffCounter");
}

id objc_msgSend_bannerSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bannerSource");
}

id objc_msgSend_bannerSourceForDestination_forRequesterIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bannerSourceForDestination:forRequesterIdentifier:");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "begin");
}

id objc_msgSend_bezierPathWithRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithRect:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blackColor");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleRecordWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_cachedExternalizedContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedExternalizedContext");
}

id objc_msgSend_callerBundleId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerBundleId");
}

id objc_msgSend_callerName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerName");
}

id objc_msgSend_callerNameOverride(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerNameOverride");
}

id objc_msgSend_callerRunningOnForeground_pid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerRunningOnForeground:pid:");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_checkClearForIdleExitWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkClearForIdleExitWithCompletion:");
}

id objc_msgSend_childControllerFor_type_allowsLandscape_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "childControllerFor:type:allowsLandscape:");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearColor");
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_combinedTintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combinedTintColor");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configuration");
}

id objc_msgSend_configurationWithTextStyle_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithTextStyle:scale:");
}

id objc_msgSend_connectRemoteUI_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectRemoteUI:reply:");
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectedScenes");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:constant:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentView");
}

id objc_msgSend_contentsMultiplyColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsMultiplyColor");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDefaultConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDefaultConfiguration");
}

id objc_msgSend_createSystemApertureConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSystemApertureConfiguration");
}

id objc_msgSend_ctkPin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ctkPin");
}

id objc_msgSend_currentBackoffErrorWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentBackoffErrorWithReply:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentDeviceScreenSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDeviceScreenSize");
}

id objc_msgSend_currentPasscode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPasscode");
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTraitCollection");
}

id objc_msgSend_darkGrayColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "darkGrayColor");
}

id objc_msgSend_darkStyleWithBackgroundStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "darkStyleWithBackgroundStyle:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "data");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivate");
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivateConstraints:");
}

id objc_msgSend_decodeLocalizationKeyFromString_shouldUseDeviceVariant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeLocalizationKeyFromString:shouldUseDeviceVariant:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultStyleWithBackgroundStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultStyleWithBackgroundStyle:");
}

id objc_msgSend_defaultTextAttributes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultTextAttributes");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegates");
}

id objc_msgSend_deleteBackward(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteBackward");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_didReceiveAuthenticationData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveAuthenticationData");
}

id objc_msgSend_dimmingView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dimmingView");
}

id objc_msgSend_disableUpdateMask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableUpdateMask");
}

id objc_msgSend_disappeared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disappeared");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissChildWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissChildWithCompletionHandler:");
}

id objc_msgSend_dismissRemoteUIWasInvalidated_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissRemoteUIWasInvalidated:completionHandler:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dismissWithDelay_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissWithDelay:completion:");
}

id objc_msgSend_dismissingTemporarily(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissingTemporarily");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_dtoLearnMoreLinkURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dtoLearnMoreLinkURL");
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_endEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endEditing:");
}

id objc_msgSend_error_hasCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "error:hasCode:");
}

id objc_msgSend_errorWithCode_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithCode:message:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_externalizedContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "externalizedContext");
}

id objc_msgSend_faceIDCameraOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceIDCameraOrientation");
}

id objc_msgSend_faceIDSpinnerView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceIDSpinnerView");
}

id objc_msgSend_faceLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceLayer");
}

id objc_msgSend_fallbackActionFromOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fallbackActionFromOptions:");
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fill");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frame");
}

id objc_msgSend_functionWithControlPoints__::(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "functionWithControlPoints::::");
}

id objc_msgSend_glyphView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "glyphView");
}

id objc_msgSend_hasAlphaNumericPasscode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAlphaNumericPasscode");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_idleTimerDisable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idleTimerDisable:");
}

id objc_msgSend_imageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:");
}

id objc_msgSend_impactOccurred(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "impactOccurred");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithDefaultSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDefaultSize");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithExternalizationDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExternalizationDelegate:");
}

id objc_msgSend_initWithExternalizedContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExternalizedContext:");
}

id objc_msgSend_initWithGlyph_title_lightweightUIMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGlyph:title:lightweightUIMode:");
}

id objc_msgSend_initWithGlyphView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGlyphView:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithInitialState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInitialState:");
}

id objc_msgSend_initWithInternalInfo_mechanism_backoffCounter_remoteUIHost_allowsLandscape_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInternalInfo:mechanism:backoffCounter:remoteUIHost:allowsLandscape:");
}

id objc_msgSend_initWithInternalInfo_parent_allowsLandscape_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInternalInfo:parent:allowsLandscape:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithPasscode_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPasscode:options:");
}

id objc_msgSend_initWithPinLength_minLength_maxLength_charset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPinLength:minLength:maxLength:charset:");
}

id objc_msgSend_initWithRawValue_backgroundStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRawValue:backgroundStyle:");
}

id objc_msgSend_initWithRawValue_title_subtitle_accessoryView_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRawValue:title:subtitle:accessoryView:style:");
}

id objc_msgSend_initWithSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSettings:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_insertText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertText:");
}

id objc_msgSend_instanceId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instanceId");
}

id objc_msgSend_instruction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instruction");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_interfaceWithInternalProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithInternalProtocol:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internalErrorWithMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalErrorWithMessage:");
}

id objc_msgSend_internalInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalInfo");
}

id objc_msgSend_internalInfoWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalInfoWithReply:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invokeSuccessFeedback(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeSuccessFeedback");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isActive");
}

id objc_msgSend_isAnimating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAnimating");
}

id objc_msgSend_isApplePayPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isApplePayPolicy:");
}

id objc_msgSend_isApplePayPolicy_inApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isApplePayPolicy:inApp:");
}

id objc_msgSend_isBeingDismissed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBeingDismissed");
}

id objc_msgSend_isBiometricOnlyPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBiometricOnlyPolicy:");
}

id objc_msgSend_isClarityBoardRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isClarityBoardRunning");
}

id objc_msgSend_isComplex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isComplex");
}

id objc_msgSend_isDynamicIslandAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDynamicIslandAvailable");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFirstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFirstResponder");
}

id objc_msgSend_isFullScreenController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFullScreenController");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHidden");
}

id objc_msgSend_isLocalizationKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocalizationKey:");
}

id objc_msgSend_isLocationBasedPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocationBasedPolicy:");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isRemoteViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRemoteViewController");
}

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSharedIPad");
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSuspended");
}

id objc_msgSend_isUiReady(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUiReady");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isViewLoaded");
}

id objc_msgSend_keyboardLayoutGuide(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardLayoutGuide");
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelColor");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutFrame");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_lightPasscodeLockViewForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lightPasscodeLockViewForStyle:");
}

id objc_msgSend_lightStyleWithBackgroundStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lightStyleWithBackgroundStyle:");
}

id objc_msgSend_lightweightUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lightweightUI");
}

id objc_msgSend_lightweightUIMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lightweightUIMode");
}

id objc_msgSend_localizedCallerName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedCallerName");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedShortName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedShortName");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeViewControllerWith_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeViewControllerWith:delegate:");
}

id objc_msgSend_mechanism(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mechanism");
}

id objc_msgSend_mechanismEvent_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mechanismEvent:reply:");
}

id objc_msgSend_mechanismEvent_value_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mechanismEvent:value:reply:");
}

id objc_msgSend_modelSpecificLocalizedStringKeyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelSpecificLocalizedStringKeyForKey:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_newInstanceId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newInstanceId");
}

id objc_msgSend_newTaskId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newTaskId");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "now");
}

id objc_msgSend_numberOfTouches(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfTouches");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_okButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "okButton");
}

id objc_msgSend_onDismiss(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onDismiss");
}

id objc_msgSend_onDynamicIslandPresented(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onDynamicIslandPresented");
}

id objc_msgSend_opacity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "opacity");
}

id objc_msgSend_openSessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSessions");
}

id objc_msgSend_openURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:");
}

id objc_msgSend_openURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:withOptions:error:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "options");
}

id objc_msgSend_passcode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcode");
}

id objc_msgSend_passcodeBackOffViewCanceled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcodeBackOffViewCanceled:");
}

id objc_msgSend_passcodeContentViewControllerForPasscode_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcodeContentViewControllerForPasscode:options:");
}

id objc_msgSend_passcodeField(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcodeField");
}

id objc_msgSend_passcodeLength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcodeLength");
}

id objc_msgSend_passcodeLockViewForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcodeLockViewForStyle:");
}

id objc_msgSend_passcodeScreenStyleWithPolicy_options_darkInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcodeScreenStyleWithPolicy:options:darkInterface:");
}

id objc_msgSend_passcodeType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcodeType");
}

id objc_msgSend_passcodeVerificationFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcodeVerificationFinished:");
}

id objc_msgSend_passcodeViewCancelButtonPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcodeViewCancelButtonPressed:");
}

id objc_msgSend_passcodeViewForPasscode_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcodeViewForPasscode:style:");
}

id objc_msgSend_passcodeViewPasscodeDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcodeViewPasscodeDidChange:");
}

id objc_msgSend_passcodeViewPasscodeEntered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcodeViewPasscodeEntered:");
}

id objc_msgSend_pearlUIState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pearlUIState");
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentDomainForName:");
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentIdentifier");
}

id objc_msgSend_pinCancelled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pinCancelled");
}

id objc_msgSend_pinCharset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pinCharset");
}

id objc_msgSend_pinEntered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pinEntered:");
}

id objc_msgSend_pinLength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pinLength");
}

id objc_msgSend_pinMaxLength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pinMaxLength");
}

id objc_msgSend_pinMinLength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pinMinLength");
}

id objc_msgSend_pinTextField(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pinTextField");
}

id objc_msgSend_pinValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pinValue");
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "policy");
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "position");
}

id objc_msgSend_postNotificationWithNewBoolState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationWithNewBoolState:");
}

id objc_msgSend_postPresentable_options_userInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postPresentable:options:userInfo:error:");
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredContentSizeCategory");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_prepare(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepare");
}

id objc_msgSend_presentOnParentViewController_animated_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentOnParentViewController:animated:completionHandler:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentationController");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentingViewController");
}

id objc_msgSend_processHomeButtonPressed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processHomeButtonPressed");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processInfo");
}

id objc_msgSend_purgeBuffers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeBuffers");
}

id objc_msgSend_quaternaryLabelColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quaternaryLabelColor");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rawValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rawValue");
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redColor");
}

id objc_msgSend_registerForTraitChanges_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTraitChanges:withHandler:");
}

id objc_msgSend_remoteUIHost(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteUIHost");
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllAnimations");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeLastCharacter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLastCharacter");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_replacePassphraseCredentialWithPurpose_passphrase_scope_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replacePassphraseCredentialWithPurpose:passphrase:scope:error:");
}

id objc_msgSend_requestAlertingAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAlertingAssertion");
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestIdentifier");
}

id objc_msgSend_requestNegativeResponseAnimation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestNegativeResponseAnimation");
}

id objc_msgSend_requestSceneSessionDestruction_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestSceneSessionDestruction:options:errorHandler:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reset");
}

id objc_msgSend_resetForFailedPasscode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetForFailedPasscode");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resignFirstResponder");
}

id objc_msgSend_resize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resize:");
}

id objc_msgSend_resolvedColorWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolvedColorWithTraitCollection:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_revokePresentableWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revokePresentableWithCompletionHandler:");
}

id objc_msgSend_revokePresentableWithRequestIdentifier_reason_animated_userInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rightAnchor");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "role");
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootController");
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safeAreaInsets");
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safeAreaLayoutGuide");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scale");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondaryLabelColor");
}

id objc_msgSend_secureDataWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secureDataWithString:");
}

id objc_msgSend_sendSubviewToBack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSubviewToBack:");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session");
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityIdentifier:");
}

id objc_msgSend_setActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActions:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAlertController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlertController:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAnimating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimating:");
}

id objc_msgSend_setAnimationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationStyle:");
}

id objc_msgSend_setAnimationsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationsEnabled:");
}

id objc_msgSend_setAttributedPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedPlaceholder:");
}

id objc_msgSend_setAuthenticationSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationSubtitle:");
}

id objc_msgSend_setAuthenticationTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationTitle:");
}

id objc_msgSend_setAutomaticallyInvalidatable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticallyInvalidatable:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAxis:");
}

id objc_msgSend_setBackdropVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackdropVisible:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackoffCounter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackoffCounter:");
}

id objc_msgSend_setBackoffTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackoffTimeout:");
}

id objc_msgSend_setBarStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBarStyle:");
}

id objc_msgSend_setBiometricAuthenticationAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBiometricAuthenticationAllowed:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderStyle:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setCancelButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelButton:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setComputesColorSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setComputesColorSettings:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentsMultiplyColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentsMultiplyColor:");
}

id objc_msgSend_setCoolOffDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCoolOffDuration:");
}

id objc_msgSend_setCornerCurve_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerCurve:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCredential_forProcessedEvent_credentialType_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCredential:forProcessedEvent:credentialType:reply:");
}

id objc_msgSend_setDamping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDamping:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setDevicePasscodeEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDevicePasscodeEntry:");
}

id objc_msgSend_setDimEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDimEnabled:");
}

id objc_msgSend_setDimLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDimLevel:");
}

id objc_msgSend_setDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirection:");
}

id objc_msgSend_setDisableUpdateMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableUpdateMask:");
}

id objc_msgSend_setDismissalAnimationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissalAnimationStyle:");
}

id objc_msgSend_setDismissingTemporarily_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissingTemporarily:");
}

id objc_msgSend_setDisplacement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplacement:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEffect:");
}

id objc_msgSend_setElementNeedsUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementNeedsUpdate");
}

id objc_msgSend_setElementNeedsUpdateWithCoordinatedAnimations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementNeedsUpdateWithCoordinatedAnimations:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setFaceVisibility_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFaceVisibility:animated:");
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFill");
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillMode:");
}

id objc_msgSend_setFinishedColor_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFinishedColor:animated:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromValue:");
}

id objc_msgSend_setGlyph_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGlyph:");
}

id objc_msgSend_setGlyphView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGlyphView:");
}

id objc_msgSend_setHasWhiteBackground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasWhiteBackground:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setIdleColor_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdleColor:animated:");
}

id objc_msgSend_setIdleTimerDisabled_forReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdleTimerDisabled:forReason:");
}

id objc_msgSend_setInitialStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialStyle:");
}

id objc_msgSend_setInputAccessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputAccessoryView:");
}

id objc_msgSend_setInstruction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstruction:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsInstructionHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInstructionHidden:");
}

id objc_msgSend_setItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItems:");
}

id objc_msgSend_setKeyboardAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardAppearance:");
}

id objc_msgSend_setKeyboardType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardType:");
}

id objc_msgSend_setLaunchingInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchingInterfaceOrientation:");
}

id objc_msgSend_setMass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMass:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setModalTransitionStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalTransitionStyle:");
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsDisplay");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsStatusBarAppearanceUpdate");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOnDismiss_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnDismiss:");
}

id objc_msgSend_setOnDynamicIslandPresented_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnDynamicIslandPresented:");
}

id objc_msgSend_setOnTap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnTap:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setPasscodeFocused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPasscodeFocused:");
}

id objc_msgSend_setPaused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPaused:");
}

id objc_msgSend_setPearlUIState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPearlUIState:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setPreferredAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredAction:");
}

id objc_msgSend_setPreferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredStyle:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRenderingHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRenderingHint:");
}

id objc_msgSend_setReturnKeyType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnKeyType:");
}

id objc_msgSend_setSecureTextEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecureTextEntry:");
}

id objc_msgSend_setShakeEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShakeEnabled:");
}

id objc_msgSend_setShowsEmergencyCallButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsEmergencyCallButton:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setStackingLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStackingLevel:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setState_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:animated:");
}

id objc_msgSend_setStiffness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStiffness:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setStyle_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:animated:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitle:");
}

id objc_msgSend_setSuspended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuspended:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTextContentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextContentType:");
}

id objc_msgSend_setTimingFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimingFunction:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleColor:forState:");
}

id objc_msgSend_setTitleText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleText:");
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToValue:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVelocity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVelocity:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewController:");
}

id objc_msgSend_setWallpaperStyle_withDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWallpaperStyle:withDuration:");
}

id objc_msgSend_setWallpaperTunnelActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWallpaperTunnelActive:");
}

id objc_msgSend_settingsForPrivateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsForPrivateStyle:");
}

id objc_msgSend_settingsForPrivateStyle_graphicsQuality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsForPrivateStyle:graphicsQuality:");
}

id objc_msgSend_setupConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupConnection");
}

id objc_msgSend_shake(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shake");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shouldPresentWithAnimation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldPresentWithAnimation");
}

id objc_msgSend_silentInternalErrorWithMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "silentInternalErrorWithMessage:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "size");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByPaddingToLength:withString:startingAtIndex:");
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "style");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitle");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subviews");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "superview");
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suspend");
}

id objc_msgSend_suspendConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suspendConnection");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_systemApertureElementContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemApertureElementContext");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemBlueColor");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemGreenColor");
}

id objc_msgSend_systemLightGrayTintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLightGrayTintColor");
}

id objc_msgSend_systemPinkColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemPinkColor");
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemUptime");
}

id objc_msgSend_tertiaryLabelColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tertiaryLabelColor");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "text");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "title");
}

id objc_msgSend_toastController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toastController");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_traitCollectionWithUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollectionWithUserInterfaceStyle:");
}

id objc_msgSend_truncateString_maxLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "truncateString:maxLength:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_uiCancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uiCancel");
}

id objc_msgSend_uiCancelWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uiCancelWithError:");
}

id objc_msgSend_uiDismissed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uiDismissed");
}

id objc_msgSend_uiEvent_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uiEvent:options:");
}

id objc_msgSend_uiFailureWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uiFailureWithError:");
}

id objc_msgSend_uiFallback(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uiFallback");
}

id objc_msgSend_uiOpenURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uiOpenURL:");
}

id objc_msgSend_uiSuccessWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uiSuccessWithResult:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updateFrame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFrame");
}

id objc_msgSend_updateLayoutForWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLayoutForWidth:");
}

id objc_msgSend_updateStatusText_subtitle_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStatusText:subtitle:animated:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceStyle");
}

id objc_msgSend_usesFrontBoardServicesForRemoteUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "usesFrontBoardServicesForRemoteUI");
}

id objc_msgSend_variableLength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "variableLength");
}

id objc_msgSend_verifyPasscode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyPasscode:");
}

id objc_msgSend_verifyPasscode_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyPasscode:reply:");
}

id objc_msgSend_verifyPasswordUsingAKS_acmContext_userId_policy_options_bioLockoutRecovery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyPasswordUsingAKS:acmContext:userId:policy:options:bioLockoutRecovery:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewController");
}

id objc_msgSend_viewDidLayoutSubviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewDidLayoutSubviews");
}

id objc_msgSend_viewModelDidReceiveAuthenticationDataWithInternalInfo_mechanism_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewModelDidReceiveAuthenticationDataWithInternalInfo:mechanism:");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_willMoveToParent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveToParent:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "window");
}

id objc_msgSend_withStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withStyle:");
}
