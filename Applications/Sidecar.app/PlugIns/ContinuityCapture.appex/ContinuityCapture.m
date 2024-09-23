void sub_1000022BC(id a1)
{
  ContinuityCaptureShieldUIBackgroundActivityManager *v1;
  void *v2;

  v1 = objc_alloc_init(ContinuityCaptureShieldUIBackgroundActivityManager);
  v2 = (void *)qword_10001A108;
  qword_10001A108 = (uint64_t)v1;

}

void sub_100002700(id a1, NSString *a2, ContinuityCaptureShieldUIBackgroundActivityController *a3, BOOL *a4)
{
  -[ContinuityCaptureShieldUIBackgroundActivityController deactivateBackgroundActivity](a3, "deactivateBackgroundActivity");
}

void sub_1000027C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000027DC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000027EC(uint64_t a1)
{

}

void sub_1000027F4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "isBackgroundActivityActive"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void sub_100004684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,id a63)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak(&a63);
  _Unwind_Resume(a1);
}

void sub_10000472C(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = ContinuityCaptureShieldUILog();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[ContinuityCaptureShieldUIContentView initWithFrame:]_block_invoke";
      v7 = 2048;
      v8 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: <%p> pause button pressed", (uint8_t *)&v5, 0x16u);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
    objc_msgSend(v4, "contentViewDidSelectPauseButton:", WeakRetained);

  }
}

void sub_10000480C(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 41))
  {
    v7 = ContinuityCaptureShieldUILog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[ContinuityCaptureShieldUIContentView initWithFrame:]_block_invoke";
      v16 = 2048;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: <%p> facetime button pressed", buf, 0x16u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
    v10 = objc_opt_respondsToSelector(v9, "contentViewDidSelectFaceTimeButton:completion:");

    if ((v10 & 1) != 0)
    {
      objc_msgSend(v6, "_setPullFaceTimeButtonLoading:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000049C0;
      v12[3] = &unk_1000145D8;
      objc_copyWeak(&v13, v4);
      objc_msgSend(v11, "contentViewDidSelectFaceTimeButton:completion:", v6, v12);

      objc_destroyWeak(&v13);
    }
  }

}

void sub_1000049A4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000049C0(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004A38;
  block[3] = &unk_1000145D8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_100004A38(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setPullFaceTimeButtonLoading:", 0);

}

void sub_100004A68(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = ContinuityCaptureShieldUILog();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[ContinuityCaptureShieldUIContentView initWithFrame:]_block_invoke_3";
      v9 = 2048;
      v10 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: <%p> favorites button pressed", (uint8_t *)&v7, 0x16u);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
    v5 = objc_opt_respondsToSelector(v4, "contentViewDidSelectFavoritesButton:");

    if ((v5 & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
      objc_msgSend(v6, "contentViewDidSelectFavoritesButton:", WeakRetained);

    }
  }

}

void sub_100004B78(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = ContinuityCaptureShieldUILog();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[ContinuityCaptureShieldUIContentView initWithFrame:]_block_invoke";
      v7 = 2048;
      v8 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: <%p> disconnect button pressed", (uint8_t *)&v5, 0x16u);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
    objc_msgSend(v4, "contentViewDidSelectDisconnectButton:", WeakRetained);

  }
}

void sub_100004C58(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = ContinuityCaptureShieldUILog();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[ContinuityCaptureShieldUIContentView initWithFrame:]_block_invoke";
      v7 = 2048;
      v8 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: <%p> skip button pressed", (uint8_t *)&v5, 0x16u);
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
    objc_msgSend(v4, "contentViewDidSelectSkipButton:", WeakRetained);

  }
}

void sub_100005264(uint64_t a1)
{
  double v1;
  void *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = CACurrentMediaTime();
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[8], "rootLayer"));
    objc_msgSend(v2, "setBeginTime:", v1);

    objc_msgSend(WeakRetained[8], "setState:", CFSTR("Animate"));
  }

}

uint64_t ContinuityCaptureShieldUILog()
{
  if (qword_10001A120 != -1)
    dispatch_once(&qword_10001A120, &stru_1000145F8);
  return qword_10001A118;
}

void sub_100006478(id a1)
{
  qword_10001A118 = (uint64_t)os_log_create("com.apple.ContinuityCaptureShieldUI", "default");
}

void sub_100006698(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000066AC(id a1)
{
  AVCapturePrewarm(-[NSBundle bundleIdentifier](+[NSBundle mainBundle](NSBundle, "mainBundle"), "bundleIdentifier"));
}

void sub_100006C04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006C60;
  v3[3] = &unk_100014640;
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

_BYTE *sub_100006C60(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[136])
    return objc_msgSend(result, "_handleLayout:ignoringStandby:", *(_QWORD *)(a1 + 40), 1);
  return result;
}

id sub_1000073C0(uint64_t a1)
{
  _QWORD *v1;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 168) = *(_BYTE *)(a1 + 48);
  if (*(_BYTE *)(a1 + 48))
    v1 = &kCMContinuityCaptureControlIncomingCall;
  else
    v1 = &kCMContinuityCaptureControlIncomingCallComplete;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "postEvent:entity:data:", *v1, 4, *(_QWORD *)(a1 + 40));
}

id sub_1000075AC(uint64_t a1)
{
  _QWORD *v1;

  if (*(_BYTE *)(a1 + 40))
    v1 = &kCMContinuityCaptureEventActiveCallStart;
  else
    v1 = &kCMContinuityCaptureEventActiveCallEnd;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "postEvent:entity:data:", *v1, 0, 0);
}

id sub_100007898(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  os_log_type_t type;
  unsigned int v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  _BYTE v15[128];

  if (dword_10001A140)
  {
    v10 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v10, &type);
    v3 = v10;
    v4 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v5 = v3;
    else
      v5 = v3 & 0xFFFFFFFE;
    if ((_DWORD)v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v11 = 136315394;
      v12 = "-[ContinuityCaptureViewController _showHowToReconnectDialog]_block_invoke";
      v13 = 2048;
      v14 = v6;
      v7 = (_BYTE *)_os_log_send_and_compose_impl(v5, 0, v15, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v4, "<<<< ContinuityCaptureViewController >>>> %s: <%p> OK button pressed", (const char *)&v11, 22);
      v3 = v10;
    }
    else
    {
      v7 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v7, v7 != v15, v3, 0);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 169) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_disconnectSession");
}

uint64_t sub_1000079F4(uint64_t result)
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  os_log_type_t type;
  unsigned int v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  _BYTE v14[128];

  v1 = result;
  if (dword_10001A140)
  {
    v9 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v9, &type);
    v3 = v9;
    v4 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v5 = v3;
    else
      v5 = v3 & 0xFFFFFFFE;
    if ((_DWORD)v5)
    {
      v6 = *(_QWORD *)(v1 + 32);
      v10 = 136315394;
      v11 = "-[ContinuityCaptureViewController _showHowToReconnectDialog]_block_invoke";
      v12 = 2048;
      v13 = v6;
      v7 = (_BYTE *)_os_log_send_and_compose_impl(v5, 0, v14, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v4, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Cancel button pressed", (const char *)&v10, 22);
      v3 = v9;
    }
    else
    {
      v7 = 0;
    }
    result = fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v7, v7 != v14, v3, 0);
  }
  *(_BYTE *)(*(_QWORD *)(v1 + 32) + 169) = 0;
  return result;
}

void sub_100008208(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000822C(uint64_t a1, uint64_t a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  void *v11;
  os_log_type_t type;
  unsigned int v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[128];

  if (dword_10001A140)
  {
    v14 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v14, &type);
    v5 = v14;
    v6 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v7 = v5;
    else
      v7 = v5 & 0xFFFFFFFE;
    if ((_DWORD)v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(v8 + 128);
      v15 = 136315906;
      v16 = "-[ContinuityCaptureViewController updateRequestState]_block_invoke";
      v17 = 2048;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = a2;
      v10 = (_BYTE *)_os_log_send_and_compose_impl(v7, 0, v23, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v6, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Pre-StartStream for configuration %@ error %@", &v15, 42);
      v5 = v14;
    }
    else
    {
      v10 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v10, v10 != v23, v5, 0);
  }
  v11 = (void *)objc_opt_class(ContinuityCaptureViewController, a2);
  objc_sync_enter(v11);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  return objc_sync_exit(v11);
}

void sub_1000083D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008910(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

id sub_10000892C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 160);
  if (v3)
  {
    v4 = *(NSObject **)(v2 + 104);
    if (v4)
    {
      dispatch_source_cancel(v4);

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = 0;
      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
    }
    return objc_msgSend(v3, "resetRequest:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = objc_msgSend(objc_alloc((Class)CMContinuityCaptureSidecarServer), "initWithRequest:", *(_QWORD *)(a1 + 40));
    FigCaptureSessionRemoteSetWombatEnabled(1);
    return objc_msgSend(*(id *)(a1 + 32), "updateRequestState");
  }
}

void sub_100008C68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100008C84(uint64_t a1)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = *(_BYTE *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 120))
  {
    if (*(_QWORD *)(v2 + 160))
    {
      objc_msgSend(*(id *)(v2 + 160), "resetRequest:", 0);
      return objc_msgSend(*(id *)(a1 + 32), "_setConnectionInterruptTimer");
    }
  }
  else if (*(_QWORD *)(v2 + 48))
  {
    return objc_msgSend(*(id *)(v2 + 48), "postEvent:entity:data:", kCMContinuityCaptureEventTerminate, 0, 0);
  }
  return objc_msgSend((id)v2, "_terminate");
}

void sub_10000954C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_100009578(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[6])
    return objc_msgSend(result, "updateRequestState");
  return result;
}

void sub_1000098D4(uint64_t a1)
{
  _QWORD v1[4];
  __int128 v2;

  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472;
  v1[2] = sub_100009930;
  v1[3] = &unk_100014758;
  v2 = *(_OWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v1);
}

void sub_100009930(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _BYTE *v7;
  os_log_type_t type;
  unsigned int v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  _BYTE v14[128];

  if (dword_10001A140)
  {
    v9 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v9, &type);
    v3 = v9;
    v4 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v5 = v3;
    else
      v5 = v3 & 0xFFFFFFFE;
    if ((_DWORD)v5)
    {
      v6 = *(char *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v10 = 136315394;
      v11 = "-[ContinuityCaptureViewController _setConnectionInterruptTimer]_block_invoke_2";
      v12 = 1024;
      v13 = v6;
      v7 = (_BYTE *)_os_log_send_and_compose_impl(v5, 0, v14, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v4, "<<<< ContinuityCaptureViewController >>>> %s: Waiting for reconnect (%d)", (const char *)&v10, 18);
      v3 = v9;
    }
    else
    {
      v7 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v7, v7 != v14, v3, 0);
  }
  if ((char)--*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "postEvent:entity:data:", kCMContinuityCaptureEventTerminate, 0, 0);
    dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 104));
  }
}

void sub_100009F10(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_observeValueForKeyPath:ofObject:change:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

id sub_10000A7E0(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  void *v8;
  _QWORD v10[5];
  os_log_type_t type;
  unsigned int v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  _BYTE v17[128];

  if (dword_10001A140)
  {
    v12 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v12, &type);
    v3 = v12;
    v4 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v5 = v3;
    else
      v5 = v3 & 0xFFFFFFFE;
    if ((_DWORD)v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v13 = 136315394;
      v14 = "-[ContinuityCaptureViewController _observeValueForKeyPath:ofObject:change:context:]_block_invoke";
      v15 = 2048;
      v16 = v6;
      v7 = (_BYTE *)_os_log_send_and_compose_impl(v5, 0, v17, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v4, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Background Activity selected: launching sidecar", (const char *)&v13, 22);
      v3 = v12;
    }
    else
    {
      v7 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v7, v7 != v17, v3, 0);
  }
  v8 = (void *)SBSCreateOpenApplicationService();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000A970;
  v10[3] = &unk_1000147A8;
  v10[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v8, "openApplication:withOptions:completion:", CFSTR("com.apple.sidecar"), 0, v10);
}

uint64_t sub_10000A970(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  os_log_type_t type;
  unsigned int v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  _BYTE v19[128];

  if (a3)
  {
    v4 = result;
    v12 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 0, &v12, &type);
    v6 = v12;
    v7 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v8 = v6;
    else
      v8 = v6 & 0xFFFFFFFE;
    if ((_DWORD)v8)
    {
      v9 = *(_QWORD *)(v4 + 32);
      v13 = 136315650;
      v14 = "-[ContinuityCaptureViewController _observeValueForKeyPath:ofObject:change:context:]_block_invoke";
      v15 = 2048;
      v16 = v9;
      v17 = 2112;
      v18 = a3;
      v10 = (_BYTE *)_os_log_send_and_compose_impl(v8, 0, v19, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v7, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Error launching extension from background activity: %@", &v13, 32);
      v6 = v12;
    }
    else
    {
      v10 = 0;
    }
    return fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 0, 1, v10, v10 != v19, v6, 0);
  }
  return result;
}

id sub_10000B678(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _BYTE *v8;
  os_log_type_t type;
  unsigned int v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  _BYTE v18[128];

  if (dword_10001A140)
  {
    v11 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v11, &type);
    v3 = v11;
    v4 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v5 = v3;
    else
      v5 = v3 & 0xFFFFFFFE;
    if ((_DWORD)v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = 136315650;
      v13 = "-[ContinuityCaptureViewController _handleLayout:ignoringStandby:]_block_invoke";
      v14 = 2048;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      v8 = (_BYTE *)_os_log_send_and_compose_impl(v5, 0, v18, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v4, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Reassessing layout for %@", &v12, 32);
      v3 = v11;
    }
    else
    {
      v8 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v8, v8 != v18, v3, 0);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_handleLayout:ignoringStandby:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "currentLayout"), 0);
}

uint64_t sub_10000BD90(uint64_t result)
{
  BOOL v1;
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  os_log_type_t type;
  unsigned int v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  _BYTE v15[128];

  *(_BYTE *)(*(_QWORD *)(result + 32) + 97) = *(_BYTE *)(*(_QWORD *)(result + 32) + 96) ^ 1;
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 97))
    v1 = dword_10001A140 == 0;
  else
    v1 = 1;
  if (!v1)
  {
    v2 = result;
    v10 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v10, &type);
    v4 = v10;
    v5 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v6 = v4;
    else
      v6 = v4 & 0xFFFFFFFE;
    if ((_DWORD)v6)
    {
      v7 = *(_QWORD *)(v2 + 32);
      v11 = 136315394;
      v12 = "-[ContinuityCaptureViewController deviceLockStateMonitor:didUpdateDeviceLockState:]_block_invoke";
      v13 = 2048;
      v14 = v7;
      v8 = (_BYTE *)_os_log_send_and_compose_impl(v6, 0, v15, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v5, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Will ignore layout updates after device unlock", (const char *)&v11, 22);
      v4 = v10;
    }
    else
    {
      v8 = 0;
    }
    return fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v8, v8 != v15, v4, 0);
  }
  return result;
}

id sub_10000C118(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminate");
}

void sub_10000C3C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C3DC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v6, "removeAttribution:");
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v6, "addAttribution:");
  objc_msgSend(v5, "setUserInitiated:", 1);

}

void sub_10000C448(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setCurrentAttribution:", *(_QWORD *)(a1 + 32));
  v3 = *(void **)(a1 + 40);
  v4 = WeakRetained[4];
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000C4E8;
    v5[3] = &unk_1000147F8;
    v6 = v3;
    objc_msgSend(v4, "handleUserInteractionsWithBlock:", v5);

  }
  else
  {
    objc_msgSend(WeakRetained[4], "handleUserInteractionsWithBlock:", 0);
  }

}

uint64_t sub_10000C4E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForResource:withExtension:");
}

id objc_msgSend__clearPendingCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_clearPendingCompletion");
}

id objc_msgSend__currentBackgroundActivityIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_currentBackgroundActivityIdentifier");
}

id objc_msgSend__defaultButtonPadding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_defaultButtonPadding");
}

id objc_msgSend__defaultButtonScreenWidth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_defaultButtonScreenWidth");
}

id objc_msgSend__defaultButtonTextFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_defaultButtonTextFont");
}

id objc_msgSend__defaultDescriptionPadding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_defaultDescriptionPadding");
}

id objc_msgSend__defaultImageSymbolConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_defaultImageSymbolConfiguration");
}

id objc_msgSend__defaultImageTintColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_defaultImageTintColor");
}

id objc_msgSend__defaultSecondaryTextColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_defaultSecondaryTextColor");
}

id objc_msgSend__defaultSecondaryTextFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_defaultSecondaryTextFont");
}

id objc_msgSend__defaultTextColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_defaultTextColor");
}

id objc_msgSend__defaultTextFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_defaultTextFont");
}

id objc_msgSend__disconnectButtonConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disconnectButtonConfiguration");
}

id objc_msgSend__disconnectSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disconnectSession");
}

id objc_msgSend__facetimeButtonConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_facetimeButtonConfiguration");
}

id objc_msgSend__favoritesButtonConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_favoritesButtonConfiguration");
}

id objc_msgSend__handleLayout_ignoringStandby_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleLayout:ignoringStandby:");
}

id objc_msgSend__imageToTextPadding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_imageToTextPadding");
}

id objc_msgSend__observeValueForKeyPath_ofObject_change_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_observeValueForKeyPath:ofObject:change:context:");
}

id objc_msgSend__pauseButtonConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pauseButtonConfiguration");
}

id objc_msgSend__resolveUserPauseState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resolveUserPauseState");
}

id objc_msgSend__setOverrideUserInterfaceRenderingMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setOverrideUserInterfaceRenderingMode:");
}

id objc_msgSend__setOverrideVibrancyTrait_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setOverrideVibrancyTrait:");
}

id objc_msgSend__setPendingCompletion_fromState_toState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setPendingCompletion:fromState:toState:");
}

id objc_msgSend__setPullFaceTimeButtonLoading_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setPullFaceTimeButtonLoading:");
}

id objc_msgSend__shouldShowFaceTimeButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldShowFaceTimeButton");
}

id objc_msgSend__shouldShowFavoritesButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldShowFavoritesButton");
}

id objc_msgSend__skipButtonConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_skipButtonConfiguration");
}

id objc_msgSend__systemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemImageNamed:");
}

id objc_msgSend__terminate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_terminate");
}

id objc_msgSend__textToButtonsPadding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_textToButtonsPadding");
}

id objc_msgSend__updateUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateUI");
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithHandler:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_activateBackgroundActivityWithUserInteractionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateBackgroundActivityWithUserInteractionHandler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addAttribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAttribution:");
}

id objc_msgSend_addDeviceLockStateObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDeviceLockStateObserver:");
}

id objc_msgSend_addLayoutGuide_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLayoutGuide:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributionWithAuditToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributionWithAuditToken:");
}

id objc_msgSend_backgroundActivityControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundActivityControllers");
}

id objc_msgSend_backgroundActivityIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundActivityIdentifier");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_borderlessButtonConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "borderlessButtonConfiguration");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_buttonWithConfiguration_primaryAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithConfiguration:primaryAction:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_completeRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeRequest:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationForDefaultMainDisplayMonitor");
}

id objc_msgSend_configurationWithTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithTextStyle:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:multiplier:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:constant:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentInsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentInsets");
}

id objc_msgSend_contentLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentLayoutGuide");
}

id objc_msgSend_contentViewDidSelectDisconnectButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentViewDidSelectDisconnectButton:");
}

id objc_msgSend_contentViewDidSelectFaceTimeButton_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentViewDidSelectFaceTimeButton:completion:");
}

id objc_msgSend_contentViewDidSelectFavoritesButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentViewDidSelectFavoritesButton:");
}

id objc_msgSend_contentViewDidSelectPauseButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentViewDidSelectPauseButton:");
}

id objc_msgSend_contentViewDidSelectSkipButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentViewDidSelectSkipButton:");
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

id objc_msgSend_currentLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLayout");
}

id objc_msgSend_deactivateBackgroundActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivateBackgroundActivity");
}

id objc_msgSend_defaultMetrics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultMetrics");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_displayBacklightLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayBacklightLevel");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "elements");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_filledButtonConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filledButtonConfiguration");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_frameLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameLayoutGuide");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleUserInteractionsWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleUserInteractionsWithBlock:");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_holdIdleSleepAssertionForReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "holdIdleSleepAssertionForReason:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_imageByApplyingSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageByApplyingSymbolConfiguration:");
}

id objc_msgSend_initWithArrangedSubviews_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArrangedSubviews:");
}

id objc_msgSend_initWithBackgroundActivityIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBackgroundActivityIdentifier:");
}

id objc_msgSend_initWithBackgroundActivityIdentifier_activityAttribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBackgroundActivityIdentifier:activityAttribution:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLayer:");
}

id objc_msgSend_initWithPackageName_type_inBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPackageName:type:inBundle:");
}

id objc_msgSend_initWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRequest:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithTransportServer_videoPreviewLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTransportServer:videoPreviewLayer:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isBackgroundActivityActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBackgroundActivityActive");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isGeometryFlipped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isGeometryFlipped");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftAnchor");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "level");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectValue");
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_packageWithContentsOfURL_type_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "packageWithContentsOfURL:type:options:error:");
}

id objc_msgSend_postEvent_entity_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postEvent:entity:data:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_publishedObjectNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publishedObjectNames");
}

id objc_msgSend_publishedObjectWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publishedObjectWithName:");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_releaseCurrentIdleSleepAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseCurrentIdleSleepAssertion");
}

id objc_msgSend_removeAttribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAttribution:");
}

id objc_msgSend_removeDeviceLockStateObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDeviceLockStateObserver:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_resetRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetRequest:");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightAnchor");
}

id objc_msgSend_rootLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootLayer");
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaLayoutGuide");
}

id objc_msgSend_scaledValueForValue_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scaledValueForValue:compatibleWithTraitCollection:");
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityIdentifier:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAdjustsImageSizeForAccessibilityContentSizeCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdjustsImageSizeForAccessibilityContentSizeCategory:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAttributedTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributedTitle:");
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAxis:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundStyle:");
}

id objc_msgSend_setBaseBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBaseBackgroundColor:");
}

id objc_msgSend_setBaseForegroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBaseForegroundColor:");
}

id objc_msgSend_setBeginTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBeginTime:");
}

id objc_msgSend_setBounces_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBounces:");
}

id objc_msgSend_setButtonSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setButtonSize:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setContentInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentInsets:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setCornerStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerStyle:");
}

id objc_msgSend_setCurrentAttribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentAttribution:");
}

id objc_msgSend_setCurrentSessionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentSessionID:");
}

id objc_msgSend_setCustomSpacing_afterView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomSpacing:afterView:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDistribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDistribution:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setGeometryFlipped_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGeometryFlipped:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImagePadding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImagePadding:");
}

id objc_msgSend_setInitialStatesOfLayer_transitionSpeed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialStatesOfLayer:transitionSpeed:");
}

id objc_msgSend_setMaximumContentSizeCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumContentSizeCategory:");
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsUpdateConstraints");
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

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOverrideUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverrideUserInterfaceStyle:");
}

id objc_msgSend_setPauseButtonState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPauseButtonState:");
}

id objc_msgSend_setPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPosition:");
}

id objc_msgSend_setPreferredSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredSymbolConfiguration:");
}

id objc_msgSend_setPrimaryText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimaryText:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setSecondaryText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecondaryText:");
}

id objc_msgSend_setShowsActivityIndicator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsActivityIndicator:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setState_ofLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:ofLayer:");
}

id objc_msgSend_setState_ofLayer_transitionSpeed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:ofLayer:transitionSpeed:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitleLineBreakMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleLineBreakMode:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTransitionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransitionHandler:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUserInitiated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInitiated:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_startStream_option_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startStream:option:completion:");
}

id objc_msgSend_stateController_didSetStateOfLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateController:didSetStateOfLayer:");
}

id objc_msgSend_stateController_transitionDidStart_speed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateController:transitionDidStart:speed:");
}

id objc_msgSend_stateController_transitionDidStop_completed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateController:transitionDidStop:completed:");
}

id objc_msgSend_stateOfLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateOfLayer:");
}

id objc_msgSend_stateWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateWithName:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBlackColor");
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

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemRedColor");
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemWhiteColor");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_toState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toState");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_updateState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateState:");
}

id objc_msgSend_updateState_withUserInteractionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateState:withUserInteractionHandler:");
}

id objc_msgSend_updateVolatileData_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateVolatileData:completion:");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_videoPreviewLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoPreviewLayer");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "widthAnchor");
}
