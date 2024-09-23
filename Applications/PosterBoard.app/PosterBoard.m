id sub_100002F5C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset:", a2);
}

id sub_100002F68(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset:", 0);
}

void sub_100002F74(id a1, id a2)
{
  void *v2;
  void *v3;
  void *v4;
  void (*v6)(id, _QWORD *);
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = v3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100003018;
  v9[3] = &unk_10000C3D8;
  v10 = v2;
  v11 = v4;
  v6 = (void (*)(id, _QWORD *))*((_QWORD *)a2 + 2);
  v7 = v11;
  v8 = v10;
  v6(a2, v9);

}

uint64_t sub_100003018(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t sub_100003028(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1[4] + 16))(a1[4], a1[5], a2, a1[6]);
}

id sub_100003040(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_runScrollPosterRackWithTestOptions:completion:", *(_QWORD *)(a1 + 40), a2);
}

id sub_100003050(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_runScrollPosterGalleryWithTestOptions:completion:", *(_QWORD *)(a1 + 40), a2);
}

id sub_100003060(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_runSwitchPosterWithTestOptions:completion:", *(_QWORD *)(a1 + 40), a2);
}

void sub_10000343C(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  objc_sync_exit(v3);

}

void sub_100003494(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000034A8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  char *v14;
  char *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v3 = a2;
  v4 = objc_msgSend(v3, "markStartedTest:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PosterBoardTestingUtilities posterRackViewController](PosterBoardTestingUtilities, "posterRackViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionView"));

  v7 = objc_alloc((Class)RPTDirectionalSwipeTestParameters);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100003668;
  v16[3] = &unk_10000C478;
  v8 = v3;
  v17 = v8;
  v18 = *(id *)(a1 + 32);
  v9 = v6;
  v19 = v9;
  v10 = objc_msgSend(v7, "initWithTestName:scrollView:completionHandler:", 0, v9, v16);
  objc_msgSend(v10, "setSwipeSpeedFactor:", &off_10000CE88);
  UIRectInset(objc_msgSend(v10, "scrollingBounds"));
  objc_msgSend(v10, "setScrollingBounds:");
  if (objc_msgSend(*(id *)(a1 + 40), "userInterfaceLayoutDirection") == (id)1)
    v11 = 1;
  else
    v11 = 2;
  objc_msgSend(v10, "setDirection:", v11);
  v12 = *(id *)(a1 + 48);
  objc_sync_enter(v12);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = (char *)objc_msgSend(*(id *)(a1 + 48), "count");
  if ((unint64_t)&v14[v13] >= *(_QWORD *)(a1 + 64))
    v15 = *(char **)(a1 + 64);
  else
    v15 = &v14[v13];
  objc_msgSend(v10, "setSwipeCount:", v15);
  objc_sync_exit(v12);

  +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v10);
}

void sub_100003650(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100003668(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "markFinishedTest:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 48);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
  objc_msgSend(v3, "scrollToItemAtIndexPath:atScrollPosition:animated:", v4, 16, 0);

  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

id sub_1000036DC(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_sync_exit(v2);

  return v3;
}

void sub_100003724(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000038B4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "markStartSubTest:forTestName:", CFSTR("presentPosterGallery"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PosterBoardTestingUtilities posterRackViewController](PosterBoardTestingUtilities, "posterRackViewController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000397C;
  v7[3] = &unk_10000C518;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "presentPosterGallery:", v7);

}

void sub_10000397C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void **v10;
  uint64_t v11;
  id (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = objc_msgSend(v4, "markFinishedSubTest:forTestName:", CFSTR("presentPosterGallery"), *(_QWORD *)(a1 + 40));
    v6 = objc_msgSend(*(id *)(a1 + 32), "markStartSubTest:forTestName:", CFSTR("scrollPosterGallery"), *(_QWORD *)(a1 + 40));
    v7 = objc_alloc((Class)RPTScrollViewTestParameters);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionView"));
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_100003AAC;
    v13 = &unk_10000C4F0;
    v14 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 40);
    v9 = objc_msgSend(v7, "initWithTestName:scrollView:completionHandler:", 0, v8, &v10);

    objc_msgSend(v9, "setPreventSheetDismissal:", 1, v10, v11, v12, v13);
    +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v9);

  }
  else
  {
    objc_msgSend(v4, "cancelAndFailTestWithReason:", CFSTR("poster gallery did not present"));
  }

}

id sub_100003AAC(uint64_t a1)
{
  id v2;
  id v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "markFinishedSubTest:forTestName:", CFSTR("scrollPosterGallery"), *(_QWORD *)(a1 + 40));
  v3 = objc_msgSend(*(id *)(a1 + 32), "markFinishedTest:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

void sub_100003EB4(id a1, PBFPPTBlockOperation *a2)
{
  PBFPPTBlockOperation *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PosterBoardTestingUtilities posterRackViewController](PosterBoardTestingUtilities, "posterRackViewController"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "posterExtensionDataStore"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "switcherConfiguration"));
  v5 = objc_msgSend(v4, "mutableCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configurations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
  objc_msgSend(v5, "setSelectedConfiguration:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configurations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
  objc_msgSend(v5, "setDesiredActiveConfiguration:", v9);

  v10 = objc_msgSend(v11, "updateDataStoreForSwitcherConfiguration:reason:error:", v5, CFSTR("PPT"), 0);
  -[PBFPPTBlockOperation finish](v2, "finish");

}

void sub_100003FC4(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  objc_sync_exit(v3);

}

void sub_10000401C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004030(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _QWORD *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a2;
  v4 = objc_msgSend(v3, "markStartSubTest:forTestName:", CFSTR("selectedPoster"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PosterBoardTestingUtilities posterRackViewController](PosterBoardTestingUtilities, "posterRackViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionView"));
  objc_msgSend(v6, "center");
  v9 = PBFPPTEventActionsToTouchAndHoldAtPoint(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100004128;
  v12[3] = &unk_10000C4F0;
  v13 = v3;
  v14 = *(id *)(a1 + 32);
  v11 = v3;
  PBFPPTSynthesizeEventsForEventActions(v10, v12);

}

id sub_100004128(uint64_t a1)
{
  id v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "markFinishedSubTest:forTestName:", CFSTR("selectedPoster"), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

id sub_100004164(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_sync_exit(v2);

  return v3;
}

void sub_1000041AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000042F4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  char v8;

  v3 = a2;
  v4 = objc_opt_self(UIWindowScene);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
    v8 = objc_opt_isKindOfClass(v7, *(_QWORD *)(a1 + 32));

  }
  else
  {
    v8 = 0;
  }

  return v8 & 1;
}

void PBFPPTSynthesizeEventsForEventActions(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v4 = a1;
  v5 = objc_alloc_init((Class)RCPPlayerPlaybackOptions);
  +[RCPInlinePlayer playEventActions:options:completion:](RCPInlinePlayer, "playEventActions:options:completion:", v4, v5, v3);

}

Block_layout *PBFPPTEventActionsToSwipeLeftFromRightOfInterface()
{
  return &stru_10000C5E0;
}

void sub_10000444C(id a1, RCPEventStreamComposer *a2)
{
  void *v2;
  RCPEventStreamComposer *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double MinX;
  double v19;
  double MidY;
  id v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double MaxX;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  CGRect v36;
  CGRect v37;

  v2 = (void *)UIApp;
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_keyWindowForScreen:", v4));

  objc_msgSend(v35, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(UIApp, "userInterfaceLayoutDirection");
  v14 = v6;
  v15 = v8;
  v16 = v10;
  v17 = v12;
  if (v13 == (id)1)
    MinX = CGRectGetMinX(*(CGRect *)&v14);
  else
    MinX = CGRectGetMaxX(*(CGRect *)&v14);
  v19 = MinX;
  v36.origin.x = v6;
  v36.origin.y = v8;
  v36.size.width = v10;
  v36.size.height = v12;
  MidY = CGRectGetMidY(v36);
  v21 = objc_msgSend(UIApp, "userInterfaceLayoutDirection");
  v22 = v6;
  v23 = v8;
  v24 = v10;
  v25 = v12;
  if (v21 == (id)1)
    MaxX = CGRectGetMaxX(*(CGRect *)&v22);
  else
    MaxX = CGRectGetMinX(*(CGRect *)&v22);
  v27 = MaxX;
  v37.origin.x = v6;
  v37.origin.y = v8;
  v37.size.width = v10;
  v37.size.height = v12;
  v28 = CGRectGetMidY(v37);
  objc_msgSend(v35, "convertPoint:toView:", 0, v19, MidY);
  objc_msgSend(v35, "_convertPointToSceneReferenceSpace:");
  v30 = v29;
  v32 = v31;
  objc_msgSend(v35, "convertPoint:toView:", 0, v27, v28);
  objc_msgSend(v35, "_convertPointToSceneReferenceSpace:");
  -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](v3, "sendFlickWithStartPoint:endPoint:duration:", v30, v32, v33, v34, 0.25);

}

Block_layout *PBFPPTEventActionsToSwipeRightFromLeftOfInterface()
{
  return &stru_10000C600;
}

void sub_1000045F0(id a1, RCPEventStreamComposer *a2)
{
  void *v2;
  RCPEventStreamComposer *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double MaxX;
  double v19;
  double MidY;
  id v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double MinX;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  CGRect v36;
  CGRect v37;

  v2 = (void *)UIApp;
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_keyWindowForScreen:", v4));

  objc_msgSend(v35, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(UIApp, "userInterfaceLayoutDirection");
  v14 = v6;
  v15 = v8;
  v16 = v10;
  v17 = v12;
  if (v13 == (id)1)
    MaxX = CGRectGetMaxX(*(CGRect *)&v14);
  else
    MaxX = CGRectGetMinX(*(CGRect *)&v14);
  v19 = MaxX;
  v36.origin.x = v6;
  v36.origin.y = v8;
  v36.size.width = v10;
  v36.size.height = v12;
  MidY = CGRectGetMidY(v36);
  v21 = objc_msgSend(UIApp, "userInterfaceLayoutDirection");
  v22 = v6;
  v23 = v8;
  v24 = v10;
  v25 = v12;
  if (v21 == (id)1)
    MinX = CGRectGetMinX(*(CGRect *)&v22);
  else
    MinX = CGRectGetMaxX(*(CGRect *)&v22);
  v27 = MinX;
  v37.origin.x = v6;
  v37.origin.y = v8;
  v37.size.width = v10;
  v37.size.height = v12;
  v28 = CGRectGetMidY(v37);
  objc_msgSend(v35, "convertPoint:toView:", 0, v19, MidY);
  objc_msgSend(v35, "_convertPointToSceneReferenceSpace:");
  v30 = v29;
  v32 = v31;
  objc_msgSend(v35, "convertPoint:toView:", 0, v27, v28);
  objc_msgSend(v35, "_convertPointToSceneReferenceSpace:");
  -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](v3, "sendFlickWithStartPoint:endPoint:duration:", v30, v32, v33, v34, 0.25);

}

_QWORD *PBFPPTEventActionsToTapAtPoint(double a1, double a2)
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000047D8;
  v3[3] = &unk_10000C620;
  *(double *)&v3[4] = a1;
  *(double *)&v3[5] = a2;
  return objc_retainBlock(v3);
}

void sub_1000047D8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)UIApp;
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_keyWindowForScreen:", v5));

  objc_msgSend(v6, "convertPoint:toView:", 0, *(double *)(a1 + 32), *(double *)(a1 + 40));
  objc_msgSend(v6, "_convertPointToSceneReferenceSpace:");
  objc_msgSend(v4, "tap:");

}

_QWORD *PBFPPTEventActionsToTouchAndHoldAtPoint(double a1, double a2)
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000048C0;
  v3[3] = &unk_10000C620;
  *(double *)&v3[4] = a1;
  *(double *)&v3[5] = a2;
  return objc_retainBlock(v3);
}

void sub_1000048C0(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)UIApp;
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_keyWindowForScreen:", v5));

  objc_msgSend(v6, "convertPoint:toView:", 0, *(double *)(a1 + 32), *(double *)(a1 + 40));
  objc_msgSend(v6, "_convertPointToSceneReferenceSpace:");
  objc_msgSend(v4, "touchDown:");
  objc_msgSend(v4, "advanceTime:", 2.0);
  objc_msgSend(v4, "liftUpAtAllActivePoints");

}

_QWORD *PBFPPTEventActionsToPeekAndPopAtPoint(char a1, double a2, double a3, double a4)
{
  _QWORD v5[7];
  char v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000049C4;
  v5[3] = &unk_10000C640;
  *(double *)&v5[4] = a2;
  *(double *)&v5[5] = a3;
  v6 = a1;
  *(double *)&v5[6] = a4;
  return objc_retainBlock(v5);
}

void sub_1000049C4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)UIApp;
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_keyWindowForScreen:", v5));

  objc_msgSend(v6, "convertPoint:toView:", 0, *(double *)(a1 + 32), *(double *)(a1 + 40));
  objc_msgSend(v6, "_convertPointToSceneReferenceSpace:");
  objc_msgSend(v4, "peekAndPop:commit:duration:", *(unsigned __int8 *)(a1 + 56));

}

Block_layout *PBFPPTEventActionsToSwipeUpInMiddleOfInterface()
{
  return &stru_10000C660;
}

void sub_100004A70(id a1, RCPEventStreamComposer *a2)
{
  void *v2;
  RCPEventStreamComposer *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v2 = (void *)UIApp;
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_keyWindowForScreen:", v4));

  objc_msgSend(v19, "bounds");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  MidX = CGRectGetMidX(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MidY = CGRectGetMidY(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v11 = CGRectGetMidX(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v12 = CGRectGetMidY(v23) + -200.0;
  objc_msgSend(v19, "convertPoint:toView:", 0, MidX, MidY);
  objc_msgSend(v19, "_convertPointToSceneReferenceSpace:");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v19, "convertPoint:toView:", 0, v11, v12);
  objc_msgSend(v19, "_convertPointToSceneReferenceSpace:");
  -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](v3, "sendFlickWithStartPoint:endPoint:duration:", v14, v16, v17, v18, 0.25);

}

Block_layout *PBFPPTEventActionsToSwipeDownInMiddleOfInterface()
{
  return &stru_10000C680;
}

void sub_100004BDC(id a1, RCPEventStreamComposer *a2)
{
  void *v2;
  RCPEventStreamComposer *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  CGFloat v10;
  double v11;
  double MidY;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v2 = (void *)UIApp;
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_keyWindowForScreen:", v4));

  objc_msgSend(v19, "bounds");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  MidX = CGRectGetMidX(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v10 = CGRectGetMidY(v21) + -200.0;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v11 = CGRectGetMidX(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MidY = CGRectGetMidY(v23);
  objc_msgSend(v19, "convertPoint:toView:", 0, MidX, v10);
  objc_msgSend(v19, "_convertPointToSceneReferenceSpace:");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v19, "convertPoint:toView:", 0, v11, MidY);
  objc_msgSend(v19, "_convertPointToSceneReferenceSpace:");
  -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](v3, "sendFlickWithStartPoint:endPoint:duration:", v14, v16, v17, v18, 0.25);

}

Block_layout *PBFPPTEventActionsToSwipeLeftInMiddleOfInterface()
{
  return &stru_10000C6A0;
}

void sub_100004D48(id a1, RCPEventStreamComposer *a2)
{
  void *v2;
  RCPEventStreamComposer *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  double MidX;
  double v15;
  double v16;
  double v17;
  double MidY;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v2 = (void *)UIApp;
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_keyWindowForScreen:", v4));

  objc_msgSend(v27, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(UIApp, "userInterfaceLayoutDirection");
  v28.origin.x = v6;
  v28.origin.y = v8;
  v28.size.width = v10;
  v28.size.height = v12;
  MidX = CGRectGetMidX(v28);
  v15 = 100.0;
  if (v13 == (id)1)
    v16 = -100.0;
  else
    v16 = 100.0;
  v17 = MidX + v16;
  v29.origin.x = v6;
  v29.origin.y = v8;
  v29.size.width = v10;
  v29.size.height = v12;
  MidY = CGRectGetMidY(v29);
  if (objc_msgSend(UIApp, "userInterfaceLayoutDirection") != (id)1)
    v15 = -100.0;
  v30.origin.x = v6;
  v30.origin.y = v8;
  v30.size.width = v10;
  v30.size.height = v12;
  v19 = CGRectGetMidX(v30) + v15;
  v31.origin.x = v6;
  v31.origin.y = v8;
  v31.size.width = v10;
  v31.size.height = v12;
  v20 = CGRectGetMidY(v31);
  objc_msgSend(v27, "convertPoint:toView:", 0, v17, MidY);
  objc_msgSend(v27, "_convertPointToSceneReferenceSpace:");
  v22 = v21;
  v24 = v23;
  objc_msgSend(v27, "convertPoint:toView:", 0, v19, v20);
  objc_msgSend(v27, "_convertPointToSceneReferenceSpace:");
  -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](v3, "sendFlickWithStartPoint:endPoint:duration:", v22, v24, v25, v26, 0.25);

}

Block_layout *PBFPPTEventActionsToSwipeRightInMiddleOfInterface()
{
  return &stru_10000C6C0;
}

void sub_100004EF0(id a1, RCPEventStreamComposer *a2)
{
  void *v2;
  RCPEventStreamComposer *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  double MidX;
  double v15;
  double v16;
  double v17;
  double MidY;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v2 = (void *)UIApp;
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_keyWindowForScreen:", v4));

  objc_msgSend(v27, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(UIApp, "userInterfaceLayoutDirection");
  v28.origin.x = v6;
  v28.origin.y = v8;
  v28.size.width = v10;
  v28.size.height = v12;
  MidX = CGRectGetMidX(v28);
  v15 = -100.0;
  if (v13 == (id)1)
    v16 = 100.0;
  else
    v16 = -100.0;
  v17 = MidX + v16;
  v29.origin.x = v6;
  v29.origin.y = v8;
  v29.size.width = v10;
  v29.size.height = v12;
  MidY = CGRectGetMidY(v29);
  if (objc_msgSend(UIApp, "userInterfaceLayoutDirection") != (id)1)
    v15 = 100.0;
  v30.origin.x = v6;
  v30.origin.y = v8;
  v30.size.width = v10;
  v30.size.height = v12;
  v19 = CGRectGetMidX(v30) + v15;
  v31.origin.x = v6;
  v31.origin.y = v8;
  v31.size.width = v10;
  v31.size.height = v12;
  v20 = CGRectGetMidY(v31);
  objc_msgSend(v27, "convertPoint:toView:", 0, v17, MidY);
  objc_msgSend(v27, "_convertPointToSceneReferenceSpace:");
  v22 = v21;
  v24 = v23;
  objc_msgSend(v27, "convertPoint:toView:", 0, v19, v20);
  objc_msgSend(v27, "_convertPointToSceneReferenceSpace:");
  -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](v3, "sendFlickWithStartPoint:endPoint:duration:", v22, v24, v25, v26, 0.25);

}

Block_layout *PBFPPTEventActionsToSwipeUpFromBottomOfInterface()
{
  return &stru_10000C6E0;
}

void sub_100005098(id a1, RCPEventStreamComposer *a2)
{
  void *v2;
  RCPEventStreamComposer *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MaxY;
  double v11;
  double MinY;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v2 = (void *)UIApp;
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_keyWindowForScreen:", v4));

  objc_msgSend(v19, "bounds");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  MidX = CGRectGetMidX(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MaxY = CGRectGetMaxY(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v11 = CGRectGetMidX(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MinY = CGRectGetMinY(v23);
  objc_msgSend(v19, "convertPoint:toView:", 0, MidX, MaxY);
  objc_msgSend(v19, "_convertPointToSceneReferenceSpace:");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v19, "convertPoint:toView:", 0, v11, MinY);
  objc_msgSend(v19, "_convertPointToSceneReferenceSpace:");
  -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](v3, "sendFlickWithStartPoint:endPoint:duration:", v14, v16, v17, v18, 0.25);

}

Block_layout *PBFPPTEventActionsToSwipeDownFromTopOfInterface()
{
  return &stru_10000C700;
}

void sub_1000051FC(id a1, RCPEventStreamComposer *a2)
{
  void *v2;
  RCPEventStreamComposer *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MinY;
  double v11;
  double MaxY;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v2 = (void *)UIApp;
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_keyWindowForScreen:", v4));

  objc_msgSend(v19, "bounds");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  MidX = CGRectGetMidX(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MinY = CGRectGetMinY(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v11 = CGRectGetMidX(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MaxY = CGRectGetMaxY(v23);
  if (PF_IS_PAD_DEVICE())
  {
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    MidX = CGRectGetMinX(v24) + 100.0;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    MinY = CGRectGetMinY(v25);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v11 = CGRectGetMinX(v26) + 100.0;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    MaxY = CGRectGetMaxY(v27);
  }
  objc_msgSend(v19, "convertPoint:toView:", 0, MidX, MinY);
  objc_msgSend(v19, "_convertPointToSceneReferenceSpace:");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v19, "convertPoint:toView:", 0, v11, MaxY);
  objc_msgSend(v19, "_convertPointToSceneReferenceSpace:");
  -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](v3, "sendFlickWithStartPoint:endPoint:duration:", v14, v16, v17, v18, 0.25);

}

void sub_1000053C4(void *a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  dispatch_block_t v16;
  void *v17;
  dispatch_time_t v18;
  _QWORD block[4];
  id v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  id (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_1000055E4;
  v36 = sub_10000560C;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_100005614;
  v30 = sub_100005624;
  v31 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000562C;
  v22[3] = &unk_10000C728;
  v24 = &v32;
  v25 = &v26;
  v12 = v9;
  v23 = v12;
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", v7, v8, v11, v22));
  v14 = (void *)v27[5];
  v27[5] = v13;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000056BC;
  block[3] = &unk_10000C750;
  v20 = v12;
  v21 = &v26;
  v15 = v12;
  v16 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v17 = (void *)v33[5];
  v33[5] = (uint64_t)v16;

  v18 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  dispatch_after(v18, (dispatch_queue_t)&_dispatch_main_q, (dispatch_block_t)v33[5]);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

}

void sub_1000055CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id sub_1000055E4(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_retainBlock(*(id *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void sub_10000560C(uint64_t a1)
{

}

uint64_t sub_100005614(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005624(uint64_t a1)
{

}

void sub_10000562C(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  v7 = a2;
  dispatch_block_cancel(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

uint64_t sub_1000056BC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000057D4(id a1, PBFPPTBlockOperation *a2)
{
  -[PBFPPTBlockOperation finish](a2, "finish");
}

void sub_100005890(id a1, PBFPPTBlockOperation *a2)
{
  -[PBFPPTBlockOperation finish](a2, "finish");
}

void sub_10000592C(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 32) * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000059D0;
  block[3] = &unk_10000C370;
  v7 = v3;
  v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_1000059D0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

void sub_100005AB8(double *a1, void *a2)
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = a1[6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005B6C;
  v8[3] = &unk_10000C7D8;
  v9 = v3;
  v6 = (void *)*((_QWORD *)a1 + 4);
  v5 = (void *)*((_QWORD *)a1 + 5);
  v10 = v6;
  v11 = *((_QWORD *)a1 + 6);
  v7 = v3;
  sub_1000053C4(v6, v5, v8, v4);

}

void sub_100005B6C(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }
  else
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Didn't observe %@ within %f seconds"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
    objc_msgSend(v2, "cancelAndFailTestWithReason:", v3);

  }
}

void sub_100005C98(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005D14;
  v6[3] = &unk_10000C370;
  v7 = v3;
  v5 = v3;
  PBFPPTSynthesizeEventsForEventActions(v4, v6);

}

id sub_100005D14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

void sub_100005DD8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005E54;
  v6[3] = &unk_10000C370;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "reset:", v6);

}

id sub_100005E54(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

void sub_100005F20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005FAC;
  v7[3] = &unk_10000C370;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "scrollToFirstPoster:completion:", v5, v7);

}

id sub_100005FAC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

void sub_1000060C4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[6];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  objc_msgSend(v5, "center");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000048C0;
  v12[3] = &unk_10000C620;
  v12[4] = v6;
  v12[5] = v7;
  v8 = objc_retainBlock(v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000061B0;
  v10[3] = &unk_10000C370;
  v11 = v3;
  v9 = v3;
  PBFPPTSynthesizeEventsForEventActions(v8, v10);

}

void sub_1000061B0(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000623C;
  block[3] = &unk_10000C370;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_10000623C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

void sub_100006380(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = PRPosterRoleLockScreen;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000643C;
  v9[3] = &unk_10000C878;
  v10 = v3;
  v7 = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v8 = v3;
  objc_msgSend(v4, "createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:", v5, v7, v6, v9);

}

void sub_10000643C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
    objc_msgSend(v7, "cancelAndFailTestWithReason:", v8);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      v10 = objc_msgSend(objc_alloc((Class)PRPosterConfiguration), "_initWithPath:", v11);
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);

    }
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }

}

void sub_1000065DC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(a1 + 32);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), "_path"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serverIdentity"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "posterUUID"));
        objc_msgSend(v10, "deletePosterConfigurationsMatchingUUID:error:", v13, 0);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "finish");
}

void sub_100006898(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;

  BSDispatchQueueAssertMain();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v3, "startedTest:", *(_QWORD *)(a1 + 32));

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "operationName"));
    v5 = (void *)v4;
    v6 = *(_QWORD *)(a1 + 32);
    if (v4)
      v7 = v4;
    else
      v7 = (uint64_t)WeakRetained;
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' starting testname '%@'", (uint8_t *)&v8, 0x16u);

  }
}

void sub_100006A64(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;

  BSDispatchQueueAssertMain();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v3, "finishedTest:", *(_QWORD *)(a1 + 32));

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "operationName"));
    v5 = (void *)v4;
    v6 = *(_QWORD *)(a1 + 32);
    if (v4)
      v7 = v4;
    else
      v7 = (uint64_t)WeakRetained;
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' finished testname '%@'", (uint8_t *)&v8, 0x16u);

  }
}

void sub_100006C50(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;

  BSDispatchQueueAssertMain();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v3, "startedSubTest:forTest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "operationName"));
    v5 = (void *)v4;
    if (v4)
      v6 = v4;
    else
      v6 = (uint64_t)WeakRetained;
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 138412802;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' started testname '%@' / sub test %@", (uint8_t *)&v9, 0x20u);

  }
}

void sub_100006E44(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;

  BSDispatchQueueAssertMain();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v3, "finishedSubTest:forTest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "operationName"));
    v5 = (void *)v4;
    if (v4)
      v6 = v4;
    else
      v6 = (uint64_t)WeakRetained;
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 138412802;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' finished testname '%@' / sub test %@", (uint8_t *)&v9, 0x20u);

  }
}

void sub_100007404(id a1, PBFPPTBlockOperation *a2)
{
  -[PBFPPTBlockOperation finish](a2, "finish");
}

void sub_1000079CC(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Operation didn't complete within %f seconds"), *(_QWORD *)(a1 + 40)));
  objc_msgSend(v1, "cancelAndFailTestWithReason:", v2);

}

void sub_100007AE8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100007B94()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ApplicationDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *ObjCClassFromMetadata;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = type metadata accessor for ApplicationDelegate();
  v4 = static CommandLine.unsafeArgv.getter();
  v5 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  v6 = static CommandLine.argc.getter(v5);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v8 = NSStringFromClass(ObjCClassFromMetadata);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0, 0, v9, v11);
  swift_bridgeObjectRelease(v11);
  exit((int)v8);
}

uint64_t type metadata accessor for ApplicationDelegate()
{
  return objc_opt_self(_TtC11PosterBoard19ApplicationDelegate);
}

uint64_t sub_100007C7C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC11PosterBoardP33_D37C83C3E98BBC3E1BFE304CC5018F5119ResourceBundleClass);
}

void sub_100007CAC(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "operationName"));
  sub_100007AE8((void *)&_mh_execute_header, &_os_log_default, v2, "Skipping '%@' because it's already executing", v3, v4, v5, v6, 2u);

  sub_100007AF8();
}

void sub_100007D2C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "operationName"));
  sub_100007AE8((void *)&_mh_execute_header, &_os_log_default, v2, "Skipping '%@' because it's already finished", v3, v4, v5, v6, 2u);

  sub_100007AF8();
}

id objc_msgSend__convertPointToSceneReferenceSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertPointToSceneReferenceSpace:");
}

id objc_msgSend__initWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithPath:");
}

id objc_msgSend__keyWindowForScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_keyWindowForScreen:");
}

id objc_msgSend__path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_path");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOperations_waitUntilFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperations:waitUntilFinished:");
}

id objc_msgSend_advanceTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advanceTime:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_appendFloat_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFloat:withName:");
}

id objc_msgSend_appendString_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:withName:");
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "block");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_bs_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_firstObjectPassingTest:");
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "build");
}

id objc_msgSend_builderWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "builderWithObject:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelAndFailTestWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelAndFailTestWithReason:");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "center");
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView");
}

id objc_msgSend_configurations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurations");
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectedScenes");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:toView:");
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

id objc_msgSend_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:");
}

id objc_msgSend_currentTestName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTestName");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_deletePosterConfigurationsMatchingUUID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletePosterConfigurationsMatchingUUID:error:");
}

id objc_msgSend_dependencies(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dependencies");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_enqueueOperations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueOperations:");
}

id objc_msgSend_failedTest_withFailure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failedTest:withFailure:");
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finish");
}

id objc_msgSend_finishedSubTest_forTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedSubTest:forTest:");
}

id objc_msgSend_finishedTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedTest:");
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForItem:inSection:");
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBlock:");
}

id objc_msgSend_initWithName_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:block:");
}

id objc_msgSend_initWithTestName_scrollView_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTestName:scrollView:completionHandler:");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExecuting");
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFinished");
}

id objc_msgSend_knownPPTTests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "knownPPTTests");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_liftUpAtAllActivePoints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "liftUpAtAllActivePoints");
}

id objc_msgSend_main(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "main");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_markFinishedSubTest_forTestName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markFinishedSubTest:forTestName:");
}

id objc_msgSend_markFinishedTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markFinishedTest:");
}

id objc_msgSend_markStartSubTest_forTestName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markStartSubTest:forTestName:");
}

id objc_msgSend_markStartedTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markStartedTest:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_operationDidFinish(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationDidFinish");
}

id objc_msgSend_operationName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationName");
}

id objc_msgSend_operationToAddPosterWithProvider_descriptorIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationToAddPosterWithProvider:descriptorIdentifier:completion:");
}

id objc_msgSend_operationToDeletePosters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationToDeletePosters:");
}

id objc_msgSend_operationToFinishTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationToFinishTest:");
}

id objc_msgSend_operationToPushInToPosterSwitcher(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationToPushInToPosterSwitcher");
}

id objc_msgSend_operationToResetSwitcher(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationToResetSwitcher");
}

id objc_msgSend_operationToScrollToFirstPoster_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationToScrollToFirstPoster:");
}

id objc_msgSend_operationToStartTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationToStartTest:");
}

id objc_msgSend_operationToSynthesizeEventsForEventActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationToSynthesizeEventsForEventActions:");
}

id objc_msgSend_operationToWaitForTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationToWaitForTimeInterval:");
}

id objc_msgSend_operationWillStart(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationWillStart");
}

id objc_msgSend_operationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationWithBlock:");
}

id objc_msgSend_operationWithName_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationWithName:block:");
}

id objc_msgSend_peekAndPop_commit_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peekAndPop:commit:duration:");
}

id objc_msgSend_playEventActions_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playEventActions:options:completion:");
}

id objc_msgSend_posterExtensionDataStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "posterExtensionDataStore");
}

id objc_msgSend_posterRackViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "posterRackViewController");
}

id objc_msgSend_posterSwitcherWindowScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "posterSwitcherWindowScene");
}

id objc_msgSend_posterUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "posterUUID");
}

id objc_msgSend_presentPosterGallery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentPosterGallery:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_reset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reset:");
}

id objc_msgSend_runTestWithParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTestWithParameters:");
}

id objc_msgSend_runningPPTTestName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runningPPTTestName");
}

id objc_msgSend_scrollToFirstPoster_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollToFirstPoster:completion:");
}

id objc_msgSend_scrollToItemAtIndexPath_atScrollPosition_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollToItemAtIndexPath:atScrollPosition:animated:");
}

id objc_msgSend_scrollingBounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollingBounds");
}

id objc_msgSend_sendFlickWithStartPoint_endPoint_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendFlickWithStartPoint:endPoint:duration:");
}

id objc_msgSend_serverIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverIdentity");
}

id objc_msgSend_setCurrentTestName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTestName:");
}

id objc_msgSend_setDesiredActiveConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDesiredActiveConfiguration:");
}

id objc_msgSend_setDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirection:");
}

id objc_msgSend_setOperationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOperationName:");
}

id objc_msgSend_setPreventSheetDismissal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreventSheetDismissal:");
}

id objc_msgSend_setScrollingBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollingBounds:");
}

id objc_msgSend_setSelectedConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedConfiguration:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setSwipeCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwipeCount:");
}

id objc_msgSend_setSwipeSpeedFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwipeSpeedFactor:");
}

id objc_msgSend_setTimeoutBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutBlock:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_startedSubTest_forTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startedSubTest:forTest:");
}

id objc_msgSend_startedTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startedTest:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_switcherConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "switcherConfiguration");
}

id objc_msgSend_tap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tap:");
}

id objc_msgSend_timeoutBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeoutBlock");
}

id objc_msgSend_timeoutInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeoutInterval");
}

id objc_msgSend_touchDown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchDown:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updateDataStoreForSwitcherConfiguration_reason_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDataStoreForSwitcherConfiguration:reason:error:");
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceLayoutDirection");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "window");
}
