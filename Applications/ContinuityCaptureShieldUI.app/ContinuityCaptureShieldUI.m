void sub_100001688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000016A4(uint64_t a1, void *a2, void *a3)
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

void sub_100001710(uint64_t a1)
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
    v5[2] = sub_1000017B0;
    v5[3] = &unk_1000184E0;
    v6 = v3;
    objc_msgSend(v4, "handleUserInteractionsWithBlock:", v5);

  }
  else
  {
    objc_msgSend(WeakRetained[4], "handleUserInteractionsWithBlock:", 0);
  }

}

uint64_t sub_1000017B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_1000030A8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;

  v2 = sub_100007074();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 136315394;
    v7 = "-[ContinuityCaptureShieldUIViewController observeValueForKeyPath:ofObject:change:context:]_block_invoke";
    v8 = 2112;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: %@ Request refresh ui", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updateUI");
}

id sub_100003168(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;

  v2 = sub_100007074();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 136315394;
    v7 = "-[ContinuityCaptureShieldUIViewController observeValueForKeyPath:ofObject:change:context:]_block_invoke";
    v8 = 2112;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: %@ Updated FaceTime continuity session state. Refresh UI", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updateUI");
}

void sub_10000356C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000035AC(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = sub_100007074();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315394;
    v7 = "-[ContinuityCaptureShieldUIViewController _showHowToReconnectDialog]_block_invoke";
    v8 = 2048;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: <%p> OK button pressed", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(WeakRetained, "_disconnectSession");
}

void sub_100003684(uint64_t a1)
{
  _BYTE *WeakRetained;
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = sub_100007074();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315394;
    v7 = "-[ContinuityCaptureShieldUIViewController _showHowToReconnectDialog]_block_invoke";
    v8 = 2048;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: <%p> Cancel button pressed", (uint8_t *)&v6, 0x16u);
  }

  WeakRetained[17] = 0;
}

void sub_100003A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003A48(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = sub_100007074();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315394;
    v7 = "-[ContinuityCaptureShieldUIViewController _showDedicatedDisconnectDialog]_block_invoke";
    v8 = 2048;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: <%p> OK button pressed", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(WeakRetained, "_disconnectSession");
}

void sub_100003B20(uint64_t a1)
{
  _BYTE *WeakRetained;
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = sub_100007074();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315394;
    v7 = "-[ContinuityCaptureShieldUIViewController _showDedicatedDisconnectDialog]_block_invoke";
    v8 = 2048;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: <%p> Cancel button pressed", (uint8_t *)&v6, 0x16u);
  }

  WeakRetained[17] = 0;
}

void sub_1000049F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004A28(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "neighborhoodActivityConduit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "UUID"));
  v5 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004B20;
  v6[3] = &unk_1000185C0;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "pullConversation:fromTVDevice:completion:", v4, v5, v6);

  objc_destroyWeak(&v8);
}

void sub_100004B0C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100004B20(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a3;
  if (v4)
  {
    v5 = sub_100007074();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000BD68(a1, (uint64_t)v4, v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t sub_100004B90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL sub_100004EFC(id a1, TUConversation *a2)
{
  return -[TUConversation state](a2, "state") == (id)3;
}

void sub_100005090(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = sub_100007074();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315394;
      v5 = "-[ContinuityCaptureShieldUIViewController _disconnectSession]_block_invoke";
      v6 = 2112;
      v7 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:  %@ disconnect timeout", (uint8_t *)&v4, 0x16u);
    }

    objc_msgSend(WeakRetained, "_tearDownShield");
  }

}

void sub_1000053A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL sub_1000053D0(id a1, TUConversation *a2)
{
  return -[TUConversation state](a2, "state") == (id)3;
}

void sub_1000053F0(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (a2 && WeakRetained)
  {
    WeakRetained[3] = 1;
    objc_msgSend(WeakRetained, "_pullConversation:deviceHandle:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v6 = sub_100007074();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_10000BE18();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_100005BD0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_tearDownShield");

}

void sub_100006020(id a1, BSActionResponse *a2)
{
  BSActionResponse *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;

  v2 = a2;
  v3 = sub_100007074();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSActionResponse error](v2, "error"));
    v7 = 136315394;
    v8 = "-[ContinuityCaptureShieldUIViewController _tearDownShield]_block_invoke";
    v9 = 2112;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Scene torn down with error: %@, exit now ", (uint8_t *)&v7, 0x16u);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v6, "terminateWithSuccess");

}

void sub_100006114(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;

  v2 = sub_100007074();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 136315394;
    v8 = "-[ContinuityCaptureShieldUIViewController _tearDownShield]_block_invoke";
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: destroy scene: %@ in lock mode", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(v5, "sendActions:", v6);

}

void sub_1000069CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000069E8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_recalculateState");

}

id sub_100007074()
{
  if (qword_100020070 != -1)
    dispatch_once(&qword_100020070, &stru_100018768);
  return (id)qword_100020068;
}

void sub_1000070B4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.ContinuityCaptureShieldUI", "default");
  v2 = (void *)qword_100020068;
  qword_100020068 = (uint64_t)v1;

}

void sub_10000712C(id a1)
{
  CMContinuityCaptureUIStateTracker *v1;
  void *v2;

  v1 = objc_alloc_init(CMContinuityCaptureUIStateTracker);
  v2 = (void *)qword_100020080;
  qword_100020080 = (uint64_t)v1;

}

void sub_100007710(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

BOOL sub_10000793C(id a1, TUConversation *a2)
{
  return -[TUConversation state](a2, "state") == (id)3;
}

void sub_100007A2C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_sessionDidUpdateWithConfiguration:", *(_QWORD *)(a1 + 32));

}

void sub_100007CD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007E14(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_tearDownShield");

}

void sub_100007FE4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100008034(id a1)
{
  ContinuityCaptureShieldUIBackgroundPauseManager *v1;
  void *v2;

  v1 = objc_alloc_init(ContinuityCaptureShieldUIBackgroundPauseManager);
  v2 = (void *)qword_100020088;
  qword_100020088 = (uint64_t)v1;

}

void sub_100009650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,id a63)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak(&a63);
  _Unwind_Resume(a1);
}

void sub_1000096F8(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = sub_100007074();
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

void sub_1000097D8(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
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
    v7 = sub_100007074();
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
      v12[2] = sub_10000998C;
      v12[3] = &unk_100018678;
      objc_copyWeak(&v13, v4);
      objc_msgSend(v11, "contentViewDidSelectFaceTimeButton:completion:", v6, v12);

      objc_destroyWeak(&v13);
    }
  }

}

void sub_100009970(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000998C(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009A04;
  block[3] = &unk_100018678;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_100009A04(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setPullFaceTimeButtonLoading:", 0);

}

void sub_100009A34(uint64_t a1)
{
  id WeakRetained;
  id v2;
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
    v2 = sub_100007074();
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

void sub_100009B44(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = sub_100007074();
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

void sub_100009C24(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = sub_100007074();
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

void sub_10000A230(uint64_t a1)
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

void sub_10000B444(id a1)
{
  ContinuityCaptureShieldUIBackgroundActivityManager *v1;
  void *v2;

  v1 = objc_alloc_init(ContinuityCaptureShieldUIBackgroundActivityManager);
  v2 = (void *)qword_100020098;
  qword_100020098 = (uint64_t)v1;

}

void sub_10000B888(id a1, NSString *a2, ContinuityCaptureShieldUIBackgroundActivityController *a3, BOOL *a4)
{
  -[ContinuityCaptureShieldUIBackgroundActivityController deactivateBackgroundActivity](a3, "deactivateBackgroundActivity");
}

void sub_10000B94C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B964(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000B974(uint64_t a1)
{

}

void sub_10000B97C(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "isBackgroundActivityActive"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
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
  v5 = (objc_class *)objc_opt_class(ContinuityCaptureShieldUIAppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

void sub_10000BC44(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  v3 = 136315650;
  v4 = "-[ContinuityCaptureShieldUIBaseSceneDelegate scene:openURLContexts:]";
  v5 = 2048;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: <%p> Launching ShieldUI via URL without a valid URL payload for the launchUIConfiguration: %@", (uint8_t *)&v3, 0x20u);
}

void sub_10000BCDC()
{
  int v0;
  os_log_t v1;
  int v2[5];
  __int16 v3;
  int v4;

  v2[0] = 136315650;
  sub_100006208();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s: %@ shield UI in placement step unexpectedly with client device model %d", (uint8_t *)v2, 0x1Cu);
}

void sub_10000BD68(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id WeakRetained;
  __int16 v6;
  int v7[5];
  __int16 v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7[0] = 136315650;
  sub_100006208();
  v8 = v6;
  v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: %@ pullConversation failed with error=%@", (uint8_t *)v7, 0x20u);

}

void sub_10000BE18()
{
  os_log_t v0;
  int v1[6];

  v1[0] = 136315394;
  sub_100006208();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%s: %@ error talking to ccd about pulling conversation", (uint8_t *)v1, 0x16u);
}

void sub_10000BE94()
{
  os_log_t v0;
  int v1[6];

  v1[0] = 136315394;
  sub_100006208();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: %@: error opening favorites", (uint8_t *)v1, 0x16u);
}

void sub_10000BF10(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;

  v6 = UIApplicationSceneDeactivationReasonMaskDescriptionComponents(*(_QWORD *)(a1 + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = 136315906;
  v9 = "-[ContinuityCaptureShieldUIPauseSceneComponent _scene:willTransitionToActivationState:withReasonsMask:]";
  v10 = 2048;
  v11 = a1;
  v12 = 2048;
  v13 = a2;
  v14 = 2112;
  v15 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%s: <%p> state:%zu deactivationReasons:%@", (uint8_t *)&v8, 0x2Au);

}

void sub_10000BFE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100006208();
  sub_100007FE4((void *)&_mh_execute_header, v0, v1, "%s: %@ activeConfiguration shouldn't be nil", v2, v3, v4, v5, 2u);
}

void sub_10000C050()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100006208();
  sub_100007FE4((void *)&_mh_execute_header, v0, v1, "%s: %@ activeConfiguration should not be set to nil, returning", v2, v3, v4, v5, 2u);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLContexts");
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForResource:withExtension:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend__FBSScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_FBSScene");
}

id objc_msgSend__aquireAppSuspendAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_aquireAppSuspendAssertion");
}

id objc_msgSend__cancelCurrentDebounceTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cancelCurrentDebounceTimer");
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

id objc_msgSend__disconnectFaceTimeIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disconnectFaceTimeIfNecessary");
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

id objc_msgSend__imageToTextPadding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_imageToTextPadding");
}

id objc_msgSend__isOnLockScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isOnLockScreen");
}

id objc_msgSend__isPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isPad");
}

id objc_msgSend__pauseButtonConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pauseButtonConfiguration");
}

id objc_msgSend__pullConversation_deviceHandle_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pullConversation:deviceHandle:completion:");
}

id objc_msgSend__recalculateState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recalculateState");
}

id objc_msgSend__refreshConnectionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_refreshConnectionType");
}

id objc_msgSend__refreshUIState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_refreshUIState");
}

id objc_msgSend__registerSceneComponent_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerSceneComponent:forKey:");
}

id objc_msgSend__releaseAppSuspendAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_releaseAppSuspendAssertion");
}

id objc_msgSend__sessionDidUpdateWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sessionDidUpdateWithConfiguration:");
}

id objc_msgSend__setBackgroundStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setBackgroundStyle:");
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

id objc_msgSend__shouldPauseForDeactivationReasonMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldPauseForDeactivationReasonMask:");
}

id objc_msgSend__shouldShowFaceTimeButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldShowFaceTimeButton");
}

id objc_msgSend__shouldShowFavoritesButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldShowFavoritesButton");
}

id objc_msgSend__shouldShowHowToReconnectDialog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldShowHowToReconnectDialog");
}

id objc_msgSend__skipButtonConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_skipButtonConfiguration");
}

id objc_msgSend__systemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemImageNamed:");
}

id objc_msgSend__tearDownShield(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tearDownShield");
}

id objc_msgSend__textToButtonsPadding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_textToButtonsPadding");
}

id objc_msgSend__unregisterSceneComponentForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_unregisterSceneComponentForKey:");
}

id objc_msgSend__updateUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateUI");
}

id objc_msgSend__updateUIForClientInformation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateUIForClientInformation");
}

id objc_msgSend__updateUIForConnectionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateUIForConnectionType");
}

id objc_msgSend__updateUIForPlacementStep(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateUIForPlacementStep");
}

id objc_msgSend__updateUIForUIState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateUIForUIState");
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireWithError:");
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithHandler:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateBackgroundActivityWithUserInteractionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateBackgroundActivityWithUserInteractionHandler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationState");
}

id objc_msgSend_activeConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeConfiguration");
}

id objc_msgSend_activeConversations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeConversations");
}

id objc_msgSend_activeSplitSessionTV(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeSplitSessionTV");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addAttribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAttribution:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addLayoutGuide_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLayoutGuide:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
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

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_annotation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "annotation");
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationIdentifier");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_attributionWithAuditToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributionWithAuditToken:");
}

id objc_msgSend_avMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "avMode");
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

id objc_msgSend_bs_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bs_firstObjectPassingTest:");
}

id objc_msgSend_buttonWithConfiguration_primaryAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithConfiguration:primaryAction:");
}

id objc_msgSend_canPullBackConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canPullBackConversation:");
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

id objc_msgSend_clientDeviceModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientDeviceModel");
}

id objc_msgSend_clientName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientName");
}

id objc_msgSend_compositeState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compositeState");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_configurationWithTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithTextStyle:");
}

id objc_msgSend_connectToContinuityCaptureServerWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectToContinuityCaptureServerWithDelegate:");
}

id objc_msgSend_connectionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionType");
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

id objc_msgSend_conversationManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationManager");
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

id objc_msgSend_deactivateBackgroundActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivateBackgroundActivity");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultMetrics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultMetrics");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_disconnectAllCalls(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnectAllCalls");
}

id objc_msgSend_disconnectSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnectSession");
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

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
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

id objc_msgSend_identifierForCurrentProcess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifierForCurrentProcess");
}

id objc_msgSend_imageByApplyingSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageByApplyingSymbolConfiguration:");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithRenderingMode:");
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

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithExplanation:target:attributes:");
}

id objc_msgSend_initWithLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLayer:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithPackageName_type_inBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPackageName:type:inBundle:");
}

id objc_msgSend_initWithPersistedIdentifiers_preferredAnimationType_forDestroyingSession_userOriginatedRequest_callbackQueue_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPersistedIdentifiers:preferredAnimationType:forDestroyingSession:userOriginatedRequest:callbackQueue:completion:");
}

id objc_msgSend_initWithScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithScene:");
}

id objc_msgSend_initWithSceneSessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSceneSessionRole:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isBackgroundActivityActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBackgroundActivityActive");
}

id objc_msgSend_isDedicated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDedicated");
}

id objc_msgSend_isDedicatedSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDedicatedSession");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isGeometryFlipped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isGeometryFlipped");
}

id objc_msgSend_isInFaceTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInFaceTime");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMainThread");
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

id objc_msgSend_leaveConversationWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leaveConversationWithUUID:");
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftAnchor");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lockDeviceAnimated_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockDeviceAnimated:withCompletion:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_neighborhoodActivityConduit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "neighborhoodActivityConduit");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "options");
}

id objc_msgSend_packageWithContentsOfURL_type_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "packageWithContentsOfURL:type:options:error:");
}

id objc_msgSend_pauseSessionForEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseSessionForEvent:");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pid");
}

id objc_msgSend_placementStepSkipped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "placementStepSkipped");
}

id objc_msgSend_prepareForPullConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareForPullConversation:");
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

id objc_msgSend_pullConversation_fromTVDevice_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pullConversation:fromTVDevice:completion:");
}

id objc_msgSend_removeAttribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAttribution:");
}

id objc_msgSend_removeDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDelegate:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_requestDefaultScreenPauseEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestDefaultScreenPauseEvent:");
}

id objc_msgSend_requestDefaultScreenResumeEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestDefaultScreenResumeEvent:");
}

id objc_msgSend_resumeStreamingForEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeStreamingForEvent:");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightAnchor");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
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

id objc_msgSend_scene_openURLContexts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scene:openURLContexts:");
}

id objc_msgSend_sendActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendActions:");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session");
}

id objc_msgSend_sessionDidUpdateWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionDidUpdateWithConfiguration:");
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

id objc_msgSend_setApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationIdentifier:");
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

id objc_msgSend_setClientDeviceModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientDeviceModel:");
}

id objc_msgSend_setClientName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientName:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCompositeState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompositeState:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConnectionType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionType:");
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

id objc_msgSend_setCustomSpacing_afterView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomSpacing:afterView:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegateClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegateClass:");
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

id objc_msgSend_setInFaceTimeSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInFaceTimeSession:");
}

id objc_msgSend_setInPlacementStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInPlacementStep:");
}

id objc_msgSend_setInitialStatesOfLayer_transitionSpeed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialStatesOfLayer:transitionSpeed:");
}

id objc_msgSend_setIsDedicated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsDedicated:");
}

id objc_msgSend_setIsDedicatedSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsDedicatedSession:");
}

id objc_msgSend_setMaximumContentSizeCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumContentSizeCategory:");
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsUpdateConstraints");
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

id objc_msgSend_setPlacementStepSkipped_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlacementStepSkipped:");
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

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
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

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUIConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUIConfiguration:");
}

id objc_msgSend_setUiState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUiState:");
}

id objc_msgSend_setUserInitiated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInitiated:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_skipPlacementStep(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipPlacementStep");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
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

id objc_msgSend_targetWithPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetWithPid:");
}

id objc_msgSend_tearDownShield(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tearDownShield");
}

id objc_msgSend_terminateWithSuccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminateWithSuccess");
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

id objc_msgSend_uiState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uiState");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_updateState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateState:");
}

id objc_msgSend_updateVolatileData_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateVolatileData:completion:");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windowScene");
}
