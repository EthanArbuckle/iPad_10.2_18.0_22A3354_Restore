void sub_100002E64(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_100002EC4(id *a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "setMemo:", v6);

  v4 = objc_loadWeakRetained(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));

  if (v5 && (objc_opt_respondsToSelector(v5, "memoDidChangeTo:") & 1) != 0)
    objc_msgSend(v5, "memoDidChangeTo:", v6);

}

void sub_100002F54(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAmount:", v9);

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  if (v4)
  {
    v5 = v4;
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
    v7 = objc_opt_respondsToSelector(v6, "amountDidChangeTo:");

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
      objc_msgSend(v8, "amountDidChangeTo:", v9);

    }
  }

}

void sub_100003010(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "appController"));
  v4 = objc_msgSend(v3, "presentationStyle");

  v12 = objc_loadWeakRetained(v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "appController"));
  v6 = v5;
  if (v4)
  {
    v7 = objc_msgSend(v5, "presentationStyle");

    if (v7 != (id)1)
      return;
    v8 = objc_loadWeakRetained(v1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mainView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "amountStepperView"));
    objc_msgSend(v10, "validateNumberPadInput");

    v12 = objc_loadWeakRetained(v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "appController"));
    v6 = v5;
    v11 = 0;
  }
  else
  {
    v11 = 1;
  }
  objc_msgSend(v5, "requestPresentationStyle:", v11);

}

void sub_100003114(id *a1, void *a2, uint64_t a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  id *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  _QWORD v21[2];
  _QWORD v22[4];
  _QWORD v23[2];

  v5 = a2;
  objc_msgSend(v5, "setActivityIndicatorVisible:forAction:", 1, a3);
  objc_msgSend(v5, "setEnabled:", 0);
  v6 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mainView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "amountStepperView"));
  objc_msgSend(v9, "validateNumberPadInput");

  objc_msgSend(a1[4], "sendAnalyticsForAction:", a3);
  objc_msgSend(a1[5], "setUsedKeypad:", 0);
  v10 = objc_loadWeakRetained((id *)a1[4] + 9);
  if (v10
    && (v11 = v10,
        v12 = objc_loadWeakRetained((id *)a1[4] + 9),
        v13 = objc_opt_respondsToSelector(v12, "handleAction:completion:"),
        v12,
        v11,
        (v13 & 1) != 0))
  {
    v14 = objc_loadWeakRetained((id *)a1[4] + 9);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000032F8;
    v22[3] = &unk_100020820;
    v15 = (id *)v23;
    v23[0] = v5;
    v23[1] = a3;
    v16 = v5;
    objc_msgSend(v14, "handleAction:completion:", a3, v22);
  }
  else
  {
    v14 = objc_loadWeakRetained(a1 + 6);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "appController"));
    v18 = objc_loadWeakRetained(v6);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000033A4;
    v20[3] = &unk_100020820;
    v15 = (id *)v21;
    v21[0] = v5;
    v21[1] = a3;
    v19 = v5;
    objc_msgSend(v17, "handleAction:sender:completion:", a3, v18, v20);

  }
}

void sub_1000032F8(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003370;
  v4[3] = &unk_1000207F8;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

id sub_100003370(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setActivityIndicatorVisible:forAction:", 0, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
}

void sub_1000033A4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000341C;
  v4[3] = &unk_1000207F8;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

id sub_10000341C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setActivityIndicatorVisible:forAction:", 0, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
}

void sub_100003DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003DD8(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traitCollection"));
    objc_msgSend(v5, "setPresentationContext:", objc_msgSend(v6, "_presentationSemanticContext"));

  }
}

void sub_10000430C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004328(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a3 == 2)
    {
      objc_msgSend(v5, "setShowsActionSpinner:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "appController"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10000451C;
      v10[3] = &unk_100020910;
      objc_copyWeak(&v12, v6);
      v11 = v5;
      objc_msgSend(v9, "handleAction:sender:completion:", 4, v11, v10);

      objc_destroyWeak(&v12);
    }
    else if (a3 == 1)
    {
      objc_msgSend(v5, "setShowsActionSpinner:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "appController"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000044A8;
      v13[3] = &unk_1000208C0;
      v14 = v5;
      objc_msgSend(v8, "handleAction:sender:completion:", 3, v14, v13);

    }
  }

}

void sub_100004494(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000044A8(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004510;
  block[3] = &unk_100020898;
  v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_100004510(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowsActionSpinner:", 0);
}

void sub_10000451C(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000045BC;
  block[3] = &unk_1000208E8;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  v7 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v6);
}

void sub_1000045BC(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "setShowsActionSpinner:", 0);
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "updateWithPeerPaymentStatus:animated:", 1, 1);
      v4 = dispatch_time(0, 300000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004694;
      block[3] = &unk_1000207D0;
      objc_copyWeak(&v6, v2);
      dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
      objc_destroyWeak(&v6);
    }
  }

}

void sub_100004694(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_resizeBubbleViewToReferenceSizeAnimated");
    WeakRetained = v2;
  }

}

void sub_100004DC0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100004DFC(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "appController"));
    objc_msgSend(v2, "noteReadyForDisplay");

    WeakRetained = v3;
  }

}

void sub_100004E44(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD *v5;
  _BYTE *v6;
  uint64_t Object;
  NSObject *v8;
  _BYTE *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  _BYTE *v19;

  v3 = a2;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005074;
    block[3] = &unk_100020960;
    objc_copyWeak(&v17, a1 + 6);
    v15 = a1[4];
    v4 = v3;
    v16 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v17);
    v5 = a1 + 5;
    if (*((_BYTE *)a1[5] + 40) || objc_msgSend(v4, "peerPaymentStatus"))
      goto LABEL_9;
    v6 = (_BYTE *)*v5;
  }
  else
  {
    v5 = a1 + 5;
    v6 = a1[5];
    if (v6[40])
      goto LABEL_9;
  }
  v6[40] = 1;
  Object = PKLogFacilityTypeGetObject(11);
  v8 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (_BYTE *)*v5;
    *(_DWORD *)buf = 134217984;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Fetching remote status.", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "appController"));
  v11 = a1[4];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000051B0;
  v12[3] = &unk_1000209B0;
  objc_copyWeak(&v13, a1 + 6);
  v12[4] = a1[5];
  objc_msgSend(v10, "remoteStatusForMessage:completion:", v11, v12);

  objc_destroyWeak(&v13);
LABEL_9:

}

void sub_100005058(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100005074(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  unsigned int v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "_isMessage:validForTransaction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v5 = v3[3];
    if (v4)
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appController"));
      objc_msgSend(v5, "updateWithPaymentTransaction:animated:", v6, objc_msgSend(v7, "appReadyForDisplay"));
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appController"));
      objc_msgSend(v5, "setState:animated:", 9, objc_msgSend(v7, "appReadyForDisplay"));
    }

    if (objc_msgSend(v3[3], "state") != (id)4)
    {
      v8 = v3[3];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100005178;
      v9[3] = &unk_100020898;
      v9[4] = v3;
      objc_msgSend(v8, "performPostRender:", v9);
    }
  }

}

id sub_100005178(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "appController"));
  objc_msgSend(v2, "noteReadyForDisplay");

  return objc_msgSend(*(id *)(a1 + 32), "_resizeBubbleViewToReferenceSizeAnimated");
}

void sub_1000051B0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005258;
  block[3] = &unk_100020960;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
}

void sub_100005258(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t Object;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  dispatch_time_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD block[4];
  id v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  uint64_t v26;

  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 40) = 0;
    v5 = WeakRetained[3];
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend((id)objc_opt_class(v5), "referenceSizeForPeerPaymentStatusResponse:", *(_QWORD *)(a1 + 32));
      v7 = v6;
      v9 = v8;
      objc_msgSend(v4[3], "frame");
      if (v9 <= v10)
      {
        v14 = v4[3];
        v15 = *(_QWORD *)(a1 + 32);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appController"));
        objc_msgSend(v14, "updateWithPeerPaymentStatusResponse:animated:", v15, objc_msgSend(v16, "appReadyForDisplay"));

        v17 = dispatch_time(0, 300000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000554C;
        block[3] = &unk_1000207D0;
        objc_copyWeak(&v22, v2);
        dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, block);
        objc_destroyWeak(&v22);
      }
      else
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1000054F4;
        v23[3] = &unk_100020988;
        v23[4] = v4;
        v24 = *(id *)(a1 + 32);
        objc_msgSend(v4, "_resizeBubbleViewToSize:completion:", v23, v7, v9);

      }
    }
    else
    {
      objc_msgSend(v5, "setState:animated:", 10, 1);
      Object = PKLogFacilityTypeGetObject(11);
      v12 = objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134217984;
        v26 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Failed to get remote status.", buf, 0xCu);
      }

      objc_msgSend(v4, "_resizeBubbleViewToReferenceSizeAnimated");
    }
    v18 = v4[3];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000557C;
    v19[3] = &unk_1000207D0;
    objc_copyWeak(&v20, v2);
    objc_msgSend(v18, "performPostRender:", v19);
    objc_destroyWeak(&v20);
  }

}

void sub_1000054D8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000054F4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "appController"));
  objc_msgSend(v2, "updateWithPeerPaymentStatusResponse:animated:", v1, objc_msgSend(v3, "appReadyForDisplay"));

}

void sub_10000554C(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_resizeBubbleViewToReferenceSizeAnimated");
    WeakRetained = v2;
  }

}

void sub_10000557C(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "appController"));
    objc_msgSend(v2, "noteReadyForDisplay");

    WeakRetained = v3;
  }

}

void sub_1000055C4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "appController"));
    objc_msgSend(v3, "noteReadyForDisplay");

    WeakRetained = v4;
  }

}

void sub_1000058D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000058F8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *(CGSize *)(*(_QWORD *)(a1 + 32) + 48) = CGSizeZero;
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(v2, "frame");
    objc_msgSend(v2, "setFrame:");
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
  }

}

void sub_100006770(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000678C(id *a1, int a2)
{
  id *v4;
  id *WeakRetained;
  id *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v4 = a1 + 6;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[9], "webService"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_appleAccountInformation"));

      v9 = PKPeerPaymentSenderAddressForRecipientAddress(a1[4]);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = v10;
      if (v10)
        v12 = v10;
      else
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "primaryEmailAddress"));
      v14 = v12;

      objc_msgSend(v6[9], "reset");
      v15 = v6[9];
      v16 = a1[4];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100006900;
      v17[3] = &unk_100020AA0;
      objc_copyWeak(&v20, v4);
      v19 = a1[5];
      v18 = a1[4];
      objc_msgSend(v15, "identifyRecipientWithAddress:senderAddress:completion:", v16, v14, v17);

      objc_destroyWeak(&v20);
    }
    else
    {
      v13 = (void (**)(id, _QWORD))a1[5];
      if (v13)
        v13[2](v13, 0);
    }
  }

}

void sub_1000068EC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100006900(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17[2];

  v7 = a3;
  v8 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006A00;
  v12[3] = &unk_100020A78;
  objc_copyWeak(v17, a1 + 6);
  v13 = v8;
  v9 = a1[5];
  v17[1] = a2;
  v16 = v9;
  v14 = v7;
  v15 = a1[4];
  v10 = v7;
  v11 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

  objc_destroyWeak(v17);
}

void sub_100006A00(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
    goto LABEL_17;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = PKAlertForDisplayableError(v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (v5)
    {
      v6 = objc_loadWeakRetained(WeakRetained + 4);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100006B7C;
      v13[3] = &unk_100020A50;
      v14 = *(id *)(a1 + 56);
      objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, v13);

    }
    else
    {
      v10 = *(_QWORD *)(a1 + 56);
      if (v10)
        (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
    }

    goto LABEL_17;
  }
  v7 = *(_QWORD *)(a1 + 72);
  if (v7 == 2)
  {
LABEL_8:
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "displayName"));
    if (objc_msgSend(v8, "length"))
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "displayName"));
    else
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[9], "displayNameForRecipientAddress:", *(_QWORD *)(a1 + 48)));
    v12 = (void *)v9;

    objc_msgSend(WeakRetained, "_showAlertForInvalidRecipientWithName:statusReason:completion:", v12, objc_msgSend(*(id *)(a1 + 40), "statusReason"), *(_QWORD *)(a1 + 56));
    goto LABEL_17;
  }
  if (v7 != 1)
  {
    if (v7)
      goto LABEL_17;
    goto LABEL_8;
  }
  objc_storeStrong(WeakRetained + 1, *(id *)(a1 + 40));
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, 1);
LABEL_17:

}

uint64_t sub_100006B7C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void sub_100006EA0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_100006EDC(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;

  v7 = a3;
  v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006FC4;
  block[3] = &unk_100020AF0;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v17 = a2;
  v13 = v7;
  v9 = *(id *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v10 = v8;
  v11 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v16);
}

void sub_100006FC4(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v14 = WeakRetained;
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(WeakRetained, "_confirmPaymentMessageInsertionWithQuote:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
LABEL_11:
      WeakRetained = v14;
      goto LABEL_12;
    }
    v3 = *(id *)(a1 + 40);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", NSUnderlyingErrorKey));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    if (objc_msgSend(v6, "isEqualToString:", PKPeerPaymentWebServiceErrorDomain))
    {
      v7 = objc_msgSend(v5, "code");

      if (v7)
      {
LABEL_8:
        objc_msgSend(v14, "_handleError:", v3);
        v13 = *(_QWORD *)(a1 + 48);
        if (v13)
          (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);

        goto LABEL_11;
      }
      v8 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SEND_MONEY_GENERIC_ERROR_TITLE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v9 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SEND_MONEY_GENERIC_ERROR_MESSAGE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = PKDisplayableErrorCustom(v6, v10, v5, 0);
      v12 = objc_claimAutoreleasedReturnValue(v11);

      v3 = (id)v12;
    }

    goto LABEL_8;
  }
LABEL_12:

}

void sub_100007110(id *a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;

  v7 = a3;
  v8 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000720C;
  v12[3] = &unk_100020B40;
  objc_copyWeak(&v17, a1 + 6);
  v18 = a2;
  v13 = v7;
  v14 = a1[4];
  v9 = a1[5];
  v15 = v8;
  v16 = v9;
  v10 = v8;
  v11 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

  objc_destroyWeak(&v17);
}

void sub_10000720C(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v15 = WeakRetained;
    if (*(_BYTE *)(a1 + 72))
    {
      v3 = *(void **)(a1 + 32);
      if (v3)
      {
        objc_storeStrong(WeakRetained + 7, v3);
        objc_msgSend(v15, "_insertRequestMessageWithAmount:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
LABEL_12:
        WeakRetained = v15;
        goto LABEL_13;
      }
    }
    v4 = *(id *)(a1 + 48);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", NSUnderlyingErrorKey));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    if (objc_msgSend(v7, "isEqualToString:", PKPeerPaymentWebServiceErrorDomain))
    {
      v8 = objc_msgSend(v6, "code");

      if (v8)
      {
LABEL_9:
        objc_msgSend(v15, "_handleError:", v4);
        v14 = *(_QWORD *)(a1 + 56);
        if (v14)
          (*(void (**)(uint64_t, _QWORD))(v14 + 16))(v14, 0);

        goto LABEL_12;
      }
      v9 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_REQUEST_MONEY_GENERIC_ERROR_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v10 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_REQUEST_MONEY_GENERIC_ERROR_MESSAGE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = PKDisplayableErrorCustom(v7, v11, v6, 0);
      v13 = objc_claimAutoreleasedReturnValue(v12);

      v4 = (id)v13;
    }

    goto LABEL_9;
  }
LABEL_13:

}

void sub_10000764C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_100007680(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;

  v7 = a3;
  v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000777C;
  block[3] = &unk_100020B90;
  objc_copyWeak(&v18, (id *)(a1 + 56));
  v19 = a2;
  v9 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v15 = v9;
  v10 = *(id *)(a1 + 48);
  v16 = v8;
  v17 = v10;
  v11 = v8;
  v12 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v18);
}

void sub_10000777C(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v24 = WeakRetained;
    if (*(_BYTE *)(a1 + 80))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "identifier"));

      if (!v3)
      {
        v4 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "recurringPaymentIdentifier"));
        objc_msgSend(v4, "setIdentifier:", v5);

      }
      v6 = objc_alloc((Class)MSSession);
      v7 = objc_alloc((Class)NSUUID);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "identifier"));
      v9 = objc_msgSend(v7, "initWithUUIDString:", v8);
      v10 = objc_msgSend(v6, "initWithIdentifier:", v9);
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 48);
      *(_QWORD *)(v11 + 48) = v10;

      objc_msgSend(v24, "_confirmPaymentMessageInsertionWithQuote:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
LABEL_13:
      WeakRetained = v24;
      goto LABEL_14;
    }
    v13 = *(id *)(a1 + 56);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", NSUnderlyingErrorKey));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domain"));
    if (objc_msgSend(v16, "isEqualToString:", PKPeerPaymentWebServiceErrorDomain))
    {
      v17 = objc_msgSend(v15, "code");

      if (v17)
      {
LABEL_10:
        objc_msgSend(v24, "_handleError:", v13);
        v23 = *(_QWORD *)(a1 + 64);
        if (v23)
          (*(void (**)(uint64_t, _QWORD))(v23 + 16))(v23, 0);

        goto LABEL_13;
      }
      v18 = PKLocalizedPeerPaymentRecurringString(CFSTR("SETUP_GENERIC_ERROR_TITLE"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v19 = PKLocalizedPeerPaymentRecurringString(CFSTR("SETUP_GENERIC_ERROR_MESSAGE"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = PKDisplayableErrorCustom(v16, v20, v15, 0);
      v22 = objc_claimAutoreleasedReturnValue(v21);

      v13 = (id)v22;
    }

    goto LABEL_10;
  }
LABEL_14:

}

uint64_t sub_100007B08(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t sub_100007CC0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void sub_1000080E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000810C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  uint64_t Object;
  NSObject *v8;
  uint64_t v9;
  uint8_t v10[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 56) == a3)
    {
      objc_msgSend(WeakRetained, "_insertPaymentMessageWithQuote:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
    else
    {
      Object = PKLogFacilityTypeGetObject(11);
      v8 = objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Wallet: User does not want to insert payment message.", v10, 2u);
      }

      v9 = *(_QWORD *)(a1 + 40);
      if (v9)
        (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
    }
  }

}

void sub_1000086A8(id *a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v4 = objc_alloc((Class)PKPeerPaymentMessageComposeController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "underlyingMessage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "recipientAddress"));
    v7 = objc_msgSend(v4, "initWithMessage:recipientAddress:", v5, v6);
    v8 = (void *)*((_QWORD *)WeakRetained + 3);
    *((_QWORD *)WeakRetained + 3) = v7;

    v9 = (void *)*((_QWORD *)WeakRetained + 3);
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_1000087F0;
    v15 = &unk_100020C30;
    objc_copyWeak(&v17, v2);
    v16 = a1[5];
    objc_msgSend(v9, "setCompletionHandler:", &v12);
    v10 = (void *)*((_QWORD *)WeakRetained + 3);
    v11 = objc_loadWeakRetained((id *)WeakRetained + 4);
    objc_msgSend(v10, "presentMessageOverController:presentationHandler:", v11, 0, v12, v13, v14, v15);

    objc_destroyWeak(&v17);
  }

}

void sub_1000087D8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000087F0(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (*v9)(void);
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (!a2 || a2 == 2)
    {
      v8 = *(_QWORD *)(a1 + 32);
      if (!v8)
        goto LABEL_10;
      v9 = *(void (**)(void))(v8 + 16);
      goto LABEL_9;
    }
    if (a2 == 1)
    {
      if (WeakRetained[8])
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[PKPeerPaymentService sharedInstance](PKPeerPaymentService, "sharedInstance"));
        v13 = v5[8];
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_100008938;
        v11[3] = &unk_100020A50;
        v12 = *(id *)(a1 + 32);
        objc_msgSend(v6, "insertOrUpdateRecurringPayments:completion:", v7, v11);

        goto LABEL_10;
      }
      v10 = *(_QWORD *)(a1 + 32);
      if (!v10)
        goto LABEL_10;
      v9 = *(void (**)(void))(v10 + 16);
LABEL_9:
      v9();
    }
  }
LABEL_10:

}

uint64_t sub_100008938(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void sub_100008B60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  if (a3 == 2)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
      objc_msgSend(v4, "openSensitiveURL:withOptions:", *(_QWORD *)(a1 + 32), 0);

    }
  }
}

const __CFString *PKPeerPaymentMessagesContentStateToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD)
    return CFSTR("Unknown");
  else
    return *(&off_1000212F0 + a1 - 1);
}

void sub_100008F98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008FC0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100009064;
  v5[3] = &unk_100020A00;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_100009064(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = objc_msgSend(objc_alloc((Class)PKFamilyMemberCollection), "initWithFamilyMembers:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "_updateWithFamilyCollection:", v2);

  }
}

void sub_10000992C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t Object;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  double v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 24);
  if (v3 == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(v2 + 48), "reloadContent");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setNeedsLayout");
  }
  else
  {
    Object = PKLogFacilityTypeGetObject(11);
    v5 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = PKPeerPaymentMessagesContentStateToString(v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = PKPeerPaymentMessagesContentStateToString(*(_QWORD *)(a1 + 40));
      v9 = objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)v9;
      v11 = *(unsigned __int8 *)(a1 + 48);
      *(_DWORD *)buf = 134218754;
      v30 = v2;
      if (v11)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      v31 = 2114;
      v32 = v7;
      v33 = 2114;
      v34 = v9;
      v35 = 2114;
      v36 = v12;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesAppViewController %p: Changed content state. From %{public}@ -> %{public}@. (animated: %{public}@)", buf, 0x2Au);

    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 40);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_viewControllerForState:shouldLoad:", v3, 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_viewControllerForState:shouldLoad:", *(_QWORD *)(a1 + 40), 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "bounds");
    objc_msgSend(v15, "setFrame:");

    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 48);
    *(_QWORD *)(v16 + 48) = v14;
    v18 = v14;

    if (v13)
    {
      if (*(_BYTE *)(a1 + 48))
        v19 = 0.4;
      else
        v19 = 0.0;
      objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", v18);
      objc_msgSend(v18, "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));
      v20 = *(void **)(a1 + 32);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100009C38;
      v25[3] = &unk_100020CE8;
      v21 = v13;
      v22 = *(_QWORD *)(a1 + 32);
      v26 = v21;
      v27 = v22;
      v28 = v3;
      objc_msgSend(v20, "transitionFromViewController:toViewController:duration:options:animations:completion:", v21, v18, 5242912, 0, v25, v19);

    }
    else
    {
      v23 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
      objc_msgSend(v23, "addSubview:", v24);

      objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", v18);
      objc_msgSend(v18, "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setNeedsLayout");

  }
}

void sub_100009C38(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "willMoveToParentViewController:", 0);
    objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v3));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);

  }
}

void sub_100009F88(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;

  v23 = a3;
  v7 = a4;
  if (a2 != 1)
  {
    if (objc_msgSend(v23, "statusReason") == (id)2)
    {
      v10 = *(void **)(a1 + 32);
      v11 = 14;
      goto LABEL_7;
    }
    v14 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "domain"));
    v16 = objc_msgSend(v15, "isEqualToString:", PKDisplayableErrorDomain);

    v13 = v14;
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

    }
    if (+[PKPeerPaymentController errorIsTermsAcceptanceRequiredError:](PKPeerPaymentController, "errorIsTermsAcceptanceRequiredError:", v13))
    {
LABEL_12:
      objc_msgSend(*(id *)(a1 + 32), "_handleError:", v14);
      goto LABEL_20;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain"));
    v19 = objc_msgSend(v18, "isEqualToString:", PKPeerPaymentWebServiceErrorDomain);

    if (v19)
    {
      if (objc_msgSend(v13, "code") == (id)40312)
      {
        v20 = *(void **)(a1 + 32);
        v21 = 6;
      }
      else
      {
        if (objc_msgSend(v13, "code") != (id)40309)
        {
          v22 = objc_msgSend(v13, "code");
          objc_msgSend(*(id *)(a1 + 32), "_transitionToState:animated:", 8, 1);
          if (v22 != (id)40310)
            goto LABEL_20;
          goto LABEL_12;
        }
        v20 = *(void **)(a1 + 32);
        v21 = 5;
      }
    }
    else
    {
      v20 = *(void **)(a1 + 32);
      v21 = 8;
    }
    objc_msgSend(v20, "_transitionToState:animated:", v21, 1);
    goto LABEL_20;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "recipientFoundInContacts") & 1) != 0
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "account")),
        v9 = objc_msgSend(v8, "sendRestrictionType"),
        v8,
        v9 != (id)2))
  {
    objc_msgSend(*(id *)(a1 + 32), "_transitionToState:animated:", 11, 1);
    v12 = *(void **)(a1 + 32);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "phoneOrEmail"));
    objc_msgSend(v12, "_prewarmDeviceScoreForRecipient:", v13);
LABEL_20:

    goto LABEL_21;
  }
  v10 = *(void **)(a1 + 32);
  v11 = 13;
LABEL_7:
  objc_msgSend(v10, "_transitionToState:animated:", v11, 1);
LABEL_21:

}

void sub_10000AFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B014(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t Object;
  NSObject *v5;
  uint64_t result;
  uint8_t v7[16];

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a1[6] == a3;
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    Object = PKLogFacilityTypeGetObject(11);
    v5 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: User does not want to send payment message.", v7, 2u);
    }

  }
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24));
  return result;
}

void sub_10000B418(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t Object;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;

  if (a2)
  {
    if (*(_QWORD *)(a1 + 32) && *(_BYTE *)(a1 + 88))
    {
      v3 = *(void **)(a1 + 40);
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "identifier"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10000B658;
      v21[3] = &unk_100020E18;
      v21[4] = *(_QWORD *)(a1 + 40);
      v22 = *(id *)(a1 + 56);
      v23 = *(id *)(a1 + 64);
      v5 = *(id *)(a1 + 48);
      v7 = *(void **)(a1 + 72);
      v6 = *(_QWORD *)(a1 + 80);
      v24 = v5;
      v26 = v6;
      v25 = v7;
      objc_msgSend(v3, "_hostSceneIdentifierForMessageIdentifier:withCompletion:", v4, v21);

      return;
    }
    Object = PKLogFacilityTypeGetObject(11);
    v12 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Failed to restore controller state. Hence failing validation.", buf, 2u);
    }

    v13 = *(void **)(a1 + 40);
    v14 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONTROLLER_STATE_UNAVAILABLE_ERROR_TITLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONTROLLER_STATE_UNAVAILABLE_ERROR_DESCRIPTION"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = PKDisplayableErrorCustom(v15, v17, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v13, "_handleError:", v19);

  }
  else
  {
    v8 = PKLogFacilityTypeGetObject(11);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not performing a peer payment quote for message %@", buf, 0xCu);
    }

  }
  v20 = *(_QWORD *)(a1 + 72);
  if (v20)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v20 + 16))(v20, 0, 0);
}

void sub_10000B658(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), a2);
  v4 = a2;
  v5 = *(void **)(a1 + 40);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000B73C;
  v11[3] = &unk_100020DF0;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v14 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v10 = *(void **)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 72);
  v15 = v8;
  v17 = v9;
  v16 = v10;
  objc_msgSend(v6, "performQuoteWithCompletion:", v11);

}

void sub_10000B73C(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v5;
  id v7;
  id v8;
  uint64_t Object;
  NSObject *v10;
  _BOOL4 v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  __CFString *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];
  __CFString *v49;
  uint8_t buf[4];
  const __CFString *v51;
  __int16 v52;
  id v53;

  LODWORD(v5) = a2;
  v7 = a3;
  v8 = a4;
  Object = PKLogFacilityTypeGetObject(11);
  v10 = objc_claimAutoreleasedReturnValue(Object);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  v12 = CFSTR("NO");
  if (v11)
  {
    if ((_DWORD)v5)
      v12 = CFSTR("YES");
    *(_DWORD *)buf = 138543618;
    v51 = v12;
    v52 = 2112;
    v53 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: performQuoteWithCompletion returned success: %{public}@ error: %@", buf, 0x16u);
  }

  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(void **)(v13 + 112);
  *(_QWORD *)(v13 + 112) = 0;

  v15 = 0;
  if (v7)
    v5 = v5;
  else
    v5 = 0;
  if (v8 && (v5 & 1) == 0)
  {
    v16 = PKTitleForDisplayableError(v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v16);
  }
  if (objc_msgSend(*(id *)(a1 + 48), "length"))
    v17 = *(id *)(a1 + 48);
  else
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "memo"));
  v18 = v17;
  if (!(_DWORD)v5)
  {
    if (!v8)
      goto LABEL_42;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", NSUnderlyingErrorKey));

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "domain"));
    if (objc_msgSend(v27, "isEqualToString:", PKPeerPaymentWebServiceErrorDomain))
    {
      v28 = objc_msgSend(v26, "code");

      if (v28)
      {
LABEL_24:
        objc_msgSend(*(id *)(a1 + 40), "_handleError:", v8, v47);

        v15 = 0;
LABEL_41:

        goto LABEL_42;
      }
      v29 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SEND_MONEY_GENERIC_ERROR_TITLE"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v30 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SEND_MONEY_GENERIC_ERROR_MESSAGE"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v32 = PKDisplayableErrorCustom(v27, v31, v26, 0);
      v47 = objc_claimAutoreleasedReturnValue(v32);

      v8 = (id)v47;
    }

    goto LABEL_24;
  }
  objc_msgSend(*(id *)(a1 + 56), "updateWithPeerPaymentPerformResponse:", v7);
  v19 = *(_QWORD *)(a1 + 72);
  if (v19 == 3)
  {
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recurringPaymentIdentifier"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v33;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Recurring payment created with identifier : %@", buf, 0xCu);
    }

    v20 = (id)objc_claimAutoreleasedReturnValue(+[PKPeerPaymentService sharedInstance](PKPeerPaymentService, "sharedInstance"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "recurringPaymentMemo"));
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10000BD34;
    v48[3] = &unk_100020D88;
    v49 = v33;
    v35 = v33;
    objc_msgSend(v20, "updateRecurringPaymentMemo:identifier:completion:", v34, v35, v48);

    objc_msgSend(v20, "updateRecurringPaymentsWithCompletion:", &stru_100020DC8);
    goto LABEL_30;
  }
  if (v19 == 1)
  {
    v20 = objc_alloc_init((Class)PKProtobufPeerPaymentMessage);
    objc_msgSend(v20, "setMemo:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transactionIdentifier"));
    objc_msgSend(v20, "setTransactionIdentifier:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[PKPeerPaymentService sharedInstance](PKPeerPaymentService, "sharedInstance"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "data"));
    objc_msgSend(v22, "receivedPeerPaymentMessageData:", v23);

    if (objc_msgSend(v18, "length"))
    {
      objc_msgSend(*(id *)(a1 + 56), "setMemo:", v18);
      v24 = &PKAggDKeyPeerPaymentBubbleSendWithMemo;
    }
    else
    {
      v24 = &PKAggDKeyPeerPaymentBubbleSendWithoutMemo;
    }
    PKAnalyticsSendEvent(*v24, 0);
    objc_msgSend(*(id *)(a1 + 56), "reportMessageSent");
LABEL_30:

  }
  if (objc_msgSend(*(id *)(a1 + 40), "_peerPaymentParicipantShouldSeeMemoSharingMessageForMemo:", v18)
    && objc_msgSend(*(id *)(a1 + 32), "mode") == (id)1)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Marking the peer payment participant account as seeing the memo sharing message.", buf, 2u);
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v36, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("PKPeerPaymentParticipantSharingMemoMessage"));

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[PKMessagesAppSharedContext sharedContext](PKMessagesAppSharedContext, "sharedContext"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "identifier"));
  objc_msgSend(v37, "removeExternalizedControllerStateDataForMessageIdentifier:", v38);

  v39 = *(const __CFString **)(a1 + 40);
  if (v39[2].isa || v39[2].info)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v51 = v39;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Controller:%p Invalidating pending request values post successful perform quote.", buf, 0xCu);
    }

    v40 = *(_QWORD *)(a1 + 40);
    v41 = *(void **)(v40 + 64);
    *(_QWORD *)(v40 + 64) = 0;

    v42 = *(_QWORD *)(a1 + 40);
    v43 = *(void **)(v42 + 72);
    *(_QWORD *)(v42 + 72) = 0;

    v44 = *(_QWORD *)(a1 + 40);
    v26 = *(void **)(v44 + 80);
    *(_QWORD *)(v44 + 80) = 0;
    goto LABEL_41;
  }
LABEL_42:
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v45 = CFSTR("NO");
    if ((_DWORD)v5)
      v45 = CFSTR("YES");
    *(_DWORD *)buf = 138543618;
    v51 = v45;
    v52 = 2112;
    v53 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Calling payment completion with shouldSend: %{public}@, localizedInvalidationDescription: %@", buf, 0x16u);
  }

  v46 = *(_QWORD *)(a1 + 64);
  if (v46)
    (*(void (**)(uint64_t, uint64_t, void *))(v46 + 16))(v46, v5, v15);

}

void sub_10000BD34(uint64_t a1)
{
  uint64_t Object;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  Object = PKLogFacilityTypeGetObject(11);
  v3 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Memo updated for recurring payment %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_10000BDDC(id a1, NSArray *a2, NSError *a3)
{
  uint64_t Object;
  NSObject *v4;
  uint8_t v5[16];

  Object = PKLogFacilityTypeGetObject(11);
  v4 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updated recurring payments after message insertion", v5, 2u);
  }

}

void sub_10000C2C8(uint64_t a1, void *a2)
{
  CGContext *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[PKPeerPaymentTheme backgroundColor](PKPeerPaymentTheme, "backgroundColor")));
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v4, "CGColor"));

  CGContextFillRect(v3, *(CGRect *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "presentationStyle") == (id)2)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_viewControllerForState:shouldLoad:", 12, 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "generatedSnapshot"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    objc_msgSend(v6, "frame");
    objc_msgSend(v5, "drawInRect:");

  }
}

void sub_10000CF30(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "paymentIdentifier"));
    objc_msgSend(v3, "_handlePeerPaymentRemoteAlertCompletedForPaymentIdentifier:completion:", v5, *(_QWORD *)(a1 + 48));

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
}

void sub_10000CFAC(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  char v14;

  v6 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000D050;
  v10[3] = &unk_100020EB8;
  v14 = a2;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v11 = v6;
  v12 = v7;
  v13 = v8;
  v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

}

void sub_10000D050(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v2 = *(unsigned __int8 *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 56))
  {
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      v14 = v4;
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", NSUnderlyingErrorKey));

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      if (objc_msgSend(v7, "isEqualToString:", PKPeerPaymentWebServiceErrorDomain))
      {
        v8 = objc_msgSend(v6, "code");

        if (v8)
        {
LABEL_9:
          objc_msgSend(*(id *)(a1 + 40), "_handleError:forAction:withCompletion:", v14, 4, *(_QWORD *)(a1 + 48));

          return;
        }
        v9 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACCEPT_MONEY_GENERIC_ERROR_TITLE"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v10 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACCEPT_MONEY_GENERIC_ERROR_MESSAGE"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = PKDisplayableErrorCustom(v7, v11, v6, 0);
        v13 = objc_claimAutoreleasedReturnValue(v12);

        v14 = (id)v13;
      }

      goto LABEL_9;
    }
  }
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, BOOL))(v3 + 16))(v3, v2 != 0);
}

uint64_t sub_10000D1B0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10000D1C4(id a1, __CFUserNotification *a2, unint64_t a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  if (!a3)
  {
    v3 = objc_alloc((Class)NSURL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("wallet://%@"), PKUserNotificationActionRouteAddPaymentCard));
    v6 = objc_msgSend(v3, "initWithString:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v5, "openSensitiveURL:withOptions:", v6, 0);

  }
}

uint64_t sub_10000D264(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10000D988(id a1, __CFUserNotification *a2, unint64_t a3)
{
  void *v3;
  id v4;

  if (!a3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=PASSBOOK")));
    objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

  }
}

id *sub_10000D9F8(id *result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return (id *)objc_msgSend(result[4], "_presentInlineSetupFlowWithPeerPaymentMessage:flowState:completion:", result[5], 0, 0);
  return result;
}

void sub_10000DE8C(id a1, __CFUserNotification *a2, unint64_t a3)
{
  void *v3;
  id v4;

  if (!a3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=PASSBOOK")));
    objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

  }
}

id *sub_10000DEFC(id *result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return (id *)objc_msgSend(result[4], "_presentInlineSetupFlowWithPeerPaymentMessage:flowState:completion:", result[5], 0, 0);
  return result;
}

void sub_10000E044(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  _BOOL4 v12;
  double v13;
  int v14;
  void *v15;
  id v16;

  v16 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "underlyingMessage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "senderParticipantIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "activeConversation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localParticipantIdentifier"));
  v7 = objc_msgSend(v4, "isEqual:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "peerPaymentMessageReceivedDate"));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v12 = v11 != 0.0;
  }
  else
  {
    v12 = 0;
  }
  if (v8)
  {
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    if (v16)
      v14 = v12;
    else
      v14 = 1;
    if (v13 == 0.0)
      v14 = 1;
    if (((v14 | v7) & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[PKPeerPaymentService sharedInstance](PKPeerPaymentService, "sharedInstance"));
      objc_msgSend(v15, "updateMessageReceivedDate:forTransactionWithIdentifier:", v8, *(_QWORD *)(a1 + 48));

      objc_msgSend(v16, "setPeerPaymentMessageReceivedDate:", v8);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void sub_10000E258(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t Object;
  NSObject *v8;
  int v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    Object = PKLogFacilityTypeGetObject(11);
    v8 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: Failed to get status for message with error: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t sub_10000E988(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10000E99C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10000EE10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10000EE20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_10000EEE4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentInlineSetupFlowWithAmount:flowState:senderAddress:hostSceneIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), 0, a2, *(_QWORD *)(a1 + 48));
}

void sub_10000EFC8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currencyAmount"));
  v6 = *(_QWORD *)(a1 + 56);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "senderAddress"));
  objc_msgSend(v3, "_presentInlineSetupFlowWithAmount:flowState:senderAddress:hostSceneIdentifier:completion:", v8, v6, v7, v5, *(_QWORD *)(a1 + 48));

}

uint64_t sub_10000F27C(uint64_t a1, uint64_t a2)
{
  uint64_t Object;
  NSObject *v5;
  const __CFString *v6;
  uint64_t result;
  int v8;
  const __CFString *v9;

  Object = PKLogFacilityTypeGetObject(11);
  v5 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if ((_DWORD)a2)
      v6 = CFSTR("YES");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer payment setup flow presented with success %{public}@.", (uint8_t *)&v8, 0xCu);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void sub_10000F990(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;

  if (a2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_currentRequestTokenForAmount:", *(_QWORD *)(a1 + 40)));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v4 + 16);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000FA68;
    v8[3] = &unk_1000210D8;
    v8[4] = v4;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v6, "quoteWithAmount:source:requestToken:completion:", v5, 1, v3, v8);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }
}

void sub_10000FA68(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  char v16;

  v7 = a3;
  v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FB2C;
  block[3] = &unk_1000210B0;
  v16 = a2;
  v9 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v14 = v8;
  v15 = v9;
  v10 = v8;
  v11 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10000FB2C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "_confirmPaymentMessageInsertionWithQuote:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    return;
  }
  v12 = *(id *)(a1 + 48);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", NSUnderlyingErrorKey));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (!objc_msgSend(v4, "isEqualToString:", PKPeerPaymentWebServiceErrorDomain))
    goto LABEL_6;
  v5 = objc_msgSend(v3, "code");

  if (!v5)
  {
    v6 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SEND_MONEY_GENERIC_ERROR_TITLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v7 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SEND_MONEY_GENERIC_ERROR_MESSAGE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = PKDisplayableErrorCustom(v4, v8, v3, 0);
    v10 = objc_claimAutoreleasedReturnValue(v9);

    v12 = (id)v10;
LABEL_6:

  }
  objc_msgSend(*(id *)(a1 + 32), "_handleError:", v12);
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);

}

void sub_10000FD7C(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(v3 + 16);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000FE50;
    v7[3] = &unk_100021128;
    v7[4] = v3;
    v8 = v4;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v5, "formalRequestTokenForAmount:source:completion:", v8, 2, v7);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }
}

void sub_10000FE50(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  char v20;

  v7 = a3;
  v8 = a4;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000FF28;
  v14[3] = &unk_100021100;
  v20 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v15 = v7;
  v16 = v9;
  v17 = v10;
  v11 = *(id *)(a1 + 48);
  v18 = v8;
  v19 = v11;
  v12 = v8;
  v13 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

}

void sub_10000FF28(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  if (*(_BYTE *)(a1 + 72) && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_insertRequestMessageWithAmount:requestToken:completion:", *(_QWORD *)(a1 + 48));
    return;
  }
  v12 = *(id *)(a1 + 56);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", NSUnderlyingErrorKey));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (!objc_msgSend(v4, "isEqualToString:", PKPeerPaymentWebServiceErrorDomain))
    goto LABEL_7;
  v5 = objc_msgSend(v3, "code");

  if (!v5)
  {
    v6 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_REQUEST_MONEY_GENERIC_ERROR_TITLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v7 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_REQUEST_MONEY_GENERIC_ERROR_MESSAGE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = PKDisplayableErrorCustom(v4, v8, v3, 0);
    v10 = objc_claimAutoreleasedReturnValue(v9);

    v12 = (id)v10;
LABEL_7:

  }
  objc_msgSend(*(id *)(a1 + 40), "_handleError:", v12);
  v11 = *(_QWORD *)(a1 + 64);
  if (v11)
    (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);

}

void sub_1000101E0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100010204(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  if (a2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "usesAppleCashBalance"))
      v3 = 2;
    else
      v3 = 1;
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    v7 = objc_msgSend(*(id *)(a1 + 32), "frequency");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "startDate"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100010370;
    v10[3] = &unk_100020B18;
    objc_copyWeak(&v12, (id *)(a1 + 64));
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v4, "quoteWithAmount:source:requestToken:alternateFundingSource:preserveCurrentBalance:recurringPaymentIdentifier:frequency:startDate:threshold:completion:", v5, 1, 0, 0, v3, v6, v7, v8, 0, v10);

    objc_destroyWeak(&v12);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 56);
    if (v9)
      (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
  }
}

void sub_10001035C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100010370(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;

  v7 = a3;
  v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010458;
  block[3] = &unk_100020AF0;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v17 = a2;
  v13 = v7;
  v9 = *(id *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v10 = v8;
  v11 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v16);
}

void sub_100010458(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v14 = WeakRetained;
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(WeakRetained, "_confirmPaymentMessageInsertionWithQuote:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
LABEL_11:
      WeakRetained = v14;
      goto LABEL_12;
    }
    v3 = *(id *)(a1 + 40);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", NSUnderlyingErrorKey));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    if (objc_msgSend(v6, "isEqualToString:", PKPeerPaymentWebServiceErrorDomain))
    {
      v7 = objc_msgSend(v5, "code");

      if (v7)
      {
LABEL_8:
        objc_msgSend(v14, "_handleError:", v3);
        v13 = *(_QWORD *)(a1 + 48);
        if (v13)
          (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);

        goto LABEL_11;
      }
      v8 = PKLocalizedPeerPaymentRecurringString(CFSTR("SETUP_GENERIC_ERROR_TITLE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v9 = PKLocalizedPeerPaymentRecurringString(CFSTR("SETUP_GENERIC_ERROR_MESSAGE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = PKDisplayableErrorCustom(v6, v10, v5, 0);
      v12 = objc_claimAutoreleasedReturnValue(v11);

      v3 = (id)v12;
    }

    goto LABEL_8;
  }
LABEL_12:

}

uint64_t (**sub_100010828(uint64_t a1, uint64_t a2, uint64_t a3))(id, _QWORD)
{
  uint64_t Object;
  NSObject *v5;
  uint64_t (**result)(id, _QWORD);
  uint8_t v7[16];

  if (!a3)
    return (uint64_t (**)(id, _QWORD))objc_msgSend(*(id *)(a1 + 32), "_insertPaymentMessageWithQuote:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  Object = PKLogFacilityTypeGetObject(11);
  v5 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer Payment Messages Extension: User does not want to insert payment message.", v7, 2u);
  }

  result = *(uint64_t (***)(id, _QWORD))(a1 + 48);
  if (result)
    return (uint64_t (**)(id, _QWORD))result[2](result, 0);
  return result;
}

void sub_100010D20(uint64_t a1, void *a2)
{
  id v3;
  uint64_t Object;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;

  v3 = a2;
  if (v3)
  {
    Object = PKLogFacilityTypeGetObject(11);
    v5 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error inserting message: %@ with error: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_handleError:", v3);
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010E74;
    block[3] = &unk_1000211C8;
    v8 = *(id *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(a1 + 48);
    v12 = v8;
    v13 = v9;
    v14 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

void sub_100010E74(uint64_t a1)
{
  uint64_t Object;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _UNKNOWN **v7;
  void *v8;
  double v9;
  double v10;
  dispatch_time_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  uint64_t v16;

  Object = PKLogFacilityTypeGetObject(11);
  v3 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Inserted message: %@", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("PKBubbleInsertionDismissalDelay")));
  v8 = v7;
  if (!v7)
    v7 = &off_1000222D8;
  objc_msgSend(v7, "doubleValue");
  v10 = v9;

  v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100011004;
  v13[3] = &unk_1000211A0;
  v12 = *(void **)(a1 + 48);
  v13[4] = *(_QWORD *)(a1 + 40);
  v14 = v12;
  dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v13);

}

uint64_t sub_100011004(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "dismiss");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void sub_100011260(uint64_t a1, void *a2)
{
  id v3;
  uint64_t Object;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;

  v3 = a2;
  Object = PKLogFacilityTypeGetObject(11);
  v5 = objc_claimAutoreleasedReturnValue(Object);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v14 = v7;
      v15 = 2112;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error inserting message %@ with error: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_handleError:", v3);
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
  }
  else
  {
    if (v6)
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Inserted message: %@", buf, 0xCu);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000113E4;
    v11[3] = &unk_1000211A0;
    v10 = *(void **)(a1 + 48);
    v11[4] = *(_QWORD *)(a1 + 40);
    v12 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

  }
}

void sub_1000113E4(uint64_t a1)
{
  void *v2;
  void *v3;
  _UNKNOWN **v4;
  void *v5;
  double v6;
  double v7;
  dispatch_time_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("PKBubbleInsertionDismissalDelay")));
  v5 = v4;
  if (!v4)
    v4 = &off_1000222D8;
  objc_msgSend(v4, "doubleValue");
  v7 = v6;

  v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000114F0;
  v10[3] = &unk_1000211A0;
  v9 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v9;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v10);

}

uint64_t sub_1000114F0(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "dismiss");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void sub_100011860(uint64_t a1, uint64_t a2)
{
  uint64_t Object;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _DWORD v12[2];

  Object = PKLogFacilityTypeGetObject(11);
  v5 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Terms acceptance flow appeared with success: %d", (uint8_t *)v12, 8u);
  }

  if ((_DWORD)a2 && *(_QWORD *)(a1 + 48) == 4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activeConversation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedMessage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "peerPaymentMessage"));

    v9 = *(void **)(a1 + 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "paymentIdentifier"));
    objc_msgSend(v9, "_handlePeerPaymentRemoteAlertCompletedForPaymentIdentifier:completion:", v10, *(_QWORD *)(a1 + 40));

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, a2);
  }
}

uint64_t sub_100011994(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void sub_1000119AC(uint64_t a1, uint64_t a2)
{
  uint64_t Object;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _DWORD v12[2];

  Object = PKLogFacilityTypeGetObject(11);
  v5 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Identity verification flow appeared with success: %d", (uint8_t *)v12, 8u);
  }

  if ((_DWORD)a2 && *(_QWORD *)(a1 + 48) == 4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activeConversation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedMessage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "peerPaymentMessage"));

    v9 = *(void **)(a1 + 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "paymentIdentifier"));
    objc_msgSend(v9, "_handlePeerPaymentRemoteAlertCompletedForPaymentIdentifier:completion:", v10, *(_QWORD *)(a1 + 40));

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, a2);
  }
}

void sub_100011B8C(uint64_t a1)
{
  uint64_t Object;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;

  Object = PKLogFacilityTypeGetObject(11);
  v3 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Peer Payment Accept Payment Observer:  Handling In App Sheet Dismissal.", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "account"));
  v5 = +[PKPeerPaymentOnDeviceProvisioningCheck peerPaymentPassIsProvisionedOnDeviceForAccount:](PKPeerPaymentOnDeviceProvisioningCheck, "peerPaymentPassIsProvisionedOnDeviceForAccount:", v4);
  if ((v5 & 1) != 0)
  {

LABEL_6:
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Peer Payment Accept Payment Observer: Attempting to auto-accept payment with identifier: %@.", buf, 0xCu);
    }

    v9 = *(void **)(a1 + 40);
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v11 = PKPeerPaymentActionAccept;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100011D9C;
    v13[3] = &unk_100020EE0;
    v14 = v9;
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v10, "performAction:withPaymentIdentifier:completion:", v11, v14, v13);

    return;
  }
  v7 = PKUseMockSURFServer(v5, v6);

  if ((v7 & 1) != 0)
    goto LABEL_6;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Peer Payment Accept Payment Observer: Setup still required, calling completion with NO.", buf, 2u);
  }

  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
}

void sub_100011D9C(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  char v13;

  v6 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100011E50;
  v9[3] = &unk_100020EB8;
  v7 = *(id *)(a1 + 32);
  v13 = a2;
  v10 = v7;
  v11 = v6;
  v12 = *(id *)(a1 + 40);
  v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

}

uint64_t sub_100011E50(uint64_t a1)
{
  uint64_t Object;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;

  Object = PKLogFacilityTypeGetObject(11);
  v3 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(unsigned __int8 *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138412802;
    v9 = v5;
    v10 = 1024;
    v11 = v4;
    v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Peer Payment Accept Payment Observer: Payment with identifier: %@ successfully accepted: %i with error: %@.", (uint8_t *)&v8, 0x1Cu);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56));
  return result;
}

void sub_10001213C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  if (a3 == 2)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
      objc_msgSend(v4, "openSensitiveURL:withOptions:", *(_QWORD *)(a1 + 32), 0);

    }
  }
}

void sub_100012900(uint64_t a1)
{
  uint64_t Object;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  Object = PKLogFacilityTypeGetObject(11);
  v3 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting currency amount to %@ based on text input payload: %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_amountEntryViewController"));
  objc_msgSend(v6, "setAmount:", *(_QWORD *)(a1 + 32));

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 72), *(id *)(a1 + 32));
}

void sub_100012B40(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t Object;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  if (v2)
  {
    Object = PKLogFacilityTypeGetObject(11);
    v4 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error donating peer payment interaction: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

void sub_100013040(uint64_t a1)
{
  uint64_t Object;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  Object = PKLogFacilityTypeGetObject(11);
  v3 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received updated transaction for the bubble view being rendered. Reloading bubble view content.", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_viewControllerForState:shouldLoad:", 12, 0));
  objc_msgSend(v4, "reloadContent");

}

_QWORD *sub_100013444(_QWORD *result, void *a2)
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (a2)
  {
    v2 = (void *)result[4];
    v3 = a2;
    objc_msgSend(v3, "gravity");
    v5 = v4;
    objc_msgSend(v3, "gravity");
    v7 = v6;

    return objc_msgSend(v2, "setGravityDirection:", v5, -v7);
  }
  return result;
}

uint64_t sub_100013544(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGContext");
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGPath");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__accountIsLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_accountIsLocked");
}

id objc_msgSend__amountEntryViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_amountEntryViewController");
}

id objc_msgSend__appleAccountInformation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_appleAccountInformation");
}

id objc_msgSend__balloonMaskEdgeInsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_balloonMaskEdgeInsets");
}

id objc_msgSend__canPerformQuoteForMessage_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_canPerformQuoteForMessage:error:");
}

id objc_msgSend__confirmPaymentMessageInsertionWithQuote_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_confirmPaymentMessageInsertionWithQuote:completion:");
}

id objc_msgSend__confirmRequestAmount_toRecipientWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_confirmRequestAmount:toRecipientWithCompletion:");
}

id objc_msgSend__confirmSendAmount_toRecipientWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_confirmSendAmount:toRecipientWithCompletion:");
}

id objc_msgSend__createViewControllerForState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createViewControllerForState:");
}

id objc_msgSend__currentBalance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentBalance");
}

id objc_msgSend__currentRequestTokenForAmount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentRequestTokenForAmount:");
}

id objc_msgSend__donateInteractionWithBundleId_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_donateInteractionWithBundleId:completion:");
}

id objc_msgSend__donatePeerPaymentInteractionForMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_donatePeerPaymentInteractionForMessage:");
}

id objc_msgSend__fetchStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchStatus");
}

id objc_msgSend__handleError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleError:");
}

id objc_msgSend__handleError_forAction_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleError:forAction:withCompletion:");
}

id objc_msgSend__handlePeerPaymentRemoteAlertCompletedForPaymentIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handlePeerPaymentRemoteAlertCompletedForPaymentIdentifier:completion:");
}

id objc_msgSend__hostSceneIdentifierForMessageIdentifier_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hostSceneIdentifierForMessageIdentifier:withCompletion:");
}

id objc_msgSend__iMessageIsEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_iMessageIsEnabled");
}

id objc_msgSend__inCurrencyAmountForPeerPaymentMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_inCurrencyAmountForPeerPaymentMessage:");
}

id objc_msgSend__insertPaymentMessageWithQuote_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_insertPaymentMessageWithQuote:completion:");
}

id objc_msgSend__insertRequestMessageWithAmount_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_insertRequestMessageWithAmount:completion:");
}

id objc_msgSend__isBusinessConversation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isBusinessConversation");
}

id objc_msgSend__isGroupConversation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isGroupConversation");
}

id objc_msgSend__isMessage_validForTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isMessage:validForTransaction:");
}

id objc_msgSend__isMessageFromMe_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isMessageFromMe:");
}

id objc_msgSend__maximumTransferAmount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_maximumTransferAmount");
}

id objc_msgSend__minimumTransferAmount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_minimumTransferAmount");
}

id objc_msgSend__noteAmountChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_noteAmountChanged");
}

id objc_msgSend__openWallet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openWallet");
}

id objc_msgSend__peerPaymentParicipantShouldSeeMemoSharingMessageForMemo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_peerPaymentParicipantShouldSeeMemoSharingMessageForMemo:");
}

id objc_msgSend__percentExpanded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_percentExpanded");
}

id objc_msgSend__presentAlertWithDisplayableError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentAlertWithDisplayableError:");
}

id objc_msgSend__presentAlertWithTitle_message_buttonTitle_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentAlertWithTitle:message:buttonTitle:completion:");
}

id objc_msgSend__presentInlineSetupFlowWithAmount_flowState_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentInlineSetupFlowWithAmount:flowState:completion:");
}

id objc_msgSend__presentInlineSetupFlowWithAmount_flowState_senderAddress_hostSceneIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentInlineSetupFlowWithAmount:flowState:senderAddress:hostSceneIdentifier:completion:");
}

id objc_msgSend__presentInlineSetupFlowWithPeerPaymentMessage_flowState_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentInlineSetupFlowWithPeerPaymentMessage:flowState:completion:");
}

id objc_msgSend__presentPeerPaymentMessage_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentPeerPaymentMessage:completion:");
}

id objc_msgSend__presentSetupFlowWithPeerPaymentMessage_flowState_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentSetupFlowWithPeerPaymentMessage:flowState:completion:");
}

id objc_msgSend__presentationSemanticContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentationSemanticContext");
}

id objc_msgSend__prewarmDeviceScoreForRecipient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prewarmDeviceScoreForRecipient:");
}

id objc_msgSend__recipientAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recipientAddress");
}

id objc_msgSend__recipientAddressIsValid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recipientAddressIsValid:");
}

id objc_msgSend__recipientFoundInContacts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recipientFoundInContacts");
}

id objc_msgSend__recipientPersonForIntentDonation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recipientPersonForIntentDonation");
}

id objc_msgSend__registerAppViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerAppViewController:");
}

id objc_msgSend__registerForPresentationSemanticContextChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerForPresentationSemanticContextChanges");
}

id objc_msgSend__requiredContentState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requiredContentState");
}

id objc_msgSend__requiresEnablement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requiresEnablement");
}

id objc_msgSend__requiresSetupFlow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requiresSetupFlow");
}

id objc_msgSend__resizeBubbleViewToReferenceSizeAnimated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resizeBubbleViewToReferenceSizeAnimated");
}

id objc_msgSend__resizeBubbleViewToSize_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resizeBubbleViewToSize:completion:");
}

id objc_msgSend__senderAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_senderAddress");
}

id objc_msgSend__setExtensionBundleId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setExtensionBundleId:");
}

id objc_msgSend__setLaunchId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setLaunchId:");
}

id objc_msgSend__setUiExtensionBundleId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setUiExtensionBundleId:");
}

id objc_msgSend__shouldProceedPerformingQuote_message_memoText_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldProceedPerformingQuote:message:memoText:completion:");
}

id objc_msgSend__showAlertForInvalidRecipientWithName_statusReason_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showAlertForInvalidRecipientWithName:statusReason:completion:");
}

id objc_msgSend__showAlertForInvalidStateIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showAlertForInvalidStateIfNeededWithCompletion:");
}

id objc_msgSend__showPaymentDetailsForMessage_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showPaymentDetailsForMessage:completion:");
}

id objc_msgSend__showRecurringPaymentDetailsForMessage_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showRecurringPaymentDetailsForMessage:completion:");
}

id objc_msgSend__stagePaymentWithAmount_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stagePaymentWithAmount:completion:");
}

id objc_msgSend__stageRecurringPayment_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stageRecurringPayment:completion:");
}

id objc_msgSend__stageRequestWithAmount_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stageRequestWithAmount:completion:");
}

id objc_msgSend__transitionToRequiredContentStateAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_transitionToRequiredContentStateAnimated:");
}

id objc_msgSend__transitionToState_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_transitionToState:animated:");
}

id objc_msgSend__updateWithFamilyCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateWithFamilyCollection:");
}

id objc_msgSend__viewControllerForState_shouldLoad_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_viewControllerForState:shouldLoad:");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "account");
}

id objc_msgSend_actionView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionView");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actions");
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationState");
}

id objc_msgSend_activeConversation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeConversation");
}

id objc_msgSend_activityIndicator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityIndicator");
}

id objc_msgSend_addBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addBehavior:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_allowsFormalPaymentRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowsFormalPaymentRequests");
}

id objc_msgSend_amount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "amount");
}

id objc_msgSend_amountDidChangeTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "amountDidChangeTo:");
}

id objc_msgSend_amountStepperView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "amountStepperView");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appController");
}

id objc_msgSend_appReadyForDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appReadyForDisplay");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_associatedPassUniqueID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "associatedPassUniqueID");
}

id objc_msgSend_authorizationStatusForEntityType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authorizationStatusForEntityType:");
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundColor");
}

id objc_msgSend_balanceLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "balanceLabel");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_bezierPathWithArcCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_bubbleView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bubbleView");
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "button");
}

id objc_msgSend_canPerformPeerPaymentAction_account_unableReason_displayableError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canPerformPeerPaymentAction:account:unableReason:displayableError:");
}

id objc_msgSend_canSendText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canSendText");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "center");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_contactForHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactForHandle:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentSize");
}

id objc_msgSend_contentSizeThatFits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentSizeThatFits:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentView");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currency");
}

id objc_msgSend_currencyAmount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currencyAmount");
}

id objc_msgSend_currentBalance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentBalance");
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUser");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_decimalNumberWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decimalNumberWithString:");
}

id objc_msgSend_defaultButtonTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultButtonTitle");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deviceTransactionSourceIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceTransactionSourceIdentifiers");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayName");
}

id objc_msgSend_displayNameForCounterpartHandle_contact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayNameForCounterpartHandle:contact:");
}

id objc_msgSend_displayNameForRecipientAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayNameForRecipientAddress:");
}

id objc_msgSend_displayNameForRecipientAddress_foundInContacts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayNameForRecipientAddress:foundInContacts:");
}

id objc_msgSend_displayableErrorForError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayableErrorForError:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawInRect:");
}

id objc_msgSend_dynamicFraudContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dynamicFraudContent");
}

id objc_msgSend_enableLiveBubbleDebugMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableLiveBubbleDebugMode");
}

id objc_msgSend_errorIsTermsAcceptanceRequiredError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorIsTermsAcceptanceRequiredError:");
}

id objc_msgSend_externalizedControllerState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "externalizedControllerState");
}

id objc_msgSend_externalizedControllerStateForMessageIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "externalizedControllerStateForMessageIdentifier:");
}

id objc_msgSend_familyMembersWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "familyMembersWithCompletion:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_formalRequestTokenForAmount_source_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formalRequestTokenForAmount:source:completion:");
}

id objc_msgSend_fpanIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fpanIdentifier");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frequency");
}

id objc_msgSend_fundingSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fundingSource");
}

id objc_msgSend_generatedSnapshot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generatedSnapshot");
}

id objc_msgSend_gravity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gravity");
}

id objc_msgSend_handleAction_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleAction:completion:");
}

id objc_msgSend_handleAction_sender_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleAction:sender:completion:");
}

id objc_msgSend_handleIdentityVerificationWithError_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleIdentityVerificationWithError:completion:");
}

id objc_msgSend_handlePaymentRequestMessage_sender_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handlePaymentRequestMessage:sender:completion:");
}

id objc_msgSend_handleTermsAcceptanceRequiredWithError_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleTermsAcceptanceRequiredWithError:completion:");
}

id objc_msgSend_hasBeenSent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasBeenSent");
}

id objc_msgSend_header(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "header");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifyRecipientWithAddress_senderAddress_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifyRecipientWithAddress:senderAddress:completion:");
}

id objc_msgSend_identityVerificationRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identityVerificationRequired");
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageView");
}

id objc_msgSend_imageWithActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithActions:");
}

id objc_msgSend_informalRequestToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "informalRequestToken");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithAmount_currency_exponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAmount:currency:exponent:");
}

id objc_msgSend_initWithAmount_currencyCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAmount:currencyCode:");
}

id objc_msgSend_initWithFamilyMembers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFamilyMembers:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIntent_response_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIntent:response:");
}

id objc_msgSend_initWithItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithItems:");
}

id objc_msgSend_initWithMessage_recipientAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMessage:recipientAddress:");
}

id objc_msgSend_initWithMessagesAppController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMessagesAppController:");
}

id objc_msgSend_initWithPayee_currencyAmount_note_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPayee:currencyAmount:note:");
}

id objc_msgSend_initWithPayer_currencyAmount_note_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPayer:currencyAmount:note:");
}

id objc_msgSend_initWithPaymentPass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPaymentPass:");
}

id objc_msgSend_initWithPeerPaymentWebService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPeerPaymentWebService:");
}

id objc_msgSend_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:");
}

id objc_msgSend_initWithRecurringPayment_recipientAddress_mode_context_peerPaymentController_remoteMessagesComposer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecurringPayment:recipientAddress:mode:context:peerPaymentController:remoteMessagesComposer:");
}

id objc_msgSend_initWithReferenceView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithReferenceView:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithType_session_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:session:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithValue_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValue:type:");
}

id objc_msgSend_insertMessage_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertMessage:completionHandler:");
}

id objc_msgSend_insertOrUpdateRecurringPayments_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertOrUpdateRecurringPayments:completion:");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_isDeviceMotionAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceMotionAvailable");
}

id objc_msgSend_isEligibleForRecurringPaymentsForUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEligibleForRecurringPaymentsForUser:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFromMe(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFromMe");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHidden");
}

id objc_msgSend_isInHardwareKeyboardMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInHardwareKeyboardMode");
}

id objc_msgSend_isRecurringPayment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRecurringPayment");
}

id objc_msgSend_isiMessageEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isiMessageEnabled");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "label");
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutFrame");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadViewIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadViewIfNeeded");
}

id objc_msgSend_localParticipantIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localParticipantIdentifier");
}

id objc_msgSend_localStatusForMessage_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localStatusForMessage:completion:");
}

id objc_msgSend_localizedRecoveryOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedRecoveryOptions");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mainView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainView");
}

id objc_msgSend_maximumAmount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumAmount");
}

id objc_msgSend_maximumTransferAmount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumTransferAmount");
}

id objc_msgSend_memo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memo");
}

id objc_msgSend_memoDidChangeTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memoDidChangeTo:");
}

id objc_msgSend_memoField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memoField");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "message");
}

id objc_msgSend_minimumAmount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumAmount");
}

id objc_msgSend_minimumTransferAmount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumTransferAmount");
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mode");
}

id objc_msgSend_nameComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nameComponents");
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationBar");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_needsRegistration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsRegistration");
}

id objc_msgSend_notANumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notANumber");
}

id objc_msgSend_noteContentSizeNeedsUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noteContentSizeNeedsUpdate");
}

id objc_msgSend_noteReadyForDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noteReadyForDisplay");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_one(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "one");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_otherButtonTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "otherButtonTitle");
}

id objc_msgSend_passWithFPANIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passWithFPANIdentifier:");
}

id objc_msgSend_passWithUniqueID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passWithUniqueID:");
}

id objc_msgSend_paymentIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "paymentIdentifier");
}

id objc_msgSend_paymentPass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "paymentPass");
}

id objc_msgSend_peerPaymentMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerPaymentMessage");
}

id objc_msgSend_peerPaymentMessageReceivedDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerPaymentMessageReceivedDate");
}

id objc_msgSend_peerPaymentPass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerPaymentPass");
}

id objc_msgSend_peerPaymentPassIsProvisionedOnDeviceForAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerPaymentPassIsProvisionedOnDeviceForAccount:");
}

id objc_msgSend_peerPaymentRequiresEnablement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerPaymentRequiresEnablement");
}

id objc_msgSend_peerPaymentService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerPaymentService");
}

id objc_msgSend_peerPaymentStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerPaymentStatus");
}

id objc_msgSend_percentExpanded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "percentExpanded");
}

id objc_msgSend_performAction_withPaymentIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performAction:withPaymentIdentifier:completion:");
}

id objc_msgSend_performPostRender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performPostRender:");
}

id objc_msgSend_performQuoteWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performQuoteWithCompletion:");
}

id objc_msgSend_persistExternalizedControllerState_forMessageIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistExternalizedControllerState:forMessageIdentifier:");
}

id objc_msgSend_phoneOrEmail(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneOrEmail");
}

id objc_msgSend_pkui_userInterfaceIdiomSupportsLargeLayouts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pkui_userInterfaceIdiomSupportsLargeLayouts");
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popToRootViewControllerAnimated:");
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredContentSizeCategory");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_presentMessageOverController_presentationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentMessageOverController:presentationHandler:");
}

id objc_msgSend_presentNotificationWithParameters_flags_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentNotificationWithParameters:flags:responseHandler:");
}

id objc_msgSend_presentNotificationWithParameters_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentNotificationWithParameters:responseHandler:");
}

id objc_msgSend_presentRegistrationFlowWithAccount_amount_state_senderAddress_orientation_hostSceneIdentifier_hostSceneBundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentRegistrationFlowWithAccount:amount:state:senderAddress:orientation:hostSceneIdentifier:hostSceneBundleIdentifier:completion:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationStyle");
}

id objc_msgSend_prewarmDeviceScoreForEndpoint_recipientAddress_quoteDestinationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:");
}

id objc_msgSend_primaryEmailAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryEmailAddress");
}

id objc_msgSend_primaryTextColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryTextColor");
}

id objc_msgSend_proposedResolutionForError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proposedResolutionForError:");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_quote(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "quote");
}

id objc_msgSend_quoteWithAmount_source_requestToken_alternateFundingSource_preserveCurrentBalance_recurringPaymentIdentifier_frequency_startDate_threshold_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "quoteWithAmount:source:requestToken:alternateFundingSource:preserveCurrentBalance:recurringPaymentIdentifier:frequency:startDate:threshold:completion:");
}

id objc_msgSend_quoteWithAmount_source_requestToken_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "quoteWithAmount:source:requestToken:completion:");
}

id objc_msgSend_receivedPeerPaymentMessageData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedPeerPaymentMessageData:");
}

id objc_msgSend_recipient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recipient");
}

id objc_msgSend_recipientAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recipientAddress");
}

id objc_msgSend_recipientAddresses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recipientAddresses");
}

id objc_msgSend_recipientDisplayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recipientDisplayName");
}

id objc_msgSend_recipientFoundInContacts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recipientFoundInContacts");
}

id objc_msgSend_recurringPaymentIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recurringPaymentIdentifier");
}

id objc_msgSend_recurringPaymentMemo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recurringPaymentMemo");
}

id objc_msgSend_recurringPaymentsFeatureDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recurringPaymentsFeatureDescriptor");
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "redColor");
}

id objc_msgSend_referenceBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "referenceBackgroundColor");
}

id objc_msgSend_referenceSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "referenceSize");
}

id objc_msgSend_referenceSizeForPeerPaymentStatusResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "referenceSizeForPeerPaymentStatusResponse:");
}

id objc_msgSend_registerForTraitChanges_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForTraitChanges:withHandler:");
}

id objc_msgSend_reloadContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadContent");
}

id objc_msgSend_remoteStatusForMessage_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteStatusForMessage:completion:");
}

id objc_msgSend_removeExternalizedControllerStateDataForMessageIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeExternalizedControllerStateDataForMessageIdentifier:");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromParentViewController");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_reportMessageSent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportMessageSent");
}

id objc_msgSend_requestPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestPresentationStyle:");
}

id objc_msgSend_requestResize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestResize");
}

id objc_msgSend_requestToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestToken");
}

id objc_msgSend_requireGestureRecognizerToFail_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requireGestureRecognizerToFail:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_restoreStateWithExternalizedControllerState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreStateWithExternalizedControllerState:");
}

id objc_msgSend_riskLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "riskLevel");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaInsets");
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaLayoutGuide");
}

id objc_msgSend_selectMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectMode:");
}

id objc_msgSend_selectedMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedMessage");
}

id objc_msgSend_sendAnalyticsForAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAnalyticsForAction:");
}

id objc_msgSend_sendRestrictionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRestrictionType");
}

id objc_msgSend_sendToUserFeatureDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendToUserFeatureDescriptor");
}

id objc_msgSend_senderAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "senderAddress");
}

id objc_msgSend_senderParticipantIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "senderParticipantIdentifier");
}

id objc_msgSend_senderPhoneOrEmail(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "senderPhoneOrEmail");
}

id objc_msgSend_serviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceIdentifier");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session");
}

id objc_msgSend_setAction_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAction:animated:");
}

id objc_msgSend_setActionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionHandler:");
}

id objc_msgSend_setActivityIndicatorVisible_forAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivityIndicatorVisible:forAction:");
}

id objc_msgSend_setAmount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAmount:");
}

id objc_msgSend_setAmountChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAmountChangedHandler:");
}

id objc_msgSend_setAmountTappedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAmountTappedHandler:");
}

id objc_msgSend_setBackButtonDisplayMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackButtonDisplayMode:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCenterAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCenterAction:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setContentAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentAlignment:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setCurrency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrency:");
}

id objc_msgSend_setCurrencyAmount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrencyAmount:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeviceMotionUpdateInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceMotionUpdateInterval:");
}

id objc_msgSend_setDisplaysApplePayLogo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplaysApplePayLogo:");
}

id objc_msgSend_setElasticity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setElasticity:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFillColor:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFrequency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrequency:");
}

id objc_msgSend_setFriction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFriction:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIgnoreTopSafeArea_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIgnoreTopSafeArea:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setLeadingAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeadingAction:");
}

id objc_msgSend_setLiveRenderingEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLiveRenderingEnabled:");
}

id objc_msgSend_setMaxAmount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxAmount:");
}

id objc_msgSend_setMaximumAmount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumAmount:");
}

id objc_msgSend_setMemo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMemo:");
}

id objc_msgSend_setMemoChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMemoChangedHandler:");
}

id objc_msgSend_setMinAmount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinAmount:");
}

id objc_msgSend_setMinimumAmount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumAmount:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNavigationBarHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNavigationBarHeight:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberOfTapsRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfTapsRequired:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOverrideUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverrideUserInterfaceStyle:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPeerPaymentMessageReceivedDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerPaymentMessageReceivedDate:");
}

id objc_msgSend_setPercentExpanded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPercentExpanded:");
}

id objc_msgSend_setPresentationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresentationContext:");
}

id objc_msgSend_setReadyForDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReadyForDisplay");
}

id objc_msgSend_setRecipientAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecipientAddress:");
}

id objc_msgSend_setRecurringPaymentFrequency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecurringPaymentFrequency:");
}

id objc_msgSend_setRecurringPaymentMemo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecurringPaymentMemo:");
}

id objc_msgSend_setRecurringPaymentStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecurringPaymentStartDate:");
}

id objc_msgSend_setRegistrationFlowState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRegistrationFlowState:");
}

id objc_msgSend_setRequestToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestToken:");
}

id objc_msgSend_setSenderAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSenderAddress:");
}

id objc_msgSend_setShowCancelButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowCancelButton:");
}

id objc_msgSend_setShowSendAndRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowSendAndRequest:");
}

id objc_msgSend_setShowSetupRecurringSend_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowSetupRecurringSend:");
}

id objc_msgSend_setShowsActionSpinner_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsActionSpinner:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSource:");
}

id objc_msgSend_setSourceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceType:");
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartDate:");
}

id objc_msgSend_setState_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:animated:");
}

id objc_msgSend_setSubtitleType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubtitleType:");
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

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTrailingAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrailingAction:");
}

id objc_msgSend_setTransactionIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransactionIdentifier:");
}

id objc_msgSend_setTranslatesReferenceBoundsIntoBoundary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesReferenceBoundsIntoBoundary:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUsedKeypad_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsedKeypad:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setVerticalPadding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVerticalPadding:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setViewControllers_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllers:animated:");
}

id objc_msgSend_shapeLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shapeLayer");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedContext");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedService");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_stage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stage");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAnimating");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDate");
}

id objc_msgSend_startDeviceMotionUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDeviceMotionUpdatesToQueue:withHandler:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_statusForPaymentIdentifier_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusForPaymentIdentifier:withCompletion:");
}

id objc_msgSend_statusReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusReason");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subviews");
}

id objc_msgSend_supportsRecurringPayments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRecurringPayments");
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "time");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_totalReceiveAmount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalReceiveAmount");
}

id objc_msgSend_totalReceiveAmountCurrency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalReceiveAmountCurrency");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_transactionIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transactionIdentifier");
}

id objc_msgSend_transactionSourceIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transactionSourceIdentifiers");
}

id objc_msgSend_transactionWithServiceIdentifier_transactionSourceIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transactionWithServiceIdentifier:transactionSourceIdentifier:completion:");
}

id objc_msgSend_transitionFromViewController_toViewController_duration_options_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionFromViewController:toViewController:duration:options:animations:completion:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_underlyingMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "underlyingMessage");
}

id objc_msgSend_updateIsExpansionSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateIsExpansionSupported");
}

id objc_msgSend_updateIsKeypadSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateIsKeypadSupported");
}

id objc_msgSend_updateMessageReceivedDate_forTransactionWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMessageReceivedDate:forTransactionWithIdentifier:");
}

id objc_msgSend_updateRecurringPaymentMemo_identifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateRecurringPaymentMemo:identifier:completion:");
}

id objc_msgSend_updateRecurringPaymentsWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateRecurringPaymentsWithCompletion:");
}

id objc_msgSend_updateWithPaymentTransaction_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithPaymentTransaction:animated:");
}

id objc_msgSend_updateWithPeerPaymentMessage_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithPeerPaymentMessage:animated:");
}

id objc_msgSend_updateWithPeerPaymentPerformResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithPeerPaymentPerformResponse:");
}

id objc_msgSend_updateWithPeerPaymentStatus_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithPeerPaymentStatus:animated:");
}

id objc_msgSend_updateWithPeerPaymentStatusResponse_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithPeerPaymentStatusResponse:animated:");
}

id objc_msgSend_usedKeypad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usedKeypad");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_usesAppleCashBalance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usesAppleCashBalance");
}

id objc_msgSend_validateNumberPadInput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateNumberPadInput");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllers");
}

id objc_msgSend_webService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webService");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windowScene");
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windows");
}

id objc_msgSend_zero(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zero");
}
