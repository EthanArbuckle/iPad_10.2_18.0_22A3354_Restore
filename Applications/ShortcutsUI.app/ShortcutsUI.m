id sub_100003744()
{
  if (qword_10003FEB8 != -1)
    dispatch_once(&qword_10003FEB8, &stru_100034700);
  return (id)qword_10003FEC0;
}

void sub_100003784(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = a2;
  v4 = WFUIPresenterServiceInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setInterface:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceQuality userInitiated](BSServiceQuality, "userInitiated"));
  objc_msgSend(v3, "setServiceQuality:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "concretePresenter"));
  objc_msgSend(v3, "setInterfaceTarget:", v7);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000385C;
  v8[3] = &unk_100034750;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", v8);

}

void sub_10000385C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;

  v3 = a2;
  v4 = sub_100003744();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[WFUIPresentationServer listener:didReceiveConnection:withContext:]_block_invoke_2";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s [Server-side] Connection to host was invalidated", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bannerManager"));
  objc_msgSend(v6, "removeConnectedHost:", v3);

}

void sub_100003934(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create(WFLogSubsystem, "UIPresentationServer");
  v2 = (void *)qword_10003FEC0;
  qword_10003FEC0 = (uint64_t)v1;

}

void sub_100003968(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = WFLaunchAngelServiceDomain;
  v4 = a2;
  objc_msgSend(v4, "setDomain:", v3);
  objc_msgSend(v4, "setService:", WFLaunchAngelUIPresenterServiceName);
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));

}

id sub_100004088(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAwaitingScene:", 0);
}

id sub_10000409C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAwaitingScene:", 1);
}

void sub_1000040A8(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  v5 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "windowActivationCompletionHandler"));

  if (v3)
  {
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "windowActivationCompletionHandler"));
    ((void (**)(_QWORD, _QWORD, id))v4)[2](v4, 0, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_10000416C(id a1)
{
  WFAngelSceneManager *v1;
  void *v2;

  v1 = objc_alloc_init(WFAngelSceneManager);
  v2 = (void *)qword_10003FED0;
  qword_10003FED0 = (uint64_t)v1;

}

void sub_1000052B0(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "micaView"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_1000052E4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "micaView"));
  objc_msgSend(v1, "setHidden:", 1);

}

id sub_100005318(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100005380;
  v2[3] = &unk_100034BE8;
  v2[4] = *(_QWORD *)(a1 + 32);
  return +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v2, 0.4);
}

void sub_100005380(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "micaView"));
  objc_msgSend(v1, "setAlpha:", 1.0);

}

id sub_1000053B4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setProgressSuppressionState:", 3);
  return objc_msgSend(*(id *)(a1 + 32), "setProgressSuppressionTimer:", 0);
}

id sub_1000053E4(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;
  id result;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "updateMicaViewState");
  v2 = *(_QWORD *)(a1 + 40) != 4;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cancelButton"));
  objc_msgSend(v3, "setHidden:", v2);

  result = objc_msgSend(*(id *)(a1 + 32), "progressSuppressionState");
  if (result != (id)3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "activeLayoutMode") == (id)4)
    {
      v5 = 0;
      v6 = 1;
    }
    else
    {
      v5 = 1;
      v6 = 0;
    }
    return objc_msgSend(*(id *)(a1 + 32), "setMicaViewHidden:animated:", v5, v6);
  }
  return result;
}

id sub_100005480(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLastKnownProgressValue:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "updateMicaViewState");
}

id sub_1000054AC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGColor"));
}

void sub_100005C18(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAwaitingIconOwnershipSwap:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "systemApertureElementContext"));
  objc_msgSend(v2, "setElementNeedsUpdate");

}

void sub_100005C60(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "systemApertureElementContext"));
  objc_msgSend(v1, "setElementNeedsUpdate");

}

BOOL sub_100006DC8(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;

  v1 = a1;
  objc_msgSend(v1, "contentSize");
  v3 = UIRoundToViewScale(v1, v2);
  objc_msgSend(v1, "bounds");
  v5 = UIRoundToViewScale(v1, v4);

  return v3 > v5;
}

void sub_100006E28(uint64_t a1, double a2, double a3)
{
  id v5;
  _QWORD v6[7];

  if (*(_BYTE *)(a1 + 40))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100006EE8;
    v6[3] = &unk_100034878;
    v6[4] = *(_QWORD *)(a1 + 32);
    *(double *)&v6[5] = a2;
    *(double *)&v6[6] = a3;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v6, 0, 0.35, 0.0);
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "embeddedScrollView"));
    objc_msgSend(v5, "setContentOffset:", a2, a3);

  }
}

void sub_100006EE8(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "embeddedScrollView"));
  objc_msgSend(v2, "setContentOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48));

}

id sub_100006F28(uint64_t a1)
{
  _QWORD v3[6];
  CAFrameRateRange v4;

  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006FBC;
  v3[3] = &unk_100034AA0;
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[5] = *(_QWORD *)(a1 + 40);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

void sub_100006FBC(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dimmingView"));
  objc_msgSend(v2, "setAlpha:", *(double *)(a1 + 40));

}

void sub_100006FFC(uint64_t a1)
{
  double v2;
  double v3;
  id v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  double v8;
  dispatch_time_t v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[5];
  _QWORD block[4];
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;

  objc_msgSend(*(id *)(a1 + 32), "poofResponse");
  v3 = v2;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100007574;
  v19[3] = &unk_100034828;
  v22 = *(_QWORD *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  v23 = *(_OWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 40);
  v20 = v4;
  v21 = v5;
  +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v19, 0, 1.0, v3, 0.0, 0.0, 0.0, 0.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[WFBannerPrototypeSettings sharedSettings](WFBannerPrototypeSettings, "sharedSettings"));
  v7 = objc_msgSend(v6, "blurFilterEnabled");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "poofBlurDelay");
    v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007644;
    block[3] = &unk_100034BC0;
    v10 = *(id *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v17 = v10;
    v18 = v11;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "alphaOutEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "poofAlphaResponse");
    v13 = v12;
    objc_msgSend(*(id *)(a1 + 32), "poofAlphaDelay");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100007704;
    v15[3] = &unk_100034BE8;
    v15[4] = *(_QWORD *)(a1 + 40);
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v15, 0, v13, v14);
  }

}

void sub_1000071C4(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  __int128 v13;
  CAFrameRateRange v14;

  v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v14.minimum;
  maximum = v14.maximum;
  preferred = v14.preferred;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000073E8;
  v10[3] = &unk_100034850;
  v13 = *(_OWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = v6;
  *(float *)&v7 = minimum;
  *(float *)&v8 = maximum;
  *(float *)&v9 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v10, v7, v8, v9);

}

uint64_t sub_10000728C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_100007298(uint64_t a1)
{
  _QWORD v3[5];
  CAFrameRateRange v4;

  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007358;
  v3[3] = &unk_100034BE8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

void sub_100007324(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "embeddedScrollView"));
  objc_msgSend(v1, "setBounces:", 1);

}

void sub_100007358(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  void *v5;
  _OWORD v6[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v6[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v6[1] = v3;
  v6[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v2, "setTransform:", v6);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(v5, "setValue:forKeyPath:", &off_100036F28, CFSTR("filters.gaussianBlur.inputRadius"));

}

void sub_1000073E8(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  CGAffineTransform v20;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v23;

  v2 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "phase1_artificialInitialOffset");
  if (v2 <= 0.0)
    v4 = -v3;
  else
    v4 = v3;
  v5 = 0.0;
  if (v4 < 0.0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));
    objc_msgSend(v6, "bounds");
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "phase1_initialScale");
    v5 = v8 * (1.0 - v9) * -0.5;

  }
  v10 = v4 + v5;
  objc_msgSend(*(id *)(a1 + 32), "phase1_initialScale");
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "phase1_initialScale");
  CGAffineTransformMakeScale(&t1, v12, v13);
  CGAffineTransformMakeTranslation(&t2, 0.0, v10);
  CGAffineTransformConcat(&v23, &t1, &t2);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));
  v20 = v23;
  objc_msgSend(v14, "setTransform:", &v20);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[WFBannerPrototypeSettings sharedSettings](WFBannerPrototypeSettings, "sharedSettings"));
  v16 = objc_msgSend(v15, "blurFilterEnabled");

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
    objc_msgSend(*(id *)(a1 + 32), "phase1_initialBlurRadius");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v18, "setValue:forKeyPath:", v19, CFSTR("filters.gaussianBlur.inputRadius"));

  }
}

void sub_100007574(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  CAFrameRateRange v14;

  v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v14.minimum;
  maximum = v14.maximum;
  preferred = v14.preferred;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007884;
  v9[3] = &unk_100034828;
  v12 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  v13 = *(_OWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  *(float *)&v7 = maximum;
  *(float *)&v8 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v9, COERCE_DOUBLE(__PAIR64__(DWORD1(v13), LODWORD(minimum))), v7, v8);

}

void sub_100007644(uint64_t a1)
{
  double v2;
  double v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;

  objc_msgSend(*(id *)(a1 + 32), "poofBlurResponse");
  v3 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007738;
  v6[3] = &unk_100034BC0;
  v5 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v6, 0, 1.0, v3, 0.0, 0.0, 0.0, 0.0, 0.0);

}

void sub_100007704(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_100007738(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  void *v5;
  double v6;
  double v7;
  double v8;
  _QWORD v9[5];
  id v10;
  CAFrameRateRange v11;

  v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v11.minimum;
  maximum = v11.maximum;
  preferred = v11.preferred;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000077FC;
  v9[3] = &unk_100034BC0;
  v5 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  *(float *)&v6 = minimum;
  *(float *)&v7 = maximum;
  *(float *)&v8 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v9, v6, v7, v8);

}

void sub_1000077FC(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(*(id *)(a1 + 40), "poofBlurRadius");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v2, "setValue:forKeyPath:", v3, CFSTR("filters.gaussianBlur.inputRadius"));

}

void sub_100007884(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  CGAffineTransform v29;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v32;

  v2 = *(double *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (v2 <= 0.0)
    objc_msgSend(v3, "poofScaleUp");
  else
    objc_msgSend(v3, "poofScaleDown");
  v5 = v4;
  v6 = *(double *)(a1 + 64);
  if (v6 <= 0.0)
  {
    v9 = 0.0;
    if (v6 < 0.0)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "fixedEndTranslationUpEnabled"))
      {
        v10 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "fixedEndTranslationUp");
        v12 = v11;
        objc_msgSend(*(id *)(a1 + 32), "poof_scale_multiplier_y");
        v14 = v5 * v13;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));
        objc_msgSend(v15, "bounds");
        objc_msgSend(v10, "topEdgeClampedTranslationForTranslation:scale:height:", v12, v14, v16);
        v9 = v17;

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));
        objc_msgSend(v18, "bounds");
        v20 = v19;

        if (v20 > 200.0)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));
          objc_msgSend(v21, "bounds");
          v23 = (v22 + -200.0) * 0.08;

          v9 = v9 + v23;
        }
      }
      else
      {
        v24 = *(double *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 32), "poofThrowDistanceUp");
        v26 = v24 - v25;
        if (v26 <= -25.0)
          v9 = v26;
        else
          v9 = -25.0;
      }
    }
  }
  else
  {
    v7 = *(double *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "poofThrowDistanceDown");
    v9 = v7 + v8;
  }
  objc_msgSend(*(id *)(a1 + 32), "poof_scale_multiplier_y");
  CGAffineTransformMakeScale(&t1, v5, v5 * v27);
  CGAffineTransformMakeTranslation(&t2, 0.0, v9);
  CGAffineTransformConcat(&v32, &t1, &t2);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));
  v29 = v32;
  objc_msgSend(v28, "setTransform:", &v29);

}

id sub_100007A40(uint64_t a1)
{
  _QWORD v3[6];
  __int128 v4;
  uint64_t v5;
  CAFrameRateRange v6;

  v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007BF0;
  v3[3] = &unk_1000349D8;
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[5] = *(_QWORD *)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

id sub_100007AE4(uint64_t a1)
{
  _QWORD v3[6];
  CAFrameRateRange v4;

  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007B78;
  v3[3] = &unk_100034AA0;
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[5] = *(_QWORD *)(a1 + 40);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

void sub_100007B78(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
  objc_msgSend(v2, "setValue:forKeyPath:", v3, CFSTR("filters.gaussianBlur.inputRadius"));

}

void sub_100007BF0(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  CGFloat v8;
  void *v9;
  CGAffineTransform v10;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v13;

  v2 = *(void **)(a1 + 32);
  v3 = *(double *)(a1 + 40);
  v4 = *(double *)(a1 + 56);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));
  objc_msgSend(v5, "bounds");
  objc_msgSend(v2, "topEdgeClampedTranslationForTranslation:scale:height:", v3, v4, v6);
  v8 = v7;

  CGAffineTransformMakeScale(&t1, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  CGAffineTransformMakeTranslation(&t2, *(CGFloat *)(a1 + 64), v8);
  CGAffineTransformConcat(&v13, &t1, &t2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  v10 = v13;
  objc_msgSend(v9, "setTransform:", &v10);

}

void sub_100008240(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[WFBannerPrototypeSettingsDomain rootSettings](WFBannerPrototypeSettingsDomain, "rootSettings"));
  v2 = (void *)qword_10003FED8;
  qword_10003FED8 = v1;

}

void sub_1000093F4(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "activeLayoutMode") == (id)4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setOverrideLayoutMode:", 3);
    v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "systemApertureElementContext"));
    objc_msgSend(v2, "requestTransitionToPreferredLayoutMode");

  }
}

void sub_10000945C(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progress"));
  objc_msgSend(v2, "fractionCompleted");
  objc_msgSend(v3, "updateProgressWithValue:");

}

id sub_1000094B4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void sub_1000094BC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "setInitialPresentationTransitioning:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingDelayedAttribution"));

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pendingDelayedAttribution"));
    objc_msgSend(v3, "setAttribution:", v4);

    objc_msgSend(*(id *)(a1 + 32), "setPendingDelayedAttribution:", 0);
  }
}

void sub_10000BE54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000CC18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000100FC(uint64_t a1)
{
  void *v1;
  double v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "materialView"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  LODWORD(v2) = 0;
  objc_msgSend(v1, "setShadowOpacity:", v2);

}

void sub_100010148(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v1, "endEditing:", 1);

}

void sub_10001017C(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  _QWORD v5[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  v3 = objc_opt_respondsToSelector(v2, "bannerViewControllerRequestedTapDismissal:");

  if ((v3 & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
    objc_msgSend(v4, "bannerViewControllerRequestedTapDismissal:", *(_QWORD *)(a1 + 32));

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100010258;
    v5[3] = &unk_100034BE8;
    v5[4] = *(_QWORD *)(a1 + 32);
    +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v5, 0, 1.0, 0.3, 0.0, 0.0, 0.0, 0.0, 0.0);
  }
}

id sub_100010258(uint64_t a1)
{
  _QWORD v3[5];
  CAFrameRateRange v4;

  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000102E4;
  v3[3] = &unk_100034BE8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

void sub_1000102E4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dimmingView"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_100010318(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  WFPassthroughDimmingView *v9;

  v9 = objc_opt_new(WFPassthroughDimmingView);
  -[WFPassthroughDimmingView setAlpha:](v9, "setAlpha:", 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v2, "insertSubview:atIndex:", v9, 0);

  objc_msgSend(*(id *)(a1 + 32), "setDimmingView:", v9);
  objc_msgSend(*(id *)(a1 + 32), "layoutDimmingLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WFBannerPrototypeSettings sharedSettings](WFBannerPrototypeSettings, "sharedSettings"));
  v4 = objc_msgSend(v3, "bannerFramesEnabled");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFPassthroughDimmingView layer](v9, "layer"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor")));
    objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFPassthroughDimmingView layer](v9, "layer"));
    objc_msgSend(v7, "setBorderWidth:", 4.0);

  }
  v8 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", *(_QWORD *)(a1 + 32), "handleTapGesture:");
  -[WFPassthroughDimmingView addGestureRecognizer:](v9, "addGestureRecognizer:", v8);

}

id sub_100010444(uint64_t a1)
{
  _QWORD v3[5];
  char v4;
  CAFrameRateRange v5;

  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000104D8;
  v3[3] = &unk_100034B18;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 40);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void sub_1000104D8(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  else
    v1 = 0.0;
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dimmingView"));
  objc_msgSend(v2, "setAlpha:", v1);

}

void sub_100010528(id *a1)
{
  void *v2;
  dispatch_group_t v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  _QWORD v13[5];

  if (objc_msgSend(a1[4], "shouldShowDimmingLayer")
    && (v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "dimmingView")), v2, v2))
  {
    v3 = dispatch_group_create();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000106D4;
    v13[3] = &unk_100034BE8;
    v13[4] = a1[4];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100010708;
    v11[3] = &unk_100034AC8;
    v4 = v3;
    v12 = v4;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v13, v11, 0.200000003, 0.100000001);
    dispatch_group_enter(v4);
    v5 = a1[5];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100010710;
    v9[3] = &unk_100034BE8;
    v10 = v4;
    v6 = v4;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v9);
    dispatch_group_enter(v6);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100010718;
    v7[3] = &unk_100034EE8;
    v8 = a1[6];
    dispatch_group_notify(v6, (dispatch_queue_t)&_dispatch_main_q, v7);

  }
  else
  {
    objc_msgSend(a1[5], "dismissViewControllerAnimated:completion:", 1, a1[6]);
  }
}

void sub_1000106D4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dimmingView"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_100010708(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100010710(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100010718(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100010724(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  v3 = objc_opt_respondsToSelector(v2, "bannerViewControllerHomeGestureDidPassThreshold:");

  if ((v3 & 1) != 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
    objc_msgSend(v4, "bannerViewControllerHomeGestureDidPassThreshold:", *(_QWORD *)(a1 + 32));

  }
}

id sub_1000107A8(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "updateHomeGestureOwnership");
  objc_msgSend(*(id *)(a1 + 32), "updateDimmingLayerVisibility");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "bannerSize");
  return objc_msgSend(v2, "setPreferredContentSize:");
}

void sub_1000107E4(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "systemIdleTimerOverrideAssertion"));
  objc_msgSend(v1, "invalidate");

  objc_msgSend(WeakRetained, "setSystemIdleTimerOverrideAssertion:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "localIdleTimer"));
  objc_msgSend(v2, "cancel");

  objc_msgSend(WeakRetained, "setLocalIdleTimer:", 0);
}

void sub_100010858(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100010FAC;
  v2[3] = &unk_100034BC0;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

}

void sub_1000108C4(id *a1)
{
  id v2;
  id v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;

  if (objc_msgSend(a1[4], "dismissalPhase") != (id)2)
  {
    objc_msgSend(a1[4], "setDismissalPhase:", 2);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010A30;
    block[3] = &unk_100034C30;
    v2 = a1[5];
    v3 = a1[4];
    v5 = v2;
    v6 = v3;
    v7 = a1[6];
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

void sub_10001096C(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "embeddedPlatter"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scrollView"));
  objc_msgSend(v1, "setAutoresizingMask:", 0);

}

id sub_1000109B8(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "dismissalPhase");
  if (result == (id)1)
    return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

id sub_1000109F8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateDimmingLayerVisibility");
}

uint64_t sub_100010A00(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDismissalPhase:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100010A30(id *a1)
{
  double v2;
  double v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  __int128 v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  unsigned int v17;
  double v18;
  double v19;
  double v20;
  id v21[2];
  void *v22;
  _QWORD v23[5];
  _QWORD v24[4];
  int8x16_t v25;
  _OWORD v26[3];
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;

  if (objc_msgSend(a1[4], "disableTransition"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "containerView"));
    objc_msgSend(v22, "setAlpha:", 0.0);

  }
  else
  {
    objc_msgSend(a1[4], "poofOutScaleResponse");
    v3 = v2;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100010CD0;
    v27[3] = &unk_100034C30;
    v4 = a1[4];
    v5 = a1[5];
    v6 = a1[6];
    v28 = v4;
    v29 = v5;
    v30 = v6;
    +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v27, 0, 1.0, v3, 0.0, 0.0, 0.0, 0.0, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "containerView"));
    v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v26[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v26[1] = v8;
    v26[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v7, "setTransform:", v26);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[WFBannerPrototypeSettings sharedSettings](WFBannerPrototypeSettings, "sharedSettings"));
    v10 = objc_msgSend(v9, "blurFilterEnabled");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "containerView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
      objc_msgSend(v12, "setValue:forKeyPath:", &off_100036F38, CFSTR("filters.gaussianBlur.inputRadius"));

      objc_msgSend(a1[4], "poofOutBlurResponse");
      v14 = v13;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100010DA0;
      v24[3] = &unk_100034BC0;
      *(_OWORD *)v21 = *((_OWORD *)a1 + 2);
      v15 = v21[0];
      v25 = vextq_s8(*(int8x16_t *)v21, *(int8x16_t *)v21, 8uLL);
      +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v24, 0, 1.0, v14, 0.0, 0.0, 0.0, 0.0, 0.0);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "gestureSettings", v21[0]));
    v17 = objc_msgSend(v16, "alphaOutEnabled");

    if (v17)
    {
      objc_msgSend(a1[4], "poofOutAlphaResponse");
      v19 = v18;
      objc_msgSend(a1[4], "poofOutAlphaDelay");
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100010E64;
      v23[3] = &unk_100034BE8;
      v23[4] = a1[5];
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v23, 0, v19, v20);
    }

  }
}

void sub_100010CD0(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  CAFrameRateRange v15;

  v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v15.minimum;
  maximum = v15.maximum;
  preferred = v15.preferred;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100010F20;
  v11[3] = &unk_100034C30;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v12 = v5;
  v13 = v6;
  v14 = v7;
  *(float *)&v8 = minimum;
  *(float *)&v9 = maximum;
  *(float *)&v10 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v11, v8, v9, v10);

}

void sub_100010DA0(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  void *v5;
  double v6;
  double v7;
  double v8;
  _QWORD v9[5];
  id v10;
  CAFrameRateRange v11;

  v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v11.minimum;
  maximum = v11.maximum;
  preferred = v11.preferred;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100010E98;
  v9[3] = &unk_100034BC0;
  v5 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  *(float *)&v6 = minimum;
  *(float *)&v7 = maximum;
  *(float *)&v8 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v9, v6, v7, v8);

}

void sub_100010E64(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_100010E98(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(*(id *)(a1 + 40), "poofOutBlurRadius");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v2, "setValue:forKeyPath:", v3, CFSTR("filters.gaussianBlur.inputRadius"));

}

void sub_100010F20(id *a1)
{
  double v2;
  CGFloat v3;
  void *v4;
  double v5;
  void *v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  objc_msgSend(a1[4], "poofOutScale");
  v3 = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "gestureSettings"));
  objc_msgSend(v4, "poof_scale_multiplier_y");
  CGAffineTransformMakeScale(&v8, v3, v3 * v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "containerView"));
  v7 = v8;
  objc_msgSend(v6, "setTransform:", &v7);

}

void sub_100010FAC(uint64_t a1)
{
  double v2;
  CGFloat v3;
  CGFloat v4;
  double v5;
  void *v6;
  __int128 v7;
  _OWORD v8[3];
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CGAffineTransform v13;
  _QWORD v14[5];

  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001113C;
    v14[3] = &unk_100034BE8;
    v14[4] = *(_QWORD *)(a1 + 32);
    +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v14, 0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0);
  }
  else
  {
    memset(&v13, 0, sizeof(v13));
    objc_msgSend(*(id *)(a1 + 40), "hintAnimationTargetScale");
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "hintAnimationTargetScale");
    CGAffineTransformMakeScale(&v13, v3, v4);
    objc_msgSend(*(id *)(a1 + 40), "hintAnimationResponse");
    v9[1] = 3221225472;
    v10 = *(_OWORD *)&v13.a;
    v9[0] = _NSConcreteStackBlock;
    v9[2] = sub_100011174;
    v9[3] = &unk_1000349B0;
    v9[4] = *(_QWORD *)(a1 + 32);
    v11 = *(_OWORD *)&v13.c;
    v12 = *(_OWORD *)&v13.tx;
    +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v9, 0, 1.0, v5, 0.0, 0.0, 0.0, 0.0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView"));
    v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v8[1] = v7;
    v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v6, "setTransform:", v8);

  }
}

void sub_10001113C(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView"));
  objc_msgSend(v1, "setAlpha:", 0.6);

}

id sub_100011174(uint64_t a1)
{
  __int128 v2;
  _QWORD v4[5];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CAFrameRateRange v8;

  v8 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100011214;
  v4[3] = &unk_1000349B0;
  v4[4] = *(_QWORD *)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 40);
  v6 = v2;
  v7 = *(_OWORD *)(a1 + 72);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v4, *(double *)&v8.minimum, *(double *)&v8.maximum, *(double *)&v8.preferred);
}

void sub_100011214(uint64_t a1)
{
  void *v1;
  __int128 v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80)));
  objc_msgSend(v1, "setTransform:", &v2);

}

void sub_100011264(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dimmingView"));
  objc_msgSend(v1, "setCaptureTouches:", 0);

}

id sub_100011298(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEmbeddedPlatter:", *(_QWORD *)(a1 + 40));
}

void sub_1000112A0(uint64_t a1, int a2)
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a2)
    v3 = 1.0;
  else
    v3 = 0.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sashView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconView"));
  objc_msgSend(v5, "setAlpha:", v3);

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sashView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "label"));
  objc_msgSend(v6, "setAlpha:", v3);

}

uint64_t sub_10001133C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001134C(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
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
  void *v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  CGRect v28;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  if (!CGRectIsEmpty(v28))
  {
    v11 = BSRectWithSize(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "sizeThatFits:", v8, v10));
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_window"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "screen"));
    v21 = objc_msgSend(v20, "scale");
    v4 = UIRectIntegralWithScale(v21, v11, v13, v15, v17, v22);
    v6 = v23;
    v8 = v24;
    v10 = v25;

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sashView"));
  objc_msgSend(v26, "setFrame:", v4, v6, v8, v10);

  v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sashView"));
  objc_msgSend(v27, "setNeedsLayout");

}

uint64_t sub_100011498(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000114A8(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sashView"));
  objc_msgSend(v2, "setIcon:", *(_QWORD *)(a1 + 40));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sashView"));
  objc_msgSend(v3, "setTitle:", *(_QWORD *)(a1 + 48));

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v4 = *(double *)(a1 + 72);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100011590;
  v5[3] = &unk_100034EE8;
  v6 = *(id *)(a1 + 64);
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v5, 0, v4, 0.0);

}

uint64_t sub_100011580(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100011590(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000115A0(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "materialView"));
  objc_msgSend(v2, "_setContinuousCornerRadius:", v1);

}

uint64_t sub_1000115E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_1000115EC(uint64_t a1)
{
  __int128 v2;
  _QWORD v4[5];
  __int128 v5;
  __int128 v6;
  CAFrameRateRange v7;

  v7 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100011930;
  v4[3] = &unk_1000349D8;
  v4[4] = *(_QWORD *)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 40);
  v6 = v2;
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v4, *(double *)&v7.minimum, *(double *)&v7.maximum, *(double *)&v7.preferred);
}

void sub_100011684(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  __int128 v5;
  __int128 v6;
  double v7;
  double v8;
  _QWORD v9[4];
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CAFrameRateRange v15;

  v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v15.minimum;
  maximum = v15.maximum;
  preferred = v15.preferred;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000118D8;
  v9[3] = &unk_100034A50;
  v10 = *(id *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 56);
  v11 = *(_OWORD *)(a1 + 40);
  v12 = v5;
  v6 = *(_OWORD *)(a1 + 88);
  v13 = *(_OWORD *)(a1 + 72);
  v14 = v6;
  *(float *)&v6 = minimum;
  *(float *)&v7 = maximum;
  *(float *)&v8 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v9, *(double *)&v6, v7, v8);

}

id sub_100011758(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "setHidden:", 0);
}

void sub_100011784(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "actions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(v2, "invokeHandler");

}

void sub_1000117D4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "titleLabel"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_100011808(uint64_t a1)
{
  _QWORD v2[4];
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setTitle:forState:", *(_QWORD *)(a1 + 40), 0);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000118A4;
  v2[3] = &unk_100034BE8;
  v3 = *(id *)(a1 + 32);
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v2, 0, 0.3, 0.0);

}

void sub_1000118A4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "titleLabel"));
  objc_msgSend(v1, "setAlpha:", 1.0);

}

id sub_1000118D8(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeTranslation(&v5, 0.0, *(double *)(a1 + 48) - *(double *)(a1 + 80));
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

void sub_100011930(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView"));
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

void sub_100011988(uint64_t a1)
{
  void *v1;
  __int128 v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80)));
  objc_msgSend(v1, "setTransform:", &v2);

}

id sub_1000119D8(uint64_t a1)
{
  __int128 v2;
  void *v3;
  _QWORD v5[5];
  _OWORD v6[3];

  v2 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v2;
  v6[2] = *(_OWORD *)(a1 + 72);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView"));
  objc_msgSend(v3, "setTransform:", v6);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100011A98;
  v5[3] = &unk_100034BE8;
  v5[4] = *(_QWORD *)(a1 + 32);
  return +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v5, 0, 0.5, 0.6, 0.0, 0.0, 0.0, 0.0, 0.0);
}

void sub_100011A98(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView"));
  v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v3[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v3[1] = v2;
  v3[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v1, "setTransform:", v3);

}

void sub_100011AEC(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "platterView"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_100011B20(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(a1[4], "removeFromParentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "view"));
  objc_msgSend(v2, "removeFromSuperview");

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100011D40;
  v3[3] = &unk_100034BE8;
  v4 = a1[5];
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 65538, v3, 0, 0.2, 0.0);
  objc_msgSend(a1[6], "setActiveEmbeddedPlatterUpdateCount:", (uint64_t)((double)(uint64_t)objc_msgSend(a1[6], "activeEmbeddedPlatterUpdateCount") + -1.0));

}

void sub_100011BF4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView"));
  objc_msgSend(v1, "setAlpha:", 1.0);

}

id sub_100011C28(uint64_t a1)
{
  _QWORD v3[5];
  CAFrameRateRange v4;

  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100011CE8;
  v3[3] = &unk_100034BE8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

void sub_100011CB4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView"));
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void sub_100011CE8(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));
  objc_msgSend(v1, "setValue:forKeyPath:", &off_100036F38, CFSTR("filters.gaussianBlur.inputRadius"));

}

void sub_100011D40(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "platterView"));
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void sub_100011D74(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  CGAffineTransform v21;
  CGAffineTransform v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WFBannerPrototypeSettings sharedSettings](WFBannerPrototypeSettings, "sharedSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "transitionSettings"));

  if (objc_msgSend(v3, "disableTransition"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView"));
    objc_msgSend(v4, "setAlpha:", 1.0);

  }
  else
  {
    objc_msgSend(v3, "poofInScale");
    v6 = v5;
    objc_msgSend(v3, "poofInScale");
    CGAffineTransformMakeScale(&v22, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView"));
    v21 = v22;
    objc_msgSend(v8, "setTransform:", &v21);

    objc_msgSend(v3, "poofInScaleDamping");
    v10 = v9;
    objc_msgSend(v3, "poofInScaleResponse");
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100012050;
    v20[3] = &unk_100034BE8;
    v20[4] = *(_QWORD *)(a1 + 32);
    +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v20, 0, v10, v11, 0.0, 0.0, 0.0, 0.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[WFBannerPrototypeSettings sharedSettings](WFBannerPrototypeSettings, "sharedSettings"));
    v13 = objc_msgSend(v12, "blurFilterEnabled");

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
      objc_msgSend(v3, "poofInBlurRadius");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v15, "setValue:forKeyPath:", v16, CFSTR("filters.gaussianBlur.inputRadius"));

      objc_msgSend(v3, "poofInBlurResponse");
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000120DC;
      v19[3] = &unk_100034BE8;
      v19[4] = *(_QWORD *)(a1 + 32);
      +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v19, 0, 1.0, v17, 0.0, 0.0, 0.0, 0.0, 0.0);
    }
    objc_msgSend(v3, "poofInAlphaResponse");
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100012168;
    v18[3] = &unk_100034BE8;
    v18[4] = *(_QWORD *)(a1 + 32);
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2, v18, 0);
  }

}

void sub_100011FFC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(WeakRetained, "updateDimmingLayerVisibility");
  objc_msgSend(WeakRetained, "setViewIsAppearingHandler:", 0);

}

id sub_100012050(uint64_t a1)
{
  _QWORD v3[5];
  CAFrameRateRange v4;

  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000121F4;
  v3[3] = &unk_100034BE8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

id sub_1000120DC(uint64_t a1)
{
  _QWORD v3[5];
  CAFrameRateRange v4;

  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001219C;
  v3[3] = &unk_100034BE8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

void sub_100012168(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView"));
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void sub_10001219C(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));
  objc_msgSend(v1, "setValue:forKeyPath:", &off_100036F38, CFSTR("filters.gaussianBlur.inputRadius"));

}

void sub_1000121F4(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "containerView"));
  v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v3[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v3[1] = v2;
  v3[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  objc_msgSend(v1, "setTransform:", v3);

}

id sub_100012248(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "bannerSize");
  return objc_msgSend(v1, "setPreferredContentSize:");
}

void sub_100012270(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resetLocalIdleTimer");

}

void sub_1000127AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001514C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000161F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100017BF8()
{
  if (qword_10003FEE8 != -1)
    dispatch_once(&qword_10003FEE8, &stru_100034B70);
  return (id)qword_10003FEF0;
}

void sub_100017C38(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create(WFLogSubsystem, "BannerManager");
  v2 = (void *)qword_10003FEF0;
  qword_10003FEF0 = (uint64_t)v1;

}

void sub_100017C6C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD block[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = sub_100017BF8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[WFBannerManager configuredDisplayLayoutMonitor]_block_invoke";
    v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Received monitor configuration change: %@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017E34;
  block[3] = &unk_100034BE8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (objc_msgSend(*(id *)(a1 + 32), "shouldUpdateStateBasedOnLayout:", v4)
    && objc_msgSend(*(id *)(a1 + 32), "shouldObserveDisplayLayout"))
  {
    v7 = sub_100017BF8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[WFBannerManager configuredDisplayLayoutMonitor]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Display layout change matches conditions to present next banner, asking now", buf, 0xCu);
    }

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100017EA8;
    v10[3] = &unk_100034BE8;
    v10[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v9, v10);

  }
}

void sub_100017E34(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedBanner"));
  if (v2)
  {
    v3 = objc_opt_class(WFBannerViewController, v1);
    if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
      v4 = v2;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "performLayoutUpdate");
}

id sub_100017EA8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "queue_updateStateWithReason:", CFSTR("display lit"));
  return objc_msgSend(*(id *)(a1 + 32), "setShouldObserveDisplayLayout:", 0);
}

void sub_100017EDC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WFApertureStatusViewController requestIdentifierForContext:](WFApertureStatusViewController, "requestIdentifierForContext:", *(_QWORD *)(a1 + 32)));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bannerSource"));
  v7 = CFSTR("id");
  v8 = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  v5 = objc_msgSend(v3, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v2, CFSTR("WFBannerManager: single step home screen collapsed back to normal, dismissing"), 1, v4, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "singleStepHomeScreenRevokeTimers"));
  objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

void sub_100017FD8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;

  v2 = sub_100017BF8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "associatedRunningContext"));
    v12 = 136315394;
    v13 = "-[WFBannerManager bannerViewControllerRequestedTapDismissal:]_block_invoke";
    v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s User dismissed via tap <%@>", (uint8_t *)&v12, 0x16u);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "actionUserInterfaceListener"));

  v6 = *(void **)(a1 + 40);
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionUserInterfaceListener"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionInterface"));
    objc_msgSend(v8, "cancelPresentationWithCompletionHandler:", &stru_1000350D0);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dialogRequestCompletionHandler"));

    if (v9)
    {
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "dialogRequestCompletionHandler"));
      v11 = objc_msgSend(objc_alloc((Class)WFDialogResponse), "initWithCancelled:", 1);
      ((void (**)(_QWORD, id, _QWORD))v10)[2](v10, v11, 0);

      objc_msgSend(*(id *)(a1 + 40), "setDialogRequestCompletionHandler:", 0);
    }
  }
}

void sub_10001815C(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "actionUserInterfaceListener"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actionInterface"));
  objc_msgSend(v1, "cancelPresentationWithCompletionHandler:", &stru_1000350B0);

}

void sub_1000181B0(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;

  v2 = sub_100017BF8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "associatedRunningContext"));
    v12 = 136315394;
    v13 = "-[WFBannerManager bannerViewControllerHomeGestureDidPassThreshold:]_block_invoke";
    v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s User dismissed via home gesture <%@>", (uint8_t *)&v12, 0x16u);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "actionUserInterfaceListener"));

  v6 = *(void **)(a1 + 40);
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionUserInterfaceListener"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionInterface"));
    objc_msgSend(v8, "cancelPresentationWithCompletionHandler:", &stru_100035090);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dialogRequestCompletionHandler"));

    if (v9)
    {
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "dialogRequestCompletionHandler"));
      v11 = objc_msgSend(objc_alloc((Class)WFDialogResponse), "initWithCancelled:", 1);
      ((void (**)(_QWORD, id, _QWORD))v10)[2](v10, v11, 0);

      objc_msgSend(*(id *)(a1 + 40), "setDialogRequestCompletionHandler:", 0);
    }
  }
}

void sub_100018334(id *a1)
{
  unsigned __int8 v2;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;

  v2 = objc_msgSend(a1[4], "hasPrefix:", CFSTR("WFBannerManager: "));
  v3 = sub_100017BF8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v2 & 1) != 0)
  {
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "associatedRunningContext"));
      v7 = a1[4];
      v15 = 136315650;
      v16 = "-[WFBannerManager bannerViewController:willDismissWithReason:]_block_invoke";
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Banner (%@) will dismiss with reason: %@", (uint8_t *)&v15, 0x20u);

    }
  }
  else
  {
    if (v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "associatedRunningContext"));
      v9 = a1[4];
      v15 = 136315650;
      v16 = "-[WFBannerManager bannerViewController:willDismissWithReason:]_block_invoke";
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s System will dismiss banner (%@) with reason: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_msgSend(a1[5], "systemDismissedBanner");
    objc_msgSend(a1[6], "cancelAllPendingRequestsForSystemDismiss");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "actionUserInterfaceListener"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "actionInterface"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "runningContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "associatedRunningContext"));
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (v14)
      objc_msgSend(a1[6], "setActionUserInterfaceListener:", 0);
  }
}

void sub_10001851C(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bannerPresentationCompletion"));

  if (v2)
  {
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bannerPresentationCompletion"));
    v3[2](v3, 1);

    objc_msgSend(*(id *)(a1 + 32), "setBannerPresentationCompletion:", 0);
  }
}

void sub_100018584(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "viewControllerForPresenting"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001864C;
  v4[3] = &unk_100034C80;
  v3 = *(void **)(a1 + 48);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v4);

}

uint64_t sub_100018610(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "queue_dismissPresentableWithReason:interruptible:forced:", CFSTR("dismissPlatterForActionUserInterface"), 0, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_10001864C(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000186D4;
  v4[3] = &unk_100034C80;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t sub_1000186D4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "queue_dismissPresentableWithReason:interruptible:forced:", CFSTR("dismissPlatterForActionUserInterface"), 0, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100018710(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  void (**v18)(_QWORD);
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[5];
  void (**v25)(_QWORD);
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  char v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;

  v2 = sub_100017BF8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v36 = "-[WFBannerManager dialogViewController:didFinishWithResponse:waitForFollowUpRequest:]_block_invoke";
    v37 = 2112;
    v38 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Dialog finished: %@", buf, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "request"));
  if (v6)
  {
    v7 = objc_opt_class(WFSmartPromptDialogRequest, v5);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  v11 = *(id *)(a1 + 40);
  if (v11)
  {
    v12 = objc_opt_class(WFSmartPromptDialogResponse, v10);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      v13 = v11;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100018A24;
  v29[3] = &unk_100034FD0;
  v34 = *(_BYTE *)(a1 + 56);
  v29[4] = *(_QWORD *)(a1 + 48);
  v30 = *(id *)(a1 + 32);
  v31 = *(id *)(a1 + 40);
  v15 = v9;
  v32 = v15;
  v16 = v14;
  v33 = v16;
  v17 = objc_retainBlock(v29);
  v18 = (void (**)(_QWORD))v17;
  if (v15 && v16)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "configuration"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "workflowReference"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "promptedStatesData"));
    v22 = objc_msgSend(v21, "count");

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "promptedStatesData"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100018C68;
      v26[3] = &unk_100035020;
      v27 = v19;
      v28 = v20;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100018D44;
      v24[3] = &unk_100035048;
      v24[4] = *(_QWORD *)(a1 + 48);
      v25 = v18;
      objc_msgSend(v23, "if_mapAsynchronously:completionHandler:", v26, v24);

    }
    else
    {
      v18[2](v18);
    }

  }
  else
  {
    ((void (*)(_QWORD *))v17[2])(v17);
  }

}

void sub_100018A24(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD block[5];
  id v16;
  uint8_t buf[4];
  const char *v18;

  if (*(_BYTE *)(a1 + 72))
  {
    v2 = sub_100017BF8();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[WFBannerManager dialogViewController:didFinishWithResponse:waitForFollowUpRequest:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Asked to wait for follow up", buf, 0xCu);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "associatedRunningContext"));
    objc_msgSend(*(id *)(a1 + 32), "setRunningContextWaitingForFollowUpRequest:", v4);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018E64;
  block[3] = &unk_100034BC0;
  block[4] = *(_QWORD *)(a1 + 32);
  v16 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (objc_msgSend(*(id *)(a1 + 48), "isCancelled"))
  {
    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "associatedRunningContext"));
    objc_msgSend(v5, "queue_removePendingStatusPresentationsForRunningContext:", v6);

  }
  if (!*(_QWORD *)(a1 + 56) || !*(_QWORD *)(a1 + 64))
    goto LABEL_21;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedBanner"));
  if (v8)
  {
    v9 = objc_opt_class(WFBannerViewController, v7);
    v10 = (objc_opt_isKindOfClass(v8, v9) & 1) != 0 ? v8 : 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "embeddedPlatter"));
  if (!v12)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100018ED0;
    v13[3] = &unk_100034BE8;
    v14 = *(id *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

  }
  else
  {
LABEL_21:
    if (!*(_BYTE *)(a1 + 72))
      objc_msgSend(*(id *)(a1 + 32), "queue_dismissPresentableWithReason:interruptible:forced:", CFSTR("dialog view controller did finish with response"), 1, 0);
  }

}

void sub_100018C68(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[VCVoiceShortcutClient standardClient](VCVoiceShortcutClient, "standardClient"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "actionUUID"));
  v10 = *(_QWORD *)(a1 + 40);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100018D84;
  v12[3] = &unk_100034FF8;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v8, "setPerWorkflowStateData:forSmartPromptWithActionUUID:reference:completion:", v7, v9, v10, v12);

}

void sub_100018D44(uint64_t a1)
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));

}

void sub_100018D84(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v4 = sub_100017BF8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[WFBannerManager dialogViewController:didFinishWithResponse:waitForFollowUpRequest:]_block_invoke_4";
      v8 = 2112;
      v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Failed to set smart prompt data with error: %@", (uint8_t *)&v6, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_100018E64(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dialogRequestCompletionHandler"));

  if (v2)
  {
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dialogRequestCompletionHandler"));
    v3[2](v3, *(_QWORD *)(a1 + 40), 0);

    objc_msgSend(*(id *)(a1 + 32), "setDialogRequestCompletionHandler:", 0);
  }
}

id sub_100018ED0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

void sub_100018EE0(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingRequests", 0));
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v1);
        v7 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v5);
        if (v7)
        {
          v8 = objc_opt_class(WFQueuedDialog, v6);
          if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
          {
            v9 = objc_msgSend(objc_alloc((Class)WFDialogResponse), "initWithCancelled:", 1);
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "completionHandler"));

            if (v10)
            {
              v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "completionHandler"));
              ((void (**)(_QWORD, id, _QWORD))v11)[2](v11, v9, 0);

              objc_msgSend(v7, "setCompletionHandler:", 0);
            }

          }
        }

        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

void sub_100019068(uint64_t a1)
{
  void *v2;
  WFSingleStepHomeScreenCompletionStatusViewController *v3;
  uint64_t v4;
  void *v5;
  WFSingleStepHomeScreenCompletionStatusViewController *v6;
  uint64_t v7;
  WFSingleStepHomeScreenCompletionStatusViewController *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  id v20;
  WFSingleStepHomeScreenCompletionStatusViewController *v21;
  _QWORD *v22;
  void *v23;
  unsigned int v24;
  id v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  WFSingleStepHomeScreenCompletionStatusViewController *v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  WFSingleStepHomeScreenCompletionStatusViewController *v40;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultPostOptions"));
  if (objc_msgSend(*(id *)(a1 + 32), "presentsApertureStatus"))
  {
    v3 = [WFSingleStepHomeScreenCompletionStatusViewController alloc];
    v4 = *(_QWORD *)(a1 + 40);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "attribution"));
    v6 = -[WFApertureStatusViewController initWithRunningContext:attribution:](v3, "initWithRunningContext:attribution:", v4, v5);

    -[WFApertureStatusViewController setDelegate:](v6, "setDelegate:", *(_QWORD *)(a1 + 32));
    -[WFApertureStatusViewController setCompletingSuccessfully:](v6, "setCompletingSuccessfully:", 1);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[WFApertureStatusViewController requestIdentifierForContext:](WFApertureStatusViewController, "requestIdentifierForContext:", v7));
    v10 = objc_msgSend(v2, "mutableCopy");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController postOptions](v8, "postOptions"));

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "if_dictionaryByAddingEntriesFromDictionary:", v11));
    v2 = (void *)v12;
  }
  else
  {
    v13 = objc_msgSend(objc_alloc((Class)WFSingleStepHomeScreenShortcutCompletionDialogViewController), "initWithRequest:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v13, "setAssociatedRunningContext:", *(_QWORD *)(a1 + 40));
    v8 = (WFSingleStepHomeScreenCompletionStatusViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "requestContainerForRunningContext:", *(_QWORD *)(a1 + 40)));
    v14 = sub_100017BF8();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[WFSingleStepHomeScreenCompletionStatusViewController embeddedPlatter](v8, "embeddedPlatter"));
      *(_DWORD *)buf = 136315650;
      v36 = "-[WFBannerManager handleSingleStepHomeScreenDialogRequest:runningContext:completionHandler:]_block_invoke";
      v37 = 2112;
      v38 = v16;
      v39 = 2112;
      v40 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Morphing to platter %@ in container %@", buf, 0x20u);

    }
    -[WFSingleStepHomeScreenCompletionStatusViewController setEmbeddedPlatter:](v8, "setEmbeddedPlatter:", v13);
    objc_msgSend(*(id *)(a1 + 32), "preferredPresentationSize");
    v18 = v17;
    objc_msgSend(*(id *)(a1 + 32), "preferredPresentationSize");
    objc_msgSend(v13, "platterHeightForWidth:withMaximumHeight:", v18);
    objc_msgSend(v13, "setPreferredContentSize:", v18, v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WFApertureStatusViewController requestIdentifier](v8, "requestIdentifier"));

  }
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100019430;
  v31[3] = &unk_100034FA8;
  v31[4] = *(_QWORD *)(a1 + 32);
  v20 = v9;
  v32 = v20;
  v21 = v8;
  v33 = v21;
  v34 = *(id *)(a1 + 40);
  v22 = objc_retainBlock(v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bannerSource"));
  v30 = 0;
  v24 = objc_msgSend(v23, "postPresentable:options:userInfo:error:", v21, 0, v2, &v30);
  v25 = v30;

  if (v24)
  {
    ((void (*)(_QWORD *, double))v22[2])(v22, 1.0);
  }
  else
  {
    v26 = sub_100017BF8();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[WFBannerManager handleSingleStepHomeScreenDialogRequest:runningContext:completionHandler:]_block_invoke_5";
      v37 = 2112;
      v38 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s Unable to post single step home screen completion (%@)", buf, 0x16u);
    }

  }
  v28 = *(_QWORD *)(a1 + 56);
  v29 = objc_msgSend(objc_alloc((Class)WFDialogResponse), "initWithResponseCode:", 0);
  (*(void (**)(uint64_t, id, _QWORD))(v28 + 16))(v28, v29, 0);

}

void sub_100019430(uint64_t a1, double a2)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  __CFString *v9;
  id v10;
  id v11;

  v7[0] = _NSConcreteStackBlock;
  v7[2] = sub_10001952C;
  v7[3] = &unk_100034F80;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[1] = 3221225472;
  v8 = v4;
  v9 = CFSTR("WFBannerManager: Hit single step home screen revoke timer.");
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, a2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "singleStepHomeScreenRevokeTimers"));
  objc_msgSend(v6, "setObject:forKey:", v5, *(_QWORD *)(a1 + 56));

}

void sub_10001952C(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  const __CFString *v23;
  uint64_t v24;

  if (objc_msgSend(*(id *)(a1 + 32), "presentsApertureStatus"))
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bannerSource"));
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v23 = CFSTR("id");
    v24 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    v6 = objc_msgSend(v2, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v3, v4, 1, v5, 0);

  }
  else
  {
    v8 = *(id *)(a1 + 56);
    if (v8)
    {
      v9 = objc_opt_class(WFBannerViewController, v7);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        v10 = v8;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v2 = v10;

    objc_msgSend(v2, "dismissEmbeddedPlatterWithCompletion:interruptible:", &stru_100034F58, 0);
    v11 = objc_alloc((Class)WFDispatchSourceTimer);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_100019728;
    v19 = &unk_100034C30;
    v13 = *(void **)(a1 + 40);
    v20 = *(_QWORD *)(a1 + 32);
    v21 = v13;
    v22 = *(id *)(a1 + 48);
    v14 = objc_msgSend(v11, "initWithInterval:queue:handler:", v12, &v16, 0.5);

    objc_msgSend(v14, "setPreventSuspension:", 1, v16, v17, v18, v19, v20);
    objc_msgSend(v14, "start");

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "singleStepHomeScreenRevokeTimers"));
  objc_msgSend(v15, "removeObjectForKey:", *(_QWORD *)(a1 + 64));

}

void sub_100019728(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  const __CFString *v7;
  uint64_t v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bannerSource"));
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v7 = CFSTR("id");
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  v6 = objc_msgSend(v2, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v4, v3, 0, v5, 0);

}

void sub_1000197F0(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("pause timer kicked, %.2f seconds elapsed"), *(_QWORD *)(a1 + 40)));
  v3 = objc_msgSend(WeakRetained, "queue_resumeDialogPresentationWithReason:onRequestFromHost:", v2, 0);

}

void sub_100019864(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char isKindOfClass;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  WFBannerViewController *v30;
  id v31;
  void *v32;
  unsigned int v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id location[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "request"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "context"));
  if ((objc_msgSend(*(id *)(a1 + 40), "queuedDialogIsActionUIRequest:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_initWeak(location, *(id *)(a1 + 40));
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100019CC8;
    v42[3] = &unk_100034EC0;
    v4 = *(void **)(a1 + 40);
    v43 = *(id *)(a1 + 32);
    objc_copyWeak(&v44, location);
    objc_msgSend(v4, "setDialogRequestCompletionHandler:", v42);
    objc_destroyWeak(&v44);

    objc_destroyWeak(location);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "queuedDialogIsActionUIRequest:", *(_QWORD *)(a1 + 32)))
  {
    v6 = v2;
    if (v6)
    {
      v7 = objc_opt_class(WFShowActionInterfaceDialogRequest, v5);
      if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
        v8 = v6;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v21 = v8;

    v22 = objc_alloc((Class)WFActionUserInterfaceListener);
    v23 = WFUserInterfaceTypeUIKit;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "actionClassName"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "classNamesByType"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attribution"));

    v19 = objc_msgSend(v22, "initWithUserInterfaceType:actionClassName:classNamesByType:attribution:", v23, v24, v25, v26);
    v27 = *(_QWORD *)(a1 + 40);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "actionInterface"));
    objc_msgSend(v28, "setDelegate:", v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "actionInterface"));
    objc_msgSend(v29, "setRunningContext:", v3);

    objc_msgSend(*(id *)(a1 + 40), "setActionUserInterfaceListener:", v19);
    v30 = -[WFBannerViewController initWithDelegate:associatedRunningContext:]([WFBannerViewController alloc], "initWithDelegate:associatedRunningContext:", *(_QWORD *)(a1 + 40), v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isFollowUp"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "presentedPlatter"));
    if (v10)
    {
      v11 = objc_opt_class(WFCompactDialogViewController, v9);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        v12 = v10;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v19 = v12;

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "request"));
    v33 = objc_msgSend(v19, "canHandleFollowUpRequest:", v32);

    if (v33)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "request"));
      objc_msgSend(v19, "handleFollowUpRequest:", v34);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (*(_BYTE *)(a1 + 56)
      && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "request")),
          v15 = objc_opt_class(WFSmartPromptDialogRequest, v14),
          isKindOfClass = objc_opt_isKindOfClass(v13, v15),
          v13,
          (isKindOfClass & 1) != 0))
    {
      v17 = objc_msgSend(objc_alloc((Class)objc_msgSend(v2, "wf_dialogViewControllerClass")), "initWithRequest:", v2);
      objc_msgSend(v17, "setAssociatedRunningContext:", v3);
      objc_msgSend(v17, "setDelegate:", *(_QWORD *)(a1 + 40));
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100019D70;
      v39[3] = &unk_100034CD0;
      v18 = *(void **)(a1 + 48);
      v39[4] = *(_QWORD *)(a1 + 40);
      v40 = v17;
      v41 = v18;
      v19 = v17;
      objc_msgSend(v19, "prepareForPresentationWithCompletionHandler:", v39);

      v20 = v40;
    }
    else
    {
      v31 = objc_msgSend(objc_alloc((Class)objc_msgSend(v2, "wf_dialogViewControllerClass")), "initWithRequest:", v2);
      objc_msgSend(v31, "setAssociatedRunningContext:", v3);
      objc_msgSend(v31, "setDelegate:", *(_QWORD *)(a1 + 40));
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100019DFC;
      v35[3] = &unk_100034CA8;
      v35[4] = *(_QWORD *)(a1 + 40);
      v36 = v3;
      v37 = v31;
      v38 = *(id *)(a1 + 48);
      v19 = v31;
      objc_msgSend(v19, "prepareForPresentationWithCompletionHandler:", v35);

      v20 = v36;
    }

  }
}

void sub_100019CAC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_100019CC8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id WeakRetained;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionHandler"));

  if (v6)
  {
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionHandler"));
    ((void (**)(_QWORD, id, id))v7)[2](v7, v9, v5);

    objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setDialogRequestCompletionHandler:", 0);

}

void sub_100019D70(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019FA8;
  block[3] = &unk_100034CD0;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100019DFC(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100019E9C;
  v3[3] = &unk_100034CA8;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);

}

void sub_100019E9C(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "requestContainerForRunningContext:", *(_QWORD *)(a1 + 40)));
  v3 = sub_100017BF8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "embeddedPlatter"));
    v6 = 136315650;
    v7 = "-[WFBannerManager getBannerForQueuedDialogRequest:dialogIsBreakthroughSmartPrompt:completionHandler:]_block_invoke_7";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Morphing to platter %@ in container %@", (uint8_t *)&v6, 0x20u);

  }
  objc_msgSend(v2, "setEmbeddedPlatter:", *(_QWORD *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void sub_100019FA8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedBanner"));
  if (v3)
  {
    v4 = objc_opt_class(WFBannerViewController, v2);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
      v5 = v3;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001A074;
  v8[3] = &unk_100034EE8;
  v7 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, v8);

}

uint64_t sub_10001A074(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001A084(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;
  dispatch_time_t v13;
  NSObject *v14;
  id v15;
  id v16;
  int8x16_t v17;
  int8x16_t v18;
  _QWORD v19[4];
  int8x16_t v20;
  id v21;
  _QWORD v22[5];
  _QWORD block[4];
  int8x16_t v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;

  v3 = a2;
  v4 = sub_100017BF8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v27 = "-[WFBannerManager requestContainerForRunningContext:]_block_invoke";
    v28 = 2112;
    v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s User dismissed via dismissal gesture for running context: <%@>", buf, 0x16u);
  }

  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A310;
  block[3] = &unk_100034C30;
  v17 = *(int8x16_t *)(a1 + 32);
  v8 = (id)v17.i64[0];
  v24 = vextq_s8(v17, v17, 8uLL);
  v9 = v3;
  v25 = v9;
  dispatch_async(v7, block);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "dialogRequestCompletionHandler"));
  if (v10)
  {
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "dialogRequestCompletionHandler"));
    v12 = objc_msgSend(objc_alloc((Class)WFDialogResponse), "initWithCancelled:", 1);
    ((void (**)(_QWORD, id, _QWORD))v11)[2](v11, v12, 0);

    objc_msgSend(*(id *)(a1 + 40), "setDialogRequestCompletionHandler:", 0);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001A340;
  v22[3] = &unk_100034BE8;
  v22[4] = *(_QWORD *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v22);
  v13 = dispatch_time(0, 550000000);
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001A3BC;
  v19[3] = &unk_100034C30;
  v18 = *(int8x16_t *)(a1 + 32);
  v15 = (id)v18.i64[0];
  v20 = vextq_s8(v18, v18, 8uLL);
  v21 = v9;
  v16 = v9;
  dispatch_after(v13, v14, v19);

}

id sub_10001A310(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "queue_removePendingStatusPresentationsForRunningContext:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "queue_revokeIslandPresentableForContext:reason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_10001A340(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "actionUserInterfaceListener"));

  if (v2)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "actionUserInterfaceListener"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionInterface"));
    objc_msgSend(v3, "cancelPresentationWithCompletionHandler:", &stru_100034E70);

  }
}

id sub_10001A3BC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_revokePresentableForContext:reason:forced:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

void sub_10001A3D4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  WFApertureStatusViewController *v32;
  void *v33;
  void *v34;
  WFApertureStatusViewController *v35;
  WFApertureStatusViewController *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  dispatch_time_t v42;
  NSObject *v43;
  id v44;
  _QWORD v45[5];
  id v46;
  _QWORD block[5];
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  WFApertureStatusViewController *v59;
  __int16 v60;
  void *v61;

  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = sub_10001AA08;
  v54 = sub_10001AA18;
  v55 = 0;
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AA20;
  block[3] = &unk_100034E50;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v49 = &v50;
  block[4] = v3;
  v48 = v4;
  dispatch_sync(v2, block);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v51[5], "runningContext"));
  if (!v5
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v51[5], "attribution")),
        v7 = v6 == 0,
        v6,
        v7))
  {
    v20 = sub_100017BF8();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "-[WFBannerManager getBannerForQueuedStatusPresentation:completionHandler:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "%s Tracking workflow is not available for the requested status presentation", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "presentsApertureStatus");
    v9 = sub_100017BF8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        *(_DWORD *)buf = 136315138;
        v57 = "-[WFBannerManager getBannerForQueuedStatusPresentation:completionHandler:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Getting view for the island...", buf, 0xCu);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v51[5], "associatedPill"));
      if (v13
        && (v14 = objc_opt_class(WFApertureStatusViewController, v12),
            isKindOfClass = objc_opt_isKindOfClass(v13, v14),
            v13,
            (isKindOfClass & 1) != 0))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v51[5], "associatedPill"));
        if (v17)
        {
          v18 = objc_opt_class(WFApertureStatusViewController, v16);
          if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
            v19 = v17;
          else
            v19 = 0;
        }
        else
        {
          v19 = 0;
        }
        v36 = v19;

      }
      else
      {
        v32 = [WFApertureStatusViewController alloc];
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v51[5], "attribution"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v51[5], "progress"));
        v35 = -[WFApertureStatusViewController initWithRunningContext:attribution:progress:](v32, "initWithRunningContext:attribution:progress:", v5, v33, v34);

        objc_msgSend(*(id *)(a1 + 32), "preferredPresentationSize");
        -[WFApertureStatusViewController setPreferredContentSize:](v35, "setPreferredContentSize:");
        v36 = v35;
      }
      if (objc_msgSend((id)v51[5], "completed"))
      {
        -[WFApertureStatusViewController setCompletingSuccessfully:](v36, "setCompletingSuccessfully:", 1);
        v42 = dispatch_time(0, 1000000000);
        v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_10001AA90;
        v45[3] = &unk_100034BC0;
        v45[4] = *(_QWORD *)(a1 + 32);
        v46 = v5;
        dispatch_after(v42, v43, v45);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 136315138;
        v57 = "-[WFBannerManager getBannerForQueuedStatusPresentation:completionHandler:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Getting status banner...", buf, 0xCu);
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedPlatter"));
      if (v23
        && (v24 = objc_opt_class(WFCompactStatusViewController, v22),
            v25 = objc_opt_isKindOfClass(v23, v24),
            v23,
            (v25 & 1) != 0))
      {
        v26 = sub_100017BF8();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v57 = "-[WFBannerManager getBannerForQueuedStatusPresentation:completionHandler:]_block_invoke";
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s Already presented", buf, 0xCu);
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedPlatter"));
        if (v29)
        {
          v30 = objc_opt_class(WFCompactStatusViewController, v28);
          if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
            v31 = v29;
          else
            v31 = 0;
        }
        else
        {
          v31 = 0;
        }
        v36 = v31;

        v39 = 0;
      }
      else
      {
        v36 = (WFApertureStatusViewController *)objc_alloc_init((Class)WFCompactStatusViewController);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v51[5], "progress"));
        -[WFApertureStatusViewController setProgress:](v36, "setProgress:", v37);

        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v51[5], "attribution"));
        -[WFApertureStatusViewController setAttribution:](v36, "setAttribution:", v38);

        -[WFApertureStatusViewController setAssociatedRunningContext:](v36, "setAssociatedRunningContext:", v5);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "requestContainerForRunningContext:", v5));
        v40 = sub_100017BF8();
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v57 = "-[WFBannerManager getBannerForQueuedStatusPresentation:completionHandler:]_block_invoke";
          v58 = 2112;
          v59 = v36;
          v60 = 2112;
          v61 = v39;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s Queuing status platter %@ in container %@", buf, 0x20u);
        }

        objc_msgSend(v39, "setQueuedStatusPlatter:", v36);
      }
      v44 = v39;
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }

  _Block_object_dispose(&v50, 8);
}

void sub_10001A9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001AA08(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001AA18(uint64_t a1)
{

}

void sub_10001AA20(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "runningPersistentWorkflows"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "context"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v2));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id sub_10001AA90(uint64_t a1)
{
  id v2;
  NSObject *v3;
  int v5;
  const char *v6;

  v2 = sub_100017BF8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[WFBannerManager getBannerForQueuedStatusPresentation:completionHandler:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Revoking status view controller after delay", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue_revokeIslandPresentableForContext:reason:", *(_QWORD *)(a1 + 40), CFSTR("timer fired auto-dismiss completed persistent shortcut"));
  return objc_msgSend(*(id *)(a1 + 32), "queue_stopTrackingPersistentModeContext:withReason:", *(_QWORD *)(a1 + 40), CFSTR("completion auto-dismiss timer fired and presentable revoked"));
}

void sub_10001AB58(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD block[5];
  id v26;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "progress"));
  objc_msgSend(*(id *)(a1 + 32), "setProgress:", v2);

  if (objc_msgSend(*(id *)(a1 + 40), "completed"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletingSuccessfully:", 1);
    v3 = dispatch_time(0, 1000000000);
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001AF94;
    block[3] = &unk_100034BC0;
    v5 = *(void **)(a1 + 56);
    block[4] = *(_QWORD *)(a1 + 48);
    v26 = v5;
    dispatch_after(v3, v4, block);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "presentedBanner"));
    if (v7)
    {
      v8 = objc_opt_class(WFBannerViewController, v6);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        v9 = v7;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "presentedPlatter"));
    if (v12)
    {
      v13 = objc_opt_class(WFCompactDialogViewController, v11);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        v14 = v12;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    v15 = v14;

    if (v10
      && !objc_msgSend(v10, "dismissalPhase")
      && v15
      && (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "associatedRunningContext")),
          v17 = objc_msgSend(v16, "isEqual:", *(_QWORD *)(a1 + 56)),
          v16,
          v17))
    {
      v18 = *(void **)(a1 + 32);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "platterView"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "attribution"));
      objc_msgSend(v18, "setAttribution:", v20);

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10001AFD0;
      v23[3] = &unk_100034BE8;
      v24 = *(id *)(a1 + 32);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v23);

    }
    else
    {
      v21 = *(void **)(a1 + 32);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "attribution"));
      objc_msgSend(v21, "setAttribution:", v22);

    }
  }
}

id sub_10001ADBC(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;

  v2 = sub_100017BF8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 136315394;
    v7 = "-[WFBannerManager queue_updatePresentedStatusForRunningContext:]_block_invoke";
    v8 = 2112;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Popping completion checkmark on status view controller: %@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "transitionToCompleted:animated:", 1, 1);
}

id sub_10001AE84(uint64_t a1)
{
  id v2;
  NSObject *v3;
  int v5;
  const char *v6;

  v2 = sub_100017BF8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[WFBannerManager queue_updatePresentedStatusForRunningContext:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Revoking status view controller after delay", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue_dismissPresentableWithReason:interruptible:forced:", CFSTR("timer fired auto-dismiss completed persistent shortcut"), 0, 0);
  return objc_msgSend(*(id *)(a1 + 32), "queue_stopTrackingPersistentModeContext:withReason:", *(_QWORD *)(a1 + 40), CFSTR("completion auto-dismiss timer fired and presentable revoked"));
}

void sub_10001AF54(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "progress"));
  objc_msgSend(v1, "setProgress:", v2);

}

id sub_10001AF94(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "queue_revokeIslandPresentableForContext:reason:", *(_QWORD *)(a1 + 40), CFSTR("updatePresentedStatusWithProgressForRunningContext's auto dismiss timer fired"));
  return objc_msgSend(*(id *)(a1 + 32), "queue_stopTrackingPersistentModeContext:withReason:", *(_QWORD *)(a1 + 40), CFSTR("updatePresentedStatusWithProgressForRunningContext's auto dismiss timer fired"));
}

void sub_10001AFD0(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressView"));
  v3 = objc_msgSend(v2, "progressSuppressionState");

  if (v3 == (id)1)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressView"));
    objc_msgSend(v4, "setProgressSuppressionState:", 2);

  }
}

void sub_10001B050(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pendingRequests"));
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(WeakRetained, "queue_updateStateWithReason:", CFSTR("Persistent status queued."));
}

void sub_10001B0AC(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unsigned __int8 v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  _QWORD block[5];
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultPostOptions"));
  if ((objc_opt_respondsToSelector(*(_QWORD *)(a1 + 40), "postOptions") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "postOptions"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "if_dictionaryByAddingEntriesFromDictionary:", v3));

    v2 = (void *)v4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inflightRequest"));
  if (v5)
  {

LABEL_6:
    v6 = sub_100017BF8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 40);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestIdentifier"));
      *(_DWORD *)buf = 136315650;
      v25 = "-[WFBannerManager queue_presentBanner:completion:]_block_invoke_2";
      v26 = 2112;
      v27 = v8;
      v28 = 2112;
      v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Presenting banner (%@) for running context (%@)", buf, 0x20u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bannerSource"));
    v11 = *(_QWORD *)(a1 + 40);
    v23 = 0;
    v12 = objc_msgSend(v10, "postPresentable:options:userInfo:error:", v11, 0, v2, &v23);
    v13 = v23;

    if ((v12 & 1) != 0)
    {
      if (!*(_BYTE *)(a1 + 48))
      {
        objc_msgSend(*(id *)(a1 + 32), "setPresentedBanner:", *(_QWORD *)(a1 + 40));
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10001B394;
        block[3] = &unk_100034BC0;
        v15 = *(void **)(a1 + 40);
        block[4] = *(_QWORD *)(a1 + 32);
        v22 = v15;
        dispatch_async(v14, block);

      }
    }
    else
    {
      v16 = sub_100017BF8();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        v25 = "-[WFBannerManager queue_presentBanner:completion:]_block_invoke";
        v26 = 2112;
        v27 = v18;
        v28 = 2112;
        v29 = v13;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Unable to post banner: %@, error: %@", buf, 0x20u);
      }

    }
    goto LABEL_17;
  }
  if (*(_BYTE *)(a1 + 48))
    goto LABEL_6;
  v19 = sub_100017BF8();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[WFBannerManager queue_presentBanner:completion:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Didn't find an inflight request for the banner, so not presenting anything", buf, 0xCu);
  }

  v13 = 0;
LABEL_17:

}

void sub_10001B394(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "associatedRunningContext"));
  objc_msgSend(v1, "queue_updatePresentedStatusForRunningContext:", v2);

}

void sub_10001B3D8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WFApertureStatusViewController requestIdentifierForContext:](WFApertureStatusViewController, "requestIdentifierForContext:", *(_QWORD *)(a1 + 32)));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bannerSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "dismissalReasonWithReason:", *(_QWORD *)(a1 + 48)));
  v10 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v2, v4, 1, &__NSDictionary0__struct, &v10));
  v6 = v10;

  if (!v5)
  {
    v7 = sub_100017BF8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v12 = "-[WFBannerManager queue_revokeIslandPresentableForContext:reason:]_block_invoke";
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Failed to revoke banner for running context: %@, error: %@", buf, 0x20u);
    }

  }
}

void sub_10001B530(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;
  id v7;
  char v8;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B5E8;
  block[3] = &unk_100034D70;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(_BYTE *)(a1 + 64);
  dispatch_async(v2, block);

}

void sub_10001B5E8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  const char *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedBanner"));
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("hinting timer fired, hint reason: %@"), *(_QWORD *)(a1 + 56)));
    objc_msgSend(v6, "queue_revokePresentableForContext:reason:forced:", v7);

  }
  else
  {
    v4 = sub_100017BF8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[WFBannerManager queue_dismissPresentableWithReason:interruptible:forced:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Revoked running context does not match current presentable.", buf, 0xCu);
    }

  }
}

void sub_10001B724(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;

  v3 = a2;
  v4 = sub_100017BF8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[WFBannerManager queue_updateStateWithReason:]_block_invoke";
    v12 = 2112;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Presenting status presentation: %@", buf, 0x16u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "presentsApertureStatus") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setInflightRequest:", v3);
  v6 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001BC90;
  v8[3] = &unk_100034D20;
  v8[4] = v6;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "getBannerForQueuedStatusPresentation:completionHandler:", v7, v8);

}

void sub_10001B858(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B908;
  block[3] = &unk_100034C30;
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v4, block);

}

void sub_10001B908(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;

  v2 = sub_100017BF8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    v14 = "-[WFBannerManager queue_updateStateWithReason:]_block_invoke_2";
    v15 = 2112;
    v16 = v4;
    v17 = 2112;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Got banner for queued dialog: %@, presentable: %@", buf, 0x20u);
  }

  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  if (v7)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001BA3C;
    v10[3] = &unk_100034CF8;
    v8 = *(id *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 48);
    v11 = v8;
    v12 = v9;
    objc_msgSend(v6, "queue_presentBanner:completion:", v7, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "setInflightRequest:", 0);
  }
}

id sub_10001BA3C(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id result;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  id v18;
  int v19;
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;

  v4 = sub_100017BF8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a2 - 1) > 5)
      v6 = CFSTR("unknown (uh oh)");
    else
      v6 = *(&off_100035170 + a2 - 1);
    v7 = *(_QWORD *)(a1 + 32);
    v19 = 136315650;
    v20 = "-[WFBannerManager queue_updateStateWithReason:]_block_invoke";
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Banner presented for queued dialog with result: %@, dialog: %@", (uint8_t *)&v19, 0x20u);
  }

  if (a2 == 1)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "queuedDialogIsActionUIRequest:", *(_QWORD *)(a1 + 32)))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionHandler"));

      if (v8)
      {
        v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionHandler"));
        v10 = objc_alloc((Class)WFShowActionInterfaceDialogResponse);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "actionUserInterfaceListener"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "endpoint"));
        v13 = objc_msgSend(v10, "initWithListenerEndpoint:userInterfaceType:", v12, WFUserInterfaceTypeUIKit);
        ((void (**)(_QWORD, id, _QWORD))v9)[2](v9, v13, 0);

        objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
      }
    }
  }
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "queue"));
  dispatch_assert_queue_V2(v14);

  result = objc_msgSend(*(id *)(a1 + 40), "setInflightRequest:", 0);
  if ((unint64_t)(a2 - 5) <= 1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionHandler"));

    if (v16)
    {
      v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionHandler"));
      v18 = objc_msgSend(objc_alloc((Class)WFDialogResponse), "initWithResponseCode:", 1);
      ((void (**)(_QWORD, id, _QWORD))v17)[2](v17, v18, 0);

      objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
    }
    return objc_msgSend(*(id *)(a1 + 40), "queue_updateStateWithReason:", CFSTR("previous dialog failed, moving on"));
  }
  return result;
}

void sub_10001BC90(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BD3C;
  block[3] = &unk_100034C30;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void sub_10001BD3C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10001BDFC;
    v4[3] = &unk_100034CF8;
    v4[4] = v2;
    v5 = *(id *)(a1 + 48);
    objc_msgSend(v2, "queue_presentBanner:completion:", v3, v4);

  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "presentsApertureStatus") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "setInflightRequest:", 0);
    objc_msgSend(*(id *)(a1 + 40), "queue_updateStateWithReason:", CFSTR("status completion was in queue but tracking workflow was unavailable, moving on"));
  }
}

void sub_10001BDFC(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  uint64_t v16;

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  dispatch_assert_queue_V2(v4);

  v5 = sub_100017BF8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2 == 3)
  {
    if (v7)
    {
      v8 = *(const __CFString **)(a1 + 40);
      v11 = 136315394;
      v12 = "-[WFBannerManager queue_updateStateWithReason:]_block_invoke_3";
      v13 = 2112;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Tried presenting status (%@) but display was not lit. Not moving on for now.", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    if (v7)
    {
      if ((unint64_t)(a2 - 1) > 5)
        v9 = CFSTR("unknown (uh oh)");
      else
        v9 = *(&off_100035140 + a2 - 1);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = 136315650;
      v12 = "-[WFBannerManager queue_updateStateWithReason:]_block_invoke";
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Status banner presented with result: %@, status: %@", (uint8_t *)&v11, 0x20u);
    }

    if ((objc_msgSend(*(id *)(a1 + 32), "presentsApertureStatus") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "setInflightRequest:", 0);
    objc_msgSend(*(id *)(a1 + 32), "queue_updateStateWithReason:", CFSTR("a status banner was just presented and we need to check if a dialog for this shortcut came in while that was happening"));
  }
}

id sub_10001BF8C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_updateStateWithReason:", CFSTR("an inflightRequest was completed."));
}

void sub_10001BF9C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedBanner"));
  if (v3)
  {
    v4 = objc_opt_class(WFBannerViewController, v2);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
      v5 = v3;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v13 = v5;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "associatedRunningContext"));
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "queuedStatusPlatter"));

    if (v8)
      objc_msgSend(v13, "setQueuedStatusPlatter:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedPlatter"));
    v11 = objc_opt_class(WFCompactStatusViewController, v10);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
    {

LABEL_12:
      objc_msgSend(*(id *)(a1 + 32), "queue_dismissPresentableWithReason:interruptible:forced:", CFSTR("application was launched on last step of run"), 0, 0);
      goto LABEL_13;
    }
    v12 = objc_msgSend(v13, "dismissalPhase");

    if (v12 == (id)1)
      goto LABEL_12;
  }
LABEL_13:
  objc_msgSend(*(id *)(a1 + 32), "queue_stopTrackingPersistentModeContext:withReason:", *(_QWORD *)(a1 + 40), CFSTR("application was launched on last step of run"));
  objc_msgSend(*(id *)(a1 + 32), "queue_removePendingStatusPresentationsForRunningContext:", *(_QWORD *)(a1 + 40));

}

void sub_10001C0D8(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD block[4];
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "runningPersistentWorkflows"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40)));

  if (v3
    && (v5 = objc_opt_class(WFRunningPersistentModeWorkflow, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    if ((objc_msgSend(v3, "completed") & 1) == 0)
    {
      objc_msgSend(v3, "setAttribution:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "queue_updatePresentedStatusForRunningContext:", *(_QWORD *)(a1 + 40));
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "associatedPill"));
      if (v7)
      {
        v8 = objc_opt_class(WFApertureStatusViewController, v6);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10001C1FC;
          block[3] = &unk_100034BE8;
          v10 = v7;
          v7 = v7;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

        }
      }

    }
  }
  else
  {

    v3 = 0;
  }

}

void sub_10001C1FC(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressView"));
  objc_msgSend(v1, "setProgressSuppressionState:", 3);

}

void sub_10001C230(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue_resumeDialogPresentationWithReason:onRequestFromHost:", CFSTR("host asked us to"), 1));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10001C284(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue_pauseDialogPresentationForDuration:withReason:", *(_QWORD *)(a1 + 40), CFSTR("host asked us to")));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10001C2D8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  NSMutableArray *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  uint64_t v49;

  v2 = sub_100017BF8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v47 = "-[WFBannerManager dismissPresentedContentForRunningContext:completionHandler:]_block_invoke";
    v48 = 2112;
    v49 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Dismissing content for running context: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "setRunningContextWaitingForFollowUpRequest:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "presentedBanner"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "associatedRunningContext"));
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "inflightRequest"));
  if (v9)
  {
    v10 = objc_opt_class(WFQueuedDialog, v8);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      v11 = v9;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "context"));
  v14 = objc_msgSend(v13, "isEqual:", *(_QWORD *)(a1 + 32));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "presentedPlatter"));
  if (v16)
  {
    v17 = objc_opt_class(WFCompactStatusViewController, v15);
    v18 = objc_opt_isKindOfClass(v16, v17) & 1;
    if (v18)
      v19 = v16;
    else
      v19 = 0;
    v20 = v19;

    if ((v18 & v7) == 1)
    {
      v21 = sub_100017BF8();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFBannerManager dismissPresentedContentForRunningContext:completionHandler:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s Can't dismiss status through dismissPresentedContent:", buf, 0xCu);
      }

      goto LABEL_19;
    }
    v16 = v20;
    if (v14)
    {
LABEL_21:
      v23 = sub_100017BF8();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFBannerManager dismissPresentedContentForRunningContext:completionHandler:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s The inflight request is for a dialog from this run, cancelling it", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "setInflightRequest:", 0);
      if (!v7)
        goto LABEL_24;
LABEL_18:
      objc_msgSend(*(id *)(a1 + 40), "queue_dismissPresentableWithReason:interruptible:forced:", CFSTR("dismissPresentedContentForRunningContext"), 1, 0);
      objc_msgSend(*(id *)(a1 + 40), "queue_updateStateWithReason:", CFSTR("dismiss presented content was called for the currently presented banner"));
LABEL_19:
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_39;
    }
  }
  else if (v14)
  {
    goto LABEL_21;
  }
  if (v7)
    goto LABEL_18;
LABEL_24:
  v40 = v16;
  v25 = objc_opt_new(NSMutableArray);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v26 = a1;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "pendingRequests"));
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v30)
          objc_enumerationMutation(v27);
        v33 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        if (v33)
        {
          v34 = objc_opt_class(WFQueuedDialog, v32);
          if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0)
            v35 = v33;
          else
            v35 = 0;
        }
        else
        {
          v35 = 0;
        }
        v36 = v35;

        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "context"));
        v38 = objc_msgSend(v37, "isEqual:", *(_QWORD *)(v26 + 32));

        if (v38)
          -[NSMutableArray addObject:](v25, "addObject:", v33);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v29);
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v26 + 40), "pendingRequests"));
  objc_msgSend(v39, "removeObjectsInArray:", v25);

  (*(void (**)(void))(*(_QWORD *)(v26 + 48) + 16))();
  v16 = v40;
LABEL_39:

}

void sub_10001C710(id *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  id v19;
  dispatch_time_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  WFQueuedDialog *v28;
  void *v29;
  unsigned int v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  id v40;
  NSObject *v41;
  void (**v42)(id, id, _QWORD);
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  unsigned int v47;
  id v48;
  NSObject *v49;
  void *v50;
  unsigned int v51;
  id v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void (**v61)(_QWORD, _QWORD, _QWORD);
  id v62;
  dispatch_time_t v63;
  _QWORD block[5];
  id v65;
  _QWORD v66[5];
  id v67;
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  id v77;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "presentedBanner"));
  if (v3)
  {
    v4 = objc_opt_class(WFBannerViewController, v2);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
      v5 = v3;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "presentedBanner"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "associatedRunningContext"));

  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "automationType"));
    if (v10)
    {

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "identifier"));
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if ((v13 & 1) == 0)
      {
        v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "workflowIdentifier"));
        if (v33)
        {
          v34 = (void *)v33;
          v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "workflowIdentifier"));
          if (v35)
          {
            v36 = (void *)v35;
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "workflowIdentifier"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "workflowIdentifier"));
            v39 = objc_msgSend(v37, "isEqualToString:", v38);

            if (v39)
            {
              v40 = sub_100017BF8();
              v41 = objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v73 = "-[WFBannerManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s The incoming dialog is from a new run of the same shortcut. Discarding new run and performing bump animation.", buf, 0xCu);
              }

              v70[0] = _NSConcreteStackBlock;
              v70[1] = 3221225472;
              v70[2] = sub_10001CF20;
              v70[3] = &unk_100034BE8;
              v71 = v6;
              dispatch_async((dispatch_queue_t)&_dispatch_main_q, v70);
              v42 = (void (**)(id, id, _QWORD))a1[7];
              v43 = objc_msgSend(objc_alloc((Class)WFDialogResponse), "initWithCancelled:", 1);
              v42[2](v42, v43, 0);

              v21 = v71;
              goto LABEL_14;
            }
          }
          else
          {

          }
        }
        v54 = sub_100017BF8();
        v55 = objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v73 = "-[WFBannerManager showDialogRequest:runningContext:completionHandler:]_block_invoke_2";
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%s A presentable for a different shortcut has come in, immediately revoking the currently presented banner and cancelling the presented dialog. Presenting next dialog after a 0.3s delay.", buf, 0xCu);
        }

        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "runningPersistentWorkflows"));
        v28 = (WFQueuedDialog *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKey:", v8));

        if (v28)
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(-[WFQueuedDialog progress](v28, "progress"));
          objc_msgSend(v57, "cancel");

        }
        else
        {
          v58 = a1[4];
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "runningContext"));
          objc_msgSend(v58, "queue_removePendingStatusPresentationsForRunningContext:", v59);

          objc_msgSend(a1[4], "queue_dismissPresentableWithReason:interruptible:forced:", CFSTR("dismissPresentedContentForRunningContext"), 0, 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "dialogRequestCompletionHandler"));

          if (v60)
          {
            v61 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "dialogRequestCompletionHandler"));
            v62 = objc_msgSend(objc_alloc((Class)WFDialogResponse), "initWithCancelled:", 1);
            ((void (**)(_QWORD, id, _QWORD))v61)[2](v61, v62, 0);

            objc_msgSend(a1[4], "setDialogRequestCompletionHandler:", 0);
          }
        }
        v63 = dispatch_time(0, 200000000);
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_10001CF28;
        v66[3] = &unk_100034CA8;
        v66[4] = a1[4];
        v67 = a1[6];
        v68 = a1[5];
        v69 = a1[7];
        dispatch_after(v63, (dispatch_queue_t)&_dispatch_main_q, v66);

LABEL_52:
        goto LABEL_53;
      }
    }
  }
  v14 = a1[6];
  v15 = objc_opt_class(WFLinkSnippetEnvironmentDialogRequest, v9);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
  {
    v22 = a1[6];
    v23 = objc_opt_class(WFSingleStepHomeScreenShortcutCompletionDialogRequest, v16);
    if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
    {
      objc_msgSend(a1[4], "handleSingleStepHomeScreenDialogRequest:runningContext:completionHandler:", a1[6], a1[5], a1[7]);
      goto LABEL_53;
    }
    v24 = sub_100017BF8();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v27 = a1[5];
      v26 = a1[6];
      *(_DWORD *)buf = 136315650;
      v73 = "-[WFBannerManager showDialogRequest:runningContext:completionHandler:]_block_invoke_2";
      v74 = 2112;
      v75 = v26;
      v76 = 2112;
      v77 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s Queuing a dialog request: %@ for running context: %@", buf, 0x20u);
    }

    v28 = -[WFQueuedDialog initWithRequest:context:completionHandler:]([WFQueuedDialog alloc], "initWithRequest:context:completionHandler:", a1[6], a1[5], a1[7]);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "runningContextWaitingForFollowUpRequest"));
    v30 = objc_msgSend(v29, "isEqual:", a1[5]);

    if (v30)
    {
      v31 = sub_100017BF8();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v73 = "-[WFBannerManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
LABEL_37:
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s Moving dialog request to front of line, since it is the follow-up we are waiting for", buf, 0xCu);
      }
    }
    else
    {
      if ((objc_msgSend(a1[4], "presentsApertureStatus") & 1) == 0)
      {
        v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "presentedPersistentRunningContext"));
        if (v44)
        {
          v45 = (void *)v44;
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "presentedPersistentRunningContext"));
          v47 = objc_msgSend(v46, "isEqual:", a1[5]);

          if (v47)
          {
            v48 = sub_100017BF8();
            v49 = objc_claimAutoreleasedReturnValue(v48);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v73 = "-[WFBannerManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%s Moving dialog request to front of line, since it is part of the current presented persistent running context", buf, 0xCu);
            }

            goto LABEL_39;
          }
        }
      }
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "runningContextWaitingForFollowUpRequest"));
      v51 = objc_msgSend(v50, "isEqual:", a1[5]);

      if (!v51)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "pendingRequests"));
        objc_msgSend(v53, "addObject:", v28);
        goto LABEL_41;
      }
      v52 = sub_100017BF8();
      v32 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v73 = "-[WFBannerManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
        goto LABEL_37;
      }
    }

    -[WFQueuedDialog setIsFollowUp:](v28, "setIsFollowUp:", 1);
LABEL_39:
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "pendingRequests"));
    objc_msgSend(v53, "insertObject:atIndex:", v28, 0);
LABEL_41:

    if (objc_msgSend(a1[4], "runningContextIsInPersistentMode:", a1[5]))
      objc_msgSend(a1[4], "queue_removePendingStatusPresentationsForRunningContext:", a1[5]);
    objc_msgSend(a1[4], "queue_updateStateWithReason:", CFSTR("an incoming dialog came in"));
    goto LABEL_52;
  }
  v17 = sub_100017BF8();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = a1[5];
    *(_DWORD *)buf = 136315394;
    v73 = "-[WFBannerManager showDialogRequest:runningContext:completionHandler:]_block_invoke_2";
    v74 = 2112;
    v75 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Handling Link snippet sizing request for context: %@", buf, 0x16u);
  }

  v20 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CF38;
  block[3] = &unk_100034C80;
  block[4] = a1[4];
  v65 = a1[7];
  dispatch_after(v20, (dispatch_queue_t)&_dispatch_main_q, block);
  v21 = v65;
LABEL_14:

LABEL_53:
}

id sub_10001CF20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performBumpAnimation");
}

id sub_10001CF28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showDialogRequest:runningContext:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void sub_10001CF38(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  _QWORD v17[2];

  objc_msgSend(*(id *)(a1 + 32), "preferredContainerSize");
  +[WFCompactPlatterPresentationController preferredSizeForPresentingInContainerViewOfSize:](WFCompactPlatterPresentationController, "preferredSizeForPresentingInContainerViewOfSize:");
  v3 = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  v8 = v7;

  if (objc_msgSend(*(id *)(a1 + 32), "currentUserInterfaceStyle"))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "currentUserInterfaceStyle");
    if (v9 != objc_msgSend(v8, "userInterfaceStyle"))
    {
      v17[0] = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", objc_msgSend(*(id *)(a1 + 32), "currentUserInterfaceStyle")));
      v17[1] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));
      v12 = objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithTraitsFromCollections:](UITraitCollection, "traitCollectionWithTraitsFromCollections:", v11));

      v8 = (void *)v12;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setCurrentUserInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle"));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v14 = objc_msgSend(objc_alloc((Class)LNSnippetEnvironment), "initWithSize:locale:traitCollection:", v13, v8, v3, 1.79769313e308);
  v15 = *(_QWORD *)(a1 + 40);
  v16 = objc_msgSend(objc_alloc((Class)WFLinkSnippetEnvironmentDialogResponse), "initWithEnvironment:", v14);
  (*(void (**)(uint64_t, id, _QWORD))(v15 + 16))(v15, v16, 0);

}

uint64_t sub_10001D12C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSMutableArray *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;

  v2 = sub_100017BF8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v31 = "-[WFBannerManager completePersistentModeWithSuccess:runningContext:completionHandler:]_block_invoke";
    v32 = 2112;
    v33 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Finishing persistent mode for running context: %@", buf, 0x16u);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "BOOLValue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "runningPersistentWorkflows"));
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 32)));

    if (v6)
    {
      -[NSMutableArray setCompleted:](v6, "setCompleted:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "runningPersistentWorkflows"));
      objc_msgSend(v7, "setObject:forKey:", v6, *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 48), "queue_updatePresentedStatusForRunningContext:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      v23 = sub_100017BF8();
      v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(&v6->super.super, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v31 = "-[WFBannerManager completePersistentModeWithSuccess:runningContext:completionHandler:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, &v6->super.super, OS_LOG_TYPE_FAULT, "%s must be tracking a workflow at the time we complete it!", buf, 0xCu);
      }
    }
  }
  else
  {
    v6 = objc_opt_new(NSMutableArray);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "pendingRequests", 0));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "context"));
          v15 = objc_msgSend(v14, "isEqual:", *(_QWORD *)(a1 + 32));

          if (v15)
            -[NSMutableArray addObject:](v6, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "pendingRequests"));
    objc_msgSend(v16, "removeObjectsInArray:", v6);

    objc_msgSend(*(id *)(a1 + 48), "queue_stopTrackingPersistentModeContext:withReason:", *(_QWORD *)(a1 + 32), CFSTR("complete persistent called with failure"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "inflightRequest"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "context"));
    v19 = objc_msgSend(v18, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v19)
      objc_msgSend(*(id *)(a1 + 48), "setInflightRequest:", 0);
    if (objc_msgSend(*(id *)(a1 + 48), "presentsApertureStatus"))
      objc_msgSend(*(id *)(a1 + 48), "queue_revokeIslandPresentableForContext:reason:", *(_QWORD *)(a1 + 32), CFSTR("complete persistent called with failure"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "presentedBanner"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "associatedRunningContext"));
    v22 = objc_msgSend(v21, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v22)
      objc_msgSend(*(id *)(a1 + 48), "queue_dismissPresentableWithReason:interruptible:forced:", CFSTR("complete persistent called with failure"), 0, 0);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void sub_10001D48C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  WFRunningPersistentModeWorkflow *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;

  v2 = sub_100017BF8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v17 = "-[WFBannerManager beginPersistentModeWithRunningContext:attribution:completionHandler:]_block_invoke";
    v18 = 2112;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Queuing a new persistent mode request for running context: %@", buf, 0x16u);
  }

  objc_initWeak(&location, *(id *)(a1 + 40));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001D6EC;
  v12[3] = &unk_100034C58;
  objc_copyWeak(&v14, &location);
  v13 = *(id *)(a1 + 32);
  v5 = objc_retainBlock(v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "addProgressSubscriberUsingPublishingHandler:", v5));
  v7 = -[WFRunningPersistentModeWorkflow initWithRunningContext:attribution:progressSubscriber:]([WFRunningPersistentModeWorkflow alloc], "initWithRunningContext:attribution:progressSubscriber:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "runningPersistentWorkflows"));
  objc_msgSend(v8, "setObject:forKey:", v7, *(_QWORD *)(a1 + 32));

  v9 = sub_100017BF8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v17 = "-[WFBannerManager beginPersistentModeWithRunningContext:attribution:completionHandler:]_block_invoke";
    v18 = 2112;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Starting to track persistent workflow with context: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "queue_enqueuePersistentModeStatusPresentationForRunningContext:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "queue_updateStateWithReason:", CFSTR("a new persistent mode shortcut started and we just enqueued a new persistent mode request"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void sub_10001D6C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Block_layout *sub_10001D6EC(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D7AC;
  block[3] = &unk_100034C30;
  v9 = *(id *)(a1 + 32);
  v10 = WeakRetained;
  v11 = v3;
  v6 = v3;
  dispatch_async(v5, block);

  return &stru_100034C08;
}

id sub_10001D7AC(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;

  v2 = sub_100017BF8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v10 = 136315394;
    v11 = "-[WFBannerManager beginPersistentModeWithRunningContext:attribution:completionHandler:]_block_invoke_3";
    v12 = 2112;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Received progress for persistent workflow: %@", (uint8_t *)&v10, 0x16u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "runningPersistentWorkflows"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 32)));

  if (v6)
  {
    v8 = objc_opt_class(WFRunningPersistentModeWorkflow, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
      objc_msgSend(v6, "updateWithProgress:", *(_QWORD *)(a1 + 48));
  }

  return objc_msgSend(*(id *)(a1 + 40), "queue_updatePresentedStatusForRunningContext:", *(_QWORD *)(a1 + 32));
}

void sub_10001D8CC(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connectedHosts"));
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  v3 = sub_100017BF8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v18 = "-[WFBannerManager removeConnectedHost:]_block_invoke";
    v19 = 2112;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Removed connected host: %@", buf, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connectedHosts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    v9 = sub_100017BF8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[WFBannerManager removeConnectedHost:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s No connected hosts remain, resetting.", buf, 0xCu);
    }

    v11 = objc_alloc((Class)WFDispatchSourceTimer);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001DAE4;
    v16[3] = &unk_100034BE8;
    v16[4] = *(_QWORD *)(a1 + 32);
    v13 = objc_msgSend(v11, "initWithInterval:queue:handler:", v12, v16, 2.0);
    objc_msgSend(*(id *)(a1 + 32), "setCleanUpTimer:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cleanUpTimer"));
    objc_msgSend(v14, "setPreventSuspension:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cleanUpTimer"));
    objc_msgSend(v15, "start");

  }
}

id sub_10001DAE4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "queue_resetWithReason:", CFSTR("No connected hosts, clean up timer fired."));
  objc_msgSend(*(id *)(a1 + 32), "revokeAllPresentablesWithReason:", CFSTR("No connected hosts, clean up timer fired."));
  return objc_msgSend(*(id *)(a1 + 32), "setCleanUpTimer:", 0);
}

void sub_10001DB28(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connectedHosts"));
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  v3 = sub_100017BF8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v8 = 136315394;
    v9 = "-[WFBannerManager addConnectedHost:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Added connected host: %@", (uint8_t *)&v8, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cleanUpTimer"));
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "queue_resetWithReason:", CFSTR("Was awaiting cleanup, but new run started, so cleaning up now"));
    objc_msgSend(*(id *)(a1 + 32), "revokeAllPresentablesWithReason:", CFSTR("Was awaiting cleanup, but new run started, so cleaning up now"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cleanUpTimer"));
    objc_msgSend(v7, "cancel");

    objc_msgSend(*(id *)(a1 + 32), "setCleanUpTimer:", 0);
  }
}

void sub_10001DC58(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  objc_msgSend(WeakRetained, "setCurrentUserInterfaceStyle:", v4);
}

uint64_t start(int a1, char **a2)
{
  WFUIPresentationServer *v4;
  id v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  NSString *v9;
  uint64_t v10;

  v4 = objc_opt_new(WFUIPresentationServer);
  -[WFUIPresentationServer start](v4, "start");
  v5 = +[WFBannerPrototypeSettings sharedSettings](WFBannerPrototypeSettings, "sharedSettings");
  v7 = (objc_class *)objc_opt_class(WFAngelAppDelegate, v6);
  v8 = NSStringFromClass(v7);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(v8);
  v10 = UIApplicationMain(a1, a2, 0, v9);

  return v10;
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGPath");
}

id objc_msgSend_SBUISA_systemApertureObstructedAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SBUISA_systemApertureObstructedAreaLayoutGuide");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__animateUsingSpringWithDampingRatio_response_tracking_dampingRatioSmoothing_responseSmoothing_targetSmoothing_projectionDeceleration_retargetImpulse_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:");
}

id objc_msgSend__defaultAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_defaultAttributes");
}

id objc_msgSend__firstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_firstBaselineOffsetFromTop");
}

id objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:");
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rootSheetPresentationController");
}

id objc_msgSend__screen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_screen");
}

id objc_msgSend__setContinuousCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setContinuousCornerRadius:");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend__window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_window");
}

id objc_msgSend_acquireDismissalPreventionAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireDismissalPreventionAssertion");
}

id objc_msgSend_acquireTransitionDismissalPreventionAssertionForReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireTransitionDismissalPreventionAssertionForReason:");
}

id objc_msgSend_actionClassName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionClassName");
}

id objc_msgSend_actionGroupView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionGroupView");
}

id objc_msgSend_actionInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionInterface");
}

id objc_msgSend_actionUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionUUID");
}

id objc_msgSend_actionUserInterfaceListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionUserInterfaceListener");
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithHandler:");
}

id objc_msgSend_actionWithSettingsKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithSettingsKeyPath:");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actions");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_activeEmbeddedPlatterUpdateCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeEmbeddedPlatterUpdateCount");
}

id objc_msgSend_activeLayoutMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeLayoutMode");
}

id objc_msgSend_activeWindow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeWindow");
}

id objc_msgSend_addAction_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:forControlEvents:");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addConnectedHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addConnectedHost:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addProgressSubscriberUsingPublishingHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addProgressSubscriberUsingPublishingHandler:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_alphaOutEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alphaOutEnabled");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_appBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appBundleIdentifier");
}

id objc_msgSend_applyMaterialViewStyling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyMaterialViewStyling");
}

id objc_msgSend_arrangedSubviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrangedSubviews");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assertionReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assertionReason");
}

id objc_msgSend_associatedPill(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "associatedPill");
}

id objc_msgSend_associatedRunningContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "associatedRunningContext");
}

id objc_msgSend_attribution(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attribution");
}

id objc_msgSend_automationType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "automationType");
}

id objc_msgSend_awaitingIconOwnershipSwap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "awaitingIconOwnershipSwap");
}

id objc_msgSend_bannerContentOutsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerContentOutsets");
}

id objc_msgSend_bannerFramesEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerFramesEnabled");
}

id objc_msgSend_bannerGesture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerGesture");
}

id objc_msgSend_bannerGestureDidBegin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerGestureDidBegin");
}

id objc_msgSend_bannerGestureDidContinue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerGestureDidContinue");
}

id objc_msgSend_bannerGestureDidEndWithDismissal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerGestureDidEndWithDismissal:");
}

id objc_msgSend_bannerIsFullScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerIsFullScreen");
}

id objc_msgSend_bannerManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerManager");
}

id objc_msgSend_bannerPresentationCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerPresentationCompletion");
}

id objc_msgSend_bannerSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerSize");
}

id objc_msgSend_bannerSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerSource");
}

id objc_msgSend_bannerSourceForDestination_forRequesterIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerSourceForDestination:forRequesterIdentifier:");
}

id objc_msgSend_bannerViewController_didPresentBanner_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerViewController:didPresentBanner:");
}

id objc_msgSend_bannerViewController_willDismissWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerViewController:willDismissWithReason:");
}

id objc_msgSend_bannerViewControllerActionUserInterfaceNeedsDismissal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerViewControllerActionUserInterfaceNeedsDismissal:");
}

id objc_msgSend_bannerViewControllerHomeGestureDidPassThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerViewControllerHomeGestureDidPassThreshold:");
}

id objc_msgSend_bannerViewControllerRequestedTapDismissal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerViewControllerRequestedTapDismissal:");
}

id objc_msgSend_bannerWorkaroundsDisabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerWorkaroundsDisabled");
}

id objc_msgSend_beginObservingForPresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginObservingForPresentation");
}

id objc_msgSend_beginObservingKeyboard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginObservingKeyboard");
}

id objc_msgSend_beginObservingScreenOnState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginObservingScreenOnState");
}

id objc_msgSend_beginTrackingWithGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginTrackingWithGestureRecognizer:");
}

id objc_msgSend_between_and_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "between:and:");
}

id objc_msgSend_bezierPathWithRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bezierPathWithRect:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_blurBottomLimit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blurBottomLimit");
}

id objc_msgSend_blurFilterEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blurFilterEnabled");
}

id objc_msgSend_blurTopLimit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blurTopLimit");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bottomLimit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomLimit");
}

id objc_msgSend_bottomRubberBandRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomRubberBandRange");
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_buttonWithConfiguration_primaryAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithConfiguration:primaryAction:");
}

id objc_msgSend_canHandleFollowUpRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canHandleFollowUpRequest:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelAllPendingRequestsForSystemDismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAllPendingRequestsForSystemDismiss");
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelButton");
}

id objc_msgSend_cancelPresentationWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPresentationWithCompletionHandler:");
}

id objc_msgSend_classNamesByType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classNamesByType");
}

id objc_msgSend_cleanUpTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUpTimer");
}

id objc_msgSend_collapseTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collapseTimer");
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_completed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completed");
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionHandler");
}

id objc_msgSend_concretePresenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "concretePresenter");
}

id objc_msgSend_conditionFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conditionFormat:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationForDefaultMainDisplayMonitor");
}

id objc_msgSend_configureConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureConnection:");
}

id objc_msgSend_configuredDisplayLayoutMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuredDisplayLayoutMonitor");
}

id objc_msgSend_connectedHosts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedHosts");
}

id objc_msgSend_connectedIdentities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedIdentities");
}

id objc_msgSend_containerSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerSize");
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerView");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentOffset");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentSize");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "context");
}

id objc_msgSend_continueTrackingWithGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "continueTrackingWithGestureRecognizer:");
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertRect:toView:");
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

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTraitCollection");
}

id objc_msgSend_currentUserInterfaceStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUserInterfaceStyle");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultPostOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultPostOptions");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_dialogButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dialogButton");
}

id objc_msgSend_dialogPresentationPausingReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dialogPresentationPausingReason");
}

id objc_msgSend_dialogPresentationResumingReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dialogPresentationResumingReason");
}

id objc_msgSend_dialogRequestCompletionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dialogRequestCompletionHandler");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dimmingView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dimmingView");
}

id objc_msgSend_disableTransition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableTransition");
}

id objc_msgSend_dismissEmbeddedPlatterWithCompletion_interruptible_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissEmbeddedPlatterWithCompletion:interruptible:");
}

id objc_msgSend_dismissModalPlatterWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissModalPlatterWithCompletion:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dismissalCompletionTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissalCompletionTimer");
}

id objc_msgSend_dismissalHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissalHandler");
}

id objc_msgSend_dismissalPhase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissalPhase");
}

id objc_msgSend_dismissalPreventionAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissalPreventionAssertion");
}

id objc_msgSend_dismissalReasonWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissalReasonWithReason:");
}

id objc_msgSend_displayMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayMonitor");
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayScale");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_effectiveScaleForTranslation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveScaleForTranslation:");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "elements");
}

id objc_msgSend_embeddedPlatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "embeddedPlatter");
}

id objc_msgSend_embeddedScrollView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "embeddedScrollView");
}

id objc_msgSend_endEditing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endEditing:");
}

id objc_msgSend_endTrackingWithGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endTrackingWithGestureRecognizer:");
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpoint");
}

id objc_msgSend_excessTranslationForBoundedScrollViewWithInputTranslation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "excessTranslationForBoundedScrollViewWithInputTranslation:");
}

id objc_msgSend_filterWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterWithType:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_fixedEndTranslationUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fixedEndTranslationUp");
}

id objc_msgSend_fixedEndTranslationUpEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fixedEndTranslationUpEnabled");
}

id objc_msgSend_fluidTransitionFromPlatter_toPlatter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fluidTransitionFromPlatter:toPlatter:");
}

id objc_msgSend_forwardingTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forwardingTarget");
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fractionCompleted");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_gestureSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gestureSettings");
}

id objc_msgSend_getBannerForQueuedDialogRequest_dialogIsBreakthroughSmartPrompt_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBannerForQueuedDialogRequest:dialogIsBreakthroughSmartPrompt:completionHandler:");
}

id objc_msgSend_getBannerForQueuedStatusPresentation_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBannerForQueuedStatusPresentation:completionHandler:");
}

id objc_msgSend_getRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRed:green:blue:alpha:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleFollowUpRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFollowUpRequest:");
}

id objc_msgSend_handleSingleStepHomeScreenDialogRequest_runningContext_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSingleStepHomeScreenDialogRequest:runningContext:completionHandler:");
}

id objc_msgSend_hasCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasCompleted");
}

id objc_msgSend_hasCustomHomeGestureBehavior(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasCustomHomeGestureBehavior");
}

id objc_msgSend_hasEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasEntitlement:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSystemAperture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSystemAperture");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_hintAnimationResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hintAnimationResponse");
}

id objc_msgSend_hintAnimationTargetScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hintAnimationTargetScale");
}

id objc_msgSend_hintDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hintDuration");
}

id objc_msgSend_homeGestureDidPassThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeGestureDidPassThreshold");
}

id objc_msgSend_horizontalTrackingEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "horizontalTrackingEnabled");
}

id objc_msgSend_horizontalTrackingFriction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "horizontalTrackingFriction");
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "icon");
}

id objc_msgSend_iconView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconView");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_if_dictionaryByAddingEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "if_dictionaryByAddingEntriesFromDictionary:");
}

id objc_msgSend_if_mapAsynchronously_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "if_mapAsynchronously:completionHandler:");
}

id objc_msgSend_inflightRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inflightRequest");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithCancelled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCancelled:");
}

id objc_msgSend_initWithChangesDeliveredOnQueue_toBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithChangesDeliveredOnQueue:toBlock:");
}

id objc_msgSend_initWithDelegate_associatedRunningContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:associatedRunningContext:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithEnvironment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEnvironment:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithIcon_runningContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIcon:runningContext:");
}

id objc_msgSend_initWithInterval_queue_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInterval:queue:handler:");
}

id objc_msgSend_initWithListenerEndpoint_userInterfaceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListenerEndpoint:userInterfaceType:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithOptions_capacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOptions:capacity:");
}

id objc_msgSend_initWithPackageName_inBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPackageName:inBundle:");
}

id objc_msgSend_initWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRequest:");
}

id objc_msgSend_initWithRequest_context_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRequest:context:completionHandler:");
}

id objc_msgSend_initWithResponseCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithResponseCode:");
}

id objc_msgSend_initWithRunningContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRunningContext:");
}

id objc_msgSend_initWithRunningContext_attribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRunningContext:attribution:");
}

id objc_msgSend_initWithRunningContext_attribution_progress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRunningContext:attribution:progress:");
}

id objc_msgSend_initWithRunningContext_attribution_progressSubscriber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRunningContext:attribution:progressSubscriber:");
}

id objc_msgSend_initWithSceneSession_window_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSceneSession:window:");
}

id objc_msgSend_initWithSize_locale_traitCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSize:locale:traitCollection:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithTintColor_runningContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTintColor:runningContext:");
}

id objc_msgSend_initWithUserInterfaceType_actionClassName_classNamesByType_attribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUserInterfaceType:actionClassName:classNamesByType:attribution:");
}

id objc_msgSend_initWithView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithView:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_initialPresentationTransitioning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initialPresentationTransitioning");
}

id objc_msgSend_initialScrollOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initialScrollOffset");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertSubview:atIndex:");
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intrinsicContentSize");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invokeHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invokeHandler");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isDialogPresentationPaused(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDialogPresentationPaused");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFollowUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFollowUp");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHidden");
}

id objc_msgSend_isRunningFromActionButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunningFromActionButton");
}

id objc_msgSend_isShortcutsApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isShortcutsApp");
}

id objc_msgSend_isTouchingDownButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTouchingDownButton");
}

id objc_msgSend_keyboardIsVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyboardIsVisible");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "label");
}

id objc_msgSend_lastKnownProgressValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastKnownProgressValue");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutDescription");
}

id objc_msgSend_layoutDescriptionWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutDescriptionWithError:");
}

id objc_msgSend_layoutDimmingLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutDimmingLayer");
}

id objc_msgSend_layoutEmbeddedPlatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutEmbeddedPlatter");
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutFrame");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_layoutMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutMonitor");
}

id objc_msgSend_leadingView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingView");
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listener");
}

id objc_msgSend_listenerWithConfigurator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listenerWithConfigurator:");
}

id objc_msgSend_localIdleTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localIdleTimer");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_makeKeyWindow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyWindow");
}

id objc_msgSend_materialView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "materialView");
}

id objc_msgSend_materialViewWithRecipe_options_initialWeighting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "materialViewWithRecipe:options:initialWeighting:");
}

id objc_msgSend_micaView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "micaView");
}

id objc_msgSend_moduleWithTitle_contents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moduleWithTitle:contents:");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_newAssertionToDisableIdleTimerForReason_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newAssertionToDisableIdleTimerForReason:error:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "object");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_offsetFromPresentationEdge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "offsetFromPresentationEdge");
}

id objc_msgSend_openURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:");
}

id objc_msgSend_overrideLayoutMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideLayoutMode");
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "panGestureRecognizer");
}

id objc_msgSend_pauseTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseTimer");
}

id objc_msgSend_pendingDelayedAttribution(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingDelayedAttribution");
}

id objc_msgSend_pendingRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingRequests");
}

id objc_msgSend_performBumpAnimation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performBumpAnimation");
}

id objc_msgSend_performLayoutUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performLayoutUpdate");
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performWithoutAnimation:");
}

id objc_msgSend_phase1_artificialInitialOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phase1_artificialInitialOffset");
}

id objc_msgSend_phase1_impulse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phase1_impulse");
}

id objc_msgSend_phase1_impulse_unregisteredVelocity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phase1_impulse_unregisteredVelocity");
}

id objc_msgSend_phase1_initialBlurRadius(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phase1_initialBlurRadius");
}

id objc_msgSend_phase1_initialScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phase1_initialScale");
}

id objc_msgSend_phase1_phaseDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phase1_phaseDuration");
}

id objc_msgSend_phase1_response(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phase1_response");
}

id objc_msgSend_plainButtonConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plainButtonConfiguration");
}

id objc_msgSend_platterAwaitingModalPresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platterAwaitingModalPresentation");
}

id objc_msgSend_platterContentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platterContentSize");
}

id objc_msgSend_platterCornerRadius(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platterCornerRadius");
}

id objc_msgSend_platterHeightForWidth_withMaximumHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platterHeightForWidth:withMaximumHeight:");
}

id objc_msgSend_platterShouldOwnHomeGesture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platterShouldOwnHomeGesture:");
}

id objc_msgSend_platterView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platterView");
}

id objc_msgSend_platterViewAwaitingTransition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platterViewAwaitingTransition");
}

id objc_msgSend_poofAlphaDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofAlphaDelay");
}

id objc_msgSend_poofAlphaResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofAlphaResponse");
}

id objc_msgSend_poofBlurDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofBlurDelay");
}

id objc_msgSend_poofBlurRadius(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofBlurRadius");
}

id objc_msgSend_poofBlurResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofBlurResponse");
}

id objc_msgSend_poofInAlphaResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofInAlphaResponse");
}

id objc_msgSend_poofInBlurRadius(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofInBlurRadius");
}

id objc_msgSend_poofInBlurResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofInBlurResponse");
}

id objc_msgSend_poofInScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofInScale");
}

id objc_msgSend_poofInScaleDamping(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofInScaleDamping");
}

id objc_msgSend_poofInScaleResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofInScaleResponse");
}

id objc_msgSend_poofOutAlphaDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofOutAlphaDelay");
}

id objc_msgSend_poofOutAlphaResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofOutAlphaResponse");
}

id objc_msgSend_poofOutBlurRadius(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofOutBlurRadius");
}

id objc_msgSend_poofOutBlurResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofOutBlurResponse");
}

id objc_msgSend_poofOutScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofOutScale");
}

id objc_msgSend_poofOutScaleResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofOutScaleResponse");
}

id objc_msgSend_poofResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofResponse");
}

id objc_msgSend_poofScaleDown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofScaleDown");
}

id objc_msgSend_poofScaleUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofScaleUp");
}

id objc_msgSend_poofThrowDistanceDown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofThrowDistanceDown");
}

id objc_msgSend_poofThrowDistanceUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poofThrowDistanceUp");
}

id objc_msgSend_poof_scale_multiplier_y(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "poof_scale_multiplier_y");
}

id objc_msgSend_postOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postOptions");
}

id objc_msgSend_postPresentable_options_userInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postPresentable:options:userInfo:error:");
}

id objc_msgSend_precision_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "precision:");
}

id objc_msgSend_preferredContainerSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredContainerSize");
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredContentSize");
}

id objc_msgSend_preferredLayoutModeForRunningContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLayoutModeForRunningContext:");
}

id objc_msgSend_preferredPresentationSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredPresentationSize");
}

id objc_msgSend_preferredSizeForPresentingInContainerViewOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredSizeForPresentingInContainerViewOfSize:");
}

id objc_msgSend_prepareForPresentationWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareForPresentationWithCompletionHandler:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentableContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentableContext");
}

id objc_msgSend_presentableDismissalPreventionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentableDismissalPreventionContext");
}

id objc_msgSend_presentableHomeGestureContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentableHomeGestureContext");
}

id objc_msgSend_presentableIsIslandPresentable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentableIsIslandPresentable:");
}

id objc_msgSend_presentationSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationSize");
}

id objc_msgSend_presentedBanner(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedBanner");
}

id objc_msgSend_presentedPersistentRunningContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedPersistentRunningContext");
}

id objc_msgSend_presentedPlatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedPlatter");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_presentedViewFrameInContainerView_containerViewSize_withSizeCalculation_ofPresentedPlatter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewFrameInContainerView:containerViewSize:withSizeCalculation:ofPresentedPlatter:");
}

id objc_msgSend_presenterRequestedWorkflowPauseForContext_dialogRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presenterRequestedWorkflowPauseForContext:dialogRequest:completionHandler:");
}

id objc_msgSend_presentingScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingScreen");
}

id objc_msgSend_presentsApertureStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentsApertureStatus");
}

id objc_msgSend_previousLayoutMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousLayoutMode");
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryColor");
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progress");
}

id objc_msgSend_progressSubscriber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressSubscriber");
}

id objc_msgSend_progressSuppressionState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressSuppressionState");
}

id objc_msgSend_progressSuppressionTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressSuppressionTimer");
}

id objc_msgSend_progressView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressView");
}

id objc_msgSend_promptedStatesData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptedStatesData");
}

id objc_msgSend_publishedObjectWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publishedObjectWithName:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_queue_dismissPresentableWithReason_interruptible_forced_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue_dismissPresentableWithReason:interruptible:forced:");
}

id objc_msgSend_queue_enqueuePersistentModeStatusPresentationForRunningContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue_enqueuePersistentModeStatusPresentationForRunningContext:");
}

id objc_msgSend_queue_pauseDialogPresentationForDuration_withReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue_pauseDialogPresentationForDuration:withReason:");
}

id objc_msgSend_queue_presentBanner_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue_presentBanner:completion:");
}

id objc_msgSend_queue_removePendingStatusPresentationsForRunningContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue_removePendingStatusPresentationsForRunningContext:");
}

id objc_msgSend_queue_resetWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue_resetWithReason:");
}

id objc_msgSend_queue_resumeDialogPresentationWithReason_onRequestFromHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue_resumeDialogPresentationWithReason:onRequestFromHost:");
}

id objc_msgSend_queue_revokeIslandPresentableForContext_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue_revokeIslandPresentableForContext:reason:");
}

id objc_msgSend_queue_revokePresentableForContext_reason_forced_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue_revokePresentableForContext:reason:forced:");
}

id objc_msgSend_queue_stopTrackingPersistentModeContext_withReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue_stopTrackingPersistentModeContext:withReason:");
}

id objc_msgSend_queue_updatePresentedStatusForRunningContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue_updatePresentedStatusForRunningContext:");
}

id objc_msgSend_queue_updateStateWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue_updateStateWithReason:");
}

id objc_msgSend_queuedDialogIsActionUIRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queuedDialogIsActionUIRequest:");
}

id objc_msgSend_queuedStatusPlatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queuedStatusPlatter");
}

id objc_msgSend_queuedStatusPlatterTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queuedStatusPlatterTimer");
}

id objc_msgSend_releaseDismissalPreventionAssertionIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseDismissalPreventionAssertionIfNecessary");
}

id objc_msgSend_remoteProcess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteProcess");
}

id objc_msgSend_remoteTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteTarget");
}

id objc_msgSend_removeAction_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAction:forControlEvents:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeConnectedHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeConnectedHost:");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromParentViewController");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeProgressSubscriber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeProgressSubscriber:");
}

id objc_msgSend_removeTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeTarget:action:forControlEvents:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_requestContainerForRunningContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestContainerForRunningContext:");
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestIdentifier");
}

id objc_msgSend_requestIdentifierForContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestIdentifierForContext:");
}

id objc_msgSend_requestSceneSessionActivation_userActivity_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestSceneSessionActivation:userActivity:options:errorHandler:");
}

id objc_msgSend_requestSceneSessionDestruction_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestSceneSessionDestruction:options:errorHandler:");
}

id objc_msgSend_requestTransitionToPreferredLayoutMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestTransitionToPreferredLayoutMode");
}

id objc_msgSend_resetLocalIdleTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetLocalIdleTimer");
}

id objc_msgSend_revokeAllPresentablesWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "revokeAllPresentablesWithReason:");
}

id objc_msgSend_revokeAllPresentablesWithReason_userInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "revokeAllPresentablesWithReason:userInfo:error:");
}

id objc_msgSend_revokePresentableWithRequestIdentifier_reason_animated_userInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_rootModalViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootModalViewController");
}

id objc_msgSend_rootSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootSettings");
}

id objc_msgSend_rowWithTitle_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rowWithTitle:action:");
}

id objc_msgSend_rowWithTitle_childSettingsKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rowWithTitle:childSettingsKeyPath:");
}

id objc_msgSend_rowWithTitle_valueKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rowWithTitle:valueKeyPath:");
}

id objc_msgSend_rubberBandedTranslationForTranslation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rubberBandedTranslationForTranslation:");
}

id objc_msgSend_rubberBandingEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rubberBandingEnabled");
}

id objc_msgSend_runKind(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runKind");
}

id objc_msgSend_runSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runSource");
}

id objc_msgSend_runningContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runningContext");
}

id objc_msgSend_runningContextIsInPersistentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runningContextIsInPersistentMode:");
}

id objc_msgSend_runningContextWaitingForFollowUpRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runningContextWaitingForFollowUpRequest");
}

id objc_msgSend_runningPersistentWorkflows(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runningPersistentWorkflows");
}

id objc_msgSend_sashView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sashView");
}

id objc_msgSend_sashViewHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sashViewHeight");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_scene_willConnectToSession_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scene:willConnectToSession:options:");
}

id objc_msgSend_sceneDidDisconnect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sceneDidDisconnect:");
}

id objc_msgSend_sceneDidEnterBackground_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sceneDidEnterBackground:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screen");
}

id objc_msgSend_screenOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenOn");
}

id objc_msgSend_screenOnObserver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenOnObserver");
}

id objc_msgSend_scrollDismissalActivationLeniency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scrollDismissalActivationLeniency");
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scrollView");
}

id objc_msgSend_scrollViewGestureState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scrollViewGestureState");
}

id objc_msgSend_sectionWithRows_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sectionWithRows:");
}

id objc_msgSend_sectionWithRows_title_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sectionWithRows:title:");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session");
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityIdentifier:");
}

id objc_msgSend_setActionGroupView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionGroupView:");
}

id objc_msgSend_setActionUserInterfaceListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionUserInterfaceListener:");
}

id objc_msgSend_setActiveEmbeddedPlatterUpdateCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveEmbeddedPlatterUpdateCount:");
}

id objc_msgSend_setActiveLayoutMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveLayoutMode:");
}

id objc_msgSend_setActiveWindow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveWindow:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAlphaOutEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlphaOutEnabled:");
}

id objc_msgSend_setAssociatedPill_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssociatedPill:");
}

id objc_msgSend_setAssociatedRunningContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssociatedRunningContext:");
}

id objc_msgSend_setAttribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttribution:");
}

id objc_msgSend_setAttributionTitle_icon_previouslyHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributionTitle:icon:previouslyHidden:");
}

id objc_msgSend_setAutoresizesSubviews_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizesSubviews:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAwaitingIconOwnershipSwap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAwaitingIconOwnershipSwap:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBannerFramesEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBannerFramesEnabled:");
}

id objc_msgSend_setBannerGesture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBannerGesture:");
}

id objc_msgSend_setBannerPresentationCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBannerPresentationCompletion:");
}

id objc_msgSend_setBlurBottomLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlurBottomLimit:");
}

id objc_msgSend_setBlurFilterEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlurFilterEnabled:");
}

id objc_msgSend_setBlurTopLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlurTopLimit:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setBottomLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBottomLimit:");
}

id objc_msgSend_setBottomRubberBandRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBottomRubberBandRange:");
}

id objc_msgSend_setBounces_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBounces:");
}

id objc_msgSend_setCancelAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancelAction:");
}

id objc_msgSend_setCaptureTouches_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaptureTouches:");
}

id objc_msgSend_setCleanUpTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCleanUpTimer:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCollapseTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCollapseTimer:");
}

id objc_msgSend_setCompleted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompleted:");
}

id objc_msgSend_setCompletingSuccessfully_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletingSuccessfully:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setContainerView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContainerView:");
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentOffset:");
}

id objc_msgSend_setContentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentViewController:");
}

id objc_msgSend_setCurrentUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentUserInterfaceStyle:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDialogPresentationPaused_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDialogPresentationPaused:");
}

id objc_msgSend_setDialogPresentationPausingReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDialogPresentationPausingReason:");
}

id objc_msgSend_setDialogPresentationResumingReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDialogPresentationResumingReason:");
}

id objc_msgSend_setDialogRequestCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDialogRequestCompletionHandler:");
}

id objc_msgSend_setDimmingLayerAlpha_response_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDimmingLayerAlpha:response:");
}

id objc_msgSend_setDimmingView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDimmingView:");
}

id objc_msgSend_setDisableTransition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableTransition:");
}

id objc_msgSend_setDismissalCompletionTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissalCompletionTimer:");
}

id objc_msgSend_setDismissalHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissalHandler:");
}

id objc_msgSend_setDismissalPhase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissalPhase:");
}

id objc_msgSend_setDismissalPreventionAssertion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissalPreventionAssertion:");
}

id objc_msgSend_setDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDomain:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setElementNeedsUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setElementNeedsUpdate");
}

id objc_msgSend_setEmbeddedPlatter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEmbeddedPlatter:");
}

id objc_msgSend_setEmbeddedScrollView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEmbeddedScrollView:");
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFillMode:");
}

id objc_msgSend_setFilters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilters:");
}

id objc_msgSend_setFixedEndTranslationUp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFixedEndTranslationUp:");
}

id objc_msgSend_setFixedEndTranslationUpEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFixedEndTranslationUpEnabled:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFromValue:");
}

id objc_msgSend_setHasCompleted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasCompleted:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHintAnimationResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHintAnimationResponse:");
}

id objc_msgSend_setHintAnimationTargetScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHintAnimationTargetScale:");
}

id objc_msgSend_setHintDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHintDuration:");
}

id objc_msgSend_setHorizontalTrackingEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHorizontalTrackingEnabled:");
}

id objc_msgSend_setHorizontalTrackingFriction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHorizontalTrackingFriction:");
}

id objc_msgSend_setHostNeedsUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostNeedsUpdate");
}

id objc_msgSend_setIcon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIcon:");
}

id objc_msgSend_setIcon_associatedAppBundleIdentifier_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIcon:associatedAppBundleIdentifier:animated:");
}

id objc_msgSend_setInflightRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInflightRequest:");
}

id objc_msgSend_setInitialPresentationTransitioning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialPresentationTransitioning:");
}

id objc_msgSend_setInitialScrollOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialScrollOffset:");
}

id objc_msgSend_setInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterface:");
}

id objc_msgSend_setInterfaceTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterfaceTarget:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsFollowUp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsFollowUp:");
}

id objc_msgSend_setIsTouchingDownButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsTouchingDownButton:");
}

id objc_msgSend_setKeyboardIsVisible_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyboardIsVisible:");
}

id objc_msgSend_setLastKnownProgressValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastKnownProgressValue:");
}

id objc_msgSend_setLocalIdleTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalIdleTimer:");
}

id objc_msgSend_setMaterialView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaterialView:");
}

id objc_msgSend_setMicaViewHidden_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMicaViewHidden:animated:");
}

id objc_msgSend_setMode_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMode:animated:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNeedsUserInteractivePriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsUserInteractivePriority:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setOverrideLayoutMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverrideLayoutMode:");
}

id objc_msgSend_setPauseTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPauseTimer:");
}

id objc_msgSend_setPendingDelayedAttribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingDelayedAttribution:");
}

id objc_msgSend_setPerWorkflowStateData_forSmartPromptWithActionUUID_reference_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPerWorkflowStateData:forSmartPromptWithActionUUID:reference:completion:");
}

id objc_msgSend_setPhase1_artificialInitialOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhase1_artificialInitialOffset:");
}

id objc_msgSend_setPhase1_impulse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhase1_impulse:");
}

id objc_msgSend_setPhase1_impulse_unregisteredVelocity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhase1_impulse_unregisteredVelocity:");
}

id objc_msgSend_setPhase1_initialBlurRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhase1_initialBlurRadius:");
}

id objc_msgSend_setPhase1_initialScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhase1_initialScale:");
}

id objc_msgSend_setPhase1_phaseDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhase1_phaseDuration:");
}

id objc_msgSend_setPhase1_response_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhase1_response:");
}

id objc_msgSend_setPlatterContentContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlatterContentContainer:");
}

id objc_msgSend_setPlatterCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlatterCornerRadius:");
}

id objc_msgSend_setPlatterViewAwaitingTransition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlatterViewAwaitingTransition:");
}

id objc_msgSend_setPoofAlphaDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofAlphaDelay:");
}

id objc_msgSend_setPoofAlphaResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofAlphaResponse:");
}

id objc_msgSend_setPoofBlurDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofBlurDelay:");
}

id objc_msgSend_setPoofBlurRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofBlurRadius:");
}

id objc_msgSend_setPoofBlurResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofBlurResponse:");
}

id objc_msgSend_setPoofInAlphaResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofInAlphaResponse:");
}

id objc_msgSend_setPoofInBlurRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofInBlurRadius:");
}

id objc_msgSend_setPoofInBlurResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofInBlurResponse:");
}

id objc_msgSend_setPoofInScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofInScale:");
}

id objc_msgSend_setPoofInScaleDamping_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofInScaleDamping:");
}

id objc_msgSend_setPoofInScaleResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofInScaleResponse:");
}

id objc_msgSend_setPoofOutAlphaDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofOutAlphaDelay:");
}

id objc_msgSend_setPoofOutAlphaResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofOutAlphaResponse:");
}

id objc_msgSend_setPoofOutBlurDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofOutBlurDelay:");
}

id objc_msgSend_setPoofOutBlurRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofOutBlurRadius:");
}

id objc_msgSend_setPoofOutBlurResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofOutBlurResponse:");
}

id objc_msgSend_setPoofOutScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofOutScale:");
}

id objc_msgSend_setPoofOutScaleResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofOutScaleResponse:");
}

id objc_msgSend_setPoofResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofResponse:");
}

id objc_msgSend_setPoofScaleDown_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofScaleDown:");
}

id objc_msgSend_setPoofScaleUp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofScaleUp:");
}

id objc_msgSend_setPoofThrowDistanceDown_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofThrowDistanceDown:");
}

id objc_msgSend_setPoofThrowDistanceUp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoofThrowDistanceUp:");
}

id objc_msgSend_setPoof_scale_multiplier_y_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPoof_scale_multiplier_y:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setPresentedBanner_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresentedBanner:");
}

id objc_msgSend_setPresentedPersistentRunningContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresentedPersistentRunningContext:");
}

id objc_msgSend_setPreventSuspension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreventSuspension:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setProgressSuppressionState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressSuppressionState:");
}

id objc_msgSend_setProgressSuppressionTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressSuppressionTimer:");
}

id objc_msgSend_setPunchoutShadow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPunchoutShadow:");
}

id objc_msgSend_setQueuedStatusPlatter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueuedStatusPlatter:");
}

id objc_msgSend_setQueuedStatusPlatterTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueuedStatusPlatterTimer:");
}

id objc_msgSend_setRootModalViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootModalViewController:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setRubberBandingEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRubberBandingEnabled:");
}

id objc_msgSend_setRunningContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunningContext:");
}

id objc_msgSend_setRunningContextWaitingForFollowUpRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunningContextWaitingForFollowUpRequest:");
}

id objc_msgSend_setSashView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSashView:");
}

id objc_msgSend_setScrollDismissalActivationLeniency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrollDismissalActivationLeniency:");
}

id objc_msgSend_setScrollViewGestureState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrollViewGestureState:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setService:");
}

id objc_msgSend_setServiceQuality_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceQuality:");
}

id objc_msgSend_setShadowColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowColor:");
}

id objc_msgSend_setShadowDebuggingEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShadowDebuggingEnabled:");
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

id objc_msgSend_setShouldObserveDisplayLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldObserveDisplayLayout:");
}

id objc_msgSend_setSqueezeEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSqueezeEnabled:");
}

id objc_msgSend_setSqueeze_up_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSqueeze_up:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStrokeColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStrokeColor:");
}

id objc_msgSend_setStrokeStart_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStrokeStart:");
}

id objc_msgSend_setSystemIdleTimerOverrideAssertion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemIdleTimerOverrideAssertion:");
}

id objc_msgSend_setTestStatusBanners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestStatusBanners:");
}

id objc_msgSend_setTestUnregisteredVelocityEdgeCase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestUnregisteredVelocityEdgeCase:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setToValue:");
}

id objc_msgSend_setTopLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTopLimit:");
}

id objc_msgSend_setTopRubberBandRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTopRubberBandRange:");
}

id objc_msgSend_setTouchCapturedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTouchCapturedHandler:");
}

id objc_msgSend_setTrackingBlurEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrackingBlurEnabled:");
}

id objc_msgSend_setTrackingDampingRatio_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrackingDampingRatio:");
}

id objc_msgSend_setTrackingResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrackingResponse:");
}

id objc_msgSend_setTrackingScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrackingScale:");
}

id objc_msgSend_setTrackingSqueezeFactor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrackingSqueezeFactor:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTransitionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransitionHandler:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_forKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKeyPath:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setViewIsAppearingCalled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewIsAppearingCalled:");
}

id objc_msgSend_setViewIsAppearingHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewIsAppearingHandler:");
}

id objc_msgSend_setViewWillAppearCalled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewWillAppearCalled:");
}

id objc_msgSend_setWantsHomeGesture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsHomeGesture:");
}

id objc_msgSend_setWindowActivationCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWindowActivationCompletionHandler:");
}

id objc_msgSend_shadowDebuggingEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shadowDebuggingEnabled");
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

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedSettings");
}

id objc_msgSend_shouldDisplaySash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldDisplaySash");
}

id objc_msgSend_shouldFreezePlatterLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldFreezePlatterLayout");
}

id objc_msgSend_shouldHideSashView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldHideSashView");
}

id objc_msgSend_shouldInstallBannerDimmingLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldInstallBannerDimmingLayer");
}

id objc_msgSend_shouldObserveDisplayLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldObserveDisplayLayout");
}

id objc_msgSend_shouldShowDimmingLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldShowDimmingLayer");
}

id objc_msgSend_shouldUpdateStateBasedOnLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldUpdateStateBasedOnLayout:");
}

id objc_msgSend_singleStepHomeScreenRevokeTimers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "singleStepHomeScreenRevokeTimers");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_squeezeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "squeezeEnabled");
}

id objc_msgSend_squeeze_up(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "squeeze_up");
}

id objc_msgSend_standardClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardClient");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startCollapseTimerIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCollapseTimerIfNecessary");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_statusViewControllerDidCollapseFromCustomLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusViewControllerDidCollapseFromCustomLayout:");
}

id objc_msgSend_statusViewControllerDidTransitionFromVisibleToCustomLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusViewControllerDidTransitionFromVisibleToCustomLayout:");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stopObservingKeyboard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopObservingKeyboard");
}

id objc_msgSend_stopObservingScreenOnState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopObservingScreenOnState");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_strokeColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strokeColor");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subviews");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "superview");
}

id objc_msgSend_systemApertureElementContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemApertureElementContext");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBlueColor");
}

id objc_msgSend_systemDismissedBanner(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemDismissedBanner");
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemFontOfSize:weight:");
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGreenColor");
}

id objc_msgSend_systemIdleTimerOverrideAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemIdleTimerOverrideAssertion");
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemOrangeColor");
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemWhiteColor");
}

id objc_msgSend_testStatusBanners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testStatusBanners");
}

id objc_msgSend_testUnregisteredVelocityEdgeCase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testUnregisteredVelocityEdgeCase");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_tintControlWithColor_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tintControlWithColor:animated:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_titleFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleFont");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_topEdgeClampedTranslationForTranslation_scale_height_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topEdgeClampedTranslationForTranslation:scale:height:");
}

id objc_msgSend_topLimit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topLimit");
}

id objc_msgSend_topRubberBandRange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topRubberBandRange");
}

id objc_msgSend_touchCapturedHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchCapturedHandler");
}

id objc_msgSend_trackingBlurEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trackingBlurEnabled");
}

id objc_msgSend_trackingDampingRatio(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trackingDampingRatio");
}

id objc_msgSend_trackingResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trackingResponse");
}

id objc_msgSend_trackingScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trackingScale");
}

id objc_msgSend_trackingSqueezeFactor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trackingSqueezeFactor");
}

id objc_msgSend_trailingView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingView");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_traitCollectionWithTraitsFromCollections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollectionWithTraitsFromCollections:");
}

id objc_msgSend_traitCollectionWithUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollectionWithUserInterfaceStyle:");
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transform");
}

id objc_msgSend_transitionSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionSettings");
}

id objc_msgSend_transitionToCompleted_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionToCompleted:animated:");
}

id objc_msgSend_translationInView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "translationInView:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_updateContainerViewFrameAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateContainerViewFrameAnimated:");
}

id objc_msgSend_updateDimmingLayerVisibility(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDimmingLayerVisibility");
}

id objc_msgSend_updateHomeGestureOwnership(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateHomeGestureOwnership");
}

id objc_msgSend_updateMicaViewState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMicaViewState");
}

id objc_msgSend_updateProgressWithValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateProgressWithValue:");
}

id objc_msgSend_updateWithProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithProgress:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInitiated");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceStyle");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_velocityInView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "velocityInView:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllerForPresenting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForPresenting");
}

id objc_msgSend_viewControllerForPresentingActionUserInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForPresentingActionUserInterface:");
}

id objc_msgSend_viewIsAppearingCalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewIsAppearingCalled");
}

id objc_msgSend_viewIsAppearingHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewIsAppearingHandler");
}

id objc_msgSend_viewWillAppearCalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewWillAppearCalled");
}

id objc_msgSend_wf_dialogViewControllerClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wf_dialogViewControllerClass");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

id objc_msgSend_windowActivationCompletionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windowActivationCompletionHandler");
}

id objc_msgSend_workflowIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workflowIdentifier");
}

id objc_msgSend_workflowReference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workflowReference");
}
