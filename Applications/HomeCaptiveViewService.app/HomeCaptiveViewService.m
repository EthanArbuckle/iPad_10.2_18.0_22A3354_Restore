id sub_100003AD4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSString v4;
  void *v5;
  id v6;

  v1 = *(void **)(v0 + 48);
  if (v1)
  {
    v2 = *(id *)(v0 + 48);
  }
  else
  {
    v3 = objc_msgSend(objc_allocWithZone((Class)SKDevice), "init");
    if (*(_QWORD *)(v0 + 40))
      v4 = String._bridgeToObjectiveC()();
    else
      v4 = 0;
    objc_msgSend(v3, "setIdentifier:", v4);

    v5 = *(void **)(v0 + 48);
    *(_QWORD *)(v0 + 48) = v3;
    v2 = v3;

    v1 = 0;
  }
  v6 = v1;
  return v2;
}

_QWORD *sub_100003B74(void *a1)
{
  _QWORD *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1[6] = 0;
  v3 = objc_msgSend(a1, "name");
  if (v3)
  {
    v4 = v3;
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v1[2] = v5;
  v1[3] = v7;
  v8 = objc_msgSend(a1, "identifier");
  if (v8)
  {
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = v11;

  }
  else
  {

    v10 = 0;
    v12 = 0;
  }
  v1[4] = v10;
  v1[5] = v12;
  return v1;
}

uint64_t sub_100003C2C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));

  return swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for PeerDevice()
{
  return objc_opt_self(_TtC22HomeCaptiveViewService10PeerDevice);
}

void sub_100003C80()
{
  char *v0;
  char *v1;
  void *v2;
  id v3;
  Swift::String v4;
  Swift::String_optional v5;
  Swift::String v6;
  void *object;
  NSString v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  Swift::String v15;
  Swift::String_optional v16;
  Swift::String v17;
  Swift::String v18;
  void *v19;
  void *v20;
  id v21;
  Swift::String v22;
  Swift::String_optional v23;
  Swift::String v24;
  NSString v25;
  NSString v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  Class isa;
  id v34;
  Swift::String v35;
  Swift::String_optional v36;
  Swift::String v37;
  void *v38;
  uint64_t v39;
  NSString v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  _QWORD aBlock[5];
  uint64_t v46;
  objc_super v47;
  Swift::String v48;
  Swift::String v49;
  Swift::String v50;
  Swift::String v51;

  v1 = v0;
  v47.receiver = v0;
  v47.super_class = (Class)type metadata accessor for IntroViewController();
  objc_msgSendSuper2(&v47, "viewDidLoad");
  v2 = (void *)objc_opt_self(NSBundle);
  v3 = objc_msgSend(v2, "mainBundle");
  v48._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0x49545F4F52544E49;
  v4._object = (void *)0xEB00000000454C54;
  v5.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v5.value._object = (void *)0xEB00000000656C62;
  v6._countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  v48._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v4, v5, (NSBundle)v3, v6, v48)._object;

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v1, "setTitle:", v8);

  v9 = *(_QWORD *)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_deviceName + 8];
  if (!v9)
    goto LABEL_6;
  v10 = *(_QWORD *)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_deviceName];
  v11 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0)
    v11 = v10 & 0xFFFFFFFFFFFFLL;
  if (v11)
  {
    v12 = sub_100004480(&qword_100015D48);
    v13 = swift_allocObject(v12, 72, 7);
    *(_OWORD *)(v13 + 16) = xmmword_10000C1F0;
    *(_QWORD *)(v13 + 56) = &type metadata for String;
    *(_QWORD *)(v13 + 64) = sub_1000044FC();
    *(_QWORD *)(v13 + 32) = v10;
    *(_QWORD *)(v13 + 40) = v9;
    swift_bridgeObjectRetain(v9);
    v14 = objc_msgSend(v2, "mainBundle");
    v49._object = (void *)0xE000000000000000;
    v15._countAndFlagsBits = 0x55535F4F52544E49;
    v15._object = (void *)0xEE00454C54495442;
    v16.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v16.value._object = (void *)0xEB00000000656C62;
    v17._countAndFlagsBits = 0;
    v17._object = (void *)0xE000000000000000;
    v49._countAndFlagsBits = 0;
    v18 = NSLocalizedString(_:tableName:bundle:value:comment:)(v15, v16, (NSBundle)v14, v17, v49);

    String.init(format:arguments:)(v18._countAndFlagsBits, v18._object, v13);
    v20 = v19;
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(v18._object);
  }
  else
  {
LABEL_6:
    v21 = objc_msgSend(v2, "mainBundle");
    v50._object = (void *)0xE000000000000000;
    v22._object = (void *)0x800000010000C510;
    v22._countAndFlagsBits = 0xD000000000000016;
    v23.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v23.value._object = (void *)0xEB00000000656C62;
    v24._countAndFlagsBits = 0;
    v24._object = (void *)0xE000000000000000;
    v50._countAndFlagsBits = 0;
    v20 = NSLocalizedString(_:tableName:bundle:value:comment:)(v22, v23, (NSBundle)v21, v24, v50)._object;

  }
  v25 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v20);
  objc_msgSend(v1, "setSubtitle:", v25);

  objc_msgSend(v1, "setDismissalType:", 3);
  v26 = String._bridgeToObjectiveC()();
  v27 = objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v26);

  if (v27)
  {
    v28 = objc_msgSend((id)objc_opt_self(UIColor), "systemBlueColor");
    v29 = objc_msgSend(v27, "imageWithTintColor:", v28);

    if (v29)
    {
      v30 = sub_100004480(&qword_100015D38);
      v31 = swift_allocObject(v30, 40, 7);
      *(_OWORD *)(v31 + 16) = xmmword_10000C200;
      *(_QWORD *)(v31 + 32) = v29;
      aBlock[0] = v31;
      specialized Array._endMutation()();
      sub_1000044C0();
      v32 = v29;
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(aBlock[0]);
      objc_msgSend(v1, "setImages:", isa);

    }
  }
  v34 = objc_msgSend(v2, "mainBundle");
  v51._object = (void *)0xE000000000000000;
  v35._countAndFlagsBits = 0x45554E49544E4F43;
  v35._object = (void *)0xE800000000000000;
  v36.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v36.value._object = (void *)0xEB00000000656C62;
  v37._countAndFlagsBits = 0;
  v37._object = (void *)0xE000000000000000;
  v51._countAndFlagsBits = 0;
  v38 = NSLocalizedString(_:tableName:bundle:value:comment:)(v35, v36, (NSBundle)v34, v37, v51)._object;

  v39 = swift_allocObject(&unk_100010640, 24, 7);
  swift_unknownObjectWeakInit(v39 + 16, v1);
  swift_retain(v39);
  v40 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v38);
  aBlock[4] = sub_100004460;
  v46 = v39;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000042BC;
  aBlock[3] = &unk_100010658;
  v41 = _Block_copy(aBlock);
  v42 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v40, 0, v41);

  _Block_release(v41);
  v43 = v46;
  swift_release(v39);
  swift_release(v43);
  v44 = objc_msgSend(v1, "addAction:", v42);

}

void sub_1000041F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSString v8;
  uint64_t v9;
  _BYTE v10[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v10, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = (void *)swift_unknownObjectWeakLoadStrong(Strong + OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_coordinator);

    if (v5)
    {
      sub_100006934();

    }
  }
  swift_beginAccess(v2, &v9, 0, 0);
  v6 = swift_unknownObjectWeakLoadStrong(v2);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = String._bridgeToObjectiveC()();
    objc_msgSend(v7, "showActivityIndicatorWithStatus:", v8);

  }
}

void sub_1000042BC(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

id sub_1000043B0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntroViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntroViewController()
{
  return objc_opt_self(_TtC22HomeCaptiveViewService19IntroViewController);
}

uint64_t sub_10000443C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_unknownObjectWeakDestroy(v2 + 16, a2);
  return swift_deallocObject(v2, 24, 7);
}

void sub_100004460(uint64_t a1)
{
  uint64_t v1;

  sub_1000041F4(a1, v1);
}

uint64_t sub_100004468(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100004478(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100004480(uint64_t *a1)
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

unint64_t sub_1000044C0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100015D40;
  if (!qword_100015D40)
  {
    v1 = objc_opt_self(UIImage);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100015D40);
  }
  return result;
}

unint64_t sub_1000044FC()
{
  unint64_t result;

  result = qword_100015D50;
  if (!qword_100015D50)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100015D50);
  }
  return result;
}

uint64_t sub_100004540()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100006354(v0, qword_100015D58);
  v1 = sub_100005EB4(v0, (uint64_t)qword_100015D58);
  if (qword_100015C28 != -1)
    swift_once(&qword_100015C28, sub_10000AC28);
  v2 = sub_100005EB4(v0, (uint64_t)qword_100016380);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_1000045D0()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  _OWORD v11[2];
  _BYTE v12[24];
  uint64_t v13;

  v1 = OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___remoteViewController;
  v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___remoteViewController];
  v3 = v2;
  if (v2 == 1)
  {
    v4 = objc_msgSend(v0, "_remoteViewControllerProxy");
    if (v4)
    {
      v5 = v4;
      _bridgeAnyObjectToAny(_:)(v11);
      swift_unknownObjectRelease(v5);
    }
    else
    {
      memset(v11, 0, sizeof(v11));
    }
    sub_1000063CC((uint64_t)v11, (uint64_t)v12);
    if (v13)
    {
      v6 = sub_100004480(&qword_100015DF0);
      if (swift_dynamicCast(&v10, v12, (char *)&type metadata for Any + 8, v6, 6))
      {
        v3 = v10;
LABEL_10:
        v8 = *(_QWORD *)&v0[v1];
        *(_QWORD *)&v0[v1] = v3;
        swift_unknownObjectRetain(v3, v7);
        sub_100006414(v8);
        goto LABEL_11;
      }
    }
    else
    {
      sub_1000062E0((uint64_t)v12, &qword_100015DD0);
    }
    v3 = 0;
    goto LABEL_10;
  }
LABEL_11:
  sub_100006424(v2);
  return v3;
}

id sub_1000046D8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___notificationCenter;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___notificationCenter);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___notificationCenter);
  }
  else
  {
    v4 = sub_100006394(0, &qword_100015DE8, NSDistributedNotificationCenter_ptr);
    v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(v4), "defaultCenter");
    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

void sub_100004760(void *a1, void (*a2)(void))
{
  char *v2;
  char *v3;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  id v18;
  uint64_t v19;
  id v20;
  _QWORD *v21;
  uint64_t v22;
  id v23;
  char *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;

  if (!a1)
  {
    __break(1u);
LABEL_21:
    __break(1u);
    return;
  }
  v3 = v2;
  v5 = objc_msgSend(a1, "userInfo");
  if (v5)
  {
    v6 = v5;
    v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    v29[0] = 0x656369766564;
    v29[1] = 0xE600000000000000;
    AnyHashable.init<A>(_:)(v30, v29, &type metadata for String, &protocol witness table for String);
    if (*(_QWORD *)(v7 + 16) && (v8 = sub_100005FF4((uint64_t)v30), (v9 & 1) != 0))
    {
      sub_100006268(*(_QWORD *)(v7 + 56) + 32 * v8, (uint64_t)&v31);
    }
    else
    {
      v31 = 0u;
      v32 = 0u;
    }
    swift_bridgeObjectRelease(v7);
    sub_100006474((uint64_t)v30);
    if (*((_QWORD *)&v32 + 1))
    {
      v10 = sub_100004480(&qword_100015DF8);
      if ((swift_dynamicCast(v29, &v31, (char *)&type metadata for Any + 8, v10, 6) & 1) != 0)
      {
        v11 = v29[0];
        v12 = objc_allocWithZone((Class)CBDevice);
        v18 = sub_100005F10(v11);
        v19 = type metadata accessor for PeerDevice();
        swift_allocObject(v19, 56, 7);
        v20 = v18;
        v21 = sub_100003B74(v20);
        swift_retain(v21);
        v22 = sub_1000045D0();
        v23 = objc_allocWithZone((Class)type metadata accessor for SetupCoordinator(0));
        v24 = v3;
        v25 = sub_100009E7C((uint64_t)v21, (uint64_t)v24, v22);
        swift_release(v21);

        swift_unknownObjectRelease(v22);
        v26 = *(void **)&v24[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController_coordinator];
        *(_QWORD *)&v24[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController_coordinator] = v25;

        swift_release(v21);
        v27 = *(void **)&v3[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController_coordinator];
        if (v27)
        {
          v28 = v27;
          sub_100006B88();

        }
        if (a2)
        {
          a2();
          return;
        }
        goto LABEL_21;
      }
    }
    else
    {
      sub_1000062E0((uint64_t)&v31, &qword_100015DD0);
    }
  }
  if (qword_100015C10 != -1)
    swift_once(&qword_100015C10, sub_100004540);
  v13 = type metadata accessor for Logger(0);
  v14 = sub_100005EB4(v13, (uint64_t)qword_100015D58);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "No user device available to setup", v17, 2u);
    swift_slowDealloc(v17, -1, -1);
  }

}

void sub_100004D88(char a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  NSString v11;
  objc_super v12;

  v2 = v1;
  v12.receiver = v2;
  v12.super_class = (Class)type metadata accessor for RemoteAlertServiceViewController();
  objc_msgSendSuper2(&v12, "viewDidAppear:", a1 & 1);
  if (qword_100015C10 != -1)
    swift_once(&qword_100015C10, sub_100004540);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100005EB4(v4, (uint64_t)qword_100015D58);
  v6 = Logger.logObject.getter(v5);
  v8 = static os_log_type_t.info.getter(v6, v7);
  if (os_log_type_enabled(v6, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v8, "viewDidAppear(_:)", v9, 2u);
    swift_slowDealloc(v9, -1, -1);
  }

  v10 = sub_1000046D8();
  v11 = String._bridgeToObjectiveC()();
  objc_msgSend(v10, "addObserver:selector:name:object:", v2, "extensionDeviceLostWithNotification:", v11, 0);

}

void sub_100004F1C(char a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  NSString v11;
  void *v12;
  id v13;
  objc_super v14;

  v2 = v1;
  v14.receiver = v1;
  v14.super_class = (Class)type metadata accessor for RemoteAlertServiceViewController();
  objc_msgSendSuper2(&v14, "viewDidDisappear:", a1 & 1);
  if (qword_100015C10 != -1)
    swift_once(&qword_100015C10, sub_100004540);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100005EB4(v4, (uint64_t)qword_100015D58);
  v6 = Logger.logObject.getter(v5);
  v8 = static os_log_type_t.info.getter(v6, v7);
  if (os_log_type_enabled(v6, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v8, "viewDidDisappear(_:)", v9, 2u);
    swift_slowDealloc(v9, -1, -1);
  }

  v10 = sub_1000046D8();
  v11 = String._bridgeToObjectiveC()();
  objc_msgSend(v10, "removeObserver:name:object:", v2, v11, 0);

  v12 = *(void **)&v2[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController_coordinator];
  if (v12)
  {
    v13 = v12;
    sub_100006D48(a1 & 1);

  }
}

uint64_t sub_1000051B0(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[5];
  uint64_t v25;

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v23 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006394(0, &qword_100015DB0, OS_dispatch_queue_ptr);
  v11 = (void *)static OS_dispatch_queue.main.getter();
  v12 = swift_allocObject(&unk_100010690, 32, 7);
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = v1;
  aBlock[4] = sub_100005DBC;
  v25 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000070F0;
  aBlock[3] = &unk_1000106A8;
  v13 = _Block_copy(aBlock);
  v14 = v25;
  v15 = a1;
  v16 = v2;
  v17 = swift_release(v14);
  static DispatchQoS.unspecified.getter(v17);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v18 = sub_100005DDC();
  v19 = sub_100004480(&qword_100015DC0);
  v20 = sub_100005E24();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v19, v20, v4, v18);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_100005398(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char *v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  __int128 v36;
  __int128 v37;

  v4 = type metadata accessor for SetupFlowState(0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v32 - v8;
  v10 = objc_msgSend(a1, "userInfo");
  if (!v10)
    goto LABEL_10;
  v11 = v10;
  v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v10, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v13 = sub_100005768(v12);
  swift_bridgeObjectRelease(v12);
  if (!v13)
    goto LABEL_10;
  if (!*(_QWORD *)(v13 + 16) || (v14 = sub_100006024(0xD000000000000010, 0x800000010000C630), (v15 & 1) == 0))
  {
    v36 = 0u;
    v37 = 0u;
    swift_bridgeObjectRelease(v13);
    goto LABEL_9;
  }
  sub_100006268(*(_QWORD *)(v13 + 56) + 32 * v14, (uint64_t)&v36);
  swift_bridgeObjectRelease(v13);
  if (!*((_QWORD *)&v37 + 1))
  {
LABEL_9:
    sub_1000062E0((uint64_t)&v36, &qword_100015DD0);
    goto LABEL_10;
  }
  if (swift_dynamicCast(&v34, &v36, (char *)&type metadata for Any + 8, &type metadata for String, 6))
  {
    v17 = v34;
    v16 = v35;
    goto LABEL_11;
  }
LABEL_10:
  v17 = 0;
  v16 = 0xE000000000000000;
LABEL_11:
  if (qword_100015C10 != -1)
    swift_once(&qword_100015C10, sub_100004540);
  v18 = type metadata accessor for Logger(0);
  sub_100005EB4(v18, (uint64_t)qword_100015D58);
  v19 = swift_bridgeObjectRetain(v16);
  v20 = Logger.logObject.getter(v19);
  v22 = static os_log_type_t.info.getter(v20, v21);
  if (os_log_type_enabled(v20, v22))
  {
    v32 = v7;
    v33 = v9;
    v23 = (uint8_t *)swift_slowAlloc(12, -1);
    v24 = swift_slowAlloc(32, -1);
    *(_QWORD *)&v36 = v24;
    *(_DWORD *)v23 = 136315138;
    swift_bridgeObjectRetain(v16);
    v34 = sub_10000B218(v17, v16, (uint64_t *)&v36);
    v7 = v32;
    v9 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35, v23 + 4, v23 + 12);
    swift_bridgeObjectRelease_n(v16, 3);
    _os_log_impl((void *)&_mh_execute_header, v20, v22, "BLE Extension device lost: %s", v23, 0xCu);
    swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v23, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v16, 2);
  }
  v25 = *(char **)(a2 + OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController_coordinator);
  if (v25)
  {
    v26 = (uint64_t)&v25[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state];
    swift_beginAccess(&v25[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state], &v36, 0, 0);
    sub_100005ECC(v26, (uint64_t)v9);
    swift_storeEnumTagMultiPayload(v7, v4, 2);
    v27 = v25;
    sub_100009FC0((uint64_t)v9, (uint64_t)v7);
    v29 = v28;
    sub_10000622C((uint64_t)v7);
    sub_10000622C((uint64_t)v9);
    if ((v29 & 1) != 0
      || (sub_100005ECC(v26, (uint64_t)v9),
          swift_storeEnumTagMultiPayload(v7, v4, 3),
          sub_100009FC0((uint64_t)v9, (uint64_t)v7),
          v31 = v30,
          sub_10000622C((uint64_t)v7),
          sub_10000622C((uint64_t)v9),
          (v31 & 1) != 0))
    {
      sub_100006D48(1);
    }

  }
}

unint64_t sub_100005768(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t result;
  int64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD v29[2];
  _OWORD v30[2];
  __int128 v31;
  _OWORD v32[2];
  _OWORD v33[2];
  _OWORD v34[2];
  _OWORD v35[2];
  uint64_t v36;
  _OWORD v37[2];
  _OWORD v38[2];
  uint64_t v39;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_100004480(&qword_100015DD8);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v26 = a1 + 64;
  v4 = -1;
  v5 = -1 << *(_BYTE *)(a1 + 32);
  if (-v5 < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & *(_QWORD *)(a1 + 64);
  v25 = (unint64_t)(63 - v5) >> 6;
  result = swift_bridgeObjectRetain(a1);
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v11 = (v6 - 1) & v6;
      v12 = __clz(__rbit64(v6)) | (v8 << 6);
      v13 = v8;
    }
    else
    {
      v14 = v8 + 1;
      if (__OFADD__(v8, 1))
        goto LABEL_37;
      if (v14 >= v25)
      {
LABEL_33:
        sub_10000631C(a1);
        return (unint64_t)v3;
      }
      v15 = *(_QWORD *)(v26 + 8 * v14);
      v13 = v8 + 1;
      if (!v15)
      {
        v13 = v8 + 2;
        if (v8 + 2 >= v25)
          goto LABEL_33;
        v15 = *(_QWORD *)(v26 + 8 * v13);
        if (!v15)
        {
          v13 = v8 + 3;
          if (v8 + 3 >= v25)
            goto LABEL_33;
          v15 = *(_QWORD *)(v26 + 8 * v13);
          if (!v15)
          {
            v13 = v8 + 4;
            if (v8 + 4 >= v25)
              goto LABEL_33;
            v15 = *(_QWORD *)(v26 + 8 * v13);
            if (!v15)
            {
              v16 = v8 + 5;
              if (v8 + 5 >= v25)
                goto LABEL_33;
              v15 = *(_QWORD *)(v26 + 8 * v16);
              if (!v15)
              {
                while (1)
                {
                  v13 = v16 + 1;
                  if (__OFADD__(v16, 1))
                    goto LABEL_38;
                  if (v13 >= v25)
                    goto LABEL_33;
                  v15 = *(_QWORD *)(v26 + 8 * v13);
                  ++v16;
                  if (v15)
                    goto LABEL_26;
                }
              }
              v13 = v8 + 5;
            }
          }
        }
      }
LABEL_26:
      v11 = (v15 - 1) & v15;
      v12 = __clz(__rbit64(v15)) + (v13 << 6);
    }
    sub_1000062A4(*(_QWORD *)(a1 + 48) + 40 * v12, (uint64_t)v37);
    sub_100006268(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v38 + 8);
    v35[0] = v38[0];
    v35[1] = v38[1];
    v36 = v39;
    v34[0] = v37[0];
    v34[1] = v37[1];
    sub_1000062A4((uint64_t)v34, (uint64_t)v29);
    if (!swift_dynamicCast(&v27, v29, &type metadata for AnyHashable, &type metadata for String, 6))
    {
      v27 = 0;
      v28 = 0;
      sub_1000062E0((uint64_t)v34, &qword_100015DE0);
      swift_bridgeObjectRelease(v28);
      sub_10000631C(a1);
      swift_release(v3);
      return 0;
    }
    v17 = v27;
    v18 = v28;
    sub_100006268((uint64_t)v35 + 8, (uint64_t)v29);
    sub_1000062E0((uint64_t)v34, &qword_100015DE0);
    sub_100006324(v29, v30);
    *(_QWORD *)&v31 = v17;
    *((_QWORD *)&v31 + 1) = v18;
    sub_100006324(v30, v32);
    v19 = v31;
    sub_100006324(v32, v33);
    sub_100006324(v33, &v31);
    result = sub_100006024(v19, *((uint64_t *)&v19 + 1));
    v20 = result;
    if ((v21 & 1) != 0)
    {
      v9 = v3[6] + 16 * result;
      swift_bridgeObjectRelease(*(_QWORD *)(v9 + 8));
      *(_OWORD *)v9 = v19;
      v10 = (_QWORD *)(v3[7] + 32 * v20);
      sub_100006334(v10);
      result = (unint64_t)sub_100006324(&v31, v10);
      goto LABEL_8;
    }
    if (v3[2] >= v3[3])
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v3[6] + 16 * result) = v19;
    result = (unint64_t)sub_100006324(&v31, (_OWORD *)(v3[7] + 32 * result));
    v22 = v3[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_36;
    v3[2] = v24;
LABEL_8:
    v8 = v13;
    v6 = v11;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

id sub_100005B8C(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  NSString v6;
  id v7;
  objc_super v9;

  *(_QWORD *)&v3[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___remoteViewController] = 1;
  *(_QWORD *)&v3[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController_coordinator] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___notificationCenter] = 0;
  if (a2)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for RemoteAlertServiceViewController();
  v7 = objc_msgSendSuper2(&v9, "initWithNibName:bundle:", v6, a3);

  return v7;
}

id sub_100005CF8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteAlertServiceViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RemoteAlertServiceViewController()
{
  return objc_opt_self(_TtC22HomeCaptiveViewService32RemoteAlertServiceViewController);
}

uint64_t sub_100005D90()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_100005DBC()
{
  uint64_t v0;

  sub_100005398(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_100005DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100005DD4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100005DDC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100015DB8;
  if (!qword_100015DB8)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_100015DB8);
  }
  return result;
}

unint64_t sub_100005E24()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100015DC8;
  if (!qword_100015DC8)
  {
    v1 = sub_100005E70(&qword_100015DC0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100015DC8);
  }
  return result;
}

uint64_t sub_100005E70(uint64_t *a1)
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

uint64_t sub_100005EB4(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100005ECC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SetupFlowState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_100005F10(uint64_t a1)
{
  void *v1;
  Class isa;
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v9 = 0;
  v4 = objc_msgSend(v1, "initWithDictionary:error:", isa, &v9);

  v5 = v9;
  if (v4)
  {
    v6 = v9;
  }
  else
  {
    v7 = v9;
    _convertNSErrorToError(_:)(v5);

    swift_willThrow();
  }
  return v4;
}

unint64_t sub_100005FF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100006088(a1, v4);
}

unint64_t sub_100006024(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10000614C(a1, a2, v5);
}

unint64_t sub_100006088(uint64_t a1, uint64_t a2)
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
      sub_1000062A4(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100006474((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_10000614C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10000622C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SetupFlowState(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006268(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000062A4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1000062E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100004480(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000631C(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

_OWORD *sub_100006324(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100006334(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t *sub_100006354(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100006394(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_1000063CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004480(&qword_100015DD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006414(uint64_t result)
{
  if (result != 1)
    return swift_unknownObjectRelease();
  return result;
}

uint64_t sub_100006424(uint64_t result)
{
  if (result != 1)
    return swift_unknownObjectRetain();
  return result;
}

uint64_t sub_100006434(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100006444()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006468()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_100006474(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_1000064A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100006354(v0, qword_100015E00);
  v1 = sub_100005EB4(v0, (uint64_t)qword_100015E00);
  if (qword_100015C28 != -1)
    swift_once(&qword_100015C28, sub_10000AC28);
  v2 = sub_100005EB4(v0, (uint64_t)qword_100016380);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_100006538(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *oslog;
  _QWORD aBlock[5];
  uint64_t v23;

  if ((*(_BYTE *)(v2 + 32) & 1) != 0)
  {
    if (qword_100015C18 != -1)
      swift_once(&qword_100015C18, sub_1000064A8);
    v3 = type metadata accessor for Logger(0);
    sub_100005EB4(v3, (uint64_t)qword_100015E00);
    oslog = Logger.logObject.getter();
    v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v4, "SKSetupCaptiveNetworkJoinClient was already activated. Ignoring the call", v5, 2u);
      swift_slowDealloc(v5, -1, -1);
    }

  }
  else
  {
    v6 = v2;
    if (qword_100015C18 != -1)
      swift_once(&qword_100015C18, sub_1000064A8);
    v9 = type metadata accessor for Logger(0);
    sub_100005EB4(v9, (uint64_t)qword_100015E00);
    v10 = Logger.logObject.getter();
    v11 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Activating SetupKit Client", v12, 2u);
      swift_slowDealloc(v12, -1, -1);
    }

    v13 = objc_msgSend(objc_allocWithZone((Class)SKSetupCaptiveNetworkJoinClient), "init");
    v14 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v13;

    v15 = *(void **)(v6 + 16);
    if (v15)
    {
      objc_msgSend(v15, "setPeerDevice:", *(_QWORD *)(v6 + 24));
      v16 = *(void **)(v6 + 16);
      if (v16)
      {
        aBlock[4] = a1;
        v23 = a2;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_1000042BC;
        aBlock[3] = &unk_1000106F8;
        v17 = _Block_copy(aBlock);
        v18 = v23;
        v19 = v16;
        swift_retain(a2);
        swift_release(v18);
        objc_msgSend(v19, "setEventHandler:", v17);
        _Block_release(v17);

        v20 = *(void **)(v6 + 16);
        if (v20)
          objc_msgSend(v20, "activate");
      }
    }
    *(_BYTE *)(v6 + 32) = 1;
  }
}

void sub_1000067BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = v0;
  if (qword_100015C18 != -1)
    swift_once(&qword_100015C18, sub_1000064A8);
  v2 = type metadata accessor for Logger(0);
  sub_100005EB4(v2, (uint64_t)qword_100015E00);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Stopping SetupKit Client", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  v6 = *(void **)(v1 + 16);
  if (v6 && (objc_msgSend(v6, "invalidate"), (v7 = *(void **)(v1 + 16)) != 0))
  {
    objc_msgSend(v7, "setEventHandler:", 0);
    v8 = *(void **)(v1 + 16);
  }
  else
  {
    v8 = 0;
  }
  *(_QWORD *)(v1 + 16) = 0;

  *(_BYTE *)(v1 + 32) = 0;
}

uint64_t sub_1000068D0()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 33, 7);
}

uint64_t type metadata accessor for Setup()
{
  return objc_opt_self(_TtC22HomeCaptiveViewService5Setup);
}

uint64_t sub_10000691C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000692C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100006934()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15[3];

  v1 = v0;
  v2 = type metadata accessor for SetupFlowState(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v15[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100015C20 != -1)
    swift_once(&qword_100015C20, sub_10000711C);
  v5 = type metadata accessor for Logger(0);
  v6 = sub_100005EB4(v5, (uint64_t)qword_100015ED0);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v10 = swift_slowAlloc(32, -1);
    v15[0] = v10;
    *(_DWORD *)v9 = 136315138;
    v14 = sub_10000B218(0xD000000000000013, 0x800000010000C940, v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, v15, v9 + 4, v9 + 12);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s", v9, 0xCu);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);
  }

  v11 = v1 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state;
  swift_beginAccess(v1 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state, v15, 0, 0);
  sub_100005ECC(v11, (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload(v4, v2) != 3)
    return sub_10000622C((uint64_t)v4);
  v12 = swift_allocObject(&unk_100010820, 24, 7);
  swift_unknownObjectWeakInit(v12 + 16, v1);
  swift_retain(v12);
  sub_100006538((uint64_t)sub_10000AA38, v12);
  return swift_release_n(v12, 2);
}

uint64_t sub_100006B88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  char v14;
  uint64_t result;
  _BYTE v17[24];

  v1 = v0;
  v2 = type metadata accessor for SetupFlowState(0);
  v3 = __chkstk_darwin(v2);
  v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v3);
  v7 = &v17[-v6 - 8];
  if (qword_100015C20 != -1)
    swift_once(&qword_100015C20, sub_10000711C);
  v8 = type metadata accessor for Logger(0);
  v9 = sub_100005EB4(v8, (uint64_t)qword_100015ED0);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Starting SetupCoordinator", v12, 2u);
    swift_slowDealloc(v12, -1, -1);
  }

  v13 = v1 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state;
  swift_beginAccess(v1 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state, v17, 0, 0);
  sub_100005ECC(v13, (uint64_t)v7);
  swift_storeEnumTagMultiPayload(v5, v2, 2);
  sub_100009FC0((uint64_t)v7, (uint64_t)v5);
  LOBYTE(v13) = v14;
  sub_10000622C((uint64_t)v5);
  result = sub_10000622C((uint64_t)v7);
  if ((v13 & 1) != 0)
  {
    swift_storeEnumTagMultiPayload(v7, v2, 3);
    sub_100007430((uint64_t)v7);
    return sub_10000622C((uint64_t)v7);
  }
  return result;
}

id sub_100006D48(char a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  id v23;
  void *Strong;
  void *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  id result;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[24];
  uint64_t v35;

  v3 = type metadata accessor for SetupFlowState(0);
  __chkstk_darwin();
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100015C20 != -1)
    swift_once(&qword_100015C20, sub_10000711C);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100005EB4(v6, (uint64_t)qword_100015ED0);
  v8 = v1;
  v9 = Logger.logObject.getter();
  v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    v31 = v3;
    *(_DWORD *)v11 = 136315138;
    v35 = v12;
    v30 = v11 + 4;
    v13 = (uint64_t)&v8[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state];
    swift_beginAccess(&v8[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state], v34, 0, 0);
    sub_100005ECC(v13, (uint64_t)v5);
    sub_1000071AC();
    v15 = v14;
    v32 = v7;
    v16 = a1;
    v18 = v17;
    sub_10000622C((uint64_t)v5);
    v33 = sub_10000B218(v15, v18, &v35);
    v3 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34, v30, v11 + 12);

    v19 = v18;
    a1 = v16;
    swift_bridgeObjectRelease(v19);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Dismissing UI - Current State: %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

  }
  else
  {

  }
  v20 = Logger.logObject.getter();
  v21 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Stopping SetupCoordinator", v22, 2u);
    swift_slowDealloc(v22, -1, -1);
  }

  sub_1000067BC();
  swift_storeEnumTagMultiPayload(v5, v3, 2);
  sub_100007430(v5);
  sub_10000622C((uint64_t)v5);
  v23 = sub_1000073C0();
  objc_msgSend(v23, "invalidate");

  Strong = (void *)swift_unknownObjectWeakLoadStrong(&v8[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController]);
  if (Strong)
  {
    v25 = Strong;
    objc_msgSend(Strong, "dismissViewControllerAnimated:completion:", a1 & 1, 0);

  }
  v26 = Logger.logObject.getter();
  v27 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Dismissing RemoteViewController", v28, 2u);
    swift_slowDealloc(v28, -1, -1);
  }

  result = *(id *)&v8[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_remoteViewController];
  if (result)
    return objc_msgSend(result, "dismiss");
  return result;
}

uint64_t sub_1000070F0(uint64_t a1)
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

uint64_t sub_10000711C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100006354(v0, qword_100015ED0);
  v1 = sub_100005EB4(v0, (uint64_t)qword_100015ED0);
  if (qword_100015C28 != -1)
    swift_once(&qword_100015C28, sub_10000AC28);
  v2 = sub_100005EB4(v0, (uint64_t)qword_100016380);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_1000071AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;

  v1 = v0;
  v2 = type metadata accessor for SetupFlowState(0);
  __chkstk_darwin();
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005ECC(v1, (uint64_t)v4);
  v5 = (char *)sub_100007244 + 4 * byte_10000C2E0[swift_getEnumCaseMultiPayload(v4, v2)];
  __asm { BR              X10 }
}

uint64_t sub_100007244()
{
  return 0x72696150206E6950;
}

id sub_1000073C0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator____lazy_storage___sfClient;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator____lazy_storage___sfClient);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator____lazy_storage___sfClient);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)SFClient), "init");
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void sub_100007430(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[12];
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30[3];
  char v31[24];

  v3 = type metadata accessor for SetupFlowState(0);
  v4 = __chkstk_darwin(v3);
  v6 = &v26[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  v8 = &v26[-v7];
  v9 = (uint64_t)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state];
  swift_beginAccess(&v1[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state], v31, 0, 0);
  sub_100005ECC(v9, (uint64_t)v8);
  sub_100009FC0((uint64_t)v8, a1);
  v11 = v10;
  sub_10000622C((uint64_t)v8);
  if ((v11 & 1) == 0)
  {
    if (qword_100015C20 != -1)
      swift_once(&qword_100015C20, sub_10000711C);
    v12 = type metadata accessor for Logger(0);
    sub_100005EB4(v12, (uint64_t)qword_100015ED0);
    sub_100005ECC(a1, (uint64_t)v6);
    v13 = v1;
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.info.getter();
    v16 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      v17 = swift_slowAlloc(22, -1);
      v28 = swift_slowAlloc(64, -1);
      v30[0] = v28;
      *(_DWORD *)v17 = 136315394;
      sub_100005ECC(v9, (uint64_t)v8);
      v27 = v16;
      sub_1000071AC();
      v19 = v18;
      v21 = v20;
      sub_10000622C((uint64_t)v8);
      v29 = sub_10000B218(v19, v21, v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, v30, v17 + 4, v17 + 12);

      swift_bridgeObjectRelease(v21);
      *(_WORD *)(v17 + 12) = 2080;
      sub_1000071AC();
      v23 = v22;
      v29 = sub_10000B218(v24, v22, v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, v30, v17 + 14, v17 + 22);
      swift_bridgeObjectRelease(v23);
      sub_10000622C((uint64_t)v6);
      _os_log_impl((void *)&_mh_execute_header, v14, (os_log_type_t)v27, "Transitioning from %s to %s", (uint8_t *)v17, 0x16u);
      v25 = v28;
      swift_arrayDestroy(v28, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v25, -1, -1);
      swift_slowDealloc(v17, -1, -1);
    }
    else
    {

      sub_10000622C((uint64_t)v6);
    }

    swift_beginAccess(v9, v30, 33, 0);
    sub_10000A994(a1, v9);
    swift_endAccess(v30);
    sub_1000083FC();
  }
}

void sub_100007714(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  _BYTE v6[24];

  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    sub_10000776C(a1);

  }
}

void sub_10000776C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  id v20;
  uint64_t v21;
  uint8_t *v22;
  __CFString *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void **v31;
  uint8_t *v32;
  id v33;
  void *v34;
  char *v35;
  id v36;
  char *v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  void *Strong;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  void (*v79)(char *, char *, uint64_t);
  uint64_t v80;
  void *v81;
  char *v82;
  id v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  id v90;
  char *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  os_log_type_t v97;
  uint8_t *v98;
  void **v99;
  NSObject *v100;
  os_log_type_t v101;
  uint8_t *v102;
  void ***v103;
  void **v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint8_t *v110;
  void **v111;
  char *v112;
  uint64_t v113;
  char *v114;
  char *v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  _QWORD v120[3];
  char v121[8];
  uint64_t v122;
  char *v123;
  void **aBlock;
  _QWORD v125[4];
  uint64_t v126;

  v2 = sub_100004480(&qword_100016188);
  __chkstk_darwin(v2);
  v116 = (char *)&v109 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v109 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v114 = (char *)&v109 - v9;
  v10 = type metadata accessor for SetupFlowState(0);
  v11 = __chkstk_darwin(v10);
  v115 = (char *)&v109 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v14 = (uint64_t *)((char *)&v109 - v13);
  if (qword_100015C20 != -1)
    swift_once(&qword_100015C20, sub_10000711C);
  v15 = type metadata accessor for Logger(0);
  v16 = sub_100005EB4(v15, (uint64_t)qword_100015ED0);
  v17 = a1;
  v118 = v16;
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v112 = v8;
    v20 = v17;
    v21 = swift_slowAlloc(12, -1);
    v117 = v10;
    v22 = (uint8_t *)v21;
    v111 = (void **)swift_slowAlloc(32, -1);
    aBlock = v111;
    *(_DWORD *)v22 = 136315138;
    v110 = v22 + 4;
    v23 = sub_10000AA54((int)objc_msgSend(v17, "eventType"));
    v24 = v4;
    v25 = v14;
    v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
    v113 = v5;
    v28 = v27;

    v17 = v20;
    v8 = v112;
    v29 = v26;
    v14 = v25;
    v4 = v24;
    v123 = (char *)sub_10000B218(v29, v28, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v123, &aBlock, v110, v22 + 12);

    v30 = v28;
    v5 = v113;
    swift_bridgeObjectRelease(v30);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Recieved SKEvent: %s", v22, 0xCu);
    v31 = v111;
    swift_arrayDestroy(v111, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v31, -1, -1);
    v32 = v22;
    v10 = v117;
    swift_slowDealloc(v32, -1, -1);

  }
  else
  {

  }
  v33 = objc_msgSend(v17, "error");
  if (v33)
  {
    v34 = v33;
    v35 = v119;
    v36 = v34;
    v37 = v35;
    v38 = v36;
    v39 = Logger.logObject.getter(v38);
    v40 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = swift_slowAlloc(22, -1);
      v117 = v10;
      v42 = v41;
      v119 = (char *)swift_slowAlloc(64, -1);
      v123 = v119;
      *(_DWORD *)v42 = 136315394;
      v43 = (uint64_t)&v37[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state];
      swift_beginAccess(&v37[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state], &aBlock, 0, 0);
      sub_100005ECC(v43, (uint64_t)v14);
      sub_1000071AC();
      v45 = v44;
      v47 = v46;
      sub_10000622C((uint64_t)v14);
      v122 = sub_10000B218(v45, v47, (uint64_t *)&v123);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v122, &v123, v42 + 4, v42 + 12);

      swift_bridgeObjectRelease(v47);
      *(_WORD *)(v42 + 12) = 2080;
      swift_getErrorValue(v38, v121, v120);
      v48 = Error.localizedDescription.getter(v120[1], v120[2]);
      v50 = v49;
      v122 = sub_10000B218(v48, v49, (uint64_t *)&v123);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v122, &v123, v42 + 14, v42 + 22);

      swift_bridgeObjectRelease(v50);
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "CurrentState - %s - SetupKit Error: %s", (uint8_t *)v42, 0x16u);
      v51 = v119;
      swift_arrayDestroy(v119, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v51, -1, -1);
      v52 = v42;
      v10 = v117;
      swift_slowDealloc(v52, -1, -1);

    }
    else
    {

    }
    swift_storeEnumTagMultiPayload(v14, v10, 11);
    sub_100007430((uint64_t)v14);

    goto LABEL_48;
  }
  v53 = objc_msgSend(v17, "eventType");
  if ((int)v53 > 99)
  {
    if ((int)v53 <= 199)
    {
      switch((int)v53)
      {
        case 100:
        case 110:
        case 130:
          return;
        case 120:
          v54 = objc_opt_self(SKAuthenticationRequestEvent);
          if (!swift_dynamicCastObjCClass(v17, v54))
            goto LABEL_46;
          *v14 = 4;
          swift_storeEnumTagMultiPayload(v14, v10, 0);
          v55 = v17;
          sub_100007430((uint64_t)v14);

          goto LABEL_48;
        case 140:
          v56 = v14;
          v57 = v10;
          v58 = 5;
          goto LABEL_47;
        default:
          goto LABEL_35;
      }
    }
    if ((_DWORD)v53 != 200)
    {
      if ((_DWORD)v53 == 201)
        return;
      if ((_DWORD)v53 == 202)
      {
        Strong = (void *)swift_unknownObjectWeakLoadStrong(&v119[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController]);
        if (Strong)
        {
          v60 = Strong;
          v61 = objc_msgSend(Strong, "presentedViewController");

          if (v61)
          {
            v62 = objc_opt_self(WSWebSheetViewController);
            v63 = swift_dynamicCastObjCClass(v61, v62);
            if (v63)
            {
              v64 = (void *)v63;
              v65 = Logger.logObject.getter(v63);
              v66 = static os_log_type_t.info.getter();
              if (os_log_type_enabled(v65, v66))
              {
                v67 = (uint8_t *)swift_slowAlloc(2, -1);
                *(_WORD *)v67 = 0;
                _os_log_impl((void *)&_mh_execute_header, v65, v66, "Informing websheet with a sucess probe result", v67, 2u);
                swift_slowDealloc(v67, -1, -1);
              }

              v68 = swift_allocObject(&unk_1000108C0, 24, 7);
              *(_QWORD *)(v68 + 16) = v64;
              v125[3] = sub_10000AA40;
              v126 = v68;
              aBlock = _NSConcreteStackBlock;
              v125[0] = 1107296256;
              v125[1] = sub_1000070F0;
              v125[2] = &unk_1000108D8;
              v69 = _Block_copy(&aBlock);
              v70 = v126;
              v71 = v61;
              swift_release(v70);
              objc_msgSend(v64, "handleProbeResult:completionHandler:", 0, v69);
              _Block_release(v69);

            }
            else
            {

            }
          }
        }
        return;
      }
LABEL_35:
      v96 = Logger.logObject.getter(v53);
      v97 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v96, v97))
      {
        v98 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v98 = 0;
        _os_log_impl((void *)&_mh_execute_header, v96, v97, "bad state. Invalidating", v98, 2u);
        swift_slowDealloc(v98, -1, -1);
      }

LABEL_38:
      v56 = v14;
      v57 = v10;
      v58 = 9;
LABEL_47:
      swift_storeEnumTagMultiPayload(v56, v57, v58);
      sub_100007430((uint64_t)v14);
LABEL_48:
      sub_10000622C((uint64_t)v14);
      return;
    }
    v72 = objc_opt_self(SKEventCaptiveNetworkPresent);
    v73 = swift_dynamicCastObjCClass(v17, v72);
    if (!v73)
    {
LABEL_42:
      v99 = (void **)v17;
      v100 = Logger.logObject.getter(v99);
      v101 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v100, v101))
      {
        v117 = v10;
        v102 = (uint8_t *)swift_slowAlloc(12, -1);
        v103 = (void ***)swift_slowAlloc(8, -1);
        *(_DWORD *)v102 = 138412290;
        aBlock = v99;
        v104 = v99;
        v10 = v117;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v125, v102 + 4, v102 + 12);
        *v103 = v99;

        _os_log_impl((void *)&_mh_execute_header, v100, v101, "failed to obtain data from the event: %@", v102, 0xCu);
        v105 = sub_100004480((uint64_t *)&unk_100016190);
        swift_arrayDestroy(v103, 1, v105);
        swift_slowDealloc(v103, -1, -1);
        swift_slowDealloc(v102, -1, -1);
      }
      else
      {

        v100 = v99;
      }

LABEL_46:
      v56 = v14;
      v57 = v10;
      v58 = 11;
      goto LABEL_47;
    }
    v74 = (void *)v73;
    v75 = v17;
    v76 = v17;
    v77 = objc_msgSend(v74, "captiveURL");
    if (v77)
    {
      v78 = v77;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      v79 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
      v80 = (uint64_t)v116;
      v79(v116, v8, v4);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v80, 0, 1, v4);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v80, 1, v4) != 1)
      {
        v81 = v76;
        v82 = v114;
        v79(v114, (char *)v80, v4);
        v83 = objc_msgSend(v74, "captiveSSID");
        if (v83)
        {
          v84 = v83;
          v85 = static String._unconditionallyBridgeFromObjectiveC(_:)(v83);
          v87 = v86;

          v88 = sub_100004480(&qword_100016070);
          v89 = (uint64_t *)&v115[*(int *)(v88 + 48)];
          (*(void (**)(void))(v5 + 16))();
          *v89 = v85;
          v89[1] = v87;
          v90 = objc_msgSend(v74, "captiveInterfaceIdentifier");
          v91 = v82;
          if (v90)
          {
            v92 = v90;
            v93 = static String._unconditionallyBridgeFromObjectiveC(_:)(v90);
            v95 = v94;

          }
          else
          {
            v93 = 0;
            v95 = 0;
          }
          v106 = *(int *)(v88 + 64);
          v107 = (uint64_t)v115;
          v108 = (uint64_t *)&v115[v106];
          *v108 = v93;
          v108[1] = v95;
          swift_storeEnumTagMultiPayload(v107, v10, 1);
          sub_100007430(v107);

          sub_10000622C(v107);
          (*(void (**)(char *, uint64_t))(v5 + 8))(v91, v4);
          return;
        }

        (*(void (**)(char *, uint64_t))(v5 + 8))(v82, v4);
        goto LABEL_41;
      }
    }
    else
    {
      v80 = (uint64_t)v116;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v116, 1, 1, v4);
    }

    sub_1000062E0(v80, &qword_100016188);
LABEL_41:
    v17 = v75;
    goto LABEL_42;
  }
  switch((int)v53)
  {
    case 0:
    case 10:
      return;
    case 20:
      v56 = v14;
      v57 = v10;
      v58 = 8;
      goto LABEL_47;
    case 30:
    case 41:
      goto LABEL_38;
    case 40:
      v56 = v14;
      v57 = v10;
      v58 = 4;
      goto LABEL_47;
    default:
      goto LABEL_35;
  }
}

void sub_1000083FC()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  os_log_t v31;
  void **v32;
  uint64_t v33;
  NSURL *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  char *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  NSString v58;
  NSString v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *Strong;
  id v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  char *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  char *v75;
  char *v76;
  id v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  char *v81;
  id v82;
  os_log_t v83;
  int v84;
  void **v85;
  unint64_t v86;
  id v87;
  void (*v88)(char *, uint64_t);
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void **aBlock;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void *v95;
  void (*v96)(char);
  uint64_t v97;
  char v98[24];

  v1 = v0;
  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v83 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v83 - v7;
  v9 = type metadata accessor for SetupFlowState(0);
  __chkstk_darwin(v9);
  v11 = (uint64_t *)((char *)&v83 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = (uint64_t)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state];
  swift_beginAccess(&v1[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state], v98, 0, 0);
  sub_100005ECC(v12, (uint64_t)v11);
  switch(swift_getEnumCaseMultiPayload(v11, v9))
  {
    case 0u:
      sub_100008CFC(*v11);
      return;
    case 1u:
      v13 = sub_100004480(&qword_100016070);
      v14 = (uint64_t *)((char *)v11 + *(int *)(v13 + 48));
      v15 = v14[1];
      v90 = *v14;
      v16 = (uint64_t *)((char *)v11 + *(int *)(v13 + 64));
      v17 = *v16;
      v18 = v16[1];
      (*(void (**)(char *, uint64_t *, uint64_t))(v3 + 32))(v8, v11, v2);
      v19 = objc_msgSend(objc_allocWithZone((Class)WSWebSheetViewController), "init");
      if (v18)
        v20 = v17;
      else
        v20 = 0;
      if (!v18)
        v18 = 0xE000000000000000;
      if (qword_100015C20 != -1)
        swift_once(&qword_100015C20, sub_10000711C);
      v89 = v20;
      v21 = type metadata accessor for Logger(0);
      sub_100005EB4(v21, (uint64_t)qword_100015ED0);
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
      swift_bridgeObjectRetain_n(v15, 2);
      v22 = swift_bridgeObjectRetain_n(v18, 2);
      v23 = Logger.logObject.getter(v22);
      v24 = static os_log_type_t.info.getter();
      v25 = v24;
      if (os_log_type_enabled(v23, v24))
      {
        v26 = swift_slowAlloc(32, -1);
        v87 = v19;
        v27 = v26;
        v85 = (void **)swift_slowAlloc(96, -1);
        aBlock = v85;
        *(_DWORD *)v27 = 136315650;
        v84 = v25;
        v83 = v23;
        v28 = URL.absoluteString.getter();
        v86 = v18;
        v30 = v29;
        v91 = sub_10000B218(v28, v29, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v91, &aBlock, v27 + 4, v27 + 12);
        swift_bridgeObjectRelease(v30);
        v88 = *(void (**)(char *, uint64_t))(v3 + 8);
        v88(v6, v2);
        *(_WORD *)(v27 + 12) = 2080;
        swift_bridgeObjectRetain(v15);
        v91 = sub_10000B218(v90, v15, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v91, &aBlock, v27 + 14, v27 + 22);
        swift_bridgeObjectRelease_n(v15, 3);
        *(_WORD *)(v27 + 22) = 2080;
        v18 = v86;
        swift_bridgeObjectRetain(v86);
        v91 = sub_10000B218(v89, v18, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v91, &aBlock, v27 + 24, v27 + 32);
        swift_bridgeObjectRelease_n(v18, 3);
        v31 = v83;
        _os_log_impl((void *)&_mh_execute_header, v83, (os_log_type_t)v84, "Presenting WebSheet with url: %s ssid: %s interface: %s", (uint8_t *)v27, 0x20u);
        v32 = v85;
        swift_arrayDestroy(v85, 3, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v32, -1, -1);
        v33 = v27;
        v19 = v87;
        swift_slowDealloc(v33, -1, -1);

      }
      else
      {
        v88 = *(void (**)(char *, uint64_t))(v3 + 8);
        v88(v6, v2);

        swift_bridgeObjectRelease_n(v18, 2);
        swift_bridgeObjectRelease_n(v15, 2);
      }
      URL._bridgeToObjectiveC()(v34);
      v57 = v56;
      v58 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v15);
      v59 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v18);
      objc_msgSend(v19, "startWithURL:ssid:interface:proxyConfiguration:showCancelMenu:delegate:", v57, v58, v59, 0, 0, v1);

      v60 = objc_opt_self(PRXCardContentViewController);
      v61 = swift_dynamicCastObjCClass(v19, v60);
      if (v61)
      {
        v62 = v61;
        Strong = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController]);
        if (Strong)
        {
          v64 = Strong;
          objc_msgSend(Strong, "pushViewController:animated:", v19, 1);

        }
        else
        {
          v77 = v19;
          v64 = sub_1000073C0();
          v78 = swift_allocObject(&unk_100010780, 32, 7);
          *(_QWORD *)(v78 + 16) = v1;
          *(_QWORD *)(v78 + 24) = v62;
          v96 = sub_10000AA04;
          v97 = v78;
          aBlock = _NSConcreteStackBlock;
          v93 = 1107296256;
          v94 = sub_1000090F0;
          v95 = &unk_100010798;
          v79 = _Block_copy(&aBlock);
          v80 = v97;
          v81 = v1;
          v82 = v77;
          swift_release(v80);
          objc_msgSend(v64, "startProxCardTransactionWithOptions:completion:", 0, v79);
          _Block_release(v79);

        }
      }
      else
      {
        objc_msgSend(v19, "setModalPresentationCapturesStatusBarAppearance:", 1);
        objc_msgSend(v19, "setModalPresentationStyle:", 5);
        v68 = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController]);
        if (v68
          && (v69 = v68,
              v70 = objc_msgSend(v68, "topViewController"),
              v69,
              v70))
        {
          objc_msgSend(v70, "presentViewController:animated:completion:", v19, 1, 0);

        }
        else
        {

        }
      }
      v88(v8, v2);
      return;
    case 3u:
      v35 = type metadata accessor for IntroViewController();
      v36 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v35)), "init");
      swift_unknownObjectWeakAssign(&v36[OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_coordinator], v1);
      v37 = *(_QWORD *)&v1[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_device];
      v39 = *(_QWORD *)(v37 + 16);
      v38 = *(_QWORD *)(v37 + 24);
      v40 = &v36[OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_deviceName];
      v41 = *(_QWORD *)&v36[OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_deviceName + 8];
      *(_QWORD *)v40 = v39;
      *((_QWORD *)v40 + 1) = v38;
      swift_bridgeObjectRetain(v38);
      swift_bridgeObjectRelease(v41);
      v42 = objc_opt_self(PRXCardContentViewController);
      v43 = swift_dynamicCastObjCClass(v36, v42);
      if (v43)
      {
        v44 = v43;
        v45 = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController]);
        if (v45)
        {
          v46 = v45;
          objc_msgSend(v45, "pushViewController:animated:", v36, 1);

          return;
        }
        v71 = v36;
        v36 = (char *)sub_1000073C0();
        v72 = swift_allocObject(&unk_1000107D0, 32, 7);
        *(_QWORD *)(v72 + 16) = v1;
        *(_QWORD *)(v72 + 24) = v44;
        v96 = (void (*)(char))sub_10000AC24;
        v97 = v72;
        aBlock = _NSConcreteStackBlock;
        v93 = 1107296256;
        v94 = sub_1000090F0;
        v95 = &unk_1000107E8;
        v73 = _Block_copy(&aBlock);
        v74 = v97;
        v75 = v71;
        v76 = v1;
        swift_release(v74);
        objc_msgSend(v36, "startProxCardTransactionWithOptions:completion:", 0, v73);
        _Block_release(v73);

      }
      else
      {
        objc_msgSend(v36, "setModalPresentationCapturesStatusBarAppearance:", 1);
        objc_msgSend(v36, "setModalPresentationStyle:", 5);
        v65 = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController]);
        if (v65)
        {
          v66 = v65;
          v67 = objc_msgSend(v65, "topViewController");

          if (v67)
          {
            objc_msgSend(v67, "presentViewController:animated:completion:", v36, 1, 0);

            return;
          }
        }
      }

      return;
    case 5u:
      v47 = &v1[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController];
      v48 = (void *)swift_unknownObjectWeakLoadStrong(v47);
      if (v48)
      {
        v49 = v48;
        v50 = objc_msgSend(v48, "topViewController");

        if (v50)
        {
          v51 = type metadata accessor for PinEntryViewController();
          v52 = swift_dynamicCastClass(v50, v51);

          if (v52)
          {
            v53 = (void *)swift_unknownObjectWeakLoadStrong(v47);
            if (v53)
            {
              v54 = v53;
              v55 = objc_msgSend(v53, "popViewControllerAnimated:", 1);

            }
          }
        }
      }
      return;
    case 9u:
    case 0xBu:
      sub_100006D48(1);
      return;
    default:
      sub_10000622C((uint64_t)v11);
      return;
  }
}

void sub_100008CFC(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *Strong;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char *v20;
  void **v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;

  v3 = type metadata accessor for PinEntryViewController();
  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3)), "init");
  objc_msgSend(v4, "setNumberOfDigits:", a1);
  v5 = swift_allocObject(&unk_100010820, 24, 7);
  swift_unknownObjectWeakInit(v5 + 16, v1);
  v25 = sub_10000AA30;
  v26 = v5;
  v21 = _NSConcreteStackBlock;
  v22 = 1107296256;
  v23 = sub_100009228;
  v24 = &unk_100010838;
  v6 = _Block_copy(&v21);
  v7 = v26;
  v8 = v4;
  swift_release(v7);
  objc_msgSend(v8, "setTextEntryCompletionHandler:", v6);
  _Block_release(v6);

  v9 = objc_opt_self(PRXCardContentViewController);
  v10 = swift_dynamicCastObjCClass(v8, v9);
  if (v10)
  {
    v11 = v10;
    Strong = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController]);
    if (Strong)
    {
      v13 = Strong;
      objc_msgSend(Strong, "pushViewController:animated:", v8, 1);
    }
    else
    {
      v16 = v8;
      v13 = sub_1000073C0();
      v17 = swift_allocObject(&unk_100010870, 32, 7);
      *(_QWORD *)(v17 + 16) = v1;
      *(_QWORD *)(v17 + 24) = v11;
      v25 = (void (*)(uint64_t, uint64_t))sub_10000AC24;
      v26 = v17;
      v21 = _NSConcreteStackBlock;
      v22 = 1107296256;
      v23 = sub_1000090F0;
      v24 = &unk_100010888;
      v18 = _Block_copy(&v21);
      v19 = v26;
      v8 = v16;
      v20 = v1;
      swift_release(v19);
      objc_msgSend(v13, "startProxCardTransactionWithOptions:completion:", 0, v18);
      _Block_release(v18);

    }
    goto LABEL_8;
  }
  objc_msgSend(v8, "setModalPresentationCapturesStatusBarAppearance:", 1);
  objc_msgSend(v8, "setModalPresentationStyle:", 5);
  v14 = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController]);
  if (v14)
  {
    v15 = v14;
    v13 = objc_msgSend(v14, "topViewController");

    if (v13)
    {
      objc_msgSend(v13, "presentViewController:animated:completion:", v8, 1, 0);
LABEL_8:

      v8 = v13;
    }
  }

}

void sub_100008F78(char a1, uint64_t a2, uint64_t a3)
{
  void *Strong;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  id v12;

  if ((a1 & 1) != 0)
  {
    Strong = (void *)swift_unknownObjectWeakLoadStrong(a2 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_hostViewController);
    if (Strong)
    {
      v6 = Strong;
      v12 = objc_msgSend(Strong, "presentProxCardFlowWithDelegate:initialViewController:", a2, a3);

    }
    else
    {
      v12 = 0;
    }
    swift_unknownObjectWeakAssign(a2 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController, v12);

  }
  else
  {
    if (qword_100015C20 != -1)
      swift_once(&qword_100015C20, sub_10000711C);
    v7 = type metadata accessor for Logger(0);
    sub_100005EB4(v7, (uint64_t)qword_100015ED0);
    v8 = Logger.logObject.getter();
    v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "SFClient prevented HomeCaptiveViewService from displaying prox card", v10, 2u);
      swift_slowDealloc(v10, -1, -1);
    }

    v11 = sub_1000073C0();
    objc_msgSend(v11, "invalidate");

    sub_100006D48(1);
  }
}

uint64_t sub_1000090F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

void sub_10000912C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id v5;
  NSString v6;
  id v7;
  uint64_t Strong;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _BYTE v13[24];

  v4 = a3 + 16;
  v5 = objc_allocWithZone((Class)SKAuthenticationResponseEvent);
  swift_bridgeObjectRetain(a2);
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v7 = objc_msgSend(v5, "initWithPassword:", v6);

  swift_beginAccess(v4, v13, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v4);
  if (Strong)
  {
    v9 = (void *)Strong;
    v10 = *(_QWORD *)(Strong + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_setup);
    swift_retain(v10);

    v11 = *(void **)(v10 + 16);
    if (v11)
    {
      v12 = v11;
      swift_release(v10);
      objc_msgSend(v12, "postEvent:", v7);

    }
    else
    {
      swift_release(v10);
    }
  }

}

uint64_t sub_100009228(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v6 = v5;
  swift_retain(v2);
  v3(v4, v6);
  swift_release(v2);
  return swift_bridgeObjectRelease(v6);
}

id sub_1000092A8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100009364()
{
  return type metadata accessor for SetupCoordinator(0);
}

uint64_t type metadata accessor for SetupCoordinator(uint64_t a1)
{
  return sub_100009428(a1, (uint64_t *)&unk_100015F40, (uint64_t)&nominal type descriptor for SetupCoordinator);
}

uint64_t sub_100009380(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[7];

  v4[0] = "\b";
  v4[1] = &unk_10000C350;
  v4[2] = "\b";
  v4[3] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[4] = (char *)&value witness table for Builtin.NativeObject + 64;
  result = type metadata accessor for SetupFlowState(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(result - 8) + 64;
    v4[6] = &unk_10000C350;
    result = swift_updateClassMetadata2(a1, 256, 7, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for SetupFlowState(uint64_t a1)
{
  return sub_100009428(a1, qword_1000160E8, (uint64_t)&nominal type descriptor for SetupFlowState);
}

uint64_t sub_100009428(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

id sub_100009460()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  if (qword_100015C20 != -1)
    swift_once(&qword_100015C20, sub_10000711C);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_100005EB4(v0, (uint64_t)qword_100015ED0);
  v2 = Logger.logObject.getter(v1);
  v4 = static os_log_type_t.info.getter(v2, v3);
  if (os_log_type_enabled(v2, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = swift_slowAlloc(32, -1);
    v9 = v6;
    *(_DWORD *)v5 = 136315138;
    v8 = sub_10000B218(0xD000000000000018, 0x800000010000C8D0, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v8, &v9, v5 + 4, v5 + 12);
    _os_log_impl((void *)&_mh_execute_header, v2, v4, "%s", v5, 0xCu);
    swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);
  }

  return sub_100006D48(1);
}

void sub_10000966C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  void *Strong;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  char *v17;
  uint64_t v18;
  uint64_t aBlock[5];
  uint64_t v20;

  v1 = v0;
  if (qword_100015C20 != -1)
    swift_once(&qword_100015C20, sub_10000711C);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100005EB4(v2, (uint64_t)qword_100015ED0);
  v4 = Logger.logObject.getter(v3);
  v6 = static os_log_type_t.info.getter(v4, v5);
  if (os_log_type_enabled(v4, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = swift_slowAlloc(32, -1);
    aBlock[0] = v8;
    *(_DWORD *)v7 = 136315138;
    v18 = sub_10000B218(0xD000000000000011, 0x800000010000C860, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, aBlock, v7 + 4, v7 + 12);
    _os_log_impl((void *)&_mh_execute_header, v4, v6, "%s called", v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);
  }

  Strong = (void *)swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController]);
  if (Strong)
  {
    v10 = Strong;
    v11 = objc_msgSend(Strong, "topViewController");

    if (v11)
    {
      v12 = objc_msgSend(v11, "presentedViewController");

      if (v12)
      {
        v13 = swift_allocObject(&unk_100010730, 24, 7);
        *(_QWORD *)(v13 + 16) = v1;
        aBlock[4] = (uint64_t)sub_10000A958;
        v20 = v13;
        aBlock[0] = (uint64_t)_NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_1000070F0;
        aBlock[3] = (uint64_t)&unk_100010748;
        v14 = _Block_copy(aBlock);
        v15 = v20;
        v16 = v12;
        v17 = v1;
        swift_release(v15);
        objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 1, v14);

        _Block_release(v14);
      }
    }
  }
}

uint64_t *sub_100009918(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain(v19);
  }
  else if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    v8 = type metadata accessor for URL(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    v9 = sub_100004480(&qword_100016070);
    v10 = *(int *)(v9 + 48);
    v11 = (uint64_t *)((char *)a1 + v10);
    v12 = (uint64_t *)((char *)a2 + v10);
    v14 = *v12;
    v13 = v12[1];
    *v11 = v14;
    v11[1] = v13;
    v15 = *(int *)(v9 + 64);
    v16 = (uint64_t *)((char *)a1 + v15);
    v17 = (uint64_t *)((char *)a2 + v15);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    swift_bridgeObjectRetain(v13);
    swift_bridgeObjectRetain(v18);
    swift_storeEnumTagMultiPayload(a1, a3, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

uint64_t sub_100009A10(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = swift_getEnumCaseMultiPayload(a1, a2);
  if ((_DWORD)result == 1)
  {
    v4 = type metadata accessor for URL(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
    v5 = sub_100004480(&qword_100016070);
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(v5 + 48) + 8));
    return swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(v5 + 64) + 8));
  }
  return result;
}

char *sub_100009A8C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    v6 = type metadata accessor for URL(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    v7 = sub_100004480(&qword_100016070);
    v8 = *(int *)(v7 + 48);
    v9 = &a1[v8];
    v10 = &a2[v8];
    v12 = *(_QWORD *)v10;
    v11 = *((_QWORD *)v10 + 1);
    *(_QWORD *)v9 = v12;
    *((_QWORD *)v9 + 1) = v11;
    v13 = *(int *)(v7 + 64);
    v14 = &a1[v13];
    v15 = &a2[v13];
    v16 = *((_QWORD *)v15 + 1);
    *(_QWORD *)v14 = *(_QWORD *)v15;
    *((_QWORD *)v14 + 1) = v16;
    swift_bridgeObjectRetain(v11);
    swift_bridgeObjectRetain(v16);
    swift_storeEnumTagMultiPayload(a1, a3, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

char *sub_100009B5C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  if (a1 != a2)
  {
    sub_10000622C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      v6 = type metadata accessor for URL(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      v7 = sub_100004480(&qword_100016070);
      v8 = *(int *)(v7 + 48);
      v9 = &a1[v8];
      v10 = &a2[v8];
      *(_QWORD *)v9 = *(_QWORD *)v10;
      v11 = *((_QWORD *)v10 + 1);
      *((_QWORD *)v9 + 1) = v11;
      v12 = *(int *)(v7 + 64);
      v13 = &a1[v12];
      v14 = &a2[v12];
      *(_QWORD *)v13 = *(_QWORD *)v14;
      v15 = *((_QWORD *)v14 + 1);
      *((_QWORD *)v13 + 1) = v15;
      swift_bridgeObjectRetain(v11);
      swift_bridgeObjectRetain(v15);
      swift_storeEnumTagMultiPayload(a1, a3, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

char *sub_100009C4C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    v6 = type metadata accessor for URL(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    v7 = sub_100004480(&qword_100016070);
    *(_OWORD *)&a1[*(int *)(v7 + 48)] = *(_OWORD *)&a2[*(int *)(v7 + 48)];
    *(_OWORD *)&a1[*(int *)(v7 + 64)] = *(_OWORD *)&a2[*(int *)(v7 + 64)];
    swift_storeEnumTagMultiPayload(a1, a3, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

char *sub_100009CFC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_10000622C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      v6 = type metadata accessor for URL(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      v7 = sub_100004480(&qword_100016070);
      *(_OWORD *)&a1[*(int *)(v7 + 48)] = *(_OWORD *)&a2[*(int *)(v7 + 48)];
      *(_OWORD *)&a1[*(int *)(v7 + 64)] = *(_OWORD *)&a2[*(int *)(v7 + 64)];
      swift_storeEnumTagMultiPayload(a1, a3, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100009DBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_100009DC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_100009DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

uint64_t sub_100009DEC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _BYTE v4[32];
  _QWORD v5[2];

  v5[0] = (char *)&value witness table for Builtin.Int64 + 64;
  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    swift_getTupleTypeLayout3(v4, *(_QWORD *)(result - 8) + 64, &unk_10000C380, &unk_10000C398);
    v5[1] = v4;
    swift_initEnumMetadataMultiPayload(a1, 256, 2, v5);
    return 0;
  }
  return result;
}

id sub_100009E7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  objc_class *ObjectType;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType(v4);
  swift_unknownObjectWeakInit(&v4[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_navigationController], 0);
  v9 = OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_remoteViewController;
  *(_QWORD *)&v4[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_remoteViewController] = 0;
  v10 = &v4[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_hostViewController];
  swift_unknownObjectWeakInit(&v4[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_hostViewController], 0);
  v11 = &v4[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_state];
  v12 = type metadata accessor for SetupFlowState(0);
  swift_storeEnumTagMultiPayload(v11, v12, 2);
  *(_QWORD *)&v4[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator____lazy_storage___sfClient] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_device] = a1;
  v13 = v4;
  swift_retain(a1);
  v14 = sub_100003AD4();
  v15 = type metadata accessor for Setup();
  v16 = swift_allocObject(v15, 33, 7);
  *(_BYTE *)(v16 + 32) = 0;
  *(_QWORD *)(v16 + 16) = 0;
  *(_QWORD *)(v16 + 24) = v14;
  *(_QWORD *)&v13[OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_setup] = v16;
  swift_unknownObjectWeakAssign(v10, a2);
  v17 = *(_QWORD *)&v4[v9];
  *(_QWORD *)&v4[v9] = a3;
  swift_unknownObjectRetain(a3, v18);

  swift_unknownObjectRelease(v17);
  v20.receiver = v13;
  v20.super_class = ObjectType;
  return objc_msgSendSuper2(&v20, "init");
}

void sub_100009FC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;

  v4 = type metadata accessor for URL(0);
  __chkstk_darwin(v4);
  v5 = type metadata accessor for SetupFlowState(0);
  v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  v7 = sub_100004480(&qword_100016120);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_100005ECC(a1, (uint64_t)v10);
  sub_100005ECC(a2, v11);
  v12 = (char *)sub_10000A0F4 + 4 * byte_10000C2EC[swift_getEnumCaseMultiPayload(v10, v5)];
  __asm { BR              X10 }
}

BOOL sub_10000A0F4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _BOOL8 v4;

  sub_100005ECC(v0, (uint64_t)v3);
  if (swift_getEnumCaseMultiPayload(v2, v1))
  {
    sub_1000062E0(v0, &qword_100016120);
    return 0;
  }
  else
  {
    v4 = *v3 == *v2;
    sub_10000622C(v0);
  }
  return v4;
}

void sub_10000A5D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  if (qword_100015C20 != -1)
    swift_once(&qword_100015C20, sub_10000711C);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100005EB4(v4, (uint64_t)qword_100015ED0);
  v6 = Logger.logObject.getter(v5);
  v8 = static os_log_type_t.info.getter(v6, v7);
  if (os_log_type_enabled(v6, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v10 = swift_slowAlloc(32, -1);
    v19 = v10;
    *(_DWORD *)v9 = 136315138;
    v18 = sub_10000B218(0xD000000000000027, 0x800000010000C8A0, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v9 + 4, v9 + 12);
    _os_log_impl((void *)&_mh_execute_header, v6, v8, "%s called", v9, 0xCu);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);
  }

  v12 = Logger.logObject.getter(v11);
  v14 = static os_log_type_t.info.getter(v12, v13);
  if (os_log_type_enabled(v12, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v14, "Posting CaptiveNetworkNavigation event with unkown probe result", v15, 2u);
    swift_slowDealloc(v15, -1, -1);
  }

  v16 = objc_msgSend(objc_allocWithZone((Class)SKEvent), "initWithEventType:", 201);
  v17 = *(void **)(*(_QWORD *)(a1 + OBJC_IVAR____TtC22HomeCaptiveViewService16SetupCoordinator_setup) + 16);
  if (v17)
    objc_msgSend(v17, "postEvent:", v16);
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, 4);

}

void sub_10000A818(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  NSObject *oslog;
  uint64_t v8;
  uint64_t v9;

  if (qword_100015C20 != -1)
    swift_once(&qword_100015C20, sub_10000711C);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100005EB4(v2, (uint64_t)qword_100015ED0);
  oslog = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.info.getter(oslog, v4);
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v6 = 134217984;
    v8 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v8, &v9, v6 + 4, v6 + 12);
    _os_log_impl((void *)&_mh_execute_header, oslog, v5, "WebSheetResult: %ld", v6, 0xCu);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_10000A934()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_10000A958()
{
  return sub_100006D48(1);
}

uint64_t sub_10000A97C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000A98C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000A994(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SetupFlowState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A9D8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_10000AA04(char a1)
{
  uint64_t v1;

  sub_100008F78(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10000AA0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_unknownObjectWeakDestroy(v2 + 16, a2);
  return swift_deallocObject(v2, 24, 7);
}

void sub_10000AA30(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10000912C(a1, a2, v2);
}

void sub_10000AA38(void *a1)
{
  uint64_t v1;

  sub_100007714(a1, v1);
}

id sub_10000AA40()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "dismissViewController:", 0);
}

__CFString *sub_10000AA54(int a1)
{
  __CFString *v1;
  __CFString *v2;

  if (a1 > 109)
  {
    if (a1 <= 199)
    {
      if (a1 > 129)
      {
        if (a1 == 130)
        {
          v1 = CFSTR("AuthenticationResponse");
          goto LABEL_39;
        }
        if (a1 == 140)
        {
          v1 = CFSTR("AuthenticationCompleted");
          goto LABEL_39;
        }
      }
      else
      {
        if (a1 == 110)
        {
          v1 = CFSTR("AuthenticationPresent");
          goto LABEL_39;
        }
        if (a1 == 120)
        {
          v1 = CFSTR("AuthenticationRequest");
          goto LABEL_39;
        }
      }
      goto LABEL_38;
    }
    if (a1 > 201)
    {
      if (a1 == 202)
      {
        v1 = CFSTR("CaptiveNetworkAuthenticated");
        goto LABEL_39;
      }
      if (a1 == 300)
      {
        v1 = CFSTR("BasicConfigUpdated");
        goto LABEL_39;
      }
      goto LABEL_38;
    }
    if (a1 == 200)
      v1 = CFSTR("CaptiveNetworkPresent");
    else
      v1 = CFSTR("CaptiveNetworkNavigation");
  }
  else
  {
    if (a1 <= 39)
    {
      if (a1 > 19)
      {
        if (a1 == 20)
        {
          v1 = CFSTR("Completed");
          goto LABEL_39;
        }
        if (a1 == 30)
        {
          v1 = CFSTR("Invalidated");
          goto LABEL_39;
        }
      }
      else
      {
        if (!a1)
        {
          v1 = CFSTR("Unknown");
          goto LABEL_39;
        }
        if (a1 == 10)
        {
          v1 = CFSTR("Started");
          goto LABEL_39;
        }
      }
LABEL_38:
      v1 = CFSTR("?");
      goto LABEL_39;
    }
    if (a1 > 41)
    {
      if (a1 == 42)
      {
        v1 = CFSTR("Error");
        goto LABEL_39;
      }
      if (a1 == 100)
      {
        v1 = CFSTR("AuthenticationTypeChanged");
        goto LABEL_39;
      }
      goto LABEL_38;
    }
    if (a1 == 40)
      v1 = CFSTR("ConnectionStarted");
    else
      v1 = CFSTR("ConnectionEnded");
  }
LABEL_39:
  v2 = v1;
  return v1;
}

void sub_10000AC28()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = type metadata accessor for Logger(0);
  sub_100006354(v0, qword_100016380);
  sub_100005EB4(v0, (uint64_t)qword_100016380);
  v1 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v2 = objc_msgSend(v1, "bundleIdentifier");

  if (v2)
  {
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
    v5 = v4;

    Logger.init(subsystem:category:)(v3, v5, 0x6C6172656E6567, 0xE700000000000000);
  }
  else
  {
    __break(1u);
  }
}

id sub_10000AD38()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
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

  v3 = type metadata accessor for AppDelegate();
  v4 = static CommandLine.unsafeArgv.getter();
  v5 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  v6 = static CommandLine.argc.getter(v5);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v8 = NSStringFromClass(ObjCClassFromMetadata);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v11 = v10;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0, 0, v9, v11);
  swift_bridgeObjectRelease(v11);
  exit((int)v8);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC22HomeCaptiveViewService11AppDelegate);
}

uint64_t sub_10000AE10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100006354(v0, qword_100016290);
  v1 = sub_100005EB4(v0, (uint64_t)qword_100016290);
  if (qword_100015C28 != -1)
    swift_once(&qword_100015C28, sub_10000AC28);
  v2 = sub_100005EB4(v0, (uint64_t)qword_100016380);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

id sub_10000AEA0()
{
  void *v0;
  void *v1;
  id v2;
  Swift::String v3;
  Swift::String_optional v4;
  Swift::String v5;
  void *object;
  NSString v7;
  id v8;
  Swift::String v9;
  Swift::String_optional v10;
  Swift::String v11;
  void *v12;
  NSString v13;
  objc_super v15;
  Swift::String v16;
  Swift::String v17;

  v15.receiver = v0;
  v15.super_class = (Class)type metadata accessor for PinEntryViewController();
  objc_msgSendSuper2(&v15, "viewDidLoad");
  v1 = (void *)objc_opt_self(NSBundle);
  v2 = objc_msgSend(v1, "mainBundle");
  v16._object = (void *)0xE000000000000000;
  v3._countAndFlagsBits = 0x49544E4548545541;
  v3._object = (void *)0xEE004E4F49544143;
  v4.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v4.value._object = (void *)0xEB00000000656C62;
  v5._countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  v16._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v3, v4, (NSBundle)v2, v5, v16)._object;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v0, "setTitle:", v7);

  v8 = objc_msgSend(v1, "mainBundle");
  v17._object = (void *)0xE000000000000000;
  v9._object = (void *)0x800000010000CD80;
  v9._countAndFlagsBits = 0xD00000000000001CLL;
  v10.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v10.value._object = (void *)0xEB00000000656C62;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  v17._countAndFlagsBits = 0;
  v12 = NSLocalizedString(_:tableName:bundle:value:comment:)(v9, v10, (NSBundle)v8, v11, v17)._object;

  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  objc_msgSend(v0, "setSubtitle:", v13);

  objc_msgSend(v0, "setDismissalType:", 3);
  return objc_msgSend(v0, "setUseMonospacedFont:", 1);
}

id sub_10000B1B8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PinEntryViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PinEntryViewController()
{
  return objc_opt_self(_TtC22HomeCaptiveViewService22PinEntryViewController);
}

uint64_t sub_10000B218(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10000B2E8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100006268((uint64_t)v12, *a3);
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
      sub_100006268((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100006334(v12);
  return v7;
}

uint64_t sub_10000B2E8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000B4A0(a5, a6);
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

uint64_t sub_10000B4A0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000B534(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000B70C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000B70C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000B534(uint64_t a1, unint64_t a2)
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
      v5 = sub_10000B6A8(v4, 0);
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

_QWORD *sub_10000B6A8(uint64_t a1, uint64_t a2)
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
  v4 = sub_100004480(&qword_1000162D8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000B70C(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100004480(&qword_1000162D8);
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

void sub_10000B858()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  NSString v8;
  uint64_t v9;
  uint64_t v10;

  v1 = v0;
  if (qword_100015C30 != -1)
    swift_once(&qword_100015C30, sub_10000AE10);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100005EB4(v2, (uint64_t)qword_100016290);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v10 = v7;
    *(_DWORD *)v6 = 136315138;
    v9 = sub_10000B218(0xD000000000000018, 0x800000010000CB10, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v9, &v10, v6 + 4, v6 + 12);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }

  v8 = String._bridgeToObjectiveC()();
  objc_msgSend(v1, "showActivityIndicatorWithStatus:", v8);

}

uint64_t sub_10000B9F8()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC22HomeCaptiveViewServiceP33_719F72E893261951C0B1DDBAD2EA33AE19ResourceBundleClass);
}
