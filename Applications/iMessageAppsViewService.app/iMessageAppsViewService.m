void sub_1000015C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000016A8(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  v3 = sub_100006854();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100006918((uint64_t)v2, v4);

}

void sub_1000018B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1000018CC(id a1, _UIStickerRepresentation *a2, unint64_t a3, BOOL *a4)
{
  void *v4;
  unsigned __int8 v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_UIStickerRepresentation role](a2, "role", a3, a4));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.stickers.role.still"));

  return v5;
}

uint64_t sub_10000190C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000191C(uint64_t a1)
{

}

uint64_t sub_100001924(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "__ck_heicsImageData"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setData:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100001D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_100001D38(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_remoteProxy"));
  objc_msgSend(v4, "stageSticker:", v3);

}

_QWORD *sub_100001D84(_QWORD *result, int a2)
{
  _QWORD *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t buf[4];
  uint64_t v7;

  if (a2)
  {
    v2 = result;
    v3 = sub_100006854();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = v2[4];
      *(_DWORD *)buf = 138412290;
      v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Donating sticker to recents with identifier %@", buf, 0xCu);
    }

    return objc_msgSend(sub_100001E48(), "donateStickerToRecentsWithIdentifier:representations:stickerEffectType:externalURI:name:accessibilityLabel:metadata:ckAttributionInfo:", v2[4], v2[5], v2[11], v2[6], v2[7], v2[8], v2[9], v2[10]);
  }
  return result;
}

id sub_100001E48()
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
  v0 = (void *)qword_100012570;
  v7 = qword_100012570;
  if (!qword_100012570)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100002C90;
    v3[3] = &unk_10000C558;
    v3[4] = &v4;
    sub_100002C90((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100001EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100001F98(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___UIStickerPickerHostProtocol));
  v2 = (void *)qword_100012530;
  qword_100012530 = v1;

}

void sub_10000200C(id a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  NSSet *v4;
  id v5;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___UIStickerPickerServiceProtocol));
  v2 = (void *)qword_100012540;
  qword_100012540 = v1;

  v3 = (void *)qword_100012540;
  v4 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSString));
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, "setHostBundleID:", 0, 0);

}

int64_t sub_100002590(id a1, STKStickerRepresentation *a2, STKStickerRepresentation *a3)
{
  STKStickerRepresentation *v4;
  STKStickerRepresentation *v5;
  int64_t v6;

  v4 = a2;
  v5 = a3;
  if (-[STKStickerRepresentation isPreferred](v4, "isPreferred")
    && (-[STKStickerRepresentation isPreferred](v5, "isPreferred") & 1) != 0)
  {
    v6 = 0;
  }
  else if ((-[STKStickerRepresentation isPreferred](v4, "isPreferred") & 1) != 0)
  {
    v6 = -1;
  }
  else
  {
    v6 = -[STKStickerRepresentation isPreferred](v5, "isPreferred");
  }

  return v6;
}

void sub_1000029BC(uint64_t a1, int a2)
{
  void *v3;
  void *v4;

  if (a2)
    objc_msgSend(sub_100001E48(), "donateStickerToRecents:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend((id)qword_100012558, "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    v3 = (void *)qword_100012550;
    qword_100012550 = 0;

    v4 = (void *)qword_100012558;
    qword_100012558 = 0;

  }
}

Class sub_100002B9C(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_100012568)
  {
    v5 = off_10000C578;
    v6 = 0;
    qword_100012568 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_100012568)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("STKStickerKeyboardRecentCollectionViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_100006A3C();
LABEL_8:
    free(v2);
  }
  qword_100012560 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100002C90(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_100012578)
  {
    v5 = off_10000C590;
    v6 = 0;
    qword_100012578 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_100012578)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("CKChatController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_100006A60();
LABEL_8:
    free(v2);
  }
  qword_100012570 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100002D84(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_100012588)
  {
    v5 = off_10000C5A8;
    v6 = 0;
    qword_100012588 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_100012588)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("AVTUsageTracker");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_100006A84();
LABEL_8:
    free(v2);
  }
  qword_100012580 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100002E78(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_1000030D0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stickerPickerCardDidLoad");
}

void sub_10000318C(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "appPresenter"));
  objc_msgSend(v1, "updateAppFrameForRotation");

}

void sub_100003658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003678(uint64_t a1, int a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _UNKNOWN **v12;
  void *v13;
  signed int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 buf;
  void (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;

  if (a2)
  {
    v3 = sub_100006854();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stickerIdentifier"));
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Donating sticker to recents with identifier %@", (uint8_t *)&buf, 0xCu);

    }
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v6 = (void *)qword_1000125B8;
    v23 = qword_1000125B8;
    if (!qword_1000125B8)
    {
      *(_QWORD *)&buf = _NSConcreteStackBlock;
      *((_QWORD *)&buf + 1) = 3221225472;
      v25 = sub_100004C68;
      v26 = &unk_10000C558;
      v27 = &v20;
      sub_100004C68((uint64_t)&buf);
      v6 = (void *)v21[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v20, 8);
    v8 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v9 = a1 + 32;
    v11 = *(_QWORD *)(v9 + 16);
    v12 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stickerEffectType"));
    v13 = v12;
    if (!v12)
      v12 = &off_10000CA50;
    v14 = objc_msgSend(v12, "intValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)v9, "externalURI"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)v9, "stickerName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)v9, "accessibilityLabel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)v9, "metadata"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)v9, "ckAttributionInfo"));
    objc_msgSend(v7, "donateStickerToRecentsWithIdentifier:representations:stickerEffectType:externalURI:name:accessibilityLabel:metadata:ckAttributionInfo:", v10, v11, v14, v15, v16, v17, v18, v19, v20);

  }
}

void sub_100003884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003CF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003D20(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v11;
  id v12;
  NSObject *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  NSObject *v23;
  NSString *v24;
  void *v25;
  int v26;
  void *v27;
  CGRect v28;
  CGRect v29;

  v11 = a2;
  if (v11)
  {
    v12 = sub_100006854();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100006AD4(v11);

  }
  v28.origin.x = a3;
  v28.origin.y = a4;
  v28.size.width = a5;
  v28.size.height = a6;
  if (!CGRectIsNull(v28))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "window"));
    objc_msgSend(v15, "convertRect:toCoordinateSpace:", v17, a3, a4, a5, a6);
    a3 = v18;
    a4 = v19;
    a5 = v20;
    a6 = v21;

    v22 = sub_100006854();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v29.origin.x = a3;
      v29.origin.y = a4;
      v29.size.width = a5;
      v29.size.height = a6;
      v24 = NSStringFromCGRect(v29);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = 138412290;
      v27 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Added sticker to %@", (uint8_t *)&v26, 0xCu);

    }
  }
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(a3, a4, a5, a6);

}

void sub_100004074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004090(uint64_t a1, void *a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;

  v13 = a2;
  v14 = a3;
  if (v14)
  {
    v15 = sub_100006854();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100006AD4(v14);

  }
  v25.origin.x = a4;
  v25.origin.y = a5;
  v25.size.width = a6;
  v25.size.height = a7;
  if (!CGRectIsNull(v25))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "window"));
    objc_msgSend(v18, "convertRect:toCoordinateSpace:", v20, a4, a5, a6, a7);
    a4 = v21;
    a5 = v22;
    a6 = v23;
    a7 = v24;

  }
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(a4, a5, a6, a7);

}

void sub_100004338(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = sub_100006854();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100006AD4(v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_100004510(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = sub_100006854();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100006AD4(v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_100004798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000047F8(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___UIStickerPickerHostProtocol));
  v2 = (void *)qword_100012598;
  qword_100012598 = v1;

}

void sub_10000486C(id a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  NSSet *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSSet *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSSet *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSSet *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSSet *v30;
  void *v31;
  void *v32;
  NSSet *v33;
  id v34;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___UIStickerPickerServiceProtocol));
  v2 = (void *)qword_1000125A8;
  qword_1000125A8 = v1;

  v3 = (void *)qword_1000125A8;
  v4 = objc_opt_class(_UIStickerRepresentation);
  v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, objc_opt_class(NSArray), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, "addStickerToStoreWithRepresentations:completionHandler:", 0, 0);

  v7 = (void *)qword_1000125A8;
  v8 = objc_opt_class(_UIStickerRepresentation);
  v9 = objc_opt_class(NSArray);
  v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, objc_opt_class(NSUUID), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v11, "addStickerToStoreWithRepresentations:completionWithStickerIDs:", 0, 0);

  v12 = (void *)qword_1000125A8;
  v13 = objc_opt_class(NSArray);
  v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(NSUUID), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v15, "addStickerToStoreWithRepresentations:completionWithStickerIDs:", 1, 1);

  v16 = (void *)qword_1000125A8;
  v17 = objc_opt_class(_UIStickerRepresentation);
  v18 = objc_opt_class(NSArray);
  v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v18, objc_opt_class(NSUUID), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v20, "addStickerToStoreWithRepresentations:sourceRect:completion:", 0, 0);

  v21 = (void *)qword_1000125A8;
  v22 = objc_opt_class(NSArray);
  v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v22, objc_opt_class(NSUUID), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v24, "addStickerToStoreWithRepresentations:sourceRect:completion:", 0, 1);

  v25 = (void *)qword_1000125A8;
  v26 = objc_opt_class(NSArray);
  v27 = objc_opt_class(NSUUID);
  v28 = objc_opt_class(NSDictionary);
  v29 = objc_opt_class(NSString);
  v30 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v26, v27, v28, v29, objc_opt_class(NSNumber), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  objc_msgSend(v25, "setClasses:forSelector:argumentIndex:ofReply:", v31, "animatedStickerCreationProgressChanged:progress:", 0, 0);

  v32 = (void *)qword_1000125A8;
  v33 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSString));
  v34 = (id)objc_claimAutoreleasedReturnValue(v33);
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v34, "setHostBundleID:", 0, 0);

}

void sub_100004C68(uint64_t a1)
{
  sub_100004CBC();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CKChatController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000125B8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100006A60();
    sub_100004CBC();
  }
}

void sub_100004CBC()
{
  char *v0;
  char *v1;
  __int128 v2;
  uint64_t v3;

  v1 = 0;
  if (!qword_1000125C0)
  {
    v2 = off_10000C6F0;
    v3 = 0;
    qword_1000125C0 = _sl_dlopen(&v2, &v1);
  }
  v0 = v1;
  if (!qword_1000125C0)
  {
    v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }
  if (v1)
LABEL_7:
    free(v0);
}

Class sub_100004D68(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_1000125D0)
  {
    v5 = off_10000C708;
    v6 = 0;
    qword_1000125D0 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_1000125D0)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("AVTUsageTracker");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_100006A84();
LABEL_8:
    free(v2);
  }
  qword_1000125C8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100004E5C(uint64_t a1)
{
  Class result;

  sub_100004CBC();
  result = objc_getClass("CKPluginExtensionStateObserver");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_100006B4C();
  qword_1000125D8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100004EB0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100005068(uint64_t a1, int token)
{
  uint64_t result;
  uint64_t v4;
  int v5;
  uint64_t v6;
  BOOL v7;
  char v8;
  uint64_t state64;

  state64 = 0;
  result = notify_get_state(token, &state64);
  v4 = state64;
  v5 = state64 != 0;
  v6 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v6 + 28) != v5)
  {
    *(_BYTE *)(v6 + 28) = v5;
    v8 = 1;
    result = SBSGetScreenLockStatus(&v8);
    if (v4)
      v7 = v8 == 0;
    else
      v7 = 1;
    if (!v7)
      return (uint64_t)objc_msgSend(*(id *)(a1 + 32), "_didBecomeLocked");
  }
  return result;
}

void sub_100005198(uint64_t a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume");
  v1 = sub_100006854();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Listening", v3, 2u);
  }

}

void sub_1000053DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005414(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;
  _DWORD v4[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sub_100006854();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = objc_msgSend(WeakRetained, "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Source connection interrupted from PID %d", (uint8_t *)v4, 8u);
  }

  objc_msgSend(WeakRetained, "invalidate");
}

void sub_1000054D0(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;
  _DWORD v4[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sub_100006854();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = objc_msgSend(WeakRetained, "processIdentifier");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Source connection invalidated from PID %d", (uint8_t *)v4, 8u);
  }

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

void sub_100005994(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "appPresenter"));
  objc_msgSend(v1, "updateAppFrameForRotation");

}

void sub_100005B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005D70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100005DDC(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___UIKeyboardMediaHostProtocol));
  v2 = (void *)qword_1000125E8;
  qword_1000125E8 = v1;

}

void sub_100005E50(id a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  NSSet *v4;
  id v5;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___UIKeyboardMediaServiceProtocol));
  v2 = (void *)qword_1000125F8;
  qword_1000125F8 = v1;

  v3 = (void *)qword_1000125F8;
  v4 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSString));
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, "setHostBundleID:", 0, 0);

}

Class sub_100005F5C(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_100012610)
  {
    v5 = off_10000C7D8;
    v6 = 0;
    qword_100012610 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_100012610)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("AVTUsageTracker");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_100006A84();
LABEL_8:
    free(v2);
  }
  qword_100012608 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100006264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000064F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000065A4(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___UIKeyboardMediaHostProtocol));
  v2 = (void *)qword_100012618;
  qword_100012618 = v1;

}

void sub_100006618(id a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  NSSet *v4;
  id v5;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___UIKeyboardMediaServiceProtocol));
  v2 = (void *)qword_100012628;
  qword_100012628 = v1;

  v3 = (void *)qword_100012628;
  v4 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSString));
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, "setHostBundleID:", 0, 0);

}

Class sub_1000066AC(uint64_t a1)
{
  Class result;

  sub_100006700();
  result = objc_getClass("AVTStickerRecentsViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_100006B70();
  qword_100012638 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100006700()
{
  char *v0;
  char *v1;
  __int128 v2;
  uint64_t v3;

  v1 = 0;
  if (!qword_100012640)
  {
    v2 = off_10000C830;
    v3 = 0;
    qword_100012640 = _sl_dlopen(&v2, &v1);
  }
  v0 = v1;
  if (!qword_100012640)
  {
    v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }
  if (v1)
LABEL_7:
    free(v0);
}

Class sub_1000067AC(uint64_t a1)
{
  Class result;

  sub_100006700();
  result = objc_getClass("AVTAvatarStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_100006B94();
  qword_100012648 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100006800(uint64_t a1)
{
  Class result;

  sub_100006700();
  result = objc_getClass("AVTUsageTracker");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_100012650 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100006A84();
    return (Class)sub_100006854();
  }
  return result;
}

id sub_100006854()
{
  if (qword_100012660 != -1)
    dispatch_once(&qword_100012660, &stru_10000C848);
  return (id)qword_100012658;
}

void sub_100006894(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Messages", "iMessageAppsViewService");
  v2 = (void *)qword_100012658;
  qword_100012658 = (uint64_t)v1;

}

void sub_100006918(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Remote proxy error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000698C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002E90();
  sub_100002E78((void *)&_mh_execute_header, v0, v1, "Expecting the sticker callback via _MSStickerSendManagerDelegate", v2, v3, v4, v5, v6);
  sub_100002E88();
}

void sub_1000069B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002E90();
  sub_100002E78((void *)&_mh_execute_header, v0, v1, "Can't create photos from inline recent stickers", v2, v3, v4, v5, v6);
  sub_100002E88();
}

void sub_1000069E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002E90();
  sub_100002E78((void *)&_mh_execute_header, v0, v1, "Can't present view controllers from inline recent stickers", v2, v3, v4, v5, v6);
  sub_100002E88();
}

void sub_100006A10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002E90();
  sub_100002E78((void *)&_mh_execute_header, v0, v1, "Inline recents doesn't support showBrowserForPluginIdentifier:style:completion", v2, v3, v4, v5, v6);
  sub_100002E88();
}

uint64_t sub_100006A3C()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "STKStickerKeyboardRecentCollectionViewController");
  return sub_100006A60(v0);
}

uint64_t sub_100006A60()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "CKChatController");
  return sub_100006A84(v0);
}

uint64_t sub_100006A84()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "AVTUsageTracker");
  return sub_100006AA8(v0);
}

void sub_100006AA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002E90();
  sub_100002E78((void *)&_mh_execute_header, v0, v1, "Unable to add sticker to store: missing remote stickers view", v2, v3, v4, v5, v6);
  sub_100002E88();
}

void sub_100006AD4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_100004ED0();
  sub_100004EB0((void *)&_mh_execute_header, v2, v3, "Unable to add sticker to store: %@", v4, v5, v6, v7, v8);

  sub_100004EC4();
}

void sub_100006B4C()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "CKPluginExtensionStateObserver");
  sub_100006B70(v0);
}

void sub_100006B70()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "AVTStickerRecentsViewController");
  sub_100006B94(v0);
}

void sub_100006B94()
{
  const void *v0;

  v0 = (const void *)abort_report_np("Unable to find class %s", "AVTAvatarStore");
  CFRelease(v0);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend___ck_heicsImageData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__ck_heicsImageData");
}

id objc_msgSend__addStickerAnimationDidFinishWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addStickerAnimationDidFinishWithCompletion:");
}

id objc_msgSend__addStickerToStoreWithRepresentations_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addStickerToStoreWithRepresentations:completionHandler:");
}

id objc_msgSend__addStickerToStoreWithRepresentations_completionWithStickerIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addStickerToStoreWithRepresentations:completionWithStickerIDs:");
}

id objc_msgSend__addStickerToStoreWithRepresentations_sourceRect_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addStickerToStoreWithRepresentations:sourceRect:completion:");
}

id objc_msgSend__addStickerToStoreWithUISticker_sourceRect_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addStickerToStoreWithUISticker:sourceRect:completion:");
}

id objc_msgSend__animatedStickerCreationProgressChanged_progress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_animatedStickerCreationProgressChanged:progress:");
}

id objc_msgSend__didBecomeLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_didBecomeLocked");
}

id objc_msgSend__didRemoveStickerPreview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_didRemoveStickerPreview");
}

id objc_msgSend__hostApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hostApplicationBundleIdentifier");
}

id objc_msgSend__hostAuditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hostAuditToken");
}

id objc_msgSend__performBlockAfterCATransactionCommits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performBlockAfterCATransactionCommits:");
}

id objc_msgSend__remoteProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteProxy");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__stickerRepresentationsForImageFileURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stickerRepresentationsForImageFileURL:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityLabel");
}

id objc_msgSend_accessibilityName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityName");
}

id objc_msgSend_adamID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adamID");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_appPresenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appPresenter");
}

id objc_msgSend_applyEffect_toSticker_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyEffect:toSticker:completion:");
}

id objc_msgSend_applyToImage_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyToImage:completion:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_attributionInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributionInfo");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_ckAttributionInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckAttributionInfo");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_compactHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compactHeight");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_convertRect_toCoordinateSpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertRect:toCoordinateSpace:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentAppViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentAppViewController");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentStickerViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentStickerViewController");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_disableAutomaticAppDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableAutomaticAppDiscovery");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissCard");
}

id objc_msgSend_donateStickerToRecents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "donateStickerToRecents:");
}

id objc_msgSend_donateStickerToRecentsWithIdentifier_representations_stickerEffectType_externalURI_name_accessibilityLabel_metadata_ckAttributionInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "donateStickerToRecentsWithIdentifier:representations:stickerEffectType:externalURI:name:accessibilityLabel:metadata:ckAttributionInfo:");
}

id objc_msgSend_draggedStickerToPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "draggedStickerToPoint:");
}

id objc_msgSend_effect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effect");
}

id objc_msgSend_effectWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectWithType:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_externalURI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "externalURI");
}

id objc_msgSend_fileHandleForReadingAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForReadingAtPath:");
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURL");
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "horizontalSizeClass");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_imageFileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageFileURL");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_initWithContentsOfURL_externalURI_localizedDescription_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:externalURI:localizedDescription:error:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithStickerIdentifier_representations_stickerName_effectType_externalURI_localizedDescription_metadata_attributionInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStickerIdentifier:representations:stickerName:effectType:externalURI:localizedDescription:metadata:attributionInfo:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isPreferred(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPreferred");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_loadAppWithIdentifierIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadAppWithIdentifierIfNeeded:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadata");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_pasteImageAtFileHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pasteImageAtFileHandle:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_presentAppWithBundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentAppWithBundleIdentifier:completion:");
}

id objc_msgSend_presentCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentCard");
}

id objc_msgSend_presentFullScreenModalAppWithBundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentFullScreenModalAppWithBundleIdentifier:completion:");
}

id objc_msgSend_presentPopoverAppWithBundleIdentifier_sourceRect_inView_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentPopoverAppWithBundleIdentifier:sourceRect:inView:completion:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_remoteHandlesRecentsStickerDonationWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteHandlesRecentsStickerDonationWithCompletionHandler:");
}

id objc_msgSend_representations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "representations");
}

id objc_msgSend_requestInsertionPointCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestInsertionPointCompletion:");
}

id objc_msgSend_requestStageStickerWithIdentifier_representations_name_effectType_externalURI_accessibilityLabel_metadata_ckAttributionInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestStageStickerWithIdentifier:representations:name:effectType:externalURI:accessibilityLabel:metadata:ckAttributionInfo:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_screenCoordinate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenCoordinate");
}

id objc_msgSend_setAccessibilityLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityLabel:");
}

id objc_msgSend_setAttributionInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributionInfo:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setCompactHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompactHeight:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEffectType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEffectType:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setExternalURI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExternalURI:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHostBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostBundleID:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNextPresentationIsFullscreenModal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNextPresentationIsFullscreenModal:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setRepresentations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRepresentations:");
}

id objc_msgSend_setRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRole:");
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSize:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_stageSticker_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stageSticker:");
}

id objc_msgSend_stageStickerWithFileHandle_url_accessibilityLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stageStickerWithFileHandle:url:accessibilityLabel:");
}

id objc_msgSend_stageStickerWithIdentifier_representations_name_externalURI_accessibilityLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stageStickerWithIdentifier:representations:name:externalURI:accessibilityLabel:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_stickerDragActiveInCurrentProcess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stickerDragActiveInCurrentProcess");
}

id objc_msgSend_stickerEffectType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stickerEffectType");
}

id objc_msgSend_stickerIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stickerIdentifier");
}

id objc_msgSend_stickerName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stickerName");
}

id objc_msgSend_stickerPackGUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stickerPackGUID");
}

id objc_msgSend_stickerPickerCardDidLoad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stickerPickerCardDidLoad");
}

id objc_msgSend_stickerRecentsController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stickerRecentsController");
}

id objc_msgSend_stickerRecentsControllerForStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stickerRecentsControllerForStore:");
}

id objc_msgSend_stickersHostViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stickersHostViewController");
}

id objc_msgSend_trackStickerSentFromHostBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trackStickerSentFromHostBundleIdentifier:");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_updateAppFrameForRotation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAppFrameForRotation");
}

id objc_msgSend_updatePopoverWindowLocation_inView_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePopoverWindowLocation:inView:completion:");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_uti(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uti");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}
