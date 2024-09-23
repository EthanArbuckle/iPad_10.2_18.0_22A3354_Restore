void sub_100002AC0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void *v11;
  id v12;
  Swift::String v13;
  Swift::String v14;
  void *object;
  id v16;
  Swift::String v17;
  Swift::String v18;
  void *v19;
  NSString v20;
  NSString v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  Swift::String v27;
  Swift::String v28;
  void *v29;
  uint64_t v30;
  NSString v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  Swift::String v38;
  Swift::String v39;
  void *v40;
  uint64_t v41;
  NSString v42;
  void *v43;
  id v44;
  uint64_t v45;
  void **aBlock;
  uint64_t v47;
  void (*v48)(uint64_t, void *);
  void *v49;
  void (*v50)(uint64_t);
  uint64_t v51;
  Swift::String v52;
  Swift::String v53;
  Swift::String v54;
  Swift::String v55;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_viewAlert;
  if (!*(_QWORD *)&v1[OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_viewAlert])
  {
    v7 = (*(uint64_t (**)(char *, char *, uint64_t))(v3 + 16))(v5, &v1[OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_logger], v2);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Pushing uncertified alert to stack...", v10, 2u);
      swift_slowDealloc(v10, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v11 = (void *)objc_opt_self(NSBundle);
    v12 = objc_msgSend(v11, "mainBundle");
    v52._countAndFlagsBits = 0xD000000000000029;
    v13._countAndFlagsBits = 0xD00000000000002ELL;
    v52._object = (void *)0x800000010000FA90;
    v13._object = (void *)0x800000010000FA40;
    v14._object = (void *)0x800000010000FA70;
    v14._countAndFlagsBits = 0xD000000000000015;
    object = NSLocalizedString(_:tableName:bundle:value:comment:)(v13, (Swift::String_optional)0, (NSBundle)v12, v14, v52)._object;

    v16 = objc_msgSend(v11, "mainBundle");
    v17._countAndFlagsBits = 0xD00000000000002CLL;
    v53._countAndFlagsBits = 0xD00000000000005CLL;
    v18._countAndFlagsBits = 0xD00000000000005DLL;
    v53._object = (void *)0x800000010000FB50;
    v17._object = (void *)0x800000010000FAC0;
    v18._object = (void *)0x800000010000FAF0;
    v19 = NSLocalizedString(_:tableName:bundle:value:comment:)(v17, (Swift::String_optional)0, (NSBundle)v16, v18, v53)._object;

    v20 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object);
    v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v19);
    v22 = objc_msgSend((id)objc_opt_self(UIAlertController), "alertControllerWithTitle:message:preferredStyle:", v20, v21, 1);

    v23 = *(void **)&v1[v6];
    *(_QWORD *)&v1[v6] = v22;

    v24 = *(void **)&v1[v6];
    if (v24)
    {
      v25 = v24;
      v26 = objc_msgSend(v11, "mainBundle");
      v27._countAndFlagsBits = 0xD000000000000020;
      v54._countAndFlagsBits = 0xD00000000000003ALL;
      v54._object = (void *)0x800000010000FBE0;
      v27._object = (void *)0x800000010000FBB0;
      v28._countAndFlagsBits = 0x77796E4120646441;
      v28._object = (void *)0xEA00000000007961;
      v29 = NSLocalizedString(_:tableName:bundle:value:comment:)(v27, (Swift::String_optional)0, (NSBundle)v26, v28, v54)._object;

      v30 = swift_allocObject(&unk_100014778, 24, 7);
      swift_unknownObjectWeakInit(v30 + 16, v1);
      swift_retain(v30);
      v31 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v29);
      v50 = sub_1000037E0;
      v51 = v30;
      aBlock = _NSConcreteStackBlock;
      v47 = 1107296256;
      v48 = sub_100005BCC;
      v49 = &unk_100014790;
      v32 = _Block_copy(&aBlock);
      swift_release(v51);
      v33 = (void *)objc_opt_self(UIAlertAction);
      v34 = objc_msgSend(v33, "actionWithTitle:style:handler:", v31, 1, v32);
      _Block_release(v32);
      swift_release(v30);

      objc_msgSend(v25, "addAction:", v34);
      v35 = *(void **)&v1[v6];
      if (v35)
      {
        v36 = v35;
        v37 = objc_msgSend(v11, "mainBundle");
        v38._countAndFlagsBits = 0xD00000000000001DLL;
        v55._countAndFlagsBits = 0xD000000000000038;
        v55._object = (void *)0x800000010000FC60;
        v38._object = (void *)0x800000010000FC40;
        v39._countAndFlagsBits = 0x6C65636E6143;
        v39._object = (void *)0xE600000000000000;
        v40 = NSLocalizedString(_:tableName:bundle:value:comment:)(v38, (Swift::String_optional)0, (NSBundle)v37, v39, v55)._object;

        v41 = swift_allocObject(&unk_100014778, 24, 7);
        swift_unknownObjectWeakInit(v41 + 16, v1);
        swift_retain(v41);
        v42 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v40);
        v50 = sub_100003800;
        v51 = v41;
        aBlock = _NSConcreteStackBlock;
        v47 = 1107296256;
        v48 = sub_100005BCC;
        v49 = &unk_1000147B8;
        v43 = _Block_copy(&aBlock);
        swift_release(v51);
        v44 = objc_msgSend(v33, "actionWithTitle:style:handler:", v42, 0, v43);
        _Block_release(v43);
        swift_release(v41);

        objc_msgSend(v36, "addAction:", v44);
        v45 = *(_QWORD *)&v1[v6];
        if (v45)
        {
          objc_msgSend(v1, "presentViewController:animated:completion:", v45, 1, 0);
          return;
        }
LABEL_11:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_11;
  }
}

void sub_100003080(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t Strong;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  void *v16;
  void **v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BYTE v29[24];
  _QWORD v30[3];
  uint64_t v31;
  _BYTE v32[24];

  sub_100003808(&qword_10001A150);
  __chkstk_darwin();
  v4 = &v29[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = &v29[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = a2 + 16;
  swift_beginAccess(v9, v32, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v9);
  if (Strong)
  {
    v11 = (void *)Strong;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, Strong + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_logger, v5);

    v12 = Logger.logObject.getter();
    v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Add Anyway pressed", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  swift_beginAccess(v9, v29, 0, 0);
  v15 = swift_unknownObjectWeakLoadStrong(v9);
  if (v15)
  {
    v16 = (void *)v15;
    sub_100003848(v15 + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_delegate, (uint64_t)v30);

    if (v31)
    {
      v17 = (void **)sub_1000038D0(v30, v31);
      v18 = *v17;
      v19 = *(void **)((char *)*v17 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_context);
      if (!v19)
      {
        __break(1u);
        return;
      }
      v20 = type metadata accessor for TaskPriority(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v4, 1, 1, v20);
      type metadata accessor for MainActor(0);
      v21 = v19;
      v22 = v18;
      v23 = static MainActor.shared.getter();
      v24 = (_QWORD *)swift_allocObject(&unk_100014818, 48, 7);
      v24[2] = v23;
      v24[3] = &protocol witness table for MainActor;
      v24[4] = v22;
      v24[5] = v21;
      v25 = sub_1000047A8((uint64_t)v4, (uint64_t)&unk_10001A160, (uint64_t)v24);

      swift_release(v25);
      sub_100003938(v30);
    }
    else
    {
      sub_100003890((uint64_t)v30);
    }
  }
  swift_beginAccess(v9, v30, 0, 0);
  v26 = (void *)swift_unknownObjectWeakLoadStrong(v9);
  if (v26)
  {
    v27 = v26;
    objc_msgSend(v26, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

void sub_10000333C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t Strong;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  void *v16;
  void **v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _BYTE v33[24];
  _QWORD v34[3];
  uint64_t v35;
  _BYTE v36[24];

  sub_100003808(&qword_10001A150);
  __chkstk_darwin();
  v4 = &v33[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = &v33[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = a2 + 16;
  swift_beginAccess(v9, v36, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v9);
  if (Strong)
  {
    v11 = (void *)Strong;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, Strong + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_logger, v5);

    v12 = Logger.logObject.getter();
    v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Cancel pressed", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  swift_beginAccess(v9, v33, 0, 0);
  v15 = swift_unknownObjectWeakLoadStrong(v9);
  if (v15)
  {
    v16 = (void *)v15;
    sub_100003848(v15 + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_delegate, (uint64_t)v34);

    if (v35)
    {
      v17 = (void **)sub_1000038D0(v34, v35);
      v18 = *v17;
      v19 = *(void **)((char *)*v17 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_context);
      if (!v19)
      {
        __break(1u);
        return;
      }
      v20 = objc_allocWithZone((Class)type metadata accessor for DockKitCorePairingService(0));
      v21 = v19;
      v22 = objc_msgSend(v20, "init");
      v23 = type metadata accessor for TaskPriority(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v4, 1, 1, v23);
      type metadata accessor for MainActor(0);
      v24 = v21;
      v25 = v18;
      v26 = v22;
      v27 = static MainActor.shared.getter();
      v28 = (_QWORD *)swift_allocObject(&unk_1000147F0, 64, 7);
      v28[2] = v27;
      v28[3] = &protocol witness table for MainActor;
      v28[4] = v25;
      v28[5] = v26;
      v28[6] = v24;
      v28[7] = 0;
      v29 = sub_1000047A8((uint64_t)v4, (uint64_t)&unk_10001A1D0, (uint64_t)v28);

      swift_release(v29);
      sub_100003938(v34);
    }
    else
    {
      sub_100003890((uint64_t)v34);
    }
  }
  swift_beginAccess(v9, v34, 0, 0);
  v30 = (void *)swift_unknownObjectWeakLoadStrong(v9);
  if (v30)
  {
    v31 = v30;
    objc_msgSend(v30, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

id sub_100003664()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DKUncertifiedAlertView(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000036F8()
{
  return type metadata accessor for DKUncertifiedAlertView(0);
}

uint64_t type metadata accessor for DKUncertifiedAlertView(uint64_t a1)
{
  uint64_t result;

  result = qword_10001A000;
  if (!qword_10001A000)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for DKUncertifiedAlertView);
  return result;
}

uint64_t sub_10000373C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = "\b";
    v4[2] = &unk_10000ECF0;
    result = swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1000037BC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000037E0(uint64_t a1)
{
  uint64_t v1;

  sub_100003080(a1, v1);
}

uint64_t sub_1000037E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000037F8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_100003800(uint64_t a1)
{
  uint64_t v1;

  sub_10000333C(a1, v1);
}

uint64_t sub_100003808(uint64_t *a1)
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

uint64_t sub_100003848(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003808((uint64_t *)&unk_10001A070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100003890(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003808((uint64_t *)&unk_10001A070);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_1000038D0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000038F4()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100003938(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100003958()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100003994()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v5;
  _OWORD v6[2];
  _BYTE v7[24];
  uint64_t v8;

  v1 = objc_msgSend(v0, "_remoteViewControllerProxy");
  if (v1)
  {
    v2 = v1;
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_100009370((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    v3 = sub_100003808(&qword_10001A198);
    if (swift_dynamicCast(&v5, v7, (char *)&type metadata for Any + 8, v3, 6))
      return v5;
    else
      return 0;
  }
  else
  {
    sub_100008D60((uint64_t)v7, &qword_10001A168);
    return 0;
  }
}

void sub_100003BC4(char a1, char *a2, void (*a3)(void))
{
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
  char *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  char *v43;
  id v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;

  sub_100003808(&qword_10001A150);
  ((void (*)(void))__chkstk_darwin)();
  v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v56 - v14;
  __chkstk_darwin(v13);
  v17 = (char *)&v56 - v16;
  if ((a1 & 1) != 0)
  {
    v18 = *(void **)&a2[OBJC_IVAR____TtC18DKPairingUIService14ViewController_context];
    if (v18)
    {
      v19 = v18;
      sub_100004EEC(v19);

      v20 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_controller;
      v21 = *(_QWORD *)&a2[OBJC_IVAR____TtC18DKPairingUIService14ViewController_controller];
      swift_retain(v21);
      LOBYTE(v19) = sub_10000AB7C();
      swift_release(v21);
      if ((v19 & 1) != 0)
      {
        v22 = *(_QWORD *)&a2[v20];
        v23 = objc_allocWithZone((Class)type metadata accessor for DKPairingAlertView(0));
        v24 = swift_retain(v22);
        v25 = sub_10000BC38(v24);
        v26 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 16))(v17, &a2[OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger], v8);
        v27 = Logger.logObject.getter(v26);
        v28 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v27, v28))
        {
          v29 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v29 = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "Showing alert...", v29, 2u);
          swift_slowDealloc(v29, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v9 + 8))(v17, v8);
        v30 = *(void **)&a2[OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard];
        if (v30)
        {
          v31 = objc_msgSend(v30, "navigationController");
          if (v31)
          {
            v32 = v31;
            objc_msgSend(v31, "presentViewController:animated:completion:", v25, 1, 0);

          }
        }

      }
      else
      {
        v52 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 16))(v15, &a2[OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger], v8);
        v53 = Logger.logObject.getter(v52);
        v54 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v53, v54))
        {
          v55 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v55 = 0;
          _os_log_impl((void *)&_mh_execute_header, v53, v54, "Bluetooth and Wi-Fi already enabled, continuing with pairing setup.", v55, 2u);
          swift_slowDealloc(v55, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
      }
      return;
    }
    __break(1u);
LABEL_23:
    __break(1u);
    return;
  }
  v33 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 16))(v12, &a2[OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger], v8);
  v34 = Logger.logObject.getter(v33);
  v35 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v36 = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "Unable to proceed with prox card!", v36, 2u);
    swift_slowDealloc(v36, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  v37 = *(void **)&a2[OBJC_IVAR____TtC18DKPairingUIService14ViewController_context];
  if (!v37)
    goto LABEL_23;
  v38 = objc_allocWithZone((Class)type metadata accessor for DockKitCorePairingService(0));
  v39 = v37;
  v40 = objc_msgSend(v38, "init");
  v41 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v7, 1, 1, v41);
  type metadata accessor for MainActor(0);
  v42 = v39;
  v43 = a2;
  v44 = v40;
  v45 = static MainActor.shared.getter();
  v46 = (_QWORD *)swift_allocObject(&unk_100014A60, 64, 7);
  v46[2] = v45;
  v46[3] = &protocol witness table for MainActor;
  v46[4] = v43;
  v46[5] = v44;
  v46[6] = v42;
  v46[7] = 0;
  v47 = sub_1000047A8((uint64_t)v7, (uint64_t)&unk_10001A1D0, (uint64_t)v46);

  swift_release(v47);
  if (a3)
    a3();
  v48 = (void *)sub_100003994();
  if (v48)
  {
    v49 = v48;
    objc_msgSend(v48, "dismiss");
    swift_unknownObjectRelease(v49);
  }
  v50 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_sfClient;
  objc_msgSend(*(id *)&v43[OBJC_IVAR____TtC18DKPairingUIService14ViewController_sfClient], "invalidate");
  v51 = *(void **)&v43[v50];
  *(_QWORD *)&v43[v50] = 0;

}

uint64_t sub_100004090(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

uint64_t sub_100004178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7[22] = a6;
  v7[23] = a7;
  v7[20] = a4;
  v7[21] = a5;
  v8 = type metadata accessor for Logger(0);
  v7[24] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[25] = v9;
  v10 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7[26] = swift_task_alloc(v10);
  v7[27] = swift_task_alloc(v10);
  v11 = type metadata accessor for MainActor(0);
  v7[28] = static MainActor.shared.getter();
  v12 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
  v7[29] = v12;
  v7[30] = v13;
  return swift_task_switch(sub_100004220, v12, v13);
}

id sub_100004220()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void (*v15)(uint64_t, uint64_t);
  id result;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  char *v24;

  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 160);
  v5 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger;
  *(_QWORD *)(v0 + 248) = OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger;
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 256) = v6;
  v7 = v6(v1, v4 + v5, v2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Canceling current pairing session...", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }
  v11 = *(_QWORD *)(v0 + 216);
  v12 = *(_QWORD *)(v0 + 192);
  v13 = *(_QWORD *)(v0 + 200);
  v14 = *(void **)(v0 + 176);

  v15 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  *(_QWORD *)(v0 + 264) = v15;
  v15(v11, v12);
  result = objc_msgSend(v14, "userInfo");
  if (result)
  {
    v17 = result;
    v18 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    *(_QWORD *)(v0 + 120) = 0x6E656B6F74;
    *(_QWORD *)(v0 + 128) = 0xE500000000000000;
    AnyHashable.init<A>(_:)((_QWORD *)(v0 + 16), v0 + 120, &type metadata for String, &protocol witness table for String);
    if (*(_QWORD *)(v18 + 16) && (v19 = sub_100007F84(v0 + 16), (v20 & 1) != 0))
    {
      sub_100008CA4(*(_QWORD *)(v18 + 56) + 32 * v19, v0 + 88);
    }
    else
    {
      *(_OWORD *)(v0 + 88) = 0u;
      *(_OWORD *)(v0 + 104) = 0u;
    }
    result = (id)swift_bridgeObjectRelease(v18);
    if (*(_QWORD *)(v0 + 112))
    {
      sub_100008C48(v0 + 16);
      sub_100008E78((_OWORD *)(v0 + 88), (_OWORD *)(v0 + 56));
      swift_dynamicCast(v0 + 136, v0 + 56, (char *)&type metadata for Any + 8, &type metadata for String, 7);
      v22 = *(_QWORD *)(v0 + 136);
      v21 = *(_QWORD *)(v0 + 144);
      *(_QWORD *)(v0 + 272) = v21;
      v24 = (char *)&async function pointer to dispatch thunk of DockKitCorePairingService.cancelPairAccessory(info:delegate:)
          + async function pointer to dispatch thunk of DockKitCorePairingService.cancelPairAccessory(info:delegate:);
      v23 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of DockKitCorePairingService.cancelPairAccessory(info:delegate:)
                                       + 1));
      *(_QWORD *)(v0 + 280) = v23;
      *v23 = v0;
      v23[1] = sub_10000445C;
      return (id)((uint64_t (*)(uint64_t, uint64_t, _QWORD))v24)(v22, v21, *(_QWORD *)(v0 + 160));
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000445C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 280);
  *(_QWORD *)(*(_QWORD *)v1 + 288) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = v2[29];
    v5 = v2[30];
    v6 = sub_100004554;
  }
  else
  {
    swift_bridgeObjectRelease(v2[34]);
    v4 = v2[29];
    v5 = v2[30];
    v6 = sub_1000044C8;
  }
  return swift_task_switch(v6, v4, v5);
}

uint64_t sub_1000044C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  v1 = swift_release(*(_QWORD *)(v0 + 224));
  v2 = *(_QWORD *)(v0 + 160);
  dispatch thunk of DockKitCorePairingService.disconnect()(v1);
  v3 = *(void **)(v2 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService);
  if (v3)
  {
    v4 = v3;
    dispatch thunk of DockKitCorePairingService.disconnect()(v4);

  }
  v5 = *(void **)(*(_QWORD *)(v0 + 160) + OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService);
  if (v5)
  {
    v6 = v5;
    dispatch thunk of DockKitCorePairingService.disconnect()(v6);

  }
  v7 = *(_QWORD *)(v0 + 208);
  swift_task_dealloc(*(_QWORD *)(v0 + 216));
  swift_task_dealloc(v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004554()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 288);
  v3 = *(_QWORD *)(v0 + 272);
  v5 = *(_QWORD *)(v0 + 248);
  v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 256);
  v6 = *(_QWORD *)(v0 + 208);
  v7 = *(_QWORD *)(v0 + 192);
  swift_release(*(_QWORD *)(v0 + 224));
  swift_bridgeObjectRelease(v3);
  v4(v6, v1 + v5, v7);
  swift_errorRetain(v2);
  v8 = swift_errorRetain(v2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = *(_QWORD *)(v0 + 288);
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v12 = 138412290;
    swift_errorRetain(v11);
    v14 = _swift_stdlib_bridgeErrorToNSError(v11);
    *(_QWORD *)(v0 + 152) = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 152, v0 + 160, v12 + 4, v12 + 12);
    *v13 = v14;
    swift_errorRelease(v11);
    swift_errorRelease(v11);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Failed pairing attempt: %@", v12, 0xCu);
    v15 = sub_100003808(&qword_10001A180);
    swift_arrayDestroy(v13, 1, v15);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 288);
    swift_errorRelease(v16);
    swift_errorRelease(v16);
  }
  v17 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
  v18 = *(_QWORD *)(v0 + 208);
  v20 = *(_QWORD *)(v0 + 184);
  v19 = *(_QWORD *)(v0 + 192);

  v17(v18, v19);
  v21 = *(_QWORD *)(v0 + 288);
  if (v20)
  {
    v22 = *(void **)(v0 + 184);
    swift_errorRetain(*(_QWORD *)(v0 + 288));
    sub_100008E88(v22);
    swift_errorRelease(v21);
  }
  v23 = swift_errorRelease(v21);
  v24 = *(_QWORD *)(v0 + 160);
  dispatch thunk of DockKitCorePairingService.disconnect()(v23);
  v25 = *(void **)(v24 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService);
  if (v25)
  {
    v26 = v25;
    dispatch thunk of DockKitCorePairingService.disconnect()(v26);

  }
  v27 = *(void **)(*(_QWORD *)(v0 + 160) + OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService);
  if (v27)
  {
    v28 = v27;
    dispatch thunk of DockKitCorePairingService.disconnect()(v28);

  }
  v29 = *(_QWORD *)(v0 + 208);
  swift_task_dealloc(*(_QWORD *)(v0 + 216));
  swift_task_dealloc(v29);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000047A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_100008D60(a1, &qword_10001A150);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_1000148D0, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10001A178, v16);
}

uint64_t sub_1000048F4()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  Swift::String v7;
  Swift::String v8;
  Swift::String v9;
  uint64_t countAndFlagsBits;
  void *object;
  id v12;
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  id v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  id v20;
  Swift::String v21;
  Swift::String v22;
  Swift::String v23;
  unint64_t v24;
  char v25;
  unint64_t v27;
  char v28;
  unint64_t v29;
  char v30;
  void *v31;
  void *v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  unint64_t v39;
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  Swift::String v43;
  Swift::String v44;
  Swift::String v45;
  Swift::String v46;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_context);
  if (!v1)
    return 0;
  v2 = objc_msgSend(v1, "userInfo");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v2, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v5 = (void *)objc_opt_self(NSBundle);
  v6 = objc_msgSend(v5, "mainBundle");
  v7._countAndFlagsBits = 0xD000000000000023;
  v43._countAndFlagsBits = 0xD000000000000056;
  v43._object = (void *)0x8000000100010260;
  v7._object = (void *)0x8000000100010210;
  v8._object = (void *)0x8000000100010240;
  v8._countAndFlagsBits = 0xD000000000000011;
  v9 = NSLocalizedString(_:tableName:bundle:value:comment:)(v7, (Swift::String_optional)0, (NSBundle)v6, v8, v43);
  countAndFlagsBits = v9._countAndFlagsBits;
  object = v9._object;

  v12 = objc_msgSend(v5, "mainBundle");
  v13._countAndFlagsBits = 0xD000000000000015;
  v14._countAndFlagsBits = 0xD000000000000027;
  v44._countAndFlagsBits = 0xD000000000000071;
  v44._object = (void *)0x80000001000102F0;
  v14._object = (void *)0x80000001000102C0;
  v13._object = (void *)0x800000010000FA70;
  v15 = NSLocalizedString(_:tableName:bundle:value:comment:)(v14, (Swift::String_optional)0, (NSBundle)v12, v13, v44);

  v16 = objc_msgSend(v5, "mainBundle");
  v17._countAndFlagsBits = 0xD000000000000029;
  v45._countAndFlagsBits = 0xD000000000000039;
  v45._object = (void *)0x80000001000103A0;
  v17._object = (void *)0x8000000100010370;
  v18._countAndFlagsBits = 0x676E696B63617254;
  v18._object = (void *)0xED00006B636F4420;
  v19 = NSLocalizedString(_:tableName:bundle:value:comment:)(v17, (Swift::String_optional)0, (NSBundle)v16, v18, v45);

  v20 = objc_msgSend(v5, "mainBundle");
  v21._countAndFlagsBits = 0xD000000000000019;
  v22._countAndFlagsBits = 0xD00000000000002BLL;
  v46._countAndFlagsBits = 0xD000000000000054;
  v46._object = (void *)0x8000000100010430;
  v22._object = (void *)0x80000001000103E0;
  v21._object = (void *)0x8000000100010410;
  v23 = NSLocalizedString(_:tableName:bundle:value:comment:)(v22, (Swift::String_optional)0, (NSBundle)v20, v21, v46);

  v38 = 0x6569666974726563;
  v39 = 0xE900000000000064;
  AnyHashable.init<A>(_:)(v40, &v38, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v4 + 16) && (v24 = sub_100007F84((uint64_t)v40), (v25 & 1) != 0))
  {
    sub_100008CA4(*(_QWORD *)(v4 + 56) + 32 * v24, (uint64_t)&v41);
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
  }
  sub_100008C48((uint64_t)v40);
  if (!*((_QWORD *)&v42 + 1))
  {
    sub_100008D60((uint64_t)&v41, &qword_10001A168);
    goto LABEL_15;
  }
  if ((swift_dynamicCast(&v38, &v41, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
  {
LABEL_15:
    v28 = 1;
    goto LABEL_16;
  }
  v27 = v39;
  if (v38 == 28494 && v39 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease(0xE200000000000000);
    v28 = 0;
  }
  else
  {
    v37 = ((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))();
    swift_bridgeObjectRelease(v27);
    v28 = v37 ^ 1;
  }
LABEL_16:
  *(_QWORD *)&v41 = 1701869940;
  *((_QWORD *)&v41 + 1) = 0xE400000000000000;
  AnyHashable.init<A>(_:)(v40, &v41, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v4 + 16) && (v29 = sub_100007F84((uint64_t)v40), (v30 & 1) != 0))
  {
    sub_100008CA4(*(_QWORD *)(v4 + 56) + 32 * v29, (uint64_t)&v41);
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
  }
  sub_100008C48((uint64_t)v40);
  if (*((_QWORD *)&v42 + 1))
  {
    if ((swift_dynamicCast(&v38, &v41, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
    {
      countAndFlagsBits = v38;
      v31 = (void *)v39;
      swift_bridgeObjectRelease(v9._object);
      object = v31;
    }
  }
  else
  {
    sub_100008D60((uint64_t)&v41, &qword_10001A168);
  }
  if (countAndFlagsBits == 0x676E696B63617254 && object == (void *)0xED0000646E617453
    || (_stringCompareWithSmolCheck(_:_:expecting:)(countAndFlagsBits, object, 0x676E696B63617254, 0xED0000646E617453, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(object);
    swift_bridgeObjectRelease(v15._object);
    if ((v28 & 1) != 0)
      v32 = v23._object;
    else
      v32 = v19._object;
    if ((v28 & 1) != 0)
      countAndFlagsBits = v19._countAndFlagsBits;
    else
      countAndFlagsBits = v23._countAndFlagsBits;
    if ((v28 & 1) != 0)
      object = v19._object;
    else
      object = v23._object;
  }
  else
  {
    swift_bridgeObjectRelease(v23._object);
    swift_bridgeObjectRelease(v19._object);
    if ((v28 & 1) != 0)
      v32 = v15._object;
    else
      v32 = object;
    if ((v28 & 1) == 0)
    {
      countAndFlagsBits = v15._countAndFlagsBits;
      object = v15._object;
    }
  }
  swift_bridgeObjectRelease(v32);
  v38 = 1701667182;
  v39 = 0xE400000000000000;
  AnyHashable.init<A>(_:)(v40, &v38, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v4 + 16) && (v33 = sub_100007F84((uint64_t)v40), (v34 & 1) != 0))
  {
    sub_100008CA4(*(_QWORD *)(v4 + 56) + 32 * v33, (uint64_t)&v41);
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
  }
  swift_bridgeObjectRelease(v4);
  sub_100008C48((uint64_t)v40);
  if (*((_QWORD *)&v42 + 1))
  {
    if ((swift_dynamicCast(&v38, &v41, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
    {
      v35 = v38;
      v36 = HIBYTE(v39) & 0xF;
      if ((v39 & 0x2000000000000000) == 0)
        v36 = v38 & 0xFFFFFFFFFFFFLL;
      if (v36)
      {
        swift_bridgeObjectRelease(object);
        return v35;
      }
      else
      {
        swift_bridgeObjectRelease(v39);
      }
    }
  }
  else
  {
    sub_100008D60((uint64_t)&v41, &qword_10001A168);
  }
  return countAndFlagsBits;
}

void sub_100004EEC(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  char *v16;
  id v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  Class isa;
  id v28;
  uint64_t v29;
  uint64_t v30;

  sub_100003808(&qword_10001A150);
  __chkstk_darwin();
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(objc_allocWithZone((Class)PRXIconContentViewController), "init");
  objc_msgSend(v5, "setDismissalType:", 3);
  v6 = v5;
  sub_1000048F4();
  v8 = v7;
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  objc_msgSend(v6, "setTitle:", v9);

  v10 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DockKitCorePairingService(0)), "init");
  v11 = *(void **)&v1[OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService];
  *(_QWORD *)&v1[OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService] = v10;

  v12 = *(void **)&v1[OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard];
  *(_QWORD *)&v1[OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard] = v6;
  v13 = v6;

  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v4, 1, 1, v14);
  type metadata accessor for MainActor(0);
  v15 = v13;
  v16 = v1;
  v17 = a1;
  v18 = static MainActor.shared.getter();
  v19 = (_QWORD *)swift_allocObject(&unk_100014970, 56, 7);
  v19[2] = v18;
  v19[3] = &protocol witness table for MainActor;
  v19[4] = v16;
  v19[5] = v17;
  v19[6] = v15;
  v20 = sub_1000047A8((uint64_t)v4, (uint64_t)&unk_10001A190, (uint64_t)v19);
  swift_release(v20);
  sub_10000897C();
  if (v21)
  {
    v22 = v21;
    v23 = sub_100003808(&qword_10001A138);
    v24 = swift_allocObject(v23, 40, 7);
    *(_OWORD *)(v24 + 16) = xmmword_10000ED20;
    *(_QWORD *)(v24 + 32) = v22;
    v30 = v24;
    specialized Array._endMutation()();
    v25 = v30;
    sub_1000093B8(0, &qword_10001A140, UIImage_ptr);
    v26 = v22;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v25);
    objc_msgSend(v15, "setImages:", isa);

  }
  v28 = objc_msgSend(v16, "presentProxCardFlowWithDelegate:initialViewController:", v16, v15);

}

uint64_t sub_100005168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6[21] = a5;
  v6[22] = a6;
  v6[20] = a4;
  v7 = type metadata accessor for Logger(0);
  v6[23] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[24] = v8;
  v6[25] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MainActor(0);
  v6[26] = static MainActor.shared.getter();
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
  v6[27] = v10;
  v6[28] = v11;
  return swift_task_switch(sub_100005200, v10, v11);
}

id sub_100005200()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id result;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;
  Swift::String v13;
  Swift::String v14;
  void *object;
  NSString v16;
  char *v17;
  Swift::String v18;

  v1 = *(void **)(*(_QWORD *)(v0 + 160) + OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService);
  *(_QWORD *)(v0 + 232) = v1;
  if (v1)
  {
    v2 = *(void **)(v0 + 168);
    v1;
    result = objc_msgSend(v2, "userInfo");
    if (result)
    {
      v4 = result;
      v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

      *(_QWORD *)(v0 + 120) = 0x6E656B6F74;
      *(_QWORD *)(v0 + 128) = 0xE500000000000000;
      AnyHashable.init<A>(_:)((_QWORD *)(v0 + 16), v0 + 120, &type metadata for String, &protocol witness table for String);
      if (*(_QWORD *)(v5 + 16) && (v6 = sub_100007F84(v0 + 16), (v7 & 1) != 0))
      {
        sub_100008CA4(*(_QWORD *)(v5 + 56) + 32 * v6, v0 + 88);
      }
      else
      {
        *(_OWORD *)(v0 + 88) = 0u;
        *(_OWORD *)(v0 + 104) = 0u;
      }
      result = (id)swift_bridgeObjectRelease(v5);
      if (*(_QWORD *)(v0 + 112))
      {
        sub_100008C48(v0 + 16);
        sub_100008E78((_OWORD *)(v0 + 88), (_OWORD *)(v0 + 56));
        swift_dynamicCast(v0 + 136, v0 + 56, (char *)&type metadata for Any + 8, &type metadata for String, 7);
        v8 = *(_QWORD *)(v0 + 136);
        v9 = *(_QWORD *)(v0 + 144);
        *(_QWORD *)(v0 + 240) = v9;
        v17 = (char *)&async function pointer to dispatch thunk of DockKitCorePairingService.registerCard(info:delegate:)
            + async function pointer to dispatch thunk of DockKitCorePairingService.registerCard(info:delegate:);
        v10 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of DockKitCorePairingService.registerCard(info:delegate:)
                                         + 1));
        *(_QWORD *)(v0 + 248) = v10;
        *v10 = v0;
        v10[1] = sub_1000054A4;
        return (id)((uint64_t (*)(uint64_t, uint64_t, _QWORD))v17)(v8, v9, *(_QWORD *)(v0 + 160));
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    swift_release(*(_QWORD *)(v0 + 208));
    v11 = *(void **)(v0 + 176);
    v12 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v18._countAndFlagsBits = 0xD000000000000066;
    v18._object = (void *)0x80000001000101A0;
    v13._object = (void *)0x8000000100010160;
    v14._object = (void *)0x8000000100010180;
    v13._countAndFlagsBits = 0xD00000000000001ALL;
    v14._countAndFlagsBits = 0x100000000000001ALL;
    object = NSLocalizedString(_:tableName:bundle:value:comment:)(v13, (Swift::String_optional)0, (NSBundle)v12, v14, v18)._object;

    v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object);
    objc_msgSend(v11, "setBodyText:", v16);

    swift_task_dealloc(*(_QWORD *)(v0 + 200));
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_1000054A4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();
  void *v8;

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 248);
  *(_QWORD *)(*(_QWORD *)v1 + 256) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = (void *)v2[29];
    swift_bridgeObjectRelease(v2[30]);

    v5 = v2[27];
    v6 = v2[28];
    v7 = sub_10000562C;
  }
  else
  {
    v8 = (void *)v2[29];
    swift_bridgeObjectRelease(v2[30]);

    v5 = v2[27];
    v6 = v2[28];
    v7 = sub_100005520;
  }
  return swift_task_switch(v7, v5, v6);
}

uint64_t sub_100005520()
{
  uint64_t v0;
  void *v1;
  id v2;
  Swift::String v3;
  Swift::String v4;
  void *object;
  NSString v6;
  Swift::String v8;

  swift_release(*(_QWORD *)(v0 + 208));
  v1 = *(void **)(v0 + 176);
  v2 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v8._countAndFlagsBits = 0xD000000000000066;
  v8._object = (void *)0x80000001000101A0;
  v3._object = (void *)0x8000000100010160;
  v4._object = (void *)0x8000000100010180;
  v3._countAndFlagsBits = 0xD00000000000001ALL;
  v4._countAndFlagsBits = 0x100000000000001ALL;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v3, (Swift::String_optional)0, (NSBundle)v2, v4, v8)._object;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v1, "setBodyText:", v6);

  swift_task_dealloc(*(_QWORD *)(v0 + 200));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000562C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 184);
  v5 = *(_QWORD *)(v0 + 192);
  swift_release(*(_QWORD *)(v0 + 208));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v1 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger, v4);
  swift_errorRetain(v2);
  v6 = swift_errorRetain(v2);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = *(_QWORD *)(v0 + 256);
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v10 = 138412290;
    swift_errorRetain(v9);
    v12 = _swift_stdlib_bridgeErrorToNSError(v9);
    *(_QWORD *)(v0 + 152) = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 152, v0 + 160, v10 + 4, v10 + 12);
    *v11 = v12;
    swift_errorRelease(v9);
    swift_errorRelease(v9);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Failed pairing attempt: %@", v10, 0xCu);
    v13 = sub_100003808(&qword_10001A180);
    swift_arrayDestroy(v11, 1, v13);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 256);
    swift_errorRelease(v14);
    swift_errorRelease(v14);
  }
  v15 = *(_QWORD *)(v0 + 256);
  v17 = *(_QWORD *)(v0 + 192);
  v16 = *(_QWORD *)(v0 + 200);
  v19 = *(void **)(v0 + 176);
  v18 = *(_QWORD *)(v0 + 184);

  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  swift_errorRetain(v15);
  sub_100008E88(v19);
  swift_errorRelease(v15);
  swift_errorRelease(v15);
  swift_task_dealloc(*(_QWORD *)(v0 + 200));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_100005824(void *a1)
{
  void *v1;
  void *v2;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  Class isa;
  id v15;
  Swift::String v16;
  Swift::String v17;
  void *object;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSString v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  _QWORD aBlock[5];
  uint64_t v29;
  Swift::String v30;

  v2 = v1;
  v4 = objc_msgSend(objc_allocWithZone((Class)PRXIconContentViewController), "init");
  objc_msgSend(v4, "setDismissalType:", 3);
  v5 = v4;
  sub_1000048F4();
  v7 = v6;
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  objc_msgSend(v5, "setTitle:", v8);

  sub_10000897C();
  if (v9)
  {
    v10 = v9;
    v11 = sub_100003808(&qword_10001A138);
    v12 = swift_allocObject(v11, 40, 7);
    *(_OWORD *)(v12 + 16) = xmmword_10000ED20;
    *(_QWORD *)(v12 + 32) = v10;
    aBlock[0] = v12;
    specialized Array._endMutation()();
    sub_1000093B8(0, &qword_10001A140, UIImage_ptr);
    v13 = v10;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(aBlock[0]);
    objc_msgSend(v5, "setImages:", isa);

  }
  v15 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v30._countAndFlagsBits = 0xD00000000000005ELL;
  v30._object = (void *)0x8000000100010100;
  v16._object = (void *)0x80000001000100E0;
  v16._countAndFlagsBits = 0xD00000000000001DLL;
  v17._countAndFlagsBits = 0x7463656E6E6F43;
  v17._object = (void *)0xE700000000000000;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, (Swift::String_optional)0, (NSBundle)v15, v17, v30)._object;

  v19 = swift_allocObject(&unk_100014858, 24, 7);
  swift_unknownObjectWeakInit(v19 + 16, v5);
  v20 = swift_allocObject(&unk_100014920, 32, 7);
  *(_QWORD *)(v20 + 16) = v2;
  *(_QWORD *)(v20 + 24) = v19;
  v21 = v2;
  swift_retain(v19);
  v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  aBlock[4] = sub_1000092AC;
  v29 = v20;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005BCC;
  aBlock[3] = &unk_100014938;
  v23 = _Block_copy(aBlock);
  v24 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v22, 0, v23);

  _Block_release(v23);
  v25 = v29;
  swift_release(v19);
  swift_release(v25);

  if (a1)
  {
    v26 = objc_msgSend(a1, "navigationController");
    if (v26)
    {
      v27 = v26;
      objc_msgSend(v26, "pushViewController:animated:", v5, 1);

    }
  }

}

void sub_100005B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  void *Strong;
  id v6;
  _BYTE v7[24];

  v3 = *(void **)(a2 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_context);
  if (v3)
  {
    v4 = a3 + 16;
    swift_beginAccess(a3 + 16, v7, 0, 0);
    Strong = (void *)swift_unknownObjectWeakLoadStrong(v4);
    v6 = v3;
    sub_100006178(v6, Strong);

  }
  else
  {
    __break(1u);
  }
}

void sub_100005BCC(uint64_t a1, void *a2)
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

uint64_t sub_100005C1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5[20] = a4;
  v5[21] = a5;
  v6 = type metadata accessor for Logger(0);
  v5[22] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[23] = v7;
  v5[24] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MainActor(0);
  v5[25] = static MainActor.shared.getter();
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  v5[26] = v9;
  v5[27] = v10;
  return swift_task_switch(sub_100005CB0, v9, v10);
}

id sub_100005CB0()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id result;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DockKitCorePairingService(0)), "init");
  v3 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService) = v2;

  v5 = *(void **)(v1 + v3);
  *(_QWORD *)(v0 + 224) = v5;
  if (v5)
  {
    v6 = *(void **)(v0 + 168);
    v5;
    result = objc_msgSend(v6, "userInfo");
    if (result)
    {
      v8 = result;
      v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

      *(_QWORD *)(v0 + 120) = 0x6E656B6F74;
      *(_QWORD *)(v0 + 128) = 0xE500000000000000;
      AnyHashable.init<A>(_:)((_QWORD *)(v0 + 16), v0 + 120, &type metadata for String, &protocol witness table for String);
      if (*(_QWORD *)(v9 + 16) && (v10 = sub_100007F84(v0 + 16), (v11 & 1) != 0))
      {
        sub_100008CA4(*(_QWORD *)(v9 + 56) + 32 * v10, v0 + 88);
      }
      else
      {
        *(_OWORD *)(v0 + 88) = 0u;
        *(_OWORD *)(v0 + 104) = 0u;
      }
      result = (id)swift_bridgeObjectRelease(v9);
      if (*(_QWORD *)(v0 + 112))
      {
        sub_100008C48(v0 + 16);
        sub_100008E78((_OWORD *)(v0 + 88), (_OWORD *)(v0 + 56));
        swift_dynamicCast(v0 + 136, v0 + 56, (char *)&type metadata for Any + 8, &type metadata for String, 7);
        v12 = *(_QWORD *)(v0 + 136);
        v13 = *(_QWORD *)(v0 + 144);
        *(_QWORD *)(v0 + 232) = v13;
        v15 = (char *)&async function pointer to dispatch thunk of DockKitCorePairingService.pairAccessory(info:delegate:)
            + async function pointer to dispatch thunk of DockKitCorePairingService.pairAccessory(info:delegate:);
        v14 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of DockKitCorePairingService.pairAccessory(info:delegate:)
                                         + 1));
        *(_QWORD *)(v0 + 240) = v14;
        *v14 = v0;
        v14[1] = sub_100005EB4;
        return (id)((uint64_t (*)(uint64_t, uint64_t, _QWORD))v15)(v12, v13, *(_QWORD *)(v0 + 160));
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    swift_release(*(_QWORD *)(v0 + 200));
    swift_task_dealloc(*(_QWORD *)(v0 + 192));
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_100005EB4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();
  void *v8;

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 240);
  *(_QWORD *)(*(_QWORD *)v1 + 248) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = (void *)v2[28];
    swift_bridgeObjectRelease(v2[29]);

    v5 = v2[26];
    v6 = v2[27];
    v7 = sub_100005F68;
  }
  else
  {
    v8 = (void *)v2[28];
    swift_bridgeObjectRelease(v2[29]);

    v5 = v2[26];
    v6 = v2[27];
    v7 = sub_100005F30;
  }
  return swift_task_switch(v7, v5, v6);
}

uint64_t sub_100005F30()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 200));
  swift_task_dealloc(*(_QWORD *)(v0 + 192));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005F68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 176);
  v5 = *(_QWORD *)(v0 + 184);
  swift_release(*(_QWORD *)(v0 + 200));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v1 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger, v4);
  swift_errorRetain(v2);
  v6 = swift_errorRetain(v2);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = v7;
    v10 = *(_QWORD *)(v0 + 248);
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v11 = 138412290;
    swift_errorRetain(v10);
    v13 = _swift_stdlib_bridgeErrorToNSError(v10);
    *(_QWORD *)(v0 + 152) = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 152, v0 + 160, v11 + 4, v11 + 12);
    *v12 = v13;
    swift_errorRelease(v10);
    v14 = v10;
    v7 = v9;
    swift_errorRelease(v14);
    _os_log_impl((void *)&_mh_execute_header, v9, v8, "Failed pairing attempt: %@", v11, 0xCu);
    v15 = sub_100003808(&qword_10001A180);
    swift_arrayDestroy(v12, 1, v15);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 248);
    swift_errorRelease(v16);
    swift_errorRelease(v16);
  }
  v17 = *(_QWORD *)(v0 + 248);
  v19 = *(_QWORD *)(v0 + 184);
  v18 = *(_QWORD *)(v0 + 192);
  v20 = *(_QWORD *)(v0 + 176);
  v21 = *(_QWORD *)(v0 + 160);

  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  v22 = *(void **)(v21 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard);
  swift_errorRetain(v17);
  v23 = v22;
  sub_100008E88(v22);
  swift_errorRelease(v17);

  swift_errorRelease(v17);
  swift_task_dealloc(*(_QWORD *)(v0 + 192));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_100006178(void *a1, void *a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSString v17;
  id v18;
  Swift::String v19;
  Swift::String v20;
  void *object;
  NSString v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  Class isa;
  id v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  id v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  char v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  _QWORD v69[3];
  uint64_t v70;
  _UNKNOWN **v71;
  __int128 v72;
  __int128 v73;
  Swift::String v74;

  v3 = v2;
  v6 = sub_100003808(&qword_10001A150);
  __chkstk_darwin(v6);
  v8 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Logger(0);
  v10 = *(_QWORD *)(v9 - 8);
  v65 = v9;
  v66 = v10;
  __chkstk_darwin(v9);
  v12 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend(objc_allocWithZone((Class)PRXIconContentViewController), "init");
  objc_msgSend(v13, "setDismissalType:", 3);
  v14 = v13;
  sub_1000048F4();
  v16 = v15;
  v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v16);
  objc_msgSend(v14, "setTitle:", v17);

  v18 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v74._countAndFlagsBits = 0xD000000000000048;
  v74._object = (void *)0x800000010000FFD0;
  v19._object = (void *)0x800000010000FFB0;
  v19._countAndFlagsBits = 0xD00000000000001CLL;
  v20._countAndFlagsBits = 0x697463656E6E6F43;
  v20._object = (void *)0xAD0000A680E2676ELL;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v19, (Swift::String_optional)0, (NSBundle)v18, v20, v74)._object;

  v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v14, "setBodyText:", v22);

  v23 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard;
  v24 = *(void **)&v3[OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard];
  *(_QWORD *)&v3[OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard] = v14;
  v25 = v14;

  sub_10000897C();
  if (v26)
  {
    v27 = v26;
    v28 = sub_100003808(&qword_10001A138);
    v29 = swift_allocObject(v28, 40, 7);
    *(_OWORD *)(v29 + 16) = xmmword_10000ED20;
    *(_QWORD *)(v29 + 32) = v27;
    v69[0] = v29;
    specialized Array._endMutation()();
    v30 = v69[0];
    sub_1000093B8(0, &qword_10001A140, UIImage_ptr);
    v31 = v27;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v30);
    objc_msgSend(v25, "setImages:", isa);

  }
  if (a2)
  {
    v33 = objc_msgSend(a2, "navigationController");
    if (v33)
    {
      v34 = v33;
      objc_msgSend(v33, "pushViewController:animated:", v25, 1);

    }
  }
  v35 = objc_msgSend(a1, "userInfo");
  if (!v35)
    goto LABEL_17;
  v36 = v35;
  v37 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v35, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v67 = 0x6569666974726563;
  v68 = 0xE900000000000064;
  AnyHashable.init<A>(_:)(v69, &v67, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v37 + 16) && (v38 = sub_100007F84((uint64_t)v69), (v39 & 1) != 0))
  {
    sub_100008CA4(*(_QWORD *)(v37 + 56) + 32 * v38, (uint64_t)&v72);
  }
  else
  {
    v72 = 0u;
    v73 = 0u;
  }
  swift_bridgeObjectRelease(v37);
  sub_100008C48((uint64_t)v69);
  if (!*((_QWORD *)&v73 + 1))
  {
    sub_100008D60((uint64_t)&v72, &qword_10001A168);
    goto LABEL_17;
  }
  if ((swift_dynamicCast(&v67, &v72, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
  {
LABEL_17:
    v41 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v8, 1, 1, v41);
    type metadata accessor for MainActor(0);
    v42 = v3;
    v43 = a1;
    v44 = static MainActor.shared.getter();
    v45 = (_QWORD *)swift_allocObject(&unk_1000148A8, 48, 7);
    v45[2] = v44;
    v45[3] = &protocol witness table for MainActor;
    v45[4] = v42;
    v45[5] = v43;
    v46 = sub_1000047A8((uint64_t)v8, (uint64_t)&unk_10001A160, (uint64_t)v45);

    swift_release(v46);
    return;
  }
  v40 = v68;
  if (v67 != 28494 || v68 != 0xE200000000000000)
  {
    v47 = _stringCompareWithSmolCheck(_:_:expecting:)(v67, v68, 28494, 0xE200000000000000, 0);
    swift_bridgeObjectRelease(v40);
    if ((v47 & 1) != 0)
      goto LABEL_20;
    goto LABEL_17;
  }
  swift_bridgeObjectRelease(0xE200000000000000);
LABEL_20:
  v70 = type metadata accessor for ViewController(0);
  v71 = &off_100014830;
  v69[0] = v3;
  v48 = objc_allocWithZone((Class)type metadata accessor for DKUncertifiedAlertView(0));
  v49 = sub_100008C7C((uint64_t)v69, v70);
  __chkstk_darwin(v49);
  v51 = (uint64_t *)((char *)&v64 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v52 + 16))(v51);
  v53 = *v51;
  v54 = v3;
  v55 = sub_100008738(v53, v48);
  sub_100003938(v69);
  v56 = v65;
  v57 = (*(uint64_t (**)(char *, char *, uint64_t))(v66 + 16))(v12, &v54[OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger], v65);
  v58 = Logger.logObject.getter(v57);
  v59 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v58, v59))
  {
    v60 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v60 = 0;
    _os_log_impl((void *)&_mh_execute_header, v58, v59, "Showing alert...", v60, 2u);
    swift_slowDealloc(v60, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v66 + 8))(v12, v56);
  v61 = *(void **)&v3[v23];
  if (v61)
  {
    v62 = objc_msgSend(v61, "navigationController");
    if (v62)
    {
      v63 = v62;
      objc_msgSend(v62, "presentViewController:animated:completion:", v55, 1, 0);

    }
  }

}

void sub_1000067C8(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  id v6;
  Swift::String v7;
  Swift::String v8;
  void *object;
  NSString v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  Class isa;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  Swift::String v21;

  v2 = objc_msgSend(objc_allocWithZone((Class)PRXIconContentViewController), "init");
  objc_msgSend(v2, "setDismissalType:", 2);
  v19 = v2;
  sub_1000048F4();
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  objc_msgSend(v19, "setTitle:", v5);

  v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v7._countAndFlagsBits = 0xD000000000000046;
  v21._countAndFlagsBits = 0xD000000000000061;
  v21._object = (void *)0x800000010000FF40;
  v8._object = (void *)0x800000010000FED0;
  v7._object = (void *)0x800000010000FEF0;
  v8._countAndFlagsBits = 0xD00000000000001DLL;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v8, (Swift::String_optional)0, (NSBundle)v6, v7, v21)._object;

  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v19, "setBodyText:", v10);

  sub_10000897C();
  if (v11)
  {
    v12 = v11;
    v13 = sub_100003808(&qword_10001A138);
    v14 = swift_allocObject(v13, 40, 7);
    *(_OWORD *)(v14 + 16) = xmmword_10000ED20;
    *(_QWORD *)(v14 + 32) = v12;
    v20 = v14;
    specialized Array._endMutation()();
    sub_1000093B8(0, &qword_10001A140, UIImage_ptr);
    v15 = v12;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v20);
    objc_msgSend(v19, "setImages:", isa);

  }
  if (a1)
  {
    v17 = objc_msgSend(a1, "navigationController");
    if (v17)
    {
      v18 = v17;
      objc_msgSend(v17, "pushViewController:animated:", v19, 1);

    }
  }

}

void sub_1000069F8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  Class isa;
  id v15;
  Swift::String v16;
  Swift::String v17;
  void *object;
  uint64_t v19;
  NSString v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  _QWORD aBlock[5];
  uint64_t v31;
  Swift::String v32;

  v2 = v1;
  v4 = objc_msgSend(objc_allocWithZone((Class)PRXIconContentViewController), "init");
  objc_msgSend(v4, "setDismissalType:", 3);
  v5 = v4;
  sub_1000048F4();
  v7 = v6;
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  objc_msgSend(v5, "setTitle:", v8);

  sub_10000897C();
  if (v9)
  {
    v10 = v9;
    v11 = sub_100003808(&qword_10001A138);
    v12 = swift_allocObject(v11, 40, 7);
    *(_OWORD *)(v12 + 16) = xmmword_10000ED20;
    *(_QWORD *)(v12 + 32) = v10;
    aBlock[0] = v12;
    specialized Array._endMutation()();
    sub_1000093B8(0, &qword_10001A140, UIImage_ptr);
    v13 = v10;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(aBlock[0]);
    objc_msgSend(v5, "setImages:", isa);

  }
  v15 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v32._countAndFlagsBits = 0xD00000000000004ELL;
  v32._object = (void *)0x800000010000FE30;
  v16._object = (void *)0x800000010000FE10;
  v16._countAndFlagsBits = 0xD000000000000016;
  v17._countAndFlagsBits = 1701736260;
  v17._object = (void *)0xE400000000000000;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, (Swift::String_optional)0, (NSBundle)v15, v17, v32)._object;

  v19 = swift_allocObject(&unk_100014858, 24, 7);
  swift_unknownObjectWeakInit(v19 + 16, v5);
  swift_retain(v19);
  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  aBlock[4] = sub_100008B6C;
  v31 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005BCC;
  aBlock[3] = &unk_100014870;
  v21 = _Block_copy(aBlock);
  v22 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v20, 0, v21);

  _Block_release(v21);
  v23 = v31;
  swift_release(v19);
  swift_release(v23);
  v24 = *(void **)(v2 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService);
  if (v24)
  {
    v25 = v24;
    dispatch thunk of DockKitCorePairingService.disconnect()(v25);

  }
  v26 = *(void **)(v2 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService);
  if (v26)
  {
    v27 = v26;
    dispatch thunk of DockKitCorePairingService.disconnect()(v27);

  }
  if (a1)
  {
    v28 = objc_msgSend(a1, "navigationController");
    if (v28)
    {
      v29 = v28;
      objc_msgSend(v28, "pushViewController:animated:", v5, 1);

    }
  }

}

void sub_100006D3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *Strong;
  void *v4;
  _BYTE v5[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v5, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = Strong;
    objc_msgSend(Strong, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

void sub_100006D9C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int64_t v27;
  _QWORD *v28;
  NSDictionary v29;
  unint64_t v30;
  unint64_t v31;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  void *v35;
  _QWORD *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  _QWORD *v44;
  uint64_t v45;
  char v46;
  unint64_t v47;
  uint64_t v48;
  _BOOL8 v49;
  uint64_t v50;
  char v51;
  unint64_t v52;
  char v53;
  unint64_t v54;
  char v55;
  char v56;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  Swift::String v77;
  Swift::String v78;
  void *object;
  NSString v80;
  uint64_t v81;
  void *v82;
  id v83;
  uint64_t v84;
  NSObject *v85;
  os_log_type_t v86;
  uint8_t *v87;
  id v88;
  NSObject *v89;
  os_log_type_t v90;
  char *v91;
  uint64_t v92;
  uint8_t *v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  void *v99;
  id v100;
  char *v101;
  char *v102;
  void *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  int64_t v111;
  uint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  _OWORD v115[2];
  __int128 v116;
  void *v117;
  uint64_t v118[6];
  Swift::String v119;

  v109 = a3;
  v7 = type metadata accessor for Logger(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v101 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v108 = (char *)&v101 - v13;
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v101 - v15;
  v17 = __chkstk_darwin(v14);
  v19 = (char *)&v101 - v18;
  __chkstk_darwin(v17);
  v107 = (char *)&v101 - v20;
  v112 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_context;
  v113 = a1;
  v21 = *(void **)(a1 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_context);
  if (v21)
  {
    v22 = objc_msgSend(v21, "userInfo");
    if (v22)
    {
      v101 = v19;
      v102 = v11;
      v103 = a4;
      v104 = v16;
      v105 = v8;
      v106 = v7;

      v23 = *(_QWORD *)(a2 + 64);
      v110 = a2 + 64;
      v24 = 1 << *(_BYTE *)(a2 + 32);
      v25 = -1;
      if (v24 < 64)
        v25 = ~(-1 << v24);
      v26 = v25 & v23;
      v111 = (unint64_t)(v24 + 63) >> 6;
      swift_bridgeObjectRetain(a2);
      v27 = 0;
      while (1)
      {
        if (v26)
        {
          v30 = __clz(__rbit64(v26));
          v26 &= v26 - 1;
          v31 = v30 | (v27 << 6);
        }
        else
        {
          v32 = v27 + 1;
          if (__OFADD__(v27, 1))
            goto LABEL_72;
          if (v32 >= v111)
          {
LABEL_47:
            swift_release(a2);
            v7 = v106;
            v8 = v105;
            v16 = v104;
            a4 = v103;
            v11 = v102;
            v19 = v101;
            goto LABEL_48;
          }
          v33 = *(_QWORD *)(v110 + 8 * v32);
          ++v27;
          if (!v33)
          {
            v27 = v32 + 1;
            if (v32 + 1 >= v111)
              goto LABEL_47;
            v33 = *(_QWORD *)(v110 + 8 * v27);
            if (!v33)
            {
              v27 = v32 + 2;
              if (v32 + 2 >= v111)
                goto LABEL_47;
              v33 = *(_QWORD *)(v110 + 8 * v27);
              if (!v33)
              {
                v34 = v32 + 3;
                if (v34 >= v111)
                  goto LABEL_47;
                v33 = *(_QWORD *)(v110 + 8 * v34);
                if (!v33)
                {
                  while (1)
                  {
                    v27 = v34 + 1;
                    if (__OFADD__(v34, 1))
                      break;
                    if (v27 >= v111)
                      goto LABEL_47;
                    v33 = *(_QWORD *)(v110 + 8 * v27);
                    ++v34;
                    if (v33)
                      goto LABEL_25;
                  }
LABEL_74:
                  __break(1u);
LABEL_75:
                  __break(1u);
LABEL_76:
                  __break(1u);
LABEL_77:
                  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for AnyHashable);
                  __break(1u);
                  JUMPOUT(0x1000078DCLL);
                }
                v27 = v34;
              }
            }
          }
LABEL_25:
          v26 = (v33 - 1) & v33;
          v31 = __clz(__rbit64(v33)) + (v27 << 6);
        }
        v35 = *(void **)(v113 + v112);
        if (!v35)
          goto LABEL_75;
        v36 = (_QWORD *)(*(_QWORD *)(a2 + 48) + 16 * v31);
        v37 = (uint64_t *)(*(_QWORD *)(a2 + 56) + 16 * v31);
        v39 = *v37;
        v38 = v37[1];
        v40 = v36[1];
        *(_QWORD *)&v116 = *v36;
        *((_QWORD *)&v116 + 1) = v40;
        swift_bridgeObjectRetain_n(v40, 2);
        swift_bridgeObjectRetain(v38);
        v41 = v35;
        AnyHashable.init<A>(_:)(v118, &v116, &type metadata for String, &protocol witness table for String);
        v117 = &type metadata for String;
        *(_QWORD *)&v116 = v39;
        *((_QWORD *)&v116 + 1) = v38;
        v42 = objc_msgSend(v41, "userInfo");
        if (!v42)
          goto LABEL_76;
        v43 = v42;
        v44 = (_QWORD *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v42, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
        swift_bridgeObjectRelease(v40);

        if (v117)
          break;
        sub_100008D60((uint64_t)&v116, &qword_10001A168);
        swift_bridgeObjectRetain(v44);
        v54 = sub_100007F84((uint64_t)v118);
        v56 = v55;
        swift_bridgeObjectRelease(v44);
        if ((v56 & 1) != 0)
        {
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v44);
          v114 = v44;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_100008554();
            v44 = v114;
          }
          sub_100008C48(v44[6] + 40 * v54);
          sub_100008E78((_OWORD *)(v44[7] + 32 * v54), v115);
          sub_10000838C(v54, (uint64_t)v44);
          swift_bridgeObjectRelease(0x8000000000000000);
        }
        else
        {
          memset(v115, 0, sizeof(v115));
        }
        sub_100008C48((uint64_t)v118);
        sub_100008D60((uint64_t)v115, &qword_10001A168);
        if (v44)
          goto LABEL_8;
        v29.super.isa = 0;
LABEL_9:
        objc_msgSend(v41, "setUserInfo:", v29.super.isa);

      }
      sub_100008E78(&v116, v115);
      v45 = swift_isUniquelyReferenced_nonNull_native(v44);
      v114 = v44;
      v47 = sub_100007F84((uint64_t)v118);
      v48 = v44[2];
      v49 = (v46 & 1) == 0;
      v50 = v48 + v49;
      if (__OFADD__(v48, v49))
      {
        __break(1u);
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
        goto LABEL_74;
      }
      v51 = v46;
      if (v44[3] < v50)
      {
        sub_100008078(v50, v45);
        v52 = sub_100007F84((uint64_t)v118);
        if ((v51 & 1) != (v53 & 1))
          goto LABEL_77;
        v47 = v52;
        v44 = v114;
        if ((v51 & 1) == 0)
          goto LABEL_40;
LABEL_6:
        v28 = (_QWORD *)(v44[7] + 32 * v47);
        sub_100003938(v28);
        sub_100008E78(v115, v28);
LABEL_7:
        swift_bridgeObjectRelease(0x8000000000000000);
        sub_100008C48((uint64_t)v118);
LABEL_8:
        v29.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v44);
        goto LABEL_9;
      }
      if ((v45 & 1) != 0)
      {
        v44 = v114;
        if ((v46 & 1) != 0)
          goto LABEL_6;
      }
      else
      {
        sub_100008554();
        v44 = v114;
        if ((v51 & 1) != 0)
          goto LABEL_6;
      }
LABEL_40:
      v44[(v47 >> 6) + 8] |= 1 << v47;
      sub_100008D24((uint64_t)v118, v44[6] + 40 * v47);
      sub_100008E78(v115, (_OWORD *)(v44[7] + 32 * v47));
      v58 = v44[2];
      v59 = __OFADD__(v58, 1);
      v60 = v58 + 1;
      if (v59)
        goto LABEL_73;
      v44[2] = v60;
      goto LABEL_7;
    }
  }
LABEL_48:
  switch(v109)
  {
    case 0:
      v11 = v107;
      v61 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16))(v107, v113 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger, v7);
      v62 = Logger.logObject.getter(v61);
      v63 = static os_log_type_t.default.getter();
      if (!os_log_type_enabled(v62, v63))
        goto LABEL_56;
      v64 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v64 = 0;
      v65 = "Ignoring started state";
      break;
    case 1:
      v81 = v113;
      v82 = *(void **)(v113 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard);
      v83 = v82;
      sub_100005824(v82);

      v84 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16))(v19, v81 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger, v7);
      v85 = Logger.logObject.getter(v84);
      v86 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v85, v86))
      {
        v87 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v87 = 0;
        _os_log_impl((void *)&_mh_execute_header, v85, v86, "Validating accessory", v87, 2u);
        swift_slowDealloc(v87, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v8 + 8))(v19, v7);
      return;
    case 2:
      v11 = v108;
      v66 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16))(v108, v113 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger, v7);
      v62 = Logger.logObject.getter(v66);
      v63 = static os_log_type_t.default.getter();
      if (!os_log_type_enabled(v62, v63))
        goto LABEL_56;
      v64 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v64 = 0;
      v65 = "Ignoring in progress state";
      break;
    case 3:
      v67 = v113;
      v68 = *(void **)(v113 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard);
      v69 = v68;
      sub_1000067C8(v68);

      v70 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v67 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger, v7);
      v62 = Logger.logObject.getter(v70);
      v63 = static os_log_type_t.default.getter();
      if (!os_log_type_enabled(v62, v63))
        goto LABEL_56;
      v64 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v64 = 0;
      v65 = "Moved from Pairing -> One-time setup";
      break;
    case 4:
      v71 = *(void **)(v113 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard);
      v72 = v71;
      sub_1000069F8(v71);

      return;
    case 5:
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v16, v113 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger, v7);
      v88 = a4;
      v89 = Logger.logObject.getter(v88);
      v90 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v89, v90))
      {
        v91 = v16;
        v92 = v8;
        v106 = v7;
        v93 = (uint8_t *)swift_slowAlloc(12, -1);
        v94 = swift_slowAlloc(32, -1);
        v118[0] = v94;
        *(_DWORD *)v93 = 136315138;
        if (a4)
        {
          v95 = objc_msgSend(v88, "localizedDescription");
          v96 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v98 = v97;

        }
        else
        {
          v96 = 0x206E776F6E6B6E55;
          v98 = 0xED0000726F727245;
        }
        *(_QWORD *)&v116 = sub_10000B438(v96, v98, v118);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v116, (char *)&v116 + 8, v93 + 4, v93 + 12);

        swift_bridgeObjectRelease(v98);
        _os_log_impl((void *)&_mh_execute_header, v89, v90, "Pairing Failed: %s", v93, 0xCu);
        swift_arrayDestroy(v94, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v94, -1, -1);
        swift_slowDealloc(v93, -1, -1);

        (*(void (**)(char *, uint64_t))(v92 + 8))(v91, v106);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v8 + 8))(v16, v7);
      }
      v99 = *(void **)(v113 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard);
      v100 = v99;
      sub_100008E88(v99);

      return;
    default:
      v73 = *(void **)(v113 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard);
      if (v73)
      {
        v74 = (void *)objc_opt_self(NSBundle);
        v75 = v73;
        v76 = objc_msgSend(v74, "mainBundle");
        v119._countAndFlagsBits = 0xD000000000000046;
        v119._object = (void *)0x80000001000104B0;
        v77._object = (void *)0x8000000100010490;
        v77._countAndFlagsBits = 0xD00000000000001FLL;
        v78._countAndFlagsBits = 0x206E776F6E6B6E55;
        v78._object = (void *)0xED0000726F727245;
        object = NSLocalizedString(_:tableName:bundle:value:comment:)(v77, (Swift::String_optional)0, (NSBundle)v76, v78, v119)._object;

        v80 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(object);
        objc_msgSend(v75, "setBodyText:", v80);

      }
      return;
  }
  _os_log_impl((void *)&_mh_execute_header, v62, v63, v65, v64, 2u);
  swift_slowDealloc(v64, -1, -1);
LABEL_56:

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

id sub_100007978(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString v10;
  id v11;
  objc_super v13;

  v6 = v3;
  Logger.init(subsystem:category:)(0xD00000000000001CLL, 0x800000010000FCF0, 0x6976726553204955, 0xEA00000000006563);
  *(_QWORD *)&v6[OBJC_IVAR____TtC18DKPairingUIService14ViewController_context] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard] = 0;
  v7 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_controller;
  sub_1000093B8(0, &qword_10001A1A0, OS_dispatch_queue_ptr);
  v8 = (void *)static OS_dispatch_queue.main.getter();
  v9 = type metadata accessor for DKPairingRadioController();
  swift_allocObject(v9, 96, 7);
  *(_QWORD *)&v6[v7] = sub_100009A8C(v8);
  *(_QWORD *)&v6[OBJC_IVAR____TtC18DKPairingUIService14ViewController_sfClient] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService] = 0;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for ViewController(0);
  v11 = objc_msgSendSuper2(&v13, "initWithNibName:bundle:", v10, a3);

  return v11;
}

id sub_100007B48(void *a1)
{
  void *v1;
  char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v3 = v1;
  Logger.init(subsystem:category:)(0xD00000000000001CLL, 0x800000010000FCF0, 0x6976726553204955, 0xEA00000000006563);
  *(_QWORD *)&v3[OBJC_IVAR____TtC18DKPairingUIService14ViewController_context] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18DKPairingUIService14ViewController_pairingCard] = 0;
  v4 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_controller;
  sub_1000093B8(0, &qword_10001A1A0, OS_dispatch_queue_ptr);
  v5 = (void *)static OS_dispatch_queue.main.getter();
  v6 = type metadata accessor for DKPairingRadioController();
  swift_allocObject(v6, 96, 7);
  *(_QWORD *)&v3[v4] = sub_100009A8C(v5);
  *(_QWORD *)&v3[OBJC_IVAR____TtC18DKPairingUIService14ViewController_sfClient] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService] = 0;

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for ViewController(0);
  v7 = objc_msgSendSuper2(&v9, "initWithCoder:", a1);

  return v7;
}

id sub_100007CA4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100007D78()
{
  return type metadata accessor for ViewController(0);
}

uint64_t type metadata accessor for ViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_10001A0C8;
  if (!qword_10001A0C8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ViewController);
  return result;
}

uint64_t sub_100007DBC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[7];

  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = "\b";
    v4[2] = "\b";
    v4[3] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[4] = "\b";
    v4[5] = "\b";
    v4[6] = "\b";
    result = swift_updateClassMetadata2(a1, 256, 7, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

void sub_100007E48()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = (void *)sub_100003994();
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "deactivate");
    swift_unknownObjectRelease(v2);
  }
  v3 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_sfClient;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_sfClient), "invalidate");
  v4 = *(void **)(v0 + v3);
  *(_QWORD *)(v0 + v3) = 0;

}

uint64_t sub_100007ED4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100007F38;
  return v6(a1);
}

uint64_t sub_100007F38()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_100007F84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100007FB4(a1, v4);
}

unint64_t sub_100007FB4(uint64_t a1, uint64_t a2)
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
      sub_100008D24(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100008C48((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100008078(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _OWORD v38[2];
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100003808(&qword_10001A1C0);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_44;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  result = swift_retain(v5);
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v15 << 6);
      goto LABEL_25;
    }
    v22 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      return result;
    }
    if (v22 >= v12)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v15;
    if (!v24)
    {
      v15 = v22 + 1;
      if (v22 + 1 >= v12)
        goto LABEL_37;
      v24 = *(_QWORD *)(v37 + 8 * v15);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v12)
        {
LABEL_37:
          swift_release(v5);
          if ((a2 & 1) == 0)
            goto LABEL_44;
          goto LABEL_40;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v15 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_46;
            if (v15 >= v12)
              goto LABEL_37;
            v24 = *(_QWORD *)(v37 + 8 * v15);
            ++v25;
            if (v24)
              goto LABEL_24;
          }
        }
        v15 = v25;
      }
    }
LABEL_24:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v15 << 6);
LABEL_25:
    v26 = *(_QWORD *)(v5 + 48) + 40 * v21;
    if ((a2 & 1) != 0)
    {
      v27 = *(_OWORD *)v26;
      v28 = *(_OWORD *)(v26 + 16);
      v41 = *(_QWORD *)(v26 + 32);
      v39 = v27;
      v40 = v28;
      sub_100008E78((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v21), v38);
    }
    else
    {
      sub_100008D24(v26, (uint64_t)&v39);
      sub_100008CA4(*(_QWORD *)(v5 + 56) + 32 * v21, (uint64_t)v38);
    }
    result = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v8 + 40));
    v29 = -1 << *(_BYTE *)(v8 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v13 + 8 * (v30 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v13 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v13 + 8 * v31);
      }
      while (v35 == -1);
      v16 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    v17 = *(_QWORD *)(v8 + 48) + 40 * v16;
    v18 = v39;
    v19 = v40;
    *(_QWORD *)(v17 + 32) = v41;
    *(_OWORD *)v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
    result = (uint64_t)sub_100008E78(v38, (_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v16));
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_44;
LABEL_40:
  v36 = 1 << *(_BYTE *)(v5 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_44:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

unint64_t sub_10000838C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  Swift::Int v10;
  Swift::Int v11;
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _BYTE v28[40];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_100008D24(*(_QWORD *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        v10 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
        result = sub_100008C48((uint64_t)v28);
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= v11)
          {
LABEL_16:
            v14 = *(_QWORD *)(a2 + 48);
            v15 = v14 + 40 * v3;
            v16 = (__int128 *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              v17 = *v16;
              v18 = v16[1];
              *(_QWORD *)(v15 + 32) = *((_QWORD *)v16 + 4);
              *(_OWORD *)v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            v19 = *(_QWORD *)(a2 + 56);
            v20 = (_OWORD *)(v19 + 32 * v3);
            v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (v3 = v6, v20 >= v21 + 2))
            {
              v9 = v21[1];
              *v20 = *v21;
              v20[1] = v9;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v23 = *v22;
    v24 = (-1 << v3) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_100008554()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  sub_100003808(&qword_10001A1C0);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    sub_100008D24(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_100008CA4(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_100008E78(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_100008738(uint64_t a1, void *a2)
{
  char *v4;
  id v5;
  objc_super v7;
  _QWORD v8[5];

  v8[3] = type metadata accessor for ViewController(0);
  v8[4] = &off_100014830;
  v8[0] = a1;
  v4 = a2;
  Logger.init(subsystem:category:)(0xD00000000000001CLL, 0x800000010000FCF0, 0xD000000000000010, 0x800000010000FD10);
  *(_QWORD *)&v4[OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_viewAlert] = 0;
  sub_100008CE0((uint64_t)v8, (uint64_t)&v4[OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_delegate]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for DKUncertifiedAlertView(0);
  v5 = objc_msgSendSuper2(&v7, "initWithNibName:bundle:", 0, 0);
  sub_100003938(v8);
  return v5;
}

void sub_10000882C(void (*a1)(void), uint64_t a2)
{
  char *v2;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  id v14;
  char *v15;
  _QWORD v16[5];
  _QWORD *v17;

  if (*(_QWORD *)&v2[OBJC_IVAR____TtC18DKPairingUIService14ViewController_context])
  {
    v5 = OBJC_IVAR____TtC18DKPairingUIService14ViewController_sfClient;
    v6 = *(void **)&v2[OBJC_IVAR____TtC18DKPairingUIService14ViewController_sfClient];
    if (v6)
    {
      objc_msgSend(v6, "invalidate");
      v7 = *(void **)&v2[v5];
      *(_QWORD *)&v2[v5] = 0;

    }
    v8 = objc_msgSend(objc_allocWithZone((Class)SFClient), "init");
    v9 = *(void **)&v2[v5];
    *(_QWORD *)&v2[v5] = v8;

    v10 = *(void **)&v2[v5];
    if (v10)
    {
      v11 = (_QWORD *)swift_allocObject(&unk_100014A10, 40, 7);
      v11[2] = v2;
      v11[3] = a1;
      v11[4] = a2;
      v16[4] = sub_100009778;
      v17 = v11;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 1107296256;
      v16[2] = sub_100004090;
      v16[3] = &unk_100014A28;
      v12 = _Block_copy(v16);
      v13 = v17;
      v14 = v10;
      v15 = v2;
      sub_100009784((uint64_t)a1, a2);
      swift_release(v13);
      objc_msgSend(v14, "startProxCardTransactionWithOptions:completion:", 14, v12);
      _Block_release(v12);

    }
  }
  if (a1)
    a1();
}

void sub_10000897C()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  Class isa;
  id v6;
  id v7;
  NSString v8;
  id v9;

  v0 = (void *)objc_opt_self(UIImageSymbolConfiguration);
  v1 = objc_msgSend(v0, "configurationWithPointSize:weight:", 4, 150.0);
  v2 = sub_100003808(&qword_10001A138);
  v3 = swift_allocObject(v2, 48, 7);
  *(_OWORD *)(v3 + 16) = xmmword_10000ED30;
  v4 = (void *)objc_opt_self(UIColor);
  *(_QWORD *)(v3 + 32) = objc_msgSend(v4, "labelColor");
  *(_QWORD *)(v3 + 40) = objc_msgSend(v4, "systemGreenColor");
  specialized Array._endMutation()();
  sub_1000093B8(0, &qword_10001A148, UIColor_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  v6 = objc_msgSend(v0, "configurationWithPaletteColors:", isa);

  v7 = v1;
  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend((id)objc_opt_self(UIImage), "_systemImageNamed:withConfiguration:", v8, v7);

  if (v9)
  {
    objc_msgSend(v9, "imageByApplyingSymbolConfiguration:", v6);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100008B48()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100008B6C(uint64_t a1)
{
  uint64_t v1;

  sub_100006D3C(a1, v1);
}

uint64_t sub_100008B84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100008B94(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100008B9C()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100008BD0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc(dword_10001A15C);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_100009868;
  return sub_100005C1C(a1, v4, v5, v7, v6);
}

uint64_t sub_100008C48(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100008C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_100008CA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100008CE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100008D24(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100008D60(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100003808(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100008D9C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100008DC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10001A174);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100008E30;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10001A170 + dword_10001A170))(a1, v4);
}

uint64_t sub_100008E30()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_OWORD *sub_100008E78(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_100008E88(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  void *v9;
  id v10;
  Swift::String v11;
  Swift::String v12;
  void *object;
  NSString v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  Class isa;
  id v21;
  Swift::String v22;
  Swift::String v23;
  void *v24;
  uint64_t v25;
  NSString v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  _QWORD aBlock[5];
  uint64_t v37;
  Swift::String v38;
  Swift::String v39;

  v2 = v1;
  v4 = objc_msgSend(objc_allocWithZone((Class)PRXIconContentViewController), "init");
  objc_msgSend(v4, "setDismissalType:", 3);
  v5 = v4;
  sub_1000048F4();
  v7 = v6;
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  objc_msgSend(v5, "setTitle:", v8);

  v9 = (void *)objc_opt_self(NSBundle);
  v10 = objc_msgSend(v9, "mainBundle");
  v11._countAndFlagsBits = 0xD000000000000020;
  v38._countAndFlagsBits = 0xD00000000000003CLL;
  v12._countAndFlagsBits = 0xD000000000000046;
  v38._object = (void *)0x80000001000100A0;
  v11._object = (void *)0x8000000100010020;
  v12._object = (void *)0x8000000100010050;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v11, (Swift::String_optional)0, (NSBundle)v10, v12, v38)._object;

  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v5, "setBodyText:", v14);

  sub_10000897C();
  if (v15)
  {
    v16 = v15;
    v17 = sub_100003808(&qword_10001A138);
    v18 = swift_allocObject(v17, 40, 7);
    *(_OWORD *)(v18 + 16) = xmmword_10000ED20;
    *(_QWORD *)(v18 + 32) = v16;
    aBlock[0] = v18;
    specialized Array._endMutation()();
    sub_1000093B8(0, &qword_10001A140, UIImage_ptr);
    v19 = v16;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(aBlock[0]);
    objc_msgSend(v5, "setImages:", isa);

  }
  v21 = objc_msgSend(v9, "mainBundle");
  v39._countAndFlagsBits = 0xD00000000000004ELL;
  v39._object = (void *)0x800000010000FE30;
  v22._object = (void *)0x800000010000FE10;
  v22._countAndFlagsBits = 0xD000000000000016;
  v23._countAndFlagsBits = 1701736260;
  v23._object = (void *)0xE400000000000000;
  v24 = NSLocalizedString(_:tableName:bundle:value:comment:)(v22, (Swift::String_optional)0, (NSBundle)v21, v23, v39)._object;

  v25 = swift_allocObject(&unk_100014858, 24, 7);
  swift_unknownObjectWeakInit(v25 + 16, v5);
  swift_retain(v25);
  v26 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v24);
  aBlock[4] = sub_100008B6C;
  v37 = v25;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005BCC;
  aBlock[3] = &unk_1000148E8;
  v27 = _Block_copy(aBlock);
  v28 = objc_msgSend((id)objc_opt_self(PRXAction), "actionWithTitle:style:handler:", v26, 0, v27);

  _Block_release(v27);
  v29 = v37;
  swift_release(v25);
  swift_release(v29);

  v30 = *(void **)(v2 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_registerCardService);
  if (v30)
  {
    v31 = v30;
    dispatch thunk of DockKitCorePairingService.disconnect()(v31);

  }
  v32 = *(void **)(v2 + OBJC_IVAR____TtC18DKPairingUIService14ViewController_beginPairingService);
  if (v32)
  {
    v33 = v32;
    dispatch thunk of DockKitCorePairingService.disconnect()(v33);

  }
  if (a1)
  {
    v34 = objc_msgSend(a1, "navigationController");
    if (v34)
    {
      v35 = v34;
      objc_msgSend(v34, "pushViewController:animated:", v5, 1);

    }
  }

}

uint64_t sub_100009280()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_1000092AC(uint64_t a1)
{
  uint64_t v1;

  sub_100005B50(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1000092B4()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000092F0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc(dword_10001A18C);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_100008E30;
  return sub_100005168(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_100009370(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003808(&qword_10001A168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000093B8(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_1000093F0(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  _QWORD aBlock[5];
  _QWORD *v28;

  v4 = v3;
  v8 = type metadata accessor for DispatchWorkItemFlags(0);
  v26 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for DispatchQoS(0);
  v11 = *(_QWORD *)(v25 - 8);
  __chkstk_darwin(v25);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000093B8(0, &qword_10001A1A0, OS_dispatch_queue_ptr);
  v14 = (void *)static OS_dispatch_queue.main.getter();
  v15 = (_QWORD *)swift_allocObject(&unk_100014998, 48, 7);
  v15[2] = v3;
  v15[3] = a2;
  v15[4] = a1;
  v15[5] = a3;
  aBlock[4] = sub_100009620;
  v28 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100009890;
  aBlock[3] = &unk_1000149B0;
  v16 = _Block_copy(aBlock);
  v17 = v28;
  v18 = a3;
  v19 = v4;
  swift_bridgeObjectRetain(a2);
  v20 = swift_release(v17);
  static DispatchQoS.unspecified.getter(v20);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v21 = sub_10000962C();
  v22 = sub_100003808(&qword_10001A1B0);
  v23 = sub_100009674();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v22, v23, v8, v21);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v13, v10, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v25);
}

uint64_t sub_1000095EC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 48, 7);
}

void sub_100009620()
{
  uint64_t v0;

  sub_100006D9C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40));
}

unint64_t sub_10000962C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001A1A8;
  if (!qword_10001A1A8)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_10001A1A8);
  }
  return result;
}

unint64_t sub_100009674()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001A1B8;
  if (!qword_10001A1B8)
  {
    v1 = sub_1000096C0(&qword_10001A1B0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001A1B8);
  }
  return result;
}

uint64_t sub_1000096C0(uint64_t *a1)
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

uint64_t sub_100009704(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100009714()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100009738()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_100009744()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_100009778(char a1)
{
  uint64_t v1;

  sub_100003BC4(a1, *(char **)(v1 + 16), *(void (**)(void))(v1 + 24));
}

uint64_t sub_100009784(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_100009794()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_1000097D8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v9 = v1[6];
  v8 = v1[7];
  v10 = (_QWORD *)swift_task_alloc(dword_10001A1CC);
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_100009868;
  return sub_100004178(a1, v4, v5, v6, v7, v9, v8);
}

BOOL sub_100009894(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000098A8()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000098EC()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100009914(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100009954()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10000BA7C(v0, qword_10001A240);
  sub_10000B420(v0, (uint64_t)qword_10001A240);
  return Logger.init(subsystem:category:)(0xD00000000000001CLL, 0x800000010000FCF0, 0x4D6B726F7774654ELL, 0xEE00726567616E61);
}

uint64_t sub_1000099D4()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = *(_QWORD *)(v0 + 24);
  if (result)
  {
    if (!*(_QWORD *)(v0 + 32))
      return 0;
    if (!objc_msgSend((id)result, "powerOn"))
      goto LABEL_6;
    result = *(_QWORD *)(v0 + 24);
    if (!result)
    {
LABEL_12:
      __break(1u);
      return result;
    }
    if (objc_msgSend((id)result, "userAutoJoinDisabled"))
    {
LABEL_6:
      v2 = 0;
      result = *(_QWORD *)(v0 + 32);
      if (result)
      {
        _CTServerConnectionGetCellularDataIsEnabled(result, &v2);
        return 2 * (v2 != 0);
      }
      __break(1u);
      goto LABEL_12;
    }
    return 1;
  }
  return result;
}

uint64_t sub_100009A8C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  void (*v20)(char *, uint64_t);
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  char *v44;
  char *v45;
  unsigned int v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  NSString v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v62;
  id v63;
  char *v64;
  char *v65;
  uint64_t (*v66)(char *, uint64_t, uint64_t);
  __int128 aBlock;
  __int128 v68;
  void *v69;
  uint64_t v70;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v65 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  v64 = (char *)&v62 - v9;
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v62 - v11;
  __chkstk_darwin(v10);
  v14 = (char *)&v62 - v13;
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_WORD *)(v2 + 40) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_QWORD *)(v2 + 88) = 0;
  if (qword_100019FD0 != -1)
    swift_once(&qword_100019FD0, sub_100009954);
  v15 = sub_10000B420(v4, (uint64_t)qword_10001A240);
  v66 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v16 = v66(v14, v15, v4);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Trying to initialize CoreBluetooth", v19, 2u);
    swift_slowDealloc(v19, -1, -1);
  }

  v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v14, v4);
  *(_QWORD *)(v2 + 48) = a1;
  v21 = objc_allocWithZone((Class)CBController);
  v63 = a1;
  v22 = objc_msgSend(v21, "init");
  v23 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = v22;

  v24 = *(void **)(v2 + 16);
  if (!v24)
  {
    __break(1u);
    goto LABEL_21;
  }
  v69 = sub_10000BB40;
  v70 = v2;
  *(_QWORD *)&aBlock = _NSConcreteStackBlock;
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v68 = sub_100009890;
  *((_QWORD *)&v68 + 1) = &unk_100014B88;
  v25 = _Block_copy(&aBlock);
  v26 = v70;
  swift_retain(v2);
  v27 = v24;
  swift_release(v26);
  objc_msgSend(v27, "setBluetoothStateChangedHandler:", v25);
  _Block_release(v25);

  v28 = *(void **)(v2 + 16);
  if (!v28)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v69 = sub_10000BB48;
  v70 = v2;
  *(_QWORD *)&aBlock = _NSConcreteStackBlock;
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v68 = sub_10000A66C;
  *((_QWORD *)&v68 + 1) = &unk_100014BB0;
  v29 = _Block_copy(&aBlock);
  v30 = v70;
  swift_retain(v2);
  v31 = v28;
  swift_release(v30);
  objc_msgSend(v31, "activateWithCompletion:", v29);
  _Block_release(v29);

  v32 = v66(v12, v15, v4);
  v33 = Logger.logObject.getter(v32);
  v34 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v35 = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Trying to initialize CoreWiFi", v35, 2u);
    swift_slowDealloc(v35, -1, -1);
  }

  v20(v12, v4);
  v36 = objc_msgSend(objc_allocWithZone((Class)CWFInterface), "init");
  v37 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v36;

  v38 = *(void **)(v2 + 24);
  if (!v38)
    goto LABEL_22;
  v69 = sub_10000BB50;
  v70 = v2;
  *(_QWORD *)&aBlock = _NSConcreteStackBlock;
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v68 = sub_100005BCC;
  *((_QWORD *)&v68 + 1) = &unk_100014BD8;
  v39 = _Block_copy(&aBlock);
  v40 = v70;
  swift_retain(v2);
  v41 = v38;
  swift_release(v40);
  objc_msgSend(v41, "setEventHandler:", v39);
  _Block_release(v39);

  v42 = *(void **)(v2 + 24);
  if (!v42)
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
  }
  objc_msgSend(v42, "activate");
  v43 = *(void **)(v2 + 24);
  v45 = v64;
  v44 = v65;
  if (!v43)
    goto LABEL_24;
  *(_QWORD *)&aBlock = 0;
  v46 = objc_msgSend(v43, "startMonitoringEventType:error:", 1, &aBlock);
  v47 = aBlock;
  if (v46)
  {
    v48 = (id)aBlock;
  }
  else
  {
    v49 = (id)aBlock;
    v50 = _convertNSErrorToError(_:)(v47);

    swift_willThrow();
    swift_errorRelease(v50);
  }
  v51 = v66(v45, v15, v4);
  v52 = Logger.logObject.getter(v51);
  v53 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v54 = 0;
    _os_log_impl((void *)&_mh_execute_header, v52, v53, "Trying to initialize CoreTelephony", v54, 2u);
    swift_slowDealloc(v54, -1, -1);
  }

  v20(v45, v4);
  v69 = 0;
  aBlock = 0u;
  v68 = 0u;
  v55 = String._bridgeToObjectiveC()();
  v56 = _CTServerConnectionCreateAndLaunchWithIdentifier(kCFAllocatorDefault, v55, nullsub_1, &aBlock);

  *(_QWORD *)(v2 + 32) = v56;
  v57 = v66(v44, v15, v4);
  v58 = Logger.logObject.getter(v57);
  v59 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v58, v59))
  {
    v60 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v60 = 0;
    _os_log_impl((void *)&_mh_execute_header, v58, v59, "Radio controller initialized!", v60, 2u);
    swift_slowDealloc(v60, -1, -1);
  }

  v20(v44, v4);
  return v2;
}

void *sub_10000A0F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *result;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD aBlock[5];
  uint64_t v24;

  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v21 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = *(void **)(a1 + 16);
  if (result)
  {
    if (objc_msgSend(result, "bluetoothState") == (id)5)
      v10 = 1;
    else
      v10 = 2;
    *(_BYTE *)(a1 + 40) = v10;
    v11 = *(void **)(a1 + 48);
    v12 = swift_allocObject(&unk_100014B48, 24, 7);
    swift_weakInit(v12 + 16, a1);
    v13 = swift_allocObject(&unk_100014C60, 25, 7);
    *(_QWORD *)(v13 + 16) = v12;
    *(_BYTE *)(v13 + 24) = v10;
    aBlock[4] = sub_10000BBE8;
    v24 = v13;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100009890;
    aBlock[3] = &unk_100014C78;
    v14 = _Block_copy(aBlock);
    v15 = v11;
    v16 = swift_retain(v12);
    static DispatchQoS.unspecified.getter(v16);
    v22 = &_swiftEmptyArrayStorage;
    v17 = sub_10000962C();
    v18 = sub_100003808(&qword_10001A1B0);
    v19 = sub_100009674();
    dispatch thunk of SetAlgebra.init<A>(_:)(&v22, v18, v19, v2, v17);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v4, v14);
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v2);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v20 = v24;
    swift_release(v12);
    return (void *)swift_release(v20);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000A31C(uint64_t a1)
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

id sub_10000A348(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id result;
  char v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  _QWORD v30[3];
  _BYTE v31[8];
  uint64_t v32;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v27 - v9;
  if (a1)
  {
    if (qword_100019FD0 != -1)
      swift_once(&qword_100019FD0, sub_100009954);
    v11 = sub_10000B420(v4, (uint64_t)qword_10001A240);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v11, v4);
    swift_errorRetain(a1);
    v12 = swift_errorRetain(a1);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(12, -1);
      v16 = swift_slowAlloc(32, -1);
      v32 = v16;
      *(_DWORD *)v15 = 136315138;
      v28 = v15 + 4;
      swift_getErrorValue(a1, v31, v30);
      v17 = Error.localizedDescription.getter(v30[1], v30[2]);
      v19 = v18;
      v29 = sub_10000B438(v17, v18, &v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, v30, v28, v15 + 12);
      swift_bridgeObjectRelease(v19);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Unable to activate Bluetooth controller: %s", v15, 0xCu);
      swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v16, -1, -1);
      swift_slowDealloc(v15, -1, -1);
    }
    else
    {
      swift_errorRelease(a1);
      swift_errorRelease(a1);
    }

    return (id)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  else
  {
    if (qword_100019FD0 != -1)
      swift_once(&qword_100019FD0, sub_100009954);
    v20 = sub_10000B420(v4, (uint64_t)qword_10001A240);
    v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v20, v4);
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Bluetooth controller activated.", v24, 2u);
      swift_slowDealloc(v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    result = *(id *)(a2 + 16);
    if (result)
    {
      result = objc_msgSend(result, "bluetoothState");
      if (result == (id)5)
        v26 = 1;
      else
        v26 = 2;
      *(_BYTE *)(a2 + 40) = v26;
    }
  }
  return result;
}

void sub_10000A66C(uint64_t a1, void *a2)
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

uint64_t sub_10000A6C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  void *v23;
  _QWORD aBlock[5];
  uint64_t v25;

  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v22 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_1000099D4())
    v10 = 1;
  else
    v10 = 2;
  *(_BYTE *)(a2 + 41) = v10;
  v11 = *(void **)(a2 + 48);
  v12 = swift_allocObject(&unk_100014B48, 24, 7);
  swift_weakInit(v12 + 16, a2);
  v13 = swift_allocObject(&unk_100014C10, 25, 7);
  *(_QWORD *)(v13 + 16) = v12;
  *(_BYTE *)(v13 + 24) = v10;
  aBlock[4] = sub_10000BB7C;
  v25 = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100009890;
  aBlock[3] = &unk_100014C28;
  v14 = _Block_copy(aBlock);
  v15 = v11;
  v16 = swift_retain(v12);
  static DispatchQoS.unspecified.getter(v16);
  v23 = &_swiftEmptyArrayStorage;
  v17 = sub_10000962C();
  v18 = sub_100003808(&qword_10001A1B0);
  v19 = sub_100009674();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v23, v18, v19, v3, v17);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v5, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v20 = v25;
  swift_release(v12);
  return swift_release(v20);
}

uint64_t sub_10000A8D0(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  _BYTE v10[24];
  _BYTE v11[24];
  uint64_t v12;
  _BYTE v13[24];

  v5 = a1 + 16;
  swift_beginAccess(a1 + 16, v13, 0, 0);
  result = swift_weakLoadStrong(v5);
  if (result)
  {
    v7 = result;
    v8 = result + 56;
    swift_beginAccess(result + 56, v10, 0, 0);
    sub_10000BBA0(v8, (uint64_t)v11);
    swift_release(v7);
    if (v12)
    {
      sub_100008CE0((uint64_t)v11, (uint64_t)v9);
      sub_10000BB00((uint64_t)v11);
      *(_BYTE *)(*sub_1000038D0(v9, v9[3]) + *a3) = a2;
      return sub_100003938(v9);
    }
    else
    {
      return sub_10000BB00((uint64_t)v11);
    }
  }
  return result;
}

uint64_t sub_10000A9A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v15;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void **)(v1 + 16);
  if (v6)
    objc_msgSend(v6, "invalidate");
  v7 = *(void **)(v1 + 24);
  if (v7)
  {
    objc_msgSend(v7, "stopMonitoringEventType:", 1);
    v8 = *(void **)(v1 + 24);
    if (v8)
      objc_msgSend(v8, "invalidate");
  }
  *(_QWORD *)(v1 + 32) = 0;
  if (qword_100019FD0 != -1)
    swift_once(&qword_100019FD0, sub_100009954);
  v9 = sub_10000B420(v2, (uint64_t)qword_10001A240);
  v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Radio controller uninitialized!", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_10000BB00(v1 + 56);
  return v1;
}

uint64_t sub_10000AB3C()
{
  uint64_t v0;

  sub_10000A9A0();
  return swift_deallocClassInstance(v0, 96, 7);
}

uint64_t type metadata accessor for DKPairingRadioController()
{
  return objc_opt_self(_TtC18DKPairingUIService24DKPairingRadioController);
}

BOOL sub_10000AB7C()
{
  uint64_t v0;
  void *v1;
  char v2;
  _BOOL8 result;
  BOOL v4;
  char v5;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    if (objc_msgSend(v1, "bluetoothState") == (id)5)
      v2 = 1;
    else
      v2 = 2;
    *(_BYTE *)(v0 + 40) = v2;
  }
  else
  {
    v2 = *(_BYTE *)(v0 + 40);
  }
  if (v2 == 2)
    return 1;
  if (!*(_QWORD *)(v0 + 24))
    return *(_BYTE *)(v0 + 41) == 2;
  v4 = sub_1000099D4() == 0;
  result = v4;
  if (v4)
    v5 = 2;
  else
    v5 = 1;
  *(_BYTE *)(v0 + 41) = v5;
  return result;
}

void sub_10000AC04(int a1)
{
  uint64_t v1;
  uint64_t v2;
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
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint8_t *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t aBlock[5];
  uint64_t v30;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100019FD0 != -1)
    swift_once(&qword_100019FD0, sub_100009954);
  v8 = sub_10000B420(v4, (uint64_t)qword_10001A240);
  v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  v12 = os_log_type_enabled(v10, v11);
  v27 = a1;
  if (v12)
  {
    v13 = swift_slowAlloc(12, -1);
    v26 = v2;
    v14 = (uint8_t *)v13;
    v15 = swift_slowAlloc(32, -1);
    *(_DWORD *)v14 = 136315138;
    aBlock[0] = v15;
    if ((a1 & 1) != 0)
      v16 = 0x64656C62616E45;
    else
      v16 = 0x64656C6261736944;
    if ((a1 & 1) != 0)
      v17 = 0xE700000000000000;
    else
      v17 = 0xE800000000000000;
    v28 = sub_10000B438(v16, v17, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, aBlock, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease(v17);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Setting Bluetooth status to: %s", v14, 0xCu);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    v18 = v14;
    v2 = v26;
    swift_slowDealloc(v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v19 = *(void **)(v2 + 16);
  if (v19)
  {
    if ((v27 & 1) != 0)
      v20 = 5;
    else
      v20 = 4;
    v21 = swift_allocObject(&unk_100014B48, 24, 7);
    swift_weakInit(v21 + 16, v2);
    aBlock[4] = (uint64_t)sub_10000BAE0;
    v30 = v21;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10000A66C;
    aBlock[3] = (uint64_t)&unk_100014B60;
    v22 = _Block_copy(aBlock);
    v23 = v30;
    v24 = v19;
    swift_release(v23);
    objc_msgSend(v24, "setPowerState:completion:", v20, v22);
    _Block_release(v22);

  }
}

uint64_t sub_10000AEC4(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v5[24];
  uint64_t v6;
  uint64_t v7;

  if (!result)
  {
    v6 = v2;
    v7 = v3;
    v4 = a2 + 16;
    swift_beginAccess(a2 + 16, v5, 0, 0);
    result = swift_weakLoadStrong(v4);
    if (result)
    {
      *(_BYTE *)(result + 40) = 1;
      return swift_release(result);
    }
  }
  return result;
}

id sub_10000AF1C(int a1)
{
  void *v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unsigned int v17;
  id v18;
  id v19;
  unsigned int v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  v2 = v1;
  LODWORD(v3) = a1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  result = (id)__chkstk_darwin(v4);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*((_QWORD *)v2 + 3))
  {
    if (qword_100019FD0 != -1)
      swift_once(&qword_100019FD0, sub_100009954);
    v9 = sub_10000B420(v4, (uint64_t)qword_10001A240);
    v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v9, v4);
    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v26 = v2;
      v13 = (uint8_t *)swift_slowAlloc(12, -1);
      v14 = (void *)swift_slowAlloc(32, -1);
      *(_DWORD *)v13 = 136315138;
      v29 = v14;
      if ((v3 & 1) != 0)
        v15 = 0x64656C62616E45;
      else
        v15 = 0x64656C6261736944;
      HIDWORD(v25) = v3;
      if ((v3 & 1) != 0)
        v3 = 0xE700000000000000;
      else
        v3 = 0xE800000000000000;
      v27 = sub_10000B438(v15, v3, (uint64_t *)&v29);
      v2 = v26;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v13 + 4, v13 + 12);
      v16 = v3;
      LOBYTE(v3) = BYTE4(v25);
      swift_bridgeObjectRelease(v16);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Setting Wi-Fi status to: %s", v13, 0xCu);
      swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v14, -1, -1);
      swift_slowDealloc(v13, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    result = (id)*((_QWORD *)v2 + 3);
    if (result)
    {
      if (objc_msgSend(result, "userAutoJoinDisabled") && (v3 & 1) != 0)
      {
        result = (id)*((_QWORD *)v2 + 3);
        if (!result)
        {
LABEL_27:
          __break(1u);
          return result;
        }
        v29 = 0;
        v17 = objc_msgSend(result, "setUserAutoJoinDisabled:error:", 0, &v29);
        v18 = v29;
        if (!v17)
        {
          v22 = v29;
          v23 = v18;
LABEL_23:
          v24 = _convertNSErrorToError(_:)(v23);

          swift_willThrow();
          return (id)swift_errorRelease(v24);
        }
        v19 = v29;
      }
      result = (id)*((_QWORD *)v2 + 3);
      if (result)
      {
        v29 = 0;
        v20 = objc_msgSend(result, "setPower:error:", v3 & 1, &v29);
        v21 = v29;
        if (v20)
        {
          *((_BYTE *)v2 + 41) = 1;
          return v21;
        }
        v26 = v29;
        v22 = v29;
        v23 = v26;
        goto LABEL_23;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_27;
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for NetworkStatus(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NetworkStatus(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for NetworkStatus(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000B344 + 4 * byte_10000EDA5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10000B378 + 4 * byte_10000EDA0[v4]))();
}

uint64_t sub_10000B378(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B380(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000B388);
  return result;
}

uint64_t sub_10000B394(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000B39CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10000B3A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B3A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B3B4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000B3C0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NetworkStatus()
{
  return &type metadata for NetworkStatus;
}

unint64_t sub_10000B3DC()
{
  unint64_t result;

  result = qword_10001A408;
  if (!qword_10001A408)
  {
    result = swift_getWitnessTable(&unk_10000EE78, &type metadata for NetworkStatus);
    atomic_store(result, (unint64_t *)&qword_10001A408);
  }
  return result;
}

uint64_t sub_10000B420(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_10000B438(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10000B508(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100008CA4((uint64_t)v12, *a3);
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
      sub_100008CA4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100003938(v12);
  return v7;
}

uint64_t sub_10000B508(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000B6C0(a5, a6);
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

uint64_t sub_10000B6C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000B754(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000B92C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000B92C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000B754(uint64_t a1, unint64_t a2)
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
      v5 = sub_10000B8C8(v4, 0);
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

_QWORD *sub_10000B8C8(uint64_t a1, uint64_t a2)
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
  v4 = sub_100003808(&qword_10001A410);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000B92C(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100003808(&qword_10001A410);
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

uint64_t *sub_10000BA7C(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000BABC()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000BAE0(uint64_t a1)
{
  uint64_t v1;

  return sub_10000AEC4(a1, v1);
}

uint64_t sub_10000BAE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000BAF8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000BB00(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003808(&qword_10001A418);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_10000BB40()
{
  uint64_t v0;

  return sub_10000A0F8(v0);
}

id sub_10000BB48(uint64_t a1)
{
  uint64_t v1;

  return sub_10000A348(a1, v1);
}

uint64_t sub_10000BB50(uint64_t a1)
{
  uint64_t v1;

  return sub_10000A6C0(a1, v1);
}

uint64_t sub_10000BB58()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 25, 7);
}

uint64_t sub_10000BB7C()
{
  uint64_t v0;

  return sub_10000A8D0(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24), &OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__wifiStatus);
}

uint64_t sub_10000BBA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003808(&qword_10001A418);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000BBE8()
{
  uint64_t v0;

  return sub_10000A8D0(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24), &OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__bluetoothStatus);
}

char *sub_10000BC38(uint64_t a1)
{
  void *v1;
  _BYTE *v3;
  objc_class *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _BYTE v15[24];
  _BYTE v16[40];
  _QWORD v17[5];
  objc_super v18;

  v3 = v1;
  Logger.init(subsystem:category:)(0xD00000000000001CLL, 0x800000010000FCF0, 0x7472656C41, 0xE500000000000000);
  *(_QWORD *)&v3[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_viewAlert] = 0;
  v3[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__bluetoothStatus] = 0;
  v3[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__wifiStatus] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_controller] = a1;
  swift_retain(a1);

  v4 = (objc_class *)type metadata accessor for DKPairingAlertView(0);
  v18.receiver = v3;
  v18.super_class = v4;
  v5 = (char *)objc_msgSendSuper2(&v18, "initWithNibName:bundle:", 0, 0);
  v6 = OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_controller;
  v7 = *(_QWORD *)&v5[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_controller];
  v17[3] = v4;
  v17[4] = &off_100014CD8;
  v17[0] = v5;
  sub_10000CE20((uint64_t)v17, (uint64_t)v16);
  swift_beginAccess(v7 + 56, v15, 33, 0);
  v8 = v5;
  swift_retain(v7);
  sub_10000CE68((uint64_t)v16, v7 + 56);
  swift_endAccess(v15);
  swift_release(v7);
  v9 = *(_QWORD *)&v5[v6];
  v10 = *(void **)(v9 + 16);
  if (v10)
  {
    swift_retain(*(_QWORD *)&v5[v6]);
    if (objc_msgSend(v10, "bluetoothState") == (id)5)
      LOBYTE(v11) = 1;
    else
      LOBYTE(v11) = 2;
    *(_BYTE *)(v9 + 40) = v11;
  }
  else
  {
    v11 = *(unsigned __int8 *)(v9 + 40);
    swift_retain(*(_QWORD *)&v5[v6]);
  }
  swift_release(v9);
  v8[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__bluetoothStatus] = v11;
  v12 = *(_QWORD *)&v5[v6];
  if (*(_QWORD *)(v12 + 24))
  {
    swift_retain(v12);
    if (sub_1000099D4())
      v13 = 1;
    else
      v13 = 2;
    *(_BYTE *)(v12 + 41) = v13;
  }
  else
  {
    v13 = *(_BYTE *)(v12 + 41);
    swift_retain(v12);
  }
  swift_release(v12);

  swift_release(a1);
  v8[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__wifiStatus] = v13;
  return v8;
}

uint64_t sub_10000BE38(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = &v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_logger];
  v4 = v1;
  Logger.init(subsystem:category:)(0xD00000000000001CLL, 0x800000010000FCF0, 0x7472656C41, 0xE500000000000000);

  v5 = OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_viewAlert;
  *(_QWORD *)&v4[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_viewAlert] = 0;
  v4[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__bluetoothStatus] = 0;
  v4[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__wifiStatus] = 0;
  v6 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v3, v6);
  v7 = *(void **)&v4[v5];

  v8 = type metadata accessor for DKPairingAlertView(0);
  swift_deallocPartialClassInstance(v4, v8, *(unsigned int *)((swift_isaMask & *(_QWORD *)v4) + 0x30), *(unsigned __int16 *)((swift_isaMask & *(_QWORD *)v4) + 0x34));
  return 0;
}

void sub_10000C038()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  void *v23;
  uint64_t v24;
  char v25;
  void *v26;
  id v27;
  Swift::String v28;
  Swift::String v29;
  void *object;
  id v31;
  Swift::String v32;
  Swift::String v33;
  void *v34;
  id v35;
  void *v36;
  int wapiCapability;
  id v38;
  Swift::String v39;
  Swift::String v40;
  id v41;
  Swift::String v42;
  Swift::String v43;
  NSString v44;
  NSString v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  Swift::String v51;
  Swift::String v52;
  void *v53;
  uint64_t v54;
  NSString v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  id v61;
  id v62;
  Swift::String v63;
  Swift::String v64;
  void *v65;
  uint64_t v66;
  NSString v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void **aBlock;
  uint64_t v74;
  void (*v75)(uint64_t, void *);
  void *v76;
  void (*v77)(uint64_t);
  uint64_t v78;
  Swift::String v79;
  Swift::String v80;
  Swift::String v81;
  Swift::String v82;
  Swift::String v83;
  Swift::String v84;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v71 - v7;
  v9 = OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__bluetoothStatus;
  if (v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__bluetoothStatus] == 2
    || v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__wifiStatus] == 2)
  {
    v10 = OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_viewAlert;
    if (*(_QWORD *)&v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_viewAlert])
      return;
    v11 = (*(uint64_t (**)(char *, _BYTE *, uint64_t))(v3 + 16))(v6, &v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_logger], v2);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Pushing alert to stack...", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v15 = OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_controller;
    v16 = *(_QWORD *)&v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_controller];
    v17 = *(void **)(v16 + 16);
    if (v17)
    {
      swift_retain(*(_QWORD *)&v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_controller]);
      if (objc_msgSend(v17, "bluetoothState") == (id)5)
        LOBYTE(v18) = 1;
      else
        LOBYTE(v18) = 2;
      *(_BYTE *)(v16 + 40) = v18;
    }
    else
    {
      v18 = *(unsigned __int8 *)(v16 + 40);
      swift_retain(*(_QWORD *)&v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_controller]);
    }
    swift_release(v16);
    v1[v9] = v18;
    v24 = *(_QWORD *)&v1[v15];
    if (*(_QWORD *)(v24 + 24))
    {
      swift_retain(*(_QWORD *)&v1[v15]);
      if (sub_1000099D4())
        v25 = 1;
      else
        v25 = 2;
      *(_BYTE *)(v24 + 41) = v25;
    }
    else
    {
      v25 = *(_BYTE *)(v24 + 41);
      swift_retain(*(_QWORD *)&v1[v15]);
    }
    swift_release(v24);
    v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView__wifiStatus] = v25;
    v26 = (void *)objc_opt_self(NSBundle);
    v27 = objc_msgSend(v26, "mainBundle");
    v28._countAndFlagsBits = 0xD00000000000001BLL;
    v29._countAndFlagsBits = 0xD000000000000027;
    v79._countAndFlagsBits = 0xD00000000000003ELL;
    v79._object = (void *)0x8000000100010960;
    v29._object = (void *)0x8000000100010910;
    v28._object = (void *)0x8000000100010940;
    object = NSLocalizedString(_:tableName:bundle:value:comment:)(v29, (Swift::String_optional)0, (NSBundle)v27, v28, v79)._object;

    v31 = objc_msgSend(v26, "mainBundle");
    v32._countAndFlagsBits = 0x1000000000000041;
    v80._countAndFlagsBits = 0xD000000000000040;
    v80._object = (void *)0x8000000100010A20;
    v33._object = (void *)0x80000001000109A0;
    v32._object = (void *)0x80000001000109D0;
    v33._countAndFlagsBits = 0xD000000000000025;
    v34 = NSLocalizedString(_:tableName:bundle:value:comment:)(v33, (Swift::String_optional)0, (NSBundle)v31, v32, v80)._object;

    v35 = (id)MobileGestalt_get_current_device();
    if (v35)
    {
      v36 = v35;
      wapiCapability = MobileGestalt_get_wapiCapability();

      if (wapiCapability)
      {
        swift_bridgeObjectRelease(object);
        swift_bridgeObjectRelease(v34);
        v38 = objc_msgSend(v26, "mainBundle");
        v39._countAndFlagsBits = 0xD00000000000001ALL;
        v40._countAndFlagsBits = 0xD000000000000027;
        v81._countAndFlagsBits = 0xD00000000000003DLL;
        v81._object = (void *)0x8000000100010B60;
        v40._object = (void *)0x8000000100010B10;
        v39._object = (void *)0x8000000100010B40;
        object = NSLocalizedString(_:tableName:bundle:value:comment:)(v40, (Swift::String_optional)0, (NSBundle)v38, v39, v81)._object;

        v41 = objc_msgSend(v26, "mainBundle");
        v82._countAndFlagsBits = 0xD00000000000003FLL;
        v82._object = (void *)0x8000000100010C20;
        v42._object = (void *)0x8000000100010BA0;
        v43._object = (void *)0x8000000100010BD0;
        v42._countAndFlagsBits = 0xD000000000000025;
        v43._countAndFlagsBits = 0x1000000000000040;
        v34 = NSLocalizedString(_:tableName:bundle:value:comment:)(v42, (Swift::String_optional)0, (NSBundle)v41, v43, v82)._object;

      }
      v44 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(object);
      v45 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v34);
      v46 = objc_msgSend((id)objc_opt_self(UIAlertController), "alertControllerWithTitle:message:preferredStyle:", v44, v45, 1);

      v47 = *(void **)&v1[v10];
      *(_QWORD *)&v1[v10] = v46;

      v48 = *(void **)&v1[v10];
      v72 = v10;
      if (v48)
      {
        v49 = v48;
        v50 = objc_msgSend(v26, "mainBundle");
        v51._countAndFlagsBits = 0xD00000000000001ELL;
        v83._countAndFlagsBits = 0xD000000000000022;
        v83._object = (void *)0x8000000100010A90;
        v51._object = (void *)0x8000000100010A70;
        v52._countAndFlagsBits = 0x7373696D736944;
        v52._object = (void *)0xE700000000000000;
        v53 = NSLocalizedString(_:tableName:bundle:value:comment:)(v51, (Swift::String_optional)0, (NSBundle)v50, v52, v83)._object;

        v54 = swift_allocObject(&unk_100014D00, 24, 7);
        swift_unknownObjectWeakInit(v54 + 16, v1);
        swift_retain(v54);
        v55 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v53);
        v77 = sub_10000CDF8;
        v78 = v54;
        aBlock = _NSConcreteStackBlock;
        v74 = 1107296256;
        v75 = sub_100005BCC;
        v76 = &unk_100014D18;
        v56 = _Block_copy(&aBlock);
        swift_release(v78);
        v57 = (void *)objc_opt_self(UIAlertAction);
        v58 = objc_msgSend(v57, "actionWithTitle:style:handler:", v55, 1, v56);
        _Block_release(v56);
        swift_release(v54);

        objc_msgSend(v49, "addAction:", v58);
        v59 = v72;
        v60 = *(void **)&v1[v72];
        if (v60)
        {
          v61 = v60;
          v62 = objc_msgSend(v26, "mainBundle");
          v63._countAndFlagsBits = 0xD00000000000001DLL;
          v84._countAndFlagsBits = 0xD00000000000002FLL;
          v84._object = (void *)0x8000000100010AE0;
          v63._object = (void *)0x8000000100010AC0;
          v64._countAndFlagsBits = 0x6E4F206E727554;
          v64._object = (void *)0xE700000000000000;
          v65 = NSLocalizedString(_:tableName:bundle:value:comment:)(v63, (Swift::String_optional)0, (NSBundle)v62, v64, v84)._object;

          v66 = swift_allocObject(&unk_100014D00, 24, 7);
          swift_unknownObjectWeakInit(v66 + 16, v1);
          swift_retain(v66);
          v67 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v65);
          v77 = sub_10000CE18;
          v78 = v66;
          aBlock = _NSConcreteStackBlock;
          v74 = 1107296256;
          v75 = sub_100005BCC;
          v76 = &unk_100014D40;
          v68 = _Block_copy(&aBlock);
          swift_release(v78);
          v69 = objc_msgSend(v57, "actionWithTitle:style:handler:", v67, 0, v68);
          _Block_release(v68);
          swift_release(v66);

          objc_msgSend(v61, "addAction:", v69);
          v70 = *(_QWORD *)&v1[v59];
          if (v70)
          {
            objc_msgSend(v1, "presentViewController:animated:completion:", v70, 1, 0);
            return;
          }
LABEL_32:
          __break(1u);
          return;
        }
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_31;
  }
  v19 = (*(uint64_t (**)(char *, _BYTE *, uint64_t))(v3 + 16))((char *)&v71 - v7, &v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_logger], v2);
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Bluetooth and Wi-Fi enabled, dismissing alert...", v22, 2u);
    swift_slowDealloc(v22, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  v23 = *(void **)&v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_viewAlert];
  *(_QWORD *)&v1[OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_viewAlert] = 0;

  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);
}

void sub_10000C8FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t Strong;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  void *v13;
  void *v14;
  _BYTE v15[24];
  _BYTE v16[24];

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = a2 + 16;
  swift_beginAccess(v7, v16, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v7);
  if (Strong)
  {
    v9 = (void *)Strong;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v6, Strong + OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_logger, v3);

    v10 = Logger.logObject.getter();
    v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Dismiss pressed", v12, 2u);
      swift_slowDealloc(v12, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  }
  swift_beginAccess(v7, v15, 0, 0);
  v13 = (void *)swift_unknownObjectWeakLoadStrong(v7);
  if (v13)
  {
    v14 = v13;
    objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

void sub_10000CA70(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t Strong;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _BYTE v20[24];
  _BYTE v21[24];
  _BYTE v22[24];

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = a2 + 16;
  swift_beginAccess(v7, v22, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v7);
  if (Strong)
  {
    v9 = (void *)Strong;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, Strong + OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_logger, v3);

    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Turn On pressed", v13, 2u);
      swift_slowDealloc(v13, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  swift_beginAccess(v7, v21, 0, 0);
  v14 = swift_unknownObjectWeakLoadStrong(v7);
  if (v14)
  {
    v15 = (void *)v14;
    v16 = *(_QWORD *)(v14 + OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_controller);
    swift_retain(v16);

    sub_10000AC04(1);
    sub_10000AF1C(1);
    swift_release(v16);
  }
  swift_beginAccess(v7, v20, 0, 0);
  v17 = (void *)swift_unknownObjectWeakLoadStrong(v7);
  if (v17)
  {
    v18 = v17;
    objc_msgSend(v17, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

id sub_10000CC6C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DKPairingAlertView(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000CD00()
{
  return type metadata accessor for DKPairingAlertView(0);
}

uint64_t type metadata accessor for DKPairingAlertView(uint64_t a1)
{
  uint64_t result;

  result = qword_10001A448;
  if (!qword_10001A448)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for DKPairingAlertView);
  return result;
}

uint64_t sub_10000CD44(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[5];

  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = "\b";
    v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[3] = &unk_10000EEE0;
    v4[4] = &unk_10000EEE0;
    result = swift_updateClassMetadata2(a1, 256, 5, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_10000CDD4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000CDF8(uint64_t a1)
{
  uint64_t v1;

  sub_10000C8FC(a1, v1);
}

uint64_t sub_10000CE00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000CE10(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_10000CE18(uint64_t a1)
{
  uint64_t v1;

  sub_10000CA70(a1, v1);
}

uint64_t sub_10000CE20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003808(&qword_10001A418);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000CE68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003808(&qword_10001A418);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000CFA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t);

  v5[2] = type metadata accessor for MainActor(0);
  v5[3] = static MainActor.shared.getter();
  v9 = (uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of DockKitCorePairingService.setSetupPayload(uri:)
                                       + async function pointer to dispatch thunk of DockKitCorePairingService.setSetupPayload(uri:));
  v7 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of DockKitCorePairingService.setSetupPayload(uri:)
                                  + 1));
  v5[4] = v7;
  *v7 = v5;
  v7[1] = sub_10000D02C;
  return v9(a5);
}

uint64_t sub_10000D02C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc(v2);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  if (v0)
    v6 = sub_10000D0E8;
  else
    v6 = sub_10000D0B4;
  return swift_task_switch(v6, v5, v4);
}

uint64_t sub_10000D0B4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000D0E8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_10000D354()
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
  uint64_t v12;

  v3 = type metadata accessor for AppDelegate();
  v4 = static CommandLine.unsafeArgv.getter();
  v5 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  v6 = static CommandLine.argc.getter(v5);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v8 = NSStringFromClass(ObjCClassFromMetadata);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);
  v12 = v11;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0, 0, v10, v12);
  swift_bridgeObjectRelease(v12);
  exit((int)v8);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC18DKPairingUIService11AppDelegate);
}

uint64_t sub_10000D42C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000D4A8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for URL(0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc(dword_10001A4F4);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_100008E30;
  return sub_10000CFA4(a1, v5, v6, v7, v8);
}

uint64_t sub_10000D53C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unsigned __int8 v16;
  _QWORD v18[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10000E1AC(a1);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (!v9)
    {
LABEL_6:
      v15 = 0;
      return swift_task_create(v8, v15, (char *)&type metadata for () + 8, a2, a3);
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v16 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (!v9)
      goto LABEL_6;
  }
  v10 = *(_QWORD *)(a3 + 24);
  ObjectType = swift_getObjectType(v9);
  swift_unknownObjectRetain(v9);
  v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
  v14 = v13;
  swift_unknownObjectRelease(v9);
  if (!(v14 | v12))
    goto LABEL_6;
  v18[0] = 0;
  v18[1] = 0;
  v15 = v18;
  v18[2] = v12;
  v18[3] = v14;
  return swift_task_create(v8, v15, (char *)&type metadata for () + 8, a2, a3);
}

uint64_t sub_10000D6AC(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v3 = a1;
    else
      v3 = a1 & 0xFFFFFFFFFFFFFF8;
    v4 = __CocoaSet.startIndex.getter(v3);
    v6 = v5;
    v7 = __CocoaSet.endIndex.getter(v3);
    v9 = static __CocoaSet.Index.== infix(_:_:)(v4, v6, v7, v8);
    swift_bridgeObjectRelease(v7);
    if ((v9 & 1) != 0)
      goto LABEL_6;
    goto LABEL_10;
  }
  result = sub_10000DBA0(a1);
  if ((v13 & 1) == 0)
  {
    v6 = v12;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v12)
    {
      v4 = result;
      if (result == 1 << *(_BYTE *)(a1 + 32))
      {
LABEL_6:
        sub_10000E1EC(v4, v6, v2 != 0);
        return 0;
      }
LABEL_10:
      sub_10000D958(v4, v6, v2 != 0, a1);
      v10 = v14;
      sub_10000E1EC(v4, v6, v2 != 0);
      return v10;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_10000D8F8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(_TtC18DKPairingUIService13SceneDelegate);
}

void sub_10000D958(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  id v18;
  char v19;
  id v20;
  uint64_t v21;
  void *v22;

  v7 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (__CocoaSet.Index.age.getter(a1, a2) == *(_DWORD *)(a4 + 36))
      {
        v11 = __CocoaSet.Index.element.getter(v7, a2);
        v21 = v11;
        v12 = sub_10000E090();
        swift_unknownObjectRetain(v11);
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v12, 7);
        v4 = v22;
        swift_unknownObjectRelease(v11);
        v13 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a4 + 40));
        v14 = -1 << *(_BYTE *)(a4 + 32);
        v7 = v13 & ~v14;
        if (((*(_QWORD *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
        {
          v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v7);
          v16 = static NSObject.== infix(_:_:)(v15);

          if ((v16 & 1) == 0)
          {
            v17 = ~v14;
            do
            {
              v7 = (v7 + 1) & v17;
              if (((*(_QWORD *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
                goto LABEL_24;
              v18 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v7);
              v19 = static NSObject.== infix(_:_:)(v18);

            }
            while ((v19 & 1) == 0);
          }

LABEL_20:
          v20 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v7);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v8 = a4;
  else
    v8 = a4 & 0xFFFFFFFFFFFFFF8;
  v9 = __CocoaSet.element(at:)(a1, a2, v8);
  v21 = v9;
  v10 = sub_10000E090();
  swift_unknownObjectRetain(v9);
  swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
  swift_unknownObjectRelease(v9);
}

uint64_t sub_10000DBA0(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_10000DC28(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  uint64_t result;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;

  v2 = sub_100003808(&qword_10001A150);
  __chkstk_darwin(v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = __chkstk_darwin(v5);
  v9 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v11 = (char *)&v24 - v10;
  v12 = swift_bridgeObjectRetain(a1);
  v13 = (void *)sub_10000D6AC(v12);
  result = swift_bridgeObjectRelease(a1);
  if (v13)
  {
    v15 = objc_msgSend(v13, "URL");
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v15);

    v16 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DockKitCorePairingService(0)), "init");
    v17 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v4, 1, 1, v17);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    type metadata accessor for MainActor(0);
    v18 = v16;
    v19 = static MainActor.shared.getter();
    v20 = *(unsigned __int8 *)(v6 + 80);
    v21 = (v20 + 40) & ~v20;
    v22 = (char *)swift_allocObject(&unk_100014DD0, v21 + v7, v20 | 7);
    *((_QWORD *)v22 + 2) = v19;
    *((_QWORD *)v22 + 3) = &protocol witness table for MainActor;
    *((_QWORD *)v22 + 4) = v18;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v22[v21], v9, v5);
    v23 = sub_10000D53C((uint64_t)v4, (uint64_t)&unk_10001A5B8, (uint64_t)v22);

    swift_release(v23);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
  return result;
}

uint64_t sub_10000DE2C(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t result;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;

  v4 = sub_100003808(&qword_10001A150);
  __chkstk_darwin(v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = __chkstk_darwin(v7);
  v11 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)&v30 - v12;
  v14 = objc_opt_self(UIWindowScene);
  result = swift_dynamicCastObjCClass(a1, v14);
  if (result)
  {
    v16 = objc_msgSend(a2, "URLContexts");
    v17 = sub_10000E090();
    v18 = sub_10000E0CC();
    v19 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v16, v17, v18);

    v20 = (void *)sub_10000D6AC(v19);
    result = swift_bridgeObjectRelease(v19);
    if (v20)
    {
      v21 = objc_msgSend(v20, "URL");
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v21);

      v22 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DockKitCorePairingService(0)), "init");
      v23 = type metadata accessor for TaskPriority(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v6, 1, 1, v23);
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
      type metadata accessor for MainActor(0);
      v24 = v22;
      v25 = static MainActor.shared.getter();
      v26 = *(unsigned __int8 *)(v8 + 80);
      v27 = (v26 + 40) & ~v26;
      v28 = (char *)swift_allocObject(&unk_100014DA8, v27 + v9, v26 | 7);
      *((_QWORD *)v28 + 2) = v25;
      *((_QWORD *)v28 + 3) = &protocol witness table for MainActor;
      *((_QWORD *)v28 + 4) = v24;
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v28[v27], v11, v7);
      v29 = sub_10000D53C((uint64_t)v6, (uint64_t)&unk_10001A5B0, (uint64_t)v28);

      swift_release(v29);
      return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    }
  }
  return result;
}

unint64_t sub_10000E090()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001A598;
  if (!qword_10001A598)
  {
    v1 = objc_opt_self(UIOpenURLContext);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001A598);
  }
  return result;
}

unint64_t sub_10000E0CC()
{
  unint64_t result;
  unint64_t v1;

  result = qword_10001A5A0;
  if (!qword_10001A5A0)
  {
    v1 = sub_10000E090();
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, &qword_10001A5A0);
  }
  return result;
}

uint64_t sub_10000E118(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for URL(0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc(dword_10001A5AC);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_100009868;
  return sub_10000CFA4(a1, v5, v6, v7, v8);
}

uint64_t sub_10000E1AC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003808(&qword_10001A150);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000E1EC(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

uint64_t sub_10000E1FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000E278(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for URL(0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc(dword_10001A5AC);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_100008E30;
  return sub_10000CFA4(a1, v5, v6, v7, v8);
}

uint64_t sub_10000E30C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC18DKPairingUIServiceP33_154AFBC00CAC8E5B3D70418D771D201319ResourceBundleClass);
}
