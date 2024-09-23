uint64_t start(int a1, char **a2)
{
  void *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;
  uint64_t v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RPAngelConnectionManager sharedInstance](RPAngelConnectionManager, "sharedInstance"));
  objc_msgSend(v4, "activateMachService");

  v5 = objc_autoreleasePoolPush();
  v6 = (objc_class *)objc_opt_class(AppDelegate);
  v7 = NSStringFromClass(v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  objc_autoreleasePoolPop(v5);
  v9 = UIApplicationMain(a1, a2, 0, v8);

  return v9;
}

void sub_100003660(id a1)
{
  RPAngelConnectionManager *v1;
  void *v2;

  v1 = objc_alloc_init(RPAngelConnectionManager);
  v2 = (void *)qword_10003FA30;
  qword_10003FA30 = (uint64_t)v1;

}

void sub_100003758(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDomain:", CFSTR("com.apple.ReplayKitAngel"));
  objc_msgSend(v3, "setService:", CFSTR("com.apple.ReplayKitAngel.session"));
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));

}

void sub_10000394C(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.replaykitangel.connectionManagerQueue", 0);
  v2 = (void *)qword_10003FA40;
  qword_10003FA40 = (uint64_t)v1;

}

void sub_100003B28(id a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[BSMutableServiceInterface interfaceWithIdentifier:](BSMutableServiceInterface, "interfaceWithIdentifier:", CFSTR("com.apple.ReplayKitAngel.session")));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[BSObjCProtocol protocolForProtocol:](BSObjCProtocol, "protocolForProtocol:", &OBJC_PROTOCOL___RPAngelServerProtocol));
  objc_msgSend(v5, "setServer:", v1);

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BSObjCProtocol protocolForProtocol:](BSObjCProtocol, "protocolForProtocol:", &OBJC_PROTOCOL___RPAngelClientProtocol));
  objc_msgSend(v5, "setClient:", v2);

  objc_msgSend(v5, "setClientMessagingExpectation:", 0);
  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)qword_10003FA50;
  qword_10003FA50 = (uint64_t)v3;

}

void sub_100003BE0(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectionManagerQueue"));
  objc_msgSend(v6, "setTargetQueue:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceQuality userInitiated](BSServiceQuality, "userInitiated"));
  objc_msgSend(v6, "setServiceQuality:", v5);

  objc_msgSend(v6, "setInterface:", qword_10003FA50);
  objc_msgSend(v6, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "setActivationHandler:", &stru_100034C80);
  objc_msgSend(v6, "setInvalidationHandler:", &stru_100034CA0);
  objc_msgSend(v6, "setInterruptionHandler:", &stru_100034CC0);

}

void sub_100003CA4(id a1, BSServiceConnectionContext *a2)
{
  BSServiceConnectionContext *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  v2 = a2;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136446466;
    v4 = "-[RPAngelConnectionManager listener:didReceiveConnection:withContext:]_block_invoke_3";
    v5 = 1024;
    v6 = 109;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngel Server: Activation Handler", (uint8_t *)&v3, 0x12u);
  }

}

void sub_100003D74(id a1, BSServiceConnectionContext *a2)
{
  BSServiceConnectionContext *v2;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  v2 = a2;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPAngelConnectionManager listener:didReceiveConnection:withContext:]_block_invoke";
    v6 = 1024;
    v7 = 113;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngel Server: Invalidation handler", (uint8_t *)&v4, 0x12u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPRemoteAlertManager sharedInstance](RPRemoteAlertManager, "sharedInstance"));
  objc_msgSend(v3, "clearRemoteHandle");

}

void sub_100003E60(id a1, BSServiceConnectionContext *a2)
{
  BSServiceConnectionContext *v2;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;

  v2 = a2;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPAngelConnectionManager listener:didReceiveConnection:withContext:]_block_invoke";
    v6 = 1024;
    v7 = 118;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngel Server: Interruption handler", (uint8_t *)&v4, 0x12u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPRemoteAlertManager sharedInstance](RPRemoteAlertManager, "sharedInstance"));
  objc_msgSend(v3, "clearRemoteHandle");

}

void sub_100004C84(uint64_t a1)
{
  RPAngelCameraPipViewController *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136446466;
      v6 = "-[RPAngelConnectionManager enableCameraPip]_block_invoke";
      v7 = 1024;
      v8 = 214;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pip is already active", (uint8_t *)&v5, 0x12u);
    }
  }
  else
  {
    v2 = objc_alloc_init(RPAngelCameraPipViewController);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = v2;

    _objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "startPipSession");
  }
}

void sub_100004EAC(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "stopPipSession");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

}

void sub_100005760(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1000062C0(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "startPictureInPicture");
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPAngelCameraPipViewController startPipSession]_block_invoke";
    v3 = 1024;
    v4 = 96;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pip started", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100006E68(void *a1)
{
  sub_100025040(a1);
  JUMPOUT(0x100006E48);
}

void sub_100006E70(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "startPictureInPicture");
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446466;
    v2 = "-[RPAngelCameraPipViewController observeValueForKeyPath:ofObject:change:context:]_block_invoke";
    v3 = 1024;
    v4 = 197;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pegasus started", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100007668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007680(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100007690(uint64_t a1)
{

}

void sub_100007698(uint64_t a1, char a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if ((a2 & 1) != 0)
  {
    v3 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v4 = (void *)v3[5];
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rpLocalizedStatusStringForPaused:", 0));
    objc_msgSend(v4, "setStatusString:", v5);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPStatusBarAssertion: failed to acquire assertion", v6, 2u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidateStatusBar");
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id sub_100007754(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "invalidateStatusBar");
}

void sub_100007828(id a1, NSError *a2)
{
  int v3;
  NSInteger v4;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 134217984;
    v4 = -[NSError code](a2, "code");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPStatusBarAssertion: registered. If there was an error it was: %li", (uint8_t *)&v3, 0xCu);
  }
}

void sub_100007928(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "invalidate");
  v5 = objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), "updateDelegateRecordingTimer:", 0, 1, 0.5));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v5;

}

void sub_100007A5C(id a1, NSError *a2)
{
  NSError *v2;

  v2 = a2;
  if (v2 && __RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100025104((uint64_t)v2);

}

void sub_100008004(id a1)
{
  RPRemoteAlertManager *v1;
  void *v2;

  v1 = objc_alloc_init(RPRemoteAlertManager);
  v2 = (void *)qword_10003FA60;
  qword_10003FA60 = (uint64_t)v1;

}

uint64_t sub_1000085F0()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_role);
}

uint64_t sub_100008600()
{
  return 0;
}

void *sub_100008608()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  _BYTE v5[24];

  v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_package);
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_package, v5, 0, 0);
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_100008654(void *a1)
{
  sub_10000B040(a1, &OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_package);
}

void *sub_100008660(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_package, a1, 33, 0);
  return &j__swift_endAccess;
}

uint64_t sub_1000086A8()
{
  const char *v0;
  uint64_t v1;

  v0 = sub_10002320C();
  v1 = *(_QWORD *)v0;
  swift_bridgeObjectRetain(*((_QWORD *)v0 + 1));
  return v1;
}

uint64_t sub_1000086D8(uint64_t a1)
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

uint64_t sub_100008704()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _BYTE v4[24];

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_viewState);
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_viewState, v4, 0, 0);
  v2 = *v1;
  swift_bridgeObjectRetain(v1[1]);
  return v2;
}

uint64_t sub_100008758(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char *v14;
  _QWORD aBlock[5];
  uint64_t v16;
  char v17[24];

  v5 = &v2[OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_viewState];
  swift_beginAccess(&v2[OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_viewState], v17, 1, 0);
  v6 = *(_QWORD *)v5;
  v7 = *((_QWORD *)v5 + 1);
  *(_QWORD *)v5 = a1;
  *((_QWORD *)v5 + 1) = a2;
  v8 = v6 == a1 && v7 == a2;
  if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)(v6, v7, a1, a2, 0) & 1) != 0)
    return swift_bridgeObjectRelease(v7);
  v10 = objc_msgSend(v2, "systemApertureElementContext");
  v11 = swift_allocObject(&unk_100034F58, 24, 7);
  *(_QWORD *)(v11 + 16) = v2;
  aBlock[4] = sub_100009B30;
  v16 = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000086D8;
  aBlock[3] = &unk_100034F70;
  v12 = _Block_copy(aBlock);
  v13 = v16;
  v14 = v2;
  swift_release(v13);
  objc_msgSend(v10, "setElementNeedsUpdateWithCoordinatedAnimations:", v12);
  _Block_release(v12);
  swift_bridgeObjectRelease(v7);
  return swift_unknownObjectRelease(v10);
}

void (*sub_10000889C(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  v4 = (_QWORD *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_viewState);
  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_viewState, v3, 0, 0);
  v5 = v4[1];
  v3[3] = *v4;
  v3[4] = v5;
  swift_bridgeObjectRetain(v5);
  return sub_100008910;
}

void sub_100008910(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain(*(_QWORD *)(*(_QWORD *)a1 + 32));
    sub_100008758(v3, v4);
    swift_bridgeObjectRelease(v2[4]);
  }
  else
  {
    sub_100008758(*(_QWORD *)(*(_QWORD *)a1 + 24), v4);
  }
  free(v2);
}

uint64_t sub_100008978(char a1)
{
  return *(_QWORD *)&aLeading_1[8 * a1];
}

uint64_t sub_100008998(char *a1, char *a2)
{
  return sub_100008A28(*a1, *a2);
}

uint64_t sub_1000089A4(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = 8 * a1;
  v3 = *(_QWORD *)&aIdle_1[v2];
  v4 = *(_QWORD *)&aSavedtop[v2 + 8];
  v5 = 8 * a2;
  v6 = *(_QWORD *)&aSavedtop[v5 + 8];
  if (v3 == *(_QWORD *)&aIdle_1[v5] && v4 == v6)
    v8 = 1;
  else
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v8 & 1;
}

uint64_t sub_100008A28(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = 8 * a1;
  v3 = *(_QWORD *)&aLeading_1[v2];
  v4 = *(_QWORD *)((char *)&unk_100027F38 + v2);
  v5 = 8 * a2;
  v6 = *(_QWORD *)((char *)&unk_100027F38 + v5);
  if (v3 == *(_QWORD *)&aLeading_1[v5] && v4 == v6)
    v8 = 1;
  else
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v8 & 1;
}

Swift::Int sub_100008AAC()
{
  char *v0;

  return sub_100008AB4(*v0);
}

Swift::Int sub_100008AB4(char a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, 0);
  v2 = 8 * a1;
  v3 = *(_QWORD *)((char *)&unk_100027F38 + v2);
  String.hash(into:)(v5, *(_QWORD *)&aLeading_1[v2], v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_100008B1C(uint64_t a1)
{
  char *v1;

  return sub_100008B64(a1, *v1);
}

uint64_t sub_100008B24(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 8 * a2;
  v3 = *(_QWORD *)&aSavedtop[v2 + 8];
  String.hash(into:)(a1, *(_QWORD *)&aIdle_1[v2], v3);
  return swift_bridgeObjectRelease(v3);
}

uint64_t sub_100008B64(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 8 * a2;
  v3 = *(_QWORD *)((char *)&unk_100027F38 + v2);
  String.hash(into:)(a1, *(_QWORD *)&aLeading_1[v2], v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_100008BA4(uint64_t a1)
{
  char *v1;

  return sub_100008BAC(a1, *v1);
}

Swift::Int sub_100008BAC(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6, a1);
  v3 = 8 * a2;
  v4 = *(_QWORD *)((char *)&unk_100027F38 + v3);
  String.hash(into:)(v6, *(_QWORD *)&aLeading_1[v3], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

Swift::Int sub_100008C10(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6, a1);
  v3 = 8 * a2;
  v4 = *(_QWORD *)&aSavedtop[v3 + 8];
  String.hash(into:)(v6, *(_QWORD *)&aIdle_1[v3], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

unint64_t sub_100008C74@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_100018D1C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100008CA0@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_100008978(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

char *sub_100008CC8(int a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return sub_100008CF8(a1);
}

char *sub_100008CF8(int a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  __objc2_class_ro **p_info;
  char *v8;
  char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  uint64_t v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t ObjectType;
  uint64_t ObjCClassFromMetadata;
  id v27;
  id v28;
  NSString v29;
  id v30;
  void **v31;
  void *v32;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37[3];
  objc_super v38;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  p_info = RPAngelCameraPipViewController.info;
  *(_QWORD *)&v1[OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_package] = 0;
  v8 = &v1[OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_viewState];
  v9 = v1;
  v10 = sub_10002320C();
  v12 = *(_QWORD *)v10;
  v11 = *((_QWORD *)v10 + 1);
  *(_QWORD *)v8 = v12;
  *((_QWORD *)v8 + 1) = v11;
  v9[OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_role] = a1;
  swift_bridgeObjectRetain(v11);

  v13 = (objc_class *)type metadata accessor for RPSessionAccessoryView();
  v38.receiver = v9;
  v38.super_class = v13;
  v14 = objc_msgSendSuper2(&v38, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v15 = sub_10001DA68();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v15, v3);
  v16 = (char *)v14;
  v17 = Logger.logObject.getter();
  v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc(22, -1);
    v20 = swift_slowAlloc(64, -1);
    v35 = a1;
    v21 = v20;
    v37[0] = v20;
    *(_DWORD *)v19 = 136315394;
    v36 = sub_1000184E8(0x6C6F722874696E69, 0xEB00000000293A65, v37);
    v34 = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37);
    *(_WORD *)(v19 + 12) = 2080;
    v22 = 8 * v16[OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_role];
    v23 = *(_QWORD *)((char *)&unk_100027F38 + v22);
    v36 = sub_1000184E8(*(_QWORD *)&aLeading_1[v22], v23, v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37);

    swift_bridgeObjectRelease(v23);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "%s role=%s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy(v21, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v21, -1, -1);
    v24 = v19;
    p_info = (__objc2_class_ro **)(RPAngelCameraPipViewController + 32);
    swift_slowDealloc(v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v34);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  ObjectType = swift_getObjectType(v16);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(ObjectType);
  v27 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v28 = objc_allocWithZone((Class)BSUICAPackageView);
  v29 = String._bridgeToObjectiveC()();
  v30 = objc_msgSend(v28, "initWithPackageName:inBundle:", v29, v27);

  v31 = (void **)((char *)p_info[509] + (_QWORD)v16);
  swift_beginAccess(v31, v37, 1, 0);
  v32 = *v31;
  *v31 = v30;

  return v16;
}

id sub_100009124(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithCoder:", a1);

  return v3;
}

void sub_100009164()
{
  char *v0;
  char *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)&v0[OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_package] = 0;
  v1 = &v0[OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_viewState];
  v2 = sub_10002320C();
  v4 = *(_QWORD *)v2;
  v3 = *((_QWORD *)v2 + 1);
  *(_QWORD *)v1 = v4;
  *((_QWORD *)v1 + 1) = v3;
  swift_bridgeObjectRetain(v3);

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "ReplayKitAngel/RPSystemApertureElementViewController.swift", 58, 2, 54, 0);
  __break(1u);
}

void sub_10000925C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  objc_class *v17;
  id v18;
  uint64_t (*v19)(void);
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSString v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double MidX;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_10001DA68();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  v6 = v0;
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc(32, -1);
    v34 = swift_slowAlloc(96, -1);
    v36 = v34;
    *(_DWORD *)v9 = 136315650;
    v35 = sub_1000184E8(0xD000000000000010, 0x800000010002EA50, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36);
    *(_WORD *)(v9 + 12) = 2080;
    v10 = 8 * *((char *)v6 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_role);
    v11 = *(_QWORD *)((char *)&unk_100027F38 + v10);
    v35 = sub_1000184E8(*(_QWORD *)&aLeading_1[v10], v11, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36);

    v12 = swift_bridgeObjectRelease(v11);
    *(_WORD *)(v9 + 22) = 2080;
    v13 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v6) + 0x80))(v12);
    v15 = v14;
    v35 = sub_1000184E8(v13, v14, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36);

    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s role=%s viewState=%s", (uint8_t *)v9, 0x20u);
    v16 = v34;
    swift_arrayDestroy(v34, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v9, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v17 = (objc_class *)type metadata accessor for RPSessionAccessoryView();
  v37.receiver = v6;
  v37.super_class = v17;
  v18 = objc_msgSendSuper2(&v37, "layoutSubviews");
  v19 = *(uint64_t (**)(void))((swift_isaMask & *v6) + 0x68);
  v20 = ((uint64_t (*)(id))v19)(v18);
  if (v20)
  {
    v21 = (void *)v20;
    (*(void (**)(void))((swift_isaMask & *v6) + 0x80))();
    v23 = v22;
    v24 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v23);
    objc_msgSend(v21, "setState:", v24);

  }
  v25 = (void *)v19();
  if (v25)
  {
    v26 = v25;
    objc_msgSend(v25, "sizeToFit");

  }
  v27 = v19();
  if (v27)
  {
    v28 = (void *)v27;
    objc_msgSend(v6, "bounds");
    MidX = CGRectGetMidX(v38);
    objc_msgSend(v6, "bounds");
    objc_msgSend(v28, "setCenter:", MidX, CGRectGetMidY(v39));

  }
  v30 = (void *)v19();
  if (v30)
  {
    v31 = v30;
    objc_msgSend(v30, "setAlpha:", *(double *)sub_100022CB4());

  }
  v32 = (void *)v19();
  objc_msgSend(v6, "insertSubview:above:", v32, v6);

}

double sub_1000096C0()
{
  _QWORD *v0;
  uint64_t v1;
  int v2;
  unint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  char v21;
  double v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  double v33;
  double *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  double v47;
  char v48;
  char v49;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  char v63;

  v1 = 0x676E696461656CLL;
  v2 = *((unsigned __int8 *)v0 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_role);
  if (*((_BYTE *)v0 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_role))
  {
    if (v2 != 1)
    {
      swift_bridgeObjectRelease(0xE700000000000000);
      goto LABEL_18;
    }
    v3 = 0xE800000000000000;
    v4 = 0x676E696C69617274;
  }
  else
  {
    v3 = 0xE700000000000000;
    v4 = 0x676E696461656CLL;
  }
  v5 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v3, 0x6C616D696E696DLL, 0xE700000000000000, 0);
  v6 = swift_bridgeObjectRelease(v3);
  if ((v5 & 1) == 0)
  {
    v7 = *(uint64_t (**)(uint64_t))((swift_isaMask & *v0) + 0x80);
    v8 = v7(v6);
    v10 = v9;
    v11 = sub_10002329C();
    v12 = *((_QWORD *)v11 + 1);
    if (v8 == *(_QWORD *)v11 && v10 == v12)
      goto LABEL_19;
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v8, v10, *(_QWORD *)v11, v12, 0);
    v15 = swift_bridgeObjectRelease(v10);
    if ((v14 & 1) != 0)
      goto LABEL_20;
    v16 = v7(v15);
    v10 = v17;
    v18 = sub_1000232C0();
    v19 = *((_QWORD *)v18 + 1);
    if (v16 == *(_QWORD *)v18 && v10 == v19)
    {
LABEL_19:
      swift_bridgeObjectRelease(v10);
    }
    else
    {
      v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v10, *(_QWORD *)v18, v19, 0);
      swift_bridgeObjectRelease(v10);
      if ((v21 & 1) == 0)
      {
LABEL_22:
        if (v2)
        {
          if (v2 == 1)
            v24 = 0x676E696C69617274;
          else
            v24 = 0x6C616D696E696DLL;
          if (v2 == 1)
            v25 = 0xE800000000000000;
          else
            v25 = 0xE700000000000000;
          v26 = _stringCompareWithSmolCheck(_:_:expecting:)(v24, v25, 0x676E696461656CLL, 0xE700000000000000, 0);
          v27 = swift_bridgeObjectRelease(v25);
          if ((v26 & 1) == 0)
          {
LABEL_30:
            v28 = v7(v27);
            v30 = v29;
            v31 = sub_10002327C();
            v32 = *((_QWORD *)v31 + 1);
            if (v28 == *(_QWORD *)v31 && v30 == v32)
            {
              swift_bridgeObjectRelease(v30);
            }
            else
            {
              v48 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v30, *(_QWORD *)v31, v32, 0);
              swift_bridgeObjectRelease(v30);
              if ((v48 & 1) == 0)
                goto LABEL_52;
            }
            if (v2)
            {
              v1 = 0x6C616D696E696DLL;
              if (v2 == 1)
              {
                swift_bridgeObjectRelease(0xE800000000000000);
LABEL_51:
                v33 = *(double *)sub_100022B7C();
                v34 = (double *)sub_100022BB0();
                goto LABEL_35;
              }
            }
            v49 = _stringCompareWithSmolCheck(_:_:expecting:)(v1, 0xE700000000000000, 0x676E696C69617274, 0xE800000000000000, 0);
            swift_bridgeObjectRelease(0xE700000000000000);
            if ((v49 & 1) != 0)
              goto LABEL_51;
LABEL_52:
            v22 = *(double *)sub_100022B7C();
            goto LABEL_53;
          }
        }
        else
        {
          v27 = swift_bridgeObjectRelease(0xE700000000000000);
        }
        v35 = v7(v27);
        v37 = v36;
        v38 = sub_100023264();
        v39 = v38[1];
        if (v35 != *v38 || v37 != v39)
        {
          v41 = _stringCompareWithSmolCheck(_:_:expecting:)(v35, v37, *v38, v39, 0);
          v42 = swift_bridgeObjectRelease(v37);
          if ((v41 & 1) != 0)
            goto LABEL_45;
          v43 = v7(v42);
          v37 = v44;
          v45 = sub_10002324C();
          v46 = v45[1];
          if (v43 != *v45 || v37 != v46)
          {
            v51 = _stringCompareWithSmolCheck(_:_:expecting:)(v43, v37, *v45, v46, 0);
            v52 = swift_bridgeObjectRelease(v37);
            if ((v51 & 1) != 0)
              goto LABEL_45;
            v53 = v7(v52);
            v37 = v54;
            v55 = sub_100023234();
            v56 = v55[1];
            if (v53 != *v55 || v37 != v56)
            {
              v57 = _stringCompareWithSmolCheck(_:_:expecting:)(v53, v37, *v55, v56, 0);
              v58 = swift_bridgeObjectRelease(v37);
              if ((v57 & 1) != 0)
                goto LABEL_45;
              v59 = v7(v58);
              v37 = v60;
              v61 = sub_10002327C();
              v62 = *((_QWORD *)v61 + 1);
              if (v59 != *(_QWORD *)v61 || v37 != v62)
              {
                v63 = _stringCompareWithSmolCheck(_:_:expecting:)(v59, v37, *(_QWORD *)v61, v62, 0);
                v27 = swift_bridgeObjectRelease(v37);
                if ((v63 & 1) == 0)
                  goto LABEL_30;
LABEL_45:
                v47 = *(double *)sub_100022B7C();
                v22 = v47 + *(double *)sub_100022B9C();
                goto LABEL_53;
              }
            }
          }
        }
        swift_bridgeObjectRelease(v37);
        goto LABEL_45;
      }
    }
LABEL_20:
    if (v2)
    {
      v23 = _stringCompareWithSmolCheck(_:_:expecting:)(0x676E696C69617274, 0xE800000000000000, 0x676E696461656CLL, 0xE700000000000000, 0);
      swift_bridgeObjectRelease(0xE800000000000000);
      if ((v23 & 1) == 0)
        goto LABEL_22;
    }
    else
    {
      swift_bridgeObjectRelease(0xE700000000000000);
    }
    v33 = *(double *)sub_100022B7C();
    v34 = (double *)sub_100022B9C();
LABEL_35:
    v22 = v33 - *v34;
LABEL_53:
    sub_100022B90();
    return v22;
  }
LABEL_18:
  v22 = *(double *)sub_100022BD8();
  sub_100022BE4();
  return v22;
}

uint64_t sub_100009B0C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_100009B30()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "invalidateIntrinsicContentSize");
}

uint64_t sub_100009B40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100009B50(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id sub_100009B58(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), "initWithFrame:", a1, a2, a3, a4);
}

void sub_100009BA8()
{
  _swift_stdlib_reportUnimplementedInitializer("ReplayKitAngel.RPSessionAccessoryView", 37, "init(frame:)", 12, 0);
  __break(1u);
}

id sub_100009C00(uint64_t a1)
{
  return sub_100017C84(a1, type metadata accessor for RPSessionAccessoryView);
}

uint64_t sub_100009C4C(char a1)
{
  return *(_QWORD *)&aIdle_1[8 * a1];
}

uint64_t sub_100009C6C(char *a1, char *a2)
{
  return sub_1000089A4(*a1, *a2);
}

Swift::Int sub_100009C78()
{
  char *v0;

  return sub_100008C10(0, *v0);
}

uint64_t sub_100009C84(uint64_t a1)
{
  char *v1;

  return sub_100008B24(a1, *v1);
}

Swift::Int sub_100009C8C(uint64_t a1)
{
  char *v1;

  return sub_100008C10(a1, *v1);
}

unint64_t sub_100009C94@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_100018D84(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100009CC0@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_100009C4C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

id sub_100009CEC()
{
  void *v0;

  return v0;
}

uint64_t sub_100009D38()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_activeLayoutMode;
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_activeLayoutMode, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_100009DC4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_activeLayoutMode);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *sub_100009E0C(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_activeLayoutMode, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_100009E50()
{
  return 2;
}

uint64_t sub_100009E9C()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_contentRole;
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_contentRole, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_100009F28(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_contentRole);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *sub_100009F70(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_contentRole, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_100009FB4()
{
  return 3;
}

uint64_t sub_10000A000()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredLayoutMode;
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredLayoutMode, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_10000A08C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredLayoutMode);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *sub_10000A0D4(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredLayoutMode, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000A118()
{
  return 4;
}

uint64_t sub_10000A164()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_maximumLayoutMode;
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_maximumLayoutMode, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_10000A1F0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_maximumLayoutMode);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *sub_10000A238(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_maximumLayoutMode, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000A27C()
{
  return 0x100000;
}

uint64_t sub_10000A2C8()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_statusBarStyleOverridesToSuppress;
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_statusBarStyleOverridesToSuppress, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_10000A354(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1
                + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_statusBarStyleOverridesToSuppress);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *sub_10000A39C(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_statusBarStyleOverridesToSuppress, a1, 33, 0);
  return &j_j__swift_endAccess;
}

double sub_10000A3E0()
{
  return *(double *)sub_100022C64();
}

double sub_10000A43C()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredHeightForBottomSafeArea;
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredHeightForBottomSafeArea, v3, 0, 0);
  return *(double *)v1;
}

uint64_t sub_10000A4D0(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (double *)(v1
                + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredHeightForBottomSafeArea);
  result = swift_beginAccess(v1+ OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredHeightForBottomSafeArea, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *sub_10000A520(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredHeightForBottomSafeArea, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000A564()
{
  return 0;
}

uint64_t sub_10000A570()
{
  return sub_10000B4DC(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_sessionID);
}

uint64_t sub_10000A57C(uint64_t a1, uint64_t a2)
{
  return sub_10000B5B0(a1, a2, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_sessionID);
}

void *sub_10000A588(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_sessionID, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000A5CC()
{
  return 666;
}

uint64_t sub_10000A618()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_presentationBehaviors;
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_presentationBehaviors, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_10000A6A4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_presentationBehaviors);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *sub_10000A6EC(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_presentationBehaviors, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000A730()
{
  uint64_t v0;
  id v1;

  v0 = SBUISystemApertureElementIdentifierScreenRecording;
  v1 = SBUISystemApertureElementIdentifierScreenRecording;
  return v0;
}

void *sub_10000A768()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  _BYTE v5[24];

  v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_elementIdentifier);
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_elementIdentifier, v5, 0, 0);
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_10000A7C0(void *a1)
{
  sub_10000B040(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_elementIdentifier);
}

void *sub_10000A7CC(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_elementIdentifier, a1, 33, 0);
  return &j_j__swift_endAccess;
}

char *sub_10000A810()
{
  return sub_10000A8A0(0);
}

void *sub_10000A828()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingView);
  v2 = v1;
  return v1;
}

char *sub_10000A854()
{
  return sub_10000A8A0(1);
}

void *sub_10000A86C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView);
  v2 = v1;
  return v1;
}

char *sub_10000A898()
{
  return sub_10000A8A0(2);
}

char *sub_10000A8A0(int a1)
{
  id v2;

  v2 = objc_allocWithZone((Class)type metadata accessor for RPSessionAccessoryView());
  return sub_100008CF8(a1);
}

void *sub_10000A8E0()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalView);
  v2 = v1;
  return v1;
}

id sub_10000A90C()
{
  return objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
}

id sub_10000A930()
{
  uint64_t v0;
  id *v1;
  _BYTE v3[24];

  v1 = (id *)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_timerLabel);
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_timerLabel, v3, 0, 0);
  return *v1;
}

void sub_10000A974(void *a1)
{
  sub_10000B040(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_timerLabel);
}

void *sub_10000A980(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_timerLabel, a1, 33, 0);
  return &j_j__swift_endAccess;
}

id sub_10000A9C4()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_screenRecordingLabel));
}

void *sub_10000A9D4()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  _BYTE v5[24];

  v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingPackageView);
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingPackageView, v5, 0, 0);
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_10000AA20(void *a1)
{
  sub_10000B040(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingPackageView);
}

void *sub_10000AA2C(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingPackageView, a1, 33, 0);
  return &j_j__swift_endAccess;
}

void *sub_10000AA70()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  _BYTE v5[24];

  v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingPackageView);
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingPackageView, v5, 0, 0);
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_10000AABC(void *a1)
{
  sub_10000B040(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingPackageView);
}

void *sub_10000AAC8(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingPackageView, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000AB0C()
{
  return 1;
}

uint64_t sub_10000AB14()
{
  uint64_t v0;
  unsigned __int8 *v1;
  _BYTE v3[24];

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_recordingState);
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_recordingState, v3, 0, 0);
  return *v1;
}

uint64_t sub_10000AB58(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_recordingState);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *sub_10000ABA0(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_recordingState, a1, 33, 0);
  return &j_j__swift_endAccess;
}

id sub_10000ABE4()
{
  return sub_10000ADEC(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___buttonStackView, (Class *)UIStackView_ptr);
}

void sub_10000ABF8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1
                + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___buttonStackView);
  *(_QWORD *)(v1
            + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___buttonStackView) = a1;

}

void (*sub_10000AC0C(id *a1))(uint64_t *a1, uint64_t a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_10000ABE4();
  return sub_10000AC40;
}

void sub_10000AC40(uint64_t *a1, uint64_t a2)
{
  sub_10000AFB8(a1, a2, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___buttonStackView);
}

id sub_10000AC4C()
{
  return sub_10000ADEC(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___viewButton, (Class *)SBUISystemApertureButton_ptr);
}

void sub_10000AC60(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1
                + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___viewButton);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___viewButton) = a1;

}

void (*sub_10000AC74(id *a1))(uint64_t *a1, uint64_t a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_10000AC4C();
  return sub_10000ACA8;
}

void sub_10000ACA8(uint64_t *a1, uint64_t a2)
{
  sub_10000AFB8(a1, a2, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___viewButton);
}

id sub_10000ACB4()
{
  return sub_10000ADEC(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___deleteButton, (Class *)SBUISystemApertureButton_ptr);
}

void sub_10000ACC8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1
                + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___deleteButton);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___deleteButton) = a1;

}

void (*sub_10000ACDC(id *a1))(uint64_t *a1, uint64_t a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_10000ACB4();
  return sub_10000AD10;
}

void sub_10000AD10(uint64_t *a1, uint64_t a2)
{
  sub_10000AFB8(a1, a2, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___deleteButton);
}

uint64_t sub_10000AD20@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B778(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosURL, a1);
}

uint64_t sub_10000AD2C(uint64_t a1)
{
  return sub_10000B8D4(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosURL);
}

void *sub_10000AD38(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosURL, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000AD7C()
{
  return sub_10000B4DC(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosIdentifier);
}

uint64_t sub_10000AD88(uint64_t a1, uint64_t a2)
{
  return sub_10000B5B0(a1, a2, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosIdentifier);
}

void *sub_10000AD94(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosIdentifier, a1, 33, 0);
  return &j_j__swift_endAccess;
}

id sub_10000ADD8()
{
  return sub_10000ADEC(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___stopButton, (Class *)UIButton_ptr);
}

id sub_10000ADEC(uint64_t *a1, Class *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v3 = *a1;
  v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    v5 = *(id *)(v2 + *a1);
  }
  else
  {
    v6 = objc_msgSend(objc_allocWithZone(*a2), "init");
    v7 = *(void **)(v2 + v3);
    *(_QWORD *)(v2 + v3) = v6;
    v5 = v6;

    v4 = 0;
  }
  v8 = v4;
  return v5;
}

void sub_10000AE54(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1
                + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___stopButton);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___stopButton) = a1;

}

void (*sub_10000AE68(id *a1))(uint64_t *a1, uint64_t a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_10000ADD8();
  return sub_10000AE9C;
}

void sub_10000AE9C(uint64_t *a1, uint64_t a2)
{
  sub_10000AFB8(a1, a2, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___stopButton);
}

id sub_10000AEA8()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v1 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___customViewHeightConstraint;
  v2 = *(void **)((char *)v0
                + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___customViewHeightConstraint);
  if (v2)
  {
    v3 = *(id *)((char *)v0
               + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___customViewHeightConstraint);
  }
  else
  {
    v4 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x350))();
    v5 = objc_msgSend(v4, "heightAnchor");

    v6 = objc_msgSend(v5, "constraintEqualToConstant:", *(double *)sub_100022C34());
    v7 = *(void **)((char *)v0 + v1);
    *(_QWORD *)((char *)v0 + v1) = v6;
    v3 = v6;

    v2 = 0;
  }
  v8 = v2;
  return v3;
}

void sub_10000AF64(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1
                + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___customViewHeightConstraint);
  *(_QWORD *)(v1
            + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___customViewHeightConstraint) = a1;

}

void (*sub_10000AF78(id *a1))(uint64_t *a1, uint64_t a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_10000AEA8();
  return sub_10000AFAC;
}

void sub_10000AFAC(uint64_t *a1, uint64_t a2)
{
  sub_10000AFB8(a1, a2, OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___customViewHeightConstraint);
}

void sub_10000AFB8(uint64_t *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v4 = *a1;
  v3 = a1[1];
  v5 = *(void **)(v3 + *a3);
  *(_QWORD *)(v3 + *a3) = v4;

}

id sub_10000AFCC()
{
  return objc_msgSend(objc_allocWithZone((Class)UIView), "init");
}

id sub_10000AFF0()
{
  uint64_t v0;
  id *v1;
  _BYTE v3[24];

  v1 = (id *)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customView);
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customView, v3, 0, 0);
  return *v1;
}

void sub_10000B034(void *a1)
{
  sub_10000B040(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customView);
}

void sub_10000B040(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;
  _BYTE v6[24];

  v4 = (void **)(v2 + *a2);
  swift_beginAccess(v4, v6, 1, 0);
  v5 = *v4;
  *v4 = a1;

}

void *sub_10000B08C(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customView, a1, 33, 0);
  return &j_j__swift_endAccess;
}

void *sub_10000B0D0()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10000B0DC()
{
  return sub_10000B1FC(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customViewLayoutConstraints);
}

uint64_t sub_10000B0E8(uint64_t a1)
{
  return sub_10000B24C(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customViewLayoutConstraints);
}

void *sub_10000B0F4(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customViewLayoutConstraints, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000B138()
{
  return sub_10000B1FC(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_accessoryViewLayoutConstraints);
}

uint64_t sub_10000B144(uint64_t a1)
{
  return sub_10000B24C(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_accessoryViewLayoutConstraints);
}

void *sub_10000B150(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_accessoryViewLayoutConstraints, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000B194()
{
  return sub_10000B1FC(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalViewLayoutConstraints);
}

uint64_t sub_10000B1A0(uint64_t a1)
{
  return sub_10000B24C(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalViewLayoutConstraints);
}

void *sub_10000B1AC(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalViewLayoutConstraints, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000B1F0()
{
  return sub_10000B1FC(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customViewElementLayoutConstraints);
}

uint64_t sub_10000B1FC(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  _BYTE v4[24];

  v2 = (_QWORD *)(v1 + *a1);
  swift_beginAccess(v2, v4, 0, 0);
  return swift_bridgeObjectRetain(*v2);
}

uint64_t sub_10000B240(uint64_t a1)
{
  return sub_10000B24C(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customViewElementLayoutConstraints);
}

uint64_t sub_10000B24C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  _BYTE v7[24];

  v4 = (uint64_t *)(v2 + *a2);
  swift_beginAccess(v4, v7, 1, 0);
  v5 = *v4;
  *v4 = a1;
  return swift_bridgeObjectRelease(v5);
}

void *sub_10000B298(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customViewElementLayoutConstraints, a1, 33, 0);
  return &j_j__swift_endAccess;
}

id sub_10000B2DC()
{
  return objc_msgSend((id)objc_opt_self(UIColor), "grayColor");
}

id sub_10000B314(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id *v3;
  _BYTE v5[24];

  v3 = (id *)(a1 + *a3);
  swift_beginAccess(v3, v5, 0, 0);
  return *v3;
}

void *sub_10000B358()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  _BYTE v5[24];

  v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_keyColor);
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_keyColor, v5, 0, 0);
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_10000B3B0(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
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

void sub_10000B408(void *a1)
{
  sub_10000B040(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_keyColor);
}

void *sub_10000B414(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_keyColor, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000B4D0()
{
  return sub_10000B4DC(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_associatedAppBundleIdentifier);
}

uint64_t sub_10000B4DC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  _BYTE v5[24];

  v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess(v2, v5, 0, 0);
  v3 = *v2;
  swift_bridgeObjectRetain(v2[1]);
  return v3;
}

uint64_t sub_10000B5A4(uint64_t a1, uint64_t a2)
{
  return sub_10000B5B0(a1, a2, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_associatedAppBundleIdentifier);
}

uint64_t sub_10000B5B0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;
  _BYTE v9[24];

  v6 = (_QWORD *)(v3 + *a3);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = v6[1];
  *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease(v7);
}

void *sub_10000B608(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_associatedAppBundleIdentifier, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000B64C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t sub_10000B76C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B778(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_launchURL, a1);
}

uint64_t sub_10000B778@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  _BYTE v6[24];

  v4 = v2 + *a1;
  swift_beginAccess(v4, v6, 0, 0);
  return sub_100019ED8(v4, a2, &qword_10003F098);
}

uint64_t sub_10000B8C8(uint64_t a1)
{
  return sub_10000B8D4(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_launchURL);
}

uint64_t sub_10000B8D4(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;
  _BYTE v6[24];

  v4 = v2 + *a2;
  swift_beginAccess(v4, v6, 33, 0);
  sub_100018E0C(a1, v4);
  return swift_endAccess(v6);
}

void *sub_10000B928(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_launchURL, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000B96C()
{
  return 0;
}

void sub_10000B974(char a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  unsigned __int8 *v10;
  int v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  NSString v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[24];

  v2 = a1 & 1;
  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v28 - v8;
  v10 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_countdownPaused);
  swift_beginAccess(v10, v31, 0, 0);
  v11 = *v10;
  if (v11 != v2)
  {
    v12 = sub_10001DA68();
    v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16);
    if (v11)
    {
      v14 = v13(v9, v12, v3);
      v15 = Logger.logObject.getter(v14);
      v16 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = (uint8_t *)swift_slowAlloc(12, -1);
        v18 = swift_slowAlloc(32, -1);
        v30 = v18;
        *(_DWORD *)v17 = 136315138;
        v29 = sub_1000184E8(0x776F64746E756F63, 0xEF6465737561506ELL, &v30);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30);
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "%s RPControlCenter pause", v17, 0xCu);
        swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v18, -1, -1);
        swift_slowDealloc(v17, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
      v19 = objc_msgSend((id)objc_opt_self(RPAngelConnectionManager), "sharedInstance");
      v20 = sub_100022D60();
    }
    else
    {
      v21 = v13(v7, v12, v3);
      v22 = Logger.logObject.getter(v21);
      v23 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc(12, -1);
        v25 = swift_slowAlloc(32, -1);
        v30 = v25;
        *(_DWORD *)v24 = 136315138;
        v29 = sub_1000184E8(0x776F64746E756F63, 0xEF6465737561506ELL, &v30);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30);
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "%s RPControlCenter resume", v24, 0xCu);
        swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v25, -1, -1);
        swift_slowDealloc(v24, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      v19 = objc_msgSend((id)objc_opt_self(RPAngelConnectionManager), "sharedInstance");
      v20 = sub_100022D88();
    }
    v26 = v20[1];
    swift_bridgeObjectRetain(v26);
    v27 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v26);
    objc_msgSend(v19, "countdownInterruptWithStatus:", v27);

  }
}

uint64_t sub_10000BD1C()
{
  uint64_t v0;
  unsigned __int8 *v1;
  _BYTE v3[24];

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_countdownPaused);
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_countdownPaused, v3, 0, 0);
  return *v1;
}

void sub_10000BD60(char a1)
{
  uint64_t v1;
  char *v3;
  char v4;
  _BYTE v5[24];

  v3 = (char *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_countdownPaused);
  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_countdownPaused, v5, 1, 0);
  v4 = *v3;
  *v3 = a1;
  sub_10000B974(v4);
}

void (*sub_10000BDB8(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _BYTE *v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_countdownPaused;
  v3[3] = v1;
  v3[4] = v4;
  v5 = (_BYTE *)(v1 + v4);
  swift_beginAccess(v1 + v4, v3, 1, 0);
  *((_BYTE *)v3 + 40) = *v5;
  return sub_10000BE24;
}

void sub_10000BE24(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;

  v1 = *(void **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v4 = *(_BYTE *)(*(_QWORD *)a1 + 40);
  v5 = *(_BYTE *)(v3 + v2);
  *(_BYTE *)(v3 + v2) = v4;
  sub_10000B974(v5);
  free(v1);
}

void *sub_10000BE58()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  _BYTE v5[24];

  v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_completionTimer);
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_completionTimer, v5, 0, 0);
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_10000BEA4(void *a1)
{
  sub_10000B040(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_completionTimer);
}

void *sub_10000BEB0(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_completionTimer, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000BEF4()
{
  uint64_t v0;
  unsigned __int8 *v1;
  _BYTE v3[24];

  v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_inExpandedButtonView);
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_inExpandedButtonView, v3, 0, 0);
  return *v1;
}

uint64_t sub_10000BF38(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_inExpandedButtonView);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

void *sub_10000BF80(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_inExpandedButtonView, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10000BFC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  __CFString *v9;
  __CFString *v10;
  CFPropertyListRef v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __n128 v19;
  uint64_t v20;
  CFPropertyListRef v21;
  _BYTE v22[28];
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = os_variant_allows_internal_security_policies(a1);
  if ((result & 1) != 0)
  {
    v9 = (__CFString *)String._bridgeToObjectiveC()();
    v10 = (__CFString *)String._bridgeToObjectiveC()();
    v11 = CFPreferencesCopyAppValue(v9, v10);

    if (v11)
    {
      swift_beginAccess(a2 + 16, v22, 1, 0);
      *(_BYTE *)(a2 + 16) = 1;
    }
    v12 = sub_10001DA68();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v12, v4);
    v13 = swift_retain(a2);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = swift_slowAlloc(18, -1);
      v17 = swift_slowAlloc(32, -1);
      v21 = v11;
      v18 = v17;
      v26 = v17;
      *(_DWORD *)v16 = 136315394;
      v24 = sub_1000184E8(0xD000000000000034, 0x800000010002F4B0, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25);
      *(_WORD *)(v16 + 12) = 1024;
      swift_beginAccess(a2 + 16, &v24, 0, 0);
      v23 = *(unsigned __int8 *)(a2 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24);
      swift_release(a2);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "%s hideStatusBar=%{BOOL}d", (uint8_t *)v16, 0x12u);
      swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v18, -1, -1);
      swift_slowDealloc(v16, -1, -1);

      swift_unknownObjectRelease(v21);
    }
    else
    {

      swift_unknownObjectRelease(v11);
      v19 = swift_release(a2);
    }
    return (*(uint64_t (**)(char *, uint64_t, __n128))(v5 + 8))(v7, v4, v19);
  }
  return result;
}

void sub_10000C260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD v5[2];

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)(sub_10001A1E0, a3, a1, a2, (char *)&type metadata for () + 8);
LABEL_7:
    swift_release(a3);
    return;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
      v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
    else
      v4 = _StringObject.sharedUTF8.getter(a1, a2);
    sub_10000BFC4(v4, a3);
    goto LABEL_7;
  }
  v5[0] = a1;
  v5[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  sub_10000BFC4((uint64_t)v5, a3);
  swift_release(a3);
}

void sub_10000C334()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t ObjectType;
  uint64_t ObjCClassFromMetadata;
  void *v16;
  uint64_t (*v17)(void);
  id v18;
  id v19;
  NSString v20;
  uint64_t (*v21)(void);
  id v22;
  id v23;
  NSString v24;
  uint64_t (*v25)(void);
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(_QWORD);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(void);
  _QWORD *v35;
  NSObject *v36;
  os_log_type_t v37;
  int v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(void);
  id v49;
  uint64_t (*v50)(void);
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  id v57;
  id v58;
  uint64_t (*v59)(void);
  objc_class *v60;
  id v61;
  double v62;
  id v63;
  void *v64;
  uint64_t (*v65)(void);
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  id v86;
  id v87;
  uint64_t (*v88)(void);
  void *v89;
  void *v90;
  uint64_t v91;
  id v92;
  NSString v93;
  NSString v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  NSString v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t (*v106)(void);
  uint64_t (*v107)(_QWORD);
  uint64_t (*v108)(void);
  uint64_t v109;
  void *v110;
  uint64_t (*v111)(void);
  uint64_t (*v112)(void);
  uint64_t (*v113)(_QWORD);
  uint64_t (*v114)(void);
  uint64_t v115;
  void *v116;
  uint64_t (*v117)(void);
  void *v118;
  void *v119;
  uint64_t v120;
  NSString v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t (*v134)(void);
  void *v135;
  id v136;
  uint64_t v137;
  NSString v138;
  id v139;
  id v140;
  void *v141;
  uint64_t (*v142)(void);
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t (*v149)(void);
  void *v150;
  void *v151;
  id v152;
  uint64_t v153;
  NSString v154;
  uint64_t (*v155)(void);
  uint64_t v156;
  _QWORD *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t (*v161)(void);
  void *v162;
  void *v163;
  double v164;
  void *v165;
  double v166;
  void *v167;
  void *v168;
  uint64_t v169;
  void *v170;
  void *v171;
  id v172;
  uint64_t v173;
  NSString v174;
  id v175;
  id v176;
  uint64_t v177;
  _QWORD *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t (*v182)(void);
  void *v183;
  void *v184;
  double v185;
  void *v186;
  double v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t (*v195)(void);
  void *v196;
  id v197;
  uint64_t (*v198)(void);
  void *v199;
  id v200;
  id v201;
  void *v202;
  id v203;
  id v204;
  void *v205;
  id v206;
  id v207;
  void *v208;
  id v209;
  void *v210;
  id v211;
  id v212;
  id v213;
  id v214;
  void *v215;
  id v216;
  id v217;
  id v218;
  void *v219;
  id v220;
  id v221;
  id v222;
  void *v223;
  id v224;
  id v225;
  id v226;
  void *v227;
  id v228;
  id v229;
  uint64_t (*v230)(void);
  id v231;
  void *v232;
  id v233;
  id v234;
  id v235;
  id v236;
  id v237;
  id v238;
  id v239;
  void *v240;
  id v241;
  id v242;
  uint64_t (*v243)(void);
  void *v244;
  id v245;
  id v246;
  id v247;
  void *v248;
  id v249;
  id v250;
  id v251;
  void *v252;
  id v253;
  void *v254;
  id v255;
  double v256;
  id v257;
  objc_class *v258;
  id v259;
  uint64_t (*v260)(void);
  void *v261;
  id v262;
  id v263;
  id v264;
  void *v265;
  id v266;
  id v267;
  id v268;
  void *v269;
  id v270;
  id v271;
  uint64_t (*v272)(void);
  void *v273;
  id v274;
  void *v275;
  id v276;
  id v277;
  void *v278;
  id v279;
  id v280;
  void *v281;
  id v282;
  void *v283;
  id v284;
  id v285;
  uint64_t (*v286)(void);
  void *v287;
  id v288;
  void *v289;
  id v290;
  id v291;
  void *v292;
  id v293;
  void *v294;
  id v295;
  id v296;
  void *v297;
  id v298;
  void *v299;
  id v300;
  id v301;
  uint64_t (*v302)(void);
  void *v303;
  id v304;
  void *v305;
  id v306;
  id v307;
  void *v308;
  id v309;
  void *v310;
  id v311;
  id v312;
  void *v313;
  id v314;
  void *v315;
  id v316;
  id v317;
  void *v318;
  uint64_t v319;
  Class isa;
  id v321;
  void *v322;
  void *v323;
  id v324;
  id v325;
  double *v326;
  uint64_t (*v327)(void);
  uint64_t (*v328)(void);
  objc_class *v329;
  uint64_t (*v330)(void);
  uint64_t (*v331)(void);
  uint64_t (*v332)(void);
  uint64_t (*v333)(void);
  uint64_t (*v334)(void);
  uint64_t (*v335)(void);
  uint64_t (*v336)(void);
  id v337;
  id v338;
  objc_super v339;
  uint64_t v340;
  uint64_t v341[2];

  v1 = v0;
  v2 = type metadata accessor for UIButton.Configuration(0);
  __chkstk_darwin(v2);
  v4 = (uint64_t (*)(void))((char *)&v324 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v324 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = *(void **)((char *)v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingView);
  if (v11)
  {
    v12 = *(void **)((char *)v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView);
    if (v12)
    {
      v13 = *(void **)((char *)v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalView);
      if (v13)
      {
        v334 = v4;
        v335 = (uint64_t (*)(void))((char *)&v324 - v10);
        ObjectType = swift_getObjectType(v1);
        ObjCClassFromMetadata = swift_getObjCClassFromMetadata(ObjectType);
        v16 = (void *)objc_opt_self(NSBundle);
        v337 = v11;
        v338 = v12;
        v17 = v13;
        v18 = objc_msgSend(v16, "bundleForClass:", ObjCClassFromMetadata);
        v19 = objc_allocWithZone((Class)BSUICAPackageView);
        v20 = String._bridgeToObjectiveC()();
        v21 = (uint64_t (*)(void))objc_msgSend(v19, "initWithPackageName:inBundle:", v20, v18);

        if (v21)
        {
          v333 = v21;
          v336 = v17;
          v22 = objc_msgSend(v16, "bundleForClass:", ObjCClassFromMetadata);
          v23 = objc_allocWithZone((Class)BSUICAPackageView);
          v24 = String._bridgeToObjectiveC()();
          v25 = (uint64_t (*)(void))objc_msgSend(v23, "initWithPackageName:inBundle:", v24, v22);

          if (v25)
          {
            v330 = v25;
            v26 = sub_10001AAA8();
            v27 = *v26;
            v28 = *(uint64_t (**)(_QWORD))(*(_QWORD *)*v26 + 128);
            v29 = swift_retain(*v26);
            v30 = v28(v29);
            v32 = v31;
            swift_release(v27);
            (*(void (**)(uint64_t, uint64_t))((swift_isaMask & *v1) + 0x208))(v30, v32);
            v33 = sub_10001DA68();
            v34 = v335;
            (*(void (**)(uint64_t (*)(void), uint64_t, uint64_t))(v6 + 16))(v335, v33, v5);
            v35 = v1;
            v36 = Logger.logObject.getter(v35);
            v37 = static os_log_type_t.default.getter();
            v38 = v37;
            v39 = os_log_type_enabled(v36, v37);
            v332 = v16;
            if (v39)
            {
              v40 = swift_slowAlloc(32, -1);
              LODWORD(v329) = v38;
              v41 = v40;
              v42 = (_QWORD *)swift_slowAlloc(8, -1);
              v331 = (uint64_t (*)(void))swift_slowAlloc(64, -1);
              v341[0] = (uint64_t)v331;
              *(_DWORD *)v41 = 136315650;
              v340 = sub_1000184E8(0x4C64694477656976, 0xED0000292864616FLL, v341);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v340, v341);
              *(_WORD *)(v41 + 12) = 2112;
              v340 = (uint64_t)v35;
              v43 = v35;
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v340, v341);
              *v42 = v35;

              *(_WORD *)(v41 + 22) = 2080;
              v44 = (*(uint64_t (**)(void))((swift_isaMask & *v43) + 0x200))();
              if (v45)
              {
                v46 = v45;
              }
              else
              {
                v44 = 1819047246;
                v46 = 0xE400000000000000;
              }
              v340 = sub_1000184E8(v44, v46, v341);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v340, v341);

              swift_bridgeObjectRelease(v46);
              _os_log_impl((void *)&_mh_execute_header, v36, (os_log_type_t)v329, "%s self=%@ sessionID=%s", (uint8_t *)v41, 0x20u);
              v47 = sub_100018DCC(&qword_10003F0C0);
              swift_arrayDestroy(v42, 1, v47);
              swift_slowDealloc(v42, -1, -1);
              v48 = v331;
              swift_arrayDestroy(v331, 2, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v48, -1, -1);
              swift_slowDealloc(v41, -1, -1);

              (*(void (**)(uint64_t (*)(void), uint64_t))(v6 + 8))(v335, v5);
            }
            else
            {

              (*(void (**)(uint64_t (*)(void), uint64_t))(v6 + 8))(v34, v5);
            }
            v58 = v337;
            v57 = v338;
            v59 = v336;
            v60 = (objc_class *)type metadata accessor for RPSystemApertureElementViewController(0);
            v339.receiver = v35;
            v339.super_class = v60;
            v329 = v60;
            v61 = objc_msgSendSuper2(&v339, "viewDidLoad");
            v62 = SBUISystemApertureControlEdgeSpacing(v61);
            v63 = objc_msgSend(v35, "view");
            if (v63)
            {
              v64 = v63;
              objc_msgSend(v63, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

              v65 = *(uint64_t (**)(void))((swift_isaMask & *v35) + 0x350);
              v66 = (void *)v65();
              objc_msgSend(v66, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

              objc_msgSend(v58, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
              objc_msgSend(v57, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
              objc_msgSend(v59, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
              v67 = objc_msgSend(v35, "view");
              if (v67)
              {
                v68 = v67;
                v69 = (void *)v65();
                objc_msgSend(v68, "addSubview:", v69);

                v70 = objc_msgSend(v35, "view");
                if (v70)
                {
                  v71 = v70;
                  objc_msgSend(v70, "addSubview:", v58);

                  v72 = objc_msgSend(v35, "view");
                  if (v72)
                  {
                    v73 = v72;
                    objc_msgSend(v72, "addSubview:", v57);

                    v74 = objc_msgSend(v35, "view");
                    if (v74)
                    {
                      v75 = v74;
                      objc_msgSend(v74, "addSubview:", v59);

                      v76 = (void *)v65();
                      v77 = objc_msgSend(v76, "centerXAnchor");

                      v78 = objc_msgSend(v35, "view");
                      if (v78)
                      {
                        v79 = v78;
                        v80 = objc_msgSend(v78, "centerXAnchor");

                        v81 = objc_msgSend(v77, "constraintEqualToAnchor:", v80);
                        objc_msgSend(v81, "setActive:", 1);

                        v82 = (void *)v65();
                        v83 = objc_msgSend(v82, "topAnchor");

                        v84 = objc_msgSend(v35, "view");
                        if (v84)
                        {
                          v85 = v84;
                          v86 = objc_msgSend(v84, "topAnchor");

                          v87 = objc_msgSend(v83, "constraintEqualToAnchor:", v86);
                          objc_msgSend(v87, "setActive:", 1);

                          v88 = *(uint64_t (**)(void))((swift_isaMask & *v35) + 0x320);
                          v89 = (void *)v88();
                          objc_msgSend(v89, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

                          v90 = (void *)v88();
                          v91 = swift_getObjCClassFromMetadata(v329);
                          v92 = objc_msgSend(v332, "bundleForClass:", v91);
                          v93 = String._bridgeToObjectiveC()();
                          v94 = String._bridgeToObjectiveC()();
                          v95 = objc_msgSend(v92, "localizedStringForKey:value:table:", v93, 0, v94);

                          static String._unconditionallyBridgeFromObjectiveC(_:)(v95, v96);
                          v98 = v97;

                          v99 = String._bridgeToObjectiveC()();
                          swift_bridgeObjectRelease(v98);
                          objc_msgSend(v90, "setAccessibilityLabel:", v99);

                          v100 = (void *)v88();
                          objc_msgSend(v100, "addTarget:action:forControlEvents:", v35, "stopButtonTapped", 64);

                          v101 = (void *)v88();
                          v102 = objc_msgSend(v101, "layer");

                          objc_msgSend(v102, "setHitTestsAsOpaque:", 1);
                          v103 = (void *)v65();
                          v104 = v88();
                          v331 = v88;
                          v105 = (void *)v104;
                          objc_msgSend(v103, "addSubview:", v104);

                          v106 = v333;
                          objc_msgSend(v333, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
                          objc_msgSend(v106, "setUserInteractionEnabled:", 0);
                          v107 = *(uint64_t (**)(_QWORD))((swift_isaMask & *v35) + 0x268);
                          v108 = v106;
                          v332 = v108;
                          v109 = v107(v106);
                          v110 = (void *)((uint64_t (*)(uint64_t))v88)(v109);
                          objc_msgSend(v110, "addSubview:", v108);

                          v111 = v330;
                          objc_msgSend(v330, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
                          v112 = v111;
                          objc_msgSend(v112, "setAlpha:", *(double *)sub_100022CB4());

                          objc_msgSend(v112, "setUserInteractionEnabled:", 0);
                          v113 = *(uint64_t (**)(_QWORD))((swift_isaMask & *v35) + 0x280);
                          v114 = v112;
                          v333 = v114;
                          v115 = v113(v111);
                          v116 = (void *)((uint64_t (*)(uint64_t))v65)(v115);
                          objc_msgSend(v116, "addSubview:", v114);

                          v117 = *(uint64_t (**)(void))((swift_isaMask & *v35) + 0x248);
                          v118 = (void *)v117();
                          objc_msgSend(v118, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

                          v119 = (void *)v117();
                          v120 = *((_QWORD *)sub_100022F50() + 1);
                          swift_bridgeObjectRetain(v120);
                          v121 = String._bridgeToObjectiveC()();
                          swift_bridgeObjectRelease(v120);
                          objc_msgSend(v119, "setText:", v121);

                          v122 = (void *)v117();
                          v123 = (void *)objc_opt_self(UIFont);
                          v124 = objc_msgSend(v123, "systemFontOfSize:weight:", *(double *)sub_100023044(), UIFontWeightMedium);
                          objc_msgSend(v122, "setFont:", v124);

                          v125 = (void *)v117();
                          objc_msgSend(v125, "setTextColor:", *sub_100022FC4());

                          v126 = (void *)v117();
                          objc_msgSend(v126, "setHidden:", 1);

                          v127 = (void *)v117();
                          objc_msgSend(v127, "sizeToFit");

                          v128 = (void *)v117();
                          v328 = v117;
                          v129 = v128;
                          v130 = objc_msgSend(v128, "layer");

                          objc_msgSend(v130, "setAllowsHitTesting:", 0);
                          v131 = (void *)v65();
                          v132 = (void *)v117();
                          objc_msgSend(v131, "addSubview:", v132);

                          v133 = *(void **)((char *)v35
                                          + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_screenRecordingLabel);
                          objc_msgSend(v133, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
                          v134 = v65;
                          v135 = (void *)objc_opt_self(UIColor);
                          v136 = objc_msgSend(v135, "whiteColor");
                          objc_msgSend(v133, "setTextColor:", v136);

                          v137 = sub_100022E70()[1];
                          swift_bridgeObjectRetain(v137);
                          v138 = String._bridgeToObjectiveC()();
                          swift_bridgeObjectRelease(v137);
                          objc_msgSend(v133, "setText:", v138);

                          v139 = objc_msgSend(v123, "systemFontOfSize:weight:", *(double *)sub_100022EE8(), UIFontWeightMedium);
                          objc_msgSend(v133, "setFont:", v139);

                          objc_msgSend(v133, "sizeToFit");
                          objc_msgSend(v133, "setHidden:", 1);
                          v329 = (objc_class *)v133;
                          v140 = objc_msgSend(v133, "layer");
                          objc_msgSend(v140, "setAllowsHitTesting:", 0);

                          v335 = v134;
                          v141 = (void *)v134();
                          objc_msgSend(v141, "addSubview:", v133);

                          v142 = *(uint64_t (**)(void))((swift_isaMask & *v35) + 0x2A8);
                          v143 = (void *)v142();
                          objc_msgSend(v143, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

                          v144 = (void *)v142();
                          objc_msgSend(v144, "setAxis:", 0);

                          v145 = (void *)v142();
                          SBUISystemApertureInterItemSpacing();
                          objc_msgSend(v145, "setSpacing:");

                          v146 = (void *)v142();
                          objc_msgSend(v146, "setAlignment:", 3);

                          v147 = (void *)v142();
                          objc_msgSend(v147, "setHidden:", 1);

                          v148 = (void *)v134();
                          v149 = v142;
                          v150 = (void *)v142();
                          objc_msgSend(v148, "addSubview:", v150);

                          v151 = (void *)objc_opt_self(UIButtonConfiguration);
                          v152 = objc_msgSend(v151, "sbui_systemApertureTextButtonConfiguration");
                          v153 = sub_100023348()[1];
                          swift_bridgeObjectRetain(v153);
                          v154 = String._bridgeToObjectiveC()();
                          swift_bridgeObjectRelease(v153);
                          objc_msgSend(v152, "setTitle:", v154);

                          sub_10001A208(0, (unint64_t *)&unk_10003F0A0, SBUISystemApertureButton_ptr);
                          v155 = v334;
                          v325 = v152;
                          static UIButton.Configuration._unconditionallyBridgeFromObjectiveC(_:)(v152);
                          sub_10001A208(0, (unint64_t *)&unk_10003F0A8, UIAction_ptr);
                          v156 = swift_allocObject(&unk_100034FA8, 24, 7);
                          *(_QWORD *)(v156 + 16) = v35;
                          v157 = v35;
                          v158 = UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_100018E90, v156);
                          v159 = UIButton.init(configuration:primaryAction:)(v155, v158);
                          v160 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v157) + 0x2C8))(v159);
                          v161 = *(uint64_t (**)(void))((swift_isaMask & *v157) + 0x2C0);
                          v162 = (void *)((uint64_t (*)(uint64_t))v161)(v160);
                          objc_msgSend(v162, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

                          v163 = (void *)v161();
                          LODWORD(v164) = 1148846080;
                          objc_msgSend(v163, "setContentHuggingPriority:forAxis:", 0, v164);

                          v165 = (void *)v161();
                          LODWORD(v166) = 1148846080;
                          objc_msgSend(v165, "setContentCompressionResistancePriority:forAxis:", 0, v166);

                          v167 = (void *)v161();
                          v330 = v161;
                          v168 = v167;
                          objc_msgSend(v167, "setEnabled:", 0);

                          v169 = v149();
                          v327 = v149;
                          v170 = (void *)v169;
                          v171 = (void *)v161();
                          objc_msgSend(v170, "addArrangedSubview:", v171);

                          v172 = objc_msgSend(v151, "sbui_systemApertureTextButtonConfiguration");
                          v173 = sub_100023468()[1];
                          swift_bridgeObjectRetain(v173);
                          v174 = String._bridgeToObjectiveC()();
                          swift_bridgeObjectRelease(v173);
                          objc_msgSend(v172, "setTitle:", v174);

                          v175 = objc_msgSend(v135, "redColor");
                          objc_msgSend(v172, "setBaseBackgroundColor:", v175);

                          v176 = objc_msgSend(v135, "redColor");
                          objc_msgSend(v172, "setBaseForegroundColor:", v176);

                          v324 = v172;
                          static UIButton.Configuration._unconditionallyBridgeFromObjectiveC(_:)(v172);
                          v177 = swift_allocObject(&unk_100034FD0, 24, 7);
                          *(_QWORD *)(v177 + 16) = v157;
                          v178 = v157;
                          v179 = UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_100018EB0, v177);
                          v180 = UIButton.init(configuration:primaryAction:)(v155, v179);
                          v181 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v178) + 0x2E0))(v180);
                          v182 = *(uint64_t (**)(void))((swift_isaMask & *v178) + 0x2D8);
                          v183 = (void *)((uint64_t (*)(uint64_t))v182)(v181);
                          objc_msgSend(v183, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

                          v184 = (void *)v182();
                          LODWORD(v185) = 1148846080;
                          objc_msgSend(v184, "setContentHuggingPriority:forAxis:", 0, v185);

                          v186 = (void *)v182();
                          LODWORD(v187) = 1148846080;
                          objc_msgSend(v186, "setContentCompressionResistancePriority:forAxis:", 0, v187);

                          v188 = (void *)v182();
                          objc_msgSend(v188, "setEnabled:", 0);

                          v189 = (void *)v182();
                          v334 = v182;
                          v190 = v189;
                          objc_msgSend(v189, "setRole:", 3);

                          v191 = (void *)v149();
                          v192 = (void *)v182();
                          objc_msgSend(v191, "addArrangedSubview:", v192);

                          v193 = sub_100018DCC((uint64_t *)&unk_10003F0B0);
                          v194 = swift_allocObject(v193, 248, 7);
                          *(_OWORD *)(v194 + 16) = xmmword_1000277D0;
                          v195 = v331;
                          v196 = (void *)v331();
                          v197 = objc_msgSend(v196, "topAnchor");

                          v198 = v335;
                          v199 = (void *)v335();
                          v200 = objc_msgSend(v199, "topAnchor");

                          v201 = objc_msgSend(v197, "constraintEqualToAnchor:constant:", v200, *(double *)sub_100022F28());
                          *(_QWORD *)(v194 + 32) = v201;
                          v202 = (void *)v195();
                          v203 = objc_msgSend(v202, "widthAnchor");

                          v204 = objc_msgSend(v203, "constraintEqualToConstant:", *(double *)sub_100022F04());
                          *(_QWORD *)(v194 + 40) = v204;
                          v205 = (void *)v195();
                          v206 = objc_msgSend(v205, "heightAnchor");

                          v207 = objc_msgSend(v206, "constraintEqualToConstant:", *(double *)sub_100022F1C());
                          *(_QWORD *)(v194 + 48) = v207;
                          v208 = (void *)v195();
                          v209 = objc_msgSend(v208, "trailingAnchor");

                          v210 = (void *)v198();
                          v211 = objc_msgSend(v210, "trailingAnchor");

                          v212 = objc_msgSend(v209, "constraintEqualToAnchor:constant:", v211, -*(double *)sub_100022F3C());
                          *(_QWORD *)(v194 + 56) = v212;
                          v213 = v332;
                          v214 = objc_msgSend(v332, "trailingAnchor");
                          v215 = (void *)v195();
                          v216 = objc_msgSend(v215, "trailingAnchor");

                          v217 = objc_msgSend(v214, "constraintEqualToAnchor:", v216);
                          *(_QWORD *)(v194 + 64) = v217;
                          v218 = objc_msgSend(v213, "topAnchor");
                          v219 = (void *)v195();
                          v220 = objc_msgSend(v219, "topAnchor");

                          v221 = objc_msgSend(v218, "constraintEqualToAnchor:", v220);
                          *(_QWORD *)(v194 + 72) = v221;
                          v222 = objc_msgSend(v213, "leadingAnchor");
                          v223 = (void *)v195();
                          v224 = objc_msgSend(v223, "leadingAnchor");

                          v225 = objc_msgSend(v222, "constraintEqualToAnchor:", v224);
                          *(_QWORD *)(v194 + 80) = v225;
                          v226 = objc_msgSend(v213, "bottomAnchor");
                          v227 = (void *)v195();
                          v228 = objc_msgSend(v227, "bottomAnchor");

                          v229 = objc_msgSend(v226, "constraintEqualToAnchor:", v228);
                          *(_QWORD *)(v194 + 88) = v229;
                          v230 = v333;
                          v231 = objc_msgSend(v333, "topAnchor");
                          v232 = (void *)v198();
                          v233 = objc_msgSend(v232, "topAnchor");

                          v234 = objc_msgSend(v231, "constraintEqualToAnchor:constant:", v233, *(double *)sub_100022DCC());
                          *(_QWORD *)(v194 + 96) = v234;
                          v235 = objc_msgSend(v230, "widthAnchor");
                          v236 = objc_msgSend(v235, "constraintEqualToConstant:", *(double *)sub_100023050());

                          *(_QWORD *)(v194 + 104) = v236;
                          v237 = objc_msgSend(v230, "heightAnchor");
                          v238 = objc_msgSend(v237, "constraintEqualToConstant:", *(double *)sub_10002305C());

                          *(_QWORD *)(v194 + 112) = v238;
                          v239 = objc_msgSend(v230, "leadingAnchor");
                          v240 = (void *)v198();
                          v241 = objc_msgSend(v240, "leadingAnchor");

                          v326 = (double *)sub_100022DB0();
                          v242 = objc_msgSend(v239, "constraintEqualToAnchor:constant:", v241, *v326);

                          *(_QWORD *)(v194 + 120) = v242;
                          v243 = v328;
                          v244 = (void *)v328();
                          v245 = objc_msgSend(v244, "centerYAnchor");

                          v246 = objc_msgSend(v230, "centerYAnchor");
                          v247 = objc_msgSend(v245, "constraintEqualToAnchor:", v246);

                          *(_QWORD *)(v194 + 128) = v247;
                          v248 = (void *)v243();
                          v249 = objc_msgSend(v248, "leadingAnchor");

                          v250 = objc_msgSend(v230, "trailingAnchor");
                          v251 = objc_msgSend(v249, "constraintEqualToAnchor:constant:", v250, *(double *)sub_100022DE8());

                          *(_QWORD *)(v194 + 136) = v251;
                          v252 = (void *)v243();
                          v253 = objc_msgSend(v252, "trailingAnchor");

                          v254 = (void *)v195();
                          v255 = objc_msgSend(v254, "leadingAnchor");

                          v256 = -v62;
                          v257 = objc_msgSend(v253, "constraintEqualToAnchor:constant:", v255, v256);

                          *(_QWORD *)(v194 + 144) = v257;
                          v258 = v329;
                          v259 = -[objc_class bottomAnchor](v329, "bottomAnchor");
                          v260 = v335;
                          v261 = (void *)v335();
                          v262 = objc_msgSend(v261, "topAnchor");

                          v263 = objc_msgSend(v259, "constraintEqualToAnchor:constant:", v262, *(double *)sub_100022ED0());
                          *(_QWORD *)(v194 + 152) = v263;
                          v264 = -[objc_class leadingAnchor](v258, "leadingAnchor");
                          v265 = (void *)v260();
                          v266 = objc_msgSend(v265, "leadingAnchor");

                          v267 = objc_msgSend(v264, "constraintEqualToAnchor:constant:", v266, *v326);
                          *(_QWORD *)(v194 + 160) = v267;
                          v268 = -[objc_class trailingAnchor](v258, "trailingAnchor");
                          v269 = (void *)v195();
                          v270 = objc_msgSend(v269, "leadingAnchor");

                          v271 = objc_msgSend(v268, "constraintEqualToAnchor:constant:", v270, v256);
                          *(_QWORD *)(v194 + 168) = v271;
                          v272 = v327;
                          v273 = (void *)v327();
                          v274 = objc_msgSend(v273, "centerXAnchor");

                          v275 = (void *)v260();
                          v276 = objc_msgSend(v275, "centerXAnchor");

                          v277 = objc_msgSend(v274, "constraintEqualToAnchor:", v276);
                          *(_QWORD *)(v194 + 176) = v277;
                          v278 = (void *)v272();
                          v279 = objc_msgSend(v278, "widthAnchor");

                          v280 = objc_msgSend(v279, "constraintEqualToConstant:", *(double *)sub_1000234DC());
                          *(_QWORD *)(v194 + 184) = v280;
                          v281 = (void *)v272();
                          v282 = objc_msgSend(v281, "topAnchor");

                          v283 = (void *)v195();
                          v284 = objc_msgSend(v283, "bottomAnchor");

                          v285 = objc_msgSend(v282, "constraintEqualToAnchor:constant:", v284, *(double *)sub_1000234C8());
                          *(_QWORD *)(v194 + 192) = v285;
                          v286 = v330;
                          v287 = (void *)v330();
                          v288 = objc_msgSend(v287, "bottomAnchor");

                          v289 = (void *)v272();
                          v290 = objc_msgSend(v289, "bottomAnchor");

                          v291 = objc_msgSend(v288, "constraintEqualToAnchor:", v290);
                          *(_QWORD *)(v194 + 200) = v291;
                          v292 = (void *)v286();
                          v293 = objc_msgSend(v292, "topAnchor");

                          v294 = (void *)v272();
                          v295 = objc_msgSend(v294, "topAnchor");

                          v296 = objc_msgSend(v293, "constraintEqualToAnchor:", v295);
                          *(_QWORD *)(v194 + 208) = v296;
                          v297 = (void *)v286();
                          v298 = objc_msgSend(v297, "leadingAnchor");

                          v299 = (void *)v272();
                          v300 = objc_msgSend(v299, "leadingAnchor");

                          v301 = objc_msgSend(v298, "constraintEqualToAnchor:", v300);
                          *(_QWORD *)(v194 + 216) = v301;
                          v302 = v334;
                          v303 = (void *)v334();
                          v304 = objc_msgSend(v303, "bottomAnchor");

                          v305 = (void *)v272();
                          v306 = objc_msgSend(v305, "bottomAnchor");

                          v307 = objc_msgSend(v304, "constraintEqualToAnchor:", v306);
                          *(_QWORD *)(v194 + 224) = v307;
                          v308 = (void *)v302();
                          v309 = objc_msgSend(v308, "topAnchor");

                          v310 = (void *)v272();
                          v311 = objc_msgSend(v310, "topAnchor");

                          v312 = objc_msgSend(v309, "constraintEqualToAnchor:", v311);
                          *(_QWORD *)(v194 + 232) = v312;
                          v313 = (void *)v302();
                          v314 = objc_msgSend(v313, "trailingAnchor");

                          v315 = (void *)v272();
                          v316 = objc_msgSend(v315, "trailingAnchor");

                          v317 = objc_msgSend(v314, "constraintEqualToAnchor:", v316);
                          *(_QWORD *)(v194 + 240) = v317;
                          v341[0] = v194;
                          specialized Array._endMutation()();
                          (*(void (**)(uint64_t))((swift_isaMask & *v178) + 0x3B8))(v341[0]);
                          v318 = (void *)objc_opt_self(NSLayoutConstraint);
                          v319 = (*(uint64_t (**)(void))((swift_isaMask & *v178) + 0x3B0))();
                          sub_10001A208(0, (unint64_t *)&qword_10003F6A0, NSLayoutConstraint_ptr);
                          isa = Array._bridgeToObjectiveC()().super.isa;
                          swift_bridgeObjectRelease(v319);
                          objc_msgSend(v318, "activateConstraints:", isa);

                          v321 = objc_msgSend(v178, "view");
                          if (v321)
                          {
                            v322 = v321;
                            v323 = (void *)v331();
                            objc_msgSend(v322, "bringSubviewToFront:", v323);

                            return;
                          }
                          goto LABEL_34;
                        }
LABEL_33:
                        __break(1u);
LABEL_34:
                        __break(1u);
                        return;
                      }
LABEL_32:
                      __break(1u);
                      goto LABEL_33;
                    }
LABEL_31:
                    __break(1u);
                    goto LABEL_32;
                  }
LABEL_30:
                  __break(1u);
                  goto LABEL_31;
                }
LABEL_29:
                __break(1u);
                goto LABEL_30;
              }
            }
            else
            {
              __break(1u);
            }
            __break(1u);
            goto LABEL_29;
          }

          v49 = v338;
          v50 = v336;
          v17 = v333;
        }
        else
        {
          v49 = v337;
          v50 = v338;
        }

      }
    }
  }
  v51 = sub_10001DA68();
  v52 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v51, v5);
  v53 = Logger.logObject.getter(v52);
  v54 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v53, v54))
  {
    v55 = (uint8_t *)swift_slowAlloc(12, -1);
    v56 = swift_slowAlloc(32, -1);
    v341[0] = v56;
    *(_DWORD *)v55 = 136315138;
    v340 = sub_1000184E8(0x4C64694477656976, 0xED0000292864616FLL, v341);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v340, v341);
    _os_log_impl((void *)&_mh_execute_header, v53, v54, "%s error loading sub views", v55, 0xCu);
    swift_arrayDestroy(v56, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v56, -1, -1);
    swift_slowDealloc(v55, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

void sub_10000E444()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_10001DA68();
  v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v15 = v11;
    *(_DWORD *)v10 = 136315138;
    v14 = sub_1000184E8(0xD000000000000020, 0x800000010002EAF0, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }

  v12 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v13 = (char *)sub_10000E60C
      + 4 * byte_100027850[(*(unsigned __int8 (**)(uint64_t))((swift_isaMask & *v1) + 0x290))(v12)];
  __asm { BR              X10 }
}

id sub_10000E60C()
{
  char v0;
  id result;

  v0 = _stringCompareWithSmolCheck(_:_:expecting:)(0x776F64746E756F63, 0xEA0000000000336ELL, 0x506F546465766173, 0xED0000736F746F68, 0);
  result = (id)swift_bridgeObjectRelease(0xEA0000000000336ELL);
  if ((v0 & 1) != 0)
    return sub_100015400();
  return result;
}

void sub_10000E758(void *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t (*v10)(void);
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  void **v36;
  id v37;
  void **aBlock;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void *v41;
  void *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void **)((char *)v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingView);
  if (v7)
  {
    v8 = *(void **)((char *)v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView);
    if (v8)
    {
      v9 = *(void **)((char *)v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalView);
      if (v9)
      {
        v37 = a1;
        v10 = *(uint64_t (**)(void))((swift_isaMask & *v1) + 0x278);
        v11 = v7;
        v12 = v8;
        v13 = v9;
        v14 = v10();
        if (v14)
        {
          v15 = (void *)v14;
          v16 = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x260))();
          if (v16)
          {
            v17 = (void *)v16;
            v18 = (_QWORD *)swift_allocObject(&unk_100034FF8, 64, 7);
            v18[2] = v1;
            v18[3] = v17;
            v18[4] = v15;
            v18[5] = v13;
            v18[6] = v11;
            v18[7] = v12;
            v42 = sub_100018F1C;
            v43 = v18;
            aBlock = _NSConcreteStackBlock;
            v39 = 1107296256;
            v40 = sub_1000108CC;
            v41 = &unk_100035010;
            v19 = _Block_copy(&aBlock);
            v20 = v43;
            v21 = v11;
            v22 = v12;
            v23 = v13;
            v24 = v1;
            v25 = v17;
            v26 = v15;
            swift_release(v20);
            v27 = swift_allocObject(&unk_100035048, 24, 7);
            *(_QWORD *)(v27 + 16) = v24;
            v42 = sub_100018F2C;
            v43 = (_QWORD *)v27;
            aBlock = _NSConcreteStackBlock;
            v39 = 1107296256;
            v40 = sub_1000108CC;
            v41 = &unk_100035060;
            v28 = _Block_copy(&aBlock);
            v29 = v43;
            v30 = v24;
            swift_release(v29);
            objc_msgSend(v37, "animateAlongsideTransition:completion:", v19, v28);
            _Block_release(v28);
            _Block_release(v19);

            return;
          }

          v11 = v12;
          v12 = v13;
          v13 = v15;
        }

      }
    }
  }
  v31 = sub_10001DA68();
  v32 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v31, v3);
  v33 = Logger.logObject.getter(v32);
  v34 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc(12, -1);
    v36 = (void **)swift_slowAlloc(32, -1);
    aBlock = v36;
    *(_DWORD *)v35 = 136315138;
    v44 = sub_1000184E8(0xD00000000000001DLL, 0x800000010002EB20, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45);
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "%s error loading sub views", v35, 0xCu);
    swift_arrayDestroy(v36, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v36, -1, -1);
    swift_slowDealloc(v35, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_10000EAEC(_QWORD *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);
  char *v13;
  char *v14;
  id v15;
  char *v16;
  id v17;
  id v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  Class isa;
  uint64_t v24;
  Class v25;
  uint64_t (*v26)(void);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t (*v35)(void);
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  double v55;
  void *v56;
  char *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  uint64_t v70;
  id v71;
  void *v72;
  unsigned __int8 v73;
  uint64_t v74;
  Class v75;
  uint64_t v78;
  void *v79;
  _QWORD *v80;
  CGRect v81;

  v78 = type metadata accessor for Logger(0);
  v10 = __chkstk_darwin(v78);
  v11 = __chkstk_darwin(v10);
  v12 = *(uint64_t (**)(void))((swift_isaMask & *a1) + 0x170);
  v80 = a1;
  if (((uint64_t (*)(uint64_t))v12)(v11) == 4)
  {
    v13 = (char *)&loc_10000EBF0 + dword_10001081C[(*(unsigned __int8 (**)(void))((swift_isaMask & *a1) + 0x290))()];
    __asm { BR              X10 }
  }
  switch(v12())
  {
    case 1:
      v14 = (char *)&loc_10000EF00 + dword_10001084C[(*(unsigned __int8 (**)(void))((swift_isaMask & *a1) + 0x290))()];
      __asm { BR              X10 }
      return;
    case 2:
      v15 = objc_msgSend(a4, "setHidden:", 0);
      v16 = (char *)&loc_10000EF78
          + dword_1000108AC[(*(unsigned __int8 (**)(id))((swift_isaMask & *a1) + 0x290))(v15)];
      __asm { BR              X10 }
      return;
    case 3:
      v17 = objc_msgSend(a1, "systemApertureElementContext");
      v18 = objc_msgSend(v17, "transitionContext");
      swift_unknownObjectRelease(v17);
      if (v18)
      {
        objc_msgSend(v18, "isUserInitiated");

      }
      v57 = (char *)&loc_10000F458
          + dword_10001086C[(*(unsigned __int8 (**)(void))((swift_isaMask & *v80) + 0x290))()];
      __asm { BR              X10 }
      return;
    case 4:
      sub_100010CB4();
      if ((v19 & 1) != 0)
      {
        (*(void (**)(uint64_t))((swift_isaMask & *a1) + 0x418))(1);
      }
      else
      {
        v20 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *a1) + 0x248))();
        objc_msgSend(v20, "setHidden:", 0);

        objc_msgSend(a3, "setHidden:", 0);
      }
      objc_msgSend(a4, "setHidden:", 1);
      objc_msgSend(a5, "setHidden:", 1);
      objc_msgSend(a6, "setHidden:", 1);
      objc_msgSend(a2, "setHidden:", 0);
      objc_msgSend(*(id *)((char *)v80+ OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_screenRecordingLabel), "setHidden:", 0);
      v21 = (void *)objc_opt_self(NSLayoutConstraint);
      v22 = (*(uint64_t (**)(void))((swift_isaMask & *v80) + 0x380))();
      sub_10001A208(0, (unint64_t *)&qword_10003F6A0, NSLayoutConstraint_ptr);
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v22);
      objc_msgSend(v21, "deactivateConstraints:", isa);

      v24 = (*(uint64_t (**)(void))((swift_isaMask & *v80) + 0x398))();
      v25 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v24);
      objc_msgSend(v21, "deactivateConstraints:", v25);

      v26 = *(uint64_t (**)(void))((swift_isaMask & *v80) + 0x368);
      v27 = v26();
      v28 = sub_100018428(v27);
      v29 = swift_bridgeObjectRelease(v27);
      if (v28)
        goto LABEL_23;
      v79 = v21;
      v30 = sub_100018DCC((uint64_t *)&unk_10003F0B0);
      v31 = swift_allocObject(v30, 64, 7);
      *(_OWORD *)(v31 + 16) = xmmword_1000277F0;
      v32 = objc_msgSend(v80, "view");
      if (!v32)
        goto LABEL_36;
      v33 = v32;
      v34 = objc_msgSend(v32, "widthAnchor");

      v35 = *(uint64_t (**)(void))((swift_isaMask & *v80) + 0x350);
      v36 = (void *)v35();
      v37 = objc_msgSend(v36, "widthAnchor");

      v38 = objc_msgSend(v34, "constraintEqualToAnchor:", v37);
      *(_QWORD *)(v31 + 32) = v38;
      v39 = objc_msgSend(v80, "view");
      if (!v39)
        goto LABEL_37;
      v40 = v39;
      v41 = objc_msgSend(v39, "heightAnchor");

      v42 = (void *)v35();
      v43 = objc_msgSend(v42, "heightAnchor");

      v44 = objc_msgSend(v41, "constraintEqualToAnchor:", v43);
      *(_QWORD *)(v31 + 40) = v44;
      v45 = (void *)v35();
      v46 = objc_msgSend(v45, "widthAnchor");

      v47 = objc_msgSend(v46, "constraintEqualToConstant:", *(double *)sub_100022C18());
      *(_QWORD *)(v31 + 48) = v47;
      *(_QWORD *)(v31 + 56) = (*(uint64_t (**)(void))((swift_isaMask & *v80) + 0x338))();
      specialized Array._endMutation()();
      v48 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v80) + 0x370))(v31);
      v49 = ((uint64_t (*)(uint64_t))v26)(v48);
      v50 = swift_bridgeObjectRetain(v49);
      v51 = sub_100018428(v50);
      if (v51)
      {
        v52 = v51;
        if (v51 < 1)
        {
          __break(1u);
          JUMPOUT(0x1000107F0);
        }
        v53 = 0;
        do
        {
          if ((v49 & 0xC000000000000001) != 0)
            v54 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v53, v49);
          else
            v54 = *(id *)(v49 + 8 * v53 + 32);
          v56 = v54;
          ++v53;
          LODWORD(v55) = 1144750080;
          objc_msgSend(v54, "setPriority:", v55);

        }
        while (v52 != v53);
      }
      v29 = swift_bridgeObjectRelease_n(v49, 2);
      v21 = v79;
LABEL_23:
      v58 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v80) + 0x338))(v29);
      v59 = objc_msgSend(v80, "view");
      if (!v59)
      {
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
        JUMPOUT(0x100010804);
      }
      v60 = v59;
      v61 = objc_msgSend(v59, "SBUISA_systemApertureLeadingConcentricContentLayoutGuide");

      objc_msgSend(v61, "layoutFrame");
      v63 = v62;
      v65 = v64;
      v67 = v66;
      v69 = v68;

      v81.origin.x = v63;
      v81.origin.y = v65;
      v81.size.width = v67;
      v81.size.height = v69;
      objc_msgSend(v58, "setConstant:", CGRectGetHeight(v81));

      v70 = v26();
      if (sub_100018428(v70))
      {
        if ((v70 & 0xC000000000000001) != 0)
        {
          v71 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v70);
        }
        else
        {
          if (!*(_QWORD *)((v70 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            JUMPOUT(0x1000107D4);
          }
          v71 = *(id *)(v70 + 32);
        }
        v72 = v71;
        swift_bridgeObjectRelease(v70);
        v73 = objc_msgSend(v72, "isActive");

        if ((v73 & 1) == 0)
        {
          v74 = v26();
          v75 = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease(v74);
          objc_msgSend(v21, "activateConstraints:", v75);

        }
      }
      else
      {
        swift_bridgeObjectRelease(v70);
      }
      return;
    default:
      return;
  }
}

uint64_t sub_1000108CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

uint64_t sub_100010914(void *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t (*v6)(void);
  char *v7;

  v4 = type metadata accessor for Logger(0);
  __chkstk_darwin(v4);
  result = (uint64_t)objc_msgSend(a1, "isCancelled");
  if ((result & 1) == 0)
  {
    v6 = *(uint64_t (**)(void))((swift_isaMask & *a2) + 0x170);
    if (v6() == 3 || (result = v6(), result == 2))
    {
      v7 = (char *)&loc_1000109E8
         + *((int *)qword_100010C40 + (*(unsigned __int8 (**)(void))((swift_isaMask & *a2) + 0x290))());
      __asm { BR              X10 }
    }
  }
  return result;
}

void sub_100010CB4()
{
  _QWORD *v0;
  char *v1;

  v1 = (char *)sub_100010D28 + 4 * byte_100027858[(*(unsigned __int8 (**)(void))((swift_isaMask & *v0) + 0x290))()];
  __asm { BR              X10 }
}

uint64_t sub_100010D28()
{
  uint64_t v0;
  unsigned __int8 (*v1)(uint64_t);
  char v2;
  uint64_t v3;
  char *v4;

  v2 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))_stringCompareWithSmolCheck(_:_:expecting:))(0x776F64746E756F63, v0 + 256, 0x776F64746E756F63, v0 + 512, 0);
  v3 = swift_bridgeObjectRelease(v0 + 256);
  if ((v2 & 1) == 0)
  {
    v4 = (char *)&loc_100010E2C + 4 * byte_100027860[v1(v3)];
    __asm { BR              X10 }
  }
  return 1;
}

void sub_100011004()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  NSString v36;
  id v37;
  _QWORD v38[2];
  uint64_t v39;
  uint64_t v40;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v3);
  v8 = (char *)v38 - v7;
  v9 = __chkstk_darwin(v6);
  v11 = (char *)v38 - v10;
  v12 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v0) + 0x260))(v9);
  if (v12)
  {
    v13 = (void *)v12;
    sub_100010CB4();
    v15 = v14;
    v16 = sub_10001DA68();
    v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 16);
    if ((v15 & 1) != 0)
    {
      v18 = v17(v11, v16, v1);
      v19 = Logger.logObject.getter(v18);
      v20 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc(12, -1);
        v22 = swift_slowAlloc(32, -1);
        v40 = v22;
        *(_DWORD *)v21 = 136315138;
        v39 = sub_1000184E8(0xD000000000000012, 0x800000010002F430, &v40);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40);
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s cancel countdown", v21, 0xCu);
        swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v22, -1, -1);
        swift_slowDealloc(v21, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v1);
      v23 = objc_msgSend((id)objc_opt_self(RPAngelConnectionManager), "sharedInstance");
    }
    else
    {
      v30 = v17(v8, v16, v1);
      v31 = Logger.logObject.getter(v30);
      v32 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc(12, -1);
        v34 = swift_slowAlloc(32, -1);
        v40 = v34;
        *(_DWORD *)v33 = 136315138;
        v38[1] = v33 + 4;
        v39 = sub_1000184E8(0xD000000000000012, 0x800000010002F430, &v40);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40);
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "%s stop recording", v33, 0xCu);
        swift_arrayDestroy(v34, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v34, -1, -1);
        swift_slowDealloc(v33, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v2 + 8))(v8, v1);
      v35 = *((_QWORD *)sub_100023558() + 1);
      swift_bridgeObjectRetain(v35);
      v36 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v35);
      objc_msgSend(v13, "setState:animated:", v36, 1);

      sub_10001152C();
      v23 = objc_msgSend((id)objc_opt_self(RPAngelConnectionManager), "sharedInstance");
    }
    v37 = v23;
    objc_msgSend(v37, "stopCurrentSession");

  }
  else
  {
    v24 = sub_10001DA68();
    v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v24, v1);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc(12, -1);
      v29 = swift_slowAlloc(32, -1);
      v40 = v29;
      *(_DWORD *)v28 = 136315138;
      v39 = sub_1000184E8(0xD000000000000012, 0x800000010002F430, &v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "%s error loading views", v28, 0xCu);
      swift_arrayDestroy(v29, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1, -1);
      swift_slowDealloc(v28, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
}

uint64_t sub_10001152C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t aBlock[5];
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v38 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  v36 = *(_QWORD *)(v9 - 8);
  v37 = v9;
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v0) + 0x260))(v10);
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x278))();
    if (v15)
    {
      v16 = (void *)v15;
      sub_10001A208(0, &qword_10003F128, OS_dispatch_queue_ptr);
      v17 = (void *)static OS_dispatch_queue.main.getter();
      v18 = (_QWORD *)swift_allocObject(&unk_100035660, 40, 7);
      v18[2] = v16;
      v18[3] = v0;
      v18[4] = v14;
      aBlock[4] = (uint64_t)sub_100019F80;
      v40 = v18;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1000086D8;
      aBlock[3] = (uint64_t)&unk_100035678;
      v19 = _Block_copy(aBlock);
      v20 = v40;
      v21 = v16;
      v22 = v1;
      v23 = v14;
      v24 = swift_release(v20);
      static DispatchQoS.unspecified.getter(v24);
      aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
      v25 = sub_100019C94(&qword_10003F130, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      v26 = sub_100018DCC(&qword_10003F138);
      v27 = sub_100019028();
      dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v26, v27, v6, v25);
      OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v8, v19);
      _Block_release(v19);

      (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v6);
      return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v12, v37);
    }

  }
  v29 = sub_10001DA68();
  v30 = v2;
  v31 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v29, v2);
  v32 = Logger.logObject.getter(v31);
  v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc(12, -1);
    v35 = swift_slowAlloc(32, -1);
    aBlock[0] = v35;
    *(_DWORD *)v34 = 136315138;
    v41 = sub_1000184E8(0xD000000000000019, 0x800000010002F470, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42);
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "%s error loading views", v34, 0xCu);
    swift_arrayDestroy(v35, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v35, -1, -1);
    swift_slowDealloc(v34, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v30);
}

uint64_t sub_1000118E8()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v33;
  void *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t aBlock[5];
  uint64_t v42;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v38 = *(_QWORD *)(v6 - 8);
  v39 = v6;
  __chkstk_darwin(v6);
  v37 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_10001DA68();
  v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc(12, -1);
    v36 = v2;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc(32, -1);
    v34 = v1;
    v19 = v18;
    aBlock[0] = v18;
    v35 = v5;
    *(_DWORD *)v17 = 136315138;
    v40 = sub_1000184E8(0xD00000000000001ALL, 0x800000010002F410, aBlock);
    v5 = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, aBlock);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "%s", v17, 0xCu);
    swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
    v20 = v19;
    v1 = v34;
    swift_slowDealloc(v20, -1, -1);
    v21 = v17;
    v2 = v36;
    swift_slowDealloc(v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_10001A208(0, &qword_10003F128, OS_dispatch_queue_ptr);
  v22 = (void *)static OS_dispatch_queue.main.getter();
  v23 = swift_allocObject(&unk_100035610, 24, 7);
  *(_QWORD *)(v23 + 16) = v1;
  aBlock[4] = (uint64_t)sub_100019F2C;
  v42 = v23;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1000086D8;
  aBlock[3] = (uint64_t)&unk_100035628;
  v24 = _Block_copy(aBlock);
  v25 = v42;
  v26 = v1;
  v27 = swift_release(v25);
  v28 = v37;
  static DispatchQoS.unspecified.getter(v27);
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  v29 = sub_100019C94(&qword_10003F130, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v30 = sub_100018DCC(&qword_10003F138);
  v31 = sub_100019028();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v30, v31, v2, v29);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v28, v5, v24);
  _Block_release(v24);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v28, v39);
}

uint64_t sub_100011C58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  uint8_t *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int8 (*v21)(void);
  id v22;
  id v23;
  char *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(char *, uint64_t, uint64_t);
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v6 = (char *)&v31 - v5;
  v7 = sub_10001DA68();
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16);
  v9 = v8(v6, v7, v0);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  v12 = os_log_type_enabled(v10, v11);
  v32 = v7;
  v33 = v8;
  if (v12)
  {
    v13 = (uint8_t *)swift_slowAlloc(12, -1);
    v14 = swift_slowAlloc(32, -1);
    v36 = v14;
    *(_DWORD *)v13 = 136315138;
    v35 = sub_1000184E8(0xD000000000000016, 0x800000010002F3F0, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "%s", v13, 0xCu);
    swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v13, -1, -1);
  }

  v15 = *(void (**)(char *, uint64_t))(v1 + 8);
  v15(v6, v0);
  v16 = v34;
  v17 = *(void **)((char *)v34 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingView);
  if (v17)
  {
    v18 = type metadata accessor for RPSessionAccessoryView();
    if (swift_dynamicCastClass(v17, v18))
    {
      v19 = *(void **)((char *)v16 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView);
      if (v19)
      {
        if (swift_dynamicCastClass(*(_QWORD *)((char *)v16+ OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView), v18))
        {
          v20 = *(void **)((char *)v16
                         + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalView);
          if (v20)
          {
            if (swift_dynamicCastClass(*(_QWORD *)((char *)v16+ OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalView), v18))
            {
              v21 = *(unsigned __int8 (**)(void))((swift_isaMask & *v16) + 0x290);
              v33 = v17;
              v22 = v19;
              v23 = v20;
              v24 = (char *)&loc_100011EBC + dword_100012234[v21()];
              __asm { BR              X10 }
            }
          }
        }
      }
    }
  }
  v25 = v33(v4, v32, v0);
  v26 = Logger.logObject.getter(v25);
  v27 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc(12, -1);
    v29 = swift_slowAlloc(32, -1);
    v36 = v29;
    *(_DWORD *)v28 = 136315138;
    v35 = sub_1000184E8(0xD000000000000016, 0x800000010002F3F0, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36);
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "%s cannot get leading, trailing, and minimal views", v28, 0xCu);
    swift_arrayDestroy(v29, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v29, -1, -1);
    swift_slowDealloc(v28, -1, -1);
  }

  return ((uint64_t (*)(char *, uint64_t))v15)(v4, v0);
}

void sub_1000120F4()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = (uint64_t *)sub_100023234();
  v4 = *v3;
  v5 = v3[1];
  swift_bridgeObjectRetain(v5);
  sub_100012254(v0, v4, v5);
  swift_bridgeObjectRelease(v5);
  v6 = *v3;
  v7 = v3[1];
  swift_bridgeObjectRetain(v7);
  sub_100012254(v1, v6, v7);
  swift_bridgeObjectRelease(v7);
  v9 = *v3;
  v8 = v3[1];
  swift_bridgeObjectRetain(v8);
  sub_100012254(v2, v9, v8);
  swift_bridgeObjectRelease(v8);
  JUMPOUT(0x1000121C8);
}

uint64_t sub_100012254(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  _QWORD *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, unint64_t);
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSString v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v4 = v3;
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_10001DA68();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  v13 = a1;
  swift_bridgeObjectRetain_n(a3, 2);
  v14 = v13;
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc(32, -1);
    v32 = v4;
    v18 = v17;
    v30 = swift_slowAlloc(96, -1);
    v34 = v30;
    *(_DWORD *)v18 = 136315650;
    v31 = v8;
    v33 = sub_1000184E8(0xD00000000000001ELL, 0x800000010002F3D0, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);
    *(_WORD *)(v18 + 12) = 2080;
    v19 = 8 * *((char *)v14 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_role);
    v20 = *(_QWORD *)&aLeading_1[v19];
    v21 = *(_QWORD *)((char *)&unk_100027F38 + v19);
    v29 = v9;
    v33 = sub_1000184E8(v20, v21, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);

    swift_bridgeObjectRelease(v21);
    *(_WORD *)(v18 + 22) = 2080;
    swift_bridgeObjectRetain(a3);
    v33 = sub_1000184E8(a2, a3, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);
    swift_bridgeObjectRelease_n(a3, 3);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "%s role=%s viewState=%s", (uint8_t *)v18, 0x20u);
    v22 = v30;
    swift_arrayDestroy(v30, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v31);
  }
  else
  {

    swift_bridgeObjectRelease_n(a3, 2);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  v23 = *(uint64_t (**)(uint64_t, unint64_t))((swift_isaMask & *v14) + 0x88);
  swift_bridgeObjectRetain(a3);
  v24 = v23(a2, a3);
  v25 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v14) + 0x68))(v24);
  if (v25)
  {
    v26 = (void *)v25;
    v27 = String._bridgeToObjectiveC()();
    objc_msgSend(v26, "setState:", v27);

  }
  return sub_100016FC8(v14, a2, a3);
}

void sub_100012598()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;

  v1 = type metadata accessor for DispatchWorkItemFlags(0);
  __chkstk_darwin(v1);
  v2 = type metadata accessor for DispatchQoS(0);
  v3 = __chkstk_darwin(v2);
  v4 = (char *)sub_100012680
     + 4 * byte_100027870[(*(unsigned __int8 (**)(uint64_t))((swift_isaMask & *v0) + 0x290))(v3)];
  __asm { BR              X10 }
}

uint64_t sub_100012680()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t result;
  void *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x776F64746E756F63, 0xEA0000000000336ELL, 0x6E6964726F636572, 0xE900000000000067, 0);
  result = swift_bridgeObjectRelease(0xEA0000000000336ELL);
  if ((v9 & 1) != 0)
  {
    sub_10001A208(0, &qword_10003F128, OS_dispatch_queue_ptr);
    v11 = (void *)static OS_dispatch_queue.main.getter();
    v12 = (_QWORD *)swift_allocObject(&unk_100035098, 40, 7);
    v12[2] = v5;
    v12[3] = v6;
    v12[4] = v4;
    *(_QWORD *)(v8 - 96) = sub_100018F38;
    *(_QWORD *)(v8 - 88) = v12;
    *(_QWORD *)(v8 - 128) = _NSConcreteStackBlock;
    *(_QWORD *)(v8 - 120) = 1107296256;
    *(_QWORD *)(v8 - 112) = sub_1000086D8;
    *(_QWORD *)(v8 - 104) = &unk_1000350B0;
    v13 = _Block_copy((const void *)(v8 - 128));
    v14 = *(_QWORD *)(v8 - 88);
    v15 = v5;
    swift_bridgeObjectRetain(v4);
    v16 = swift_release(v14);
    static DispatchQoS.unspecified.getter(v16);
    *(_QWORD *)(v8 - 128) = &_swiftEmptyArrayStorage;
    v17 = sub_100019C94(&qword_10003F130, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v18 = sub_100018DCC(&qword_10003F138);
    v19 = sub_100019028();
    dispatch thunk of SetAlgebra.init<A>(_:)(v8 - 128, v18, v19, v0, v17);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v3, v1, v13);
    _Block_release(v13);

    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 136) + 8))(v1, v0);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v3, v2);
  }
  return result;
}

void sub_1000128E0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  Class isa;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  id v21;
  void *v22;
  _QWORD *v23;
  id v24;
  id v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  id v33;
  uint64_t aBlock[5];
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;

  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v2) + 0x260))(v7);
  if (v10)
  {
    v33 = v10;
    v11 = swift_allocObject(&unk_1000350E8, 17, 7);
    *(_BYTE *)(v11 + 16) = 0;
    v12 = (void *)objc_opt_self(PHAsset);
    v13 = sub_100018DCC(&qword_10003F148);
    v14 = swift_allocObject(v13, 48, 7);
    *(_OWORD *)(v14 + 16) = xmmword_100027810;
    *(_QWORD *)(v14 + 32) = a1;
    *(_QWORD *)(v14 + 40) = a2;
    swift_bridgeObjectRetain(a2);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v14);
    v16 = objc_msgSend(v12, "fetchAssetsWithLocalIdentifiers:options:", isa, 0);

    v17 = objc_msgSend(v16, "firstObject");
    if (v17)
    {
      v18 = objc_msgSend(objc_allocWithZone((Class)PHImageRequestOptions), "init");
      objc_msgSend(v18, "setVersion:", 2);
      objc_msgSend(v18, "setSynchronous:", 0);
      v19 = objc_msgSend((id)objc_opt_self(PHImageManager), "defaultManager");
      v20 = (_QWORD *)swift_allocObject(&unk_100035110, 40, 7);
      v21 = v33;
      v20[2] = v11;
      v20[3] = v21;
      v20[4] = v2;
      aBlock[4] = (uint64_t)sub_1000190FC;
      v35 = v20;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_100012CE0;
      aBlock[3] = (uint64_t)&unk_100035128;
      v22 = _Block_copy(aBlock);
      v23 = v35;
      v24 = v18;
      swift_retain(v11);
      v25 = v33;
      v26 = v2;
      swift_release(v23);
      objc_msgSend(v19, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v17, 0, v24, v22, 0.0, 0.0);

      _Block_release(v22);
      swift_release(v11);

    }
    else
    {
      swift_release(v11);

    }
  }
  else
  {
    v27 = sub_10001DA68();
    v28 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v27, v5);
    v29 = Logger.logObject.getter(v28);
    v30 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc(12, -1);
      v32 = swift_slowAlloc(32, -1);
      aBlock[0] = v32;
      *(_DWORD *)v31 = 136315138;
      v36 = sub_1000184E8(0xD000000000000024, 0x800000010002EB80, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37);
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "%s error loading views", v31, 0xCu);
      swift_arrayDestroy(v32, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v32, -1, -1);
      swift_slowDealloc(v31, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
}

uint64_t sub_100012CE0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void (*v5)(void *, uint64_t);
  uint64_t v6;
  id v7;

  v5 = *(void (**)(void *, uint64_t))(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (a3)
    v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v6 = 0;
  swift_retain(v4);
  v7 = a2;
  v5(a2, v6);
  swift_release(v4);

  return swift_bridgeObjectRelease(v6);
}

uint64_t sub_100012D74(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, unint64_t);
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  void *v43;
  _QWORD *v44;
  _QWORD *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  char *v55;
  double *v56;
  char *v57;
  void (*v58)(char *, uint64_t);
  uint64_t v59;
  uint64_t v60;
  void *v61;
  _QWORD *v62;
  uint64_t v63;
  void (*v65)(char *, uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void **aBlock;
  uint64_t v87;
  uint64_t (*v88)(uint64_t);
  void *v89;
  void *v90;
  _QWORD *v91;

  v6 = v5;
  v80 = a5;
  v84 = a4;
  v73 = a3;
  v72 = a2;
  v71 = a1;
  v83 = type metadata accessor for DispatchTime(0);
  v77 = *(_QWORD *)(v83 - 8);
  v7 = __chkstk_darwin(v83);
  v76 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v82 = (char *)&v65 - v9;
  v81 = type metadata accessor for DispatchWorkItemFlags(0);
  v75 = *(_QWORD *)(v81 - 8);
  __chkstk_darwin(v81);
  v79 = (char *)&v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = type metadata accessor for DispatchQoS(0);
  v74 = *(_QWORD *)(v85 - 8);
  __chkstk_darwin(v85);
  v78 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = type metadata accessor for URL(0);
  v12 = *(_QWORD *)(v68 - 8);
  __chkstk_darwin(v68);
  v69 = v13;
  v70 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100018DCC(&qword_10003F098);
  __chkstk_darwin(v14);
  v16 = (char *)&v65 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for Logger(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_10001DA68();
  v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v21, v17);
  v23 = Logger.logObject.getter(v22);
  v24 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "showSavedToPhotosBanner(withPhotosURL:identifier:sessionID:)", v25, 2u);
    swift_slowDealloc(v25, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  (*(void (**)(uint64_t))((swift_isaMask & *v6) + 0x298))(7);
  v26 = v12;
  v65 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v27 = v71;
  v28 = v68;
  v65(v16, v71, v68);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v16, 0, 1, v28);
  (*(void (**)(char *))((swift_isaMask & *v6) + 0x2F8))(v16);
  v29 = *(uint64_t (**)(uint64_t, unint64_t))((swift_isaMask & *v6) + 0x310);
  v30 = v73;
  swift_bridgeObjectRetain(v73);
  v31 = v72;
  v32 = v29(v72, v30);
  v33 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v6) + 0x2C0))(v32);
  objc_msgSend(v33, "setHidden:", 0);

  v34 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v6) + 0x2D8))();
  objc_msgSend(v34, "setHidden:", 0);

  v67 = sub_10001A208(0, &qword_10003F128, OS_dispatch_queue_ptr);
  v66 = ((uint64_t (*)(void))static OS_dispatch_queue.main.getter)();
  v35 = v70;
  v65(v70, v27, v28);
  v36 = *(unsigned __int8 *)(v26 + 80);
  v37 = (v36 + 40) & ~v36;
  v38 = (v69 + v37 + 7) & 0xFFFFFFFFFFFFFFF8;
  v39 = (char *)swift_allocObject(&unk_100035160, v38 + 16, v36 | 7);
  v40 = v84;
  *((_QWORD *)v39 + 2) = v6;
  *((_QWORD *)v39 + 3) = v40;
  v41 = v80;
  *((_QWORD *)v39 + 4) = v80;
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(&v39[v37], v35, v28);
  v42 = (uint64_t *)&v39[v38];
  *v42 = v31;
  v42[1] = v30;
  v90 = sub_1000195C4;
  v91 = v39;
  aBlock = _NSConcreteStackBlock;
  v87 = 1107296256;
  v88 = sub_1000086D8;
  v89 = &unk_100035178;
  v43 = _Block_copy(&aBlock);
  v44 = v91;
  swift_bridgeObjectRetain(v30);
  v45 = v6;
  swift_bridgeObjectRetain(v41);
  swift_release(v44);
  v46 = v78;
  static DispatchQoS.unspecified.getter(v47);
  aBlock = (void **)&_swiftEmptyArrayStorage;
  v48 = sub_100019C94(&qword_10003F130, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v72 = v48;
  v49 = sub_100018DCC(&qword_10003F138);
  v71 = v49;
  v73 = sub_100019028();
  v50 = v79;
  v51 = v81;
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v49, v73, v81, v48);
  v52 = (void *)v66;
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v46, v50, v43);
  _Block_release(v43);

  v75 = *(_QWORD *)(v75 + 8);
  ((void (*)(char *, uint64_t))v75)(v50, v51);
  v74 = *(_QWORD *)(v74 + 8);
  v53 = ((uint64_t (*)(char *, uint64_t))v74)(v46, v85);
  v54 = (void *)static OS_dispatch_queue.main.getter(v53);
  v55 = v76;
  static DispatchTime.now()();
  v56 = (double *)sub_100022C9C();
  v57 = v82;
  + infix(_:_:)(v55, *v56);
  v58 = *(void (**)(char *, uint64_t))(v77 + 8);
  v59 = v83;
  v58(v55, v83);
  v60 = swift_allocObject(&unk_1000351B0, 32, 7);
  *(_QWORD *)(v60 + 16) = v84;
  *(_QWORD *)(v60 + 24) = v41;
  v90 = sub_100019634;
  v91 = (_QWORD *)v60;
  aBlock = _NSConcreteStackBlock;
  v87 = 1107296256;
  v88 = sub_1000086D8;
  v89 = &unk_1000351C8;
  v61 = _Block_copy(&aBlock);
  v62 = v91;
  swift_bridgeObjectRetain(v41);
  swift_release(v62);
  static DispatchQoS.unspecified.getter(v63);
  aBlock = (void **)&_swiftEmptyArrayStorage;
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v71, v73, v51, v72);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v57, v46, v50, v61);
  _Block_release(v61);

  ((void (*)(char *, uint64_t))v75)(v50, v51);
  ((void (*)(char *, uint64_t))v74)(v46, v85);
  return ((uint64_t (*)(char *, uint64_t))v58)(v57, v59);
}

uint64_t sub_100013454(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  void *v29;
  NSString v30;
  void *v31;
  double v32;
  NSString v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51[32];

  v47 = a3;
  v48 = a4;
  v46 = a2;
  v9 = sub_100018DCC(&qword_10003F098);
  __chkstk_darwin(v9);
  v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Logger(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = swift_allocObject(&unk_1000350E8, 17, 7);
  *(_BYTE *)(v16 + 16) = 0;
  swift_retain(v16);
  sub_10000C260(0xD000000000000011, 0x800000010002F490, v16);
  swift_beginAccess(v16 + 16, v51, 0, 0);
  v17 = *(unsigned __int8 *)(v16 + 16);
  swift_release(v16);
  if (v17 == 1)
  {
    v18 = sub_10001DA68();
    v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v18, v12);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = swift_slowAlloc(12, -1);
      v44 = a5;
      v23 = (uint8_t *)v22;
      v24 = swift_slowAlloc(32, -1);
      v45 = a6;
      v25 = v24;
      v50 = v24;
      *(_DWORD *)v23 = 136315138;
      v43 = v23 + 4;
      v49 = sub_1000184E8(0xD00000000000003CLL, 0x800000010002F4F0, &v50);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50);
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "%s unhide system aperture to show saved to photos banner", v23, 0xCu);
      swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
      v26 = v25;
      a6 = v45;
      swift_slowDealloc(v26, -1, -1);
      v27 = v23;
      a5 = v44;
      swift_slowDealloc(v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    (*(void (**)(uint64_t))((swift_isaMask & *a1) + 0x1A8))(3);
    v28 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *a1) + 0x1C0))(4);
    v29 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *a1) + 0x248))(v28);
    v30 = String._bridgeToObjectiveC()();
    objc_msgSend(v29, "setText:", v30);

  }
  v31 = (void *)objc_opt_self(NSTimer);
  v32 = *(double *)sub_100022CA8();
  v33 = String._bridgeToObjectiveC()();
  v34 = objc_msgSend(v31, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", a1, "handleCompletionTimeout", v33, 0, v32);

  v35 = (*(uint64_t (**)(id))((swift_isaMask & *a1) + 0x430))(v34);
  v36 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *a1) + 0x278))(v35);
  if (v36)
  {
    v37 = v36;
    objc_msgSend(v36, "setAlpha:", *(double *)sub_100022C7C());

  }
  v38 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *a1) + 0x248))();
  objc_msgSend(v38, "setAlpha:", *(double *)sub_100022C7C());

  (*(void (**)(uint64_t))((swift_isaMask & *a1) + 0x220))(682);
  v39 = type metadata accessor for URL(0);
  v40 = *(_QWORD *)(v39 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v11, v48, v39);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v11, 0, 1, v39);
  (*(void (**)(char *))((swift_isaMask & *a1) + 0x400))(v11);
  v41 = objc_msgSend(a1, "systemApertureElementContext");
  objc_msgSend(v41, "setElementNeedsUpdate");
  swift_unknownObjectRelease(v41);
  return (*(uint64_t (**)(uint64_t, uint64_t))((swift_isaMask & *a1) + 0x4A8))(a5, a6);
}

double sub_1000138FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  double result;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v44 - v9;
  v11 = sub_10001AAA8();
  v12 = *v11;
  v13 = *(uint64_t (**)(uint64_t))(*(_QWORD *)*v11 + 128);
  v14 = swift_retain(*v11);
  v15 = v13(v14);
  v17 = v16;
  swift_release(v12);
  if (!v17)
  {
LABEL_7:
    v20 = sub_10001DA68();
    v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v20, v4);
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "dropping previous session alert request", v24, 2u);
      swift_slowDealloc(v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    return result;
  }
  if (v15 == a1 && v17 == a2)
  {
    swift_bridgeObjectRelease(v17);
  }
  else
  {
    v19 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v15, v17, 0);
    swift_bridgeObjectRelease(v17);
    if ((v19 & 1) == 0)
      goto LABEL_7;
  }
  v26 = sub_10001DA68();
  v27 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v26, v4);
  v28 = Logger.logObject.getter(v27);
  v29 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc(12, -1);
    v44 = swift_slowAlloc(32, -1);
    v47 = v44;
    *(_DWORD *)v30 = 136315138;
    v31 = *v11;
    v32 = *(uint64_t (**)(uint64_t))(*(_QWORD *)*v11 + 128);
    v33 = swift_retain(*v11);
    v34 = v32(v33);
    v45 = v4;
    v35 = v34;
    v37 = v36;
    swift_release(v31);
    if (v37)
      v38 = v35;
    else
      v38 = 1819047246;
    if (v37)
      v39 = v37;
    else
      v39 = 0xE400000000000000;
    v46 = sub_1000184E8(v38, v39, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47);
    swift_bridgeObjectRelease(v39);
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "alert request for session=%s", v30, 0xCu);
    v40 = v44;
    swift_arrayDestroy(v44, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v40, -1, -1);
    swift_slowDealloc(v30, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v45);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  v41 = *v11;
  v42 = *(void (**)(uint64_t))(*(_QWORD *)*v11 + 192);
  v43 = swift_retain(*v11);
  v42(v43);
  *(_QWORD *)&result = swift_release(v41).n128_u64[0];
  return result;
}

uint64_t sub_100013D2C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t aBlock[5];
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v46 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v4 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v44 = *(_QWORD *)(v5 - 8);
  v45 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v42 - v14;
  v16 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v0) + 0x278))(v13);
  if (v16)
  {
    v17 = (void *)v16;
    v43 = v2;
    v18 = sub_10001DA68();
    v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 16))(v15, v18, v8);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "startRecording()", v22, 2u);
      swift_slowDealloc(v22, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
    v23 = sub_10001A208(0, &qword_10003F128, OS_dispatch_queue_ptr);
    v24 = (void *)static OS_dispatch_queue.main.getter(v23);
    v25 = swift_allocObject(&unk_100035200, 32, 7);
    *(_QWORD *)(v25 + 16) = v1;
    *(_QWORD *)(v25 + 24) = v17;
    aBlock[4] = (uint64_t)sub_100019668;
    v48 = v25;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1000086D8;
    aBlock[3] = (uint64_t)&unk_100035218;
    v26 = _Block_copy(aBlock);
    v27 = v48;
    v28 = v1;
    v29 = v17;
    swift_release(v27);
    static DispatchQoS.unspecified.getter(v30);
    aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
    v31 = sub_100019C94(&qword_10003F130, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v32 = sub_100018DCC(&qword_10003F138);
    v33 = sub_100019028();
    v34 = v43;
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v32, v33, v43, v31);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v7, v4, v26);
    _Block_release(v26);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v4, v34);
    return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v7, v45);
  }
  else
  {
    v36 = sub_10001DA68();
    v37 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v36, v8);
    v38 = Logger.logObject.getter(v37);
    v39 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc(12, -1);
      v41 = swift_slowAlloc(32, -1);
      aBlock[0] = v41;
      *(_DWORD *)v40 = 136315138;
      v49 = sub_1000184E8(0xD000000000000010, 0x800000010002EBE0, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50);
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "%s error loading views", v40, 0xCu);
      swift_arrayDestroy(v41, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v41, -1, -1);
      swift_slowDealloc(v40, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
}

void sub_10001416C(_QWORD *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int v9;
  __n128 v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  _QWORD *v28;
  void *v29;
  uint64_t v30;
  uint64_t aBlock[5];
  uint64_t v32;
  char v33[32];

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = swift_allocObject(&unk_1000350E8, 17, 7);
  *(_BYTE *)(v8 + 16) = 0;
  swift_retain(v8);
  sub_10000C260(0xD000000000000011, 0x800000010002F490, v8);
  swift_beginAccess(v8 + 16, v33, 0, 0);
  v9 = *(unsigned __int8 *)(v8 + 16);
  v10 = swift_release(v8);
  if (v9 == 1)
  {
    v11 = sub_10001DA68();
    v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(12, -1);
      v16 = swift_slowAlloc(32, -1);
      v29 = a2;
      v17 = v16;
      aBlock[0] = v16;
      *(_DWORD *)v15 = 136315138;
      v30 = sub_1000184E8(0xD000000000000010, 0x800000010002EBE0, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, aBlock);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%s hide system aperture screen recording element", v15, 0xCu);
      v18 = 1;
      swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
      v19 = v17;
      a2 = v29;
      swift_slowDealloc(v19, -1, -1);
      swift_slowDealloc(v15, -1, -1);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v18 = 1;
    }
    v20 = 1;
  }
  else
  {
    v20 = 4;
    v18 = 3;
  }
  (*(void (**)(uint64_t, __n128))((swift_isaMask & *a1) + 0x1A8))(v18, v10);
  (*(void (**)(uint64_t))((swift_isaMask & *a1) + 0x1C0))(v20);
  v21 = objc_msgSend(a1, "systemApertureElementContext");
  objc_msgSend(v21, "setElementNeedsUpdate");
  swift_unknownObjectRelease(v21);
  v22 = (void *)objc_opt_self(UIView);
  v23 = *(double *)sub_100022E00();
  v24 = swift_allocObject(&unk_1000356B0, 32, 7);
  *(_QWORD *)(v24 + 16) = a2;
  *(_QWORD *)(v24 + 24) = a1;
  aBlock[4] = (uint64_t)sub_10001A168;
  v32 = v24;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1000086D8;
  aBlock[3] = (uint64_t)&unk_1000356C8;
  v25 = _Block_copy(aBlock);
  v26 = v32;
  v27 = a2;
  v28 = a1;
  swift_release(v26);
  objc_msgSend(v22, "animateWithDuration:delay:options:animations:completion:", 24, v25, 0, v23, 0.0);
  _Block_release(v25);
}

uint64_t sub_100014514()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v10;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_10001DA68();
  v5 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "didTapStopButton()", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_10001152C();
}

uint64_t sub_100014654(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[5];
  _QWORD *v26;

  v3 = v2;
  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v24 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v23 - 8);
  __chkstk_darwin(v23);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_10001A208(0, &qword_10003F128, OS_dispatch_queue_ptr);
  v13 = (void *)static OS_dispatch_queue.main.getter(v12);
  v14 = (_QWORD *)swift_allocObject(&unk_100035250, 40, 7);
  v14[2] = a1;
  v14[3] = a2;
  v14[4] = v2;
  aBlock[4] = sub_10001969C;
  v26 = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000086D8;
  aBlock[3] = &unk_100035268;
  v15 = _Block_copy(aBlock);
  v16 = v26;
  swift_bridgeObjectRetain(a2);
  v17 = v3;
  swift_release(v16);
  static DispatchQoS.unspecified.getter(v18);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v19 = sub_100019C94(&qword_10003F130, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v20 = sub_100018DCC(&qword_10003F138);
  v21 = sub_100019028();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v20, v21, v6, v19);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v8, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v23);
}

uint64_t sub_100014864(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10001DA68();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v11 = swift_bridgeObjectRetain_n(a2, 2);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(22, -1);
    v29 = a1;
    v15 = v14;
    v28 = swift_slowAlloc(64, -1);
    v31 = v28;
    *(_DWORD *)v15 = 136315394;
    v30 = sub_1000184E8(0xD000000000000015, 0x800000010002F450, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31);
    *(_WORD *)(v15 + 12) = 2080;
    swift_bridgeObjectRetain(a2);
    v30 = sub_1000184E8(v29, a2, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s %s", (uint8_t *)v15, 0x16u);
    v16 = v28;
    swift_arrayDestroy(v28, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    v17 = v15;
    a1 = v29;
    swift_slowDealloc(v17, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v18 = sub_100022CC0();
  v19 = *((_QWORD *)v18 + 1);
  if (*(_QWORD *)v18 == a1 && v19 == a2
    || (_stringCompareWithSmolCheck(_:_:expecting:)(*(_QWORD *)v18, v19, a1, a2, 0) & 1) != 0)
  {
    v20 = 1;
LABEL_8:
    (*(void (**)(uint64_t))((swift_isaMask & *a3) + 0x298))(v20);
    return sub_100011C58();
  }
  v22 = sub_100022CE8();
  v23 = *((_QWORD *)v22 + 1);
  if (*(_QWORD *)v22 == a1 && v23 == a2
    || (_stringCompareWithSmolCheck(_:_:expecting:)(*(_QWORD *)v22, v23, a1, a2, 0) & 1) != 0)
  {
    v20 = 2;
    goto LABEL_8;
  }
  v24 = sub_100022D10();
  v25 = *((_QWORD *)v24 + 1);
  if (*(_QWORD *)v24 == a1 && v25 == a2
    || (_stringCompareWithSmolCheck(_:_:expecting:)(*(_QWORD *)v24, v25, a1, a2, 0) & 1) != 0)
  {
    v20 = 3;
    goto LABEL_8;
  }
  v26 = sub_100022D38();
  v27 = v26[1];
  if (*v26 == a1 && v27 == a2 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v26, v27, a1, a2, 0) & 1) != 0)
  {
    v20 = 4;
    goto LABEL_8;
  }
  return sub_100011C58();
}

uint64_t sub_100014B98(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v8 = v7;
  v9 = a1;
  a4(v6, v8);

  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_100014BEC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint8_t *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t result;
  __int128 v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  char *v42;
  uint64_t v43;
  __int128 aBlock;
  __int128 v45;
  double (*v46)();
  uint64_t v47;
  _OWORD v48[2];

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v43 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v42 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_10001DA68();
  v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(2, -1);
    v41 = v1;
    v17 = v6;
    v18 = v5;
    v19 = v2;
    v20 = v3;
    v21 = v16;
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "handleCompletionTimeout()", v16, 2u);
    v22 = v21;
    v3 = v20;
    v2 = v19;
    v5 = v18;
    v6 = v17;
    v1 = v41;
    swift_slowDealloc(v22, -1, -1);
  }

  v23 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v24 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v1) + 0x428))(v23);
  if (!v24)
  {
    aBlock = 0u;
    v45 = 0u;
    return sub_100019700((uint64_t)&aBlock, &qword_10003F150);
  }
  v25 = v24;
  v26 = objc_msgSend(v24, "userInfo");

  if (v26)
  {
    _bridgeAnyObjectToAny(_:)(v48, v26);
    swift_unknownObjectRelease(v26);
  }
  else
  {
    memset(v48, 0, sizeof(v48));
  }
  sub_1000196A8((uint64_t)v48, (uint64_t)&aBlock);
  if (!*((_QWORD *)&v45 + 1))
    return sub_100019700((uint64_t)&aBlock, &qword_10003F150);
  result = swift_dynamicCast(v48, &aBlock, (char *)&type metadata for Any + 8, &type metadata for String, 6);
  if ((result & 1) != 0)
  {
    v28 = v48[0];
    v29 = sub_10001A208(0, &qword_10003F128, OS_dispatch_queue_ptr);
    v30 = (void *)static OS_dispatch_queue.main.getter(v29);
    v31 = swift_allocObject(&unk_1000352A0, 40, 7);
    *(_QWORD *)(v31 + 16) = v1;
    *(_OWORD *)(v31 + 24) = v28;
    v46 = sub_1000196F4;
    v47 = v31;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v45 = sub_1000086D8;
    *((_QWORD *)&v45 + 1) = &unk_1000352B8;
    v32 = _Block_copy(&aBlock);
    v33 = v47;
    v34 = v1;
    swift_release(v33);
    v35 = v42;
    static DispatchQoS.unspecified.getter(v36);
    *(_QWORD *)&aBlock = &_swiftEmptyArrayStorage;
    v37 = sub_100019C94(&qword_10003F130, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v38 = sub_100018DCC(&qword_10003F138);
    v39 = sub_100019028();
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v38, v39, v2, v37);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v35, v5, v32);
    _Block_release(v32);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v35, v6);
  }
  return result;
}

double sub_100014FAC(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  double result;
  uint64_t v28;
  _QWORD *v29;
  NSObject *v30;
  os_log_type_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t);
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  os_log_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  os_log_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v53 - v12;
  if (((*(uint64_t (**)(uint64_t))((swift_isaMask & *a1) + 0x440))(v11) & 1) != 0
    || (v60 = sub_10001AAA8(),
        v14 = *v60,
        v15 = *(uint64_t (**)(uint64_t))(*(_QWORD *)*v60 + 128),
        v16 = swift_retain(*v60),
        v17 = v15(v16),
        v19 = v18,
        swift_release(v14),
        !v19))
  {
LABEL_8:
    v22 = sub_10001DA68();
    v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v22, v6);
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "dropping previous session finish request", v26, 2u);
      swift_slowDealloc(v26, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    return result;
  }
  if (v17 == a2 && v19 == a3)
  {
    swift_bridgeObjectRelease(v19);
  }
  else
  {
    v21 = _stringCompareWithSmolCheck(_:_:expecting:)(a2, a3, v17, v19, 0);
    swift_bridgeObjectRelease(v19);
    if ((v21 & 1) == 0)
      goto LABEL_8;
  }
  v28 = sub_10001DA68();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v13, v28, v6);
  v29 = a1;
  v30 = Logger.logObject.getter(v29);
  v31 = static os_log_type_t.default.getter();
  v32 = v31;
  if (os_log_type_enabled(v30, v31))
  {
    v33 = swift_slowAlloc(22, -1);
    v34 = swift_slowAlloc(8, -1);
    v58 = a3;
    v35 = (_QWORD *)v34;
    v56 = v34;
    v59 = swift_slowAlloc(32, -1);
    v61 = (uint64_t)v29;
    v62 = v59;
    *(_DWORD *)v33 = 138412546;
    v57 = v30;
    v54 = a2;
    v36 = v29;
    v55 = v32;
    v37 = v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62);
    *v35 = v29;
    a3 = v58;

    *(_WORD *)(v33 + 12) = 2080;
    v38 = v60;
    v39 = *v60;
    v40 = *(uint64_t (**)(uint64_t))(*(_QWORD *)*v60 + 128);
    v41 = swift_retain(*v60);
    v42 = v40(v41);
    v44 = v43;
    swift_release(v39);
    if (v44)
      v45 = v42;
    else
      v45 = 1819047246;
    if (v44)
      v46 = v44;
    else
      v46 = 0xE400000000000000;
    v61 = sub_1000184E8(v45, v46, &v62);
    a2 = v54;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62);
    swift_bridgeObjectRelease(v46);
    v47 = v57;
    _os_log_impl((void *)&_mh_execute_header, v57, (os_log_type_t)v55, "self=%@ finish request for session=%s", (uint8_t *)v33, 0x16u);
    v48 = sub_100018DCC(&qword_10003F0C0);
    v49 = v56;
    swift_arrayDestroy(v56, 1, v48);
    swift_slowDealloc(v49, -1, -1);
    v50 = v59;
    swift_arrayDestroy(v59, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v50, -1, -1);
    swift_slowDealloc(v33, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    v38 = v60;
  }
  v51 = *v38;
  v52 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)*v38 + 200);
  swift_retain(*v38);
  v52(a2, a3);
  *(_QWORD *)&result = swift_release(v51).n128_u64[0];
  return result;
}

id sub_100015400()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint8_t *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t (*v29)(void);
  id v30;
  uint64_t (*v31)(void);
  void *v32;
  double *v33;
  id result;
  void *v35;
  void *v36;
  uint64_t (*v37)(void);
  uint64_t v38;
  Class isa;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t (*v44)(void);
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  double v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  Class v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  id v78;
  uint64_t (*v79)(void);
  uint64_t v80;
  uint64_t aBlock[5];
  uint64_t v82;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v79 = (uint64_t (*)(void))((char *)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = (_QWORD *)type metadata accessor for DispatchQoS(0);
  v77 = *(v5 - 1);
  v78 = v5;
  __chkstk_darwin(v5);
  v76 = (char *)&v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Logger(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10001DA68();
  v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc(12, -1);
    v74 = v1;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc(32, -1);
    aBlock[0] = v17;
    v75 = v3;
    *(_DWORD *)v16 = 136315138;
    v80 = sub_1000184E8(0x74747542776F6873, 0xED00002928736E6FLL, aBlock);
    v3 = v75;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, aBlock);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "%s", v16, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    v18 = v16;
    v1 = v74;
    swift_slowDealloc(v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_10001A208(0, &qword_10003F128, OS_dispatch_queue_ptr);
  v19 = (void *)static OS_dispatch_queue.main.getter();
  v20 = swift_allocObject(&unk_1000358B8, 24, 7);
  *(_QWORD *)(v20 + 16) = v1;
  aBlock[4] = (uint64_t)sub_10001A46C;
  v82 = v20;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1000086D8;
  aBlock[3] = (uint64_t)&unk_1000358D0;
  v21 = _Block_copy(aBlock);
  v22 = v82;
  v23 = v1;
  v24 = swift_release(v22);
  v25 = v76;
  static DispatchQoS.unspecified.getter(v24);
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  v26 = sub_100019C94(&qword_10003F130, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v27 = sub_100018DCC(&qword_10003F138);
  v28 = sub_100019028();
  v29 = v79;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v27, v28, v2, v26);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v25, v29, v21);
  _Block_release(v21);

  (*(void (**)(uint64_t (*)(void), uint64_t))(v3 + 8))(v29, v2);
  (*(void (**)(char *, id))(v77 + 8))(v25, v78);
  v30 = objc_msgSend(objc_allocWithZone((Class)UINotificationFeedbackGenerator), "init");
  objc_msgSend(v30, "notificationOccurred:", 0);

  v31 = *(uint64_t (**)(void))((swift_isaMask & *v23) + 0x338);
  v32 = (void *)v31();
  v33 = (double *)sub_100022E2C();
  objc_msgSend(v32, "setConstant:", *v33);

  result = objc_msgSend(v23, "view");
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v35 = result;
  v79 = v31;
  objc_msgSend(result, "layoutIfNeeded");

  v36 = (void *)objc_opt_self(NSLayoutConstraint);
  v37 = *(uint64_t (**)(void))((swift_isaMask & *v23) + 0x368);
  v38 = v37();
  v77 = sub_10001A208(0, (unint64_t *)&qword_10003F6A0, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v38);
  v78 = v36;
  objc_msgSend(v36, "deactivateConstraints:", isa);

  v40 = sub_100018DCC((uint64_t *)&unk_10003F0B0);
  v41 = swift_allocObject(v40, 72, 7);
  *(_OWORD *)(v41 + 16) = xmmword_100027820;
  result = objc_msgSend(v23, "view");
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v42 = result;
  v43 = objc_msgSend(result, "widthAnchor");

  v44 = *(uint64_t (**)(void))((swift_isaMask & *v23) + 0x350);
  v45 = (void *)v44();
  v46 = objc_msgSend(v45, "widthAnchor");

  v47 = objc_msgSend(v43, "constraintEqualToAnchor:", v46);
  *(_QWORD *)(v41 + 32) = v47;
  result = objc_msgSend(v23, "view");
  if (result)
  {
    v48 = result;
    v49 = objc_msgSend(result, "heightAnchor");

    v50 = objc_msgSend(v49, "constraintEqualToConstant:", *v33);
    *(_QWORD *)(v41 + 40) = v50;
    v51 = (void *)v44();
    v52 = objc_msgSend(v51, "heightAnchor");

    v53 = objc_msgSend(v52, "constraintEqualToConstant:", *v33);
    *(_QWORD *)(v41 + 48) = v53;
    v54 = (void *)v44();
    v55 = objc_msgSend(v54, "widthAnchor");

    v56 = objc_msgSend(v55, "constraintEqualToConstant:", *(double *)sub_100022C18());
    *(_QWORD *)(v41 + 56) = v56;
    *(_QWORD *)(v41 + 64) = v79();
    aBlock[0] = v41;
    specialized Array._endMutation()();
    v57 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v23) + 0x370))(aBlock[0]);
    v58 = ((uint64_t (*)(uint64_t))v37)(v57);
    v59 = v58;
    if ((unint64_t)v58 >> 62)
    {
      if (v58 < 0)
        v65 = v58;
      else
        v65 = v58 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v58);
      result = (id)_CocoaArrayWrapper.endIndex.getter(v65);
      v60 = (uint64_t)result;
      if (result)
        goto LABEL_8;
    }
    else
    {
      v60 = *(_QWORD *)((v58 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = (id)swift_bridgeObjectRetain(v58);
      if (v60)
      {
LABEL_8:
        if (v60 >= 1)
        {
          v61 = 0;
          do
          {
            if ((v59 & 0xC000000000000001) != 0)
              v62 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v61, v59);
            else
              v62 = *(id *)(v59 + 8 * v61 + 32);
            v64 = v62;
            ++v61;
            LODWORD(v63) = 1144750080;
            objc_msgSend(v62, "setPriority:", v63);

          }
          while (v60 != v61);
          goto LABEL_18;
        }
        __break(1u);
        goto LABEL_20;
      }
    }
LABEL_18:
    v66 = swift_bridgeObjectRelease_n(v59, 2);
    v67 = ((uint64_t (*)(uint64_t))v37)(v66);
    v68 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v67);
    objc_msgSend(v78, "activateConstraints:", v68);

    v69 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v23) + 0x2A8))();
    objc_msgSend(v69, "setHidden:", 0);

    v70 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v23) + 0x2D8))();
    objc_msgSend(v70, "setEnabled:", 1);

    v71 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v23) + 0x2C0))();
    objc_msgSend(v71, "setEnabled:", 1);

    v72 = objc_msgSend(v23, "systemApertureElementContext");
    objc_msgSend(v72, "setElementNeedsUpdate");
    return (id)swift_unknownObjectRelease(v72);
  }
LABEL_22:
  __break(1u);
  return result;
}

id sub_100015C4C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *);
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  id result;
  _QWORD *v42;
  int v43;
  char *v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint8_t *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  NSString v53;
  NSURL *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t inited;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  Class isa;
  uint64_t v66;
  uint64_t (*v67)(uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  char *v77;
  char *v78;
  _QWORD *v79;
  uint64_t v80;
  char v81[128];
  uint64_t v82;
  uint64_t v83[2];

  v1 = sub_100018DCC(&qword_10003F098);
  __chkstk_darwin(v1);
  v3 = (char *)&v72 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v80 - 8);
  __chkstk_darwin(v80);
  v6 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Logger(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v72 - v13;
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v72 - v16;
  v18 = *(uint64_t (**)(uint64_t))((swift_isaMask & *v0) + 0x260);
  v79 = v0;
  v19 = v18(v15);
  if (v19)
  {
    v20 = (void *)v19;
    v78 = v14;
    v77 = v6;
    v21 = sub_10001DA68();
    v22 = v8;
    v23 = *(uint64_t (**)(char *))(v8 + 16);
    v76 = v21;
    v24 = v23(v17);
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v75 = v20;
      v27 = (uint8_t *)swift_slowAlloc(12, -1);
      v28 = swift_slowAlloc(32, -1);
      v74 = v4;
      v29 = v28;
      v83[0] = v28;
      v73 = v22;
      *(_DWORD *)v27 = 136315138;
      v82 = sub_1000184E8(0x746F68506E65706FLL, 0xEC0000002928736FLL, v83);
      v20 = v75;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v82, v83);
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "%s", v27, 0xCu);
      swift_arrayDestroy(v29, 1, (char *)&type metadata for Any + 8);
      v30 = v29;
      v4 = v74;
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v27, -1, -1);

      v31 = *(uint64_t (**)(char *, uint64_t))(v73 + 8);
    }
    else
    {

      v31 = *(uint64_t (**)(char *, uint64_t))(v22 + 8);
    }
    v32 = v31(v17, v7);
    v42 = v79;
    (*(void (**)(uint64_t))((swift_isaMask & *v79) + 0x2F0))(v32);
    v43 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v3, 1, v80);
    v44 = v78;
    if (v43 == 1)
    {
      sub_100019700((uint64_t)v3, &qword_10003F098);
      v45 = ((uint64_t (*)(char *, uint64_t, uint64_t))v23)(v44, v76, v7);
      v46 = Logger.logObject.getter(v45);
      v47 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v46, v47))
      {
        v48 = v7;
        v49 = (uint8_t *)swift_slowAlloc(12, -1);
        v50 = swift_slowAlloc(32, -1);
        v83[0] = v50;
        *(_DWORD *)v49 = 136315138;
        v82 = sub_1000184E8(0x746F68506E65706FLL, 0xEC0000002928736FLL, v83);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v82, v83);
        _os_log_impl((void *)&_mh_execute_header, v46, v47, "%s photos URL is nil", v49, 0xCu);
        swift_arrayDestroy(v50, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v50, -1, -1);
        swift_slowDealloc(v49, -1, -1);

        return (id)v31(v44, v48);
      }
      else
      {

        return (id)v31(v44, v7);
      }
    }
    else
    {
      v51 = v77;
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v77, v3, v80);
      v52 = *((_QWORD *)sub_100023598() + 1);
      swift_bridgeObjectRetain(v52);
      v53 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v52);
      objc_msgSend(v20, "setState:", v53);

      result = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
      if (result)
      {
        v55 = result;
        v56 = v4;
        URL._bridgeToObjectiveC()(v54);
        v58 = v57;
        v59 = sub_100018DCC(&qword_10003F3C0);
        inited = swift_initStackObject(v59, v81);
        *(_OWORD *)(inited + 16) = xmmword_100027830;
        *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyUnlockDevice, v61);
        *(_QWORD *)(inited + 40) = v62;
        *(_QWORD *)(inited + 72) = &type metadata for Bool;
        *(_BYTE *)(inited + 48) = 1;
        *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyPromptUnlockDevice, v62);
        *(_QWORD *)(inited + 88) = v63;
        *(_QWORD *)(inited + 120) = &type metadata for Bool;
        *(_BYTE *)(inited + 96) = 1;
        v64 = sub_1000163B8(inited);
        isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v64);
        objc_msgSend(v55, "openSensitiveURL:withOptions:", v58, isa);

        v66 = *sub_10001AAA8();
        v67 = *(uint64_t (**)(uint64_t))((swift_isaMask & *v42) + 0x200);
        v68 = swift_retain(v66);
        v69 = v67(v68);
        v71 = v70;
        (*(void (**)(uint64_t))(*(_QWORD *)v66 + 200))(v69);

        swift_release(v66);
        swift_bridgeObjectRelease(v71);
        return (id)(*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v51, v80);
      }
      else
      {
        __break(1u);
      }
    }
  }
  else
  {
    v33 = sub_10001DA68();
    v34 = v8;
    v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v33, v7);
    v36 = v7;
    v37 = Logger.logObject.getter(v35);
    v38 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc(12, -1);
      v40 = swift_slowAlloc(32, -1);
      v83[0] = v40;
      *(_DWORD *)v39 = 136315138;
      v82 = sub_1000184E8(0x746F68506E65706FLL, 0xEC0000002928736FLL, v83);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v82, v83);
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "%s error loading views", v39, 0xCu);
      swift_arrayDestroy(v40, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v40, -1, -1);
      swift_slowDealloc(v39, -1, -1);
    }

    return (id)(*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v11, v36);
  }
  return result;
}

unint64_t sub_1000163B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100018DCC(&qword_10003F3C8);
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
    sub_100019ED8(v7, (uint64_t)&v16, &qword_10003F3D0);
    v8 = v16;
    v9 = v17;
    result = sub_100018BD8(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_100019F1C(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 48;
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

uint64_t sub_100016520()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *);
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  void *v41;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  Class isa;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  NSObject *v59;
  int v60;
  uint8_t *v61;
  void *v62;
  void (*v63)(char *, uint64_t);
  char *v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  void *v69;
  _QWORD *v70;
  NSObject *v71;
  os_log_type_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  _QWORD *v76;
  uint64_t v77;
  id v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(char *);
  char *v88;
  char *v89;
  id v90;
  id v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  id aBlock[5];
  uint64_t v96;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v87 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v87 - v8;
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v87 - v11;
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v87 - v14;
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v87 - v17;
  v19 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v0) + 0x308))(v16);
  if (v20)
  {
    v21 = v20;
    v22 = v3;
    v23 = v19;
    v88 = v12;
    v24 = sub_10001DA68();
    v92 = v22;
    v93 = (char *)v24;
    v25 = *(void (**)(char *))(v22 + 16);
    v25(v18);
    v26 = swift_bridgeObjectRetain_n(v21, 2);
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.default.getter();
    v29 = os_log_type_enabled(v27, v28);
    v89 = v6;
    v90 = v1;
    if (v29)
    {
      v30 = swift_slowAlloc(22, -1);
      v87 = v25;
      v31 = v30;
      v32 = (void *)swift_slowAlloc(64, -1);
      v91 = (id)v2;
      v33 = v32;
      aBlock[0] = v32;
      *(_DWORD *)v31 = 136315394;
      v94 = sub_1000184E8(0xD000000000000011, 0x800000010002F3B0, (uint64_t *)aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v94, aBlock);
      *(_WORD *)(v31 + 12) = 2080;
      swift_bridgeObjectRetain(v21);
      v94 = sub_1000184E8(v23, v21, (uint64_t *)aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v94, aBlock);
      swift_bridgeObjectRelease_n(v21, 3);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "%s start identifier=%s", (uint8_t *)v31, 0x16u);
      swift_arrayDestroy(v33, 2, (char *)&type metadata for Any + 8);
      v34 = v33;
      v2 = (uint64_t)v91;
      swift_slowDealloc(v34, -1, -1);
      v35 = v31;
      v25 = v87;
      swift_slowDealloc(v35, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v21, 2);
    }
    v92 = *(_QWORD *)(v92 + 8);
    ((void (*)(char *, uint64_t))v92)(v18, v2);
    v43 = (void *)objc_opt_self(PHAsset);
    v44 = sub_100018DCC(&qword_10003F148);
    v45 = swift_allocObject(v44, 48, 7);
    *(_OWORD *)(v45 + 16) = xmmword_100027810;
    *(_QWORD *)(v45 + 32) = v23;
    *(_QWORD *)(v45 + 40) = v21;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v45);
    v47 = objc_msgSend(v43, "fetchAssetsWithLocalIdentifiers:options:", isa, 0);

    v48 = objc_msgSend(v47, "firstObject");
    if (v48)
    {
      v49 = objc_msgSend((id)objc_opt_self(PHPhotoLibrary), "sharedPhotoLibrary");
      v50 = swift_allocObject(&unk_1000355C0, 24, 7);
      *(_QWORD *)(v50 + 16) = v48;
      aBlock[4] = sub_100019E14;
      v96 = v50;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = (id)1107296256;
      aBlock[2] = sub_1000086D8;
      aBlock[3] = &unk_1000355D8;
      v51 = _Block_copy(aBlock);
      v52 = v96;
      v53 = v48;
      swift_release(v52);
      aBlock[0] = 0;
      LODWORD(v52) = objc_msgSend(v49, "performChangesAndWait:error:", v51, aBlock);
      _Block_release(v51);

      v54 = aBlock[0];
      if (!(_DWORD)v52)
      {
        v55 = v54;
        v56 = _convertNSErrorToError(_:)();

        swift_willThrow();
        v57 = v89;
        v58 = ((uint64_t (*)(char *, char *, uint64_t))v25)(v89, v93, v2);
        v59 = Logger.logObject.getter(v58);
        v60 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v59, (os_log_type_t)v60))
        {
          v87 = v25;
          v61 = (uint8_t *)swift_slowAlloc(12, -1);
          v62 = (void *)swift_slowAlloc(32, -1);
          aBlock[0] = v62;
          v91 = v53;
          *(_DWORD *)v61 = 136315138;
          v94 = sub_1000184E8(0xD000000000000011, 0x800000010002F3B0, (uint64_t *)aBlock);
          v25 = v87;
          v53 = v91;
          v63 = (void (*)(char *, uint64_t))v92;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v94, aBlock);
          _os_log_impl((void *)&_mh_execute_header, v59, (os_log_type_t)v60, "%s asset deletion failed", v61, 0xCu);
          swift_arrayDestroy(v62, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v62, -1, -1);
          swift_slowDealloc(v61, -1, -1);
          swift_errorRelease(v56);

          v63(v89, v2);
        }
        else
        {
          swift_errorRelease(v56);

          ((void (*)(char *, uint64_t))v92)(v57, v2);
        }
      }
      ((void (*)(char *, char *, uint64_t))v25)(v15, v93, v2);
      v70 = v90;
      v71 = Logger.logObject.getter(v70);
      v72 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v71, v72))
      {
        v73 = swift_slowAlloc(22, -1);
        v93 = v15;
        v74 = v73;
        v75 = (_QWORD *)swift_slowAlloc(8, -1);
        v90 = (id)swift_slowAlloc(32, -1);
        v91 = (id)v2;
        aBlock[0] = v90;
        *(_DWORD *)v74 = 136315394;
        v94 = sub_1000184E8(0xD000000000000011, 0x800000010002F3B0, (uint64_t *)aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v94, aBlock);
        *(_WORD *)(v74 + 12) = 2112;
        v94 = (uint64_t)v70;
        v76 = v70;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v94, aBlock);
        *v75 = v70;

        _os_log_impl((void *)&_mh_execute_header, v71, v72, "%s self=%@ done", (uint8_t *)v74, 0x16u);
        v77 = sub_100018DCC(&qword_10003F0C0);
        swift_arrayDestroy(v75, 1, v77);
        swift_slowDealloc(v75, -1, -1);
        v78 = v90;
        swift_arrayDestroy(v90, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v78, -1, -1);
        swift_slowDealloc(v74, -1, -1);

        v79 = v93;
        v80 = (uint64_t)v91;
      }
      else
      {

        v79 = v15;
        v80 = v2;
      }
      ((void (*)(char *, uint64_t))v92)(v79, v80);
      v81 = *sub_10001AAA8();
      v82 = *(uint64_t (**)(uint64_t))((swift_isaMask & *v70) + 0x200);
      v83 = swift_retain(v81);
      v84 = v82(v83);
      v86 = v85;
      (*(void (**)(uint64_t))(*(_QWORD *)v81 + 200))(v84);

      swift_release(v81);
      return swift_bridgeObjectRelease(v86);
    }
    else
    {
      v64 = v88;
      v65 = ((uint64_t (*)(char *, char *, uint64_t))v25)(v88, v93, v2);
      v66 = Logger.logObject.getter(v65);
      v67 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v66, v67))
      {
        v68 = (uint8_t *)swift_slowAlloc(12, -1);
        v69 = (void *)swift_slowAlloc(32, -1);
        aBlock[0] = v69;
        *(_DWORD *)v68 = 136315138;
        v94 = sub_1000184E8(0xD000000000000011, 0x800000010002F3B0, (uint64_t *)aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v94, aBlock);
        _os_log_impl((void *)&_mh_execute_header, v66, v67, "%s photos asset is nil", v68, 0xCu);
        swift_arrayDestroy(v69, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v69, -1, -1);
        swift_slowDealloc(v68, -1, -1);
      }

      return ((uint64_t (*)(char *, uint64_t))v92)(v64, v2);
    }
  }
  else
  {
    v36 = sub_10001DA68();
    v37 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v36, v2);
    v38 = Logger.logObject.getter(v37);
    v39 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc(12, -1);
      v41 = (void *)swift_slowAlloc(32, -1);
      aBlock[0] = v41;
      *(_DWORD *)v40 = 136315138;
      v94 = sub_1000184E8(0xD000000000000011, 0x800000010002F3B0, (uint64_t *)aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v94, aBlock);
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "%s photos identifier is nil", v40, 0xCu);
      swift_arrayDestroy(v41, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v41, -1, -1);
      swift_slowDealloc(v40, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
  }
}

uint64_t sub_100016FC8(void *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjCClassFromMetadata;
  id v18;
  NSString v19;
  NSString v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  NSString v30;
  NSString v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  char v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  void *v49;
  id v50;
  id v51;
  char v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  void *v60;
  id v61;
  id v62;
  char v63;
  NSString v64;
  uint64_t result;
  id v66;
  UIAccessibilityNotifications notification;

  v4 = v3;
  v8 = sub_100023234();
  v9 = v8[1];
  v10 = *v8 == a2 && v9 == a3;
  if (v10
    || (_stringCompareWithSmolCheck(_:_:expecting:)(a2, a3, *v8, v9, 0) & 1) != 0
    || ((v11 = sub_10002324C(), v12 = v11[1], *v11 == a2) ? (v13 = v12 == a3) : (v13 = 0),
        v13
     || (_stringCompareWithSmolCheck(_:_:expecting:)(a2, a3, *v11, v12, 0) & 1) != 0
     || (v14 = sub_100023264(), v15 = v14[1], *v14 == a2) && v15 == a3
     || (_stringCompareWithSmolCheck(_:_:expecting:)(a2, a3, *v14, v15, 0) & 1) != 0))
  {
    notification = UIAccessibilityAnnouncementNotification;
    v16 = type metadata accessor for RPSystemApertureElementViewController(0);
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v16);
    v18 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
    v19 = String._bridgeToObjectiveC()();
    v20 = String._bridgeToObjectiveC()();
    v21 = a1;
    v22 = objc_msgSend(v18, "localizedStringForKey:value:table:", v19, 0, v20);

    static String._unconditionallyBridgeFromObjectiveC(_:)(v22, v23);
    v25 = v24;

    a1 = v21;
    v26 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v25);
    UIAccessibilityPostNotification(notification, v26);

  }
  v27 = type metadata accessor for RPSystemApertureElementViewController(0);
  v28 = swift_getObjCClassFromMetadata(v27);
  v29 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", v28);
  v30 = String._bridgeToObjectiveC()();
  v31 = String._bridgeToObjectiveC()();
  v32 = objc_msgSend(v29, "localizedStringForKey:value:table:", v30, 0, v31);

  v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32, v33);
  v36 = v35;

  v37 = *(void **)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingView];
  if (v37)
  {
    sub_10001A208(0, &qword_10003F3B0, UIView_ptr);
    v38 = v37;
    v39 = a1;
    v40 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

    if ((v40 & 1) != 0)
    {
      v41 = *(void **)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView];
      if (!v41)
        goto LABEL_33;
      v42 = objc_msgSend(v41, "accessibilityLabel");
      if (!v42)
        goto LABEL_33;
      v44 = v42;
      v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(v42, v43);
      v47 = v46;

      if (v45 == v34 && v47 == v36)
      {
        swift_bridgeObjectRelease(v36);
      }
      else
      {
        v48 = _stringCompareWithSmolCheck(_:_:expecting:)(v45, v47, v34, v36, 0);
        swift_bridgeObjectRelease(v47);
        if ((v48 & 1) == 0)
          goto LABEL_33;
      }
    }
  }
  v49 = *(void **)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView];
  if (v49)
  {
    sub_10001A208(0, &qword_10003F3B0, UIView_ptr);
    v50 = a1;
    v51 = v49;
    v52 = static NSObject.== infix(_:_:)(v50, v51);

    if ((v52 & 1) != 0)
    {
      if (!v37)
        goto LABEL_33;
      v53 = objc_msgSend(v37, "accessibilityLabel");
      if (!v53)
        goto LABEL_33;
      v55 = v53;
      v56 = static String._unconditionallyBridgeFromObjectiveC(_:)(v53, v54);
      v58 = v57;

      if (v56 == v34 && v58 == v36)
      {
        swift_bridgeObjectRelease(v36);
      }
      else
      {
        v59 = _stringCompareWithSmolCheck(_:_:expecting:)(v56, v58, v34, v36, 0);
        swift_bridgeObjectRelease(v58);
        if ((v59 & 1) == 0)
          goto LABEL_33;
      }
    }
  }
  v60 = *(void **)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalView];
  if (!v60)
    return swift_bridgeObjectRelease(v36);
  sub_10001A208(0, &qword_10003F3B0, UIView_ptr);
  v61 = a1;
  v62 = v60;
  v63 = static NSObject.== infix(_:_:)(v61, v62);

  if ((v63 & 1) == 0)
    return swift_bridgeObjectRelease(v36);
LABEL_33:
  v64 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v36);
  objc_msgSend(a1, "setAccessibilityLabel:", v64);

  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || (result = _AXSCommandAndControlEnabled(), (_DWORD)result))
  {
    v66 = objc_msgSend(v4, "systemApertureElementContext");
    objc_msgSend(v66, "setElementNeedsUpdate");
    return swift_unknownObjectRelease(v66);
  }
  return result;
}

id sub_1000174F4(uint64_t a1, uint64_t a2, void *a3)
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

id sub_100017568(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  char *v7;
  char *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  NSString v27;
  id v28;
  objc_super v30;

  *(_QWORD *)&v3[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_activeLayoutMode] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_contentRole] = 2;
  *(_QWORD *)&v3[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredLayoutMode] = 3;
  *(_QWORD *)&v3[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_maximumLayoutMode] = 4;
  *(_QWORD *)&v3[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_statusBarStyleOverridesToSuppress] = 0x100000;
  v6 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredHeightForBottomSafeArea;
  v7 = v3;
  *(_QWORD *)&v3[v6] = *(_QWORD *)sub_100022C64();
  v8 = &v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_sessionID];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_presentationBehaviors] = 666;
  v9 = (void *)SBUISystemApertureElementIdentifierScreenRecording;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_elementIdentifier] = SBUISystemApertureElementIdentifierScreenRecording;
  v10 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingView;
  v11 = (objc_class *)type metadata accessor for RPSessionAccessoryView();
  v12 = objc_allocWithZone(v11);
  v13 = v9;
  *(_QWORD *)&v7[v10] = sub_100008CF8(0);
  v14 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView;
  v15 = objc_allocWithZone(v11);
  *(_QWORD *)&v7[v14] = sub_100008CF8(1);
  v16 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalView;
  v17 = objc_allocWithZone(v11);
  *(_QWORD *)&v7[v16] = sub_100008CF8(2);
  v18 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_timerLabel;
  *(_QWORD *)&v7[v18] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v19 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_screenRecordingLabel;
  *(_QWORD *)&v7[v19] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  *(_QWORD *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingPackageView] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingPackageView] = 0;
  v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_recordingState] = 1;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___buttonStackView] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___viewButton] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___deleteButton] = 0;
  v20 = &v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosURL];
  v21 = type metadata accessor for URL(0);
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
  v22(v20, 1, 1, v21);
  v23 = &v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosIdentifier];
  *(_QWORD *)v23 = 0;
  *((_QWORD *)v23 + 1) = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___stopButton] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___customViewHeightConstraint[0]] = 0;
  v24 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customView;
  *(_QWORD *)&v7[v24] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  *(_QWORD *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customViewLayoutConstraints] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_accessoryViewLayoutConstraints] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalViewLayoutConstraints] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customViewElementLayoutConstraints] = &_swiftEmptyArrayStorage;
  v25 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_keyColor;
  *(_QWORD *)&v7[v25] = objc_msgSend((id)objc_opt_self(UIColor), "grayColor");
  v26 = &v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_associatedAppBundleIdentifier];
  *(_QWORD *)v26 = 0;
  *((_QWORD *)v26 + 1) = 0;
  v22(&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_launchURL], 1, 1, v21);
  v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_countdownPaused] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_completionTimer] = 0;
  v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_inExpandedButtonView] = 0;

  if (a2)
  {
    v27 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v27 = 0;
  }
  v30.receiver = v7;
  v30.super_class = (Class)type metadata accessor for RPSystemApertureElementViewController(0);
  v28 = objc_msgSendSuper2(&v30, "initWithNibName:bundle:", v27, a3);

  return v28;
}

id sub_100017928(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  id v24;
  objc_super v26;

  *(_QWORD *)&v1[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_activeLayoutMode] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_contentRole] = 2;
  *(_QWORD *)&v1[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredLayoutMode] = 3;
  *(_QWORD *)&v1[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_maximumLayoutMode] = 4;
  *(_QWORD *)&v1[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_statusBarStyleOverridesToSuppress] = 0x100000;
  v3 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredHeightForBottomSafeArea;
  v4 = v1;
  *(_QWORD *)&v1[v3] = *(_QWORD *)sub_100022C64();
  v5 = &v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_sessionID];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_presentationBehaviors] = 666;
  v6 = (void *)SBUISystemApertureElementIdentifierScreenRecording;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_elementIdentifier] = SBUISystemApertureElementIdentifierScreenRecording;
  v7 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingView;
  v8 = (objc_class *)type metadata accessor for RPSessionAccessoryView();
  v9 = objc_allocWithZone(v8);
  v10 = v6;
  *(_QWORD *)&v4[v7] = sub_100008CF8(0);
  v11 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView;
  v12 = objc_allocWithZone(v8);
  *(_QWORD *)&v4[v11] = sub_100008CF8(1);
  v13 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalView;
  v14 = objc_allocWithZone(v8);
  *(_QWORD *)&v4[v13] = sub_100008CF8(2);
  v15 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_timerLabel;
  *(_QWORD *)&v4[v15] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v16 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_screenRecordingLabel;
  *(_QWORD *)&v4[v16] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  *(_QWORD *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingPackageView] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingPackageView] = 0;
  v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_recordingState] = 1;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___buttonStackView] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___viewButton] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___deleteButton] = 0;
  v17 = &v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosURL];
  v18 = type metadata accessor for URL(0);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v17, 1, 1, v18);
  v20 = &v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosIdentifier];
  *(_QWORD *)v20 = 0;
  *((_QWORD *)v20 + 1) = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___stopButton] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___customViewHeightConstraint[0]] = 0;
  v21 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customView;
  *(_QWORD *)&v4[v21] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  *(_QWORD *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customViewLayoutConstraints] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_accessoryViewLayoutConstraints] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalViewLayoutConstraints] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customViewElementLayoutConstraints] = &_swiftEmptyArrayStorage;
  v22 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_keyColor;
  *(_QWORD *)&v4[v22] = objc_msgSend((id)objc_opt_self(UIColor), "grayColor");
  v23 = &v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_associatedAppBundleIdentifier];
  *(_QWORD *)v23 = 0;
  *((_QWORD *)v23 + 1) = 0;
  v19(&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_launchURL], 1, 1, v18);
  v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_countdownPaused] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_completionTimer] = 0;
  v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_inExpandedButtonView] = 0;

  v26.receiver = v4;
  v26.super_class = (Class)type metadata accessor for RPSystemApertureElementViewController(0);
  v24 = objc_msgSendSuper2(&v26, "initWithCoder:", a1);

  return v24;
}

id sub_100017C74()
{
  return sub_100017C84(0, (uint64_t (*)(void))type metadata accessor for RPSystemApertureElementViewController);
}

id sub_100017C84(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

void sub_100017E78(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_100017E80@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_100017E94@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_100017EA8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100017EBC(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_100017EEC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
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

uint64_t *sub_100017F18@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

_QWORD *sub_100017F3C(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_100017F50(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_100017F64(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_100017F78@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100017F8C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_100017FA0(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_100017FB4(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_100017FC8()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_100017FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

_QWORD *sub_100017FF0(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t sub_100018004(uint64_t a1, uint64_t a2)
{
  return sub_1000182B4(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100018010(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_100018084(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_100018100@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a1, a2);
  v5 = v4;
  v6 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v5);
  *a3 = v6;
  return result;
}

_QWORD *sub_100018140@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100018150(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_10001815C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100018170@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_100019DDC(a1);
  result = swift_bridgeObjectRelease(a1);
  *a2 = v4;
  return result;
}

_QWORD *sub_1000181AC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1000181B8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_1000181FC@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  _QWORD *v2;
  uint64_t result;
  uint64_t v5;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v2, a1);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_100018224(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100019C94(&qword_10003F3A0, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100027DF0);
  v3 = sub_100019C94(&qword_10003F3A8, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100027D98);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000182A8(uint64_t a1, uint64_t a2)
{
  return sub_1000182B4(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000182B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3, a2);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_1000182F0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v2, a2);
  v6 = v5;
  String.hash(into:)(a1, v4, v5);
  return swift_bridgeObjectRelease(v6);
}

Swift::Int sub_100018330(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Int v7;
  _QWORD v9[9];

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v2, a2);
  v6 = v5;
  Hasher.init(_seed:)(v9, a1);
  String.hash(into:)(v9, v4, v6);
  v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return v7;
}

uint64_t sub_1000183A0(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1, a2);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2, v4);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_100018428(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  if (!((unint64_t)a1 >> 62))
    return *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (a1 < 0)
    v3 = a1;
  else
    v3 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a1);
  v4 = _CocoaArrayWrapper.endIndex.getter(v3);
  swift_bridgeObjectRelease(a1);
  return v4;
}

uint64_t sub_100018484(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_1000184E8(0xD00000000000001DLL, 0x800000010002EB20, a3);
  v5 = *a1 + 8;
  v7 = v4;
  result = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v7, &v8);
  *a1 = v5;
  return result;
}

uint64_t sub_1000184E8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000185B8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10001A4C8((uint64_t)v12, *a3);
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
      sub_10001A4C8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10001A4A8(v12);
  return v7;
}

uint64_t sub_1000185B8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100018770(a5, a6);
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

uint64_t sub_100018770(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100018804(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000189DC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000189DC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100018804(uint64_t a1, unint64_t a2)
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
      v5 = sub_100018978(v4, 0);
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

_QWORD *sub_100018978(uint64_t a1, uint64_t a2)
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
  v4 = sub_100018DCC(&qword_10003F3E8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000189DC(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100018DCC(&qword_10003F3E8);
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

void sub_100018B28(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a4();
  v7 = (void *)v6;
  v8 = *a1 + 8;
  if (v6)
    v10 = v6;
  else
    v10 = 0;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11);
  *a1 = v8;
  v9 = *a2;
  if (*a2)
  {
    *v9 = v7;
    *a2 = v9 + 1;
  }
  else
  {

  }
}

unint64_t sub_100018BD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100018C3C(a1, a2, v5);
}

unint64_t sub_100018C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100018D1C(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100034E00, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3)
    return 3;
  else
    return v3;
}

uint64_t type metadata accessor for RPSessionAccessoryView()
{
  return objc_opt_self(_TtC14ReplayKitAngel22RPSessionAccessoryView);
}

unint64_t sub_100018D84(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100034E68, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 8)
    return 8;
  else
    return v3;
}

uint64_t sub_100018DCC(uint64_t *a1)
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

uint64_t sub_100018E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100018DCC(&qword_10003F098);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for RPSystemApertureElementViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_10003FD80;
  if (!qword_10003FD80)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for RPSystemApertureElementViewController);
  return result;
}

id sub_100018E90()
{
  return sub_100015C4C();
}

uint64_t sub_100018EB0()
{
  return sub_100016520();
}

uint64_t sub_100018ED0()
{
  id *v0;

  return swift_deallocObject(v0, 64, 7);
}

void sub_100018F1C()
{
  uint64_t v0;

  sub_10000EAEC(*(_QWORD **)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(void **)(v0 + 40), *(void **)(v0 + 48), *(void **)(v0 + 56));
}

uint64_t sub_100018F2C(void *a1)
{
  uint64_t v1;

  return sub_100010914(a1, *(_QWORD **)(v1 + 16));
}

void sub_100018F38()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[5];
  _QWORD *v11;

  v2 = (void *)v0[2];
  v1 = v0[3];
  v3 = v0[4];
  v4 = (void *)objc_opt_self(UIView);
  v5 = *(double *)sub_100022F70();
  v6 = (_QWORD *)swift_allocObject(&unk_100035750, 40, 7);
  v6[2] = v2;
  v6[3] = v1;
  v6[4] = v3;
  v10[4] = sub_10001A344;
  v11 = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_1000086D8;
  v10[3] = &unk_100035768;
  v7 = _Block_copy(v10);
  v8 = v11;
  v9 = v2;
  swift_bridgeObjectRetain(v3);
  swift_release(v8);
  objc_msgSend(v4, "animateWithDuration:animations:", v7, v5);
  _Block_release(v7);
}

unint64_t sub_100019028()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003F140;
  if (!qword_10003F140)
  {
    v1 = sub_100019074(&qword_10003F138);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10003F140);
  }
  return result;
}

uint64_t sub_100019074(uint64_t *a1)
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

uint64_t sub_1000190B8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000190C8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

void sub_1000190FC(void *a1)
{
  _QWORD *v1;
  uint64_t v3;
  void *v4;
  void *v5;
  _BYTE *v6;
  NSString v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  NSString v16;
  void *v17;
  double v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  UIAccessibilityNotifications v23;
  uint64_t v24;
  uint64_t ObjCClassFromMetadata;
  id v26;
  NSString v27;
  NSString v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSString v33;
  id aBlock[3];
  void *v35;
  id (*v36)();
  uint64_t v37;
  void *v38;
  _OWORD v39[2];
  char v40[24];

  v3 = v1[2];
  v4 = (void *)v1[3];
  v5 = (void *)v1[4];
  v6 = (_BYTE *)(v3 + 16);
  swift_beginAccess(v3 + 16, v40, 0, 0);
  if ((*(_BYTE *)(v3 + 16) & 1) == 0)
  {
    v7 = String._bridgeToObjectiveC()();
    v8 = objc_msgSend(v4, "publishedObjectWithName:", v7);

    if (v8)
    {
      _bridgeAnyObjectToAny(_:)(v39, v8);
      swift_unknownObjectRelease(v8);
    }
    else
    {
      memset(v39, 0, sizeof(v39));
    }
    sub_1000196A8((uint64_t)v39, (uint64_t)aBlock);
    if (v35)
    {
      v9 = sub_10001A208(0, &qword_10003F3D8, CALayer_ptr);
      if ((swift_dynamicCast(&v38, aBlock, (char *)&type metadata for Any + 8, v9, 6) & 1) != 0)
      {
        v10 = v38;
        swift_beginAccess(v6, v39, 1, 0);
        *v6 = 1;
        if (a1)
        {
          v11 = objc_msgSend(a1, "CGImage");
          if (v11)
          {
            aBlock[0] = v11;
            type metadata accessor for CGImage(0);
            a1 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(aBlock, v12);

          }
          else
          {
            a1 = 0;
          }
        }
        objc_msgSend(v10, "setContents:", a1);
        swift_unknownObjectRelease(a1);
        objc_msgSend(v10, "setContentsGravity:", kCAGravityResizeAspectFill);
        v13 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
        v14 = objc_msgSend(v13, "CGColor");

        objc_msgSend(v10, "setBackgroundColor:", v14);
        sub_100011C58();
        v15 = *((_QWORD *)sub_10002358C() + 1);
        swift_bridgeObjectRetain(v15);
        v16 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v15);
        objc_msgSend(v4, "setState:", v16);

        v17 = (void *)objc_opt_self(UIView);
        v18 = *(double *)sub_100022C9C();
        v19 = swift_allocObject(&unk_100035700, 24, 7);
        *(_QWORD *)(v19 + 16) = v5;
        v36 = sub_10001A240;
        v37 = v19;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = (id)1107296256;
        aBlock[2] = sub_1000086D8;
        v35 = &unk_100035718;
        v20 = _Block_copy(aBlock);
        v21 = v37;
        v22 = v5;
        swift_release(v21);
        objc_msgSend(v17, "animateWithDuration:animations:", v20, v18);
        _Block_release(v20);
        if (UIAccessibilityIsVoiceOverRunning())
        {
          v23 = UIAccessibilityAnnouncementNotification;
          v24 = type metadata accessor for RPSystemApertureElementViewController(0);
          ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v24);
          v26 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
          v27 = String._bridgeToObjectiveC()();
          v28 = String._bridgeToObjectiveC()();
          v29 = objc_msgSend(v26, "localizedStringForKey:value:table:", v27, 0, v28);

          static String._unconditionallyBridgeFromObjectiveC(_:)(v29, v30);
          v32 = v31;

          v33 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v32);
          UIAccessibilityPostNotification(v23, v33);

        }
        else
        {

        }
      }
    }
    else
    {
      sub_100019700((uint64_t)aBlock, &qword_10003F150);
    }
  }
}

uint64_t sub_100019528()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v6 + 8));
  return swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_1000195C4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t *v3;

  v1 = *(_QWORD *)(type metadata accessor for URL(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (uint64_t *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_100013454(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), v0 + v2, *v3, v3[1]);
}

uint64_t sub_100019610()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

double sub_100019634()
{
  uint64_t v0;

  return sub_1000138FC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_10001963C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_100019668()
{
  uint64_t v0;

  sub_10001416C(*(_QWORD **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100019670()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001969C()
{
  uint64_t v0;

  return sub_100014864(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD **)(v0 + 32));
}

uint64_t sub_1000196A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100018DCC(&qword_10003F150);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double sub_1000196F4()
{
  uint64_t v0;

  return sub_100014FAC(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_100019700(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100018DCC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100019740()
{
  unint64_t result;

  result = qword_10003F158;
  if (!qword_10003F158)
  {
    result = swift_getWitnessTable(&unk_100027898, &type metadata for RPSessionAccessoryView.Role);
    atomic_store(result, (unint64_t *)&qword_10003F158);
  }
  return result;
}

unint64_t sub_100019788()
{
  unint64_t result;

  result = qword_10003F160;
  if (!qword_10003F160)
  {
    result = swift_getWitnessTable(&unk_100027938, &type metadata for RPSystemApertureElementViewController.RecordingState);
    atomic_store(result, (unint64_t *)&qword_10003F160);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for RPSessionAccessoryView.Role(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RPSessionAccessoryView.Role(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RPSessionAccessoryView.Role(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1000198B8 + 4 * byte_10002787D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1000198EC + 4 * byte_100027878[v4]))();
}

uint64_t sub_1000198EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000198F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000198FCLL);
  return result;
}

uint64_t sub_100019908(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100019910);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_100019914(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001991C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100019928(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100019934(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RPSessionAccessoryView.Role()
{
  return &type metadata for RPSessionAccessoryView.Role;
}

uint64_t sub_10001994C()
{
  return type metadata accessor for RPSystemApertureElementViewController(0);
}

void sub_100019954(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[20];
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v4[0] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[1] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[2] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[3] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[4] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[5] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[6] = &unk_100027A38;
  v4[7] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[8] = &unk_100027A50;
  v4[9] = &unk_100027A50;
  v4[10] = &unk_100027A50;
  v4[11] = &unk_100027A50;
  v4[12] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[13] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[14] = &unk_100027A50;
  v4[15] = &unk_100027A50;
  v4[16] = &unk_100027A68;
  v4[17] = &unk_100027A50;
  v4[18] = &unk_100027A50;
  v4[19] = &unk_100027A50;
  sub_100019A54(319);
  if (v3 <= 0x3F)
  {
    v5 = *(_QWORD *)(v2 - 8) + 64;
    v6 = &unk_100027A38;
    v7 = &unk_100027A50;
    v8 = &unk_100027A50;
    v9 = (char *)&value witness table for Builtin.UnknownObject + 64;
    v10 = (char *)&value witness table for Builtin.BridgeObject + 64;
    v11 = (char *)&value witness table for Builtin.BridgeObject + 64;
    v12 = (char *)&value witness table for Builtin.BridgeObject + 64;
    v13 = (char *)&value witness table for Builtin.BridgeObject + 64;
    v14 = &unk_100027A50;
    v15 = &unk_100027A38;
    v16 = v5;
    v17 = &unk_100027A80;
    v18 = &unk_100027A50;
    v19 = &unk_100027A80;
    swift_updateClassMetadata2(a1, 256, 35, v4, a1 + 80);
  }
}

void sub_100019A54(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10003F338)
  {
    v2 = type metadata accessor for URL(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10003F338);
  }
}

uint64_t getEnumTagSinglePayload for RPSystemApertureElementViewController.RecordingState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RPSystemApertureElementViewController.RecordingState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_100019B84 + 4 * byte_100027887[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_100019BB8 + 4 * byte_100027882[v4]))();
}

uint64_t sub_100019BB8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100019BC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100019BC8);
  return result;
}

uint64_t sub_100019BD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100019BDCLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_100019BE0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100019BE8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RPSystemApertureElementViewController.RecordingState()
{
  return &type metadata for RPSystemApertureElementViewController.RecordingState;
}

void type metadata accessor for SBUISystemApertureElementIdentifier(uint64_t a1)
{
  sub_10001A2D0(a1, &qword_10003F340, (uint64_t)&unk_100035508);
}

void type metadata accessor for SBUISystemAperturePresentationBehaviors(uint64_t a1)
{
  sub_10001A2D0(a1, &qword_10003F348, (uint64_t)&unk_100035530);
}

void type metadata accessor for _UIStatusBarStyleOverrides(uint64_t a1)
{
  sub_10001A2D0(a1, &qword_10003F350, (uint64_t)&unk_100035558);
}

void type metadata accessor for SBUISystemApertureContentRole(uint64_t a1)
{
  sub_10001A2D0(a1, &qword_10003F358, (uint64_t)&unk_100035580);
}

void type metadata accessor for SBUISystemApertureLayoutMode(uint64_t a1)
{
  sub_10001A2D0(a1, &qword_10003F360, (uint64_t)&unk_1000355A0);
}

uint64_t sub_100019C68()
{
  return sub_100019C94(&qword_10003F368, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemAperturePresentationBehaviors, (uint64_t)&unk_100027BD8);
}

uint64_t sub_100019C94(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100019CD4()
{
  return sub_100019C94(&qword_10003F370, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemAperturePresentationBehaviors, (uint64_t)&unk_100027BA8);
}

uint64_t sub_100019D00()
{
  return sub_100019C94(&qword_10003F378, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemAperturePresentationBehaviors, (uint64_t)&unk_100027C00);
}

uint64_t sub_100019D2C()
{
  return sub_100019C94(&qword_10003F380, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemAperturePresentationBehaviors, (uint64_t)&unk_100027C38);
}

uint64_t sub_100019D58()
{
  return sub_100019C94(&qword_10003F388, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100027D60);
}

uint64_t sub_100019D84()
{
  return sub_100019C94(&qword_10003F390, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100027D38);
}

uint64_t sub_100019DB0()
{
  return sub_100019C94(&qword_10003F398, (uint64_t (*)(uint64_t))type metadata accessor for SBUISystemApertureElementIdentifier, (uint64_t)&unk_100027DC8);
}

uint64_t sub_100019DDC(uint64_t a1)
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

void sub_100019E14()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  Class isa;
  uint64_t v7;

  v1 = *(void **)(v0 + 16);
  v2 = (void *)objc_opt_self(PHAssetChangeRequest);
  v3 = sub_100018DCC((uint64_t *)&unk_10003F0B0);
  v4 = swift_allocObject(v3, 40, 7);
  *(_OWORD *)(v4 + 16) = xmmword_100027840;
  *(_QWORD *)(v4 + 32) = v1;
  v7 = v4;
  specialized Array._endMutation()();
  sub_10001A208(0, &qword_10003F3B8, PHAsset_ptr);
  v5 = v1;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  objc_msgSend(v2, "deleteAssets:", isa);

}

uint64_t sub_100019ED8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100018DCC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_100019F1C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100019F2C()
{
  return sub_100011C58();
}

uint64_t sub_100019F4C()
{
  id *v0;

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100019F80()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSString v15;
  void *v16;
  uint64_t v17;
  NSString v18;

  v1 = v0;
  v2 = *(void **)(v0 + 16);
  v3 = *(_QWORD **)(v0 + 24);
  v4 = *(void **)(v1 + 32);
  v5 = objc_msgSend(v2, "layer");
  objc_msgSend(v5, "removeAllAnimations");

  v6 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v3) + 0x248))();
  v7 = objc_msgSend(v6, "layer");

  objc_msgSend(v7, "removeAllAnimations");
  v8 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v3) + 0x298))(6);
  v9 = *(uint64_t (**)(void))((swift_isaMask & *v3) + 0x320);
  v10 = (void *)((uint64_t (*)(uint64_t))v9)(v8);
  objc_msgSend(v10, "setEnabled:", 0);

  v11 = (void *)v9();
  objc_msgSend(v11, "setUserInteractionEnabled:", 0);

  v12 = (void *)v9();
  v13 = objc_msgSend(v12, "layer");

  objc_msgSend(v13, "setAllowsHitTesting:", 0);
  v14 = *((_QWORD *)sub_100023580() + 1);
  swift_bridgeObjectRetain(v14);
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  objc_msgSend(v4, "setState:animated:", v15, 1);

  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  v16 = *(void **)((char *)v3
                 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_screenRecordingLabel);
  v17 = sub_100023090()[1];
  swift_bridgeObjectRetain(v17);
  v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v17);
  objc_msgSend(v16, "setText:", v18);

  return sub_100011C58();
}

void sub_10001A168()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  double *v3;
  id v4;
  id v5;

  v1 = *(void **)(v0 + 16);
  v2 = *(_QWORD **)(v0 + 24);
  v3 = (double *)sub_100022E14();
  v4 = objc_msgSend(v1, "setAlpha:", *v3);
  v5 = (id)(*(uint64_t (**)(id))((swift_isaMask & *v2) + 0x248))(v4);
  objc_msgSend(v5, "setAlpha:", *v3);

}

uint64_t sub_10001A1E0(uint64_t a1)
{
  uint64_t v1;

  return sub_10000BFC4(a1, v1);
}

uint64_t sub_10001A208(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

id sub_10001A240()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  NSString v3;

  v1 = *(void **)(*(_QWORD *)(v0 + 16)
                + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_screenRecordingLabel);
  v2 = sub_100023168()[1];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  objc_msgSend(v1, "setText:", v3);

  return objc_msgSend(v1, "sizeToFit");
}

void type metadata accessor for CGImage(uint64_t a1)
{
  sub_10001A2D0(a1, (unint64_t *)&unk_10003F3F0, (uint64_t)&unk_100035908);
}

void sub_10001A2D0(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_10001A318()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_10001A344()
{
  uint64_t v0;
  NSString v1;
  id v2;

  v2 = (id)(*(uint64_t (**)(void))((swift_isaMask & **(_QWORD **)(v0 + 16)) + 0x248))();
  v1 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "setText:", v1);

}

id sub_10001A3C4()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t sub_10001A3CC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE **sub_10001A3DC(_BYTE **result)
{
  uint64_t v1;
  _BYTE *v2;

  v2 = *result;
  *v2 = *(_BYTE *)(v1 + 16);
  *result = v2 + 1;
  return result;
}

uint64_t sub_10001A3F0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001A400()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001A410()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001A420()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001A444()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_10001A464(uint64_t *a1, _QWORD **a2, uint64_t a3)
{
  uint64_t v3;

  sub_100018B28(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10001A46C()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))((swift_isaMask & **(_QWORD **)(v0 + 16)) + 0x448))(1);
}

uint64_t sub_10001A4A8(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10001A4C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_10001A508()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t sub_10001A5E4()
{
  return 0;
}

uint64_t sub_10001A5F0()
{
  return 0;
}

void sub_10001A5FC(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10001A608(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001A6A8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001A630(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001A6A8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001A658(_QWORD *a1)
{
  return sub_10001A848(a1, &qword_10003F460, (uint64_t (*)(void))sub_10001A6A8, (uint64_t)&type metadata for ReplayKitAttributes.ContentState.CodingKeys);
}

_QWORD *sub_10001A684(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10001A6A8()
{
  unint64_t result;

  result = qword_1000403D0;
  if (!qword_1000403D0)
  {
    result = swift_getWitnessTable(&unk_10002821C, &type metadata for ReplayKitAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000403D0);
  }
  return result;
}

Swift::Int sub_10001A6EC()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  return Hasher._finalize()();
}

uint64_t sub_10001A720(_QWORD *a1)
{
  return sub_10001A4A8(a1);
}

uint64_t sub_10001A744(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_10001A988(a1, a2, a3, &qword_10003F460, (uint64_t (*)(void))sub_10001A6A8, (uint64_t)&type metadata for ReplayKitAttributes.ContentState.CodingKeys);
}

Swift::Int sub_10001A770(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  return Hasher._finalize()();
}

uint64_t sub_10001A7A0@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease(a1);
  *a2 = 1;
  return result;
}

uint64_t sub_10001A7CC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001A918();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001A7F4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001A918();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001A81C(_QWORD *a1)
{
  return sub_10001A848(a1, &qword_10003F468, (uint64_t (*)(void))sub_10001A918, (uint64_t)&type metadata for ReplayKitAttributes.CodingKeys);
}

uint64_t sub_10001A848(_QWORD *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v7 = sub_100018DCC(a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a1[3];
  v12 = a1[4];
  sub_10001A684(a1, v11);
  v13 = a3();
  dispatch thunk of Encoder.container<A>(keyedBy:)(a4, a4, v13, v11, v12);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

unint64_t sub_10001A918()
{
  unint64_t result;

  result = qword_1000403D8[0];
  if (!qword_1000403D8[0])
  {
    result = swift_getWitnessTable(&unk_1000281CC, &type metadata for ReplayKitAttributes.CodingKeys);
    atomic_store(result, qword_1000403D8);
  }
  return result;
}

uint64_t sub_10001A95C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_10001A988(a1, a2, a3, &qword_10003F468, (uint64_t (*)(void))sub_10001A918, (uint64_t)&type metadata for ReplayKitAttributes.CodingKeys);
}

uint64_t sub_10001A988(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(void), uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v9 = sub_100018DCC(a4);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v14 = a1[4];
  sub_10001A684(a1, v13);
  v15 = a5();
  dispatch thunk of Encoder.container<A>(keyedBy:)(a6, a6, v15, v13, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_10001AA58()
{
  uint64_t v0;
  uint64_t result;

  v0 = type metadata accessor for RPSessionGateway();
  result = swift_initStaticObject(v0, &unk_1000403A0);
  qword_100040C50 = result;
  return result;
}

double sub_10001AA80()
{
  uint64_t v0;
  uint64_t v1;
  double result;

  v1 = swift_allocObject(v0, 48, 7);
  result = 0.0;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  return result;
}

uint64_t *sub_10001AAA8()
{
  if (qword_100040390 != -1)
    swift_once(&qword_100040390, sub_10001AA58);
  return &qword_100040C50;
}

uint64_t sub_10001AAE8()
{
  uint64_t v0;

  v0 = type metadata accessor for RPSessionGateway();
  return swift_initStaticObject(v0, &unk_1000403A0);
}

uint64_t sub_10001AB04()
{
  uint64_t v0;
  _BYTE v2[24];

  swift_beginAccess(v0 + 16, v2, 0, 0);
  return swift_retain(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10001AB38(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[24];

  swift_beginAccess(v1 + 16, v5, 1, 0);
  v3 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;
  return swift_release(v3);
}

void *sub_10001AB7C(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + 16, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10001ABB8()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  swift_beginAccess(v0 + 24, v3, 0, 0);
  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 32));
  return v1;
}

uint64_t sub_10001AC00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  _BYTE v7[24];

  swift_beginAccess(v2 + 24, v7, 1, 0);
  v5 = *(_QWORD *)(v2 + 32);
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_bridgeObjectRelease(v5);
}

void *sub_10001AC50(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + 24, a1, 33, 0);
  return &j__swift_endAccess;
}

void *sub_10001AC8C()
{
  uint64_t v0;
  void *v1;
  id v2;
  _BYTE v4[24];

  swift_beginAccess(v0 + 40, v4, 0, 0);
  v1 = *(void **)(v0 + 40);
  v2 = v1;
  return v1;
}

void sub_10001ACCC(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  _BYTE v4[24];

  swift_beginAccess(v1 + 40, v4, 1, 0);
  v3 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = a1;

}

void *sub_10001AD10(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + 40, a1, 33, 0);
  return &j_j__swift_endAccess;
}

uint64_t sub_10001AD4C()
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
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t, __n128);
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  __n128 v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
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
  uint64_t (*v45)(uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t, uint64_t, __n128);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70[2];

  v1 = v0;
  v2 = type metadata accessor for ActivityPresentationOptions(0);
  v63 = *(_QWORD *)(v2 - 8);
  v64 = v2;
  __chkstk_darwin(v2);
  v65 = (char *)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v62 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  v61 = (char *)&v59 - v9;
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v59 - v11;
  __chkstk_darwin(v10);
  v14 = (char *)&v59 - v13;
  v15 = sub_10001DA68();
  v16 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v5 + 16);
  v66 = v15;
  v67 = v16;
  v17 = ((uint64_t (*)(char *))v16)(v14);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "start()", v20, 2u);
    swift_slowDealloc(v20, -1, -1);
  }

  v21 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
  v22 = v21(v14, v4);
  v23 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 104))(v22);
  v24 = swift_release(v23);
  if (v23)
  {
    v67(v12, v66, v4, v24);
    v25 = swift_retain_n(v1, 2);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc(12, -1);
      v60 = swift_slowAlloc(32, -1);
      v70[0] = v60;
      *(_DWORD *)v28 = 136315138;
      v29 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 128))();
      if (v30)
      {
        v31 = v30;
      }
      else
      {
        v29 = 1819047246;
        v31 = 0xE400000000000000;
      }
      v68 = sub_1000184E8(v29, v31, v70);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69);
      swift_release_n(v1, 2);
      swift_bridgeObjectRelease(v31);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Stop existing session sessionID=%s", v28, 0xCu);
      v32 = v60;
      swift_arrayDestroy(v60, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v32, -1, -1);
      swift_slowDealloc(v28, -1, -1);

      v33 = v12;
      v34 = v4;
    }
    else
    {

      swift_release_n(v1, 2);
      v33 = v12;
      v34 = v4;
    }
    v35 = v21(v33, v34);
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 184))(v35);
  }
  v36 = *((_QWORD *)sub_1000231E4() + 1);
  v37 = sub_100018DCC(&qword_10003F470);
  v38 = type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination(0);
  v39 = *(_QWORD *)(v38 - 8);
  v40 = *(unsigned __int8 *)(v39 + 80);
  v41 = (v40 + 32) & ~v40;
  v42 = swift_allocObject(v37, v41 + *(_QWORD *)(v39 + 72), v40 | 7);
  *(_OWORD *)(v42 + 16) = xmmword_100027810;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v39 + 104))(v42 + v41, enum case for ActivityPresentationOptions.ActivityPresentationDestination.systemAperture(_:), v38);
  swift_bridgeObjectRetain(v36);
  v43 = v65;
  ActivityPresentationOptions.init(destinations:)(v42);
  sub_100018DCC(&qword_10003F478);
  v44 = static Activity.request(attributes:contentState:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:)();
  swift_bridgeObjectRelease(v36);
  v45 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 112);
  v46 = swift_retain(v44);
  v47 = v45(v46);
  v48 = Activity.id.getter(v47);
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 136))(v48);
  v49 = v61;
  ((void (*)(char *, uint64_t, uint64_t))v67)(v61, v66, v4);
  v50 = swift_retain_n(v1, 2);
  v51 = Logger.logObject.getter(v50);
  v52 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v51, v52))
  {
    v53 = (uint8_t *)swift_slowAlloc(12, -1);
    v54 = swift_slowAlloc(32, -1);
    v70[0] = v54;
    *(_DWORD *)v53 = 136315138;
    v55 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 128))();
    if (v56)
    {
      v57 = v56;
    }
    else
    {
      v55 = 1819047246;
      v57 = 0xE400000000000000;
    }
    v67 = (void (*)(char *, uint64_t, uint64_t, __n128))v21;
    v68 = sub_1000184E8(v55, v57, v70);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69);
    swift_release_n(v1, 2);
    swift_bridgeObjectRelease(v57);
    _os_log_impl((void *)&_mh_execute_header, v51, v52, "new session sessionID=%s", v53, 0xCu);
    swift_arrayDestroy(v54, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v54, -1, -1);
    swift_slowDealloc(v53, -1, -1);
    swift_release(v44);

    ((void (*)(char *, uint64_t))v67)(v61, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v65, v64);
  }
  else
  {
    swift_release(v44);
    swift_release_n(v1, 2);

    v21(v49, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v43, v64);
  }
}

uint64_t sub_10001B4E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t ObjectType;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned __int8 v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  char *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  _QWORD v52[4];

  v1 = sub_100018DCC(&qword_10003F480);
  __chkstk_darwin(v1);
  v3 = (char *)&v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10001DA68();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = swift_retain_n(v0, 2);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  v12 = os_log_type_enabled(v10, v11);
  v49 = v0;
  if (v12)
  {
    v13 = swift_slowAlloc(22, -1);
    v48 = v4;
    v14 = v13;
    v47 = swift_slowAlloc(64, -1);
    v51 = v47;
    *(_DWORD *)v14 = 136315394;
    v50 = sub_1000184E8(0x29286873696E6966, 0xE800000000000000, (uint64_t *)&v51);
    v15 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &v51);
    *(_WORD *)(v14 + 12) = 2080;
    v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 128))(v15);
    if (v17)
    {
      v18 = v17;
    }
    else
    {
      v16 = 1819047246;
      v18 = 0xE400000000000000;
    }
    v50 = sub_1000184E8(v16, v18, (uint64_t *)&v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &v51);
    swift_release_n(v0, 2);
    swift_bridgeObjectRelease(v18);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "%s currentSessionID=%s", (uint8_t *)v14, 0x16u);
    v19 = v47;
    swift_arrayDestroy(v47, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v19, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v48);
  }
  else
  {

    swift_release_n(v0, 2);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_100018DCC(&qword_10003F478);
  result = static Activity.activities.getter();
  v21 = result;
  if ((unint64_t)result >> 62)
  {
    if (result >= 0)
      result &= 0xFFFFFFFFFFFFFF8uLL;
    result = _CocoaArrayWrapper.endIndex.getter(result);
    v22 = result;
    if (result)
      goto LABEL_9;
LABEL_26:
    swift_bridgeObjectRelease(v21);
    v43 = objc_msgSend((id)objc_opt_self(RPAngelConnectionManager), "sharedInstance");
    objc_msgSend(v43, "setDelegate:", 0);

    v44 = v49;
    v45 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)v49 + 152))();
    objc_msgSend(v45, "invalidate");

    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)v44 + 136))(0, 0);
  }
  v22 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v22)
    goto LABEL_26;
LABEL_9:
  if (v22 >= 1)
  {
    v23 = 0;
    v47 = v21 & 0xC000000000000001;
    v46 = (char *)&type metadata for () + 8;
    v48 = v21;
    while (1)
    {
      if (v47)
      {
        v26 = specialized _ArrayBuffer._getElementSlowPath(_:)(v23, v21);
      }
      else
      {
        v26 = *(_QWORD *)(v21 + 8 * v23 + 32);
        swift_retain(v26);
      }
      v27 = type metadata accessor for TaskPriority(0);
      v28 = *(_QWORD *)(v27 - 8);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56))(v3, 1, 1, v27);
      v29 = (_QWORD *)swift_allocObject(&unk_100035AD0, 48, 7);
      v29[2] = 0;
      v30 = v29 + 2;
      v29[3] = 0;
      v29[4] = v26;
      v31 = v49;
      v29[5] = v49;
      v32 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48))(v3, 1, v27);
      swift_retain(v31);
      v33 = swift_retain(v26);
      if (v32 == 1)
      {
        sub_100019700((uint64_t)v3, &qword_10003F480);
        v34 = 0;
        v35 = *v30;
        if (!*v30)
          goto LABEL_20;
      }
      else
      {
        v41 = TaskPriority.rawValue.getter(v33);
        (*(void (**)(char *, uint64_t))(v28 + 8))(v3, v27);
        v34 = v41;
        v35 = *v30;
        if (!*v30)
        {
LABEL_20:
          v38 = 0;
          v40 = 0;
          goto LABEL_21;
        }
      }
      v36 = v29[3];
      ObjectType = swift_getObjectType(v35);
      swift_unknownObjectRetain(v35);
      v38 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v36);
      v40 = v39;
      swift_unknownObjectRelease(v35);
LABEL_21:
      v42 = swift_allocObject(&unk_100035AF8, 32, 7);
      *(_QWORD *)(v42 + 16) = &unk_10003F490;
      *(_QWORD *)(v42 + 24) = v29;
      if (v40 | v38)
      {
        v52[0] = 0;
        v52[1] = 0;
        v24 = v52;
        v52[2] = v38;
        v52[3] = v40;
      }
      else
      {
        v24 = 0;
      }
      ++v23;
      v25 = swift_task_create(v34 | 0x1C00, v24, v46, &unk_10003F498);
      swift_release(v26);
      swift_release(v25);
      v21 = v48;
      if (v22 == v23)
        goto LABEL_26;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10001B9F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5[5] = a4;
  v5[6] = a5;
  v6 = type metadata accessor for ActivityUIDismissalPolicy(0);
  v5[7] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[8] = v7;
  v5[9] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100018DCC(&qword_10003F638);
  v5[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Logger(0);
  v5[11] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v5[12] = v10;
  v5[13] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10001BAA4, 0, 0);
}

uint64_t sub_10001BAA4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  os_log_type_t type;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;

  v1 = v0[5];
  v3 = v0[12];
  v2 = v0[13];
  v4 = v0[11];
  v5 = v0[6];
  v6 = sub_10001DA68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v6, v4);
  swift_retain_n(v1, 2);
  v7 = swift_retain_n(v5, 2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v32 = v0[12];
    v33 = v0[11];
    v34 = v0[13];
    v10 = v0[5];
    v30 = v0[6];
    v11 = swift_slowAlloc(32, -1);
    v31 = swift_slowAlloc(96, -1);
    v36 = v31;
    *(_DWORD *)v11 = 136315650;
    v0[2] = sub_1000184E8(0x29286873696E6966, 0xE800000000000000, &v36);
    v12 = UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3);
    *(_WORD *)(v11 + 12) = 2080;
    type = v9;
    v13 = Activity.id.getter(v12);
    v15 = v14;
    v0[3] = sub_1000184E8(v13, v14, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 3, v0 + 4);
    swift_bridgeObjectRelease(v15);
    v16 = swift_release_n(v10, 2);
    *(_WORD *)(v11 + 22) = 2080;
    v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v30 + 128))(v16);
    if (v18)
    {
      v19 = v18;
    }
    else
    {
      v17 = 1819047246;
      v19 = 0xE400000000000000;
    }
    v0[4] = sub_1000184E8(v17, v19, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 4, v0 + 5);
    swift_bridgeObjectRelease(v19);
    swift_release_n(v30, 2);
    _os_log_impl((void *)&_mh_execute_header, v8, type, "%s end activity=%s currentSessionID=%s", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy(v31, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v31, -1, -1);
    swift_slowDealloc(v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v34, v33);
  }
  else
  {
    v21 = v0[12];
    v20 = v0[13];
    v22 = v0[11];
    v23 = v0[6];
    swift_release_n(v0[5], 2);
    swift_release_n(v23, 2);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
  }
  v24 = v0[10];
  v25 = sub_100018DCC((uint64_t *)&unk_10003F640);
  v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v24, 1, 1, v25);
  static ActivityUIDismissalPolicy.immediate.getter(v26);
  v35 = (char *)&async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:)
      + async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:);
  v27 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:)
                                   + 1));
  v0[14] = v27;
  *v27 = v0;
  v27[1] = sub_10001BDB8;
  return ((uint64_t (*)(_QWORD, _QWORD))v35)(v0[10], v0[9]);
}

uint64_t sub_10001BDB8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(*v0 + 104);
  v3 = *(_QWORD *)(*v0 + 72);
  v2 = *(_QWORD *)(*v0 + 80);
  v4 = *(_QWORD *)(*v0 + 56);
  v5 = *(_QWORD *)(*v0 + 64);
  v7 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 112));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  sub_100019700(v2, &qword_10003F638);
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t sub_10001BE50(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v18;
  _QWORD *v19;
  _QWORD v21[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6);
  if ((_DWORD)v8 == 1)
  {
    sub_100019700(a1, &qword_10003F480);
    v9 = 7168;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
    {
LABEL_3:
      v11 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v10);
      swift_unknownObjectRetain(v10);
      v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
      v15 = v14;
      swift_unknownObjectRelease(v10);
      goto LABEL_6;
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter(v8);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v9 = v16 | 0x1C00;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v17 = swift_allocObject(&unk_100035BC8, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  v18 = sub_100018DCC(&qword_10003F630);
  if (v15 | v13)
  {
    v21[0] = 0;
    v21[1] = 0;
    v19 = v21;
    v21[2] = v13;
    v21[3] = v15;
  }
  else
  {
    v19 = 0;
  }
  return swift_task_create(v9, v19, v18, &unk_10003F628);
}

uint64_t sub_10001BFA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(char *, uint64_t, uint64_t);
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSString v25;
  NSString v26;
  id v27;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v34 - v7;
  v9 = sub_10001DA68();
  v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v11 = v10(v8, v9, v2);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v36 = v2;
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v15 = swift_slowAlloc(32, -1);
    v37 = v6;
    v16 = v15;
    v39 = v15;
    v35 = v1;
    *(_DWORD *)v14 = 136315138;
    v38 = sub_1000184E8(0xD000000000000012, 0x800000010002F7C0, &v39);
    v1 = v35;
    v2 = v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s", v14, 0xCu);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    v17 = v16;
    v6 = v37;
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v14, -1, -1);
  }

  v18 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
  v19 = v18(v8, v2);
  v20 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 104))(v19);
  if (v20)
  {
    v21 = v20;
    Activity.id.getter(v20);
    v23 = v22;
    swift_release(v21);
    v24 = objc_allocWithZone((Class)SNAProminentPresentationAssertion);
    v25 = String._bridgeToObjectiveC()();
    v26 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v23);
    v27 = objc_msgSend(v24, "initWithExplanation:sessionIdentifier:invalidationHandler:", v25, v26, 0);

    return (*(uint64_t (**)(id))(*(_QWORD *)v1 + 160))(v27);
  }
  else
  {
    v29 = v10(v6, v9, v2);
    v30 = Logger.logObject.getter(v29);
    v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc(12, -1);
      v33 = swift_slowAlloc(32, -1);
      v39 = v33;
      *(_DWORD *)v32 = 136315138;
      v38 = sub_1000184E8(0xD000000000000012, 0x800000010002F7C0, &v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39);
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "%s SessionIdentifier nil", v32, 0xCu);
      swift_arrayDestroy(v33, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v33, -1, -1);
      swift_slowDealloc(v32, -1, -1);
    }

    return v18(v6, v2);
  }
}

uint64_t sub_10001C35C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  __n128 v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t);
  uint64_t v58;
  uint64_t v59;

  v3 = v2;
  v6 = sub_100018DCC(&qword_10003F480);
  __chkstk_darwin(v6);
  v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Logger(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v54 - v15;
  v17 = __chkstk_darwin(v14);
  v19 = (char *)&v54 - v18;
  if (a2)
  {
    v20 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 128);
    v21 = v20(v17);
    if (v22)
    {
      v23 = v22;
      if (v21 == a1 && v22 == a2)
      {
        v25 = v10;
        swift_bridgeObjectRelease(v22);
LABEL_19:
        v44 = type metadata accessor for TaskPriority(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v8, 1, 1, v44);
        v45 = (_QWORD *)swift_allocObject(&unk_100035B20, 40, 7);
        v45[2] = 0;
        v45[3] = 0;
        v45[4] = v3;
        swift_retain(v3);
        v46 = sub_10001BE50((uint64_t)v8, (uint64_t)&unk_10003F4A8, (uint64_t)v45);
        v47 = swift_release(v46);
        v48 = (void *)(*(uint64_t (**)(__n128))(*(_QWORD *)v3 + 152))(v47);
        objc_msgSend(v48, "invalidate");

        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)v3 + 136))(0, 0);
        v49 = sub_10001DA68();
        v50 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 16))(v13, v49, v9);
        v51 = Logger.logObject.getter(v50);
        v52 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v51, v52))
        {
          v53 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v53 = 0;
          _os_log_impl((void *)&_mh_execute_header, v51, v52, "finishSession(_:)", v53, 2u);
          swift_slowDealloc(v53, -1, -1);
        }

        return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v13, v9);
      }
      v57 = v20;
      v25 = v10;
      v26 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v21, v22, 0);
      swift_bridgeObjectRelease(v23);
      if ((v26 & 1) != 0)
        goto LABEL_19;
    }
    else
    {
      v57 = v20;
      v25 = v10;
    }
    v34 = sub_10001DA68();
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v16, v34, v9);
    swift_bridgeObjectRetain_n(a2, 2);
    v35 = swift_retain_n(v3, 2);
    v36 = Logger.logObject.getter(v35);
    v37 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = swift_slowAlloc(32, -1);
      v55 = swift_slowAlloc(96, -1);
      v59 = v55;
      *(_DWORD *)v38 = 136315650;
      v58 = sub_1000184E8(0xD000000000000011, 0x800000010002F7E0, &v59);
      v56 = v9;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59);
      *(_WORD *)(v38 + 12) = 2080;
      swift_bridgeObjectRetain(a2);
      v58 = sub_1000184E8(a1, a2, &v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59);
      v39 = swift_bridgeObjectRelease_n(a2, 3);
      *(_WORD *)(v38 + 22) = 2080;
      v40 = v57(v39);
      if (v41)
      {
        v42 = v41;
      }
      else
      {
        v40 = 1819047246;
        v42 = 0xE400000000000000;
      }
      v58 = sub_1000184E8(v40, v42, &v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59);
      swift_release_n(v3, 2);
      swift_bridgeObjectRelease(v42);
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "%s sessionID=%s not equal to currentSessionID=%s", (uint8_t *)v38, 0x20u);
      v43 = v55;
      swift_arrayDestroy(v55, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v43, -1, -1);
      swift_slowDealloc(v38, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v16, v56);
    }
    else
    {

      swift_release_n(v3, 2);
      swift_bridgeObjectRelease_n(a2, 2);
      return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v16, v9);
    }
  }
  else
  {
    v27 = sub_10001DA68();
    v28 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 16))(v19, v27, v9);
    v29 = Logger.logObject.getter(v28);
    v30 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v29, (os_log_type_t)v30))
    {
      v31 = (uint8_t *)swift_slowAlloc(12, -1);
      v32 = swift_slowAlloc(32, -1);
      v59 = v32;
      *(_DWORD *)v31 = 136315138;
      v58 = sub_1000184E8(0xD000000000000011, 0x800000010002F7E0, &v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59);
      _os_log_impl((void *)&_mh_execute_header, v29, (os_log_type_t)v30, "%s sessionID is nil", v31, 0xCu);
      swift_arrayDestroy(v32, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v32, -1, -1);
      swift_slowDealloc(v31, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v19, v9);
  }
}

uint64_t sub_10001C92C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[2] = a1;
  v4[3] = a4;
  v5 = type metadata accessor for ActivityUIDismissalPolicy(0);
  v4[4] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[5] = v6;
  v4[6] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100018DCC(&qword_10003F638);
  v4[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10001C9B0, 0, 0);
}

uint64_t sub_10001C9B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;

  v1 = (*(uint64_t (**)(void))(**(_QWORD **)(v0 + 24) + 104))();
  *(_QWORD *)(v0 + 64) = v1;
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 56);
    v3 = sub_100018DCC((uint64_t *)&unk_10003F640);
    v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
    static ActivityUIDismissalPolicy.immediate.getter(v4);
    v9 = (char *)&async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:)
       + async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:);
    v5 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:)
                                    + 1));
    *(_QWORD *)(v0 + 72) = v5;
    *v5 = v0;
    v5[1] = sub_10001CA9C;
    return ((uint64_t (*)(_QWORD, _QWORD))v9)(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 48));
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 48);
    v7 = *(_QWORD *)(v0 + 56);
    **(_BYTE **)(v0 + 16) = 1;
    swift_task_dealloc(v7);
    swift_task_dealloc(v8);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_10001CA9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __n128 v6;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 64);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)v0 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)v0 + 40);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 72));
  v6 = swift_release(v1);
  (*(void (**)(uint64_t, uint64_t, __n128))(v5 + 8))(v3, v4, v6);
  sub_100019700(v2, &qword_10003F638);
  return swift_task_switch(sub_10001CB30, 0, 0);
}

uint64_t sub_10001CB30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 48);
  **(_BYTE **)(v0 + 16) = *(_QWORD *)(v0 + 64) == 0;
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001CB7C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));

  return v0;
}

uint64_t sub_10001CBA8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));

  return swift_deallocClassInstance(v0, 48, 7);
}

double sub_10001CBDC()
{
  uint64_t v0;
  double result;

  result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  return result;
}

uint64_t type metadata accessor for RPSessionGateway()
{
  return objc_opt_self(_TtC14ReplayKitAngel16RPSessionGateway);
}

id sub_10001CC60()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id sub_10001CC80()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RPSessionProxy();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10001CCEC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RPSessionProxy();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001CD1C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10001CD80;
  return v6(a1);
}

uint64_t sub_10001CD80()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10001CDCC()
{
  _QWORD *v0;

  swift_unknownObjectRelease(v0[2]);
  swift_release(v0[4]);
  swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001CE00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = (_QWORD *)swift_task_alloc(dword_10003F48C);
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_10001D9DC;
  return sub_10001B9F8((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_10001CE50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10003F764);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10001D9DC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10003F760 + dword_10003F760))(a1, v4);
}

uint64_t sub_10001CEC0()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001CEEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc(dword_10003F4A4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10001CF44;
  return sub_10001C92C(a1, v6, v7, v4);
}

uint64_t sub_10001CF44()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10001CF8C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_10001CFF4;
  return v5(v2 + 32);
}

uint64_t sub_10001CFF4()
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

uint64_t sub_10001D3AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for RPSessionGateway();
  inited = swift_initStaticObject(v4, &unk_1000403A0);
  v6 = (*(uint64_t (**)(void))(*(_QWORD *)inited + 128))();
  v8 = v7;
  v9 = sub_10001DA68();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v9, v0);
  v10 = swift_bridgeObjectRetain_n(v8, 2);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc(22, -1);
    v23 = v6;
    v14 = v13;
    v15 = swift_slowAlloc(64, -1);
    v25 = v15;
    *(_DWORD *)v14 = 136315394;
    v24 = sub_1000184E8(0xD000000000000012, 0x800000010002F850, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25);
    *(_WORD *)(v14 + 12) = 2080;
    if (v8)
      v16 = v23;
    else
      v16 = 1819047246;
    v21 = v1;
    v22 = v0;
    if (v8)
      v17 = v8;
    else
      v17 = 0xE400000000000000;
    swift_bridgeObjectRetain(v8);
    v24 = sub_1000184E8(v16, v17, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25);
    swift_bridgeObjectRelease_n(v8, 2);
    swift_bridgeObjectRelease(v17);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s sessionID=%s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy(v15, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    v18 = v14;
    v6 = v23;
    swift_slowDealloc(v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v21 + 8))(v3, v22);
  }
  else
  {

    swift_bridgeObjectRelease_n(v8, 2);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return v6;
}

uint64_t type metadata accessor for RPSessionProxy()
{
  return objc_opt_self(RPSessionProxy);
}

unint64_t sub_10001D63C()
{
  unint64_t result;

  result = qword_10003F4B0;
  if (!qword_10003F4B0)
  {
    result = swift_getWitnessTable(&unk_100027FE0, &type metadata for ReplayKitAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_10003F4B0);
  }
  return result;
}

unint64_t sub_10001D684()
{
  unint64_t result;

  result = qword_10003F4B8;
  if (!qword_10003F4B8)
  {
    result = swift_getWitnessTable(&unk_100028058, &type metadata for ReplayKitAttributes);
    atomic_store(result, (unint64_t *)&qword_10003F4B8);
  }
  return result;
}

unint64_t sub_10001D6CC()
{
  unint64_t result;

  result = qword_10003F4C0;
  if (!qword_10003F4C0)
  {
    result = swift_getWitnessTable(&unk_100028080, &type metadata for ReplayKitAttributes);
    atomic_store(result, (unint64_t *)&qword_10003F4C0);
  }
  return result;
}

unint64_t sub_10001D714()
{
  unint64_t result;

  result = qword_10003F4C8;
  if (!qword_10003F4C8)
  {
    result = swift_getWitnessTable(&unk_100027F50, &type metadata for ReplayKitAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_10003F4C8);
  }
  return result;
}

unint64_t sub_10001D75C()
{
  unint64_t result;

  result = qword_10003F4D0;
  if (!qword_10003F4D0)
  {
    result = swift_getWitnessTable(&unk_100027F78, &type metadata for ReplayKitAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_10003F4D0);
  }
  return result;
}

unint64_t sub_10001D7A4()
{
  unint64_t result;

  result = qword_10003F4D8;
  if (!qword_10003F4D8)
  {
    result = swift_getWitnessTable(&unk_100027FA0, &type metadata for ReplayKitAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_10003F4D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ReplayKitAttributes()
{
  return &type metadata for ReplayKitAttributes;
}

ValueMetadata *type metadata accessor for ReplayKitAttributes.ContentState()
{
  return &type metadata for ReplayKitAttributes.ContentState;
}

ValueMetadata *type metadata accessor for ReplayKitAttributes.CodingKeys()
{
  return &type metadata for ReplayKitAttributes.CodingKeys;
}

ValueMetadata *type metadata accessor for ReplayKitAttributes.ContentState.CodingKeys()
{
  return &type metadata for ReplayKitAttributes.ContentState.CodingKeys;
}

unint64_t sub_10001D82C()
{
  unint64_t result;

  result = qword_100040960;
  if (!qword_100040960)
  {
    result = swift_getWitnessTable(&unk_10002817C, &type metadata for ReplayKitAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100040960);
  }
  return result;
}

unint64_t sub_10001D874()
{
  unint64_t result;

  result = qword_100040968[0];
  if (!qword_100040968[0])
  {
    result = swift_getWitnessTable(&unk_1000281A4, &type metadata for ReplayKitAttributes.CodingKeys);
    atomic_store(result, qword_100040968);
  }
  return result;
}

unint64_t sub_10001D8BC()
{
  unint64_t result;

  result = qword_1000409F0;
  if (!qword_1000409F0)
  {
    result = swift_getWitnessTable(&unk_10002812C, &type metadata for ReplayKitAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000409F0);
  }
  return result;
}

unint64_t sub_10001D904()
{
  unint64_t result;

  result = qword_1000409F8[0];
  if (!qword_1000409F8[0])
  {
    result = swift_getWitnessTable(&unk_100028154, &type metadata for ReplayKitAttributes.ContentState.CodingKeys);
    atomic_store(result, qword_1000409F8);
  }
  return result;
}

uint64_t sub_10001D948()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001D96C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10003F624);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10001CF44;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10003F620 + dword_10003F620))(a1, v4);
}

uint64_t sub_10001D9E8()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001DAC8(v0, qword_100040C58);
  sub_10001DAB0(v0, (uint64_t)qword_100040C58);
  return Logger.init(subsystem:category:)(0xD000000000000018, 0x800000010002F870, 0x696B79616C706552, 0xEE006C65676E4174);
}

uint64_t sub_10001DA68()
{
  uint64_t v0;

  if (qword_100040A80 != -1)
    swift_once(&qword_100040A80, sub_10001D9E8);
  v0 = type metadata accessor for Logger(0);
  return sub_10001DAB0(v0, (uint64_t)qword_100040C58);
}

uint64_t sub_10001DAB0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_10001DAC8(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10001DB08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_100018DCC(&qword_10003F650);
  sub_10001DAC8(v0, qword_100040C70);
  sub_10001DAB0(v0, (uint64_t)qword_100040C70);
  v5 = 0;
  v1 = sub_100018DCC((uint64_t *)&unk_10003F7F0);
  v2 = type metadata accessor for Tips.ParameterOption(0);
  v3 = swift_allocObject(v1, ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v2 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) | 7);
  *(_OWORD *)(v3 + 16) = xmmword_100027810;
  static Tips.ParameterOption.transient.getter();
  return Tips.Parameter.init<A>(_:_:_:_:)(&type metadata for ReactionsTip, 0xD000000000000017, 0x800000010002FB00, &v5, v3, &type metadata for Bool, &type metadata for ReactionsTip, &protocol witness table for Bool, &protocol witness table for Bool);
}

uint64_t sub_10001DC08()
{
  uint64_t v0;

  if (qword_100040A90 != -1)
    swift_once(&qword_100040A90, sub_10001DB08);
  v0 = sub_100018DCC(&qword_10003F650);
  return sub_10001DAB0(v0, (uint64_t)qword_100040C70);
}

uint64_t sub_10001DC54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_100040A90 != -1)
    swift_once(&qword_100040A90, sub_10001DB08);
  v2 = sub_100018DCC(&qword_10003F650);
  v3 = sub_10001DAB0(v2, (uint64_t)qword_100040C70);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10001DCF0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[24];

  if (qword_100040A90 != -1)
    swift_once(&qword_100040A90, sub_10001DB08);
  v2 = sub_100018DCC(&qword_10003F650);
  v3 = sub_10001DAB0(v2, (uint64_t)qword_100040C70);
  swift_beginAccess(v3, v6, 33, 0);
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess(v6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*sub_10001DDA4(uint64_t a1))(_QWORD)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100040A90 != -1)
    swift_once(&qword_100040A90, sub_10001DB08);
  v2 = sub_100018DCC(&qword_10003F650);
  v3 = sub_10001DAB0(v2, (uint64_t)qword_100040C70);
  swift_beginAccess(v3, a1, 33, 0);
  return j__swift_endAccess;
}

uint64_t sub_10001DE20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[3];

  if (qword_100040A90 != -1)
    swift_once(&qword_100040A90, sub_10001DB08);
  v0 = sub_100018DCC(&qword_10003F650);
  v1 = sub_10001DAB0(v0, (uint64_t)qword_100040C70);
  swift_beginAccess(v1, (char *)v4 + 1, 32, 0);
  Tips.Parameter.wrappedValue.getter(v4, v0);
  v2 = LOBYTE(v4[0]);
  swift_endAccess((char *)v4 + 1);
  return v2;
}

uint64_t sub_10001DEB4(char a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[31];
  char v6;

  if (qword_100040A90 != -1)
    swift_once(&qword_100040A90, sub_10001DB08);
  v2 = sub_100018DCC(&qword_10003F650);
  v3 = sub_10001DAB0(v2, (uint64_t)qword_100040C70);
  v6 = a1 & 1;
  swift_beginAccess(v3, v5, 33, 0);
  Tips.Parameter.wrappedValue.setter(&v6, v2);
  return swift_endAccess(v5);
}

void (*sub_10001DF58(_QWORD *a1))(uint64_t *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_100040A90 != -1)
    swift_once(&qword_100040A90, sub_10001DB08);
  v3 = sub_100018DCC(&qword_10003F650);
  v2[3] = v3;
  v4 = sub_10001DAB0(v3, (uint64_t)qword_100040C70);
  v2[4] = v4;
  swift_beginAccess(v4, v2, 32, 0);
  Tips.Parameter.wrappedValue.getter((_QWORD *)((char *)v2 + 41), v3);
  v5 = *((_BYTE *)v2 + 41);
  swift_endAccess(v2);
  *((_BYTE *)v2 + 40) = v5;
  return sub_10001E028;
}

void sub_10001E028(uint64_t *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (void *)*a1;
  v3 = *(_QWORD *)(*a1 + 24);
  v2 = *(_QWORD *)(*a1 + 32);
  v4 = *a1;
  *(_BYTE *)(*a1 + 41) = *(_BYTE *)(*a1 + 40);
  swift_beginAccess(v2, v1, 33, 0);
  Tips.Parameter.wrappedValue.setter(v4 + 41, v3);
  swift_endAccess(v1);
  free(v1);
}

uint64_t sub_10001E088(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain(a2);
  return a1;
}

uint64_t sub_10001E0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_bridgeObjectRetain(a4);
  return a3;
}

uint64_t sub_10001E0EC()
{
  return Image.init(_internalSystemName:)(0xD000000000000018, 0x800000010002F890);
}

uint64_t sub_10001E108()
{
  void *v0;
  NSString v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[2];

  v0 = (void *)objc_opt_self(NSBundle);
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "_rpLocalizedStringFromFrameworkBundleWithKey:", v1);

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);
  v6 = v5;

  v9[0] = v4;
  v9[1] = v6;
  v7 = sub_100020B74();
  return Text.init<A>(_:)(v9, &type metadata for String, v7);
}

uint64_t sub_10001E1B8()
{
  void *v0;
  NSString v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[2];

  v0 = (void *)objc_opt_self(NSBundle);
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "_rpLocalizedStringFromFrameworkBundleWithKey:", v1);

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);
  v6 = v5;

  v9[0] = v4;
  v9[1] = v6;
  v7 = sub_100020B74();
  return Text.init<A>(_:)(v9, &type metadata for String, v7);
}

uint64_t sub_10001E268()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v13[24];

  v0 = sub_100018DCC(&qword_10003F650);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v4 = type metadata accessor for Tips.Rule(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (qword_100040A90 != -1)
    swift_once(&qword_100040A90, sub_10001DB08);
  v8 = sub_10001DAB0(v0, (uint64_t)qword_100040C70);
  swift_beginAccess(v8, v13, 0, 0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v8, v0);
  Tips.Rule.init<A>(_:_:)(v3, sub_10001E3D8, 0, &type metadata for Bool, &protocol witness table for Bool, &protocol witness table for Bool);
  v9 = static Tips.RuleBuilder.buildExpression(_:)(v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v10 = static Tips.RuleBuilder.buildPartialBlock(first:)(v9);
  swift_bridgeObjectRelease(v9);
  return v10;
}

uint64_t sub_10001E3D8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
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
  _BYTE v15[15];
  char v16;

  v4 = sub_100018DCC(&qword_10003F7B0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_100018DCC(&qword_10003F7B8);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = sub_10002147C(&qword_10003F7C0, &qword_10003F7B8, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Variable<A>);
  static PredicateExpressions.build_Arg<A>(_:)(a1, v8, v12);
  v16 = 1;
  static PredicateExpressions.build_Arg<A>(_:)(&v16, &type metadata for Bool);
  a2[3] = sub_100018DCC(&qword_10003F7C8);
  a2[4] = sub_100021358();
  sub_100021440(a2);
  v13 = sub_10002147C(&qword_10003F7E8, &qword_10003F7B0, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Value<A>);
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)(v11, v7, v8, v4, v12, v13, &protocol witness table for Bool);
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_10001E570()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t OpaqueTypeConformance2;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  void *v17;

  v0 = sub_100018DCC(&qword_10003F660);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Tips.MaxDisplayCount(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100018DCC(&qword_10003F668);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  Tips.MaxDisplayCount.init(_:)(1);
  static Tips.OptionsBuilder.buildExpression<A>(_:)(v7, v4, &protocol witness table for Tips.MaxDisplayCount);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v16 = v4;
  v17 = &protocol witness table for Tips.MaxDisplayCount;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v16, &opaque type descriptor for <<opaque return type of static Tips.OptionsBuilder.buildExpression<A>(_:)>>, 1);
  static Tips.OptionsBuilder.buildPartialBlock<A>(first:)(v11, v8, OpaqueTypeConformance2);
  v16 = v8;
  v17 = (void *)OpaqueTypeConformance2;
  v13 = swift_getOpaqueTypeConformance2(&v16, &opaque type descriptor for <<opaque return type of static Tips.OptionsBuilder.buildPartialBlock<A>(first:)>>, 1);
  v14 = static Tips.OptionsBuilder.buildFinalResult<A>(_:)(v3, v0, v13);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

uint64_t sub_10001E718()
{
  uint64_t v0;

  return sub_100020AFC(*(_QWORD *)v0, *(void **)(v0 + 8));
}

uint64_t sub_10001E724@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = sub_100020AFC(*(_QWORD *)v1, *(void **)(v1 + 8));
  *a1 = result;
  a1[1] = v4;
  return result;
}

id sub_10001E74C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return sub_10001E7A4(a1, a2, a3, a4);
}

id sub_10001E7A4(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  char *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  id v24;
  objc_class *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  objc_super v33;

  v9 = type metadata accessor for Logger(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v4[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipObservationTask] = 0;
  swift_unknownObjectWeakInit(&v4[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipPopoverController], 0);
  *(_QWORD *)&v4[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_layoutConstraints] = &_swiftEmptyArrayStorage;
  v13 = v4;
  v14 = sub_10001DA68();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v14, v9);
  swift_bridgeObjectRetain_n(a2, 2);
  v15 = swift_bridgeObjectRetain_n(a4, 2);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  v18 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    v19 = swift_slowAlloc(32, -1);
    v30 = v9;
    v20 = v19;
    v28 = swift_slowAlloc(96, -1);
    v32 = v28;
    *(_DWORD *)v20 = 136315650;
    HIDWORD(v27) = v18;
    v31 = sub_1000184E8(0xD000000000000017, 0x800000010002F8F0, &v32);
    v29 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32);
    *(_WORD *)(v20 + 12) = 2080;
    swift_bridgeObjectRetain(a2);
    v31 = sub_1000184E8(a1, a2, &v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32);
    swift_bridgeObjectRelease_n(a2, 3);
    *(_WORD *)(v20 + 22) = 2080;
    swift_bridgeObjectRetain(a4);
    v31 = sub_1000184E8(a3, a4, &v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32);
    swift_bridgeObjectRelease_n(a4, 3);
    _os_log_impl((void *)&_mh_execute_header, v16, BYTE4(v27), "%s appName=%s bundleID=%s", (uint8_t *)v20, 0x20u);
    v21 = v28;
    swift_arrayDestroy(v28, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v21, -1, -1);
    swift_slowDealloc(v20, -1, -1);

    (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v30);
  }
  else
  {

    swift_bridgeObjectRelease_n(a4, 2);
    swift_bridgeObjectRelease_n(a2, 2);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  v22 = (uint64_t *)&v13[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_appName];
  *v22 = a1;
  v22[1] = a2;
  v23 = (uint64_t *)&v13[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_bundleID];
  *v23 = a3;
  v23[1] = a4;
  v24 = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  *(_QWORD *)&v13[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipAnchorView] = v24;

  v25 = (objc_class *)type metadata accessor for RPReactionsTipViewController();
  v33.receiver = v13;
  v33.super_class = v25;
  return objc_msgSendSuper2(&v33, "initWithNibName:bundle:", 0, 0);
}

id sub_10001EAE4(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  id v5;
  char *v6;
  id v7;
  id v8;
  objc_super v10;

  *(_QWORD *)&v1[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipObservationTask] = 0;
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipPopoverController], 0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_layoutConstraints] = &_swiftEmptyArrayStorage;
  v3 = &v1[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_appName];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0xE000000000000000;
  v4 = &v1[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_bundleID];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0xE000000000000000;
  v5 = objc_allocWithZone((Class)UIView);
  v6 = v1;
  v7 = objc_msgSend(v5, "init");
  *(_QWORD *)&v6[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipAnchorView] = v7;

  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for RPReactionsTipViewController();
  v8 = objc_msgSendSuper2(&v10, "initWithCoder:", a1);

  return v8;
}

void sub_10001EBEC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  os_log_type_t v8;
  char **v9;
  uint64_t v10;
  id v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef *v22;
  uint64_t v23;
  uint64_t v24;
  objc_class *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  Class isa;
  uint64_t v35;
  uint64_t v36;
  CFDictionaryRef *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40[2];
  objc_super v41;
  CGRect v42;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_10001DA68();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  v6 = v0;
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  v9 = &off_10003D000;
  if (os_log_type_enabled(v7, v8))
  {
    v10 = swift_slowAlloc(22, -1);
    v37 = (CFDictionaryRef *)swift_slowAlloc(8, -1);
    v38 = swift_slowAlloc(32, -1);
    v40[0] = v38;
    *(_DWORD *)v10 = 136315394;
    v39 = sub_1000184E8(0x4C64694477656976, 0xED0000292864616FLL, v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, v40);
    *(_WORD *)(v10 + 12) = 2112;
    v11 = objc_msgSend(v6, "view");
    if (!v11)
      goto LABEL_10;
    v12 = v11;
    objc_msgSend(v11, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    v42.origin.x = v14;
    v42.origin.y = v16;
    v42.size.width = v18;
    v42.size.height = v20;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v42);
    v39 = (uint64_t)DictionaryRepresentation;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, v40);
    v22 = v37;
    *v37 = DictionaryRepresentation;

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s self.view.frame=%@", (uint8_t *)v10, 0x16u);
    v23 = sub_100018DCC(&qword_10003F0C0);
    swift_arrayDestroy(v22, 1, v23);
    swift_slowDealloc(v22, -1, -1);
    v24 = v38;
    swift_arrayDestroy(v38, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v10, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    v9 = &off_10003D000;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  v25 = (objc_class *)type metadata accessor for RPReactionsTipViewController();
  v41.receiver = v6;
  v41.super_class = v25;
  objc_msgSendSuper2(&v41, "viewDidLoad");
  v26 = objc_msgSend(v6, v9[259]);
  if (v26)
  {
    v27 = v26;
    v28 = OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipAnchorView;
    objc_msgSend(v26, "addSubview:", *(_QWORD *)((char *)v6 + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipAnchorView));

    v29 = objc_msgSend(v6, v9[259]);
    if (v29)
    {
      v30 = v29;
      objc_msgSend(v29, "setUserInteractionEnabled:", 0);

      v31 = objc_msgSend(*(id *)((char *)v6 + v28), "setUserInteractionEnabled:", 0);
      (*(void (**)(id))((swift_isaMask & *v6) + 0x118))(v31);
      v32 = (void *)objc_opt_self(NSLayoutConstraint);
      v33 = *(_QWORD *)((char *)v6 + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_layoutConstraints);
      sub_100020BD8();
      swift_bridgeObjectRetain(v33);
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v33);
      objc_msgSend(v32, "activateConstraints:", isa);

      v35 = static Tips.configure(_:)(&_swiftEmptyArrayStorage);
      (*(void (**)(uint64_t))((swift_isaMask & *v6) + 0x120))(v35);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_10:

  __break(1u);
}

double sub_10001F01C(int a1)
{
  char *v1;
  char *v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  objc_class *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double result;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;

  v2 = v1;
  LODWORD(v3) = a1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10001DA68();
  v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc(12, -1);
    v21 = (int)v3;
    v3 = (uint8_t *)v12;
    v13 = swift_slowAlloc(32, -1);
    v23 = v13;
    *(_DWORD *)v3 = 136315138;
    v22 = sub_1000184E8(0xD000000000000015, 0x800000010002F910, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "%s", v3, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    v14 = v3;
    LOBYTE(v3) = v21;
    swift_slowDealloc(v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v15 = (objc_class *)type metadata accessor for RPReactionsTipViewController();
  v24.receiver = v2;
  v24.super_class = v15;
  objc_msgSendSuper2(&v24, "viewWillDisappear:", v3 & 1);
  v16 = OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipObservationTask;
  v17 = *(_QWORD *)&v2[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipObservationTask];
  if (v17)
  {
    swift_retain(*(_QWORD *)&v2[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipObservationTask]);
    Task.cancel()();
    swift_release(v17);
    v18 = *(_QWORD *)&v2[v16];
  }
  else
  {
    v18 = 0;
  }
  *(_QWORD *)&v2[v16] = 0;
  *(_QWORD *)&result = swift_release(v18).n128_u64[0];
  return result;
}

id sub_10001F274()
{
  char *v0;
  char *v1;
  id result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v1 = v0;
  result = objc_msgSend(v0, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  v3 = result;
  objc_msgSend(result, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipAnchorView;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipAnchorView], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = sub_100018DCC((uint64_t *)&unk_10003F0B0);
  v6 = swift_allocObject(v5, 64, 7);
  *(_OWORD *)(v6 + 16) = xmmword_1000277F0;
  v7 = objc_msgSend(*(id *)&v1[v4], "topAnchor");
  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v8 = result;
  v9 = objc_msgSend(result, "topAnchor");

  v10 = objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  *(_QWORD *)(v6 + 32) = v10;
  v11 = objc_msgSend(*(id *)&v1[v4], "trailingAnchor");
  result = objc_msgSend(v1, "view");
  if (result)
  {
    v12 = result;
    v13 = objc_msgSend(result, "trailingAnchor");

    v14 = objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 10.0);
    *(_QWORD *)(v6 + 40) = v14;
    v15 = objc_msgSend(*(id *)&v1[v4], "widthAnchor");
    v16 = objc_msgSend(v15, "constraintEqualToConstant:", 150.0);

    *(_QWORD *)(v6 + 48) = v16;
    v17 = objc_msgSend(*(id *)&v1[v4], "heightAnchor");
    v18 = objc_msgSend(v17, "constraintEqualToConstant:", 45.0);

    *(_QWORD *)(v6 + 56) = v18;
    specialized Array._endMutation()();
    v19 = *(_QWORD *)&v1[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_layoutConstraints];
    *(_QWORD *)&v1[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_layoutConstraints] = v6;
    return (id)swift_bridgeObjectRelease(v19);
  }
LABEL_7:
  __break(1u);
  return result;
}

double sub_10001F4D8()
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
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t);
  char *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  double result;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t (*v60)(char *, uint64_t);
  uint64_t v61;
  uint64_t (*v62)(char *, uint64_t, uint64_t);
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  uint64_t v69[4];

  v0 = sub_100018DCC(&qword_10003F480);
  __chkstk_darwin(v0);
  v59 = (char *)&v57 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for Tips.Status(0);
  v65 = *(_QWORD *)(v2 - 8);
  v66 = v2;
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v64 = (char *)&v57 - v6;
  v7 = type metadata accessor for Logger(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v57 - v12;
  v14 = sub_10001DA68();
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v61 = v14;
  v62 = v15;
  v16 = ((uint64_t (*)(char *))v15)(v13);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.default.getter();
  v19 = os_log_type_enabled(v17, v18);
  v63 = v7;
  if (v19)
  {
    v20 = (uint8_t *)swift_slowAlloc(12, -1);
    v21 = swift_slowAlloc(32, -1);
    v58 = v11;
    v22 = v7;
    v23 = v21;
    v69[0] = v21;
    *(_DWORD *)v20 = 136315138;
    v68 = sub_1000184E8(0xD00000000000001BLL, 0x800000010002F930, v69);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, v69);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "%s", v20, 0xCu);
    swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(v20, -1, -1);

    v24 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
    v25 = v13;
    v26 = v22;
    v11 = v58;
  }
  else
  {

    v24 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
    v25 = v13;
    v26 = v7;
  }
  v60 = v24;
  v24(v25, v26);
  v27 = v67;
  v28 = *(_QWORD *)((char *)v67 + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_bundleID);
  v29 = *(_QWORD *)((char *)v67 + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_bundleID + 8);
  v31 = *(_QWORD *)((char *)v67 + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_appName);
  v30 = *(_QWORD *)((char *)v67 + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_appName + 8);
  v32 = qword_100040A90;
  swift_bridgeObjectRetain(v29);
  swift_bridgeObjectRetain(v30);
  if (v32 != -1)
    swift_once(&qword_100040A90, sub_10001DB08);
  v33 = sub_100018DCC(&qword_10003F650);
  v34 = sub_10001DAB0(v33, (uint64_t)qword_100040C70);
  LOBYTE(v68) = 1;
  swift_beginAccess(v34, v69, 33, 0);
  Tips.Parameter.wrappedValue.setter(&v68, v33);
  swift_endAccess(v69);
  v58 = (char *)v28;
  v69[0] = v28;
  v69[1] = v29;
  v69[2] = v31;
  v69[3] = v30;
  v35 = sub_100020C14();
  v36 = v64;
  Tip.status.getter(&type metadata for ReactionsTip, v35);
  v37 = enum case for Tips.InvalidationReason.displayCountExceeded(_:);
  v38 = type metadata accessor for Tips.InvalidationReason(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 104))(v5, v37, v38);
  v39 = v65;
  v40 = v66;
  (*(void (**)(char *, _QWORD, uint64_t))(v65 + 104))(v5, enum case for Tips.Status.invalidated(_:), v66);
  LOBYTE(v37) = static Tips.Status.== infix(_:_:)(v36, v5);
  v41 = *(void (**)(char *, uint64_t))(v39 + 8);
  v41(v5, v40);
  v41(v36, v40);
  if ((v37 & 1) != 0)
  {
    swift_bridgeObjectRelease(v30);
    swift_bridgeObjectRelease(v29);
    v42 = v63;
    v43 = v62(v11, v61, v63);
    v44 = Logger.logObject.getter(v43);
    v45 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v46 = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "tip invalidated removing scene", v46, 2u);
      swift_slowDealloc(v46, -1, -1);
    }

    v47 = v60(v11, v42);
    (*(void (**)(uint64_t))((swift_isaMask & *v27) + 0x138))(v47);
  }
  else
  {
    v49 = OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipObservationTask;
    v50 = *(_QWORD *)((char *)v27 + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipObservationTask);
    if (v50)
    {
      swift_retain(*(_QWORD *)((char *)v27
                             + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipObservationTask));
      swift_bridgeObjectRelease(v30);
      swift_bridgeObjectRelease(v29);
    }
    else
    {
      v51 = type metadata accessor for TaskPriority(0);
      v52 = (uint64_t)v59;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(v59, 1, 1, v51);
      type metadata accessor for MainActor(0);
      v53 = v27;
      v54 = static MainActor.shared.getter();
      v55 = (_QWORD *)swift_allocObject(&unk_100035CD8, 72, 7);
      v55[2] = v54;
      v55[3] = &protocol witness table for MainActor;
      v55[4] = v58;
      v55[5] = v29;
      v55[6] = v31;
      v55[7] = v30;
      v55[8] = v53;
      v50 = sub_100020434(v52, (uint64_t)&unk_10003F6C0, (uint64_t)v55);
    }
    v56 = *(_QWORD *)((char *)v27 + v49);
    *(_QWORD *)((char *)v27 + v49) = v50;
    *(_QWORD *)&result = swift_release(v56).n128_u64[0];
  }
  return result;
}

uint64_t sub_10001FA2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v8[18] = a7;
  v8[19] = a8;
  v8[16] = a5;
  v8[17] = a6;
  v8[15] = a4;
  v9 = sub_100018DCC(&qword_10003F770);
  v8[20] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Tips.Status(0);
  v8[21] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v8[22] = v11;
  v8[23] = swift_task_alloc((*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100018DCC(&qword_10003F778);
  v8[24] = v12;
  v8[25] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v12 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100018DCC(&qword_10003F780);
  v8[26] = v13;
  v8[27] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v13 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100018DCC(&qword_10003F788);
  v8[28] = v14;
  v15 = *(_QWORD *)(v14 - 8);
  v8[29] = v15;
  v8[30] = swift_task_alloc((*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_100018DCC(&qword_10003F790);
  v8[31] = v16;
  v17 = *(_QWORD *)(v16 - 8);
  v8[32] = v17;
  v18 = (*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8[33] = swift_task_alloc(v18);
  v8[34] = swift_task_alloc(v18);
  v19 = type metadata accessor for MainActor(0);
  v8[35] = v19;
  v8[36] = static MainActor.shared.getter(v19);
  v20 = dispatch thunk of Actor.unownedExecutor.getter(v19, &protocol witness table for MainActor);
  v8[37] = v20;
  v8[38] = v21;
  return swift_task_switch(sub_10001FBA8, v20, v21);
}

uint64_t sub_10001FBA8()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *(_OWORD *)(v0 + 56) = *(_OWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 216);
  v4 = *(_QWORD *)(v0 + 224);
  v5 = *(_QWORD *)(v0 + 192);
  v6 = *(_QWORD *)(v0 + 144);
  *(_QWORD *)(v0 + 72) = *(_QWORD *)(v0 + 136);
  *(_QWORD *)(v0 + 80) = v6;
  v7 = sub_100020C14();
  *(_QWORD *)(v0 + 312) = v7;
  Tip.shouldDisplayUpdates.getter(&type metadata for ReactionsTip, v7);
  AsyncMapSequence.base.getter(v4);
  v8 = sub_10002147C(&qword_10003F798, &qword_10003F778, (uint64_t)&protocol conformance descriptor for AsyncStream<A>);
  dispatch thunk of AsyncSequence.makeAsyncIterator()(v5, v8);
  v9 = AsyncMapSequence.transform.getter(v4);
  v11 = v10;
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v4);
  v12 = AsyncMapSequence.Iterator.init(_:transform:)(v3, v9, v11, v5, &type metadata for Bool, v8);
  *(_QWORD *)(v0 + 320) = OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipAnchorView;
  v13 = static MainActor.shared.getter(v12);
  *(_QWORD *)(v0 + 328) = v13;
  if (v13)
  {
    ObjectType = swift_getObjectType(v13);
    v15 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, &protocol witness table for MainActor);
    v17 = v16;
  }
  else
  {
    v15 = 0;
    v17 = 0;
  }
  *(_QWORD *)(v0 + 336) = v15;
  *(_QWORD *)(v0 + 344) = v17;
  return swift_task_switch(sub_10001FD14, v15, v17);
}

uint64_t sub_10001FD14()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0[41];
  v0[44] = AsyncMapSequence.Iterator.baseIterator.modify(v0 + 11, v0[31]);
  sub_10002147C((unint64_t *)&unk_10003F7A0, &qword_10003F780, (uint64_t)&protocol conformance descriptor for AsyncStream<A>.Iterator);
  v2 = (_QWORD *)swift_task_alloc(_sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTjTu[1]);
  v0[45] = v2;
  *v2 = v0;
  v2[1] = sub_10001FDBC;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0[20], v1, &protocol witness table for MainActor);
}

uint64_t sub_10001FDBC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v2 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 360));
  if (v0)
  {
    v3 = *(_QWORD *)(v2 + 336);
    v4 = *(_QWORD *)(v2 + 344);
    v5 = sub_10001FF70;
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 352))(v2 + 88, 0);
    v3 = *(_QWORD *)(v2 + 336);
    v4 = *(_QWORD *)(v2 + 344);
    v5 = sub_10001FE2C;
  }
  return swift_task_switch(v5, v3, v4);
}

uint64_t sub_10001FE2C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  _QWORD *v12;
  int *v13;

  v1 = v0[21];
  v2 = v0[22];
  v3 = v0[20];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v4 = v0[41];
    sub_100019700(v3, &qword_10003F770);
    swift_release(v4);
    return swift_task_switch(sub_100020058, v0[37], v0[38]);
  }
  else
  {
    v7 = v0[33];
    v6 = v0[34];
    v8 = v0[31];
    v9 = v0[32];
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v2 + 32))(v0[23], v3, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v6, v8);
    v10 = (int *)AsyncMapSequence.Iterator.transform.getter(v8);
    v0[46] = v11;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    v13 = (int *)((char *)v10 + *v10);
    v12 = (_QWORD *)swift_task_alloc(v10[1]);
    v0[47] = v12;
    *v12 = v0;
    v12[1] = sub_10001FF80;
    return ((uint64_t (*)(_QWORD *, _QWORD))v13)(v0 + 50, v0[23]);
  }
}

uint64_t sub_10001FF70()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 352))(v0 + 88, 1);
}

uint64_t sub_10001FF80()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __n128 v6;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 368);
  v4 = *(_QWORD *)(*v0 + 176);
  v3 = *(_QWORD *)(*v0 + 184);
  v5 = *(_QWORD *)(*v0 + 168);
  swift_task_dealloc(*(_QWORD *)(*v0 + 376));
  v6 = swift_release(v2);
  *(_BYTE *)(v1 + 401) = *(_BYTE *)(v1 + 400);
  (*(void (**)(uint64_t, uint64_t, __n128))(v4 + 8))(v3, v5, v6);
  return swift_task_switch(sub_100020004, *(_QWORD *)(v1 + 336), *(_QWORD *)(v1 + 344));
}

uint64_t sub_100020004()
{
  uint64_t v0;
  int v1;
  uint64_t (*v2)();

  v1 = *(unsigned __int8 *)(v0 + 401);
  swift_release(*(_QWORD *)(v0 + 328));
  if (v1 == 1)
    v2 = sub_100020104;
  else
    v2 = sub_100020338;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_100020058()
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

  v1 = *(_QWORD *)(v0 + 288);
  v3 = *(_QWORD *)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 272);
  v4 = *(_QWORD *)(v0 + 240);
  v5 = *(_QWORD *)(v0 + 216);
  v6 = *(_QWORD *)(v0 + 200);
  v7 = *(_QWORD *)(v0 + 184);
  v8 = *(_QWORD *)(v0 + 160);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 256) + 8))(v2, *(_QWORD *)(v0 + 248));
  swift_release(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100020104()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 280);
  *(_QWORD *)(v0 + 384) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100020164, v2, v3);
}

id sub_100020164()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id result;
  void *v13;
  void *v14;
  id v15;

  v1 = v0[39];
  v2 = v0[40];
  v4 = v0[18];
  v3 = v0[19];
  v5 = v0[16];
  v6 = v0[17];
  v7 = v0[15];
  swift_release(v0[48]);
  type metadata accessor for TipUIPopoverViewController(0);
  v0[5] = &type metadata for ReactionsTip;
  v0[6] = v1;
  v8 = (_QWORD *)swift_allocObject(&unk_100035DA8, 48, 7);
  v0[2] = v8;
  v8[2] = v7;
  v8[3] = v5;
  v8[4] = v6;
  v8[5] = v4;
  v9 = *(void **)(v3 + v2);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v4);
  v10 = (void *)TipUIPopoverViewController.__allocating_init(_:sourceItem:actionHandler:)(v0 + 2, v9, nullsub_1, 0);
  v11 = swift_unknownObjectRetain(v3);
  TipUIPopoverViewController.presentationDelegate.setter(v11);
  result = objc_msgSend(v10, "view");
  if (result)
  {
    v13 = result;
    v14 = (void *)v0[19];
    v15 = objc_msgSend((id)objc_opt_self(UIColor), "darkGrayColor");
    objc_msgSend(v13, "setTintColor:", v15);

    objc_msgSend(v14, "presentViewController:animated:completion:", v10, 1, 0);
    return (id)swift_task_switch(sub_1000202CC, v0[37], v0[38]);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000202CC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t ObjectType;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = static MainActor.shared.getter();
  v0[41] = v1;
  if (v1)
  {
    ObjectType = swift_getObjectType(v1);
    v3 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, &protocol witness table for MainActor);
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  v0[42] = v3;
  v0[43] = v5;
  return swift_task_switch(sub_10001FD14, v3, v5);
}

uint64_t sub_100020338()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 280);
  *(_QWORD *)(v0 + 392) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100020398, v2, v3);
}

uint64_t sub_100020398()
{
  _QWORD *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (void *)v0[19];
  swift_release(v0[49]);
  v2 = objc_msgSend(v1, "presentedViewController");
  if (v2)
  {
    v3 = v2;
    v4 = type metadata accessor for TipUIPopoverViewController(0);
    v5 = swift_dynamicCastClass(v3, v4);

    if (v5)
      (*(void (**)(void))((swift_isaMask & *(_QWORD *)v0[19]) + 0x138))();
  }
  return swift_task_switch(sub_1000214BC, v0[37], v0[38]);
}

uint64_t sub_100020434(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6);
  if ((_DWORD)v8 == 1)
  {
    sub_100019700(a1, &qword_10003F480);
    v9 = 7168;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
    {
LABEL_3:
      v11 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v10);
      swift_unknownObjectRetain(v10);
      v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
      v15 = v14;
      swift_unknownObjectRelease(v10);
      goto LABEL_6;
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter(v8);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v9 = v16 | 0x1C00;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v17 = swift_allocObject(&unk_100035D80, 32, 7);
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
  return swift_task_create(v9, v18, (char *)&type metadata for () + 8, &unk_10003F768);
}

void sub_1000205D8()
{
  void *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(char *);
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t (*v17)(char *);
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  void (*v22)(char *, uint64_t);
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD **)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v41 - v7;
  v9 = sub_10001DA68();
  v10 = (uint64_t (*)(char *))v3[2];
  v44 = v9;
  v11 = v10(v8);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(12, -1);
    v43 = v6;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc(32, -1);
    v42 = v2;
    v17 = v10;
    v18 = v1;
    v19 = v16;
    v46 = v16;
    *(_DWORD *)v15 = 136315138;
    v45 = sub_1000184E8(0xD00000000000001CLL, 0x800000010002F950, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s", v15, 0xCu);
    swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
    v20 = v19;
    v1 = v18;
    v10 = v17;
    v2 = v42;
    swift_slowDealloc(v20, -1, -1);
    v21 = v15;
    v6 = v43;
    swift_slowDealloc(v21, -1, -1);
  }

  v22 = (void (*)(char *, uint64_t))v3[1];
  v22(v8, v2);
  v23 = objc_msgSend(v1, "view");
  if (!v23)
  {
    __break(1u);
    goto LABEL_16;
  }
  v24 = v23;
  v25 = objc_msgSend(v23, "window");

  if (v25)
  {
    v26 = objc_msgSend(v25, "windowScene");

    if (v26)
    {
      v27 = objc_opt_self(SBSUIRemoteAlertScene);
      v28 = (void *)swift_dynamicCastObjCClass(v26, v27);
      if (v28)
      {
        objc_msgSend(v28, "invalidate");

        return;
      }

    }
  }
  ((void (*)(char *, uint64_t, uint64_t))v10)(v6, v44, v2);
  v3 = v1;
  v29 = Logger.logObject.getter(v3);
  v30 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v29, v30))
  {

    v40 = v6;
    goto LABEL_13;
  }
  v43 = v6;
  v31 = (uint8_t *)swift_slowAlloc(12, -1);
  v32 = swift_slowAlloc(32, -1);
  v46 = v32;
  *(_DWORD *)v31 = 136315138;
  v33 = objc_msgSend(v3, "view");
  if (!v33)
  {
LABEL_16:

    __break(1u);
    return;
  }
  v34 = v33;
  v35 = objc_msgSend(v33, "window");

  v36 = sub_100018DCC(&qword_10003F6C8);
  v37 = _typeName(_:qualified:)(v36, 0);
  v39 = v38;
  v45 = sub_1000184E8(v37, v38, &v46);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46);

  swift_bridgeObjectRelease(v39);
  _os_log_impl((void *)&_mh_execute_header, v29, v30, "Expected remote alert scene. scene type=%s", v31, 0xCu);
  swift_arrayDestroy(v32, 1, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v32, -1, -1);
  swift_slowDealloc(v31, -1, -1);

  v40 = v43;
LABEL_13:
  v22(v40, v2);
}

void sub_1000209F0()
{
  _swift_stdlib_reportUnimplementedInitializer("ReplayKitAngel.RPReactionsTipViewController", 43, "init(nibName:bundle:)", 21, 0);
  __break(1u);
}

id sub_100020A4C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RPReactionsTipViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100020AFC(uint64_t a1, void *a2)
{
  Swift::String v4;
  _QWORD v6[2];

  strcpy((char *)v6, "ReactionsTip-");
  swift_bridgeObjectRetain(a2);
  v4._countAndFlagsBits = a1;
  v4._object = a2;
  String.append(_:)(v4);
  swift_bridgeObjectRelease(a2);
  return v6[0];
}

unint64_t sub_100020B74()
{
  unint64_t result;

  result = qword_10003F658;
  if (!qword_10003F658)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10003F658);
  }
  return result;
}

uint64_t type metadata accessor for RPReactionsTipViewController()
{
  return objc_opt_self(_TtC14ReplayKitAngel28RPReactionsTipViewController);
}

unint64_t sub_100020BD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003F6A0;
  if (!qword_10003F6A0)
  {
    v1 = objc_opt_self(NSLayoutConstraint);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10003F6A0);
  }
  return result;
}

unint64_t sub_100020C14()
{
  unint64_t result;

  result = qword_10003F6B0;
  if (!qword_10003F6B0)
  {
    result = swift_getWitnessTable(&unk_100028270, &type metadata for ReactionsTip);
    atomic_store(result, &qword_10003F6B0);
  }
  return result;
}

uint64_t sub_100020C58()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));

  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100020C94()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = v0[4];
  v3 = v0[5];
  v4 = v0[6];
  v5 = v0[7];
  v6 = v0[8];
  v7 = (_QWORD *)swift_task_alloc(dword_10003F6BC);
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_10001CF44;
  return sub_10001FA2C((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

uint64_t sub_100020EA0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_10001DA68();
  v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v15 = v11;
    *(_DWORD *)v10 = 136315138;
    v14 = sub_1000184E8(0xD000000000000024, 0x800000010002FAA0, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }

  v12 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(uint64_t))((swift_isaMask & *v1) + 0x138))(v12);
}

unint64_t sub_100021060()
{
  unint64_t result;

  result = qword_10003F6D0;
  if (!qword_10003F6D0)
  {
    result = swift_getWitnessTable(&unk_1000282D0, &type metadata for ReactionsTip);
    atomic_store(result, (unint64_t *)&qword_10003F6D0);
  }
  return result;
}

void *sub_1000210A4()
{
  return &protocol witness table for String;
}

uint64_t initializeBufferWithCopyOfBuffer for ReactionsTip(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for ReactionsTip(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
}

_QWORD *initializeWithCopy for ReactionsTip(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

_QWORD *assignWithCopy for ReactionsTip(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  v6 = a2[3];
  v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

__n128 initializeWithTake for ReactionsTip(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for ReactionsTip(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2[1];
  v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  v6 = a2[3];
  v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReactionsTip(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ReactionsTip(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ReactionsTip()
{
  return &type metadata for ReactionsTip;
}

uint64_t sub_100021298()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000212BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10003F764);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10001CF44;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10003F760 + dword_10003F760))(a1, v4);
}

uint64_t sub_10002132C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

unint64_t sub_100021358()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003F7D0;
  if (!qword_10003F7D0)
  {
    v1 = sub_100019074(&qword_10003F7C8);
    sub_10002147C(&qword_10003F7D8, &qword_10003F7B8, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Variable<A>);
    sub_1000213DC();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.Equal<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003F7D0);
  }
  return result;
}

unint64_t sub_1000213DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003F7E0;
  if (!qword_10003F7E0)
  {
    v1 = sub_100019074(&qword_10003F7B0);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> PredicateExpressions.Value<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10003F7E0);
  }
  return result;
}

_QWORD *sub_100021440(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

uint64_t sub_10002147C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100019074(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void *sub_100021508()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  _BYTE v5[24];

  v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate_window);
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate_window, v5, 0, 0);
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1000215B0(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  _BYTE v5[24];

  v3 = (void **)(v1 + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate_window);
  swift_beginAccess(v3, v5, 1, 0);
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_100021600(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate_window, a1, 33, 0);
  return j__swift_endAccess;
}

id sub_100021644()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___systemApertureElementProvider;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___systemApertureElementProvider);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___systemApertureElementProvider);
  }
  else
  {
    v4 = type metadata accessor for RPSystemApertureElementViewController(0);
    v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v4)), "init");
    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

id sub_1000216B8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___statusBarAssertion;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___statusBarAssertion);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___statusBarAssertion);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)RPStatusBarAssertion), "init");
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

uint64_t sub_1000217A8()
{
  return sub_1000223E4(0xD000000000000018, 0x800000010002FC80);
}

uint64_t sub_100021888()
{
  return sub_1000223E4(0xD00000000000001CLL, 0x800000010002FC40);
}

uint64_t sub_100021918()
{
  return sub_1000223E4(0xD00000000000001BLL, 0x800000010002FC20);
}

id sub_1000219F8()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate_window] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___systemApertureElementProvider] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___statusBarAssertion] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RPSessionPlatterSceneDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100021AAC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RPSessionPlatterSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_100021B24(void *a1)
{
  void *v1;
  uint64_t v3;
  void (*v4)(char *, uint64_t);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *);
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t);
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, uint64_t, uint64_t);
  void (*v58)(char *, uint64_t);
  uint64_t v59;
  void (*v60)(_QWORD, _QWORD, _QWORD);

  v3 = type metadata accessor for Logger(0);
  v4 = *(void (**)(char *, uint64_t))(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v5);
  v10 = (char *)&v51 - v9;
  __chkstk_darwin(v8);
  v12 = (char *)&v51 - v11;
  v13 = sub_10001DA68();
  v58 = v4;
  v14 = (void (*)(char *))*((_QWORD *)v4 + 2);
  v56 = v13;
  v14(v12);
  v15 = v1;
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  v18 = os_log_type_enabled(v16, v17);
  v57 = (void (*)(char *, uint64_t, uint64_t))v14;
  if (v18)
  {
    v19 = swift_slowAlloc(32, -1);
    v53 = v7;
    v20 = v19;
    v21 = (_QWORD *)swift_slowAlloc(16, -1);
    v51 = swift_slowAlloc(32, -1);
    v60 = (void (*)(_QWORD, _QWORD, _QWORD))v51;
    *(_DWORD *)v20 = 136315650;
    v59 = sub_1000184E8(0xD00000000000001FLL, 0x800000010002FCA0, (uint64_t *)&v60);
    v54 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60);
    *(_WORD *)(v20 + 12) = 2112;
    v52 = a1;
    v55 = v3;
    v59 = (uint64_t)v15;
    v22 = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60);
    *v21 = v15;

    *(_WORD *)(v20 + 22) = 2112;
    v23 = sub_100021644();
    v59 = (uint64_t)v23;
    v10 = v54;
    a1 = v52;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60);
    v21[1] = v23;
    v3 = v55;

    _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s %@ connecting PlatterSceneDelegate scene systemApertureElementProvider=%@", (uint8_t *)v20, 0x20u);
    v24 = sub_100018DCC(&qword_10003F0C0);
    swift_arrayDestroy(v21, 2, v24);
    swift_slowDealloc(v21, -1, -1);
    v25 = v51;
    swift_arrayDestroy(v51, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v25, -1, -1);
    v26 = v20;
    v7 = v53;
    swift_slowDealloc(v26, -1, -1);

  }
  else
  {

  }
  v27 = (void (*)(char *, uint64_t))*((_QWORD *)v58 + 1);
  v27(v12, v3);
  v28 = type metadata accessor for ActivityScene(0);
  v29 = swift_dynamicCastClass(a1, v28);
  if (v29)
  {
    v30 = (void *)v29;
    v31 = a1;
    if (objc_msgSend(v30, "SBUI_isHostedBySystemAperture"))
    {
      v32 = sub_1000216B8();
      objc_msgSend(v32, "showStatusBarWithPid:", getpid());

      v31 = v31;
      v33 = sub_100021644();
      objc_msgSend(v30, "setSystemApertureElementViewControllerProvider:", v33);

      v57(v10, v56, v3);
      v34 = v15;
      v35 = Logger.logObject.getter(v34);
      v36 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = swift_slowAlloc(32, -1);
        v54 = v10;
        v38 = v37;
        v39 = (_QWORD *)swift_slowAlloc(16, -1);
        v57 = (void (*)(char *, uint64_t, uint64_t))swift_slowAlloc(32, -1);
        v60 = (void (*)(_QWORD, _QWORD, _QWORD))v57;
        *(_DWORD *)v38 = 136315650;
        v40 = sub_1000184E8(0xD00000000000001FLL, 0x800000010002FCA0, (uint64_t *)&v60);
        v58 = v27;
        v59 = v40;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60);
        *(_WORD *)(v38 + 12) = 2112;
        v55 = v3;
        v59 = (uint64_t)v34;
        v41 = v34;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60);
        *v39 = v34;

        *(_WORD *)(v38 + 22) = 2112;
        v42 = sub_100021644();
        v59 = (uint64_t)v42;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60);
        v39[1] = v42;

        _os_log_impl((void *)&_mh_execute_header, v35, v36, "%s %@ adding connectionManager delegate=%@", (uint8_t *)v38, 0x20u);
        v43 = sub_100018DCC(&qword_10003F0C0);
        swift_arrayDestroy(v39, 2, v43);
        swift_slowDealloc(v39, -1, -1);
        v44 = v57;
        swift_arrayDestroy(v57, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v44, -1, -1);
        swift_slowDealloc(v38, -1, -1);

        v58(v54, v55);
      }
      else
      {

        v27(v10, v3);
      }
      v49 = objc_msgSend((id)objc_opt_self(RPAngelConnectionManager), "sharedInstance");
      v50 = sub_100021644();
      objc_msgSend(v49, "setDelegate:", v50);

    }
  }
  else
  {
    v45 = ((uint64_t (*)(char *, uint64_t, uint64_t))v57)(v7, v56, v3);
    v46 = Logger.logObject.getter(v45);
    v47 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "not an Activity scene", v48, 2u);
      swift_slowDealloc(v48, -1, -1);
    }

    v27(v7, v3);
  }
}

void sub_100022180()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_10001DA68();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  v6 = v0;
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc(22, -1);
    v17 = (_QWORD *)swift_slowAlloc(8, -1);
    v19 = swift_slowAlloc(32, -1);
    v21 = v19;
    *(_DWORD *)v9 = 136315394;
    v20 = sub_1000184E8(0xD000000000000019, 0x800000010002FC60, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21);
    *(_WORD *)(v9 + 12) = 2112;
    v20 = (uint64_t)v6;
    v10 = v6;
    v18 = v1;
    v11 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21);
    v12 = v17;
    *v17 = v6;

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s %@", (uint8_t *)v9, 0x16u);
    v13 = sub_100018DCC(&qword_10003F0C0);
    swift_arrayDestroy(v12, 1, v13);
    swift_slowDealloc(v12, -1, -1);
    v14 = v19;
    swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v9, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v18);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  v15 = sub_1000216B8();
  objc_msgSend(v15, "invalidateStatusBar");

}

uint64_t sub_1000223E4(uint64_t a1, unint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10001DA68();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  v10 = v2;
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc(22, -1);
    v24 = v6;
    v14 = v13;
    v15 = (_QWORD *)swift_slowAlloc(8, -1);
    v23 = swift_slowAlloc(32, -1);
    v26 = v23;
    *(_DWORD *)v14 = 136315394;
    v25 = sub_1000184E8(a1, a2, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26);
    *(_WORD *)(v14 + 12) = 2112;
    v25 = (uint64_t)v10;
    v16 = v10;
    v22 = v5;
    v17 = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26);
    *v15 = v10;

    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s %@", (uint8_t *)v14, 0x16u);
    v18 = sub_100018DCC(&qword_10003F0C0);
    swift_arrayDestroy(v15, 1, v18);
    swift_slowDealloc(v15, -1, -1);
    v19 = v23;
    swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v19, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v8, v22);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

void sub_100022624()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*isa)(char *);
  _QWORD *v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  _QWORD *v15;
  void (*v16)(char *);
  uint64_t v17;
  id v18;
  _QWORD *v19;
  os_log_t v20;
  uint64_t v21;
  uint64_t v22;
  Class v23;
  void *v24;
  char **v25;
  id v26;
  id v27;
  id v28;
  char *v29;
  _QWORD *v30;
  NSObject *v31;
  uint64_t v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  id v38;
  os_log_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  os_log_t v44;
  _QWORD *v45;
  os_log_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;

  v1 = type metadata accessor for Logger(0);
  v2 = *(NSObject **)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v44 - v6;
  v8 = sub_10001DA68();
  isa = (void (*)(char *))v2[2].isa;
  v48 = v8;
  isa(v7);
  v10 = v0;
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  v13 = os_log_type_enabled(v11, v12);
  v49 = v5;
  if (v13)
  {
    v14 = swift_slowAlloc(22, -1);
    v45 = (_QWORD *)swift_slowAlloc(8, -1);
    v47 = swift_slowAlloc(32, -1);
    v51 = v47;
    *(_DWORD *)v14 = 136315394;
    v44 = v11;
    v50 = sub_1000184E8(0xD000000000000016, 0x800000010002FC00, &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &v51);
    *(_WORD *)(v14 + 12) = 2112;
    v50 = (uint64_t)v10;
    v15 = v10;
    v46 = v2;
    v16 = isa;
    v17 = v1;
    v18 = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &v51);
    v19 = v45;
    *v45 = v10;

    v1 = v17;
    isa = v16;
    v20 = v44;
    _os_log_impl((void *)&_mh_execute_header, v44, v12, "%s %@", (uint8_t *)v14, 0x16u);
    v21 = sub_100018DCC(&qword_10003F0C0);
    swift_arrayDestroy(v19, 1, v21);
    swift_slowDealloc(v19, -1, -1);
    v22 = v47;
    swift_arrayDestroy(v47, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    v23 = v46[1].isa;
  }
  else
  {

    v23 = v2[1].isa;
  }
  ((void (*)(char *, uint64_t))v23)(v7, v1);
  (*(void (**)(_QWORD))((swift_isaMask & *v10) + 0x70))(0);
  v24 = (void *)objc_opt_self(RPAngelConnectionManager);
  v25 = &off_10003D000;
  v26 = objc_msgSend(v24, "sharedInstance");
  v27 = objc_msgSend(v26, "delegate");

  v28 = sub_100021644();
  if (v27)
  {
    swift_unknownObjectRelease(v27);

    if (v27 != v28)
      return;
    v29 = v49;
    ((void (*)(char *, uint64_t, uint64_t))isa)(v49, v48, v1);
    v30 = v10;
    v31 = Logger.logObject.getter(v30);
    v32 = v1;
    v33 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v31, v33))
    {
      v34 = swift_slowAlloc(32, -1);
      v46 = v31;
      v35 = v34;
      v36 = (_QWORD *)swift_slowAlloc(16, -1);
      v47 = swift_slowAlloc(32, -1);
      v51 = v47;
      *(_DWORD *)v35 = 136315650;
      v48 = v32;
      v50 = sub_1000184E8(0xD000000000000016, 0x800000010002FC00, &v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &v51);
      *(_WORD *)(v35 + 12) = 2112;
      v50 = (uint64_t)v30;
      v37 = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &v51);
      *v36 = v30;

      *(_WORD *)(v35 + 22) = 2112;
      v38 = sub_100021644();
      v50 = (uint64_t)v38;
      v25 = &off_10003D000;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &v51);
      v36[1] = v38;

      v39 = v46;
      _os_log_impl((void *)&_mh_execute_header, v46, v33, "%s %@ removing connectionManager delegate=%@", (uint8_t *)v35, 0x20u);
      v40 = sub_100018DCC(&qword_10003F0C0);
      swift_arrayDestroy(v36, 2, v40);
      swift_slowDealloc(v36, -1, -1);
      v41 = v47;
      swift_arrayDestroy(v47, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v41, -1, -1);
      swift_slowDealloc(v35, -1, -1);

      v43 = v48;
      v42 = v49;
    }
    else
    {

      v42 = v29;
      v43 = v32;
    }
    ((void (*)(char *, uint64_t))v23)(v42, v43);
    v28 = objc_msgSend(v24, v25[236]);
    objc_msgSend(v28, "setDelegate:", 0);
  }

}

uint64_t type metadata accessor for RPSessionPlatterSceneDelegate()
{
  return objc_opt_self(_TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate);
}

void *sub_100022B7C()
{
  return &unk_1000283C0;
}

double sub_100022B88()
{
  return 22.0;
}

void *sub_100022B90()
{
  return &unk_1000283C8;
}

void *sub_100022B9C()
{
  return &unk_1000283D0;
}

double sub_100022BA8()
{
  return 5.0;
}

void *sub_100022BB0()
{
  return &unk_1000283D8;
}

double sub_100022BBC()
{
  return 20.0;
}

void *sub_100022BC4()
{
  return &unk_1000283E0;
}

double sub_100022BD0()
{
  return -2.0;
}

void *sub_100022BD8()
{
  return &unk_1000283E8;
}

void *sub_100022BE4()
{
  return &unk_1000283F0;
}

void *sub_100022BF0()
{
  return &unk_1000283F8;
}

double sub_100022BFC()
{
  return 7.0;
}

void *sub_100022C04()
{
  return &unk_100028400;
}

double sub_100022C10()
{
  return -7.0;
}

void *sub_100022C18()
{
  return &unk_100028408;
}

double sub_100022C24()
{
  return 1000.0;
}

void *sub_100022C34()
{
  return &unk_100028410;
}

double sub_100022C40()
{
  return 90.0;
}

void *sub_100022C50()
{
  return &unk_100028418;
}

double sub_100022C5C()
{
  return 0.0;
}

void *sub_100022C64()
{
  return &unk_100028420;
}

double sub_100022C70()
{
  return 47.33;
}

void *sub_100022C7C()
{
  return &unk_100028428;
}

double sub_100022C88()
{
  return 1.0;
}

void *sub_100022C90()
{
  return &unk_100028430;
}

void *sub_100022C9C()
{
  return &unk_100028438;
}

void *sub_100022CA8()
{
  return &unk_100028440;
}

void *sub_100022CB4()
{
  return &unk_100028448;
}

const char *sub_100022CC0()
{
  return "Countdown3";
}

uint64_t sub_100022CCC()
{
  return 0x776F64746E756F43;
}

const char *sub_100022CE8()
{
  return "Countdown2";
}

uint64_t sub_100022CF4()
{
  return 0x776F64746E756F43;
}

const char *sub_100022D10()
{
  return "Countdown1";
}

uint64_t sub_100022D1C()
{
  return 0x776F64746E756F43;
}

void *sub_100022D38()
{
  return &unk_100035E28;
}

unint64_t sub_100022D44()
{
  return 0xD000000000000011;
}

void *sub_100022D60()
{
  return &unk_100035E38;
}

unint64_t sub_100022D6C()
{
  return 0xD000000000000014;
}

void *sub_100022D88()
{
  return &unk_100035E48;
}

unint64_t sub_100022D94()
{
  return 0xD000000000000015;
}

void *sub_100022DB0()
{
  return &unk_100028480;
}

double sub_100022DBC()
{
  return 28.5;
}

void *sub_100022DCC()
{
  return &unk_100028488;
}

double sub_100022DD8()
{
  return 23.5;
}

void *sub_100022DE8()
{
  return &unk_100028490;
}

double sub_100022DF4()
{
  return 6.36;
}

void *sub_100022E00()
{
  return &unk_100028498;
}

double sub_100022E0C()
{
  return 0.5;
}

void *sub_100022E14()
{
  return &unk_1000284A0;
}

double sub_100022E20()
{
  return 0.4;
}

void *sub_100022E2C()
{
  return &unk_1000284A8;
}

double sub_100022E38()
{
  return 139.0;
}

void sub_100022E48(uint64_t a1)
{
  sub_1000233D0(a1, 0xD000000000000026, 0x800000010002FDD0, &qword_100040C88, &qword_100040C90);
}

uint64_t *sub_100022E70()
{
  if (qword_100040BA0 != -1)
    swift_once(&qword_100040BA0, sub_100022E48);
  return &qword_100040C88;
}

uint64_t sub_100022EB0()
{
  return sub_1000230F0(&qword_100040BA0, &qword_100040C88, &qword_100040C90);
}

void *sub_100022ED0()
{
  return &unk_1000284B0;
}

double sub_100022EDC()
{
  return 62.0;
}

void *sub_100022EE8()
{
  return &unk_1000284B8;
}

double sub_100022EF4()
{
  return 17.5;
}

void *sub_100022F04()
{
  return &unk_1000284C0;
}

double sub_100022F10()
{
  return 54.0;
}

void *sub_100022F1C()
{
  return &unk_1000284C8;
}

void *sub_100022F28()
{
  return &unk_1000284D0;
}

double sub_100022F34()
{
  return 15.0;
}

void *sub_100022F3C()
{
  return &unk_1000284D8;
}

double sub_100022F48()
{
  return 14.0;
}

const char *sub_100022F50()
{
  return "00:00";
}

uint64_t sub_100022F5C()
{
  return 206967550000;
}

void *sub_100022F70()
{
  return &unk_1000284F0;
}

id sub_100022F7C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithRed:green:blue:alpha:", 1.0, 0.2855, 0.1814, 1.0);
  qword_100040C98 = (uint64_t)result;
  return result;
}

uint64_t *sub_100022FC4()
{
  if (qword_100040BA8 != -1)
    swift_once(&qword_100040BA8, sub_100022F7C);
  return &qword_100040C98;
}

id sub_100023004()
{
  if (qword_100040BA8 != -1)
    swift_once(&qword_100040BA8, sub_100022F7C);
  return (id)qword_100040C98;
}

void *sub_100023044()
{
  return &unk_1000284F8;
}

void *sub_100023050()
{
  return &unk_100028500;
}

void *sub_10002305C()
{
  return &unk_100028508;
}

void sub_100023068(uint64_t a1)
{
  sub_1000233D0(a1, 0xD000000000000016, 0x800000010002FDB0, &qword_100040CA0, &qword_100040CA8);
}

uint64_t *sub_100023090()
{
  if (qword_100040BB0 != -1)
    swift_once(&qword_100040BB0, sub_100023068);
  return &qword_100040CA0;
}

uint64_t sub_1000230D0()
{
  return sub_1000230F0(&qword_100040BB0, &qword_100040CA0, &qword_100040CA8);
}

uint64_t sub_1000230F0(_QWORD *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v5;

  if (*a1 != -1)
    swift_once();
  v5 = *a2;
  swift_bridgeObjectRetain(*a3);
  return v5;
}

void sub_100023140(uint64_t a1)
{
  sub_1000233D0(a1, 0xD000000000000020, 0x800000010002FD80, &qword_100040CB0, &qword_100040CB8);
}

uint64_t *sub_100023168()
{
  if (qword_100040BB8 != -1)
    swift_once(&qword_100040BB8, sub_100023140);
  return &qword_100040CB0;
}

uint64_t sub_1000231A8()
{
  return sub_1000230F0(&qword_100040BB8, &qword_100040CB0, &qword_100040CB8);
}

void *sub_1000231C8()
{
  return &unk_100028510;
}

double sub_1000231D4()
{
  return 600.0;
}

void *sub_1000231E4()
{
  return &unk_100035E58;
}

unint64_t sub_1000231F0()
{
  return 0xD000000000000018;
}

const char *sub_10002320C()
{
  return "Base State";
}

uint64_t sub_100023218()
{
  return 0x6174532065736142;
}

void *sub_100023234()
{
  return &unk_100028528;
}

uint64_t sub_100023240()
{
  return 51;
}

void *sub_10002324C()
{
  return &unk_100028538;
}

uint64_t sub_100023258()
{
  return 50;
}

void *sub_100023264()
{
  return &unk_100028548;
}

uint64_t sub_100023270()
{
  return 49;
}

const char *sub_10002327C()
{
  return "start";
}

uint64_t sub_100023288()
{
  return 0x7472617473;
}

const char *sub_10002329C()
{
  return "breathe";
}

uint64_t sub_1000232A8()
{
  return 0x65687461657262;
}

const char *sub_1000232C0()
{
  return "saving";
}

uint64_t sub_1000232CC()
{
  return 0x676E69766173;
}

const char *sub_1000232E0()
{
  return "spinner";
}

uint64_t sub_1000232EC()
{
  return 0x72656E6E697073;
}

const char *sub_100023304()
{
  return "done";
}

uint64_t sub_100023310()
{
  return 1701736292;
}

void sub_100023320(uint64_t a1)
{
  sub_1000233D0(a1, 0xD000000000000020, 0x800000010002FD50, &qword_100040CC0, &qword_100040CC8);
}

uint64_t *sub_100023348()
{
  if (qword_100040BC0 != -1)
    swift_once(&qword_100040BC0, sub_100023320);
  return &qword_100040CC0;
}

uint64_t sub_100023388()
{
  return sub_1000230F0(&qword_100040BC0, &qword_100040CC0, &qword_100040CC8);
}

void sub_1000233A8(uint64_t a1)
{
  sub_1000233D0(a1, 0xD000000000000022, 0x800000010002FD20, &qword_100040CD0, &qword_100040CD8);
}

void sub_1000233D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, _QWORD *a5)
{
  void *v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = (void *)objc_opt_self(NSBundle);
  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend(v7, "_rpLocalizedStringFromFrameworkBundleWithKey:", v8);

  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);
  v13 = v12;

  *a4 = v11;
  *a5 = v13;
}

uint64_t *sub_100023468()
{
  if (qword_100040BC8 != -1)
    swift_once(&qword_100040BC8, sub_1000233A8);
  return &qword_100040CD0;
}

uint64_t sub_1000234A8()
{
  return sub_1000230F0(&qword_100040BC8, &qword_100040CD0, &qword_100040CD8);
}

void *sub_1000234C8()
{
  return &unk_1000285A8;
}

double sub_1000234D4()
{
  return 12.5;
}

void *sub_1000234DC()
{
  return &unk_1000285B0;
}

double sub_1000234E8()
{
  return 327.0;
}

void *sub_1000234F8()
{
  return &unk_1000285B8;
}

double sub_100023504()
{
  return 0.9988;
}

void *sub_100023510()
{
  return &unk_1000285C0;
}

double sub_10002351C()
{
  return 0.271;
}

void *sub_100023528()
{
  return &unk_1000285C8;
}

double sub_100023534()
{
  return 0.2263;
}

void *sub_100023540()
{
  return &unk_1000285D0;
}

const char *sub_10002354C()
{
  return "start";
}

const char *sub_100023558()
{
  return "press stop";
}

uint64_t sub_100023564()
{
  return 0x7473207373657270;
}

const char *sub_100023580()
{
  return "spinner";
}

const char *sub_10002358C()
{
  return "done";
}

const char *sub_100023598()
{
  return "done-press";
}

uint64_t sub_1000235A4()
{
  return 0x6572702D656E6F64;
}

ValueMetadata *type metadata accessor for RPSessionAccessoryViewConstants()
{
  return &type metadata for RPSessionAccessoryViewConstants;
}

ValueMetadata *type metadata accessor for RPSystemApertureElementConstants()
{
  return &type metadata for RPSystemApertureElementConstants;
}

ValueMetadata *type metadata accessor for CountdownState()
{
  return &type metadata for CountdownState;
}

ValueMetadata *type metadata accessor for CountdownStatus()
{
  return &type metadata for CountdownStatus;
}

ValueMetadata *type metadata accessor for ExpandedViewConstants()
{
  return &type metadata for ExpandedViewConstants;
}

ValueMetadata *type metadata accessor for ScreenRecordingLabelConstants()
{
  return &type metadata for ScreenRecordingLabelConstants;
}

ValueMetadata *type metadata accessor for StopImageConstants()
{
  return &type metadata for StopImageConstants;
}

ValueMetadata *type metadata accessor for TimerLabelConstants()
{
  return &type metadata for TimerLabelConstants;
}

ValueMetadata *type metadata accessor for RecordingDotConstants()
{
  return &type metadata for RecordingDotConstants;
}

ValueMetadata *type metadata accessor for PhotosLabelConstants()
{
  return &type metadata for PhotosLabelConstants;
}

ValueMetadata *type metadata accessor for SessionConstants()
{
  return &type metadata for SessionConstants;
}

ValueMetadata *type metadata accessor for ViewStates()
{
  return &type metadata for ViewStates;
}

ValueMetadata *type metadata accessor for ButtonConstants()
{
  return &type metadata for ButtonConstants;
}

ValueMetadata *type metadata accessor for RedKeyLineConstants()
{
  return &type metadata for RedKeyLineConstants;
}

ValueMetadata *type metadata accessor for ExpandedViewStates()
{
  return &type metadata for ExpandedViewStates;
}

void *sub_1000236F8()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  _BYTE v5[24];

  v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate_window);
  swift_beginAccess(v0 + OBJC_IVAR____TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate_window, v5, 0, 0);
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1000237A0(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  _BYTE v5[24];

  v3 = (void **)(v1 + OBJC_IVAR____TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate_window);
  swift_beginAccess(v3, v5, 1, 0);
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1000237F0(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate_window, a1, 33, 0);
  return j__swift_endAccess;
}

uint64_t sub_100023904()
{
  return sub_1000223E4(0xD000000000000019, 0x800000010002FC60);
}

id sub_100023AAC()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate_window] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RPRemoteAlertSceneDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100023B30()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RPRemoteAlertSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

unint64_t sub_100023B70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100023BA0(a1, v4);
}

unint64_t sub_100023BA0(uint64_t a1, uint64_t a2)
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
      sub_100024BF4(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100024B80((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void sub_100023C64(char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  _QWORD *v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  os_log_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  const char *v51;
  id v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t ObjectType;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  unint64_t v66;
  unint64_t v67;
  char v68;
  uint64_t v69;
  unint64_t v70;
  NSObject *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  NSObject *v75;
  uint64_t v76;
  NSObject *v77;
  os_log_type_t v78;
  uint8_t *v79;
  NSObject *v80;
  os_log_t v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(char *, uint64_t, uint64_t);
  char *v86;
  char *v87;
  char *v88;
  unint64_t v89;
  _QWORD *v90;
  char *v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94[5];
  __int128 v95;
  __int128 v96;

  v91 = a1;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v88 = (char *)&v81 - v8;
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v81 - v10;
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v81 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v81 - v15;
  v17 = sub_10001DA68();
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v18(v16, v17, v2);
  v19 = v1;
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.default.getter();
  LODWORD(v89) = v21;
  v22 = os_log_type_enabled(v20, v21);
  v90 = v19;
  v87 = v14;
  if (v22)
  {
    v23 = swift_slowAlloc(22, -1);
    v86 = v11;
    v24 = v23;
    v82 = (_QWORD *)swift_slowAlloc(8, -1);
    v84 = swift_slowAlloc(32, -1);
    v94[0] = v84;
    *(_DWORD *)v24 = 136315394;
    v81 = v20;
    *(_QWORD *)&v95 = sub_1000184E8(0xD00000000000001FLL, 0x800000010002FCA0, v94);
    v85 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v95, (char *)&v95 + 8);
    *(_WORD *)(v24 + 12) = 2112;
    v83 = v3;
    *(_QWORD *)&v95 = v19;
    v25 = v6;
    v26 = v17;
    v27 = v19;
    v18 = v85;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v95, (char *)&v95 + 8);
    v28 = v82;
    *v82 = v19;

    v17 = v26;
    v6 = v25;
    v29 = v81;
    _os_log_impl((void *)&_mh_execute_header, v81, (os_log_type_t)v89, "%s %@ Remote Alert for reactions tip", (uint8_t *)v24, 0x16u);
    v30 = sub_100018DCC(&qword_10003F0C0);
    swift_arrayDestroy(v28, 1, v30);
    swift_slowDealloc(v28, -1, -1);
    v31 = v84;
    swift_arrayDestroy(v84, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v31, -1, -1);
    v32 = v24;
    v11 = v86;
    swift_slowDealloc(v32, -1, -1);

    v33 = *(void (**)(char *, uint64_t))(v83 + 8);
  }
  else
  {

    v33 = *(void (**)(char *, uint64_t))(v3 + 8);
  }
  v33(v16, v2);
  v34 = v91;
  v35 = objc_opt_self(SBSUIRemoteAlertScene);
  v36 = swift_dynamicCastObjCClass(v34, v35);
  if (v36)
  {
    v37 = (void *)v36;
    v38 = objc_allocWithZone((Class)UIWindow);
    v39 = v34;
    v40 = objc_msgSend(v38, "initWithWindowScene:", v37);
    (*(void (**)(id))((swift_isaMask & *v90) + 0x60))(v40);
    v41 = objc_msgSend(v37, "configurationContext");
    if (v41
      && (v42 = v41, v43 = objc_msgSend(v41, "userInfo"), v42, v43))
    {
      v91 = (char *)v17;
      v44 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v43, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

      v92 = 0x746163696C707061;
      v93 = 0xEF656D614E6E6F69;
      AnyHashable.init<A>(_:)(v94, &v92, &type metadata for String, &protocol witness table for String);
      if (*(_QWORD *)(v44 + 16) && (v45 = sub_100023B70((uint64_t)v94), (v46 & 1) != 0))
      {
        sub_10001A4C8(*(_QWORD *)(v44 + 56) + 32 * v45, (uint64_t)&v95);
      }
      else
      {
        v95 = 0u;
        v96 = 0u;
      }
      sub_100024B80((uint64_t)v94);
      if (*((_QWORD *)&v96 + 1))
      {
        if ((swift_dynamicCast(&v92, &v95, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
        {
          v65 = v11;
          v66 = v93;
          v89 = v92;
          v92 = 0xD000000000000010;
          v93 = 0x800000010002FE40;
          AnyHashable.init<A>(_:)(v94, &v92, &type metadata for String, &protocol witness table for String);
          if (*(_QWORD *)(v44 + 16) && (v67 = sub_100023B70((uint64_t)v94), (v68 & 1) != 0))
          {
            sub_10001A4C8(*(_QWORD *)(v44 + 56) + 32 * v67, (uint64_t)&v95);
          }
          else
          {
            v95 = 0u;
            v96 = 0u;
          }
          swift_bridgeObjectRelease(v44);
          sub_100024B80((uint64_t)v94);
          if (*((_QWORD *)&v96 + 1))
          {
            if ((swift_dynamicCast(&v92, &v95, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
            {
              v69 = v92;
              v70 = v93;
              type metadata accessor for RPReactionsTipViewController();
              v71 = sub_10001E74C(v89, v66, v69, v70);
              v72 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v90) + 0x58))();
              if (v72)
              {
                v73 = v72;
                objc_msgSend(v72, "setRootViewController:", v71);
                objc_msgSend(v73, "makeKeyAndVisible");
                objc_msgSend(v37, "setAllowsMenuButtonDismissal:", 1);

                return;
              }
              v6 = v87;
              v76 = ((uint64_t (*)(char *, char *, uint64_t))v18)(v87, v91, v2);
              v77 = Logger.logObject.getter(v76);
              v78 = static os_log_type_t.default.getter();
              if (os_log_type_enabled(v77, v78))
              {
                v79 = (uint8_t *)swift_slowAlloc(2, -1);
                *(_WORD *)v79 = 0;
                _os_log_impl((void *)&_mh_execute_header, v77, v78, "window is nil", v79, 2u);
                swift_slowDealloc(v79, -1, -1);
                v80 = v39;
              }
              else
              {
                v80 = v77;
                v77 = v71;
                v71 = v39;
              }

              goto LABEL_15;
            }
            swift_bridgeObjectRelease(v66);
          }
          else
          {
            swift_bridgeObjectRelease(v66);
            sub_100024BB4((uint64_t)&v95);
          }
          v11 = v65;
        }
        else
        {
          swift_bridgeObjectRelease(v44);
        }
      }
      else
      {
        swift_bridgeObjectRelease(v44);
        sub_100024BB4((uint64_t)&v95);
      }
      v74 = ((uint64_t (*)(char *, char *, uint64_t))v18)(v11, v91, v2);
      v48 = Logger.logObject.getter(v74);
      v49 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v48, v49))
      {
        v50 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v50 = 0;
        v51 = "missing dictionary info";
        goto LABEL_34;
      }
    }
    else
    {
      v11 = v88;
      v47 = ((uint64_t (*)(char *, uint64_t, uint64_t))v18)(v88, v17, v2);
      v48 = Logger.logObject.getter(v47);
      v49 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v48, v49))
      {
        v50 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v50 = 0;
        v51 = "user info dictionary missing from remote alert";
LABEL_34:
        _os_log_impl((void *)&_mh_execute_header, v48, v49, v51, v50, 2u);
        swift_slowDealloc(v50, -1, -1);
        v75 = v39;
LABEL_36:

        v63 = v11;
        goto LABEL_37;
      }
    }
    v75 = v48;
    v48 = v39;
    goto LABEL_36;
  }
  v18(v6, v17, v2);
  v52 = v34;
  v53 = Logger.logObject.getter(v52);
  v54 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v53, v54))
  {

LABEL_15:
    v63 = v6;
LABEL_37:
    v64 = v2;
    goto LABEL_38;
  }
  v55 = (uint8_t *)swift_slowAlloc(12, -1);
  v56 = swift_slowAlloc(32, -1);
  v91 = v6;
  v57 = v56;
  v94[0] = v56;
  *(_DWORD *)v55 = 136315138;
  ObjectType = swift_getObjectType(v52);
  v59 = _typeName(_:qualified:)(ObjectType, 0);
  v60 = v2;
  v62 = v61;
  *(_QWORD *)&v95 = sub_1000184E8(v59, v61, v94);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v95, (char *)&v95 + 8);

  swift_bridgeObjectRelease(v62);
  _os_log_impl((void *)&_mh_execute_header, v53, v54, "Expected remote alert scene. scene type=%s", v55, 0xCu);
  swift_arrayDestroy(v57, 1, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v57, -1, -1);
  swift_slowDealloc(v55, -1, -1);

  v63 = v91;
  v64 = v60;
LABEL_38:
  v33(v63, v64);
}

void sub_100024558()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  void (*v9)(_BYTE *, uint64_t, uint64_t);
  _QWORD *v10;
  NSObject *v11;
  os_log_type_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v17;
  _QWORD *v18;
  _QWORD *v19;
  os_log_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(_BYTE *, uint64_t);
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  _BYTE v36[4];
  int v37;
  os_log_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = &v36[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v3);
  v7 = &v36[-v6];
  v8 = sub_10001DA68();
  v9 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16);
  v9(v7, v8, v1);
  v10 = v0;
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  v13 = v12;
  if (os_log_type_enabled(v11, v12))
  {
    v14 = swift_slowAlloc(22, -1);
    v42 = v1;
    v15 = v14;
    v39 = (_QWORD *)swift_slowAlloc(8, -1);
    v41 = swift_slowAlloc(32, -1);
    v44 = v41;
    *(_DWORD *)v15 = 136315394;
    v38 = v11;
    v43 = sub_1000184E8(0xD000000000000018, 0x800000010002FC80, &v44);
    v37 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44);
    *(_WORD *)(v15 + 12) = 2112;
    v40 = v2;
    v43 = (uint64_t)v10;
    v16 = v9;
    v17 = v5;
    v18 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44);
    v19 = v39;
    *v39 = v10;

    v5 = v17;
    v9 = v16;
    v20 = v38;
    _os_log_impl((void *)&_mh_execute_header, v38, (os_log_type_t)v37, "%s %@", (uint8_t *)v15, 0x16u);
    v21 = sub_100018DCC(&qword_10003F0C0);
    swift_arrayDestroy(v19, 1, v21);
    swift_slowDealloc(v19, -1, -1);
    v22 = v41;
    swift_arrayDestroy(v41, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1, -1);
    v23 = v15;
    v1 = v42;
    swift_slowDealloc(v23, -1, -1);

    v24 = *(uint64_t (**)(_BYTE *, uint64_t))(v40 + 8);
  }
  else
  {

    v24 = *(uint64_t (**)(_BYTE *, uint64_t))(v2 + 8);
  }
  v25 = v24(v7, v1);
  v26 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v10) + 0x58))(v25);
  if (v26)
  {
    v27 = v26;
    v28 = objc_msgSend(v26, "rootViewController");

    if (v28)
    {
      v29 = type metadata accessor for RPReactionsTipViewController();
      v30 = (void *)swift_dynamicCastClass(v28, v29);
      if (v30)
      {
        v31 = objc_msgSend(v30, "presentedViewController");

        if (!v31)
          return;
      }
      else
      {

      }
    }
  }
  v32 = ((uint64_t (*)(_BYTE *, uint64_t, uint64_t))v9)(v5, v8, v1);
  v33 = Logger.logObject.getter(v32);
  v34 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v35 = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "rootViewController is not valid", v35, 2u);
    swift_slowDealloc(v35, -1, -1);
  }

  v24(v5, v1);
}

uint64_t sub_1000248F4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_10001DA68();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  v6 = v0;
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc(22, -1);
    v17 = (_QWORD *)swift_slowAlloc(8, -1);
    v19 = swift_slowAlloc(32, -1);
    v21 = v19;
    *(_DWORD *)v9 = 136315394;
    v20 = sub_1000184E8(0xD000000000000016, 0x800000010002FC00, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21);
    *(_WORD *)(v9 + 12) = 2112;
    v20 = (uint64_t)v6;
    v10 = v6;
    v18 = v1;
    v11 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21);
    v12 = v17;
    *v17 = v6;

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s %@", (uint8_t *)v9, 0x16u);
    v13 = sub_100018DCC(&qword_10003F0C0);
    swift_arrayDestroy(v12, 1, v13);
    swift_slowDealloc(v12, -1, -1);
    v14 = v19;
    swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v9, -1, -1);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v18);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return (*(uint64_t (**)(_QWORD))((swift_isaMask & *v6) + 0x60))(0);
}

uint64_t type metadata accessor for RPRemoteAlertSceneDelegate()
{
  return objc_opt_self(_TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate);
}

uint64_t sub_100024B80(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100024BB4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100018DCC(&qword_10003F150);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100024BF4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100024C30()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

id sub_100024C40()
{
  uint64_t v0;
  uint64_t ObjCClassFromMetadata;
  id result;

  v0 = type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  result = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  qword_100040BD8 = (uint64_t)result;
  return result;
}

uint64_t sub_100024C90()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10001DAC8(v0, qword_100040CE0);
  sub_10001DAB0(v0, (uint64_t)qword_100040CE0);
  if (qword_100040BD0 != -1)
    swift_once(&qword_100040BD0, sub_100024C40);
  return ImageResource.init(name:bundle:)(0x6920736F746F6870, 0xEB000000006E6F63, (id)qword_100040BD8);
}

uint64_t sub_100024D30()
{
  uint64_t v0;

  if (qword_100040BE0 != -1)
    swift_once(&qword_100040BE0, sub_100024C90);
  v0 = type metadata accessor for ImageResource(0);
  return sub_10001DAB0(v0, (uint64_t)qword_100040CE0);
}

uint64_t sub_100024D78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100040BE0 != -1)
    swift_once(&qword_100040BE0, sub_100024C90);
  v2 = type metadata accessor for ImageResource(0);
  v3 = sub_10001DAB0(v2, (uint64_t)qword_100040CE0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC14ReplayKitAngelP33_53EAE9262A527F6A84219DA18703EA2419ResourceBundleClass);
}

void sub_100024E08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005770();
  sub_100005760((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Permission Denied", v1, v2, v3, v4, v5);
}

void sub_100024E84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005770();
  sub_100005760((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Unidentifiable application", v1, v2, v3, v4, v5);
}

void sub_100024F00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005770();
  sub_100005760((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Camera not found", v1, v2, v3, v4, v5);
}

void sub_100024F7C(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = objc_begin_catch(a1);
  if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100005770();
    sub_100005760((void *)&_mh_execute_header, &_os_log_default, v2, " [ERROR] %{public}s:%d _pegasusProxy removeObserver failed", v3, v4, v5, v6, v7);
  }

  objc_end_catch();
  sub_100007520();
}

void sub_100025040(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = objc_begin_catch(a1);
  if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100005770();
    sub_100005760((void *)&_mh_execute_header, &_os_log_default, v2, " [ERROR] %{public}s:%d removeObserver failed", v3, v4, v5, v6, v7);
  }

  objc_end_catch();
  sub_100007520();
}

void sub_100025104(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  uint64_t v6;

  v1 = 136446722;
  v2 = "-[RPStatusBarAssertion invalidateStatusBar]_block_invoke";
  v3 = 1024;
  v4 = 104;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d setRegisteredStyleOverrides replied with error: %@", (uint8_t *)&v1, 0x1Cu);
}

id objc_msgSend_AVConferencePreviewSingleton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "AVConferencePreviewSingleton");
}

id objc_msgSend__rpLocalizedStringFromFrameworkBundleWithKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rpLocalizedStringFromFrameworkBundleWithKey:");
}

id objc_msgSend__rpUserErrorForCode_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rpUserErrorForCode:userInfo:");
}

id objc_msgSend_acquireAssertionWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireAssertionWithPid:");
}

id objc_msgSend_acquireAssertionWithPidWaitForCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireAssertionWithPidWaitForCompletion:");
}

id objc_msgSend_acquireWithHandler_invalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireWithHandler:invalidationHandler:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activate");
}

id objc_msgSend_activateMachService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateMachService");
}

id objc_msgSend_activateWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateWithContext:");
}

id objc_msgSend_addConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConnection:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_beginGeneratingDeviceOrientationNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginGeneratingDeviceOrientationNotifications");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_camera(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "camera");
}

id objc_msgSend_cameraWithPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraWithPosition:");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearColor");
}

id objc_msgSend_clearRemoteHandle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRemoteHandle");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_configureConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureConnection:");
}

id objc_msgSend_connectionManagerQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionManagerQueue");
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

id objc_msgSend_countdownInterruptWithStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countdownInterruptWithStatus:");
}

id objc_msgSend_createRemoteHandleForApplication_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createRemoteHandleForApplication:bundleID:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentSessionID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentSessionID");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_devicesWithMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devicesWithMediaType:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didTapStopButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didTapStopButton");
}

id objc_msgSend_endGeneratingDeviceOrientationNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endGeneratingDeviceOrientationNotifications");
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finish");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frame");
}

id objc_msgSend_hasEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasEntitlement:");
}

id objc_msgSend_identityForAngelJobLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityForAngelJobLabel:");
}

id objc_msgSend_initWithControlsStyle_viewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithControlsStyle:viewController:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithSceneProvidingProcess_configurationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSceneProvidingProcess:configurationIdentifier:");
}

id objc_msgSend_initWithStatusBarStyleOverrides_forPID_exclusive_showsWhenForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:");
}

id objc_msgSend_interfaceWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithIdentifier:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateStatusBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateStatusBar");
}

id objc_msgSend_isConnectingProcessAuthorized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isConnectingProcessAuthorized:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isPictureInPicturePossible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPictureInPicturePossible");
}

id objc_msgSend_isPictureInPictureSupported(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPictureInPictureSupported");
}

id objc_msgSend_isPreviewRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPreviewRunning");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutPreviewLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutPreviewLayer");
}

id objc_msgSend_listenerWithConfigurator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listenerWithConfigurator:");
}

id objc_msgSend_localScreenAttributesForVideoAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localScreenAttributesForVideoAttributes:");
}

id objc_msgSend_localVideoAttributes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localVideoAttributes");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_newHandleWithDefinition_configurationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newHandleWithDefinition:configurationContext:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pauseCurrentSystemSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseCurrentSystemSession");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pid");
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "position");
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredContentSize");
}

id objc_msgSend_protocolForProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protocolForProtocol:");
}

id objc_msgSend_ratio(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ratio");
}

id objc_msgSend_registerObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerObserver:");
}

id objc_msgSend_remoteProcess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteProcess");
}

id objc_msgSend_remoteTarget(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteTarget");
}

id objc_msgSend_remoteToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteToken");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_resumeCurrentSystemSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resumeCurrentSystemSession");
}

id objc_msgSend_rpLocalizedStatusStringForPaused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpLocalizedStatusStringForPaused:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_setActivationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivationHandler:");
}

id objc_msgSend_setAllowedUnits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedUnits:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClient:");
}

id objc_msgSend_setClientMessagingExpectation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientMessagingExpectation:");
}

id objc_msgSend_setCountdownState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountdownState:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDomain:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setIncludesApproximationPhrase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludesApproximationPhrase:");
}

id objc_msgSend_setIncludesTimeRemainingPhrase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludesTimeRemainingPhrase:");
}

id objc_msgSend_setInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterface:");
}

id objc_msgSend_setInterfaceTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceTarget:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLocalCameraWithUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalCameraWithUID:");
}

id objc_msgSend_setLocalVideoLayer_front_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalVideoLayer:front:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setMaximumUnitCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumUnitCount:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setRatio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRatio:");
}

id objc_msgSend_setRegisteredStyleOverrides_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegisteredStyleOverrides:reply:");
}

id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServer:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setService:");
}

id objc_msgSend_setServiceQuality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceQuality:");
}

id objc_msgSend_setStatusString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusString:");
}

id objc_msgSend_setTargetQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetQueue:");
}

id objc_msgSend_setUnitsStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnitsStyle:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setZeroFormattingBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZeroFormattingBehavior:");
}

id objc_msgSend_setupPreview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPreview");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_showSavedToPhotosBannerWithPhotosURL_identifier_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start");
}

id objc_msgSend_startPictureInPicture(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startPictureInPicture");
}

id objc_msgSend_startPreview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startPreview");
}

id objc_msgSend_startRecording(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRecording");
}

id objc_msgSend_stopCurrentSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopCurrentSession");
}

id objc_msgSend_stopPictureInPictureAndRestoreUserInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopPictureInPictureAndRestoreUserInterface:");
}

id objc_msgSend_stopPipSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopPipSession");
}

id objc_msgSend_stopPreview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopPreview");
}

id objc_msgSend_stringFromTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromTimeInterval:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithTimeInterval:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timerDidUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerDidUpdate:");
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueID");
}

id objc_msgSend_unregisterObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterObserver:");
}

id objc_msgSend_updateTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTimer:");
}

id objc_msgSend_updateViewGeometry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateViewGeometry");
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInitiated");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}
