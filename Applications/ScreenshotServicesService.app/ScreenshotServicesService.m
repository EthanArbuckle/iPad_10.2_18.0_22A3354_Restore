void sub_100005C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005C88(uint64_t a1, void *a2)
{
  CGContext *v3;
  CGFloat v4;
  CGFloat v5;
  CGImage *v6;
  CGRect v7;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextScaleCTM(v3, 1.0, -1.0);
  CGContextTranslateCTM(v3, 0.0, -*(double *)(a1 + 48));
  v4 = *(double *)(a1 + 40);
  v5 = *(double *)(a1 + 48);
  v6 = (CGImage *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGImage");
  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.width = v4;
  v7.size.height = v5;
  CGContextDrawImage(v3, v7, v6);
}

void sub_100005DE8(uint64_t a1)
{
  sub_100005E3C();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("LPLinkMetadata");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000AD6B0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100057438();
    sub_100005E3C();
  }
}

void sub_100005E3C()
{
  char *v0;
  char *v1;
  __int128 v2;
  uint64_t v3;

  v1 = 0;
  if (!qword_1000AD6B8)
  {
    v2 = off_100091868;
    v3 = 0;
    qword_1000AD6B8 = _sl_dlopen(&v2, &v1);
  }
  v0 = v1;
  if (!qword_1000AD6B8)
  {
    v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }
  if (v1)
LABEL_7:
    free(v0);
}

Class sub_100005EE8(uint64_t a1)
{
  Class result;
  uint64_t v3;

  sub_100005E3C();
  result = objc_getClass("LPFileMetadata");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000AD6C0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = sub_10005745C();
    return (Class)sub_100005F3C(v3);
  }
  return result;
}

Class sub_100005F3C(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;
  id v5;

  sub_100005E3C();
  result = objc_getClass("LPImage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000AD6C8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)sub_100057480();
    return (Class)+[UIImage _sss_imageFromScreenshot:](v3, v4, v5);
  }
  return result;
}

void sub_100006224(uint64_t a1, void *a2)
{
  CGContext *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  CGFloat x;
  CGFloat y;
  void *v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v29;
  _BYTE v30[128];
  CGRect v31;

  v17 = a2;
  v3 = (CGContext *)objc_msgSend(v17, "CGContext");
  v20 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v29.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  v19 = *(_OWORD *)&v29.a;
  *(_OWORD *)&v29.c = v20;
  *(_OWORD *)&v29.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v18 = *(_OWORD *)&v29.tx;
  CGAffineTransformMakeScale(&t2, 1.0, -1.0);
  *(_OWORD *)&t1.a = v19;
  *(_OWORD *)&t1.c = v20;
  *(_OWORD *)&t1.tx = v18;
  CGAffineTransformConcat(&v29, &t1, &t2);
  CGAffineTransformMakeTranslation(&v26, 0.0, *(CGFloat *)(a1 + 48));
  v25 = v29;
  CGAffineTransformConcat(&t1, &v25, &v26);
  v29 = t1;
  CGContextConcatCTM(v3, &t1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "originalAnnotations"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "originalAnnotations"));
  v6 = objc_msgSend(v5, "copy");

  objc_sync_exit(v4);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v10);
        v12 = objc_autoreleasePoolPush();
        CGContextSaveGState(v3);
        objc_msgSend(v11, "integralDrawingBounds");
        x = v31.origin.x;
        y = v31.origin.y;
        if (!CGRectIsInfinite(v31))
          CGContextTranslateCTM(v3, x, y);
        v25.a = 0.0;
        *(_QWORD *)&v25.b = &v25;
        *(_QWORD *)&v25.c = 0x2050000000;
        v15 = (void *)qword_1000AD6D0;
        *(_QWORD *)&v25.d = qword_1000AD6D0;
        if (!qword_1000AD6D0)
        {
          *(_QWORD *)&t1.a = _NSConcreteStackBlock;
          *(_QWORD *)&t1.b = 3221225472;
          *(_QWORD *)&t1.c = sub_100006648;
          *(_QWORD *)&t1.d = &unk_100091848;
          *(_QWORD *)&t1.tx = &v25;
          sub_100006648((uint64_t)&t1);
          v15 = *(void **)(*(_QWORD *)&v25.b + 24);
        }
        v16 = objc_retainAutorelease(v15);
        _Block_object_dispose(&v25, 8);
        objc_msgSend(v16, "renderAnnotation:inContext:", v11, v3);
        CGContextRestoreGState(v3);
        objc_autoreleasePoolPop(v12);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v8);
  }

}

void sub_1000064FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  void *v25;

  objc_sync_exit(v25);
  _Unwind_Resume(a1);
}

void sub_10000652C(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  CGRect v13;

  v12 = a2;
  v3 = -*(double *)(a1 + 48);
  v4 = -*(double *)(a1 + 56);
  v5 = *(double *)(a1 + 80);
  v6 = *(double *)(a1 + 88);
  v7 = SSCGImageBackedImageFromImage(*(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v8, "drawInRect:", v3, v4, v5, v6);
  if (*(double *)(a1 + 96) > 0.0 && (_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages") & 1) == 0)
  {
    CGContextSaveGState((CGContextRef)objc_msgSend(v12, "CGContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "colorWithAlphaComponent:", *(double *)(a1 + 96)));
    objc_msgSend(v10, "set");

    v13.size.width = *(CGFloat *)(a1 + 104);
    v13.size.height = *(CGFloat *)(a1 + 112);
    v13.origin.x = 0.0;
    v13.origin.y = 0.0;
    UIRectFillUsingBlendMode(v13, kCGBlendModeNormal);
    CGContextRestoreGState((CGContextRef)objc_msgSend(v12, "CGContext"));
  }
  v11 = *(void **)(a1 + 40);
  if (v11)
    objc_msgSend(v11, "drawInRect:", v3, v4, v5, v6);

}

Class sub_100006648(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_1000AD6D8)
  {
    v5 = off_1000918A8;
    v6 = 0;
    qword_1000AD6D8 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_1000AD6D8)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("AKController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_1000574A4();
LABEL_8:
    free(v2);
  }
  qword_1000AD6D0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100006AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006C0C(uint64_t a1)
{
  sub_100006C60();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("LPLinkMetadata");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000AD6E0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100057438();
    sub_100006C60();
  }
}

void sub_100006C60()
{
  char *v0;
  char *v1;
  __int128 v2;
  uint64_t v3;

  v1 = 0;
  if (!qword_1000AD6E8)
  {
    v2 = off_1000918C0;
    v3 = 0;
    qword_1000AD6E8 = _sl_dlopen(&v2, &v1);
  }
  v0 = v1;
  if (!qword_1000AD6E8)
  {
    v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }
  if (v1)
LABEL_7:
    free(v0);
}

Class sub_100006D0C(uint64_t a1)
{
  Class result;
  uint64_t v3;

  sub_100006C60();
  result = objc_getClass("LPFileMetadata");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000AD6F0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = sub_10005745C();
    return (Class)sub_100006D60(v3);
  }
  return result;
}

Class sub_100006D60(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  sub_100006C60();
  result = objc_getClass("LPImage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000AD6F8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)sub_100057480();
    return +[SSSPathView layerClass](v3, v4);
  }
  return result;
}

void sub_100007258(id a1)
{
  exit(0);
}

id sub_10000A320(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setUserInteractionEnabled:", 0);
}

id sub_10000A338(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopFlash");
}

id sub_10000A340(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopFlash");
}

void sub_10000A9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10000BF94(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_1000AD708)
  {
    v5 = off_100091940;
    v6 = 0;
    qword_1000AD708 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_1000AD708)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("AKInkAnnotation");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_1000574C8();
LABEL_8:
    free(v2);
  }
  qword_1000AD700 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000C088(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSSApplication sharedSSSApplication](SSSApplication, "sharedSSSApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sssAppDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllerManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000C164;
  v8[3] = &unk_100091960;
  v9 = v5;
  v10 = v1;
  v6 = v1;
  v7 = v5;
  objc_msgSend(v7, "fullscreenifyWithCompletion:", v8);

}

void sub_10000C164(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void **v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v2));
  if (objc_msgSend(v3, "count"))
  {
    while (1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
      objc_opt_class(SSSScrollView, v5);
      if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
        break;
      objc_msgSend(v3, "removeObjectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subviews"));
      objc_msgSend(v3, "addObjectsFromArray:", v7);

      if (!objc_msgSend(v3, "count"))
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    v4 = 0;
  }

  if (!v4)
  {
    v14 = os_log_create("com.apple.screenshotservices", "XPC");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000574EC(v14, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_21;
  }
  if ((+[RPTTestRunner isRecapAvailable](RPTTestRunner, "isRecapAvailable") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v8));
    if (objc_msgSend(v9, "count"))
    {
      while (1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
        objc_opt_class(SSSScreenshotsView, v11);
        if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
          break;
        objc_msgSend(v9, "removeObjectAtIndex:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subviews"));
        objc_msgSend(v9, "addObjectsFromArray:", v13);

        if (!objc_msgSend(v9, "count"))
        {
          v10 = 0;
          break;
        }
      }

    }
    else
    {
      v10 = 0;
    }

    if (v10)
    {
      v26 = RPTGetBoundsForView(v4);
      v28 = v27;
      v30 = v29;
      v32 = v31 * 0.6;
      v33 = objc_alloc((Class)RPTScrollViewTestParameters);
      v42 = _NSConcreteStackBlock;
      v43 = 3221225472;
      v44 = sub_10000C5E0;
      v45 = &unk_100091960;
      v46 = *(id *)(a1 + 32);
      v47 = *(id *)(a1 + 40);
      v34 = objc_msgSend(v33, "initWithTestName:scrollView:completionHandler:", CFSTR("GlitchFreeHero"), v4, &v42);
      objc_msgSend(v34, "setDirection:", 2, v42, v43, v44, v45);
      objc_msgSend(v34, "setPreventSheetDismissal:", 1);
      objc_msgSend(v34, "setShouldFlick:", 0);
      objc_msgSend(v34, "setScrollingBounds:", v26, v28, v30, v32);
      +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v34);

      v25 = v46;
      goto LABEL_18;
    }
    v14 = os_log_create("com.apple.screenshotservices", "XPC");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100057520(v14, v35, v36, v37, v38, v39, v40, v41);
LABEL_21:

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_22;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v22, "startedTest:", CFSTR("GlitchFreeHero"));

  objc_msgSend(v4, "contentSize");
  v24 = v23;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10000C520;
  v48[3] = &unk_100091960;
  v49 = *(id *)(a1 + 32);
  v50 = *(id *)(a1 + 40);
  objc_msgSend(v4, "_simulateScrollWithTranslation:duration:willBeginDragging:didEndDragging:willBeginDecelerating:didEndDecelerating:", 0, 0, 0, v48, v24, 0.0, 0.75);

  v25 = v49;
LABEL_18:

LABEL_22:
}

void sub_10000C520(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v2, "finishedTest:", CFSTR("GlitchFreeHero"));

  v3 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C674;
  v7[3] = &unk_100091960;
  v8 = v4;
  v9 = v3;
  v5 = v4;
  v6 = v9;
  objc_msgSend(v5, "pipifyWithCompletion:", v7);

}

void sub_10000C5E0(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000C668;
  v3[3] = &unk_100091960;
  v4 = v2;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v4, "pipifyWithCompletion:", v3);

}

id sub_10000C668(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "performProgrammaticDismissWithCompletion:", *(_QWORD *)(a1 + 40));
}

id sub_10000C674(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "performProgrammaticDismissWithCompletion:", *(_QWORD *)(a1 + 40));
}

void sub_10000C680(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

_QWORD *sub_10000CB48(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  SSSCropOverlayView *v3;
  uint64_t v4;
  void *v5;
  SSSUncroppedOccludingView *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v1 = result;
  v2 = (_QWORD *)result[4];
  if (!v2[1])
  {
    v3 = objc_alloc_init(SSSCropOverlayView);
    v4 = v1[4];
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    objc_msgSend(*(id *)(v1[4] + 8), "setLineGrabberAlpha:", *(double *)(v1[4] + 312));
    objc_msgSend(*(id *)(v1[4] + 8), "setCornerGrabberAlpha:", *(double *)(v1[4] + 296));
    objc_msgSend(*(id *)(v1[4] + 8), "setLineAlpha:", *(double *)(v1[4] + 304));
    result = objc_msgSend((id)v1[4], "addSubview:", *(_QWORD *)(v1[4] + 8));
    v2 = (_QWORD *)v1[4];
  }
  if (!v2[6])
  {
    v6 = objc_alloc_init(SSSUncroppedOccludingView);
    v7 = v1[4];
    v8 = *(void **)(v7 + 48);
    *(_QWORD *)(v7 + 48) = v6;

    objc_msgSend((id)v1[4], "insertSubview:belowSubview:", *(_QWORD *)(v1[4] + 64), *(_QWORD *)(v1[4] + 8));
    result = objc_msgSend(*(id *)(v1[4] + 64), "addSubview:", *(_QWORD *)(v1[4] + 48));
    v2 = (_QWORD *)v1[4];
  }
  if (!v2[13])
  {
    v9 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", v1[4], "_handleOverlayViewResize:");
    v10 = v1[4];
    v11 = *(void **)(v10 + 104);
    *(_QWORD *)(v10 + 104) = v9;

    objc_msgSend(*(id *)(v1[4] + 104), "setMinimumPressDuration:", 0.0);
    return objc_msgSend(*(id *)(v1[4] + 8), "addGestureRecognizer:", *(_QWORD *)(v1[4] + 104));
  }
  return result;
}

#error "10000CD10: call analysis failed (funcsize=54)"

id sub_10000E1D8(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[23];
  objc_msgSend(v2, "_contentInsetForUnitRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(v3, "setContentInset:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "zoomToRect:animated:", 0, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 32), "_updateLastScrollViewUnitRect");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

id sub_10000E24C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateLastScrollViewUnitRect");
  objc_msgSend(*(id *)(a1 + 32), "_updateForScrollViewNonLiveUserEvent");
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

id sub_10000FA04(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAlpha:", *(double *)(a1 + 40));
}

void sub_10000FFDC(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  double v4;
  double v5;
  id v6;

  v3 = a1;
  *(_OWORD *)a2 = xmmword_10006DFC0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0x4010000000000000;
  v6 = v3;
  objc_msgSend(v3, "displayCornerRadius");
  if (v4 != _UITraitCollectionDisplayCornerRadiusUnspecified)
  {
    objc_msgSend(v6, "displayCornerRadius");
    if (v5 != 0.0)
    {
      *(_OWORD *)a2 = xmmword_10006DFD0;
      *(_OWORD *)(a2 + 16) = xmmword_10006DFE0;
      *(_QWORD *)(a2 + 32) = 0x4010000000000000;
    }
  }

}

double sub_100010068()
{
  return 0.2;
}

double sub_100010074()
{
  return 6.0;
}

void sub_10001094C(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[BSActionResponse response](BSActionResponse, "response"));
  objc_msgSend(v1, "sendResponse:", v2);

}

void sub_1000115B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000115DC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100011680;
  v5[3] = &unk_100091A08;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_100011680(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[8], "setImage:", *(_QWORD *)(a1 + 32));
    if ((_os_feature_enabled_impl("PencilAndPaper", "PaperKitInScreenshotImages") & 1) == 0)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
      objc_msgSend(v2, "imageViewDidLoadImage:", WeakRetained);

    }
    objc_msgSend(WeakRetained, "analyzeCurrentImageIfNecessary");
    objc_msgSend((id)objc_opt_class(WeakRetained, v3), "_saveImageForSysdiagnose:", *(_QWORD *)(a1 + 32));
  }

}

void sub_100011A20(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_100011A50(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id WeakRetained;
  id v7;
  id v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;
  uint8_t buf[16];

  v3 = a2;
  v4 = os_log_create("com.apple.screenshotservices", "ShareSheet");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Did begin analysis of new image", buf, 2u);
    }

    v5 = objc_msgSend(objc_alloc((Class)VKCImageAnalyzerRequest), "initWithImage:orientation:requestType:", v3, 0, -1);
    -[NSObject setImageSource:](v5, "setImageSource:", 1);
    -[NSObject set_wantsFormFieldDetection:](v5, "set_wantsFormFieldDetection:", 0);
    WeakRetained = objc_loadWeakRetained(a1 + 5);
    v7 = objc_msgSend(WeakRetained, "currentInProcessRequestID");
    if ((int)v7 >= 1)
    {
      objc_msgSend(a1[4], "cancelRequestID:", v7);
      objc_msgSend(WeakRetained, "setCurrentInProcessRequestID:", 0);
    }
    v8 = a1[4];
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_100011C24;
    v12 = &unk_100091A58;
    objc_copyWeak(&v13, a1 + 5);
    objc_copyWeak(&v14, a1 + 6);
    objc_msgSend(v8, "processRequest:progressHandler:completionHandler:", v5, 0, &v9);
    objc_msgSend(WeakRetained, "setCurrentInProcessRequestID:", -[NSObject requestID](v5, "requestID", v9, v10, v11, v12));
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);

  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_100057554(v5);
  }

}

void sub_100011C04(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100011C24(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = objc_msgSend(WeakRetained, "currentInProcessRequestID");
  if (v6 == objc_msgSend(v3, "analysisRequestID"))
    objc_msgSend(WeakRetained, "setCurrentInProcessRequestID:", 0);
  if (WeakRetained)
  {
    if (v5)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "screenshot"));

      if (v7 == v5)
      {
        v8 = os_log_create("com.apple.screenshotservices", "ShareSheet");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Did complete analysis", v12, 2u);
        }

        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "imageInteraction"));
        objc_msgSend(v9, "setAnalysis:", v3);

        objc_msgSend(WeakRetained, "setInteractionMode:", objc_msgSend(WeakRetained, "interactionMode"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "imageInteraction"));
        objc_msgSend(v10, "imageViewDidUpdateInteraction:withAnalysis:", v11, v3);

      }
    }
  }

}

void sub_100011D88(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = SSCGImageBackedImageFromImage(*(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_100011DD0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100012074(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateInteractionHighlightStatusIfNecessary");

}

void sub_100012558(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10001257C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012634;
  block[3] = &unk_100091AF8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
}

void sub_100012634(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[12], "setImage:", *(_QWORD *)(a1 + 32));
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, id *))(v4 + 16))(v4, v3);
    v3 = v5;
  }

}

void sub_100012898(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  UIImage *v5;
  NSData *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_createDirectoryForSysdiagnoseIfNecessary"));
  if (!v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/db/sysdiagnose/com.apple.ScreenshotServicesService/"), "stringByAppendingString:", CFSTR("Screenshot.png")));
    v5 = *(UIImage **)(a1 + 32);
    v4 = a1 + 32;
    v6 = UIImagePNGRepresentation(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if (v7)
    {
      v17 = 0;
      v9 = objc_msgSend(v7, "writeToFile:options:error:", v3, 1, &v17);
      v2 = v17;
      if ((v9 & 1) != 0)
      {
LABEL_10:

        goto LABEL_11;
      }
      v10 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100057660((uint64_t)v3, (uint64_t)v2, v10);
    }
    else
    {
      v10 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1000575F8(v4, v10, v11, v12, v13, v14, v15, v16);
      v2 = 0;
    }

    goto LABEL_10;
  }
LABEL_11:

}

void sub_100012E10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100013F00(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint8_t buf[4];
  void *v9;

  v2 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "environmentDescription"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "loggableDescription"));
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Finished saving edits to screenshot with environment description %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014060;
  v5[3] = &unk_100091A08;
  objc_copyWeak(&v7, (id *)buf);
  v6 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void sub_100014060(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "wasJustSavedForMode:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "environmentDescription"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

    v5 = objc_msgSend(WeakRetained[6], "indexOfObject:", v4);
    if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "environmentDescription"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "loggableDescription"));
        v9 = 138412290;
        v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Error: Trying to remove environment from _environmentDescriptionIdentifiersBeingSaved, but environment description %@ was not found.", (uint8_t *)&v9, 0xCu);

      }
    }
    else
    {
      objc_msgSend(WeakRetained[6], "removeObjectAtIndex:", v5);
    }
    objc_msgSend(WeakRetained, "_reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier:", v4);

  }
}

void sub_1000141C0(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint8_t buf[4];
  void *v9;

  v2 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "environmentDescription"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "loggableDescription"));
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Finished saving edits to pdf with environment description %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014320;
  v5[3] = &unk_100091A08;
  objc_copyWeak(&v7, (id *)buf);
  v6 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void sub_100014320(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "wasJustSavedForMode:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "environmentDescription"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

    v5 = objc_msgSend(WeakRetained[6], "indexOfObject:", v4);
    if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "environmentDescription"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "loggableDescription"));
        v9 = 138412290;
        v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Error: Trying to remove environment from _environmentDescriptionIdentifiersBeingSaved, but environment description %@ was not found.", (uint8_t *)&v9, 0xCu);

      }
    }
    else
    {
      objc_msgSend(WeakRetained[6], "removeObjectAtIndex:", v5);
    }
    objc_msgSend(WeakRetained, "_reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier:", v4);

  }
}

void sub_100014504(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.screenshotservices.screenshotManagerTemporarySavingQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  v2 = (void *)qword_1000AD710;
  qword_1000AD710 = (uint64_t)v1;

}

void sub_1000145EC(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id obj;
  _QWORD block[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v2 = dispatch_group_create();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = a1;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v7);
        dispatch_group_enter(v2);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSScreenshotAssetManager sharedAssetManager](SSScreenshotAssetManager, "sharedAssetManager", v12));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100014804;
        v17[3] = &unk_100091C08;
        v18 = v3;
        v19 = v2;
        objc_msgSend(v9, "recordPersistableToTemporaryLocation:withCompletionBlock:", v8, v17);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000148F4;
  block[3] = &unk_100091C30;
  v10 = *(id *)(v12 + 40);
  v15 = v3;
  v16 = v10;
  v11 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100014804(uint64_t a1, char a2, void *a3)
{
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  char v9;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000148BC;
  v5[3] = &unk_100091BE0;
  v9 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_1000148BC(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56) && *(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t sub_1000148F4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100014B0C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSScreenshotAssetManager sharedAssetManager](SSScreenshotAssetManager, "sharedAssetManager"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014BAC;
  v5[3] = &unk_100091B98;
  v3 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "removePersistable:deleteOptions:withCompletionBlock:", v3, v4, v5);

}

void sub_100014BAC(uint64_t a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014C50;
  block[3] = &unk_100091A08;
  objc_copyWeak(&v4, &location);
  v3 = *(id *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void sub_100014C50(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[5], "removeObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "_reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void sub_100014D8C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[SSScreenshotAssetManager sharedAssetManager](SSScreenshotAssetManager, "sharedAssetManager"));
  objc_msgSend(v2, "removePersistable:deleteOptions:withCompletionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &stru_100091C78);

}

void sub_1000158A8(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1000AD720;
  qword_1000AD720 = (uint64_t)v1;

}

void sub_100015938(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_10001620C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setEffect:", *(_QWORD *)(a1 + 40));
}

void sub_10001685C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_addScreenshotWithPDF:visibleRect:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48) - 2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "debugView"));
  v5 = v4;
  if (v2 == v3)
    objc_msgSend(v4, "resetScrollOffset");
  else
    objc_msgSend(v4, "advanceScrollOffset");

}

id sub_100016A14(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_addScreenshots");
}

void sub_100016F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100017940(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_1000AD738)
  {
    v5 = off_100091D00;
    v6 = 0;
    qword_1000AD738 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_1000AD738)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("WKWebView");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_10005794C();
LABEL_8:
    free(v2);
  }
  qword_1000AD730 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000182C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000182E4(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a3)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "reportStatistics");
    WeakRetained = v5;
  }

}

void sub_1000187C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100018808(id *a1, void *a2)
{
  id v3;
  id v4;
  id WeakRetained;
  id v6;
  id v7;

  v3 = a2;
  v4 = objc_msgSend(v3, "selectedOptionIndex");
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "setShareAsOption:", v4);

  v6 = objc_msgSend(v3, "selectedOptionIndex");
  _SSSetLastUsedFullPageScreenshotShareAsOption(v6);
  v7 = objc_loadWeakRetained(a1);
  objc_msgSend(v7, "didChangeShareOptions");

}

void sub_100018B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100018B3C(id *a1, void *a2)
{
  void *v3;
  id WeakRetained;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "text"));
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "setRenameOption:", v3);

  v5 = objc_loadWeakRetained(a1);
  objc_msgSend(v5, "didChangeRenameOption");

}

void sub_100019F98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001A5B8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;

  v5 = a2;
  v6 = v5;
  if (v5)
  {
    if (!a3)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityType"));
      v8 = objc_msgSend(CFSTR("com.apple.screenshotservices.sirisharing"), "isEqual:", v7);

      if (v8)
      {
        v9 = os_log_create("com.apple.screenshotservices", "Editing");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          sub_1000579EC(a1, v9);

        objc_msgSend(v6, "_setOptions:", 0);
        objc_msgSend(v6, "becomeCurrent");
        objc_msgSend(v6, "resignCurrent");
        objc_msgSend(v6, "invalidate");
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "_markImageAsBeingEdited");

}

void sub_10001A9CC(uint64_t a1, void *a2)
{
  UIImage *v3;
  NSData *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001AAB4;
  v8[3] = &unk_100091AD0;
  objc_copyWeak(&v9, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
  v4 = UIImageJPEGRepresentation(v3, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  (*(void (**)(_QWORD, void *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5, v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void sub_10001AA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001AAB4(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[44] = 0;

}

double sub_10001B62C(uint64_t a1, double a2)
{
  return a2 / *(double *)(a1 + 32);
}

void sub_10001BC1C(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  _QWORD block[4];
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "q_saveEditedPDF");

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BCDC;
  block[3] = &unk_100091AD0;
  objc_copyWeak(&v6, v2);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  objc_destroyWeak(&v6);
}

void sub_10001BCC8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001BCDC(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[45] = 0;

}

void sub_10001C350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

id sub_10001C38C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDocumentIsSaving:", 1);
}

id sub_10001C398(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setDocumentIsSaving:", 0);
}

void sub_10001C3A4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  id v9;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = 0;
  v5 = objc_msgSend(v4, "writeToURL:options:error:", v3, 1, &v9);
  v6 = v9;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  v7 = os_log_create("com.apple.screenshotservices", "PDF");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      v8 = CFSTR("Saved");
    else
      v8 = CFSTR("Could not save");
    *(_DWORD *)buf = 138412802;
    v11 = v8;
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@ previously saved PDF to %@ (%@)", buf, 0x20u);
  }

}

void sub_10001C4D8(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setPDFURL:", *(_QWORD *)(a1 + 32));

  v3 = os_log_create("com.apple.screenshotservices", "PDF");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100057CF4((uint64_t *)(a1 + 32), a1, v3);

}

uint64_t sub_10001CF70(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "imageProvider"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D004;
  v7[3] = &unk_100091AA8;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "requestOutputImageForSaving:", v7);

  return 0;
}

uint64_t sub_10001D004(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10001D014(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editedPDFDataForShareSheet"));
  v3[2](v3, v4, 0);

  return 0;
}

void sub_10001D3B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10001D3D0(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  UIImage *v5;
  NSData *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "environmentDescription"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageSurface"));
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage ss_cgImageBackedImageFromImageSurface:](UIImage, "ss_cgImageBackedImageFromImageSurface:", v4));

    v6 = UIImagePNGRepresentation(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)*((_QWORD *)a1[4] + 13);
    v12 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001D518;
    v10[3] = &unk_100091ED0;
    v11 = a1[5];
    objc_msgSend(v8, "insertImagesData:completion:", v9, v10);

  }
}

void sub_10001D518(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];

  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.screenshotservices", "Screenshot");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100057D7C(v5, v6);

  }
  if (a2)
  {
    v7 = os_log_create("com.apple.screenshotservices", "Screenshot");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "screenshot sent to quick note", v9, 2u);
    }

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

Class sub_10001D838(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_1000AD748)
  {
    v5 = off_100091EF0;
    v6 = 0;
    qword_1000AD748 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_1000AD748)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("SYLinkContextClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_100057E04();
LABEL_8:
    free(v2);
  }
  qword_1000AD740 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10001D92C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_10001D938(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

void sub_10001DCB0(uint64_t a1)
{
  _BOOL8 v2;
  double v3;
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 48) == 1;
  if (*(_BYTE *)(a1 + 56))
    v3 = 0.3;
  else
    v3 = 0.0;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v4, "dittoRootViewController:wantsBackground:duration:", *(_QWORD *)(a1 + 32), v2, v3);

}

id sub_10001E1A0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

id sub_10001F1DC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

id sub_10001F298(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void sub_1000211E0(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setContentSwitcherAlpha:", *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "view"));
  objc_msgSend(v2, "layoutIfNeeded");

}

void sub_100021240(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSSSignificantEventController sharedSignificantEventController](SSSSignificantEventController, "sharedSignificantEventController"));
  objc_msgSend(v2, "screenshotAppearAnimationEndedForScreenshot:userInterface:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 40), "_prepareDragInteractionIfNecessary");
  objc_msgSend(*(id *)(a1 + 48), "setNeedsLayout");
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "view"));
  objc_msgSend(v3, "setNeedsLayout");

}

uint64_t sub_1000213F4(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_positionAppearingScreenshot:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id sub_1000214B8(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setContentSwitcherAlpha:", 1.0);
}

void sub_1000216E0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  (*(void (**)(_QWORD, id))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), objc_msgSend(*(id *)(a1 + 40), "successful"));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v6, "containerViewControllerEndedShowingWaitingForImageIdentifierUpdatesUI:", *(_QWORD *)(a1 + 32));

}

void sub_100021DDC(int8x16_t *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  int8x16_t v10;
  _QWORD v11[5];

  v2 = objc_msgSend(objc_alloc((Class)UICubicTimingParameters), "initWithControlPoint1:controlPoint2:", 0.666670024, 0.00666669989, 0.800000012, 0.993330002);
  v3 = objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:timingParameters:", v2, *(double *)a1[3].i64);
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);
  v4 = a1[2].i64[0];
  v5 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v3;
  v6 = v3;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100021F24;
  v11[3] = &unk_100091920;
  v11[4] = a1[2].i64[0];
  objc_msgSend(v6, "addAnimations:", v11);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100021F2C;
  v8[3] = &unk_100092000;
  v10 = vextq_s8(a1[3], a1[3], 8uLL);
  v7 = (void *)a1[2].i64[1];
  v8[4] = a1[2].i64[0];
  v9 = v7;
  objc_msgSend(v6, "addCompletion:", v8);
  objc_msgSend(v6, "startAnimation");

}

id sub_100021F24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_moveScreenshotsViewForHorizontalSlideOffDismiss");
}

void sub_100021F2C(uint64_t a1)
{
  double v2;
  double v3;
  BOOL v4;
  double v5;
  dispatch_time_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v2 = *(double *)(a1 + 48) - *(double *)(a1 + 56);
  v3 = v2 * 1000000000.0;
  v4 = v2 < 0.0;
  v5 = 0.0;
  if (!v4)
    v5 = v3;
  v6 = dispatch_time(0, (uint64_t)v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100021FD8;
  v8[3] = &unk_100091960;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v8);

}

uint64_t sub_100021FD8(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 96);
  *(_QWORD *)(v2 + 96) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_performPostDismissActions");
  return sub_100026DCC(*(_QWORD *)(a1 + 40));
}

void sub_100022018(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  if (*(_BYTE *)(a1 + 48))
  {
    v3 = objc_alloc_init((Class)BSMutableAnimationSettings);
    objc_msgSend(*(id *)(a1 + 32), "_durationForHorizontalSlideOffDismiss");
    objc_msgSend(v3, "setDuration:");
    v2 = v3;
  }
  else
  {
    v2 = 0;
  }
  v4 = v2;
  objc_msgSend(*(id *)(a1 + 32), "_performPreDismissActionsForAnimationSettings:", v2);
  if (!*(_BYTE *)(a1 + 49))
    objc_msgSend(*(id *)(a1 + 32), "setState:animated:completion:", 0, 1, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_1000220AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_1000222D8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_moveScreenshotsViewForHorizontalSlideOffDismiss");
}

id sub_1000222E0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performPostDismissActions");
}

void sub_100022418(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "view"));
  objc_msgSend(v2, "frame");
  objc_msgSend(v2, "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");

}

id sub_100022474(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performPostDismissActions");
}

void sub_100022644(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "view"));
  objc_msgSend(v4, "bounds");
  objc_msgSend(v1, "_updateForSize:", v2, v3);

}

void sub_100022828(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSSSignificantEventController sharedSignificantEventController](SSSSignificantEventController, "sharedSignificantEventController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "visibleScreenshots"));
  objc_msgSend(v2, "screenshotUIWithScreenshots:beganStateChangeFromState:toState:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), *(_QWORD *)(a1 + 48));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "view"));
  objc_msgSend(v4, "layoutIfNeeded");

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v5, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "_prepareGesturesForState:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setScreenshotsUseTrilinearMinificationFilter:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setShowsShadow:animated:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSSSpringAnimationParameters scaleAnimationParameters](SSSSpringAnimationParameters, "scaleAnimationParameters"));
  objc_msgSend(v6, "setAnimationOptions:", (unint64_t)objc_msgSend(v6, "animationOptions") & 0xFFFFFFFFFFFFFFFDLL);
  if (*(_QWORD *)(a1 + 48) == 1)
    v7 = 2;
  else
    v7 = 3;
  objc_msgSend(v6, "setAnimationReason:", v7);
  v12[0] = _NSConcreteStackBlock;
  v12[2] = sub_1000229E8;
  v12[3] = &unk_100092118;
  v9 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v12[4] = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v16 = *(_BYTE *)(a1 + 56);
  v12[1] = 3221225472;
  v14 = v9;
  v10 = v6;
  v13 = v10;
  v11 = objc_retainBlock(v12);
  if (!*(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeChildViewControllers");
  ((void (*)(_QWORD *))v11[2])(v11);

}

void sub_1000229E8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v8[4];
  _QWORD *v9;
  _QWORD v10[4];
  _QWORD *v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  char v15;
  _QWORD v16[6];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100022B60;
  v16[3] = &unk_1000919E0;
  v2 = *(_QWORD *)(a1 + 56);
  v16[4] = *(_QWORD *)(a1 + 32);
  v16[5] = v2;
  v3 = objc_retainBlock(v16);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100022BDC;
  v12[3] = &unk_1000920C8;
  v5 = *(void **)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v12[4] = *(_QWORD *)(a1 + 32);
  v14 = v4;
  v15 = *(_BYTE *)(a1 + 64);
  v13 = v5;
  v6 = objc_retainBlock(v12);
  if (*(_BYTE *)(a1 + 64))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100022D00;
    v10[3] = &unk_100092078;
    v11 = v3;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100022D0C;
    v8[3] = &unk_1000920F0;
    v9 = v6;
    +[UIView sss_animateWithAnimationParameters:animations:completion:](UIView, "sss_animateWithAnimationParameters:animations:completion:", v7, v10, v8);

  }
  else
  {
    ((void (*)(_QWORD *))v3[2])(v3);
    ((void (*)(_QWORD *, uint64_t))v6[2])(v6, 1);
  }

}

id sub_100022B60(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));
  objc_msgSend(v3, "bounds");
  objc_msgSend(v2, "_updateForSize:", v4, v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setState:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setSnapshotScreenshotEdits:", *(_QWORD *)(a1 + 40) == 0);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

void sub_100022BDC(uint64_t a1)
{
  id v2;
  id v3;
  _QWORD *v4;
  void *v5;
  _BOOL4 v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[2];
  v6 = objc_msgSend(v4, "state") == 0;
  v7 = v2 == v3 && v6;
  objc_msgSend(v5, "setShowsShadow:animated:", v7, *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setScreenshotsUseTrilinearMinificationFilter:", objc_msgSend(*(id *)(a1 + 32), "state") == 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stateTransitionFinished");
  if (v2 == v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
    objc_msgSend(v8, "containerViewController:didTransitionToState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(void))(v9 + 16))();
  v11 = (id)objc_claimAutoreleasedReturnValue(+[SSSSignificantEventController sharedSignificantEventController](SSSSignificantEventController, "sharedSignificantEventController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "visibleScreenshots"));
  objc_msgSend(v11, "screenshotUIWithScreenshots:endedStateChangeFromState:toState:userInterface:", v10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), *(_QWORD *)(a1 + 48));

}

uint64_t sub_100022D00(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100022D0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_100023054(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForCurrentSize");
}

id sub_100023488(uint64_t a1)
{
  return _objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "presentActivityViewController");
}

void sub_1000236FC(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "lastViewEditMode");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editedPDFDataForShareSheet"));
    if (v4)
    {
      v5 = objc_alloc((Class)NSItemProvider);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePDF, "identifier"));
      v7 = objc_msgSend(v5, "initWithItem:typeIdentifier:", v4, v6);

LABEL_6:
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageProvider"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestOutputImageForSavingBlocking"));

    if (v4)
    {
      v7 = objc_msgSend(objc_alloc((Class)NSItemProvider), "initWithObject:", v4);
      goto LABEL_6;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_1000237D8(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"));
  objc_msgSend(v2, "setItemProviders:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "screenshotsViewController:requestsDeleteForScreenshots:deleteOptions:forReason:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

void sub_1000239FC(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "visibleScreenshots"));
  v3 = objc_msgSend(v2, "count");

  if (!v3 && !*(_QWORD *)(a1 + 40))
    _objc_msgSend(*(id *)(a1 + 32), "_dismissScreenshotsWithSlide");
}

void sub_100023A68(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "visibleScreenshots"));
  if (objc_msgSend(v2, "count"))
  {

  }
  else
  {
    v3 = *(_QWORD *)(a1 + 48);

    if (v3 == 1)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100023B3C;
      v5[3] = &unk_100091B98;
      v4 = *(void **)(a1 + 40);
      v6 = *(id *)(a1 + 32);
      v7 = v4;
      objc_msgSend(v6, "dismissScreenshotsAnimated:completion:", 1, v5);

      return;
    }
  }
  _objc_msgSend(*(id *)(a1 + 32), "_stopBeingInterestedInScreenshots:", *(_QWORD *)(a1 + 40));
}

id sub_100023B3C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_stopBeingInterestedInScreenshots:", *(_QWORD *)(a1 + 40));
}

id sub_100023CEC(uint64_t a1)
{
  double v2;
  double v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "progressTowardsReceivingAllImageIdentifierUpdates");
  v3 = v2;
  if (v2 >= 1.0)
    return (id)(*(uint64_t (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "successful"));
  v4 = os_log_create("com.apple.screenshotservices", "ShareSheet");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100057E68(v4, v3);

  v5 = objc_retainBlock(*(id *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "_prepareImageIdentifierUpdateAlertIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "_presentImageIdentifierUpdateAlertIfNecessary");
}

id sub_100023E6C(uint64_t a1)
{
  double v2;
  id v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "progressTowardsReceivingAllImageIdentifierUpdates");
  if (v2 >= 1.0)
    return (id)(*(uint64_t (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "successful"));
  v3 = objc_retainBlock(*(id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "_prepareImageIdentifierUpdateAlertIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "_presentImageIdentifierUpdateAlertIfNecessary");
}

void sub_100024574(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_updateForSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  v4 = *(_QWORD **)(a1 + 32);
  if (v4[12])
  {
    objc_initWeak(&location, v4);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100024654;
    v6[3] = &unk_100091AD0;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v5, "addAnimations:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

}

void sub_100024638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100024654(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_moveScreenshotsViewForHorizontalSlideOffDismiss");

}

void sub_1000246F4(id a1)
{
  byte_1000AD750 = +[UIDragInteraction isEnabledByDefault](UIDragInteraction, "isEnabledByDefault");
}

_QWORD *sub_10002496C(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result[4] + 16), "setBorderViewStyleOverride:withAnimator:", 0, 0);
    return objc_msgSend((id)v2[4], "_stopDraggingDismissing:", 0);
  }
  return result;
}

void sub_100024B8C(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setBorderViewStyleOverride:withAnimator:", 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "view"));
  objc_msgSend(v2, "setAlpha:", 1.0);

}

void sub_1000255B4(id a1)
{
  SSSSignificantEventController *v1;
  void *v2;

  v1 = objc_alloc_init(SSSSignificantEventController);
  v2 = (void *)qword_1000AD760;
  qword_1000AD760 = (uint64_t)v1;

}

id sub_100025A88(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishRunPPTServiceRequest:", *(_QWORD *)(a1 + 40));
}

void sub_100025F94(uint64_t a1, uint64_t a2)
{
  double v3;
  id v4;
  id v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  *(_QWORD *)&v3 = objc_opt_class(*(_QWORD *)(a1 + 32), a2).n128_u64[0];
  v5 = objc_msgSend(v4, "newTestScreenshot", v3);
  global_queue = dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100026048;
  v10[3] = &unk_100091C30;
  v8 = *(id *)(a1 + 40);
  v11 = v5;
  v12 = v8;
  v9 = v5;
  dispatch_async(v7, v10);

}

uint64_t sub_100026048(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t sub_100026DCC(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100026DDC(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id sub_100026FCC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resumeHighQualityQueueIfNecessary");
}

void sub_1000272CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000272E4(id *a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained && *((_BYTE *)WeakRetained + 13))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100027384;
    v5[3] = &unk_100092218;
    v6 = a1[4];
    v4 = a1[5];
    v7 = v3;
    v8 = v4;
    objc_msgSend(v3, "_loadUneditedImageIfNecessaryWithCompletionBlock:", v5);

  }
}

void sub_100027384(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 40);
  v1 = *(_QWORD *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_outputImageOnCurrentUneditedImage"));
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);

}

void sub_1000274C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1000274DC(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_outputImageOnCurrentUneditedImage"));
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);

}

void sub_100027628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100027640(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100027650(uint64_t a1)
{

}

void sub_100027658(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100027784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002779C(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1000278A0(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "screenshot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "backingImage"));
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);

}

void sub_1000279EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100027A04(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100027B18(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100027B2C(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "cachedCGImageBackedUneditedImageForUI"));

  if (!v4)
  {
    v5 = objc_loadWeakRetained(v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "screenshot"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backingImage"));

    v8 = objc_retainAutorelease(v7);
    v9 = objc_msgSend(v8, "CGImage");
    v10 = objc_loadWeakRetained(v2);
    v11 = v10;
    if (v9)
    {
      objc_msgSend(v10, "setCachedCGImageBackedUneditedImageForUI:", v8);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "screenshot"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "environmentDescription"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageSurface"));

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ss_cgImageBackedImageFromImageSurface:](UIImage, "ss_cgImageBackedImageFromImageSurface:", v14));
      v16 = objc_loadWeakRetained(v2);
      objc_msgSend(v16, "setCachedCGImageBackedUneditedImageForUI:", v15);

      v11 = (void *)v14;
    }

  }
  v17 = *(_QWORD *)(a1 + 40);
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cachedCGImageBackedUneditedImageForUI"));
  (*(void (**)(uint64_t, id))(v17 + 16))(v17, v18);

}

void sub_100027D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100027D78(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100027EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100027F14(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  id v11;

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setHasOriginalUneditedImage:", 1);

  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "screenshot"));
  objc_msgSend(v5, "setBackingImage:", v11);

  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "setHasChangedBackingImage:", 1);

  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screenshot"));
  v9 = objc_msgSend(v8, "hasEverBeenEditedForMode:", 0);

  if ((v9 & 1) == 0)
  {
    v10 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v10, "setCachedOutputImage:", v11);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1000280D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000280E4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resumeHighQualityQueueIfNecessary");

}

void sub_10002827C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100028290(uint64_t a1)
{
  id WeakRetained;
  unsigned int v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_msgSend(WeakRetained, "highQualityQueueIsValid");

  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10002896C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100028984(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100028994(uint64_t a1)
{

}

void sub_10002899C(double *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  id obj;

  v6 = *((_QWORD *)a1 + 4);
  v7 = a1[7];
  v8 = a1[8];
  v9 = a2;
  objc_msgSend(v9, "convertPoint:fromView:", v6, v7, v8);
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hitTest:withEvent:", *((_QWORD *)a1 + 5)));

  v10 = obj;
  if (obj)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*((_QWORD *)a1 + 6) + 8) + 40), obj);
    v10 = obj;
    *a4 = 1;
  }

}

void sub_100029CA0(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[1];
    WeakRetained[1] = 0;

    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2[3], "gestureRecognizers", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "state") == (id)2)
          {

            objc_msgSend(v2, "annotationsDidChange");
            goto LABEL_12;
          }
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v6)
          continue;
        break;
      }
    }

    objc_msgSend(v2, "setNeedsPageImageUpdate");
  }
LABEL_12:

}

void sub_10002AF20(id *a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(a1[4], "duration");
  v3 = v2;
  objc_msgSend(a1[4], "delay");
  v5 = v4;
  v6 = objc_msgSend(a1[4], "animationOptions");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002B020;
  v10[3] = &unk_100092078;
  v7 = a1[4];
  v11 = a1[5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002B034;
  v8[3] = &unk_1000920F0;
  v9 = a1[6];
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", v6, v7, v10, v8, v3, v5);

}

uint64_t sub_10002B020(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_10002B034(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

double *sub_10002B508(double *result)
{
  uint64_t v1;
  double *v2;
  uint64_t i;
  double v4;
  _QWORD v5[6];

  v1 = *((_QWORD *)result + 5);
  if (v1 >= 1)
  {
    v2 = result;
    for (i = 0; i < v1; ++i)
    {
      v4 = v2[6] + (double)i * v2[7];
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_10002B5C8;
      v5[3] = &unk_1000919E0;
      *(double *)&v5[4] = v2[4];
      *(double *)&v5[5] = v4;
      result = (double *)+[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, (double)i / (double)v1, 1.0 / (double)v1);
      v1 = *((_QWORD *)v2 + 5);
    }
  }
  return result;
}

void sub_10002B5C8(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_shapeLayerPathForProgress:", *(double *)(a1 + 40)));
  objc_msgSend(v1, "setPath:", v2);

}

void sub_10002B89C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v2, "waitingForImageIdentifierUpdatesAlertControllerDidCancel:", *(_QWORD *)(a1 + 32));

}

BOOL sub_10002C0DC(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

const __CFString *sub_10002C0EC(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("unknown");
  if (a1 == 1)
    v1 = CFSTR("fullscreen");
  if (a1)
    return v1;
  else
    return CFSTR("miniature");
}

id sub_10002CD6C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "performProgrammaticDismiss");
}

id sub_10002DFE0(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setAlpha:", 0.0);
}

id sub_10002DFF8(uint64_t a1)
{
  return _objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "stopAnimating");
}

double sub_10002E504(uint64_t a1, uint64_t a2, void *a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13)
{
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *i;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  double v56;
  double v57;
  uint64_t v58;
  double *v64;
  float64x2_t v65;
  double v66;
  double v68;
  double v69;
  double v70;
  double v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[8];
  _BYTE v77[128];
  _QWORD v78[8];
  float64x2x2_t v79;
  float64x2x2_t v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  v28 = a3;
  v29 = a10 - a8;
  v30 = a11 - a9;
  UIRectGetCorners(v78, a4, a5, a6, a7);
  v31 = *(double *)v78;
  v32 = *(double *)&v78[1];
  v33 = *(double *)&v78[3];
  v34 = *(double *)&v78[6];
  if (sub_100030138(a1, a2))
    v35 = v29;
  else
    v35 = -0.0;
  v36 = v31 + v35;
  if (sub_10003014C(a1, a2))
    v37 = v29;
  else
    v37 = -0.0;
  v38 = v34 + v37;
  if (sub_100030160(a1, a2))
    v39 = v30;
  else
    v39 = -0.0;
  v40 = v32 + v39;
  if (sub_100030174(a1, a2))
    v41 = v30;
  else
    v41 = -0.0;
  v72 = 0u;
  v73 = 0u;
  v42 = v33 + v41;
  v74 = 0u;
  v75 = 0u;
  v43 = v28;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v45; i = (char *)i + 1)
      {
        v68 = v42;
        v69 = v40;
        v70 = v36;
        v71 = v38;
        if (*(_QWORD *)v73 != v46)
          objc_enumerationMutation(v43);
        objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i), "CGRectValue");
        x = v81.origin.x;
        y = v81.origin.y;
        width = v81.size.width;
        height = v81.size.height;
        MinX = CGRectGetMinX(v81);
        v82.origin.x = x;
        v82.origin.y = y;
        v82.size.width = width;
        v82.size.height = height;
        MaxX = CGRectGetMaxX(v82);
        v83.origin.x = x;
        v83.origin.y = y;
        v83.size.width = width;
        v83.size.height = height;
        MinY = CGRectGetMinY(v83);
        v84.origin.x = x;
        v84.origin.y = y;
        v84.size.width = width;
        v84.size.height = height;
        MaxY = CGRectGetMaxY(v84);
        v36 = v70;
        v38 = v71;
        if (vabdd_f64(MinX, v70) < 0.005)
          v36 = MinX;
        if (vabdd_f64(MaxX, v71) < 0.005)
          v38 = MaxX;
        if (vabdd_f64(MinY, v69) >= 0.005)
          v56 = v69;
        else
          v56 = MinY;
        if (vabdd_f64(MaxY, v68) >= 0.005)
          v57 = v68;
        else
          v57 = MaxY;
        if (vabdd_f64(MinY, v57) >= 0.005)
          v42 = v57;
        else
          v42 = MinY;
        if (vabdd_f64(MaxY, v56) >= 0.005)
          v40 = v56;
        else
          v40 = MaxY;
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    }
    while (v45);
  }

  if (v38 - v36 < a12)
  {
    if (sub_100030138(a1, a2))
      v36 = v38 - a12;
    else
      v38 = a12 + v36;
  }
  if (v42 - v40 < a13)
  {
    if (sub_100030160(a1, a2))
      v40 = v42 - a13;
    else
      v42 = a13 + v40;
  }
  v58 = 0;
  *(double *)v76 = v36;
  *(double *)&v76[1] = v40;
  *(double *)&v76[2] = v36;
  *(double *)&v76[3] = v42;
  *(double *)&v76[4] = v38;
  *(double *)&v76[5] = v42;
  __asm { FMOV            V1.2D, #1.0 }
  *(double *)&v76[6] = v38;
  *(double *)&v76[7] = v40;
  do
  {
    v64 = (double *)&v76[v58];
    v79 = vld2q_f64(v64);
    v65 = vmaxnmq_f64(v79.val[0], (float64x2_t)0);
    v80.val[0] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v65, _Q1), (int8x16_t)_Q1, (int8x16_t)v65);
    v79.val[0] = vmaxnmq_f64(v79.val[1], (float64x2_t)0);
    v80.val[1] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v79.val[0], _Q1), (int8x16_t)_Q1, (int8x16_t)v79.val[0]);
    vst2q_f64(v64, v80);
    v58 += 4;
  }
  while (v58 != 8);
  v66 = UIRectMakeWithPoints(v76);

  return v66;
}

double sub_10002E878(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;
  double v7;

  result = 1.0;
  if (a2 > 0.0 && a3 > 0.0)
  {
    result = a4 / a2;
    if (a1 != 1)
    {
      v7 = a5 / a3;
      if (result >= v7)
        return v7;
    }
  }
  return result;
}

id sub_10002E8AC()
{
  +[SSSCropOverlayCornerView preferredDimension](SSSCropOverlayCornerView, "preferredDimension");
  return +[SSSCropOverlayGrabberView preferredOtherDimension](SSSCropOverlayGrabberView, "preferredOtherDimension");
}

double sub_10002E908()
{
  double v0;
  double v1;
  double v2;

  +[SSSCropOverlayCornerView preferredDimension](SSSCropOverlayCornerView, "preferredDimension");
  v1 = v0;
  +[SSSCropOverlayGrabberView preferredOtherDimension](SSSCropOverlayGrabberView, "preferredOtherDimension");
  return v2 + v1 * 2.0;
}

uint64_t start(int a1, char **a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  NSString *v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  NSString *v13;
  uint64_t v14;

  v4 = getpid();
  memorystatus_control(18, v4, 0, 0, 0);
  v5 = objc_autoreleasePoolPush();
  v7 = (objc_class *)objc_opt_class(SSSApplication, v6);
  v8 = NSStringFromClass(v7);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(v8);
  v11 = (objc_class *)objc_opt_class(SSSAppDelegate, v10);
  v12 = NSStringFromClass(v11);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue(v12);
  v14 = UIApplicationMain(a1, a2, v9, v13);

  objc_autoreleasePoolPop(v5);
  return v14;
}

id sub_10002F040(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  CGFloat v7;
  void *v8;
  CGAffineTransform v10;
  CGAffineTransform v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v11.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v11.c = v3;
  *(_OWORD *)&v11.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v2, "setTransform:", &v11);
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[1];
  objc_msgSend(v4, "bounds");
  objc_msgSend(v5, "setFrame:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "traitCollection"));
  v7 = 1.0 / sub_100010068();

  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, v7, v7);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v10 = v11;
  objc_msgSend(v8, "setTransform:", &v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "frame");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setFrame:", CGPointZero.x, CGPointZero.y);
}

void sub_10002F39C(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:"));
  objc_msgSend(v1, "appendPath:", v2);

}

SSSActivityViewController *sub_10002FBC0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void *a7, void *a8)
{
  id v12;
  void *v13;
  SSSActivityViewController *v14;
  id v15;
  id v16;

  v12 = a1;
  v13 = v12;
  if (!v12 || a6)
  {
    v15 = a8;
    v16 = a7;
    v14 = -[SSSActivityViewController initWithActivityItems:applicationActivities:editMode:]([SSSActivityViewController alloc], "initWithActivityItems:applicationActivities:editMode:", v15, v16, a4);

  }
  else
  {
    v14 = (SSSActivityViewController *)v12;
  }

  return v14;
}

BOOL sub_100030128(uint64_t a1, uint64_t a2)
{
  return (a2 | a1) == 0;
}

BOOL sub_100030138(uint64_t a1, uint64_t a2)
{
  return a1 == 2 || a2 == 1 || a2 == 4;
}

BOOL sub_10003014C(uint64_t a1, uint64_t a2)
{
  return a1 == 8 || a2 == 2 || a2 == 8;
}

BOOL sub_100030160(uint64_t a1, uint64_t a2)
{
  return a1 == 1 || a2 == 1 || a2 == 2;
}

BOOL sub_100030174(uint64_t a1, uint64_t a2)
{
  return a1 == 4 || a2 == 4 || a2 == 8;
}

void sub_1000312A4(id a1)
{
  SSSStatisticsManager *v1;
  void *v2;

  v1 = objc_alloc_init(SSSStatisticsManager);
  v2 = (void *)qword_1000AD770;
  qword_1000AD770 = (uint64_t)v1;

}

id sub_100031358(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = CFSTR("screenshot_showing");
  v3[1] = CFSTR("triggerType");
  v1 = *(_QWORD *)(a1 + 32);
  v4[0] = &__kCFBooleanFalse;
  v4[1] = v1;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2));
}

id sub_100031460(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = CFSTR("screenshot_showing");
  v3[1] = CFSTR("triggerType");
  v1 = *(_QWORD *)(a1 + 32);
  v4[0] = &__kCFBooleanTrue;
  v4[1] = v1;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2));
}

NSDictionary *__cdecl sub_100031524(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("reason");
  v3 = CFSTR("slidoffscreenduetotimer");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_1000315AC(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("reason");
  v3 = CFSTR("dragendedsuccessfully");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_100031634(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("reason");
  v3 = CFSTR("screenshot_showing");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_1000316BC(id a1)
{
  const __CFString *v2;
  void *v3;

  v2 = CFSTR("cropped");
  v3 = &__kCFBooleanTrue;
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_100031748(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("normal");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_1000317D0(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("full_page");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_100031858(id a1)
{
  const __CFString *v2;
  _UNKNOWN **v3;

  v2 = CFSTR("accidental_draw");
  v3 = &off_100095D18;
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

id sub_100031924(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  void *v5;

  v4 = CFSTR("stroke_count");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32)));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));

  return v2;
}

id sub_100031A1C(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  void *v5;

  v4 = CFSTR("annotation_count");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32)));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));

  return v2;
}

NSDictionary *__cdecl sub_100031AD0(id a1)
{
  const __CFString *v2;
  void *v3;

  v2 = CFSTR("tapped");
  v3 = &__kCFBooleanTrue;
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

id sub_100031BA0(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  void *v5;

  v4 = CFSTR("annotation_count");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32)));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));

  return v2;
}

NSDictionary *__cdecl sub_100031C54(id a1)
{
  const __CFString *v2;
  void *v3;

  v2 = CFSTR("tapped");
  v3 = &__kCFBooleanTrue;
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_100031CE0(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("change_type");
  v3 = CFSTR("normal");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_100031D68(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("change_type");
  v3 = CFSTR("full_page");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_100031DF0(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("share_screen_single_screenshot");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_100031E78(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("share_screen_multiple_screenshots");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_100031F00(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("share_full_page_mixed_screenshots");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_100031F88(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("share_full_page_screenshot_as_automatic_image");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_100032010(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("share_full_page_screenshot_as_automatic_pdf");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_100032098(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("share_full_page_screenshot_as_image");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_100032120(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("share_full_page_screenshot_as_pdf");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_1000321A8(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("rename_screenshot");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_100032230(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("image_to_photos");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_1000322B8(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("image_to_files");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_100032340(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("image_to_quick_note");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_1000323C8(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("pdf_image_to_photos");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_100032450(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("pdf_to_files");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_1000324D8(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("mixed_photos_and_files");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_100032560(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("mixed_quick_note_and_files");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_1000325E8(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("mixed_all_to_files");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_100032670(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("delete");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

NSDictionary *__cdecl sub_1000326F8(id a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("type");
  v3 = CFSTR("copy_and_delete");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v3, &v2, 1));
}

void sub_100032E18(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100032E98;
  v5[3] = &unk_100091B98;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_100032E98(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 40);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "screenshot"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "environmentDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appleInternalOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recapMovie"));
  objc_msgSend(v4, "setScreenshot:", v1);

}

void sub_100032F0C(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD block[4];
  id v5;
  id v6;
  uint64_t v7;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032F98;
  block[3] = &unk_100092168;
  v5 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v6 = v2;
  v7 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100032F98(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v2 = (void *)qword_1000AD788;
  v14 = qword_1000AD788;
  if (!qword_1000AD788)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100033CD8;
    v10[3] = &unk_100091848;
    v10[4] = &v11;
    sub_100033CD8((uint64_t)v10);
    v2 = (void *)v12[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v11, 8);
  v4 = objc_msgSend([v3 alloc], "initWithContentsOfURL:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "snapshots"));
  objc_msgSend(v4, "setSnapshots:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "screenshot"));
  objc_msgSend(v4, "setScreenshot:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "screenshot"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "environmentDescription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appleInternalOptions"));
  objc_msgSend(v9, "setRecapMovie:", v4);

  objc_msgSend(*(id *)(a1 + 48), "finishLoadingScreenshot");
}

void sub_1000330E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100033388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003390C(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "screenshot"));
  objc_msgSend(v1, "tapToRadar:screenshot:", v2, v3);

}

void sub_100033CD8(uint64_t a1)
{
  sub_100033D2C();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("RCPMovie");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000AD788 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100057F60();
    sub_100033D2C();
  }
}

void sub_100033D2C()
{
  char *v0;
  char *v1;
  __int128 v2;
  uint64_t v3;

  v1 = 0;
  if (!qword_1000AD780)
  {
    v2 = off_100092820;
    v3 = 0;
    qword_1000AD780 = _sl_dlopen(&v2, &v1);
  }
  v0 = v1;
  if (!qword_1000AD780)
  {
    v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }
  if (v1)
LABEL_7:
    free(v0);
}

Class sub_100033DD8(uint64_t a1)
{
  Class result;
  uint64_t v3;

  sub_100033D2C();
  result = objc_getClass("RCPVizualizerView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000AD790 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = sub_100057F84();
    return (Class)sub_100033E2C(v3);
  }
  return result;
}

SSSScreenshotItemProviderPDFAsImage *sub_100033E2C(uint64_t a1)
{
  SSSScreenshotItemProviderPDFAsImage *result;
  SSSScreenshotItemProviderPDFAsImage *v3;
  SEL v4;
  id v5;

  sub_100033D2C();
  result = (SSSScreenshotItemProviderPDFAsImage *)objc_getClass("RCPTimelineView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000AD798 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (SSSScreenshotItemProviderPDFAsImage *)sub_100057FA8();
    return -[SSSScreenshotItemProviderPDFAsImage initWithScreenshot:](v3, v4, v5);
  }
  return result;
}

void sub_1000341CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000342F8(uint64_t a1)
{
  sub_10003434C();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("LPLinkMetadata");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000AD7A0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100057438();
    sub_10003434C();
  }
}

void sub_10003434C()
{
  char *v0;
  char *v1;
  __int128 v2;
  uint64_t v3;

  v1 = 0;
  if (!qword_1000AD7A8)
  {
    v2 = off_100092838;
    v3 = 0;
    qword_1000AD7A8 = _sl_dlopen(&v2, &v1);
  }
  v0 = v1;
  if (!qword_1000AD7A8)
  {
    v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }
  if (v1)
LABEL_7:
    free(v0);
}

Class sub_1000343F8(uint64_t a1)
{
  Class result;
  uint64_t v3;

  sub_10003434C();
  result = objc_getClass("LPFileMetadata");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000AD7B0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = sub_10005745C();
    return (Class)sub_10003444C(v3);
  }
  return result;
}

void sub_10003444C(uint64_t a1)
{
  _SSSPDFThumbnailView *v2;
  SEL v3;

  sub_10003434C();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("LPImage");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000AD7B8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (_SSSPDFThumbnailView *)sub_100057480();
    -[_SSSPDFThumbnailView layoutSubviews](v2, v3);
  }
}

void sub_100034C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100034C80(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  unsigned __int8 *v2;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateOverlayControllerForBeingActiveForScreenshotEditsSnapshotted:", WeakRetained[9]);
    objc_msgSend(v2, "_hideAndShowViewsForScreenshotEditsSnapshotted:", v2[9]);
    WeakRetained = v2;
  }

}

void sub_100034D60(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setCachedViewsHidden:", 1);
    objc_msgSend(v2[5], "setHidden:", 0);
    WeakRetained = v2;
  }

}

void sub_100035A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100035D18()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)qword_1000AD7D8;
  v7 = qword_1000AD7D8;
  if (!qword_1000AD7D8)
  {
    v1 = (void *)sub_100037E68();
    v0 = (id *)dlsym(v1, "AKControllerDrawingGestureRecognizerNeedsDependencyUpdate");
    v5[3] = (uint64_t)v0;
    qword_1000AD7D8 = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)sub_100057FCC();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

void sub_100036108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_100036D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100037E14(uint64_t a1)
{
  Class result;

  sub_100037E68();
  result = objc_getClass("AKController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000AD7C0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_1000574A4();
    return (Class)sub_100037E68();
  }
  return result;
}

uint64_t sub_100037E68()
{
  uint64_t v0;
  char *v1;
  char *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_1000AD7C8)
  {
    v4 = off_100092850;
    v5 = 0;
    qword_1000AD7C8 = _sl_dlopen(&v4, &v3);
  }
  v0 = qword_1000AD7C8;
  v1 = v3;
  if (!qword_1000AD7C8)
  {
    v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_7;
  }
  if (v3)
LABEL_7:
    free(v1);
  return v0;
}

Class sub_100037F18(uint64_t a1)
{
  Class result;
  uint64_t v3;

  sub_100037E68();
  result = objc_getClass("AKPageModelController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000AD7D0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = sub_100057FEC();
    return (Class)sub_100037F6C(v3);
  }
  return result;
}

Class sub_100037F6C(uint64_t a1)
{
  Class result;
  uint64_t v3;

  sub_100037E68();
  result = objc_getClass("AKTextBoxAnnotation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000AD7E0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = sub_100058010();
    return (Class)sub_100037FC0(v3);
  }
  return result;
}

Class sub_100037FC0(uint64_t a1)
{
  Class result;
  SSSPassthroughView *v3;
  SEL v4;
  id v5;
  CGPoint v6;

  sub_100037E68();
  result = objc_getClass("AKAnnotation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000AD7F0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (SSSPassthroughView *)sub_100058034();
    return (Class)-[SSSPassthroughView hitTest:withEvent:](v3, v4, v6, v5);
  }
  return result;
}

void sub_100038B48(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  UIImage *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  UIImage *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  SSSScreenshotCountIndicator *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  _QWORD v91[10];
  uint64_t v92;
  NSAttributedStringKey v93;
  void *v94;

  objc_msgSend(*(id *)(a1 + 32), "setIsPerformingFullscreenSetup:", 1);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v93 = NSForegroundColorAttributeName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v94 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1));
  objc_msgSend(v2, "setTitleTextAttributes:", v4);

  v5 = objc_opt_new(UIImage);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDelegate:");
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v9 = objc_opt_new(UIImage);
  objc_msgSend(v8, "setShadowImage:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setAccessibilityIdentifier:", CFSTR("navigation-bar"));
  v10 = objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1102));
  v92 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v92, 1));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setBackgroundEffects:", v11);

  v12 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v10);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 24);
  *(_QWORD *)(v13 + 24) = v12;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "layer"));
  objc_msgSend(v15, "setAllowsGroupOpacity:", 0);

  v88 = (void *)v10;
  v16 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v10);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 88);
  *(_QWORD *)(v17 + 88) = v16;

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "layer"));
  objc_msgSend(v19, "setAllowsGroupOpacity:", 0);

  v20 = objc_claimAutoreleasedReturnValue(+[SSChromeHelper separatorView](SSChromeHelper, "separatorView"));
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 32);
  *(_QWORD *)(v21 + 32) = v20;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v23 = objc_claimAutoreleasedReturnValue(+[SSChromeHelper separatorView](SSChromeHelper, "separatorView"));
  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "contentView"));
  objc_msgSend(v26, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

  v27 = objc_alloc_init(SSSScreenshotCountIndicator);
  v28 = *(_QWORD *)(a1 + 32);
  v29 = *(void **)(v28 + 112);
  *(_QWORD *)(v28 + 112) = v27;

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 3));
  v90 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("info.circle.and.sparkles"), v30));

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 3));
  v32 = objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("info.circle.and.sparkles.fill"), v31));

  v33 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  v34 = *(_QWORD *)(a1 + 32);
  v35 = *(void **)(v34 + 56);
  *(_QWORD *)(v34 + 56) = v33;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setAccessibilityIdentifier:", CFSTR("Screenshots-Visual-Search-Button"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setImage:forState:", v90, 0);
  v89 = (void *)v32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setImage:forState:", v32, 4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setImage:forState:", v32, 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addTarget:action:forEvents:", *(_QWORD *)(a1 + 32), "analysisInfoButtonPressed:", 64);
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect _effectForBlurEffect:vibrancyStyle:](UIVibrancyEffect, "_effectForBlurEffect:vibrancyStyle:", v10, 102));
  v36 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v87);
  objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v36, "setUserInteractionEnabled:", 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "contentView"));
  objc_msgSend(v37, "addSubview:", v36);

  v38 = objc_alloc_init((Class)UILabel);
  v39 = *(_QWORD *)(a1 + 32);
  v40 = *(void **)(v39 + 48);
  *(_QWORD *)(v39 + 48) = v38;

  v41 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v41, "setFont:", v42);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setTextAlignment:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setNumberOfLines:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "contentView"));
  objc_msgSend(v43, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "contentView"));
  objc_msgSend(v44, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setMaximumContentSizeCategory:", UIContentSizeCategoryExtraExtraExtraLarge);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v46 = v45 + -32.0 + -64.0 + -16.0;
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "leadingAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:constant:", v85, 20.0));
  v91[0] = v84;
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "topAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "topAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:constant:", v82, 20.0));
  v91[1] = v81;
  v79 = v44;
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "centerXAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "centerXAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:", v78));
  v91[2] = v77;
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "centerYAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "centerYAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintGreaterThanOrEqualToAnchor:", v75));
  v91[3] = v74;
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "widthAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintLessThanOrEqualToConstant:", v46));
  v91[4] = v72;
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "topAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "topAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintGreaterThanOrEqualToAnchor:", v70));
  v91[5] = v68;
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "contentView"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "topAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "contentView"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "topAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v64));
  v91[6] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "contentView"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "leadingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "contentView"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "leadingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
  v91[7] = v58;
  v69 = v36;
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "contentView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "bottomAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "contentView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bottomAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v48));
  v91[8] = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "contentView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "trailingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "contentView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "trailingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v53));
  v91[9] = v54;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v91, 10));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v55);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "_updateSubviewOrdering");
  objc_msgSend(*(id *)(a1 + 32), "setIsPerformingFullscreenSetup:", 0);

}

void sub_100039740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000398A0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInteractionMode:", *(_QWORD *)(a1 + 32));
}

void sub_100039CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100039CF4(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[7], "setAlpha:", *(double *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateInstructionLabelIfNecessaryAnimated:", 1);

}

id sub_10003BF28(uint64_t a1)
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  unsigned int v5;
  double v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "editMode") == (id)1 && objc_msgSend(*(id *)(a1 + 32), "state") == (id)1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentScreenshot"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pdfData"));

  if (v4)
    v5 = v2;
  else
    v5 = 0;
  v6 = (double)v5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setAlpha:", (double)v5);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setAlpha:", v6);
}

id sub_10003E270(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

id sub_10003E278(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void sub_10003E50C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003E528(uint64_t a1)
{
  _OWORD *WeakRetained;
  __int128 v3;
  _OWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = *(_OWORD *)(a1 + 56);
    WeakRetained[11] = *(_OWORD *)(a1 + 40);
    WeakRetained[12] = v3;
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "layoutIfNeeded");
    WeakRetained = v4;
  }

}

Class sub_10003F8D4(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_1000AD800)
  {
    v5 = off_1000928D8;
    v6 = 0;
    qword_1000AD800 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_1000AD800)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("AKToolbarView");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_100058058();
LABEL_8:
    free(v2);
  }
  qword_1000AD7F8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100040128(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;
  _QWORD v5[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_screenshotsView"));
  objc_msgSend(v2, "removeScreenshots:", *(_QWORD *)(a1 + 40));

  if (!*(_QWORD *)(a1 + 56))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000401E8;
    v5[3] = &unk_100091920;
    v5[4] = *(_QWORD *)(a1 + 32);
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_screenshotsView"));
    objc_msgSend(v3, "layoutIfNeeded");

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_1000401E8(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateBarButtonItemPositionsAnimated:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "navigationBar"));
  objc_msgSend(v2, "layoutIfNeeded");

}

uint64_t sub_10004023C(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_screenshotsView"));
  objc_msgSend(v2, "setCurrentScreenshotCropHandlesFadedOut:", 0);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "removeFromSuperview", (_QWORD)v9);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "_updateBarButtonItemPositionsAnimated:", 1);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100040360(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_QWORD *)(a1 + 40) == 1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_screenshotsView"));
    objc_msgSend(v2, "setState:", 0);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_screenshotsView"));
  objc_msgSend(v3, "setCurrentScreenshotCropHandlesFadedOut:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_screenshotsView"));
  objc_msgSend(v4, "layoutIfNeeded");

}

uint64_t sub_1000403E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000403EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000403F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100040B94(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_100040BD8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "becomeFirstResponder");

}

void sub_100040C04(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "becomeFirstResponder");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_undoPushed");

}

void sub_100040C50(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "becomeFirstResponder");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_redoPushed");

}

void sub_10004186C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

id sub_100041898(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_screenshotsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "createUndoMenu"));

  return v3;
}

void sub_10004243C(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a2)
  {
    _objc_msgSend(*(id *)(a1 + 32), "_actuallyPresentShareFromBarButtonItem:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = os_log_create("com.apple.screenshotservices", "ShareSheet");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_10005807C(a1, v3, v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SAVE_TO_PHOTOS_FAILURE_MESSAGE"), CFSTR("Unable to save image to Photos."), 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), CFSTR("OK"), 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v6, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 0, 0));
    objc_msgSend(v9, "addAction:", v10);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v9, 1, 0);
  }
}

void sub_100042810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100042834(uint64_t a1, void *a2)
{
  void (**v3)(id, void *);
  id *v4;
  id *WeakRetained;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  void *v13;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "becomeFirstResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_screenshotsView"));
  objc_msgSend(v6, "setNeedsLayout");

  if (WeakRetained)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000429DC;
    v11[3] = &unk_100092998;
    objc_copyWeak(&v12, v4);
    objc_msgSend(WeakRetained[32], "setDisplayLinkObserverHandler:", v11);
    objc_msgSend(WeakRetained[32], "startObserver");
    objc_destroyWeak(&v12);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_screenshotsView"));
  v8 = objc_msgSend(v7, "editMode") == (id)2;

  if (v8)
  {
    objc_msgSend(WeakRetained, "_exitCrop");
    v3[2](v3, &__NSArray0__struct);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_buildDoneMenuElements"));
    v13 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    v3[2](v3, v10);

  }
}

void sub_1000429BC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_1000429DC(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;
  void *v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "isShowingModalUI");

  if ((v3 & 1) == 0)
  {
    v4 = objc_loadWeakRetained(v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_screenshotsView"));
    objc_msgSend(v5, "setNeedsLayout");

  }
  return v3;
}

void sub_100043600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(location);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)&STACK[0x2A8]);
  _Unwind_Resume(a1);
}

void sub_100043778(uint64_t a1)
{
  id WeakRetained;
  int v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "commitInflightEditsIfNecessary");
    if (v3)
    {
      objc_msgSend(v5, "_dismissWithDeleteOptions:", 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
      objc_msgSend(v4, "didSaveImageToPhotos");
    }
    else
    {
      objc_msgSend(v5, "_savePDFToPhotosPushed");
      objc_msgSend(v5, "_dismissWithDeleteOptions:", 2);
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
      objc_msgSend(v4, "didSavePDFImageToPhotos");
    }

    WeakRetained = v5;
  }

}

void sub_100043814(uint64_t a1)
{
  _QWORD *WeakRetained;
  int v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[25] = 2;
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "_saveToFilesPushed:savePDF:");
    v3 = *(unsigned __int8 *)(a1 + 40);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    v5 = v4;
    if (v3)
      objc_msgSend(v4, "didSaveImageToFiles");
    else
      objc_msgSend(v4, "didSaveFullPagePDFToFiles");

    WeakRetained = v6;
  }

}

void sub_100043898(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[25] = 2;
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_saveToQuickNotePushed:savePDF:", 1, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v2, "didSaveImageToQuickNote");

    WeakRetained = v3;
  }

}

void sub_100043904(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[25] = 1;
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_saveToFilesPushed:savePDF:", 0, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v2, "didSaveMixedToPhotosAndFiles");

    WeakRetained = v3;
  }

}

void sub_100043970(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[25] = 2;
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_saveToQuickNotePushed:savePDF:", 1, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v2, "didSaveMixedToQuickNoteAndFiles");

    WeakRetained = v3;
  }

}

void sub_1000439DC(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[25] = 2;
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_saveToFilesPushed:savePDF:", 1, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v2, "didSaveMixedAllToFiles");

    WeakRetained = v3;
  }

}

void sub_100043A48(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_exportVellumPDF");

}

void sub_100043A74(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sendToDeveloper");

}

void sub_100043AA0(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleScreenshots"));
    objc_msgSend(v2, "screenshotsViewController:requestsCopyDeleteForScreenshots:deleteOptions:forReason:", v5, v3, 2, 1);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v4, "didCopyDeleteScreenshots");

    WeakRetained = v5;
  }

}

void sub_100043B2C(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleScreenshots"));
    objc_msgSend(v2, "screenshotsViewController:requestsDeleteForScreenshots:deleteOptions:forReason:", v5, v3, 2, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
    objc_msgSend(v4, "didDeleteScreenshots");

    WeakRetained = v5;
  }

}

void sub_100043FCC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000440B8;
  v8[3] = &unk_100092A38;
  v8[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);
  v4 = objc_msgSend(v3, "mutableCopy");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "removeObjectsInArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208));
  v7 = objc_msgSend(objc_alloc((Class)UIDocumentPickerViewController), "initForExportingURLs:asCopy:", v3, 1);

  objc_msgSend(v7, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v7, 1, 0);

}

void sub_1000440B8(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "startAccessingSecurityScopedResource"))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
    if (v3)
    {
      objc_msgSend(v3, "addObject:", v7);
    }
    else
    {
      v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v7));
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 208);
      *(_QWORD *)(v5 + 208) = v4;

    }
  }

}

void sub_100044138(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (!v3)
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 32)));
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }

}

void sub_100044228(id a1, NSURL *a2, unint64_t a3, BOOL *a4)
{
  -[NSURL stopAccessingSecurityScopedResource](a2, "stopAccessingSecurityScopedResource", a3, a4);
}

void sub_100044230(id a1, NSURL *a2, unint64_t a3, BOOL *a4)
{
  NSURL *v4;
  id v5;

  v4 = a2;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v5, "removeItemAtURL:error:", v4, 0);

}

void sub_100044450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  uint64_t v15;
  id *v16;

  if (v15)
    objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100044478(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004451C;
  v8[3] = &unk_100092B10;
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v8[4] = v6;
  v7 = v3;
  objc_msgSend(v4, "dismissRequestedFromScreenshotsViewController:completion:", v6, v8);

}

uint64_t sub_10004451C(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "visibleScreenshots", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
        objc_msgSend(v8, "removeTemporaryScreenshotLocation:deleteOptions:", v7, *(_QWORD *)(a1 + 48));

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  return sub_100026DCC(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100044644(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100044654(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_saveImages:toQuickNoteWithDismissalCompletionBlock:", *(_QWORD *)(a1 + 32), 0);

}

void sub_10004488C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000448A4(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;

  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.screenshotservices", "Screenshot");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100058184(a1, v5, v6);

  }
  if (a2)
  {
    v7 = os_log_create("com.apple.screenshotservices", "Screenshot");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "count");
      v9 = 134217984;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%lu screenshots sent to Quick Note", (uint8_t *)&v9, 0xCu);
    }

  }
}

void sub_1000449C4(uint64_t a1, void *a2)
{
  void *v3;
  Class v4;
  char isKindOfClass;
  NSObject *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "object"));
  v4 = NSClassFromString(CFSTR("ICSystemPaperExtensionHostViewController"));
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v6 = os_log_create("com.apple.screenshotservices", "Screenshot");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Quick Note UI dismissed", v7, 2u);
    }

    sub_100026DCC(*(_QWORD *)(a1 + 32));
  }
}

void sub_100045104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100045140(uint64_t a1)
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
  id v11;
  void *v12;

  if (*(_BYTE *)(a1 + 40) || *(_BYTE *)(a1 + 41))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentScreenshot"));

    if (v2)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
      v4 = *(void **)(a1 + 32);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentScreenshot"));
      v12 = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
      objc_msgSend(v3, "screenshotsViewController:requestsDeleteForScreenshots:deleteOptions:forReason:", v4, v6, 2, 0);

    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_currentScreenshotView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_internalPDFView"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentPage"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentScreenshot"));
    objc_msgSend(v9, "deletePDFPage:", v11);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_screenshotsView"));
    objc_msgSend(v10, "setNeedsLayout");

  }
}

void sub_1000452BC(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "becomeFirstResponder");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_screenshotsView"));
    objc_msgSend(v3, "setNeedsLayout");

    WeakRetained = v4;
  }

}

void sub_10004531C(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[29];
    WeakRetained[29] = 0;
    v4 = WeakRetained;

    objc_msgSend(v4, "becomeFirstResponder");
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_screenshotsView"));
    objc_msgSend(v3, "setNeedsLayout");

    WeakRetained = v4;
  }

}

void sub_100045A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100045A68(uint64_t a1, uint64_t a2, char a3)
{
  id *WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_screenshotsView"));
    objc_msgSend(v5, "setNeedsLayout");

    if ((a3 & 1) == 0)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[20], "presentingViewController"));
      if (v6)
        goto LABEL_6;
    }
    WeakRetained = v8;
    if (!*((_BYTE *)v8 + 169))
    {
      *((_BYTE *)v8 + 169) = 1;
      objc_msgSend(v8, "_cancelSharing:completion:", 1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_screenshotsView"));
      objc_msgSend(v7, "setIsSharing:", 0);

      objc_msgSend(v8[20], "setCompletionWithItemsHandler:", 0);
      v6 = v8[20];
      v8[20] = 0;
LABEL_6:

      WeakRetained = v8;
    }
  }

}

void sub_100045EB8(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateBarButtonItemPositionsAnimated:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_screenshotsView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topBar"));
  objc_msgSend(v2, "layoutIfNeeded");

}

void sub_100045F10(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "_cancel");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 169) = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_screenshotsView"));
  objc_msgSend(v2, "setNeedsLayout");

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v3, "activityViewControllerDismissedFromScreenshotsViewController:", *(_QWORD *)(a1 + 32));

}

uint64_t sub_100045F8C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100046068(uint64_t a1, char a2)
{
  void *v4;
  _BOOL8 v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "presentingViewController"));
  v6 = v4;
  if (v4)
  {
    v5 = *(_BYTE *)(a1 + 48) != 0;
    if ((a2 & 1) == 0)
    {
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", v5, *(_QWORD *)(a1 + 40));
      goto LABEL_6;
    }
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", v5, 0);
  }
  sub_100026DCC(*(_QWORD *)(a1 + 40));
LABEL_6:

}

void sub_1000462E8(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160), 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "popoverPresentationController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_screenshotsView"));
    objc_msgSend(v4, "screenshotsExtentRect");
    objc_msgSend(v3, "setSourceRect:");

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "popoverPresentationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
    objc_msgSend(v5, "setSourceView:", v6);

    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "popoverPresentationController"));
    objc_msgSend(v15, "setPermittedArrowDirections:", 2);

  }
  else
  {
    v7 = os_log_create("com.apple.screenshotservices", "ShareSheet");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005807C(a1, v7, v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SAVE_TO_PHOTOS_FAILURE_MESSAGE"), CFSTR("Unable to save image to Photos."), 0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OK"), CFSTR("OK"), 0));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v10, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 0, 0));
    objc_msgSend(v13, "addAction:", v14);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v13, 1, 0);
  }
}

id sub_100046758(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendToDeveloper");
}

void sub_1000468BC(uint64_t a1)
{
  void *v2;
  void *v3;
  objc_class *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
  if (!v2)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v3 = (void *)qword_1000AD820;
    v21 = qword_1000AD820;
    if (!qword_1000AD820)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100048BB0;
      v17[3] = &unk_100091848;
      v17[4] = &v18;
      sub_100048BB0((uint64_t)v17);
      v3 = (void *)v19[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v18, 8);
    v5 = objc_msgSend([v4 alloc], "initForContext:betaApplicationIdentifier:", 1, *(_QWORD *)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 184);
    *(_QWORD *)(v6 + 184) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "initiateFeedbackSnapshot");
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
  }
  objc_msgSend(v2, "associateScreenshotImages:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setDelegate:");
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "createFeedbackViewControllerForCurrentState"));
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 176);
  *(_QWORD *)(v9 + 176) = v8;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("BACK"), CFSTR("Back"), 0));

  v13 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v12, 0, *(_QWORD *)(a1 + 32), "dismissTFViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "navigationItem"));
  objc_msgSend(v14, "setLeftBarButtonItem:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_screenshotsView"));
  objc_msgSend(v15, "setIsSharing:", 1);

  v16 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
  objc_msgSend(v16, "setModalPresentationStyle:", 1);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v16, 1, 0);

}

void sub_100046AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100046B50(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_screenshotsView"));
  objc_msgSend(v2, "setIsSharing:", 0);

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_screenshotsView"));
  objc_msgSend(v3, "setNeedsLayout");

}

void sub_100046C80(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v2, "dismissRequestedFromScreenshotsViewController:completion:", *(_QWORD *)(a1 + 32), 0);

}

id sub_100046FAC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
}

id sub_100046FB8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
}

void sub_100047194(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_screenshotsView"));
  objc_msgSend(v2, "setShowsShadow:", *(unsigned __int8 *)(a1 + 40));

}

uint64_t sub_100048AAC()
{
  uint64_t v0;
  char *v1;
  char *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_1000AD810)
  {
    v4 = off_100092C98;
    v5 = 0;
    qword_1000AD810 = _sl_dlopen(&v4, &v3);
  }
  v0 = qword_1000AD810;
  v1 = v3;
  if (!qword_1000AD810)
  {
    v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_7;
  }
  if (v3)
LABEL_7:
    free(v1);
  return v0;
}

Class sub_100048B5C(uint64_t a1)
{
  Class result;
  uint64_t v3;

  sub_100048AAC();
  result = objc_getClass("SYLinkContextClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1000AD818 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = sub_100057E04();
    return (Class)sub_100048BB0(v3);
  }
  return result;
}

Class sub_100048BB0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_1000AD828)
  {
    v4 = off_100092CB0;
    v5 = 0;
    qword_1000AD828 = _sl_dlopen(&v4, &v3);
    if (!qword_1000AD828)
    {
      abort_report_np("%s", (const char *)v3);
LABEL_8:
      sub_100058240();
    }
    if (v3)
      free(v3);
  }
  result = objc_getClass("TFFeedbackSession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_8;
  qword_1000AD820 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100048CA4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

__n128 sub_100048FB0@<Q0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  __n128 result;

  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  result = *(__n128 *)a1;
  *(CGPoint *)(a1 + 16) = CGPointZero;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t sub_100048FD0(uint64_t a1, uint64_t a2)
{
  _BOOL4 v2;

  v2 = *(double *)(a1 + 8) == *(double *)(a2 + 8) && *(double *)a1 == *(double *)a2;
  return v2 & CGRectEqualToRect(*(CGRect *)(a1 + 16), *(CGRect *)(a2 + 16));
}

double sub_100049018(double *a1)
{
  return a1[2] / *a1;
}

id sub_100049038(double a1, double a2, double a3, double a4)
{
  void *v8;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  objc_msgSend(v8, "appendFormat:", CFSTR("<(%.1f,"), *(_QWORD *)&a1);
  objc_msgSend(v8, "appendFormat:", CFSTR("%.1f)"), *(_QWORD *)&a2);
  objc_msgSend(v8, "appendFormat:", CFSTR("@ %.1fx%.1f>"), *(_QWORD *)&a3, *(_QWORD *)&a4);
  return v8;
}

id sub_1000490C8(CGSize *a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("<")));
  v3 = sub_100049038(a1[1].width, a1[1].height, a1[2].width, a1[2].height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("rect: %@ "), v4));
  objc_msgSend(v2, "appendString:", v5);

  v6 = NSStringFromCGSize(*a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("total size: %@"), v7));
  objc_msgSend(v2, "appendString:", v8);

  objc_msgSend(v2, "appendString:", CFSTR(">"));
  return v2;
}

uint64_t sub_1000491EC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  if (a2 <= 1)
    v2 = 1;
  else
    v2 = a2;
  if (a1)
    return 2;
  else
    return v2;
}

BOOL sub_100049204(uint64_t a1)
{
  return a1 == 1;
}

id sub_100049D2C(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "willSoonUnparentChildDittoRootViewController");
  if ((result & 1) == 0)
    return _objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "performProgrammaticDismiss");
  return result;
}

uint64_t sub_10004A32C(uint64_t *a1)
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

uint64_t sub_10004A36C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v6)(_QWORD *, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  uint64_t v12;

  v2 = sub_10004A32C(&qword_1000ACF60);
  v3 = sub_10004B41C(&qword_1000ACFF8, &qword_1000ACF60, (uint64_t)&protocol conformance descriptor for CROrderedSet<A>);
  dispatch thunk of Collection.startIndex.getter(&v12, v2, v3);
  dispatch thunk of Collection.endIndex.getter(v11, v2, v3);
  if (v12 == v11[0])
  {
    v4 = sub_10004A32C(&qword_1000ACF68);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, 1, 1, v4);
  }
  else
  {
    v6 = (void (*)(_QWORD *, _QWORD))dispatch thunk of Collection.subscript.read(v11, &v12, v2, v3);
    v8 = v7;
    v9 = sub_10004A32C(&qword_1000ACF68);
    v10 = *(_QWORD *)(v9 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(a1, v8, v9);
    v6(v11, 0);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
  }
}

uint64_t sub_10004A490(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10004A32C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10004A4CC(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  _QWORD v5[6];

  v5[2] = a2;
  v5[3] = a3;
  *(double *)&v5[4] = a4;
  return Capsule.callAsFunction<A>(_:)(sub_10004B2D4, v5, a1, (char *)&type metadata for () + 8);
}

uint64_t sub_10004A51C(_QWORD *a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  char *v58;
  void (*v59)(char *, uint64_t);
  void (*v60)(char *, uint64_t);
  int v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  void (*v66)(_QWORD, _QWORD);
  uint64_t v67;
  uint64_t v68;
  unsigned int (*v69)(void (*)(_QWORD, _QWORD), uint64_t, uint64_t);
  void (*v70)(_QWORD, _QWORD);
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(char *, uint64_t);
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  uint64_t v82;
  char *v83;
  unsigned int v84;
  uint64_t v85;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  void (*v100)(char *, uint64_t, uint64_t, uint64_t);
  char *v101;
  char *v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t KeyPath;
  _QWORD *v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  char *v118;
  char *v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  void (*v127)(double *, _QWORD);
  void (*v128)(char *, _QWORD);
  void (*v129)(double *, _QWORD);
  uint64_t v130;
  char *v131;
  char *v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  char *v137;
  char *v138;
  uint64_t v139;
  char *v140;
  char *v141;
  char *v142;
  char *v143;
  char *v144;
  uint64_t v145;
  char *v146;
  char *v147;
  char *v148;
  char *v149;
  char **v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  _QWORD *v155;
  uint64_t v156;
  char *v157;
  uint64_t v158;
  char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  char v166[8];
  double v167[4];

  v164 = a2;
  v165 = a3;
  v6 = *a1;
  v7 = type metadata accessor for ShapeSecondaryProperties(0);
  v162 = *(_QWORD *)(v7 - 8);
  v163 = v7;
  __chkstk_darwin(v7);
  v148 = (char *)&v131 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v9);
  v149 = (char *)&v131 - v11;
  v145 = type metadata accessor for CanvasElementAutoresizeBehavior(0, v10);
  __chkstk_darwin(v145);
  v146 = (char *)&v131 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_10004A32C(&qword_1000ACF78);
  __chkstk_darwin(v13);
  v143 = (char *)&v131 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_10004A32C(&qword_1000ACF80);
  __chkstk_darwin(v15);
  v141 = (char *)&v131 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v17);
  v142 = (char *)&v131 - v19;
  v139 = type metadata accessor for Rectangle(0, v18);
  __chkstk_darwin(v139);
  v138 = (char *)&v131 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_10004A32C(&qword_1000ACF88);
  v160 = *(_QWORD *)(v21 - 8);
  v161 = v21;
  __chkstk_darwin(v21);
  v157 = (char *)&v131 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __chkstk_darwin(v23);
  v159 = (char *)&v131 - v25;
  v134 = type metadata accessor for CanvasElementFlags(0, v24);
  v135 = *(_QWORD *)(v134 - 8);
  __chkstk_darwin(v134);
  v133 = (char *)&v131 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  v152 = (char *)&v131 - v28;
  v29 = sub_10004A32C(&qword_1000ACF58);
  __chkstk_darwin(v29);
  v132 = (char *)&v131 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __chkstk_darwin(v31);
  v150 = (char **)((char *)&v131 - v33);
  v154 = type metadata accessor for Shape(0, v32);
  v156 = *(_QWORD *)(v154 - 8);
  __chkstk_darwin(v154);
  v144 = (char *)&v131 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v35);
  v147 = (char *)&v131 - v36;
  __chkstk_darwin(v37);
  v137 = (char *)&v131 - v38;
  __chkstk_darwin(v39);
  v136 = (char *)&v131 - v40;
  v41 = sub_10004A32C((uint64_t *)&unk_1000AD1F0);
  __chkstk_darwin(v41);
  v43 = (char *)&v131 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = sub_10004A32C(&qword_1000ACF60);
  v151 = *(_QWORD *)(v44 - 8);
  __chkstk_darwin(v44);
  v46 = (char *)&v131 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = *(_QWORD *)(v6 + class metadata base offset for Capsule.Ref);
  v48 = *(_QWORD *)(v47 - 8);
  __chkstk_darwin(v49);
  v51 = (char *)&v131 - v50;
  v52 = sub_10004A32C(&qword_1000ACF68);
  v53 = *(_QWORD *)(v52 - 8);
  __chkstk_darwin(v52);
  v140 = (char *)&v131 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __chkstk_darwin(v55);
  v58 = (char *)&v131 - v57;
  v155 = a1;
  Capsule.Ref<>.root.getter(v164, v56);
  dispatch thunk of ContainerCanvasElement.subelements.getter(v47, v165);
  v59 = *(void (**)(char *, uint64_t))(v48 + 8);
  v158 = v47;
  v59(v51, v47);
  sub_10004A36C((uint64_t)v43);
  v60 = *(void (**)(char *, uint64_t))(v151 + 8);
  v151 = v44;
  v60(v46, v44);
  v61 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v53 + 48))(v43, 1, v52);
  v153 = v53;
  if (v61 == 1)
  {
    v62 = sub_10004A490((uint64_t)v43, (uint64_t *)&unk_1000AD1F0);
LABEL_9:
    v131 = (char *)v52;
    v87 = v138;
    Rectangle.init()(v62);
    v150 = (char **)type metadata accessor for Ellipse(0);
    v137 = (char *)type metadata accessor for Line(0);
    v136 = (char *)type metadata accessor for BezierPath(0);
    v135 = type metadata accessor for CalloutBubble(0);
    v134 = type metadata accessor for RoundedRect(0);
    v133 = (char *)type metadata accessor for RegularPolygon(0);
    v132 = (char *)type metadata accessor for Star(0);
    v88 = type metadata accessor for ArrowShape(0);
    v89 = sub_10004B3DC(&qword_1000ACF90, (uint64_t (*)(uint64_t))&type metadata accessor for Rectangle, (uint64_t)&protocol conformance descriptor for Rectangle);
    v90 = sub_10004B3DC(&qword_1000ACF98, (uint64_t (*)(uint64_t))&type metadata accessor for Ellipse, (uint64_t)&protocol conformance descriptor for Ellipse);
    v91 = sub_10004B3DC(&qword_1000ACFA0, (uint64_t (*)(uint64_t))&type metadata accessor for Line, (uint64_t)&protocol conformance descriptor for Line);
    v92 = sub_10004B3DC(&qword_1000ACFA8, (uint64_t (*)(uint64_t))&type metadata accessor for BezierPath, (uint64_t)&protocol conformance descriptor for BezierPath);
    v93 = sub_10004B3DC(&qword_1000ACFB0, (uint64_t (*)(uint64_t))&type metadata accessor for CalloutBubble, (uint64_t)&protocol conformance descriptor for CalloutBubble);
    v94 = sub_10004B3DC(&qword_1000ACFB8, (uint64_t (*)(uint64_t))&type metadata accessor for RoundedRect, (uint64_t)&protocol conformance descriptor for RoundedRect);
    v95 = sub_10004B3DC(&qword_1000ACFC0, (uint64_t (*)(uint64_t))&type metadata accessor for RegularPolygon, (uint64_t)&protocol conformance descriptor for RegularPolygon);
    v96 = sub_10004B3DC(&qword_1000ACFC8, (uint64_t (*)(uint64_t))&type metadata accessor for Star, (uint64_t)&protocol conformance descriptor for Star);
    v97 = sub_10004B3DC(&qword_1000ACFD0, (uint64_t (*)(uint64_t))&type metadata accessor for ArrowShape, (uint64_t)&protocol conformance descriptor for ArrowShape);
    v130 = v94;
    v98 = v159;
    TaggedValue_9.init(_:)(v87, v139, v150, v137, v136, v135, v134, v133, v132, v88, v89, v90, v91, v92, v93, v130, v95, v96, v97);
    (*(void (**)(char *, char *, uint64_t))(v160 + 16))(v157, v98, v161);
    v99 = type metadata accessor for Color(0);
    v100 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v99 - 8) + 56);
    v101 = v142;
    v100(v142, 1, 1, v99);
    v102 = v141;
    v100(v141, 1, 1, v99);
    v103 = sub_10004A32C(&qword_1000ACFD8);
    v104 = v143;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v103 - 8) + 56))(v143, 1, 1, v103);
    *(_QWORD *)&v167[0] = &_swiftEmptyArrayStorage;
    v105 = sub_10004B3DC(&qword_1000ACFE0, (uint64_t (*)(uint64_t))&type metadata accessor for CanvasElementAutoresizeBehavior, (uint64_t)&protocol conformance descriptor for CanvasElementAutoresizeBehavior);
    v106 = sub_10004A32C(&qword_1000ACFE8);
    v107 = sub_10004B41C(&qword_1000ACFF0, &qword_1000ACFE8, (uint64_t)&protocol conformance descriptor for [A]);
    v108 = v146;
    dispatch thunk of SetAlgebra.init<A>(_:)(v167, v106, v107, v145, v105);
    v109 = v147;
    Shape.init(frame:type:strokeWidth:strokeColor:fillColor:text:textResizeBehavior:)(v157, v101, v102, v104, v108, 0.0, 0.0, 0.0, 0.0, 5.0);
    Color.init(red:green:blue:alpha:)(1.0, 1.0, 1.0, 1.0);
    v100(v101, 0, 1, v99);
    v110 = Shape.fillColor.setter(v101);
    v111 = Shape.strokeWidth.setter(v110, 0.0);
    __chkstk_darwin(v111);
    v112 = v164;
    KeyPath = swift_getKeyPath(&unk_10006E220);
    v114 = v155;
    Capsule.Ref<>.subscript.getter(KeyPath, v112);
    swift_release(KeyPath);
    Shape.frame.setter(v167[0], v167[1], v167[2], v167[3]);
    v115 = Shape.opacity.setter(a4);
    v116 = v149;
    v117 = ShapeSecondaryProperties.init()(v115);
    v118 = v152;
    static CanvasElementFlags.readOnly.getter(v117);
    ShapeSecondaryProperties.flags.setter(v118);
    v119 = v148;
    (*(void (**)(char *, char *, uint64_t))(v162 + 16))(v148, v116, v163);
    Shape.secondaryProperties.setter(v119);
    v120 = v156;
    v121 = v144;
    v122 = v154;
    (*(void (**)(char *, char *, uint64_t))(v156 + 16))(v144, v109, v154);
    v123 = type metadata accessor for TaggedCanvasElement(0);
    v124 = sub_10004B3DC((unint64_t *)&unk_1000AD5B0, (uint64_t (*)(uint64_t))&type metadata accessor for TaggedCanvasElement, (uint64_t)&protocol conformance descriptor for TaggedCanvasElement);
    v125 = swift_retain(v114);
    v126 = v140;
    SharedTagged_9.init<A>(_:_:)(v125, v121, v123, v124);
    v127 = (void (*)(double *, _QWORD))Capsule.Ref<>.root.modify(v167, v112);
    v128 = (void (*)(char *, _QWORD))dispatch thunk of ContainerCanvasElement.subelements.modify(v166, v158, v165);
    CROrderedSet.insert(_:at:)(v126, 0, v151);
    (*(void (**)(char *, char *))(v153 + 8))(v126, v131);
    v128(v166, 0);
    v127(v167, 0);
    (*(void (**)(char *, uint64_t))(v162 + 8))(v116, v163);
    (*(void (**)(char *, uint64_t))(v120 + 8))(v109, v122);
    return (*(uint64_t (**)(char *, uint64_t))(v160 + 8))(v159, v161);
  }
  v63 = v137;
  v64 = v136;
  v65 = (*(uint64_t (**)(char *, char *, uint64_t))(v53 + 32))(v58, v43, v52);
  v66 = (void (*)(_QWORD, _QWORD))v150;
  SharedTagged_9<>.shape.getter(v65);
  v67 = sub_10004A32C(&qword_1000ACF70);
  v68 = *(_QWORD *)(v67 - 8);
  v69 = *(unsigned int (**)(void (*)(_QWORD, _QWORD), uint64_t, uint64_t))(v68 + 48);
  if (v69(v66, 1, v67) == 1)
  {
    sub_10004A490((uint64_t)v150, &qword_1000ACF58);
    v62 = (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v58, v52);
    goto LABEL_9;
  }
  v131 = v58;
  v70 = (void (*)(_QWORD, _QWORD))v150;
  Ref.subscript.getter(v155, v67);
  v150 = *(char ***)(v68 + 8);
  ((void (*)(_QWORD, uint64_t))v150)(v70, v67);
  v71 = v64;
  v72 = v154;
  v73 = (*(uint64_t (**)(char *, char *, uint64_t))(v156 + 32))(v64, v63, v154);
  v74 = v152;
  v75 = Shape.flags.getter(v73);
  v76 = v133;
  static CanvasElementFlags.readOnly.getter(v75);
  v77 = sub_10004B3DC(&qword_1000AD220, (uint64_t (*)(uint64_t))&type metadata accessor for CanvasElementFlags, (uint64_t)&protocol conformance descriptor for CanvasElementFlags);
  v78 = v134;
  LOBYTE(v70) = dispatch thunk of SetAlgebra.isSuperset(of:)(v76, v134, v77);
  v79 = *(void (**)(char *, uint64_t))(v135 + 8);
  v79(v76, v78);
  v80 = ((uint64_t (*)(char *, uint64_t))v79)(v74, v78);
  if ((v70 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v156 + 8))(v71, v72);
    v62 = (*(uint64_t (**)(char *, uint64_t))(v153 + 8))(v131, v52);
    goto LABEL_9;
  }
  v81 = (uint64_t (*)(uint64_t, uint64_t))v150;
  v82 = (uint64_t)v132;
  v83 = v131;
  SharedTagged_9<>.shape.getter(v80);
  v84 = v69((void (*)(_QWORD, _QWORD))v82, 1, v67);
  v85 = v156;
  if (v84 == 1)
  {
    (*(void (**)(char *, uint64_t))(v156 + 8))(v71, v72);
    (*(void (**)(char *, uint64_t))(v153 + 8))(v83, v52);
    return sub_10004A490(v82, &qword_1000ACF58);
  }
  else
  {
    v129 = (void (*)(double *, _QWORD))Ref.subscript.modify(v167, v155, v67);
    Shape.opacity.setter(a4);
    v129(v167, 0);
    (*(void (**)(char *, uint64_t))(v85 + 8))(v71, v72);
    (*(void (**)(char *, uint64_t))(v153 + 8))(v83, v52);
    return v81(v82, v67);
  }
}

uint64_t sub_10004B2D4(_QWORD *a1)
{
  uint64_t v1;

  return sub_10004A51C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(double *)(v1 + 32));
}

void sub_10004B300(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(double *)a3 = dispatch thunk of ContainerCanvasElement.bounds.getter(*(_QWORD *)(a2 + a1 - 24), *(_QWORD *)(a2 + a1 - 8));
  *(_QWORD *)(a3 + 8) = v4;
  *(_QWORD *)(a3 + 16) = v5;
  *(_QWORD *)(a3 + 24) = v6;
}

uint64_t sub_10004B33C(double *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return dispatch thunk of ContainerCanvasElement.bounds.setter(*(_QWORD *)(a4 + a3 - 24), *(_QWORD *)(a4 + a3 - 8), *a1, a1[1], a1[2], a1[3]);
}

uint64_t sub_10004B378(uint64_t *a1)
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

uint64_t sub_10004B3BC()
{
  return 24;
}

__n128 sub_10004B3C8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t sub_10004B3DC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_10004B41C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10004B378(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10004B45C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_10004B490(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_10004B49C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_10004B4BC(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_10004B578(a1, (unint64_t *)&unk_1000AD5A0, (uint64_t)&unk_100092E68);
}

__n128 sub_10004B4FC(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_10004B508(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_10004B528(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_10004B578(a1, &qword_1000AD590, (uint64_t)&unk_100092EE8);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_10004B578(a1, (unint64_t *)&unk_1000AD2C0, (uint64_t)&unk_100092F68);
}

void sub_10004B578(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_10004B5C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 88);
  v2 = type metadata accessor for Optional(0, *(_QWORD *)(*(_QWORD *)v0 + 80));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_10004B614()
{
  uint64_t v0;
  uint64_t v1;

  v1 = swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 80) - 8) + 56))(v1 + *(_QWORD *)(*(_QWORD *)v1 + 88), 1, 1);
  return v1;
}

void sub_10004B7D4(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
  void **v5;
  void *v6;
  id v7;
  _BYTE v8[24];

  v5 = (void **)(a1 + *a4);
  swift_beginAccess(v5, v8, 1, 0);
  v6 = *v5;
  *v5 = a3;
  v7 = a3;

}

uint64_t sub_10004B8C8(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_10004B8DC(result, a2);
  return result;
}

uint64_t sub_10004B8DC(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10004B9B0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_10004B9C4(a1, a2);
  return a1;
}

uint64_t sub_10004B9C4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    ((void (*)(void))swift_release)();
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

void sub_10004BB10(double a1)
{
  uint64_t v1;
  uint64_t v2;
  double *v4;
  double v5;
  uint64_t v6;
  id *v7;
  id v8;
  uint64_t v9;
  _BYTE v10[24];

  v2 = v1;
  v4 = (double *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_vellumOpacity);
  swift_beginAccess(v4, v10, 1, 0);
  v5 = *v4;
  *v4 = a1;
  if (v5 != a1)
  {
    v6 = OBJC_IVAR____SSSScreenshotPaperKitPDFView_isChangingVellumOpacity;
    *(_BYTE *)(v2 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_isChangingVellumOpacity) = 1;
    v7 = (id *)(v2 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView);
    swift_beginAccess(v2 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView, &v9, 0, 0);
    if (*v7)
    {
      v8 = *v7;
      dispatch thunk of PaperDocumentView.vellumOpacity.setter(a1);

    }
    *(_BYTE *)(v2 + v6) = 0;
  }
}

uint64_t sub_10004BC50()
{
  char *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  char *v21;
  uint64_t v22;
  char *v23;
  void **v24;
  double v25;
  void *v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  id *v34;
  double v35;
  id v36;
  char v37;
  char v38;
  uint64_t v40;
  unint64_t v41;
  void **v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  NSString *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t (*v61)(void);
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  uint64_t *v82;
  uint64_t v83;
  void **v84;
  void *v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(char *, uint64_t, uint64_t, uint64_t);
  char *v93;
  char *v94;
  char *v95;
  char *v96;
  uint64_t v97;
  char *v98;
  char *v99;
  char *v100;
  char *v101;
  char *v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  char v106[32];
  _BYTE v107[24];
  _BYTE v108[24];
  char v109[32];

  sub_10004A32C(&qword_1000AD060);
  ((void (*)(void))__chkstk_darwin)();
  v2 = (char *)&v88 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CRKeyPath(0);
  ((void (*)(void))__chkstk_darwin)();
  v96 = (char *)&v88 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_10004A32C(&qword_1000AD068);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v98 = (char *)&v88 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = v7;
  __chkstk_darwin(v6);
  v9 = (char *)&v88 - v8;
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v101 = (char *)&v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = type metadata accessor for URL(0);
  v103 = *(_QWORD *)(v105 - 8);
  v13 = __chkstk_darwin(v105);
  v104 = (char *)&v88 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v13);
  v100 = (char *)&v88 - v16;
  __chkstk_darwin(v15);
  v102 = (char *)&v88 - v17;
  v18 = sub_10004A32C(&qword_1000AD070);
  v19 = __chkstk_darwin(v18);
  v21 = (char *)&v88 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v23 = (char *)&v88 - v22;
  v24 = (void **)&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshot];
  *(_QWORD *)&v25 = swift_beginAccess(&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshot], v109, 0, 0).n128_u64[0];
  v26 = *v24;
  if (*v24)
  {
    v93 = v21;
    v94 = v9;
    v88 = v5;
    v89 = v4;
    v95 = v2;
    v27 = objc_msgSend(v26, "pdfData", v25);
    v28 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v27);
    v30 = v29;

    v99 = v0;
    v31 = (uint64_t *)&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData];
    swift_beginAccess(&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData], v108, 1, 0);
    v33 = *v31;
    v32 = v31[1];
    sub_10004B8DC(v28, v30);
    if (v32 >> 60 == 15)
    {
      sub_10004B9B0(v28, v30);
      sub_10004B9B0(v33, v32);
    }
    else
    {
      sub_10004B8C8(v33, v32);
      sub_100051DC4(v28, v30);
      v38 = v37;
      sub_10004B9B0(v33, v32);
      sub_10004B9C4(v28, v30);
      if ((v38 & 1) != 0)
        return sub_10004B9C4(v28, v30);
    }
    v40 = *v31;
    v41 = v31[1];
    *v31 = v28;
    v31[1] = v30;
    sub_10004B8DC(v28, v30);
    sub_10004B9B0(v40, v41);
    v42 = (void **)&v99[OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument];
    swift_beginAccess(&v99[OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument], v107, 1, 0);
    v43 = *v42;
    *v42 = 0;

    v90 = v11;
    v91 = v10;
    v44 = v103;
    v45 = (uint64_t)v23;
    v46 = v23;
    v47 = v105;
    v92 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v103 + 56);
    v92(v46, 1, 1, v105);
    v48 = NSTemporaryDirectory();
    v49 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v51 = v50;

    v52 = v100;
    URL.init(fileURLWithPath:)(v49, v51);
    v53 = swift_bridgeObjectRelease(v51);
    v54 = v101;
    v55 = UUID.init()(v53);
    v56 = UUID.uuidString.getter(v55);
    v58 = v57;
    (*(void (**)(char *, uint64_t))(v90 + 8))(v54, v91);
    v59 = v102;
    URL.appendingPathComponent(_:)(v56, v58);
    swift_bridgeObjectRelease(v58);
    v101 = *(char **)(v44 + 8);
    ((void (*)(char *, uint64_t))v101)(v52, v47);
    Data.write(to:options:)(v59, 0, v28, v30);
    v60 = v28;
    sub_10004A490(v45, &qword_1000AD070);
    v61 = *(uint64_t (**)(void))(v44 + 32);
    ((void (*)(uint64_t, char *, uint64_t))v61)(v45, v59, v47);
    v92((char *)v45, 0, 1, v47);
    v62 = (uint64_t)v93;
    sub_100053540(v45, (uint64_t)v93, &qword_1000AD070);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v62, 1, v47) == 1)
    {
      sub_10004A490(v45, &qword_1000AD070);
      sub_10004B9C4(v28, v30);
      return sub_10004A490(v62, &qword_1000AD070);
    }
    else
    {
      v63 = v61();
      v64 = v96;
      v65 = static CRKeyPath.unique.getter(v63);
      v103 = v45;
      __chkstk_darwin(v65);
      v66 = v99;
      v67 = type metadata accessor for PaperDocument(0);
      v68 = sub_10004B3DC(&qword_1000AD078, (uint64_t (*)(uint64_t))&type metadata accessor for PaperDocument, (uint64_t)&protocol conformance descriptor for PaperDocument);
      v69 = v94;
      Capsule<>.init(id:initClosure:)(v64, sub_10004EA10, &v88 - 4, v67, v68);
      v70 = type metadata accessor for TaskPriority(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v70 - 8) + 56))(v95, 1, 1, v70);
      v71 = v88;
      v72 = v98;
      v73 = v69;
      v74 = v60;
      v75 = v89;
      (*(void (**)(char *, char *, uint64_t))(v88 + 16))(v98, v73, v89);
      type metadata accessor for MainActor(0);
      sub_10004B8DC(v60, v30);
      v76 = v66;
      v77 = static MainActor.shared.getter();
      v78 = *(unsigned __int8 *)(v71 + 80);
      v79 = (v78 + 40) & ~v78;
      v80 = (v97 + v79 + 7) & 0xFFFFFFFFFFFFFFF8;
      v81 = (char *)swift_allocObject(&unk_100092FA0, v80 + 16, v78 | 7);
      *((_QWORD *)v81 + 2) = v77;
      *((_QWORD *)v81 + 3) = &protocol witness table for MainActor;
      *((_QWORD *)v81 + 4) = v76;
      (*(void (**)(char *, char *, uint64_t))(v71 + 32))(&v81[v79], v72, v75);
      v82 = (uint64_t *)&v81[v80];
      *v82 = v74;
      v82[1] = v30;
      v83 = sub_10004F4CC((uint64_t)v95, (uint64_t)&unk_1000AD088, (uint64_t)v81);
      swift_release(v83);
      sub_10004B9C4(v74, v30);
      (*(void (**)(char *, uint64_t))(v71 + 8))(v94, v75);
      sub_10004A490(v103, &qword_1000AD070);
      return ((uint64_t (*)(char *, uint64_t))v101)(v104, v105);
    }
  }
  else
  {
    v34 = (id *)&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
    *(_QWORD *)&v35 = swift_beginAccess(&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView], v108, 1, 0).n128_u64[0];
    if (*v34)
    {
      objc_msgSend(*v34, "removeFromSuperview", v35);
      v36 = *v34;
    }
    else
    {
      v36 = 0;
    }
    *v34 = 0;

    v84 = (void **)&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument];
    swift_beginAccess(&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument], v107, 1, 0);
    v85 = *v84;
    *v84 = 0;

    v86 = (uint64_t *)&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_cancellable];
    swift_beginAccess(&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_cancellable], v106, 1, 0);
    v87 = *v86;
    *v86 = 0;
    return swift_release(v87);
  }
}

void sub_10004C540()
{
  char *v0;
  char *v1;
  id *v2;
  id v3;
  void *v4;
  char *v5;
  double v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  char v19[24];

  v1 = v0;
  v2 = (id *)&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
  swift_beginAccess(&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView], v19, 0, 0);
  if (*v2)
  {
    v3 = *v2;
    v4 = (void *)dispatch thunk of PaperDocumentView.pdfView.getter();

    if (v4)
    {
      v5 = &v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_isCropping];
      *(_QWORD *)&v6 = swift_beginAccess(&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_isCropping], &v18, 0, 0).n128_u64[0];
      if (*v5 == 1)
      {
        objc_msgSend(v4, "setMinScaleFactor:", 1.0);
        objc_msgSend(v4, "setMaxScaleFactor:", 1.0);
      }
      else
      {
        v7 = objc_msgSend(v4, "currentPage", v6);
        if (v7)
        {
          v8 = v7;
          objc_msgSend(v1, "bounds");
          v10 = v9;
          v12 = fmax(v11 + -200.0, 200.0);
          objc_msgSend(v8, "boundsForBox:", 0);
          v15 = sub_10002E878(1, v13, v14, v12, v10);
          sub_10002E8AC();
          v17 = v16;
          objc_msgSend(v4, "setAutoScales:", 0);
          objc_msgSend(v4, "setMaxScaleFactor:", v17);
          objc_msgSend(v4, "setMinScaleFactor:", v15);

          v4 = v8;
        }
      }

    }
  }
}

id sub_10004C6F4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id *v3;
  _BYTE v5[24];

  v3 = (id *)(a1 + *a3);
  swift_beginAccess(v3, v5, 0, 0);
  return *v3;
}

void sub_10004C780(double a1, double a2, double a3, double a4)
{
  char *v4;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id *v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t KeyPath;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  char *v72;
  id v73;
  void (*v74)(_BYTE *, _QWORD);
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  _BYTE v91[32];
  char v92[32];
  char v93[32];

  v9 = sub_10004A32C(&qword_1000AD0A0);
  v85 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v80 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_10004A32C(&qword_1000AD0A8);
  v81 = *(_QWORD *)(v82 - 8);
  __chkstk_darwin(v82);
  v12 = (char *)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = sub_10004A32C(&qword_1000AD068);
  v13 = *(_QWORD *)(v84 - 8);
  __chkstk_darwin(v84);
  v15 = (char *)&v75 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_10004A32C(&qword_1000AD0B0);
  v17 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v16);
  v83 = (uint64_t)&v75 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v87 = (char *)&v75 - v19;
  v20 = sub_10004A32C(&qword_1000AD0B8);
  __chkstk_darwin(v20);
  v22 = (char *)&v75 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = sub_10004A32C(&qword_1000AD0C0);
  v90 = *(_QWORD *)(v88 - 8);
  __chkstk_darwin(v88);
  v86 = (char *)&v75 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_10004A32C(&qword_1000AD0C8);
  __chkstk_darwin(v24);
  v26 = (char *)&v75 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_10004A32C(&qword_1000AD0D0);
  v28 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v89 = (char *)&v75 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = v4;
  v30 = (id *)&v4[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
  swift_beginAccess(&v4[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView], v93, 0, 0);
  v31 = *v30;
  if (*v30)
  {
    v78 = v9;
    v32 = v31;
    dispatch thunk of PaperDocumentView.currentPage.getter();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27) == 1)
    {

      v33 = &qword_1000AD0C8;
      v34 = (uint64_t)v26;
LABEL_8:
      sub_10004A490(v34, v33);
      return;
    }
    v77 = v32;
    v35 = v89;
    v36 = (*(uint64_t (**)(char *, char *, uint64_t))(v28 + 32))(v89, v26, v27);
    WeakTagged_3<>.docPage.getter(v36);
    v37 = v90;
    v38 = v88;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v90 + 48))(v22, 1, v88) == 1)
    {
      (*(void (**)(char *, uint64_t))(v28 + 8))(v35, v27);

      v33 = &qword_1000AD0B8;
      v34 = (uint64_t)v22;
      goto LABEL_8;
    }
    v75 = v28;
    v76 = v27;
    v39 = v86;
    v40 = (*(uint64_t (**)(char *, char *, uint64_t))(v37 + 32))(v86, v22, v38);
    v41 = v77;
    dispatch thunk of PaperDocumentView.paperDocument.getter(v40);
    v42 = v38;
    KeyPath = swift_getKeyPath(&unk_10006E290);
    v44 = sub_10004B3DC(&qword_1000AD078, (uint64_t (*)(uint64_t))&type metadata accessor for PaperDocument, (uint64_t)&protocol conformance descriptor for PaperDocument);
    v45 = v84;
    Capsule<>.subscript.getter(KeyPath, v84, v44);
    swift_release(KeyPath);
    v46 = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v45);
    __chkstk_darwin(v46);
    *(&v75 - 2) = (uint64_t)v39;
    v47 = v87;
    sub_10004D8E4((uint64_t (*)(char *))sub_1000520DC, (uint64_t)(&v75 - 4), v87);
    (*(void (**)(char *, uint64_t))(v81 + 8))(v12, v82);
    v48 = v83;
    sub_100053540((uint64_t)v47, v83, &qword_1000AD0B0);
    v49 = v85;
    v50 = v78;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v85 + 48))(v48, 1, v78) == 1)
    {

      sub_10004A490((uint64_t)v47, &qword_1000AD0B0);
      (*(void (**)(char *, uint64_t))(v75 + 8))(v89, v76);
      (*(void (**)(char *, uint64_t))(v90 + 8))(v39, v42);
      v34 = v48;
      v33 = &qword_1000AD0B0;
      goto LABEL_8;
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 32))(v80, v48, v50);
    v51 = v76;
    if (*v30)
    {
      v52 = *v30;
      v53 = (void *)dispatch thunk of PaperDocumentView.pdfView.getter();

      if (v53)
      {
        v54 = objc_msgSend(v53, "currentPage");
        if (v54)
        {
          v55 = v54;
          v56 = v45;
          objc_msgSend(v54, "boundsForBox:", 0);
          v58 = v57;
          v60 = v59;
          v62 = v61;
          v64 = v63;

          v65 = v79;
LABEL_16:
          swift_beginAccess(&v65[OBJC_IVAR____SSSScreenshotPaperKitPDFView_vellumOpacity], v92, 0, 0);
          v71 = __chkstk_darwin(v70);
          v72 = v80;
          *(&v75 - 10) = (uint64_t)v80;
          *((double *)&v75 - 9) = a1;
          *((double *)&v75 - 8) = a2;
          *((double *)&v75 - 7) = a3;
          *((double *)&v75 - 6) = a4;
          *(&v75 - 5) = v58;
          *(&v75 - 4) = v60;
          *(&v75 - 3) = v62;
          *(&v75 - 2) = v64;
          *((double *)&v75 - 1) = v71;
          v73 = v77;
          v74 = (void (*)(_BYTE *, _QWORD))dispatch thunk of PaperDocumentView.paperDocument.modify(v91);
          Capsule.callAsFunction<A>(_:)(sub_100052108, &v75 - 12, v56, (char *)&type metadata for () + 8);
          v74(v91, 0);

          sub_10004A490((uint64_t)v87, &qword_1000AD0B0);
          (*(void (**)(char *, uint64_t))(v75 + 8))(v89, v51);
          (*(void (**)(char *, uint64_t))(v49 + 8))(v72, v78);
          (*(void (**)(char *, uint64_t))(v90 + 8))(v86, v88);
          return;
        }

      }
    }
    v56 = v45;
    v65 = v79;
    objc_msgSend(v79, "bounds");
    v58 = v66;
    v60 = v67;
    v62 = v68;
    v64 = v69;
    goto LABEL_16;
  }
}

double sub_10004CF10()
{
  char *v0;
  char *v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  id *v7;
  double v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  char v26[24];
  _BYTE v27[40];
  _QWORD v28[4];
  char v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v1 = v0;
  sub_10004D15C((uint64_t)v27);
  sub_100052150((uint64_t)v27, (uint64_t)v28);
  if ((v29 & 1) == 0)
  {
    v4 = *(double *)v28;
    v3 = *(double *)&v28[1];
    v5 = *(double *)&v28[2];
    v6 = *(double *)&v28[3];
    v7 = (id *)&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
    *(_QWORD *)&v8 = swift_beginAccess(&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView], v26, 0, 0).n128_u64[0];
    if (*v7)
    {
      v9 = *v7;
      v10 = (void *)dispatch thunk of PaperDocumentView.pdfView.getter();

      if (v10)
      {
        v11 = objc_msgSend(v10, "currentPage");
        if (v11)
        {
          v12 = v11;
          objc_msgSend(v11, "boundsForBox:", 0);
          v14 = v13;
          v16 = v15;
          v18 = v17;
          v20 = v19;

LABEL_9:
          v30.origin.x = v4;
          v30.origin.y = v3;
          v30.size.width = v5;
          v30.size.height = v6;
          CGRectGetWidth(v30);
          v31.origin.x = v14;
          v31.origin.y = v16;
          v31.size.width = v18;
          v31.size.height = v20;
          CGRectGetWidth(v31);
          v32.origin.x = v4;
          v32.origin.y = v3;
          v32.size.width = v5;
          v32.size.height = v6;
          CGRectGetHeight(v32);
          v33.origin.x = v14;
          v33.origin.y = v16;
          v33.size.width = v18;
          v33.size.height = v20;
          CGRectGetHeight(v33);
          v34.origin.x = v14;
          v34.origin.y = v16;
          v34.size.width = v18;
          v34.size.height = v20;
          v2 = (v4 - v14) / CGRectGetWidth(v34);
          v35.origin.x = v14;
          v35.origin.y = v16;
          v35.size.width = v18;
          v35.size.height = v20;
          CGRectGetHeight(v35);
          return v2;
        }

      }
    }
    objc_msgSend(v1, "bounds", v8);
    v14 = v21;
    v16 = v22;
    v18 = v23;
    v20 = v24;
    goto LABEL_9;
  }
  return 0.0;
}

void sub_10004D15C(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void **v22;
  void *v23;
  __int128 v24;
  id v25;
  uint64_t *v26;
  char v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  char *v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char v50[24];
  _OWORD v51[2];
  char v52;

  v3 = sub_10004A32C(&qword_1000AD0E0);
  __chkstk_darwin(v3);
  *(_QWORD *)&v46 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_10004A32C(&qword_1000AD0E8);
  __chkstk_darwin(v5);
  v44 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_10004A32C(&qword_1000AD068);
  v45 = *(_QWORD *)(v47 - 8);
  __chkstk_darwin(v47);
  v49 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10004A32C(&qword_1000AD0B8);
  __chkstk_darwin(v8);
  v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10004A32C(&qword_1000AD0C0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_10004A32C(&qword_1000AD0C8);
  __chkstk_darwin(v15);
  v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_10004A32C(&qword_1000AD0D0);
  v19 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = (void **)(v1 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView);
  swift_beginAccess(v22, v50, 0, 0);
  v23 = *v22;
  v24 = 0uLL;
  if (*v22)
  {
    v48 = a1;
    v25 = v23;
    dispatch thunk of PaperDocumentView.currentPage.getter();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
    {

      v26 = &qword_1000AD0C8;
    }
    else
    {
      v29 = (*(uint64_t (**)(char *, char *, uint64_t))(v19 + 32))(v21, v17, v18);
      WeakTagged_3<>.docPage.getter(v29);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
      {
        (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);

        v26 = &qword_1000AD0B8;
        v30 = (uint64_t)v10;
LABEL_10:
        sub_10004A490(v30, v26);
        v27 = 1;
        v28 = 0uLL;
        a1 = v48;
        v24 = 0uLL;
        goto LABEL_11;
      }
      v31 = (*(uint64_t (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
      v32 = v49;
      dispatch thunk of PaperDocumentView.paperDocument.getter(v31);
      v33 = type metadata accessor for PaperDocument(0);
      v34 = sub_10004B3DC(&qword_1000AD0F0, (uint64_t (*)(uint64_t))&type metadata accessor for PaperDocument, (uint64_t)&protocol conformance descriptor for PaperDocument);
      v17 = (char *)v46;
      WeakRef.subscript.getter(v32, v11, v33, v34);
      v35 = type metadata accessor for PaperDocumentPage(0);
      v36 = *(_QWORD *)(v35 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v17, 1, v35) != 1)
      {
        *(_QWORD *)&v43 = v36;
        v37 = v17;
        v38 = v44;
        PaperDocumentPage.contentsBounds.getter();
        v39 = v37;
        v40 = (uint64_t)v38;
        (*(void (**)(char *, uint64_t))(v43 + 8))(v39, v35);
        v41 = sub_10004A32C(&qword_1000AD0F8);
        v42 = *(_QWORD *)(v41 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41) != 1)
        {
          TaggedValue_2<>.bounds.getter(v51);
          v46 = v51[0];
          v43 = v51[1];
          v27 = v52;

          (*(void (**)(char *, uint64_t))(v45 + 8))(v49, v47);
          (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
          (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
          (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v41);
          v28 = v43;
          v24 = v46;
          a1 = v48;
          goto LABEL_11;
        }

        (*(void (**)(char *, uint64_t))(v45 + 8))(v49, v47);
        (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
        (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
        v26 = &qword_1000AD0E8;
        v30 = v40;
        goto LABEL_10;
      }

      (*(void (**)(char *, uint64_t))(v45 + 8))(v49, v47);
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
      v26 = &qword_1000AD0E0;
    }
    v30 = (uint64_t)v17;
    goto LABEL_10;
  }
  v27 = 1;
  v28 = 0uLL;
LABEL_11:
  *(_OWORD *)a1 = v24;
  *(_OWORD *)(a1 + 16) = v28;
  *(_BYTE *)(a1 + 32) = v27;
}

double sub_10004D630()
{
  char *v0;
  void *v1;
  id *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  char v11[24];

  v1 = v0;
  v2 = (id *)&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
  swift_beginAccess(v2, v11, 0, 0);
  if (!*v2)
    goto LABEL_6;
  v3 = *v2;
  v4 = (void *)dispatch thunk of PaperDocumentView.pdfView.getter();

  if (!v4)
    goto LABEL_6;
  v5 = objc_msgSend(v4, "currentPage");
  if (!v5)
  {

LABEL_6:
    objc_msgSend(v1, "bounds");
    return v9;
  }
  v6 = v5;
  objc_msgSend(v5, "boundsForBox:", 0);
  v8 = v7;

  return v8;
}

uint64_t sub_10004D730()
{
  return PaperDocument.pages.getter();
}

uint64_t sub_10004D750(uint64_t a1)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_10004A32C(&qword_1000AD0A8);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, double))(v6 + 16))(v5, a1, v3);
  return PaperDocument.pages.setter(v5);
}

uint64_t sub_10004D7D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void (*v11)(char *, uint64_t);
  uint64_t v13;

  v0 = type metadata accessor for CRKeyPath(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v6 = (char *)&v13 - v5;
  v7 = sub_10004A32C(&qword_1000AD0A0);
  SharedTagged_3.identity.getter(v7);
  v8 = sub_10004A32C(&qword_1000AD0C0);
  v9 = sub_10004B41C(&qword_1000AD278, &qword_1000AD0C0, (uint64_t)&protocol conformance descriptor for WeakRef<A>);
  Reference.identity.getter(v8, v9);
  v10 = static CRKeyPath.== infix(_:_:)(v6, v4);
  v11 = *(void (**)(char *, uint64_t))(v1 + 8);
  v11(v4, v0);
  v11(v6, v0);
  return v10 & 1;
}

uint64_t sub_10004D8E4@<X0>(uint64_t (*a1)(char *)@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  void (*v22)(char *, char *, uint64_t);
  char v23;
  uint64_t v24;
  char *v25;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t (*v30)(char *);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v31 = a2;
  v30 = a1;
  v28 = a3;
  v4 = sub_10004A32C(&qword_1000AD0A0);
  v33 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10004A32C(&qword_1000AD0B0);
  __chkstk_darwin(v7);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10004A32C(&qword_1000AD0A8);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_10004A32C(&qword_1000AD218);
  v29 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v32, v10);
  v17 = sub_10004B41C(&qword_1000AD268, &qword_1000AD0A8, (uint64_t)&protocol conformance descriptor for CROrderedSet<A>);
  dispatch thunk of Sequence.makeIterator()(v10, v17);
  v18 = sub_10004B41C(&qword_1000AD270, &qword_1000AD218, (uint64_t)&protocol conformance descriptor for CROrderedSet<A>.Iterator);
  v32 = v14;
  v19 = v14;
  v20 = v33;
  dispatch thunk of IteratorProtocol.next()(v19, v18);
  v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  if (v21(v9, 1, v4) == 1)
  {
LABEL_6:
    (*(void (**)(char *, uint64_t))(v29 + 8))(v16, v32);
    v24 = 1;
    v25 = v28;
  }
  else
  {
    v22 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
    while (1)
    {
      v22(v6, v9, v4);
      v23 = v30(v6);
      if (v3)
      {
        (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v4);
        return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v16, v32);
      }
      if ((v23 & 1) != 0)
        break;
      (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v4);
      dispatch thunk of IteratorProtocol.next()(v32, v18);
      if (v21(v9, 1, v4) == 1)
        goto LABEL_6;
    }
    (*(void (**)(char *, uint64_t))(v29 + 8))(v16, v32);
    v25 = v28;
    v22(v28, v6, v4);
    v24 = 0;
  }
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56))(v25, v24, 1, v4);
}

uint64_t sub_10004DBC4(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, double a10)
{
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  CGFloat Width;
  double v38;
  CGFloat v39;
  CGFloat v40;
  double Height;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(_QWORD *, _QWORD);
  void (*v52)(_QWORD *, _QWORD);
  double v53;
  double v54;
  void (*v55)(_QWORD *, _QWORD);
  uint64_t v56;
  uint64_t v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  _QWORD v62[4];
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v60 = a9;
  v25 = sub_10004A32C(&qword_1000AD0E8);
  __chkstk_darwin(v25);
  v27 = (char *)&v58 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_10004A32C(&qword_1000AD208);
  __chkstk_darwin(v28);
  v30 = (char *)&v58 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_10004A32C(&qword_1000AD210);
  v32 = *(_QWORD *)(v31 - 8);
  v33 = __chkstk_darwin(v31);
  v35 = (char *)&v58 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  SharedTagged_3<>.docPage.getter(v33);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31) == 1)
    return sub_10004A490((uint64_t)v30, &qword_1000AD208);
  v59 = a10;
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v35, v30, v31);
  v63.origin.x = a2;
  v63.origin.y = a3;
  v63.size.width = a4;
  v63.size.height = a5;
  Width = CGRectGetWidth(v63);
  v58 = a5;
  v38 = Width;
  v64.origin.x = a6;
  v64.origin.y = a7;
  v39 = a8;
  v64.size.width = a8;
  v40 = v60;
  v64.size.height = v60;
  v61 = v38 * CGRectGetWidth(v64);
  v65.origin.x = a2;
  v65.origin.y = a3;
  v65.size.width = a4;
  v65.size.height = v58;
  Height = CGRectGetHeight(v65);
  v66.origin.x = a6;
  v66.origin.y = a7;
  v66.size.width = v39;
  v66.size.height = v40;
  v42 = Height * CGRectGetHeight(v66);
  v67.origin.x = a6;
  v67.origin.y = a7;
  v67.size.width = v39;
  v67.size.height = v40;
  v43 = CGRectGetWidth(v67) * a2 + a6;
  v68.origin.x = a6;
  v68.origin.y = a7;
  v68.size.width = v39;
  v68.size.height = v40;
  v44 = CGRectGetHeight(v68) * a3 + a7;
  *(double *)v62 = v43;
  *(double *)&v62[1] = v44;
  *(double *)&v62[2] = v61;
  *(double *)&v62[3] = v42;
  type metadata accessor for CGRect(0);
  v46 = v45;
  v47 = type metadata accessor for Quad(0);
  v48 = sub_10004B3DC(&qword_1000AD240, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, (uint64_t)&protocol conformance descriptor for CGRect);
  v49 = sub_10004B3DC(&qword_1000AD248, (uint64_t (*)(uint64_t))&type metadata accessor for Quad, (uint64_t)&protocol conformance descriptor for Quad);
  TaggedValue_2.init(_:)(v62, v46, v47, v48, v49);
  v50 = sub_10004A32C(&qword_1000AD0F8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v27, 0, 1, v50);
  v51 = (void (*)(_QWORD *, _QWORD))Ref.subscript.modify(v62, a1, v31);
  PaperDocumentPage.contentsBounds.setter(v27);
  v51(v62, 0);
  v52 = (void (*)(_QWORD *, _QWORD))Ref.subscript.modify(v62, a1, v31);
  v53 = v42;
  v54 = v59;
  PaperDocumentPage.bounds.setter(v43, v44, v61, v53);
  v52(v62, 0);
  if (v54 > 0.0)
  {
    v55 = (void (*)(_QWORD *, _QWORD))Ref.subscript.modify(v62, a1, v31);
    v56 = type metadata accessor for PaperDocumentPage(0);
    v57 = sub_10004B3DC(&qword_1000AD260, (uint64_t (*)(uint64_t))&type metadata accessor for PaperDocumentPage, (uint64_t)&protocol conformance descriptor for PaperDocumentPage);
    PaperPage<>.setVellum<A>(opacity:in:)(a1, v56, v57, &protocol witness table for PaperDocumentPage, &protocol witness table for PaperDocumentPage, v54);
    v55(v62, 0);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v35, v31);
}

double sub_10004DFA8(void *a1, uint64_t a2, double (*a3)(void))
{
  id v4;
  double v5;

  v4 = a1;
  v5 = a3();

  return v5;
}

double sub_10004E044()
{
  char *v0;
  char *v1;
  char *v2;
  double v3;
  id *v4;
  unint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  double v14;
  id *v15;
  id v16;
  double v17;
  uint64_t v19;
  char v20[24];
  _BYTE v21[40];
  _BYTE v22[16];
  double v23;
  char v24;

  v1 = v0;
  v2 = &v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_isCropping];
  *(_QWORD *)&v3 = swift_beginAccess(v2, v20, 0, 0).n128_u64[0];
  if (*v2 != 1)
  {
    v12 = objc_msgSend(v1, "window", v3);
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, "bounds");
      v11 = v14;

      return v11;
    }
    v15 = (id *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
    v5 = swift_beginAccess(&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView], v22, 0, 0).n128_u64[0];
    if (*v15)
    {
      v16 = *v15;
      v7 = (void *)dispatch thunk of PaperDocumentView.pdfView.getter();

      if (v7)
      {
        v8 = objc_msgSend(v7, "currentPage");
        if (v8)
          goto LABEL_6;
        goto LABEL_13;
      }
    }
LABEL_14:
    objc_msgSend(v1, "bounds", *(double *)&v5);
    return v17;
  }
  sub_10004D15C((uint64_t)v21);
  sub_100052150((uint64_t)v21, (uint64_t)v22);
  if ((v24 & 1) == 0)
    return v23;
  v4 = (id *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
  v5 = swift_beginAccess(&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView], &v19, 0, 0).n128_u64[0];
  if (!*v4)
    goto LABEL_14;
  v6 = *v4;
  v7 = (void *)dispatch thunk of PaperDocumentView.pdfView.getter();

  if (!v7)
    goto LABEL_14;
  v8 = objc_msgSend(v7, "currentPage");
  if (!v8)
  {
LABEL_13:

    goto LABEL_14;
  }
LABEL_6:
  v9 = v8;
  objc_msgSend(v8, "boundsForBox:", 0);
  v11 = v10;

  return v11;
}

void sub_10004E2D4(char a1)
{
  char *v1;
  id *v3;
  id v4;
  unsigned int v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _BYTE v10[24];

  v3 = (id *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
  swift_beginAccess(&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView], v10, 0, 0);
  if (*v3)
  {
    v4 = *v3;
    v5 = objc_msgSend(v4, "isFirstResponder");
    if ((a1 & 1) != 0)
    {
      if ((v5 & 1) == 0 && (objc_msgSend(v4, "_isAncestorOfFirstResponder") & 1) == 0)
        objc_msgSend(v4, "becomeFirstResponder");
      v6 = objc_msgSend(v1, "traitCollection");
      v7 = objc_msgSend(v6, "userInterfaceIdiom");

      if (!v7)
      {
        v8 = objc_msgSend(*(id *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_toolPicker], "_contextualEditingView");
        if (v8)
        {
          v9 = v8;
          objc_msgSend(v8, "setOverrideUserInterfaceStyle:", 2);

        }
      }
    }
    else if (v5)
    {
      objc_msgSend(v4, "resignFirstResponder");
    }

  }
}

void sub_10004E4B8(char a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  char *v8;
  int v9;
  id *v10;
  char v11;
  id v12;
  void *v13;
  _BYTE v14[24];
  char v15[24];

  v3 = a1 & 1;
  v4 = type metadata accessor for CanvasEditingMode(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = &v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_editable];
  swift_beginAccess(&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_editable], v15, 1, 0);
  v9 = *v8;
  *v8 = a1;
  if (v9 != (_DWORD)v3)
  {
    objc_msgSend(v1, "setUserInteractionEnabled:", v3);
    v10 = (id *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
    swift_beginAccess(v10, v14, 0, 0);
    if (*v10)
    {
      v11 = *v8;
      v12 = *v10;
      v13 = v12;
      if ((v11 & 1) != 0)
      {
        static CanvasEditingMode.default.getter();
      }
      else
      {
        if (!objc_msgSend(v12, "isFirstResponder"))
        {
LABEL_8:

          return;
        }
        (*(void (**)(_BYTE *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for CanvasEditingMode.readOnly(_:), v4);
      }
      dispatch thunk of PaperDocumentView.editingMode.setter(v7);
      goto LABEL_8;
    }
  }
}

char *sub_10004E5F4(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  char *v7;
  objc_class *ObjectType;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  id v19;
  objc_super v21;
  _OWORD v22[2];
  uint64_t v23;

  v7 = v6;
  ObjectType = (objc_class *)swift_getObjectType(v6, a6);
  swift_unknownObjectWeakInit(&v6[OBJC_IVAR____SSSScreenshotPaperKitPDFView_delegate], 0);
  *(_QWORD *)&v6[OBJC_IVAR____SSSScreenshotPaperKitPDFView_leftRightMargin] = 0x4059000000000000;
  v13 = OBJC_IVAR____SSSScreenshotPaperKitPDFView_context;
  type metadata accessor for CRContext(0);
  v23 = 0;
  memset(v22, 0, sizeof(v22));
  v14 = v6;
  v15 = static CRContext.newTransientContext(uniqueAssetManager:encryptionDelegate:)(0, v22);
  sub_10004A490((uint64_t)v22, &qword_1000AD008);
  *(_QWORD *)&v7[v13] = v15;
  v14[OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshotEditsSnapshotted] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____SSSScreenshotPaperKitPDFView_cancellable] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument] = 0;
  v16 = OBJC_IVAR____SSSScreenshotPaperKitPDFView_toolPicker;
  *(_QWORD *)&v14[v16] = objc_msgSend(objc_allocWithZone((Class)PKToolPicker), "init");
  *(_OWORD *)&v14[OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData] = xmmword_10006E270;
  v14[OBJC_IVAR____SSSScreenshotPaperKitPDFView_isChangingVellumOpacity] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____SSSScreenshotPaperKitPDFView_vellumOpacity] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshot] = 0;
  v14[OBJC_IVAR____SSSScreenshotPaperKitPDFView_isCropping] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____SSSScreenshotPaperKitPDFView_rulerHostView] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____SSSScreenshotPaperKitPDFView_changeCounter] = 0;
  v14[OBJC_IVAR____SSSScreenshotPaperKitPDFView_editable] = 0;

  v21.receiver = v14;
  v21.super_class = ObjectType;
  v17 = (char *)objc_msgSendSuper2(&v21, "initWithFrame:", a1, a2, a3, a4);
  objc_msgSend(v17, "setUserInteractionEnabled:", 0);
  v18 = *(void **)&v17[OBJC_IVAR____SSSScreenshotPaperKitPDFView_toolPicker];
  objc_msgSend(v18, "setColorUserInterfaceStyle:", 1);
  objc_msgSend(v18, "_setShowsHandwritingTool:", 0);
  v19 = v18;
  objc_msgSend(v19, "addObserver:", v17);

  return v17;
}

uint64_t sub_10004E8C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004A32C(&qword_1000AD228);
  __chkstk_darwin();
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  v12 = swift_retain(a1);
  v13 = CRContext.assetManager.getter(v12);
  PaperDocument.init<A>(url:in:assetManager:)(v9, a1, v13);
  v14 = type metadata accessor for PaperDocument(0);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(a3, v11, v14);
  PaperDocument.init()();
  return sub_10004A490((uint64_t)v11, &qword_1000AD228);
}

uint64_t sub_10004EA10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_10004E8C0(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_10004EA18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7[20] = a6;
  v7[21] = a7;
  v7[18] = a4;
  v7[19] = a5;
  v8 = type metadata accessor for CanvasEditingMode(0);
  v7[22] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[23] = v9;
  v7[24] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10004A32C(&qword_1000AD068);
  v7[25] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v7[26] = v11;
  v7[27] = swift_task_alloc((*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for MainActor(0);
  v7[28] = static MainActor.shared.getter();
  v13 = dispatch thunk of Actor.unownedExecutor.getter(v12, &protocol witness table for MainActor);
  v7[29] = v13;
  v7[30] = v14;
  return swift_task_switch(sub_10004EADC, v13, v14);
}

uint64_t sub_10004EADC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD *v10;

  v1 = v0[24];
  v2 = v0[22];
  v3 = v0[23];
  v4 = v0[18];
  v5 = *(void **)(v4 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_context);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[26] + 16))(v0[27], v0[19], v0[25]);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v1, enum case for CanvasEditingMode.readOnly(_:), v2);
  v6 = *(void **)(v4 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_toolPicker);
  objc_allocWithZone((Class)type metadata accessor for PaperDocumentView(0));
  v7 = async function pointer to PaperDocumentView.init(context:document:editingMode:toolPicker:)[1];
  v8 = v5;
  v9 = v6;
  v10 = (_QWORD *)swift_task_alloc(v7);
  v0[31] = v10;
  *v10 = v0;
  v10[1] = sub_10004EBB4;
  return PaperDocumentView.init(context:document:editingMode:toolPicker:)(v8, v0[27], v0[24], v6);
}

uint64_t sub_10004EBB4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 248);
  *(_QWORD *)(*v1 + 256) = a1;
  swift_task_dealloc(v3);
  return swift_task_switch(sub_10004EC0C, *(_QWORD *)(v2 + 232), *(_QWORD *)(v2 + 240));
}

uint64_t sub_10004EC0C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t result;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  id v14;
  id v15;
  id *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  char *v23;
  id *v24;
  double v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *Strong;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;

  v1 = *(void **)(v0 + 256);
  v2 = *(void **)(v0 + 144);
  swift_release(*(_QWORD *)(v0 + 224));
  v3 = v1;
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "setFrame:");

  v4 = objc_allocWithZone((Class)UIColor);
  v5 = v3;
  v6 = objc_msgSend(v4, "initWithWhite:alpha:", 0.2, 1.0);
  objc_msgSend(v5, "setBackgroundColor:", v6);

  result = dispatch thunk of PaperDocumentView.pdfView.getter();
  if (!result)
  {
    __break(1u);
    goto LABEL_16;
  }
  v8 = (void *)result;
  v9 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
  objc_msgSend(v8, "setBackgroundColor:", v9);

  result = dispatch thunk of PaperDocumentView.pdfView.getter();
  if (!result)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  v10 = (void *)result;
  v11 = *(void **)(v0 + 256);
  v12 = *(void **)(v0 + 144);
  objc_msgSend(v12, "bounds");
  objc_msgSend(v10, "setFrame:");

  v13 = v12;
  dispatch thunk of PaperDocumentView.contentSnapshottingView.setter(v12);
  dispatch thunk of PaperDocumentView.automaticallyAdjustScaleFactor.setter(0);
  objc_msgSend(v11, "setOverrideUserInterfaceStyle:", 1);
  v14 = objc_msgSend(v13, "traitCollection");
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  dispatch thunk of PaperDocumentView.canEditVellumOpacity.setter(v15 == 0);
  v16 = (id *)&v13[OBJC_IVAR____SSSScreenshotPaperKitPDFView_rulerHostView];
  swift_beginAccess(&v13[OBJC_IVAR____SSSScreenshotPaperKitPDFView_rulerHostView], v0 + 16, 0, 0);
  v17 = *v16;
  v18 = *v16;
  dispatch thunk of PaperDocumentView.rulerHostView.setter(v17);
  dispatch thunk of PaperDocumentView.shouldDeselectElementsWhenToolPickerIsHidden.setter(0);
  v19 = objc_msgSend(v13, "traitCollection");
  v20 = objc_msgSend(v19, "userInterfaceIdiom");

  if (!v20)
  {
    v21 = (void *)dispatch thunk of PaperDocumentView.toolPicker.getter();
    if (v21)
    {
      v22 = v21;
      objc_msgSend(v21, "_setWantsClearBackgroundColorInCompactSize:", 1);

    }
  }
  v23 = *(char **)(v0 + 144);
  objc_msgSend(v23, "addSubview:", *(_QWORD *)(v0 + 256));
  v24 = (id *)&v23[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
  *(_QWORD *)&v25 = swift_beginAccess(v24, v0 + 40, 1, 0).n128_u64[0];
  if (*v24)
  {
    objc_msgSend(*v24, "removeFromSuperview", v25);
    v26 = *v24;
  }
  else
  {
    v26 = 0;
  }
  v27 = *(void **)(v0 + 256);
  *v24 = v27;
  v28 = v27;

  v29 = *v24;
  if (*v24)
  {
    v30 = *(_QWORD *)(v0 + 144) + OBJC_IVAR____SSSScreenshotPaperKitPDFView_delegate;
    swift_beginAccess(v30, v0 + 64, 0, 0);
    Strong = (void *)swift_unknownObjectWeakLoadStrong(v30);
    v32 = v29;
    if (Strong)
    {
      v33 = objc_msgSend(Strong, "_paperKitPDFViewOverlayViewController:", *(_QWORD *)(v0 + 144));
      swift_unknownObjectRelease(Strong);
    }
    else
    {
      v33 = 0;
    }
    dispatch thunk of PaperDocumentView.viewControllerForPresentingUI.setter(v33);

  }
  v34 = *(void **)(v0 + 256);
  v35 = *(_QWORD *)(v0 + 216);
  v36 = *(_QWORD *)(v0 + 192);
  v38 = *(_QWORD *)(v0 + 160);
  v37 = *(_QWORD *)(v0 + 168);
  v39 = *(_QWORD *)(v0 + 144);
  v40 = (uint64_t *)(v39 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData);
  swift_beginAccess(v39 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData, v0 + 88, 1, 0);
  v41 = *v40;
  v42 = v40[1];
  *v40 = v38;
  v40[1] = v37;
  sub_10004B9B0(v41, v42);
  sub_10004B8DC(v38, v37);
  sub_10004C540();
  *(_QWORD *)(v0 + 136) = dispatch thunk of PaperDocumentView.publisher.getter();
  v43 = swift_allocObject(&unk_1000930F8, 24, 7);
  swift_unknownObjectWeakInit(v43 + 16, v39);
  v44 = sub_10004A32C(&qword_1000AD288);
  v45 = sub_10004B41C((unint64_t *)&unk_1000AD290, &qword_1000AD288, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v46 = Publisher<>.sink(receiveValue:)(sub_1000536AC, v43, v44, v45);

  swift_release(v43);
  swift_release(*(_QWORD *)(v0 + 136));
  v47 = (uint64_t *)(v39 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_cancellable);
  swift_beginAccess(v39 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_cancellable, v0 + 112, 1, 0);
  v48 = *v47;
  *v47 = v46;
  swift_release(v48);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10004F06C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = sub_10004A32C(&qword_1000AD068);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  sub_10004B9C4(*(_QWORD *)(v0 + v6), *(_QWORD *)(v0 + v6 + 8));
  return swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_10004F10C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(sub_10004A32C(&qword_1000AD068) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v0 + 32);
  v5 = v0 + v3;
  v6 = (uint64_t *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  v7 = *v6;
  v8 = v6[1];
  v9 = (_QWORD *)swift_task_alloc(dword_1000AD084);
  *(_QWORD *)(v1 + 16) = v9;
  *v9 = v1;
  v9[1] = sub_10004F1A4;
  return sub_10004EA18((uint64_t)v9, v10, v11, v4, v5, v7, v8);
}

uint64_t sub_10004F1A4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v0;
  v1 = *(_QWORD *)(v4 + 16);
  v2 = *v0;
  v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_10004F1EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t Strong;
  char *v12;
  void **v13;
  void *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  const void *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD aBlock[5];
  uint64_t v28;
  char v29[24];
  char v30[24];
  char v31[24];

  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0, v4);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v31, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    v12 = (char *)Strong;
    v13 = (void **)(Strong + OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument);
    swift_beginAccess(Strong + OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument, v30, 1, 0);
    v14 = *v13;
    *v13 = 0;

    v15 = &v12[OBJC_IVAR____SSSScreenshotPaperKitPDFView_changeCounter];
    swift_beginAccess(&v12[OBJC_IVAR____SSSScreenshotPaperKitPDFView_changeCounter], v29, 1, 0);
    if (*(_QWORD *)v15 == -1)
    {
      __break(1u);
    }
    else
    {
      ++*(_QWORD *)v15;
      if ((v12[OBJC_IVAR____SSSScreenshotPaperKitPDFView_isChangingVellumOpacity] & 1) != 0)
      {

      }
      else
      {
        sub_1000536B4(0, (unint64_t *)&qword_1000AD600, OS_dispatch_queue_ptr);
        v25 = static OS_dispatch_queue.main.getter();
        v16 = swift_allocObject(&unk_100093120, 24, 7);
        *(_QWORD *)(v16 + 16) = v12;
        aBlock[4] = sub_100053710;
        v28 = v16;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_10004F4A0;
        aBlock[3] = &unk_100093138;
        v17 = _Block_copy(aBlock);
        v24 = v3;
        v18 = v17;
        v19 = v12;
        static DispatchQoS.unspecified.getter();
        v26 = &_swiftEmptyArrayStorage;
        v20 = sub_10004B3DC((unint64_t *)&unk_1000AD2A0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
        v21 = sub_10004A32C(&qword_1000AD610);
        v22 = sub_10004B41C((unint64_t *)&unk_1000AD2B0, &qword_1000AD610, (uint64_t)&protocol conformance descriptor for [A]);
        dispatch thunk of SetAlgebra.init<A>(_:)(&v26, v21, v22, v2, v20);
        v23 = (void *)v25;
        OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v6, v18);
        _Block_release(v18);

        (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v2);
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
        swift_release(v28);
      }
    }
  }
}

uint64_t sub_10004F4A0(uint64_t a1)
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

uint64_t sub_10004F4CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10004A490(a1, &qword_1000AD060);
    v9 = 7168;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
    {
LABEL_3:
      v11 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v10, v8);
      swift_unknownObjectRetain(v10);
      v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
      v15 = v14;
      swift_unknownObjectRelease(v10);
      goto LABEL_6;
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v9 = v16 | 0x1C00;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v17 = swift_allocObject(&unk_1000930D0, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v9, v18, (char *)&type metadata for () + 8, &unk_1000AD280, v17);
}

id sub_10004F6F0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  char v21;
  char v22;
  id *v23;
  id v24;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  uint64_t v27;
  id *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  id v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  __n128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  dispatch_semaphore_t v51;
  NSObject *v52;
  uint64_t v53;
  void **v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  char *v60;
  dispatch_semaphore_t v61;
  uint64_t v62;
  void **v63;
  uint64_t v64;
  char *v65;
  char *v66;
  char v67[24];
  char v68[24];
  char v69[24];
  char v70[24];
  char v71[32];

  v3 = v2;
  v6 = sub_10004A32C(&qword_1000AD060);
  __chkstk_darwin(v6);
  v66 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10004A32C(&qword_1000AD068);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  __chkstk_darwin(v8);
  v65 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v59 - v12;
  __chkstk_darwin(v14);
  v16 = (char *)&v59 - v15;
  v17 = (uint64_t *)(v3 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData);
  swift_beginAccess(v3 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData, v71, 0, 0);
  v19 = *v17;
  v18 = v17[1];
  sub_10004B8DC(a1, a2);
  if (v18 >> 60 == 15)
  {
    sub_10004B9B0(a1, a2);
    sub_10004B9B0(v19, v18);
    return 0;
  }
  else
  {
    v64 = v8;
    sub_10004B8C8(v19, v18);
    sub_100051DC4(a1, a2);
    v22 = v21;
    sub_10004B9B0(v19, v18);
    sub_10004B9C4(a1, a2);
    if ((v22 & 1) != 0
      && (v23 = (id *)(v3 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView),
          swift_beginAccess(v3 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView, v70, 0, 0),
          *v23))
    {
      v24 = *v23;
      dispatch thunk of PaperDocumentView.paperDocument.getter(v24);

      v25 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
      v26 = v16;
      v27 = v64;
      v25(v16, v13, v64);
      v28 = (id *)(v3 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument);
      swift_beginAccess(v3 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument, v69, 1, 0);
      v20 = *v28;
      if (*v28)
      {
        v29 = v27;
        v30 = *(void (**)(char *, uint64_t))(v9 + 8);
        v31 = v20;
        v30(v16, v29);
      }
      else
      {
        v33 = sub_10004A32C(&qword_1000AD118);
        v34 = swift_allocObject(v33, 24, 7);
        v62 = v34;
        *(_QWORD *)(v34 + 16) = 0;
        v63 = (void **)(v34 + 16);
        v61 = dispatch_semaphore_create(0);
        v35 = v27;
        v36 = (uint64_t *)(v3 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_vellumOpacity);
        v37 = swift_beginAccess(v3 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_vellumOpacity, v68, 0, 0);
        v38 = *v36;
        v39 = (uint64_t)v66;
        static TaskPriority.userInitiated.getter(v37);
        v40 = type metadata accessor for TaskPriority(0);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v39, 0, 1, v40);
        v41 = v65;
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v65, v26, v35);
        v42 = *(unsigned __int8 *)(v9 + 80);
        v43 = (v42 + 32) & ~v42;
        v44 = (v10 + v43 + 7) & 0xFFFFFFFFFFFFFFF8;
        v45 = (v44 + 15) & 0xFFFFFFFFFFFFFFF8;
        v60 = v26;
        v46 = (v45 + 15) & 0xFFFFFFFFFFFFFFF8;
        v47 = swift_allocObject(&unk_100092FC8, v46 + 8, v42 | 7);
        *(_QWORD *)(v47 + 16) = 0;
        *(_QWORD *)(v47 + 24) = 0;
        v48 = v41;
        v49 = v64;
        v25((char *)(v47 + v43), v48, v64);
        *(_QWORD *)(v47 + v44) = v38;
        v50 = v62;
        *(_QWORD *)(v47 + v45) = v62;
        v51 = v61;
        *(_QWORD *)(v47 + v46) = v61;
        swift_retain(v50);
        v52 = v51;
        v53 = sub_10004FC24(v39, (uint64_t)&unk_1000AD128, v47);
        swift_release(v53);
        sub_10004A490(v39, &qword_1000AD060);
        OS_dispatch_semaphore.wait()();

        (*(void (**)(char *, uint64_t))(v9 + 8))(v60, v49);
        v54 = v63;
        swift_beginAccess(v63, v67, 0, 0);
        v55 = *v54;
        v56 = v55;
        swift_release(v50);
        v57 = *v28;
        *v28 = v55;

        v20 = *v28;
        v58 = *v28;
      }
    }
    else
    {
      return 0;
    }
  }
  return v20;
}

uint64_t sub_10004FB00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t (__cdecl *v9)();

  v6[5] = a5;
  v6[6] = a6;
  v9 = (uint64_t (__cdecl *)())((char *)&dword_1000AD138 + dword_1000AD138);
  v7 = (_QWORD *)swift_task_alloc(unk_1000AD13C);
  v6[7] = v7;
  *v7 = v6;
  v7[1] = sub_10004FB60;
  return v9();
}

uint64_t sub_10004FB60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  *(_QWORD *)(*(_QWORD *)v1 + 64) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_10004FBBC, 0, 0);
}

uint64_t sub_10004FBBC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 40);
  swift_beginAccess(v2 + 16, v0 + 16, 1, 0);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = v1;
  v4 = v1;

  OS_dispatch_semaphore.signal()();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10004FC24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD v23[4];

  v6 = sub_10004A32C(&qword_1000AD060);
  __chkstk_darwin(v6);
  v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100053540(a1, (uint64_t)v8, &qword_1000AD060);
  v9 = type metadata accessor for TaskPriority(0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_10004A490((uint64_t)v8, &qword_1000AD060);
    v12 = 4096;
    v13 = *(_QWORD *)(a3 + 16);
    if (v13)
    {
LABEL_3:
      v14 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v13, v11);
      swift_unknownObjectRetain(v13);
      v16 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v14);
      v18 = v17;
      swift_unknownObjectRelease(v13);
      goto LABEL_6;
    }
  }
  else
  {
    v19 = TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    v12 = v19 | 0x1000;
    v13 = *(_QWORD *)(a3 + 16);
    if (v13)
      goto LABEL_3;
  }
  v16 = 0;
  v18 = 0;
LABEL_6:
  v20 = swift_allocObject(&unk_1000930A8, 32, 7);
  *(_QWORD *)(v20 + 16) = a2;
  *(_QWORD *)(v20 + 24) = a3;
  if (v18 | v16)
  {
    v23[0] = 0;
    v23[1] = 0;
    v21 = v23;
    v23[2] = v16;
    v23[3] = v18;
  }
  else
  {
    v21 = 0;
  }
  return swift_task_create(v12, v21, (char *)&type metadata for () + 8, &unk_1000AD258, v20);
}

id sub_10004FE2C(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)swift_getObjectType(v2, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t sub_10004FF0C(uint64_t a1, void *a2, _BYTE *a3)
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
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t KeyPath;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t i;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
  id v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void (*v71)(char *, uint64_t);
  CGFloat MinX;
  CGFloat v73;
  double v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  double MidY;
  CGFloat v80;
  CGFloat v81;
  double v82;
  double v83;
  double v84;
  double MaxY;
  CGFloat v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  void (*v94)(CGAffineTransform *, _QWORD);
  double v95;
  void (*v96)(CGAffineTransform *, _QWORD);
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  char *v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  char *v114;
  char *v115;
  uint64_t v116;
  uint64_t (*v117)(char *, uint64_t, uint64_t);
  int v118;
  char *v119;
  void (*v120)(char *, char *, uint64_t);
  void (*v121)(CGAffineTransform *, _QWORD);
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  char *v136;
  char *v137;
  char *v138;
  char *v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  _BYTE *v147;
  CGFloat MinY;
  CGFloat v149;
  CGFloat v150;
  CGFloat v151;
  id v152;
  uint64_t v153;
  uint64_t v154;
  id v155;
  uint64_t v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  void (*v161)(char *, uint64_t);
  char *v162;
  uint64_t v163;
  char *v164;
  uint64_t (*v165)(char *, char *, uint64_t);
  unsigned int (*v166)(char *, uint64_t, uint64_t);
  char *v167;
  uint64_t v168;
  uint64_t v169;
  char *v170;
  uint64_t v171;
  uint64_t v172;
  char *v173;
  CGAffineTransform v174;
  CGAffineTransform v175;
  CGAffineTransform v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;

  v147 = a3;
  v155 = a2;
  v4 = sub_10004A32C(&qword_1000ACF68);
  v172 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v128 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10004A32C((uint64_t *)&unk_1000AD1F0);
  __chkstk_darwin(v7);
  v173 = (char *)&v128 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v146 = sub_10004A32C(&qword_1000ACF60);
  v145 = *(_QWORD *)(v146 - 8);
  __chkstk_darwin(v146);
  v144 = (char *)&v128 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v171 = sub_10004A32C(&qword_1000AD200);
  v143 = *(_QWORD *)(v171 - 8);
  __chkstk_darwin(v171);
  v136 = (char *)&v128 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v142 = sub_10004A32C(&qword_1000AD230);
  v141 = *(_QWORD *)(v142 - 8);
  __chkstk_darwin(v142);
  v134 = (char *)&v128 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_10004A32C(&qword_1000AD238);
  v13 = __chkstk_darwin(v12);
  v140 = (char *)&v128 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v133 = type metadata accessor for PKDrawingStruct(0, v13);
  v132 = *(_QWORD *)(v133 - 8);
  __chkstk_darwin(v133);
  v131 = (char *)&v128 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v130 = (char *)&v128 - v17;
  v18 = sub_10004A32C(&qword_1000AD0E8);
  __chkstk_darwin(v18);
  v139 = (char *)&v128 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v163 = type metadata accessor for PaperDocumentPage(0);
  v158 = *(_QWORD *)(v163 - 8);
  __chkstk_darwin(v163);
  v138 = (char *)&v128 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v137 = (char *)&v128 - v22;
  __chkstk_darwin(v23);
  v157 = (char *)&v128 - v24;
  v25 = sub_10004A32C(&qword_1000AD208);
  __chkstk_darwin(v25);
  v160 = (char *)&v128 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v154 = sub_10004A32C(&qword_1000AD210);
  v153 = *(_QWORD *)(v154 - 8);
  __chkstk_darwin(v154);
  v164 = (char *)&v128 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_10004A32C(&qword_1000AD0A0);
  v168 = *(_QWORD *)(v28 - 8);
  __chkstk_darwin(v28);
  v162 = (char *)&v128 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_10004A32C(&qword_1000AD0B0);
  __chkstk_darwin(v30);
  v32 = (char *)&v128 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_10004A32C(&qword_1000AD0A8);
  v34 = *(_QWORD *)(v33 - 8);
  __chkstk_darwin(v33);
  v36 = (char *)&v128 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v169 = sub_10004A32C(&qword_1000AD218);
  v135 = *(_QWORD *)(v169 - 8);
  __chkstk_darwin(v169);
  v38 = (char *)&v128 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_10006E290);
  v129 = sub_10004B3DC(&qword_1000AD078, (uint64_t (*)(uint64_t))&type metadata accessor for PaperDocument, (uint64_t)&protocol conformance descriptor for PaperDocument);
  v159 = a1;
  Capsule.Ref<>.subscript.getter(KeyPath, v129);
  v40 = KeyPath;
  v41 = v28;
  swift_release(v40);
  CROrderedSet.makeIterator()(v33);
  v42 = *(void (**)(char *, uint64_t))(v34 + 8);
  v43 = (uint64_t)v160;
  v44 = v154;
  v45 = v33;
  v46 = v153;
  v42(v36, v45);
  v167 = v38;
  CROrderedSet.Iterator.next()(v169);
  v47 = v162;
  v166 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v168 + 48);
  if (v166(v32, 1, v41) != 1)
  {
    v165 = *(uint64_t (**)(char *, char *, uint64_t))(v168 + 32);
    v170 = v6;
    v156 = v41;
    for (i = v165(v47, v32, v41); ; i = v165(v47, v32, v41))
    {
      SharedTagged_3<>.docPage.getter(i);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v43, 1, v44) == 1)
      {
        (*(void (**)(char *, uint64_t))(v168 + 8))(v47, v41);
        sub_10004A490(v43, &qword_1000AD208);
        goto LABEL_5;
      }
      v50 = v164;
      (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v164, v43, v44);
      v51 = v157;
      v52 = v159;
      v53 = Ref.subscript.getter(v159, v44);
      v54 = PaperDocumentPage.pageIndex.getter(v53);
      v56 = v55;
      v161 = *(void (**)(char *, uint64_t))(v158 + 8);
      v161(v51, v163);
      if ((v56 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t))(v46 + 8))(v50, v44);
        v71 = *(void (**)(char *, uint64_t))(v168 + 8);
        v47 = v162;
      }
      else
      {
        v57 = objc_msgSend(v155, "pageAtIndex:", v54);
        v47 = v162;
        if (v57)
        {
          v58 = v57;
          objc_msgSend(v57, "boundsForBox:", 1);
          v60 = v59;
          v62 = v61;
          v64 = v63;
          v66 = v65;
          objc_msgSend(v58, "boundsForBox:", 0);
          x = v177.origin.x;
          y = v177.origin.y;
          width = v177.size.width;
          height = v177.size.height;
          v188.origin.x = v60;
          v188.origin.y = v62;
          v188.size.width = v64;
          v188.size.height = v66;
          if (!CGRectEqualToRect(v177, v188))
          {
            v152 = v58;
            objc_msgSend(v58, "setBounds:forBox:", 0, v60, v62, v64, v66);
            v178.origin.x = x;
            v178.origin.y = y;
            v178.size.width = width;
            v178.size.height = height;
            MinX = CGRectGetMinX(v178);
            v73 = v60;
            v74 = MinX;
            v179.origin.x = v73;
            v179.origin.y = v62;
            v75 = v73;
            v179.size.width = v64;
            v76 = v179.origin.y;
            v179.size.height = v66;
            v77 = v179.size.width;
            v149 = y;
            v78 = v179.size.height;
            v151 = v179.size.height;
            v150 = v74 - CGRectGetMinX(v179);
            v180.origin.x = v75;
            v180.origin.y = v76;
            v180.size.width = v77;
            v180.size.height = v78;
            MinY = CGRectGetMinY(v180);
            v181.origin.x = v75;
            v181.origin.y = v76;
            v181.size.width = v77;
            v181.size.height = v78;
            MidY = CGRectGetMidY(v181);
            v182.origin.x = x;
            v80 = v149;
            v182.origin.y = v149;
            v182.size.width = width;
            v182.size.height = height;
            v81 = CGRectGetMidY(v182);
            CGAffineTransformMakeTranslation(&v174, v150, MinY + MidY - v81 + MidY - v81);
            v175 = v174;
            v183.origin.x = x;
            v183.origin.y = v80;
            v183.size.width = width;
            v183.size.height = height;
            v82 = CGRectGetMinX(v183);
            v184.origin.x = v75;
            v184.origin.y = v76;
            v184.size.width = v77;
            MinY = x;
            v83 = v77;
            v84 = v151;
            v184.size.height = v151;
            v150 = v82 - CGRectGetMinX(v184);
            v185.origin.x = v75;
            v185.origin.y = v76;
            v185.size.width = v83;
            v185.size.height = v84;
            MaxY = CGRectGetMaxY(v185);
            v186.origin.x = MinY;
            v186.origin.y = v80;
            v186.size.width = width;
            v186.size.height = height;
            v86 = CGRectGetMaxY(v186);
            CGAffineTransformMakeTranslation(&v174, v150, MaxY - v86);
            v176 = v174;
            v174.a = v75;
            v174.b = v76;
            v174.c = v83;
            v174.d = v84;
            type metadata accessor for CGRect(0);
            v88 = v87;
            v89 = type metadata accessor for Quad(0);
            v90 = sub_10004B3DC(&qword_1000AD240, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, (uint64_t)&protocol conformance descriptor for CGRect);
            v91 = sub_10004B3DC(&qword_1000AD248, (uint64_t (*)(uint64_t))&type metadata accessor for Quad, (uint64_t)&protocol conformance descriptor for Quad);
            v92 = v139;
            TaggedValue_2.init(_:)(&v174, v88, v89, v90, v91);
            v93 = sub_10004A32C(&qword_1000AD0F8);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v93 - 8) + 56))(v92, 0, 1, v93);
            v94 = (void (*)(CGAffineTransform *, _QWORD))Ref.subscript.modify(&v174, v52, v44);
            PaperDocumentPage.contentsBounds.setter(v92);
            v94(&v174, 0);
            v187.origin.x = v75;
            v187.origin.y = v76;
            v187.size.width = v83;
            v187.size.height = v84;
            v95 = CGRectGetMinX(v187);
            v96 = (void (*)(CGAffineTransform *, _QWORD))Ref.subscript.modify(&v174, v52, v44);
            PaperDocumentPage.bounds.setter(v95, 0.0, v83, v84);
            v96(&v174, 0);
            v97 = v137;
            v98 = Ref.subscript.getter(v52, v44);
            v99 = (uint64_t)v140;
            PaperDocumentPage.drawing.getter(v98);
            v161(v97, v163);
            v100 = v141;
            v101 = v142;
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v141 + 48))(v99, 1, v142))
            {
              sub_10004A490(v99, &qword_1000AD238);
            }
            else
            {
              v102 = v134;
              (*(void (**)(char *, uint64_t, uint64_t))(v100 + 16))(v134, v99, v101);
              sub_10004A490(v99, &qword_1000AD238);
              v103 = v131;
              Ref.subscript.getter(v52, v101);
              (*(void (**)(char *, uint64_t))(v100 + 8))(v102, v101);
              v104 = v132;
              v105 = v130;
              v106 = v133;
              (*(void (**)(char *, char *, uint64_t))(v132 + 32))(v130, v103, v133);
              PKDrawingStruct.apply<A>(_:concat:in:)(&v176, 1, v52, v129);
              (*(void (**)(char *, uint64_t))(v104 + 8))(v105, v106);
            }
            v107 = v172;
            v108 = v171;
            v109 = v136;
            v110 = v138;
            v111 = Ref.subscript.getter(v52, v154);
            v112 = v144;
            PaperDocumentPage.subelements.getter(v111);
            v161(v110, v163);
            v113 = v146;
            CROrderedSet.makeIterator()(v146);
            (*(void (**)(char *, uint64_t))(v145 + 8))(v112, v113);
            v114 = v173;
            CROrderedSet.Iterator.next()(v108);
            v115 = v114;
            v116 = v52;
            v117 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v107 + 48);
            v118 = v117(v115, 1, v4);
            v119 = v170;
            if (v118 != 1)
            {
              v120 = *(void (**)(char *, char *, uint64_t))(v107 + 32);
              do
              {
                v120(v119, v115, v4);
                v121 = (void (*)(CGAffineTransform *, _QWORD))SharedTagged_9.subscript.modify(&v174, v116, v4);
                v124 = *(_QWORD *)(v122 + 24);
                v123 = *(_QWORD *)(v122 + 32);
                sub_100053518(v122, v124);
                v125 = v124;
                v126 = v172;
                v127 = v123;
                v119 = v170;
                dispatch thunk of CanvasElement.apply(_:)(&v175, v125, v127);
                v121(&v174, 0);
                v108 = v171;
                (*(void (**)(char *, uint64_t))(v126 + 8))(v119, v4);
                CROrderedSet.Iterator.next()(v108);
                v115 = v173;
              }
              while (v117(v173, 1, v4) != 1);
            }

            (*(void (**)(char *, uint64_t))(v143 + 8))(v109, v108);
            v46 = v153;
            v44 = v154;
            (*(void (**)(char *, uint64_t))(v153 + 8))(v164, v154);
            v47 = v162;
            v41 = v156;
            (*(void (**)(char *, uint64_t))(v168 + 8))(v162, v156);
            *v147 = 1;
            goto LABEL_15;
          }

        }
        (*(void (**)(char *, uint64_t))(v46 + 8))(v164, v44);
        v71 = *(void (**)(char *, uint64_t))(v168 + 8);
      }
      v41 = v156;
      v71(v47, v156);
LABEL_15:
      v43 = (uint64_t)v160;
LABEL_5:
      CROrderedSet.Iterator.next()(v169);
      if (v166(v32, 1, v41) == 1)
        return (*(uint64_t (**)(char *, uint64_t))(v135 + 8))(v167, v169);
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v135 + 8))(v167, v169);
}

uint64_t sub_100050DA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10004A32C(&qword_1000AD228);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v7 + 16))(v9, a2, v6, v11);
  v14 = swift_retain(a1);
  v15 = CRContext.assetManager.getter(v14);
  PaperDocument.init<A>(url:in:assetManager:)(v9, a1, v15);
  v16 = type metadata accessor for PaperDocument(0);
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v13, 1, v16) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(a3, v13, v16);
  PaperDocument.init()();
  return sub_10004A490((uint64_t)v13, &qword_1000AD228);
}

uint64_t sub_100050EE8(uint64_t a1)
{
  uint64_t v2;
  double v3;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t KeyPath;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, _QWORD);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  void (*v61)(char *, uint64_t);
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  void (*v66)(uint64_t *, _QWORD);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[2];
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
  char *v82;
  uint64_t (*v83)(char *, char *, uint64_t);
  char *v84;
  unsigned int (*v85)(char *, uint64_t, uint64_t);
  uint64_t v86;
  char *v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  char *v93;
  char *v94;
  char *v95;
  uint64_t v96;
  char *v97;
  void (*v98)(char *, char *, uint64_t);
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;
  char v106[8];
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;

  v2 = sub_10004A32C((uint64_t *)&unk_1000AD1E0);
  v3 = __chkstk_darwin(v2);
  v93 = (char *)v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v103 = type metadata accessor for CanvasElementFlags(0, v3);
  v5 = *(_QWORD *)(v103 - 8);
  __chkstk_darwin(v103);
  v95 = (char *)v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v94 = (char *)v71 - v8;
  __chkstk_darwin(v9);
  v97 = (char *)v71 - v10;
  __chkstk_darwin(v11);
  v104 = (char *)v71 - v12;
  v13 = sub_10004A32C(&qword_1000ACF68);
  v100 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v105 = (char *)v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_10004A32C((uint64_t *)&unk_1000AD1F0);
  __chkstk_darwin(v15);
  v17 = (char *)v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = sub_10004A32C(&qword_1000ACF60);
  v77 = *(_QWORD *)(v78 - 8);
  __chkstk_darwin(v78);
  v76 = (char *)v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = type metadata accessor for PaperDocumentPage(0);
  v74 = *(_QWORD *)(v75 - 8);
  __chkstk_darwin(v75);
  v73 = (char *)v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = sub_10004A32C(&qword_1000AD200);
  v72 = *(_QWORD *)(v102 - 8);
  __chkstk_darwin(v102);
  v101 = (char *)v71 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_10004A32C(&qword_1000AD208);
  __chkstk_darwin(v21);
  v81 = (char *)v71 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = sub_10004A32C(&qword_1000AD210);
  v90 = *(_QWORD *)(v80 - 8);
  __chkstk_darwin(v80);
  v84 = (char *)v71 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_10004A32C(&qword_1000AD0A0);
  v86 = *(_QWORD *)(v79 - 8);
  __chkstk_darwin(v79);
  v89 = (char *)v71 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_10004A32C(&qword_1000AD0B0);
  __chkstk_darwin(v25);
  v27 = (char *)v71 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_10004A32C(&qword_1000AD0A8);
  v99 = *(_QWORD *)(v28 - 8);
  __chkstk_darwin(v28);
  v30 = (char *)v71 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = sub_10004A32C(&qword_1000AD218);
  v71[0] = *(_QWORD *)(v88 - 8);
  __chkstk_darwin(v88);
  v87 = (char *)v71 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_10006E290);
  v33 = sub_10004B3DC(&qword_1000AD078, (uint64_t (*)(uint64_t))&type metadata accessor for PaperDocument, (uint64_t)&protocol conformance descriptor for PaperDocument);
  v110 = a1;
  Capsule.Ref<>.subscript.getter(KeyPath, v33);
  v34 = KeyPath;
  v35 = v79;
  swift_release(v34);
  CROrderedSet.makeIterator()(v28);
  v36 = (uint64_t)v81;
  v37 = v30;
  v38 = v105;
  v39 = v28;
  v40 = v80;
  (*(void (**)(char *, uint64_t))(v99 + 8))(v37, v39);
  CROrderedSet.Iterator.next()(v88);
  v85 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v86 + 48);
  if (v85(v27, 1, v35) != 1)
  {
    v83 = *(uint64_t (**)(char *, char *, uint64_t))(v86 + 32);
    v92 = v13;
    v82 = v27;
    v91 = v17;
    do
    {
      v42 = v89;
      v43 = v83(v89, v27, v35);
      SharedTagged_3<>.docPage.getter(v43);
      v44 = v90;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v90 + 48))(v36, 1, v40) == 1)
      {
        (*(void (**)(char *, uint64_t))(v86 + 8))(v42, v35);
        sub_10004A490(v36, &qword_1000AD208);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v44 + 32))(v84, v36, v40);
        v45 = v73;
        v46 = Ref.subscript.getter(v110, v40);
        v47 = v76;
        PaperDocumentPage.subelements.getter(v46);
        (*(void (**)(char *, uint64_t))(v74 + 8))(v45, v75);
        v48 = v78;
        CROrderedSet.makeIterator()(v78);
        (*(void (**)(char *, uint64_t))(v77 + 8))(v47, v48);
        CROrderedSet.Iterator.next()(v102);
        v99 = *(_QWORD *)(v100 + 48);
        if (((unsigned int (*)(char *, uint64_t, uint64_t))v99)(v17, 1, v13) != 1)
        {
          v98 = *(void (**)(char *, char *, uint64_t))(v100 + 32);
          v98(v38, v17, v13);
          while (1)
          {
            SharedTagged_9.subscript.getter(&v107, v110, v13);
            v53 = v108;
            v54 = v109;
            sub_1000534D4(&v107, v108);
            v52 = v13;
            v55 = v104;
            dispatch thunk of CanvasElement.flags.getter(v53, v54);
            v56 = sub_1000534F8(&v107);
            v57 = v97;
            static CanvasElementFlags.useOriginalPDFAppearance.getter(v56);
            v58 = sub_10004B3DC(&qword_1000AD220, (uint64_t (*)(uint64_t))&type metadata accessor for CanvasElementFlags, (uint64_t)&protocol conformance descriptor for CanvasElementFlags);
            v59 = v103;
            v60 = dispatch thunk of SetAlgebra.isSuperset(of:)(v57, v103, v58);
            v61 = *(void (**)(char *, uint64_t))(v5 + 8);
            v62 = v57;
            v38 = v105;
            v61(v62, v59);
            v63 = ((uint64_t (*)(char *, uint64_t))v61)(v55, v59);
            if ((v60 & 1) != 0)
            {
              v64 = v94;
              static CanvasElementFlags.useOriginalPDFAppearance.getter(v63);
              v65 = v95;
              v66 = (void (*)(uint64_t *, _QWORD))SharedTagged_9.subscript.modify(&v107, v110, v52);
              v68 = *(_QWORD *)(v67 + 24);
              v69 = *(_QWORD *)(v67 + 32);
              sub_100053518(v67, v68);
              v96 = dispatch thunk of CanvasElement.flags.modify(v106, v68, v69);
              v70 = v103;
              (*(void (**)(char *))(v5 + 16))(v104);
              dispatch thunk of SetAlgebra.intersection(_:)(v64, v70, v58);
              if ((dispatch thunk of SetAlgebra.isEmpty.getter(v70, v58) & 1) != 0)
              {
                v61(v65, v70);
                v50 = 1;
                v49 = (uint64_t)v93;
              }
              else
              {
                dispatch thunk of SetAlgebra.subtract(_:)(v64, v70, v58);
                v49 = (uint64_t)v93;
                (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v93, v65, v70);
                v50 = 0;
              }
              v38 = v105;
              v51 = (void (*)(char *, _QWORD))v96;
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v49, v50, 1, v70);
              v61(v64, v70);
              sub_10004A490(v49, (uint64_t *)&unk_1000AD1E0);
              v51(v106, 0);
              v66(&v107, 0);
              v52 = v92;
              v17 = v91;
            }
            (*(void (**)(char *, uint64_t))(v100 + 8))(v38, v52);
            CROrderedSet.Iterator.next()(v102);
            v13 = v52;
            if (((unsigned int (*)(char *, uint64_t, uint64_t))v99)(v17, 1, v52) == 1)
              break;
            v98(v38, v17, v52);
          }
        }
        (*(void (**)(char *, uint64_t))(v72 + 8))(v101, v102);
        v40 = v80;
        (*(void (**)(char *, uint64_t))(v90 + 8))(v84, v80);
        v35 = v79;
        (*(void (**)(char *, uint64_t))(v86 + 8))(v89, v79);
        v36 = (uint64_t)v81;
      }
      v27 = v82;
      CROrderedSet.Iterator.next()(v88);
    }
    while (v85(v27, 1, v35) != 1);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v71[0] + 8))(v87, v88);
}

void sub_100051924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_100051984(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x100051B68);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

uint64_t sub_100051B8C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100051BF0;
  return v6(a1);
}

uint64_t sub_100051BF0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100051C3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  sub_100051924((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_100051D10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = __DataStorage._bytes.getter(a1);
  v11 = result;
  if (result)
  {
    result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = __DataStorage._length.getter();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_100051924(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_100051DC4(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_100051E10()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_100051E44 + dword_10005201C[v0 >> 62]))();
}

uint64_t sub_100051E54@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (v1 == BYTE6(v2))
  {
    if (v1 >= 1)
      __asm { BR              X10 }
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

void sub_10005203C(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;
  void **v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  _BYTE v12[24];

  v3 = (void **)(v1 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_rulerHostView);
  swift_beginAccess(v1 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_rulerHostView, v12, 1, 0);
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  v6 = (void **)(v1 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView);
  swift_beginAccess(v6, &v11, 0, 0);
  v7 = *v6;
  if (v7)
  {
    v8 = *v3;
    v9 = v8;
    v10 = v7;
    dispatch thunk of PaperDocumentView.rulerHostView.setter(v8);

  }
}

uint64_t sub_1000520DC()
{
  return sub_10004D7D0() & 1;
}

uint64_t sub_100052108(uint64_t a1)
{
  CGFloat *v1;

  return sub_10004DBC4(a1, v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[10], v1[11]);
}

uint64_t sub_100052150(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10004A32C(&qword_1000AD0D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100052198()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _OWORD v5[2];
  uint64_t v6;

  v1 = v0;
  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_delegate], 0);
  *(_QWORD *)&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_leftRightMargin] = 0x4059000000000000;
  v2 = OBJC_IVAR____SSSScreenshotPaperKitPDFView_context;
  type metadata accessor for CRContext(0);
  v6 = 0;
  memset(v5, 0, sizeof(v5));
  v3 = static CRContext.newTransientContext(uniqueAssetManager:encryptionDelegate:)(0, v5);
  sub_10004A490((uint64_t)v5, &qword_1000AD008);
  *(_QWORD *)&v1[v2] = v3;
  v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshotEditsSnapshotted] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_cancellable] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument] = 0;
  v4 = OBJC_IVAR____SSSScreenshotPaperKitPDFView_toolPicker;
  *(_QWORD *)&v1[v4] = objc_msgSend(objc_allocWithZone((Class)PKToolPicker), "init");
  *(_OWORD *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData] = xmmword_10006E270;
  v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_isChangingVellumOpacity] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_vellumOpacity] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshot] = 0;
  v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_isCropping] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_rulerHostView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_changeCounter] = 0;
  v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_editable] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "ScreenshotServicesService/_SSSScreenshotPaperKitPDFView.swift", 61, 2, 249, 0);
  __break(1u);
}

uint64_t sub_100052314()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v1 = sub_10004A32C(&qword_1000AD068);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v3 | 7;
  v6 = (((*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(_QWORD *)(v0 + v6));

  return swift_deallocObject(v0, v7 + 8, v5);
}

uint64_t sub_1000523C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t (*v9)(void);

  v2 = *(_QWORD *)(sub_10004A32C(&qword_1000AD068) - 8);
  v3 = (((*(_QWORD *)(v2 + 64)
        + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))
        + 7) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  v4 = *(_QWORD *)(v0 + v3);
  v5 = *(_QWORD *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFF8));
  v6 = (_QWORD *)swift_task_alloc(dword_1000AD124);
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_1000537F0;
  v6[5] = v4;
  v6[6] = v5;
  v9 = (uint64_t (*)(void))((char *)&dword_1000AD138 + dword_1000AD138);
  v7 = (_QWORD *)swift_task_alloc(unk_1000AD13C);
  v6[7] = v7;
  *v7 = v6;
  v7[1] = sub_10004FB60;
  return v9();
}

uint64_t sub_100052494()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1[8] = v0;
  v2 = type metadata accessor for CRKeyPath(0);
  v1[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for UUID(0);
  v1[10] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v1[11] = v4;
  v1[12] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL(0);
  v1[13] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v1[14] = v6;
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[15] = swift_task_alloc(v7);
  v1[16] = swift_task_alloc(v7);
  v8 = type metadata accessor for PaperDocument.PDFDocumentUse(0);
  v1[17] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v1[18] = v9;
  v1[19] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10004A32C(&qword_1000AD068);
  v1[20] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v1[21] = v11;
  v12 = (*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[22] = swift_task_alloc(v12);
  v1[23] = swift_task_alloc(v12);
  v13 = sub_10004A32C(&qword_1000AD1D0);
  v1[24] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v13 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for PaperDocument(0);
  v1[25] = v14;
  v15 = *(_QWORD *)(v14 - 8);
  v1[26] = v15;
  v1[27] = swift_task_alloc((*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100052628, 0, 0);
}

uint64_t sub_100052628()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v7;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 160);
  type metadata accessor for CRContext(0);
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  v3 = static CRContext.newTransientContext(uniqueAssetManager:encryptionDelegate:)(0, v0 + 16);
  *(_QWORD *)(v0 + 224) = v3;
  sub_10004A490(v0 + 16, &qword_1000AD008);
  v4 = sub_10004B3DC(&qword_1000AD078, (uint64_t (*)(uint64_t))&type metadata accessor for PaperDocument, (uint64_t)&protocol conformance descriptor for PaperDocument);
  *(_QWORD *)(v0 + 232) = v4;
  Capsule<>.root.getter(v2, v4);
  v5 = type metadata accessor for PaperRenderableOptions(0);
  *(_QWORD *)(v0 + 240) = v5;
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
  *(_QWORD *)(v0 + 248) = v6;
  v6(v1, 1, 1, v5);
  v7 = (_QWORD *)swift_task_alloc(async function pointer to PaperDocument.export<A>(_:in:options:)[1]);
  *(_QWORD *)(v0 + 256) = v7;
  v8 = sub_10004B3DC(&qword_1000AD0F0, (uint64_t (*)(uint64_t))&type metadata accessor for PaperDocument, (uint64_t)&protocol conformance descriptor for PaperDocument);
  *(_QWORD *)(v0 + 264) = v8;
  *v7 = v0;
  v7[1] = sub_1000527A0;
  return PaperDocument.export<A>(_:in:options:)(v3, *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 200), v8);
}

uint64_t sub_1000527A0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 256);
  v5 = *(_QWORD *)(*v1 + 208);
  v4 = *(_QWORD *)(*v1 + 216);
  v7 = *(_QWORD *)(*v1 + 192);
  v6 = *(_QWORD *)(*v1 + 200);
  *(_QWORD *)(*v1 + 272) = a1;
  swift_task_dealloc(v3);
  sub_10004A490(v7, &qword_1000AD1D0);
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  *(_QWORD *)(v2 + 280) = v8;
  v8(v4, v6);
  return swift_task_switch(sub_100052864, 0, 0);
}

uint64_t sub_100052864()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void (*v10)(_QWORD *);
  uint64_t v11;
  id v12;
  _QWORD *v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 168);
  v5 = *(_QWORD *)(v0 + 64);
  *(_BYTE *)(v0 + 356) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = swift_task_alloc(32);
  *(_QWORD *)(v6 + 16) = v1;
  *(_QWORD *)(v6 + 24) = v0 + 356;
  Capsule.callAsFunction<A>(_:)(sub_1000534A4, v6, v4, (char *)&type metadata for () + 8);
  *(_QWORD *)(v0 + 288) = 0;
  swift_task_dealloc(v6);
  if (*(_BYTE *)(v0 + 356) == 1)
  {
    v7 = *(void **)(v0 + 224);
    v8 = *(_QWORD **)(v0 + 152);
    v9 = *(_QWORD *)(v0 + 144);
    Capsule<>.root.getter(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 232));
    *v8 = v7;
    *(_DWORD *)(v0 + 352) = enum case for PaperDocument.PDFDocumentUse.roundtrip(_:);
    v10 = *(void (**)(_QWORD *))(v9 + 104);
    *(_QWORD *)(v0 + 296) = v10;
    v10(v8);
    v11 = async function pointer to PaperDocument.update<A>(pdfDocument:in:use:)[1];
    v12 = v7;
    v13 = (_QWORD *)swift_task_alloc(v11);
    *(_QWORD *)(v0 + 304) = v13;
    *v13 = v0;
    v13[1] = sub_100052A88;
    return PaperDocument.update<A>(pdfDocument:in:use:)(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 264));
  }
  else
  {
    v15 = *(void **)(v0 + 224);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 168) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 160));

    v16 = *(_QWORD *)(v0 + 272);
    v18 = *(_QWORD *)(v0 + 184);
    v17 = *(_QWORD *)(v0 + 192);
    v19 = *(_QWORD *)(v0 + 176);
    v20 = *(_QWORD *)(v0 + 152);
    v22 = *(_QWORD *)(v0 + 120);
    v21 = *(_QWORD *)(v0 + 128);
    v23 = *(_QWORD *)(v0 + 96);
    v24 = *(_QWORD *)(v0 + 72);
    swift_task_dealloc(*(_QWORD *)(v0 + 216));
    swift_task_dealloc(v17);
    swift_task_dealloc(v18);
    swift_task_dealloc(v19);
    swift_task_dealloc(v20);
    swift_task_dealloc(v21);
    swift_task_dealloc(v22);
    swift_task_dealloc(v23);
    swift_task_dealloc(v24);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v16);
  }
}

uint64_t sub_100052A88()
{
  uint64_t *v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  v1 = *v0;
  v2 = *(void (**)(uint64_t, uint64_t))(*v0 + 280);
  v3 = *(_QWORD *)(*v0 + 216);
  v4 = *(_QWORD *)(*v0 + 200);
  v6 = *(_QWORD *)(*v0 + 144);
  v5 = *(_QWORD *)(*v0 + 152);
  v7 = *(_QWORD *)(*v0 + 136);
  swift_task_dealloc(*(_QWORD *)(*v0 + 304));
  v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  *(_QWORD *)(v1 + 312) = v8;
  v8(v5, v7);
  v2(v3, v4);
  return swift_task_switch(sub_100052B50, 0, 0);
}

uint64_t sub_100052B50()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  NSURL *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t, uint64_t);

  v32 = v0[30];
  v33 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[31];
  v26 = (id)v0[34];
  v27 = v0[28];
  v28 = v0[25];
  v29 = v0[29];
  v31 = v0[24];
  v30 = v0[20];
  v2 = v0[15];
  v1 = v0[16];
  v3 = v0[12];
  v23 = v0[14];
  v24 = v0[13];
  v5 = v0[10];
  v4 = v0[11];
  v25 = v0[9];
  v6 = NSTemporaryDirectory();
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;

  URL.init(fileURLWithPath:)(v7, v9);
  v10 = swift_bridgeObjectRelease(v9);
  v11 = UUID.init()(v10);
  v12 = UUID.uuidString.getter(v11);
  v14 = v13;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  URL.appendingPathComponent(_:)(v12, v14);
  swift_bridgeObjectRelease(v14);
  v15 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  v0[40] = v15;
  v15(v2, v24);
  URL._bridgeToObjectiveC()(v16);
  v18 = v17;
  objc_msgSend(v26, "writeToURL:", v17);

  static CRKeyPath.unique.getter(v19);
  v20 = swift_task_alloc(32);
  *(_QWORD *)(v20 + 16) = v1;
  *(_QWORD *)(v20 + 24) = v27;
  Capsule<>.init(id:initClosure:)(v25, sub_1000534CC, v20, v28, v29);
  swift_task_dealloc(v20);
  Capsule.callAsFunction<A>(_:)(sub_100050EE8, 0, v30, (char *)&type metadata for () + 8);
  Capsule<>.root.getter(v30, v29);
  v33(v31, 1, 1, v32);
  v21 = (_QWORD *)swift_task_alloc(async function pointer to PaperDocument.export<A>(_:in:options:)[1]);
  v0[41] = v21;
  *v21 = v0;
  v21[1] = sub_100052DA0;
  return PaperDocument.export<A>(_:in:options:)(v0[28], v0[22], v0[24], v0[25], v0[33]);
}

uint64_t sub_100052DA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 328);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v1 + 280);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 216);
  v6 = *(_QWORD *)(*(_QWORD *)v1 + 192);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 200);
  *(_QWORD *)(*(_QWORD *)v1 + 336) = a1;
  swift_task_dealloc(v2);
  sub_10004A490(v6, &qword_1000AD1D0);
  v3(v4, v5);
  return swift_task_switch(sub_100052E60, 0, 0);
}

uint64_t sub_100052E60()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  uint64_t v20;
  void (*v21)(_QWORD *, uint64_t, uint64_t);
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _QWORD *v28;
  unint64_t v30;
  uint64_t v31;

  v1 = (unint64_t)objc_msgSend(*(id *)(v0 + 336), "pageCount");
  if ((v1 & 0x8000000000000000) != 0)
LABEL_24:
    __break(1u);
  v2 = v1;
  if (v1)
  {
    v3 = 0;
    v30 = v1;
    do
    {
      v4 = objc_msgSend(*(id *)(v31 + 336), "pageAtIndex:", v3);
      if (!v4)
        goto LABEL_5;
      v5 = v4;
      v6 = objc_msgSend(v4, "annotations");
      v7 = sub_1000536B4(0, &qword_1000AD1D8, PDFAnnotation_ptr);
      v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);

      if ((unint64_t)v8 >> 62)
      {
        if (v8 < 0)
          v20 = v8;
        else
          v20 = v8 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v8);
        v9 = _CocoaArrayWrapper.endIndex.getter(v20);
        swift_bridgeObjectRelease(v8);
        if (v9)
        {
LABEL_9:
          if (v9 < 1)
          {
            __break(1u);
            goto LABEL_24;
          }
          for (i = 0; i != v9; ++i)
          {
            if ((v8 & 0xC000000000000001) != 0)
              v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v8);
            else
              v11 = *(id *)(v8 + 8 * i + 32);
            v12 = v11;
            v13 = objc_msgSend(v11, "akAnnotation");
            if (v13)
            {
              v14 = v13;
              objc_msgSend(v13, "drawingBounds");
              v19 = objc_msgSend((id)objc_opt_self(NSValue), "valueWithRect:", v15, v16, v17, v18);
              objc_msgSend(v12, "setValue:forAnnotationKey:", v19, PDFAnnotationKeyRect);

            }
          }
        }
      }
      else
      {
        v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v9)
          goto LABEL_9;
      }
      swift_bridgeObjectRelease(v8);

      v2 = v30;
LABEL_5:
      ++v3;
    }
    while (v3 != v2);
  }
  v21 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v31 + 296);
  v22 = *(unsigned int *)(v31 + 352);
  v23 = *(void **)(v31 + 224);
  v24 = *(_QWORD **)(v31 + 152);
  v25 = *(_QWORD *)(v31 + 136);
  Capsule<>.root.getter(*(_QWORD *)(v31 + 160), *(_QWORD *)(v31 + 232));
  *v24 = v23;
  v21(v24, v22, v25);
  v26 = async function pointer to PaperDocument.update<A>(pdfDocument:in:use:)[1];
  v27 = v23;
  v28 = (_QWORD *)swift_task_alloc(v26);
  *(_QWORD *)(v31 + 344) = v28;
  *v28 = v31;
  v28[1] = sub_10005314C;
  return PaperDocument.update<A>(pdfDocument:in:use:)(*(_QWORD *)(v31 + 336), *(_QWORD *)(v31 + 176), *(_QWORD *)(v31 + 152), *(_QWORD *)(v31 + 200), *(_QWORD *)(v31 + 264));
}

uint64_t sub_10005314C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v0 + 312);
  v2 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v0 + 280);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 216);
  v4 = *(_QWORD *)(*(_QWORD *)v0 + 200);
  v5 = *(_QWORD *)(*(_QWORD *)v0 + 152);
  v6 = *(_QWORD *)(*(_QWORD *)v0 + 136);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 344));
  v1(v5, v6);
  v2(v3, v4);
  return swift_task_switch(sub_100053214, 0, 0);
}

uint64_t sub_100053214()
{
  uint64_t v0;
  id v1;
  NSURL *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  URL._bridgeToObjectiveC()(v2);
  v4 = v3;
  *(_QWORD *)(v0 + 56) = 0;
  v5 = objc_msgSend(v1, "removeItemAtURL:error:", v3, v0 + 56);

  v6 = *(void **)(v0 + 56);
  if (v5)
  {
    v7 = *(void **)(v0 + 224);
    v8 = v6;

    v9 = 272;
  }
  else
  {
    v10 = *(void **)(v0 + 272);
    v11 = v6;
    v12 = _convertNSErrorToError(_:)(v6);

    swift_willThrow();
    swift_errorRelease(v12);
    v9 = 224;
  }
  v13 = *(void (**)(uint64_t, uint64_t))(v0 + 320);
  v14 = *(_QWORD *)(v0 + 176);
  v15 = *(_QWORD *)(v0 + 184);
  v16 = *(_QWORD *)(v0 + 160);
  v17 = *(_QWORD *)(v0 + 168);
  v18 = *(_QWORD *)(v0 + 128);
  v19 = *(_QWORD *)(v0 + 104);

  v20 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  v20(v14, v16);
  v20(v15, v16);
  v13(v18, v19);
  v21 = *(_QWORD *)(v0 + 336);
  v23 = *(_QWORD *)(v0 + 184);
  v22 = *(_QWORD *)(v0 + 192);
  v24 = *(_QWORD *)(v0 + 176);
  v25 = *(_QWORD *)(v0 + 152);
  v27 = *(_QWORD *)(v0 + 120);
  v26 = *(_QWORD *)(v0 + 128);
  v28 = *(_QWORD *)(v0 + 96);
  v29 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc(*(_QWORD *)(v0 + 216));
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v21);
}

uint64_t sub_1000533E0(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_100053408(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = type metadata accessor for Optional(319, *(_QWORD *)(a1 + 80));
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    result = swift_initClassMetadata2(a1, 0, 1, &v4, a1 + 88);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for ObjectWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000537C4(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ObjectWrapper);
}

uint64_t type metadata accessor for _SSSScreenshotPaperKitPDFView()
{
  return objc_opt_self(_SSSScreenshotPaperKitPDFView);
}

uint64_t sub_1000534A4(uint64_t a1)
{
  uint64_t v1;

  return sub_10004FF0C(a1, *(void **)(v1 + 16), *(_BYTE **)(v1 + 24));
}

uint64_t sub_1000534CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100050DA4(a1, *(_QWORD *)(v2 + 16), a2);
}

_QWORD *sub_1000534D4(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000534F8(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100053518(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_100053540(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10004A32C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100053584()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000535A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000AD254);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1000537F0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000AD250 + dword_1000AD250))(a1, v4);
}

uint64_t sub_100053618(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000AD254);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10004F1A4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000AD250 + dword_1000AD250))(a1, v4);
}

uint64_t sub_100053688()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000536AC()
{
  uint64_t v0;

  sub_10004F1EC(v0);
}

uint64_t sub_1000536B4(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_1000536EC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100053710()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _BYTE v7[24];

  v1 = *(_QWORD *)(v0 + 16);
  v2 = v1 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_delegate;
  swift_beginAccess(v1 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_delegate, v7, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(v2);
  if (result)
  {
    v4 = (void *)result;
    v5 = (_QWORD *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_changeCounter);
    swift_beginAccess(v1 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_changeCounter, &v6, 0, 0);
    objc_msgSend(v4, "_paperKitPDFDidChangeInView:changeCounter:", v1, *v5);
    return swift_unknownObjectRelease(v4);
  }
  return result;
}

uint64_t sub_1000537AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000537BC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000537C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

void sub_100053928(double a1)
{
  uint64_t v1;
  uint64_t v2;
  double *v4;
  double v5;
  uint64_t v6;
  id *v7;
  id v8;
  void *v9;
  double v10;
  void (*v11)(_BYTE *, _QWORD);
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[32];
  _BYTE v15[24];
  _BYTE v16[24];

  v2 = v1;
  v4 = (double *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_vellumOpacity);
  swift_beginAccess(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_vellumOpacity, v16, 1, 0);
  v5 = *v4;
  *v4 = a1;
  if (v5 != a1)
  {
    v6 = OBJC_IVAR____SSSScreenshotPaperKitImageView_isChangingVellumOpacity;
    *(_BYTE *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_isChangingVellumOpacity) = 1;
    v7 = (id *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
    swift_beginAccess(v2 + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController, v15, 0, 0);
    if (*v7)
    {
      v8 = *v7;
      v9 = (void *)dispatch thunk of CanvasElementViewController.canvasView.getter();

      if (v9)
      {
        v10 = *v4;
        v11 = (void (*)(_BYTE *, _QWORD))dispatch thunk of Canvas.updatablePaper2.modify(v14);
        v12 = sub_10004A32C(&qword_1000AD3C8);
        v13 = sub_10004B3DC(&qword_1000AD3D0, (uint64_t (*)(uint64_t))&type metadata accessor for Image, (uint64_t)&protocol conformance descriptor for Image);
        sub_10004A4CC(v12, v13, (uint64_t)&protocol witness table for Image, v10);
        v11(v14, 0);

      }
    }
    *(_BYTE *)(v2 + v6) = 0;
  }
}

void sub_100053C0C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
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
  void **v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void **v26;
  void *v27;
  char *v28;
  void *Strong;
  id v30;
  void *v31;
  char *v32;
  __n128 v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void **v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  char *v53;
  uint64_t v54;
  char *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  void *v64;
  id v65;
  char *v66;
  id v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  uint64_t v79;
  __n128 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  char *v89;
  id v90;
  id v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  char *v99;
  uint64_t v100;
  id v101;
  char *v102;
  uint64_t v103;
  uint64_t v104[3];
  char v105[24];
  char v106[24];
  char v107[24];
  char v108[24];
  char v109[32];

  v1 = v0;
  v2 = sub_10004A32C(&qword_1000AD060);
  __chkstk_darwin(v2);
  v4 = (char *)&v93 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CRKeyPath(0);
  __chkstk_darwin(v5);
  v93 = (char *)&v93 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = sub_10004A32C(&qword_1000AD3C8);
  v96 = *(_QWORD *)(v97 - 8);
  __chkstk_darwin(v97);
  v95 = (char *)&v93 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = v7;
  v9 = __chkstk_darwin(v8);
  v99 = (char *)&v93 - v10;
  v103 = type metadata accessor for Image(0, v9);
  v11 = *(_QWORD *)(v103 - 8);
  __chkstk_darwin(v103);
  v13 = (char *)&v93 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v102 = (char *)&v93 - v15;
  v16 = type metadata accessor for CanvasEditingMode(0);
  v17 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v19 = (char *)&v93 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = (void **)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController];
  *(_QWORD *)&v21 = swift_beginAccess(&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController], v109, 1, 0).n128_u64[0];
  v22 = *v20;
  v98 = v4;
  if (v22)
  {
    v23 = objc_msgSend(v22, "view", v21);
    if (!v23)
    {
      __break(1u);
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    v24 = v23;
    objc_msgSend(v23, "removeFromSuperview");

    v25 = *v20;
  }
  else
  {
    v25 = 0;
  }
  *v20 = 0;

  v26 = (void **)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_image];
  swift_beginAccess(&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_image], v108, 0, 0);
  v27 = *v26;
  if (!*v26)
    return;
  v28 = &v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate];
  swift_beginAccess(&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate], v107, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v28);
  v30 = v27;
  if (Strong)
  {
    objc_msgSend(Strong, "_paperKitImageView:willBeginUpdatingImage:", v1, v30);
    swift_unknownObjectRelease(Strong);
  }
  v101 = v30;
  v31 = *(void **)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_context];
  v32 = &v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_editable];
  v33 = swift_beginAccess(&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_editable], v106, 0, 0);
  if (*v32 == 1)
  {
    static CanvasEditingMode.default.getter(v31);
  }
  else
  {
    (*(void (**)(char *, _QWORD, uint64_t, __n128))(v17 + 104))(v19, enum case for CanvasEditingMode.readOnly(_:), v16, v33);
    v34 = v31;
  }
  sub_10004A32C(&qword_1000AD5E0);
  v35 = (void *)CanvasElementViewController.__allocating_init(context:editingMode:allowMediaCanvasElements:transparentBackground:)(v31, v19, 1, 0);
  dispatch thunk of CanvasElementViewController.isSixChannelBlendingEnabled.setter(1);
  v36 = v35;
  v37 = (void *)AnyCanvasElementViewController.toolPicker.getter();

  objc_msgSend(v37, "addObserver:", v1);
  v38 = objc_msgSend(v1, "traitCollection");
  v39 = objc_msgSend(v38, "userInterfaceIdiom");

  dispatch thunk of CanvasElementViewController.canEditVellumOpacity.setter(v39 == 0);
  v40 = (void **)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_rulerHostView];
  swift_beginAccess(&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_rulerHostView], v105, 0, 0);
  v41 = *v40;
  v42 = v41;
  dispatch thunk of CanvasElementViewController.rulerHostView.setter(v41);
  dispatch thunk of CanvasElementViewController.isImageAnalysisEnabled.setter(0);
  v43 = objc_msgSend(v36, "view");
  if (!v43)
    goto LABEL_19;
  v44 = v43;
  v100 = v11;
  v45 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
  objc_msgSend(v44, "setBackgroundColor:", v45);

  v104[0] = dispatch thunk of CanvasElementViewController.publisher.getter();
  v46 = swift_allocObject(&unk_100093178, 24, 7);
  swift_unknownObjectWeakInit(v46 + 16, v1);
  v47 = sub_10004A32C(&qword_1000AD5E8);
  v48 = sub_10004B41C(&qword_1000AD5F0, &qword_1000AD5E8, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v49 = Publisher<>.sink(receiveValue:)(sub_1000571F0, v46, v47, v48);
  swift_release(v46);
  v50 = objc_msgSend(v36, "view", swift_release(v104[0]).n128_f64[0]);
  if (!v50)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v51 = v50;
  objc_msgSend(v1, "addSubview:", v50);

  v52 = objc_msgSend(v36, "view");
  v53 = v99;
  v54 = v103;
  v55 = v102;
  if (!v52)
  {
LABEL_21:
    __break(1u);
    return;
  }
  v56 = v52;
  objc_msgSend(v52, "setAutoresizingMask:", 10);

  Image.init()();
  objc_msgSend(v101, "size");
  v58 = v57;
  v60 = v59;
  Image.frame.setter(0.0, 0.0, v57, v59);
  Image.bounds.setter(0.0, 0.0, v58, v60);
  v61 = (*(uint64_t (**)(char *, char *, uint64_t))(v100 + 16))(v13, v55, v54);
  v62 = v93;
  static CRKeyPath.unique.getter(v61);
  v63 = sub_10004B3DC(&qword_1000AD3D0, (uint64_t (*)(uint64_t))&type metadata accessor for Image, (uint64_t)&protocol conformance descriptor for Image);
  Capsule<>.init(_:id:)(v13, v62, v54, v63);
  v64 = *v20;
  *v20 = v36;
  v65 = v36;
  v66 = v53;
  v67 = v65;

  v68 = (uint64_t *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageCancellable];
  swift_beginAccess(&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageCancellable], v104, 1, 0);
  v69 = *v68;
  v70 = v49;
  *v68 = v49;
  swift_retain(v49);
  swift_release(v69);
  v71 = v67;
  v72 = (void *)AnyCanvasElementViewController.toolPicker.getter();

  objc_msgSend(v72, "setColorUserInterfaceStyle:", 1);
  v73 = objc_msgSend(v1, "traitCollection");
  v74 = objc_msgSend(v73, "userInterfaceIdiom");

  if (!v74)
  {
    v75 = v71;
    v76 = (void *)AnyCanvasElementViewController.toolPicker.getter();

    objc_msgSend(v76, "_setWantsClearBackgroundColorInCompactSize:", 1);
  }
  v77 = v71;
  v78 = (void *)AnyCanvasElementViewController.toolPicker.getter();

  objc_msgSend(v78, "_setShowsHandwritingTool:", 0);
  v79 = (uint64_t)v98;
  static TaskPriority.userInitiated.getter(v80);
  v81 = type metadata accessor for TaskPriority(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v81 - 8) + 56))(v79, 0, 1, v81);
  v82 = swift_allocObject(&unk_100093178, 24, 7);
  swift_unknownObjectWeakInit(v82 + 16, v1);
  v83 = v96;
  v84 = v95;
  v85 = v97;
  (*(void (**)(char *, char *, uint64_t))(v96 + 16))(v95, v66, v97);
  v86 = *(unsigned __int8 *)(v83 + 80);
  v87 = v66;
  v88 = (v86 + 48) & ~v86;
  v89 = (char *)swift_allocObject(&unk_100093310, v88 + v94, v86 | 7);
  *((_QWORD *)v89 + 2) = 0;
  *((_QWORD *)v89 + 3) = 0;
  *((_QWORD *)v89 + 4) = v82;
  v90 = v101;
  *((_QWORD *)v89 + 5) = v101;
  (*(void (**)(char *, char *, uint64_t))(v83 + 32))(&v89[v88], v84, v85);
  v91 = v90;
  v92 = sub_10004FC24(v79, (uint64_t)&unk_1000AD5F8, (uint64_t)v89);
  swift_release(v92);
  sub_10004A490(v79, &qword_1000AD060);

  swift_release(v70);
  (*(void (**)(char *, uint64_t))(v83 + 8))(v87, v85);
  (*(void (**)(char *, uint64_t))(v100 + 8))(v102, v103);
}

void sub_100054770()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  unsigned __int8 *v5;
  void **v6;
  void *v7;
  id v8;
  _BYTE v9[24];
  _BYTE v10[24];

  v1 = type metadata accessor for CanvasEditingMode(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin();
  v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = (unsigned __int8 *)&v0[OBJC_IVAR____SSSScreenshotPaperKitImageView_editable];
  swift_beginAccess(&v0[OBJC_IVAR____SSSScreenshotPaperKitImageView_editable], v10, 0, 0);
  objc_msgSend(v0, "setUserInteractionEnabled:", *v5);
  v6 = (void **)&v0[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController];
  swift_beginAccess(v6, v9, 0, 0);
  v7 = *v6;
  if (v7)
  {
    if (*v5 == 1)
    {
      static CanvasEditingMode.default.getter(v7);
    }
    else
    {
      (*(void (**)(_BYTE *, _QWORD, uint64_t))(v2 + 104))(v4, enum case for CanvasEditingMode.readOnly(_:), v1);
      v8 = v7;
    }
    dispatch thunk of CanvasElementViewController.editingMode.setter(v4);

  }
}

id sub_10005487C(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  char *v7;
  objc_class *ObjectType;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  id v18;
  objc_super v20;
  _OWORD v21[2];
  uint64_t v22;

  v7 = v6;
  ObjectType = (objc_class *)swift_getObjectType(v6, a6);
  swift_unknownObjectWeakInit(&v6[OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate], 0);
  v13 = OBJC_IVAR____SSSScreenshotPaperKitImageView_context;
  type metadata accessor for CRContext(0);
  v22 = 0;
  memset(v21, 0, sizeof(v21));
  v14 = v6;
  v15 = static CRContext.newTransientContext(uniqueAssetManager:encryptionDelegate:)(0, v21);
  sub_10004A490((uint64_t)v21, &qword_1000AD008);
  *(_QWORD *)&v7[v13] = v15;
  *(_QWORD *)&v14[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageCancellable] = 0;
  v14[OBJC_IVAR____SSSScreenshotPaperKitImageView_isChangingVellumOpacity] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____SSSScreenshotPaperKitImageView_vellumOpacity] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____SSSScreenshotPaperKitImageView_changeCounter] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____SSSScreenshotPaperKitImageView_image] = 0;
  v16 = &v14[OBJC_IVAR____SSSScreenshotPaperKitImageView_cropInfo];
  *(_OWORD *)v16 = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  *((_OWORD *)v16 + 2) = 0u;
  v17 = &v14[OBJC_IVAR____SSSScreenshotPaperKitImageView_sizeMultiplier];
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = 0;
  v14[OBJC_IVAR____SSSScreenshotPaperKitImageView_useTrilinearMinificationFilter] = 0;
  v14[OBJC_IVAR____SSSScreenshotPaperKitImageView_editable] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____SSSScreenshotPaperKitImageView_rulerHostView] = 0;
  v14[OBJC_IVAR____SSSScreenshotPaperKitImageView_annotationsEnabled] = 1;

  v20.receiver = v14;
  v20.super_class = ObjectType;
  v18 = objc_msgSendSuper2(&v20, "initWithFrame:", a1, a2, a3, a4);
  objc_msgSend(v18, "setUserInteractionEnabled:", 0);
  return v18;
}

void sub_100054A64(char a1)
{
  char *v1;
  void *v2;
  id *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  char v15[24];

  v2 = v1;
  v4 = (id *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController];
  swift_beginAccess(&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController], v15, 0, 0);
  if (*v4)
  {
    v5 = *v4;
    v6 = (void *)dispatch thunk of CanvasElementViewController.canvasView.getter();
    if ((a1 & 1) != 0
      && (v7 = objc_msgSend(v5, "presentedViewController"), v7, !v7))
    {
      if (v6)
      {
        v9 = v6;
        if ((objc_msgSend(v9, "isFirstResponder") & 1) == 0
          && (objc_msgSend(v9, "_isAncestorOfFirstResponder") & 1) == 0)
        {
          objc_msgSend(v5, "becomeFirstResponder");
        }

      }
      else if ((objc_msgSend(v5, "isFirstResponder") & 1) == 0)
      {
        objc_msgSend(v5, "becomeFirstResponder");
      }
      v10 = objc_msgSend(v2, "traitCollection");
      v11 = objc_msgSend(v10, "userInterfaceIdiom");

      if (!v11)
      {
        if (*v4)
        {
          v12 = *v4;
          v13 = (void *)AnyCanvasElementViewController.toolPicker.getter();

          v14 = objc_msgSend(v13, "_contextualEditingView");
          if (v14)
          {
            objc_msgSend(v14, "setOverrideUserInterfaceStyle:", 2);

          }
        }
      }
    }
    else
    {
      if (v6)
      {
        v8 = v6;
        if (objc_msgSend(v8, "isFirstResponder"))
          objc_msgSend(v8, "resignFirstResponder");

      }
      if (objc_msgSend(v5, "isFirstResponder"))
        objc_msgSend(v5, "resignFirstResponder");
    }

  }
}

void sub_100054D6C(unsigned __int8 a1)
{
  uint64_t v1;
  unsigned __int8 *v3;
  id *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _BYTE v8[24];

  v3 = (unsigned __int8 *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_annotationsEnabled);
  swift_beginAccess(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_annotationsEnabled, v8, 1, 0);
  *v3 = a1;
  v4 = (id *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
  swift_beginAccess(v4, &v7, 0, 0);
  if (*v4)
  {
    v5 = objc_msgSend(*v4, "view");
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "setUserInteractionEnabled:", *v3);

    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100054E18(void *a1)
{
  char *v1;
  void *v2;
  id *v4;
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  char v40;

  v2 = v1;
  v4 = (id *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController];
  swift_beginAccess(&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController], &v38, 0, 0);
  if (*v4)
  {
    v5 = *v4;
    v6 = dispatch thunk of CanvasElementViewController.canvasView.getter();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(a1, "zoomScale");
      v9 = v8;
      v10 = objc_msgSend(v2, "window");
      if (v10)
      {
        v11 = v10;
        v12 = objc_msgSend(v10, "screen");

        objc_msgSend(v12, "scale");
        v14 = v13;

      }
      else
      {
        v14 = 1.0;
      }
      v15 = v7;
      ((void (*)(_QWORD, _QWORD))dispatch thunk of AnyCanvas.screenScaleOverride.setter)(v9 * v14, 0);

      objc_msgSend(a1, "bounds");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      objc_msgSend(a1, "adjustedContentInset");
      v26 = sub_100056E90(v17, v19, v21, v23, v24, v25);
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v33 = v15;
      objc_msgSend(v33, "convertRect:fromCoordinateSpace:", a1, v26, v28, v30, v32);
      v39[0] = v34;
      v39[1] = v35;
      v39[2] = v36;
      v39[3] = v37;
      v40 = 0;
      dispatch thunk of Canvas.visibleBoundsOverride.setter(v39);

      v5 = v33;
    }

  }
}

void sub_100055038(void *a1)
{
  uint64_t v1;
  id *v3;
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  char v31;

  v3 = (id *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
  swift_beginAccess(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController, &v29, 0, 0);
  if (*v3)
  {
    v4 = *v3;
    v5 = dispatch thunk of CanvasElementViewController.canvasView.getter();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(a1, "bounds");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      objc_msgSend(a1, "adjustedContentInset");
      v17 = sub_100056E90(v8, v10, v12, v14, v15, v16);
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v24 = v6;
      objc_msgSend(v24, "convertRect:fromCoordinateSpace:", a1, v17, v19, v21, v23);
      v30[0] = v25;
      v30[1] = v26;
      v30[2] = v27;
      v30[3] = v28;
      v31 = 0;
      dispatch thunk of Canvas.visibleBoundsOverride.setter(v30);

      v4 = v24;
    }

  }
}

void sub_1000552E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t Strong;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  id v18;
  __n128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[5];
  uint64_t v27;
  char v28[24];
  char v29[24];

  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0, v4);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v29, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    v12 = (void *)Strong;
    v13 = (_QWORD *)(Strong + OBJC_IVAR____SSSScreenshotPaperKitImageView_changeCounter);
    swift_beginAccess(Strong + OBJC_IVAR____SSSScreenshotPaperKitImageView_changeCounter, v28, 1, 0);
    if (*v13 == -1)
    {
      __break(1u);
    }
    else
    {
      ++*v13;
      if ((*((_BYTE *)v12 + OBJC_IVAR____SSSScreenshotPaperKitImageView_isChangingVellumOpacity) & 1) != 0)
      {

      }
      else
      {
        sub_100057300();
        v25 = static OS_dispatch_queue.main.getter();
        v14 = swift_allocObject(&unk_100093338, 24, 7);
        *(_QWORD *)(v14 + 16) = v12;
        aBlock[4] = sub_100057360;
        v27 = v14;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_10004F4A0;
        aBlock[3] = &unk_100093350;
        v15 = _Block_copy(aBlock);
        v24 = v3;
        v16 = v15;
        v17 = v27;
        v18 = v12;
        v19 = swift_release(v17);
        static DispatchQoS.unspecified.getter(v19);
        aBlock[0] = &_swiftEmptyArrayStorage;
        v20 = sub_10004B3DC((unint64_t *)&unk_1000AD2A0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
        v21 = sub_10004A32C(&qword_1000AD610);
        v22 = sub_10004B41C((unint64_t *)&unk_1000AD2B0, &qword_1000AD610, (uint64_t)&protocol conformance descriptor for [A]);
        dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v21, v22, v2, v20);
        v23 = (void *)v25;
        OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v6, v16);
        _Block_release(v16);

        (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v2);
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      }
    }
  }
}

void sub_100055564()
{
  unsigned __int8 *v0;
  unsigned __int8 *v1;
  id *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unsigned __int8 *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unsigned __int8 *v28;
  void *Strong;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  void *v55;
  char v56[24];
  char v57[24];
  char v58[24];

  v1 = v0;
  v2 = (id *)&v0[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController];
  swift_beginAccess(v2, v58, 0, 0);
  if (*v2)
  {
    v3 = *v2;
    v4 = CanvasElementViewController<>.alwaysUseMaxResolutionImage.setter(1);
    v5 = dispatch thunk of CanvasElementViewController.canvasView.getter(v4);
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
      objc_msgSend(v6, "setBackgroundColor:", v7);

    }
    v8 = dispatch thunk of CanvasElementViewController.canvasView.getter(v5);
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)CanvasView.canvasScrollView.getter();

      if (!v10)
      {
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
      objc_msgSend(v10, "setMinimumZoomScale:", 1.0);

    }
    v11 = dispatch thunk of CanvasElementViewController.canvasView.getter(v8);
    if (v11)
    {
      v12 = (void *)v11;
      v13 = (void *)CanvasView.canvasScrollView.getter();

      if (!v13)
      {
LABEL_46:
        __break(1u);
        goto LABEL_47;
      }
      objc_msgSend(v13, "setMaximumZoomScale:", 1.0);

    }
    v14 = dispatch thunk of CanvasElementViewController.canvasView.getter(v11);
    if (v14)
    {
      v15 = (void *)v14;
      v16 = (void *)CanvasView.canvasScrollView.getter();

      if (!v16)
      {
LABEL_47:
        __break(1u);
        return;
      }
      objc_msgSend(v16, "setScrollEnabled:", 0);

    }
    v17 = dispatch thunk of CanvasElementViewController.shouldDeselectElementsWhenToolPickerIsHidden.setter(0);
    v18 = dispatch thunk of CanvasElementViewController.canvasView.getter(v17);
    if (v18)
    {
      v19 = (void *)v18;
      v20 = v1;
      dispatch thunk of CanvasView.contentSnapshottingView.setter(v1);

    }
    v21 = objc_msgSend(v3, "view");
    if (!v21)
    {
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    v22 = v21;
    objc_msgSend(v21, "setUserInteractionEnabled:", v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_annotationsEnabled], swift_beginAccess(&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_annotationsEnabled], v57, 0, 0).n128_f64[0]);

    v24 = (void *)dispatch thunk of CanvasElementViewController.canvasView.getter(v23);
    if (v24)
    {
      v25 = v24;
      objc_msgSend(v24, "setOverrideUserInterfaceStyle:", 1);

    }
    v26 = dispatch thunk of CanvasElementViewController.canvasView.getter(v24);
    if (!v26)
      goto LABEL_41;
    v27 = (void *)v26;
    v28 = &v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate];
    swift_beginAccess(&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate], v56, 0, 0);
    Strong = (void *)swift_unknownObjectWeakLoadStrong(v28);
    if (Strong)
    {
      v30 = Strong;
      v31 = objc_msgSend(Strong, "_paperKitImageViewOverlayViewController:", v1);
      swift_unknownObjectRelease(v30);
      if (v31)
      {
        v32 = v27;
        v33 = v31;
        dispatch thunk of AnyCanvas.overlayViewControllerForPresentingUI.setter(v31);

      }
    }
    v34 = objc_msgSend(v1, "superview");
    if (!v34)
    {
LABEL_40:

LABEL_41:
      return;
    }
    v35 = v34;
    while (1)
    {
      v36 = objc_opt_self(UIScrollView);
      v37 = swift_dynamicCastObjCClass(v35, v36);
      if (v37)
        break;
      v38 = objc_msgSend(v35, "superview");

      v35 = v38;
      if (!v38)
        goto LABEL_40;
    }
    v39 = (void *)v37;
    v40 = v27;
    v41 = dispatch thunk of AnyCanvas.movableOverlayViews.getter();

    v55 = v27;
    if ((unint64_t)v41 >> 62)
    {
      if (v41 < 0)
        v54 = v41;
      else
        v54 = v41 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v41);
      v42 = _CocoaArrayWrapper.endIndex.getter(v54);
      swift_bridgeObjectRelease(v41);
      if (v42)
        goto LABEL_29;
    }
    else
    {
      v42 = *(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v42)
      {
LABEL_29:
        if (v42 >= 1)
        {
          v43 = 0;
          do
          {
            if ((v41 & 0xC000000000000001) != 0)
              v44 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v43, v41);
            else
              v44 = *(id *)(v41 + 8 * v43 + 32);
            v45 = v44;
            ++v43;
            objc_msgSend(v44, "bounds");
            objc_msgSend(v39, "convertRect:fromCoordinateSpace:", v45);
            v47 = v46;
            v49 = v48;
            v51 = v50;
            v53 = v52;
            objc_msgSend(v39, "addSubview:", v45);
            objc_msgSend(v45, "setFrame:", v47, v49, v51, v53);

          }
          while (v42 != v43);
          goto LABEL_39;
        }
        __break(1u);
        goto LABEL_44;
      }
    }
LABEL_39:
    swift_bridgeObjectRelease(v41);
    sub_100054E18(v39);

    v27 = v55;
    goto LABEL_40;
  }
}

uint64_t sub_100055A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a4;
  v7 = sub_10004A32C(&qword_1000AD060);
  v6[8] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10004A32C(&qword_1000AD3C8);
  v6[9] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v6[10] = v9;
  v10 = *(_QWORD *)(v9 + 64);
  v6[11] = v10;
  v11 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6[12] = swift_task_alloc(v11);
  v6[13] = swift_task_alloc(v11);
  return swift_task_switch(sub_100055AA0, 0, 0);
}

uint64_t sub_100055AA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  UIImage *v4;
  UIImage *v5;
  NSData *v6;
  NSData *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  UIImage *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  __n128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v1 = *(_QWORD *)(v0 + 40) + 16;
  swift_beginAccess(v1, v0 + 16, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    v4 = (UIImage *)objc_msgSend(*(id *)(v0 + 48), "ss_CGImageBacked");
    if (v4)
    {
      v5 = v4;
      v6 = UIImagePNGRepresentation(v4);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)(v0 + 104);
        v9 = *(_QWORD *)(v0 + 80);
        v36 = *(_QWORD *)(v0 + 88);
        v35 = *(_QWORD *)(v0 + 96);
        v10 = *(_QWORD *)(v0 + 72);
        v39 = *(_QWORD *)(v0 + 64);
        v11 = *(_QWORD *)(v0 + 56);
        v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v6);
        v37 = v13;
        v38 = v12;
        v14 = v13;

        v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
        v15 = v11;
        v16 = v10;
        v33(v8, v15, v10);
        v17 = swift_task_alloc(32);
        *(_QWORD *)(v17 + 16) = v12;
        *(_QWORD *)(v17 + 24) = v14;
        v18 = v16;
        v32 = v16;
        v34 = v8;
        Capsule.callAsFunction<A>(_:)(sub_10005709C, v17, v16, (char *)&type metadata for () + 8);
        swift_task_dealloc(v17);
        v19 = type metadata accessor for TaskPriority(0);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v39, 1, 1, v19);
        v20 = swift_allocObject(&unk_100093178, 24, 7);
        swift_unknownObjectWeakInit(v20 + 16, v3);
        v33(v35, v8, v18);
        type metadata accessor for MainActor(0);
        swift_retain(v20);
        v21 = v5;
        v22 = static MainActor.shared.getter();
        v23 = *(unsigned __int8 *)(v9 + 80);
        v24 = (v23 + 40) & ~v23;
        v25 = (v36 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
        v26 = (char *)swift_allocObject(&unk_1000932E8, v25 + 8, v23 | 7);
        *((_QWORD *)v26 + 2) = v22;
        *((_QWORD *)v26 + 3) = &protocol witness table for MainActor;
        *((_QWORD *)v26 + 4) = v20;
        (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(&v26[v24], v35, v32);
        *(_QWORD *)&v26[v25] = v21;
        swift_release(v20);
        v27 = sub_10004F4CC(v39, (uint64_t)&unk_1000AD5C8, (uint64_t)v26);
        sub_10004B9C4(v38, v37);

        v28 = swift_release(v27);
        (*(void (**)(uint64_t, uint64_t, __n128))(v9 + 8))(v34, v32, v28);
      }
      else
      {

      }
    }
    else
    {

    }
  }
  v29 = *(_QWORD *)(v0 + 96);
  v30 = *(_QWORD *)(v0 + 64);
  swift_task_dealloc(*(_QWORD *)(v0 + 104));
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100055D40(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = sub_10004A32C(&qword_1000AD5D8);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_10006E3D8);
  sub_10004B8DC(a2, a3);
  CRDataAsset.init(_:)(a2, a3);
  v9 = enum case for CRAssetOrData.data(_:);
  v10 = type metadata accessor for CRAssetOrData(0);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v7, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
  v12 = sub_10004B3DC(&qword_1000AD3D0, (uint64_t (*)(uint64_t))&type metadata accessor for Image, (uint64_t)&protocol conformance descriptor for Image);
  return Capsule.Ref<>.subscript.setter(v7, KeyPath, v12);
}

uint64_t sub_100055E50()
{
  return Image.image.getter();
}

uint64_t sub_100055E70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = sub_10004A32C(&qword_1000AD5D8);
  __chkstk_darwin(v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100053540(a1, (uint64_t)v4, &qword_1000AD5D8);
  return Image.image.setter(v4);
}

uint64_t sub_100055EF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6[12] = a5;
  v6[13] = a6;
  v6[11] = a4;
  v7 = sub_10004A32C(&qword_1000AD438);
  v6[14] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MainActor(0);
  v6[15] = static MainActor.shared.getter();
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  return swift_task_switch(sub_100055F84, v9, v10);
}

uint64_t sub_100055F84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  char *v3;
  void **v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char *v11;
  void *v12;
  void *v13;

  v1 = *(_QWORD *)(v0 + 88);
  swift_release(*(_QWORD *)(v0 + 120));
  v1 += 16;
  swift_beginAccess(v1, v0 + 16, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (char *)Strong;
    v4 = (void **)(Strong + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
    swift_beginAccess(Strong + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController, v0 + 40, 0, 0);
    v5 = *v4;
    if (*v4)
    {
      v6 = *(_QWORD *)(v0 + 112);
      v7 = *(_QWORD *)(v0 + 96);
      v8 = sub_10004A32C(&qword_1000AD3C8);
      v9 = *(_QWORD *)(v8 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
      v10 = v5;
      dispatch thunk of CanvasElementViewController.paper.setter(v6);

    }
    sub_100055564();
    v11 = &v3[OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate];
    swift_beginAccess(&v3[OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate], v0 + 64, 0, 0);
    v12 = (void *)swift_unknownObjectWeakLoadStrong(v11);
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, "_paperKitImageView:didFinishUpdatingImage:", v3, *(_QWORD *)(v0 + 104));
      swift_unknownObjectRelease(v13);
    }

  }
  swift_task_dealloc(*(_QWORD *)(v0 + 112));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1000560E8(uint64_t a1, uint64_t a2)
{
  char *v2;
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double *v8;
  double v9;
  double v10;
  id *v11;
  double v12;
  id v13;
  void *v14;
  _BYTE v15[24];
  _BYTE v16[24];
  _BYTE v17[24];
  objc_super v18;
  CGRect v19;

  v18.receiver = v2;
  v18.super_class = (Class)swift_getObjectType(v2, a2);
  objc_msgSendSuper2(&v18, "layoutSubviews");
  v3 = (double *)&v2[OBJC_IVAR____SSSScreenshotPaperKitImageView_cropInfo];
  swift_beginAccess(&v2[OBJC_IVAR____SSSScreenshotPaperKitImageView_cropInfo], v17, 0, 0);
  v4 = v3[2];
  v5 = v3[3];
  v6 = v3[4];
  v7 = v3[5];
  v19.origin.x = v4;
  v19.origin.y = v5;
  v19.size.width = v6;
  v19.size.height = v7;
  if (!CGRectIsEmpty(v19))
  {
    v8 = (double *)&v2[OBJC_IVAR____SSSScreenshotPaperKitImageView_sizeMultiplier];
    swift_beginAccess(&v2[OBJC_IVAR____SSSScreenshotPaperKitImageView_sizeMultiplier], v16, 0, 0);
    v9 = *v8;
    v10 = v8[1];
    v11 = (id *)&v2[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController];
    *(_QWORD *)&v12 = swift_beginAccess(&v2[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController], v15, 0, 0).n128_u64[0];
    if (*v11)
    {
      v13 = objc_msgSend(*v11, "view", v12);
      if (v13)
      {
        v14 = v13;
        objc_msgSend(v13, "setFrame:", v4, v5, v6 * v9, v7 * v10);

      }
      else
      {
        __break(1u);
      }
    }
  }
}

void sub_10005623C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  double v4;
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id *v19;
  __n128 v20;
  id v21;
  id v22;
  double v23;
  double v24;
  uint64_t KeyPath;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  _QWORD *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  __n128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  void **aBlock;
  uint64_t v46;
  uint64_t (*v47)(uint64_t);
  void *v48;
  uint64_t (*v49)();
  uint64_t v50;
  char v51[24];

  v3 = type metadata accessor for CRKeyPath(0);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Paper(0, v4);
  __chkstk_darwin(v7);
  v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_10004A32C(&qword_1000AD430);
  v10 = *(_QWORD *)(v43 - 8);
  __chkstk_darwin(v43);
  v44 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_10004A32C(&qword_1000AD438);
  __chkstk_darwin(v12);
  v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_10004A32C(&qword_1000AD3C8);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = (id *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
  v20 = swift_beginAccess(v19, v51, 0, 0);
  if (!*v19)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, __n128))(v16 + 56))(v14, 1, 1, v15, v20);
    goto LABEL_6;
  }
  v21 = *v19;
  dispatch thunk of CanvasElementViewController.paper.getter();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
LABEL_6:
    sub_10004A490((uint64_t)v14, &qword_1000AD438);
    return;
  }
  v41 = v10;
  v42 = v16;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
  v22 = objc_msgSend(a1, "environmentDescription");
  objc_msgSend(v22, "imageScale");
  v24 = v23;

  type metadata accessor for CanvasElementImageRenderer(0);
  KeyPath = swift_getKeyPath(&unk_10006E340);
  v26 = sub_10004B3DC(&qword_1000AD3D0, (uint64_t (*)(uint64_t))&type metadata accessor for Image, (uint64_t)&protocol conformance descriptor for Image);
  Capsule<>.subscript.getter(KeyPath, v15, v26);
  swift_release(KeyPath);
  v27 = CanvasElementImageRenderer.__allocating_init(size:scale:)(*(double *)&v47, *(double *)&v48, v24);
  dispatch thunk of CanvasElementRenderer.sixChannelBlending.setter(1);
  v28 = swift_getKeyPath(&unk_10006E340);
  Capsule<>.subscript.getter(v28, v15, v26);
  swift_release(v28);
  v29 = Paper.init(frame:)(*(double *)&aBlock, *(double *)&v46, *(double *)&v47, *(double *)&v48);
  static CRKeyPath.unique.getter(v29);
  v30 = sub_10004B3DC(&qword_1000AD440, (uint64_t (*)(uint64_t))&type metadata accessor for Paper, (uint64_t)&protocol conformance descriptor for Paper);
  v31 = v44;
  v32 = Capsule<>.init(_:id:)(v9, v6, v7, v30);
  __chkstk_darwin(v32);
  *(&v41 - 2) = (uint64_t)v18;
  Capsule.callAsFunction<A>(_:)(sub_100056ED0, &v41 - 4, v43, (char *)&type metadata for () + 8);
  v33 = swift_allocObject(&unk_1000931A0, 24, 7);
  *(_QWORD *)(v33 + 16) = 0;
  v34 = objc_msgSend((id)objc_opt_self(UITraitCollection), "traitCollectionWithUserInterfaceStyle:", 1);
  v35 = (_QWORD *)swift_allocObject(&unk_1000931C8, 40, 7);
  v35[2] = v27;
  v35[3] = v31;
  v35[4] = v33;
  v36 = swift_allocObject(&unk_1000931F0, 32, 7);
  *(_QWORD *)(v36 + 16) = sub_100056F24;
  *(_QWORD *)(v36 + 24) = v35;
  v49 = sub_100056F40;
  v50 = v36;
  aBlock = _NSConcreteStackBlock;
  v46 = 1107296256;
  v47 = sub_100056A64;
  v48 = &unk_100093208;
  v37 = _Block_copy(&aBlock);
  v38 = v50;
  swift_retain(v27);
  swift_retain(v33);
  swift_retain(v36);
  objc_msgSend(v34, "performAsCurrentTraitCollection:", v37, swift_release(v38).n128_f64[0]);
  swift_release(v27);
  _Block_release(v37);

  (*(void (**)(char *, uint64_t))(v42 + 8))(v18, v15);
  LOBYTE(v37) = swift_isEscapingClosureAtFileLocation(v36, "", 120, 329, 36, 1);
  swift_release(v36);
  if ((v37 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    swift_beginAccess(v33 + 16, &aBlock, 0, 0);
    v39 = *(id *)(v33 + 16);
    v40 = swift_release(v33);
    (*(void (**)(char *, uint64_t, __n128))(v41 + 8))(v44, v43, v40);
    swift_release(v35);
  }
}

void sub_100056764(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(double *)a1 = Image.frame.getter();
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
}

uint64_t sub_100056790(double *a1)
{
  return Image.frame.setter(*a1, a1[1], a1[2], a1[3]);
}

uint64_t sub_1000567B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(_BYTE *, _QWORD);
  void (*v18)(_BYTE *, _QWORD);
  uint64_t v19;
  _BYTE v21[32];
  _BYTE v22[32];

  v4 = sub_10004A32C(&qword_1000AD3C8);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_10004A32C(&qword_1000ACF68);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = &v21[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *, uint64_t, uint64_t, double))(v5 + 16))(v7, a2, v4, v10);
  v13 = type metadata accessor for TaggedCanvasElement(0);
  v14 = sub_10004B3DC((unint64_t *)&unk_1000AD5B0, (uint64_t (*)(uint64_t))&type metadata accessor for TaggedCanvasElement, (uint64_t)&protocol conformance descriptor for TaggedCanvasElement);
  v15 = swift_retain(a1);
  SharedTagged_9.init<A>(_:_:)(v15, v7, v13, v14);
  v16 = sub_10004B3DC(&qword_1000AD440, (uint64_t (*)(uint64_t))&type metadata accessor for Paper, (uint64_t)&protocol conformance descriptor for Paper);
  v17 = (uint64_t (*)(_BYTE *, _QWORD))Capsule.Ref<>.root.modify(v22, v16);
  v18 = (void (*)(_BYTE *, _QWORD))Paper.subelements.modify(v21);
  v19 = sub_10004A32C(&qword_1000ACF60);
  CROrderedSet.append(_:)(v12, v19);
  (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v12, v8);
  v18(v21, 0);
  return v17(v22, 0);
}

void sub_10005694C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  NSObject *v11;
  __n128 v12;
  _OWORD v13[2];
  char v14;

  v5 = sub_10004A32C(&qword_1000AD430);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = dispatch_semaphore_create(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
  memset(v13, 0, sizeof(v13));
  v14 = 1;
  v10 = swift_allocObject(&unk_1000932C0, 32, 7);
  *(_QWORD *)(v10 + 16) = a3;
  *(_QWORD *)(v10 + 24) = v9;
  swift_retain(a3);
  v11 = v9;
  dispatch thunk of CanvasElementImageRenderer.image(from:bounds:completion:)(v8, v13, sub_100057044, v10);
  v12 = swift_release(v10);
  (*(void (**)(char *, uint64_t, __n128))(v6 + 8))(v8, v5, v12);
  OS_dispatch_semaphore.wait()();

}

uint64_t sub_100056A64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_100056C9C()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  _OWORD *v4;
  _QWORD *v5;
  _OWORD v6[2];
  uint64_t v7;

  v1 = v0;
  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate], 0);
  v2 = OBJC_IVAR____SSSScreenshotPaperKitImageView_context;
  type metadata accessor for CRContext(0);
  v7 = 0;
  memset(v6, 0, sizeof(v6));
  v3 = static CRContext.newTransientContext(uniqueAssetManager:encryptionDelegate:)(0, v6);
  sub_10004A490((uint64_t)v6, &qword_1000AD008);
  *(_QWORD *)&v1[v2] = v3;
  *(_QWORD *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageCancellable] = 0;
  v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_isChangingVellumOpacity] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_vellumOpacity] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_changeCounter] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_image] = 0;
  v4 = &v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_cropInfo];
  *v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  v5 = &v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_sizeMultiplier];
  *v5 = 0;
  v5[1] = 0;
  v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_useTrilinearMinificationFilter] = 0;
  v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_editable] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_rulerHostView] = 0;
  v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_annotationsEnabled] = 1;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "ScreenshotServicesService/_SSSScreenshotPaperKitImageView.swift", 63, 2, 95, 0);
  __break(1u);
}

void sub_100056DF0(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;
  void **v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  _BYTE v12[24];

  v3 = (void **)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_rulerHostView);
  swift_beginAccess(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_rulerHostView, v12, 1, 0);
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  v6 = (void **)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
  swift_beginAccess(v6, &v11, 0, 0);
  v7 = *v6;
  if (v7)
  {
    v8 = *v3;
    v9 = v8;
    v10 = v7;
    dispatch thunk of CanvasElementViewController.rulerHostView.setter(v8);

  }
}

double sub_100056E90(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t sub_100056EAC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100056ED0(uint64_t a1)
{
  uint64_t v1;

  return sub_1000567B8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_100056EF8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_100056F24()
{
  uint64_t *v0;

  sub_10005694C(v0[2], v0[3], v0[4]);
}

uint64_t sub_100056F30()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100056F40()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100056F60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100056F70(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t type metadata accessor for _SSSScreenshotPaperKitImageView()
{
  return objc_opt_self(_SSSScreenshotPaperKitImageView);
}

__n128 sub_100056F98(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_100056FAC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100056FCC(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for SSSCropInfo(uint64_t a1)
{
  sub_10004B578(a1, &qword_1000AD598, (uint64_t)&unk_100093298);
}

uint64_t sub_100057018()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

Swift::Int sub_100057044(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  _BYTE v7[24];

  v3 = *(_QWORD *)(v1 + 16);
  swift_beginAccess(v3 + 16, v7, 1, 0);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = a1;
  v5 = a1;

  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_10005709C(uint64_t a1)
{
  uint64_t v1;

  return sub_100055D40(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1000570C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __n128 v7;

  v1 = sub_10004A32C(&qword_1000AD3C8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  v7 = swift_release(*(_QWORD *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t, __n128))(v2 + 8))(v0 + v4, v1, v7);

  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_100057160()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(sub_10004A32C(&qword_1000AD3C8) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v0 + 32);
  v5 = v0 + v3;
  v6 = *(_QWORD *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8));
  v7 = (_QWORD *)swift_task_alloc(dword_1000AD5C4);
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_1000537F0;
  return sub_100055EF0((uint64_t)v7, v8, v9, v4, v5, v6);
}

void sub_1000571F0()
{
  uint64_t v0;

  sub_1000552E8(v0);
}

uint64_t sub_1000571FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_10004A32C(&qword_1000AD3C8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 48) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100057284()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_10004A32C(&qword_1000AD3C8) - 8) + 80);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = v0 + ((v2 + 48) & ~v2);
  v6 = (_QWORD *)swift_task_alloc(dword_1000AD424);
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_10004F1A4;
  return sub_100055A00((uint64_t)v6, v7, v8, v3, v4, v5);
}

unint64_t sub_100057300()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000AD600;
  if (!qword_1000AD600)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000AD600);
  }
  return result;
}

uint64_t sub_10005733C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void *sub_100057360()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *result;
  void *v4;
  uint64_t v5;
  _BYTE v6[24];

  v1 = *(_QWORD *)(v0 + 16);
  v2 = v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate;
  swift_beginAccess(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_delegate, v6, 0, 0);
  result = (void *)swift_unknownObjectWeakLoadStrong(v2);
  if (result)
  {
    v4 = result;
    objc_msgSend(result, "_paperKitImageDidChangeInView:changeCounter:", v1, *(_QWORD *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_changeCounter), swift_beginAccess(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_changeCounter, &v5, 0, 0).n128_f64[0]);
    return (void *)swift_unknownObjectRelease(v4);
  }
  return result;
}

uint64_t sub_100057408()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC25ScreenshotServicesServiceP33_2362AF1B5132D6C82A9B09D4C01DF9D519ResourceBundleClass);
}

uint64_t sub_100057438()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "LPLinkMetadata");
  return sub_10005745C(v0);
}

uint64_t sub_10005745C()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "LPFileMetadata");
  return sub_100057480(v0);
}

uint64_t sub_100057480()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "LPImage");
  return sub_1000574A4(v0);
}

uint64_t sub_1000574A4()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "AKController");
  return sub_1000574C8(v0);
}

uint64_t sub_1000574C8()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "AKInkAnnotation");
  return sub_1000574EC(v0);
}

void sub_1000574EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C680((void *)&_mh_execute_header, a1, a3, "GlitchFreeHeroTest failed to find scroll view", a5, a6, a7, a8, 0);
}

void sub_100057520(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C680((void *)&_mh_execute_header, a1, a3, "GlitchFreeHeroTest failed to find screnshot view", a5, a6, a7, a8, 0);
}

void sub_100057554(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Image passed to VisionKit was nil", v1, 2u);
}

void sub_100057594(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012E10((void *)&_mh_execute_header, a2, a3, "Could not write to directory for internal build with error: %@", a5, a6, a7, a8, 2u);
  sub_100012E20();
}

void sub_1000575F8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012E10((void *)&_mh_execute_header, a2, a3, "Could not generate image data for image %@ to save for sysdiagnose", a5, a6, a7, a8, 2u);
  sub_100012E20();
}

void sub_100057660(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not write to sysdiagnose for internal build to path %@ with error: %@", (uint8_t *)&v3, 0x16u);
  sub_100012E20();
}

void sub_1000576E0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "loggableDescription"));
  sub_100015958();
  sub_100015938((void *)&_mh_execute_header, v2, v3, "Received an image identifier update %@ with no matching environment description", v4, v5, v6, v7, v8);

  sub_10001594C();
}

void sub_100057758(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "loggableDescription"));
  sub_100015958();
  sub_100015938((void *)&_mh_execute_header, v2, v3, "Received an image identifier failure %@", v4, v5, v6, v7, v8);

  sub_10001594C();
}

void sub_1000577D0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "loggableDescription"));
  sub_100015958();
  sub_100015938((void *)&_mh_execute_header, v2, v3, "Received a metadata update %@ with no matching element identifier", v4, v5, v6, v7, v8);

  sub_10001594C();
}

void sub_100057848(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "loggableDescription"));
  sub_100015958();
  sub_100015938((void *)&_mh_execute_header, v2, v3, "Received a document update %@ with no matching element identifier", v4, v5, v6, v7, v8);

  sub_10001594C();
}

void sub_1000578C0(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "environmentDescription"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "loggableDescription"));
  sub_100015958();
  sub_100015938((void *)&_mh_execute_header, v3, v4, "Asked to remove a screenshot the manager is not tracking with environment description %@", v5, v6, v7, v8, v9);

  sub_100015964();
}

uint64_t sub_10005794C()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "WKWebView");
  return sub_100057970(v0);
}

void sub_100057970(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *a1;
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  sub_10001D938((void *)&_mh_execute_header, a3, (uint64_t)a3, "We received more document updates (%lu) than we were expecting (%lu)", (uint8_t *)&v4);
  sub_100012E20();
}

void sub_1000579EC(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "UUIDString"));
  sub_100015958();
  sub_10001D92C((void *)&_mh_execute_header, a2, v4, "screenshot was edited, undonating siri sharing user activity with UUID: %@", v5);

  sub_10001594C();
}

void sub_100057A70()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100015958();
  sub_10001D92C((void *)&_mh_execute_header, v0, v1, "No file to remove at %@", v2);
  sub_100012E20();
}

void sub_100057AD4()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100015958();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Could not find pdf from file manager %@ at %@", v2, 0x16u);
  sub_100012E20();
}

void sub_100057B50(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "filename"));
  v5 = 138412546;
  v6 = 0;
  v7 = 2112;
  v8 = v3;
  sub_10001D938((void *)&_mh_execute_header, a2, v4, "Invalid path component when calling _savePDFToTemporaryPathWithData:%@ filename: %@", (uint8_t *)&v5);

  sub_10001594C();
}

void sub_100057BE0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100015958();
  sub_10001D92C((void *)&_mh_execute_header, v0, v1, "Finished coordinated writing, error:%@", v2);
  sub_100012E20();
}

void sub_100057C44(void *a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  __int16 v6;
  unsigned int v7;

  v3 = objc_retainAutorelease(a1);
  v4 = 134218240;
  v5 = objc_msgSend(v3, "bytes");
  v6 = 1024;
  v7 = objc_msgSend(v3, "length");
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Generated PDF data %p, length:%d", (uint8_t *)&v4, 0x12u);
}

void sub_100057CF4(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *(_QWORD *)(a2 + 40);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Moved PDF to %@ (error: %@)", (uint8_t *)&v5, 0x16u);
  sub_100012E20();
}

void sub_100057D7C(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_100015958();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "screenshot couldn't be sent to quick note. Error: %@", v4, 0xCu);

  sub_10001594C();
}

uint64_t sub_100057E04()
{
  NSObject *v0;

  v0 = abort_report_np("Unable to find class %s", "SYLinkContextClient");
  return sub_100057E28(v0);
}

void sub_100057E28(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "We got into a weird state - we have no container view controller but a valid root view controller.", v1, 2u);
}

void sub_100057E68(os_log_t log, double a2)
{
  int v2;
  double v3;

  v2 = 134217984;
  v3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Still processing image identifiers progress: %f", (uint8_t *)&v2, 0xCu);
}

void sub_100057EE0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Saved environment description while we have a remote view controller", v1, 2u);
}

void sub_100057F20(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "There were more valid screenshots than there were actually available - this is indicative of screenshots not getting cleaned up properly after dismissal", v1, 2u);
}

uint64_t sub_100057F60()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "RCPMovie");
  return sub_100057F84(v0);
}

uint64_t sub_100057F84()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "RCPVizualizerView");
  return sub_100057FA8(v0);
}

uint64_t sub_100057FA8()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "RCPTimelineView");
  return sub_100057FCC(v0);
}

uint64_t sub_100057FCC()
{
  char *v0;
  uint64_t v1;

  v0 = dlerror();
  v1 = abort_report_np("%s", v0);
  return sub_100057FEC(v1);
}

uint64_t sub_100057FEC()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "AKPageModelController");
  return sub_100058010(v0);
}

uint64_t sub_100058010()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "AKTextBoxAnnotation");
  return sub_100058034(v0);
}

uint64_t sub_100058034()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "AKAnnotation");
  return sub_100058058(v0);
}

uint64_t sub_100058058()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "AKToolbarView");
  return sub_10005807C(v0);
}

void sub_10005807C(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160);
  v4 = 138412290;
  v5 = v3;
  sub_100048CA4((void *)&_mh_execute_header, a2, a3, "Did not present share sheet for activity view controller %@ because success == NO", (uint8_t *)&v4);
}

void sub_1000580F8(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  v5 = 138412290;
  v6 = v3;
  sub_100048CA4((void *)&_mh_execute_header, a2, v4, "failed to save PDF page to Photos. Error: %@", (uint8_t *)&v5);

}

void sub_100058184(uint64_t a1, void *a2, NSObject *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;

  v5 = objc_msgSend(*(id *)(a1 + 32), "count");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  v7 = 134218242;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to send %ld screenshots to Quick Note. Error: %@", (uint8_t *)&v7, 0x16u);

}

void sub_100058240()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "TFFeedbackSession");
  __DataStorage._bytes.getter(v0);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGContext");
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGImage");
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGPath");
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGRectValue");
}

id objc_msgSend_EnableAnnotationKit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "EnableAnnotationKit");
}

id objc_msgSend_PDFData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "PDFData");
}

id objc_msgSend_PDFDocument(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "PDFDocument");
}

id objc_msgSend_PDFPage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "PDFPage");
}

id objc_msgSend_PDFURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "PDFURL");
}

id objc_msgSend_PDFVisibleRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "PDFVisibleRect");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForResource:withExtension:");
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLQueryAllowedCharacterSet");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__aboutToChangeSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_aboutToChangeSize");
}

id objc_msgSend__actionInActions_ofClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actionInActions:ofClass:");
}

id objc_msgSend__actionInfoViewIfExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actionInfoViewIfExists");
}

id objc_msgSend__actionNameForDeletePDFPage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actionNameForDeletePDFPage");
}

id objc_msgSend__actuallyMoveFromRemoteViewControllerToRemoteAlertViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actuallyMoveFromRemoteViewControllerToRemoteAlertViewController");
}

id objc_msgSend__addRootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addRootViewController");
}

id objc_msgSend__addScreenshotWithPDF_visibleRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addScreenshotWithPDF:visibleRect:");
}

id objc_msgSend__amountToMoveScreenshotsViewForHorizontalSlideOffDismiss(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_amountToMoveScreenshotsViewForHorizontalSlideOffDismiss");
}

id objc_msgSend__amountToMoveScreenshotsViewWithFrameForHorizontalSlideOffDismiss_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_amountToMoveScreenshotsViewWithFrameForHorizontalSlideOffDismiss:");
}

id objc_msgSend__animateUsingDefaultTimingWithOptions_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animateUsingDefaultTimingWithOptions:animations:completion:");
}

id objc_msgSend__animateWithDuration_delay_options_factory_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animateWithDuration:delay:options:factory:animations:completion:");
}

id objc_msgSend__anyScreenshotPDFViewNeedsBleedToBottom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_anyScreenshotPDFViewNeedsBleedToBottom");
}

id objc_msgSend__areAnyScreenshotsActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_areAnyScreenshotsActive");
}

id objc_msgSend__arrayOfRectValues_isEqualToArrayOfRectValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_arrayOfRectValues:isEqualToArrayOfRectValues:");
}

id objc_msgSend__availableRectForContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_availableRectForContent");
}

id objc_msgSend__bestFormatForScreenshotItemProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bestFormatForScreenshotItemProvider:");
}

id objc_msgSend__betaAppActivityItemIfAvailble(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_betaAppActivityItemIfAvailble");
}

id objc_msgSend__bottomBarHeightIncludingSafeAreaInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bottomBarHeightIncludingSafeAreaInsets");
}

id objc_msgSend__bottomPalette(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bottomPalette");
}

id objc_msgSend__buildDoneMenu(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildDoneMenu");
}

id objc_msgSend__buildDoneMenuElements(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildDoneMenuElements");
}

id objc_msgSend__bundleIDForBetaApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bundleIDForBetaApp");
}

id objc_msgSend__canProvidePDF(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canProvidePDF");
}

id objc_msgSend__cancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancel");
}

id objc_msgSend__cancelScheduledHideCachedOverlayView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelScheduledHideCachedOverlayView");
}

id objc_msgSend__cancelSharing_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelSharing:completion:");
}

id objc_msgSend__cancelZoomTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelZoomTimer");
}

id objc_msgSend__clearSecurityScopedResourcesAndTemporaryFiles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearSecurityScopedResourcesAndTemporaryFiles");
}

id objc_msgSend__commitCropControllerInflightEdits(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_commitCropControllerInflightEdits");
}

id objc_msgSend__configureBarButtonItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureBarButtonItems");
}

id objc_msgSend__contentInsetForUnitRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentInsetForUnitRect:");
}

id objc_msgSend__contentSwitcherShouldMoveDown(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentSwitcherShouldMoveDown");
}

id objc_msgSend__contentView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentView");
}

id objc_msgSend__createAndParentContainerViewControllerIfPossible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createAndParentContainerViewControllerIfPossible");
}

id objc_msgSend__createContainerViewControllerIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createContainerViewControllerIfNecessary");
}

id objc_msgSend__createDirectoryForSysdiagnoseIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createDirectoryForSysdiagnoseIfNecessary");
}

id objc_msgSend__createTemporarySavingQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createTemporarySavingQueue");
}

id objc_msgSend__cropPDFEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cropPDFEnabled");
}

id objc_msgSend__cropRectFromOverlayView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cropRectFromOverlayView:");
}

id objc_msgSend__currentOverlayController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentOverlayController");
}

id objc_msgSend__currentPDFView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentPDFView");
}

id objc_msgSend__currentPage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentPage");
}

id objc_msgSend__currentScreenshotView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentScreenshotView");
}

id objc_msgSend__currentScrollViewCropRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentScrollViewCropRect");
}

id objc_msgSend__currentUserActivityUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentUserActivityUUID");
}

id objc_msgSend__currentUserInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentUserInterfaceIdiom");
}

id objc_msgSend__dataTypeIdentifierForActivityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dataTypeIdentifierForActivityType:");
}

id objc_msgSend__deletePageInPDF_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deletePageInPDF:");
}

id objc_msgSend__didChangeSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didChangeSize");
}

id objc_msgSend__dismissActivityViewController_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissActivityViewController:completion:");
}

id objc_msgSend__dismissInflightActivity_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissInflightActivity:completion:");
}

id objc_msgSend__dismissScreenshotsWithVelocity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissScreenshotsWithVelocity:");
}

id objc_msgSend__dismissWithDeleteOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissWithDeleteOptions:");
}

id objc_msgSend__doc_importItemAtURL_toDestination_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_doc_importItemAtURL:toDestination:error:");
}

id objc_msgSend__documentUpdateActionInActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_documentUpdateActionInActions:");
}

id objc_msgSend__donateScreenshotUserActivityForSiri_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_donateScreenshotUserActivityForSiri:");
}

id objc_msgSend__durationForHorizontalSlideOffDismiss(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_durationForHorizontalSlideOffDismiss");
}

id objc_msgSend__durationForMinimize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_durationForMinimize");
}

id objc_msgSend__effectForBlurEffect_vibrancyStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_effectForBlurEffect:vibrancyStyle:");
}

id objc_msgSend__effectiveBottomBarExtent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_effectiveBottomBarExtent");
}

id objc_msgSend__effectiveIndexForIndex_inNumberOfScreenshots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_effectiveIndexForIndex:inNumberOfScreenshots:");
}

id objc_msgSend__elementDocument(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_elementDocument");
}

id objc_msgSend__elementHasValidPDFData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_elementHasValidPDFData:");
}

id objc_msgSend__elementIndexForDocument(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_elementIndexForDocument");
}

id objc_msgSend__emitCropRectWillBeginChangingMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_emitCropRectWillBeginChangingMessage");
}

id objc_msgSend__enableInkingOnAKController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enableInkingOnAKController:");
}

id objc_msgSend__endOpacityEditing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endOpacityEditing");
}

id objc_msgSend__enumerateAllShadowRectsWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateAllShadowRectsWithBlock:");
}

id objc_msgSend__existingInteractionForWindowScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_existingInteractionForWindowScene:");
}

id objc_msgSend__exitCrop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_exitCrop");
}

id objc_msgSend__exportVellumPDF(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_exportVellumPDF");
}

id objc_msgSend__fetchUserActivityWithUUID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchUserActivityWithUUID:completionHandler:");
}

id objc_msgSend__findTextViewFirstResponderUnderView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findTextViewFirstResponderUnderView:");
}

id objc_msgSend__finishRunPPTServiceRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finishRunPPTServiceRequest:");
}

id objc_msgSend__fontSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fontSize");
}

id objc_msgSend__frameForGrabberAtEdge_inSize_dimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_frameForGrabberAtEdge:inSize:dimension:");
}

id objc_msgSend__frameForLineAtEdge_inSize_dimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_frameForLineAtEdge:inSize:dimension:");
}

id objc_msgSend__frameForScreenshot_atIndex_numberOfScreenshots_maximumSize_interScreenshotSpacing_rectToCenterAboveKeyboard_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_frameForScreenshot:atIndex:numberOfScreenshots:maximumSize:interScreenshotSpacing:rectToCenterAboveKeyboard:state:");
}

id objc_msgSend__frameForViewInCorner_inSize_cornerSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_frameForViewInCorner:inSize:cornerSize:");
}

id objc_msgSend__gesturesForMiniatureState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_gesturesForMiniatureState");
}

id objc_msgSend__goToPDFPage_rect_force_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_goToPDFPage:rect:force:");
}

id objc_msgSend__harvestPDFIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_harvestPDFIfNecessary");
}

id objc_msgSend__hasGeneratedPDF(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasGeneratedPDF");
}

id objc_msgSend__hideAndShowViewsForScreenshotEditsSnapshotted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hideAndShowViewsForScreenshotEditsSnapshotted:");
}

id objc_msgSend__imageAnalysisAaButtonIfExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageAnalysisAaButtonIfExists");
}

id objc_msgSend__imageIdentifierActionInActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageIdentifierActionInActions:");
}

id objc_msgSend__informRepresentationOfUndoStackChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_informRepresentationOfUndoStackChange");
}

id objc_msgSend__initGroupWithName_identifier_customizations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initGroupWithName:identifier:customizations:");
}

id objc_msgSend__initWithUserActivityType_dynamicActivityType_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithUserActivityType:dynamicActivityType:options:");
}

id objc_msgSend__interScreenshotSpacing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_interScreenshotSpacing");
}

id objc_msgSend__internalPDFView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_internalPDFView");
}

id objc_msgSend__isAncestorOfFirstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isAncestorOfFirstResponder");
}

id objc_msgSend__isEditingScreenshotImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isEditingScreenshotImage");
}

id objc_msgSend__isLandscapePhone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isLandscapePhone");
}

id objc_msgSend__isPointInsidePaletteView_fromView_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isPointInsidePaletteView:fromView:withEvent:");
}

id objc_msgSend__isPortraitPhone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isPortraitPhone");
}

id objc_msgSend__isShowingPDFScreenshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isShowingPDFScreenshot");
}

id objc_msgSend__isTriggeredByInteractiveScreenshotGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isTriggeredByInteractiveScreenshotGesture:");
}

id objc_msgSend__labelAttributedString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_labelAttributedString");
}

id objc_msgSend__labelFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_labelFont");
}

id objc_msgSend__layoutBounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutBounds");
}

id objc_msgSend__layoutBoundsForFullPageThumbnail(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutBoundsForFullPageThumbnail");
}

id objc_msgSend__layoutOccludingView_viewToCrop_overlayView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutOccludingView:viewToCrop:overlayView:");
}

id objc_msgSend__layoutOccludingViewContainerView_occludingView_scrollViewMaskView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutOccludingViewContainerView:occludingView:scrollViewMaskView:");
}

id objc_msgSend__layoutOverlayView_viewToCrop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutOverlayView:viewToCrop:");
}

id objc_msgSend__layoutPDFViewVerticalContentInsetToMatchImageView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutPDFViewVerticalContentInsetToMatchImageView");
}

id objc_msgSend__layoutScreenshotView_forState_isFirstScreenshot_isCurrentScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutScreenshotView:forState:isFirstScreenshot:isCurrentScreenshot:");
}

id objc_msgSend__layoutScrollView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutScrollView:");
}

id objc_msgSend__layoutScrollViewContainerView_scrollView_overlayView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutScrollViewContainerView:scrollView:overlayView:");
}

id objc_msgSend__layoutShouldEnableContentSwitcher(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutShouldEnableContentSwitcher");
}

id objc_msgSend__layoutShouldShowContentSwitcher(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutShouldShowContentSwitcher");
}

id objc_msgSend__layoutShouldShowCroppedContents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutShouldShowCroppedContents");
}

id objc_msgSend__layoutThumbnailView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutThumbnailView");
}

id objc_msgSend__layoutUpdateCropControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutUpdateCropControllers");
}

id objc_msgSend__layoutUpdateScrollViewContentLayout_viewToCrop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutUpdateScrollViewContentLayout:viewToCrop:");
}

id objc_msgSend__layoutViewToCrop_scrollView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutViewToCrop:scrollView:");
}

id objc_msgSend__loadUneditedImageIfNecessaryWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadUneditedImageIfNecessaryWithCompletionBlock:");
}

id objc_msgSend__logEditsInScreenshotForAnalytics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logEditsInScreenshotForAnalytics");
}

id objc_msgSend__markAsBeingEditedForMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markAsBeingEditedForMode:");
}

id objc_msgSend__markImageAsBeingEdited(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markImageAsBeingEdited");
}

id objc_msgSend__maximumZoomScale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_maximumZoomScale");
}

id objc_msgSend__metadataUpdateActionInActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_metadataUpdateActionInActions:");
}

id objc_msgSend__miniatureInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_miniatureInsets");
}

id objc_msgSend__minimumSizeForOverlayViewInUnitSpace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_minimumSizeForOverlayViewInUnitSpace");
}

id objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:");
}

id objc_msgSend__moveDittoRootViewControllerFromViewController_toViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_moveDittoRootViewControllerFromViewController:toViewController:");
}

id objc_msgSend__moveScreenshotsViewForHorizontalSlideOffDismiss(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_moveScreenshotsViewForHorizontalSlideOffDismiss");
}

id objc_msgSend__moveToUnitRect_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_moveToUnitRect:animated:");
}

id objc_msgSend__noteCurrentPageForSignificantChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_noteCurrentPageForSignificantChange");
}

id objc_msgSend__numberOfDrawingStrokesInScreenshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_numberOfDrawingStrokesInScreenshot");
}

id objc_msgSend__numberOfPages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_numberOfPages");
}

id objc_msgSend__occludingViews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_occludingViews");
}

id objc_msgSend__orderedRectCorners(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_orderedRectCorners");
}

id objc_msgSend__orderedRectEdges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_orderedRectEdges");
}

id objc_msgSend__outputImageOnCurrentUneditedImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_outputImageOnCurrentUneditedImage");
}

id objc_msgSend__outsetAmountForHandles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_outsetAmountForHandles");
}

id objc_msgSend__pageForXOffsetInScrollView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pageForXOffsetInScrollView:");
}

id objc_msgSend__paletteViewVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_paletteViewVisible");
}

id objc_msgSend__pdfView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pdfView");
}

id objc_msgSend__performPostDismissActions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performPostDismissActions");
}

id objc_msgSend__performPreDismissActionsForAnimationSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performPreDismissActionsForAnimationSettings:");
}

id objc_msgSend__peripheryInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_peripheryInsets");
}

id objc_msgSend__pileTranslationAmountForDismiss(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pileTranslationAmountForDismiss");
}

id objc_msgSend__pileTranslationIsTowardsEdge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pileTranslationIsTowardsEdge");
}

id objc_msgSend__pointInsideAnOccludingView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pointInsideAnOccludingView:");
}

id objc_msgSend__positionAppearingScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_positionAppearingScreenshot:");
}

id objc_msgSend__positioningIndexForIndex_numberOfScreenshots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_positioningIndexForIndex:numberOfScreenshots:");
}

id objc_msgSend__postNotificationForWillChangeToState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postNotificationForWillChangeToState:");
}

id objc_msgSend__pptTestInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pptTestInfos");
}

id objc_msgSend__preferredStatusBarVisibility(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredStatusBarVisibility");
}

id objc_msgSend__preheatActionInActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preheatActionInActions:");
}

id objc_msgSend__prepareAKController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareAKController");
}

id objc_msgSend__prepareDragInteractionIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareDragInteractionIfNecessary");
}

id objc_msgSend__prepareGesturesForOverlayController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareGesturesForOverlayController:");
}

id objc_msgSend__prepareGesturesForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareGesturesForState:");
}

id objc_msgSend__prepareImageIdentifierUpdateAlertIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareImageIdentifierUpdateAlertIfNecessary");
}

id objc_msgSend__prepareRootViewControllerIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareRootViewControllerIfNecessary");
}

id objc_msgSend__presentActivityViewControllerFromBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentActivityViewControllerFromBarButtonItem:");
}

id objc_msgSend__presentImageIdentifierUpdateAlertIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentImageIdentifierUpdateAlertIfNecessary");
}

id objc_msgSend__presentUndoRedoAlertControllerIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentUndoRedoAlertControllerIfNecessary");
}

id objc_msgSend__printProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_printProvider");
}

id objc_msgSend__printedDocument(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_printedDocument");
}

id objc_msgSend__progressChanged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_progressChanged");
}

id objc_msgSend__prolongZoomTimerStartingIfNotRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prolongZoomTimerStartingIfNotRunning:");
}

id objc_msgSend__rectInViewSpaceForUnitRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rectInViewSpaceForUnitRect:");
}

id objc_msgSend__rectsForShadowView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rectsForShadowView");
}

id objc_msgSend__redoPushed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_redoPushed");
}

id objc_msgSend__reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__removeHighlightedModeForScreenshotViewIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeHighlightedModeForScreenshotViewIfNecessary:");
}

id objc_msgSend__removePDFNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removePDFNotifications");
}

id objc_msgSend__removeSecurityScopedURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeSecurityScopedURL:");
}

id objc_msgSend__removeURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeURL:");
}

id objc_msgSend__resumeHighQualityQueueIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resumeHighQualityQueueIfNecessary");
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rootSheetPresentationController");
}

id objc_msgSend__runPPTNamed_numberOfRequiredScreenshots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runPPTNamed:numberOfRequiredScreenshots:");
}

id objc_msgSend__runPPTServiceRequestForScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runPPTServiceRequestForScreenshot:");
}

id objc_msgSend__runPPTServiceRequestForScreenshots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runPPTServiceRequestForScreenshots:");
}

id objc_msgSend__sanitizedFilenameString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sanitizedFilenameString:");
}

id objc_msgSend__saveImageForSysdiagnose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveImageForSysdiagnose:");
}

id objc_msgSend__saveImages_toQuickNoteWithDismissalCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveImages:toQuickNoteWithDismissalCompletionBlock:");
}

id objc_msgSend__savePDFToPhotosPushed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_savePDFToPhotosPushed");
}

id objc_msgSend__savePDFToTemporaryPathWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_savePDFToTemporaryPathWithData:");
}

id objc_msgSend__saveToFilesPushed_savePDF_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveToFilesPushed:savePDF:");
}

id objc_msgSend__saveToQuickNotePushed_savePDF_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveToQuickNotePushed:savePDF:");
}

id objc_msgSend__scaleAmountForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scaleAmountForState:");
}

id objc_msgSend__scaledAndCenteredRect_withinRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scaledAndCenteredRect:withinRect:");
}

id objc_msgSend__scheduleHideCachedOverlayViewWithDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleHideCachedOverlayViewWithDelay:");
}

id objc_msgSend__screenshotActionInActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotActionInActions:");
}

id objc_msgSend__screenshotEditsShouldBeSnapshottedForCurrentScreenshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotEditsShouldBeSnapshottedForCurrentScreenshot");
}

id objc_msgSend__screenshotForDragItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotForDragItem:");
}

id objc_msgSend__screenshotGestureTriggered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotGestureTriggered:");
}

id objc_msgSend__screenshotIsBeingRemoved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotIsBeingRemoved:");
}

id objc_msgSend__screenshotIsGoingAway_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotIsGoingAway:");
}

id objc_msgSend__screenshotMaximumSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotMaximumSize");
}

id objc_msgSend__screenshotViewForDragItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotViewForDragItem:");
}

id objc_msgSend__screenshotViewForScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotViewForScreenshot:");
}

id objc_msgSend__screenshotWasTakenFromScreenshots(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotWasTakenFromScreenshots");
}

id objc_msgSend__screenshotWithEnvironmentDescriptionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotWithEnvironmentDescriptionIdentifier:");
}

id objc_msgSend__screenshotWithEnvironmentElementWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotWithEnvironmentElementWithIdentifier:");
}

id objc_msgSend__screenshotsEligibleForSharing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotsEligibleForSharing");
}

id objc_msgSend__screenshotsView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotsView");
}

id objc_msgSend__scrollContentInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollContentInsets");
}

id objc_msgSend__scrollContentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollContentSize");
}

id objc_msgSend__scrollToPage_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollToPage:animated:");
}

id objc_msgSend__scrollViewIsInLiveUserEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollViewIsInLiveUserEvent");
}

id objc_msgSend__scrollViewRectForPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollViewRectForPage:");
}

id objc_msgSend__scrollViewTerminalUserEventOccurred(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollViewTerminalUserEventOccurred");
}

id objc_msgSend__sendEvent_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendEvent:block:");
}

id objc_msgSend__sendToDeveloper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendToDeveloper");
}

id objc_msgSend__setAllowsPointerDragBeforeLiftDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAllowsPointerDragBeforeLiftDelay:");
}

id objc_msgSend__setAutoScrollEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAutoScrollEnabled:");
}

id objc_msgSend__setBottomPalette_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setBottomPalette:");
}

id objc_msgSend__setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCornerRadius:");
}

id objc_msgSend__setCropRect_notify_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCropRect:notify:");
}

id objc_msgSend__setDocumentIsSaving_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDocumentIsSaving:");
}

id objc_msgSend__setFlexible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFlexible:");
}

id objc_msgSend__setIgnoreBarButtonItemSiblings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIgnoreBarButtonItemSiblings:");
}

id objc_msgSend__setLiftDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setLiftDelay:");
}

id objc_msgSend__setMiniPaletteVisible_hoverLocation_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setMiniPaletteVisible:hoverLocation:inView:");
}

id objc_msgSend__setModelModificationDictionary_createUndoCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setModelModificationDictionary:createUndoCommand:");
}

id objc_msgSend__setOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setOptions:");
}

id objc_msgSend__setSecondaryActionsProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setSecondaryActionsProvider:");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend__setUpDevelopmentUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUpDevelopmentUI");
}

id objc_msgSend__setZoomFeedbackGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setZoomFeedbackGenerator:");
}

id objc_msgSend__setupPDFNotificationsIfPossible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupPDFNotificationsIfPossible");
}

id objc_msgSend__setupPaletteIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupPaletteIfNecessary");
}

id objc_msgSend__shapeLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shapeLayer");
}

id objc_msgSend__shapeLayerPathForProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shapeLayerPathForProgress:");
}

id objc_msgSend__sharableItemForActivityType_screenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sharableItemForActivityType:screenshot:");
}

id objc_msgSend__shouldAvoidKeyboard(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldAvoidKeyboard");
}

id objc_msgSend__shouldBleedToBottom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldBleedToBottom");
}

id objc_msgSend__shouldConfigureDragInteraction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldConfigureDragInteraction");
}

id objc_msgSend__shouldExtendBottomBarForPageDots(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldExtendBottomBarForPageDots");
}

id objc_msgSend__shouldHandleKeyboardNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldHandleKeyboardNotification:");
}

id objc_msgSend__shouldSendToDeveloper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldSendToDeveloper");
}

id objc_msgSend__shouldSetUpDevelopmentUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldSetUpDevelopmentUI");
}

id objc_msgSend__shouldShowBottomBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldShowBottomBar");
}

id objc_msgSend__shouldShowScreenshotViewAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldShowScreenshotViewAtIndex:");
}

id objc_msgSend__showAllScreenshotsForNumberOfScreenshots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showAllScreenshotsForNumberOfScreenshots:");
}

id objc_msgSend__significantTimerEventOccured(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_significantTimerEventOccured");
}

id objc_msgSend__simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_simulateScrollWithTranslation:duration:willBeginDragging:didEndDragging:willBeginDecelerating:didEndDecelerating:");
}

id objc_msgSend__sss_cropItemWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sss_cropItemWithTarget:action:");
}

id objc_msgSend__sss_imageFromScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sss_imageFromScreenshot:");
}

id objc_msgSend__sss_redoItemWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sss_redoItemWithTarget:action:");
}

id objc_msgSend__sss_shareItemWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sss_shareItemWithTarget:action:");
}

id objc_msgSend__sss_trashItemWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sss_trashItemWithTarget:action:");
}

id objc_msgSend__sss_undoItemWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sss_undoItemWithTarget:action:");
}

id objc_msgSend__startDragging(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startDragging");
}

id objc_msgSend__startRunPPTServiceRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startRunPPTServiceRequest:");
}

id objc_msgSend__stateDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stateDescription");
}

id objc_msgSend__statisticsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_statisticsEnabled");
}

id objc_msgSend__stitchPageImages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stitchPageImages:");
}

id objc_msgSend__stopDraggingDismissing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopDraggingDismissing:");
}

id objc_msgSend__stopFlash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopFlash");
}

id objc_msgSend__systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemImageNamed:");
}

id objc_msgSend__systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemImageNamed:withConfiguration:");
}

id objc_msgSend__thumbnailTrayWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_thumbnailTrayWidth");
}

id objc_msgSend__timerShouldBeRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timerShouldBeRunning");
}

id objc_msgSend__toolPickerHeightOnPhone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_toolPickerHeightOnPhone");
}

id objc_msgSend__trackingChanged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_trackingChanged");
}

id objc_msgSend__transformForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transformForState:");
}

id objc_msgSend__transformToConvertFromRect_toRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transformToConvertFromRect:toRect:");
}

id objc_msgSend__transformToConvertToRect_fromRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transformToConvertToRect:fromRect:");
}

id objc_msgSend__transitionToStateIfNecessaryFromEnvironmentDescription_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transitionToStateIfNecessaryFromEnvironmentDescription:completion:");
}

id objc_msgSend__translationAmountForState_pileTranslation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_translationAmountForState:pileTranslation:");
}

id objc_msgSend__triggerTypeForPresentationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_triggerTypeForPresentationMode:");
}

id objc_msgSend__undoPushed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_undoPushed");
}

id objc_msgSend__undoableModelChangePrequel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_undoableModelChangePrequel:");
}

id objc_msgSend__undoableModelChangeSequel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_undoableModelChangeSequel:");
}

id objc_msgSend__updateActiveScreenshotViewIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateActiveScreenshotViewIfNecessary");
}

id objc_msgSend__updateActivityItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateActivityItems:");
}

id objc_msgSend__updateActivityViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateActivityViewController");
}

id objc_msgSend__updateActivityViewControllerNeedsActivityUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateActivityViewControllerNeedsActivityUpdate:");
}

id objc_msgSend__updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated:");
}

id objc_msgSend__updateAnnotations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnnotations");
}

id objc_msgSend__updateAnnotationsCreateUndoCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnnotationsCreateUndoCommand:");
}

id objc_msgSend__updateAnnotationsForViewState_createUndoCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnnotationsForViewState:createUndoCommand:");
}

id objc_msgSend__updateBarButtonItemPositionsAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateBarButtonItemPositionsAnimated:");
}

id objc_msgSend__updateDisplayedPage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDisplayedPage");
}

id objc_msgSend__updateDisplayedProgressTowardsReceivingAllImageIdentifierUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDisplayedProgressTowardsReceivingAllImageIdentifierUpdates");
}

id objc_msgSend__updateDragInteraction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDragInteraction");
}

id objc_msgSend__updateFirstResponderForHidingToolPicker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFirstResponderForHidingToolPicker");
}

id objc_msgSend__updateForCurrentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateForCurrentSize");
}

id objc_msgSend__updateForScrollViewLiveUserEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateForScrollViewLiveUserEvent");
}

id objc_msgSend__updateForScrollViewNonLiveUserEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateForScrollViewNonLiveUserEvent");
}

id objc_msgSend__updateForSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateForSize:");
}

id objc_msgSend__updateGestureDependencyPriority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateGestureDependencyPriority");
}

id objc_msgSend__updateGestures(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateGestures");
}

id objc_msgSend__updateInstructionLabelIfNecessaryAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateInstructionLabelIfNecessaryAnimated:");
}

id objc_msgSend__updateItemProvidersWithOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateItemProvidersWithOptions");
}

id objc_msgSend__updateLastScrollViewUnitRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLastScrollViewUnitRect");
}

id objc_msgSend__updateOverlayControllerForBeingActiveForScreenshotEditsSnapshotted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateOverlayControllerForBeingActiveForScreenshotEditsSnapshotted:");
}

id objc_msgSend__updatePaletteVisibilityIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePaletteVisibilityIfNecessary:");
}

id objc_msgSend__updatePropertiesOnManagedSubviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePropertiesOnManagedSubviews");
}

id objc_msgSend__updateScreenshotCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateScreenshotCount");
}

id objc_msgSend__updateScreenshotsViewTransform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateScreenshotsViewTransform");
}

id objc_msgSend__updateScrollPositionForCurrentPage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateScrollPositionForCurrentPage");
}

id objc_msgSend__updateScrollViewZoomScaleEndpoints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateScrollViewZoomScaleEndpoints");
}

id objc_msgSend__updateShadowViewAlpha(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateShadowViewAlpha");
}

id objc_msgSend__updateSubviewOrdering(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSubviewOrdering");
}

id objc_msgSend__updateThumbnailViewVisibilityIfNeededAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateThumbnailViewVisibilityIfNeededAnimated:");
}

id objc_msgSend__updateTopBarProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateTopBarProperties");
}

id objc_msgSend__updateUndoRedoEnabledState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateUndoRedoEnabledState");
}

id objc_msgSend__updateVisualSearchCornerViewPositioning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateVisualSearchCornerViewPositioning");
}

id objc_msgSend__viewForPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_viewForPage:");
}

id objc_msgSend__viewState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_viewState");
}

id objc_msgSend__viewsToHitTest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_viewsToHitTest");
}

id objc_msgSend__visionKitActivityItemIfAvailble(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_visionKitActivityItemIfAvailble");
}

id objc_msgSend__visualSearchCornerViewIfExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_visualSearchCornerViewIfExists");
}

id objc_msgSend__waitingContentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_waitingContentViewController");
}

id objc_msgSend__webViewPrintFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_webViewPrintFormatter");
}

id objc_msgSend__wk_pageCountForPrintFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_wk_pageCountForPrintFormatter:");
}

id objc_msgSend__wk_requestDocumentForPrintFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_wk_requestDocumentForPrintFormatter:");
}

id objc_msgSend__zoomTimerRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_zoomTimerRunning");
}

id objc_msgSend__zoomToRectWithinContentInsetBounds_scrollView_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_zoomToRectWithinContentInsetBounds:scrollView:animated:");
}

id objc_msgSend_aaButtonPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aaButtonPressed:");
}

id objc_msgSend_aaModeEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aaModeEnabled");
}

id objc_msgSend_acceptsTouches(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptsTouches");
}

id objc_msgSend_actionWithTitle_image_identifier_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:image:identifier:handler:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_active(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "active");
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeInterfaceOrientation");
}

id objc_msgSend_activeScreenshotView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeScreenshotView");
}

id objc_msgSend_activeScreenshotViewDidChangeToView_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeScreenshotViewDidChangeToView:fromView:");
}

id objc_msgSend_activeToolPickerForWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeToolPickerForWindow:");
}

id objc_msgSend_activityItemProviders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityItemProviders");
}

id objc_msgSend_activityItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityItems");
}

id objc_msgSend_activityItemsChangedForScreenshotsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityItemsChangedForScreenshotsView:");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityType");
}

id objc_msgSend_activityTypeOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityTypeOrder");
}

id objc_msgSend_activityViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityViewController");
}

id objc_msgSend_activityViewControllerDismissedFromScreenshotsViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityViewControllerDismissedFromScreenshotsViewController:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addAnimations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimations:");
}

id objc_msgSend_addArcWithCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addArcWithCenter:radius:startAngle:endAngle:clockwise:");
}

id objc_msgSend_addAttributes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttributes:range:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCompletion:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addImageIdentifierUpdateObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addImageIdentifierUpdateObserver:");
}

id objc_msgSend_addInteraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInteraction:");
}

id objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addKeyframeWithRelativeStartTime:relativeDuration:animations:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOrRemoveAAButtonIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOrRemoveAAButtonIfNecessary");
}

id objc_msgSend_addOrRemoveActionInfoViewIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOrRemoveActionInfoViewIfNecessary");
}

id objc_msgSend_addScreenshot_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addScreenshot:completion:");
}

id objc_msgSend_addScreenshotToGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addScreenshotToGroup:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addTarget_action_forEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forEvents:");
}

id objc_msgSend_addToRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addToRunLoop:forMode:");
}

id objc_msgSend_adjustPDFPositioningToMatchImageIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustPDFPositioningToMatchImageIfNecessary");
}

id objc_msgSend_adjustedTranslationForProposedRect_originalRect_scaledContentViewBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustedTranslationForProposedRect:originalRect:scaledContentViewBounds:");
}

id objc_msgSend_advanceScrollOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advanceScrollOffset");
}

id objc_msgSend_akController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "akController");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allowsBackdropGroups(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowsBackdropGroups");
}

id objc_msgSend_analysis(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analysis");
}

id objc_msgSend_analysisBarButtonItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analysisBarButtonItem");
}

id objc_msgSend_analysisButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analysisButton");
}

id objc_msgSend_analysisButtonImageForCurrentState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analysisButtonImageForCurrentState");
}

id objc_msgSend_analysisButtonPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analysisButtonPressed:");
}

id objc_msgSend_analysisHelperQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analysisHelperQueue");
}

id objc_msgSend_analysisModeEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analysisModeEnabled");
}

id objc_msgSend_analysisRequestID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analysisRequestID");
}

id objc_msgSend_analyzeCurrentImageIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyzeCurrentImageIfNecessary");
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_animateKeyframesWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateKeyframesWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_animateWithDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:");
}

id objc_msgSend_animationOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationOptions");
}

id objc_msgSend_animationReason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationReason");
}

id objc_msgSend_animationUsingParametersForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationUsingParametersForKeyPath:");
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_annotationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotationController");
}

id objc_msgSend_annotationDataFromAnnotations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotationDataFromAnnotations:");
}

id objc_msgSend_annotationKitController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotationKitController");
}

id objc_msgSend_annotationModeEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotationModeEnabled");
}

id objc_msgSend_annotationNSDatas(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotationNSDatas");
}

id objc_msgSend_annotationOverlayView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotationOverlayView");
}

id objc_msgSend_annotationWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotationWithData:");
}

id objc_msgSend_annotations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotations");
}

id objc_msgSend_annotationsDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotationsDidChange");
}

id objc_msgSend_annotationsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotationsEnabled");
}

id objc_msgSend_annotationsFromAnnotationData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotationsFromAnnotationData:");
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendPath:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appleInternalOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appleInternalOptions");
}

id objc_msgSend_applyTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyTransform:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithContentsOfFile:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_asImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asImage");
}

id objc_msgSend_assetMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetMetadata");
}

id objc_msgSend_associateScreenshotImages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associateScreenshotImages:");
}

id objc_msgSend_availableRectForFullscreenContent_layoutBounds_bleedToBottom_topBarHeight_bottomBarHeight_userInterfaceIdiom_multipleScreenshots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availableRectForFullscreenContent:layoutBounds:bleedToBottom:topBarHeight:bottomBarHeight:userInterfaceIdiom:multipleScreenshots:");
}

id objc_msgSend_backgroundBlurEffectStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundBlurEffectStyle");
}

id objc_msgSend_backingImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backingImage");
}

id objc_msgSend_barSeparatorSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "barSeparatorSize");
}

id objc_msgSend_becomeCurrent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "becomeCurrent");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_becomeParentOfDittoRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "becomeParentOfDittoRootViewController:");
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "begin");
}

id objc_msgSend_beginLogging_documentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginLogging:documentType:");
}

id objc_msgSend_betaApplicationBundleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "betaApplicationBundleID");
}

id objc_msgSend_betaApplicationName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "betaApplicationName");
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPath");
}

id objc_msgSend_bezierPathWithCGPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithCGPath:");
}

id objc_msgSend_bezierPathWithRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithRect:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blackColor");
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "block");
}

id objc_msgSend_blockToRunForAddScreenshotsButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blockToRunForAddScreenshotsButton");
}

id objc_msgSend_blueColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blueColor");
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_borderColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "borderColor");
}

id objc_msgSend_borderStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "borderStyle");
}

id objc_msgSend_borderWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "borderWidth");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_boundsForBox_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boundsForBox:");
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_cachedCGImageBackedUneditedImageForUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedCGImageBackedUneditedImageForUI");
}

id objc_msgSend_cachedOutputImageView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedOutputImageView");
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calendarWithIdentifier:");
}

id objc_msgSend_canAutosaveToFiles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canAutosaveToFiles");
}

id objc_msgSend_canGenerateDocument(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canGenerateDocument");
}

id objc_msgSend_canRedo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canRedo");
}

id objc_msgSend_canRedoForViewState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canRedoForViewState:");
}

id objc_msgSend_canUndo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canUndo");
}

id objc_msgSend_canUndoForViewState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canUndoForViewState:");
}

id objc_msgSend_cancelCrop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelCrop");
}

id objc_msgSend_cancelRequestID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelRequestID:");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "center");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_changeObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeObserver");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_cleanupRootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupRootViewController");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearColor");
}

id objc_msgSend_clearImageAnalysisTextSelection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearImageAnalysisTextSelection");
}

id objc_msgSend_closePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closePath");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "color");
}

id objc_msgSend_colorAlpha(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorAlpha");
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_colorWithCGColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithCGColor:");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_commandWithTitle_image_action_propertyList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandWithTitle:image:action:propertyList:");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commit");
}

id objc_msgSend_commitEditing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitEditing");
}

id objc_msgSend_commitInflightEdits(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitInflightEdits");
}

id objc_msgSend_commitInflightEditsIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitInflightEditsIfNecessary");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_configurationWithScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithScale:");
}

id objc_msgSend_configurationWithTextStyle_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithTextStyle:scale:");
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

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:");
}

id objc_msgSend_constraintLessThanOrEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToConstant:");
}

id objc_msgSend_containerViewController_didTransitionToState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewController:didTransitionToState:");
}

id objc_msgSend_containerViewController_willBeginDismissAnimationWithSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewController:willBeginDismissAnimationWithSettings:");
}

id objc_msgSend_containerViewController_willShowSharingUIWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewController:willShowSharingUIWithBlock:");
}

id objc_msgSend_containerViewController_willShowTestFlightUIWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewController:willShowTestFlightUIWithBlock:");
}

id objc_msgSend_containerViewController_willTransitionToState_animated_changeBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewController:willTransitionToState:animated:changeBlock:");
}

id objc_msgSend_containerViewControllerBeganDragAndDrop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewControllerBeganDragAndDrop:");
}

id objc_msgSend_containerViewControllerBeganShowingWaitingForImageIdentifierUpdatesUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewControllerBeganShowingWaitingForImageIdentifierUpdatesUI:");
}

id objc_msgSend_containerViewControllerDidEndDismissAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewControllerDidEndDismissAnimation:");
}

id objc_msgSend_containerViewControllerEndedDragAndDrop_shouldDismiss_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewControllerEndedDragAndDrop:shouldDismiss:");
}

id objc_msgSend_containerViewControllerEndedShowingSharingUI_inStateTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewControllerEndedShowingSharingUI:inStateTransition:");
}

id objc_msgSend_containerViewControllerEndedShowingWaitingForImageIdentifierUpdatesUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewControllerEndedShowingWaitingForImageIdentifierUpdatesUI:");
}

id objc_msgSend_containerViewControllerHadGestureInteraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewControllerHadGestureInteraction:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsView:");
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentInset");
}

id objc_msgSend_contentInsetRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentInsetRect");
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentOffset");
}

id objc_msgSend_contentRects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentRects");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentSize");
}

id objc_msgSend_contentSnapshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentSnapshot");
}

id objc_msgSend_contentSwitcherPadding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentSwitcherPadding");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentView");
}

id objc_msgSend_controllerWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controllerWithDelegate:");
}

id objc_msgSend_convertPoint_fromCoordinateSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:fromCoordinateSpace:");
}

id objc_msgSend_convertPoint_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:fromView:");
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:toView:");
}

id objc_msgSend_convertRect_fromCoordinateSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:fromCoordinateSpace:");
}

id objc_msgSend_convertRect_fromPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:fromPage:");
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:fromView:");
}

id objc_msgSend_convertRect_fromWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:fromWindow:");
}

id objc_msgSend_convertRect_toCoordinateSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:toCoordinateSpace:");
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:toView:");
}

id objc_msgSend_convertRect_toWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:toWindow:");
}

id objc_msgSend_convertRectToPageViewSpace_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRectToPageViewSpace:fromView:");
}

id objc_msgSend_convertSize_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertSize:fromView:");
}

id objc_msgSend_coordinateSpace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coordinateSpace");
}

id objc_msgSend_coordinateWritingItemAtURL_options_error_byAccessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coordinateWritingItemAtURL:options:error:byAccessor:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_corner(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "corner");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfDataDetectorsWithTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfDataDetectorsWithTypes:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDittoRootViewControllerIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDittoRootViewControllerIfNecessary");
}

id objc_msgSend_createFeedbackViewControllerForCurrentState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFeedbackViewControllerForCurrentState");
}

id objc_msgSend_createFixedSpaceBarButtonItemWithWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFixedSpaceBarButtonItemWithWidth:");
}

id objc_msgSend_createMiniMapView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createMiniMapView");
}

id objc_msgSend_createScreenshotWithEnvironmentDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createScreenshotWithEnvironmentDescription:");
}

id objc_msgSend_createThumbnailView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createThumbnailView");
}

id objc_msgSend_createUndoMenu(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createUndoMenu");
}

id objc_msgSend_cropController_changedToCropRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cropController:changedToCropRect:");
}

id objc_msgSend_cropControllerCropRectDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cropControllerCropRectDidChange:");
}

id objc_msgSend_cropControllerDidBeginCropping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cropControllerDidBeginCropping:");
}

id objc_msgSend_cropControllerDidUpdateScrollView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cropControllerDidUpdateScrollView:");
}

id objc_msgSend_cropControllerDidZoomInScrollView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cropControllerDidZoomInScrollView:");
}

id objc_msgSend_cropControllerRootView_changedToCropRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cropControllerRootView:changedToCropRect:");
}

id objc_msgSend_cropControllerRootViewWillBeginChangingCropRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cropControllerRootViewWillBeginChangingCropRect:");
}

id objc_msgSend_cropDidChangeForScreenshotView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cropDidChangeForScreenshotView:");
}

id objc_msgSend_cropEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cropEnabled");
}

id objc_msgSend_cropHandle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cropHandle");
}

id objc_msgSend_cropHandlesFadedOut(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cropHandlesFadedOut");
}

id objc_msgSend_cropInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cropInfo");
}

id objc_msgSend_cropOverlayViewRectInWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cropOverlayViewRectInWindow");
}

id objc_msgSend_cropRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cropRect");
}

id objc_msgSend_cropView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cropView");
}

id objc_msgSend_currentCropController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentCropController");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentImageAnalysis(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentImageAnalysis");
}

id objc_msgSend_currentInProcessRequestID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentInProcessRequestID");
}

id objc_msgSend_currentLiveTextBarButtonItemIfExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentLiveTextBarButtonItemIfExists");
}

id objc_msgSend_currentPDFPage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPDFPage");
}

id objc_msgSend_currentPDFView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPDFView");
}

id objc_msgSend_currentPage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPage");
}

id objc_msgSend_currentScreenshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentScreenshot");
}

id objc_msgSend_currentScreenshotCropHandlesFadedOut(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentScreenshotCropHandlesFadedOut");
}

id objc_msgSend_currentScreenshotView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentScreenshotView");
}

id objc_msgSend_currentView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentView");
}

id objc_msgSend_customLayoutActionInfoView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customLayoutActionInfoView");
}

id objc_msgSend_darkGrayColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "darkGrayColor");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "data");
}

id objc_msgSend_dataRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataRepresentation");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateFormatFromTemplate_options_locale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFormatFromTemplate:options:locale:");
}

id objc_msgSend_debugView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugView");
}

id objc_msgSend_defaultBarButtonSpacing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultBarButtonSpacing");
}

id objc_msgSend_defaultBarButtonWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultBarButtonWidth");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_delay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delay");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_deletePDFPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletePDFPage:");
}

id objc_msgSend_deliveryCompletionBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliveryCompletionBlock");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_deselectAllAnnotations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectAllAnnotations");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didAccidentallyDraw(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didAccidentallyDraw");
}

id objc_msgSend_didChangeOpacityOnFullPage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeOpacityOnFullPage");
}

id objc_msgSend_didChangeOpacityOnNormalScreenshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeOpacityOnNormalScreenshot");
}

id objc_msgSend_didChangeRenameOption(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeRenameOption");
}

id objc_msgSend_didChangeShareOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeShareOptions");
}

id objc_msgSend_didCopyDeleteScreenshots(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didCopyDeleteScreenshots");
}

id objc_msgSend_didCropInFullPageMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didCropInFullPageMode");
}

id objc_msgSend_didCropInNormalMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didCropInNormalMode");
}

id objc_msgSend_didDeleteScreenshots(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDeleteScreenshots");
}

id objc_msgSend_didDrawPenStroke(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDrawPenStroke");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_didProcessDocumentUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didProcessDocumentUpdate");
}

id objc_msgSend_didProcessDocumentUpdateForScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didProcessDocumentUpdateForScreenshot:");
}

id objc_msgSend_didRenameScreenshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didRenameScreenshot");
}

id objc_msgSend_didSaveFullPagePDFToFiles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSaveFullPagePDFToFiles");
}

id objc_msgSend_didSaveImageToFiles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSaveImageToFiles");
}

id objc_msgSend_didSaveImageToPhotos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSaveImageToPhotos");
}

id objc_msgSend_didSaveImageToQuickNote(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSaveImageToQuickNote");
}

id objc_msgSend_didSaveMixedAllToFiles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSaveMixedAllToFiles");
}

id objc_msgSend_didSaveMixedToPhotosAndFiles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSaveMixedToPhotosAndFiles");
}

id objc_msgSend_didSaveMixedToQuickNoteAndFiles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSaveMixedToQuickNoteAndFiles");
}

id objc_msgSend_didSavePDFImageToPhotos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSavePDFImageToPhotos");
}

id objc_msgSend_didShareFullPageMixedScreenshots(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didShareFullPageMixedScreenshots");
}

id objc_msgSend_didShareFullPageScreenshotAsAutomaticImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didShareFullPageScreenshotAsAutomaticImage");
}

id objc_msgSend_didShareFullPageScreenshotAsAutomaticPDF(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didShareFullPageScreenshotAsAutomaticPDF");
}

id objc_msgSend_didShareFullPageScreenshotAsImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didShareFullPageScreenshotAsImage");
}

id objc_msgSend_didShareFullPageScreenshotAsPDF(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didShareFullPageScreenshotAsPDF");
}

id objc_msgSend_didShareScreenMultipleScreenshots(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didShareScreenMultipleScreenshots");
}

id objc_msgSend_didShareScreenSingleScreenshots(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didShareScreenSingleScreenshots");
}

id objc_msgSend_didSubmitFeedbackWithAnnotationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSubmitFeedbackWithAnnotationCount:");
}

id objc_msgSend_didTapBetaFeedbackButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didTapBetaFeedbackButton");
}

id objc_msgSend_didTapFullPageSegment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didTapFullPageSegment");
}

id objc_msgSend_didTapOpacityOptionWithAttributeView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didTapOpacityOptionWithAttributeView:");
}

id objc_msgSend_disableAnimation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableAnimation");
}

id objc_msgSend_discoverabilitySignal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverabilitySignal");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissActivityViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissActivityViewController");
}

id objc_msgSend_dismissOverlayManagedViewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissOverlayManagedViewControllers");
}

id objc_msgSend_dismissPresentedPopovers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissPresentedPopovers");
}

id objc_msgSend_dismissRequestedFromScreenshotsViewController_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissRequestedFromScreenshotsViewController:completion:");
}

id objc_msgSend_dismissScreenshots(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissScreenshots");
}

id objc_msgSend_dismissScreenshotsAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissScreenshotsAnimated:completion:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayCornerRadius(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayCornerRadius");
}

id objc_msgSend_displayLinkObserverHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayLinkObserverHandler");
}

id objc_msgSend_displayLinkWithTarget_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayLinkWithTarget:selector:");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayName");
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayScale");
}

id objc_msgSend_dittoDebugView_requestsPresentationOfViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dittoDebugView:requestsPresentationOfViewController:");
}

id objc_msgSend_dittoDismissTimerFired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dittoDismissTimerFired:");
}

id objc_msgSend_dittoRemoteAlertViewControllerViewWillAppear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dittoRemoteAlertViewControllerViewWillAppear:");
}

id objc_msgSend_dittoRootViewController_didTransitionToState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dittoRootViewController:didTransitionToState:");
}

id objc_msgSend_dittoRootViewController_wantsBackground_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dittoRootViewController:wantsBackground:duration:");
}

id objc_msgSend_dittoRootViewController_willShowShowSharingUIWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dittoRootViewController:willShowShowSharingUIWithBlock:");
}

id objc_msgSend_dittoRootViewController_willShowTestFlightUIWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dittoRootViewController:willShowTestFlightUIWithBlock:");
}

id objc_msgSend_dittoRootViewController_willTransitionToState_changeBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dittoRootViewController:willTransitionToState:changeBlock:");
}

id objc_msgSend_dittoRootViewControllerDidDismiss_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dittoRootViewControllerDidDismiss:");
}

id objc_msgSend_dittoRootViewControllerFinishedShowingSharingUI_inStateTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dittoRootViewControllerFinishedShowingSharingUI:inStateTransition:");
}

id objc_msgSend_document(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "document");
}

id objc_msgSend_documentFromPDFData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "documentFromPDFData:");
}

id objc_msgSend_documentGenerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "documentGenerator");
}

id objc_msgSend_documentScrollView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "documentScrollView");
}

id objc_msgSend_documentView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "documentView");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_doneCrop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doneCrop");
}

id objc_msgSend_doubleTapGestureRecognizer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleTapGestureRecognizer");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_dragAnimating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragAnimating");
}

id objc_msgSend_dragItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragItems");
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawInRect:");
}

id objc_msgSend_drawViewHierarchyInRect_afterScreenUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawViewHierarchyInRect:afterScreenUpdates:");
}

id objc_msgSend_drawWithBox_inContext_isThumbnail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawWithBox:inContext:isThumbnail:");
}

id objc_msgSend_drawing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawing");
}

id objc_msgSend_drawingBounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawingBounds");
}

id objc_msgSend_drawingGestureRecognizer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawingGestureRecognizer");
}

id objc_msgSend_drewStrokes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drewStrokes:");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "duration");
}

id objc_msgSend_edge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "edge");
}

id objc_msgSend_editMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editMode");
}

id objc_msgSend_editedPDFDataForShareSheet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editedPDFDataForShareSheet");
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection");
}

id objc_msgSend_elementWithUncachedProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elementWithUncachedProvider:");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elements");
}

id objc_msgSend_enableAnimation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableAnimation");
}

id objc_msgSend_endAnnotationEditing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endAnnotationEditing");
}

id objc_msgSend_endCropTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endCropTimestamp");
}

id objc_msgSend_endLogging(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endLogging");
}

id objc_msgSend_endOpacityEditing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endOpacityEditing");
}

id objc_msgSend_endedEditing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endedEditing");
}

id objc_msgSend_enterCrop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enterCrop");
}

id objc_msgSend_enterCropMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enterCropMode");
}

id objc_msgSend_enterMarkupMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enterMarkupMode");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_environmentDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "environmentDescription");
}

id objc_msgSend_environmentDescriptionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "environmentDescriptionIdentifier");
}

id objc_msgSend_environmentDescriptionIdentifiersBeingRemoved(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "environmentDescriptionIdentifiersBeingRemoved");
}

id objc_msgSend_environmentDescriptionIdentifiersBeingSaved(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "environmentDescriptionIdentifiersBeingSaved");
}

id objc_msgSend_environmentDescriptionIdentifiersBeingTracked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "environmentDescriptionIdentifiersBeingTracked");
}

id objc_msgSend_environmentDescriptionIdentifiersInActiveDragSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "environmentDescriptionIdentifiersInActiveDragSession");
}

id objc_msgSend_environmentDescriptionIdentifiersUIIsInterestedIn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "environmentDescriptionIdentifiersUIIsInterestedIn");
}

id objc_msgSend_environmentElementIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "environmentElementIdentifier");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_expectedAnimationDurationForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expectedAnimationDurationForStyle:");
}

id objc_msgSend_extent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extent");
}

id objc_msgSend_externalFlashLayerContextID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "externalFlashLayerContextID");
}

id objc_msgSend_externalFlashLayerRenderID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "externalFlashLayerRenderID");
}

id objc_msgSend_feedbackActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedbackActivity");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filename");
}

id objc_msgSend_fillColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fillColor");
}

id objc_msgSend_filledInfoButtonGlyphName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filledInfoButtonGlyphName");
}

id objc_msgSend_filter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filter");
}

id objc_msgSend_finishLoadingScreenshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishLoadingScreenshot");
}

id objc_msgSend_finishPreparingForFullscreenExperience(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishPreparingForFullscreenExperience");
}

id objc_msgSend_finishedIPTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedIPTest:");
}

id objc_msgSend_finishedTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedTest:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstResponder");
}

id objc_msgSend_fixedSpaceItemOfWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fixedSpaceItemOfWidth:");
}

id objc_msgSend_flash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flash");
}

id objc_msgSend_flashStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flashStyle");
}

id objc_msgSend_flashViewForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flashViewForStyle:");
}

id objc_msgSend_flashWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flashWithCompletion:");
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "font");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_forceHideRuler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceHideRuler");
}

id objc_msgSend_formUnionWithCharacterSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formUnionWithCharacterSet:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frame");
}

id objc_msgSend_fullscreenExperienceHadCropEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fullscreenExperienceHadCropEvent");
}

id objc_msgSend_fullscreenifyWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fullscreenifyWithCompletion:");
}

id objc_msgSend_generalPasteboard(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generalPasteboard");
}

id objc_msgSend_generateImageForScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateImageForScreenshot:");
}

id objc_msgSend_generatePDF_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePDF:");
}

id objc_msgSend_generateSnapshotImageIfNecessary_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateSnapshotImageIfNecessary:withCompletion:");
}

id objc_msgSend_geometryMultiplier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "geometryMultiplier");
}

id objc_msgSend_gestureRecognizers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gestureRecognizers");
}

id objc_msgSend_gesturesEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gesturesEnabled");
}

id objc_msgSend_goToPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "goToPage:");
}

id objc_msgSend_grabPositionForLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "grabPositionForLocation:");
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "grayColor");
}

id objc_msgSend_greenColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "greenColor");
}

id objc_msgSend_groupImageIdentifierUpdateTrackerChangedProgressTowardsReceivingAllImageIdentifierUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupImageIdentifierUpdateTrackerChangedProgressTowardsReceivingAllImageIdentifierUpdates:");
}

id objc_msgSend_groupImageIdentifierUpdateTrackerDidReceiveNewScreenshotIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupImageIdentifierUpdateTrackerDidReceiveNewScreenshotIdentifier:");
}

id objc_msgSend_harvestedMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "harvestedMetadata");
}

id objc_msgSend_hasChangedBackingImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasChangedBackingImage");
}

id objc_msgSend_hasEverBeenEditedForMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasEverBeenEditedForMode:");
}

id objc_msgSend_hasKeyboardFocus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasKeyboardFocus");
}

id objc_msgSend_hasOnenessScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasOnenessScreen");
}

id objc_msgSend_hasResultsForAnalysisTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasResultsForAnalysisTypes:");
}

id objc_msgSend_hasUnsavedImageEdits(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasUnsavedImageEdits");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_hidesSourceLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hidesSourceLayer");
}

id objc_msgSend_highQualityImageQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "highQualityImageQueue");
}

id objc_msgSend_highQualityQueueHasBeenResumed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "highQualityQueueHasBeenResumed");
}

id objc_msgSend_highQualityQueueIsValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "highQualityQueueIsValid");
}

id objc_msgSend_highlightSelectableItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "highlightSelectableItems");
}

id objc_msgSend_hitTest_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hitTest:withEvent:");
}

id objc_msgSend_hitTestsUsingSubviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hitTestsUsingSubviews");
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalSizeClass");
}

id objc_msgSend_hostingViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hostingViewController");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "image");
}

id objc_msgSend_imageAnalyzer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageAnalyzer");
}

id objc_msgSend_imageDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageDescription");
}

id objc_msgSend_imageGenerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageGenerator");
}

id objc_msgSend_imageIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageIdentifier");
}

id objc_msgSend_imageInteraction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageInteraction");
}

id objc_msgSend_imageItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageItems");
}

id objc_msgSend_imageOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageOrientation");
}

id objc_msgSend_imagePixelSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imagePixelSize");
}

id objc_msgSend_imagePointSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imagePointSize");
}

id objc_msgSend_imageProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageProvider");
}

id objc_msgSend_imageScale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageScale");
}

id objc_msgSend_imageSurface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageSurface");
}

id objc_msgSend_imageView_requestsUpdateToInteractionMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageView:requestsUpdateToInteractionMode:");
}

id objc_msgSend_imageView_startEditingOpacityInAccessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageView:startEditingOpacityInAccessoryView:");
}

id objc_msgSend_imageViewDidLoadImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageViewDidLoadImage:");
}

id objc_msgSend_imageViewDidUpdateInteraction_withAnalysis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageViewDidUpdateInteraction:withAnalysis:");
}

id objc_msgSend_imageViewOverlayViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageViewOverlayViewController:");
}

id objc_msgSend_imageWithActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithActions:");
}

id objc_msgSend_imageWithBox_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithBox:");
}

id objc_msgSend_imageWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithCGImage:scale:orientation:");
}

id objc_msgSend_imageWithPreviouslyRegisteredIdentifier_withAccessBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithPreviouslyRegisteredIdentifier:withAccessBlock:");
}

id objc_msgSend_imageWithSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithSymbolConfiguration:");
}

id objc_msgSend_inDragAndDrop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inDragAndDrop");
}

id objc_msgSend_inStateTransition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inStateTransition");
}

id objc_msgSend_includedActivityTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "includedActivityTypes");
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "index");
}

id objc_msgSend_indexForPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexForPage:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "info");
}

id objc_msgSend_infoButtonGlyphName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infoButtonGlyphName");
}

id objc_msgSend_informHostThatScreenshotsHaveDismissed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "informHostThatScreenshotsHaveDismissed");
}

id objc_msgSend_inhibitImageAnalysis(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inhibitImageAnalysis");
}

id objc_msgSend_initForContext_betaApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForContext:betaApplicationIdentifier:");
}

id objc_msgSend_initForCorner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForCorner:");
}

id objc_msgSend_initForExportingURLs_asCopy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForExportingURLs:asCopy:");
}

id objc_msgSend_initForScreenshotWithEnvironmentDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForScreenshotWithEnvironmentDescription:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithActivityItems_applicationActivities_editMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityItems:applicationActivities:editMode:");
}

id objc_msgSend_initWithBarButtonSystemItem_menu_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:menu:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBlock:");
}

id objc_msgSend_initWithCGImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCGImage:");
}

id objc_msgSend_initWithContainer_center_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainer:center:");
}

id objc_msgSend_initWithContainer_center_transform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainer:center:transform:");
}

id objc_msgSend_initWithContentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentView:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithControlPoint1_controlPoint2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithControlPoint1:controlPoint2:");
}

id objc_msgSend_initWithControlPoints__::(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithControlPoints::::");
}

id objc_msgSend_initWithCustomView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCustomView:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDuration_timingParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDuration:timingParameters:");
}

id objc_msgSend_initWithEdge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEdge:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithEnvironmentDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnvironmentDescription:");
}

id objc_msgSend_initWithFilePresenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFilePresenter:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithIdentifier_bundleID_context_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:bundleID:context:userInfo:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithImage_orientation_requestType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:orientation:requestType:");
}

id objc_msgSend_initWithItem_typeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItem:typeIdentifier:");
}

id objc_msgSend_initWithItemProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItemProvider:");
}

id objc_msgSend_initWithItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItems:");
}

id objc_msgSend_initWithMass_stiffness_damping_initialVelocity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMass:stiffness:damping:initialVelocity:");
}

id objc_msgSend_initWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObject:");
}

id objc_msgSend_initWithPlatformImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlatformImage:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithScreenshot:");
}

id objc_msgSend_initWithScreenshot_deliveryCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithScreenshot:deliveryCompletionBlock:");
}

id objc_msgSend_initWithScrollView_visibleRectInScrollView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithScrollView:visibleRectInScrollView:");
}

id objc_msgSend_initWithScrollViewRect_contentInsetRect_visibleRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithScrollViewRect:contentInsetRect:visibleRect:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initWithSize_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:format:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithTestName_scrollView_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTestName:scrollView:completionHandler:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_initWithView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithView:");
}

id objc_msgSend_initWithView_parameters_target_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithView:parameters:target:");
}

id objc_msgSend_initialAnnotationMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initialAnnotationMode");
}

id objc_msgSend_initiateFeedbackSnapshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initiateFeedbackSnapshot");
}

id objc_msgSend_insertImagesData_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertImagesData:completion:");
}

id objc_msgSend_insertIntoQuickNoteWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertIntoQuickNoteWithCompletion:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertPage_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertPage:atIndex:");
}

id objc_msgSend_insertSubview_aboveSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:aboveSubview:");
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:atIndex:");
}

id objc_msgSend_insertSubview_belowSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:belowSubview:");
}

id objc_msgSend_installInterstitialGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installInterstitialGesture:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_integralDrawingBounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integralDrawingBounds");
}

id objc_msgSend_interactionMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interactionMode");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intrinsicContentSize");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateIntrinsicContentSize");
}

id objc_msgSend_isAppLauncher(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAppLauncher");
}

id objc_msgSend_isBeingDismissed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBeingDismissed");
}

id objc_msgSend_isBeingRemoved(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBeingRemoved");
}

id objc_msgSend_isCropped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCropped");
}

id objc_msgSend_isDecelerating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDecelerating");
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeleted");
}

id objc_msgSend_isDragging(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDragging");
}

id objc_msgSend_isDraggingVisibleRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDraggingVisibleRect");
}

id objc_msgSend_isEnabledByDefault(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabledByDefault");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFirstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFirstResponder");
}

id objc_msgSend_isInProgrammaticCall(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInProgrammaticCall");
}

id objc_msgSend_isLostModeActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLostModeActive");
}

id objc_msgSend_isMoving(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMoving");
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOn");
}

id objc_msgSend_isOverlayViewLoadedAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOverlayViewLoadedAtIndex:");
}

id objc_msgSend_isPerformingFullscreenSetup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPerformingFullscreenSetup");
}

id objc_msgSend_isRecapAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRecapAvailable");
}

id objc_msgSend_isSaving(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSaving");
}

id objc_msgSend_isSavingForMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSavingForMode:");
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSelected");
}

id objc_msgSend_isSharing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSharing");
}

id objc_msgSend_isSharingMixedScreenshots(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSharingMixedScreenshots");
}

id objc_msgSend_isSharingMultipleScreenScreenshots(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSharingMultipleScreenScreenshots");
}

id objc_msgSend_isSharingSingleFullPageScreenshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSharingSingleFullPageScreenshot");
}

id objc_msgSend_isSharingSingleFullPageScreenshotAsImageUsingAutomatic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSharingSingleFullPageScreenshotAsImageUsingAutomatic");
}

id objc_msgSend_isSharingSingleFullPageScreenshotAsPDFUsingAutomatic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSharingSingleFullPageScreenshotAsPDFUsingAutomatic");
}

id objc_msgSend_isSharingSingleScreenScreenshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSharingSingleScreenScreenshot");
}

id objc_msgSend_isShowingDeleteConfirmation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isShowingDeleteConfirmation");
}

id objc_msgSend_isShowingDoneActionSheet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isShowingDoneActionSheet");
}

id objc_msgSend_isShowingModalUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isShowingModalUI");
}

id objc_msgSend_isShowingThumbnailOptionView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isShowingThumbnailOptionView");
}

id objc_msgSend_isTracking(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTracking");
}

id objc_msgSend_isTransitioningStates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTransitioningStates");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValid");
}

id objc_msgSend_isWaitingForPDF(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWaitingForPDF");
}

id objc_msgSend_isZoomBouncing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isZoomBouncing");
}

id objc_msgSend_isZooming(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isZooming");
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "item");
}

id objc_msgSend_itemProviderForDragItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemProviderForDragItems");
}

id objc_msgSend_itemProviderImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemProviderImage");
}

id objc_msgSend_itemProviderPDF(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemProviderPDF");
}

id objc_msgSend_itemProviderPDFAsImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemProviderPDFAsImage");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "items");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastViewEditMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastViewEditMode");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutDocumentView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutDocumentView");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_layoutRectsByApplyingTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutRectsByApplyingTransform:");
}

id objc_msgSend_layoutRectsByConvertingFromView_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutRectsByConvertingFromView:toView:");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leftAnchor");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_loadRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadRequest:");
}

id objc_msgSend_loadScreenshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadScreenshot");
}

id objc_msgSend_loadedView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadedView");
}

id objc_msgSend_localObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localObject");
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringFromDate_dateStyle_timeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringFromDate:dateStyle:timeStyle:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationInView:");
}

id objc_msgSend_logDidEndEditingWithOverlay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logDidEndEditingWithOverlay");
}

id objc_msgSend_logDidEnterEditingWithOverlay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logDidEnterEditingWithOverlay");
}

id objc_msgSend_logTotalAnnotations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logTotalAnnotations:");
}

id objc_msgSend_loggableDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loggableDescription");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_managedView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedView");
}

id objc_msgSend_matchesOpacity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchesOpacity");
}

id objc_msgSend_matchesPosition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchesPosition");
}

id objc_msgSend_matchesTransform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchesTransform");
}

id objc_msgSend_maximumZoomScale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumZoomScale");
}

id objc_msgSend_menuWithChildren_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuWithChildren:");
}

id objc_msgSend_menuWithTitle_image_identifier_options_children_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuWithTitle:image:identifier:options:children:");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadata");
}

id objc_msgSend_minimumZoomScale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minimumZoomScale");
}

id objc_msgSend_modelController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelController");
}

id objc_msgSend_modelModificationInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelModificationInfo");
}

id objc_msgSend_modelModificationInfoForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelModificationInfoForState:");
}

id objc_msgSend_modificationInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modificationInfo");
}

id objc_msgSend_modifiedImageDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modifiedImageDescription");
}

id objc_msgSend_moveFromRemoteAlertViewControllerToRemoteViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveFromRemoteAlertViewControllerToRemoteViewController");
}

id objc_msgSend_moveFromRemoteViewControllerToRemoteAlertViewControllerExecutingChangeBlockWhenReady_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveFromRemoteViewControllerToRemoteAlertViewControllerExecutingChangeBlockWhenReady:");
}

id objc_msgSend_moveToPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveToPoint:");
}

id objc_msgSend_mutableArrayValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableArrayValueForKey:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_nameForScreenshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nameForScreenshot");
}

id objc_msgSend_nameForScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nameForScreenshot:");
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationBar");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_newPageUndoObjectWithPDFPage_index_modificationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newPageUndoObjectWithPDFPage:index:modificationInfo:");
}

id objc_msgSend_newScreenshotReceived(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newScreenshotReceived");
}

id objc_msgSend_newTestScreenshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newTestScreenshot");
}

id objc_msgSend_newWaitingForImageIdentifierUpdatesAlertController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newWaitingForImageIdentifierUpdatesAlertController");
}

id objc_msgSend_notifyScrollViewChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyScrollViewChanged:");
}

id objc_msgSend_notifyZoomScaleChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyZoomScaleChanged:");
}

id objc_msgSend_numberOfRequiredScreenshots(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfRequiredScreenshots");
}

id objc_msgSend_numberOfScreenshotImages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfScreenshotImages");
}

id objc_msgSend_numberOfScreenshots(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfScreenshots");
}

id objc_msgSend_numberOfScreenshotsToAdd(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfScreenshotsToAdd");
}

id objc_msgSend_numberOfTouchesRequiredForPanningCrop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfTouchesRequiredForPanningCrop");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "object");
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

id objc_msgSend_objectForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForSetting:");
}

id objc_msgSend_onlyDrawWithApplePencil(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onlyDrawWithApplePencil");
}

id objc_msgSend_openURL_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:options:completionHandler:");
}

id objc_msgSend_orangeColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orangeColor");
}

id objc_msgSend_originalAnnotations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "originalAnnotations");
}

id objc_msgSend_overlayController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overlayController");
}

id objc_msgSend_overlayView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overlayView");
}

id objc_msgSend_overlayViewAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overlayViewAtIndex:");
}

id objc_msgSend_page(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "page");
}

id objc_msgSend_pageAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pageAtIndex:");
}

id objc_msgSend_pageBreakMargins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pageBreakMargins");
}

id objc_msgSend_pageCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pageCount");
}

id objc_msgSend_pageImageForSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pageImageForSize:");
}

id objc_msgSend_pageModelController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pageModelController");
}

id objc_msgSend_pageModelControllerForPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pageModelControllerForPage:");
}

id objc_msgSend_pageView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pageView");
}

id objc_msgSend_pageViewForPageAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pageViewForPageAtIndex:");
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "panGestureRecognizer");
}

id objc_msgSend_paperKitChangeCounter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "paperKitChangeCounter");
}

id objc_msgSend_paperKitImageView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "paperKitImageView");
}

id objc_msgSend_paperRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "paperRect");
}

id objc_msgSend_parentScreenshotView_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parentScreenshotView:animated:");
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parentViewController");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pdfAsImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdfAsImage");
}

id objc_msgSend_pdfCanBeConvertedToImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdfCanBeConvertedToImage");
}

id objc_msgSend_pdfData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdfData");
}

id objc_msgSend_pdfPage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdfPage");
}

id objc_msgSend_pdfView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdfView");
}

id objc_msgSend_pdfView_startEditingOpacityInAccessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdfView:startEditingOpacityInAccessoryView:");
}

id objc_msgSend_pdfViewOverlayViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdfViewOverlayViewController:");
}

id objc_msgSend_performInteractiveGesturePresentationCompleteAnimations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performInteractiveGesturePresentationCompleteAnimations");
}

id objc_msgSend_performSystemAnimation_onViews_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSystemAnimation:onViews:options:animations:completion:");
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithoutAnimation:");
}

id objc_msgSend_performingDismissAnimation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performingDismissAnimation");
}

id objc_msgSend_pickerCustomizationWithIdentifier_options_selectedOptionIndex_footerText_valueChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pickerCustomizationWithIdentifier:options:selectedOptionIndex:footerText:valueChangedHandler:");
}

id objc_msgSend_pinchGestureRecognizer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pinchGestureRecognizer");
}

id objc_msgSend_pipDragEndedSuccessfully(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pipDragEndedSuccessfully");
}

id objc_msgSend_pipExpanded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pipExpanded");
}

id objc_msgSend_pipSlidOffscreenDueToTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pipSlidOffscreenDueToTimeout");
}

id objc_msgSend_pipifyWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pipifyWithCompletion:");
}

id objc_msgSend_placeholderItemForScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeholderItemForScreenshot:");
}

id objc_msgSend_playScreenshotSound(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playScreenshotSound");
}

id objc_msgSend_pointCanPassthrough_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointCanPassthrough:");
}

id objc_msgSend_pointInside_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointInside:withEvent:");
}

id objc_msgSend_popNavigationItemAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popNavigationItemAnimated:");
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popoverPresentationController");
}

id objc_msgSend_popoverPresentingViewControllerForAnnotationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popoverPresentingViewControllerForAnnotationController:");
}

id objc_msgSend_portalLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "portalLayer");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_potentiallyLowQualityImageQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "potentiallyLowQualityImageQueue");
}

id objc_msgSend_preferredDimension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredDimension");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_preferredOtherDimension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredOtherDimension");
}

id objc_msgSend_preferredWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredWidth");
}

id objc_msgSend_preheatWithPresentationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preheatWithPresentationMode:");
}

id objc_msgSend_prepare(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepare");
}

id objc_msgSend_prepareForDebugging(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForDebugging");
}

id objc_msgSend_prepareForFullscreenExperience(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForFullscreenExperience");
}

id objc_msgSend_prepareForFullscreenExperience_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForFullscreenExperience:");
}

id objc_msgSend_prepareForMiniaturization(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForMiniaturization");
}

id objc_msgSend_prepareOverlayAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareOverlayAtIndex:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentationMode");
}

id objc_msgSend_presentedView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentedView");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentingViewController");
}

id objc_msgSend_pressGestureRecognizer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pressGestureRecognizer");
}

id objc_msgSend_previewForDragItem_inContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previewForDragItem:inContainer:");
}

id objc_msgSend_printInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "printInfo");
}

id objc_msgSend_processEnvironmentElementDocumentUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processEnvironmentElementDocumentUpdate:");
}

id objc_msgSend_processEnvironmentElementMetadataUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processEnvironmentElementMetadataUpdate:");
}

id objc_msgSend_processImageIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processImageIdentifier:");
}

id objc_msgSend_processImageIdentifierUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processImageIdentifierUpdate:");
}

id objc_msgSend_processRequest_progressHandler_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processRequest:progressHandler:completionHandler:");
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "progress");
}

id objc_msgSend_progressTowardsReceivingAllImageIdentifierUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "progressTowardsReceivingAllImageIdentifierUpdates");
}

id objc_msgSend_promoteViewValueToModelValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promoteViewValueToModelValueForKey:");
}

id objc_msgSend_promoteViewValueToModelValueForKey_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promoteViewValueToModelValueForKey:forState:");
}

id objc_msgSend_promoteViewValueToModelValueForKey_forState_createUndoCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promoteViewValueToModelValueForKey:forState:createUndoCommand:");
}

id objc_msgSend_propertyAnimator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyAnimator");
}

id objc_msgSend_pushNavigationItem_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushNavigationItem:animated:");
}

id objc_msgSend_q_saveEditedPDF(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "q_saveEditedPDF");
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:");
}

id objc_msgSend_rangeOfCharacterFromSet_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:");
}

id objc_msgSend_reanalyzeImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reanalyzeImage");
}

id objc_msgSend_recapAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recapAvailable");
}

id objc_msgSend_recapMovie(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recapMovie");
}

id objc_msgSend_receiveEnvironmentDescription_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveEnvironmentDescription:completion:");
}

id objc_msgSend_recordEditsToPersistable_inTransition_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordEditsToPersistable:inTransition:withCompletionBlock:");
}

id objc_msgSend_recordEditsToPersistableForPDF_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordEditsToPersistableForPDF:withCompletionBlock:");
}

id objc_msgSend_recordPersistableToTemporaryLocation_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordPersistableToTemporaryLocation:withCompletionBlock:");
}

id objc_msgSend_rect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rect");
}

id objc_msgSend_rectToCenterAboveKeyboard(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rectToCenterAboveKeyboard");
}

id objc_msgSend_rectsForShadow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rectsForShadow");
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redColor");
}

id objc_msgSend_redo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redo");
}

id objc_msgSend_redoForViewState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redoForViewState:");
}

id objc_msgSend_registerDataRepresentationForTypeIdentifier_visibility_loadHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:");
}

id objc_msgSend_registerObjectOfClass_visibility_loadHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerObjectOfClass:visibility:loadHandler:");
}

id objc_msgSend_registerRemoteAlertViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerRemoteAlertViewController:");
}

id objc_msgSend_registerRemoteViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerRemoteViewController:");
}

id objc_msgSend_registerUndoWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerUndoWithTarget:selector:object:");
}

id objc_msgSend_relinquishOverlayAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relinquishOverlayAtIndex:");
}

id objc_msgSend_removeAllActions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllActions");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeChildViewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeChildViewControllers");
}

id objc_msgSend_removeDescendantViewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDescendantViewControllers");
}

id objc_msgSend_removeFailureRequirement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFailureRequirement:");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromParentViewController");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeImageIdentifierUpdateObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeImageIdentifierUpdateObserver:");
}

id objc_msgSend_removeInteraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeInteraction:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePageAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePageAtIndex:");
}

id objc_msgSend_removePersistable_deleteOptions_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePersistable:deleteOptions:withCompletionBlock:");
}

id objc_msgSend_removeScreenshot_deleteOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeScreenshot:deleteOptions:");
}

id objc_msgSend_removeScreenshots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeScreenshots:");
}

id objc_msgSend_removeScreenshots_forReason_alongsideAnimations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeScreenshots:forReason:alongsideAnimations:completion:");
}

id objc_msgSend_removeTemporaryScreenshotLocation_deleteOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTemporaryScreenshotLocation:deleteOptions:");
}

id objc_msgSend_renameGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renameGroup");
}

id objc_msgSend_renameOption(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renameOption");
}

id objc_msgSend_renderAnnotation_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderAnnotation:inContext:");
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceCharactersInRange:withString:");
}

id objc_msgSend_reportStatistics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportStatistics");
}

id objc_msgSend_representation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "representation");
}

id objc_msgSend_requestCGImageBackedUneditedImageForUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestCGImageBackedUneditedImageForUI:");
}

id objc_msgSend_requestCGImageBackedUneditedImageForUIBlocking(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestCGImageBackedUneditedImageForUIBlocking");
}

id objc_msgSend_requestID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestID");
}

id objc_msgSend_requestOutputImageForSaving_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestOutputImageForSaving:");
}

id objc_msgSend_requestOutputImageForSavingBlocking(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestOutputImageForSavingBlocking");
}

id objc_msgSend_requestOutputImageForUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestOutputImageForUI:");
}

id objc_msgSend_requestOutputImageForUIBlocking(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestOutputImageForUIBlocking");
}

id objc_msgSend_requestOutputImageInTransition_forSaving_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestOutputImageInTransition:forSaving:");
}

id objc_msgSend_requestUneditedImageForUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestUneditedImageForUI:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_requireAllOtherGestureRecognizersToFailBeforeGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requireAllOtherGestureRecognizersToFailBeforeGestureRecognizer:");
}

id objc_msgSend_requireGestureRecognizerToFail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requireGestureRecognizerToFail:");
}

id objc_msgSend_requireGestureRecognizerToFailBeforeAllOtherGestureRecognizers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requireGestureRecognizerToFailBeforeAllOtherGestureRecognizers:");
}

id objc_msgSend_resetCrop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetCrop");
}

id objc_msgSend_resetScrollOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetScrollOffset");
}

id objc_msgSend_resetSelection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetSelection");
}

id objc_msgSend_resignCurrent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resignCurrent");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resignFirstResponder");
}

id objc_msgSend_resizableSnapshotViewFromRect_afterScreenUpdates_withCapInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "response");
}

id objc_msgSend_responseWithInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseWithInfo:");
}

id objc_msgSend_retargetedPreviewWithTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retargetedPreviewWithTarget:");
}

id objc_msgSend_revert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revert");
}

id objc_msgSend_revertForViewState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revertForViewState:");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rightAnchor");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_rotation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rotation");
}

id objc_msgSend_rotationGestureRecognizer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rotationGestureRecognizer");
}

id objc_msgSend_runPPTServiceRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runPPTServiceRequest");
}

id objc_msgSend_runTestWithParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTestWithParameters:");
}

id objc_msgSend_runningPropertyAnimatorWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runningPropertyAnimatorWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safeAreaInsets");
}

id objc_msgSend_saveEditsToScreenshotIfNecessary_inTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveEditsToScreenshotIfNecessary:inTransition:");
}

id objc_msgSend_saveLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveLocation");
}

id objc_msgSend_saveScreenshotsToTemporaryLocation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveScreenshotsToTemporaryLocation:completion:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scale");
}

id objc_msgSend_scaleAnimationParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaleAnimationParameters");
}

id objc_msgSend_scheduleDeletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleDeletionBlock:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screen");
}

id objc_msgSend_screenRecording(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenRecording");
}

id objc_msgSend_screenshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshot");
}

id objc_msgSend_screenshot_didHaveChangeOnPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshot:didHaveChangeOnPage:");
}

id objc_msgSend_screenshotAppearAnimationBeganForScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotAppearAnimationBeganForScreenshot:");
}

id objc_msgSend_screenshotAppearAnimationEndedForScreenshot_userInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotAppearAnimationEndedForScreenshot:userInterface:");
}

id objc_msgSend_screenshotDeletePDFPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotDeletePDFPage:");
}

id objc_msgSend_screenshotDidChangeForScreenshotsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotDidChangeForScreenshotsView:");
}

id objc_msgSend_screenshotDidHaveUndoStackChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotDidHaveUndoStackChanged:");
}

id objc_msgSend_screenshotDidHaveViewModificationInfoChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotDidHaveViewModificationInfoChanged:");
}

id objc_msgSend_screenshotDidMakeAnnotationEditOnImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotDidMakeAnnotationEditOnImage");
}

id objc_msgSend_screenshotDidReceivePDFData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotDidReceivePDFData");
}

id objc_msgSend_screenshotDidRevert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotDidRevert:");
}

id objc_msgSend_screenshotEditsSnapshotted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotEditsSnapshotted");
}

id objc_msgSend_screenshotEnteredDragSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotEnteredDragSession:");
}

id objc_msgSend_screenshotExperienceHasDismissed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotExperienceHasDismissed");
}

id objc_msgSend_screenshotGestureTriggered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotGestureTriggered:");
}

id objc_msgSend_screenshotGestureTriggeredWhileAnotherScreenshotWasShowing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotGestureTriggeredWhileAnotherScreenshotWasShowing:");
}

id objc_msgSend_screenshotInsertPDFPage_pageIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotInsertPDFPage:pageIndex:");
}

id objc_msgSend_screenshotItemProviders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotItemProviders");
}

id objc_msgSend_screenshotLeftDragSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotLeftDragSession:");
}

id objc_msgSend_screenshotMutableModificationInfo_valueChangedForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotMutableModificationInfo:valueChangedForKey:");
}

id objc_msgSend_screenshotPDFPageIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotPDFPageIndex:");
}

id objc_msgSend_screenshotReceived_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotReceived:completion:");
}

id objc_msgSend_screenshotReceivedImageIdentifierUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotReceivedImageIdentifierUpdate:");
}

id objc_msgSend_screenshotRepresentationAKControllerForPDF(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotRepresentationAKControllerForPDF");
}

id objc_msgSend_screenshotShouldJumpToPDFPageIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotShouldJumpToPDFPageIndex:");
}

id objc_msgSend_screenshotUIWithScreenshots_beganStateChangeFromState_toState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotUIWithScreenshots:beganStateChangeFromState:toState:");
}

id objc_msgSend_screenshotUIWithScreenshots_endedStateChangeFromState_toState_userInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotUIWithScreenshots:endedStateChangeFromState:toState:userInterface:");
}

id objc_msgSend_screenshotView_didUpdateInteraction_withAnalysis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotView:didUpdateInteraction:withAnalysis:");
}

id objc_msgSend_screenshotView_hasHighPriorityGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotView:hasHighPriorityGesture:");
}

id objc_msgSend_screenshotView_noLongerHasHighPriorityGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotView:noLongerHasHighPriorityGesture:");
}

id objc_msgSend_screenshotView_requestsUpdateToInteractionMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotView:requestsUpdateToInteractionMode:");
}

id objc_msgSend_screenshotView_startEditingOpacityInAccessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotView:startEditingOpacityInAccessoryView:");
}

id objc_msgSend_screenshotViewCropDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotViewCropDidChange:");
}

id objc_msgSend_screenshotViewForScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotViewForScreenshot:");
}

id objc_msgSend_screenshotViewTapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotViewTapped:");
}

id objc_msgSend_screenshotViewUndoStackChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotViewUndoStackChanged:");
}

id objc_msgSend_screenshotViewsUseTrilinearMinificationFilter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotViewsUseTrilinearMinificationFilter");
}

id objc_msgSend_screenshots(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshots");
}

id objc_msgSend_screenshotsDismissed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotsDismissed");
}

id objc_msgSend_screenshotsExtentRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotsExtentRect");
}

id objc_msgSend_screenshotsParentCoordinateSpace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotsParentCoordinateSpace");
}

id objc_msgSend_screenshotsView_didHitTestView_point_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotsView:didHitTestView:point:withEvent:");
}

id objc_msgSend_screenshotsView_requestsUpdateToInteractionMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotsView:requestsUpdateToInteractionMode:");
}

id objc_msgSend_screenshotsViewController_requestsCopyDeleteForScreenshots_deleteOptions_forReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotsViewController:requestsCopyDeleteForScreenshots:deleteOptions:forReason:");
}

id objc_msgSend_screenshotsViewController_requestsDeleteForScreenshots_deleteOptions_forReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotsViewController:requestsDeleteForScreenshots:deleteOptions:forReason:");
}

id objc_msgSend_screenshotsViewController_requestsPresentingActivityViewControllerWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotsViewController:requestsPresentingActivityViewControllerWithBlock:");
}

id objc_msgSend_screenshotsViewController_requestsPresentingTestFlightFeedbackControllerWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotsViewController:requestsPresentingTestFlightFeedbackControllerWithBlock:");
}

id objc_msgSend_screenshotsViewControllerShouldAllowSharing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotsViewControllerShouldAllowSharing:");
}

id objc_msgSend_screenshotsViewEditModeDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotsViewEditModeDidChange:");
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollView");
}

id objc_msgSend_scrollViewRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollViewRect");
}

id objc_msgSend_selectedAnnotations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedAnnotations");
}

id objc_msgSend_selectedOptionIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedOptionIndex");
}

id objc_msgSend_selectedSegmentIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedSegmentIndex");
}

id objc_msgSend_sendAsGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAsGroup");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendResponse:");
}

id objc_msgSend_separatorView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "separatorView");
}

id objc_msgSend_serviceOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceOptions");
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionIdentifier");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAcceptsTouches_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcceptsTouches:");
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityIdentifier:");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setActionInfoEdgeInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionInfoEdgeInsets:");
}

id objc_msgSend_setActionInfoLiveTextButtonDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionInfoLiveTextButtonDisabled:");
}

id objc_msgSend_setActionInfoViewHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionInfoViewHidden:");
}

id objc_msgSend_setActionInfoVisualSearchCornerViewDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionInfoVisualSearchCornerViewDisabled:");
}

id objc_msgSend_setActionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionName:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setActiveInteractionTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveInteractionTypes:");
}

id objc_msgSend_setActiveScreenshotView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveScreenshotView:");
}

id objc_msgSend_setActivityItemProviders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityItemProviders:");
}

id objc_msgSend_setActivityTypeOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityTypeOrder:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAllEditingDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllEditingDisabled:");
}

id objc_msgSend_setAllowedTouchTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedTouchTypes:");
}

id objc_msgSend_setAllowsAlertItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsAlertItems:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAllowsBackdropGroups_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsBackdropGroups:");
}

id objc_msgSend_setAllowsGroupOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsGroupOpacity:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAlwaysBounceHorizontal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysBounceHorizontal:");
}

id objc_msgSend_setAlwaysBounceVertical_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysBounceVertical:");
}

id objc_msgSend_setAnalysis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnalysis:");
}

id objc_msgSend_setAnalysisButtonPrefersDarkGlyphWhenSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnalysisButtonPrefersDarkGlyphWhenSelected:");
}

id objc_msgSend_setAnalysisButtonRequiresVisibleContentGating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnalysisButtonRequiresVisibleContentGating:");
}

id objc_msgSend_setAnalysisModeEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnalysisModeEnabled:");
}

id objc_msgSend_setAnchorPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnchorPoint:");
}

id objc_msgSend_setAnimationOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationOptions:");
}

id objc_msgSend_setAnimationReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationReason:");
}

id objc_msgSend_setAnnotationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnnotationController:");
}

id objc_msgSend_setAnnotationEditingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnnotationEditingEnabled:");
}

id objc_msgSend_setAnnotationKitController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnnotationKitController:");
}

id objc_msgSend_setAnnotationKitController_didAllocate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnnotationKitController:didAllocate:");
}

id objc_msgSend_setAnnotationModeEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnnotationModeEnabled:");
}

id objc_msgSend_setAnnotationNSDatas_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnnotationNSDatas:");
}

id objc_msgSend_setAnnotationOverlayView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnnotationOverlayView:");
}

id objc_msgSend_setAnnotationsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnnotationsEnabled:");
}

id objc_msgSend_setAssetMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetMetadata:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:");
}

id objc_msgSend_setAutoScales_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoScales:");
}

id objc_msgSend_setAutomaticallyShowVisualSearchResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticallyShowVisualSearchResults:");
}

id objc_msgSend_setAutoresizesSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizesSubviews:");
}

id objc_msgSend_setBackend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackend:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundEffects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundEffects:");
}

id objc_msgSend_setBackgroundImage_forBarMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundImage:forBarMetrics:");
}

id objc_msgSend_setBackingImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackingImage:");
}

id objc_msgSend_setBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBarButtonItem:");
}

id objc_msgSend_setBarTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBarTintColor:");
}

id objc_msgSend_setBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlock:");
}

id objc_msgSend_setBlockToRunForAddScreenshotsButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockToRunForAddScreenshotsButton:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderStyle:");
}

id objc_msgSend_setBorderViewStyleOverride_withAnimator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderViewStyleOverride:withAnimator:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setBounces_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounces:");
}

id objc_msgSend_setBouncesZoom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBouncesZoom:");
}

id objc_msgSend_setBounds_forBox_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:forBox:");
}

id objc_msgSend_setCachedCGImageBackedUneditedImageForUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedCGImageBackedUneditedImageForUI:");
}

id objc_msgSend_setCachedModificationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedModificationInfo:");
}

id objc_msgSend_setCachedOutputImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedOutputImage:");
}

id objc_msgSend_setCachedViewsHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedViewsHidden:");
}

id objc_msgSend_setCalendar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCalendar:");
}

id objc_msgSend_setCanGenerateDocument_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanGenerateDocument:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setChangeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChangeObserver:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setCompletionWithItemsHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionWithItemsHandler:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:");
}

id objc_msgSend_setContentOffset_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:animated:");
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentSize:");
}

id objc_msgSend_setContentSwitcherAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentSwitcherAlpha:");
}

id objc_msgSend_setContentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentViewController:");
}

id objc_msgSend_setCornerGrabberAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerGrabberAlpha:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCount:");
}

id objc_msgSend_setCreateFeedbackProviders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCreateFeedbackProviders:");
}

id objc_msgSend_setCrop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCrop:");
}

id objc_msgSend_setCropEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCropEnabled:");
}

id objc_msgSend_setCropHandlesFadedOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCropHandlesFadedOut:");
}

id objc_msgSend_setCropInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCropInfo:");
}

id objc_msgSend_setCropRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCropRect:");
}

id objc_msgSend_setCurrentInProcessRequestID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentInProcessRequestID:");
}

id objc_msgSend_setCurrentPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPage:");
}

id objc_msgSend_setCurrentPageIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPageIndex:");
}

id objc_msgSend_setCurrentPageIndicatorTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPageIndicatorTintColor:");
}

id objc_msgSend_setCurrentScreenshotCropHandlesFadedOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentScreenshotCropHandlesFadedOut:");
}

id objc_msgSend_setDamping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDamping:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDebugElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugElements:");
}

id objc_msgSend_setDecelerationRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDecelerationRate:");
}

id objc_msgSend_setDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelay:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeliveryCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeliveryCompletionBlock:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirection:");
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableActions:");
}

id objc_msgSend_setDisplayBox_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayBox:");
}

id objc_msgSend_setDisplayLinkObserverHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayLinkObserverHandler:");
}

id objc_msgSend_setDisplayMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayMode:");
}

id objc_msgSend_setDisplaysPageBreaks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplaysPageBreaks:");
}

id objc_msgSend_setDittoRemoteAlertDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDittoRemoteAlertDelegate:");
}

id objc_msgSend_setDocument_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDocument:");
}

id objc_msgSend_setDocumentGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDocumentGenerator:");
}

id objc_msgSend_setDragAnimating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDragAnimating:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEditMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditMode:");
}

id objc_msgSend_setEditable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditable:");
}

id objc_msgSend_setEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEffect:");
}

id objc_msgSend_setEligibleForHandoff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEligibleForHandoff:");
}

id objc_msgSend_setEligibleForPrediction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEligibleForPrediction:");
}

id objc_msgSend_setEligibleForPublicIndexing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEligibleForPublicIndexing:");
}

id objc_msgSend_setEligibleForSearch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEligibleForSearch:");
}

id objc_msgSend_setEnableDataDetectors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableDataDetectors:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEnvironmentDescriptionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnvironmentDescriptionIdentifier:");
}

id objc_msgSend_setExcludedActivityTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExcludedActivityTypes:");
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillColor:");
}

id objc_msgSend_setFillRule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillRule:");
}

id objc_msgSend_setFilters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilters:");
}

id objc_msgSend_setFlag_forSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlag:forSetting:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setForceAnalysisBarButtonItemEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForceAnalysisBarButtonItemEnabled:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setGeometryMultiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGeometryMultiplier:");
}

id objc_msgSend_setGesturesEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGesturesEnabled:");
}

id objc_msgSend_setGroupsByEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupsByEvent:");
}

id objc_msgSend_setHarvestedMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHarvestedMetadata:");
}

id objc_msgSend_setHasChangedBackingImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasChangedBackingImage:");
}

id objc_msgSend_setHasOriginalUneditedImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasOriginalUneditedImage:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHidesSourceLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesSourceLayer:");
}

id objc_msgSend_setHidesSourceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesSourceView:");
}

id objc_msgSend_setHighFrameRateReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighFrameRateReason:");
}

id objc_msgSend_setHighQualityQueueHasBeenResumed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighQualityQueueHasBeenResumed:");
}

id objc_msgSend_setHighQualityQueueIsValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighQualityQueueIsValid:");
}

id objc_msgSend_setHighlightSelectableItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlightSelectableItems:");
}

id objc_msgSend_setHitTestsUsingSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHitTestsUsingSubviews:");
}

id objc_msgSend_setHostingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHostingViewController:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImage_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:forState:");
}

id objc_msgSend_setImageAnalyzer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageAnalyzer:");
}

id objc_msgSend_setImageDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageDescription:");
}

id objc_msgSend_setImageGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageGenerator:");
}

id objc_msgSend_setImageIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageIdentifier:");
}

id objc_msgSend_setImagePixelSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImagePixelSize:");
}

id objc_msgSend_setImageScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageScale:");
}

id objc_msgSend_setImageSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageSource:");
}

id objc_msgSend_setInDragAndDrop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInDragAndDrop:");
}

id objc_msgSend_setIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndex:");
}

id objc_msgSend_setInhibitImageAnalysis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInhibitImageAnalysis:");
}

id objc_msgSend_setInitialAnnotationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialAnnotationMode:");
}

id objc_msgSend_setInitialVelocity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialVelocity:");
}

id objc_msgSend_setInteractionMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractionMode:");
}

id objc_msgSend_setInteractionTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractionTintColor:");
}

id objc_msgSend_setIsBeingRemoved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBeingRemoved:");
}

id objc_msgSend_setIsDeleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsDeleted:");
}

id objc_msgSend_setIsInCropMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInCropMode:");
}

id objc_msgSend_setIsPDFRequested_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPDFRequested:");
}

id objc_msgSend_setIsPerformingFullscreenSetup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPerformingFullscreenSetup:");
}

id objc_msgSend_setIsSaving_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSaving:");
}

id objc_msgSend_setIsSharing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSharing:");
}

id objc_msgSend_setIsTransitioningStates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsTransitioningStates:");
}

id objc_msgSend_setItemProviders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemProviders:");
}

id objc_msgSend_setItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItems:");
}

id objc_msgSend_setJobName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJobName:");
}

id objc_msgSend_setLastViewEditMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastViewEditMode:");
}

id objc_msgSend_setLaunchingInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchingInterfaceOrientation:");
}

id objc_msgSend_setLayoutMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutMode:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setLeftBarButtonItems_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItems:animated:");
}

id objc_msgSend_setLineAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineAlpha:");
}

id objc_msgSend_setLineGrabberAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineGrabberAlpha:");
}

id objc_msgSend_setLocalObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalObject:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setManagedView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManagedView:");
}

id objc_msgSend_setMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMask:");
}

id objc_msgSend_setMass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMass:");
}

id objc_msgSend_setMatchesAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMatchesAlpha:");
}

id objc_msgSend_setMatchesOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMatchesOpacity:");
}

id objc_msgSend_setMatchesPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMatchesPosition:");
}

id objc_msgSend_setMatchesTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMatchesTransform:");
}

id objc_msgSend_setMaxScaleFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxScaleFactor:");
}

id objc_msgSend_setMaximumContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumContentSizeCategory:");
}

id objc_msgSend_setMaximumNumberOfTouches_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumNumberOfTouches:");
}

id objc_msgSend_setMaximumValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumValue:");
}

id objc_msgSend_setMaximumZoomScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumZoomScale:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setMinScaleFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinScaleFactor:");
}

id objc_msgSend_setMinificationFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinificationFilter:");
}

id objc_msgSend_setMinimumNumberOfTouches_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumNumberOfTouches:");
}

id objc_msgSend_setMinimumPressDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumPressDuration:");
}

id objc_msgSend_setMinimumValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumValue:");
}

id objc_msgSend_setMinimumZoomScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumZoomScale:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setModelModificationInfo_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModelModificationInfo:forState:");
}

id objc_msgSend_setModificationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModificationInfo:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNeedsPageImageUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsPageImageUpdate");
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsStatusBarAppearanceUpdate");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberOfPages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfPages:");
}

id objc_msgSend_setNumberOfTouchesRequiredForPanningCrop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfTouchesRequiredForPanningCrop:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObjectManipulationDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObjectManipulationDelegate:");
}

id objc_msgSend_setOpacityEditingDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpacityEditingDelegate:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setOrientationChangedEventsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrientationChangedEventsEnabled:");
}

id objc_msgSend_setOriginalAnnotations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalAnnotations:");
}

id objc_msgSend_setOutputType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutputType:");
}

id objc_msgSend_setOverlayControllerActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverlayControllerActive:");
}

id objc_msgSend_setOverlayViewUnitRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverlayViewUnitRect:");
}

id objc_msgSend_setOverrideName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideName:");
}

id objc_msgSend_setOverrideUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideUserInterfaceStyle:");
}

id objc_msgSend_setPDFAKControllerDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPDFAKControllerDelegate:");
}

id objc_msgSend_setPDFData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPDFData:");
}

id objc_msgSend_setPDFPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPDFPage:");
}

id objc_msgSend_setPDFURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPDFURL:");
}

id objc_msgSend_setPDFView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPDFView:");
}

id objc_msgSend_setPDFVisibleRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPDFVisibleRect:");
}

id objc_msgSend_setPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPage:");
}

id objc_msgSend_setPageBreakMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPageBreakMargins:");
}

id objc_msgSend_setPageCropRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPageCropRect:");
}

id objc_msgSend_setPageIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPageIndex:");
}

id objc_msgSend_setPagingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPagingEnabled:");
}

id objc_msgSend_setPaperKitChangeCounter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPaperKitChangeCounter:");
}

id objc_msgSend_setPaperRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPaperRect:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPdfAsImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPdfAsImage:");
}

id objc_msgSend_setPdfView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPdfView:");
}

id objc_msgSend_setPencilAlwaysDraws_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPencilAlwaysDraws:");
}

id objc_msgSend_setPerformingDismissAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPerformingDismissAnimation:");
}

id objc_msgSend_setPermittedArrowDirections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPermittedArrowDirections:");
}

id objc_msgSend_setPreCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreCompletionHandler:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setPreferredFrameRateRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredFrameRateRange:");
}

id objc_msgSend_setPreferredFramesPerSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredFramesPerSecond:");
}

id objc_msgSend_setPreferredHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredHeight:");
}

id objc_msgSend_setPreferredPresentationSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredPresentationSize:");
}

id objc_msgSend_setPreferredQuickActionButtonHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredQuickActionButtonHeight:");
}

id objc_msgSend_setPreferredSymbolConfiguration_forImageInState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredSymbolConfiguration:forImageInState:");
}

id objc_msgSend_setPresentationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationMode:");
}

id objc_msgSend_setPreventSheetDismissal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreventSheetDismissal:");
}

id objc_msgSend_setPrintFormatters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrintFormatters:");
}

id objc_msgSend_setPrintableRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrintableRect:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setPropertyAnimator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPropertyAnimator:");
}

id objc_msgSend_setReachabilityDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReachabilityDisabled:");
}

id objc_msgSend_setRecapMovie_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecapMovie:");
}

id objc_msgSend_setRectsForShadow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRectsForShadow:");
}

id objc_msgSend_setRedoItemAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRedoItemAction:");
}

id objc_msgSend_setRedoItemTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRedoItemTarget:");
}

id objc_msgSend_setRenameOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRenameOption:");
}

id objc_msgSend_setRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRepresentation:");
}

id objc_msgSend_setRightBarButtonItems_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItems:animated:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setRulerHostView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRulerHostView:");
}

id objc_msgSend_setRulerHostingDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRulerHostingDelegate:");
}

id objc_msgSend_setRulerHostingView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRulerHostingView:");
}

id objc_msgSend_setSaveLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSaveLocation:");
}

id objc_msgSend_setScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScale:");
}

id objc_msgSend_setScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenshot:");
}

id objc_msgSend_setScreenshotEditsSnapshotted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenshotEditsSnapshotted:");
}

id objc_msgSend_setScreenshotEditsSnapshotted_inTransition_currentScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenshotEditsSnapshotted:inTransition:currentScreenshot:");
}

id objc_msgSend_setScreenshotViewsUseTrilinearMinificationFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenshotViewsUseTrilinearMinificationFilter:");
}

id objc_msgSend_setScreenshotsUseTrilinearMinificationFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenshotsUseTrilinearMinificationFilter:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setScrollViewVisibleRectInPDFView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollViewVisibleRectInPDFView:");
}

id objc_msgSend_setScrollingBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollingBounds:");
}

id objc_msgSend_setScrollsToTop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollsToTop:");
}

id objc_msgSend_setSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelected:");
}

id objc_msgSend_setSelectedSegmentIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedSegmentIndex:");
}

id objc_msgSend_setShadowColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowColor:");
}

id objc_msgSend_setShadowImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowImage:");
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOffset:");
}

id objc_msgSend_setShadowOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOpacity:");
}

id objc_msgSend_setShadowPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowPath:");
}

id objc_msgSend_setShadowRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowRadius:");
}

id objc_msgSend_setShareAsOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShareAsOption:");
}

id objc_msgSend_setShareButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShareButtonAction:");
}

id objc_msgSend_setShareButtonHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShareButtonHidden:");
}

id objc_msgSend_setShareButtonTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShareButtonTarget:");
}

id objc_msgSend_setShareItemAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShareItemAction:");
}

id objc_msgSend_setShareItemTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShareItemTarget:");
}

id objc_msgSend_setShouldFlick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldFlick:");
}

id objc_msgSend_setShouldUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldUpdate:");
}

id objc_msgSend_setShowingSharingUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowingSharingUI:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setShowsLargeContentViewer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsLargeContentViewer:");
}

id objc_msgSend_setShowsShadow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsShadow:");
}

id objc_msgSend_setShowsShadow_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsShadow:animated:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setSiriActionActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSiriActionActivity:");
}

id objc_msgSend_setSizeMultiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSizeMultiplier:");
}

id objc_msgSend_setSnapRects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSnapRects:");
}

id objc_msgSend_setSnapshotFirstPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSnapshotFirstPage:");
}

id objc_msgSend_setSnapshotScreenshotEdits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSnapshotScreenshotEdits:");
}

id objc_msgSend_setSnapshots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSnapshots:");
}

id objc_msgSend_setSourceContextId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceContextId:");
}

id objc_msgSend_setSourceLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceLayer:");
}

id objc_msgSend_setSourceLayerRenderId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceLayerRenderId:");
}

id objc_msgSend_setSourceRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceRect:");
}

id objc_msgSend_setSourceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceView:");
}

id objc_msgSend_setSpecialization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecialization:");
}

id objc_msgSend_setSpeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpeed:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setState_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:animated:completion:");
}

id objc_msgSend_setStiffness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStiffness:");
}

id objc_msgSend_setSuccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuccess:");
}

id objc_msgSend_setSuggestedName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestedName:");
}

id objc_msgSend_setSupportsOpacityEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsOpacityEditing:");
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setTemporaryPDFURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTemporaryPDFURL:");
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

id objc_msgSend_setThumbnail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThumbnail:");
}

id objc_msgSend_setThumbnailImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThumbnailImage:");
}

id objc_msgSend_setThumbnailSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThumbnailSize:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
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

id objc_msgSend_setTitleTextAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleTextAttributes:");
}

id objc_msgSend_setTitleView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleView:");
}

id objc_msgSend_setToolMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToolMode:");
}

id objc_msgSend_setToolPickerVisible_forFirstResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToolPickerVisible:forFirstResponder:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setTranslucent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslucent:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUndoItemAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUndoItemAction:");
}

id objc_msgSend_setUndoItemTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUndoItemTarget:");
}

id objc_msgSend_setUndoRedoButtonsHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUndoRedoButtonsHidden:");
}

id objc_msgSend_setUnitRectForContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnitRectForContent:");
}

id objc_msgSend_setUnoccludedRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnoccludedRect:");
}

id objc_msgSend_setUseHighVisibilityDefaultInks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseHighVisibilityDefaultInks:");
}

id objc_msgSend_setUseTrilinearMinificationFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseTrilinearMinificationFilter:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setUserInterfaceHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInterfaceHidden:");
}

id objc_msgSend_setUsesOriginalImageAspectRatio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesOriginalImageAspectRatio:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVellumOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVellumOpacity:");
}

id objc_msgSend_setVellumView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVellumView:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setViewControllerManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewControllerManager:");
}

id objc_msgSend_setViewControllers_direction_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewControllers:direction:animated:completion:");
}

id objc_msgSend_setViewModificationInfo_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewModificationInfo:forState:");
}

id objc_msgSend_setViewState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewState:");
}

id objc_msgSend_setViewToCrop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewToCrop:");
}

id objc_msgSend_setVisible_forFirstResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisible:forFirstResponder:");
}

id objc_msgSend_setVisibleRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisibleRect:");
}

id objc_msgSend_setWantsAutomaticContentsRectCalculation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsAutomaticContentsRectCalculation:");
}

id objc_msgSend_setWantsClearBackgroundColorInCompactSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsClearBackgroundColorInCompactSize:");
}

id objc_msgSend_setWantsTranslucentActionInfoButtons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsTranslucentActionInfoButtons:");
}

id objc_msgSend_setWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidth:");
}

id objc_msgSend_setWidth_forSegmentAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidth:forSegmentAtIndex:");
}

id objc_msgSend_setWillSoonUnparentChildDittoRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWillSoonUnparentChildDittoRootViewController:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_setZoomScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZoomScale:");
}

id objc_msgSend_setZoomScale_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZoomScale:animated:");
}

id objc_msgSend_set_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_delegate:");
}

id objc_msgSend_set_wantsFormFieldDetection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_wantsFormFieldDetection:");
}

id objc_msgSend_settingsWithMass_stiffness_damping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsWithMass:stiffness:damping:");
}

id objc_msgSend_setupDocumentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupDocumentViewController");
}

id objc_msgSend_setupOverlayControllerWithPDFDocument_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupOverlayControllerWithPDFDocument:");
}

id objc_msgSend_setupPDFData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPDFData");
}

id objc_msgSend_setupPDFView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPDFView");
}

id objc_msgSend_setupPaperKitView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPaperKitView");
}

id objc_msgSend_shadowColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shadowColor");
}

id objc_msgSend_shadowOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shadowOffset");
}

id objc_msgSend_shadowOpacity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shadowOpacity");
}

id objc_msgSend_shadowPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shadowPath");
}

id objc_msgSend_shadowRadius(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shadowRadius");
}

id objc_msgSend_shareAsOption(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareAsOption");
}

id objc_msgSend_shareItemAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareItemAction");
}

id objc_msgSend_shareItemTarget(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareItemTarget");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedAssetManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedAssetManager");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedSSSApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedSSSApplication");
}

id objc_msgSend_sharedScreenshotManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedScreenshotManager");
}

id objc_msgSend_sharedSignificantEventController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedSignificantEventController");
}

id objc_msgSend_sharedStatisticsManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedStatisticsManager");
}

id objc_msgSend_shouldCaptureDocumentForMetadataUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldCaptureDocumentForMetadataUpdate:");
}

id objc_msgSend_shouldFlash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldFlash");
}

id objc_msgSend_shouldIncludePDF(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldIncludePDF");
}

id objc_msgSend_shouldShowThumbnailOptionView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowThumbnailOptionView");
}

id objc_msgSend_shouldUseMiniMapView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUseMiniMapView");
}

id objc_msgSend_showingSharingUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showingSharingUI");
}

id objc_msgSend_showingWaitingForImageIdentifierUpdatesUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showingWaitingForImageIdentifierUpdatesUI");
}

id objc_msgSend_showsShadow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsShadow");
}

id objc_msgSend_significantEventControllerRequestsTransitionToStateForTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "significantEventControllerRequestsTransitionToStateForTest:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "size");
}

id objc_msgSend_sizeMultiplier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeMultiplier");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_skipShutterSound(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "skipShutterSound");
}

id objc_msgSend_snapRects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapRects");
}

id objc_msgSend_snapUnitRects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapUnitRects");
}

id objc_msgSend_snapshotScreenshotEdits(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshotScreenshotEdits");
}

id objc_msgSend_snapshots(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshots");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "source");
}

id objc_msgSend_sourceContextId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceContextId");
}

id objc_msgSend_sourceLayerRenderId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceLayerRenderId");
}

id objc_msgSend_speed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "speed");
}

id objc_msgSend_springAnimationParametersWithDuration_mass_stiffness_damping_speed_controlPointOne_controlPointTwo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "springAnimationParametersWithDuration:mass:stiffness:damping:speed:controlPointOne:controlPointTwo:");
}

id objc_msgSend_ss_cgImageBackedImageFromImageSurface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ss_cgImageBackedImageFromImageSurface:");
}

id objc_msgSend_ss_imageFromImageSurface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ss_imageFromImageSurface:");
}

id objc_msgSend_sssAppDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sssAppDelegate");
}

id objc_msgSend_sss_animateWithAnimationParameters_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sss_animateWithAnimationParameters:animations:completion:");
}

id objc_msgSend_sss_miniatureBorderColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sss_miniatureBorderColor");
}

id objc_msgSend_sss_setFrameUnanimating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sss_setFrameUnanimating:");
}

id objc_msgSend_sss_setFrameUnanimatingIfChangingFromCGSizeZero_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:");
}

id objc_msgSend_sss_setFrameUnanimatingLayingOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sss_setFrameUnanimatingLayingOut:");
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAccessingSecurityScopedResource");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAnimating");
}

id objc_msgSend_startAnimation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAnimation");
}

id objc_msgSend_startCropTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startCropTimestamp");
}

id objc_msgSend_startObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startObserver");
}

id objc_msgSend_startedTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startedTest:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_stateTransitionFinished(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateTransitionFinished");
}

id objc_msgSend_statusBarVisibilityForTraitCollection_isPortrait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusBarVisibilityForTraitCollection:isPortrait:");
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAccessingSecurityScopedResource");
}

id objc_msgSend_stopBeingParentOfDittoRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopBeingParentOfDittoRootViewController:");
}

id objc_msgSend_stopObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopObserver");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_strokes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "strokes");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subviews");
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "success");
}

id objc_msgSend_successful(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "successful");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "superview");
}

id objc_msgSend_supportedAnalysisTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedAnalysisTypes");
}

id objc_msgSend_supportedInterfaceOrientations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedInterfaceOrientations");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemBlueColor");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemLayoutSizeFittingSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLayoutSizeFittingSize:");
}

id objc_msgSend_takeValueFromModificationInfo_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "takeValueFromModificationInfo:forKey:");
}

id objc_msgSend_tapGestureRecognizer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tapGestureRecognizer");
}

id objc_msgSend_tapToRadar_screenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tapToRadar:screenshot:");
}

id objc_msgSend_tapToRadarURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tapToRadarURL");
}

id objc_msgSend_targetForCancellingDragItem_inContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetForCancellingDragItem:inContainer:");
}

id objc_msgSend_teardown(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "teardown");
}

id objc_msgSend_temporaryPDFFile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "temporaryPDFFile");
}

id objc_msgSend_temporaryPDFURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "temporaryPDFURL");
}

id objc_msgSend_testName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testName");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "text");
}

id objc_msgSend_textFieldCustomizationWithText_placeholder_identifier_footerText_textChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFieldCustomizationWithText:placeholder:identifier:footerText:textChangedHandler:");
}

id objc_msgSend_thumbnailImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thumbnailImage");
}

id objc_msgSend_thumbnailOfSize_forBox_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thumbnailOfSize:forBox:");
}

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneForSecondsFromGMT:");
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tintColor");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "title");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_toolPicker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toolPicker");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_topBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topBar");
}

id objc_msgSend_topItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topItem");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_translationInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "translationInView:");
}

id objc_msgSend_trimmedFrom_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trimmedFrom:to:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_undo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "undo");
}

id objc_msgSend_undoActionName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "undoActionName");
}

id objc_msgSend_undoForViewState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "undoForViewState:");
}

id objc_msgSend_undoManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "undoManager");
}

id objc_msgSend_undoManagerForEditMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "undoManagerForEditMode:");
}

id objc_msgSend_undoStackChangedForScreenshotsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "undoStackChangedForScreenshotsView:");
}

id objc_msgSend_undoStateMightHaveChanged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "undoStateMightHaveChanged");
}

id objc_msgSend_uninstallInterstitialGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uninstallInterstitialGesture:");
}

id objc_msgSend_unitRectCoordinateSpace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unitRectCoordinateSpace");
}

id objc_msgSend_unitRectForContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unitRectForContent");
}

id objc_msgSend_unoccludedRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unoccludedRect");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updateAnalysisButtonStateToVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAnalysisButtonStateToVisible:");
}

id objc_msgSend_updateAnnotationButtonForCurrentState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAnnotationButtonForCurrentState");
}

id objc_msgSend_updateForFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateForFrame:");
}

id objc_msgSend_updateHiddenRegionViewWithVisibleRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHiddenRegionViewWithVisibleRect:");
}

id objc_msgSend_updateInteractionHighlightStatusIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateInteractionHighlightStatusIfNecessary");
}

id objc_msgSend_updatePDFViewFromVisibleRegionView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePDFViewFromVisibleRegionView");
}

id objc_msgSend_updatePaletteVisibilityIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePaletteVisibilityIfNecessary:");
}

id objc_msgSend_updateScreenshotsInteractionModeIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateScreenshotsInteractionModeIfNecessary");
}

id objc_msgSend_updateUndoState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUndoState");
}

id objc_msgSend_updateViewState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateViewState");
}

id objc_msgSend_updateVisibleRegionViewFromPDFView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateVisibleRegionViewFromPDFView");
}

id objc_msgSend_updateVisibleRegionViewWithVisibleRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateVisibleRegionViewWithVisibleRect:");
}

id objc_msgSend_useTrilinearMinificationFilter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "useTrilinearMinificationFilter");
}

id objc_msgSend_userActivityTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userActivityTitle");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceBecameInterestedInScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceBecameInterestedInScreenshot:");
}

id objc_msgSend_userInterfaceHidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceHidden");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_userInterfaceStoppedBeingInterestedInScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceStoppedBeingInterestedInScreenshot:");
}

id objc_msgSend_userInterfaceWillStopBeingInterestedInScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceWillStopBeingInterestedInScreenshot:");
}

id objc_msgSend_validateRedo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateRedo:");
}

id objc_msgSend_validateUndo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateUndo:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "value");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueWithCGRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCGRect:");
}

id objc_msgSend_vellumOpacity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vellumOpacity");
}

id objc_msgSend_vellumView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vellumView");
}

id objc_msgSend_velocityInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "velocityInView:");
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verticalSizeClass");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_viewContainingScreenshotContents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewContainingScreenshotContents");
}

id objc_msgSend_viewControllerForOverlayPresentations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerForOverlayPresentations");
}

id objc_msgSend_viewControllerForPresentationsFromScreenshotView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerForPresentationsFromScreenshotView:");
}

id objc_msgSend_viewControllerForPresentationsFromScreenshotsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerForPresentationsFromScreenshotsView:");
}

id objc_msgSend_viewControllerManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerManager");
}

id objc_msgSend_viewDidDisappear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewDidDisappear:");
}

id objc_msgSend_viewForPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewForPage:");
}

id objc_msgSend_viewForZoomingInScrollView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewForZoomingInScrollView:");
}

id objc_msgSend_viewModificationInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewModificationInfo");
}

id objc_msgSend_viewModificationInfoForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewModificationInfoForState:");
}

id objc_msgSend_viewState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewState");
}

id objc_msgSend_viewToCrop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewToCrop");
}

id objc_msgSend_viewWithScreenshotImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewWithScreenshotImage");
}

id objc_msgSend_viewsForScreenshots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewsForScreenshots:");
}

id objc_msgSend_visiblePDFPageWhenScreenshotted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visiblePDFPageWhenScreenshotted");
}

id objc_msgSend_visiblePDFRectWhenScreenshotted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visiblePDFRectWhenScreenshotted");
}

id objc_msgSend_visiblePages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visiblePages");
}

id objc_msgSend_visibleRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleRect");
}

id objc_msgSend_visibleScreenshots(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleScreenshots");
}

id objc_msgSend_visionKitFeedbackActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visionKitFeedbackActivity");
}

id objc_msgSend_visualSearchCornerView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visualSearchCornerView");
}

id objc_msgSend_visualSearchResultItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visualSearchResultItems");
}

id objc_msgSend_vsGlyph(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vsGlyph");
}

id objc_msgSend_vsGlyphFilled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vsGlyphFilled");
}

id objc_msgSend_waitingForImageIdentifierUpdatesAlertControllerDidCancel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitingForImageIdentifierUpdatesAlertControllerDidCancel:");
}

id objc_msgSend_wasJustSavedForMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wasJustSavedForMode:");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitespaceCharacterSet");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_widthForContentSwitcher_forView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widthForContentSwitcher:forView:");
}

id objc_msgSend_widthForOpacityControlInView_withContentSwitcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widthForOpacityControlInView:withContentSwitcher:");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_willSoonUnparentChildDittoRootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willSoonUnparentChildDittoRootViewController");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "window");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowScene");
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windows");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:options:error:");
}

id objc_msgSend_writeToURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:completion:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_zoomScale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "zoomScale");
}

id objc_msgSend_zoomToRect_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "zoomToRect:animated:");
}

