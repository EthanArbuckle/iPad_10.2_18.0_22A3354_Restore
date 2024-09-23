void sub_100004768(uint64_t a1)
{
  NSString *v1;
  os_log_t v2;
  void *v3;
  id v4;

  v1 = NSStringFromClass(*(Class *)(a1 + 32));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v1));
  v2 = os_log_create("com.apple.email", (const char *)objc_msgSend(v4, "UTF8String"));
  v3 = (void *)qword_10001F908;
  qword_10001F908 = (uint64_t)v2;

}

void sub_1000047C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100004918(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1000049A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_1000049C4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v22;

  v5 = a2;
  v6 = a3;
  objc_opt_self(a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MSMailActivityHandoffComposeKeyAutosaveID));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MSMailActivityHandoffComposeKeyPreferredSendingEmailAddress));
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSAutosave autosave](MSAutosave, "autosave"));
    v11 = objc_msgSend(v10, "hasAutosavedMessageWithIdentifier:", v8);

    if (v11)
    {
      v22 = v6;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MSMailActivityHandoffComposeKeySubject));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MSMailActivityHandoffComposeKeyOriginalMessageObjectID));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[EMObjectID objectIDFromSerializedRepresentation:](EMObjectID, "objectIDFromSerializedRepresentation:", v13));
      v15 = objc_alloc((Class)_MFMailCompositionContext);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "daemonInterface"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "messageRepository"));
      v18 = objc_msgSend(v15, "initRecoveredAutosavedMessageWithIdentifier:draftSubject:messageRepository:originalMessageObjectID:", v8, v12, v17, v14);

      v6 = v22;
      if (!v9)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v18 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initWithComposeType:", 0);
  if (v9)
LABEL_6:
    objc_msgSend(v18, "setPreferredSendingEmailAddress:", v9);
LABEL_7:
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MSMailActivityHandoffComposeKeyDeferredAction));
  objc_msgSend(v18, "setDeferredAction:", objc_msgSend(v19, "integerValue"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MSMailActivityHandoffComposeKeyDeferredActionUserInfo));
  objc_msgSend(v18, "setDeferredActionUserInfo:", v20);

  return v18;
}

void sub_100004BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_100004D9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100004E80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100004F10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000506C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000532C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v9 = v6;

  _Unwind_Resume(a1);
}

BOOL sub_1000053D8(void *a1)
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  if (!a1)
    return 0;
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_mailComposeController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "subject"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

void sub_100005434(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000054A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100005580(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

id sub_1000055BC(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;

  v1 = a1;
  v2 = v1;
  if (!v1 || (v3 = v1, objc_msgSend(v1, "isEqualToString:", &stru_100018898)))
  {
    if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
      v4 = sub_100005EC8(CFSTR("NEW_MESSAGE_LONG"));
    else
      v4 = sub_100005EC8(CFSTR("NEW_MESSAGE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(v4);

  }
  return v3;
}

void sub_100005640(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000570C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000057B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000581C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1000058A8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1000058C0(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a2)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "session"));
    objc_msgSend(v7, "requestSceneSessionRefresh:", v6);

  }
}

void sub_10000596C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v12;

  _Unwind_Resume(a1);
}

void sub_1000059B4(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "presentedViewController"));
    v6 = objc_opt_class(UIImagePickerController, v5);
    isKindOfClass = objc_opt_isKindOfClass(v4, v6);

    if ((isKindOfClass & 1) != 0)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100005B40;
      v8[3] = &unk_100018538;
      v9 = v3;
      objc_msgSend(a1, "dismissViewControllerAnimated:completion:", 1, v8);

    }
    else
    {
      (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
    }
  }

}

void sub_100005A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_100005AE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100005B30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_100005B40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100005BD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100005C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100005D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

uint64_t sub_100005D60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100005E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

uint64_t sub_100005E40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100005E84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_100005EC8(void *a1)
{
  id v1;
  uint64_t v2;
  NSBundle *v3;
  void *v4;
  void *v5;

  v1 = a1;
  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MFMailComposeController, v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v1, &stru_100018898, CFSTR("Main")));

  return v5;
}

void sub_100005F44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100005FC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100006174(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000066C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000689C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_100006954(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100006C1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100006D4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100006ED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_10000709C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10000724C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10000739C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1000075C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  void *v24;
  id *v25;
  void *v26;
  void *v27;
  id *v28;
  void *v29;
  uint64_t v30;

  objc_destroyWeak(v28);
  objc_destroyWeak(v25);
  objc_destroyWeak((id *)(v30 - 104));

  _Unwind_Resume(a1);
}

id sub_100007668(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateHeadersWithModel:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setNavigationDelegate:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "snapshotImageView"));
  objc_msgSend(v5, "frame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");

  v6 = *(_QWORD *)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "snapshotImageView"));
  objc_msgSend(WeakRetained, "insertSubview:below:", v6, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  objc_msgSend(WeakRetained, "setContentLoadingPromise:", v8);

  v9 = *(void **)(a1 + 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "htmlContent"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "loadHTMLString:baseURL:", v10, 0));
  objc_msgSend(WeakRetained, "setExpectedContentNavigation:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentLoadingPromise"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "future"));

  return v13;
}

void sub_100007794(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id sub_1000077D4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "completionHandlerAdapter"));
  objc_msgSend(v3, "takeSnapshotWithConfiguration:completionHandler:", 0, v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "future"));
  return v5;
}

void sub_100007848(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_100007864(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setNavigationDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "snapshotImageView"));
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1000079C0;
  v13 = &unk_1000185D8;
  v14 = WeakRetained;
  v6 = v3;
  v15 = v6;
  +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v5, 5242880, &v10, 0, 0.25);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", v10, v11, v12, v13, v14));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithResult:](EFFuture, "futureWithResult:", v7));

  return v8;
}

void sub_10000797C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1000079C0(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "snapshotImageView"));
  objc_msgSend(v2, "setImage:", v1);

}

void sub_1000079FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100007A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100007AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100007EDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100008090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1000080E4(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "webview"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "snapshotContentUsingWebView:", v2));

  v3 = objc_msgSend(v4, "result");
}

void sub_100008140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1000082C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v20 = v18;

  _Unwind_Resume(a1);
}

void sub_100008324()
{
  void *v0;

  JUMPOUT(0x100008318);
}

void sub_100008330()
{
  JUMPOUT(0x100008318);
}

void sub_100008338(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSAutosave autosave](MSAutosave, "autosave"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "autosavedMessageDataWithIdentifier:", *(_QWORD *)(a1 + 32)));

  v8 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "result:", &v8));
  v5 = v8;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v5);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMessage messageWithRFC822Data:](MFMailMessage, "messageWithRFC822Data:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_placeholderContentWithMessage:", v6));
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v7);

  }
}

void sub_100008418(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1000085E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id sub_100008654(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (objc_msgSend(v1, "count"))
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "ef_map:", &stru_100018668));
  else
    v2 = 0;

  return v2;
}

void sub_1000086A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_10000875C(id a1, NSString *a2)
{
  NSString *v2;
  id v3;

  v2 = a2;
  v3 = objc_msgSend(objc_alloc((Class)CNComposeRecipient), "initWithContact:address:kind:", 0, v2, 0);

  return v3;
}

void sub_1000087A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100008A00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_100008B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;

  a9.super_class = (Class)ComposeServiceRemoteViewController;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_100008C44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100008D14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100008E38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100008F20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100008FF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100009180(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000092FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100009434(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000094F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1000095A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100009828(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_100009C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_100009D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10000A114(_Unwind_Exception *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  void *v17;
  va_list va;

  va_start(va, a17);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A1AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = MFLogGeneral(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#CompositionServices Background task expired (framesForAttachmentsWithIdentifiers)", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v5, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

}

void sub_10000A23C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000A368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  void *v13;
  va_list va;

  va_start(va, a13);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A3A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = MFLogGeneral(a1, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#CompositionServices Background task expired (autosaveWithReply)", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v5, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

}

void sub_10000A430(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000A440(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;

  v3 = a2;
  v5 = MFLogGeneral(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = a1[4];
    v9 = 134218242;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#CompositionServices %p: Identifier for autosaved composition: %@", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(a1[5] + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v8, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));

}

void sub_10000A53C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000A618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t sub_10000A630(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000A6D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t sub_10000A6E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000AAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

_CDContact *__cdecl sub_10000AC40(id a1, NSString *a2)
{
  NSString *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSString emailAddressValue](v2, "emailAddressValue"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "simpleAddress"));

  if (v4)
  {
    v5 = objc_alloc((Class)_CDContact);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString emailAddressValue](v2, "emailAddressValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "simpleAddress"));
    v4 = objc_msgSend(v5, "initWithIdentifier:type:displayName:personId:personIdType:", v7, 2, 0, 0, 0);

  }
  return (_CDContact *)v4;
}

void sub_10000ACE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

_CDAttachment *__cdecl sub_10000AD14(id a1, NSString *a2)
{
  NSString *v2;
  id v3;

  v2 = a2;
  v3 = objc_alloc_init((Class)_CDAttachment);
  objc_msgSend(v3, "setUti:", v2);

  return (_CDAttachment *)v3;
}

void sub_10000AD5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_10000AD78(id a1, NSString *a2)
{
  NSString *v2;
  id v3;
  id v4;

  v2 = a2;
  v3 = objc_alloc_init((Class)_CDAttachment);
  v4 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v2);
  objc_msgSend(v3, "setIdentifier:", v4);

  return v3;
}

void sub_10000ADE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

id sub_10000AE0C(id a1, NSString *a2)
{
  NSString *v2;
  id v3;
  id v4;

  v2 = a2;
  v3 = objc_alloc_init((Class)_CDAttachment);
  v4 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v2);
  objc_msgSend(v3, "setIdentifier:", v4);

  return v3;
}

void sub_10000AE74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

_CDAttachment *__cdecl sub_10000AEA0(id a1, NSString *a2)
{
  NSString *v2;
  id v3;
  void *v4;

  v2 = a2;
  v3 = objc_alloc_init((Class)_CDAttachment);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v2));
  objc_msgSend(v3, "setContentURL:", v4);

  objc_msgSend(v3, "setUti:", CFSTR("public.url"));
  return (_CDAttachment *)v3;
}

void sub_10000AF18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

_CDAttachment *__cdecl sub_10000AF44(id a1, NSString *a2)
{
  NSString *v2;
  id v3;

  v2 = a2;
  v3 = objc_alloc_init((Class)_CDAttachment);
  objc_msgSend(v3, "setContentText:", v2);
  objc_msgSend(v3, "setUti:", CFSTR("public.plain-text"));

  return (_CDAttachment *)v3;
}

void sub_10000AF9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000AFB8(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  int v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;

  v5 = a3;
  v7 = MFLogGeneral(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_hostApplicationBundleIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
    v11 = (void *)v10;
    v12 = CFSTR("No");
    v13 = 138412802;
    v14 = v9;
    v15 = 2112;
    if (a2)
      v12 = CFSTR("Yes");
    v16 = v12;
    v17 = 2112;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#CompositionServices Recorded interaction from %@ with success %@, error %@.", (uint8_t *)&v13, 0x20u);

  }
}

void sub_10000B0CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000B19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_10000B1F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id sub_10000B2B8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentSaveDeleteDialogOrClose");
}

void sub_10000B3F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_10000B6F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10000B7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_10000B8CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000B954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10000B9AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000BA08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10000BEC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_10000C1F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000C254(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000C2CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10000C398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v10;

  _Unwind_Resume(a1);
}

void sub_10000C410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10000C478(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000CB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_10000CCC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_10000CD34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = objc_autoreleasePoolPush();
  v5 = UIApplicationMain(a1, a2, 0, 0);
  v7 = MFLogGeneral(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#CompositionServices MailCompositionService exiting...", v10, 2u);
  }

  objc_autoreleasePoolPop(v4);
  return v5;
}

void sub_10000D06C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000D134(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_10000D144(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDocked:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

void sub_10000D1D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000D284(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000D460(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000D4E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000D630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_10000D704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_10000D7B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000D830(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGPath");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UTITypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTITypes");
}

id objc_msgSend__createPrimaryViews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createPrimaryViews");
}

id objc_msgSend__createSubviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createSubviews");
}

id objc_msgSend__dimmingViewColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dimmingViewColor");
}

id objc_msgSend__dockedViewWithTitle_andFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dockedViewWithTitle:andFrame:");
}

id objc_msgSend__hostApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hostApplicationBundleIdentifier");
}

id objc_msgSend__hostAuditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hostAuditToken");
}

id objc_msgSend__mailComposeController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mailComposeController");
}

id objc_msgSend__mailComposeView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mailComposeView");
}

id objc_msgSend__placeholderContentWithMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_placeholderContentWithMessage:");
}

id objc_msgSend__prepareLayer_forView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareLayer:forView:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__requestContentForActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requestContentForActivity:");
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rootSheetPresentationController");
}

id objc_msgSend__setAllowsTearOff_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setAllowsTearOff:");
}

id objc_msgSend__setContinuousCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setContinuousCornerRadius:");
}

id objc_msgSend__setLocalOverrideTraitCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setLocalOverrideTraitCollection:");
}

id objc_msgSend__setSubject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setSubject:");
}

id objc_msgSend__updateHeadersWithModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateHeadersWithModel:");
}

id objc_msgSend__updateIndividualFieldsWithModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateIndividualFieldsWithModel:");
}

id objc_msgSend__updateMultiFieldWithModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateMultiFieldWithModel:");
}

id objc_msgSend__updateShadow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateShadow");
}

id objc_msgSend__updateShadowPathIfNeededForChangeFromRect_toRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateShadowPathIfNeededForChangeFromRect:toRect:");
}

id objc_msgSend_accountRepository(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountRepository");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addAttachmentData_mimeType_fileName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAttachmentData:mimeType:fileName:");
}

id objc_msgSend_addAttachmentData_mimeType_fileName_contentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAttachmentData:mimeType:fileName:contentID:");
}

id objc_msgSend_addAttachmentDataItemProvider_mimeType_filename_contentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAttachmentDataItemProvider:mimeType:filename:contentID:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
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

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachmentContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachmentContext");
}

id objc_msgSend_autosave(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autosave");
}

id objc_msgSend_autosaveIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autosaveIdentifier");
}

id objc_msgSend_autosaveIfNecessaryWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autosaveIfNecessaryWithHandler:");
}

id objc_msgSend_autosaveWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autosaveWithHandler:");
}

id objc_msgSend_autosavedMessageDataWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autosavedMessageDataWithIdentifier:");
}

id objc_msgSend_backUpDraft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backUpDraft");
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundColor");
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundView");
}

id objc_msgSend_bcc(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bcc");
}

id objc_msgSend_bccField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bccField");
}

id objc_msgSend_bccRecipients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bccRecipients");
}

id objc_msgSend_beginBackgroundTaskWithExpirationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginBackgroundTaskWithExpirationHandler:");
}

id objc_msgSend_bestAlternativePart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bestAlternativePart");
}

id objc_msgSend_bezierPathWithRoundedRect_cornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bezierPathWithRoundedRect:cornerRadius:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_blinkAnimation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blinkAnimation");
}

id objc_msgSend_blinkLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blinkLayer");
}

id objc_msgSend_bodyFinishedDrawing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bodyFinishedDrawing");
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_cc(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cc");
}

id objc_msgSend_ccField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ccField");
}

id objc_msgSend_ccRecipients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ccRecipients");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_cloudPhotoIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudPhotoIDs");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_completionHandlerAdapter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionHandlerAdapter");
}

id objc_msgSend_composeTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "composeTitle");
}

id objc_msgSend_compositionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compositionContext");
}

id objc_msgSend_contentFuturesByID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentFuturesByID");
}

id objc_msgSend_contentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentID");
}

id objc_msgSend_contentLoadingPromise(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentLoadingPromise");
}

id objc_msgSend_contentText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentText");
}

id objc_msgSend_contentURLs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentURLs");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentView");
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertRect:fromView:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_cornerCurve(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cornerCurve");
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cornerRadius");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_daemonInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daemonInterface");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultCornerRadius(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCornerRadius");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_deliveryAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deliveryAccounts");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didAppear(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didAppear");
}

id objc_msgSend_dimmingLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dimmingLayer");
}

id objc_msgSend_directionalLayoutMargins(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "directionalLayoutMargins");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_docked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "docked");
}

id objc_msgSend_documentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "documentID");
}

id objc_msgSend_donateShareInteractionToDuet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "donateShareInteractionToDuet");
}

id objc_msgSend_ef_compactMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_compactMap:");
}

id objc_msgSend_ef_map_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_map:");
}

id objc_msgSend_ef_publicDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_publicDescription");
}

id objc_msgSend_emailAddressValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emailAddressValue");
}

id objc_msgSend_endBackgroundTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endBackgroundTask:");
}

id objc_msgSend_falseEdgeShadowView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "falseEdgeShadowView");
}

id objc_msgSend_falseShadowEdge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "falseShadowEdge");
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileName");
}

id objc_msgSend_finishWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWithError:");
}

id objc_msgSend_finishWithResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWithResult:");
}

id objc_msgSend_firstSender(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstSender");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_frameForAttachmentWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameForAttachmentWithIdentifier:");
}

id objc_msgSend_fromField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fromField");
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "future");
}

id objc_msgSend_futureWithResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "futureWithResult:");
}

id objc_msgSend_globalAsyncScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalAsyncScheduler");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasAutosavedMessageWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasAutosavedMessageWithIdentifier:");
}

id objc_msgSend_hasDuetDonationContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasDuetDonationContext");
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerView");
}

id objc_msgSend_hostApplicationDidEnterBackground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostApplicationDidEnterBackground");
}

id objc_msgSend_hostApplicationWillEnterForeground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostApplicationWillEnterForeground");
}

id objc_msgSend_htmlContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "htmlContent");
}

id objc_msgSend_initRecoveredAutosavedMessageWithIdentifier_draftSubject_messageRepository_originalMessageObjectID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initRecoveredAutosavedMessageWithIdentifier:draftSubject:messageRepository:originalMessageObjectID:");
}

id objc_msgSend_initWithActivityType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActivityType:");
}

id objc_msgSend_initWithComposeType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithComposeType:");
}

id objc_msgSend_initWithComposition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithComposition:");
}

id objc_msgSend_initWithComposition_mailComposeControllerOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithComposition:mailComposeControllerOptions:");
}

id objc_msgSend_initWithCompositionContext_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCompositionContext:options:");
}

id objc_msgSend_initWithCompositionValueRepresentation_hostApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCompositionValueRepresentation:hostApplicationBundleIdentifier:");
}

id objc_msgSend_initWithContact_address_kind_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContact:address:kind:");
}

id objc_msgSend_initWithCustomView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCustomView:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_isQuickReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:isQuickReply:");
}

id objc_msgSend_initWithFrame_subject_modelFuture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:subject:modelFuture:");
}

id objc_msgSend_initWithIdentifier_type_displayName_personId_personIdType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:type:displayName:personId:personIdType:");
}

id objc_msgSend_initWithTargetView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTargetView:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_insertSubview_above_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertSubview:above:");
}

id objc_msgSend_insertSubview_below_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertSubview:below:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interactionRecorder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interactionRecorder");
}

id objc_msgSend_isDirty(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDirty");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHidden");
}

id objc_msgSend_isQuickReply(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isQuickReply");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutMargins");
}

id objc_msgSend_leftBarButtonItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftBarButtonItem");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadHTMLString_baseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadHTMLString:baseURL:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mailComposeView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mailComposeView");
}

id objc_msgSend_mailDockedPlaceholderViewBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mailDockedPlaceholderViewBackgroundColor");
}

id objc_msgSend_mailHeaderSeparatorLayerColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mailHeaderSeparatorLayerColor");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_mainThreadScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainThreadScheduler");
}

id objc_msgSend_messageRepository(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageRepository");
}

id objc_msgSend_messageWithRFC822Data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageWithRFC822Data:");
}

id objc_msgSend_mf_isPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mf_isPad");
}

id objc_msgSend_mf_updateAlertSuppressionContextsForReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mf_updateAlertSuppressionContextsForReason:");
}

id objc_msgSend_modelFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelFuture");
}

id objc_msgSend_multiField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multiField");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationBar");
}

id objc_msgSend_navigationBarTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationBarTitle");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectID");
}

id objc_msgSend_objectIDFromSerializedRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectIDFromSerializedRepresentation:");
}

id objc_msgSend_onScheduler_then_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onScheduler:then:");
}

id objc_msgSend_originalMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalMessage");
}

id objc_msgSend_originatingBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originatingBundleID");
}

id objc_msgSend_overlayView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overlayView");
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentViewController");
}

id objc_msgSend_performBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performBlock:");
}

id objc_msgSend_photoIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photoIDs");
}

id objc_msgSend_placeholderFromSerializedRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "placeholderFromSerializedRepresentation:");
}

id objc_msgSend_preferredHeaderHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredHeaderHeight");
}

id objc_msgSend_preferredSendingEmailAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredSendingEmailAddress");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_promise(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promise");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_recordInteractions_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordInteractions:completionHandler:");
}

id objc_msgSend_registerClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerClass:");
}

id objc_msgSend_reloadAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadAccounts");
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperlayer");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_requestSceneSessionRefresh_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestSceneSessionRefresh:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_result_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result:");
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightBarButtonItem");
}

id objc_msgSend_roundedBackgroundView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "roundedBackgroundView");
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaInsets");
}

id objc_msgSend_saveFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveFirstResponder");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_scrollToTopAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scrollToTopAnimated:");
}

id objc_msgSend_securityScopeForURL_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "securityScopeForURL:withHandler:");
}

id objc_msgSend_senderAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "senderAddress");
}

id objc_msgSend_separatorHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "separatorHeight");
}

id objc_msgSend_serialDispatchQueueSchedulerWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialDispatchQueueSchedulerWithName:");
}

id objc_msgSend_serializedPlaceholderForFileName_fileSize_mimeType_contentID_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializedPlaceholderForFileName:fileSize:mimeType:contentID:withHandler:");
}

id objc_msgSend_serializedRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializedRepresentation");
}

id objc_msgSend_serviceCompositionFinishedWithResult_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceCompositionFinishedWithResult:error:");
}

id objc_msgSend_serviceCompositionRequestsSendWithBody_recipients_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceCompositionRequestsSendWithBody:recipients:completion:");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session");
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityIdentifier:");
}

id objc_msgSend_setAccountDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccountDescription:");
}

id objc_msgSend_setAllowsGroupOpacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsGroupOpacity:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAttachments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttachments:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAutoreverses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoreverses:");
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAxis:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundView:");
}

id objc_msgSend_setBccRecipients_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBccRecipients:");
}

id objc_msgSend_setBundleId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleId:");
}

id objc_msgSend_setCcRecipients_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCcRecipients:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCompositionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompositionContext:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentLoadingPromise_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentLoadingPromise:");
}

id objc_msgSend_setContentText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentText:");
}

id objc_msgSend_setContentURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentURL:");
}

id objc_msgSend_setContentVariationAttachmentCID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentVariationAttachmentCID:");
}

id objc_msgSend_setContentView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentView:");
}

id objc_msgSend_setContentVisible_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentVisible:");
}

id objc_msgSend_setCornerCurve_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerCurve:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setDeferredAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeferredAction:");
}

id objc_msgSend_setDeferredActionUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeferredActionUserInfo:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDirection:");
}

id objc_msgSend_setDirectionalLayoutMargins_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDirectionalLayoutMargins:");
}

id objc_msgSend_setDocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDocked:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEndDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndDate:");
}

id objc_msgSend_setEndPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndPoint:");
}

id objc_msgSend_setExpectedContentNavigation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExpectedContentNavigation:");
}

id objc_msgSend_setFalseEdgeShadowView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFalseEdgeShadowView:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setGradientColors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGradientColors:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHostIdentifier_forAttachment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostIdentifier:forAttachment:");
}

id objc_msgSend_setHtmlContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHtmlContent:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setIndicatesUnsafeRecipientsWhenCollapsed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIndicatesUnsafeRecipientsWhenCollapsed:");
}

id objc_msgSend_setIsForEditing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsForEditing:");
}

id objc_msgSend_setIsPlaceholder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsPlaceholder:");
}

id objc_msgSend_setItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItems:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLayoutMargins_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLayoutMargins:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setLocations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocations:");
}

id objc_msgSend_setMailComposeDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMailComposeDelegate:");
}

id objc_msgSend_setMaskedCorners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaskedCorners:");
}

id objc_msgSend_setMechanism_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMechanism:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNavigationDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNavigationDelegate:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setOriginatingBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOriginatingBundleID:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setPreferredSendingEmailAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredSendingEmailAddress:");
}

id objc_msgSend_setPrefersGrabberVisible_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrefersGrabberVisible:");
}

id objc_msgSend_setRecipients_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecipients:");
}

id objc_msgSend_setRemoteViewControllerProxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteViewControllerProxy:");
}

id objc_msgSend_setRepeatCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRepeatCount:");
}

id objc_msgSend_setSelectedAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectedAddress:");
}

id objc_msgSend_setSenderAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSenderAddress:");
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowOffset:");
}

id objc_msgSend_setShadowOpacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowOpacity:");
}

id objc_msgSend_setShadowPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowPath:");
}

id objc_msgSend_setShadowRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowRadius:");
}

id objc_msgSend_setShowSenderAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowSenderAddress:");
}

id objc_msgSend_setSourceAccountManagement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceAccountManagement:");
}

id objc_msgSend_setStartPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartPoint:");
}

id objc_msgSend_setTargetBundleId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetBundleId:");
}

id objc_msgSend_setTargetContentIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetContentIdentifier:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitleLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleLabel:");
}

id objc_msgSend_setToRecipients_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setToRecipients:");
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setToValue:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setUti_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUti:");
}

id objc_msgSend_shadowOpacity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shadowOpacity");
}

id objc_msgSend_shadowRadius(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shadowRadius");
}

id objc_msgSend_shadowVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shadowVisible");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_shouldAutorotate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldAutorotate");
}

id objc_msgSend_shouldUseMultiField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldUseMultiField");
}

id objc_msgSend_showSenderAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showSenderAddress");
}

id objc_msgSend_showSenderField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showSenderField");
}

id objc_msgSend_simpleAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "simpleAddress");
}

id objc_msgSend_snapshotContentUsingWebView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotContentUsingWebView:");
}

id objc_msgSend_snapshotImageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotImageView");
}

id objc_msgSend_snapshotQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotQueue");
}

id objc_msgSend_sourceAccountManagement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceAccountManagement");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_subject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subject");
}

id objc_msgSend_subjectField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subjectField");
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "superlayer");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "superview");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_systemMinimumLayoutMargins(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemMinimumLayoutMargins");
}

id objc_msgSend_takeSnapshotWithConfiguration_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "takeSnapshotWithConfiguration:completionHandler:");
}

id objc_msgSend_targetView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetView");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_to(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "to");
}

id objc_msgSend_toField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toField");
}

id objc_msgSend_toRecipients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toRecipients");
}

id objc_msgSend_topItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topItem");
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topViewController");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_traitCollectionWithUserInterfaceLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollectionWithUserInterfaceLevel:");
}

id objc_msgSend_transitionWithView_duration_options_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionWithView:duration:options:animations:completion:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_userActivityForRestoration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userActivityForRestoration");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceStyle");
}

id objc_msgSend_valueWithCGRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithCGRect:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_webview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webview");
}

id objc_msgSend_willDisappear(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willDisappear");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windowScene");
}
