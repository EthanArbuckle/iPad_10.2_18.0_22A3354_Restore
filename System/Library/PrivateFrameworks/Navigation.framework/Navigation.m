const __CFString *MNLocaleDidChangeNotification()
{
  if (MNLocaleDidChangeNotification_onceToken != -1)
    dispatch_once(&MNLocaleDidChangeNotification_onceToken, &__block_literal_global_24);
  return CFSTR("MNLocaleDidChangeNotification");
}

id MNGetPuckTrackingLog()
{
  if (MNGetPuckTrackingLog_onceToken != -1)
    dispatch_once(&MNGetPuckTrackingLog_onceToken, &__block_literal_global_77);
  return (id)MNGetPuckTrackingLog_log;
}

id MNGetMNLocationProviderLog()
{
  if (MNGetMNLocationProviderLog_onceToken != -1)
    dispatch_once(&MNGetMNLocationProviderLog_onceToken, &__block_literal_global_40);
  return (id)MNGetMNLocationProviderLog_log;
}

uint64_t ___registerStateCaptureCallbacks_block_invoke()
{
  _stateCaptureCallbackRegistration = 1;
  return _GEOConfigRegisterStateCaptureFunctions();
}

void _registerStateCaptureCallbacks()
{
  if (_registerStateCaptureCallbacks_onceToken != -1)
    dispatch_once(&_registerStateCaptureCallbacks_onceToken, &__block_literal_global_16_0);
}

void *MNNavigationServiceCallback_DidUpdateNavTrayGuidance.navTrayGuidanceEvent.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0
                + OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent);
  v2 = v1;
  return v1;
}

id MNNavigationServiceCallback_DidUpdateNavTrayGuidance.__allocating_init(navTrayGuidanceEvent:)(uint64_t a1)
{
  return sub_1B0ADA930(a1, &OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent);
}

id MNNavigationServiceCallback_DidUpdateNavTrayGuidance.init(navTrayGuidanceEvent:)(uint64_t a1)
{
  return sub_1B0ADA998(a1, &OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent, type metadata accessor for MNNavigationServiceCallback_DidUpdateNavTrayGuidance);
}

uint64_t type metadata accessor for MNNavigationServiceCallback_DidUpdateNavTrayGuidance()
{
  return objc_opt_self();
}

id MNNavigationServiceCallback_DidUpdateNavTrayGuidance.init(coder:)(void *a1)
{
  void *v1;
  char *v3;
  id v4;
  objc_super v6;

  type metadata accessor for MNNavTrayGuidanceEvent(0);
  v3 = v1;
  *(_QWORD *)&v3[OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent] = sub_1B0BCAA8C();

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for MNNavigationServiceCallback_DidUpdateNavTrayGuidance();
  v4 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);

  return v4;
}

void MNNavigationServiceCallback_DidUpdateNavTrayGuidance.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MNNavigationServiceCallback_DidUpdateNavTrayGuidance.__deallocating_deinit()
{
  return sub_1B0ADAC94(type metadata accessor for MNNavigationServiceCallback_DidUpdateNavTrayGuidance);
}

uint64_t MNNavigationServiceCallback_DidUpdateTargetLegIndex.targetLegIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0
                   + OBJC_IVAR____TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex_targetLegIndex);
}

id MNNavigationServiceCallback_DidUpdateTargetLegIndex.__allocating_init(targetLegIndex:)(uint64_t a1)
{
  return sub_1B0ADA930(a1, &OBJC_IVAR____TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex_targetLegIndex);
}

id MNNavigationServiceCallback_DidUpdateTargetLegIndex.init(targetLegIndex:)(uint64_t a1)
{
  return sub_1B0ADA998(a1, &OBJC_IVAR____TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex_targetLegIndex, type metadata accessor for MNNavigationServiceCallback_DidUpdateTargetLegIndex);
}

uint64_t type metadata accessor for MNNavigationServiceCallback_DidUpdateTargetLegIndex()
{
  return objc_opt_self();
}

id MNNavigationServiceCallback_DidUpdateTargetLegIndex.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id MNNavigationServiceCallback_DidUpdateTargetLegIndex.init(coder:)(void *a1)
{
  return sub_1B0ADAA84(a1, 0x654C746567726174, 0xEE007865646E4967, &OBJC_IVAR____TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex_targetLegIndex, type metadata accessor for MNNavigationServiceCallback_DidUpdateTargetLegIndex);
}

id MNNavigationServiceCallback_DidUpdateTargetLegIndex.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MNNavigationServiceCallback_DidUpdateTargetLegIndex.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MNNavigationServiceCallback_DidUpdateTargetLegIndex.__deallocating_deinit()
{
  return sub_1B0ADAC94(type metadata accessor for MNNavigationServiceCallback_DidUpdateTargetLegIndex);
}

uint64_t MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex.anchorPointIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0
                   + OBJC_IVAR____TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex_anchorPointIndex);
}

id MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex.__allocating_init(anchorPointIndex:)(uint64_t a1)
{
  return sub_1B0ADA930(a1, &OBJC_IVAR____TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex_anchorPointIndex);
}

id sub_1B0ADA930(uint64_t a1, _QWORD *a2)
{
  objc_class *v2;
  char *v5;
  objc_super v7;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[*a2] = a1;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex.init(anchorPointIndex:)(uint64_t a1)
{
  return sub_1B0ADA998(a1, &OBJC_IVAR____TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex_anchorPointIndex, type metadata accessor for MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex);
}

id sub_1B0ADA998(uint64_t a1, _QWORD *a2, uint64_t (*a3)(void))
{
  char *v3;
  objc_super v5;

  *(_QWORD *)&v3[*a2] = a1;
  v5.receiver = v3;
  v5.super_class = (Class)a3();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex()
{
  return objc_opt_self();
}

id sub_1B0ADAA04(char *a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t (*a5)(void))
{
  objc_super v6;

  *(_QWORD *)&a1[*a4] = a3;
  v6.receiver = a1;
  v6.super_class = (Class)a5();
  return objc_msgSendSuper2(&v6, sel_init);
}

id MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex.init(coder:)(void *a1)
{
  return sub_1B0ADAA84(a1, 0xD000000000000010, 0x80000001B0BDA8F0, &OBJC_IVAR____TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex_anchorPointIndex, type metadata accessor for MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex);
}

id sub_1B0ADAA84(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t (*a5)(void))
{
  void *v5;
  char *v9;
  void *v10;
  id v11;
  id v12;
  objc_super v14;

  v9 = v5;
  v10 = (void *)sub_1B0BCAA14();
  v11 = objc_msgSend(a1, sel_decodeIntegerForKey_, v10);

  *(_QWORD *)&v9[*a4] = v11;
  v14.receiver = v9;
  v14.super_class = (Class)a5();
  v12 = objc_msgSendSuper2(&v14, sel_initWithCoder_, a1);

  return v12;
}

void sub_1B0ADAB80(void *a1, uint64_t a2, void *a3, uint64_t (*a4)(void), _QWORD *a5)
{
  id v7;
  char *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)a4();
  v7 = a3;
  v8 = (char *)v11.receiver;
  objc_msgSendSuper2(&v11, sel_encodeWithCoder_, v7);
  v9 = *(_QWORD *)&v8[*a5];
  v10 = (void *)sub_1B0BCAA14();
  objc_msgSend(v7, sel_encodeInteger_forKey_, v9, v10, v11.receiver, v11.super_class);

}

void MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex.__deallocating_deinit()
{
  return sub_1B0ADAC94(type metadata accessor for MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex);
}

id sub_1B0ADAC94(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t method lookup function for MNNavigationServiceCallback_DidUpdateNavTrayGuidance()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for MNNavigationServiceCallback_DidUpdateTargetLegIndex()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MNNavigationServiceCallback_DidUpdateTargetLegIndex.__allocating_init(targetLegIndex:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t method lookup function for MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex()
{
  return swift_lookUpClassMethod();
}

void type metadata accessor for GEOOfflineState()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EEEC8A98)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EEEC8A98);
  }
}

uint64_t MNOfflineCoordinator.__allocating_init(navigationSessionState:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return MNOfflineCoordinator.init(navigationSessionState:)(a1);
}

uint64_t MNOfflineCoordinator.init(navigationSessionState:)(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  objc_super v8;

  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState] = 0;
  v3 = &v1[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__pendingRerouteFinishedState];
  *(_DWORD *)v3 = 0;
  v3[4] = 1;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for MNOfflineCoordinator();
  v4 = (char *)objc_msgSendSuper2(&v8, sel_init);
  objc_msgSend(v4, sel_setNavigationSessionState_, a1);
  type metadata accessor for MNOfflineCoordinatorState.Online();
  v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v6 = OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState;
  *(_QWORD *)&v4[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState] = v5;
  result = swift_release();
  if (*(_QWORD *)&v4[v6])
  {
    swift_retain();

    swift_unknownObjectWeakAssign();
    swift_release();

    return (uint64_t)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for MNOfflineCoordinator()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for MNOfflineCoordinatorState.Online()
{
  return objc_opt_self();
}

uint64_t sub_1B0ADAF40()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator_delegate;
  swift_beginAccess();
  return MEMORY[0x1B5E0E820](v1);
}

uint64_t sub_1B0ADAFD8()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1B0ADB030(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1B5E0E820](v5);
  return sub_1B0ADB0A0;
}

void sub_1B0ADB0A0(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

void sub_1B0ADB10C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  id v6;

  v1 = v0;
  if (qword_1EEEC8910 != -1)
    swift_once();
  v2 = sub_1B0BCAA08();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEECB338);
  v3 = sub_1B0BCA9F0();
  v4 = sub_1B0BCAA80();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B0AD7000, v3, v4, "Taking control over offline service state.", v5, 2u);
    MEMORY[0x1B5E0E7D8](v5, -1, -1);
  }

  v6 = objc_msgSend((id)objc_opt_self(), sel_shared);
  objc_msgSend(v6, sel_setDelegate_, v1);
  objc_msgSend(v6, sel_startServiceIfEnabled);

}

uint64_t sub_1B0ADB268()
{
  return sub_1B0ADB280((void (*)(_QWORD))type metadata accessor for MNOfflineCoordinatorState.Offline);
}

uint64_t sub_1B0ADB274()
{
  return sub_1B0ADB280((void (*)(_QWORD))type metadata accessor for MNOfflineCoordinatorState.Online);
}

uint64_t sub_1B0ADB280(void (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;

  a1(0);
  v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v3 = OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState) = v2;
  swift_retain();
  result = swift_release();
  if (*(_QWORD *)(v1 + v3))
  {
    result = swift_unknownObjectWeakAssign();
    v5 = *(_QWORD *)(v1 + v3);
    if (v5)
    {
      v6 = *(void (**)(uint64_t))(*(_QWORD *)v5 + 96);
      v7 = swift_retain();
      v6(v7);
      swift_release();
      return swift_release();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id MNOfflineCoordinator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MNOfflineCoordinator.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MNOfflineCoordinator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MNOfflineCoordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id MNOfflineCoordinator.navigationSessionState.getter()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState);
  if (result)
    return result;
  __break(1u);
  return result;
}

void MNOfflineCoordinator.navigationSessionState.setter(NSObject *a1)
{
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  unsigned __int8 v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  os_log_type_t v30;
  uint8_t *v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  NSObject *v36;
  NSObject *v37;
  char v38;
  unsigned int *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  NSObject *v43;
  os_log_type_t v44;
  int *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t);
  uint64_t v63;
  uint8_t *buf;
  os_log_type_t bufa;
  os_log_t log;
  NSObject *loga;
  os_log_type_t type;
  os_log_type_t typea[8];
  uint64_t v70;
  uint64_t v71[4];

  v2 = v1;
  v4 = OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState;
  v5 = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState], sel_currentRouteInfo);
  v6 = objc_msgSend(v5, sel_route);

  v7 = -[NSObject currentRouteInfo](a1, sel_currentRouteInfo);
  v8 = objc_msgSend(v7, sel_route);

  -[NSObject copy](a1, sel_copy);
  sub_1B0BCAABC();
  swift_unknownObjectRelease();
  sub_1B0ADE380(0, qword_1EEEC8920);
  v9 = swift_dynamicCast();
  v10 = v70;
  if (!v9)
    v10 = 0;
  v11 = *(void **)&v2[v4];
  *(_QWORD *)&v2[v4] = v10;

  if (!v8)
  {
    if (qword_1EEEC8910 != -1)
      swift_once();
    v25 = sub_1B0BCAA08();
    __swift_project_value_buffer(v25, (uint64_t)qword_1EEECB338);
    v26 = sub_1B0BCA9F0();
    v27 = sub_1B0BCAA68();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_1B0AD7000, v26, v27, "Got a nil route, which should not happen.", v28, 2u);
      MEMORY[0x1B5E0E7D8](v28, -1, -1);
      v12 = v6;
    }
    else
    {
      v12 = v26;
      v26 = a1;
      a1 = v6;
    }
    goto LABEL_38;
  }
  v12 = v8;
  if (!v6)
    goto LABEL_24;
  v13 = v6;
  if ((-[NSObject isOfflineRoute](v13, sel_isOfflineRoute) & 1) != 0
    || (-[NSObject isOfflineRoute](v12, sel_isOfflineRoute) & 1) == 0)
  {
    goto LABEL_23;
  }
  v14 = objc_msgSend((id)objc_opt_self(), sel_shared);
  v15 = objc_msgSend(v14, sel_state);

  if (v15 == 2)
  {
    if (qword_1EEEC8910 != -1)
      swift_once();
    v16 = sub_1B0BCAA08();
    __swift_project_value_buffer(v16, (uint64_t)qword_1EEECB338);
    v17 = sub_1B0BCA9F0();
    v18 = sub_1B0BCAA80();
    if (!os_log_type_enabled(v17, v18))
      goto LABEL_22;
    type = v18;
    v19 = (uint8_t *)swift_slowAlloc();
    log = (os_log_t)swift_slowAlloc();
    v71[0] = (uint64_t)log;
    *(_DWORD *)v19 = 136315138;
    buf = v19;
    v20 = (id)GEOOfflineModeAsString();
    v21 = sub_1B0BCAA20();
    v23 = v22;

    sub_1B0ADD7EC(v21, v23, v71);
    sub_1B0BCAAA4();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_1EEEC8910 != -1)
      swift_once();
    v29 = sub_1B0BCAA08();
    __swift_project_value_buffer(v29, (uint64_t)qword_1EEECB338);
    v17 = sub_1B0BCA9F0();
    v30 = sub_1B0BCAA80();
    if (!os_log_type_enabled(v17, v30))
      goto LABEL_22;
    type = v30;
    v31 = (uint8_t *)swift_slowAlloc();
    log = (os_log_t)swift_slowAlloc();
    v71[0] = (uint64_t)log;
    *(_DWORD *)v31 = 136315138;
    buf = v31;
    v32 = (id)GEOOfflineModeAsString();
    v33 = sub_1B0BCAA20();
    v35 = v34;

    sub_1B0ADD7EC(v33, v35, v71);
    sub_1B0BCAAA4();
    swift_bridgeObjectRelease();
          "il the OfflineService tells us to.";
  }
  _os_log_impl(&dword_1B0AD7000, v17, type, v24, buf, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1B5E0E7D8](log, -1, -1);
  MEMORY[0x1B5E0E7D8](buf, -1, -1);
LABEL_22:

LABEL_23:
  sub_1B0ADE380(0, &qword_1EEEC8A78);
  v36 = v12;
  v37 = v13;
  v38 = sub_1B0BCAA98();

  if ((v38 & 1) == 0)
LABEL_24:
    sub_1B0ADDF48((uint64_t)-[NSObject lastRerouteReason](a1, sel_lastRerouteReason));
  if (-[NSObject navigationState](a1, sel_navigationState) == 5)
    goto LABEL_37;
  v39 = (unsigned int *)&v2[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__pendingRerouteFinishedState];
  if (v2[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__pendingRerouteFinishedState + 4] == 1)
    goto LABEL_37;
  v40 = *v39;
  if (qword_1EEEC8910 != -1)
    swift_once();
  v41 = sub_1B0BCAA08();
  __swift_project_value_buffer(v41, (uint64_t)qword_1EEECB338);
  v42 = v2;
  v43 = sub_1B0BCA9F0();
  v44 = sub_1B0BCAA80();
  v45 = &OBJC_IVAR___MNRouteManager__tileLoaderClientIdentifier;
  if (os_log_type_enabled(v43, v44))
  {
    bufa = v44;
    loga = v43;
    v46 = swift_slowAlloc();
    v63 = swift_slowAlloc();
    v71[0] = v63;
    *(_DWORD *)v46 = 136315650;
    *(_QWORD *)typea = v40;
    v47 = (id)GEOOfflineStateAsString();
    v48 = sub_1B0BCAA20();
    v50 = v49;

    sub_1B0ADD7EC(v48, v50, v71);
    sub_1B0BCAAA4();
    v51 = swift_bridgeObjectRelease();
    *(_WORD *)(v46 + 12) = 2080;
    v52 = *(_QWORD *)&v42[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState];
    if (v52)
    {
      v53 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v52 + 104))(v51);
      v55 = v54;
    }
    else
    {
      v55 = 0xE700000000000000;
      v53 = 0x6E776F6E6B6E55;
    }
    sub_1B0ADD7EC(v53, v55, v71);
    sub_1B0BCAAA4();

    swift_bridgeObjectRelease();
    *(_WORD *)(v46 + 22) = 2080;
    v56 = objc_msgSend((id)objc_opt_self(), sel_shared);
    objc_msgSend(v56, sel_state);

    v57 = (id)GEOOfflineStateAsString();
    v58 = sub_1B0BCAA20();
    v60 = v59;

    sub_1B0ADD7EC(v58, v60, v71);
    sub_1B0BCAAA4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B0AD7000, loga, bufa, "We have a pending state and are no longer in the rerouting state. Attempting to apply: %s, current state: %s, offline state: %s", (uint8_t *)v46, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1B5E0E7D8](v63, -1, -1);
    MEMORY[0x1B5E0E7D8](v46, -1, -1);

    v40 = *(_QWORD *)typea;
    v45 = &OBJC_IVAR___MNRouteManager__tileLoaderClientIdentifier;
  }
  else
  {

  }
  *v39 = 0;
  *((_BYTE *)v39 + 4) = 1;
  v61 = *(_QWORD *)&v42[*((_QWORD *)v45 + 341)];
  if (v61)
  {
    v62 = *(void (**)(uint64_t))(*(_QWORD *)v61 + 88);
    swift_retain();
    v62(v40);
    swift_release();
LABEL_37:

    v26 = v12;
LABEL_38:

    return;
  }

  __break(1u);
}

void MNOfflineCoordinator.offlineService(_:wouldLikeToSwitchTo:)(uint64_t a1, __CFString *a2)
{
  sub_1B0ADE3B8(a2);
}

void sub_1B0ADBCF8(__CFString *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  unsigned int v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  char *v13;
  void *v14;
  id v15;
  id v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  __CFString *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void (*v28)(__CFString *);
  uint64_t v29;
  NSObject *v30;
  int v31;
  uint8_t *v32;
  id v33;
  id v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;

  v2 = v1;
  v4 = sub_1B0BCAA08();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(v2, sel_navigationSessionState);
  v9 = objc_msgSend(v8, sel_navigationState);

  if (v9 == 5)
  {
    if (qword_1EEEC8910 != -1)
      swift_once();
    __swift_project_value_buffer(v4, (uint64_t)qword_1EEECB338);
    v10 = sub_1B0BCA9F0();
    v11 = sub_1B0BCAA80();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1B0AD7000, v10, v11, "NavigationSession is currently rerouting. Saving state as pending and will attempt later.", v12, 2u);
      MEMORY[0x1B5E0E7D8](v12, -1, -1);
    }

    goto LABEL_7;
  }
  v14 = *(void **)&v2[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState];
  if (!v14)
  {
    __break(1u);
    goto LABEL_37;
  }
  v15 = objc_msgSend(v14, sel_currentRouteInfo);
  v16 = objc_msgSend(v15, sel_route);

  if (!v16)
  {
    if (qword_1EEEC8910 != -1)
      swift_once();
    v29 = __swift_project_value_buffer(v4, (uint64_t)qword_1EEECB338);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v29, v4);
    v2 = v2;
    v30 = sub_1B0BCA9F0();
    v31 = sub_1B0BCAA68();
    if (os_log_type_enabled(v30, (os_log_type_t)v31))
    {
      v44 = v31;
      LODWORD(v45) = (_DWORD)a1;
      v32 = (uint8_t *)swift_slowAlloc();
      v43 = swift_slowAlloc();
      v47 = v43;
      *(_DWORD *)v32 = 136315138;
      v33 = objc_msgSend(v2, sel_navigationSessionState);
      v34 = objc_msgSend(v33, sel_navigationState);

      switch((int)v34)
      {
        case 0:
          v35 = CFSTR("NOT_NAVIGATING");
          goto LABEL_33;
        case 1:
          v35 = CFSTR("PROCEEDING_TO_ROUTE");
          goto LABEL_33;
        case 2:
          v35 = CFSTR("ON_ROUTE");
          goto LABEL_33;
        case 3:
          v35 = CFSTR("OFF_ROUTE_OFF_ROAD");
          goto LABEL_33;
        case 4:
          v35 = CFSTR("OFF_ROUTE_ON_ROAD");
          goto LABEL_33;
        case 5:
          v35 = CFSTR("RECALCULATING");
          goto LABEL_33;
        case 6:
          v35 = CFSTR("END_OF_ROUTE");
          goto LABEL_33;
        case 7:
          v35 = CFSTR("END_OF_SEGMENT");
          goto LABEL_33;
        case 8:
          v35 = CFSTR("OUTSIDE_NAVIGABLE_AREA");
LABEL_33:
          v36 = v35;
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v34);
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      v37 = v35;
      if (!v37)
      {
LABEL_38:

        __break(1u);
        JUMPOUT(0x1B0ADC310);
      }
      a1 = v37;
      v38 = sub_1B0BCAA20();
      v40 = v39;

      v46 = sub_1B0ADD7EC(v38, v40, &v47);
      sub_1B0BCAAA4();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B0AD7000, v30, (os_log_type_t)v44, "We don't currently have a route for some reason. Navigation state: %s. Saving state as pending and will attempt later.", v32, 0xCu);
      v41 = v43;
      swift_arrayDestroy();
      MEMORY[0x1B5E0E7D8](v41, -1, -1);
      MEMORY[0x1B5E0E7D8](v32, -1, -1);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      LODWORD(a1) = (_DWORD)v45;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
LABEL_7:
    v13 = &v2[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__pendingRerouteFinishedState];
    *(_DWORD *)v13 = (_DWORD)a1;
    v13[4] = 0;
    return;
  }
  v17 = &v2[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__pendingRerouteFinishedState];
  if ((v2[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__pendingRerouteFinishedState + 4] & 1) == 0)
  {
    *(_DWORD *)v17 = 0;
    v17[4] = 1;
    if (qword_1EEEC8910 != -1)
      swift_once();
    __swift_project_value_buffer(v4, (uint64_t)qword_1EEECB338);
    v18 = sub_1B0BCA9F0();
    v19 = sub_1B0BCAA80();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v47 = v21;
      *(_DWORD *)v20 = 136315138;
      v45 = v20 + 4;
      v22 = (id)GEOOfflineStateAsString();
      v23 = sub_1B0BCAA20();
      v24 = a1;
      v26 = v25;

      v46 = sub_1B0ADD7EC(v23, v26, &v47);
      sub_1B0BCAAA4();
      a1 = v24;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B0AD7000, v18, v19, "We got a new state suggestion while we already have a pending state. Dropping pending state: %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E0E7D8](v21, -1, -1);
      MEMORY[0x1B5E0E7D8](v20, -1, -1);
    }

  }
  v27 = *(_QWORD *)&v2[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState];
  if (!v27)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v28 = *(void (**)(__CFString *))(*(_QWORD *)v27 + 88);
  swift_retain();
  v28(a1);
  swift_release();
}

void sub_1B0ADC38C()
{
  sub_1B0BCAB04();
  __break(1u);
}

void sub_1B0ADC3E4()
{
  sub_1B0BCAB04();
  __break(1u);
}

void sub_1B0ADC43C()
{
  sub_1B0BCAB04();
  __break(1u);
}

void sub_1B0ADC494(char a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  os_log_type_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53[3];
  uint64_t v54;

  v3 = v1 + 16;
  v4 = MEMORY[0x1B5E0E820](v1 + 16);
  if (!v4)
  {
    __break(1u);
    goto LABEL_41;
  }
  v5 = (void *)v4;
  v6 = *(void **)(v4 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState);
  if (!v6)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v7 = objc_msgSend(v6, sel_currentRouteInfo);
  v52 = objc_msgSend(v7, sel_route);

  if (!v52)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (!a1)
  {
    if (qword_1EEEC8910 != -1)
      swift_once();
    v18 = sub_1B0BCAA08();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EEECB338);
    v19 = sub_1B0BCA9F0();
    v20 = sub_1B0BCAA68();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v53[0] = v22;
      *(_DWORD *)v21 = 136315138;
      v23 = (id)GEOOfflineModeAsString();
      v24 = sub_1B0BCAA20();
      v26 = v25;

      v54 = sub_1B0ADD7EC(v24, v26, v53);
      sub_1B0BCAAA4();
      swift_bridgeObjectRelease();
      swift_arrayDestroy();
      v27 = v22;
LABEL_30:
      MEMORY[0x1B5E0E7D8](v27, -1, -1);
      MEMORY[0x1B5E0E7D8](v21, -1, -1);

      goto LABEL_39;
    }
    goto LABEL_31;
  }
  if (a1 == 2)
  {
    if (qword_1EEEC8910 != -1)
      swift_once();
    v28 = sub_1B0BCAA08();
    __swift_project_value_buffer(v28, (uint64_t)qword_1EEECB338);
    v29 = sub_1B0BCA9F0();
    v30 = sub_1B0BCAA68();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_1B0AD7000, v29, v30, "Got recommendation to switch to offline, but we're already offline. Switching anyway.", v31, 2u);
      MEMORY[0x1B5E0E7D8](v31, -1, -1);
    }

    v32 = MEMORY[0x1B5E0E820](v3);
    if (v32)
    {
      v33 = (void *)v32;
      sub_1B0ADB268();

LABEL_32:
      return;
    }
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (a1 != 1)
  {
    if (qword_1EEEC8910 != -1)
      swift_once();
    v34 = sub_1B0BCAA08();
    __swift_project_value_buffer(v34, (uint64_t)qword_1EEECB338);
    v19 = sub_1B0BCA9F0();
    v35 = sub_1B0BCAA74();
    if (os_log_type_enabled(v19, v35))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      v53[0] = v36;
      *(_DWORD *)v21 = 136315138;
      v37 = (id)GEOOfflineModeAsString();
      v38 = sub_1B0BCAA20();
      v40 = v39;

      v54 = sub_1B0ADD7EC(v38, v40, v53);
      sub_1B0BCAAA4();
      swift_bridgeObjectRelease();
      swift_arrayDestroy();
      v27 = v36;
      goto LABEL_30;
    }
LABEL_31:

    goto LABEL_32;
  }
  if (objc_msgSend(v52, sel_isOfflineRoute))
  {
    if (qword_1EEEC8910 != -1)
      swift_once();
    v8 = sub_1B0BCAA08();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EEECB338);
    v9 = sub_1B0BCA9F0();
    v10 = sub_1B0BCAA80();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B0AD7000, v9, v10, "Attempting to upgrade route to online.", v11, 2u);
      MEMORY[0x1B5E0E7D8](v11, -1, -1);
    }

    v12 = MEMORY[0x1B5E0E820](v3);
    if (v12)
    {
      v13 = (void *)v12;
      v14 = v12 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator_delegate;
      swift_beginAccess();
      v15 = (void *)MEMORY[0x1B5E0E820](v14);

      if (v15)
      {
        v16 = MEMORY[0x1B5E0E820](v3);
        if (v16)
        {
          v17 = (void *)v16;
          objc_msgSend(v15, sel_offlineCoordinatorDidDetectOnline_, v16);

          swift_unknownObjectRelease();
          return;
        }
        goto LABEL_46;
      }
LABEL_39:

      return;
    }
    goto LABEL_44;
  }
  if (qword_1EEEC8910 != -1)
    swift_once();
  v41 = sub_1B0BCAA08();
  __swift_project_value_buffer(v41, (uint64_t)qword_1EEECB338);
  v42 = sub_1B0BCA9F0();
  v43 = sub_1B0BCAA80();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc();
    v45 = swift_slowAlloc();
    v53[0] = v45;
    *(_DWORD *)v44 = 136315138;
    v46 = (id)GEOOfflineModeAsString();
    v47 = sub_1B0BCAA20();
    v49 = v48;

    v54 = sub_1B0ADD7EC(v47, v49, v53);
    sub_1B0BCAAA4();
    swift_bridgeObjectRelease();
    swift_arrayDestroy();
    MEMORY[0x1B5E0E7D8](v45, -1, -1);
    MEMORY[0x1B5E0E7D8](v44, -1, -1);
  }

  v50 = MEMORY[0x1B5E0E820](v3);
  if (v50)
  {
    v51 = (void *)v50;
    sub_1B0ADB274();

    goto LABEL_39;
  }
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
}

void sub_1B0ADCB98()
{
  sub_1B0ADD138(2u);
}

uint64_t sub_1B0ADCBA0()
{
  return 0x656E696C66664FLL;
}

void sub_1B0ADCBBC(char a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  os_log_type_t v36;
  uint8_t *v37;
  id v38;
  uint64_t v39[3];
  uint64_t v40;

  v3 = v1 + 16;
  v4 = MEMORY[0x1B5E0E820](v1 + 16);
  if (!v4)
  {
    __break(1u);
    goto LABEL_34;
  }
  v5 = (void *)v4;
  v6 = *(void **)(v4 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState);
  if (!v6)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v7 = objc_msgSend(v6, sel_currentRouteInfo);
  v38 = objc_msgSend(v7, sel_route);

  if (!v38)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (!a1)
  {
    if (qword_1EEEC8910 != -1)
      swift_once();
    v18 = sub_1B0BCAA08();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EEECB338);
    v19 = sub_1B0BCA9F0();
    v20 = sub_1B0BCAA68();
    if (!os_log_type_enabled(v19, v20))
      goto LABEL_31;
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v39[0] = v22;
    *(_DWORD *)v21 = 136315138;
    v23 = (id)GEOOfflineModeAsString();
    v24 = sub_1B0BCAA20();
    v26 = v25;

    v40 = sub_1B0ADD7EC(v24, v26, v39);
    sub_1B0BCAAA4();
    swift_bridgeObjectRelease();
    swift_arrayDestroy();
    v27 = v22;
    goto LABEL_25;
  }
  if (a1 == 2)
  {
    sub_1B0ADD37C();
LABEL_32:

    return;
  }
  if (a1 != 1)
  {
    if (qword_1EEEC8910 != -1)
      swift_once();
    v28 = sub_1B0BCAA08();
    __swift_project_value_buffer(v28, (uint64_t)qword_1EEECB338);
    v19 = sub_1B0BCA9F0();
    v29 = sub_1B0BCAA74();
    if (!os_log_type_enabled(v19, v29))
      goto LABEL_31;
    v21 = (uint8_t *)swift_slowAlloc();
    v30 = swift_slowAlloc();
    v39[0] = v30;
    *(_DWORD *)v21 = 136315138;
    v31 = (id)GEOOfflineModeAsString();
    v32 = sub_1B0BCAA20();
    v34 = v33;

    v40 = sub_1B0ADD7EC(v32, v34, v39);
    sub_1B0BCAAA4();
    swift_bridgeObjectRelease();
    swift_arrayDestroy();
    v27 = v30;
LABEL_25:
    MEMORY[0x1B5E0E7D8](v27, -1, -1);
    MEMORY[0x1B5E0E7D8](v21, -1, -1);

    goto LABEL_26;
  }
  if (!objc_msgSend(v38, sel_isOfflineRoute))
  {
    if (qword_1EEEC8910 != -1)
      swift_once();
    v35 = sub_1B0BCAA08();
    __swift_project_value_buffer(v35, (uint64_t)qword_1EEECB338);
    v19 = sub_1B0BCA9F0();
    v36 = sub_1B0BCAA80();
    if (os_log_type_enabled(v19, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_1B0AD7000, v19, v36, "We are already online and have an online route. Ignoring update.", v37, 2u);
      MEMORY[0x1B5E0E7D8](v37, -1, -1);
    }
LABEL_31:

    goto LABEL_32;
  }
  if (qword_1EEEC8910 != -1)
    swift_once();
  v8 = sub_1B0BCAA08();
  __swift_project_value_buffer(v8, (uint64_t)qword_1EEECB338);
  v9 = sub_1B0BCA9F0();
  v10 = sub_1B0BCAA68();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1B0AD7000, v9, v10, "We are already online but somehow have an offline route. Attempting to upgrade route.", v11, 2u);
    MEMORY[0x1B5E0E7D8](v11, -1, -1);
  }

  v12 = MEMORY[0x1B5E0E820](v3);
  if (v12)
  {
    v13 = (void *)v12;
    v14 = v12 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator_delegate;
    swift_beginAccess();
    v15 = (void *)MEMORY[0x1B5E0E820](v14);

    if (v15)
    {
      v16 = MEMORY[0x1B5E0E820](v3);
      if (v16)
      {
        v17 = (void *)v16;
        objc_msgSend(v15, sel_offlineCoordinatorDidDetectOnline_, v16);

        swift_unknownObjectRelease();
        return;
      }
      goto LABEL_37;
    }
LABEL_26:

    return;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
}

void sub_1B0ADD130()
{
  sub_1B0ADD138(1u);
}

void sub_1B0ADD138(unsigned __int8 a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;

  if (qword_1EEEC8910 != -1)
    swift_once();
  v2 = sub_1B0BCAA08();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEECB338);
  v3 = sub_1B0BCA9F0();
  v4 = sub_1B0BCAA80();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    v6 = swift_slowAlloc();
    v16 = v6;
    *(_DWORD *)v5 = 136315394;
    v7 = (id)GEOOfflineModeAsString();
    v8 = sub_1B0BCAA20();
    v10 = v9;

    sub_1B0ADD7EC(v8, v10, &v16);
    sub_1B0BCAAA4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2080;
    v11 = (id)GEOOfflineDeviceAsString();
    v12 = sub_1B0BCAA20();
    v14 = v13;

    sub_1B0ADD7EC(v12, v14, &v16);
    sub_1B0BCAAA4();
    swift_bridgeObjectRelease();
    swift_arrayDestroy();
    MEMORY[0x1B5E0E7D8](v6, -1, -1);
    MEMORY[0x1B5E0E7D8](v5, -1, -1);
  }

  v15 = objc_msgSend((id)objc_opt_self(), sel_shared);
  objc_msgSend(v15, sel_delegatePrefersMode_device_, a1, 1);

}

uint64_t sub_1B0ADD368()
{
  return 0x656E696C6E4FLL;
}

void sub_1B0ADD37C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  unsigned __int8 v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  __int128 v45;

  v1 = sub_1B0BCAA08();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78]();
  v4 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v0 + 16;
  v6 = MEMORY[0x1B5E0E820](v0 + 16);
  if (!v6)
  {
    __break(1u);
    goto LABEL_19;
  }
  v7 = (void *)v6;
  v8 = *(void **)(v6 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState);
  if (!v8)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = objc_msgSend(v8, sel_currentRouteInfo);
  v43 = objc_msgSend(v9, sel_route);

  if (!v43)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  GEOConfigGetDouble();
  v11 = v10;
  v12 = MEMORY[0x1B5E0E820](v5);
  if (!v12)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v13 = (void *)v12;
  v14 = *(void **)(v12 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState);
  if (!v14)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v15 = objc_msgSend(v14, sel_location);
  v16 = objc_msgSend(v15, sel_routeMatch);

  if (v16)
  {
    v17 = objc_msgSend(v16, sel_routeCoordinate);

    v13 = v16;
  }
  else
  {
    v17 = 0;
  }

  v18 = objc_msgSend(v43, sel_routeCoordinateForDistance_afterRouteCoordinate_, v17, v11);
  objc_msgSend(v43, sel_coarseBoundsForRange_, v17, v18);
  GEOMapRectMakeWithMapBox((uint64_t)&v45);
  GEOCoordinateRegionForMapRect();
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = objc_msgSend((id)objc_opt_self(), sel_shared);
  v28 = objc_msgSend(v27, sel_canUseOfflineForCoordinateRegion_, v20, v22, v24, v26);

  if (v28 == 2)
  {
    v29 = MEMORY[0x1B5E0E820](v5);
    if (v29)
    {
      v30 = (void *)v29;
      sub_1B0ADB268();

      return;
    }
    goto LABEL_23;
  }
  if (qword_1EEEC8910 != -1)
    swift_once();
  v31 = __swift_project_value_buffer(v1, (uint64_t)qword_1EEECB338);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v31, v1);
  v32 = sub_1B0BCA9F0();
  v33 = sub_1B0BCAA80();
  if (!os_log_type_enabled(v32, v33))
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return;
  }
  v42 = v2;
  v34 = (uint8_t *)swift_slowAlloc();
  v35 = swift_slowAlloc();
  *(_QWORD *)&v45 = v35;
  *(_DWORD *)v34 = 136315138;
  v36 = (id)GEOStringFromCoordinateRegionBounds();
  if (v36)
  {
    v37 = v36;
    v38 = sub_1B0BCAA20();
    v40 = v39;

    v44 = sub_1B0ADD7EC(v38, v40, (uint64_t *)&v45);
    sub_1B0BCAAA4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B0AD7000, v32, v33, "Not switching to offline state because the route's bounds is outside of the downloaded region. Bounds: %s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5E0E7D8](v35, -1, -1);
    MEMORY[0x1B5E0E7D8](v34, -1, -1);

    (*(void (**)(char *, uint64_t))(v42 + 8))(v4, v1);
    return;
  }
LABEL_24:
  __break(1u);
}

uint64_t sub_1B0ADD7B0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocClassInstance();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1B0ADD7EC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1B0ADD8BC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1B0ADE798((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1B0ADE798((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1B0ADD8BC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1B0BCAAB0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1B0ADDA74(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_1B0BCAAEC();
  if (!v8)
  {
    sub_1B0BCAAF8();
    __break(1u);
LABEL_17:
    result = sub_1B0BCAB1C();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_1B0ADDA74(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1B0ADDB08(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1B0ADDCE0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1B0ADDCE0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1B0ADDB08(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_1B0ADDC7C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1B0BCAAD4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1B0BCAAF8();
      __break(1u);
LABEL_10:
      v2 = sub_1B0BCAA44();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1B0BCAB1C();
    __break(1u);
LABEL_14:
    result = sub_1B0BCAAF8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1B0ADDC7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEEC8B90);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1B0ADDCE0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEEC8B90);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1B0BCAB1C();
  __break(1u);
  return result;
}

void sub_1B0ADDF48(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  char *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;

  if (a1 != 15)
    return;
  if (qword_1EEEC8910 != -1)
    swift_once();
  v2 = sub_1B0BCAA08();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEECB338);
  v3 = v1;
  v4 = sub_1B0BCA9F0();
  v5 = sub_1B0BCAA80();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = swift_slowAlloc();
    v7 = swift_slowAlloc();
    v31 = v7;
    *(_DWORD *)v6 = 136315394;
    v8 = *(_QWORD *)&v3[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState];
    if (v8)
    {
      v9 = (*(uint64_t (**)(void))(*(_QWORD *)v8 + 104))();
      v11 = v10;
    }
    else
    {
      v11 = 0xE700000000000000;
      v9 = 0x6E776F6E6B6E55;
    }
    sub_1B0ADD7EC(v9, v11, &v31);
    sub_1B0BCAAA4();

    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    v12 = objc_msgSend((id)objc_opt_self(), sel_shared);
    objc_msgSend(v12, sel_state);

    v13 = (id)GEOOfflineStateAsString();
    v14 = sub_1B0BCAA20();
    v16 = v15;

    sub_1B0ADD7EC(v14, v16, &v31);
    sub_1B0BCAAA4();
    swift_bridgeObjectRelease();
    swift_arrayDestroy();
    MEMORY[0x1B5E0E7D8](v7, -1, -1);
    MEMORY[0x1B5E0E7D8](v6, -1, -1);

  }
  else
  {

  }
  type metadata accessor for MNOfflineCoordinatorState.Online();
  v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v18 = OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState;
  *(_QWORD *)&v3[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState] = v17;
  swift_retain();
  swift_release();
  if (!*(_QWORD *)&v3[v18])
  {
    __break(1u);
    goto LABEL_18;
  }
  swift_unknownObjectWeakAssign();
  v19 = *(_QWORD *)&v3[v18];
  if (!v19)
  {
LABEL_18:
    __break(1u);
    return;
  }
  v20 = *(void (**)(uint64_t))(*(_QWORD *)v19 + 96);
  v21 = swift_retain();
  v20(v21);
  swift_release();
  swift_release();
  v22 = &v3[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__pendingRerouteFinishedState];
  if ((v3[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__pendingRerouteFinishedState + 4] & 1) == 0)
  {
    v23 = sub_1B0BCA9F0();
    v24 = sub_1B0BCAA80();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v31 = v26;
      *(_DWORD *)v25 = 136315138;
      v27 = (id)GEOOfflineStateAsString();
      v28 = sub_1B0BCAA20();
      v30 = v29;

      sub_1B0ADD7EC(v28, v30, &v31);
      sub_1B0BCAAA4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B0AD7000, v23, v24, "We had a pending state: %s, but we're dropping it because we just got an online route.", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E0E7D8](v26, -1, -1);
      MEMORY[0x1B5E0E7D8](v25, -1, -1);
    }

    *(_DWORD *)v22 = 0;
    v22[4] = 1;
  }
}

uint64_t sub_1B0ADE380(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_1B0ADE3B8(__CFString *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (qword_1EEEC8910 != -1)
    swift_once();
  v2 = sub_1B0BCAA08();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEECB338);
  v3 = sub_1B0BCA9F0();
  v4 = sub_1B0BCAA80();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v11 = v6;
    *(_DWORD *)v5 = 136315138;
    v7 = (id)GEOOfflineStateAsString();
    v8 = sub_1B0BCAA20();
    v10 = v9;

    sub_1B0ADD7EC(v8, v10, &v11);
    sub_1B0BCAAA4();
    swift_bridgeObjectRelease();
    swift_arrayDestroy();
    MEMORY[0x1B5E0E7D8](v6, -1, -1);
    MEMORY[0x1B5E0E7D8](v5, -1, -1);
  }

  sub_1B0ADBCF8(a1);
}

uint64_t sub_1B0ADE568@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator_delegate;
  swift_beginAccess();
  result = MEMORY[0x1B5E0E820](v3);
  *a2 = result;
  return result;
}

uint64_t sub_1B0ADE5BC()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

char *keypath_get_selector_navigationSessionState()
{
  return sel_navigationSessionState;
}

id sub_1B0ADE61C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_navigationSessionState);
  *a2 = result;
  return result;
}

id sub_1B0ADE654(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setNavigationSessionState_, *a1);
}

uint64_t method lookup function for MNOfflineCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MNOfflineCoordinator.__allocating_init(navigationSessionState:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of MNOfflineCoordinator.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of MNOfflineCoordinator.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of MNOfflineCoordinator.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of MNOfflineCoordinator.start()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of MNOfflineCoordinator.stop()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t type metadata accessor for MNOfflineCoordinatorState()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for MNOfflineCoordinatorState.Offline()
{
  return objc_opt_self();
}

double GEOMapRectMakeWithMapBox(uint64_t a1)
{
  return *(double *)a1;
}

uint64_t sub_1B0ADE754(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1B0ADE798(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5E0E778]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1B0ADE818()
{
  uint64_t v0;

  v0 = sub_1B0BCAA08();
  __swift_allocate_value_buffer(v0, qword_1EEECB338);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EEECB338);
  return sub_1B0BCA9FC();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

id MNTrace.initialRoute.getter()
{
  void *v0;
  unint64_t v1;
  id result;
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  result = objc_msgSend(v0, sel_directions);
  if (!result)
    goto LABEL_26;
  v3 = result;
  sub_1B0ADE380(0, &qword_1EEEC8C00);
  v4 = sub_1B0BCAA5C();

  if (!(v4 >> 62))
  {
    v5 = *(void **)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_4;
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  v5 = (void *)sub_1B0BCAB10();
  swift_bridgeObjectRelease();
  if (!v5)
    goto LABEL_17;
LABEL_4:
  if ((v4 & 0xC000000000000001) != 0)
  {
    v6 = (id)MEMORY[0x1B5E0D89C](0, v4);
  }
  else
  {
    if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_20;
    }
    v6 = *(id *)(v4 + 32);
  }
  v5 = v6;
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_routes);
  if (!v7)
  {
LABEL_15:

    return v7;
  }
  sub_1B0ADE380(0, &qword_1EEEC8A78);
  v4 = sub_1B0BCAA5C();

  result = objc_msgSend(v5, sel_selectedRouteIndex);
  v1 = (unint64_t)result;
  if (v4 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    v8 = sub_1B0BCAB10();
    result = (id)swift_bridgeObjectRelease();
    if (v8 <= 0)
      goto LABEL_21;
    goto LABEL_10;
  }
  v8 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v8 <= 0)
  {
LABEL_21:
    swift_bridgeObjectRelease();

    return 0;
  }
LABEL_10:
  if (v1 >= v8)
    goto LABEL_21;
  if ((v4 & 0xC000000000000001) != 0)
  {
    v9 = (id)MEMORY[0x1B5E0D89C](v1, v4);
    goto LABEL_14;
  }
  if ((int64_t)v1 < *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v9 = *(id *)(v4 + 8 * v1 + 32);
LABEL_14:
    v7 = v9;
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

Swift::tuple_routes_OpaquePointer_selectedRouteIndex_Int_optional __swiftcall MNTrace.routeSet(atRowIndex:)(Swift::Int atRowIndex)
{
  unint64_t v1;
  id v3;
  Swift::Int v4;
  Swift::Bool v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  char **v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  Swift::tuple_routes_OpaquePointer_selectedRouteIndex_Int_optional result;

  v3 = objc_msgSend((id)v1, sel_directions);
  if (!v3)
  {
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v6 = v3;
  v7 = sub_1B0ADE380(0, &qword_1EEEC8C00);
  v8 = sub_1B0BCAA5C();

  if (v8 >> 62)
    goto LABEL_16;
  v9 = *(char ***)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    swift_bridgeObjectRelease();
    if ((uint64_t)v9 <= atRowIndex)
      break;
    v3 = objc_msgSend((id)v1, sel_directions);
    if (!v3)
      goto LABEL_26;
    v10 = v3;
    v1 = sub_1B0BCAA5C();

    if ((v1 & 0xC000000000000001) != 0)
    {
      v11 = (id)MEMORY[0x1B5E0D89C](atRowIndex, v1);
    }
    else
    {
      if (atRowIndex < 0)
      {
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10) <= (unint64_t)atRowIndex)
        goto LABEL_19;
      v11 = *(id *)(v1 + 8 * atRowIndex + 32);
    }
    atRowIndex = (Swift::Int)v11;
    swift_bridgeObjectRelease();
    v12 = objc_msgSend((id)atRowIndex, sel_routes);
    if (!v12)
      goto LABEL_22;
    v13 = v12;
    sub_1B0ADE380(0, &qword_1EEEC8A78);
    v1 = sub_1B0BCAA5C();

    v9 = &selRef_processInfo;
    v7 = (unint64_t)objc_msgSend((id)atRowIndex, sel_selectedRouteIndex);
    if (!(v1 >> 62))
    {
      v14 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v14 < 1)
        goto LABEL_21;
      goto LABEL_13;
    }
LABEL_20:
    swift_bridgeObjectRetain();
    v14 = sub_1B0BCAB10();
    swift_bridgeObjectRelease();
    if (v14 < 1)
    {
LABEL_21:
      swift_bridgeObjectRelease();
LABEL_22:

      break;
    }
LABEL_13:
    if (v7 >= v14)
      goto LABEL_21;
    v7 = (unint64_t)objc_msgSend((id)atRowIndex, v9[223]);

    if ((v7 & 0x8000000000000000) == 0)
      goto LABEL_24;
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    v9 = (char **)sub_1B0BCAB10();
    swift_bridgeObjectRelease();
  }
  v1 = 0;
  v7 = 0;
LABEL_24:
  v3 = (id)v1;
  v4 = v7;
LABEL_27:
  result.value.selectedRouteIndex = v4;
  result.value.routes._rawValue = v3;
  result.is_nil = v5;
  return result;
}

void *MNTrace.route(atRowIndex:)(Swift::Int a1)
{
  id v2;
  void *v3;
  Swift::tuple_routes_OpaquePointer_selectedRouteIndex_Int_optional v5;

  v5 = MNTrace.routeSet(atRowIndex:)(a1);
  if (v5.value.routes._rawValue)
  {
    if (((unint64_t)v5.value.routes._rawValue & 0xC000000000000001) != 0)
    {
      v2 = (id)MEMORY[0x1B5E0D89C](v5.value.selectedRouteIndex, v5.value.routes._rawValue, *(_QWORD *)&v5.is_nil);
    }
    else
    {
      if (v5.value.selectedRouteIndex >= *(_QWORD *)(((uint64_t)v5.value.routes._rawValue & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return v5.value.routes._rawValue;
      }
      v2 = *((id *)v5.value.routes._rawValue + v5.value.selectedRouteIndex + 4);
    }
    v3 = v2;
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v5.value.routes._rawValue = v3;
  return v5.value.routes._rawValue;
}

id MNTrace.routeSet(directionsResponseID:)(uint64_t a1, unint64_t a2)
{
  void *v2;
  id result;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  Swift::Int v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  char v18;
  Swift::Int v19;

  result = objc_msgSend(v2, sel_directions);
  if (!result)
    return result;
  v6 = result;
  sub_1B0ADE380(0, &qword_1EEEC8C00);
  v7 = sub_1B0BCAA5C();

  if (!(v7 >> 62))
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    sub_1B0ADF00C(a1, a2);
    if (v8)
      goto LABEL_4;
LABEL_16:
    sub_1B0ADF064(a1, a2);
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_20:
  sub_1B0ADF00C(a1, a2);
  swift_bridgeObjectRetain();
  v8 = sub_1B0BCAB10();
  swift_bridgeObjectRelease();
  if (!v8)
    goto LABEL_16;
LABEL_4:
  v9 = 0;
  while (1)
  {
    v10 = (v7 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1B5E0D89C](v9, v7) : *(id *)(v7 + 8 * v9 + 32);
    v11 = v10;
    result = objc_msgSend(v10, sel_response);
    if (!result)
      break;
    v12 = result;
    v13 = objc_msgSend(result, sel_directionsResponseID);

    if (v13)
    {
      v14 = sub_1B0BCA9E4();
      v16 = v15;

      sub_1B0ADF00C(a1, a2);
      sub_1B0ADF00C(v14, v16);
      sub_1B0AE036C(v14, v16);
      v18 = v17;
      sub_1B0ADF064(a1, a2);
      sub_1B0ADF064(v14, v16);
      sub_1B0ADF064(v14, v16);

      if ((v18 & 1) != 0)
      {
        sub_1B0ADF064(a1, a2);
        swift_bridgeObjectRelease();
        return (id)MNTrace.routeSet(atRowIndex:)(v9);
      }
      v19 = v9 + 1;
      if (__OFADD__(v9, 1))
      {
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
    }
    else
    {
      sub_1B0ADF00C(a1, a2);
      sub_1B0ADF050(0, 0xF000000000000000);
      sub_1B0ADF050(a1, a2);

      v19 = v9 + 1;
      if (__OFADD__(v9, 1))
        goto LABEL_19;
    }
    ++v9;
    if (v19 == v8)
      goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B0ADF00C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_1B0ADF050(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1B0ADF064(a1, a2);
  return a1;
}

uint64_t sub_1B0ADF064(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t MNTrace.route(beforeTimestamp:)(double a1)
{
  void *v1;
  uint64_t result;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  unint64_t v15;
  id v16;

  result = (uint64_t)objc_msgSend(v1, sel_navigationUpdates);
  if (!result)
    goto LABEL_36;
  v4 = (void *)result;
  sub_1B0ADE380(0, &qword_1EEEC8C08);
  v5 = sub_1B0BCAA5C();

  if (v5 >> 62)
    goto LABEL_19;
  v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v6)
  {
    while (__OFSUB__(v6--, 1))
    {
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      swift_bridgeObjectRetain();
      v6 = sub_1B0BCAB10();
      swift_bridgeObjectRelease();
      if (!v6)
        goto LABEL_20;
    }
    if ((v5 & 0xC000000000000001) != 0)
    {
      v8 = (id)MEMORY[0x1B5E0D89C](v6, v5);
      goto LABEL_13;
    }
    if ((v6 & 0x8000000000000000) != 0)
      goto LABEL_17;
    if (v6 >= *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_18;
    v8 = *(id *)(v5 + 32 + 8 * v6);
LABEL_13:
    v9 = v8;
    if (objc_msgSend(v8, sel_navigationUpdateType) == (id)1)
    {
      objc_msgSend(v9, sel_timestamp);
      v11 = v10;

      if (v11 < a1)
      {
        v12 = (void *)sub_1B0AE018C(v6, v5);
        goto LABEL_21;
      }
    }
    else
    {

    }
  }
LABEL_20:
  v12 = 0;
LABEL_21:
  swift_bridgeObjectRelease();
  if (!v12)
    return 0;
  objc_opt_self();
  v13 = (void *)swift_dynamicCastObjCClass();
  if (!v13)
  {

    return (uint64_t)v13;
  }
  v14 = v12;
  result = sub_1B0ADF300(v13, v1);
  if (!result)
  {

    return 0;
  }
  if ((result & 0xC000000000000001) != 0)
  {
    v16 = (id)MEMORY[0x1B5E0D89C](v15, result);
    goto LABEL_28;
  }
  if ((v15 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v15 < *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v16 = *(id *)(result + 8 * v15 + 32);
LABEL_28:
    v13 = v16;
    swift_bridgeObjectRelease();

    return (uint64_t)v13;
  }
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1B0ADF300(void *a1, void *a2)
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  Swift::Int v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  Swift::Int v25;
  id v26;
  void *v27;
  unint64_t v28;
  id v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t result;
  uint64_t v35;
  unint64_t v36;

  v4 = objc_msgSend(a1, sel_directionsResponseID);
  if (!v4)
  {
    v26 = objc_msgSend(a1, sel_etauResponseID);
    if (v26)
    {
      v27 = v26;
      v8 = sub_1B0BCA9E4();
      v5 = v28;

    }
    else
    {
      v8 = 0;
      v5 = 0xF000000000000000;
    }
    v29 = objc_msgSend(a2, sel_directions);
    if (!v29)
      goto LABEL_41;
    v30 = v29;
    sub_1B0ADE380(0, &qword_1EEEC8C00);
    v31 = sub_1B0BCAA5C();

    if (v31 >> 62)
    {
      swift_bridgeObjectRetain();
      v32 = sub_1B0BCAB10();
      swift_bridgeObjectRelease();
    }
    else
    {
      v32 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v32 >= 1)
    {
      v33 = (unint64_t)MNTrace.routeSet(atRowIndex:)(0);
      sub_1B0ADF050(v8, v5);
      return v33;
    }
    sub_1B0ADF050(v8, v5);
    return 0;
  }
  v5 = (unint64_t)v4;
  v6 = sub_1B0BCA9E4();
  v8 = v7;

  v9 = objc_msgSend(a1, sel_directionsResponseID);
  if (v9)
  {
    v5 = (unint64_t)v9;
    v10 = sub_1B0BCA9E4();
    v12 = v11;

    v13 = objc_msgSend(a2, sel_directions);
    if (v13)
    {
      v14 = v13;
      v35 = v6;
      v36 = v8;
      sub_1B0ADE380(0, &qword_1EEEC8C00);
      v15 = sub_1B0BCAA5C();

      if ((unint64_t)v15 >> 62)
      {
LABEL_33:
        if (v15 < 0)
          v5 = v15;
        else
          v5 = v15 & 0xFFFFFFFFFFFFFF8;
        sub_1B0ADF00C(v10, v12);
        swift_bridgeObjectRetain();
        v16 = sub_1B0BCAB10();
        swift_bridgeObjectRelease();
        if (v16)
        {
LABEL_6:
          v17 = 0;
          while (1)
          {
            v18 = (v15 & 0xC000000000000001) != 0
                ? (id)MEMORY[0x1B5E0D89C](v17, v15)
                : *(id *)(v15 + 8 * v17 + 32);
            v19 = v18;
            v20 = objc_msgSend(v18, sel_response);
            if (!v20)
              break;
            v21 = v20;
            v5 = (unint64_t)objc_msgSend(v20, sel_directionsResponseID);

            if (v5)
            {
              v22 = sub_1B0BCA9E4();
              v8 = v23;

              sub_1B0ADF00C(v10, v12);
              sub_1B0ADF00C(v22, v8);
              sub_1B0AE036C(v22, v8);
              v5 = v24;
              sub_1B0ADF064(v10, v12);
              sub_1B0ADF064(v22, v8);
              sub_1B0ADF064(v22, v8);

              if ((v5 & 1) != 0)
              {
                sub_1B0ADF064(v10, v12);
                swift_bridgeObjectRelease();
                v33 = (unint64_t)MNTrace.routeSet(atRowIndex:)(v17);
                sub_1B0ADF064(v10, v12);
                sub_1B0ADF064(v35, v36);
                return v33;
              }
              v25 = v17 + 1;
              if (__OFADD__(v17, 1))
              {
LABEL_32:
                __break(1u);
                goto LABEL_33;
              }
            }
            else
            {
              sub_1B0ADF00C(v10, v12);
              sub_1B0ADF050(0, 0xF000000000000000);
              sub_1B0ADF050(v10, v12);

              v25 = v17 + 1;
              if (__OFADD__(v17, 1))
                goto LABEL_32;
            }
            ++v17;
            if (v25 == v16)
              goto LABEL_18;
          }
          __break(1u);
          goto LABEL_40;
        }
      }
      else
      {
        v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
        sub_1B0ADF00C(v10, v12);
        if (v16)
          goto LABEL_6;
      }
LABEL_18:
      sub_1B0ADF064(v10, v12);
      swift_bridgeObjectRelease();
      sub_1B0ADF064(v10, v12);
      sub_1B0ADF064(v35, v36);
    }
    else
    {
      sub_1B0ADF064(v10, v12);
      sub_1B0ADF064(v6, v8);
    }
    return 0;
  }
LABEL_40:
  __break(1u);
LABEL_41:
  result = sub_1B0ADF050(v8, v5);
  __break(1u);
  return result;
}

id MNTrace.objcOnly_routesWithDirectionsResponseID(directionsResponseID:selectedRouteIndex:)(uint64_t a1, unint64_t a2, unint64_t a3)
{
  void *v3;
  id result;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  char v19;
  Swift::Int v20;
  uint64_t v21;
  _QWORD *v22;

  result = objc_msgSend(v3, sel_directions);
  if (!result)
    return result;
  v8 = result;
  sub_1B0ADE380(0, &qword_1EEEC8C00);
  v9 = sub_1B0BCAA5C();

  if (v9 >> 62)
  {
LABEL_22:
    sub_1B0ADF00C(a1, a2);
    swift_bridgeObjectRetain();
    v10 = sub_1B0BCAB10();
    swift_bridgeObjectRelease();
    if (v10)
      goto LABEL_4;
LABEL_16:
    sub_1B0ADF064(a1, a2);
    swift_bridgeObjectRelease();
    return 0;
  }
  v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  sub_1B0ADF00C(a1, a2);
  if (!v10)
    goto LABEL_16;
LABEL_4:
  v22 = (_QWORD *)a3;
  v11 = 0;
  while (1)
  {
    if ((v9 & 0xC000000000000001) != 0)
      v12 = (id)MEMORY[0x1B5E0D89C](v11, v9);
    else
      v12 = *(id *)(v9 + 8 * v11 + 32);
    v13 = v12;
    result = objc_msgSend(v12, sel_response, v22);
    if (!result)
    {
      __break(1u);
      return result;
    }
    v14 = result;
    v15 = objc_msgSend(result, sel_directionsResponseID);

    if (v15)
      break;
    sub_1B0ADF00C(a1, a2);
    sub_1B0ADF050(0, 0xF000000000000000);
    sub_1B0ADF050(a1, a2);

    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
LABEL_15:
    ++v11;
    if (v20 == v10)
      goto LABEL_16;
  }
  v16 = sub_1B0BCA9E4();
  a3 = v17;

  sub_1B0ADF00C(a1, a2);
  sub_1B0ADF00C(v16, a3);
  sub_1B0AE036C(v16, a3);
  v19 = v18;
  sub_1B0ADF064(a1, a2);
  sub_1B0ADF064(v16, a3);
  sub_1B0ADF064(v16, a3);

  if ((v19 & 1) == 0)
  {
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_21;
    goto LABEL_15;
  }
  sub_1B0ADF064(a1, a2);
  swift_bridgeObjectRelease();
  *(_OWORD *)&result = (unsigned __int128)MNTrace.routeSet(atRowIndex:)(v11);
  if (result)
  {
    if (v22)
      *v22 = v21;
  }
  return result;
}

Swift::Int_optional __swiftcall MNTrace.locationIndex(afterTimestamp:)(Swift::Double afterTimestamp)
{
  void *v1;
  char *v3;
  Swift::Bool v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  BOOL v13;
  char *v14;
  Swift::Int_optional result;

  v3 = (char *)objc_msgSend(v1, sel_locations);
  if (v3)
  {
    v5 = v3;
    sub_1B0ADE380(0, &qword_1EEEC8C10);
    v6 = sub_1B0BCAA5C();

    if (v6 >> 62)
      goto LABEL_12;
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    v8 = 0;
    if (v7)
    {
      while (1)
      {
        v9 = (v6 & 0xC000000000000001) != 0
           ? (id)MEMORY[0x1B5E0D89C](v8, v6)
           : *(id *)(v6 + 8 * (_QWORD)v8 + 32);
        v10 = v9;
        objc_msgSend(v9, sel_timestamp);
        v12 = v11;

        v13 = v12 < afterTimestamp;
        if (v12 >= afterTimestamp)
          break;
        v14 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
          __break(1u);
LABEL_12:
          swift_bridgeObjectRetain();
          v7 = sub_1B0BCAB10();
          swift_bridgeObjectRelease();
          v8 = 0;
          if (!v7)
            goto LABEL_13;
        }
        else
        {
          ++v8;
          if (v14 == (char *)v7)
          {
            v8 = 0;
            break;
          }
        }
      }
    }
    else
    {
LABEL_13:
      v13 = 1;
    }
    swift_bridgeObjectRelease();
    v3 = v8;
    v4 = v13;
  }
  else
  {
    __break(1u);
  }
  result.value = (Swift::Int)v3;
  result.is_nil = v4;
  return result;
}

Swift::Int __swiftcall MNTrace.locationIndexAfterTimestamp(_:)(Swift::Double a1)
{
  Swift::Int_optional v2;

  v2 = MNTrace.locationIndex(afterTimestamp:)(a1);
  if (v2.is_nil)
    v2.value = sub_1B0BCA984();
  return v2.value;
}

void MNTraceDirectionsRow.routes.getter()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;

  v1 = objc_msgSend(v0, sel_error);
  if (v1)
  {

    return;
  }
  v2 = objc_msgSend(v0, sel_response);

  if (v2)
  {
    v3 = objc_msgSend(v0, sel_response);
    if (v3)
    {
      v4 = v3;
      v5 = objc_msgSend(v3, sel_waypointRoutes);

      if (v5)
      {
        v6 = (uint64_t)objc_msgSend(v5, sel_count);

        if (v6 < 1)
          return;
        v7 = objc_msgSend(v0, sel_waypoints);
        if (v7)
        {
          v8 = v7;
          sub_1B0ADE380(0, &qword_1EEEC8C18);
          sub_1B0BCAA5C();

          v9 = objc_msgSend(v0, sel_request);
          if (v9)
          {
            v10 = v9;
            v11 = objc_msgSend(v9, sel_routeAttributes);

            if (v11)
            {
              v12 = objc_msgSend(v0, sel_response);
              if (v12)
              {
                v13 = v12;
                v14 = objc_msgSend(v0, sel_request);
                if (v14)
                {
                  v15 = v14;
                  v16 = objc_allocWithZone(MEMORY[0x1E0D274D8]);
                  v17 = (void *)sub_1B0BCAA50();
                  swift_bridgeObjectRelease();
                  v18 = objc_msgSend(v16, sel_initWithWaypoints_routeAttributes_directionsResponse_directionsRequest_, v17, v11, v13, v15);

                  v19 = objc_msgSend(v18, sel_allRoutes);
                  if (v19)
                  {
                    v20 = v19;
                    sub_1B0ADE380(0, &qword_1EEEC8A78);
                    sub_1B0BCAA5C();

                  }
                  return;
                }
LABEL_23:
                __break(1u);
                return;
              }
LABEL_22:
              __break(1u);
              goto LABEL_23;
            }
LABEL_21:
            __break(1u);
            goto LABEL_22;
          }
LABEL_20:
          __break(1u);
          goto LABEL_21;
        }
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_19;
  }
}

void sub_1B0ADFF24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_1B0ADFF84(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
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
    JUMPOUT(0x1B0AE0168);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

unint64_t sub_1B0AE018C(unint64_t result, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0)
    return MEMORY[0x1B5E0D89C]();
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10) > result)
  {
    return (unint64_t)*(id *)(a2 + 8 * result + 32);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B0AE01E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  sub_1B0ADFF24((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_1B0AE02B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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

  result = sub_1B0BCA990();
  v11 = result;
  if (result)
  {
    result = sub_1B0BCA9A8();
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
  v14 = sub_1B0BCA99C();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_1B0ADFF24(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_1B0AE036C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1B0AE03B8()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_1B0AE03EC + dword_1B0AE05C4[v0 >> 62]))();
}

uint64_t sub_1B0AE03FC@<X0>(int a1@<W8>)
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

id sub_1B0AE06E0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MNTestClass();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MNTestClass()
{
  return objc_opt_self();
}

uint64_t static MNTrace.currentVersion.getter()
{
  return 61;
}

unint64_t static MNTrace.mainSchema.getter()
{
  return 0xD000000000003460;
}

unint64_t static MNTrace.upgradeSchema(fromVersion:)(unint64_t a1)
{
  return sub_1B0AE094C(a1);
}

unint64_t MNTrace.TraceUpgradeError.errorDescription.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8))
  {
    if (*(_BYTE *)(v0 + 8) == 1)
      return 0xD00000000000006CLL;
    else
      return 0xD000000000000030;
  }
  else
  {
    sub_1B0BCAAC8();
    sub_1B0BCAA38();
    sub_1B0BCAB28();
    sub_1B0BCAA38();
    swift_bridgeObjectRelease();
    sub_1B0BCAA38();
    return 0;
  }
}

unint64_t sub_1B0AE094C(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (a1 > 0x3D)
  {
    __break(1u);
LABEL_16:
    sub_1B0BCAB04();
    __break(1u);
    JUMPOUT(0x1B0AE0B84);
  }
  v1 = a1;
  if (a1 == 61)
  {
    v1 = 0;
  }
  else
  {
    if (a1 < 0x38)
    {
      sub_1B0AE0B9C();
      swift_allocError();
      *(_QWORD *)v2 = v1;
      *(_BYTE *)(v2 + 8) = 0;
      swift_willThrow();
      swift_bridgeObjectRelease();
      return v1;
    }
    v3 = a1;
    while (2)
    {
      switch(v3)
      {
        case '8':
        case '9':
        case ':':
        case ';':
        case '<':
          sub_1B0BCAA38();
          swift_bridgeObjectRelease();
          if (v3 == 60)
            goto LABEL_11;
          if (++v3 >= v1)
            continue;
          __break(1u);
LABEL_11:
          v1 = 0;
          break;
        default:
          goto LABEL_16;
      }
      break;
    }
  }
  swift_bridgeObjectRetain();
  v4 = sub_1B0BCAA2C();
  swift_bridgeObjectRelease();
  if (v4 >= 1)
  {
    sub_1B0BCAAC8();
    swift_bridgeObjectRelease();
    sub_1B0BCAA38();
    swift_bridgeObjectRelease();
    sub_1B0BCAA38();
    return 0xD000000000000014;
  }
  return v1;
}

unint64_t sub_1B0AE0B9C()
{
  unint64_t result;

  result = qword_1EEEC8C28;
  if (!qword_1EEEC8C28)
  {
    result = MEMORY[0x1B5E0E784](&protocol conformance descriptor for MNTrace.TraceUpgradeError, &type metadata for MNTrace.TraceUpgradeError);
    atomic_store(result, (unint64_t *)&qword_1EEEC8C28);
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t _s17TraceUpgradeErrorOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s17TraceUpgradeErrorOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_1B0AE0C84(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_1B0AE0CA0(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MNTrace.TraceUpgradeError()
{
  return &type metadata for MNTrace.TraceUpgradeError;
}

id MNNavTrayGuidanceEvent.init(guidanceEvent:)(void *a1)
{
  id v2;

  v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithGuidanceEvent_, a1);

  return v2;
}

id MNNavTrayGuidanceEvent.init(guidanceEvent:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  *(_QWORD *)(v1 + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent) = a1;
  v3.super_class = (Class)MNNavTrayGuidanceEvent;
  return objc_msgSendSuper2(&v3, sel_init);
}

id MNNavTrayGuidanceEvent.title.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent), sel_navTrayTitleString);
}

id MNNavTrayGuidanceEvent.detail.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent), sel_navTrayDetailString);
}

uint64_t MNNavTrayGuidanceEvent.description.getter()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v1 = v0;
  sub_1B0BCAAC8();
  sub_1B0BCAA38();
  v2 = objc_msgSend(v0, sel_title);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel_stringWithDefaultOptions);

    sub_1B0BCAA20();
  }
  sub_1B0BCAA38();
  swift_bridgeObjectRelease();
  sub_1B0BCAA38();
  v5 = objc_msgSend(v1, sel_detail);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel_stringWithDefaultOptions);

    sub_1B0BCAA20();
  }
  sub_1B0BCAA38();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t static MNNavTrayGuidanceEvent.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall MNNavTrayGuidanceEvent.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent);
  v4 = (id)sub_1B0BCAA14();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);

}

void __swiftcall MNNavTrayGuidanceEvent.init(coder:)(MNNavTrayGuidanceEvent_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

id MNNavTrayGuidanceEvent.init(coder:)(void *a1)
{
  void *v1;
  char *v3;
  id v4;
  objc_super v6;

  sub_1B0ADE380(0, (unint64_t *)&unk_1EEEC8C38);
  v3 = v1;
  *(_QWORD *)&v3[OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent] = sub_1B0BCAA8C();

  v6.receiver = v3;
  v6.super_class = (Class)MNNavTrayGuidanceEvent;
  v4 = objc_msgSendSuper2(&v6, sel_init);

  return v4;
}

void __swiftcall MNNavTrayGuidanceEvent.init()(MNNavTrayGuidanceEvent *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void MNNavTrayGuidanceEvent.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t type metadata accessor for MNNavTrayGuidanceEvent(uint64_t a1)
{
  return sub_1B0ADE380(a1, &qword_1EEEC8D10);
}

uint64_t _nlc_connect(_DWORD *a1)
{
  mach_port_t *v2;
  mach_error_t v4;
  mach_port_t sp[2];

  *(_QWORD *)sp = 0;
  v2 = (mach_port_t *)MEMORY[0x1E0C81720];
  bootstrap_look_up(*MEMORY[0x1E0C81720], "com.apple.NetworkLinkConditioner", sp);
  if (bootstrap_look_up(*v2, "com.apple.NetworkLinkConditioner", sp))
  {
    puts("NLCd : Bootstrap failure");
    return 100;
  }
  else
  {
    v4 = nlc_connect(sp[0], a1, a1 + 1, &sp[1]);
    if (v4)
      mach_error("nlc_connect:", v4);
    return sp[1];
  }
}

uint64_t _nlc_disconnect(int *a1)
{
  mach_error_t v2;
  unsigned int v4;

  v4 = 0;
  v2 = nlc_disconnect(*a1, a1[1], &v4);
  if (v2)
    mach_error("nlc_disconnect:", v2);
  mach_port_deallocate(*MEMORY[0x1E0C83DA0], *a1);
  return v4;
}

uint64_t _nlc_start_simulation(mach_port_name_t *a1, __int128 *a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  mach_error_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unsigned int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  *((_DWORD *)a2 + 1) = 0;
  v3 = a2[11];
  v28 = a2[10];
  v29 = v3;
  v30 = a2[12];
  v4 = a2[7];
  v24 = a2[6];
  v25 = v4;
  v5 = a2[9];
  v26 = a2[8];
  v27 = v5;
  v6 = a2[3];
  v20 = a2[2];
  v21 = v6;
  v7 = a2[5];
  v22 = a2[4];
  v23 = v7;
  v8 = a2[1];
  v18 = *a2;
  v19 = v8;
  v9 = nlc_simulate(*a1, (uint64_t)&v18, 0xD0u, a1[1], &v17);
  if (v9)
    mach_error("_nlc_start_simulation:", v9);
  v10 = v29;
  a2[10] = v28;
  a2[11] = v10;
  a2[12] = v30;
  v11 = v25;
  a2[6] = v24;
  a2[7] = v11;
  v12 = v27;
  a2[8] = v26;
  a2[9] = v12;
  v13 = v21;
  a2[2] = v20;
  a2[3] = v13;
  v14 = v23;
  a2[4] = v22;
  a2[5] = v14;
  v15 = v19;
  *a2 = v18;
  a2[1] = v15;
  return v17;
}

uint64_t _nlc_stop_simulation(mach_port_name_t *a1, __int128 *a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  mach_error_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unsigned int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  *((_DWORD *)a2 + 1) = 1;
  v3 = a2[11];
  v28 = a2[10];
  v29 = v3;
  v30 = a2[12];
  v4 = a2[7];
  v24 = a2[6];
  v25 = v4;
  v5 = a2[9];
  v26 = a2[8];
  v27 = v5;
  v6 = a2[3];
  v20 = a2[2];
  v21 = v6;
  v7 = a2[5];
  v22 = a2[4];
  v23 = v7;
  v8 = a2[1];
  v18 = *a2;
  v19 = v8;
  v9 = nlc_stop_simulation(*a1, (uint64_t)&v18, 0xD0u, a1[1], &v17);
  if (v9)
    mach_error("_nlc_stop_simulation:", v9);
  v10 = v29;
  a2[10] = v28;
  a2[11] = v10;
  a2[12] = v30;
  v11 = v25;
  a2[6] = v24;
  a2[7] = v11;
  v12 = v27;
  a2[8] = v26;
  a2[9] = v12;
  v13 = v21;
  a2[2] = v20;
  a2[3] = v13;
  v14 = v23;
  a2[4] = v22;
  a2[5] = v14;
  v15 = v19;
  *a2 = v18;
  a2[1] = v15;
  return v17;
}

uint64_t _nlc_get_status(mach_port_name_t *a1, _DWORD *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  mach_error_t status;
  size_t __n;
  _BYTE __src[1024];
  _OWORD v14[64];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  a2[1] = 2;
  __n = 208;
  v4 = *((_OWORD *)a2 + 11);
  v14[10] = *((_OWORD *)a2 + 10);
  v14[11] = v4;
  v14[12] = *((_OWORD *)a2 + 12);
  v5 = *((_OWORD *)a2 + 7);
  v14[6] = *((_OWORD *)a2 + 6);
  v14[7] = v5;
  v6 = *((_OWORD *)a2 + 9);
  v14[8] = *((_OWORD *)a2 + 8);
  v14[9] = v6;
  v7 = *((_OWORD *)a2 + 3);
  v14[2] = *((_OWORD *)a2 + 2);
  v14[3] = v7;
  v8 = *((_OWORD *)a2 + 5);
  v14[4] = *((_OWORD *)a2 + 4);
  v14[5] = v8;
  v9 = *((_OWORD *)a2 + 1);
  v14[0] = *(_OWORD *)a2;
  v14[1] = v9;
  bzero(__src, 0x400uLL);
  status = nlc_get_status(*a1, (uint64_t)v14, 0xD0u, __src, &__n, a1[1], (_DWORD *)&__n + 1);
  if (status)
    mach_error("_nlc_get_status:", status);
  memcpy(a2, __src, __n);
  return HIDWORD(__n);
}

uint64_t nlc_connect(int a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_name_t reply_port;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v13;
  int rcv_name;
  int rcv_name_4;
  mach_port_t rcv_name_8;
  _BYTE rcv_name_12[20];
  _DWORD v18[7];

  memset(v18, 0, sizeof(v18));
  *(_OWORD *)&rcv_name_12[4] = 0u;
  rcv_name = 0;
  reply_port = mig_get_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = reply_port;
  v13 = 5395;
  *(_QWORD *)rcv_name_12 = 0x9D4C00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v13);
    reply_port = rcv_name_8;
  }
  v9 = mach_msg((mach_msg_header_t *)&v13, 3, 0x18u, 0x40u, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name_8);
  }
  else
  {
    if (!(_DWORD)v9)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 40368)
      {
        if (v13 < 0)
        {
          v10 = 4294966996;
          if (*(_DWORD *)&rcv_name_12[8] == 1 && rcv_name == 56 && !rcv_name_4 && HIWORD(v18[0]) << 16 == 1114112)
          {
            v10 = 0;
            v11 = v18[3];
            *a2 = *(_DWORD *)&rcv_name_12[12];
            *a3 = v11;
            *a4 = v18[4];
            return v10;
          }
        }
        else if (rcv_name == 36)
        {
          v10 = 4294966996;
          if (*(_DWORD *)&rcv_name_12[16])
          {
            if (rcv_name_4)
              v10 = 4294966996;
            else
              v10 = *(unsigned int *)&rcv_name_12[16];
          }
        }
        else
        {
          v10 = 4294966996;
        }
      }
      else
      {
        v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)&v13);
      return v10;
    }
    mig_dealloc_reply_port(rcv_name_8);
  }
  return v10;
}

uint64_t nlc_disconnect(int a1, int a2, _DWORD *a3)
{
  mach_port_name_t reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  _BYTE rcv_name[44];

  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&rcv_name[28] = a2;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  v10 = 5395;
  *(_QWORD *)&rcv_name[12] = 0x9D4D00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    reply_port = *(_DWORD *)&rcv_name[8];
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
      return v7;
    }
    if (*(_DWORD *)&rcv_name[16] == 71)
    {
      v7 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name[16] == 40369)
    {
      if ((v10 & 0x80000000) == 0)
      {
        if (*(_DWORD *)rcv_name == 40)
        {
          if (!*(_DWORD *)&rcv_name[4])
          {
            v7 = *(unsigned int *)&rcv_name[28];
            if (!*(_DWORD *)&rcv_name[28])
            {
              *a3 = *(_DWORD *)&rcv_name[32];
              return v7;
            }
            goto LABEL_23;
          }
        }
        else if (*(_DWORD *)rcv_name == 36)
        {
          if (*(_DWORD *)&rcv_name[4])
            v8 = 1;
          else
            v8 = *(_DWORD *)&rcv_name[28] == 0;
          if (v8)
            v7 = 4294966996;
          else
            v7 = *(unsigned int *)&rcv_name[28];
          goto LABEL_23;
        }
      }
      v7 = 4294966996;
    }
    else
    {
      v7 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&v10);
    return v7;
  }
  mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  return v7;
}

uint64_t nlc_simulate(mach_port_name_t a1, uint64_t a2, unsigned int a3, mach_port_name_t a4, _DWORD *a5)
{
  uint64_t v5;
  uint64_t v10;
  mach_msg_size_t v11;
  mach_port_name_t reply_port;
  uint64_t v13;
  BOOL v14;
  mach_port_name_t rcv_name[4];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  *(_OWORD *)rcv_name = 0u;
  v17 = 0u;
  *((_QWORD *)&v17 + 1) = *MEMORY[0x1E0C804E8];
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(v18) = a3;
    v10 = (a3 + 3) & 0xFFFFFFFC;
    v11 = v10 + 40;
    *(mach_port_name_t *)((char *)&rcv_name[9] + v10) = a4;
    reply_port = mig_get_reply_port();
    rcv_name[2] = a1;
    rcv_name[3] = reply_port;
    rcv_name[0] = 5395;
    *(_QWORD *)&v17 = 0x9D4E00000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
      reply_port = rcv_name[3];
    }
    v13 = mach_msg((mach_msg_header_t *)rcv_name, 3, v11, 0x30u, reply_port, 0, 0);
    v5 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name[3]);
      return v5;
    }
    if ((_DWORD)v13)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v5;
    }
    if (DWORD1(v17) == 71)
    {
      v5 = 4294966988;
    }
    else if (DWORD1(v17) == 40370)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] == 40)
        {
          if (!rcv_name[2])
          {
            v5 = v18;
            if (!(_DWORD)v18)
            {
              *a5 = DWORD1(v18);
              return v5;
            }
            goto LABEL_25;
          }
        }
        else if (rcv_name[1] == 36)
        {
          if (rcv_name[2])
            v14 = 1;
          else
            v14 = (_DWORD)v18 == 0;
          if (v14)
            v5 = 4294966996;
          else
            v5 = v18;
          goto LABEL_25;
        }
      }
      v5 = 4294966996;
    }
    else
    {
      v5 = 4294966995;
    }
LABEL_25:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v5;
  }
  return 4294966989;
}

uint64_t nlc_stop_simulation(mach_port_name_t a1, uint64_t a2, unsigned int a3, mach_port_name_t a4, _DWORD *a5)
{
  uint64_t v5;
  uint64_t v10;
  mach_msg_size_t v11;
  mach_port_name_t reply_port;
  uint64_t v13;
  BOOL v14;
  mach_port_name_t rcv_name[4];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  *(_OWORD *)rcv_name = 0u;
  v17 = 0u;
  *((_QWORD *)&v17 + 1) = *MEMORY[0x1E0C804E8];
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(v18) = a3;
    v10 = (a3 + 3) & 0xFFFFFFFC;
    v11 = v10 + 40;
    *(mach_port_name_t *)((char *)&rcv_name[9] + v10) = a4;
    reply_port = mig_get_reply_port();
    rcv_name[2] = a1;
    rcv_name[3] = reply_port;
    rcv_name[0] = 5395;
    *(_QWORD *)&v17 = 0x9D4F00000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
      reply_port = rcv_name[3];
    }
    v13 = mach_msg((mach_msg_header_t *)rcv_name, 3, v11, 0x30u, reply_port, 0, 0);
    v5 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name[3]);
      return v5;
    }
    if ((_DWORD)v13)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v5;
    }
    if (DWORD1(v17) == 71)
    {
      v5 = 4294966988;
    }
    else if (DWORD1(v17) == 40371)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] == 40)
        {
          if (!rcv_name[2])
          {
            v5 = v18;
            if (!(_DWORD)v18)
            {
              *a5 = DWORD1(v18);
              return v5;
            }
            goto LABEL_25;
          }
        }
        else if (rcv_name[1] == 36)
        {
          if (rcv_name[2])
            v14 = 1;
          else
            v14 = (_DWORD)v18 == 0;
          if (v14)
            v5 = 4294966996;
          else
            v5 = v18;
          goto LABEL_25;
        }
      }
      v5 = 4294966996;
    }
    else
    {
      v5 = 4294966995;
    }
LABEL_25:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v5;
  }
  return 4294966989;
}

uint64_t nlc_get_status(mach_port_name_t a1, uint64_t a2, unsigned int a3, void *a4, _DWORD *a5, mach_port_name_t a6, _DWORD *a7)
{
  uint64_t v7;
  uint64_t v14;
  mach_msg_size_t v15;
  mach_port_name_t reply_port;
  uint64_t v17;
  BOOL v18;
  int v21;
  unsigned int v22;
  char *v23;
  mach_port_name_t rcv_name[4];
  __int128 v25;
  size_t __n[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  *(_OWORD *)__n = 0u;
  v27 = 0u;
  *(_OWORD *)rcv_name = 0u;
  v25 = 0u;
  *((_QWORD *)&v25 + 1) = *MEMORY[0x1E0C804E8];
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(__n[0]) = a3;
    v14 = (a3 + 3) & 0xFFFFFFFC;
    v15 = v14 + 40;
    *(mach_port_name_t *)((char *)&rcv_name[9] + v14) = a6;
    reply_port = mig_get_reply_port();
    rcv_name[2] = a1;
    rcv_name[3] = reply_port;
    rcv_name[0] = 5395;
    *(_QWORD *)&v25 = 0x9D5000000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
      reply_port = rcv_name[3];
    }
    v17 = mach_msg((mach_msg_header_t *)rcv_name, 3, v15, 0x434u, reply_port, 0, 0);
    v7 = v17;
    if ((v17 - 268435458) <= 0xE && ((1 << (v17 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name[3]);
      return v7;
    }
    if ((_DWORD)v17)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v7;
    }
    if (DWORD1(v25) == 71)
    {
      v7 = 4294966988;
    }
    else if (DWORD1(v25) == 40372)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] - 1069 <= 0xFFFFFBFE)
        {
          if (rcv_name[2])
            v18 = 1;
          else
            v18 = LODWORD(__n[0]) == 0;
          if (!v18 && rcv_name[1] == 36)
            v7 = LODWORD(__n[0]);
          else
            v7 = 4294966996;
          goto LABEL_27;
        }
        if (!rcv_name[2])
        {
          v7 = LODWORD(__n[0]);
          if (LODWORD(__n[0]))
            goto LABEL_27;
          v21 = HIDWORD(__n[0]);
          if (HIDWORD(__n[0]) <= 0x400)
          {
            v7 = 4294966996;
            if (rcv_name[1] - 44 >= HIDWORD(__n[0]))
            {
              v22 = (HIDWORD(__n[0]) + 3) & 0xFFFFFFFC;
              if (rcv_name[1] == v22 + 44)
              {
                v23 = (char *)&rcv_name[-256] + v22;
                memcpy(a4, &__n[1], HIDWORD(__n[0]));
                v7 = 0;
                *a5 = v21;
                *a7 = *((_DWORD *)v23 + 266);
                return v7;
              }
            }
            goto LABEL_27;
          }
        }
      }
      v7 = 4294966996;
    }
    else
    {
      v7 = 4294966995;
    }
LABEL_27:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v7;
  }
  return 4294966989;
}

void sub_1B0AE30F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0AE3DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1B0AE4090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0AE5DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  uint64_t v43;

  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v43 - 256), 8);
  _Block_object_dispose((const void *)(v43 - 208), 8);
  _Block_object_dispose((const void *)(v43 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1B0AE66FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;

  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 256), 8);
  _Block_object_dispose((const void *)(v41 - 208), 8);
  _Block_object_dispose((const void *)(v41 - 160), 8);
  _Unwind_Resume(a1);
}

id GetAudioLogForMNSoundEffectResourceControllerCategory()
{
  if (qword_1ED0C3E08 != -1)
    dispatch_once(&qword_1ED0C3E08, &__block_literal_global);
  return (id)_MergedGlobals_15;
}

BOOL MNProtocolDeclaresSelector(void *a1, const char *a2)
{
  Protocol *v3;
  _BOOL8 v4;

  v3 = a1;
  v4 = 1;
  if (!(unint64_t)protocol_getMethodDescription(v3, a2, 1, 1).name)
    v4 = (unint64_t)protocol_getMethodDescription(v3, a2, 0, 1).name != 0;

  return v4;
}

void sub_1B0AEA6A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1B0AEA898(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B0AEAA74(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B0AEAD30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1B0AEB184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location,char a26)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1B0AED370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GetAudioLogForMNAnnouncementEngineCategory()
{
  if (qword_1ED0C3E28 != -1)
    dispatch_once(&qword_1ED0C3E28, &__block_literal_global_32_0);
  return (id)_MergedGlobals_17;
}

const __CFString *NAVAudioErrorDomain()
{
  return CFSTR("MNAudioSystemError");
}

void _MNNavigationServerExceptionHandler(void *a1)
{
  id v1;
  NSObject *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  GEOFindOrCreateLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_ERROR, "***** navd exception, call stack: *****", (uint8_t *)&v5, 2u);
  }

  GEOFindOrCreateLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v1, "callStackSymbols");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138477827;
    v6 = v4;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_ERROR, "%{private}@", (uint8_t *)&v5, 0xCu);

  }
}

void sub_1B0AF0F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0AF38BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

id MNGetErrorsLog()
{
  if (MNGetErrorsLog_onceToken != -1)
    dispatch_once(&MNGetErrorsLog_onceToken, &__block_literal_global_5);
  return (id)MNGetErrorsLog_log;
}

id MNGetMNCarPlayConnectionMonitorLog()
{
  if (MNGetMNCarPlayConnectionMonitorLog_onceToken != -1)
    dispatch_once(&MNGetMNCarPlayConnectionMonitorLog_onceToken, &__block_literal_global_32_1);
  return (id)MNGetMNCarPlayConnectionMonitorLog_log;
}

id MNGetMNDepartureUpdaterLog()
{
  if (MNGetMNDepartureUpdaterLog_onceToken != -1)
    dispatch_once(&MNGetMNDepartureUpdaterLog_onceToken, &__block_literal_global_34_0);
  return (id)MNGetMNDepartureUpdaterLog_log;
}

id MNGetMNDirectionsRequestLog()
{
  if (MNGetMNDirectionsRequestLog_onceToken != -1)
    dispatch_once(&MNGetMNDirectionsRequestLog_onceToken, &__block_literal_global_36);
  return (id)MNGetMNDirectionsRequestLog_log;
}

id MNGetMNGuidanceManagerLog()
{
  if (MNGetMNGuidanceManagerLog_onceToken != -1)
    dispatch_once(&MNGetMNGuidanceManagerLog_onceToken, &__block_literal_global_37);
  return (id)MNGetMNGuidanceManagerLog_log;
}

id MNGetMNIdleTimerUpdaterLog()
{
  if (MNGetMNIdleTimerUpdaterLog_onceToken != -1)
    dispatch_once(&MNGetMNIdleTimerUpdaterLog_onceToken, &__block_literal_global_38);
  return (id)MNGetMNIdleTimerUpdaterLog_log;
}

id MNGetMNLocationTrackerLog()
{
  if (MNGetMNLocationTrackerLog_onceToken != -1)
    dispatch_once(&MNGetMNLocationTrackerLog_onceToken, &__block_literal_global_41);
  return (id)MNGetMNLocationTrackerLog_log;
}

id MNGetMNNavigationDetailsLog()
{
  if (MNGetMNNavigationDetailsLog_onceToken != -1)
    dispatch_once(&MNGetMNNavigationDetailsLog_onceToken, &__block_literal_global_42);
  return (id)MNGetMNNavigationDetailsLog_log;
}

id MNGetMNNavigationServiceLog()
{
  if (MNGetMNNavigationServiceLog_onceToken != -1)
    dispatch_once(&MNGetMNNavigationServiceLog_onceToken, &__block_literal_global_43);
  return (id)MNGetMNNavigationServiceLog_log;
}

id MNGetMNNavigationSessionLog()
{
  if (MNGetMNNavigationSessionLog_onceToken != -1)
    dispatch_once(&MNGetMNNavigationSessionLog_onceToken, &__block_literal_global_45);
  return (id)MNGetMNNavigationSessionLog_log;
}

id MNGetMNNavigationSimulationLog()
{
  if (MNGetMNNavigationSimulationLog_onceToken != -1)
    dispatch_once(&MNGetMNNavigationSimulationLog_onceToken, &__block_literal_global_46);
  return (id)MNGetMNNavigationSimulationLog_log;
}

id MNGetMNNavigationStateManagerLog()
{
  if (MNGetMNNavigationStateManagerLog_onceToken != -1)
    dispatch_once(&MNGetMNNavigationStateManagerLog_onceToken, &__block_literal_global_48);
  return (id)MNGetMNNavigationStateManagerLog_log;
}

id MNGetMNNavigationXPCLog()
{
  if (MNGetMNNavigationXPCLog_onceToken != -1)
    dispatch_once(&MNGetMNNavigationXPCLog_onceToken, &__block_literal_global_49);
  return (id)MNGetMNNavigationXPCLog_log;
}

id MNGetMNParkedVehicleDetectorLog()
{
  if (MNGetMNParkedVehicleDetectorLog_onceToken != -1)
    dispatch_once(&MNGetMNParkedVehicleDetectorLog_onceToken, &__block_literal_global_50);
  return (id)MNGetMNParkedVehicleDetectorLog_log;
}

id MNGetMNRouteAttributesLog()
{
  if (MNGetMNRouteAttributesLog_onceToken != -1)
    dispatch_once(&MNGetMNRouteAttributesLog_onceToken, &__block_literal_global_52);
  return (id)MNGetMNRouteAttributesLog_log;
}

id MNGetMNRouteEditorLog()
{
  if (MNGetMNRouteEditorLog_onceToken != -1)
    dispatch_once(&MNGetMNRouteEditorLog_onceToken, &__block_literal_global_54);
  return (id)MNGetMNRouteEditorLog_log;
}

id MNGetMNRouteStorageLog()
{
  if (MNGetMNRouteStorageLog_onceToken != -1)
    dispatch_once(&MNGetMNRouteStorageLog_onceToken, &__block_literal_global_56);
  return (id)MNGetMNRouteStorageLog_log;
}

id MNGetMNServerSessionStateInfoLog()
{
  if (MNGetMNServerSessionStateInfoLog_onceToken != -1)
    dispatch_once(&MNGetMNServerSessionStateInfoLog_onceToken, &__block_literal_global_57);
  return (id)MNGetMNServerSessionStateInfoLog_log;
}

id MNGetMNStringExtrasLog()
{
  if (MNGetMNStringExtrasLog_onceToken != -1)
    dispatch_once(&MNGetMNStringExtrasLog_onceToken, &__block_literal_global_59);
  return (id)MNGetMNStringExtrasLog_log;
}

id MNGetMNSuggestedNavigationModeLog()
{
  if (MNGetMNSuggestedNavigationModeLog_onceToken != -1)
    dispatch_once(&MNGetMNSuggestedNavigationModeLog_onceToken, &__block_literal_global_61);
  return (id)MNGetMNSuggestedNavigationModeLog_log;
}

id MNGetMNTimeAndDistanceUpdaterLog()
{
  if (MNGetMNTimeAndDistanceUpdaterLog_onceToken != -1)
    dispatch_once(&MNGetMNTimeAndDistanceUpdaterLog_onceToken, &__block_literal_global_63);
  return (id)MNGetMNTimeAndDistanceUpdaterLog_log;
}

id MNGetMNTraceLog()
{
  if (MNGetMNTraceLog_onceToken != -1)
    dispatch_once(&MNGetMNTraceLog_onceToken, &__block_literal_global_65);
  return (id)MNGetMNTraceLog_log;
}

id MNGetMNTunnelProjectorLog()
{
  if (MNGetMNTunnelProjectorLog_onceToken != -1)
    dispatch_once(&MNGetMNTunnelProjectorLog_onceToken, &__block_literal_global_66);
  return (id)MNGetMNTunnelProjectorLog_log;
}

id MNGetMNVehicleMonitorLog()
{
  if (MNGetMNVehicleMonitorLog_onceToken != -1)
    dispatch_once(&MNGetMNVehicleMonitorLog_onceToken, &__block_literal_global_68);
  return (id)MNGetMNVehicleMonitorLog_log;
}

id MNGetMNVirtualGarageManagerLog()
{
  if (MNGetMNVirtualGarageManagerLog_onceToken != -1)
    dispatch_once(&MNGetMNVirtualGarageManagerLog_onceToken, &__block_literal_global_70);
  return (id)MNGetMNVirtualGarageManagerLog_log;
}

id MNGetMNWalkingRouteBackgroundLoaderLog()
{
  if (MNGetMNWalkingRouteBackgroundLoaderLog_onceToken != -1)
    dispatch_once(&MNGetMNWalkingRouteBackgroundLoaderLog_onceToken, &__block_literal_global_72);
  return (id)MNGetMNWalkingRouteBackgroundLoaderLog_log;
}

id MNGetMNXPCTransactionManagerLog()
{
  if (MNGetMNXPCTransactionManagerLog_onceToken != -1)
    dispatch_once(&MNGetMNXPCTransactionManagerLog_onceToken, &__block_literal_global_74);
  return (id)MNGetMNXPCTransactionManagerLog_log;
}

id MNGetProcessHandlingLog()
{
  if (qword_1ED0C3E48 != -1)
    dispatch_once(&qword_1ED0C3E48, &__block_literal_global_75);
  return (id)_MergedGlobals_19;
}

BOOL MNFormattedStringOptionsIsEqual(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2
      && *((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1)
      && a1[16] == a2[16]
      && a1[17] == a2[17]
      && a1[18] == a2[18]
      && *((double *)a1 + 3) == *((double *)a2 + 3);
}

unint64_t MNFormattedStringOptionsHash(unsigned __int8 *a1)
{
  return *((_QWORD *)a1 + 1) ^ *a1 ^ a1[16] ^ (unint64_t)a1[17];
}

int *MNGetHoursAndMinutesForTimeInterval(int *result, int *a2, double a3)
{
  int v3;
  int v4;

  v3 = (int)(a3 / 3600.0);
  *result = v3;
  v4 = vcvtpd_s64_f64((a3 - (double)(3600 * v3)) / 60.0);
  if (v4 >= 59)
    v4 = 59;
  *a2 = v4;
  return result;
}

id MNGetMNSequenceLog()
{
  if (qword_1ED0C3ED8 != -1)
    dispatch_once(&qword_1ED0C3ED8, &__block_literal_global_8);
  return (id)_MergedGlobals_22;
}

void sub_1B0AFF658(_Unwind_Exception *a1)
{
  _geo_isolate_unlock();
  _Unwind_Resume(a1);
}

void sub_1B0AFF7E8(_Unwind_Exception *a1)
{
  _geo_isolate_unlock();
  _Unwind_Resume(a1);
}

void sub_1B0AFFC34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1B5E0E364](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1B0B00164(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B0B00774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0B05204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GetAudioLogForMNAudioHardwareEngineCategory()
{
  if (qword_1ED0C3EE8 != -1)
    dispatch_once(&qword_1ED0C3EE8, &__block_literal_global_10);
  return (id)_MergedGlobals_23;
}

void sub_1B0B06264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

id _routeStorageQueue()
{
  if (qword_1ED0C3EF8 != -1)
    dispatch_once(&qword_1ED0C3EF8, &__block_literal_global_11);
  return (id)_MergedGlobals_24;
}

void ___routeStorageQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.navd.routeStorageQueue", v2);
  v1 = (void *)_MergedGlobals_24;
  _MergedGlobals_24 = (uint64_t)v0;

}

id MNRouteStorageDirectory(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  +[MNFilePaths navTempDirectoryPath](MNFilePaths, "navTempDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(v2, "stringByAppendingPathComponent:", v1);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }

  return v2;
}

BOOL MNSaveRoute(void *a1, char a2, _QWORD *a3)
{
  return MNSaveRouteWithSubpath(a1, 0, a2, a3);
}

BOOL MNSaveRouteWithSubpath(void *a1, void *a2, char a3, _QWORD *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  _BOOL8 v17;
  NSObject *v18;
  _QWORD block[4];
  id v21;
  id v22;
  uint8_t *v23;
  uint64_t *v24;
  char v25;
  uint8_t buf[16];
  uint8_t v27[8];
  uint8_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v7 = a1;
  v8 = a2;
  if (v7)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 1;
    *(_QWORD *)v27 = 0;
    v28 = v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__4;
    v31 = __Block_byref_object_dispose__4;
    v32 = 0;
    MNGetMNRouteStorageLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_generate(v9);

    MNGetMNRouteStorageLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ActiveRouteInfoDiskWrite", "", buf, 2u);
    }

    _routeStorageQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __MNSaveRouteWithSubpath_block_invoke;
    block[3] = &unk_1E61D2778;
    v21 = v8;
    v25 = a3;
    v22 = v7;
    v23 = v27;
    v24 = &v33;
    dispatch_sync(v13, block);

    MNGetMNRouteStorageLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v15, OS_SIGNPOST_INTERVAL_END, v10, "ActiveRouteInfoDiskWrite", "", buf, 2u);
    }

    if (a4)
    {
      v16 = (void *)*((_QWORD *)v28 + 5);
      if (v16)
        *a4 = objc_retainAutorelease(v16);
    }
    v17 = *((_BYTE *)v34 + 24) != 0;

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    GEOFindOrCreateLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_ERROR, "No route passed for saving", v27, 2u);
    }

    v17 = 0;
  }

  return v17;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

id MNGetRouteWithID(void *a1, _QWORD *a2)
{
  return MNGetRouteFromSubpathWithID(a1, 0, a2);
}

id MNGetRouteFromSubpathWithID(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint8_t *v22;
  uint8_t buf[16];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t v30[8];
  uint8_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v5 = a1;
  v6 = a2;
  if (v5)
  {
    *(_QWORD *)v30 = 0;
    v31 = v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__4;
    v34 = __Block_byref_object_dispose__4;
    v35 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__4;
    v28 = __Block_byref_object_dispose__4;
    v29 = 0;
    MNGetMNRouteStorageLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_generate(v7);

    MNGetMNRouteStorageLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "ActiveRouteInfoDiskRead", "", buf, 2u);
    }

    _routeStorageQueue();
    v11 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __MNGetRouteFromSubpathWithID_block_invoke;
    v18[3] = &unk_1E61D27A0;
    v19 = v6;
    v20 = v5;
    v21 = &v24;
    v22 = v30;
    dispatch_sync(v11, v18);

    MNGetMNRouteStorageLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v13, OS_SIGNPOST_INTERVAL_END, v8, "ActiveRouteInfoDiskRead", "", buf, 2u);
    }

    if (a3)
    {
      v14 = (void *)v25[5];
      if (v14)
        *a3 = objc_retainAutorelease(v14);
    }
    v15 = *((id *)v31 + 5);

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(v30, 8);

  }
  else
  {
    GEOFindOrCreateLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_ERROR, "No route ID passed for retrieving.", v30, 2u);
    }

    v15 = 0;
  }

  return v15;
}

void MNClearStoredRoutesUsedBefore(void *a1)
{
  MNClearStoredRoutesWithSubpathUsedBefore(a1, 0);
}

void MNClearStoredRoutesWithSubpathUsedBefore(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[16];

  v3 = a1;
  v4 = a2;
  MNGetMNRouteStorageLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  MNGetMNRouteStorageLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ActiveRouteInfoDiskRemove", "", buf, 2u);
  }

  _routeStorageQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __MNClearStoredRoutesWithSubpathUsedBefore_block_invoke;
  v14[3] = &unk_1E61D1D10;
  v15 = v4;
  v16 = v3;
  v10 = v3;
  v11 = v4;
  dispatch_sync(v9, v14);

  MNGetMNRouteStorageLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v13, OS_SIGNPOST_INTERVAL_END, v6, "ActiveRouteInfoDiskRemove", "", buf, 2u);
  }

}

uint64_t MNRecommendedDateForClearingRoutes()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -5.0);
}

const __CFString *MNNavigationServiceCallbackTypeAsString(unint64_t a1)
{
  if (a1 > 0x10)
    return CFSTR("MNNavigationServiceCallbackType_DidChangeVoiceGuidanceLevel");
  else
    return off_1E61D27C0[a1];
}

const __CFString *MNNavigationServiceStateAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("Stopped");
  else
    return off_1E61D2C90[a1 - 1];
}

BOOL MNNavigationServiceStateIsNavigating(unint64_t a1)
{
  return a1 > 3;
}

void sub_1B0B213EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL MNNavigationServiceStateChangedToNavigating(unint64_t a1, unint64_t a2)
{
  return a1 < 4 && a2 > 3;
}

BOOL MNNavigationServiceStateChangedFromNavigatingToStopped(unint64_t a1, uint64_t a2)
{
  return a1 > 3 && a2 == 0;
}

void _mnLPRWrappedError(_QWORD *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = v13;
  if (a1)
  {
    if (v13)
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v13, &a9);
      v16 = (void *)v15;
      if (v12)
      {
        v17 = *MEMORY[0x1E0C9B000];
        v25 = *MEMORY[0x1E0C9AFA8];
        v26 = v17;
        v27 = v15;
        v28 = v12;
        v18 = (void *)MEMORY[0x1E0C99D80];
        v19 = &v27;
        v20 = &v25;
        v21 = 2;
      }
      else
      {
        v23 = *MEMORY[0x1E0C9AFA8];
        v24 = v15;
        v18 = (void *)MEMORY[0x1E0C99D80];
        v19 = &v24;
        v20 = &v23;
        v21 = 1;
      }
      objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, v21, &a9, v23, v24, v25, v26, v27, v28, v29);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MapsNavLPRErrorDomain"), a2, v22);
    *a1 = (id)objc_claimAutoreleasedReturnValue();

  }
}

void sub_1B0B22450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0B22570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1B0B23A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0B2701C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x880], 8);
  _Block_object_dispose(&STACK[0x450], 8);
  _Block_object_dispose(&STACK[0xBA0], 8);
  _Block_object_dispose(&STACK[0x1150], 8);
  _Unwind_Resume(a1);
}

id MNGetMNLPRRuleMatcherLog()
{
  if (qword_1ED0C3F38 != -1)
    dispatch_once(&qword_1ED0C3F38, &__block_literal_global_14);
  return (id)_MergedGlobals_26;
}

void sub_1B0B28194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B0B28ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0B2E714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1B0B2FB20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id GetAudioLogForMNHapticResourceControllerCategory()
{
  if (qword_1ED0C3F48 != -1)
    dispatch_once(&qword_1ED0C3F48, &__block_literal_global_16);
  return (id)_MergedGlobals_27;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

const __CFString *MNTraceNavigationEventTypeAsString(unint64_t a1)
{
  if (a1 > 0x1E)
    return CFSTR("Unknown");
  else
    return off_1E61D30E8[a1];
}

void sub_1B0B331F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GetAudioLogForMNAudioSystemOptionsCategory()
{
  if (qword_1ED0C3F58 != -1)
    dispatch_once(&qword_1ED0C3F58, &__block_literal_global_18);
  return (id)_MergedGlobals_28;
}

void sub_1B0B39C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_1B0B3C478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0B40380(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

uint64_t MNHeadphonesAreInUse()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentRoute");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "outputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isHeadphones", (_QWORD)v8) & 1) != 0)
        {
          v4 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

id getAVAudioSessionClass()
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
  v0 = (void *)getAVAudioSessionClass_softClass;
  v7 = getAVAudioSessionClass_softClass;
  if (!getAVAudioSessionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAVAudioSessionClass_block_invoke;
    v3[3] = &unk_1E61D36B0;
    v3[4] = &v4;
    __getAVAudioSessionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0B43CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MNDeviceSpeakerIsInUse()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  _QWORD *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentRoute");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "outputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "portType");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        v17 = &v16;
        v18 = 0x2020000000;
        v8 = (_QWORD *)getAVAudioSessionPortBuiltInSpeakerSymbolLoc_ptr;
        v19 = getAVAudioSessionPortBuiltInSpeakerSymbolLoc_ptr;
        if (!getAVAudioSessionPortBuiltInSpeakerSymbolLoc_ptr)
        {
          v9 = (void *)AVFoundationLibrary();
          v8 = dlsym(v9, "AVAudioSessionPortBuiltInSpeaker");
          v17[3] = (uint64_t)v8;
          getAVAudioSessionPortBuiltInSpeakerSymbolLoc_ptr = (uint64_t)v8;
        }
        _Block_object_dispose(&v16, 8);
        if (!v8)
        {
          dlerror();
          abort_report_np();
          __break(1u);
        }
        v10 = objc_msgSend(v7, "isEqualToString:", *v8);

        if ((v10 & 1) != 0)
        {
          v4 = 1;
          goto LABEL_14;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_14:

  return v4;
}

void sub_1B0B43E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAVAudioSessionClass_block_invoke(uint64_t a1)
{
  Class result;

  AVFoundationLibrary();
  result = objc_getClass("AVAudioSession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVAudioSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)AVFoundationLibrary();
  }
  return result;
}

uint64_t AVFoundationLibrary()
{
  uint64_t v0;
  void *v2;

  if (AVFoundationLibraryCore_frameworkLibrary)
    return AVFoundationLibraryCore_frameworkLibrary;
  AVFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AVFoundationLibraryCore_frameworkLibrary;
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id GetAudioLogForMNUserOptionsEngineCategory()
{
  if (qword_1ED0C3FA0 != -1)
    dispatch_once(&qword_1ED0C3FA0, &__block_literal_global_81);
  return (id)qword_1ED0C3F98;
}

void sub_1B0B44FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_1B0B45864(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id MNGetMNRouteLoggingLog()
{
  if (qword_1ED0C3FB0 != -1)
    dispatch_once(&qword_1ED0C3FB0, &__block_literal_global_23);
  return (id)_MergedGlobals_31;
}

id _MNLocalizedStringFromThisBundle(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  v2 = a1;
  objc_msgSend(v1, "_navigationBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_navigation_localizedStringForKey:value:table:", v2, CFSTR("<unlocalized>"), CFSTR("Navigation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _MNStringFromSpokenLocalization(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  +[MNUserOptionsEngine sharedInstance](MNUserOptionsEngine, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1B0B473D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B475AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B0B47670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MNTurnByTurnLocationTracker;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1B0B4773C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B0B47798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0B4783C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B0B478A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0B47964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0B47AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B0B47C20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B47E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0B47E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0B48440(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B485B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0B48824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1B0B48940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B0B48A64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B48E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0B48F3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B49400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B0B4967C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B4993C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0B49B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B0B49BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0B49CBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B49F3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B4A6B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11)
{
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

void sub_1B0B4A870(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B0B4AB88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B4B1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *a24)
{
  void *v24;
  void *v25;

  if (v25)
    operator delete(v25);

  _Unwind_Resume(a1);
}

void sub_1B0B4B648(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0B4B96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B0B4BD34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1B0B4BF4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B0B4C1BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0B4C870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B0B4CAFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v18 = v16;

  _Unwind_Resume(a1);
}

void sub_1B0B4CC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B0B4CE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B0B4D65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1B0B4D958(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B4D9D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B0B4DDEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1B0B4DFC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0B4E0C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B0B4E6A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B4E880(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0B4E980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B0B4E9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0B4EE48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B0B4EFA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B4F4BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0B4F7B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0B4FC00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B0B4FE54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B50094(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B0B50164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B0B502BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0B504F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B0B50700(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B507FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B0B50870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0B509CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B50BAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0B50E90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B50F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0B50FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B0B51018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0B511C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B0B5129C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B0B51504(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B0B51998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1B0B51C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E61CF468, MEMORY[0x1E0DE42D0]);
}

void sub_1B0B51CEC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CLMapsRouteHint>>(unint64_t a1)
{
  if (a1 >= 0x666666666666667)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(40 * a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void sub_1B0B56924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void _currentLocaleChanged()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("MNLocaleDidChangeNotification"), 0);

}

void sub_1B0B580D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B5824C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B582A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B582F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B58458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B0B585D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B58AE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B0B5929C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22)
{
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1B0B59450(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B594D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B59934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1B0B59B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B0B59DDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B5A078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0B5A1AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B0B5A338(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B5A42C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B0B5A4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void *NavigationConfig_GetUserDefaultStringKeysForWatchSync()
{
  return &unk_1E620F990;
}

uint64_t NavigationConfig_GetConfigStoreStringKeysForWatchSync()
{
  return MEMORY[0x1E0C9AA60];
}

void *_getConfigStoreStringKeysForStateCapture()
{
  return &unk_1E620F9A8;
}

void sub_1B0B5B988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B0B5BC58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B0B5BFC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B0B5C05C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B0B5C350(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak((id *)(v5 - 72));

  _Unwind_Resume(a1);
}

void sub_1B0B5C550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0B5C654(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B5C6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MNRouteGeniusRemoteService;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B0B5C920(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B5C990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0B5CA54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B5CCBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B5CD2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0B5CE70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  id *v14;
  void *v15;

  objc_destroyWeak(v14);

  _Unwind_Resume(a1);
}

void sub_1B0B5CFAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B5D110(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B0B5D1F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B5D3E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B5D994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void MNRunSynchronouslyOnMainThread(void *a1)
{
  void *v1;
  void (**block)(void);

  v1 = (void *)MEMORY[0x1E0CB3978];
  block = a1;
  if (objc_msgSend(v1, "isMainThread"))
    block[2]();
  else
    dispatch_sync(MEMORY[0x1E0C80D38], block);

}

void MNRunAsynchronouslyOnMainThread(void *a1)
{
  void *v1;
  void (**block)(void);

  v1 = (void *)MEMORY[0x1E0CB3978];
  block = a1;
  if (objc_msgSend(v1, "isMainThread"))
    block[2]();
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

BOOL CLCoordinateEqualToCoordinateEpsilon(double a1, double a2, double a3, double a4, double a5)
{
  _BOOL4 v5;

  v5 = vabdd_f64(a1, a3) < a5;
  return vabdd_f64(a2, a4) < a5 && v5;
}

id MNInstructionsShortPromptTypeToString(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[5];
  _QWORD v34[7];

  v34[5] = *MEMORY[0x1E0C80C00];
  v33[0] = &unk_1E620F5D8;
  v33[1] = &unk_1E620F5F0;
  v34[0] = CFSTR("Continuation");
  v34[1] = CFSTR("General Maneuver");
  v33[2] = &unk_1E620F608;
  v33[3] = &unk_1E620F620;
  v34[2] = CFSTR("Start");
  v34[3] = CFSTR("Arrival");
  v33[4] = &unk_1E620F638;
  v34[4] = CFSTR("Started Walking");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = &unk_1E620F650;
  v31[1] = &unk_1E620F668;
  v32[0] = CFSTR("Direction (Left)");
  v32[1] = CFSTR("Direction (Right)");
  v31[2] = &unk_1E620F680;
  v32[2] = CFSTR("Must Not Replace Speech");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v2, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((a1 & 0xF) == objc_msgSend(v10, "unsignedIntegerValue"))
        {
          objc_msgSend(v2, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        if ((objc_msgSend(v17, "unsignedIntegerValue") & ~a1) == 0)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v18);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("|"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t MNInstructionsCalculateDistanceUnits(int a1, int a2, uint64_t a3, double a4)
{
  return MNInstructionsCalculateScaledDistanceUnits(a1, a2, a3, 1, a4);
}

uint64_t MNInstructionsCalculateScaledDistanceUnits(int a1, int a2, uint64_t a3, int a4, double a5)
{
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v19;
  double v20;
  double v22;
  uint64_t v25;
  double v26;
  uint64_t v27;

  if (a1)
  {
    if (a5 >= 1000.0)
      goto LABEL_58;
    if (a5 <= 500.0 || a3 == 2)
    {
      v6 = floor(a5);
      v7 = round(a5 / 5.0) * 5.0;
      if (a5 <= 5.0)
        v7 = v6;
      v8 = round(a5 / 10.0);
      v9 = a5 <= 30.0 || a3 == 2;
      v10 = v9 ? v7 : v8 * 10.0;
      v11 = round(a5 / 50.0);
      v12 = a5 <= 100.0 || a3 == 2;
      v26 = v12 ? v10 : v11 * 50.0;
    }
    else
    {
      v26 = round(a5 / 100.0) * 100.0;
    }
    if (v26 >= 1000.0)
LABEL_58:
      v27 = 1;
    else
      v27 = 0;
    if (a4)
      return v27;
    else
      return 0;
  }
  else
  {
    v13 = a5 * 0.000621371192;
    v14 = a5 * 3.2808399;
    if (!a2)
    {
      v15 = floor(v14 / 5.0) * 5.0;
      v16 = round(v14 / 10.0);
      if (v14 > 30.0)
        v15 = v16 * 10.0;
      v17 = round(v14 / 50.0);
      if (v14 <= 100.0 || a3 == 2)
        v19 = v15;
      else
        v19 = v17 * 50.0;
      v20 = round(v14 / 100.0);
      if (v14 <= 500.0 || a3 == 2)
        v14 = v19;
      else
        v14 = v20 * 100.0;
    }
    v22 = 0.1;
    if (v13 > 0.1 && a3 != 1)
    {
      if (v13 < 1.0 && a3 == 2)
        v22 = 0.05;
      v13 = round(v13 / v22) * v22;
    }
    if (v14 >= 1000.0)
    {
      if (a3 == 1 && v13 < 0.875)
      {
        v25 = 5;
        if (v13 < 0.625)
          v25 = 5;
      }
      else
      {
        v25 = 4;
      }
    }
    else if (a2)
    {
      v25 = 2;
    }
    else
    {
      v25 = 3;
    }
    if (a4)
      return v25;
    else
      return 3;
  }
}

uint64_t MNInstructionsShortPromptTypeForManeuver(uint64_t result, int a2)
{
  BOOL v2;
  uint64_t v3;
  uint64_t v4;

  result = result;
  switch((int)result)
  {
    case 0:
      return result;
    case 1:
    case 20:
    case 27:
    case 29:
    case 60:
    case 62:
      return 18;
    case 2:
    case 21:
    case 28:
    case 30:
    case 61:
    case 63:
      return 34;
    case 3:
    case 5:
      return 1;
    case 4:
    case 26:
    case 35:
      v2 = a2 == 1;
      v3 = 18;
      v4 = 34;
      goto LABEL_3;
    case 11:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
      v2 = a2 == 1;
      v3 = 34;
      v4 = 18;
      goto LABEL_3;
    case 16:
    case 18:
    case 39:
      return 4;
    case 17:
      return 3;
    case 25:
      v2 = a2 == 1;
      v3 = 19;
      v4 = 35;
LABEL_3:
      if (v2)
        result = v4;
      else
        result = v3;
      break;
    case 33:
      result = 20;
      break;
    case 34:
      result = 36;
      break;
    default:
      result = 2;
      break;
  }
  return result;
}

id MNInstructionsLocalizedMetricUnits()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[10];

  v26[8] = *MEMORY[0x1E0C80C00];
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: m"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v17;
  v25[1] = &unk_1E620F698;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: m(s)"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  v24[1] = &unk_1E620F698;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v14;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: meter"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = &unk_1E620F698;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v12;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: meters"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  v22[1] = &unk_1E620F698;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v0;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: km"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v1;
  v21[1] = &unk_1E620F6B0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v2;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: km(s)"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_1E620F6B0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v4;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: kilometer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  v19[1] = &unk_1E620F6B0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v6;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: kilometers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v18[1] = &unk_1E620F6B0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id MNInstructionsLocalizedImperialUnits()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[14];

  v38[12] = *MEMORY[0x1E0C80C00];
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: yd"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v25;
  v37[1] = &unk_1E620F6C8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v24;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: yd(s)"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v23;
  v36[1] = &unk_1E620F6C8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v22;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: yard"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v21;
  v35[1] = &unk_1E620F6C8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v20;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: yards"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v19;
  v34[1] = &unk_1E620F6C8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v18;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: ft"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v17;
  v33[1] = &unk_1E620F6E0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v16;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: ft(s)"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v15;
  v32[1] = &unk_1E620F6E0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v14;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: foot"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v13;
  v31[1] = &unk_1E620F6E0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[6] = v12;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: feet(s)"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v11;
  v30[1] = &unk_1E620F6E0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v38[7] = v0;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: mi"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v1;
  v29[1] = &unk_1E620F6F8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v38[8] = v2;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: mi(s)"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v3;
  v28[1] = &unk_1E620F6F8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38[9] = v4;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: mile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v5;
  v27[1] = &unk_1E620F6F8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[10] = v6;
  _MNLocalizedStringFromThisBundle(CFSTR("distance parsing: miles"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v7;
  v26[1] = &unk_1E620F6F8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38[11] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

double MNInstructionsDistanceTypeConvertToMeters(uint64_t a1, double result)
{
  double v2;

  switch(a1)
  {
    case 1:
      return result * 1000.0;
    case 2:
      v2 = 1.0936133;
      goto LABEL_7;
    case 3:
      v2 = 3.2808399;
      goto LABEL_7;
    case 4:
      goto LABEL_6;
    case 5:
      result = result * 4.0;
LABEL_6:
      v2 = 0.000621371192;
LABEL_7:
      result = result / v2;
      break;
    default:
      return result;
  }
  return result;
}

void sub_1B0B618B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0B62400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1B0B62E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0B64B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0B65254(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B654F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B6577C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B0B658F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B65B84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B0B65D90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B0B660DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B0B66990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, _QWORD *a20)
{
  void *v20;
  void *v21;

  std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::destroy(a20);
  _Unwind_Resume(a1);
}

id MNGetMNRouteDivergenceLog(void)
{
  if (qword_1ED0C4030 != -1)
    dispatch_once(&qword_1ED0C4030, &__block_literal_global_243);
  return (id)_MergedGlobals_36;
}

void sub_1B0B67944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,void **a49)
{
  void *v49;
  void *v50;

  a49 = (void **)&a46;
  std::vector<std::vector<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::__destroy_vector::operator()[abi:ne180100](&a49);

  _Unwind_Resume(a1);
}

void sub_1B0B68C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,_QWORD *a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,void **a59)
{
  void *v59;

  std::__tree<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,std::__map_value_compare<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKeyCompare,false>,std::allocator<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>>>::destroy(a50);
  a59 = (void **)&a53;
  std::vector<std::map<geo::PolylineCoordinate,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionEndpoint>>>::__destroy_vector::operator()[abi:ne180100](&a59);

  _Unwind_Resume(a1);
}

void sub_1B0B695EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21)
{
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  _Unwind_Resume(a1);
}

void sub_1B0B69790(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B69CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,void *a21)
{

  _Unwind_Resume(a1);
}

void sub_1B0B6A6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::~__hash_table((uint64_t)&a25);
  std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::~__hash_table((uint64_t)&a31);
  std::deque<_MNRouteConvergencePoint>::~deque[abi:ne180100](v31 - 208);

  _Unwind_Resume(a1);
}

void sub_1B0B6AB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, id a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

__n128 std::deque<_MNRouteConvergencePoint>::emplace_back<_MNRouteConvergencePoint&>(_QWORD *a1, uint64_t a2)
{
  char *v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int64_t v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  unint64_t v49;
  __int128 v50;
  __n128 result;
  __int128 v52;
  __int128 v53;
  unint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  int64_t v75;
  void *v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t i;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  unint64_t v87;
  char *v88;
  uint64_t v89;
  char *v90;
  BOOL v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  char *v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  char *v108;

  v4 = (char *)a1[1];
  v5 = (char *)a1[2];
  v6 = (v5 - v4) >> 3;
  if (v5 == v4)
    v7 = 0;
  else
    v7 = 42 * v6 - 1;
  v8 = a1[4];
  v9 = a1[5] + v8;
  if (v7 == v9)
  {
    if (v8 < 0x2A)
    {
      v23 = (char *)a1[3];
      v24 = (char *)*a1;
      v25 = (uint64_t)&v23[-*a1];
      if (v6 >= v25 >> 3)
      {
        v28 = v25 >> 2;
        if (v23 == v24)
          v29 = 1;
        else
          v29 = v28;
        v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_MNRouteConvergencePoint *>>(v29);
        v32 = v31;
        v33 = operator new(0xFC0uLL);
        v34 = &v30[8 * v6];
        v35 = &v30[8 * v32];
        if (v6 == v32)
        {
          v36 = 8 * v6;
          if (v5 - v4 < 1)
          {
            v76 = v33;
            v77 = v36 >> 2;
            if (v5 == v4)
              v78 = 1;
            else
              v78 = v77;
            v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_MNRouteConvergencePoint *>>(v78);
            v34 = &v79[8 * (v78 >> 2)];
            v35 = &v79[8 * v80];
            if (v30)
              operator delete(v30);
            v30 = v79;
            v33 = v76;
          }
          else
          {
            v37 = v36 >> 3;
            if (v37 >= -1)
              v38 = v37 + 1;
            else
              v38 = v37 + 2;
            v34 -= 8 * (v38 >> 1);
          }
        }
        *(_QWORD *)v34 = v33;
        v81 = v34 + 8;
        for (i = a1[2]; i != a1[1]; i -= 8)
        {
          if (v34 == v30)
          {
            if (v81 >= v35)
            {
              if (v35 == v30)
                v87 = 1;
              else
                v87 = (v35 - v30) >> 2;
              v88 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_MNRouteConvergencePoint *>>(v87);
              v90 = v88;
              v34 = &v88[(2 * v87 + 6) & 0xFFFFFFFFFFFFFFF8];
              v92 = v81 - v30;
              v91 = v81 == v30;
              v81 = v34;
              if (!v91)
              {
                v81 = &v34[v92 & 0xFFFFFFFFFFFFFFF8];
                v93 = 8 * (v92 >> 3);
                v94 = v34;
                v95 = (uint64_t *)v30;
                do
                {
                  v96 = *v95++;
                  *(_QWORD *)v94 = v96;
                  v94 += 8;
                  v93 -= 8;
                }
                while (v93);
              }
              v35 = &v88[8 * v89];
              if (v30)
                operator delete(v30);
              v30 = v90;
            }
            else
            {
              v83 = (v35 - v81) >> 3;
              if (v83 >= -1)
                v84 = v83 + 1;
              else
                v84 = v83 + 2;
              v85 = v84 >> 1;
              v34 = &v30[8 * (v84 >> 1)];
              v86 = v30;
              if (v81 != v30)
              {
                memmove(v34, v30, v81 - v30);
                v86 = v81;
              }
              v81 = &v86[8 * v85];
            }
          }
          v97 = *(_QWORD *)(i - 8);
          *((_QWORD *)v34 - 1) = v97;
          v34 -= 8;
        }
        v98 = (char *)*a1;
        *a1 = v30;
        a1[1] = v34;
        a1[2] = v81;
        a1[3] = v35;
        if (v98)
          operator delete(v98);
        goto LABEL_36;
      }
      v26 = operator new(0xFC0uLL);
      v27 = v26;
      if (v23 == v5)
      {
        if (v4 == v24)
        {
          if (v5 == v4)
            v54 = 1;
          else
            v54 = (v23 - v4) >> 2;
          v55 = 2 * v54;
          v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_MNRouteConvergencePoint *>>(v54);
          v4 = &v56[(v55 + 6) & 0xFFFFFFFFFFFFFFF8];
          v58 = (uint64_t *)a1[1];
          v59 = v4;
          v60 = a1[2] - (_QWORD)v58;
          if (v60)
          {
            v59 = &v4[v60 & 0xFFFFFFFFFFFFFFF8];
            v61 = 8 * (v60 >> 3);
            v62 = &v56[(v55 + 6) & 0xFFFFFFFFFFFFFFF8];
            do
            {
              v63 = *v58++;
              *(_QWORD *)v62 = v63;
              v62 += 8;
              v61 -= 8;
            }
            while (v61);
          }
          v64 = (char *)*a1;
          *a1 = v56;
          a1[1] = v4;
          a1[2] = v59;
          a1[3] = &v56[8 * v57];
          if (v64)
          {
            operator delete(v64);
            v4 = (char *)a1[1];
          }
        }
        *((_QWORD *)v4 - 1) = v27;
        v65 = (char *)a1[1];
        v66 = (char *)a1[2];
        a1[1] = v65 - 8;
        v67 = *((_QWORD *)v65 - 1);
        a1[1] = v65;
        if (v66 == (char *)a1[3])
        {
          v68 = (uint64_t)&v65[-*a1];
          if ((unint64_t)v65 <= *a1)
          {
            if (v66 == (char *)*a1)
              v99 = 1;
            else
              v99 = (uint64_t)&v66[-*a1] >> 2;
            v100 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_MNRouteConvergencePoint *>>(v99);
            v102 = &v100[8 * (v99 >> 2)];
            v103 = (uint64_t *)a1[1];
            v66 = v102;
            v104 = a1[2] - (_QWORD)v103;
            if (v104)
            {
              v66 = &v102[v104 & 0xFFFFFFFFFFFFFFF8];
              v105 = 8 * (v104 >> 3);
              v106 = &v100[8 * (v99 >> 2)];
              do
              {
                v107 = *v103++;
                *(_QWORD *)v106 = v107;
                v106 += 8;
                v105 -= 8;
              }
              while (v105);
            }
            v108 = (char *)*a1;
            *a1 = v100;
            a1[1] = v102;
            a1[2] = v66;
            a1[3] = &v100[8 * v101];
            if (v108)
            {
              operator delete(v108);
              v66 = (char *)a1[2];
            }
          }
          else
          {
            v69 = v68 >> 3;
            v15 = v68 >> 3 < -1;
            v70 = (v68 >> 3) + 2;
            if (v15)
              v71 = v70;
            else
              v71 = v69 + 1;
            v72 = -(v71 >> 1);
            v73 = v71 >> 1;
            v74 = &v65[-8 * v73];
            v75 = v66 - v65;
            if (v66 != v65)
            {
              memmove(&v65[-8 * v73], v65, v66 - v65);
              v65 = (char *)a1[1];
            }
            v66 = &v74[v75];
            a1[1] = &v65[8 * v72];
            a1[2] = &v74[v75];
          }
        }
        *(_QWORD *)v66 = v67;
      }
      else
      {
        *(_QWORD *)v5 = v26;
      }
    }
    else
    {
      a1[4] = v8 - 42;
      v12 = *(_QWORD *)v4;
      v10 = v4 + 8;
      v11 = v12;
      a1[1] = v10;
      if (v5 == (char *)a1[3])
      {
        v13 = (uint64_t)&v10[-*a1];
        if ((unint64_t)v10 <= *a1)
        {
          if (v5 == (char *)*a1)
            v39 = 1;
          else
            v39 = (uint64_t)&v5[-*a1] >> 2;
          v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_MNRouteConvergencePoint *>>(v39);
          v42 = &v40[8 * (v39 >> 2)];
          v43 = (uint64_t *)a1[1];
          v5 = v42;
          v44 = a1[2] - (_QWORD)v43;
          if (v44)
          {
            v5 = &v42[v44 & 0xFFFFFFFFFFFFFFF8];
            v45 = 8 * (v44 >> 3);
            v46 = &v40[8 * (v39 >> 2)];
            do
            {
              v47 = *v43++;
              *(_QWORD *)v46 = v47;
              v46 += 8;
              v45 -= 8;
            }
            while (v45);
          }
          v48 = (char *)*a1;
          *a1 = v40;
          a1[1] = v42;
          a1[2] = v5;
          a1[3] = &v40[8 * v41];
          if (v48)
          {
            operator delete(v48);
            v5 = (char *)a1[2];
          }
        }
        else
        {
          v14 = v13 >> 3;
          v15 = v13 >> 3 < -1;
          v16 = (v13 >> 3) + 2;
          if (v15)
            v17 = v16;
          else
            v17 = v14 + 1;
          v18 = -(v17 >> 1);
          v19 = v17 >> 1;
          v20 = &v10[-8 * v19];
          v21 = v5 - v10;
          if (v5 != v10)
          {
            memmove(&v10[-8 * v19], v10, v5 - v10);
            v5 = (char *)a1[1];
          }
          v22 = &v5[8 * v18];
          v5 = &v20[v21];
          a1[1] = v22;
          a1[2] = &v20[v21];
        }
      }
      *(_QWORD *)v5 = v11;
    }
    a1[2] += 8;
LABEL_36:
    v4 = (char *)a1[1];
    v9 = a1[5] + a1[4];
  }
  v49 = *(_QWORD *)&v4[8 * (v9 / 0x2A)] + 96 * (v9 % 0x2A);
  v50 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v49 = *(_OWORD *)a2;
  *(_OWORD *)(v49 + 16) = v50;
  result = *(__n128 *)(a2 + 32);
  v52 = *(_OWORD *)(a2 + 48);
  v53 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v49 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v49 + 80) = v53;
  *(__n128 *)(v49 + 32) = result;
  *(_OWORD *)(v49 + 48) = v52;
  ++a1[5];
  return result;
}

void sub_1B0B6B0DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v2);
  if (v1)
    operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1B0B6B80C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B0B6BAD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B6BBF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B6BCE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B6BD34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B6BE70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;

  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void sub_1B0B6BF58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0B6BFDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B6C060(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B6C130(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B6C244(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B6C2F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B0B6C450(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B0B6C7C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B0B6C998(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B6CABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;

  _Block_object_dispose(&a17, 8);

  _Unwind_Resume(a1);
}

void sub_1B0B6CB88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B0B6CBF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B6CC7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B0B6CD58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B0B6CDC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ___ZL25MNGetMNRouteDivergenceLogv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation", "MNRouteDivergence");
  v1 = (void *)_MergedGlobals_36;
  _MergedGlobals_36 = (uint64_t)v0;

}

void std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::destroy(*a1);
    std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::destroy(a1[1]);

    operator delete(a1);
  }
}

char *std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::__emplace_unique_key_args<geo::PolylineCoordinate,geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>(uint64_t **a1, unsigned int a2, uint64_t a3, __int128 *a4, float a5)
{
  char *v8;
  uint64_t **v9;
  char *v10;
  unsigned int v11;
  float v12;
  char *v13;
  __int128 v14;
  uint64_t *v15;
  uint64_t *v16;

  v9 = a1 + 1;
  v8 = (char *)a1[1];
  if (!v8)
  {
    v10 = (char *)(a1 + 1);
    goto LABEL_13;
  }
  do
  {
    while (1)
    {
      v10 = v8;
      v11 = *((_DWORD *)v8 + 8);
      if (v11 <= a2)
        break;
LABEL_5:
      v8 = *(char **)v10;
      v9 = (uint64_t **)v10;
      if (!*(_QWORD *)v10)
        goto LABEL_13;
    }
    if (v11 == a2)
    {
      v12 = *((float *)v10 + 9);
      if (v12 > a5)
        goto LABEL_5;
      if (v12 >= a5)
        return v10;
    }
    else if (v11 >= a2)
    {
      return v10;
    }
    v8 = (char *)*((_QWORD *)v10 + 1);
  }
  while (v8);
  v9 = (uint64_t **)(v10 + 8);
LABEL_13:
  v13 = v10;
  v10 = (char *)operator new(0x38uLL);
  *((_QWORD *)v10 + 4) = a3;
  v14 = *a4;
  *a4 = 0u;
  *(_OWORD *)(v10 + 40) = v14;
  *(_OWORD *)v10 = 0u;
  *((_QWORD *)v10 + 2) = v13;
  *v9 = (uint64_t *)v10;
  v15 = (uint64_t *)**a1;
  v16 = (uint64_t *)v10;
  if (v15)
  {
    *a1 = v15;
    v16 = *v9;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v16);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return v10;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

LABEL_1:
  v9 = &a2[-2].n128_u32[2];
  i = a1;
  while (2)
  {
    a1 = i;
    v11 = (uint64_t)a2 - i;
    v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)a2 - i) >> 3);
    switch(v12)
    {
      case 0:
      case 1:
        return a5.n128_f32[0];
      case 2:
        v52 = (__n128 *)((char *)a2 - 24);
        v53 = a2[-2].n128_u32[2];
        if (v53 < *(_DWORD *)i
          || v53 == *(_DWORD *)i && (a5.n128_u32[0] = a2[-2].n128_u32[3], a5.n128_f32[0] < *(float *)(i + 4)))
        {
          v130 = *(_QWORD *)(i + 16);
          v121 = *(__n128 *)i;
          a5 = *v52;
          *(_BYTE *)(i + 16) = a2[-1].n128_u8[8];
          *(__n128 *)i = a5;
          a5.n128_u32[0] = v121.n128_u32[0];
          a2[-1].n128_u8[8] = v130;
          *v52 = v121;
        }
        return a5.n128_f32[0];
      case 3:
        a5.n128_f32[0] = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)i, (__n128 *)(i + 24), (__n128 *)((char *)a2 - 24), a5);
        return a5.n128_f32[0];
      case 4:
        a5.n128_f32[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)i, (__n128 *)(i + 24), (__n128 *)(i + 48), (__n128 *)((char *)a2 - 24), a5);
        return a5.n128_f32[0];
      case 5:
        v54 = (__n128 *)(i + 24);
        v55 = (__n128 *)(i + 48);
        v56 = (__n128 *)(i + 72);
        a5.n128_f32[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)i, (__n128 *)(i + 24), (__n128 *)(i + 48), (__n128 *)(i + 72), a5);
        v57 = (__n128 *)((char *)a2 - 24);
        v58 = a2[-2].n128_u32[2];
        v59 = *(_DWORD *)(i + 72);
        if (v58 < v59 || v58 == v59 && (a5.n128_u32[0] = a2[-2].n128_u32[3], a5.n128_f32[0] < *(float *)(i + 76)))
        {
          a5 = *v56;
          v60 = *(_QWORD *)(i + 88);
          v61 = a2[-1].n128_u8[8];
          *v56 = *v57;
          *(_BYTE *)(i + 88) = v61;
          a2[-1].n128_u8[8] = v60;
          *v57 = a5;
          if (v56->n128_u32[0] < v55->n128_u32[0]
            || v56->n128_u32[0] == v55->n128_u32[0]
            && (a5.n128_u32[0] = *(_DWORD *)(i + 76), a5.n128_f32[0] < *(float *)(i + 52)))
          {
            v62 = *(_QWORD *)(i + 64);
            a5 = *v55;
            *v55 = *v56;
            *(_BYTE *)(i + 64) = *(_BYTE *)(i + 88);
            *v56 = a5;
            *(_BYTE *)(i + 88) = v62;
            if (v55->n128_u32[0] < v54->n128_u32[0]
              || v55->n128_u32[0] == v54->n128_u32[0]
              && (a5.n128_u32[0] = *(_DWORD *)(i + 52), a5.n128_f32[0] < *(float *)(i + 28)))
            {
              v63 = *(_QWORD *)(i + 40);
              a5 = *v54;
              *v54 = *v55;
              *(_BYTE *)(i + 40) = *(_BYTE *)(i + 64);
              *v55 = a5;
              *(_BYTE *)(i + 64) = v63;
              v64 = *(_DWORD *)(i + 24);
              if (v64 < *(_DWORD *)i
                || v64 == *(_DWORD *)i && (a5.n128_u32[0] = *(_DWORD *)(i + 28), a5.n128_f32[0] < *(float *)(i + 4)))
              {
                v131 = *(_QWORD *)(i + 16);
                v122 = *(__n128 *)i;
                *(__n128 *)i = *v54;
                *(_BYTE *)(i + 16) = *(_BYTE *)(i + 40);
                a5.n128_u32[0] = v122.n128_u32[0];
                *v54 = v122;
                *(_BYTE *)(i + 40) = v131;
              }
            }
          }
        }
        return a5.n128_f32[0];
      default:
        if (v11 <= 575)
        {
          v65 = (__n128 *)(i + 24);
          v67 = (__n128 *)i == a2 || v65 == a2;
          if ((a4 & 1) != 0)
          {
            if (v67)
              return a5.n128_f32[0];
            v68 = 0;
            v69 = i;
            while (1)
            {
              v70 = v69;
              v69 = (unint64_t)v65;
              v71 = *(_DWORD *)(v70 + 24);
              if (v71 < *(_DWORD *)v70)
                break;
              if (v71 == *(_DWORD *)v70)
              {
                a5.n128_u32[0] = *(_DWORD *)(v70 + 28);
                if (a5.n128_f32[0] < *(float *)(v70 + 4))
                  goto LABEL_106;
              }
LABEL_118:
              v65 = (__n128 *)(v69 + 24);
              v68 += 24;
              if ((__n128 *)(v69 + 24) == a2)
                return a5.n128_f32[0];
            }
            a5.n128_u32[0] = *(_DWORD *)(v70 + 28);
LABEL_106:
            v123 = *(_OWORD *)(v70 + 32);
            *(_BYTE *)(v69 + 16) = *(_BYTE *)(v70 + 16);
            *(_OWORD *)v69 = *(_OWORD *)v70;
            v72 = i;
            if (v70 != i)
            {
              v73 = v68;
              do
              {
                v74 = i + v73;
                v75 = *(_DWORD *)(i + v73 - 24);
                if (v71 >= v75)
                {
                  if (v71 != v75)
                  {
                    v72 = v70;
                    goto LABEL_117;
                  }
                  v72 = i + v73;
                  if (a5.n128_f32[0] >= *(float *)(i + v73 - 20))
                    goto LABEL_117;
                }
                v70 -= 24;
                *(_OWORD *)v74 = *(_OWORD *)(i + v73 - 24);
                *(_BYTE *)(v74 + 16) = *(_BYTE *)(i + v73 - 8);
                v73 -= 24;
              }
              while (v73);
              v72 = i;
            }
LABEL_117:
            *(_DWORD *)v72 = v71;
            *(_DWORD *)(v72 + 4) = a5.n128_u32[0];
            *(_QWORD *)(v72 + 8) = v123;
            *(_BYTE *)(v72 + 16) = BYTE8(v123);
            goto LABEL_118;
          }
          if (v67)
            return a5.n128_f32[0];
          while (1)
          {
            v109 = a1;
            a1 = (uint64_t)v65;
            v110 = *(_DWORD *)(v109 + 24);
            if (v110 < *(_DWORD *)v109)
              break;
            if (v110 == *(_DWORD *)v109)
            {
              a5.n128_u32[0] = *(_DWORD *)(v109 + 28);
              if (a5.n128_f32[0] < *(float *)(v109 + 4))
                goto LABEL_180;
            }
LABEL_188:
            v65 = (__n128 *)(a1 + 24);
            if ((__n128 *)(a1 + 24) == a2)
              return a5.n128_f32[0];
          }
          a5.n128_u32[0] = *(_DWORD *)(v109 + 28);
LABEL_180:
          v126 = *(_OWORD *)(v109 + 32);
          do
          {
            do
            {
              v111 = v109;
              *(_OWORD *)(v109 + 24) = *(_OWORD *)v109;
              *(_BYTE *)(v109 + 40) = *(_BYTE *)(v109 + 16);
              v112 = *(_DWORD *)(v109 - 24);
              v109 -= 24;
              v113 = v110 == v112;
            }
            while (v110 < v112);
          }
          while (v113 && a5.n128_f32[0] < *(float *)(v111 - 20));
          *(_DWORD *)v111 = v110;
          *(_DWORD *)(v111 + 4) = a5.n128_u32[0];
          *(_QWORD *)(v111 + 8) = v126;
          *(_BYTE *)(v111 + 16) = BYTE8(v126);
          goto LABEL_188;
        }
        if (!a3)
        {
          if ((__n128 *)i == a2)
            return a5.n128_f32[0];
          v76 = (unint64_t)(v12 - 2) >> 1;
          v77 = v76;
          while (1)
          {
            v78 = v77;
            if (v76 >= v77)
            {
              v79 = (2 * v77) | 1;
              v80 = i + 24 * v79;
              if (2 * v78 + 2 < v12)
              {
                v81 = *(_DWORD *)(v80 + 24);
                if (*(_DWORD *)v80 < v81 || *(_DWORD *)v80 == v81 && *(float *)(v80 + 4) < *(float *)(v80 + 28))
                {
                  v80 += 24;
                  v79 = 2 * v78 + 2;
                }
              }
              v82 = i + 24 * v78;
              v83 = *(_DWORD *)v82;
              if (*(_DWORD *)v80 >= *(_DWORD *)v82)
              {
                if (*(_DWORD *)v80 != v83)
                {
                  v84 = *(float *)(v82 + 4);
LABEL_132:
                  v124 = *(_OWORD *)(v82 + 8);
                  v85 = *(_OWORD *)v80;
                  *(_BYTE *)(v82 + 16) = *(_BYTE *)(v80 + 16);
                  *(_OWORD *)v82 = v85;
                  if (v76 >= v79)
                  {
                    while (1)
                    {
                      v87 = 2 * v79;
                      v79 = (2 * v79) | 1;
                      v86 = i + 24 * v79;
                      v88 = v87 + 2;
                      if (v88 < v12)
                      {
                        v89 = *(_DWORD *)(v86 + 24);
                        if (*(_DWORD *)v86 < v89 || *(_DWORD *)v86 == v89 && *(float *)(v86 + 4) < *(float *)(v86 + 28))
                        {
                          v86 += 24;
                          v79 = v88;
                        }
                      }
                      if (*(_DWORD *)v86 < v83 || *(_DWORD *)v86 == v83 && *(float *)(v86 + 4) < v84)
                        break;
                      v90 = *(_OWORD *)v86;
                      *(_BYTE *)(v80 + 16) = *(_BYTE *)(v86 + 16);
                      *(_OWORD *)v80 = v90;
                      v80 = v86;
                      if (v76 < v79)
                        goto LABEL_134;
                    }
                  }
                  v86 = v80;
LABEL_134:
                  *(_DWORD *)v86 = v83;
                  *(float *)(v86 + 4) = v84;
                  *(_QWORD *)(v86 + 8) = v124;
                  *(_BYTE *)(v86 + 16) = BYTE8(v124);
                  goto LABEL_135;
                }
                v84 = *(float *)(v82 + 4);
                if (*(float *)(v80 + 4) >= v84)
                  goto LABEL_132;
              }
            }
LABEL_135:
            v77 = v78 - 1;
            if (!v78)
            {
              v91 = v11 / 0x18uLL;
              while (1)
              {
                v92 = 0;
                v132 = *(_QWORD *)(i + 16);
                v125 = *(__n128 *)i;
                v93 = i;
                do
                {
                  v94 = v93;
                  v93 += 24 * v92 + 24;
                  v95 = 2 * v92;
                  v92 = (2 * v92) | 1;
                  v96 = v95 + 2;
                  if (v96 < v91)
                  {
                    v97 = *(_DWORD *)(v93 + 24);
                    if (*(_DWORD *)v93 < v97 || *(_DWORD *)v93 == v97 && *(float *)(v93 + 4) < *(float *)(v93 + 28))
                    {
                      v93 += 24;
                      v92 = v96;
                    }
                  }
                  v98 = *(_OWORD *)v93;
                  *(_BYTE *)(v94 + 16) = *(_BYTE *)(v93 + 16);
                  *(_OWORD *)v94 = v98;
                }
                while (v92 <= (uint64_t)((unint64_t)(v91 - 2) >> 1));
                a2 = (__n128 *)((char *)a2 - 24);
                if ((__n128 *)v93 == a2)
                {
                  a5.n128_u32[0] = v125.n128_u32[0];
                  *(_BYTE *)(v93 + 16) = v132;
                  *(__n128 *)v93 = v125;
                }
                else
                {
                  a5 = *a2;
                  *(_BYTE *)(v93 + 16) = a2[1].n128_u8[0];
                  *(__n128 *)v93 = a5;
                  a5.n128_u32[0] = v125.n128_u32[0];
                  a2[1].n128_u8[0] = v132;
                  *a2 = v125;
                  v99 = v93 - i + 24;
                  if (v99 >= 25)
                  {
                    v100 = v99 / 0x18uLL - 2;
                    v101 = v100 >> 1;
                    v102 = i + 24 * (v100 >> 1);
                    v103 = *(_DWORD *)v93;
                    if (*(_DWORD *)v102 < *(_DWORD *)v93)
                    {
                      a5.n128_u32[0] = *(_DWORD *)(v93 + 4);
LABEL_161:
                      v117 = *(_OWORD *)(v93 + 8);
                      v104 = *(_OWORD *)v102;
                      *(_BYTE *)(v93 + 16) = *(_BYTE *)(v102 + 16);
                      *(_OWORD *)v93 = v104;
                      if (v100 >= 2)
                      {
                        while (1)
                        {
                          v106 = v101 - 1;
                          v101 = (v101 - 1) >> 1;
                          v105 = i + 24 * v101;
                          if (*(_DWORD *)v105 >= v103
                            && (*(_DWORD *)v105 != v103 || *(float *)(v105 + 4) >= a5.n128_f32[0]))
                          {
                            break;
                          }
                          v107 = *(_OWORD *)v105;
                          *(_BYTE *)(v102 + 16) = *(_BYTE *)(v105 + 16);
                          *(_OWORD *)v102 = v107;
                          v102 = i + 24 * v101;
                          if (v106 <= 1)
                            goto LABEL_167;
                        }
                      }
                      v105 = v102;
LABEL_167:
                      *(_DWORD *)v105 = v103;
                      *(_DWORD *)(v105 + 4) = a5.n128_u32[0];
                      *(_QWORD *)(v105 + 8) = v117;
                      *(_BYTE *)(v105 + 16) = BYTE8(v117);
                      goto LABEL_168;
                    }
                    if (*(_DWORD *)v102 == v103)
                    {
                      a5.n128_u32[0] = *(_DWORD *)(v93 + 4);
                      if (*(float *)(v102 + 4) < a5.n128_f32[0])
                        goto LABEL_161;
                    }
                  }
                }
LABEL_168:
                if (v91-- <= 2)
                  return a5.n128_f32[0];
              }
            }
          }
        }
        v13 = (unint64_t)v12 >> 1;
        v14 = (__n128 *)(i + 24 * ((unint64_t)v12 >> 1));
        if ((unint64_t)v11 < 0xC01)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)(a1 + 24 * v13), (__n128 *)a1, (__n128 *)((char *)a2 - 24), a5);
        }
        else
        {
          v15.n128_f32[0] = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)a1, (__n128 *)(a1 + 24 * v13), (__n128 *)((char *)a2 - 24), a5);
          v16 = 3 * v13;
          v17 = (__n128 *)(a1 + 24 * v13 - 24);
          v18.n128_f32[0] = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)(a1 + 24), v17, a2 - 3, v15);
          v19 = (__n128 *)(a1 + 24 + 8 * v16);
          v20.n128_f32[0] = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)(a1 + 48), v19, (__n128 *)((char *)a2 - 72), v18);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>(v17, v14, v19, v20);
          v127 = *(_QWORD *)(a1 + 16);
          v118 = *(__n128 *)a1;
          v21 = v14[1].n128_u8[0];
          *(__n128 *)a1 = *v14;
          *(_BYTE *)(a1 + 16) = v21;
          a5 = v118;
          v14[1].n128_u8[0] = v127;
          *v14 = v118;
        }
        --a3;
        v22 = *(_DWORD *)a1;
        if ((a4 & 1) == 0)
        {
          v23 = *(_DWORD *)(a1 - 24);
          if (v23 >= v22)
          {
            if (v23 == v22)
            {
              a5.n128_u32[0] = *(_DWORD *)(a1 + 4);
              if (*(float *)(a1 - 20) < a5.n128_f32[0])
                goto LABEL_13;
            }
            else
            {
              a5.n128_u32[0] = *(_DWORD *)(a1 + 4);
            }
            v116 = *(_OWORD *)(a1 + 8);
            v41 = *v9;
            if (v22 < *v9 || v22 == v41 && a5.n128_f32[0] < a2[-2].n128_f32[3])
            {
              i = a1;
              do
              {
                v43 = *(_DWORD *)(i + 24);
                i += 24;
                v42 = v43;
              }
              while (v22 >= v43 && (v22 != v42 || a5.n128_f32[0] >= *(float *)(i + 4)));
            }
            else
            {
              for (i = a1 + 24;
                    i < (unint64_t)a2
                 && v22 >= *(_DWORD *)i
                 && (v22 != *(_DWORD *)i || a5.n128_f32[0] >= *(float *)(i + 4));
            }
            j = a2;
            if (i < (unint64_t)a2)
            {
              for (j = (__n128 *)((char *)a2 - 24);
                    v22 < v41 || v22 == v41 && a5.n128_f32[0] < j->n128_f32[1];
                    j = (__n128 *)((char *)j - 24))
              {
                v45 = j[-2].n128_u32[2];
                v41 = v45;
              }
            }
            while (i < (unint64_t)j)
            {
              v129 = *(_QWORD *)(i + 16);
              v120 = *(__n128 *)i;
              v46 = *j;
              *(_BYTE *)(i + 16) = j[1].n128_u8[0];
              *(__n128 *)i = v46;
              j[1].n128_u8[0] = v129;
              *j = v120;
              do
              {
                v48 = *(_DWORD *)(i + 24);
                i += 24;
                v47 = v48;
              }
              while (v22 >= v48 && (v22 != v47 || a5.n128_f32[0] >= *(float *)(i + 4)));
              do
              {
                do
                {
                  v49 = j[-2].n128_u32[2];
                  j = (__n128 *)((char *)j - 24);
                  v50 = v22 == v49;
                }
                while (v22 < v49);
              }
              while (v50 && a5.n128_f32[0] < j->n128_f32[1]);
            }
            if (i - 24 != a1)
            {
              v51 = *(_OWORD *)(i - 24);
              *(_BYTE *)(a1 + 16) = *(_BYTE *)(i - 8);
              *(_OWORD *)a1 = v51;
            }
            a4 = 0;
            *(_DWORD *)(i - 24) = v22;
            *(_DWORD *)(i - 20) = a5.n128_u32[0];
            *(_BYTE *)(i - 8) = BYTE8(v116);
            *(_QWORD *)(i - 16) = v116;
            continue;
          }
        }
LABEL_13:
        v24 = 0;
        a5.n128_u32[0] = *(_DWORD *)(a1 + 4);
        v115 = *(_OWORD *)(a1 + 8);
        while (1)
        {
          v25 = *(_DWORD *)(a1 + v24 + 24);
          if (v25 >= v22 && (v25 != v22 || *(float *)(a1 + v24 + 28) >= a5.n128_f32[0]))
            break;
          v24 += 24;
        }
        v26 = a1 + v24 + 24;
        if (v24)
        {
          v27 = *v9;
          for (k = (__n128 *)((char *)a2 - 24);
                v27 >= v22 && (v27 != v22 || k->n128_f32[1] >= a5.n128_f32[0]);
                k = (__n128 *)((char *)k - 24))
          {
            v29 = k[-2].n128_u32[2];
            v27 = v29;
          }
        }
        else
        {
          k = a2;
          if (v26 < (unint64_t)a2)
          {
            v30 = *v9;
            k = (__n128 *)((char *)a2 - 24);
            if (*v9 >= v22)
            {
              k = (__n128 *)((char *)a2 - 24);
              do
              {
                if (v30 == v22)
                {
                  if (v26 >= (unint64_t)k || k->n128_f32[1] < a5.n128_f32[0])
                    break;
                }
                else if (v26 >= (unint64_t)k)
                {
                  break;
                }
                v31 = k[-2].n128_u32[2];
                k = (__n128 *)((char *)k - 24);
                v30 = v31;
              }
              while (v31 >= v22);
            }
          }
        }
        i = v26;
        if (v26 < (unint64_t)k)
        {
          v32 = (unint64_t)k;
          do
          {
            v128 = *(_QWORD *)(i + 16);
            v119 = *(__n128 *)i;
            v33 = *(__n128 *)v32;
            *(_BYTE *)(i + 16) = *(_BYTE *)(v32 + 16);
            *(__n128 *)i = v33;
            *(_BYTE *)(v32 + 16) = v128;
            *(__n128 *)v32 = v119;
            do
            {
              do
              {
                v34 = *(_DWORD *)(i + 24);
                i += 24;
                v35 = v34 == v22;
              }
              while (v34 < v22);
            }
            while (v35 && *(float *)(i + 4) < a5.n128_f32[0]);
            do
            {
              v37 = *(_DWORD *)(v32 - 24);
              v32 -= 24;
              v36 = v37;
            }
            while (v37 >= v22 && (v36 != v22 || *(float *)(v32 + 4) >= a5.n128_f32[0]));
          }
          while (i < v32);
        }
        if (i - 24 != a1)
        {
          v38 = *(_OWORD *)(i - 24);
          *(_BYTE *)(a1 + 16) = *(_BYTE *)(i - 8);
          *(_OWORD *)a1 = v38;
        }
        *(_DWORD *)(i - 24) = v22;
        *(_DWORD *)(i - 20) = a5.n128_u32[0];
        *(_BYTE *)(i - 8) = BYTE8(v115);
        *(_QWORD *)(i - 16) = v115;
        if (v26 < (unint64_t)k)
        {
LABEL_49:
          std::__introsort<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *,false>(a1, i - 24, a3, a4 & 1);
          a4 = 0;
          continue;
        }
        v39 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>(a1, i - 24, a5);
        if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>(i, (uint64_t)a2, v40))
        {
          if (v39)
            continue;
          goto LABEL_49;
        }
        a2 = (__n128 *)(i - 24);
        if (!v39)
          goto LABEL_1;
        return a5.n128_f32[0];
    }
  }
}

float std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 a4)
{
  unsigned __int32 v4;
  unint64_t v5;
  unsigned __int8 v6;
  unint64_t v7;
  unsigned __int8 v8;
  unint64_t v9;
  unsigned __int8 v10;
  unint64_t v11;
  unsigned __int8 v12;
  unsigned __int8 v13;

  v4 = a2->n128_u32[0];
  if (a2->n128_u32[0] < a1->n128_u32[0]
    || v4 == a1->n128_u32[0] && (a4.n128_u32[0] = a2->n128_u32[1], a4.n128_f32[0] < a1->n128_f32[1]))
  {
    if (a3->n128_u32[0] < v4 || a3->n128_u32[0] == v4 && a3->n128_f32[1] < a2->n128_f32[1])
    {
      a4 = *a1;
      v5 = a1[1].n128_u64[0];
      v6 = a3[1].n128_u8[0];
      *a1 = *a3;
      a1[1].n128_u8[0] = v6;
LABEL_17:
      a3[1].n128_u8[0] = v5;
      *a3 = a4;
      return a4.n128_f32[0];
    }
    a4 = *a1;
    v11 = a1[1].n128_u64[0];
    v12 = a2[1].n128_u8[0];
    *a1 = *a2;
    a1[1].n128_u8[0] = v12;
    a2[1].n128_u8[0] = v11;
    *a2 = a4;
    if (a3->n128_u32[0] < a2->n128_u32[0]
      || a3->n128_u32[0] == a2->n128_u32[0] && (a4.n128_u32[0] = a3->n128_u32[1], a4.n128_f32[0] < a2->n128_f32[1]))
    {
      a4 = *a2;
      v5 = a2[1].n128_u64[0];
      v13 = a3[1].n128_u8[0];
      *a2 = *a3;
      a2[1].n128_u8[0] = v13;
      goto LABEL_17;
    }
  }
  else if (a3->n128_u32[0] < v4
         || a3->n128_u32[0] == v4 && (a4.n128_u32[0] = a3->n128_u32[1], a4.n128_f32[0] < a2->n128_f32[1]))
  {
    a4 = *a2;
    v7 = a2[1].n128_u64[0];
    v8 = a3[1].n128_u8[0];
    *a2 = *a3;
    a2[1].n128_u8[0] = v8;
    a3[1].n128_u8[0] = v7;
    *a3 = a4;
    if (a2->n128_u32[0] < a1->n128_u32[0]
      || a2->n128_u32[0] == a1->n128_u32[0] && (a4.n128_u32[0] = a2->n128_u32[1], a4.n128_f32[0] < a1->n128_f32[1]))
    {
      a4 = *a1;
      v9 = a1[1].n128_u64[0];
      v10 = a2[1].n128_u8[0];
      *a1 = *a2;
      a1[1].n128_u8[0] = v10;
      a2[1].n128_u8[0] = v9;
      *a2 = a4;
    }
  }
  return a4.n128_f32[0];
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>(uint64_t a1, uint64_t a2, __n128 a3)
{
  unint64_t v5;
  _BOOL8 result;
  __n128 *v7;
  unsigned int v8;
  __n128 v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unsigned int v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  __n128 *v21;
  __n128 *v22;
  __n128 *v23;
  __n128 *v24;
  unsigned int v25;
  unsigned int v26;
  __n128 v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  __n128 v31;
  uint64_t v32;
  __n128 v33;
  unsigned int v34;
  uint64_t v35;
  __n128 v36;
  __int128 v37;

  v5 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v5)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v7 = (__n128 *)(a2 - 24);
      v8 = *(_DWORD *)(a2 - 24);
      if (v8 < *(_DWORD *)a1 || v8 == *(_DWORD *)a1 && *(float *)(a2 - 20) < *(float *)(a1 + 4))
      {
        v9 = *(__n128 *)a1;
        v10 = *(_QWORD *)(a1 + 16);
        v11 = *(_BYTE *)(a2 - 8);
        *(__n128 *)a1 = *v7;
        *(_BYTE *)(a1 + 16) = v11;
        *(_BYTE *)(a2 - 8) = v10;
        *v7 = v9;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)a1, (__n128 *)(a1 + 24), (__n128 *)(a2 - 24), a3);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)a1, (__n128 *)(a1 + 24), (__n128 *)(a1 + 48), (__n128 *)(a2 - 24), a3);
      return 1;
    case 5uLL:
      v21 = (__n128 *)(a1 + 24);
      v22 = (__n128 *)(a1 + 48);
      v23 = (__n128 *)(a1 + 72);
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)a1, (__n128 *)(a1 + 24), (__n128 *)(a1 + 48), (__n128 *)(a1 + 72), a3);
      v24 = (__n128 *)(a2 - 24);
      v25 = *(_DWORD *)(a2 - 24);
      v26 = *(_DWORD *)(a1 + 72);
      if (v25 < v26 || v25 == v26 && *(float *)(a2 - 20) < *(float *)(a1 + 76))
      {
        v27 = *v23;
        v28 = *(_QWORD *)(a1 + 88);
        v29 = *(_BYTE *)(a2 - 8);
        *v23 = *v24;
        *(_BYTE *)(a1 + 88) = v29;
        *(_BYTE *)(a2 - 8) = v28;
        *v24 = v27;
        if (v23->n128_u32[0] < v22->n128_u32[0]
          || v23->n128_u32[0] == v22->n128_u32[0] && *(float *)(a1 + 76) < *(float *)(a1 + 52))
        {
          v30 = *(_QWORD *)(a1 + 64);
          v31 = *v22;
          *v22 = *v23;
          *(_BYTE *)(a1 + 64) = *(_BYTE *)(a1 + 88);
          *v23 = v31;
          *(_BYTE *)(a1 + 88) = v30;
          if (v22->n128_u32[0] < v21->n128_u32[0]
            || v22->n128_u32[0] == v21->n128_u32[0] && *(float *)(a1 + 52) < *(float *)(a1 + 28))
          {
            v32 = *(_QWORD *)(a1 + 40);
            v33 = *v21;
            *v21 = *v22;
            *(_BYTE *)(a1 + 40) = *(_BYTE *)(a1 + 64);
            *v22 = v33;
            *(_BYTE *)(a1 + 64) = v32;
            v34 = *(_DWORD *)(a1 + 24);
            if (v34 < *(_DWORD *)a1 || v34 == *(_DWORD *)a1 && *(float *)(a1 + 28) < *(float *)(a1 + 4))
            {
              v35 = *(_QWORD *)(a1 + 16);
              v36 = *(__n128 *)a1;
              *(__n128 *)a1 = *v21;
              *(_BYTE *)(a1 + 16) = *(_BYTE *)(a1 + 40);
              *v21 = v36;
              *(_BYTE *)(a1 + 40) = v35;
            }
          }
        }
      }
      return 1;
    default:
      v12 = a1 + 48;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)a1, (__n128 *)(a1 + 24), (__n128 *)(a1 + 48), a3);
      v13 = a1 + 72;
      if (a1 + 72 == a2)
        return 1;
      v14 = 0;
      v15 = 0;
      break;
  }
  while (1)
  {
    v16 = *(_DWORD *)v13;
    if (*(_DWORD *)v13 < *(_DWORD *)v12)
      break;
    if (v16 == *(_DWORD *)v12)
    {
      v17 = *(float *)(v13 + 4);
      if (v17 < *(float *)(v12 + 4))
        goto LABEL_10;
    }
LABEL_20:
    v12 = v13;
    v14 += 24;
    v13 += 24;
    if (v13 == a2)
      return 1;
  }
  v17 = *(float *)(v13 + 4);
LABEL_10:
  v37 = *(_OWORD *)(v13 + 8);
  *(_BYTE *)(v13 + 16) = *(_BYTE *)(v12 + 16);
  *(_OWORD *)v13 = *(_OWORD *)v12;
  v18 = a1;
  if (v12 != a1)
  {
    v19 = v14;
    while (1)
    {
      v20 = *(_DWORD *)(a1 + v19 + 24);
      if (v16 >= v20)
      {
        if (v16 != v20)
        {
          v18 = a1 + v19 + 48;
          goto LABEL_19;
        }
        if (v17 >= *(float *)(a1 + v19 + 28))
          break;
      }
      v12 -= 24;
      *(_OWORD *)(a1 + v19 + 48) = *(_OWORD *)(a1 + v19 + 24);
      *(_BYTE *)(a1 + v19 + 64) = *(_BYTE *)(a1 + v19 + 40);
      v19 -= 24;
      if (v19 == -48)
      {
        v18 = a1;
        goto LABEL_19;
      }
    }
    v18 = v12;
  }
LABEL_19:
  *(_DWORD *)v18 = v16;
  *(float *)(v18 + 4) = v17;
  *(_QWORD *)(v18 + 8) = v37;
  *(_BYTE *)(v18 + 16) = BYTE8(v37);
  if (++v15 != 8)
    goto LABEL_20;
  return v13 + 24 == a2;
}

float std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 a5)
{
  __n128 v9;
  unint64_t v10;
  unsigned __int8 v11;
  unint64_t v12;
  unsigned __int8 v13;
  unint64_t v14;
  unsigned __int8 v15;

  v9.n128_f32[0] = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>(a1, a2, a3, a5);
  if (a4->n128_u32[0] < a3->n128_u32[0]
    || a4->n128_u32[0] == a3->n128_u32[0] && (v9.n128_u32[0] = a4->n128_u32[1], v9.n128_f32[0] < a3->n128_f32[1]))
  {
    v9 = *a3;
    v10 = a3[1].n128_u64[0];
    v11 = a4[1].n128_u8[0];
    *a3 = *a4;
    a3[1].n128_u8[0] = v11;
    a4[1].n128_u8[0] = v10;
    *a4 = v9;
    if (a3->n128_u32[0] < a2->n128_u32[0]
      || a3->n128_u32[0] == a2->n128_u32[0] && (v9.n128_u32[0] = a3->n128_u32[1], v9.n128_f32[0] < a2->n128_f32[1]))
    {
      v9 = *a2;
      v12 = a2[1].n128_u64[0];
      v13 = a3[1].n128_u8[0];
      *a2 = *a3;
      a2[1].n128_u8[0] = v13;
      a3[1].n128_u8[0] = v12;
      *a3 = v9;
      if (a2->n128_u32[0] < a1->n128_u32[0]
        || a2->n128_u32[0] == a1->n128_u32[0] && (v9.n128_u32[0] = a2->n128_u32[1], v9.n128_f32[0] < a1->n128_f32[1]))
      {
        v9 = *a1;
        v14 = a1[1].n128_u64[0];
        v15 = a2[1].n128_u8[0];
        *a1 = *a2;
        a1[1].n128_u8[0] = v15;
        a2[1].n128_u8[0] = v14;
        *a2 = v9;
      }
    }
  }
  return v9.n128_f32[0];
}

uint64_t *std::__tree<unsigned long>::__emplace_hint_unique_key_args<unsigned long,unsigned long const&>(uint64_t *result, uint64_t *a2, unint64_t a3, uint64_t a4)
{
  uint64_t **v5;
  uint64_t **v6;
  uint64_t **v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t **v13;
  uint64_t **v14;
  uint64_t *v15;
  BOOL v16;
  uint64_t *v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t **v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t *v23;

  v5 = (uint64_t **)a2;
  v6 = (uint64_t **)result;
  v7 = (uint64_t **)(result + 1);
  if (result + 1 == a2 || (v8 = a2[4], v8 > a3))
  {
    v9 = *a2;
    if ((uint64_t *)*result == a2)
    {
      v11 = a2;
LABEL_16:
      if (v9)
        v17 = v11;
      else
        v17 = a2;
      if (v9)
        v13 = (uint64_t **)(v11 + 1);
      else
        v13 = (uint64_t **)a2;
      if (*v13)
        return result;
      v5 = (uint64_t **)v17;
LABEL_43:
      v23 = (uint64_t *)operator new(0x28uLL);
      v23[4] = a4;
      return std::__tree<unsigned long>::__insert_node_at(v6, (uint64_t)v5, v13, v23);
    }
    if (v9)
    {
      v10 = (uint64_t *)*a2;
      do
      {
        v11 = v10;
        v10 = (uint64_t *)v10[1];
      }
      while (v10);
    }
    else
    {
      v15 = a2;
      do
      {
        v11 = (uint64_t *)v15[2];
        v16 = *v11 == (_QWORD)v15;
        v15 = v11;
      }
      while (v16);
    }
    if (v11[4] < a3)
      goto LABEL_16;
    v18 = *v7;
    v13 = (uint64_t **)(result + 1);
    v5 = (uint64_t **)(result + 1);
    if (!*v7)
      goto LABEL_43;
    while (1)
    {
      while (1)
      {
        v5 = (uint64_t **)v18;
        v19 = v18[4];
        if (v19 <= a3)
          break;
        v18 = (uint64_t *)*v18;
        v13 = v5;
        if (!*v5)
          goto LABEL_43;
      }
      if (v19 >= a3)
        break;
      v18 = (uint64_t *)v18[1];
      if (!v18)
        goto LABEL_30;
    }
  }
  else
  {
    if (v8 >= a3)
      return result;
    v13 = (uint64_t **)(a2 + 1);
    v12 = (uint64_t *)a2[1];
    if (v12)
    {
      do
      {
        v13 = (uint64_t **)v12;
        v12 = (uint64_t *)*v12;
        v5 = v13;
        v14 = v13;
      }
      while (v12);
    }
    else
    {
      v14 = (uint64_t **)a2;
      do
      {
        v20 = v14;
        v14 = (uint64_t **)v14[2];
      }
      while (*v14 != (uint64_t *)v20);
    }
    if (v14 == v7)
      goto LABEL_43;
    if ((unint64_t)v14[4] > a3)
      goto LABEL_43;
    v21 = *v7;
    v13 = (uint64_t **)(result + 1);
    v5 = (uint64_t **)(result + 1);
    if (!*v7)
      goto LABEL_43;
    while (1)
    {
      while (1)
      {
        v5 = (uint64_t **)v21;
        v22 = v21[4];
        if (v22 <= a3)
          break;
        v21 = (uint64_t *)*v21;
        v13 = v5;
        if (!*v5)
          goto LABEL_43;
      }
      if (v22 >= a3)
        break;
      v21 = (uint64_t *)v21[1];
      if (!v21)
      {
LABEL_30:
        v13 = v5 + 1;
        goto LABEL_43;
      }
    }
  }
  return result;
}

uint64_t *std::__tree<unsigned long>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void std::__tree<unsigned long>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<unsigned long>::destroy(*a1);
    std::__tree<unsigned long>::destroy(a1[1]);
    operator delete(a1);
  }
}

uint64_t *std::set<unsigned long>::set[abi:ne180100](uint64_t *a1, _QWORD *a2)
{
  uint64_t *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  BOOL v8;

  a1[1] = 0;
  v3 = a1 + 1;
  a1[2] = 0;
  *a1 = (uint64_t)(a1 + 1);
  v4 = a2 + 1;
  v5 = (_QWORD *)*a2;
  if ((_QWORD *)*a2 != a2 + 1)
  {
    do
    {
      std::__tree<unsigned long>::__emplace_hint_unique_key_args<unsigned long,unsigned long const&>(a1, v3, v5[4], v5[4]);
      v6 = (_QWORD *)v5[1];
      if (v6)
      {
        do
        {
          v7 = v6;
          v6 = (_QWORD *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          v7 = (_QWORD *)v5[2];
          v8 = *v7 == (_QWORD)v5;
          v5 = v7;
        }
        while (!v8);
      }
      v5 = v7;
    }
    while (v7 != v4);
  }
  return a1;
}

void sub_1B0B6E90C(_Unwind_Exception *a1)
{
  _QWORD **v1;

  std::__tree<unsigned long>::destroy(*v1);
  _Unwind_Resume(a1);
}

uint64_t std::deque<_MNRouteConvergencePoint>::~deque[abi:ne180100](uint64_t a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(void ***)(a1 + 8);
  v3 = *(void ***)(a1 + 16);
  *(_QWORD *)(a1 + 40) = 0;
  v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = *(void ***)(a1 + 16);
      v2 = (void **)(*(_QWORD *)(a1 + 8) + 8);
      *(_QWORD *)(a1 + 8) = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v5 = v4 >> 3;
  if (v5 == 1)
  {
    v6 = 21;
    goto LABEL_7;
  }
  if (v5 == 2)
  {
    v6 = 42;
LABEL_7:
    *(_QWORD *)(a1 + 32) = v6;
  }
  if (v2 != v3)
  {
    do
    {
      v7 = *v2++;
      operator delete(v7);
    }
    while (v2 != v3);
    v9 = *(_QWORD *)(a1 + 8);
    v8 = *(_QWORD *)(a1 + 16);
    if (v8 != v9)
      *(_QWORD *)(a1 + 16) = v8 + ((v9 - v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

__n128 std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __n128 result;
  double v7;
  double v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  BOOL v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[32];
  _BYTE v50[32];
  _BYTE v51[32];
  _BYTE v52[32];

  result.n128_u64[0] = *(_QWORD *)(a4 + 8);
  v7 = *(double *)(a2 + 8);
  if (result.n128_f64[0] < v7
    || result.n128_f64[0] <= v7 && (*(_BYTE *)(a4 + 88) ? (v13 = *(_BYTE *)(a2 + 88) == 0) : (v13 = 0), v13))
  {
    v8 = *(double *)(a6 + 8);
    if (v8 < result.n128_f64[0] || v8 <= result.n128_f64[0] && *(_BYTE *)(a6 + 88) && !*(_BYTE *)(a4 + 88))
    {
      v41 = *(_OWORD *)(a2 + 32);
      v45 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)v49 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)&v49[16] = *(_OWORD *)(a2 + 80);
      v33 = *(__n128 *)a2;
      v37 = *(_OWORD *)(a2 + 16);
      v9 = *(_OWORD *)(a6 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a6;
      *(_OWORD *)(a2 + 16) = v9;
      v11 = *(_OWORD *)(a6 + 48);
      v10 = *(_OWORD *)(a6 + 64);
      v12 = *(_OWORD *)(a6 + 32);
      *(_OWORD *)(a2 + 74) = *(_OWORD *)(a6 + 74);
      *(_OWORD *)(a2 + 48) = v11;
      *(_OWORD *)(a2 + 64) = v10;
      *(_OWORD *)(a2 + 32) = v12;
    }
    else
    {
      v44 = *(_OWORD *)(a2 + 32);
      v48 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)v52 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)&v52[16] = *(_OWORD *)(a2 + 80);
      v36 = *(__n128 *)a2;
      v40 = *(_OWORD *)(a2 + 16);
      v24 = *(_OWORD *)(a4 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a4;
      *(_OWORD *)(a2 + 16) = v24;
      v26 = *(_OWORD *)(a4 + 48);
      v25 = *(_OWORD *)(a4 + 64);
      v27 = *(_OWORD *)(a4 + 32);
      *(_OWORD *)(a2 + 74) = *(_OWORD *)(a4 + 74);
      *(_OWORD *)(a2 + 48) = v26;
      *(_OWORD *)(a2 + 64) = v25;
      *(_OWORD *)(a2 + 32) = v27;
      *(_OWORD *)(a4 + 64) = *(_OWORD *)v52;
      *(_OWORD *)(a4 + 74) = *(_OWORD *)&v52[10];
      *(_OWORD *)(a4 + 32) = v44;
      *(_OWORD *)(a4 + 48) = v48;
      result.n128_u64[1] = v36.n128_u64[1];
      *(__n128 *)a4 = v36;
      *(_OWORD *)(a4 + 16) = v40;
      result.n128_u64[0] = *(_QWORD *)(a6 + 8);
      v28 = *(double *)(a4 + 8);
      if (result.n128_f64[0] >= v28 && (result.n128_f64[0] > v28 || !*(_BYTE *)(a6 + 88) || *(_BYTE *)(a4 + 88)))
        return result;
      v41 = *(_OWORD *)(a4 + 32);
      v45 = *(_OWORD *)(a4 + 48);
      *(_OWORD *)v49 = *(_OWORD *)(a4 + 64);
      *(_OWORD *)&v49[16] = *(_OWORD *)(a4 + 80);
      v33 = *(__n128 *)a4;
      v37 = *(_OWORD *)(a4 + 16);
      v29 = *(_OWORD *)(a6 + 16);
      *(_OWORD *)a4 = *(_OWORD *)a6;
      *(_OWORD *)(a4 + 16) = v29;
      v31 = *(_OWORD *)(a6 + 48);
      v30 = *(_OWORD *)(a6 + 64);
      v32 = *(_OWORD *)(a6 + 32);
      *(_OWORD *)(a4 + 74) = *(_OWORD *)(a6 + 74);
      *(_OWORD *)(a4 + 48) = v31;
      *(_OWORD *)(a4 + 64) = v30;
      *(_OWORD *)(a4 + 32) = v32;
    }
    *(_OWORD *)(a6 + 64) = *(_OWORD *)v49;
    *(_OWORD *)(a6 + 74) = *(_OWORD *)&v49[10];
    *(_OWORD *)(a6 + 32) = v41;
    *(_OWORD *)(a6 + 48) = v45;
    result = v33;
    *(__n128 *)a6 = v33;
    *(_OWORD *)(a6 + 16) = v37;
    return result;
  }
  v14 = *(double *)(a6 + 8);
  if (v14 < result.n128_f64[0] || v14 <= result.n128_f64[0] && *(_BYTE *)(a6 + 88) && !*(_BYTE *)(a4 + 88))
  {
    v42 = *(_OWORD *)(a4 + 32);
    v46 = *(_OWORD *)(a4 + 48);
    *(_OWORD *)v50 = *(_OWORD *)(a4 + 64);
    *(_OWORD *)&v50[16] = *(_OWORD *)(a4 + 80);
    v34 = *(__n128 *)a4;
    v38 = *(_OWORD *)(a4 + 16);
    v15 = *(_OWORD *)(a6 + 16);
    *(_OWORD *)a4 = *(_OWORD *)a6;
    *(_OWORD *)(a4 + 16) = v15;
    v17 = *(_OWORD *)(a6 + 48);
    v16 = *(_OWORD *)(a6 + 64);
    v18 = *(_OWORD *)(a6 + 32);
    *(_OWORD *)(a4 + 74) = *(_OWORD *)(a6 + 74);
    *(_OWORD *)(a4 + 48) = v17;
    *(_OWORD *)(a4 + 64) = v16;
    *(_OWORD *)(a4 + 32) = v18;
    *(_OWORD *)(a6 + 64) = *(_OWORD *)v50;
    *(_OWORD *)(a6 + 74) = *(_OWORD *)&v50[10];
    *(_OWORD *)(a6 + 32) = v42;
    *(_OWORD *)(a6 + 48) = v46;
    result.n128_u64[1] = v34.n128_u64[1];
    *(__n128 *)a6 = v34;
    *(_OWORD *)(a6 + 16) = v38;
    result.n128_u64[0] = *(_QWORD *)(a4 + 8);
    v19 = *(double *)(a2 + 8);
    if (result.n128_f64[0] < v19 || result.n128_f64[0] <= v19 && *(_BYTE *)(a4 + 88) && !*(_BYTE *)(a2 + 88))
    {
      v43 = *(_OWORD *)(a2 + 32);
      v47 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)v51 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)&v51[16] = *(_OWORD *)(a2 + 80);
      v35 = *(__n128 *)a2;
      v39 = *(_OWORD *)(a2 + 16);
      v20 = *(_OWORD *)(a4 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a4;
      *(_OWORD *)(a2 + 16) = v20;
      v22 = *(_OWORD *)(a4 + 48);
      v21 = *(_OWORD *)(a4 + 64);
      v23 = *(_OWORD *)(a4 + 32);
      *(_OWORD *)(a2 + 74) = *(_OWORD *)(a4 + 74);
      *(_OWORD *)(a2 + 48) = v22;
      *(_OWORD *)(a2 + 64) = v21;
      *(_OWORD *)(a2 + 32) = v23;
      *(_OWORD *)(a4 + 64) = *(_OWORD *)v51;
      *(_OWORD *)(a4 + 74) = *(_OWORD *)&v51[10];
      *(_OWORD *)(a4 + 32) = v43;
      *(_OWORD *)(a4 + 48) = v47;
      result = v35;
      *(__n128 *)a4 = v35;
      *(_OWORD *)(a4 + 16) = v39;
    }
  }
  return result;
}

uint64_t std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>(_QWORD *a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  double v11;
  double v12;
  _OWORD *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  unint64_t *v19;
  uint64_t v20;
  BOOL v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  double v48;
  double v49;
  _OWORD *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  double v55;
  double v56;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  double v62;
  double v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  double v68;
  double v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t *v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  int v83;
  unint64_t v84;
  unint64_t *v85;
  double v86;
  double v87;
  int v88;
  BOOL v89;
  uint64_t v90;
  char v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  uint64_t v97;
  double v98;
  _OWORD *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  unint64_t v105;
  uint64_t v106;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _BYTE v135[32];
  _BYTE v136[32];
  _BYTE v137[32];
  _BYTE v138[32];
  _BYTE v139[32];
  uint64_t v140;

  if (a4 == a2)
    return 1;
  v4 = a4;
  v5 = (uint64_t)a3;
  v7 = *a3;
  v8 = a2 - *a1;
  v9 = v8 >> 5;
  v10 = 1;
  switch(42 * (a3 - a1) - 0x5555555555555555 * ((a4 - *a3) >> 5) + 0x5555555555555555 * (v8 >> 5))
  {
    case 0:
    case 1:
      return v10;
    case 2:
      if (v7 == a4)
        v4 = *(a3 - 1) + 4032;
      v11 = *(double *)(v4 - 88);
      v12 = *(double *)(a2 + 8);
      if (v11 < v12)
        goto LABEL_6;
      if (v11 > v12)
        return 1;
      v10 = 1;
      if (*(_BYTE *)(v4 - 8) && !*(_BYTE *)(a2 + 88))
      {
LABEL_6:
        v13 = (_OWORD *)(v4 - 96);
        v123 = *(_OWORD *)(a2 + 32);
        v129 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)v135 = *(_OWORD *)(a2 + 64);
        *(_OWORD *)&v135[16] = *(_OWORD *)(a2 + 80);
        v111 = *(_OWORD *)a2;
        v117 = *(_OWORD *)(a2 + 16);
        v14 = *(_OWORD *)(v4 - 80);
        *(_OWORD *)a2 = *(_OWORD *)(v4 - 96);
        *(_OWORD *)(a2 + 16) = v14;
        v16 = *(_OWORD *)(v4 - 48);
        v15 = *(_OWORD *)(v4 - 32);
        v17 = *(_OWORD *)(v4 - 64);
        *(_OWORD *)(a2 + 74) = *(_OWORD *)(v4 - 22);
        *(_OWORD *)(a2 + 48) = v16;
        *(_OWORD *)(a2 + 64) = v15;
        *(_OWORD *)(a2 + 32) = v17;
        v13[4] = *(_OWORD *)v135;
        *(_OWORD *)((char *)v13 + 74) = *(_OWORD *)&v135[10];
        v13[2] = v123;
        v13[3] = v129;
        v10 = 1;
        *v13 = v111;
        v13[1] = v117;
      }
      return v10;
    case 3:
      v24 = 0xAAAAAAAAAAAAAAABLL * v9;
      if (v8 < -95)
      {
        v37 = 40 - v24;
        v26 = &a1[-(v37 / 0x2A)];
        v27 = *v26 + 96 * (42 * (v37 / 0x2A) - v37) + 3936;
      }
      else
      {
        v25 = v24 + 1;
        v26 = &a1[v25 / 0x2A];
        v27 = *v26 + 96 * (v25 % 0x2A);
      }
      if (v7 == v4)
      {
        v38 = *(_QWORD *)(v5 - 8);
        v5 -= 8;
        v4 = v38 + 4032;
      }
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>((uint64_t)a1, a2, (uint64_t)v26, v27, v5, v4 - 96);
      return 1;
    case 4:
      v28 = 0xAAAAAAAAAAAAAAABLL * v9;
      if (v8 >= -95)
      {
        v29 = &a1[(v28 + 1) / 0x2A];
        v30 = *v29 + 96 * ((v28 + 1) % 0x2A);
        v31 = v28 + 2;
LABEL_29:
        v40 = &a1[v31 / 0x2A];
        v41 = *v40 + 96 * (v31 % 0x2A);
        goto LABEL_82;
      }
      v39 = (40 - v28) / 0x2A;
      v29 = &a1[-v39];
      v30 = *v29 + 96 * (v28 - 40 + 42 * v39) + 3936;
      if ((unint64_t)v8 >= 0xFFFFFFFFFFFFFF41)
      {
        v31 = 1;
        goto LABEL_29;
      }
      v105 = 39 - v28;
      v40 = &a1[-(v105 / 0x2A)];
      v41 = *v40 + 96 * (42 * (v105 / 0x2A) - v105) + 3936;
LABEL_82:
      if (v7 == v4)
      {
        v106 = *(_QWORD *)(v5 - 8);
        v5 -= 8;
        v4 = v106 + 4032;
      }
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>((uint64_t)a1, a2, (uint64_t)v29, v30, (uint64_t)v40, v41, v5, v4 - 96);
      return 1;
    case 5:
      v32 = 0xAAAAAAAAAAAAAAABLL * v9;
      if (v8 >= -95)
      {
        v33 = &a1[(v32 + 1) / 0x2A];
        v34 = *v33 + 96 * ((v32 + 1) % 0x2A);
        v35 = v32 + 2;
LABEL_32:
        v43 = &a1[v35 / 0x2A];
        v44 = *v43 + 96 * (v35 % 0x2A);
        v45 = v32 + 3;
LABEL_33:
        v46 = &a1[v45 / 0x2A];
        v47 = *v46 + 96 * (v45 % 0x2A);
        goto LABEL_34;
      }
      v42 = (40 - v32) / 0x2A;
      v33 = &a1[-v42];
      v34 = *v33 + 96 * (v32 - 40 + 42 * v42) + 3936;
      if ((unint64_t)v8 >= 0xFFFFFFFFFFFFFF41)
      {
        v35 = 1;
        goto LABEL_32;
      }
      v108 = (39 - v32) / 0x2A;
      v43 = &a1[-v108];
      v44 = *v43 + 96 * (v32 - 39 + 42 * v108) + 3936;
      if ((unint64_t)v8 >= 0xFFFFFFFFFFFFFEE1)
      {
        v45 = 1;
        goto LABEL_33;
      }
      v110 = 38 - v32;
      v46 = &a1[-(v110 / 0x2A)];
      v47 = *v46 + 96 * (42 * (v110 / 0x2A) - v110) + 3936;
LABEL_34:
      if (v7 == a4)
        v4 = *(_QWORD *)(v5 - 8) + 4032;
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>((uint64_t)a1, a2, (uint64_t)v33, v34, (uint64_t)v43, v44, (uint64_t)v46, v47);
      v48 = *(double *)(v4 - 88);
      v49 = *(double *)(v47 + 8);
      if (v48 < v49)
        goto LABEL_37;
      if (v48 > v49)
        return 1;
      v10 = 1;
      if (!*(_BYTE *)(v4 - 8) || *(_BYTE *)(v47 + 88))
        return v10;
LABEL_37:
      v50 = (_OWORD *)(v4 - 96);
      v124 = *(_OWORD *)(v47 + 32);
      v130 = *(_OWORD *)(v47 + 48);
      *(_OWORD *)v136 = *(_OWORD *)(v47 + 64);
      *(_OWORD *)&v136[16] = *(_OWORD *)(v47 + 80);
      v112 = *(_OWORD *)v47;
      v118 = *(_OWORD *)(v47 + 16);
      v51 = *(_OWORD *)(v4 - 80);
      *(_OWORD *)v47 = *(_OWORD *)(v4 - 96);
      *(_OWORD *)(v47 + 16) = v51;
      v53 = *(_OWORD *)(v4 - 48);
      v52 = *(_OWORD *)(v4 - 32);
      v54 = *(_OWORD *)(v4 - 64);
      *(_OWORD *)(v47 + 74) = *(_OWORD *)(v4 - 22);
      *(_OWORD *)(v47 + 48) = v53;
      *(_OWORD *)(v47 + 64) = v52;
      *(_OWORD *)(v47 + 32) = v54;
      v50[4] = *(_OWORD *)v136;
      *(_OWORD *)((char *)v50 + 74) = *(_OWORD *)&v136[10];
      v50[2] = v124;
      v50[3] = v130;
      *v50 = v112;
      v50[1] = v118;
      v55 = *(double *)(v47 + 8);
      v56 = *(double *)(v44 + 8);
      if (v55 >= v56)
      {
        if (v55 > v56)
          return 1;
        if (!*(_BYTE *)(v47 + 88) || *(_BYTE *)(v44 + 88) != 0)
          return 1;
      }
      v113 = *(_OWORD *)v44;
      v119 = *(_OWORD *)(v44 + 16);
      *(_OWORD *)v137 = *(_OWORD *)(v44 + 64);
      *(_OWORD *)&v137[16] = *(_OWORD *)(v44 + 80);
      v125 = *(_OWORD *)(v44 + 32);
      v131 = *(_OWORD *)(v44 + 48);
      v59 = *(_OWORD *)(v47 + 48);
      v58 = *(_OWORD *)(v47 + 64);
      v60 = *(_OWORD *)(v47 + 32);
      *(_OWORD *)(v44 + 74) = *(_OWORD *)(v47 + 74);
      *(_OWORD *)(v44 + 48) = v59;
      *(_OWORD *)(v44 + 64) = v58;
      *(_OWORD *)(v44 + 32) = v60;
      v61 = *(_OWORD *)(v47 + 16);
      *(_OWORD *)v44 = *(_OWORD *)v47;
      *(_OWORD *)(v44 + 16) = v61;
      *(_OWORD *)(v47 + 32) = v125;
      *(_OWORD *)(v47 + 48) = v131;
      *(_OWORD *)(v47 + 64) = *(_OWORD *)v137;
      *(_OWORD *)(v47 + 74) = *(_OWORD *)&v137[10];
      *(_OWORD *)v47 = v113;
      *(_OWORD *)(v47 + 16) = v119;
      v62 = *(double *)(v44 + 8);
      v63 = *(double *)(v34 + 8);
      if (v62 < v63)
        goto LABEL_45;
      if (v62 > v63)
        return 1;
      v10 = 1;
      if (!*(_BYTE *)(v44 + 88) || *(_BYTE *)(v34 + 88))
        return v10;
LABEL_45:
      v114 = *(_OWORD *)v34;
      v120 = *(_OWORD *)(v34 + 16);
      *(_OWORD *)v138 = *(_OWORD *)(v34 + 64);
      *(_OWORD *)&v138[16] = *(_OWORD *)(v34 + 80);
      v126 = *(_OWORD *)(v34 + 32);
      v132 = *(_OWORD *)(v34 + 48);
      v65 = *(_OWORD *)(v44 + 48);
      v64 = *(_OWORD *)(v44 + 64);
      v66 = *(_OWORD *)(v44 + 32);
      *(_OWORD *)(v34 + 74) = *(_OWORD *)(v44 + 74);
      *(_OWORD *)(v34 + 48) = v65;
      *(_OWORD *)(v34 + 64) = v64;
      *(_OWORD *)(v34 + 32) = v66;
      v67 = *(_OWORD *)(v44 + 16);
      *(_OWORD *)v34 = *(_OWORD *)v44;
      *(_OWORD *)(v34 + 16) = v67;
      *(_OWORD *)v44 = v114;
      *(_OWORD *)(v44 + 16) = v120;
      *(_OWORD *)(v44 + 74) = *(_OWORD *)&v138[10];
      *(_OWORD *)(v44 + 48) = v132;
      *(_OWORD *)(v44 + 64) = *(_OWORD *)v138;
      *(_OWORD *)(v44 + 32) = v126;
      v68 = *(double *)(v34 + 8);
      v69 = *(double *)(a2 + 8);
      if (v68 < v69)
        goto LABEL_46;
      if (v68 > v69)
        return 1;
      v10 = 1;
      if (!*(_BYTE *)(v34 + 88) || *(_BYTE *)(a2 + 88))
        return v10;
LABEL_46:
      v127 = *(_OWORD *)(a2 + 32);
      v133 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)v139 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)&v139[16] = *(_OWORD *)(a2 + 80);
      v115 = *(_OWORD *)a2;
      v121 = *(_OWORD *)(a2 + 16);
      v70 = *(_OWORD *)(v34 + 16);
      *(_OWORD *)a2 = *(_OWORD *)v34;
      *(_OWORD *)(a2 + 16) = v70;
      v72 = *(_OWORD *)(v34 + 48);
      v71 = *(_OWORD *)(v34 + 64);
      v73 = *(_OWORD *)(v34 + 32);
      *(_OWORD *)(a2 + 74) = *(_OWORD *)(v34 + 74);
      *(_OWORD *)(a2 + 48) = v72;
      *(_OWORD *)(a2 + 64) = v71;
      *(_OWORD *)(a2 + 32) = v73;
      *(_OWORD *)v34 = v115;
      *(_OWORD *)(v34 + 16) = v121;
      *(_OWORD *)(v34 + 74) = *(_OWORD *)&v139[10];
      *(_OWORD *)(v34 + 48) = v133;
      *(_OWORD *)(v34 + 64) = *(_OWORD *)v139;
      *(_OWORD *)(v34 + 32) = v127;
      return 1;
    default:
      v18 = v8 >> 5;
      if (v8 <= -192)
      {
        v36 = (39 - v18) / 0x2AuLL;
        v19 = &a1[-v36];
        v20 = *v19 + 96 * (v18 - 39 + 42 * v36) + 3936;
        v23 = 40 - v18;
      }
      else
      {
        v19 = &a1[(v18 + 2) / 0x2AuLL];
        v20 = *v19 + 96 * ((v18 + 2) % 0x2AuLL);
        v21 = __CFADD__(v18, 1);
        v22 = v18 + 1;
        if (!v21)
        {
          v74 = &a1[v22 / 0x2A];
          v75 = *v74 + 96 * (v22 % 0x2A);
          goto LABEL_51;
        }
        v23 = 41;
      }
      v74 = &a1[-(v23 / 0x2A)];
      v75 = *v74 + 96 * (42 * (v23 / 0x2A) - v23) + 3936;
LABEL_51:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>((uint64_t)a1, a2, (uint64_t)v74, v75, (uint64_t)v19, v20);
      v76 = v20 - *v19;
      v77 = 0xAAAAAAAAAAAAAAABLL * (v76 >> 5);
      if (v76 < -95)
      {
        v82 = 40 - v77;
        v79 = &v19[-(v82 / 0x2A)];
        v80 = *v79;
        v81 = *v79 + 96 * (42 * (v82 / 0x2A) - v82) + 3936;
      }
      else
      {
        v78 = v77 + 1;
        v79 = &v19[v78 / 0x2A];
        v80 = *v79;
        v81 = *v79 + 96 * (v78 % 0x2A);
      }
      if (v81 == v4)
        return 1;
      v83 = 0;
      while (2)
      {
        v84 = v81;
        v85 = v79;
        v86 = *(double *)(v81 + 8);
        v87 = *(double *)(v20 + 8);
        if (v86 >= v87)
        {
          if (v86 > v87 || (*(_BYTE *)(v81 + 88) ? (v89 = *(_BYTE *)(v20 + 88) == 0) : (v89 = 0), !v89))
          {
LABEL_77:
            v81 = v84 + 96;
            v79 = v85;
            if (v84 + 96 - v80 == 4032)
            {
              v79 = v85 + 1;
              v80 = v85[1];
              v81 = v80;
            }
            v19 = v85;
            v20 = v84;
            if (v81 == v4)
              return 1;
            continue;
          }
          v88 = 1;
        }
        else
        {
          v88 = *(unsigned __int8 *)(v81 + 88);
        }
        break;
      }
      v90 = *(_QWORD *)v81;
      v140 = *(_QWORD *)(v81 + 80);
      v128 = *(_OWORD *)(v81 + 48);
      v134 = *(_OWORD *)(v81 + 64);
      v122 = *(_OWORD *)(v81 + 32);
      v116 = *(_OWORD *)(v81 + 16);
      v91 = *(_BYTE *)(v81 + 89);
      v92 = *(_OWORD *)(v20 + 74);
      v94 = *(_OWORD *)(v20 + 48);
      v93 = *(_OWORD *)(v20 + 64);
      *(_OWORD *)(v81 + 32) = *(_OWORD *)(v20 + 32);
      *(_OWORD *)(v81 + 48) = v94;
      *(_OWORD *)(v81 + 64) = v93;
      *(_OWORD *)(v81 + 74) = v92;
      v95 = *(_OWORD *)(v20 + 16);
      *(_OWORD *)v81 = *(_OWORD *)v20;
      *(_OWORD *)(v81 + 16) = v95;
      if (v20 == a2)
      {
LABEL_74:
        v20 = a2;
      }
      else
      {
        while (1)
        {
          if (v20 == *v19)
          {
            v97 = *--v19;
            v96 = v97 + 4032;
          }
          else
          {
            v96 = v20;
          }
          v98 = *(double *)(v96 - 88);
          if (v86 >= v98 && (v86 > v98 || !v88 || *(_BYTE *)(v96 - 8)))
            break;
          v100 = *(_OWORD *)(v96 - 96);
          v101 = *(_OWORD *)(v96 - 80);
          v99 = (_OWORD *)(v96 - 96);
          *(_OWORD *)v20 = v100;
          *(_OWORD *)(v20 + 16) = v101;
          v102 = v99[2];
          v103 = v99[3];
          v104 = v99[4];
          *(_OWORD *)(v20 + 74) = *(_OWORD *)((char *)v99 + 74);
          *(_OWORD *)(v20 + 48) = v103;
          *(_OWORD *)(v20 + 64) = v104;
          *(_OWORD *)(v20 + 32) = v102;
          v20 = (uint64_t)v99;
          if (v99 == (_OWORD *)a2)
            goto LABEL_74;
        }
      }
      *(_QWORD *)v20 = v90;
      *(double *)(v20 + 8) = v86;
      *(_OWORD *)(v20 + 48) = v128;
      *(_OWORD *)(v20 + 64) = v134;
      *(_QWORD *)(v20 + 80) = v140;
      *(_OWORD *)(v20 + 16) = v116;
      *(_OWORD *)(v20 + 32) = v122;
      *(_BYTE *)(v20 + 88) = v88;
      ++v83;
      *(_BYTE *)(v20 + 89) = v91;
      if (v83 != 8)
      {
        v80 = *v85;
        goto LABEL_77;
      }
      v109 = v84 + 96;
      if (v84 + 96 - *v85 == 4032)
        v109 = v85[1];
      v10 = v109 == v4;
      break;
  }
  return v10;
}

_QWORD *std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](_QWORD *result, uint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;

  if (a2)
  {
    v2 = (_QWORD *)*result;
    v3 = a2 - 0x5555555555555555 * ((uint64_t)(result[1] - *(_QWORD *)*result) >> 5);
    if ((uint64_t)v3 < 1)
    {
      v5 = 41 - v3;
      v6 = &v2[-(v5 / 0x2A)];
      *result = v6;
      v4 = *v6 + 96 * (42 * (v5 / 0x2A) - v5) + 3936;
    }
    else
    {
      *result = &v2[v3 / 0x2A];
      v4 = v2[v3 / 0x2A] + 96 * (v3 % 0x2A);
    }
    result[1] = v4;
  }
  return result;
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __n128 result;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __n128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[32];
  _BYTE v41[32];
  _BYTE v42[32];

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>(a1, a2, a3, a4, a5, a6);
  result.n128_u64[0] = *(_QWORD *)(a8 + 8);
  v13 = *(double *)(a6 + 8);
  if (result.n128_f64[0] < v13 || result.n128_f64[0] <= v13 && *(_BYTE *)(a8 + 88) && !*(_BYTE *)(a6 + 88))
  {
    v34 = *(_OWORD *)(a6 + 32);
    v37 = *(_OWORD *)(a6 + 48);
    *(_OWORD *)v40 = *(_OWORD *)(a6 + 64);
    *(_OWORD *)&v40[16] = *(_OWORD *)(a6 + 80);
    v28 = *(_OWORD *)a6;
    v31 = *(_OWORD *)(a6 + 16);
    v14 = *(_OWORD *)(a8 + 16);
    *(_OWORD *)a6 = *(_OWORD *)a8;
    *(_OWORD *)(a6 + 16) = v14;
    v16 = *(_OWORD *)(a8 + 48);
    v15 = *(_OWORD *)(a8 + 64);
    v17 = *(_OWORD *)(a8 + 32);
    *(_OWORD *)(a6 + 74) = *(_OWORD *)(a8 + 74);
    *(_OWORD *)(a6 + 48) = v16;
    *(_OWORD *)(a6 + 64) = v15;
    *(_OWORD *)(a6 + 32) = v17;
    *(_OWORD *)(a8 + 64) = *(_OWORD *)v40;
    *(_OWORD *)(a8 + 74) = *(_OWORD *)&v40[10];
    *(_OWORD *)(a8 + 32) = v34;
    *(_OWORD *)(a8 + 48) = v37;
    result.n128_u64[1] = *((_QWORD *)&v28 + 1);
    *(_OWORD *)a8 = v28;
    *(_OWORD *)(a8 + 16) = v31;
    result.n128_u64[0] = *(_QWORD *)(a6 + 8);
    v18 = *(double *)(a4 + 8);
    if (result.n128_f64[0] < v18 || result.n128_f64[0] <= v18 && *(_BYTE *)(a6 + 88) && !*(_BYTE *)(a4 + 88))
    {
      v35 = *(_OWORD *)(a4 + 32);
      v38 = *(_OWORD *)(a4 + 48);
      *(_OWORD *)v41 = *(_OWORD *)(a4 + 64);
      *(_OWORD *)&v41[16] = *(_OWORD *)(a4 + 80);
      v29 = *(_OWORD *)a4;
      v32 = *(_OWORD *)(a4 + 16);
      v19 = *(_OWORD *)(a6 + 16);
      *(_OWORD *)a4 = *(_OWORD *)a6;
      *(_OWORD *)(a4 + 16) = v19;
      v21 = *(_OWORD *)(a6 + 48);
      v20 = *(_OWORD *)(a6 + 64);
      v22 = *(_OWORD *)(a6 + 32);
      *(_OWORD *)(a4 + 74) = *(_OWORD *)(a6 + 74);
      *(_OWORD *)(a4 + 48) = v21;
      *(_OWORD *)(a4 + 64) = v20;
      *(_OWORD *)(a4 + 32) = v22;
      *(_OWORD *)(a6 + 64) = *(_OWORD *)v41;
      *(_OWORD *)(a6 + 74) = *(_OWORD *)&v41[10];
      *(_OWORD *)(a6 + 32) = v35;
      *(_OWORD *)(a6 + 48) = v38;
      result.n128_u64[1] = *((_QWORD *)&v29 + 1);
      *(_OWORD *)a6 = v29;
      *(_OWORD *)(a6 + 16) = v32;
      result.n128_u64[0] = *(_QWORD *)(a4 + 8);
      v23 = *(double *)(a2 + 8);
      if (result.n128_f64[0] < v23 || result.n128_f64[0] <= v23 && *(_BYTE *)(a4 + 88) && !*(_BYTE *)(a2 + 88))
      {
        v36 = *(_OWORD *)(a2 + 32);
        v39 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)v42 = *(_OWORD *)(a2 + 64);
        *(_OWORD *)&v42[16] = *(_OWORD *)(a2 + 80);
        v30 = *(__n128 *)a2;
        v33 = *(_OWORD *)(a2 + 16);
        v24 = *(_OWORD *)(a4 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a4;
        *(_OWORD *)(a2 + 16) = v24;
        v26 = *(_OWORD *)(a4 + 48);
        v25 = *(_OWORD *)(a4 + 64);
        v27 = *(_OWORD *)(a4 + 32);
        *(_OWORD *)(a2 + 74) = *(_OWORD *)(a4 + 74);
        *(_OWORD *)(a2 + 48) = v26;
        *(_OWORD *)(a2 + 64) = v25;
        *(_OWORD *)(a2 + 32) = v27;
        *(_OWORD *)(a4 + 64) = *(_OWORD *)v42;
        *(_OWORD *)(a4 + 74) = *(_OWORD *)&v42[10];
        *(_OWORD *)(a4 + 32) = v36;
        *(_OWORD *)(a4 + 48) = v39;
        result = v30;
        *(__n128 *)a4 = v30;
        *(_OWORD *)(a4 + 16) = v33;
      }
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<_MNRouteConvergencePoint *>>(unint64_t a1)
{
  if (a1 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a1);
}

void MNDisplayETAAndRemainingMinutes(_QWORD *a1, _QWORD *a2, double a3)
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v12 = v6;
    objc_msgSend(v6, "dateByAddingTimeInterval:", fmax(a3, 60.0));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a1)
      *a1 = objc_retainAutorelease(v7);
    if (a2)
    {
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v10 = floor(v9 / 60.0);
      objc_msgSend(v8, "timeIntervalSinceReferenceDate");
      *a2 = (unint64_t)(floor(v11 / 60.0) - v10);
    }

    v6 = v12;
  }
  else
  {
    if (a1)
      *a1 = 0;
    if (a2)
      *a2 = 0;
  }

}

void sub_1B0B7397C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

BOOL MNTransportTypeSupportsTurnByTurn(int a1)
{
  return (a1 & 0xFFFFFFFD) == 0 || a1 == 3;
}

uint64_t ____scheduleDebugConfigKeyReset_block_invoke()
{
  return _GEOConfigRemoveValue();
}

id GetAudioLogForMNAudioSystemEventQueueCategory()
{
  if (qword_1ED0C4040 != -1)
    dispatch_once(&qword_1ED0C4040, &__block_literal_global_32);
  return (id)_MergedGlobals_37;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

BOOL _navigation_GEOLatLngIsNilOrZero(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double v4;
  _BOOL8 v5;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "lat");
    if (v3 == 0.0)
    {
      objc_msgSend(v2, "lng");
      v5 = v4 == 0.0;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

id _regionsFromLatLngs(void *a1)
{
  id v1;
  uint64_t v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    GEOConfigGetDouble();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = ___regionsFromLatLngs_block_invoke;
    v16[3] = &__block_descriptor_40_e33___GEOMapRegion_16__0__GEOLatLng_8l;
    v16[4] = v2;
    v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E0E364](v16);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v1;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v3[2](v3, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

id ___regionsFromLatLngs_block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(a2, "coordinate");
  GEOMapRectMakeWithRadialDistance();
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D27208]), "initWithMapRect:", v2, v3, v4, v5);
}

void sub_1B0B7CAA4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B0B7CBA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void sub_1B0B7CC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0B7CD78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0B7D480(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_1B0B7E770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0B80F14(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B0B82EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0B8332C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id GetAudioLogForMNAudioSessionResourceAccessCategory()
{
  if (qword_1ED0C40B0 != -1)
    dispatch_once(&qword_1ED0C40B0, &__block_literal_global_40);
  return (id)_MergedGlobals_41;
}

id GetAudioLogForMNSpeechResourceControllerCategory()
{
  if (qword_1ED0C40C0 != -1)
    dispatch_once(&qword_1ED0C40C0, &__block_literal_global_41);
  return (id)_MergedGlobals_42;
}

void sub_1B0B88D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,id a24,char a25)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  _Block_object_dispose(&a25, 8);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void sub_1B0B895E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  id *v30;
  id *v31;
  id *v32;
  id *v33;
  id *v34;
  uint64_t v35;

  objc_destroyWeak(v34);
  objc_destroyWeak(v33);
  objc_destroyWeak(v32);
  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  objc_destroyWeak(location);
  objc_destroyWeak(&a30);
  objc_destroyWeak((id *)(v35 - 160));
  _Unwind_Resume(a1);
}

id MNMap(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD, uint64_t);
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), v9 + v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "addObject:", v12, (_QWORD)v15);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v9 += v11;
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

void sub_1B0B8DFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL MNCurrentNavigationStateAllowsDoom()
{
  void *v0;
  uint64_t v1;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "currentStateType");

  return (unint64_t)(v1 - 7) < 0xFFFFFFFFFFFFFFFCLL;
}

void sub_1B0B92740(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B0B92940(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B0B92ACC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B0B92BB0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B0B92C94(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B0B92D78(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B0B92E5C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B0B92F40(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B0B93024(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B0B93108(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B0B931EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B0B932FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B0B93414(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B0B93518(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B0B969F0(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x200], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void sub_1B0B971A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0B9730C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0B97834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id navDisplayAddressForMapItem(void *a1, _DWORD *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "addressObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
    *a2 = 2;
  return v4;
}

id navDisplayNameForMapItem(void *a1, int a2, _DWORD *a3)
{
  id v5;
  void *v6;
  int v7;
  __CFString *v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = a1;
  objc_msgSend(v5, "contactName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a2)
    goto LABEL_23;
  v7 = objc_msgSend(v5, "contactAddressType");
  if (v7 == 3)
  {
    if (a3)
      *a3 = 3;
    if (objc_msgSend(v5, "contactIsMe"))
    {
      v8 = CFSTR("MapsExtra_School");
      goto LABEL_17;
    }
    if (objc_msgSend(v6, "length"))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = CFSTR("MapsExtra_ContactSchool");
      goto LABEL_31;
    }
    goto LABEL_23;
  }
  if (v7 == 2)
  {
    if (a3)
      *a3 = 3;
    if (objc_msgSend(v5, "contactIsMe"))
    {
      v8 = CFSTR("MapsExtras_Work");
      goto LABEL_17;
    }
    if (v6)
    {
      if (objc_msgSend(v6, "length"))
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = CFSTR("MapsExtras_ContactWork");
        goto LABEL_31;
      }
      goto LABEL_24;
    }
LABEL_32:
    if (objc_msgSend(v5, "_hasTransit"))
    {
      objc_msgSend(v5, "_transitInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "displayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");

      if (v16)
      {
        if (a3)
          *a3 = 4;
        objc_msgSend(v13, "displayName");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_44;
      }

    }
    objc_msgSend(v5, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    if (v17 && objc_msgSend(v17, "length"))
    {
      if (a3)
        *a3 = 4;
      v14 = v13;
    }
    else
    {
      navDisplayAddressForMapItem(v5, a3);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_44;
  }
  if (v7 != 1)
  {
LABEL_23:
    if (v6)
      goto LABEL_24;
    goto LABEL_32;
  }
  if (a3)
    *a3 = 3;
  if (!objc_msgSend(v5, "contactIsMe"))
  {
    if (v6)
    {
      if (objc_msgSend(v6, "length"))
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = CFSTR("MapsExtras_ContactHome");
LABEL_31:
        _MNLocalizedStringFromThisBundle(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", v13, v6);
        v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:
        v12 = v14;

        goto LABEL_45;
      }
LABEL_24:
      if (a3)
        *a3 = 3;
      v9 = v6;
      goto LABEL_27;
    }
    goto LABEL_32;
  }
  v8 = CFSTR("MapsExtras_Home");
LABEL_17:
  _MNLocalizedStringFromThisBundle(v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
  v12 = v9;
LABEL_45:

  return v12;
}

void CoreWiFiLibrary()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = CoreWiFiLibraryCore_frameworkLibrary;
  v6 = CoreWiFiLibraryCore_frameworkLibrary;
  if (!CoreWiFiLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E61D7C08;
    v8 = *(_OWORD *)&off_1E61D7C18;
    v1 = _sl_dlopen();
    v4[3] = v1;
    CoreWiFiLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    __break(1u);
    free(v2);
  }
}

void sub_1B0B98578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCWFInterfaceClass_block_invoke(uint64_t a1)
{
  CoreWiFiLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CWFInterface");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCWFInterfaceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    CoreAutomationDeviceLibrary();
  }
}

void CoreAutomationDeviceLibrary()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = CoreAutomationDeviceLibraryCore_frameworkLibrary;
  v6 = CoreAutomationDeviceLibraryCore_frameworkLibrary;
  if (!CoreAutomationDeviceLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E61D7C28;
    v8 = *(_OWORD *)&off_1E61D7C38;
    v1 = _sl_dlopen();
    v4[3] = v1;
    CoreAutomationDeviceLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    __break(1u);
    free(v2);
  }
}

void sub_1B0B986D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCAMDEmbeddedDeviceServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreAutomationDeviceLibrary();
  result = objc_getClass("CAMDEmbeddedDeviceService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_43 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)ConditionInducerLibrary(v3);
  }
  return result;
}

void ConditionInducerLibrary()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = ConditionInducerLibraryCore_frameworkLibrary;
  v6 = ConditionInducerLibraryCore_frameworkLibrary;
  if (!ConditionInducerLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E61D7C48;
    v8 = *(_OWORD *)&off_1E61D7C58;
    v1 = _sl_dlopen();
    v4[3] = v1;
    ConditionInducerLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    __break(1u);
    free(v2);
  }
}

void sub_1B0B98838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCOConditionSessionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  ConditionInducerLibrary();
  result = objc_getClass("COConditionSession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCOConditionSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)abort_report_np();
    return (Class)+[MNTraceNetworkConditionHelper getCurrentState](v3, v4);
  }
  return result;
}

void sub_1B0B98CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0B98DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id errorFromCTError(uint64_t a1)
{
  __CFString *v2;
  char *v3;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  switch((_DWORD)a1)
  {
    case 0:
      return 0;
    case 2:
      v2 = (__CFString *)(id)*MEMORY[0x1E0CB2D98];
      v3 = mach_error_string(SHIDWORD(a1));
      break;
    case 1:
      v2 = (__CFString *)(id)*MEMORY[0x1E0CB2FE0];
      v3 = strerror(SHIDWORD(a1));
      break;
    default:
      v5 = "Unknown";
      v2 = CFSTR("Unknown");
      goto LABEL_9;
  }
  v5 = v3;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2938];
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v2, a1 >> 32, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t ctConnection()
{
  uint64_t result;

  result = ctConnection_connection;
  if (!ctConnection_connection)
  {
    result = _CTServerConnectionCreateOnTargetQueue();
    ctConnection_connection = result;
  }
  return result;
}

void sub_1B0B9935C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0B9A434(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B0B9A4DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B0B9D0EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1B0B9DAC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0B9DCAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GetAudioLogForMNVoiceLanguageUtilCategory()
{
  if (qword_1ED0C4100 != -1)
    dispatch_once(&qword_1ED0C4100, &__block_literal_global_46);
  return (id)_MergedGlobals_46;
}

void sub_1B0BA2304(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B0BA2428(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B0BA25B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0BA6E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B0BB3104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0BB6954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void sub_1B0BB7244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id GetAudioLogForMNAudioPathwayResourceAccessCategory()
{
  if (qword_1ED0C4140 != -1)
    dispatch_once(&qword_1ED0C4140, &__block_literal_global_51);
  return (id)_MergedGlobals_50;
}

void sub_1B0BBB9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0BBBA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void sub_1B0BBE2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B0BBF5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, id *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,id a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a69;
  id *v69;
  uint64_t v70;

  objc_destroyWeak(v69);
  objc_destroyWeak(location);
  objc_destroyWeak(a13);
  objc_destroyWeak(&a56);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose((const void *)(v70 - 240), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{

}

void sub_1B0BC1768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id GetAudioLogForMNAudioManagerCategory()
{
  if (qword_1ED0C4160 != -1)
    dispatch_once(&qword_1ED0C4160, &__block_literal_global_53);
  return (id)_MergedGlobals_52;
}

void sub_1B0BC7E70(_Unwind_Exception *a1)
{
  _geo_isolate_unlock();
  _Unwind_Resume(a1);
}

void sub_1B0BC7ED4(_Unwind_Exception *a1)
{
  _geo_isolate_unlock();
  _Unwind_Resume(a1);
}

void sub_1B0BC80A0(_Unwind_Exception *a1)
{
  _geo_isolate_unlock();
  _Unwind_Resume(a1);
}

void sub_1B0BC8194(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B0BC84DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getRTRoutineManagerClass()
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
  v0 = (void *)qword_1ED0C4180;
  v7 = qword_1ED0C4180;
  if (!qword_1ED0C4180)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRTRoutineManagerClass_block_invoke;
    v3[3] = &unk_1E61D36B0;
    v3[4] = &v4;
    __getRTRoutineManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B0BC96F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRTRoutineManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  Class result;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = _MergedGlobals_54;
  v9 = _MergedGlobals_54;
  if (!_MergedGlobals_54)
  {
    v10 = xmmword_1E61D85A0;
    v11 = *(_OWORD *)&off_1E61D85B0;
    v3 = _sl_dlopen();
    v7[3] = v3;
    _MergedGlobals_54 = v3;
    v2 = v3;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v5 = (void *)abort_report_np();
    __break(1u);
    free(v5);
  }
  result = objc_getClass("RTRoutineManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    abort_report_np();
  qword_1ED0C4180 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B0BC9838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0BC9A44(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1B0BCA760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1B0BCA984()
{
  return MEMORY[0x1E0CADE58]();
}

uint64_t sub_1B0BCA990()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1B0BCA99C()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1B0BCA9A8()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1B0BCA9B4()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_1B0BCA9C0()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_1B0BCA9CC()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_1B0BCA9D8()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1B0BCA9E4()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1B0BCA9F0()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1B0BCA9FC()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1B0BCAA08()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1B0BCAA14()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B0BCAA20()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B0BCAA2C()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1B0BCAA38()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B0BCAA44()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1B0BCAA50()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B0BCAA5C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B0BCAA68()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1B0BCAA74()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1B0BCAA80()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1B0BCAA8C()
{
  return MEMORY[0x1E0CB2020]();
}

uint64_t sub_1B0BCAA98()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1B0BCAAA4()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1B0BCAAB0()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1B0BCAABC()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1B0BCAAC8()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1B0BCAAD4()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1B0BCAAE0()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1B0BCAAEC()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B0BCAAF8()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1B0BCAB04()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1B0BCAB10()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1B0BCAB1C()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1B0BCAB28()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1B0BCAB34()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1B0BCAB40()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1B0BCAB4C()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1B0BCAB58()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1B0BCAB64()
{
  return MEMORY[0x1E0DEDED8]();
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
  MEMORY[0x1E0C92158](*(_QWORD *)&inSystemSoundID, inCompletionBlock);
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x1E0C92160]();
}

uint64_t AudioServicesStopSystemSound()
{
  return MEMORY[0x1E0C92188]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringRef CFStringTokenizerCopyBestStringLanguage(CFStringRef string, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99210](string, range.location, range.length);
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1E0C9E300]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x1E0C9E308](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CLSetMapMatchingRouteHint()
{
  return MEMORY[0x1E0C9E330]();
}

uint64_t GEOAngleDifferenceDegrees()
{
  return MEMORY[0x1E0D26438]();
}

uint64_t GEOBearingFromCoordinateToCoordinate()
{
  return MEMORY[0x1E0D26450]();
}

uint64_t GEOCalculateDistance()
{
  return MEMORY[0x1E0D26458]();
}

uint64_t GEOClosestCoordinateOnLineSegmentFromCoordinate3D()
{
  return MEMORY[0x1E0D26478]();
}

uint64_t GEOConfigGetBOOL()
{
  return MEMORY[0x1E0D26498]();
}

uint64_t GEOConfigGetDate()
{
  return MEMORY[0x1E0D264A0]();
}

uint64_t GEOConfigGetDouble()
{
  return MEMORY[0x1E0D264B0]();
}

uint64_t GEOConfigGetInteger()
{
  return MEMORY[0x1E0D264B8]();
}

uint64_t GEOConfigGetPropertiesForKey()
{
  return MEMORY[0x1E0D264C0]();
}

uint64_t GEOConfigGetString()
{
  return MEMORY[0x1E0D264C8]();
}

uint64_t GEOConfigGetUInteger()
{
  return MEMORY[0x1E0D264D0]();
}

uint64_t GEOConfigRemoveBlockListener()
{
  return MEMORY[0x1E0D264F0]();
}

uint64_t GEOConfigRemoveDelegateListenerForAllKeys()
{
  return MEMORY[0x1E0D264F8]();
}

uint64_t GEOConfigSetArray()
{
  return MEMORY[0x1E0D26500]();
}

uint64_t GEOConfigSetBOOL()
{
  return MEMORY[0x1E0D26508]();
}

uint64_t GEOCoordinate2DForMapPoint()
{
  return MEMORY[0x1E0D26530]();
}

uint64_t GEOCoordinateRegionForMapRect()
{
  return MEMORY[0x1E0D26540]();
}

uint64_t GEOErrorDomain()
{
  return MEMORY[0x1E0D26578]();
}

uint64_t GEOErrorReasonKey()
{
  return MEMORY[0x1E0D26590]();
}

uint64_t GEOEvChargingConnectorTypeFromVGConnectorType()
{
  return MEMORY[0x1E0DC6BB8]();
}

uint64_t GEOFeatureGetLocalizedLabel()
{
  return MEMORY[0x1E0D265B0]();
}

uint64_t GEOFeatureGetLocalizedShield()
{
  return MEMORY[0x1E0D265B8]();
}

uint64_t GEOFeatureGetNativeLabel()
{
  return MEMORY[0x1E0D265C0]();
}

uint64_t GEOFindOrCreateLog()
{
  return MEMORY[0x1E0D265D0]();
}

uint64_t GEOMapPointForCoordinate()
{
  return MEMORY[0x1E0D26670]();
}

uint64_t GEOMapPointsPerMeterAtLatitude()
{
  return MEMORY[0x1E0D26680]();
}

uint64_t GEOMapRectContainsPoint()
{
  return MEMORY[0x1E0D26690]();
}

uint64_t GEOMapRectForCoordinateRegion()
{
  return MEMORY[0x1E0D26698]();
}

uint64_t GEOMapRectForGEOTileKey()
{
  return MEMORY[0x1E0D266A0]();
}

uint64_t GEOMapRectIntersectsRect()
{
  return MEMORY[0x1E0D266B8]();
}

uint64_t GEOMapRectMakeWithRadialDistance()
{
  return MEMORY[0x1E0D266D0]();
}

uint64_t GEOMapRectUnion()
{
  return MEMORY[0x1E0D266E0]();
}

uint64_t GEOMultiSectionFeaturePoints()
{
  return MEMORY[0x1E0D26710]();
}

uint64_t GEOOfflineDeviceAsString()
{
  return MEMORY[0x1E0D26758]();
}

uint64_t GEOOfflineModeAsString()
{
  return MEMORY[0x1E0D26760]();
}

uint64_t GEOOfflineStateAsString()
{
  return MEMORY[0x1E0D26768]();
}

uint64_t GEOPolylineCoordinateAsFullString()
{
  return MEMORY[0x1E0D26A00]();
}

uint64_t GEOPolylineCoordinateAsShortString()
{
  return MEMORY[0x1E0D26A08]();
}

uint64_t GEOPolylineCoordinateAsString()
{
  return MEMORY[0x1E0D26A10]();
}

uint64_t GEOPolylineCoordinateCompare()
{
  return MEMORY[0x1E0D26A18]();
}

uint64_t GEOPolylineCoordinateEqual()
{
  return MEMORY[0x1E0D26A20]();
}

uint64_t GEOPolylineCoordinateInRange()
{
  return MEMORY[0x1E0D26A30]();
}

uint64_t GEOPolylineCoordinateIsABeforeB()
{
  return MEMORY[0x1E0D26A40]();
}

uint64_t GEOPolylineCoordinateIsABeforeOrEqualToB()
{
  return MEMORY[0x1E0D26A48]();
}

uint64_t GEOPolylineCoordinateIsInvalid()
{
  return MEMORY[0x1E0D26A50]();
}

uint64_t GEOPolylineCoordinateIsValid()
{
  return MEMORY[0x1E0D26A58]();
}

uint64_t GEOPolylineCoordinateNearestIndex()
{
  return MEMORY[0x1E0D26A60]();
}

uint64_t GEOPolylineCoordinateRangeAsString()
{
  return MEMORY[0x1E0D26A68]();
}

uint64_t GEOPolylineCoordinateRangeEncompassesRange()
{
  return MEMORY[0x1E0D26A70]();
}

uint64_t GEOPolylineCoordinateRangeEqual()
{
  return MEMORY[0x1E0D26A78]();
}

uint64_t GEOPolylineCoordinateRangeIntersectsRange()
{
  return MEMORY[0x1E0D26A80]();
}

uint64_t GEOPolylineCoordinateRangeIsInvalid()
{
  return MEMORY[0x1E0D26A90]();
}

uint64_t GEOPolylineCoordinateRangeIsValid()
{
  return MEMORY[0x1E0D26A98]();
}

uint64_t GEOPolylineCoordinateWithinRange()
{
  return MEMORY[0x1E0D26AA0]();
}

uint64_t GEORegisterPListStateCaptureLegacy()
{
  return MEMORY[0x1E0D279B8]();
}

uint64_t GEOResourcesPath()
{
  return MEMORY[0x1E0D26AF8]();
}

uint64_t GEORoundedDistanceMeasurement()
{
  return MEMORY[0x1E0D26B08]();
}

uint64_t GEOServerFormatTokenEqual()
{
  return MEMORY[0x1E0D26B18]();
}

uint64_t GEOStringForDuration()
{
  return MEMORY[0x1E0D26B98]();
}

uint64_t GEOStringForError()
{
  return MEMORY[0x1E0D26BA0]();
}

uint64_t GEOStringFromCoordinateRegionBounds()
{
  return MEMORY[0x1E0D26BA8]();
}

uint64_t GEOTileKeyMake()
{
  return MEMORY[0x1E0D26BD8]();
}

uint64_t GEOTileLoaderClientIdentifier()
{
  return MEMORY[0x1E0D26C00]();
}

uint64_t GEOTransitDepartureIsImminentDepartureTimeInterval()
{
  return MEMORY[0x1E0D26C10]();
}

uint64_t GEOUnregisterStateCaptureLegacy()
{
  return MEMORY[0x1E0D279C0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MapsFeature_IsEnabled_DrivingMultiWaypointRoutes()
{
  return MEMORY[0x1E0D26D48]();
}

void NSSetUncaughtExceptionHandler(NSUncaughtExceptionHandler *a1)
{
  MEMORY[0x1E0CB3198](a1);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x1E0C9A320]();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return MEMORY[0x1E0C9A398]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1E0CA6F30]();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return MEMORY[0x1E0CA6F88]();
}

uint64_t _CTServerConnectionSetCellularDataIsEnabled()
{
  return MEMORY[0x1E0CA7060]();
}

uint64_t _GEOConfigAddBlockListenerForKey()
{
  return MEMORY[0x1E0D277B0]();
}

uint64_t _GEOConfigAddDelegateListenerForKey()
{
  return MEMORY[0x1E0D277B8]();
}

uint64_t _GEOConfigHasValue()
{
  return MEMORY[0x1E0D277C0]();
}

uint64_t _GEOConfigRegisterStateCaptureFunctions()
{
  return MEMORY[0x1E0D277C8]();
}

uint64_t _GEOConfigRemoveValue()
{
  return MEMORY[0x1E0D277D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E61CF480(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E61CF488(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t _geo_isolate_lock()
{
  return MEMORY[0x1E0D279E8]();
}

uint64_t _geo_isolate_lock_data()
{
  return MEMORY[0x1E0D279F0]();
}

uint64_t _geo_isolate_unlock()
{
  return MEMORY[0x1E0D279F8]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t descriptionForLaneInfos()
{
  return MEMORY[0x1E0D278B0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

uint64_t geo_dispatch_queue_create()
{
  return MEMORY[0x1E0D27A20]();
}

uint64_t geo_dispatch_queue_create_with_qos()
{
  return MEMORY[0x1E0D27A30]();
}

uint64_t geo_get_global_queue()
{
  return MEMORY[0x1E0D27A78]();
}

uint64_t geo_isolate_sync()
{
  return MEMORY[0x1E0D27A90]();
}

uint64_t geo_isolate_sync_data()
{
  return MEMORY[0x1E0D27A98]();
}

uint64_t geo_isolater_create()
{
  return MEMORY[0x1E0D27AA0]();
}

void mach_error(const char *str, mach_error_t error_value)
{
  MEMORY[0x1E0C83C78](str, *(_QWORD *)&error_value);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C840E8](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C84100]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C84110](*(_QWORD *)&reply_port);
}

float modff(float a1, float *a2)
{
  float result;

  MEMORY[0x1E0C841E8](a2, a1);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1E0DE8088](p, isRequiredMethod, isInstanceMethod, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1E0DE85C0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE8648](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

int sqlite3_data_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8730](pStmt);
}

int sqlite3_db_config(sqlite3 *a1, int op, ...)
{
  return MEMORY[0x1E0DE8738](a1, *(_QWORD *)&op);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1E0DE8790](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x1E0DE87A8](pStmt);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8820](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

