@implementation AppDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC11Diagnostics11AppDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11Diagnostics11AppDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11Diagnostics11AppDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC11Diagnostics11AppDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100099258((uint64_t)v8, v10);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  DARootViewController *v9;
  id v10;
  _TtC11Diagnostics11AppDelegate *v11;
  SEL v12;
  id v13;
  int v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = sub_100037118(0, &qword_10016CF88, UIOpenURLContext_ptr);
  v8 = sub_10009BB5C(&qword_10016CF90, &qword_10016CF88, UIOpenURLContext_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v9 = (DARootViewController *)static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_10009A440(v9);

  swift_bridgeObjectRelease(v9, v12, v13, v14, v15, v16, v17, v18);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC11Diagnostics11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10009ABEC();

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC11Diagnostics11AppDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10009AE00();

}

- (void)application:(id)a3 didDiscardSceneSessions:(id)a4
{
  uint64_t v5;
  id v6;
  _TtC11Diagnostics11AppDelegate *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  SEL v13;
  id v14;
  int v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = qword_10016A678;
  v6 = a3;
  v7 = self;
  if (v5 != -1)
    swift_once(&qword_10016A678, sub_10008BF34);
  v8 = qword_100172378;
  v9 = sub_100035CA4((uint64_t *)&unk_10016BE40);
  v10 = swift_allocObject(v9, 72, 7);
  *(_OWORD *)(v10 + 16) = xmmword_10010BE30;
  *(_QWORD *)(v10 + 56) = &type metadata for String;
  v11 = sub_100047048();
  *(_QWORD *)(v10 + 64) = v11;
  *(_QWORD *)(v10 + 32) = 0xD000000000000027;
  *(_QWORD *)(v10 + 40) = 0x80000001001179E0;
  v12 = static os_log_type_t.default.getter(v11);
  os_log(_:dso:log:type:_:)("## %@", 5, 2, &_mh_execute_header, v8, v12, v10);

  swift_bridgeObjectRelease((DARootViewController *)v10, v13, v14, v15, v16, v17, v18, v19);
}

- (void)consumeLongPressForButtonKind:(int64_t)a3
{
  sub_10009B674(a3);
}

- (void)handleButtonEventWithEvent:(unint64_t)a3
{
  sub_10009B85C(a3);
}

- (_TtC11Diagnostics11AppDelegate)init
{
  return (_TtC11Diagnostics11AppDelegate *)sub_100098950();
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC11Diagnostics11AppDelegate_enhancedLoggingLaunchActions));

  v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11Diagnostics11AppDelegate_nativeCardFilter);
  swift_bridgeObjectRelease(*(_QWORD *)&self->window[OBJC_IVAR____TtC11Diagnostics11AppDelegate_nativeCardFilter]);
  swift_bridgeObjectRelease(v3);

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC11Diagnostics11AppDelegate_lockButtonConsumer));

}

- (void)sceneDidBecomeActive:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  SEL v5;
  id v6;
  int v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unsigned __int8 *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unsigned __int8 *v22;
  _QWORD v23[5];
  uint64_t v24;

  if (qword_10016A678 != -1)
    swift_once(&qword_10016A678, sub_10008BF34);
  v0 = qword_100172378;
  v1 = sub_100035CA4((uint64_t *)&unk_10016BE40);
  v2 = swift_allocObject(v1, 72, 7);
  *(_OWORD *)(v2 + 16) = xmmword_10010BE30;
  *(_QWORD *)(v2 + 56) = &type metadata for String;
  v3 = sub_100047048();
  *(_QWORD *)(v2 + 64) = v3;
  *(_QWORD *)(v2 + 32) = 0xD000000000000018;
  *(_QWORD *)(v2 + 40) = 0x8000000100117A90;
  v4 = static os_log_type_t.default.getter(v3);
  os_log(_:dso:log:type:_:)("## %@", 5, 2, &_mh_execute_header, v0, v4, v2);
  swift_bridgeObjectRelease((DARootViewController *)v2, v5, v6, v7, v8, v9, v10, v11);
  v12 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  objc_msgSend(v12, "setIdleTimerDisabled:", 1);

  if (qword_10016A5F0 != -1)
    swift_once(&qword_10016A5F0, sub_100044F78);
  v13 = (unsigned __int8 *)qword_1001722E8;
  v14 = OBJC_IVAR____TtC11Diagnostics10Assertions_isVoiceControlEnabled;
  v15 = *(unsigned __int8 *)(qword_1001722E8 + OBJC_IVAR____TtC11Diagnostics10Assertions_isVoiceControlEnabled);
  *(_BYTE *)(qword_1001722E8 + OBJC_IVAR____TtC11Diagnostics10Assertions_isVoiceControlEnabled) = 0;
  if (v15 == 1)
  {
    v16 = SBSSpringBoardServerPort();
    SBSetVoiceControlEnabled(v16, v13[v14]);
  }
  v17 = *(NSObject **)&v13[OBJC_IVAR____TtC11Diagnostics10Assertions_preventProxCardsQueue];
  v18 = swift_allocObject(&unk_100139F08, 24, 7);
  *(_QWORD *)(v18 + 16) = v13;
  v19 = swift_allocObject(&unk_100139F30, 32, 7);
  *(_QWORD *)(v19 + 16) = sub_10009BB44;
  *(_QWORD *)(v19 + 24) = v18;
  v23[4] = sub_100052C38;
  v24 = v19;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 1107296256;
  v23[2] = sub_100048E58;
  v23[3] = &unk_100139F48;
  v20 = _Block_copy(v23);
  v21 = v24;
  v22 = v13;
  swift_retain(v19);
  swift_release(v21);
  dispatch_sync(v17, v20);
  _Block_release(v20);
  LOBYTE(v17) = swift_isEscapingClosureAtFileLocation(v19, "", 88, 112, 41, 1);
  swift_release(v18);
  swift_release(v19);
  if ((v17 & 1) != 0)
    __break(1u);
}

- (void)sceneWillResignActive:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  SEL v5;
  id v6;
  int v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unsigned __int8 *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unsigned __int8 *v22;
  _QWORD v23[5];
  uint64_t v24;

  if (qword_10016A678 != -1)
    swift_once(&qword_10016A678, sub_10008BF34);
  v0 = qword_100172378;
  v1 = sub_100035CA4((uint64_t *)&unk_10016BE40);
  v2 = swift_allocObject(v1, 72, 7);
  *(_OWORD *)(v2 + 16) = xmmword_10010BE30;
  *(_QWORD *)(v2 + 56) = &type metadata for String;
  v3 = sub_100047048();
  *(_QWORD *)(v2 + 64) = v3;
  *(_QWORD *)(v2 + 32) = 0xD000000000000019;
  *(_QWORD *)(v2 + 40) = 0x8000000100117A70;
  v4 = static os_log_type_t.default.getter(v3);
  os_log(_:dso:log:type:_:)("## %@", 5, 2, &_mh_execute_header, v0, v4, v2);
  swift_bridgeObjectRelease((DARootViewController *)v2, v5, v6, v7, v8, v9, v10, v11);
  v12 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  objc_msgSend(v12, "setIdleTimerDisabled:", 0);

  if (qword_10016A5F0 != -1)
    swift_once(&qword_10016A5F0, sub_100044F78);
  v13 = (unsigned __int8 *)qword_1001722E8;
  v14 = OBJC_IVAR____TtC11Diagnostics10Assertions_isVoiceControlEnabled;
  v15 = *(_BYTE *)(qword_1001722E8 + OBJC_IVAR____TtC11Diagnostics10Assertions_isVoiceControlEnabled);
  *(_BYTE *)(qword_1001722E8 + OBJC_IVAR____TtC11Diagnostics10Assertions_isVoiceControlEnabled) = 1;
  if ((v15 & 1) == 0)
  {
    v16 = SBSSpringBoardServerPort();
    SBSetVoiceControlEnabled(v16, v13[v14]);
  }
  v17 = *(NSObject **)&v13[OBJC_IVAR____TtC11Diagnostics10Assertions_preventProxCardsQueue];
  v18 = swift_allocObject(&unk_100139E90, 24, 7);
  *(_QWORD *)(v18 + 16) = v13;
  v19 = swift_allocObject(&unk_100139EB8, 32, 7);
  *(_QWORD *)(v19 + 16) = sub_10009BB2C;
  *(_QWORD *)(v19 + 24) = v18;
  v23[4] = sub_100052C38;
  v24 = v19;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 1107296256;
  v23[2] = sub_100048E58;
  v23[3] = &unk_100139ED0;
  v20 = _Block_copy(v23);
  v21 = v24;
  v22 = v13;
  swift_retain(v19);
  swift_release(v21);
  dispatch_sync(v17, v20);
  _Block_release(v20);
  LOBYTE(v17) = swift_isEscapingClosureAtFileLocation(v19, "", 88, 124, 41, 1);
  swift_release(v18);
  swift_release(v19);
  if ((v17 & 1) != 0)
    __break(1u);
}

- (void)applicationWillTerminate:
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  SEL v5;
  id v6;
  int v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _BYTE *v22;
  id v23;
  _QWORD v24[5];
  uint64_t v25;

  v0 = sub_100035CA4((uint64_t *)&unk_10016BE40);
  v1 = swift_allocObject(v0, 72, 7);
  *(_OWORD *)(v1 + 16) = xmmword_10010BE30;
  if (qword_10016A678 != -1)
    swift_once(&qword_10016A678, sub_10008BF34);
  v2 = (void *)qword_100172378;
  *(_QWORD *)(v1 + 56) = sub_100037118(0, (unint64_t *)&qword_10016B180, OS_os_log_ptr);
  *(_QWORD *)(v1 + 64) = sub_10009BB5C((unint64_t *)&qword_10016B690, (unint64_t *)&qword_10016B180, OS_os_log_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  *(_QWORD *)(v1 + 32) = v2;
  v3 = (void *)static OS_os_log.default.getter(v2);
  v4 = static os_log_type_t.default.getter(v3);
  os_log(_:dso:log:type:_:)("## Application will terminate", 29, 2, &_mh_execute_header, v3, v4, v1);
  swift_bridgeObjectRelease((DARootViewController *)v1, v5, v6, v7, v8, v9, v10, v11);

  if (qword_10016A5F0 != -1)
    swift_once(&qword_10016A5F0, sub_100044F78);
  v12 = (void *)qword_1001722E8;
  v13 = *(NSObject **)(qword_1001722E8 + OBJC_IVAR____TtC11Diagnostics10Assertions_preventTaskSuspendQueue);
  v14 = swift_allocObject(&unk_100139C38, 24, 7);
  *(_QWORD *)(v14 + 16) = v12;
  v15 = swift_allocObject(&unk_100139C60, 32, 7);
  *(_QWORD *)(v15 + 16) = sub_10009BABC;
  *(_QWORD *)(v15 + 24) = v14;
  v24[4] = sub_10003CDD4;
  v25 = v15;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 1107296256;
  v24[2] = sub_100048E58;
  v24[3] = &unk_100139C78;
  v16 = _Block_copy(v24);
  v17 = v25;
  v18 = v12;
  swift_retain(v15);
  swift_release(v17);
  dispatch_sync(v13, v16);
  _Block_release(v16);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation(v15, "", 88, 87, 43, 1);
  swift_release(v14);
  swift_release(v15);
  if ((v13 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v20 = qword_1001722E8;
    sub_100046438(v19);
    v21 = sub_100046588();
    objc_msgSend(v21, "setDiscoverableMode:", *(_QWORD *)(v20 + OBJC_IVAR____TtC11Diagnostics10Assertions_airDropUserSetting));

    sub_10009B048();
    v22 = (_BYTE *)(qword_1001722E8 + OBJC_IVAR____TtC11Diagnostics10Assertions_nearbySharingAssertionEnabled);
    *(_BYTE *)(qword_1001722E8 + OBJC_IVAR____TtC11Diagnostics10Assertions_nearbySharingAssertionEnabled) = (*(_BYTE *)(qword_1001722E8 + OBJC_IVAR____TtC11Diagnostics10Assertions_nearbySharingPreferencesState) & 1) == 0;
    v23 = sub_100046588();
    objc_msgSend(v23, "setNearbySharingEnabled:", (*v22 & 1) == 0);

  }
}

@end
