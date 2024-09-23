uint64_t start(int a1, char **a2)
{
  objc_class *v4;
  NSString *v5;
  NSString *v6;
  objc_class *v7;
  NSString *v8;
  NSString *v9;
  uint64_t v10;

  v4 = (objc_class *)objc_opt_class(MRMediaRemoteUIServiceApplication);
  v5 = NSStringFromClass(v4);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (objc_class *)objc_opt_class(_TtC20MediaRemoteUIService11AppDelegate);
  v8 = NSStringFromClass(v7);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(v8);
  v10 = UIApplicationMain(a1, a2, v6, v9);

  return v10;
}

void sub_100002498()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[3];

  v4[0] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v4[1] = FBSOpenApplicationOptionKeyUnlockDevice;
  v5[0] = &__kCFBooleanTrue;
  v5[1] = &__kCFBooleanTrue;
  v4[2] = FBSOpenApplicationOptionKeyPayloadURL;
  v5[2] = CFSTR("music://show-now-playing");
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 3));
  v1 = SBSCreateOpenApplicationService();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v0));
  objc_msgSend(v2, "openApplication:withOptions:completion:", CFSTR("com.apple.Music"), v3, &stru_10000C8A0);

}

uint64_t sub_1000025A0()
{
  return SceneSettingScopes.ActivitySettings.activityIdentifier.getter();
}

uint64_t sub_1000025C0()
{
  return SceneSettingScopes.ActivitySettings.activityDescriptor.getter();
}

void sub_1000025E0(void *a1)
{
  uint64_t v2;
  uint64_t inited;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  Class isa;
  void *v16;
  _QWORD v17[6];
  _BYTE v18[112];

  v2 = sub_100004E2C(&qword_100011F20);
  inited = swift_initStackObject(v2, v18);
  *(_OWORD *)(inited + 16) = xmmword_10000ACD0;
  v4 = (void *)MRGroupSessionEventOptionDiscoveredSessionIdentifier;
  *(_QWORD *)(inited + 32) = MRGroupSessionEventOptionDiscoveredSessionIdentifier;
  v5 = v4;
  v6 = objc_msgSend(a1, "identifier");
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v9 = v8;

  *(_QWORD *)(inited + 40) = v7;
  *(_QWORD *)(inited + 48) = v9;
  v10 = (void *)MRGroupSessionEventOptionEventType;
  *(_QWORD *)(inited + 64) = &type metadata for String;
  *(_QWORD *)(inited + 72) = v10;
  v11 = objc_allocWithZone((Class)NSNumber);
  v12 = v10;
  v13 = objc_msgSend(v11, "initWithInteger:", 1);
  *(_QWORD *)(inited + 104) = sub_100005004(0, &qword_100011F28, NSNumber_ptr);
  *(_QWORD *)(inited + 80) = v13;
  v14 = sub_100002790(inited);
  type metadata accessor for MRGroupSessionEventOption(0);
  sub_100004E6C(&qword_100011F30, (uint64_t (*)(uint64_t))type metadata accessor for MRGroupSessionEventOption, (uint64_t)&unk_10000AED0);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  v17[4] = sub_1000028A8;
  v17[5] = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_100002A4C;
  v17[3] = &unk_10000CA00;
  v16 = _Block_copy(v17);
  MRGroupSessionSendEvent(isa, v16);
  _Block_release(v16);

}

unint64_t sub_100002790(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004E2C(&qword_100011F40);
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
    sub_100005068(v7, (uint64_t)&v14);
    v8 = v14;
    result = sub_100003DA4(v14);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v8;
    result = (unint64_t)sub_100004EF0(&v15, (_OWORD *)(v4[7] + 32 * result));
    v11 = v4[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4[2] = v13;
    v7 += 40;
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

uint64_t sub_1000028A8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (result)
  {
    v1 = result;
    v2 = ((uint64_t (*)(void))swift_errorRetain)();
    v3 = static os_log_type_t.error.getter(v2);
    if (qword_100011DE8 != -1)
      swift_once(&qword_100011DE8, sub_100007B34);
    v4 = qword_100012780;
    v5 = v3;
    if (os_log_type_enabled((os_log_t)qword_100012780, v3))
    {
      swift_errorRetain(v1);
      swift_errorRetain(v1);
      v6 = (uint8_t *)swift_slowAlloc(12, -1);
      v7 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v6 = 138412290;
      swift_errorRetain(v1);
      v8 = _swift_stdlib_bridgeErrorToNSError(v1);
      v10 = v8;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v6 + 4, v6 + 12);
      *v7 = v8;
      swift_errorRelease(v1);
      swift_errorRelease(v1);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "MRGroupSessionSendEvent error: %@", v6, 0xCu);
      v9 = sub_100004E2C(&qword_100011F38);
      swift_arrayDestroy(v7, 1, v9);
      swift_slowDealloc(v7, -1, -1);
      swift_slowDealloc(v6, -1, -1);
      return swift_errorRelease(v1);
    }
    else
    {
      return swift_errorRelease(v1);
    }
  }
  return result;
}

void sub_100002A4C(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void *);
  id v5;

  v4 = *(void (**)(void *))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4(a2);
  swift_release(v3);

}

void sub_100002B1C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t Strong;
  void *v5;
  id v6;
  char v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  id v11;
  char v12;
  uint64_t v13;
  void *v14;

  v2 = v1;
  Strong = swift_unknownObjectWeakLoadStrong(v1 + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionLowPowerScene);
  if (Strong)
  {
    v5 = (void *)Strong;
    sub_100005004(0, &qword_100011ED8, UIScene_ptr);
    v6 = a1;
    v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) != 0)
    {
      v8 = &OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionLowPowerWindow;
LABEL_7:
      v13 = *v8;
      v14 = *(void **)(v2 + v13);
      *(_QWORD *)(v2 + v13) = 0;

      return;
    }
  }
  v9 = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationScene);
  if (v9)
  {
    v10 = (void *)v9;
    sub_100005004(0, &qword_100011ED8, UIScene_ptr);
    v11 = a1;
    v12 = static NSObject.== infix(_:_:)();

    if ((v12 & 1) != 0)
    {
      v8 = &OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow;
      goto LABEL_7;
    }
  }
}

void sub_100002C8C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t Strong;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v2 = v1;
  v4 = static os_log_type_t.default.getter(a1);
  if (qword_100011DE8 != -1)
    swift_once(&qword_100011DE8, sub_100007B34);
  os_log(_:dso:log:_:_:)(v4, &_mh_execute_header, qword_100012780, "Scene will enter foreground", 27, 2, &_swiftEmptyArrayStorage);
  Strong = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationScene);
  if (Strong)
  {
    v6 = (void *)Strong;
    sub_100005004(0, &qword_100011ED8, UIScene_ptr);
    v7 = a1;
    v8 = static NSObject.== infix(_:_:)();

    if ((v8 & 1) != 0)
    {
      v10 = static os_log_type_t.default.getter(v9);
      os_log(_:dso:log:_:_:)(v10, &_mh_execute_header, qword_100012780, "RouteRecommendationScene will enter foreground", 46, 2, &_swiftEmptyArrayStorage);
      v11 = OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow;
      v12 = *(void **)(v2 + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow);
      if (v12)
      {
        v13 = objc_msgSend(v12, "rootViewController");
        if (v13)
        {
          v14 = v13;
          objc_msgSend(v13, "beginAppearanceTransition:animated:", 1, 0);

        }
      }
      v15 = objc_msgSend(*(id *)(v2 + v11), "rootViewController");
      objc_msgSend(v15, "endAppearanceTransition");

    }
  }
}

void sub_100002E88(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t Strong;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v2 = v1;
  v4 = static os_log_type_t.default.getter(a1);
  if (qword_100011DE8 != -1)
    swift_once(&qword_100011DE8, sub_100007B34);
  os_log(_:dso:log:_:_:)(v4, &_mh_execute_header, qword_100012780, "Scene did enter background", 26, 2, &_swiftEmptyArrayStorage);
  Strong = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationScene);
  if (Strong)
  {
    v6 = (void *)Strong;
    sub_100005004(0, &qword_100011ED8, UIScene_ptr);
    v7 = a1;
    v8 = static NSObject.== infix(_:_:)();

    if ((v8 & 1) != 0)
    {
      v10 = static os_log_type_t.default.getter(v9);
      os_log(_:dso:log:_:_:)(v10, &_mh_execute_header, qword_100012780, "RouteRecommendationScene did enter background", 45, 2, &_swiftEmptyArrayStorage);
      v11 = OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow;
      v12 = *(void **)(v2 + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow);
      if (v12)
      {
        v13 = objc_msgSend(v12, "rootViewController");
        if (v13)
        {
          v14 = v13;
          objc_msgSend(v13, "beginAppearanceTransition:animated:", 0, 0);

        }
      }
      v15 = objc_msgSend(*(id *)(v2 + v11), "rootViewController");
      objc_msgSend(v15, "endAppearanceTransition");

    }
  }
}

id sub_100003084()
{
  char *v0;
  objc_super v2;

  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionLowPowerScene], 0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionLowPowerWindow] = 0;
  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyScene], 0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyViewController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyWindow] = 0;
  swift_unknownObjectWeakInit(&v0[OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationScene], 0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySceneDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100003140()
{
  return sub_100003368(type metadata accessor for ActivitySceneDelegate);
}

uint64_t type metadata accessor for ActivitySceneDelegate()
{
  return objc_opt_self(_TtC20MediaRemoteUIService21ActivitySceneDelegate);
}

id sub_10000335C()
{
  return sub_100003368(type metadata accessor for SecureWindow);
}

id sub_100003368(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for SecureWindow()
{
  return objc_opt_self(_TtC20MediaRemoteUIService12SecureWindow);
}

uint64_t sub_1000033B8(uint64_t a1, uint64_t a2)
{
  return sub_100003500(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000033C4(uint64_t a1, id *a2)
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

uint64_t sub_100003438(uint64_t a1, id *a2)
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

uint64_t sub_1000034B4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

uint64_t sub_1000034F4(uint64_t a1, uint64_t a2)
{
  return sub_100003500(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100003500(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_10000353C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_10000357C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_1000035EC(_QWORD *a1, uint64_t *a2)
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
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
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

uint64_t sub_100003674@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_1000036B8@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000036E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100004E6C(&qword_100011F30, (uint64_t (*)(uint64_t))type metadata accessor for MRGroupSessionEventOption, (uint64_t)&unk_10000AED0);
  v3 = sub_100004E6C(&qword_100011F78, (uint64_t (*)(uint64_t))type metadata accessor for MRGroupSessionEventOption, (uint64_t)&unk_10000AE30);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100003764(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100003834(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000050D0((uint64_t)v12, *a3);
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
      sub_1000050D0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000050B0(v12);
  return v7;
}

uint64_t sub_100003834(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_1000039EC(a5, a6);
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
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_1000039EC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100003A80(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100003C58(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100003C58(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100003A80(uint64_t a1, unint64_t a2)
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
      v5 = sub_100003BF4(v4, 0);
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

_QWORD *sub_100003BF4(uint64_t a1, uint64_t a2)
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
  v4 = sub_100004E2C(&qword_100011F50);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100003C58(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100004E2C(&qword_100011F50);
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

unint64_t sub_100003DA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Int v7;
  _QWORD v9[9];

  v3 = *(_QWORD *)(v1 + 40);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_100003E24(a1, v7);
}

unint64_t sub_100003E24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char v22;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2);
      return v5;
    }
    v13 = v11;
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      v15 = ~v4;
      v5 = (v5 + 1) & v15;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
          v9 = v17;
          v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19)
            break;
          v21 = v19;
          v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            v5 = (v5 + 1) & v15;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

void sub_100003F98(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t KeyPath;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSString v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char v65;
  id v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double Width;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  id v86;
  Class isa;
  id v88;
  uint64_t v89;
  void (**v90)();
  id v91;
  void *v92;
  uint64_t v93;
  void *v94;
  id v95;
  id v96;
  id v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  id v106;
  double v107;
  CGFloat v108;
  double v109;
  CGFloat v110;
  double v111;
  CGFloat v112;
  double v113;
  CGFloat v114;
  double v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  os_log_type_t v120;
  NSObject *v121;
  char *v122;
  uint8_t *v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  unint64_t v127;
  unint64_t v128;
  char *v129;
  void (*v130)(char *, uint64_t);
  uint64_t v131;
  uint8_t *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  NSString v138;
  id v139;
  id v140;
  id v141;
  void *v142;
  Swift::String v143;
  uint64_t v144;
  Swift::String v145;
  void *object;
  uint8_t *v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  id v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  _QWORD v159[2];
  __int128 v160;
  uint64_t v161;
  __int128 v162;
  uint64_t v163;
  CGRect v164;
  CGRect v165;

  sub_100004E2C(&qword_100011EE0);
  ((void (*)(void))__chkstk_darwin)();
  v4 = (char *)&v147 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MediaLiveActivityAttributes(0);
  v157 = *(_QWORD *)(v5 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v156 = (char *)&v147 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v9 = (char *)&v147 - v8;
  v10 = sub_100004E2C(&qword_100011EE8);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v147 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v147 - v14;
  v158 = type metadata accessor for ActivityDescriptor(0);
  v16 = *(_QWORD *)(v158 - 8);
  __chkstk_darwin(v158);
  v18 = (char *)&v147 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for ActivityScene(0);
  v20 = swift_dynamicCastClass(a1, v19);
  if (!v20)
    goto LABEL_9;
  v21 = v20;
  v154 = v1;
  v155 = v18;
  KeyPath = swift_getKeyPath("\bv");
  v23 = a1;
  v24 = v21;
  dispatch thunk of ActivityScene.subscript.getter(&v162, KeyPath, &protocol witness table for SceneSettingScopes.ActivitySettings.ActivityIdentifierKey);
  swift_release(KeyPath);
  v25 = *((_QWORD *)&v162 + 1);
  if (!*((_QWORD *)&v162 + 1))
  {

LABEL_9:
    v40 = static os_log_type_t.error.getter(v20);
    if (qword_100011DE8 != -1)
      swift_once(&qword_100011DE8, sub_100007B34);
    os_log(_:dso:log:_:_:)(v40, &_mh_execute_header, qword_100012780, "Did not receive activity scene with identifier.", 47, 2, &_swiftEmptyArrayStorage);
    return;
  }
  v151 = (id)v162;
  v26 = swift_getKeyPath(&unk_10000AD78);
  v152 = v24;
  dispatch thunk of ActivityScene.subscript.getter(&v162, v26, &protocol witness table for SceneSettingScopes.ActivitySettings.ActivityDescriptorKey);
  swift_release(v26);
  v27 = (void *)v162;
  if ((_QWORD)v162)
  {
    v149 = v9;
    v150 = v5;
    v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56);
    v29 = 1;
    v30 = v158;
    v28(v13, 1, 1, v158);
    v31 = sub_100004E6C(&qword_100011EF0, (uint64_t (*)(uint64_t))&type metadata accessor for ActivityDescriptor, (uint64_t)&protocol conformance descriptor for ActivityDescriptor);
    dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)(v27, v13, v30, v31);

    v153 = v16;
    v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
    if (v32(v13, 1, v30) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v153 + 32))(v15, v13, v30);
      v29 = 0;
    }
    v28(v15, v29, 1, v30);
    if (v32(v15, 1, v30) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v153 + 32))(v155, v15, v30);
      v33 = type metadata accessor for JSONDecoder(0);
      swift_allocObject(v33, *(unsigned int *)(v33 + 48), *(unsigned __int16 *)(v33 + 52));
      v34 = JSONDecoder.init()();
      v35 = ActivityDescriptor.attributesData.getter();
      v37 = v36;
      v38 = sub_100004E6C(&qword_100011EF8, (uint64_t (*)(uint64_t))&type metadata accessor for MediaLiveActivityAttributes, (uint64_t)&protocol conformance descriptor for MediaLiveActivityAttributes);
      v39 = v150;
      dispatch thunk of JSONDecoder.decode<A>(_:from:)(v150, v35, v37, v150, v38);
      sub_100004EAC(v35, v37);
      swift_release(v34);
      v43 = v157;
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v157 + 56))(v4, 0, 1, v39);
      (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v149, v4, v39);
      v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(MRActivityAttributesKeyUIContext);
      v46 = v45;
      MediaLiveActivityAttributes.subscript.getter(&v160, v44);
      swift_bridgeObjectRelease(v46);
      if (!v161)
      {
        __break(1u);
        goto LABEL_44;
      }
      sub_100004EF0(&v160, &v162);
      swift_dynamicCast(v159, &v162, (char *)&type metadata for Any + 8, &type metadata for String, 7);
      v47 = v159[1];
      v48 = String._bridgeToObjectiveC()();
      v49 = swift_bridgeObjectRelease(v47);
      v50 = static os_log_type_t.default.getter(v49);
      if (qword_100011DE8 != -1)
        swift_once(&qword_100011DE8, sub_100007B34);
      v51 = qword_100012780;
      v52 = sub_100004E2C(&qword_100011F00);
      v53 = swift_allocObject(v52, 112, 7);
      *(_OWORD *)(v53 + 16) = xmmword_10000ACD0;
      *(_QWORD *)(v53 + 56) = &type metadata for String;
      v54 = sub_100004F00();
      *(_QWORD *)(v53 + 64) = v54;
      *(_QWORD *)(v53 + 32) = v151;
      *(_QWORD *)(v53 + 40) = v25;
      v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v48);
      *(_QWORD *)(v53 + 96) = &type metadata for String;
      *(_QWORD *)(v53 + 104) = v54;
      *(_QWORD *)(v53 + 72) = v55;
      *(_QWORD *)(v53 + 80) = v56;
      os_log(_:dso:log:_:_:)(v50, &_mh_execute_header, v51, "Configuring scene for identifier: %{public}@, context: %{public}@.", 66, 2, v53);
      swift_bridgeObjectRelease(v53);
      v57 = static String._unconditionallyBridgeFromObjectiveC(_:)(MRUIContextGroupSessionNearby);
      v59 = v58;
      v151 = v48;
      v61 = static String._unconditionallyBridgeFromObjectiveC(_:)(v48);
      v62 = v60;
      if (v57 == v61 && v59 == v60)
      {
        swift_bridgeObjectRelease_n(v59, 2);
        v63 = v154;
        v64 = v149;
        goto LABEL_23;
      }
      v65 = _stringCompareWithSmolCheck(_:_:expecting:)(v57, v59, v61, v60, 0);
      swift_bridgeObjectRelease(v59);
      swift_bridgeObjectRelease(v62);
      v63 = v154;
      v64 = v149;
      if ((v65 & 1) != 0)
      {
LABEL_23:
        v66 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
        objc_msgSend(v66, "bounds");
        v68 = v67;
        v70 = v69;
        v72 = v71;
        v74 = v73;

        v164.origin.x = v68;
        v164.origin.y = v70;
        v164.size.width = v72;
        v164.size.height = v74;
        Width = CGRectGetWidth(v164);
        v76 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics(0));
        v77 = ActivitySceneMetrics.init(size:cornerRadius:)(Width, 80.0, 0.0);
        v78 = v152;
        dispatch thunk of ActivityScene.resolvedMetrics.setter(v77);
        swift_unknownObjectWeakAssign(v63 + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyScene, v78);
        v79 = static String._unconditionallyBridgeFromObjectiveC(_:)(MRActivityAttributesKeyDiscoveredGroupSessionData);
        v81 = v80;
        MediaLiveActivityAttributes.subscript.getter(&v162, v79);
        swift_bridgeObjectRelease(v81);
        if (v163)
        {
          if ((swift_dynamicCast(&v160, &v162, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
          {
            v82 = *((_QWORD *)&v160 + 1);
            v83 = Data.init(base64Encoded:options:)(v160, *((_QWORD *)&v160 + 1), 0);
            v85 = v84;
            swift_bridgeObjectRelease(v82);
            if (v85 >> 60 != 15)
            {
              v86 = objc_allocWithZone((Class)MRDiscoveredGroupSession);
              sub_100004F80(v83, v85);
              isa = Data._bridgeToObjectiveC()().super.isa;
              v88 = objc_msgSend(v86, "initWithData:", isa);
              sub_100004FC4(v83, v85);

              if (v88)
              {
                v89 = swift_allocObject(&unk_10000C9E8, 24, 7);
                *(_QWORD *)(v89 + 16) = v88;
                v90 = (void (**)())((char *)objc_allocWithZone((Class)type metadata accessor for MRUGroupSessionNearbyViewController(0))
                                  + qword_100012050);
                *v90 = sub_100004FFC;
                v90[1] = (void (*)())v89;
                *(_QWORD *)&v162 = v88;
                v91 = v88;
                v92 = (void *)UIHostingController.init(rootView:)(&v162);
                v93 = v154;
                v94 = *(void **)(v154
                               + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyViewController);
                *(_QWORD *)(v154
                          + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyViewController) = v92;
                v95 = v92;

                v96 = objc_allocWithZone((Class)type metadata accessor for SecureWindow());
                v97 = objc_msgSend(v96, "initWithWindowScene:", v152);
                objc_msgSend(v97, "setRootViewController:", v95);
                objc_msgSend(v97, "makeKeyAndVisible");
                v98 = *(void **)(v93
                               + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyWindow);
                *(_QWORD *)(v93 + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyWindow) = v97;

                sub_100004FC4(v83, v85);
                (*(void (**)(char *, uint64_t))(v157 + 8))(v64, v39);
LABEL_28:
                (*(void (**)(char *, uint64_t))(v153 + 8))(v155, v158);
                return;
              }
              sub_100004FC4(v83, v85);
            }
          }
          goto LABEL_46;
        }
LABEL_44:
        sub_100004F44((uint64_t)&v162, &qword_100011F10);
LABEL_46:
        *(_QWORD *)&v162 = 0;
        *((_QWORD *)&v162 + 1) = 0xE000000000000000;
        _StringGuts.grow(_:)(54);
        v143._object = (void *)0x800000010000A730;
        v143._countAndFlagsBits = 0xD000000000000034;
        String.append(_:)(v143);
        v144 = sub_100004E6C(&qword_100011F18, (uint64_t (*)(uint64_t))&type metadata accessor for MediaLiveActivityAttributes, (uint64_t)&protocol conformance descriptor for MediaLiveActivityAttributes);
        v145._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v39, v144);
        object = v145._object;
        String.append(_:)(v145);
        swift_bridgeObjectRelease(object);
        _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v162, *((_QWORD *)&v162 + 1), "MediaRemoteUIService/ActivitySceneDelegate.swift", 48, 2, 58, 0);
        __break(1u);
        return;
      }
      v99 = static String._unconditionallyBridgeFromObjectiveC(_:)(MRUIContextRouteRecommendation);
      v101 = v100;
      v103 = static String._unconditionallyBridgeFromObjectiveC(_:)(v151);
      v104 = v102;
      if (v99 == v103 && v101 == v102)
      {
        swift_bridgeObjectRelease_n(v101, 2);
      }
      else
      {
        v105 = _stringCompareWithSmolCheck(_:_:expecting:)(v99, v101, v103, v102, 0);
        swift_bridgeObjectRelease(v101);
        swift_bridgeObjectRelease(v104);
        if ((v105 & 1) == 0)
        {

          (*(void (**)(char *, uint64_t))(v43 + 8))(v64, v39);
          goto LABEL_28;
        }
      }
      swift_unknownObjectWeakAssign(v63 + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationScene, v152);
      v106 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
      objc_msgSend(v106, "bounds");
      v108 = v107;
      v110 = v109;
      v112 = v111;
      v114 = v113;

      v165.origin.x = v108;
      v165.origin.y = v110;
      v165.size.width = v112;
      v165.size.height = v114;
      v115 = CGRectGetWidth(v165);
      v116 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics(0));
      v117 = ActivitySceneMetrics.init(size:cornerRadius:)(v115, 80.0, 0.0);
      v118 = v157;
      v119 = dispatch thunk of ActivityScene.resolvedMetrics.setter(v117);
      v120 = static os_log_type_t.default.getter(v119);
      v121 = qword_100012780;
      v122 = v156;
      (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v156, v64, v39);
      if (os_log_type_enabled(v121, v120))
      {
        v123 = (uint8_t *)swift_slowAlloc(12, -1);
        v148 = swift_slowAlloc(32, -1);
        *(_QWORD *)&v162 = v148;
        *(_DWORD *)v123 = 136315138;
        v147 = v123 + 4;
        v124 = sub_100004E6C(&qword_100011F18, (uint64_t (*)(uint64_t))&type metadata accessor for MediaLiveActivityAttributes, (uint64_t)&protocol conformance descriptor for MediaLiveActivityAttributes);
        v125 = v122;
        v126 = dispatch thunk of CustomStringConvertible.description.getter(v39, v124);
        v128 = v127;
        *(_QWORD *)&v160 = sub_100003764(v126, v127, (uint64_t *)&v162);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v160, (char *)&v160 + 8, v147, v123 + 12);
        swift_bridgeObjectRelease(v128);
        v129 = v125;
        v130 = *(void (**)(char *, uint64_t))(v118 + 8);
        v130(v129, v39);
        _os_log_impl((void *)&_mh_execute_header, v121, v120, ">>+ vs attrs are %s", v123, 0xCu);
        v131 = v148;
        swift_arrayDestroy(v148, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v131, -1, -1);
        v132 = v123;
        v63 = v154;
        swift_slowDealloc(v132, -1, -1);
      }
      else
      {
        v130 = *(void (**)(char *, uint64_t))(v118 + 8);
        v130(v122, v39);
      }
      v133 = static String._unconditionallyBridgeFromObjectiveC(_:)(MRActivityAttributesKeyRouteIdentifier);
      v135 = v134;
      MediaLiveActivityAttributes.subscript.getter(&v162, v133);
      swift_bridgeObjectRelease(v135);
      v136 = v151;
      if (v163)
      {
        if ((swift_dynamicCast(&v160, &v162, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
        {
          v137 = *((_QWORD *)&v160 + 1);
          v138 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v137);
LABEL_41:
          v139 = objc_msgSend(objc_allocWithZone((Class)MRURouteRecommendationPlatterViewController), "initWithRouteIdentifier:", v138);

          v140 = objc_allocWithZone((Class)type metadata accessor for SecureWindow());
          v141 = objc_msgSend(v140, "initWithWindowScene:", v152);
          objc_msgSend(v141, "setRootViewController:", v139);
          objc_msgSend(v141, "makeKeyAndVisible");
          v142 = *(void **)(v63 + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow);
          *(_QWORD *)(v63 + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow) = v141;

          v130(v64, v39);
          goto LABEL_28;
        }
      }
      else
      {
        sub_100004F44((uint64_t)&v162, &qword_100011F10);
      }
      v138 = 0;
      goto LABEL_41;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v15, 1, 1, v158);
  }
  swift_bridgeObjectRelease(v25);
  v41 = sub_100004F44((uint64_t)v15, &qword_100011EE8);
  v42 = static os_log_type_t.error.getter(v41);
  if (qword_100011DE8 != -1)
    swift_once(&qword_100011DE8, sub_100007B34);
  os_log(_:dso:log:_:_:)(v42, &_mh_execute_header, qword_100012780, "Did not receive activity scene attributes.", 42, 2, &_swiftEmptyArrayStorage);

}

uint64_t sub_100004E2C(uint64_t *a1)
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

uint64_t sub_100004E6C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100004EAC(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

_OWORD *sub_100004EF0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100004F00()
{
  unint64_t result;

  result = qword_100011F08;
  if (!qword_100011F08)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100011F08);
  }
  return result;
}

uint64_t sub_100004F44(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100004E2C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100004F80(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100004FC4(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100004EAC(result, a2);
  return result;
}

uint64_t sub_100004FD8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_100004FFC()
{
  uint64_t v0;

  sub_1000025E0(*(void **)(v0 + 16));
}

uint64_t sub_100005004(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

void type metadata accessor for MRGroupSessionEventOption(uint64_t a1)
{
  sub_1000051A8(a1, &qword_100011F58, (uint64_t)&unk_10000CA38);
}

uint64_t sub_100005050(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100005060(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100005068(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004E2C(&qword_100011F48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000050B0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000050D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100005110()
{
  return sub_100004E6C(&qword_100011F60, (uint64_t (*)(uint64_t))type metadata accessor for MRGroupSessionEventOption, (uint64_t)&unk_10000ADF8);
}

uint64_t sub_10000513C()
{
  return sub_100004E6C(&qword_100011F68, (uint64_t (*)(uint64_t))type metadata accessor for MRGroupSessionEventOption, (uint64_t)&unk_10000ADD0);
}

uint64_t sub_100005168()
{
  return sub_100004E6C(&qword_100011F70, (uint64_t (*)(uint64_t))type metadata accessor for MRGroupSessionEventOption, (uint64_t)&unk_10000AE60);
}

void type metadata accessor for MRGroupSessionRouteType(uint64_t a1)
{
  sub_1000051A8(a1, (unint64_t *)&unk_100011F80, (uint64_t)&unk_10000CA60);
}

void sub_1000051A8(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t type metadata accessor for MRUGroupSessionNearbyViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_100012058;
  if (!qword_100012058)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MRUGroupSessionNearbyViewController);
  return result;
}

uint64_t sub_100005228(uint64_t a1)
{
  char *v2;

  v2 = (char *)&value witness table for () + 64;
  return swift_initClassMetadata2(a1, 0, 1, &v2, a1 + qword_100012770);
}

uint64_t sub_100005274@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v4 = sub_100004E2C(&qword_1000120A8);
  __chkstk_darwin(v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100004E2C(&qword_1000120B0);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v6 = static VerticalAlignment.center.getter(v8);
  *((_QWORD *)v6 + 1) = 0x4028000000000000;
  v6[16] = 0;
  v11 = sub_100004E2C(&qword_1000120B8);
  v12 = sub_1000053F0(a1, (uint64_t)&v6[*(int *)(v11 + 44)]);
  LOBYTE(a1) = static Edge.Set.all.getter(v12);
  sub_1000060E0((uint64_t)v6, (uint64_t)v10, &qword_1000120A8);
  v13 = &v10[*(int *)(v7 + 36)];
  *v13 = (char)a1;
  *(_OWORD *)(v13 + 8) = 0u;
  *(_OWORD *)(v13 + 24) = 0u;
  v13[40] = 1;
  v14 = sub_100004F44((uint64_t)v6, &qword_1000120A8);
  v15 = static Alignment.center.getter(v14);
  sub_100005A68(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a2, 0.0, 1, 0.0, 1, v15, v16);
  return sub_100004F44((uint64_t)v10, &qword_1000120B0);
}

uint64_t sub_1000053F0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  __int128 v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  __int128 v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  __int128 v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  _OWORD v58[3];

  v50 = a2;
  v3 = type metadata accessor for GroupSessionRouteView(0);
  __chkstk_darwin(v3);
  v5 = (uint64_t *)((char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_100004E2C(&qword_1000120C8);
  __chkstk_darwin(v6);
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100004E2C(&qword_1000120D0);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v47 - v13;
  v15 = objc_msgSend(a1, "hostInfo");
  v16 = objc_msgSend(v15, "routeType");

  *v5 = swift_getKeyPath(&unk_10000B000);
  v17 = sub_100004E2C(&qword_1000120D8);
  swift_storeEnumTagMultiPayload(v5, v17, 0);
  v18 = *(int *)(v3 + 20);
  *(_QWORD *)&v58[0] = 0;
  v19 = sub_100004E2C(&qword_1000120E0);
  v20 = State.init(wrappedValue:)(&v51, v58, v19);
  *(_OWORD *)((char *)v5 + v18) = v51;
  *((_BYTE *)v5 + *(int *)(v3 + 24)) = v16;
  v21 = static Alignment.center.getter(v20);
  _FrameLayout.init(width:height:alignment:)(v58, 0x4043000000000000, 0, 0x4043000000000000, 0, v21, v22);
  sub_100006018((uint64_t)v5, (uint64_t)v8);
  v23 = &v8[*(int *)(v6 + 36)];
  v24 = v58[1];
  *(_OWORD *)v23 = v58[0];
  *((_OWORD *)v23 + 1) = v24;
  *((_OWORD *)v23 + 2) = v58[2];
  v25 = sub_10000605C((uint64_t)v5);
  LOBYTE(v18) = static Edge.Set.trailing.getter(v25);
  v26 = EdgeInsets.init(_all:)(8.0);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  sub_1000060E0((uint64_t)v8, (uint64_t)v12, &qword_1000120C8);
  v33 = &v12[*(int *)(v9 + 36)];
  *v33 = v18;
  *((double *)v33 + 1) = v26;
  *((_QWORD *)v33 + 2) = v28;
  *((_QWORD *)v33 + 3) = v30;
  *((_QWORD *)v33 + 4) = v32;
  v33[40] = 0;
  sub_100004F44((uint64_t)v8, &qword_1000120C8);
  v49 = v12;
  v48 = v14;
  v34 = sub_100006098((uint64_t)v12, (uint64_t)v14);
  v47 = static HorizontalAlignment.leading.getter(v34);
  sub_100005798(a1, (uint64_t)&v51);
  v35 = v51;
  v36 = v52;
  v38 = v53;
  v37 = v54;
  v39 = v55;
  LOBYTE(v5) = v56;
  v40 = v57;
  sub_1000060E0((uint64_t)v14, (uint64_t)v12, &qword_1000120D0);
  v41 = (uint64_t)v12;
  v42 = v50;
  sub_1000060E0(v41, v50, &qword_1000120D0);
  v43 = sub_100004E2C(&qword_1000120E8);
  v44 = v42 + *(int *)(v43 + 48);
  *(_QWORD *)v44 = v47;
  *(_QWORD *)(v44 + 8) = 0;
  *(_BYTE *)(v44 + 16) = 1;
  *(_OWORD *)(v44 + 24) = v35;
  *(_BYTE *)(v44 + 40) = v36;
  *(_QWORD *)(v44 + 48) = v38;
  *(_QWORD *)(v44 + 56) = v37;
  *(_QWORD *)(v44 + 64) = v39;
  *(_BYTE *)(v44 + 72) = (_BYTE)v5;
  *(_QWORD *)(v44 + 80) = v40;
  v45 = v42 + *(int *)(v43 + 64);
  *(_QWORD *)v45 = 0;
  *(_BYTE *)(v45 + 8) = 1;
  sub_100006124(v35, *((uint64_t *)&v35 + 1), v36);
  swift_bridgeObjectRetain(v38);
  sub_100006124(v37, v39, (char)v5);
  swift_bridgeObjectRetain(v40);
  sub_100004F44((uint64_t)v48, &qword_1000120D0);
  sub_100006134(v35, *((uint64_t *)&v35 + 1), v36);
  swift_bridgeObjectRelease(v38);
  sub_100006134(v37, v39, (char)v5);
  swift_bridgeObjectRelease(v40);
  return sub_100004F44((uint64_t)v49, &qword_1000120D0);
}

uint64_t sub_100005798@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  Swift::String v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  Swift::String v13;
  Swift::String v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  int v52[4];

  v4 = type metadata accessor for LocalizedStringKey.StringInterpolation(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)(15, 1);
  v7._countAndFlagsBits = 0x616C506572616853;
  v7._object = (void *)0xEF20687469772079;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v7);
  v8 = objc_msgSend(a1, "hostInfo");
  v9 = objc_msgSend(v8, "displayName");

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
  v12 = v11;

  v13._countAndFlagsBits = v10;
  v13._object = v12;
  LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v13);
  swift_bridgeObjectRelease(v12);
  v14._countAndFlagsBits = 0;
  v14._object = (void *)0xE000000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v14);
  v15 = LocalizedStringKey.init(stringInterpolation:)(v6);
  v16 = Text.init(_:tableName:bundle:comment:)(v15);
  v18 = v17;
  v20 = v19;
  v22 = v21 & 1;
  v23 = Text.bold()();
  v48 = v24;
  v49 = v23;
  v26 = v25;
  v50 = v27;
  sub_100006134(v16, v18, v22);
  swift_bridgeObjectRelease(v20);
  LOBYTE(v16) = v26 & 1;
  v28 = LocalizedStringKey.init(stringLiteral:)(0x4A206F7420706154, 0xEB000000006E696FLL);
  v29 = Text.init(_:tableName:bundle:comment:)(v28);
  v31 = v30;
  v33 = v32;
  v35 = v34 & 1;
  v52[0] = static HierarchicalShapeStyle.secondary.getter();
  v36 = Text.foregroundStyle<A>(_:)(v52, v29, v31, v35, v33, &type metadata for HierarchicalShapeStyle, &protocol witness table for HierarchicalShapeStyle);
  v38 = v37;
  v40 = v39;
  LOBYTE(v9) = v41 & 1;
  sub_100006134(v29, v31, v35);
  swift_bridgeObjectRelease(v33);
  v51 = v16;
  v43 = v48;
  v42 = v49;
  *(_QWORD *)a2 = v49;
  *(_QWORD *)(a2 + 8) = v43;
  *(_BYTE *)(a2 + 16) = v16;
  v44 = v50;
  *(_QWORD *)(a2 + 24) = v50;
  *(_QWORD *)(a2 + 32) = v36;
  *(_QWORD *)(a2 + 40) = v38;
  *(_BYTE *)(a2 + 48) = (_BYTE)v9;
  *(_QWORD *)(a2 + 56) = v40;
  v45 = v42;
  sub_100006124(v42, v43, v16);
  swift_bridgeObjectRetain(v44);
  sub_100006124(v36, v38, (char)v9);
  swift_bridgeObjectRetain(v40);
  sub_100006134(v36, v38, (char)v9);
  swift_bridgeObjectRelease(v40);
  sub_100006134(v45, v43, v51);
  return swift_bridgeObjectRelease(v44);
}

__n128 sub_100005A68@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v29;
  double v30;
  double v31;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __n128 result;
  unsigned int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _OWORD v44[7];

  v16 = v15;
  v18 = a15;
  v19 = a12;
  v20 = a10;
  v21 = a2 & 1;
  v22 = a1;
  if ((_DWORD)v21)
    v22 = -INFINITY;
  v23 = a4 & 1;
  v24 = a3;
  if ((a4 & 1) != 0)
    v24 = v22;
  v25 = a6 & 1;
  v26 = a8 & 1;
  v27 = a5;
  if ((a6 & 1) != 0)
    v27 = v24;
  if (v22 > v24 || v24 > v27)
    goto LABEL_22;
  v29 = a7;
  if ((a8 & 1) != 0)
    v29 = -INFINITY;
  v30 = a10;
  if ((a11 & 1) != 0)
    v30 = v29;
  v31 = a12;
  if ((a13 & 1) != 0)
    v31 = v30;
  if (v29 > v30 || v30 > v31)
  {
LABEL_22:
    v42 = a5;
    v43 = a7;
    v41 = a3;
    v40 = a1;
    v39 = v21;
    v33 = static os_log_type_t.fault.getter();
    v34 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v34, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v18 = a15;
    v21 = v39;
    a1 = v40;
    v20 = a10;
    a3 = v41;
    v19 = a12;
    a5 = v42;
    a7 = v43;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v44, *(_QWORD *)&a1, v21, *(_QWORD *)&a3, v23, *(_QWORD *)&a5, v25, *(_QWORD *)&a7, v26, *(_QWORD *)&v20, a11 & 1, *(_QWORD *)&v19, a13 & 1, a14, v18);
  sub_1000060E0(v16, a9, &qword_1000120B0);
  v35 = a9 + *(int *)(sub_100004E2C(&qword_1000120C0) + 36);
  v36 = v44[5];
  *(_OWORD *)(v35 + 64) = v44[4];
  *(_OWORD *)(v35 + 80) = v36;
  *(_OWORD *)(v35 + 96) = v44[6];
  v37 = v44[1];
  *(_OWORD *)v35 = v44[0];
  *(_OWORD *)(v35 + 16) = v37;
  result = (__n128)v44[3];
  *(_OWORD *)(v35 + 32) = v44[2];
  *(__n128 *)(v35 + 48) = result;
  return result;
}

uint64_t sub_100005C2C()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100005C44@<X0>(uint64_t a1@<X8>)
{
  void **v1;

  return sub_100005274(*v1, a1);
}

uint64_t sub_100005C4C()
{
  return 1;
}

void sub_100005C54()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  objc_super v10;

  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for MRUGroupSessionNearbyViewController(0);
  objc_msgSendSuper2(&v10, "viewDidLoad");
  v1 = objc_msgSend(v0, "view");
  if (!v1)
  {
    __break(1u);
    goto LABEL_6;
  }
  v2 = v1;
  v3 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
  objc_msgSend(v2, "setBackgroundColor:", v3);

  v4 = objc_msgSend(v0, "view");
  if (!v4)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v5 = v4;
  v6 = objc_msgSend(objc_allocWithZone((Class)UITapGestureRecognizer), "initWithTarget:action:", v0, "handleTap:");
  objc_msgSend(v5, "addGestureRecognizer:", v6);

  v7 = objc_msgSend(v0, "view");
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "layer");

    objc_msgSend(v9, "setHitTestsAsOpaque:", 1);
    return;
  }
LABEL_7:
  __break(1u);
}

void sub_100005DB8(void *a1)
{
  id v1;

  v1 = a1;
  sub_100005C54();

}

void sub_100005DEC()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010000AB20, "MediaRemoteUIService/MRUGroupSessionNearby.swift", 48, 2, 55, 0);
  __break(1u);
}

void sub_100005E44(char *a1, uint64_t a2, void *a3)
{
  void (*v4)(void);
  id v5;
  char *v6;

  v4 = *(void (**)(void))&a1[qword_100012050];
  v5 = a3;
  v6 = a1;
  v4();

}

uint64_t sub_100005E9C()
{
  uint64_t v0;

  return swift_release(*(_QWORD *)(v0 + qword_100012050 + 8));
}

id sub_100005EB0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MRUGroupSessionNearbyViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100005EE4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + qword_100012050 + 8));
}

void sub_100005EF8()
{
  _swift_stdlib_reportUnimplementedInitializer("MediaRemoteUIService.MRUGroupSessionNearbyViewController", 56, "init(rootView:)", 15, 0);
  __break(1u);
}

void sub_100005F24()
{
  _swift_stdlib_reportUnimplementedInitializer("MediaRemoteUIService.MRUGroupSessionNearbyViewController", 56, "init(coder:rootView:)", 21, 0);
  __break(1u);
}

uint64_t sub_100005F50()
{
  return type metadata accessor for MRUGroupSessionNearbyViewController(0);
}

ValueMetadata *type metadata accessor for MRUGroupSessionNearbyView()
{
  return &type metadata for MRUGroupSessionNearbyView;
}

uint64_t sub_100005F68(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000B374, 1);
}

uint64_t sub_100005F78()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100005F98(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for ColorScheme(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.colorScheme.setter(v3);
}

uint64_t sub_100006018(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for GroupSessionRouteView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000605C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for GroupSessionRouteView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006098(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004E2C(&qword_1000120D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000060E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100004E2C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006124(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_100006134(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_100006144()
{
  return sub_1000061E0(&qword_1000120F0, &qword_1000120C0, (void (*)(void))sub_1000061BC);
}

uint64_t sub_100006178(uint64_t *a1)
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

uint64_t sub_1000061BC()
{
  return sub_1000061E0(&qword_1000120F8, &qword_1000120B0, (void (*)(void))sub_100006248);
}

uint64_t sub_1000061E0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100006178(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100006248()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100012100;
  if (!qword_100012100)
  {
    v1 = sub_100006178(&qword_1000120A8);
    result = swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100012100);
  }
  return result;
}

id sub_1000062D0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC20MediaRemoteUIService11AppDelegate);
}

_QWORD *sub_100006320(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char *v17;
  void *v18;
  id v19;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    v4 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_100004E2C(&qword_1000120D8);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for ColorScheme(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v4, a2, v8);
      v9 = v4;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *v4 = *a2;
      swift_retain(v13);
      v9 = v4;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = *(int *)(a3 + 20);
    v15 = *(int *)(a3 + 24);
    v16 = (_QWORD *)((char *)v4 + v14);
    v17 = (char *)a2 + v14;
    v18 = *(void **)v17;
    v12 = *((_QWORD *)v17 + 1);
    *v16 = *(_QWORD *)v17;
    v16[1] = v12;
    *((_BYTE *)v4 + v15) = *((_BYTE *)a2 + v15);
    v19 = v18;
  }
  swift_retain(v12);
  return v4;
}

uint64_t sub_100006410(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;

  v4 = sub_100004E2C(&qword_1000120D8);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (char *)a1 + *(int *)(a2 + 20);

  return swift_release(*((_QWORD *)v6 + 1));
}

_QWORD *sub_10000648C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v6 = sub_100004E2C(&qword_1000120D8);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = *(int *)(a3 + 20);
  v13 = *(int *)(a3 + 24);
  v14 = (_QWORD *)((char *)a1 + v12);
  v15 = (char *)a2 + v12;
  v16 = *(void **)v15;
  v17 = *((_QWORD *)v15 + 1);
  *v14 = *(_QWORD *)v15;
  v14[1] = v17;
  *((_BYTE *)a1 + v13) = *((_BYTE *)a2 + v13);
  v18 = v16;
  swift_retain(v17);
  return a1;
}

_QWORD *sub_100006554(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  char *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  if (a1 != a2)
  {
    sub_100006650((uint64_t)a1);
    v6 = sub_100004E2C(&qword_1000120D8);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  v12 = *(int *)(a3 + 20);
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (char *)a2 + v12;
  v15 = *(void **)((char *)a1 + v12);
  v16 = *(void **)((char *)a2 + v12);
  *v13 = v16;
  v17 = v16;

  v18 = v13[1];
  v19 = *((_QWORD *)v14 + 1);
  v13[1] = v19;
  swift_retain(v19);
  swift_release(v18);
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100006650(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004E2C(&qword_1000120D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_100006690(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_100004E2C(&qword_1000120D8);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ColorScheme(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  a1[v8] = a2[v8];
  return a1;
}

char *sub_100006740(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  void *v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sub_100006650((uint64_t)a1);
    v6 = sub_100004E2C(&qword_1000120D8);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = *(void **)&a1[v8];
  *(_QWORD *)v9 = *(_QWORD *)v10;

  v12 = *((_QWORD *)v9 + 1);
  *((_QWORD *)v9 + 1) = *((_QWORD *)v10 + 1);
  swift_release(v12);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t sub_10000682C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006838);
}

uint64_t sub_100006838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = sub_100004E2C(&qword_1000121B8);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_1000068C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000068D0);
}

uint64_t sub_1000068D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_100004E2C(&qword_1000121B8);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for GroupSessionRouteView(uint64_t a1)
{
  uint64_t result;

  result = qword_100012218;
  if (!qword_100012218)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for GroupSessionRouteView);
  return result;
}

void sub_100006988(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  sub_100006A08(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = &unk_10000B0C8;
    v4[2] = (char *)&value witness table for Builtin.Int8 + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
  }
}

void sub_100006A08(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100012228)
  {
    v2 = type metadata accessor for ColorScheme(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100012228);
  }
}

uint64_t sub_100006A5C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000B3F0, 1);
}

void sub_100006A6C()
{
  qword_1000121A0 = 0x4036000000000000;
}

void sub_100006A7C()
{
  qword_1000121A8 = 0x4024000000000000;
}

void sub_100006A8C()
{
  qword_1000121B0 = 0x4014000000000000;
}

uint64_t *sub_100006A9C@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
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
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _OWORD v32[9];
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

  v2 = v1;
  v31 = type metadata accessor for _TaskModifier(0);
  __chkstk_darwin(v31);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority(0);
  v29 = *(_QWORD *)(v6 - 8);
  v30 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for GroupSessionRouteView(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v9);
  v13 = static Alignment.bottomTrailing.getter(v12);
  v15 = v14;
  sub_100006D10(v2, (uint64_t)v32);
  v40 = v32[6];
  v41 = v32[7];
  v42 = v32[8];
  v36 = v32[2];
  v37 = v32[3];
  v39 = v32[5];
  v38 = v32[4];
  v35 = v32[1];
  v34 = v32[0];
  *(_QWORD *)&v33 = v13;
  *((_QWORD *)&v33 + 1) = v15;
  sub_100007658(v2, (uint64_t)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for GroupSessionRouteView);
  v16 = *(unsigned __int8 *)(v10 + 80);
  v17 = (v16 + 16) & ~v16;
  v18 = swift_allocObject(&unk_10000CBC0, v17 + v11, v16 | 7);
  v19 = sub_100007568((uint64_t)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17);
  static TaskPriority.userInitiated.getter(v19);
  v20 = v30;
  v21 = v29;
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(&v5[*(int *)(v31 + 20)], v8, v30);
  *(_QWORD *)v5 = &unk_100012268;
  *((_QWORD *)v5 + 1) = v18;
  v22 = sub_100004E2C(&qword_100012270);
  sub_100007658((uint64_t)v5, (uint64_t)a1 + *(int *)(v22 + 36), (uint64_t (*)(_QWORD))&type metadata accessor for _TaskModifier);
  v23 = v40;
  a1[6] = v39;
  a1[7] = v23;
  v24 = v42;
  a1[8] = v41;
  a1[9] = v24;
  v25 = v36;
  a1[2] = v35;
  a1[3] = v25;
  v26 = v38;
  a1[4] = v37;
  a1[5] = v26;
  v27 = v34;
  *a1 = v33;
  a1[1] = v27;
  sub_10000769C(&v33);
  sub_1000076E4((uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v20);
  return sub_100007720((uint64_t *)v32);
}

uint64_t sub_100006D10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  unint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_BYTE *, uint64_t, uint64_t);
  uint64_t (*v19)(_BYTE *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
  _BYTE v38[4];
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v43[7];
  int v44;
  __int16 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;

  v4 = type metadata accessor for Color.RGBColorSpace(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v38[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for Image.ResizingMode(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = &v38[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = type metadata accessor for GroupSessionRouteView(0);
  v13 = 0x800000010000AC10;
  v14 = 0xD000000000000013;
  v15 = *(unsigned __int8 *)(a1 + *(int *)(v12 + 24)) - 1;
  v41 = v5;
  v42 = v4;
  switch(v15)
  {
    case 0:
      v13 = 0xE800000000000000;
      v14 = 0x6C6C69662E726163;
      break;
    case 1:
      v13 = 0xE700000000000000;
      v14 = 0x79616C70726163;
      break;
    case 7:
      v14 = 0x2E646F70656D6F68;
      goto LABEL_6;
    case 10:
      v14 = 0x2E7674656C707061;
LABEL_6:
      v13 = 0xEC0000006C6C6966;
      break;
    default:
      break;
  }
  v16 = Image.init(_internalSystemName:)(v14, v13);
  v17 = enum case for Image.ResizingMode.stretch(_:);
  v18 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 104);
  v18(v11, enum case for Image.ResizingMode.stretch(_:), v8);
  v40 = Image.resizable(capInsets:resizingMode:)(v11, v16, 0.0, 0.0, 0.0, 0.0);
  swift_release(v16);
  v19 = *(uint64_t (**)(_BYTE *, uint64_t))(v9 + 8);
  v20 = v19(v11, v8);
  v39 = static HierarchicalShapeStyle.secondary.getter(v20);
  v47 = *(_OWORD *)(a1 + *(int *)(v12 + 20));
  v21 = sub_100004E2C(&qword_100012278);
  State.wrappedValue.getter(&v46, v21);
  if (!v46)
    objc_msgSend(objc_allocWithZone((Class)UIImage), "init");
  v22 = Image.init(uiImage:)();
  v18(v11, v17, v8);
  v23 = Image.resizable(capInsets:resizingMode:)(v11, v22, 0.0, 0.0, 0.0, 0.0);
  swift_release(v22);
  v24 = v19(v11, v8);
  if (qword_100011DD0 != -1)
    v24 = swift_once(&qword_100011DD0, sub_100006A6C);
  v25 = qword_1000121A0;
  v26 = static Alignment.center.getter(v24);
  _FrameLayout.init(width:height:alignment:)(&v47, v25, 0, v25, 0, v26, v27);
  v28 = v47;
  v29 = BYTE8(v47);
  v30 = v48;
  v31 = v49;
  v33 = v50;
  v32 = v51;
  v34 = v42;
  if (qword_100011DD8 != -1)
    swift_once(&qword_100011DD8, sub_100006A7C);
  v35 = qword_1000121A8;
  if (qword_100011DE0 != -1)
    swift_once(&qword_100011DE0, sub_100006A8C);
  v36 = qword_1000121B0;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v41 + 104))(v7, enum case for Color.RGBColorSpace.sRGBLinear(_:), v34);
  result = Color.init(_:white:opacity:)(v7, 0.0, 0.33);
  *(_DWORD *)(a2 + 42) = v44;
  *(_WORD *)(a2 + 46) = v45;
  *(_DWORD *)(a2 + 57) = v46;
  *(_DWORD *)(a2 + 60) = *(_DWORD *)((char *)&v46 + 3);
  *(_DWORD *)(a2 + 76) = *(_DWORD *)&v43[3];
  *(_DWORD *)(a2 + 73) = *(_DWORD *)v43;
  *(_QWORD *)a2 = v40;
  *(_QWORD *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  *(_DWORD *)(a2 + 20) = v39;
  *(_QWORD *)(a2 + 24) = v23;
  *(_QWORD *)(a2 + 32) = 0;
  *(_WORD *)(a2 + 40) = 1;
  *(_QWORD *)(a2 + 48) = v28;
  *(_BYTE *)(a2 + 56) = v29;
  *(_QWORD *)(a2 + 64) = v30;
  *(_BYTE *)(a2 + 72) = v31;
  *(_QWORD *)(a2 + 80) = v33;
  *(_QWORD *)(a2 + 88) = v32;
  *(_QWORD *)(a2 + 96) = v35;
  *(_QWORD *)(a2 + 104) = v35;
  *(_QWORD *)(a2 + 112) = result;
  *(_QWORD *)(a2 + 120) = v36;
  *(_QWORD *)(a2 + 128) = 0;
  *(_QWORD *)(a2 + 136) = 0;
  return result;
}

uint64_t sub_1000070FC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1[22] = a1;
  v2 = type metadata accessor for ColorScheme(0);
  v1[23] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[24] = v3;
  v4 = (*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[25] = swift_task_alloc(v4);
  v1[26] = swift_task_alloc(v4);
  v5 = type metadata accessor for MainActor(0);
  v1[27] = static MainActor.shared.getter();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v1[28] = v6;
  v1[29] = v7;
  return swift_task_switch(sub_1000071A0, v6, v7);
}

uint64_t sub_1000071A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSString v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  _QWORD *v17;

  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(int *)(type metadata accessor for GroupSessionRouteView(0) + 20);
  *(_DWORD *)(v0 + 264) = v2;
  *(_OWORD *)(v0 + 120) = *(_OWORD *)(v1 + v2);
  v3 = sub_100004E2C(&qword_100012278);
  *(_QWORD *)(v0 + 240) = v3;
  State.wrappedValue.getter((_QWORD *)(v0 + 152), v3);
  v4 = *(void **)(v0 + 152);

  if (v4)
  {
    swift_release(*(_QWORD *)(v0 + 216));
    v5 = *(_QWORD *)(v0 + 200);
    swift_task_dealloc(*(_QWORD *)(v0 + 208));
    swift_task_dealloc(v5);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v7 = v0 + 16;
    v9 = *(_QWORD *)(v0 + 200);
    v8 = *(_QWORD *)(v0 + 208);
    v10 = *(_QWORD *)(v0 + 184);
    v11 = *(_QWORD *)(v0 + 192);
    v12 = objc_msgSend((id)objc_opt_self(MRUAssetsProvider), "sharedAssetsProvider");
    *(_QWORD *)(v0 + 248) = v12;
    v13 = String._bridgeToObjectiveC()();
    *(_QWORD *)(v0 + 256) = v13;
    sub_100007768(v8);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v11 + 104))(v9, enum case for ColorScheme.dark(_:), v10);
    v14 = static ColorScheme.== infix(_:_:)(v8, v9);
    v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v15(v9, v10);
    v15(v8, v10);
    *(_QWORD *)(v0 + 56) = v0 + 160;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_100007390;
    v16 = swift_continuation_init(v0 + 16, 0);
    *(_QWORD *)(v0 + 80) = _NSConcreteStackBlock;
    v17 = (_QWORD *)(v0 + 80);
    v17[1] = 0x40000000;
    v17[2] = sub_10000745C;
    v17[3] = &unk_10000CBD8;
    v17[4] = v16;
    objc_msgSend(v12, "applicationIconForBundleIdentifier:appearance:completion:", v13, v14 & 1, v17);
    return swift_continuation_await(v7);
  }
}

uint64_t sub_100007390()
{
  uint64_t v0;

  return swift_task_switch(sub_1000073D4, *(_QWORD *)(*(_QWORD *)v0 + 224), *(_QWORD *)(*(_QWORD *)v0 + 232));
}

uint64_t sub_1000073D4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(void **)(v0 + 248);
  v1 = *(void **)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 240);
  v4 = *(int *)(v0 + 264);
  v5 = *(_QWORD *)(v0 + 176);
  swift_release(*(_QWORD *)(v0 + 216));
  v6 = *(_QWORD *)(v0 + 160);
  *(_OWORD *)(v0 + 136) = *(_OWORD *)(v5 + v4);
  *(_QWORD *)(v0 + 168) = v6;
  State.wrappedValue.setter(v0 + 168, v3);

  v7 = *(_QWORD *)(v0 + 200);
  swift_task_dealloc(*(_QWORD *)(v0 + 208));
  swift_task_dealloc(v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000745C(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(v2 + 64) + 40);
  v4 = a2;
  sub_1000079A0((uint64_t)&v6, v3);
  return swift_continuation_resume(v2);
}

uint64_t sub_1000074A8()
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
  char *v9;

  v1 = type metadata accessor for GroupSessionRouteView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);
  v7 = sub_100004E2C(&qword_1000120D8);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {
    swift_release(*v6);
  }
  v9 = (char *)v6 + *(int *)(v1 + 20);

  swift_release(*((_QWORD *)v9 + 1));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100007568(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for GroupSessionRouteView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000075AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for GroupSessionRouteView(0) - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = (_QWORD *)swift_task_alloc(dword_100012264);
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_100007610;
  return sub_1000070FC(v3);
}

uint64_t sub_100007610()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100007658(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_QWORD *sub_10000769C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[5];
  v3 = a1[16];
  swift_retain(a1[2]);
  swift_retain(v2);
  swift_retain(v3);
  return a1;
}

uint64_t sub_1000076E4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for _TaskModifier(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *sub_100007720(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[3];
  swift_release(a1[14]);
  swift_release(v3);
  swift_release(v2);
  return a1;
}

uint64_t sub_100007768@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v13;
  os_log_type_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;

  v2 = v1;
  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100004E2C(&qword_1000120D8);
  __chkstk_darwin(v8);
  v10 = (_QWORD *)((char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1000079E8(v2, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload(v10, v8) == 1)
  {
    v11 = type metadata accessor for ColorScheme(0);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = *v10;
    v14 = static os_log_type_t.fault.getter();
    v15 = static Log.runtimeIssuesLog.getter();
    v16 = v14;
    if (os_log_type_enabled(v15, v14))
    {
      v17 = (uint8_t *)swift_slowAlloc(12, -1);
      v18 = swift_slowAlloc(32, -1);
      v20[1] = a1;
      v19 = v18;
      v22 = v18;
      *(_DWORD *)v17 = 136315138;
      v21 = sub_100003764(0x686353726F6C6F43, 0xEB00000000656D65, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v17 + 4, v17 + 12);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v17, 0xCu);
      swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v19, -1, -1);
      swift_slowDealloc(v17, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v7, v13);
    swift_release(v13);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_1000079A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004E2C(&qword_1000120E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000079E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004E2C(&qword_1000120D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100007A34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100012280;
  if (!qword_100012280)
  {
    v1 = sub_100006178(&qword_100012270);
    sub_100007AA0();
    sub_100007AEC();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100012280);
  }
  return result;
}

unint64_t sub_100007AA0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100012288;
  if (!qword_100012288)
  {
    v1 = sub_100006178(&qword_100012290);
    result = swift_getWitnessTable(&protocol conformance descriptor for ZStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100012288);
  }
  return result;
}

unint64_t sub_100007AEC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100012298;
  if (!qword_100012298)
  {
    v1 = type metadata accessor for _TaskModifier(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for _TaskModifier, v1);
    atomic_store(result, (unint64_t *)&qword_100012298);
  }
  return result;
}

uint64_t sub_100007B34()
{
  uint64_t result;

  sub_100007B84();
  result = OS_os_log.init(subsystem:category:)(0xD000000000000019, 0x800000010000AC30, 18773, 0xE200000000000000);
  qword_100012780 = result;
  return result;
}

unint64_t sub_100007B84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000122A0;
  if (!qword_1000122A0)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000122A0);
  }
  return result;
}

uint64_t sub_100007BC0()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC20MediaRemoteUIServiceP33_37416A58F26542CA691D4B0ED61F050919ResourceBundleClass);
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anonymousListener");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpoint");
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}
