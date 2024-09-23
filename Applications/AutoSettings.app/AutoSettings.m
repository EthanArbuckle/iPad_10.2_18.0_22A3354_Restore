char *sub_1000031E4()
{
  void *v0;
  unint64_t v1;
  unint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char **p_types;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  id v36;
  Swift::String v37;
  Swift::String_optional v38;
  Swift::String v39;
  Swift::String v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  void *v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  Swift::String v50;

  v3 = v0;
  v4 = objc_msgSend(v0, "historicalNotificationUserActions");
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "historicalNotificationUserActions");

    v7 = sub_100005904(0, &qword_100027E60, CAFHistoricalNotificationUserAction_ptr);
    v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);

    if ((unint64_t)v8 >> 62)
    {
      if (v8 < 0)
        v35 = v8;
      else
        v35 = v8 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v8);
      v9 = _CocoaArrayWrapper.endIndex.getter(v35);
      v46 = v3;
      if (v9)
        goto LABEL_4;
    }
    else
    {
      v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(v8);
      v46 = v3;
      if (v9)
      {
LABEL_4:
        if (v9 < 1)
        {
          __break(1u);
LABEL_42:
          v49 = sub_100012AF8(0, *((_QWORD *)v49 + 2) + 1, 1, v49);
          goto LABEL_37;
        }
        v10 = 0;
        v11 = v8 & 0xC000000000000001;
        v48 = v9;
        v49 = (char *)&_swiftEmptyArrayStorage;
        p_types = &stru_100025FF8.types;
        v47 = v8 & 0xC000000000000001;
        do
        {
          if (v11)
            v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v10, v8);
          else
            v13 = *(id *)(v8 + 8 * v10 + 32);
          v14 = v13;
          v15 = objc_msgSend(v13, p_types[251]);
          if (v15)
          {
            v16 = v15;
            v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
            v19 = v18;

            v20 = HIBYTE(v19) & 0xF;
            if ((v19 & 0x2000000000000000) == 0)
              v20 = v17 & 0xFFFFFFFFFFFFLL;
            if (v20)
            {
              v21 = objc_msgSend(v14, "symbolName");
              if (v21)
              {
                v22 = v21;
                v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
                v25 = v24;

              }
              else
              {
                v23 = 0;
                v25 = 0;
              }
              v26 = v8;
              v27 = objc_msgSend(v14, "contentURLAction");
              if (v27)
              {
                v28 = v27;
                v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
                v31 = v30;

              }
              else
              {

                v29 = 0;
                v31 = 0xE000000000000000;
              }
              if ((swift_isUniquelyReferenced_nonNull_native(v49) & 1) == 0)
                v49 = sub_100012AF8(0, *((_QWORD *)v49 + 2) + 1, 1, v49);
              v33 = *((_QWORD *)v49 + 2);
              v32 = *((_QWORD *)v49 + 3);
              if (v33 >= v32 >> 1)
                v49 = sub_100012AF8((char *)(v32 > 1), v33 + 1, 1, v49);
              *((_QWORD *)v49 + 2) = v33 + 1;
              v34 = &v49[56 * v33];
              *((_QWORD *)v34 + 4) = v17;
              *((_QWORD *)v34 + 5) = v19;
              *((_QWORD *)v34 + 6) = v23;
              *((_QWORD *)v34 + 7) = v25;
              *((_QWORD *)v34 + 8) = v29;
              *((_QWORD *)v34 + 9) = v31;
              v34[80] = 0;
              v8 = v26;
              v11 = v47;
              v9 = v48;
              p_types = (char **)(&stru_100025FF8 + 8);
            }
            else
            {

              swift_bridgeObjectRelease(v19);
            }
          }
          else
          {

          }
          ++v10;
        }
        while (v9 != v10);
        goto LABEL_33;
      }
    }
    v49 = (char *)&_swiftEmptyArrayStorage;
LABEL_33:
    swift_bridgeObjectRelease_n(v8, 2);
    v3 = v46;
    goto LABEL_34;
  }
  v49 = (char *)&_swiftEmptyArrayStorage;
LABEL_34:
  if (!objc_msgSend(v3, "hasUserDismissible") || !objc_msgSend(v3, "userDismissible"))
    return v49;
  v1 = 0xD000000000000011;
  v36 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v37._countAndFlagsBits = 0xD000000000000013;
  v50._object = (void *)0xE000000000000000;
  v37._object = (void *)0x80000001000187C0;
  v38.value._countAndFlagsBits = 0x747465536F747541;
  v38.value._object = (void *)0xEC00000073676E69;
  v39._countAndFlagsBits = 0;
  v39._object = (void *)0xE000000000000000;
  v50._countAndFlagsBits = 0;
  v40 = NSLocalizedString(_:tableName:bundle:value:comment:)(v37, v38, (NSBundle)v36, v39, v50);

  v3 = (void *)String.init(format:_:)(v40._countAndFlagsBits, v40._object, &_swiftEmptyArrayStorage);
  v6 = v41;
  swift_bridgeObjectRelease(v40._object);
  swift_bridgeObjectRetain(v6);
  v2 = (unint64_t)"NOTIFICATION_DELETE";
  swift_bridgeObjectRetain(0x80000001000187E0);
  swift_bridgeObjectRetain(0xE000000000000000);
  if ((swift_isUniquelyReferenced_nonNull_native(v49) & 1) == 0)
    goto LABEL_42;
LABEL_37:
  v43 = *((_QWORD *)v49 + 2);
  v42 = *((_QWORD *)v49 + 3);
  if (v43 >= v42 >> 1)
    v49 = sub_100012AF8((char *)(v42 > 1), v43 + 1, 1, v49);
  *((_QWORD *)v49 + 2) = v43 + 1;
  v44 = &v49[56 * v43];
  *((_QWORD *)v44 + 4) = v3;
  *((_QWORD *)v44 + 5) = v6;
  *((_QWORD *)v44 + 6) = v1;
  *((_QWORD *)v44 + 7) = v2 | 0x8000000000000000;
  *((_QWORD *)v44 + 8) = 0;
  *((_QWORD *)v44 + 9) = 0xE000000000000000;
  v44[80] = 1;
  swift_bridgeObjectRelease(0xE000000000000000);
  swift_bridgeObjectRelease(v2 | 0x8000000000000000);
  swift_bridgeObjectRelease(v6);
  return v49;
}

id sub_10000365C()
{
  char *v0;
  id v1;
  Swift::String v2;
  Swift::String_optional v3;
  Swift::String v4;
  Swift::String v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  void *v9;
  uint64_t v10;
  objc_class *ObjCClassFromMetadata;
  NSString *v12;
  uint64_t v13;
  uint64_t v14;
  NSString v15;
  uint64_t v16;
  objc_class *v17;
  NSString *v18;
  uint64_t v19;
  uint64_t v20;
  NSString v21;
  objc_super v23;
  Swift::String v24;

  v23.receiver = v0;
  v23.super_class = (Class)type metadata accessor for VSNotificationDetailViewController();
  objc_msgSendSuper2(&v23, "viewDidLoad");
  v1 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v24._object = (void *)0xE000000000000000;
  v2._object = (void *)0x8000000100018940;
  v2._countAndFlagsBits = 0xD000000000000013;
  v3.value._countAndFlagsBits = 0x747465536F747541;
  v3.value._object = (void *)0xEC00000073676E69;
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  v24._countAndFlagsBits = 0;
  v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(v2, v3, (NSBundle)v1, v4, v24);

  String.init(format:_:)(v5._countAndFlagsBits, v5._object, &_swiftEmptyArrayStorage);
  v7 = v6;
  swift_bridgeObjectRelease(v5._object);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  objc_msgSend(v0, "setTitle:", v8);

  v9 = *(void **)&v0[direct field offset for CAFUITableViewController.tableView];
  v10 = type metadata accessor for VSNotificationActionTableCell();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v10);
  v12 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  v14 = v13;

  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", ObjCClassFromMetadata, v15);

  v16 = type metadata accessor for VSNotificationHeaderView();
  v17 = (objc_class *)swift_getObjCClassFromMetadata(v16);
  v18 = NSStringFromClass(v17);
  static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
  v20 = v19;

  v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v20);
  objc_msgSend(v9, "registerClass:forHeaderFooterViewReuseIdentifier:", v17, v21);

  objc_msgSend(v9, "setDelegate:", v0);
  objc_msgSend(v9, "setDataSource:", v0);
  return objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_notification], "registerObserver:", v0);
}

void sub_1000038F0(void *a1, uint64_t a2, uint64_t a3, const char **a4, void (*a5)(id))
{
  const char *v8;
  id v9;
  id v10;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)type metadata accessor for VSNotificationDetailViewController();
  v8 = *a4;
  v9 = v11.receiver;
  v10 = objc_msgSendSuper2(&v11, v8, a3);
  a5(v10);

}

uint64_t sub_100003974(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  objc_class *ObjCClassFromMetadata;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  Class isa;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t result;

  v3 = type metadata accessor for VSNotificationActionTableCell();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v5 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v7 = v6;

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v10 = objc_msgSend(a1, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, isa);

  v11 = swift_dynamicCastClass(v10, v3);
  if (v11)
  {
    v12 = v11;
    v13 = IndexPath.row.getter();
    if ((v13 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      v14 = *(_QWORD *)(v1 + OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions);
      if (v13 < *(_QWORD *)(v14 + 16))
      {
        v15 = v14 + 56 * v13;
        v16 = *(_QWORD *)(v15 + 40);
        v17 = *(_QWORD *)(v15 + 48);
        v18 = *(_QWORD *)(v15 + 72);
        v19 = *(_BYTE *)(v15 + 80);
        v20 = v12 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction;
        v21 = *(_QWORD *)(v12 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction);
        v22 = *(_QWORD *)(v12 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction + 8);
        v23 = *(_QWORD *)(v12 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction + 16);
        v24 = *(_QWORD *)(v12 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction + 24);
        v25 = *(_QWORD *)(v12 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction + 32);
        v26 = *(_QWORD *)(v12 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction + 40);
        v27 = *(_OWORD *)(v15 + 56);
        *(_QWORD *)v20 = *(_QWORD *)(v15 + 32);
        *(_QWORD *)(v20 + 8) = v16;
        *(_QWORD *)(v20 + 16) = v17;
        *(_OWORD *)(v20 + 24) = v27;
        *(_QWORD *)(v20 + 40) = v18;
        *(_BYTE *)(v20 + 48) = v19;
        swift_bridgeObjectRetain(v27);
        swift_bridgeObjectRetain(v18);
        swift_bridgeObjectRetain(v16);
        sub_1000058C8(v21, v22, v23, v24, v25, v26);
        sub_10001594C();
        return v12;
      }
    }
    __break(1u);
  }

  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000016, 0x8000000100018900, "AutoSettings/VSNotificationDetailViewController.swift", 53, 2, 123, 0);
  __break(1u);
  return result;
}

void sub_100003CF4(void *a1)
{
  char *v1;
  char *v2;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  char *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  void *v33;
  void (*v34)(uint64_t, unint64_t, id, void (*)(char), _QWORD *);
  char *v35;
  Class isa;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  Class log;
  void *v42;
  uint64_t v43;

  v2 = v1;
  v4 = IndexPath.row.getter();
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  v5 = OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions;
  v6 = *(_QWORD *)&v1[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions];
  if (v4 >= *(_QWORD *)(v6 + 16))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (*(_BYTE *)(v6 + 56 * v4 + 80) != 1)
  {
    v16 = objc_msgSend(v1, "view");
    if (v16)
    {
      v17 = v16;
      v18 = objc_msgSend(v16, "window");

      if (!v18)
        goto LABEL_24;
      v19 = objc_msgSend(v18, "windowScene");

      if (!v19)
        goto LABEL_24;
      v20 = IndexPath.row.getter();
      if ((v20 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else
      {
        v21 = *(_QWORD *)&v2[v5];
        if (v20 < *(_QWORD *)(v21 + 16))
        {
          v22 = v21 + 56 * v20;
          v24 = *(_QWORD *)(v22 + 64);
          v23 = *(_QWORD *)(v22 + 72);
          type metadata accessor for CAFUIRequestContentManager(0);
          swift_bridgeObjectRetain(v23);
          v25 = static CAFUIRequestContentManager.inputStreamIdentifier(from:)(v24, v23);
          v27 = v26;
          v28 = *(void **)&v2[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_notification];
          v29 = IndexPath.row.getter();
          if ((v29 & 0x8000000000000000) == 0)
          {
            if (v29 < 0x100)
            {
              objc_msgSend(v28, "setUserAction:", v29);
              v30 = HIBYTE(v23) & 0xF;
              if ((v23 & 0x2000000000000000) == 0)
                v30 = v24 & 0xFFFFFFFFFFFFLL;
              if (v30)
              {
                v31 = *(_QWORD *)&v2[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_requestContentManager];
                v32 = (_QWORD *)swift_allocObject(&unk_100020DA8, 56, 7);
                v32[2] = v24;
                v32[3] = v23;
                v32[4] = v25;
                v32[5] = v27;
                v32[6] = v2;
                v33 = a1;
                v34 = *(void (**)(uint64_t, unint64_t, id, void (*)(char), _QWORD *))(*(_QWORD *)v31 + 112);
                v35 = v2;
                swift_bridgeObjectRetain(v23);
                v34(v24, v23, v19, sub_100005878, v32);
                a1 = v33;
                swift_release(v32);

                swift_bridgeObjectRelease(v23);
LABEL_24:
                log = IndexPath._bridgeToObjectiveC()().super.isa;
                objc_msgSend(a1, "deselectRowAtIndexPath:animated:", log, 1);

                return;
              }
              swift_bridgeObjectRelease(v23);
              v37 = swift_bridgeObjectRelease(v27);
              if (qword_100027CD0 == -1)
              {
LABEL_21:
                v38 = qword_100029050;
                v39 = static os_log_type_t.default.getter(v37);
                if (os_log_type_enabled(v38, v39))
                {
                  v40 = (uint8_t *)swift_slowAlloc(2, -1);
                  *(_WORD *)v40 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v38, v39, "Empty content URL; not opening.", v40, 2u);
                  swift_slowDealloc(v40, -1, -1);
                }

                goto LABEL_24;
              }
LABEL_30:
              v37 = swift_once(&qword_100027CD0, sub_10000B1A8);
              goto LABEL_21;
            }
            _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Not enough bits to represent the passed value", 45, 2, "Swift/Integers.swift", 20, 2, 3455, 0);
LABEL_34:
            __break(1u);
            return;
          }
LABEL_32:
          _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20, 2, 3451, 0);
          goto LABEL_34;
        }
      }
      __break(1u);
      goto LABEL_30;
    }
    __break(1u);
    goto LABEL_32;
  }
  if (qword_100027CD0 != -1)
LABEL_27:
    swift_once(&qword_100027CD0, sub_10000B1A8);
  v7 = qword_100029050;
  v8 = v1;
  v9 = static os_log_type_t.default.getter(v8);
  if (os_log_type_enabled(v7, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v10 = 138412290;
    v12 = a1;
    v13 = *(void **)&v8[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_notification];
    v42 = v13;
    v14 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43, v10 + 4, v10 + 12);
    *v11 = v13;
    a1 = v12;

    _os_log_impl((void *)&_mh_execute_header, v7, v9, "Hiding notification %@", v10, 0xCu);
    v15 = sub_100005888(&qword_100027E68);
    swift_arrayDestroy(v11, 1, v15);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }
  else
  {

  }
  objc_msgSend(*(id *)&v8[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_notification], "setHidden:", 1);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  objc_msgSend(a1, "deselectRowAtIndexPath:animated:", isa, 1);

}

void sub_100004204(char a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSObject *v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if ((a1 & 1) != 0)
  {
    if (qword_100027CD0 != -1)
      swift_once(&qword_100027CD0, sub_10000B1A8);
    v11 = qword_100029050;
    v12 = swift_bridgeObjectRetain_n(a3, 2);
    v13 = static os_log_type_t.default.getter(v12);
    if (os_log_type_enabled(v11, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(12, -1);
      v15 = swift_slowAlloc(32, -1);
      v24 = v15;
      *(_DWORD *)v14 = 136315138;
      swift_bridgeObjectRetain(a3);
      v23 = sub_1000100BC(a2, a3, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v14 + 4, v14 + 12);
      swift_bridgeObjectRelease_n(a3, 3);
      _os_log_impl((void *)&_mh_execute_header, v11, v13, "Opened url %s successfully", v14, 0xCu);
      swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v15, -1, -1);
      swift_slowDealloc(v14, -1, -1);
      if (!a5)
        return;
    }
    else
    {
      swift_bridgeObjectRelease_n(a3, 2);
      if (!a5)
        return;
    }
    v21 = (_QWORD *)(a6 + OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_presentedPTIdentifier);
    v22 = *(_QWORD *)(a6 + OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_presentedPTIdentifier + 8);
    *v21 = a4;
    v21[1] = a5;
    swift_bridgeObjectRetain(a5);
    swift_bridgeObjectRelease(v22);
    sub_1000045B8();
    return;
  }
  if (qword_100027CD0 != -1)
    swift_once(&qword_100027CD0, sub_10000B1A8);
  v16 = qword_100029050;
  v17 = swift_bridgeObjectRetain_n(a3, 2);
  v18 = static os_log_type_t.default.getter(v17);
  if (os_log_type_enabled(v16, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc(12, -1);
    v20 = swift_slowAlloc(32, -1);
    v24 = v20;
    *(_DWORD *)v19 = 136315138;
    swift_bridgeObjectRetain(a3);
    v23 = sub_1000100BC(a2, a3, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v19 + 4, v19 + 12);
    swift_bridgeObjectRelease_n(a3, 3);
    _os_log_impl((void *)&_mh_execute_header, v16, v18, "Opening url %s was not successful", v19, 0xCu);
    swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1, -1);
    swift_slowDealloc(v19, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(a3, 2);
  }
}

void sub_1000045B8()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;

  if (*(_QWORD *)&v0[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_presentedPTIdentifier + 8]
    && (v1 = (void *)CAFUIPunchthroughState.buttonForCurrentState(title:)((Swift::String_optional)0)) != 0)
  {
    v2 = v1;
    objc_msgSend(v1, "addTarget:action:forControlEvents:", v0, "dismissPT", 64);
    v3 = objc_msgSend(v0, "navigationItem");
    v4 = objc_msgSend(objc_allocWithZone((Class)UIBarButtonItem), "initWithCustomView:", v2);
    objc_msgSend(v3, "setRightBarButtonItem:");

  }
  else
  {
    v4 = objc_msgSend(v0, "navigationItem");
    objc_msgSend(v4, "setRightBarButtonItem:", 0);
  }

}

uint64_t sub_1000046AC()
{
  char *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t result;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, unint64_t, void (*)(char), uint64_t);
  char *v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)&v0[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_presentedPTIdentifier + 8];
  if (v1)
  {
    v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_presentedPTIdentifier];
    v3 = qword_100027CD0;
    swift_bridgeObjectRetain(*(_QWORD *)&v0[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_presentedPTIdentifier
                                          + 8]);
    if (v3 != -1)
      swift_once(&qword_100027CD0, sub_10000B1A8);
    v4 = qword_100029050;
    v5 = swift_bridgeObjectRetain_n(v1, 2);
    v6 = static os_log_type_t.default.getter(v5);
    if (os_log_type_enabled(v4, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(12, -1);
      v8 = swift_slowAlloc(32, -1);
      v18 = v8;
      *(_DWORD *)v7 = 136315138;
      swift_bridgeObjectRetain(v1);
      v17 = sub_1000100BC(v2, v1, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18, v7 + 4, v7 + 12);
      swift_bridgeObjectRelease_n(v1, 3);
      _os_log_impl((void *)&_mh_execute_header, v4, v6, "Requesting dismissal of PT with identifier %s", v7, 0xCu);
      swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v8, -1, -1);
      swift_slowDealloc(v7, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(v1, 2);
    }
    v13 = *(_QWORD *)&v0[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_requestContentManager];
    v14 = swift_allocObject(&unk_100020D80, 24, 7);
    *(_QWORD *)(v14 + 16) = v0;
    v15 = *(void (**)(uint64_t, unint64_t, void (*)(char), uint64_t))(*(_QWORD *)v13 + 128);
    v16 = v0;
    v15(v2, v1, sub_10000583C, v14);
    swift_bridgeObjectRelease(v1);
    return swift_release(v14);
  }
  else
  {
    if (qword_100027CD0 != -1)
      swift_once(&qword_100027CD0, sub_10000B1A8);
    v9 = qword_100029050;
    v10 = ((uint64_t (*)(void))static os_log_type_t.default.getter)();
    result = os_log_type_enabled(v9, v10);
    if ((_DWORD)result)
    {
      v12 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Not dismissing PT - it wasn't visible.", v12, 2u);
      return swift_slowDealloc(v12, -1, -1);
    }
  }
  return result;
}

void sub_100004954(char a1, uint64_t a2)
{
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;

  if ((a1 & 1) != 0)
  {
    if (qword_100027CD0 != -1)
      swift_once(&qword_100027CD0, sub_10000B1A8);
    v3 = qword_100029050;
    v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Dismissal of PT was successful!", v5, 2u);
      swift_slowDealloc(v5, -1, -1);
    }
    v6 = (_QWORD *)(a2 + OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_presentedPTIdentifier);
    v7 = *(_QWORD *)(a2 + OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_presentedPTIdentifier + 8);
    *v6 = 0;
    v6[1] = 0;
    swift_bridgeObjectRelease(v7);
    sub_1000045B8();
  }
  else
  {
    if (qword_100027CD0 != -1)
      swift_once(&qword_100027CD0, sub_10000B1A8);
    v8 = qword_100029050;
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Dismissal of PT was not successful.", v10, 2u);
      swift_slowDealloc(v10, -1, -1);
    }
  }
}

void sub_100004FB0()
{
  _swift_stdlib_reportUnimplementedInitializer("AutoSettings.VSNotificationDetailViewController", 47, "init(style:)", 12, 0);
  __break(1u);
}

uint64_t sub_100004FDC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_requestContentManager));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions));
  return swift_bridgeObjectRelease(*(_QWORD *)(v0
                                             + OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_presentedPTIdentifier
                                             + 8));
}

id sub_10000502C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VSNotificationDetailViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t variable initialization expression of VSRootViewController.notificationListItem()
{
  return 0;
}

uint64_t type metadata accessor for VSNotificationDetailViewController()
{
  return objc_opt_self(_TtC12AutoSettings34VSNotificationDetailViewController);
}

void type metadata accessor for CAFNotificationSeverity(uint64_t a1)
{
  sub_100005AAC(a1, &qword_100027E50, (uint64_t)&unk_100020CD8);
}

uint64_t initializeBufferWithCopyOfBuffer for CAFNotificationActionRow(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for CAFNotificationActionRow(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  return swift_bridgeObjectRelease(a1[5]);
}

uint64_t initializeWithCopy for CAFNotificationActionRow(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t assignWithCopy for CAFNotificationActionRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

__n128 initializeWithTake for CAFNotificationActionRow(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CAFNotificationActionRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease(v9);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for CAFNotificationActionRow(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CAFNotificationActionRow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
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
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CAFNotificationActionRow()
{
  return &type metadata for CAFNotificationActionRow;
}

uint64_t sub_100005364()
{
  return sub_100005B1C(&qword_100027E58, (uint64_t (*)(uint64_t))type metadata accessor for CAFNotificationSeverity, (uint64_t)&unk_10001803C);
}

Swift::Int sub_100005390()
{
  Swift::UInt8 *v0;
  Swift::UInt8 v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000053D4()
{
  Swift::UInt8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_1000053FC(uint64_t a1)
{
  Swift::UInt8 *v1;
  Swift::UInt8 v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10000543C(uint64_t a1, uint64_t a2)
{
  return sub_100005504(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100005448(uint64_t a1)
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

Swift::Int sub_100005488(uint64_t a1)
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

uint64_t sub_1000054F8(uint64_t a1, uint64_t a2)
{
  return sub_100005504(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100005504(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_100005540(uint64_t a1, id *a2)
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

uint64_t sub_1000055B4(uint64_t a1, id *a2)
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

uint64_t sub_100005630@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

BOOL sub_100005670(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unsigned __int8 *sub_100005684@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_100005694(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t sub_1000056A0(_QWORD *a1, uint64_t *a2)
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

uint64_t sub_100005728@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100005750@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100005794(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100005B1C((unint64_t *)&qword_100027EA8, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100018214);
  v3 = sub_100005B1C((unint64_t *)&unk_100027EB0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100018168);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005818()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10000583C(char a1)
{
  uint64_t v1;

  sub_100004954(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_100005844()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));

  return swift_deallocObject(v0, 56, 7);
}

void sub_100005878(char a1)
{
  uint64_t v1;

  sub_100004204(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t sub_100005888(uint64_t *a1)
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

uint64_t sub_1000058C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a6);
    return swift_bridgeObjectRelease(a4);
  }
  return result;
}

uint64_t sub_100005904(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_10000593C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  objc_class *ObjCClassFromMetadata;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t result;

  v3 = type metadata accessor for VSNotificationHeaderView();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v5 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v7 = v6;

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  v9 = objc_msgSend(a1, "dequeueReusableHeaderFooterViewWithIdentifier:", v8);

  if (v9)
  {
    v10 = swift_dynamicCastClass(v9, v3);
    if (v10)
    {
      v11 = v10;
      v12 = *(void **)(v1 + OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_notification);
      v13 = *(void **)(v10 + OBJC_IVAR____TtC12AutoSettings24VSNotificationHeaderView_notificationItem);
      *(_QWORD *)(v10 + OBJC_IVAR____TtC12AutoSettings24VSNotificationHeaderView_notificationItem) = v12;
      v14 = v12;

      sub_100016248();
      return v11;
    }

  }
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000018, 0x8000000100018920, "AutoSettings/VSNotificationDetailViewController.swift", 53, 2, 143, 0);
  __break(1u);
  return result;
}

void type metadata accessor for CAFSettingsCategory(uint64_t a1)
{
  sub_100005AAC(a1, &qword_100027E80, (uint64_t)&unk_100020DD0);
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
  sub_100005AAC(a1, &qword_100027E88, (uint64_t)&unk_100020DF0);
}

void sub_100005AAC(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_100005AF0()
{
  return sub_100005B1C(&qword_100027E90, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10001812C);
}

uint64_t sub_100005B1C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100005B5C()
{
  return sub_100005B1C(&qword_100027E98, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100018100);
}

uint64_t sub_100005B88()
{
  return sub_100005B1C(&qword_100027EA0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10001819C);
}

void sub_100005BB8()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;

  v1 = objc_msgSend(v0, "historicalNotifications");
  if (!v1)
    return;
  v2 = v1;
  v3 = sub_100005904(0, &qword_100028040, CAFHistoricalNotification_ptr);
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  if (!((unint64_t)v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_4;
LABEL_18:
    swift_bridgeObjectRelease(v4);
    return;
  }
  if (v4 < 0)
    v11 = v4;
  else
    v11 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v4);
  v5 = _CocoaArrayWrapper.endIndex.getter(v11);
  swift_bridgeObjectRelease(v4);
  if (!v5)
    goto LABEL_18;
LABEL_4:
  if (v5 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v5; ++i)
    {
      if ((v4 & 0xC000000000000001) != 0)
        v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v4);
      else
        v9 = *(id *)(v4 + 8 * i + 32);
      v10 = v9;
      if ((objc_msgSend(v9, "hidden") & 1) != 0)
      {

      }
      else
      {
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        v7 = _swiftEmptyArrayStorage[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v7);
        v8 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v7, v10);
        specialized ContiguousArray._endMutation()(v8);
      }
    }
    swift_bridgeObjectRelease(v4);
  }
}

id sub_100005D40()
{
  char *v0;
  char *v1;
  id v2;
  Swift::String v3;
  Swift::String_optional v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;
  void *v10;
  uint64_t v11;
  uint64_t ObjCClassFromMetadata;
  uint64_t v13;
  uint64_t v14;
  NSString v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id result;
  uint64_t i;
  id v23;
  void *v24;
  uint64_t v25;
  objc_super v26;
  Swift::String v27;

  v1 = v0;
  v26.receiver = v0;
  v26.super_class = (Class)type metadata accessor for VSNotificationHistoryViewController();
  objc_msgSendSuper2(&v26, "viewDidLoad");
  v2 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v27._object = (void *)0xE000000000000000;
  v3._countAndFlagsBits = 0x4143494649544F4ELL;
  v3._object = (void *)0xED0000534E4F4954;
  v4.value._countAndFlagsBits = 0x747465536F747541;
  v4.value._object = (void *)0xEC00000073676E69;
  v5._countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  v27._countAndFlagsBits = 0;
  v6 = NSLocalizedString(_:tableName:bundle:value:comment:)(v3, v4, (NSBundle)v2, v5, v27);

  String.init(format:_:)(v6._countAndFlagsBits, v6._object, _swiftEmptyArrayStorage);
  v8 = v7;
  swift_bridgeObjectRelease(v6._object);
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  objc_msgSend(v1, "setTitle:", v9);

  v10 = *(void **)&v1[direct field offset for CAFUITableViewController.tableView];
  objc_msgSend(v10, "setDataSource:", v1);
  objc_msgSend(v10, "setDelegate:", v1);
  v11 = type metadata accessor for VSNotificationTableCell();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v11);
  static CAFUICellProtocol.reuseIdentifier.getter(v11, &protocol witness table for CAFUITableCell);
  v14 = v13;
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", ObjCClassFromMetadata, v15);

  v16 = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_notificationHistory], "historicalNotifications");
  if (!v16)
    return sub_100006034();
  v17 = v16;
  v18 = sub_100005904(0, &qword_100028040, CAFHistoricalNotification_ptr);
  v19 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v17, v18);

  if (!((unint64_t)v19 >> 62))
  {
    v20 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = (id)swift_bridgeObjectRetain(v19);
    if (v20)
      goto LABEL_4;
LABEL_14:
    swift_bridgeObjectRelease_n(v19, 2);
    return sub_100006034();
  }
  if (v19 < 0)
    v25 = v19;
  else
    v25 = v19 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v19);
  result = (id)_CocoaArrayWrapper.endIndex.getter(v25);
  v20 = (uint64_t)result;
  if (!result)
    goto LABEL_14;
LABEL_4:
  if (v20 >= 1)
  {
    for (i = 0; i != v20; ++i)
    {
      if ((v19 & 0xC000000000000001) != 0)
        v23 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v19);
      else
        v23 = *(id *)(v19 + 8 * i + 32);
      v24 = v23;
      objc_msgSend(v23, "registerObserver:", v1);

    }
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

id sub_100006034()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  Swift::UInt8 v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  int64_t v40;
  uint64_t v41;
  Swift::UInt8 v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v47;
  char v48;
  unint64_t v49;
  uint64_t v50;
  _BOOL8 v51;
  uint64_t v52;
  char v53;
  unint64_t v54;
  char v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  id result;
  uint64_t v60;
  uint64_t v61;
  int64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65[4];
  _QWORD *v66;

  sub_100005BB8();
  v1 = v0;
  v66 = &_swiftEmptyDictionarySingleton;
  if (v0 >> 62)
    goto LABEL_22;
  v2 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    v3 = &_swiftEmptyDictionarySingleton;
    v4 = 4;
    while (1)
    {
      v9 = (v1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, v1)
         : *(id *)(v1 + 8 * v4);
      v10 = v9;
      v11 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v12 = objc_msgSend(v9, "notificationSeverity");
      v14 = sub_100010778(v12);
      v15 = v3[2];
      v16 = (v13 & 1) == 0;
      v17 = v15 + v16;
      if (__OFADD__(v15, v16))
        goto LABEL_20;
      v18 = v13;
      if (v3[3] < v17)
      {
        sub_100007608(v17, 1);
        v3 = v66;
        v19 = sub_100010778(v12);
        if ((v18 & 1) != (v20 & 1))
          goto LABEL_69;
        v14 = v19;
      }
      if ((v18 & 1) != 0)
      {
        v5 = (_QWORD *)(v3[7] + 8 * v14);
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        v7 = *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v6 = *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v7 >= v6 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v6 > 1, v7 + 1, 1);
        v8 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v7, v10);
        specialized Array._endMutation()(v8);
      }
      else
      {
        v21 = sub_100005888(&qword_100028038);
        v22 = swift_allocObject(v21, 40, 7);
        *(_OWORD *)(v22 + 16) = xmmword_100018260;
        *(_QWORD *)(v22 + 32) = v10;
        v65[0] = v22;
        specialized Array._endMutation()(v22);
        v23 = v65[0];
        v3[(v14 >> 6) + 8] |= 1 << v14;
        *(_BYTE *)(v3[6] + v14) = v12;
        *(_QWORD *)(v3[7] + 8 * v14) = v23;
        v24 = v3[2];
        v25 = __OFADD__(v24, 1);
        v26 = v24 + 1;
        if (v25)
          goto LABEL_21;
        v3[2] = v26;
      }
      ++v4;
      if (v11 == v2)
        goto LABEL_27;
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    if (v1 < 0)
      v27 = v1;
    else
      v27 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v27);
    swift_bridgeObjectRelease(v1);
  }
  v3 = &_swiftEmptyDictionarySingleton;
LABEL_27:
  swift_bridgeObjectRelease(v1);
  v28 = (_QWORD *)(v60 + OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_notificationsBySeverity);
  swift_beginAccess(v60 + OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_notificationsBySeverity, &v66, 1, 0);
  v29 = *v28;
  *v28 = v3;
  swift_bridgeObjectRelease(v29);
  v61 = *v28 + 64;
  v30 = 1 << *(_BYTE *)(*v28 + 32);
  v31 = -1;
  if (v30 < 64)
    v31 = ~(-1 << v30);
  v32 = v31 & *(_QWORD *)(*v28 + 64);
  v62 = (unint64_t)(v30 + 63) >> 6;
  v63 = *v28;
  swift_bridgeObjectRetain(*v28);
  v33 = 0;
  while (1)
  {
    if (v32)
    {
      v37 = __clz(__rbit64(v32));
      v32 &= v32 - 1;
      v38 = v37 | (v33 << 6);
    }
    else
    {
      v25 = __OFADD__(v33++, 1);
      if (v25)
        goto LABEL_67;
      if (v33 >= v62)
      {
LABEL_64:
        swift_release(v63);
        return objc_msgSend(*(id *)(v60 + direct field offset for CAFUITableViewController.tableView), "reloadData");
      }
      v39 = *(_QWORD *)(v61 + 8 * v33);
      if (!v39)
      {
        v40 = v33 + 1;
        if (v33 + 1 >= v62)
          goto LABEL_64;
        v39 = *(_QWORD *)(v61 + 8 * v40);
        if (!v39)
        {
          v40 = v33 + 2;
          if (v33 + 2 >= v62)
            goto LABEL_64;
          v39 = *(_QWORD *)(v61 + 8 * v40);
          if (!v39)
          {
            v40 = v33 + 3;
            if (v33 + 3 >= v62)
              goto LABEL_64;
            v39 = *(_QWORD *)(v61 + 8 * v40);
            if (!v39)
            {
              while (1)
              {
                v33 = v40 + 1;
                if (__OFADD__(v40, 1))
                  goto LABEL_68;
                if (v33 >= v62)
                  goto LABEL_64;
                v39 = *(_QWORD *)(v61 + 8 * v33);
                ++v40;
                if (v39)
                  goto LABEL_44;
              }
            }
          }
        }
        v33 = v40;
      }
LABEL_44:
      v32 = (v39 - 1) & v39;
      v38 = __clz(__rbit64(v39)) + (v33 << 6);
    }
    v41 = *(_QWORD *)(v63 + 56);
    v42 = *(_BYTE *)(*(_QWORD *)(v63 + 48) + v38);
    v43 = *(_QWORD *)(v41 + 8 * v38);
    if ((v43 & 0x8000000000000000) != 0 || (v43 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain_n(*(_QWORD *)(v41 + 8 * v38), 2);
      v44 = (uint64_t)sub_10000716C(v43);
      swift_bridgeObjectRelease(v43);
    }
    else
    {
      v44 = v43 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain_n(*(_QWORD *)(v41 + 8 * v38), 2);
    }
    v65[0] = v44;
    sub_1000078D8(v65);
    swift_bridgeObjectRelease(v43);
    v45 = v65[0];
    swift_beginAccess(v28, v65, 33, 0);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v28);
    v47 = *v28;
    v64 = (_QWORD *)*v28;
    *v28 = 0x8000000000000000;
    v49 = sub_100010778(v42);
    v50 = *(_QWORD *)(v47 + 16);
    v51 = (v48 & 1) == 0;
    v52 = v50 + v51;
    if (__OFADD__(v50, v51))
      break;
    v53 = v48;
    if (*(_QWORD *)(v47 + 24) >= v52)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v56 = v64;
        if ((v48 & 1) != 0)
          goto LABEL_30;
      }
      else
      {
        sub_1000079B8();
        v56 = v64;
        if ((v53 & 1) != 0)
          goto LABEL_30;
      }
    }
    else
    {
      sub_100007608(v52, isUniquelyReferenced_nonNull_native);
      v54 = sub_100010778(v42);
      if ((v53 & 1) != (v55 & 1))
        goto LABEL_69;
      v49 = v54;
      v56 = v64;
      if ((v53 & 1) != 0)
      {
LABEL_30:
        v34 = v56[7];
        v35 = 8 * v49;
        swift_bridgeObjectRelease(*(_QWORD *)(v34 + v35));
        *(_QWORD *)(v34 + v35) = v45;
        goto LABEL_31;
      }
    }
    v56[(v49 >> 6) + 8] |= 1 << v49;
    *(_BYTE *)(v56[6] + v49) = v42;
    *(_QWORD *)(v56[7] + 8 * v49) = v45;
    v57 = v56[2];
    v25 = __OFADD__(v57, 1);
    v58 = v57 + 1;
    if (v25)
      goto LABEL_66;
    v56[2] = v58;
LABEL_31:
    v36 = *v28;
    *v28 = v56;
    swift_bridgeObjectRelease(v36);
    swift_endAccess(v65);
  }
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
  swift_release(v65[0]);
  __break(1u);
LABEL_69:
  type metadata accessor for CAFNotificationSeverity(0);
  result = (id)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_1000065B4(unint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  _QWORD *v5;
  Swift::UInt8 v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t result;
  _QWORD *v11;
  _BYTE v12[24];

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_notificationsBySeverity);
  swift_beginAccess(v1 + OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_notificationsBySeverity, v12, 0, 0);
  v4 = *v3;
  swift_bridgeObjectRetain_n(*v3, 2);
  v5 = sub_100007260(v4);
  swift_bridgeObjectRelease(v4);
  v11 = v5;
  sub_100007950((uint64_t *)&v11);
  swift_bridgeObjectRelease(v4);
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v11[2] <= a1)
  {
LABEL_9:
    __break(1u);
    result = swift_release(v11);
    __break(1u);
    return result;
  }
  v6 = *((_BYTE *)v11 + a1 + 32);
  swift_release(v11);
  v7 = *v3;
  if (*(_QWORD *)(*v3 + 16) && (v8 = sub_100010778(v6), (v9 & 1) != 0))
    return swift_bridgeObjectRetain(*(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v8));
  else
    return 0;
}

void sub_1000066A8(void *a1)
{
  char *v1;
  char *v2;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _QWORD *v14;
  char *v15;
  id v16;
  void *v17;
  Class isa;

  v2 = v1;
  v4 = IndexPath.section.getter();
  v5 = sub_1000065B4(v4);
  if (!v5)
    return;
  v6 = v5;
  v7 = IndexPath.row.getter();
  if ((v6 & 0xC000000000000001) == 0)
  {
    if ((v7 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v7 < *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v8 = *(id *)(v6 + 8 * v7 + 32);
      goto LABEL_6;
    }
    __break(1u);
    return;
  }
  v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7, v6);
LABEL_6:
  v9 = v8;
  swift_bridgeObjectRelease(v6);
  v10 = sub_1000031E4();
  v11 = *((_QWORD *)v10 + 2);
  swift_bridgeObjectRelease(v10);
  if (v11 || (objc_msgSend(v9, "hasUserVisibleFullDescription") & 1) != 0)
  {
    v12 = *(_QWORD *)&v2[OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_requestContentManager];
    v13 = objc_allocWithZone((Class)type metadata accessor for VSNotificationDetailViewController());
    v13[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_didHide] = 0;
    v14 = &v13[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_presentedPTIdentifier];
    *v14 = 0;
    v14[1] = 0;
    *(_QWORD *)&v13[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_requestContentManager] = v12;
    *(_QWORD *)&v13[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_notification] = v9;
    swift_retain_n(v12, 2);
    isa = v9;
    v15 = v13;
    *(_QWORD *)&v15[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions] = sub_1000031E4();

    v9 = (void *)CAFUITableViewController.init(style:)(0);
    swift_release(v12);
    v16 = objc_msgSend(v2, "navigationController");
    if (v16)
    {
      v17 = v16;
      objc_msgSend(v16, "pushViewController:animated:", v9, 1);

    }
  }
  else
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
  }

}

uint64_t sub_100006A64(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  Class isa;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  Swift::String v30;
  void *object;
  unint64_t v32;
  unint64_t v33;

  v5 = type metadata accessor for IndexPath(0, a2, a3);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for VSNotificationTableCell();
  static CAFUICellProtocol.reuseIdentifier.getter(v9, &protocol witness table for CAFUITableCell);
  v11 = v10;
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v14 = objc_msgSend(a1, "dequeueReusableCellWithIdentifier:forIndexPath:", v12, isa);

  v15 = swift_dynamicCastClass(v14, v9);
  if (v15)
  {
    v16 = v15;
    v17 = IndexPath.section.getter();
    v18 = sub_1000065B4(v17);
    if (!v18)
    {
      (*(void (**)(char *, void *, uint64_t))(v6 + 16))(v8, a2, v5);
      v32 = 0;
      v33 = 0xE000000000000000;
      _StringGuts.grow(_:)(24);
      v26 = swift_bridgeObjectRelease(v33);
      v32 = 0xD000000000000016;
      v33 = 0x8000000100018A90;
      v29 = sub_100007124(v26, v27, v28);
      v30._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v5, v29);
      object = v30._object;
      String.append(_:)(v30);
      swift_bridgeObjectRelease(object);
      result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v32, v33, "AutoSettings/VSNotificationHistoryViewController.swift", 54, 2, 119, 0);
      goto LABEL_13;
    }
    v19 = v18;
    v14 = a2;
    v20 = IndexPath.row.getter();
    if ((v19 & 0xC000000000000001) != 0)
    {
      v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v20, v19);
      goto LABEL_7;
    }
    if ((v20 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v20 < *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v21 = *(id *)(v19 + 8 * v20 + 32);
LABEL_7:
      v22 = v21;
      swift_bridgeObjectRelease(v19);
      v23 = *(void **)(v16 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_notificationItem);
      *(_QWORD *)(v16 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_notificationItem) = v22;
      v24 = v22;

      sub_100014A78();
      return v16;
    }
    __break(1u);
  }

  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000016, 0x8000000100018900, "AutoSettings/VSNotificationHistoryViewController.swift", 54, 2, 116, 0);
LABEL_13:
  __break(1u);
  return result;
}

void sub_100007024()
{
  _swift_stdlib_reportUnimplementedInitializer("AutoSettings.VSNotificationHistoryViewController", 48, "init(style:)", 12, 0);
  __break(1u);
}

uint64_t sub_100007050()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0
                          + OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_requestContentManager));
  return swift_bridgeObjectRelease(*(_QWORD *)(v0
                                             + OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_notificationsBySeverity));
}

id sub_10000708C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VSNotificationHistoryViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for VSNotificationHistoryViewController()
{
  return objc_opt_self(_TtC12AutoSettings35VSNotificationHistoryViewController);
}

unint64_t sub_100007124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t result;
  uint64_t v4;

  result = qword_100028020;
  if (!qword_100028020)
  {
    v4 = type metadata accessor for IndexPath(255, a2, a3);
    result = swift_getWitnessTable(&protocol conformance descriptor for IndexPath, v4);
    atomic_store(result, (unint64_t *)&qword_100028020);
  }
  return result;
}

_QWORD *sub_10000716C(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return _swiftEmptyArrayStorage;
  while (1)
  {
    if (v2 <= 0)
    {
      v4 = _swiftEmptyArrayStorage;
    }
    else
    {
      v3 = sub_100005888(&qword_100028038);
      v4 = (_QWORD *)swift_allocObject(v3, 8 * v2 + 32, 7);
      v5 = j__malloc_size(v4);
      v6 = v5 - 32;
      if (v5 < 32)
        v6 = v5 - 25;
      v4[2] = v2;
      v4[3] = (2 * (v6 >> 3)) | 1;
    }
    swift_bridgeObjectRetain(v1);
    v7 = sub_100009754((unint64_t)(v4 + 4), v2, v1);
    v1 = v8;
    swift_bridgeObjectRelease(v7);
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    if (v1 < 0)
      v9 = v1;
    else
      v9 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v9);
    swift_bridgeObjectRelease(v1);
    if (!v2)
      return _swiftEmptyArrayStorage;
  }
  return v4;
}

_QWORD *sub_100007260(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  size_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return _swiftEmptyArrayStorage;
  v3 = sub_100005888(&qword_100028028);
  v4 = swift_allocObject(v3, v1 + 32, 7);
  v5 = j__malloc_size((const void *)v4);
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = 2 * v5 - 64;
  v6 = sub_100009998(&v9, (_BYTE *)(v4 + 32), v1, a1);
  v7 = v9;
  swift_bridgeObjectRetain(a1);
  sub_100009B2C(v7);
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return (_QWORD *)v4;
}

uint64_t sub_100007334(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100005888(&qword_100028028);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
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
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100007480(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100005888(&qword_100028068);
    v11 = (_QWORD *)swift_allocObject(v10, 8 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 3);
  }
  else
  {
    v11 = _swiftEmptyArrayStorage;
  }
  v14 = (unint64_t)(v11 + 4);
  v15 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= v15 + 8 * v8)
      memmove(v11 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v15 >= v14 + 8 * v8 || v14 >= v15 + 8 * v8)
  {
    sub_100005888((uint64_t *)&unk_100028070);
    swift_arrayInitWithCopy(v11 + 4);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

Swift::Int sub_100007608(uint64_t a1, uint64_t a2)
{
  Swift::Int *v2;
  Swift::Int *v3;
  Swift::Int v5;
  uint64_t v6;
  Swift::Int result;
  Swift::Int v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  Swift::UInt8 v28;
  uint64_t v29;
  uint64_t v30;
  Swift::Int *v31;
  int64_t v32;
  _QWORD *v33;
  uint64_t v34[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100005888(&qword_1000289A0);
  result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v31 = v3;
    v9 = 0;
    v33 = (_QWORD *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v32 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v18 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v19 = v18 | (v9 << 6);
      }
      else
      {
        v20 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v32)
          goto LABEL_36;
        v21 = v33[v20];
        ++v9;
        if (!v21)
        {
          v9 = v20 + 1;
          if (v20 + 1 >= v32)
            goto LABEL_36;
          v21 = v33[v9];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v32)
            {
LABEL_36:
              if ((a2 & 1) == 0)
              {
                result = swift_release(v5);
                v3 = v31;
                goto LABEL_43;
              }
              v30 = 1 << *(_BYTE *)(v5 + 32);
              if (v30 >= 64)
                bzero(v33, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v33 = -1 << v30;
              v3 = v31;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v33[v22];
            if (!v21)
            {
              while (1)
              {
                v9 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_45;
                if (v9 >= v32)
                  goto LABEL_36;
                v21 = v33[v9];
                ++v22;
                if (v21)
                  goto LABEL_33;
              }
            }
            v9 = v22;
          }
        }
LABEL_33:
        v12 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v9 << 6);
      }
      v27 = *(_QWORD *)(v5 + 56);
      v28 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v19);
      v29 = *(_QWORD *)(v27 + 8 * v19);
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain(*(_QWORD *)(v27 + 8 * v19));
      Hasher.init(_seed:)(v34, *(_QWORD *)(v8 + 40));
      Hasher._combine(_:)(v28);
      result = Hasher._finalize()();
      v14 = -1 << *(_BYTE *)(v8 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_44;
          }
          v25 = v16 == v24;
          if (v16 == v24)
            v16 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v26 == -1);
        v17 = __clz(__rbit64(~v26)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_BYTE *)(*(_QWORD *)(v8 + 48) + v17) = v28;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v17) = v29;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
LABEL_43:
  *v3 = v8;
  return result;
}

uint64_t sub_1000078D8(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a1);
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v2 = sub_100009970(v2);
    *a1 = v2;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v7[0] = v2 + 32;
  v7[1] = v4;
  sub_100007B58(v7);
  return specialized ContiguousArray._endMutation()(v5);
}

Swift::Int sub_100007950(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  Swift::Int result;
  _QWORD v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v2 = sub_100009984(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_100008530(v5);
  *a1 = v2;
  return result;
}

void *sub_1000079B8()
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
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  sub_100005888(&qword_1000289A0);
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
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v15) = v16;
    result = (void *)swift_bridgeObjectRetain(v16);
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_100007B58(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  Swift::Int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  Swift::Int v17;
  void *v18;
  char *v19;
  id v20;
  id v21;
  uint64_t v22;
  char *v23;
  id v24;
  char *v25;
  void (*v26)(char *, uint64_t);
  id *v27;
  Swift::Int v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  char *v33;
  uint64_t v34;
  id v35;
  char *v36;
  void (*v37)(char *, uint64_t);
  uint64_t *v38;
  Swift::Int v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  Swift::Int v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  Swift::Int v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  char *v53;
  id v54;
  char *v55;
  uint64_t v56;
  void (*v57)(char *, uint64_t);
  void *v58;
  unint64_t v59;
  unint64_t v60;
  char *v61;
  char *v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  unint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  char v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  BOOL v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  char *v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t v124;
  Swift::Int v125;
  char *v126;
  void (*v127)(char *, uint64_t);
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void **v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  char *v136;
  uint64_t v137;
  id v138;
  uint64_t v139;

  v2 = sub_100005888((uint64_t *)&unk_100027E70);
  v134 = *(_QWORD *)(v2 - 8);
  v3 = __chkstk_darwin(v2);
  v136 = (char *)&v121 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v135 = (char *)&v121 - v5;
  v6 = a1[1];
  v7 = _minimumMergeRunLength(_:)(v6);
  if (v7 >= v6)
  {
    if (v6 < 0)
      goto LABEL_135;
    if (v6)
      sub_100008BAC(0, v6, 1, a1);
    return;
  }
  if (v6 >= 0)
    v8 = v6;
  else
    v8 = v6 + 1;
  if (v6 < -1)
    goto LABEL_143;
  v125 = v7;
  v122 = a1;
  if (v6 < 2)
  {
    v12 = (char *)_swiftEmptyArrayStorage;
    v139 = (uint64_t)_swiftEmptyArrayStorage;
    v132 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v6 != 1)
    {
      v15 = _swiftEmptyArrayStorage[2];
LABEL_101:
      v112 = v133;
      if (v15 >= 2)
      {
        v113 = *v122;
        do
        {
          v114 = v15 - 2;
          if (v15 < 2)
            goto LABEL_130;
          if (!v113)
            goto LABEL_142;
          v103 = v12;
          v115 = v12 + 32;
          v116 = *(_QWORD *)&v12[16 * v114 + 32];
          v117 = *(_QWORD *)&v12[16 * v15 + 24];
          sub_100008DCC((void **)(v113 + 8 * v116), (char *)(v113 + 8 * *(_QWORD *)&v115[16 * v15 - 16]), (id *)(v113 + 8 * v117), v132);
          if (v112)
            goto LABEL_98;
          if (v117 < v116)
            goto LABEL_131;
          if ((swift_isUniquelyReferenced_nonNull_native(v103) & 1) == 0)
            v103 = sub_100009740((uint64_t)v103);
          if (v114 >= *((_QWORD *)v103 + 2))
            goto LABEL_132;
          v118 = &v103[16 * v114 + 32];
          *(_QWORD *)v118 = v116;
          *((_QWORD *)v118 + 1) = v117;
          v119 = *((_QWORD *)v103 + 2);
          if (v15 > v119)
            goto LABEL_133;
          v12 = v103;
          memmove(&v103[16 * v15 + 16], &v103[16 * v15 + 32], 16 * (v119 - v15));
          *((_QWORD *)v103 + 2) = v119 - 1;
          v15 = v119 - 1;
        }
        while (v119 > 2);
      }
      v111 = v12;
LABEL_113:
      v120 = swift_bridgeObjectRelease(v111);
      *(_QWORD *)((v139 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()(v120);
      swift_bridgeObjectRelease(v139);
      return;
    }
  }
  else
  {
    v9 = v8 >> 1;
    v10 = sub_100005904(0, &qword_100028040, CAFHistoricalNotification_ptr);
    v11 = static Array._allocateBufferUninitialized(minimumCapacity:)(v9, v10);
    *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) = v9;
    v132 = (void **)((v11 & 0xFFFFFFFFFFFFFF8) + 32);
    v139 = v11;
  }
  v13 = 0;
  v14 = *a1;
  v124 = *a1 + 16;
  v12 = (char *)_swiftEmptyArrayStorage;
  v123 = v14 - 8;
  v129 = v6;
  v137 = v14;
  while (1)
  {
    v16 = v13;
    v17 = v13 + 1;
    v130 = v13;
    if (v13 + 1 < v6)
    {
      v18 = *(void **)(v14 + 8 * v13);
      v19 = (char *)*(id *)(v14 + 8 * v17);
      v126 = v19;
      v20 = v18;
      v21 = objc_msgSend(v19, "timestamp");
      v22 = sub_100005904(0, (unint64_t *)&unk_100028620, NSUnitDuration_ptr);
      v23 = v135;
      static Measurement._unconditionallyBridgeFromObjectiveC(_:)(v21, v22);

      v24 = objc_msgSend(v20, "timestamp");
      v25 = v136;
      v131 = v22;
      static Measurement._unconditionallyBridgeFromObjectiveC(_:)(v24, v22);

      v128 = sub_100009B7C(&qword_100028060, (uint64_t *)&unk_100027E70, (uint64_t)&protocol conformance descriptor for Measurement<A>);
      LODWORD(v138) = dispatch thunk of static Comparable.< infix(_:_:)(v25, v23, v2, v128);
      v26 = *(void (**)(char *, uint64_t))(v134 + 8);
      v26(v25, v2);
      v127 = v26;
      v26(v23, v2);

      v17 = v16 + 2;
      if (v16 + 2 < v6)
      {
        v126 = v12;
        v27 = (id *)(v124 + 8 * v16);
        while (1)
        {
          v28 = v17;
          v29 = *(v27 - 1);
          v30 = *v27;
          v31 = v29;
          v32 = objc_msgSend(v30, "timestamp");
          v33 = v135;
          v34 = v131;
          static Measurement._unconditionallyBridgeFromObjectiveC(_:)(v32, v131);

          v35 = objc_msgSend(v31, "timestamp");
          v36 = v136;
          static Measurement._unconditionallyBridgeFromObjectiveC(_:)(v35, v34);

          LODWORD(v35) = dispatch thunk of static Comparable.< infix(_:_:)(v36, v33, v2, v128);
          v37 = v127;
          v127(v36, v2);
          v37(v33, v2);

          if (((v138 ^ v35) & 1) != 0)
            break;
          v17 = v28 + 1;
          ++v27;
          v6 = v129;
          if (v129 == v28 + 1)
          {
            v17 = v129;
            v12 = v126;
            goto LABEL_22;
          }
        }
        v12 = v126;
        v6 = v129;
        v17 = v28;
LABEL_22:
        v16 = v130;
      }
      v14 = v137;
      if ((v138 & 1) != 0)
      {
        if (v17 < v16)
          goto LABEL_136;
        if (v16 < v17)
        {
          v38 = (uint64_t *)(v123 + 8 * v17);
          v39 = v17;
          v40 = v16;
          v41 = (uint64_t *)(v137 + 8 * v16);
          do
          {
            if (v40 != --v39)
            {
              if (!v14)
                goto LABEL_141;
              v42 = *v41;
              *v41 = *v38;
              *v38 = v42;
            }
            ++v40;
            --v38;
            ++v41;
          }
          while (v40 < v39);
        }
      }
    }
    if (v17 < v6)
    {
      if (__OFSUB__(v17, v16))
        goto LABEL_134;
      if (v17 - v16 < v125)
        break;
    }
LABEL_50:
    if (v17 < v16)
      goto LABEL_129;
    if ((swift_isUniquelyReferenced_nonNull_native(v12) & 1) == 0)
      v12 = sub_100009510(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v60 = *((_QWORD *)v12 + 2);
    v59 = *((_QWORD *)v12 + 3);
    v15 = v60 + 1;
    v14 = v137;
    if (v60 >= v59 >> 1)
    {
      v110 = sub_100009510((char *)(v59 > 1), v60 + 1, 1, v12);
      v14 = v137;
      v12 = v110;
    }
    *((_QWORD *)v12 + 2) = v15;
    v61 = &v12[16 * v60 + 32];
    *(_QWORD *)v61 = v16;
    *((_QWORD *)v61 + 1) = v17;
    v138 = (id)v17;
    if (v60)
    {
      v62 = v12 + 32;
      while (1)
      {
        v63 = v15 - 1;
        if (v15 >= 4)
        {
          v68 = &v62[16 * v15];
          v69 = *((_QWORD *)v68 - 8);
          v70 = *((_QWORD *)v68 - 7);
          v74 = __OFSUB__(v70, v69);
          v71 = v70 - v69;
          if (v74)
            goto LABEL_118;
          v73 = *((_QWORD *)v68 - 6);
          v72 = *((_QWORD *)v68 - 5);
          v74 = __OFSUB__(v72, v73);
          v66 = v72 - v73;
          v67 = v74;
          if (v74)
            goto LABEL_119;
          v75 = v15 - 2;
          v76 = &v62[16 * v15 - 32];
          v78 = *(_QWORD *)v76;
          v77 = *((_QWORD *)v76 + 1);
          v74 = __OFSUB__(v77, v78);
          v79 = v77 - v78;
          if (v74)
            goto LABEL_121;
          v74 = __OFADD__(v66, v79);
          v80 = v66 + v79;
          if (v74)
            goto LABEL_124;
          if (v80 >= v71)
          {
            v98 = &v62[16 * v63];
            v100 = *(_QWORD *)v98;
            v99 = *((_QWORD *)v98 + 1);
            v74 = __OFSUB__(v99, v100);
            v101 = v99 - v100;
            if (v74)
              goto LABEL_128;
            v91 = v66 < v101;
            goto LABEL_88;
          }
        }
        else
        {
          if (v15 != 3)
          {
            v92 = *((_QWORD *)v12 + 4);
            v93 = *((_QWORD *)v12 + 5);
            v74 = __OFSUB__(v93, v92);
            v85 = v93 - v92;
            v86 = v74;
            goto LABEL_82;
          }
          v65 = *((_QWORD *)v12 + 4);
          v64 = *((_QWORD *)v12 + 5);
          v74 = __OFSUB__(v64, v65);
          v66 = v64 - v65;
          v67 = v74;
        }
        if ((v67 & 1) != 0)
          goto LABEL_120;
        v75 = v15 - 2;
        v81 = &v62[16 * v15 - 32];
        v83 = *(_QWORD *)v81;
        v82 = *((_QWORD *)v81 + 1);
        v84 = __OFSUB__(v82, v83);
        v85 = v82 - v83;
        v86 = v84;
        if (v84)
          goto LABEL_123;
        v87 = &v62[16 * v63];
        v89 = *(_QWORD *)v87;
        v88 = *((_QWORD *)v87 + 1);
        v74 = __OFSUB__(v88, v89);
        v90 = v88 - v89;
        if (v74)
          goto LABEL_126;
        if (__OFADD__(v85, v90))
          goto LABEL_127;
        if (v85 + v90 >= v66)
        {
          v91 = v66 < v90;
LABEL_88:
          if (v91)
            v63 = v75;
          goto LABEL_90;
        }
LABEL_82:
        if ((v86 & 1) != 0)
          goto LABEL_122;
        v94 = &v62[16 * v63];
        v96 = *(_QWORD *)v94;
        v95 = *((_QWORD *)v94 + 1);
        v74 = __OFSUB__(v95, v96);
        v97 = v95 - v96;
        if (v74)
          goto LABEL_125;
        if (v97 < v85)
          goto LABEL_14;
LABEL_90:
        v102 = v63 - 1;
        if (v63 - 1 >= v15)
        {
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
          goto LABEL_138;
        }
        if (!v14)
          goto LABEL_140;
        v103 = v12;
        v104 = &v62[16 * v102];
        v105 = *(_QWORD *)v104;
        v106 = &v62[16 * v63];
        v107 = *((_QWORD *)v106 + 1);
        v108 = v133;
        sub_100008DCC((void **)(v14 + 8 * *(_QWORD *)v104), (char *)(v14 + 8 * *(_QWORD *)v106), (id *)(v14 + 8 * v107), v132);
        v133 = v108;
        if (v108)
        {
LABEL_98:
          v111 = v103;
          goto LABEL_113;
        }
        if (v107 < v105)
          goto LABEL_115;
        if (v63 > *((_QWORD *)v103 + 2))
          goto LABEL_116;
        *(_QWORD *)v104 = v105;
        *(_QWORD *)&v62[16 * v102 + 8] = v107;
        v109 = *((_QWORD *)v103 + 2);
        if (v63 >= v109)
          goto LABEL_117;
        v12 = v103;
        v15 = v109 - 1;
        memmove(&v62[16 * v63], v106 + 16, 16 * (v109 - 1 - v63));
        *((_QWORD *)v103 + 2) = v109 - 1;
        v14 = v137;
        if (v109 <= 2)
          goto LABEL_14;
      }
    }
    v15 = 1;
LABEL_14:
    v6 = v129;
    v13 = (uint64_t)v138;
    if ((uint64_t)v138 >= v129)
      goto LABEL_101;
  }
  if (__OFADD__(v16, v125))
    goto LABEL_137;
  if (v16 + v125 >= v6)
    v43 = v6;
  else
    v43 = v16 + v125;
  if (v43 >= v16)
  {
    if (v17 != v43)
    {
      v126 = v12;
      v44 = v123 + 8 * v17;
      v128 = v43;
      do
      {
        v45 = *(void **)(v14 + 8 * v17);
        v46 = v16;
        v131 = v44;
        while (1)
        {
          v47 = v17;
          v48 = *(void **)v44;
          v49 = v45;
          v138 = v49;
          v50 = v48;
          v51 = objc_msgSend(v49, "timestamp");
          v52 = sub_100005904(0, (unint64_t *)&unk_100028620, NSUnitDuration_ptr);
          v53 = v135;
          static Measurement._unconditionallyBridgeFromObjectiveC(_:)(v51, v52);

          v54 = objc_msgSend(v50, "timestamp");
          v55 = v136;
          static Measurement._unconditionallyBridgeFromObjectiveC(_:)(v54, v52);

          v56 = sub_100009B7C(&qword_100028060, (uint64_t *)&unk_100027E70, (uint64_t)&protocol conformance descriptor for Measurement<A>);
          LOBYTE(v54) = dispatch thunk of static Comparable.< infix(_:_:)(v55, v53, v2, v56);
          v57 = *(void (**)(char *, uint64_t))(v134 + 8);
          v57(v55, v2);
          v57(v53, v2);

          if ((v54 & 1) == 0)
            break;
          v14 = v137;
          if (!v137)
            goto LABEL_139;
          v17 = v47;
          v58 = *(void **)v44;
          v45 = *(void **)(v44 + 8);
          *(_QWORD *)v44 = v45;
          *(_QWORD *)(v44 + 8) = v58;
          v44 -= 8;
          if (v47 == ++v46)
            goto LABEL_43;
        }
        v14 = v137;
        v17 = v47;
LABEL_43:
        ++v17;
        v16 = v130;
        v44 = v131 + 8;
      }
      while (v17 != v128);
      v17 = v128;
      v12 = v126;
    }
    goto LABEL_50;
  }
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
}

Swift::Int sub_100008530(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  Swift::Int v3;
  Swift::Int result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  Swift::Int v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  Swift::Int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  Swift::Int v19;
  Swift::Int v20;
  char v21;
  Swift::Int v22;
  _BYTE *v23;
  unsigned int v24;
  Swift::Int v25;
  _BYTE *v26;
  unsigned int v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  char v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unsigned int v84;
  uint64_t v85;
  unsigned int v86;
  uint64_t v87;
  unint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  unint64_t v93;
  _QWORD *v94;
  _QWORD *v95;
  Swift::Int v96;
  Swift::Int v97;
  uint64_t v98;
  unsigned __int8 *__dst;

  v2 = a1;
  v3 = a1[1];
  result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if ((unint64_t)v3 < 2)
        return result;
      v81 = 0;
      v82 = *v2;
      v83 = 1;
      while (1)
      {
        v84 = *(unsigned __int8 *)(v82 + v83);
        v85 = v81;
        do
        {
          v86 = *(unsigned __int8 *)(v82 + v85);
          if (v86 >= v84)
            break;
          if (!v82)
            goto LABEL_143;
          *(_BYTE *)(v82 + v85 + 1) = v86;
          *(_BYTE *)(v82 + v85--) = v84;
        }
        while (v85 != -1);
        ++v83;
        ++v81;
        if (v83 == v3)
          return result;
      }
    }
    goto LABEL_139;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
  {
LABEL_148:
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
    __break(1u);
    return result;
  }
  v96 = result;
  v97 = v3;
  if (v3 < 2)
  {
    v9 = _swiftEmptyArrayStorage;
    __dst = (unsigned __int8 *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      v13 = _swiftEmptyArrayStorage[2];
      v12 = (char *)_swiftEmptyArrayStorage;
      goto LABEL_104;
    }
    v95 = _swiftEmptyArrayStorage;
  }
  else
  {
    v6 = v5 >> 1;
    type metadata accessor for CAFNotificationSeverity(0);
    v8 = static Array._allocateBufferUninitialized(minimumCapacity:)(v6, v7);
    *(_QWORD *)(v8 + 16) = v6;
    v3 = v97;
    v95 = (_QWORD *)v8;
    __dst = (unsigned __int8 *)(v8 + 32);
  }
  v10 = 0;
  v94 = v2;
  v11 = *v2;
  v12 = (char *)_swiftEmptyArrayStorage;
  v98 = *v2;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = *(unsigned __int8 *)(v11 + v10);
      v16 = *(unsigned __int8 *)(v11 + v14);
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v17 = v15;
        while (1)
        {
          v18 = *(unsigned __int8 *)(v11 + v10);
          if (v16 < v15 == v17 >= v18)
            break;
          ++v10;
          v17 = v18;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v16 < v15)
      {
        if (v10 < v14)
          goto LABEL_140;
        if (v14 < v10)
        {
          v19 = v10 - 1;
          v20 = v14;
          do
          {
            if (v20 != v19)
            {
              if (!v11)
                goto LABEL_146;
              v21 = *(_BYTE *)(v11 + v20);
              *(_BYTE *)(v11 + v20) = *(_BYTE *)(v11 + v19);
              *(_BYTE *)(v11 + v19) = v21;
            }
            v60 = ++v20 < v19--;
          }
          while (v60);
        }
      }
    }
    if (v10 < v3)
    {
      if (__OFSUB__(v10, v14))
        goto LABEL_138;
      if (v10 - v14 < v96)
      {
        v22 = v14 + v96;
        if (__OFADD__(v14, v96))
          goto LABEL_141;
        if (v22 >= v3)
          v22 = v3;
        if (v22 < v14)
          goto LABEL_142;
        if (v10 != v22)
        {
          v23 = (_BYTE *)(v11 + v10);
          do
          {
            v24 = *(unsigned __int8 *)(v11 + v10);
            v25 = v14;
            v26 = v23;
            do
            {
              v27 = *(v26 - 1);
              if (v27 >= v24)
                break;
              if (!v11)
                goto LABEL_144;
              *v26 = v27;
              *--v26 = v24;
              ++v25;
            }
            while (v10 != v25);
            ++v10;
            ++v23;
          }
          while (v10 != v22);
          v10 = v22;
        }
      }
    }
    if (v10 < v14)
    {
LABEL_133:
      __break(1u);
      goto LABEL_134;
    }
    if ((swift_isUniquelyReferenced_nonNull_native(v12) & 1) == 0)
      v12 = sub_100009510(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v29 = *((_QWORD *)v12 + 2);
    v28 = *((_QWORD *)v12 + 3);
    v13 = v29 + 1;
    v11 = v98;
    if (v29 >= v28 >> 1)
    {
      v78 = sub_100009510((char *)(v28 > 1), v29 + 1, 1, v12);
      v11 = v98;
      v12 = v78;
    }
    *((_QWORD *)v12 + 2) = v13;
    v30 = v12 + 32;
    v31 = &v12[16 * v29 + 32];
    *(_QWORD *)v31 = v14;
    *((_QWORD *)v31 + 1) = v10;
    if (v29)
      break;
    v13 = 1;
LABEL_15:
    v3 = v97;
    if (v10 >= v97)
    {
      v2 = v94;
      v9 = v95;
LABEL_104:
      v95 = v9;
      if (v13 < 2)
      {
LABEL_115:
        v80 = v12;
        goto LABEL_116;
      }
      v87 = *v2;
      while (1)
      {
        v88 = v13 - 2;
        if (v13 < 2)
          break;
        if (!v87)
          goto LABEL_147;
        v79 = v12;
        v89 = v12 + 32;
        v90 = *(_QWORD *)&v12[16 * v88 + 32];
        v91 = *(_QWORD *)&v12[16 * v13 + 24];
        sub_1000092D8((unsigned __int8 *)(v87 + v90), (unsigned __int8 *)(v87 + *(_QWORD *)&v89[16 * v13 - 16]), v87 + v91, __dst);
        if (v1)
          goto LABEL_95;
        if (v91 < v90)
          goto LABEL_135;
        if ((swift_isUniquelyReferenced_nonNull_native(v79) & 1) == 0)
          v79 = sub_100009740((uint64_t)v79);
        if (v88 >= *((_QWORD *)v79 + 2))
          goto LABEL_136;
        v92 = &v79[16 * v88 + 32];
        *(_QWORD *)v92 = v90;
        *((_QWORD *)v92 + 1) = v91;
        v93 = *((_QWORD *)v79 + 2);
        if (v13 > v93)
          goto LABEL_137;
        memmove(&v79[16 * v13 + 16], &v79[16 * v13 + 32], 16 * (v93 - v13));
        v12 = v79;
        *((_QWORD *)v79 + 2) = v93 - 1;
        v13 = v93 - 1;
        if (v93 <= 2)
          goto LABEL_115;
      }
LABEL_134:
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
LABEL_138:
      __break(1u);
LABEL_139:
      __break(1u);
LABEL_140:
      __break(1u);
LABEL_141:
      __break(1u);
LABEL_142:
      __break(1u);
LABEL_143:
      __break(1u);
LABEL_144:
      __break(1u);
LABEL_145:
      __break(1u);
LABEL_146:
      __break(1u);
LABEL_147:
      __break(1u);
      goto LABEL_148;
    }
  }
  while (1)
  {
    v32 = v13 - 1;
    if (v13 >= 4)
    {
      v37 = &v30[16 * v13];
      v38 = *((_QWORD *)v37 - 8);
      v39 = *((_QWORD *)v37 - 7);
      v43 = __OFSUB__(v39, v38);
      v40 = v39 - v38;
      if (v43)
        goto LABEL_122;
      v42 = *((_QWORD *)v37 - 6);
      v41 = *((_QWORD *)v37 - 5);
      v43 = __OFSUB__(v41, v42);
      v35 = v41 - v42;
      v36 = v43;
      if (v43)
        goto LABEL_123;
      v44 = v13 - 2;
      v45 = &v30[16 * v13 - 32];
      v47 = *(_QWORD *)v45;
      v46 = *((_QWORD *)v45 + 1);
      v43 = __OFSUB__(v46, v47);
      v48 = v46 - v47;
      if (v43)
        goto LABEL_125;
      v43 = __OFADD__(v35, v48);
      v49 = v35 + v48;
      if (v43)
        goto LABEL_128;
      if (v49 >= v40)
      {
        v67 = &v30[16 * v32];
        v69 = *(_QWORD *)v67;
        v68 = *((_QWORD *)v67 + 1);
        v43 = __OFSUB__(v68, v69);
        v70 = v68 - v69;
        if (v43)
          goto LABEL_132;
        v60 = v35 < v70;
        goto LABEL_84;
      }
    }
    else
    {
      if (v13 != 3)
      {
        v61 = *((_QWORD *)v12 + 4);
        v62 = *((_QWORD *)v12 + 5);
        v43 = __OFSUB__(v62, v61);
        v54 = v62 - v61;
        v55 = v43;
        goto LABEL_78;
      }
      v34 = *((_QWORD *)v12 + 4);
      v33 = *((_QWORD *)v12 + 5);
      v43 = __OFSUB__(v33, v34);
      v35 = v33 - v34;
      v36 = v43;
    }
    if ((v36 & 1) != 0)
      goto LABEL_124;
    v44 = v13 - 2;
    v50 = &v30[16 * v13 - 32];
    v52 = *(_QWORD *)v50;
    v51 = *((_QWORD *)v50 + 1);
    v53 = __OFSUB__(v51, v52);
    v54 = v51 - v52;
    v55 = v53;
    if (v53)
      goto LABEL_127;
    v56 = &v30[16 * v32];
    v58 = *(_QWORD *)v56;
    v57 = *((_QWORD *)v56 + 1);
    v43 = __OFSUB__(v57, v58);
    v59 = v57 - v58;
    if (v43)
      goto LABEL_130;
    if (__OFADD__(v54, v59))
      goto LABEL_131;
    if (v54 + v59 >= v35)
    {
      v60 = v35 < v59;
LABEL_84:
      if (v60)
        v32 = v44;
      goto LABEL_86;
    }
LABEL_78:
    if ((v55 & 1) != 0)
      goto LABEL_126;
    v63 = &v30[16 * v32];
    v65 = *(_QWORD *)v63;
    v64 = *((_QWORD *)v63 + 1);
    v43 = __OFSUB__(v64, v65);
    v66 = v64 - v65;
    if (v43)
      goto LABEL_129;
    if (v66 < v54)
      goto LABEL_15;
LABEL_86:
    v71 = v32 - 1;
    if (v32 - 1 >= v13)
    {
      __break(1u);
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      __break(1u);
LABEL_122:
      __break(1u);
LABEL_123:
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
LABEL_129:
      __break(1u);
LABEL_130:
      __break(1u);
LABEL_131:
      __break(1u);
LABEL_132:
      __break(1u);
      goto LABEL_133;
    }
    if (!v11)
      goto LABEL_145;
    v72 = &v30[16 * v71];
    v73 = *(_QWORD *)v72;
    v74 = v30;
    v75 = &v30[16 * v32];
    v76 = *((_QWORD *)v75 + 1);
    sub_1000092D8((unsigned __int8 *)(v11 + *(_QWORD *)v72), (unsigned __int8 *)(v11 + *(_QWORD *)v75), v11 + v76, __dst);
    if (v1)
      break;
    if (v76 < v73)
      goto LABEL_119;
    if (v32 > *((_QWORD *)v12 + 2))
      goto LABEL_120;
    *(_QWORD *)v72 = v73;
    *(_QWORD *)&v74[16 * v71 + 8] = v76;
    v77 = *((_QWORD *)v12 + 2);
    if (v32 >= v77)
      goto LABEL_121;
    v13 = v77 - 1;
    memmove(v75, v75 + 16, 16 * (v77 - 1 - v32));
    v30 = v74;
    *((_QWORD *)v12 + 2) = v77 - 1;
    v11 = v98;
    if (v77 <= 2)
      goto LABEL_15;
  }
  v79 = v12;
LABEL_95:
  v80 = v79;
LABEL_116:
  swift_bridgeObjectRelease(v80);
  v95[2] = 0;
  return swift_bridgeObjectRelease(v95);
}

void sub_100008BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v28 = a1;
  v7 = sub_100005888((uint64_t *)&unk_100027E70);
  v32 = *(_QWORD *)(v7 - 8);
  v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v31 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v30 = (char *)&v26 - v10;
  v27 = a2;
  if (a3 != a2)
  {
    v33 = *a4;
    v11 = v33 + 8 * a3 - 8;
    v12 = v30;
LABEL_5:
    v13 = *(void **)(v33 + 8 * a3);
    v14 = v28;
    v29 = v11;
    v34 = a3;
    while (1)
    {
      v15 = *(void **)v11;
      v16 = v13;
      v17 = v15;
      v18 = objc_msgSend(v16, "timestamp");
      v19 = sub_100005904(0, (unint64_t *)&unk_100028620, NSUnitDuration_ptr);
      static Measurement._unconditionallyBridgeFromObjectiveC(_:)(v18, v19);

      v20 = objc_msgSend(v17, "timestamp");
      v21 = v31;
      static Measurement._unconditionallyBridgeFromObjectiveC(_:)(v20, v19);

      v22 = sub_100009B7C(&qword_100028060, (uint64_t *)&unk_100027E70, (uint64_t)&protocol conformance descriptor for Measurement<A>);
      LOBYTE(v20) = dispatch thunk of static Comparable.< infix(_:_:)(v21, v12, v7, v22);
      v23 = *(void (**)(char *, uint64_t))(v32 + 8);
      v23(v21, v7);
      v23(v12, v7);
      v24 = v34;

      if ((v20 & 1) == 0)
      {
LABEL_4:
        a3 = v24 + 1;
        v11 = v29 + 8;
        if (a3 == v27)
          return;
        goto LABEL_5;
      }
      if (!v33)
        break;
      v25 = *(void **)v11;
      v13 = *(void **)(v11 + 8);
      *(_QWORD *)v11 = v13;
      *(_QWORD *)(v11 + 8) = v25;
      v11 -= 8;
      if (v24 == ++v14)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_100008DCC(void **a1, char *a2, id *a3, void **a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  char *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  id *v29;
  id *v30;
  id *v31;
  void **v32;
  void **v33;
  void **v34;
  id *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  char *v43;
  id v44;
  char *v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  id *v48;
  uint64_t result;
  uint64_t v50;
  id v51;
  void **v52;
  void **v53;
  id *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  id *v58;
  id *v59;
  void **v60;
  void **v61;
  void **v62;

  v8 = sub_100005888((uint64_t *)&unk_100027E70);
  v57 = *(_QWORD *)(v8 - 8);
  v9 = __chkstk_darwin(v8);
  v56 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v54 = a3;
  v55 = (char *)&v50 - v11;
  v12 = a2 - (char *)a1;
  v13 = a2 - (char *)a1 + 7;
  if (a2 - (char *)a1 >= 0)
    v13 = a2 - (char *)a1;
  v14 = v13 >> 3;
  v15 = (void **)a2;
  v16 = (char *)a3 - a2;
  v17 = v16 / 8;
  v62 = a1;
  v61 = a4;
  if (v13 >> 3 >= v16 / 8)
  {
    if (v16 < -7)
      goto LABEL_43;
    v32 = v15;
    if (a4 != v15 || &v15[v17] <= a4)
      memmove(a4, v15, 8 * v17);
    v33 = &a4[v17];
    v60 = v33;
    v62 = v15;
    if (a1 >= v15 || v16 < 8)
      goto LABEL_42;
    v34 = v54 - 1;
    v58 = a1;
    v59 = a4;
    while (1)
    {
      v54 = v32;
      v52 = v33;
      v53 = v34 + 1;
      v37 = *--v33;
      v36 = v37;
      v38 = *--v15;
      v39 = v36;
      v51 = v39;
      v40 = v38;
      v41 = objc_msgSend(v39, "timestamp");
      v42 = sub_100005904(0, (unint64_t *)&unk_100028620, NSUnitDuration_ptr);
      v43 = v55;
      static Measurement._unconditionallyBridgeFromObjectiveC(_:)(v41, v42);

      v44 = objc_msgSend(v40, "timestamp");
      v45 = v56;
      static Measurement._unconditionallyBridgeFromObjectiveC(_:)(v44, v42);

      v46 = sub_100009B7C(&qword_100028060, (uint64_t *)&unk_100027E70, (uint64_t)&protocol conformance descriptor for Measurement<A>);
      LOBYTE(v44) = dispatch thunk of static Comparable.< infix(_:_:)(v45, v43, v8, v46);
      v47 = *(void (**)(char *, uint64_t))(v57 + 8);
      v47(v45, v8);
      v47(v43, v8);

      if ((v44 & 1) != 0)
        break;
      v60 = v33;
      if (v53 < v52 || v34 >= v52)
      {
        *v34 = *v33;
        v15 = v54;
        goto LABEL_30;
      }
      v48 = v58;
      v35 = v59;
      if (v53 != v52)
        *v34 = *v33;
      v15 = v54;
      if (v54 <= v48)
        goto LABEL_42;
LABEL_31:
      --v34;
      v32 = v15;
      if (v33 <= v35)
        goto LABEL_42;
    }
    v33 = v52;
    if (v53 != v54 || v34 >= v54)
      *v34 = *v15;
    v62 = v15;
LABEL_30:
    v35 = v59;
    if (v15 <= v58)
      goto LABEL_42;
    goto LABEL_31;
  }
  if (v12 >= -7)
  {
    if (a4 != a1 || &a1[v14] <= a4)
      memmove(a4, a1, 8 * v14);
    v53 = &a4[v14];
    v60 = v53;
    if (v15 < v54 && v12 >= 8)
    {
      v18 = v15;
      v19 = v55;
      do
      {
        v58 = a1;
        v59 = a4;
        v20 = *a4;
        v21 = *v18;
        v22 = v20;
        v23 = objc_msgSend(v21, "timestamp");
        v24 = sub_100005904(0, (unint64_t *)&unk_100028620, NSUnitDuration_ptr);
        static Measurement._unconditionallyBridgeFromObjectiveC(_:)(v23, v24);

        v25 = objc_msgSend(v22, "timestamp");
        v26 = v56;
        static Measurement._unconditionallyBridgeFromObjectiveC(_:)(v25, v24);

        v27 = sub_100009B7C(&qword_100028060, (uint64_t *)&unk_100027E70, (uint64_t)&protocol conformance descriptor for Measurement<A>);
        LOBYTE(v24) = dispatch thunk of static Comparable.< infix(_:_:)(v26, v19, v8, v27);
        v28 = *(void (**)(char *, uint64_t))(v57 + 8);
        v28(v26, v8);
        v28(v19, v8);

        if ((v24 & 1) != 0)
        {
          v29 = v18 + 1;
          v30 = v58;
          a4 = v59;
          if (v58 < v18 || v58 >= v29 || v58 != v18)
            *v58 = *v18;
        }
        else
        {
          v30 = v58;
          v31 = v59;
          if (v58 != v59)
            *v58 = *v59;
          a4 = v31 + 1;
          v61 = a4;
          v29 = v18;
        }
        a1 = v30 + 1;
        v62 = a1;
        if (a4 >= v53)
          break;
        v18 = v29;
      }
      while (v29 < v54);
    }
LABEL_42:
    sub_100009608((void **)&v62, (const void **)&v61, &v60);
    return 1;
  }
LABEL_43:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000092D8(unsigned __int8 *__src, unsigned __int8 *a2, unint64_t a3, unsigned __int8 *__dst)
{
  unsigned __int8 *v4;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  size_t v8;
  unint64_t v9;
  unsigned __int8 *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  unsigned int v18;
  uint64_t result;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;

  v22 = __src;
  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a3 - (_QWORD)a2;
  v21 = __dst;
  if (a2 - __src >= (uint64_t)(a3 - (_QWORD)a2))
  {
    if ((v9 & 0x8000000000000000) == 0)
    {
      if (__dst != a2 || a3 <= (unint64_t)__dst)
        memmove(__dst, a2, a3 - (_QWORD)a2);
      v14 = &v4[v9];
      v20 = &v4[v9];
      v22 = v6;
      if (v7 < v6 && (unsigned __int8 *)a3 != v6)
      {
        v15 = (unsigned __int8 *)(a3 - 1);
        while (1)
        {
          v16 = v15 + 1;
          v17 = v6 - 1;
          v18 = *(v6 - 1);
          if (v18 >= *(v14 - 1))
          {
            v20 = v14 - 1;
            if (v16 < v14 || v15 >= v14 || v16 != v14)
              *v15 = *(v14 - 1);
            --v14;
            if (v6 <= v7)
              goto LABEL_38;
          }
          else
          {
            if (v16 != v6 || v15 >= v6)
              *v15 = v18;
            v22 = --v6;
            if (v17 <= v7)
              goto LABEL_38;
          }
          --v15;
          if (v14 <= v4)
            goto LABEL_38;
        }
      }
      goto LABEL_38;
    }
  }
  else if ((v8 & 0x8000000000000000) == 0)
  {
    if (__dst != __src || a2 <= __dst)
      memmove(__dst, __src, v8);
    v10 = &v4[v8];
    v20 = &v4[v8];
    if (v6 != v7 && (unint64_t)v6 < a3)
    {
      do
      {
        v11 = *v6;
        v12 = *v4;
        if (v12 >= v11)
        {
          if (v7 != v4)
            *v7 = v12;
          v21 = ++v4;
          v13 = v6;
        }
        else
        {
          v13 = v6 + 1;
          if (v7 < v6 || v7 >= v13 || v7 != v6)
            *v7 = v11;
        }
        ++v7;
        if (v4 >= v10)
          break;
        v6 = v13;
      }
      while ((unint64_t)v13 < a3);
      v22 = v7;
    }
LABEL_38:
    sub_1000096B0((void **)&v22, (const void **)&v21, &v20);
    return 1;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

char *sub_100009510(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    v10 = sub_100005888(&qword_100028030);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 16 * v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_100009608(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;
  char v9;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    v9 = 2;
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v9, 1046, 0);
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_1000096B0(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  int64_t v4;
  char *result;
  char v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 < 0)
  {
    v7 = 2;
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v7, 1046, 0);
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    if (result != v3 || result >= &v3[v4])
      return (char *)memmove(result, v3, v4);
  }
  return result;
}

char *sub_100009740(uint64_t a1)
{
  return sub_100009510(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100009754(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t i;
  void (*v13)(_QWORD *);
  id *v14;
  id v15;
  uint64_t v16;
  uint64_t result;
  void (*v18[4])(id *);

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v16 = a3;
    else
      v16 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_25;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    if (a3 < 0)
      v10 = a3;
    else
      v10 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a3);
    if (v11 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100009B7C((unint64_t *)&unk_100028050, &qword_100028048, (uint64_t)&protocol conformance descriptor for [A]);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_100005888(&qword_100028048);
          v13 = sub_100013ADC(v18, i, a3);
          v15 = *v14;
          ((void (*)(void (**)(id *), _QWORD))v13)(v18, 0);
          *(_QWORD *)(a1 + 8 * i) = v15;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100005904(0, &qword_100028040, CAFHistoricalNotification_ptr);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100009970(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_100009984(uint64_t a1)
{
  return sub_100007334(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_QWORD *sub_100009998(_QWORD *result, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;

  v4 = a4 + 64;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v8 = 0;
    a3 = 0;
LABEL_35:
    *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (_QWORD *)a3;
  }
  if (!a3)
  {
    v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v8 = 0;
  v9 = 0;
  v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(_BYTE *)(*(_QWORD *)(a4 + 48) + v12);
    if (v9 == a3)
      goto LABEL_35;
  }
  v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  if (v14)
    goto LABEL_19;
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    v7 = 0;
    v8 = v13;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    v13 = v8;
LABEL_19:
    v16 = __clz(__rbit64(v14));
    v7 = (v14 - 1) & v14;
    v12 = v16 + (v13 << 6);
    v8 = v13;
    goto LABEL_8;
  }
  v15 = v13 + 2;
  if (v13 + 2 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    v13 = v15;
    goto LABEL_19;
  }
  v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    v7 = 0;
    v8 = v13 + 2;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
    goto LABEL_15;
  v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_18;
  while (1)
  {
    v13 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v13 >= v10)
    {
      v7 = 0;
      v8 = v10 - 1;
      goto LABEL_34;
    }
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v15;
    if (v14)
      goto LABEL_19;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_100009B2C(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100009B38(uint64_t *a1)
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

uint64_t sub_100009B7C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100009B38(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009BCC()
{
  id *v0;

  return swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for AutoSettingsAccountManager()
{
  return objc_opt_self(_TtC12AutoSettings26AutoSettingsAccountManager);
}

uint64_t sub_100009CD4(uint64_t a1)
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
  result = sub_10000A160(a1);
  if ((v13 & 1) == 0)
  {
    v6 = v12;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v12)
    {
      v4 = result;
      if (result == 1 << *(_BYTE *)(a1 + 32))
      {
LABEL_6:
        sub_10000B18C(v4, v6, v2 != 0);
        return 0;
      }
LABEL_10:
      sub_100009EF8(v4, v6, v2 != 0, a1);
      v10 = v14;
      sub_10000B18C(v4, v6, v2 != 0);
      return v10;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_100009EA8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SettingsWindowSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SettingsWindowSceneDelegate()
{
  return objc_opt_self(_TtC12AutoSettings27SettingsWindowSceneDelegate);
}

void sub_100009EF8(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Swift::Int v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  id v22;
  uint64_t v23;
  void *v24;

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
        v12 = __CocoaSet.Index.element.getter(v7, a2);
        v23 = v12;
        v13 = sub_100005904(0, &qword_1000281D8, UIOpenURLContext_ptr);
        swift_unknownObjectRetain(v12, v14);
        swift_dynamicCast(&v24, &v23, (char *)&type metadata for Swift.AnyObject + 8, v13, 7);
        v4 = v24;
        swift_unknownObjectRelease(v12);
        v15 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a4 + 40));
        v16 = -1 << *(_BYTE *)(a4 + 32);
        v7 = v15 & ~v16;
        if (((*(_QWORD *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
        {
          v17 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v7);
          v18 = static NSObject.== infix(_:_:)(v17);

          if ((v18 & 1) == 0)
          {
            v19 = ~v16;
            do
            {
              v7 = (v7 + 1) & v19;
              if (((*(_QWORD *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
                goto LABEL_24;
              v20 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v7);
              v21 = static NSObject.== infix(_:_:)(v20);

            }
            while ((v21 & 1) == 0);
          }

LABEL_20:
          v22 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v7);
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
  v23 = v9;
  v10 = sub_100005904(0, &qword_1000281D8, UIOpenURLContext_ptr);
  swift_unknownObjectRetain(v9, v11);
  swift_dynamicCast(&v24, &v23, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
  swift_unknownObjectRelease(v9);
}

uint64_t sub_10000A160(uint64_t a1)
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

void sub_10000A1E8(void *a1, id a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  char v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  id v37;
  id v38;
  void *v39;
  uint64_t KeyPath;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  id v47;
  void *v48;
  uint64_t v49;
  id v50;

  v4 = objc_msgSend(a2, "role");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v6 = v5;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  CAFSignpostEmit_Scene(v7);

  v8 = objc_opt_self(UIWindowScene);
  v9 = swift_dynamicCastObjCClass(a1, v8);
  if (!v9)
    goto LABEL_8;
  v10 = (void *)v9;
  v11 = a1;
  v12 = objc_msgSend(a2, "role");
  v13 = _UIWindowSceneSessionRoleCarPlay;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  v16 = v15;
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
  if (v14 == v17 && v16 == v18)
  {

    swift_bridgeObjectRelease_n(v16, 2);
LABEL_13:
    v25 = objc_msgSend(v10, "_FBSScene");
    v26 = objc_msgSend(v25, "settings");

    v27 = objc_opt_self(CRSUIInstrumentClusterSceneSettings);
    v28 = swift_dynamicCastObjCClass(v26, v27);

    v29 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    v30 = objc_msgSend(v29, "delegate");

    if (v28)
    {
      if (v30)
      {
        v31 = type metadata accessor for AppDelegate(0);
        v32 = swift_dynamicCastClassUnconditional(v30, v31, 0, 0, 0);
        v33 = (void *)v32;
        if (qword_100027CD0 != -1)
          v32 = swift_once(&qword_100027CD0, sub_10000B1A8);
        v34 = qword_100029050;
        v35 = static os_log_type_t.default.getter(v32);
        if (os_log_type_enabled(v34, v35))
        {
          v36 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v36 = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, v35, "AutoSettings is connecting to a cluster scene!", v36, 2u);
          swift_slowDealloc(v36, -1, -1);
        }
        v37 = objc_msgSend(objc_allocWithZone((Class)UIWindow), "initWithWindowScene:", v10);
        objc_msgSend(v37, "setAutoresizesSubviews:", 1);
        objc_msgSend(v37, "setAutoresizingMask:", 18);
        objc_msgSend(v37, "makeKeyAndVisible");
        objc_msgSend(v37, "setHidden:", 0);
        sub_100005904(0, &qword_1000281F8, UIColor_ptr);
        v38 = v37;
        v39 = (void *)static UIColor.cafui_tableBackground.getter();
        objc_msgSend(v38, "setBackgroundColor:", v39);

        KeyPath = swift_getKeyPath(&unk_100018348);
        v41 = &unk_100018370;
LABEL_26:
        v49 = swift_getKeyPath(v41);
        v50 = v38;
        static Published.subscript.setter(&v50, v33, KeyPath, v49);
        swift_unknownObjectRelease(v30);

        return;
      }
      __break(1u);
    }
    else if (v30)
    {
      v42 = type metadata accessor for AppDelegate(0);
      v43 = swift_dynamicCastClassUnconditional(v30, v42, 0, 0, 0);
      v33 = (void *)v43;
      if (qword_100027CD0 != -1)
        v43 = swift_once(&qword_100027CD0, sub_10000B1A8);
      v44 = qword_100029050;
      v45 = static os_log_type_t.default.getter(v43);
      if (os_log_type_enabled(v44, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v46 = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, v45, "AutoSettings is connecting to a car scene!", v46, 2u);
        swift_slowDealloc(v46, -1, -1);
      }
      v47 = objc_msgSend(objc_allocWithZone((Class)UIWindow), "initWithWindowScene:", v10);
      objc_msgSend(v47, "setAutoresizesSubviews:", 1);
      objc_msgSend(v47, "setAutoresizingMask:", 18);
      objc_msgSend(v47, "makeKeyAndVisible");
      objc_msgSend(v47, "setHidden:", 0);
      sub_100005904(0, &qword_1000281F8, UIColor_ptr);
      v38 = v47;
      v48 = (void *)static UIColor.cafui_tableBackground.getter();
      objc_msgSend(v38, "setBackgroundColor:", v48);

      KeyPath = swift_getKeyPath(&unk_100018300);
      v41 = &unk_100018328;
      goto LABEL_26;
    }
    __break(1u);
    return;
  }
  v20 = v18;
  v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v16, v17, v18, 0);

  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v20);
  if ((v21 & 1) != 0)
    goto LABEL_13;

LABEL_8:
  if (qword_100027CD0 != -1)
    v9 = swift_once(&qword_100027CD0, sub_10000B1A8);
  v22 = qword_100029050;
  v23 = static os_log_type_t.default.getter(v9);
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Received an unknown scene, ignoring.", v24, 2u);
    swift_slowDealloc(v24, -1, -1);
  }
}

void sub_10000A7B8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  id v16;

  v2 = objc_opt_self(UIWindowScene);
  v3 = swift_dynamicCastObjCClass(a1, v2);
  if (v3)
  {
    v4 = (void *)v3;
    v16 = a1;
    v5 = objc_msgSend(v4, "_FBSScene");
    v6 = objc_msgSend(v5, "settings");

    v7 = objc_opt_self(CRSUIInstrumentClusterSceneSettings);
    v8 = swift_dynamicCastObjCClass(v6, v7);

    v9 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    v10 = objc_msgSend(v9, "delegate");

    if (v8)
    {
      if (v10)
      {
        v11 = type metadata accessor for AppDelegate(0);
        swift_dynamicCastClassUnconditional(v10, v11, 0, 0, 0);
        sub_10000BBF4();
LABEL_11:
        swift_unknownObjectRelease(v10);

        return;
      }
      __break(1u);
    }
    else if (v10)
    {
      v15 = type metadata accessor for AppDelegate(0);
      swift_dynamicCastClassUnconditional(v10, v15, 0, 0, 0);
      sub_10000BBD8();
      goto LABEL_11;
    }
    __break(1u);
  }
  else
  {
    if (qword_100027CD0 != -1)
      v3 = swift_once(&qword_100027CD0, sub_10000B1A8);
    v12 = qword_100029050;
    v13 = static os_log_type_t.default.getter(v3);
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "AutoSettings is disconnecting from an unknown scene!", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }
  }
}

void sub_10000A9CC(uint64_t a1)
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void (*v18)(char *, char *, uint64_t);
  NSObject *v19;
  uint64_t v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void (*v28)(char *, uint64_t);
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;

  v2 = sub_100005888(&qword_1000281E8);
  __chkstk_darwin(v2);
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v34 - v11;
  __chkstk_darwin(v10);
  v14 = (char *)&v34 - v13;
  v15 = swift_bridgeObjectRetain(a1);
  v16 = (void *)sub_100009CD4(v15);
  swift_bridgeObjectRelease(a1);
  if (!v16)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_8;
  }
  v17 = objc_msgSend(v16, "URL");

  static URL._unconditionallyBridgeFromObjectiveC(_:)(v17);
  v18 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v18(v4, v12, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_8:
    sub_10000B104((uint64_t)v4);
    return;
  }
  v18(v14, v4, v5);
  if (qword_100027CD0 != -1)
    swift_once(&qword_100027CD0, sub_10000B1A8);
  v19 = qword_100029050;
  v20 = (*(uint64_t (**)(char *, char *, uint64_t))(v6 + 16))(v9, v14, v5);
  v21 = static os_log_type_t.default.getter(v20);
  if (os_log_type_enabled(v19, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc(12, -1);
    v23 = swift_slowAlloc(32, -1);
    v37 = v23;
    *(_DWORD *)v22 = 136315138;
    v35 = v22 + 4;
    v24 = sub_10000B144();
    v25 = dispatch thunk of CustomStringConvertible.description.getter(v5, v24);
    v27 = v26;
    v36 = sub_1000100BC(v25, v26, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v35, v22 + 12);
    swift_bridgeObjectRelease(v27);
    v28 = *(void (**)(char *, uint64_t))(v6 + 8);
    v28(v9, v5);
    _os_log_impl((void *)&_mh_execute_header, v19, v21, "AutoSettings received settings URL %s", v22, 0xCu);
    swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(v22, -1, -1);
  }
  else
  {
    v28 = *(void (**)(char *, uint64_t))(v6 + 8);
    v28(v9, v5);
  }
  v29 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v30 = objc_msgSend(v29, "delegate");

  if (v30)
  {
    v31 = type metadata accessor for AppDelegate(0);
    v32 = *(void **)(swift_dynamicCastClassUnconditional(v30, v31, 0, 0, 0)
                   + OBJC_IVAR____TtC12AutoSettings11AppDelegate_settingsCarManager);
    v33 = v32;
    swift_unknownObjectRelease(v30);
    if (v32)
    {
      sub_10000E674();

      v28(v14, v5);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

unint64_t sub_10000B0AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000281E0;
  if (!qword_1000281E0)
  {
    v1 = sub_100005904(255, &qword_1000281D8, UIOpenURLContext_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_1000281E0);
  }
  return result;
}

uint64_t sub_10000B104(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005888(&qword_1000281E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000B144()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000281F0;
  if (!qword_1000281F0)
  {
    v1 = type metadata accessor for URL(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&qword_1000281F0);
  }
  return result;
}

uint64_t sub_10000B18C(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

uint64_t sub_10000B1A8()
{
  id v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v1 = objc_msgSend(v0, "bundleIdentifier");

  if (v1)
  {
    v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
    v4 = v3;

  }
  else
  {
    v2 = 0;
    v4 = 0xE000000000000000;
  }
  sub_10000B26C();
  result = OS_os_log.init(subsystem:category:)(v2, v4, 0x747465536F747541, 0xEC00000073676E69);
  qword_100029050 = result;
  return result;
}

unint64_t sub_10000B26C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100028260;
  if (!qword_100028260)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100028260);
  }
  return result;
}

void sub_10000B2A8()
{
  qword_100029058 = 0x696669746E656469;
  unk_100029060 = 0xEA00000000007265;
}

uint64_t sub_10000B2D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  os_log_type_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(char *, unint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  NSObject *v51;
  uint64_t v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  v76 = type metadata accessor for URL(0);
  v1 = *(_QWORD *)(v76 - 8);
  v2 = __chkstk_darwin(v76);
  v4 = (char *)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v74 = (char *)&v67 - v5;
  v6 = sub_100005888(&qword_100028268);
  __chkstk_darwin(v6);
  v73 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for URLQueryItem(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v72 = (char *)&v67 - v13;
  v14 = sub_100005888((uint64_t *)&unk_100028270);
  __chkstk_darwin(v14);
  v16 = (char *)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for URLComponents(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = v0;
  URLComponents.init(url:resolvingAgainstBaseURL:)(v0, 0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    sub_10000BA58((uint64_t)v16, (uint64_t *)&unk_100028270);
    if (qword_100027CD0 != -1)
      swift_once(&qword_100027CD0, sub_10000B1A8);
    v21 = qword_100029050;
    v22 = v76;
    v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v75, v76);
    v24 = static os_log_type_t.default.getter(v23);
    if (os_log_type_enabled(v21, v24))
    {
      v25 = swift_slowAlloc(12, -1);
      v71 = v1;
      v26 = (uint8_t *)v25;
      v27 = swift_slowAlloc(32, -1);
      v78 = v27;
      *(_DWORD *)v26 = 136315138;
      v28 = sub_10000B144();
      v29 = dispatch thunk of CustomStringConvertible.description.getter(v22, v28);
      v31 = v30;
      v77 = sub_1000100BC(v29, v30, &v78);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, &v78, v26 + 4, v26 + 12);
      swift_bridgeObjectRelease(v31);
      (*(void (**)(char *, uint64_t))(v71 + 8))(v4, v22);
      _os_log_impl((void *)&_mh_execute_header, v21, v24, "Couldn't parse URL components out of %s", v26, 0xCu);
      swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v26, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v22);
    }
  }
  else
  {
    v32 = (*(uint64_t (**)(char *, char *, uint64_t))(v18 + 32))(v20, v16, v17);
    v33 = URLComponents.queryItems.getter(v32);
    if (v33)
    {
      v34 = v33;
      v71 = v1;
      v35 = *(_QWORD *)(v33 + 16);
      v36 = v76;
      if (v35)
      {
        v68 = v20;
        v69 = v18;
        v70 = v17;
        v37 = v33 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
        v38 = *(_QWORD *)(v9 + 72);
        v39 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v9 + 16);
        v67 = v33;
        swift_bridgeObjectRetain(v33);
        while (1)
        {
          v40 = v39(v12, v37, v8);
          v41 = URLQueryItem.name.getter(v40);
          v43 = v42;
          if (qword_100027CD8 != -1)
            swift_once(&qword_100027CD8, sub_10000B2A8);
          if (v41 == qword_100029058 && v43 == unk_100029060)
          {
            v34 = v67;
            swift_bridgeObjectRelease(v67);
            v48 = v43;
            goto LABEL_23;
          }
          v45 = _stringCompareWithSmolCheck(_:_:expecting:)(v41, v43, qword_100029058, unk_100029060, 0);
          swift_bridgeObjectRelease(v43);
          if ((v45 & 1) != 0)
            break;
          (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
          v37 += v38;
          if (!--v35)
          {
            v34 = v67;
            swift_bridgeObjectRelease(v67);
            v49 = 1;
            v36 = v76;
            v17 = v70;
            v1 = v71;
            v20 = v68;
            v18 = v69;
            goto LABEL_24;
          }
        }
        v34 = v67;
        v48 = v67;
LABEL_23:
        swift_bridgeObjectRelease(v48);
        v20 = v68;
        v46 = (uint64_t)v73;
        (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v73, v12, v8);
        v49 = 0;
        v36 = v76;
        v17 = v70;
        v1 = v71;
        v18 = v69;
      }
      else
      {
        v49 = 1;
        v1 = v71;
LABEL_24:
        v46 = (uint64_t)v73;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v46, v49, 1, v8);
      swift_bridgeObjectRelease(v34);
      v50 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v46, 1, v8);
      v47 = v74;
      if (v50 != 1)
      {
        v64 = v72;
        v65 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 32))(v72, v46, v8);
        v66 = v20;
        v62 = URLQueryItem.value.getter(v65);
        (*(void (**)(char *, uint64_t))(v9 + 8))(v64, v8);
        (*(void (**)(char *, uint64_t))(v18 + 8))(v66, v17);
        return v62;
      }
    }
    else
    {
      v46 = (uint64_t)v73;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v73, 1, 1, v8);
      v47 = v74;
      v36 = v76;
    }
    sub_10000BA58(v46, &qword_100028268);
    if (qword_100027CD0 != -1)
      swift_once(&qword_100027CD0, sub_10000B1A8);
    v51 = qword_100029050;
    v52 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16))(v47, v75, v36);
    v53 = static os_log_type_t.default.getter(v52);
    if (os_log_type_enabled(v51, v53))
    {
      v68 = v20;
      v69 = v18;
      v70 = v17;
      v54 = swift_slowAlloc(22, -1);
      v55 = swift_slowAlloc(64, -1);
      v78 = v55;
      *(_DWORD *)v54 = 136315394;
      v56 = sub_10000B144();
      v57 = dispatch thunk of CustomStringConvertible.description.getter(v36, v56);
      v59 = v58;
      v77 = sub_1000100BC(v57, v58, &v78);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, &v78, v54 + 4, v54 + 12);
      swift_bridgeObjectRelease(v59);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v47, v36);
      *(_WORD *)(v54 + 12) = 2080;
      if (qword_100027CD8 != -1)
        swift_once(&qword_100027CD8, sub_10000B2A8);
      v60 = qword_100029058;
      v61 = unk_100029060;
      swift_bridgeObjectRetain(unk_100029060);
      v77 = sub_1000100BC(v60, v61, &v78);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, &v78, v54 + 14, v54 + 22);
      swift_bridgeObjectRelease(v61);
      _os_log_impl((void *)&_mh_execute_header, v51, v53, "URL %s doesn't seem to have a %s query parameter.", (uint8_t *)v54, 0x16u);
      swift_arrayDestroy(v55, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v55, -1, -1);
      swift_slowDealloc(v54, -1, -1);
      (*(void (**)(char *, uint64_t))(v69 + 8))(v68, v70);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v1 + 8))(v47, v36);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    }
  }
  return 0;
}

uint64_t sub_10000BA58(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100005888(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000BA94()
{
  return sub_10000BABC((uint64_t)&unk_100018418, (uint64_t)&unk_100018440);
}

uint64_t sub_10000BAA8()
{
  return sub_10000BABC((uint64_t)&unk_1000183D0, (uint64_t)&unk_1000183F8);
}

uint64_t sub_10000BABC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v7;

  v4 = ((uint64_t (*)(void))swift_getKeyPath)();
  KeyPath = swift_getKeyPath(a2);
  static Published.subscript.getter(&v7, v2, v4, KeyPath);
  swift_release(v4);
  swift_release(KeyPath);
  return v7;
}

uint64_t sub_10000BBD8()
{
  return sub_10000BC10((uint64_t)"AutoSettings is disconnecting from a car scene!", (uint64_t)&unk_100018418, (uint64_t)&unk_100018440);
}

uint64_t sub_10000BBF4()
{
  return sub_10000BC10((uint64_t)"AutoSettings is disconnecting from a cluster scene!", (uint64_t)&unk_1000183D0, (uint64_t)&unk_1000183F8);
}

uint64_t sub_10000BC10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t KeyPath;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v16;

  v6 = (const char *)a1;
  if (qword_100027CD0 != -1)
    a1 = swift_once(&qword_100027CD0, sub_10000B1A8);
  v7 = qword_100029050;
  v8 = static os_log_type_t.default.getter(a1);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, v6, v9, 2u);
    swift_slowDealloc(v9, -1, -1);
  }
  KeyPath = swift_getKeyPath(a2);
  v11 = swift_getKeyPath(a3);
  static Published.subscript.getter(&v16, v3, KeyPath, v11);
  swift_release(KeyPath);
  swift_release(v11);
  v12 = v16;
  if (v16)
  {
    objc_msgSend(v16, "setHidden:", 1);

  }
  v13 = swift_getKeyPath(a2);
  v14 = swift_getKeyPath(a3);
  v16 = 0;
  return static Published.subscript.setter(&v16, v3, v13, v14);
}

id sub_10000BD70()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  char *v9;
  objc_class *v10;
  uint64_t v12;
  objc_super v13;
  uint64_t v14;

  v1 = sub_100005888(&qword_100028340);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC12AutoSettings11AppDelegate_settingsCarManager] = 0;
  v5 = &v0[OBJC_IVAR____TtC12AutoSettings11AppDelegate__carWindow];
  v14 = 0;
  v6 = v0;
  v7 = sub_100005888(&qword_100028338);
  Published.init(initialValue:)(&v14, v7);
  v8 = *(void (**)(char *, char *, uint64_t))(v2 + 32);
  v8(v5, v4, v1);
  v9 = &v6[OBJC_IVAR____TtC12AutoSettings11AppDelegate__clusterWindow];
  v14 = 0;
  Published.init(initialValue:)(&v14, v7);
  v8(v9, v4, v1);

  v10 = (objc_class *)type metadata accessor for AppDelegate(0);
  v13.receiver = v6;
  v13.super_class = v10;
  return objc_msgSendSuper2(&v13, "init");
}

id sub_10000BEA4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate(0);
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

  v3 = type metadata accessor for AppDelegate(0);
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

uint64_t type metadata accessor for AppDelegate(uint64_t a1)
{
  uint64_t result;

  result = qword_100028320;
  if (!qword_100028320)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AppDelegate);
  return result;
}

uint64_t sub_10000C028()
{
  return type metadata accessor for AppDelegate(0);
}

void sub_10000C030(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = "\b";
  sub_10000C0A8(319);
  if (v3 <= 0x3F)
  {
    v5 = *(_QWORD *)(v2 - 8) + 64;
    v6 = v5;
    swift_updateClassMetadata2(a1, 256, 3, &v4, a1 + 80);
  }
}

void sub_10000C0A8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100028330)
  {
    v2 = sub_100009B38(&qword_100028338);
    v3 = type metadata accessor for Published(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100028330);
  }
}

uint64_t sub_10000C100@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_1000183D0);
  v5 = swift_getKeyPath(&unk_1000183F8);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_10000C180(void **a1, void **a2)
{
  void *v2;
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  id v6;
  void *v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_1000183D0);
  v5 = swift_getKeyPath(&unk_1000183F8);
  v8 = v2;
  v6 = v2;
  return static Published.subscript.setter(&v8, v3, KeyPath, v5);
}

unint64_t sub_10000C1FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100027EA8;
  if (!qword_100027EA8)
  {
    type metadata accessor for LaunchOptionsKey(255);
    result = swift_getWitnessTable(&unk_100018214, v1);
    atomic_store(result, (unint64_t *)&qword_100027EA8);
  }
  return result;
}

id sub_10000C244(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v6;
  id v7;

  v3 = v2;
  v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3)), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setFont:", a1);
  objc_msgSend(v6, "setTextAlignment:", 1);
  v7 = objc_msgSend((id)objc_opt_self(UIColor), "labelColor");
  objc_msgSend(v6, "setTextColor:", v7);

  objc_msgSend(v6, "setNumberOfLines:", a2);
  return v6;
}

objc_class *sub_10000C334()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  objc_class *v3;
  uint64_t v4;
  Swift::String v5;
  Class isa;
  void *v7;
  id v8;

  v1 = OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController____lazy_storage___cancelButton;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController____lazy_storage___cancelButton);
  if (v2)
  {
    v3 = *(objc_class **)(v0
                        + OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController____lazy_storage___cancelButton);
  }
  else
  {
    v4 = v0;
    sub_100005904(0, &qword_100028390, UIButton_ptr);
    v5._countAndFlagsBits = 0x4C45434E4143;
    v5._object = (void *)0xE600000000000000;
    isa = UIButton.init(alertButtonTitle:)(v5).super.super.super.super.isa;
    -[objc_class addTarget:action:forControlEvents:](isa, "addTarget:action:forControlEvents:", v4, "cancelButtonTapped", 64);
    v7 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = isa;
    v3 = isa;

    v2 = 0;
  }
  v8 = v2;
  return v3;
}

void sub_10000C418()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  id v9;
  void *v10;
  Swift::String v11;
  Class isa;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  Class v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  objc_super v60;
  CGRect v61;

  v1 = v0;
  v60.receiver = v0;
  v60.super_class = (Class)type metadata accessor for VSFullScreenActionAlertViewController();
  objc_msgSendSuper2(&v60, "viewDidLoad");
  v2 = objc_msgSend(v0, "view");
  if (!v2)
  {
    __break(1u);
    goto LABEL_14;
  }
  v3 = v2;
  sub_100005904(0, &qword_1000281F8, UIColor_ptr);
  v4 = (void *)static UIColor.cafui_tableBackground.getter();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  sub_100005904(0, &qword_100028398, UIStackView_ptr);
  v5 = sub_100005888(&qword_100028038);
  v6 = swift_allocObject(v5, 40, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100018260;
  v7 = sub_10000C334();
  *(_QWORD *)(v6 + 32) = v7;
  specialized Array._endMutation()(v7);
  v8 = (void *)UIStackView.init(axis:spacing:arrangedSubviews:)(0, v6, 20.0);
  objc_msgSend(v8, "setDistribution:", 1);
  v9 = objc_msgSend(v1, "view");
  if (!v9)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v10 = v9;
  objc_msgSend(v9, "addSubview:", v8);

  if (*(_QWORD *)&v1[OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_action])
  {
    sub_100005904(0, &qword_100028390, UIButton_ptr);
    v11._countAndFlagsBits = 0x484354495753;
    v11._object = (void *)0xE600000000000000;
    isa = UIButton.init(alertButtonTitle:)(v11).super.super.super.super.isa;
    -[objc_class addTarget:action:forControlEvents:](isa, "addTarget:action:forControlEvents:", v1, "primaryAction", 64);
    objc_msgSend(v8, "addArrangedSubview:", isa);

  }
  v13 = swift_allocObject(v5, 48, 7);
  *(_OWORD *)(v13 + 16) = xmmword_100018460;
  v14 = *(void **)&v1[OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_titleLabel];
  v15 = *(void **)&v1[OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_messageLabel];
  *(_QWORD *)(v13 + 32) = v14;
  *(_QWORD *)(v13 + 40) = v15;
  v59 = v13;
  specialized Array._endMutation()(v13);
  if ((unint64_t)v59 >> 62)
  {
    v53 = v59 & 0xFFFFFFFFFFFFFF8;
    if (v59 < 0)
      v53 = v59;
    v58 = (id)v53;
    v54 = sub_100005904(0, &qword_1000283A0, UIView_ptr);
    v55 = v14;
    v56 = v15;
    swift_bridgeObjectRetain(v59);
    v19 = _bridgeCocoaArray<A>(_:)(v58, v54);
    swift_bridgeObjectRelease(v59);
  }
  else
  {
    v16 = v14;
    v17 = v15;
    v18 = swift_bridgeObjectRetain(v59);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v18);
    sub_100005904(0, &qword_1000283A0, UIView_ptr);
    v19 = v59;
  }
  swift_bridgeObjectRelease(v59);
  v20 = (void *)UIStackView.init(axis:spacing:arrangedSubviews:)(1, v19, 24.0);
  v21 = objc_msgSend(v1, "view");
  if (!v21)
    goto LABEL_15;
  v22 = v21;
  objc_msgSend(v21, "addSubview:", v20);

  v23 = objc_msgSend(v1, "view");
  if (v23)
  {
    v24 = v23;
    v25 = objc_msgSend(v23, "safeAreaLayoutGuide");

    v57 = (id)objc_opt_self(NSLayoutConstraint);
    v26 = swift_allocObject(v5, 96, 7);
    *(_OWORD *)(v26 + 16) = xmmword_100018470;
    v27 = objc_msgSend(v20, "topAnchor");
    v28 = objc_msgSend(v25, "topAnchor");
    objc_msgSend(v25, "layoutFrame");
    v29 = objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, CGRectGetHeight(v61) * 0.05);

    *(_QWORD *)(v26 + 32) = v29;
    v30 = objc_msgSend(v20, "bottomAnchor");
    v31 = objc_msgSend(v8, "topAnchor");
    v32 = objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:constant:", v31, 30.0);

    *(_QWORD *)(v26 + 40) = v32;
    v33 = objc_msgSend(v20, "leadingAnchor");
    v34 = objc_msgSend(v25, "leadingAnchor");
    v35 = objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 12.0);

    *(_QWORD *)(v26 + 48) = v35;
    v36 = objc_msgSend(v20, "trailingAnchor");
    v37 = objc_msgSend(v25, "trailingAnchor");
    v38 = objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, -12.0);

    *(_QWORD *)(v26 + 56) = v38;
    v39 = objc_msgSend(v8, "bottomAnchor");
    v40 = objc_msgSend(v25, "bottomAnchor");
    v41 = objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, -24.0);

    *(_QWORD *)(v26 + 64) = v41;
    v42 = objc_msgSend(v8, "leadingAnchor");
    v43 = objc_msgSend(v25, "leadingAnchor");
    v44 = objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, 12.0);

    *(_QWORD *)(v26 + 72) = v44;
    v45 = objc_msgSend(v8, "trailingAnchor");
    v46 = objc_msgSend(v25, "trailingAnchor");
    v47 = objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, -12.0);

    *(_QWORD *)(v26 + 80) = v47;
    v48 = objc_msgSend(v8, "centerXAnchor");
    v49 = objc_msgSend(v25, "centerXAnchor");
    v50 = objc_msgSend(v48, "constraintEqualToAnchor:", v49);

    *(_QWORD *)(v26 + 88) = v50;
    specialized Array._endMutation()(v51);
    sub_100005904(0, (unint64_t *)&qword_1000283A8, NSLayoutConstraint_ptr);
    v52 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v26);
    objc_msgSend(v57, "activateConstraints:", v52);

    return;
  }
LABEL_16:
  __break(1u);
}

id sub_10000CBE4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VSFullScreenActionAlertViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for VSFullScreenActionAlertViewController()
{
  return objc_opt_self(_TtC12AutoSettings37VSFullScreenActionAlertViewController);
}

void sub_10000CC90()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_titleLabel;
  v2 = (void *)objc_opt_self(UIFont);
  v3 = objc_msgSend(v2, "boldSystemFontOfSize:", 28.0);
  sub_100005904(0, (unint64_t *)&unk_1000283B0, UILabel_ptr);
  *(_QWORD *)&v0[v1] = sub_10000C244(v3, 1);
  v4 = OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_messageLabel;
  *(_QWORD *)&v0[v4] = sub_10000C244(objc_msgSend(v2, "preferredFontForTextStyle:", UIFontTextStyleBody), 3);
  *(_QWORD *)&v0[OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController____lazy_storage___cancelButton] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100018E10, "AutoSettings/VSFullScreenActionAlertViewController.swift", 56, 2, 43, 0);
  __break(1u);
}

uint64_t sub_10000CDA0(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

void sub_10000CDB0()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  id v7;
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  id v21;
  id v22;

  v1 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v2 = objc_msgSend(v1, "delegate");

  if (!v2)
  {
    __break(1u);
    return;
  }
  v3 = type metadata accessor for AppDelegate(0);
  v4 = swift_dynamicCastClassUnconditional(v2, v3, 0, 0, 0);
  KeyPath = swift_getKeyPath(&unk_100018550);
  v6 = swift_getKeyPath(&unk_100018578);
  static Published.subscript.getter(&v22, v4, KeyPath, v6);
  swift_unknownObjectRelease(v2);
  swift_release(KeyPath);
  swift_release(v6);
  v7 = v22;
  if (v22)
  {
    v8 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_spinnerVisible);
    v9 = objc_msgSend(v22, "rootViewController");
    v10 = v9;
    if (v8 == 1)
    {
      if (v9)
      {
        v11 = type metadata accessor for CAFUILoadingViewController(0);
        if (swift_dynamicCastClass(v10, v11))
        {

LABEL_21:
          return;
        }

      }
      if (qword_100027CD0 != -1)
        v9 = (id)swift_once(&qword_100027CD0, sub_10000B1A8);
      v18 = qword_100029050;
      v19 = static os_log_type_t.default.getter(v9);
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "AutoSettings is setting loading spinner visible", v20, 2u);
        swift_slowDealloc(v20, -1, -1);
      }
      v21 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CAFUILoadingViewController(0)), "init");
      objc_msgSend(v7, "setRootViewController:", v21);

    }
    else if (v9)
    {
      v12 = type metadata accessor for CAFUILoadingViewController(0);
      v13 = swift_dynamicCastClass(v10, v12);

      if (v13)
      {
        if (qword_100027CD0 != -1)
          v14 = swift_once(&qword_100027CD0, sub_10000B1A8);
        v15 = qword_100029050;
        v16 = static os_log_type_t.default.getter(v14);
        if (os_log_type_enabled(v15, v16))
        {
          v17 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v17 = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "AutoSettings is hiding the loading spinner", v17, 2u);
          swift_slowDealloc(v17, -1, -1);
        }
        objc_msgSend(v7, "setRootViewController:", 0);
      }
    }
    v10 = v7;
    goto LABEL_21;
  }
}

void sub_10000D090()
{
  char *v0;
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
  uint64_t v11;
  id v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  id v22;
  objc_class *v23;
  char *v24;
  void *v25;
  char *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  char *v40;
  id v41;
  id v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[2];
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t, uint64_t);
  id v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  id v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  id v59[3];
  objc_super v60;

  v1 = sub_100005888(&qword_100028688);
  __chkstk_darwin(v1);
  v3 = (char *)v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100005888(&qword_100028690);
  v56 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100005888((uint64_t *)&unk_100028698);
  v58 = *(_QWORD *)(v7 - 8);
  v8 = __chkstk_darwin(v7);
  v54 = (char *)v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v57 = (char *)v47 - v10;
  v11 = OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_cafCarManager;
  v12 = objc_allocWithZone((Class)CAFCarManager);
  v13 = v0;
  *(_QWORD *)&v0[v11] = objc_msgSend(v12, "init");
  v14 = OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_assetManager;
  v15 = type metadata accessor for CAUAssetLibraryManager(0);
  swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
  *(_QWORD *)&v13[v14] = CAUAssetLibraryManager.init()();
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0
    && _CocoaArrayWrapper.endIndex.getter(_swiftEmptyArrayStorage))
  {
    v16 = (void *)sub_100010BA8((uint64_t)_swiftEmptyArrayStorage);
  }
  else
  {
    v16 = &_swiftEmptySetSingleton;
  }
  *(_QWORD *)&v13[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_subscribers] = v16;
  *(_QWORD *)&v13[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_rootViewController] = 0;
  v17 = Date.init()();
  *(_QWORD *)&v13[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_lastNotificationCount] = 0;
  v18 = &v13[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  if (qword_100027CD0 != -1)
    v17 = swift_once(&qword_100027CD0, sub_10000B1A8);
  v19 = qword_100029050;
  v20 = static os_log_type_t.default.getter(v17);
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "AutoSettings is creating a car manager!", v21, 2u);
    swift_slowDealloc(v21, -1, -1);
  }
  v13[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_spinnerVisible] = 1;
  v22 = objc_msgSend(objc_allocWithZone((Class)CARSessionStatus), "init");
  *(_QWORD *)&v13[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_carSessionStatus] = v22;

  v23 = (objc_class *)type metadata accessor for SettingsCarManager(0);
  v60.receiver = v13;
  v60.super_class = v23;
  v24 = (char *)objc_msgSendSuper2(&v60, "init");
  v25 = *(void **)&v24[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_cafCarManager];
  v26 = v24;
  objc_msgSend(v25, "registerObserver:", v26);
  v27 = v25;
  v28 = objc_msgSend(v27, "currentCar");
  sub_100010E3C(v28);

  objc_msgSend(*(id *)&v26[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_carSessionStatus], "addSessionObserver:", v26);
  v55 = (id)objc_opt_self(UIApplication);
  v29 = objc_msgSend(v55, "sharedApplication");
  v30 = objc_msgSend(v29, "delegate");

  if (v30)
  {
    v53 = type metadata accessor for AppDelegate(0);
    v31 = swift_dynamicCastClassUnconditional(v30, v53, 0, 0, 0);
    swift_beginAccess(v31 + OBJC_IVAR____TtC12AutoSettings11AppDelegate__carWindow, v59, 33, 0);
    v52 = sub_100005888(&qword_100028340);
    ((void (*)(void))Published.projectedValue.getter)();
    swift_endAccess(v59);
    swift_unknownObjectRelease(v30);
    v51 = (id)objc_opt_self(NSRunLoop);
    v59[0] = objc_msgSend(v51, "mainRunLoop");
    v32 = type metadata accessor for NSRunLoop.SchedulerOptions(0);
    v50 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56);
    v50(v3, 1, 1, v32);
    v33 = sub_100005904(0, &qword_1000286A8, NSRunLoop_ptr);
    v34 = sub_100009B7C(&qword_1000286B0, &qword_100028690, (uint64_t)&protocol conformance descriptor for Published<A>.Publisher);
    v35 = sub_100011654();
    v36 = v57;
    v48 = v34;
    v49 = v33;
    v47[1] = v35;
    Publisher.receive<A>(on:options:)(v59, v3, v4, v33, v34);
    sub_10000BA58((uint64_t)v3, &qword_100028688);

    v56 = *(_QWORD *)(v56 + 8);
    ((void (*)(char *, uint64_t))v56)(v6, v4);
    v37 = swift_allocObject(&unk_100020EF8, 24, 7);
    swift_unknownObjectWeakInit(v37 + 16, v26);
    v47[0] = sub_100009B7C(&qword_1000286C0, (uint64_t *)&unk_100028698, (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
    v38 = Publisher<>.sink(receiveValue:)(sub_1000116AC, v37, v7);
    swift_release(v37);
    v39 = *(void (**)(char *, uint64_t))(v58 + 8);
    v39(v36, v7);
    v40 = &v26[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_subscribers];
    swift_beginAccess(&v26[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_subscribers], v59, 33, 0);
    AnyCancellable.store(in:)(v40);
    swift_endAccess(v59);
    swift_release(v38);
    v41 = objc_msgSend(v55, "sharedApplication");
    v42 = objc_msgSend(v41, "delegate");

    if (v42)
    {
      v43 = swift_dynamicCastClassUnconditional(v42, v53, 0, 0, 0);
      swift_beginAccess(v43 + OBJC_IVAR____TtC12AutoSettings11AppDelegate__clusterWindow, v59, 33, 0);
      Published.projectedValue.getter(v52);
      swift_endAccess(v59);
      swift_unknownObjectRelease(v42);
      v59[0] = objc_msgSend(v51, "mainRunLoop");
      v50(v3, 1, 1, v32);
      v44 = v54;
      Publisher.receive<A>(on:options:)(v59, v3, v4, v49, v48);
      sub_10000BA58((uint64_t)v3, &qword_100028688);

      ((void (*)(char *, uint64_t))v56)(v6, v4);
      v45 = swift_allocObject(&unk_100020EF8, 24, 7);
      swift_unknownObjectWeakInit(v45 + 16, v26);
      v46 = Publisher<>.sink(receiveValue:)(sub_1000116AC, v45, v7);
      swift_release(v45);
      v39(v44, v7);
      swift_beginAccess(v40, v59, 33, 0);
      AnyCancellable.store(in:)(v40);
      swift_endAccess(v59);
      swift_release(v46);
      sub_10000D84C();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_10000D7DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  _BYTE v5[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v5, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = (void *)Strong;
    sub_10000D84C();

  }
}

void sub_10000D84C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  id v36;
  void *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  NSObject *v41;
  id v42;
  os_log_type_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  id v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  _QWORD *v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  NSObject *v68;
  id v69;
  os_log_type_t v70;
  uint8_t *v71;
  _QWORD *v72;
  uint8_t *v73;
  id v74;
  id v75;
  uint8_t *v76;
  uint8_t *v77;
  uint64_t v78;
  void *v79;
  id v80;
  id v81;
  uint64_t v82;
  id v83;
  _QWORD *v84;
  NSString v85;
  id v86;
  NSString v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  id v95;
  id v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  char v104;
  _QWORD *v105;
  _QWORD *v106;
  _QWORD *v107;
  Swift::String v108;
  uint64_t v109;
  void *v110;
  Swift::String v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint8_t *v119;
  uint8_t *v120;
  NSObject *v121;
  id v122;
  id v123;
  id v124;
  _QWORD v125[2];
  uint64_t v126;
  unint64_t v127;

  v1 = v0;
  v2 = sub_100005888(&qword_100028638);
  __chkstk_darwin(v2);
  v4 = (char *)&v119 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v6 = objc_msgSend(v5, "delegate");

  if (!v6)
    goto LABEL_92;
  v7 = type metadata accessor for AppDelegate(0);
  v8 = swift_dynamicCastClassUnconditional(v6, v7, 0, 0, 0);
  KeyPath = swift_getKeyPath(&unk_100018550);
  v10 = swift_getKeyPath(&unk_100018578);
  static Published.subscript.getter(&v126, v8, KeyPath, v10);
  swift_unknownObjectRelease(v6);
  swift_release(KeyPath);
  v11 = swift_release(v10);
  v12 = (id)v126;
  if (v126)
  {
    v13 = objc_msgSend((id)v126, "rootViewController");
    if (v13)
    {
      v14 = v13;
      v15 = objc_opt_self(UINavigationController);
      if (swift_dynamicCastObjCClass(v14, v15))
      {

        return;
      }

    }
    v19 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_carSessionStatus), "currentSession");
    if (v19)
    {
      v20 = v19;
      v21 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                                  + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_cafCarManager), "currentCar"));
      if (v21)
      {
        v22 = v21;
        v23 = objc_msgSend(v21, "automakerSettings");
        if (v23)
        {
          v24 = v23;
          if (objc_msgSend(v23, "receivedAllValues"))
          {
            v25 = objc_msgSend(v22, "automakerNotificationHistory");
            v124 = v24;
            if (!v25)
              goto LABEL_53;
            v26 = v25;
            v123 = v20;
            v27 = -[NSObject historicalNotifications](v25, "historicalNotifications");
            if (!v27)
            {

              v20 = v123;
              goto LABEL_53;
            }
            v28 = v27;
            v29 = sub_100005904(0, &qword_100028040, CAFHistoricalNotification_ptr);
            v30 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v28, v29);

            v121 = v26;
            v122 = v22;
            if ((unint64_t)v30 >> 62)
            {
              if (v30 < 0)
                v56 = v30;
              else
                v56 = v30 & 0xFFFFFFFFFFFFFF8;
              swift_bridgeObjectRetain(v30);
              v31 = _CocoaArrayWrapper.endIndex.getter(v56);
              if (v31)
                goto LABEL_19;
            }
            else
            {
              v31 = *(_QWORD *)((v30 & 0xFFFFFFFFFFFFF8) + 0x10);
              swift_bridgeObjectRetain(v30);
              if (v31)
              {
LABEL_19:
                if (v31 >= 1)
                {
                  for (i = 0; i != v31; ++i)
                  {
                    if ((v30 & 0xC000000000000001) != 0)
                      v36 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v30);
                    else
                      v36 = *(id *)(v30 + 8 * i + 32);
                    v37 = v36;
                    objc_msgSend(v36, "registerObserver:", v1);

                  }
                  goto LABEL_52;
                }
                __break(1u);
LABEL_92:
                __break(1u);
                return;
              }
            }
LABEL_52:

            swift_bridgeObjectRelease_n(v30, 2);
            v22 = v122;
            v20 = v123;
            v24 = v124;
LABEL_53:
            *(_BYTE *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_spinnerVisible) = 0;
            sub_10000CDB0();
            objc_msgSend(v24, "unregisterObserver:", v1);
            v57 = objc_msgSend(v22, "automakerNotificationHistory");
            if (v57)
            {
              v58 = v57;
              sub_100005BB8();
              v60 = v59;

              if ((unint64_t)v60 >> 62)
              {
                if (v60 < 0)
                  v118 = v60;
                else
                  v118 = v60 & 0xFFFFFFFFFFFFFF8;
                swift_bridgeObjectRetain(v60);
                v61 = _CocoaArrayWrapper.endIndex.getter(v118);
                swift_bridgeObjectRelease(v60);
              }
              else
              {
                v61 = *(_QWORD *)((v60 & 0xFFFFFFFFFFFFF8) + 0x10);
              }
              swift_bridgeObjectRelease(v60);
            }
            else
            {
              v61 = 0;
            }
            *(_QWORD *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_lastNotificationCount) = v61;
            v62 = objc_msgSend(v12, "rootViewController");

            if (v62)
            {
              v64 = v124;
              if (qword_100027CD0 != -1)
                v63 = swift_once(&qword_100027CD0, sub_10000B1A8);
              v65 = qword_100029050;
              v66 = static os_log_type_t.default.getter(v63);
              if (os_log_type_enabled(v65, v66))
              {
                v67 = (uint8_t *)swift_slowAlloc(2, -1);
                *(_WORD *)v67 = 0;
                _os_log_impl((void *)&_mh_execute_header, v65, v66, "car window root view controller isn't nil", v67, 2u);
                swift_slowDealloc(v67, -1, -1);
              }

LABEL_85:
              return;
            }
            if (qword_100027CD0 != -1)
              swift_once(&qword_100027CD0, sub_10000B1A8);
            v68 = qword_100029050;
            v69 = v22;
            v70 = static os_log_type_t.default.getter(v69);
            if (os_log_type_enabled(v68, v70))
            {
              v121 = v68;
              v71 = (uint8_t *)swift_slowAlloc(12, -1);
              v72 = (_QWORD *)swift_slowAlloc(8, -1);
              v123 = v20;
              *(_DWORD *)v71 = 138412290;
              v73 = v71 + 12;
              v119 = v71 + 4;
              v120 = v71;
              v126 = (uint64_t)v69;
              v74 = v69;
              v75 = v69;
              v76 = v73;
              v20 = v123;
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v126, &v127, v119, v76);
              *v72 = v22;

              v69 = v74;
              v77 = v120;
              _os_log_impl((void *)&_mh_execute_header, v121, v70, "Connecting to car main scene for %@", v120, 0xCu);
              v78 = sub_100005888(&qword_100027E68);
              swift_arrayDestroy(v72, 1, v78);
              swift_slowDealloc(v72, -1, -1);
              swift_slowDealloc(v77, -1, -1);
            }
            else
            {

            }
            v79 = v124;
            v80 = v20;
            v81 = objc_msgSend(v69, "audioSettings");
            v82 = *(_QWORD *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_assetManager);
            objc_allocWithZone((Class)type metadata accessor for VSRootViewController(0));
            v83 = v79;
            swift_retain(v82);
            v123 = v83;
            v124 = v80;
            v84 = VSRootViewController.init(carSession:audioSettings:autoSettings:assetManager:)(v80, v81, v83, v82);
            v85 = String._bridgeToObjectiveC()();
            v86 = sub_100010B04(v85);

            v87 = v86;
            if (!v86)
            {
              static String._unconditionallyBridgeFromObjectiveC(_:)(0);
              v89 = v88;
              v87 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease(v89);
            }
            v90 = static String._unconditionallyBridgeFromObjectiveC(_:)(v86);
            v92 = v91;
            v93 = objc_msgSend(v69, "vehicleResources");
            if (v93)
            {
              v94 = v93;
              v95 = objc_msgSend(v93, "vehicleInformation");

              if (v95)
              {
                v122 = v69;
                v96 = objc_msgSend(v95, "vehicleUserVisibleLabel");

                v97 = static String._unconditionallyBridgeFromObjectiveC(_:)(v96);
                v99 = v98;

                v100 = HIBYTE(v99) & 0xF;
                if ((v99 & 0x2000000000000000) == 0)
                  v100 = v97 & 0xFFFFFFFFFFFFLL;
                if (v100)
                {

                  v126 = v97;
                  v127 = v99;
                  v125[0] = v90;
                  v125[1] = v92;
                  v101 = type metadata accessor for Locale(0);
                  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v101 - 8) + 56))(v4, 1, 1, v101);
                  v102 = sub_100010B64();
                  StringProtocol.range<A>(of:options:range:locale:)(v125, 1, 0, 0, 1, v4, &type metadata for String, &type metadata for String, v102, v102);
                  v104 = v103;
                  sub_10000BA58((uint64_t)v4, &qword_100028638);
                  if ((v104 & 1) != 0)
                  {
                    v126 = 32;
                    v127 = 0xE100000000000000;
                    v107 = v84;
                    v108._countAndFlagsBits = v90;
                    v108._object = v92;
                    String.append(_:)(v108);
                    swift_bridgeObjectRelease(v92);
                    v109 = v126;
                    v110 = (void *)v127;
                    v126 = v97;
                    v127 = v99;
                    swift_bridgeObjectRetain(v99);
                    v111._countAndFlagsBits = v109;
                    v111._object = v110;
                    String.append(_:)(v111);
                    swift_bridgeObjectRelease(v110);
                    swift_bridgeObjectRelease(v99);
                    v99 = v127;
                  }
                  else
                  {
                    swift_bridgeObjectRelease(v92);
                    v105 = v84;
                  }
                  v87 = String._bridgeToObjectiveC()();
                  swift_bridgeObjectRelease(v99);
                  v69 = v122;
                  goto LABEL_82;
                }
                swift_bridgeObjectRelease(v99);
                v69 = v122;
              }
            }
            swift_bridgeObjectRelease(v92);
            v106 = v84;
LABEL_82:
            v113 = v123;
            v112 = v124;
            objc_msgSend(v84, "setTitle:", v87);

            v114 = *(void **)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_rootViewController);
            *(_QWORD *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_rootViewController) = v84;
            v64 = v84;

            v115 = objc_msgSend(objc_allocWithZone((Class)UINavigationController), "initWithRootViewController:", v64);
            objc_msgSend(v12, "setRootViewController:", v115);

            CAFSignpostEmit_Rendered();
            v116 = *(_QWORD *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier + 8);
            if (v116)
            {
              v117 = *(_QWORD *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier);
              swift_bridgeObjectRetain(*(_QWORD *)(v1
                                                 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier
                                                 + 8));
              sub_10000E780(v117, v116);
              swift_bridgeObjectRelease(v116);
            }
            CAFSignpostEmit_Finalized(v69);

            goto LABEL_85;
          }
          if (qword_100027CD0 != -1)
            swift_once(&qword_100027CD0, sub_10000B1A8);
          v52 = qword_100029050;
          v53 = v24;
          v54 = static os_log_type_t.default.getter(v53);
          if (os_log_type_enabled(v52, v54))
          {
            v55 = (uint8_t *)swift_slowAlloc(8, -1);
            *(_DWORD *)v55 = 67109120;
            LODWORD(v126) = objc_msgSend(v53, "receivedAllValues");
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v126, (char *)&v126 + 4, v55 + 4, v55 + 8);

            _os_log_impl((void *)&_mh_execute_header, v52, v54, "Waiting for automaker settings to receive all values current... receivedAllValues=%{BOOL}d", v55, 8u);
            swift_slowDealloc(v55, -1, -1);
          }
          else
          {

          }
          *(_BYTE *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_spinnerVisible) = 1;
          sub_10000CDB0();

        }
        else
        {
          if (qword_100027CD0 != -1)
            swift_once(&qword_100027CD0, sub_10000B1A8);
          v41 = qword_100029050;
          v42 = v22;
          v43 = static os_log_type_t.default.getter(v42);
          if (os_log_type_enabled(v41, v43))
          {
            v44 = swift_slowAlloc(18, -1);
            *(_DWORD *)v44 = 134218240;
            v124 = (id)(v44 + 4);
            v45 = v20;
            v46 = objc_msgSend(v42, "accessories");
            v47 = type metadata accessor for UUID(0);
            v48 = sub_100005904(0, &qword_100028640, CAFAccessory_ptr);
            v49 = sub_100005B1C(&qword_100028648, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
            v50 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v46, v47, v48, v49);

            v20 = v45;
            v51 = *(_QWORD *)(v50 + 16);

            swift_bridgeObjectRelease(v50);
            v126 = v51;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v126, &v127, v124, v44 + 12);

            *(_WORD *)(v44 + 12) = 1024;
            LODWORD(v50) = objc_msgSend(v42, "isConfigured");

            LODWORD(v126) = v50;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v126, (char *)&v126 + 4, v44 + 14, v44 + 18);

            _os_log_impl((void *)&_mh_execute_header, v41, v43, "Waiting for automaker settings to exist... count=%ld isConfigured=%{BOOL}d", (uint8_t *)v44, 0x12u);
            swift_slowDealloc(v44, -1, -1);
          }
          else
          {

          }
          *(_BYTE *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_spinnerVisible) = 1;
          sub_10000CDB0();

        }
      }
      else
      {
        if (qword_100027CD0 != -1)
          v21 = (id)swift_once(&qword_100027CD0, sub_10000B1A8);
        v38 = qword_100029050;
        v39 = static os_log_type_t.default.getter(v21);
        if (os_log_type_enabled(v38, v39))
        {
          v40 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v40 = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, v39, "Waiting for a car...", v40, 2u);
          swift_slowDealloc(v40, -1, -1);
        }
        *(_BYTE *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_spinnerVisible) = 1;
        sub_10000CDB0();

      }
    }
    else
    {
      if (qword_100027CD0 != -1)
        v19 = (id)swift_once(&qword_100027CD0, sub_10000B1A8);
      v33 = qword_100029050;
      v34 = static os_log_type_t.default.getter(v19);
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v35 = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "Waiting for a car session...", v35, 2u);
        swift_slowDealloc(v35, -1, -1);
      }
      *(_BYTE *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_spinnerVisible) = 1;
      sub_10000CDB0();

    }
  }
  else
  {
    if (qword_100027CD0 != -1)
      v11 = swift_once(&qword_100027CD0, sub_10000B1A8);
    v16 = qword_100029050;
    v17 = static os_log_type_t.default.getter(v11);
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Waiting for a car window...", v18, 2u);
      swift_slowDealloc(v18, -1, -1);
    }
  }
}

uint64_t sub_10000E674()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v0 = sub_10000B2D0();
  if (v1)
  {
    v2 = v1;
    v3 = HIBYTE(v1) & 0xF;
    if ((v1 & 0x2000000000000000) == 0)
      v3 = v0 & 0xFFFFFFFFFFFFLL;
    if (v3)
    {
      sub_10000E780(v0, v1);
      return swift_bridgeObjectRelease(v2);
    }
    v0 = swift_bridgeObjectRelease(v1);
  }
  if (qword_100027CD0 != -1)
    v0 = swift_once(&qword_100027CD0, sub_10000B1A8);
  v5 = qword_100029050;
  v6 = static os_log_type_t.default.getter(v0);
  result = os_log_type_enabled(v5, v6);
  if ((_DWORD)result)
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "No available settings identifier in URL.", v7, 2u);
    return swift_slowDealloc(v7, -1, -1);
  }
  return result;
}

uint64_t sub_10000E780(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  id v16;
  uint64_t ObjectType;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(_QWORD, _QWORD, uint64_t, uint64_t);
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(_QWORD, _QWORD, uint64_t, uint64_t);
  id v37;
  uint64_t v38;
  uint64_t v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t *v57;
  uint64_t v58;
  NSObject *v60;
  uint64_t v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  id v70;
  id v71;
  id v72;
  uint64_t v73;
  NSString v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  _QWORD *v81;
  NSObject *v82;
  uint64_t v83;
  os_log_type_t v84;
  uint8_t *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  NSObject *v93;
  os_log_type_t v94;
  uint8_t *v95;
  uint64_t *v96;
  uint8_t *v97;
  id v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  uint64_t v107;

  v3 = v2;
  v5 = a1;
  v6 = OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_rootViewController;
  v7 = *(_QWORD *)(v2 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_rootViewController);
  if (v7)
  {
    v9 = *(_OWORD *)(v7 + direct field offset for CAFUITileViewController.settingsCache + 16);
    v8 = *(_OWORD *)(v7 + direct field offset for CAFUITileViewController.settingsCache + 32);
    v10 = *(_OWORD *)(v7 + direct field offset for CAFUITileViewController.settingsCache);
    v106 = *(_QWORD *)(v7 + direct field offset for CAFUITileViewController.settingsCache + 48);
    v104 = v9;
    v105 = v8;
    v103 = v10;
    v11 = *(_QWORD *)(v7 + direct field offset for CAFUITileViewController.requestContentManager);
    if (v11)
    {
      v107 = v103;
      if ((unint64_t)v103 >> 62)
      {
        if ((uint64_t)v103 >= 0)
          v90 = v103 & 0xFFFFFFFFFFFFFF8;
        else
          v90 = v103;
        sub_1000106FC(&v103);
        swift_retain(v11);
        sub_1000108D8(&v107);
        v91 = _CocoaArrayWrapper.endIndex.getter(v90);
        sub_100010900(&v107);
        if (v91)
          goto LABEL_5;
      }
      else
      {
        v12 = *(_QWORD *)((v103 & 0xFFFFFFFFFFFFFF8) + 0x10);
        sub_1000106FC(&v103);
        swift_retain(v11);
        if (v12)
        {
LABEL_5:
          v13 = *((_QWORD *)&v104 + 1);
          if (*(_QWORD *)(*((_QWORD *)&v104 + 1) + 16))
          {
            swift_bridgeObjectRetain(a2);
            v14 = sub_1000107D0(v5, a2);
            if ((v15 & 1) != 0)
            {
              v16 = *(id *)(*(_QWORD *)(v13 + 56) + 8 * v14);
              swift_bridgeObjectRelease(a2);
              ObjectType = swift_getObjectType(v16);
              v18 = swift_conformsToProtocol2(ObjectType, &protocol descriptor for CAFUIPickerRepresentable);
              if (v18)
                v19 = v18;
              else
                v19 = 0;
              if (v18)
                v20 = v16;
              else
                v20 = 0;
              v100 = v16;
              if (v20)
              {
                v21 = swift_getObjectType(v20);
                v22 = *(_QWORD *)(v19 + 8);
                v23 = *(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v22 + 72);
                v24 = v16;
                v25 = (void *)v23(0, 0, v21, v22);
                v27 = v26;
                v29 = v28;
                LODWORD(v23) = v28;

                if (!(_DWORD)v23)
                  goto LABEL_46;
                sub_1000108B0(v25, v27, v29);
                v16 = v100;
              }
              v30 = swift_getObjectType(v16);
              v31 = swift_conformsToProtocol2(v30, &protocol descriptor for CAFUIImageRepresentable);
              if (v31)
                v32 = v31;
              else
                v32 = 0;
              if (v31)
                v33 = v16;
              else
                v33 = 0;
              if (!v33)
              {
LABEL_25:
                v42 = CAFUISettingsCache.visibleChildren(of:)(v16);
                v43 = v42;
                if ((unint64_t)v42 >> 62)
                {
                  if (v42 >= 0)
                    v42 &= 0xFFFFFFFFFFFFFF8uLL;
                  v44 = _CocoaArrayWrapper.endIndex.getter(v42);
                }
                else
                {
                  v44 = *(_QWORD *)((v42 & 0xFFFFFFFFFFFFF8) + 0x10);
                }
                swift_bridgeObjectRelease(v43);
                if (v44)
                {
                  v45 = v16;
                  goto LABEL_29;
                }
                v67 = *((_QWORD *)&v105 + 1);
                if (*(_QWORD *)(*((_QWORD *)&v105 + 1) + 16))
                {
                  swift_bridgeObjectRetain(a2);
                  v68 = sub_1000107D0(v5, a2);
                  if ((v69 & 1) != 0)
                  {
                    v45 = *(id *)(*(_QWORD *)(v67 + 56) + 8 * v68);
                    swift_bridgeObjectRelease(a2);
LABEL_29:
                    v46 = v45;
                    v47 = CAFUISettingsCache.sections(for:)(v45);

                    if (*(_QWORD *)(v47 + 16))
                    {
LABEL_30:
                      if (qword_100027CD0 != -1)
                        swift_once(&qword_100027CD0, sub_10000B1A8);
                      v48 = qword_100029050;
                      v49 = swift_bridgeObjectRetain_n(a2, 2);
                      v50 = static os_log_type_t.default.getter(v49);
                      v99 = v47;
                      if (os_log_type_enabled(v48, v50))
                      {
                        v51 = (uint8_t *)swift_slowAlloc(12, -1);
                        v98 = v46;
                        v52 = swift_slowAlloc(32, -1);
                        v102 = v52;
                        *(_DWORD *)v51 = 136315138;
                        v97 = v51 + 4;
                        swift_bridgeObjectRetain(a2);
                        v101 = sub_1000100BC(v5, a2, &v102);
                        v16 = v100;
                        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v101, &v102, v51 + 4, v51 + 12);
                        swift_bridgeObjectRelease_n(a2, 3);
                        _os_log_impl((void *)&_mh_execute_header, v48, v50, "Launching modal settings presentation for setting %s", v51, 0xCu);
                        swift_arrayDestroy(v52, 1, (char *)&type metadata for Any + 8);
                        v53 = v52;
                        v46 = v98;
                        swift_slowDealloc(v53, -1, -1);
                        swift_slowDealloc(v51, -1, -1);
                      }
                      else
                      {
                        swift_bridgeObjectRelease_n(a2, 2);
                      }
                      v70 = objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_carSessionStatus), "currentSession", v97);
                      v71 = v70;
                      if (v70)
                      {
                        v72 = objc_msgSend(v70, "configuration");

                        v71 = objc_msgSend(v72, "rightHandDrive");
                      }
                      v73 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_assetManager);
                      objc_allocWithZone((Class)type metadata accessor for CAFUITileViewController(0));
                      swift_retain(v11);
                      swift_retain(v73);
                      v25 = (void *)CAFUITileViewController.init(isRHD:prominentCategories:listItems:settingsSections:settingsCache:assetManager:requestContentManager:preventVolumeNotification:)(v71, _swiftEmptyArrayStorage, _swiftEmptyArrayStorage, v99, &v103, v73, v11, 0);

                      goto LABEL_54;
                    }
LABEL_61:
                    swift_bridgeObjectRelease(v47);
                    sub_100010834((uint64_t *)&v103);
                    if (qword_100027CD0 != -1)
                      swift_once(&qword_100027CD0, sub_10000B1A8);
                    v82 = qword_100029050;
                    v83 = swift_bridgeObjectRetain_n(a2, 2);
                    v84 = static os_log_type_t.default.getter(v83);
                    if (os_log_type_enabled(v82, v84))
                    {
                      v85 = (uint8_t *)swift_slowAlloc(12, -1);
                      v86 = v46;
                      v87 = swift_slowAlloc(32, -1);
                      v102 = v87;
                      *(_DWORD *)v85 = 136315138;
                      swift_bridgeObjectRetain(a2);
                      v101 = sub_1000100BC(v5, a2, &v102);
                      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v101, &v102, v85 + 4, v85 + 12);
                      swift_bridgeObjectRelease_n(a2, 3);
                      _os_log_impl((void *)&_mh_execute_header, v82, v84, "No settings sections with setting %s", v85, 0xCu);
                      swift_arrayDestroy(v87, 1, (char *)&type metadata for Any + 8);
                      v88 = v87;
                      v46 = v86;
                      swift_slowDealloc(v88, -1, -1);
                      swift_slowDealloc(v85, -1, -1);
                    }
                    else
                    {
                      swift_bridgeObjectRelease_n(a2, 2);
                    }
                    v89 = (_QWORD *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier);
                    v66 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier + 8);
                    *v89 = 0;
                    v89[1] = 0;

                    swift_release(v11);
                    return swift_bridgeObjectRelease(v66);
                  }
                  swift_bridgeObjectRelease(a2);
                }
                v47 = CAFUISettingsCache.categorySettings(for:)(objc_msgSend(v16, "category"));
                v46 = 0;
                if (*(_QWORD *)(v47 + 16))
                  goto LABEL_30;
                goto LABEL_61;
              }
              v34 = swift_getObjectType(v33);
              v35 = *(_QWORD *)(v32 + 8);
              v36 = *(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v35 + 72);
              v37 = v16;
              v25 = (void *)v36(0, 0, v34, v35);
              v39 = v38;
              v41 = v40;
              LODWORD(v36) = v40;

              if ((_DWORD)v36)
              {
                sub_1000108B0(v25, v39, v41);
                v16 = v100;
                goto LABEL_25;
              }
LABEL_46:
              sub_100010834((uint64_t *)&v103);
              v16 = v100;
LABEL_54:
              v74 = objc_msgSend(v16, "userVisibleLabel");
              if (!v74)
              {
                static String._unconditionallyBridgeFromObjectiveC(_:)(0);
                v76 = v75;
                v74 = String._bridgeToObjectiveC()();
                swift_bridgeObjectRelease(v76);
              }
              objc_msgSend(v25, "setTitle:", v74);

              v77 = objc_msgSend(v25, "navigationItem");
              v78 = objc_msgSend(objc_allocWithZone((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 24, v3, "dismissSettingsModal");
              objc_msgSend(v77, "setLeftBarButtonItem:", v78);

              v79 = objc_msgSend(objc_allocWithZone((Class)UINavigationController), "initWithRootViewController:", v25);
              v80 = *(void **)(v3 + v6);
              if (v80)
                objc_msgSend(v80, "presentViewController:animated:completion:", v79, 1, 0);
              v81 = (_QWORD *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier);
              v66 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier + 8);
              *v81 = 0;
              v81[1] = 0;

              swift_release(v11);
              return swift_bridgeObjectRelease(v66);
            }
            swift_bridgeObjectRelease(a2);
          }
          sub_100010834((uint64_t *)&v103);
          if (qword_100027CD0 != -1)
            swift_once(&qword_100027CD0, sub_10000B1A8);
          v60 = qword_100029050;
          v61 = swift_bridgeObjectRetain_n(a2, 2);
          v62 = static os_log_type_t.default.getter(v61);
          if (os_log_type_enabled(v60, v62))
          {
            v63 = (uint8_t *)swift_slowAlloc(12, -1);
            v64 = swift_slowAlloc(32, -1);
            v102 = v64;
            *(_DWORD *)v63 = 136315138;
            swift_bridgeObjectRetain(a2);
            v101 = sub_1000100BC(v5, a2, &v102);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v101, &v102, v63 + 4, v63 + 12);
            swift_bridgeObjectRelease_n(a2, 3);
            _os_log_impl((void *)&_mh_execute_header, v60, v62, "No known setting with identifier %s.", v63, 0xCu);
            swift_arrayDestroy(v64, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v64, -1, -1);
            swift_slowDealloc(v63, -1, -1);
          }
          else
          {
            swift_bridgeObjectRelease_n(a2, 2);
          }
          v65 = (_QWORD *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier);
          v66 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier + 8);
          *v65 = 0;
          v65[1] = 0;
LABEL_76:
          swift_release(v11);
          return swift_bridgeObjectRelease(v66);
        }
      }
      v92 = sub_100010834((uint64_t *)&v103);
      if (qword_100027CD0 != -1)
        v92 = (uint64_t *)swift_once(&qword_100027CD0, sub_10000B1A8);
      v93 = qword_100029050;
      v94 = static os_log_type_t.default.getter(v92);
      if (os_log_type_enabled(v93, v94))
      {
        v95 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v95 = 0;
        _os_log_impl((void *)&_mh_execute_header, v93, v94, "AutoSettings doesn't yet have an automakerSettings accessory.", v95, 2u);
        swift_slowDealloc(v95, -1, -1);
      }
      v96 = (uint64_t *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier);
      v66 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier + 8);
      *v96 = v5;
      v96[1] = a2;
      swift_bridgeObjectRetain(a2);
      goto LABEL_76;
    }
  }
  if (qword_100027CD0 != -1)
    a1 = swift_once(&qword_100027CD0, sub_10000B1A8);
  v54 = qword_100029050;
  v55 = static os_log_type_t.default.getter(a1);
  if (os_log_type_enabled(v54, v55))
  {
    v56 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v56 = 0;
    _os_log_impl((void *)&_mh_execute_header, v54, v55, "AutoSettings has no root view controller, and cannot yet show a setting by URL", v56, 2u);
    swift_slowDealloc(v56, -1, -1);
  }
  v57 = (uint64_t *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier);
  v58 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier + 8);
  *v57 = v5;
  v57[1] = a2;
  swift_bridgeObjectRetain(a2);
  return swift_bridgeObjectRelease(v58);
}

void sub_10000F284(void *a1)
{
  uint64_t v1;
  NSObject *v3;
  id v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;

  if (qword_100027CD0 != -1)
    swift_once(&qword_100027CD0, sub_10000B1A8);
  v3 = qword_100029050;
  v4 = a1;
  v5 = static os_log_type_t.default.getter(v4);
  if (os_log_type_enabled(v3, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    v14 = v4;
    v8 = v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v6 + 4, v6 + 12);
    *v7 = v4;

    _os_log_impl((void *)&_mh_execute_header, v3, v5, "%@ has updated accessories", v6, 0xCu);
    v9 = sub_100005888(&qword_100027E68);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }
  else
  {

  }
  v10 = objc_msgSend(v4, "automakerSettings");
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "registerObserver:", v1);

  }
  v12 = objc_msgSend(v4, "automakerNotificationHistory");
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, "registerObserver:", v1);

  }
  sub_10000D84C();
}

void sub_10000F5E8(void *a1, char a2)
{
  NSObject *v4;
  id v5;
  os_log_type_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  int v11;
  id v12;
  uint64_t v13;

  if (qword_100027CD0 != -1)
    swift_once(&qword_100027CD0, sub_10000B1A8);
  v4 = qword_100029050;
  v5 = a1;
  v6 = static os_log_type_t.default.getter(v5);
  if (os_log_type_enabled(v4, v6))
  {
    v7 = swift_slowAlloc(18, -1);
    v10 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v7 = 138412546;
    v12 = v5;
    v8 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13, v7 + 4, v7 + 12);
    *v10 = v5;

    *(_WORD *)(v7 + 12) = 1024;
    v11 = a2 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v7 + 14, v7 + 18);
    _os_log_impl((void *)&_mh_execute_header, v4, v6, "%@ updated receivedAllValues=%{BOOL}d", (uint8_t *)v7, 0x12u);
    v9 = sub_100005888(&qword_100027E68);
    swift_arrayDestroy(v10, 1, v9);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v7, -1, -1);
  }
  else
  {

  }
  sub_10000D84C();
}

void sub_10000F7E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  _BYTE v4[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v4, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    sub_10000D84C();

  }
}

uint64_t sub_10000F838(uint64_t a1)
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

void sub_10000F8B0()
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
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t KeyPath;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  double v21;
  void (*v22)(char *, uint64_t);
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  id v35;
  uint64_t v36;
  id v38[3];

  v1 = v0;
  v2 = type metadata accessor for Date(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v38[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v38[-1] - v7;
  v9 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v10 = objc_msgSend(v9, "delegate");

  if (v10)
  {
    v11 = type metadata accessor for AppDelegate(0);
    v12 = swift_dynamicCastClassUnconditional(v10, v11, 0, 0, 0);
    KeyPath = swift_getKeyPath(&unk_100018550);
    v14 = swift_getKeyPath(&unk_100018578);
    static Published.subscript.getter(v38, v12, KeyPath, v14);
    swift_unknownObjectRelease(v10);
    swift_release(KeyPath);
    swift_release(v14);
    v15 = v38[0];
    if (v38[0])
    {
      v16 = objc_msgSend(v38[0], "rootViewController");

      if (v16)
      {
        v17 = objc_opt_self(UINavigationController);
        v18 = swift_dynamicCastObjCClass(v16, v17);
        if (v18)
        {
          v19 = (void *)v18;
          Date.init()();
          v20 = v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_lastBackgroundTime;
          swift_beginAccess(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_lastBackgroundTime, v38, 0, 0);
          (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v20, v2);
          v21 = Date.timeIntervalSince(_:)(v6);
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          v22(v8, v2);
          v23 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_cafCarManager), "currentCar");
          if (v23
            && (v24 = v23,
                v25 = objc_msgSend(v23, "automakerNotificationHistory"),
                v24,
                v25))
          {
            sub_100005BB8();
            v27 = v26;

            if ((unint64_t)v27 >> 62)
            {
              if (v27 < 0)
                v36 = v27;
              else
                v36 = v27 & 0xFFFFFFFFFFFFFF8;
              swift_bridgeObjectRetain(v27);
              v28 = _CocoaArrayWrapper.endIndex.getter(v36);
              swift_bridgeObjectRelease(v27);
            }
            else
            {
              v28 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
            }
            v23 = (id)swift_bridgeObjectRelease(v27);
            if (v21 >= 420.0)
              goto LABEL_10;
          }
          else
          {
            v28 = 0;
            if (v21 >= 420.0)
            {
LABEL_10:
              if (qword_100027CD0 != -1)
                v23 = (id)swift_once(&qword_100027CD0, sub_10000B1A8);
              v29 = qword_100029050;
              v30 = static os_log_type_t.default.getter(v23);
              if (os_log_type_enabled(v29, v30))
              {
                v31 = (uint8_t *)swift_slowAlloc(2, -1);
                *(_WORD *)v31 = 0;
                _os_log_impl((void *)&_mh_execute_header, v29, v30, "Settings app root timeout; returning to root view",
                  v31,
                  2u);
                swift_slowDealloc(v31, -1, -1);
              }
              goto LABEL_22;
            }
          }
          if (v21 < 210.0
            || *(_QWORD *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_lastNotificationCount) == v28)
          {
            goto LABEL_23;
          }
          if (qword_100027CD0 != -1)
            v23 = (id)swift_once(&qword_100027CD0, sub_10000B1A8);
          v32 = qword_100029050;
          v33 = static os_log_type_t.default.getter(v23);
          if (os_log_type_enabled(v32, v33))
          {
            v34 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v34 = 0;
            _os_log_impl((void *)&_mh_execute_header, v32, v33, "Settings app half timeout due to notification count update; returning to root view",
              v34,
              2u);
            swift_slowDealloc(v34, -1, -1);
          }
LABEL_22:
          v35 = objc_msgSend(v19, "popToRootViewControllerAnimated:", 1);

          v16 = v35;
          if (!v35)
          {
LABEL_24:
            *(_QWORD *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_lastNotificationCount) = v28;
            return;
          }
LABEL_23:

          goto LABEL_24;
        }

      }
    }
  }
  else
  {
    __break(1u);
  }
}

id sub_10000FD24()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SettingsCarManager(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000FDFC()
{
  return type metadata accessor for SettingsCarManager(0);
}

uint64_t type metadata accessor for SettingsCarManager(uint64_t a1)
{
  uint64_t result;

  result = qword_100028608;
  if (!qword_100028608)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SettingsCarManager);
  return result;
}

uint64_t sub_10000FE40(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[9];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[4] = "\b";
  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(result - 8) + 64;
    v4[6] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[7] = &unk_100018520;
    v4[8] = &unk_100018538;
    result = swift_updateClassMetadata2(a1, 256, 9, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_10000FFC8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100018550);
  v5 = swift_getKeyPath(&unk_100018578);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_100010048(void **a1, void **a2)
{
  void *v2;
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  id v6;
  void *v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100018550);
  v5 = swift_getKeyPath(&unk_100018578);
  v8 = v2;
  v6 = v2;
  return static Published.subscript.setter(&v8, v3, KeyPath, v5);
}

uint64_t sub_1000100BC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10001018C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100010948((uint64_t)v12, *a3);
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
      sub_100010948((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100010928(v12);
  return v7;
}

uint64_t sub_10001018C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100010344(a5, a6);
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

uint64_t sub_100010344(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_1000103D8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000105B0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000105B0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_1000103D8(uint64_t a1, unint64_t a2)
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
      v5 = sub_10001054C(v4, 0);
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

_QWORD *sub_10001054C(uint64_t a1, uint64_t a2)
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
  v4 = sub_100005888(&qword_100028630);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000105B0(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100005888(&qword_100028630);
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

_QWORD *sub_1000106FC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  swift_bridgeObjectRetain(*a1);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

unint64_t sub_100010778(Swift::UInt8 a1)
{
  uint64_t v1;
  Swift::Int v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, *(_QWORD *)(v1 + 40));
  Hasher._combine(_:)(a1);
  v3 = Hasher._finalize()();
  return sub_100010984(a1, v3);
}

unint64_t sub_1000107D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100010A24(a1, a2, v5);
}

uint64_t *sub_100010834(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v6 = a1[4];
  v7 = a1[5];
  swift_bridgeObjectRelease(a1[6]);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  return a1;
}

void sub_1000108B0(void *a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 == 2)
  {
    swift_bridgeObjectRelease(a2);
  }
  else if (a3 <= 1u)
  {

  }
}

_QWORD *sub_1000108D8(_QWORD *a1)
{
  swift_bridgeObjectRetain(*a1);
  return a1;
}

_QWORD *sub_100010900(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  return a1;
}

uint64_t sub_100010928(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100010948(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100010984(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_100010A24(uint64_t a1, uint64_t a2, uint64_t a3)
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

id sub_100010B04(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = CAFUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v1, &stru_100021018, CFSTR("Localizable")));

  return v4;
}

unint64_t sub_100010B64()
{
  unint64_t result;

  result = qword_100028650;
  if (!qword_100028650)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100028650);
  }
  return result;
}

uint64_t sub_100010BA8(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v1 = result;
  v2 = (unint64_t)result >> 62;
  if ((unint64_t)result >> 62)
  {
    if (result < 0)
      v6 = result;
    else
      v6 = result & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(result);
    v3 = _CocoaArrayWrapper.endIndex.getter(v6);
    result = swift_bridgeObjectRelease(v1);
    if (v3)
    {
LABEL_3:
      sub_100005888(&qword_1000286C8);
      result = static _SetStorage.allocate(capacity:)(v3);
      v4 = (_QWORD *)result;
      v24 = v1;
      if (!v2)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v3 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
  }
  v4 = &_swiftEmptySetSingleton;
  v24 = v1;
  if (!v2)
  {
LABEL_4:
    v5 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v5)
      return (uint64_t)v4;
    goto LABEL_15;
  }
LABEL_11:
  if (v1 < 0)
    v7 = v1;
  else
    v7 = v1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v1);
  v5 = _CocoaArrayWrapper.endIndex.getter(v7);
  result = swift_bridgeObjectRelease(v1);
  if (!v5)
    return (uint64_t)v4;
LABEL_15:
  v8 = 0;
  v9 = (char *)(v4 + 7);
  v23 = v5;
  while ((v24 & 0xC000000000000001) != 0)
  {
    result = specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v24);
    v10 = __OFADD__(v8++, 1);
    if (v10)
      goto LABEL_32;
LABEL_24:
    v25 = result;
    v27 = result;
    v11 = v4[5];
    v12 = type metadata accessor for AnyCancellable(0);
    v13 = sub_100005B1C(&qword_1000286D0, (uint64_t (*)(uint64_t))&type metadata accessor for AnyCancellable, (uint64_t)&protocol conformance descriptor for AnyCancellable);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v11, v12, v13);
    v14 = -1 << *((_BYTE *)v4 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    v17 = *(_QWORD *)&v9[8 * (v15 >> 6)];
    v18 = 1 << v15;
    if (((1 << v15) & v17) != 0)
    {
      v19 = ~v14;
      v20 = sub_100005B1C(&qword_1000286D8, (uint64_t (*)(uint64_t))&type metadata accessor for AnyCancellable, (uint64_t)&protocol conformance descriptor for AnyCancellable);
      do
      {
        v26 = *(_QWORD *)(v4[6] + 8 * v15);
        result = dispatch thunk of static Equatable.== infix(_:_:)(&v26, &v27, v12, v20);
        if ((result & 1) != 0)
        {
          result = swift_release(v25);
          v5 = v23;
          goto LABEL_17;
        }
        v15 = (v15 + 1) & v19;
        v16 = v15 >> 6;
        v17 = *(_QWORD *)&v9[8 * (v15 >> 6)];
        v18 = 1 << v15;
      }
      while ((v17 & (1 << v15)) != 0);
      v5 = v23;
    }
    *(_QWORD *)&v9[8 * v16] = v18 | v17;
    *(_QWORD *)(v4[6] + 8 * v15) = v25;
    v21 = v4[2];
    v10 = __OFADD__(v21, 1);
    v22 = v21 + 1;
    if (v10)
      goto LABEL_33;
    v4[2] = v22;
LABEL_17:
    if (v8 == v5)
      return (uint64_t)v4;
  }
  if (v8 >= *(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_34;
  result = swift_retain(*(_QWORD *)(v24 + 32 + 8 * v8));
  v10 = __OFADD__(v8++, 1);
  if (!v10)
    goto LABEL_24;
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

void sub_100010E3C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  os_log_type_t v16;
  uint8_t *v17;
  id v18;
  NSObject *v19;
  id v20;
  os_log_type_t v21;
  uint8_t *v22;
  os_log_t log;
  id v24;
  uint64_t v25;

  if (a1)
  {
    v3 = qword_100027CD0;
    v4 = a1;
    if (v3 != -1)
      swift_once(&qword_100027CD0, sub_10000B1A8);
    v5 = &unk_100029000;
    v6 = qword_100029050;
    v7 = v4;
    v8 = static os_log_type_t.default.getter(v7);
    if (os_log_type_enabled(v6, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(12, -1);
      v10 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v9 = 138412290;
      log = v6;
      v24 = v7;
      v11 = v7;
      v5 = &unk_100029000;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v9 + 4, v9 + 12);
      *v10 = a1;

      _os_log_impl((void *)&_mh_execute_header, v6, v8, "%@ has been updated", v9, 0xCu);
      v12 = sub_100005888(&qword_100027E68);
      swift_arrayDestroy(v10, 1, v12);
      swift_slowDealloc(v10, -1, -1);
      swift_slowDealloc(v9, -1, -1);
    }
    else
    {

    }
    objc_msgSend(v7, "registerObserver:", v1, log, v24);
    v13 = objc_msgSend(v7, "automakerSettings");
    if (v13)
    {
      v14 = *((_QWORD *)v5 + 10);
      v15 = v13;
      v16 = static os_log_type_t.default.getter(v15);
      if (os_log_type_enabled(v14, v16))
      {
        v17 = (uint8_t *)swift_slowAlloc(8, -1);
        *(_DWORD *)v17 = 67109120;
        LODWORD(v24) = objc_msgSend(v15, "receivedAllValues");
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, (char *)&v24 + 4, v17 + 4, v17 + 8);

        _os_log_impl((void *)&_mh_execute_header, v14, v16, "AutomakerSettings is available... receivedAllValues=%{BOOL}d", v17, 8u);
        swift_slowDealloc(v17, -1, -1);
      }
      else
      {

      }
      objc_msgSend(v15, "registerObserver:", v1);

    }
    v18 = objc_msgSend(v7, "automakerNotificationHistory");
    if (v18)
    {
      v19 = *((_QWORD *)v5 + 10);
      v20 = v18;
      v21 = static os_log_type_t.default.getter(v20);
      if (os_log_type_enabled(v19, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc(8, -1);
        *(_DWORD *)v22 = 67109120;
        LODWORD(v24) = objc_msgSend(v20, "receivedAllValues");
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, (char *)&v24 + 4, v22 + 4, v22 + 8);

        _os_log_impl((void *)&_mh_execute_header, v19, v21, "NotificationHistory is available... receivedAllValues=%{BOOL}d", v22, 8u);
        swift_slowDealloc(v22, -1, -1);
      }
      else
      {

      }
      objc_msgSend(v20, "registerObserver:", v1);

    }
    sub_10000D84C();

  }
}

void sub_1000111A0(void *a1)
{
  NSObject *v2;
  id v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  if (qword_100027CD0 != -1)
    swift_once(&qword_100027CD0, sub_10000B1A8);
  v2 = qword_100029050;
  v3 = a1;
  v4 = static os_log_type_t.default.getter(v3);
  if (os_log_type_enabled(v2, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v5 = 138412290;
    v9 = v3;
    v7 = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v9, &v10, v5 + 4, v5 + 12);
    *v6 = v3;

    _os_log_impl((void *)&_mh_execute_header, v2, v4, "%@ has updated receivedAllValues", v5, 0xCu);
    v8 = sub_100005888(&qword_100027E68);
    swift_arrayDestroy(v6, 1, v8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);
  }
  else
  {

  }
  sub_10000D84C();
}

uint64_t sub_100011314(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  id v6;
  void *v7;
  uint64_t v8;

  if (!((unint64_t)a1 >> 62))
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(a1);
    if (v3)
      goto LABEL_3;
    return swift_bridgeObjectRelease(a1);
  }
  if (a1 < 0)
    v8 = a1;
  else
    v8 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a1);
  result = _CocoaArrayWrapper.endIndex.getter(v8);
  v3 = result;
  if (!result)
    return swift_bridgeObjectRelease(a1);
LABEL_3:
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
      else
        v6 = *(id *)(a1 + 8 * i + 32);
      v7 = v6;
      objc_msgSend(v6, "unregisterObserver:", v1);

    }
    return swift_bridgeObjectRelease(a1);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000113E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[5];
  uint64_t v19;

  v1 = type metadata accessor for DispatchWorkItemFlags(0);
  v17 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for DispatchQoS(0);
  v4 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = swift_allocObject(&unk_100020EF8, 24, 7);
  swift_unknownObjectWeakInit(v7 + 16, v0);
  sub_100005904(0, &qword_100028660, OS_dispatch_queue_ptr);
  v8 = (void *)static OS_dispatch_queue.main.getter();
  aBlock[4] = sub_100011634;
  v19 = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000F838;
  aBlock[3] = &unk_100020F10;
  v9 = _Block_copy(aBlock);
  v10 = v19;
  swift_retain(v7);
  v11 = swift_release(v10);
  static DispatchQoS.unspecified.getter(v11);
  aBlock[0] = _swiftEmptyArrayStorage;
  v12 = sub_100005B1C(&qword_100028668, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v13 = sub_100005888(&qword_100028670);
  v14 = sub_100009B7C(&qword_100028678, &qword_100028670, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v13, v14, v1, v12);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v6, v3, v9);
  _Block_release(v9);

  (*(void (**)(char *, uint64_t))(v17 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v16);
  return swift_release(v7);
}

uint64_t sub_100011610()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100011634()
{
  uint64_t v0;

  sub_10000F7E8(v0);
}

uint64_t sub_10001163C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001164C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100011654()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000286B8;
  if (!qword_1000286B8)
  {
    v1 = sub_100005904(255, &qword_1000286A8, NSRunLoop_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSRunLoop, v1);
    atomic_store(result, (unint64_t *)&qword_1000286B8);
  }
  return result;
}

void sub_1000116AC(uint64_t a1)
{
  uint64_t v1;

  sub_10000D7DC(a1, v1);
}

_QWORD *VSRootViewController.__allocating_init(carSession:audioSettings:autoSettings:assetManager:)(void *a1, void *a2, void *a3, uint64_t a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return VSRootViewController.init(carSession:audioSettings:autoSettings:assetManager:)(a1, a2, a3, a4);
}

_QWORD *VSRootViewController.init(carSession:audioSettings:autoSettings:assetManager:)(void *a1, void *a2, void *a3, uint64_t a4)
{
  char *v4;
  char *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  _QWORD *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  id v42;
  id v43;
  _QWORD *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(_QWORD *);
  _QWORD *v84;
  void *v86;
  uint64_t v87;
  id v88;
  id v90;
  id v91;
  uint64_t v92;
  _QWORD v93[7];

  v5 = v4;
  v9 = OBJC_IVAR____TtC12AutoSettings20VSRootViewController_generalListItem;
  *(_QWORD *)&v5[OBJC_IVAR____TtC12AutoSettings20VSRootViewController_generalListItem] = 0;
  v10 = OBJC_IVAR____TtC12AutoSettings20VSRootViewController_audioListItem;
  *(_QWORD *)&v5[OBJC_IVAR____TtC12AutoSettings20VSRootViewController_audioListItem] = 0;
  v11 = OBJC_IVAR____TtC12AutoSettings20VSRootViewController_notificationListItem;
  *(_QWORD *)&v5[OBJC_IVAR____TtC12AutoSettings20VSRootViewController_notificationListItem] = 0;
  v12 = type metadata accessor for CAFUIRequestContentManager(0);
  swift_allocObject(v12, 25, 7);
  v13 = v5;
  v91 = a1;
  v92 = CAFUIRequestContentManager.init(session:)();
  v14 = *(_QWORD *)&v5[v11];
  *(_QWORD *)&v5[v11] = 0;
  swift_release(v14);
  v15 = *(_QWORD *)&v5[v9];
  *(_QWORD *)&v5[v9] = 0;
  swift_release(v15);
  v16 = *(_QWORD *)&v5[v10];
  *(_QWORD *)&v5[v10] = 0;
  swift_release(v16);
  *(_QWORD *)&v13[OBJC_IVAR____TtC12AutoSettings20VSRootViewController_autoSettings] = a3;
  *(_QWORD *)&v13[OBJC_IVAR____TtC12AutoSettings20VSRootViewController_audioSettings] = a2;
  v86 = a2;
  v17 = a2;
  v90 = a3;

  v18 = CAFAutomakerSettings.allSettings.getter();
  v19 = objc_msgSend(v90, "settingsSections");
  if (v19)
  {
    v20 = v19;
    v21 = sub_100005904(0, (unint64_t *)&unk_100028768, CAFSettingsSection_ptr);
    v22 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v20, v21);

  }
  else
  {
    v22 = 0;
  }
  v88 = v17;
  CAFUISettingsCache.init(settings:sections:)(v93, v18, v22);
  v23 = CAFUISettingsCache.categorySettings(for:)(3);
  v24 = CAFUISettingsCache.categorySettings(for:)(0);
  v25 = *(_QWORD *)(v24 + 16);
  if (v25)
  {
    sub_100012D14(0, v25, 0);
    v26 = (_QWORD *)(v24 + 72);
    do
    {
      v27 = *v26;
      v28 = _swiftEmptyArrayStorage[2];
      v29 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain(*v26);
      if (v28 >= v29 >> 1)
        sub_100012D14(v29 > 1, v28 + 1, 1);
      _swiftEmptyArrayStorage[2] = v28 + 1;
      _swiftEmptyArrayStorage[v28 + 4] = v27;
      v26 += 6;
      --v25;
    }
    while (v25);
  }
  sub_100011F00((uint64_t)_swiftEmptyArrayStorage);
  v31 = v30;
  v32 = v91;
  if ((v30 & 0xC000000000000001) != 0)
  {
    if (v30 >= 0)
      v30 &= 0xFFFFFFFFFFFFFF8uLL;
    v33 = __CocoaSet.count.getter(v30);
  }
  else
  {
    v33 = *(_QWORD *)(v30 + 16);
  }
  swift_bridgeObjectRelease(v31);
  if (v33 <= 9999)
  {
    swift_bridgeObjectRetain(v24);
    v34 = (_QWORD *)v24;
  }
  else
  {
    v34 = _swiftEmptyArrayStorage;
  }
  v35 = *(_QWORD *)(v24 + 16);
  swift_bridgeObjectRelease(v24);
  if (v35)
  {
    v36 = sub_100012C1C(0, 1, 1, _swiftEmptyArrayStorage);
    v38 = v36[2];
    v37 = v36[3];
    if (v38 >= v37 >> 1)
      v36 = sub_100012C1C((_QWORD *)(v37 > 1), v38 + 1, 1, v36);
    v36[2] = v38 + 1;
    *((_BYTE *)v36 + v38 + 32) = 0;
  }
  else
  {
    v36 = _swiftEmptyArrayStorage;
  }
  v39 = *(_QWORD *)(v23 + 16);
  swift_bridgeObjectRelease(v23);
  if (v39)
  {
    if ((swift_isUniquelyReferenced_nonNull_native(v36) & 1) == 0)
      v36 = sub_100012C1C(0, v36[2] + 1, 1, v36);
    v41 = v36[2];
    v40 = v36[3];
    if (v41 >= v40 >> 1)
      v36 = sub_100012C1C((_QWORD *)(v40 > 1), v41 + 1, 1, v36);
    v36[2] = v41 + 1;
    *((_BYTE *)v36 + v41 + 32) = 3;
  }
  v42 = objc_msgSend(v91, "configuration", v86);
  v43 = objc_msgSend(v42, "rightHandDrive");

  swift_retain(a4);
  swift_retain(v92);
  v44 = (id)CAFUITileViewController.init(isRHD:prominentCategories:listItems:settingsSections:settingsCache:assetManager:requestContentManager:preventVolumeNotification:)(v43, v36, _swiftEmptyArrayStorage, v34, v93, a4, v92, 0);
  v45 = v90;
  v46 = objc_msgSend(v90, "car");
  if (!v46)
    goto LABEL_47;
  v47 = v46;
  v48 = objc_msgSend(v46, "automakerNotificationHistory");
  if (!v48)
  {

LABEL_47:
    v65 = *(_QWORD *)((char *)v44 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_notificationListItem);
    *(_QWORD *)((char *)v44 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_notificationListItem) = 0;
    swift_release(v65);
    v60 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    objc_msgSend(v60, "setApplicationIconBadgeNumber:", 0);
    goto LABEL_48;
  }
  v49 = v48;
  sub_100005BB8();
  v51 = v50;

  if ((unint64_t)v51 >> 62)
  {
    if (v51 < 0)
      v63 = v51;
    else
      v63 = v51 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v51);
    v64 = _CocoaArrayWrapper.endIndex.getter(v63);
    swift_bridgeObjectRelease(v51);
    if (v64)
      goto LABEL_32;
    goto LABEL_46;
  }
  if (!*(_QWORD *)((v51 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_46:

    swift_bridgeObjectRelease(v51);
    v45 = v90;
    v32 = v91;
    goto LABEL_47;
  }
LABEL_32:
  v52 = type metadata accessor for CAFUINotificationListItem();
  swift_allocObject(v52, 120, 7);
  swift_retain(v92);
  v53 = v47;
  v54 = sub_1000125C0(v53, v92);
  v55 = *(_QWORD *)((char *)v44 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_notificationListItem);
  *(_QWORD *)((char *)v44 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_notificationListItem) = v54;
  swift_retain_n(v54, 2);
  v56 = swift_release(v55);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v56);
  v58 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
  v57 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v58 >= v57 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v57 > 1, v58 + 1, 1);
  v59 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v58, v54);
  specialized Array._endMutation()(v59);
  v60 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  if ((unint64_t)v51 >> 62)
  {
    if (v51 < 0)
      v62 = v51;
    else
      v62 = v51 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v51);
    v61 = _CocoaArrayWrapper.endIndex.getter(v62);
    swift_bridgeObjectRelease(v51);
  }
  else
  {
    v61 = *(_QWORD *)((v51 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v51);
  objc_msgSend(v60, "setApplicationIconBadgeNumber:", v61);

  swift_release(v54);
  v45 = v90;
  v32 = v91;
LABEL_48:

  if (v33 >= 10000
    && (v66 = v44, v67 = CAFUITileViewController.createGeneralListItem()(), v66, v67))
  {
    v68 = swift_retain(v67);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v68);
    v70 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
    v69 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
    v71 = v88;
    if (v70 >= v69 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v69 > 1, v70 + 1, 1);
    v72 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v70, v67);
    specialized Array._endMutation()(v72);
    v73 = *(_QWORD *)((char *)v66 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_generalListItem);
    *(_QWORD *)((char *)v66 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_generalListItem) = v67;
  }
  else
  {
    v73 = *(_QWORD *)((char *)v44 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_generalListItem);
    *(_QWORD *)((char *)v44 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_generalListItem) = 0;
    v71 = v88;
  }
  swift_release(v73);
  if (!v87)
    goto LABEL_60;
  v74 = v71;
  v75 = v44;
  v76 = CAFUITileViewController.createAudioListItem(audioSettings:)(v74);

  if (!v76)
  {

LABEL_60:
    v82 = *(_QWORD *)((char *)v44 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_audioListItem);
    *(_QWORD *)((char *)v44 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_audioListItem) = 0;
    swift_release(v82);
    goto LABEL_61;
  }
  v77 = *(_QWORD *)((char *)v75 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_audioListItem);
  *(_QWORD *)((char *)v75 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_audioListItem) = v76;
  swift_retain_n(v76, 2);
  v78 = swift_release(v77);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v78);
  v80 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
  v79 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v80 >= v79 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v79 > 1, v80 + 1, 1);
  v81 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v80, v76);
  specialized Array._endMutation()(v81);
  swift_release(v76);

LABEL_61:
  v83 = *(void (**)(_QWORD *))((swift_isaMask & *v44) + 0x160);
  v84 = v44;
  v83(_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  swift_release(v92);

  swift_release(a4);
  return v84;
}

void sub_100011F00(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12[2];

  v2 = sub_100005904(0, &qword_1000289B0, CAFAutomakerSetting_ptr);
  v3 = sub_1000142A0();
  v4 = 0;
  v5 = 0;
  v12[1] = (id)Set.init(minimumCapacity:)(0, v2, v3);
LABEL_15:
  while (1)
  {
    v10 = *(_QWORD *)(a1 + 16);
    if (v5 == v10)
      break;
    if (v5 >= v10)
      goto LABEL_22;
    v11 = *(_QWORD *)(a1 + 32 + 8 * v5);
    swift_bridgeObjectRetain(v11);
    swift_bridgeObjectRelease(v4);
    v4 = v11;
    ++v5;
    if (v11)
    {
      v6 = 0;
      if (v11 >= 0)
        v7 = v11 & 0xFFFFFFFFFFFFFF8;
      else
        v7 = v11;
      if ((unint64_t)v11 >> 62)
        goto LABEL_12;
      while (v6 != *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        while (1)
        {
          if ((v4 & 0xC000000000000001) != 0)
          {
            v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v4);
          }
          else
          {
            if (v6 >= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
LABEL_21:
              __break(1u);
LABEL_22:
              __break(1u);
              return;
            }
            v8 = *(id *)(v4 + 8 * v6 + 32);
          }
          if (__OFADD__(v6, 1))
            goto LABEL_21;
          sub_100012D8C((Swift::Int *)v12, v8);

          ++v6;
          if (!(v4 >> 62))
            break;
LABEL_12:
          swift_bridgeObjectRetain(v4);
          v9 = _CocoaArrayWrapper.endIndex.getter(v7);
          swift_bridgeObjectRelease(v4);
          if (v6 == v9)
            goto LABEL_15;
        }
      }
    }
  }
  swift_bridgeObjectRelease(a1);
  swift_bridgeObjectRelease(v4);
}

uint64_t sub_100012088()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_generalListItem));
  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_audioListItem));
  return swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_notificationListItem));
}

id VSRootViewController.__deallocating_deinit()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  objc_super v6;

  v1 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  static String._unconditionallyBridgeFromObjectiveC(_:)(CARSessionLimitUserInterfacesChangedNotification);
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  objc_msgSend(v1, "removeObserver:", v4);

  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for VSRootViewController(0);
  return objc_msgSendSuper2(&v6, "dealloc");
}

Swift::Void __swiftcall VSRootViewController.viewDidLoad()()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  uint64_t v12;
  objc_super v13;

  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for VSRootViewController(0);
  objc_msgSendSuper2(&v13, "viewDidLoad");
  v1 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC12AutoSettings20VSRootViewController_autoSettings], "car");
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, "automakerNotificationHistory");

    if (v3)
    {
      v4 = objc_msgSend(v3, "historicalNotifications");
      if (!v4)
      {

        return;
      }
      v5 = v4;
      v6 = sub_100005904(0, &qword_100028040, CAFHistoricalNotification_ptr);
      v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

      if ((unint64_t)v7 >> 62)
      {
        if (v7 < 0)
          v12 = v7;
        else
          v12 = v7 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v7);
        v8 = _CocoaArrayWrapper.endIndex.getter(v12);
        if (v8)
          goto LABEL_6;
      }
      else
      {
        v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain(v7);
        if (v8)
        {
LABEL_6:
          if (v8 < 1)
          {
            __break(1u);
            return;
          }
          for (i = 0; i != v8; ++i)
          {
            if ((v7 & 0xC000000000000001) != 0)
              v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v7);
            else
              v10 = *(id *)(v7 + 8 * i + 32);
            v11 = v10;
            objc_msgSend(v10, "registerObserver:", v0);

          }
        }
      }

      swift_bridgeObjectRelease_n(v7, 2);
    }
  }
}

void VSRootViewController.init(isRHD:prominentCategories:listItems:settingsSections:settingsCache:assetManager:requestContentManager:preventVolumeNotification:)()
{
  _swift_stdlib_reportUnimplementedInitializer("AutoSettings.VSRootViewController", 33, "init(isRHD:prominentCategories:listItems:settingsSections:settingsCache:assetManager:requestContentManager:preventVolumeNotification:)", 134, 0);
  __break(1u);
}

uint64_t sub_1000125C0(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  NSString v6;
  id v7;
  id v8;
  Swift::String v9;
  Swift::String_optional v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  Swift::String v21;

  v5 = swift_unknownObjectWeakInit(v2 + 112, 0);
  swift_unknownObjectWeakAssign(v5, a1);
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v6);

  v8 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v21._object = (void *)0xE000000000000000;
  v9._countAndFlagsBits = 0x4143494649544F4ELL;
  v9._object = (void *)0xED0000534E4F4954;
  v10.value._countAndFlagsBits = 0x747465536F747541;
  v10.value._object = (void *)0xEC00000073676E69;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  v21._countAndFlagsBits = 0;
  v12 = NSLocalizedString(_:tableName:bundle:value:comment:)(v9, v10, (NSBundle)v8, v11, v21);

  v13 = String.init(format:_:)(v12._countAndFlagsBits, v12._object, _swiftEmptyArrayStorage);
  v15 = v14;
  swift_bridgeObjectRelease(v12._object);
  v16 = swift_allocObject(&unk_100020F50, 24, 7);
  swift_unknownObjectWeakInit(v16 + 16, a1);
  v17 = swift_allocObject(&unk_100020F78, 32, 7);
  *(_QWORD *)(v17 + 16) = v16;
  *(_QWORD *)(v17 + 24) = a2;
  swift_retain(v16);
  BYTE4(v20) = 0;
  WORD1(v20) = 256;
  LOBYTE(v20) = 1;
  v18 = CAFUIDataListItem.init(symbol:text:secondaryText:badgeText:showChevron:enabled:settingsCategory:limitedUI:limitedUIImage:selectionAction:)(v7, v13, v15, 0, 0, 0, 0, 0, v20, 0, sub_100014298, v17);
  swift_release(v16);

  return v18;
}

void *sub_1000127B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *result;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _BYTE v12[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v12, 0, 0);
  result = (void *)swift_unknownObjectWeakLoadStrong(v3);
  if (result)
  {
    v5 = result;
    v6 = objc_msgSend(result, "automakerNotificationHistory");

    if (v6)
    {
      sub_100005BB8();
      v8 = v7;
      if ((unint64_t)v7 >> 62)
      {
        if (v7 >= 0)
          v7 &= 0xFFFFFFFFFFFFFF8uLL;
        v9 = _CocoaArrayWrapper.endIndex.getter(v7);
      }
      else
      {
        v9 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease(v8);
      if (v9)
      {
        v10 = (char *)objc_allocWithZone((Class)type metadata accessor for VSNotificationHistoryViewController());
        v11 = OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_notificationsBySeverity;
        *(_QWORD *)&v10[v11] = sub_100013CC4((uint64_t)_swiftEmptyArrayStorage);
        *(_QWORD *)&v10[OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_requestContentManager] = a2;
        *(_QWORD *)&v10[OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_notificationHistory] = v6;
        swift_retain(a2);
        return (void *)CAFUITableViewController.init(style:)(0);
      }

    }
    return 0;
  }
  return result;
}

BOOL sub_1000128CC()
{
  uint64_t v0;
  void *Strong;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  Strong = (void *)swift_unknownObjectWeakLoadStrong(v0 + 112);
  if (!Strong)
    return 0;
  v2 = Strong;
  v3 = objc_msgSend(Strong, "automakerNotificationHistory");

  if (!v3)
    return 0;
  sub_100005BB8();
  v5 = v4;
  if ((unint64_t)v4 >> 62)
  {
    if (v4 >= 0)
      v4 &= 0xFFFFFFFFFFFFFF8uLL;
    v6 = _CocoaArrayWrapper.endIndex.getter(v4);
  }
  else
  {
    v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v5);

  return v6 != 0;
}

void *sub_100012968()
{
  uint64_t v0;
  void *Strong;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  Strong = (void *)swift_unknownObjectWeakLoadStrong(v0 + 112);
  v2 = Strong;
  if (Strong)
  {
    v3 = objc_msgSend(Strong, "automakerNotificationHistory");

    if (v3)
    {
      sub_100005BB8();
      v5 = v4;
      if ((unint64_t)v4 >> 62)
      {
        if (v4 >= 0)
          v4 &= 0xFFFFFFFFFFFFFF8uLL;
        v6 = _CocoaArrayWrapper.endIndex.getter(v4);
      }
      else
      {
        v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease(v5);
      if (v6)
      {
        sub_100005BB8();
        v8 = v7;
        if ((unint64_t)v7 >> 62)
        {
          if (v7 >= 0)
            v7 &= 0xFFFFFFFFFFFFFF8uLL;
          _CocoaArrayWrapper.endIndex.getter(v7);
        }
        swift_bridgeObjectRelease(v8);
        v2 = (void *)dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);

      }
      else
      {

        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void sub_100012A90()
{
  _swift_stdlib_reportUnimplementedInitializer("AutoSettings.CAFUINotificationListItem", 38, "init(symbol:text:secondaryText:badgeText:showChevron:enabled:settingsCategory:limitedUI:limitedUIImage:selectionAction:)", 120, 0);
  __break(1u);
}

uint64_t sub_100012ABC()
{
  uint64_t v0;

  return swift_unknownObjectWeakDestroy(v0 + 112);
}

uint64_t sub_100012AC4()
{
  uint64_t v0;

  v0 = CAFUIDataListItem.deinit();
  swift_unknownObjectWeakDestroy(v0 + 112);
  return swift_deallocClassInstance(v0, 120, 7);
}

char *sub_100012AF8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_100005888(&qword_100028998);
      v11 = (char *)swift_allocObject(v10, 56 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 56);
      v13 = v11 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[56 * v8 + 32])
          memmove(v13, a4 + 32, 56 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_100013BD0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

_QWORD *sub_100012C1C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  _QWORD *v11;
  size_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_100005888(&qword_1000289A8);
      v11 = (_QWORD *)swift_allocObject(v10, v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v11[2] = v8;
      v11[3] = 2 * v12 - 64;
      v13 = v11 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= (_QWORD *)((char *)a4 + v8 + 32))
          memmove(v13, a4 + 4, v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v11 = _swiftEmptyArrayStorage;
      v13 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_100013DC4(0, v8, (char *)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_100012D14(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100007480(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t type metadata accessor for CAFUINotificationListItem()
{
  return objc_opt_self(_TtC12AutoSettings25CAFUINotificationListItem);
}

uint64_t type metadata accessor for VSRootViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_1000287A0;
  if (!qword_1000287A0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for VSRootViewController);
  return result;
}

uint64_t sub_100012D8C(Swift::Int *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  Swift::Int v13;
  Swift::Int v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  void *v22;
  id v23;
  Swift::Int v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  Swift::Int v33;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v2);
    v8 = a2;
    v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease(v6);

      v32 = v9;
      v10 = sub_100005904(0, &qword_1000289B0, CAFAutomakerSetting_ptr);
      swift_unknownObjectRetain(v9, v11);
      swift_dynamicCast(&v33, &v32, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
      *a1 = v33;
      swift_unknownObjectRelease(v9);
      return 0;
    }
    result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v24 = sub_100013028(v7, result + 1);
    v33 = v24;
    v25 = *(_QWORD *)(v24 + 16);
    if (*(_QWORD *)(v24 + 24) <= v25)
    {
      v30 = v25 + 1;
      v31 = v8;
      sub_10001321C(v30);
      v26 = v33;
    }
    else
    {
      v26 = v24;
      v27 = v8;
    }
    sub_1000134B8((uint64_t)v8, v26);
    v29 = *v3;
    *v3 = v26;
  }
  else
  {
    v13 = *(_QWORD *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    v14 = NSObject._rawHashValue(seed:)(v13);
    v15 = -1 << *(_BYTE *)(v6 + 32);
    v16 = v14 & ~v15;
    if (((*(_QWORD *)(v6 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0)
    {
      sub_100005904(0, &qword_1000289B0, CAFAutomakerSetting_ptr);
      v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v16);
      v18 = static NSObject.== infix(_:_:)(v17);

      if ((v18 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        v22 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v16);
        *a1 = (Swift::Int)v22;
        v23 = v22;
        return 0;
      }
      v19 = ~v15;
      while (1)
      {
        v16 = (v16 + 1) & v19;
        if (((*(_QWORD *)(v6 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
          break;
        v20 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v16);
        v21 = static NSObject.== infix(_:_:)(v20);

        if ((v21 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v33 = *v3;
    *v3 = 0x8000000000000000;
    v8 = a2;
    sub_100013538((uint64_t)v8, v16, isUniquelyReferenced_nonNull_native);
    v29 = *v3;
    *v3 = v33;
  }
  swift_bridgeObjectRelease(v29);
  *a1 = (Swift::Int)v8;
  return 1;
}

Swift::Int sub_100013028(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a2)
  {
    sub_100005888((uint64_t *)&unk_1000289C0);
    v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    v23 = v4;
    v5 = __CocoaSet.makeIterator()(a1);
    v6 = __CocoaSet.Iterator.next()();
    if (v6)
    {
      v7 = v6;
      v8 = sub_100005904(0, &qword_1000289B0, CAFAutomakerSetting_ptr);
      do
      {
        v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7);
        v4 = v23;
        v16 = *(_QWORD *)(v23 + 16);
        if (*(_QWORD *)(v23 + 24) <= v16)
        {
          sub_10001321C(v16 + 1);
          v4 = v23;
        }
        v9 = v22;
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
        v11 = v4 + 56;
        v12 = -1 << *(_BYTE *)(v4 + 32);
        v13 = result & ~v12;
        v14 = v13 >> 6;
        if (((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6))) != 0)
        {
          v15 = __clz(__rbit64((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v17 = 0;
          v18 = (unint64_t)(63 - v12) >> 6;
          do
          {
            if (++v14 == v18 && (v17 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v19 = v14 == v18;
            if (v14 == v18)
              v14 = 0;
            v17 |= v19;
            v20 = *(_QWORD *)(v11 + 8 * v14);
          }
          while (v20 == -1);
          v15 = __clz(__rbit64(~v20)) + (v14 << 6);
        }
        *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = v9;
        ++*(_QWORD *)(v4 + 16);
        v7 = __CocoaSet.Iterator.next()();
      }
      while (v7);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v4;
}

Swift::Int sub_10001321C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100005888((uint64_t *)&unk_1000289C0);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v8 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v3 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain(v3);
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_36;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_36;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_36;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_36:
                swift_release(v3);
                v2 = v30;
                v29 = 1 << *(_BYTE *)(v3 + 32);
                if (v29 > 63)
                  bzero((void *)(v3 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v14 >= v11)
                    goto LABEL_36;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_26:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v17);
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

unint64_t sub_1000134B8(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  unint64_t result;

  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
  result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1 << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1 << *(_BYTE *)(a2 + 32)));
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_100013538(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_14;
  v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_10001321C(v9);
  }
  else
  {
    if (v8 > v7)
    {
      sub_1000136BC();
      goto LABEL_14;
    }
    sub_100013864(v9);
  }
  v10 = *v3;
  v11 = NSObject._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v12 = -1 << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v13 = sub_100005904(0, &qword_1000289B0, CAFAutomakerSetting_ptr);
    v14 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
    v15 = static NSObject.== infix(_:_:)(v14);

    if ((v15 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v13);
      __break(1u);
    }
    else
    {
      v16 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v16;
        if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
        v18 = static NSObject.== infix(_:_:)(v17);

        if ((v18 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v19 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8 * a2) = a1;
  v20 = *(_QWORD *)(v19 + 16);
  v21 = __OFADD__(v20, 1);
  v22 = v20 + 1;
  if (v21)
    __break(1u);
  else
    *(_QWORD *)(v19 + 16) = v22;
}

id sub_1000136BC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_100005888((uint64_t *)&unk_1000289C0);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_100013864(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  Swift::Int v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100005888((uint64_t *)&unk_1000289C0);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v30 = v2;
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain(v3);
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_27;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_27:
    v21 = *(_QWORD *)(v6 + 40);
    v22 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v17);
    result = NSObject._rawHashValue(seed:)(v21);
    v23 = -1 << *(_BYTE *)(v6 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v25);
      }
      while (v29 == -1);
      v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v22;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v30;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

void (*sub_100013ADC(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_100013B5C(v6, a2, a3);
  return sub_100013B30;
}

void sub_100013B30(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_100013B5C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_100013BC8;
  }
  __break(1u);
  return result;
}

void sub_100013BC8(id *a1)
{

}

uint64_t sub_100013BD0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v5 = a4 + 56 * a1 + 32;
  v6 = a3 + 56 * v4;
  if (v5 >= v6 || v5 + 56 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v6;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100013CC4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  Swift::UInt8 v4;
  uint64_t v5;
  unint64_t result;
  char v7;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  char v14;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  sub_100005888(&qword_1000289A0);
  v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v1);
  v4 = *(_BYTE *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  result = sub_100010778(v4);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain(v5);
    return (unint64_t)v3;
  }
  v8 = (_QWORD *)(a1 + 56);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_BYTE *)(v3[6] + result) = v4;
    *(_QWORD *)(v3[7] + 8 * result) = v5;
    v9 = v3[2];
    v10 = __OFADD__(v9, 1);
    v11 = v9 + 1;
    if (v10)
      break;
    v3[2] = v11;
    if (!--v1)
      goto LABEL_8;
    v12 = v8 + 2;
    v4 = *((_BYTE *)v8 - 8);
    v13 = *v8;
    swift_bridgeObjectRetain(v5);
    result = sub_100010778(v4);
    v8 = v12;
    v5 = v13;
    if ((v14 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

char *sub_100013DC4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if ((v4 & 0x8000000000000000) != 0)
    {
      result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

void _s12AutoSettings20VSRootViewControllerC29historicalNotificationService_15didUpdateHiddenySo013CAFHistoricalG0C_SbtF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = v0;
  v2 = OBJC_IVAR____TtC12AutoSettings20VSRootViewController_notificationListItem;
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_notificationListItem);
  v4 = *(void **)(v0 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_autoSettings);
  v5 = objc_msgSend(v4, "car");
  v6 = (uint64_t)v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "automakerNotificationHistory");

    if (v7)
    {
      sub_100005BB8();
      v9 = v8;

      if ((unint64_t)v9 >> 62)
      {
        if (v9 < 0)
          v28 = v9;
        else
          v28 = v9 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v9);
        v6 = _CocoaArrayWrapper.endIndex.getter(v28);
        swift_bridgeObjectRelease(v9);
      }
      else
      {
        v6 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease(v9);
    }
    else
    {
      v6 = 0;
    }
  }
  v10 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  objc_msgSend(v10, "setApplicationIconBadgeNumber:", v6 & ~(v6 >> 63));

  if ((v3 != 0) != v6 > 0)
  {
    if (v6 >= 1)
    {
      v11 = objc_msgSend(v4, "car");
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)(v1 + direct field offset for CAFUITileViewController.requestContentManager);
        if (v13)
        {
          v14 = type metadata accessor for CAFUINotificationListItem();
          swift_allocObject(v14, 120, 7);
          swift_retain_n(v13, 2);
          v15 = v12;
          v16 = sub_1000125C0(v15, v13);
          v17 = *(_QWORD *)(v1 + v2);
          *(_QWORD *)(v1 + v2) = v16;

          swift_release(v13);
          goto LABEL_17;
        }

      }
    }
    v17 = *(_QWORD *)(v1 + v2);
    *(_QWORD *)(v1 + v2) = 0;
LABEL_17:
    swift_release(v17);
    v18 = *(_QWORD *)(v1 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_generalListItem);
    v19 = *(_QWORD *)(v1 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_audioListItem);
    if (v18)
    {
      swift_retain(v19);
      v20 = swift_retain_n(v18, 2);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v20);
      v22 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
      v21 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v22 >= v21 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v21 > 1, v22 + 1, 1);
      v23 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v22, v18);
      specialized Array._endMutation()(v23);
      if (!v19)
        goto LABEL_26;
    }
    else
    {
      swift_retain(v19);
      if (!v19)
      {
LABEL_26:
        swift_release(v19);
        swift_release(v18);
        CAFUITileViewController.setListItems(_:)((Swift::OpaquePointer)_swiftEmptyArrayStorage);
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        return;
      }
    }
    v24 = swift_retain(v19);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v24);
    v26 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
    v25 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v26 >= v25 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v25 > 1, v26 + 1, 1);
    v27 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v26, v19);
    specialized Array._endMutation()(v27);
    goto LABEL_26;
  }
  if (v3)
    CAFUITileViewController.reloadListItem(item:)(0);
}

uint64_t sub_1000141EC()
{
  return type metadata accessor for VSRootViewController(0);
}

uint64_t sub_1000141F4(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v2[1] = "\b";
  v2[2] = "\b";
  v2[3] = "\b";
  v2[4] = "\b";
  return swift_updateClassMetadata2(a1, 256, 5, v2, a1 + 456);
}

uint64_t sub_100014248()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001426C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void *sub_100014298()
{
  uint64_t v0;

  return sub_1000127B0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

unint64_t sub_1000142A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000289B8;
  if (!qword_1000289B8)
  {
    v1 = sub_100005904(255, &qword_1000289B0, CAFAutomakerSetting_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_1000289B8);
  }
  return result;
}

id sub_1000143C4()
{
  return sub_1000167A4(type metadata accessor for VSTableCell);
}

uint64_t type metadata accessor for VSTableCell()
{
  return objc_opt_self(_TtC12AutoSettings11VSTableCell);
}

uint64_t sub_1000143F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  id v16;
  uint64_t v17;
  double v18;
  void (*v19)(char *, uint64_t);
  id v20;
  double v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  Class isa;
  Class v29;
  void (*v30)(char *, uint64_t);
  id v31;
  uint64_t v32;
  id v34;
  Class v35;
  id v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;

  v1 = type metadata accessor for Calendar(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Date(0);
  v39 = *(_QWORD *)(v5 - 8);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v37 - v9;
  v11 = sub_100005888((uint64_t *)&unk_100027E70);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(void **)(v0 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_notificationItem);
  if (!v15)
    return 0;
  v37 = v10;
  v38 = v5;
  v40 = v15;
  v16 = objc_msgSend(v40, "timestamp");
  v17 = sub_100005904(0, (unint64_t *)&unk_100028620, NSUnitDuration_ptr);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(v16, v17);

  v18 = Measurement.value.getter(v11);
  v19 = *(void (**)(char *, uint64_t))(v12 + 8);
  v19(v14, v11);
  if (v18 <= 0.0)
  {

    return 0;
  }
  v20 = objc_msgSend(v40, "timestamp");
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(v20, v17);

  v21 = Measurement.value.getter(v11);
  v22 = ((uint64_t (*)(char *, uint64_t))v19)(v14, v11);
  v23 = v37;
  v24 = Date.init(timeIntervalSince1970:)(v22, v21);
  static Calendar.current.getter(v24);
  LOBYTE(v20) = Calendar.isDateInToday(_:)(v23);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v26 = v38;
  v25 = v39;
  if ((v20 & 1) != 0)
  {
    v27 = objc_msgSend(objc_allocWithZone((Class)NSRelativeDateTimeFormatter), "init");
    objc_msgSend(v27, "setUnitsStyle:", 2);
    objc_msgSend(v27, "setDateTimeStyle:", 1);
    isa = Date._bridgeToObjectiveC()().super.isa;
    Date.init()();
    v29 = Date._bridgeToObjectiveC()().super.isa;
    v30 = *(void (**)(char *, uint64_t))(v25 + 8);
    v30(v8, v26);
    v31 = objc_msgSend(v27, "localizedStringForDate:relativeToDate:", isa, v29);

    v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
    v30(v23, v26);
  }
  else
  {
    v34 = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
    objc_msgSend(v34, "setDateStyle:", 1);
    objc_msgSend(v34, "setTimeStyle:", 0);
    v35 = Date._bridgeToObjectiveC()().super.isa;
    v36 = objc_msgSend(v34, "stringFromDate:", v35);

    v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v36);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v23, v26);
  }
  return v32;
}

void sub_10001479C(void *a1)
{
  char *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  Class isa;

  if (a1)
    objc_msgSend(a1, "removeFromSuperview");
  v2 = *(void **)&v1[OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_stackView];
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v1, "setAccessoryType:", 0);
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4 = objc_msgSend(v1, "contentView");
    objc_msgSend(v4, "addSubview:", v3);

    v5 = (void *)objc_opt_self(NSLayoutConstraint);
    v6 = sub_100005888(&qword_100028038);
    v7 = swift_allocObject(v6, 56, 7);
    *(_OWORD *)(v7 + 16) = xmmword_100018600;
    v8 = objc_msgSend(v3, "topAnchor");
    v9 = objc_msgSend(v1, "contentView");
    v10 = objc_msgSend(v9, "topAnchor");

    v11 = objc_msgSend(v8, "constraintEqualToAnchor:", v10);
    *(_QWORD *)(v7 + 32) = v11;
    v12 = objc_msgSend(v3, "trailingAnchor");
    v13 = objc_msgSend(v1, "contentView");
    v14 = objc_msgSend(v13, "trailingAnchor");

    v15 = objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, -12.0);
    *(_QWORD *)(v7 + 40) = v15;
    v16 = objc_msgSend(v3, "bottomAnchor");
    v17 = objc_msgSend(v1, "contentView");
    v18 = objc_msgSend(v17, "bottomAnchor");

    v19 = objc_msgSend(v16, "constraintEqualToAnchor:", v18);
    *(_QWORD *)(v7 + 48) = v19;
    specialized Array._endMutation()(v20);
    sub_100005904(0, (unint64_t *)&qword_1000283A8, NSLayoutConstraint_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v7);
    objc_msgSend(v5, "activateConstraints:", isa);

  }
}

uint64_t sub_100014A78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD *, _QWORD);
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD *, _QWORD);
  id v23;
  void (*v24)(_QWORD *, _QWORD);
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(_QWORD *, _QWORD);
  id v30;
  void (*v31)(_QWORD *, _QWORD);
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  id v37;
  unint64_t v38;
  unint64_t v39;
  unsigned int v40;
  id v41;
  void (*v42)(_QWORD *, _QWORD);
  NSString v43;
  id v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  double v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  NSString v54;
  id v55;
  uint64_t v56;
  void *v57;
  id v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  id v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD v79[5];

  v1 = v0;
  v2 = sub_100005888((uint64_t *)&unk_100027E70);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for UIListContentConfiguration(0);
  result = __chkstk_darwin(v6);
  v10 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void **)(v0 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_notificationItem);
  if (v11)
  {
    v76 = v3;
    v77 = v8;
    v78 = result;
    v12 = v11;
    static UIListContentConfiguration.subtitleCell()();
    v13 = sub_100005904(0, &qword_100028AB0, UIFont_ptr);
    v14 = static UIFont.cafui_titleFont.getter();
    v15 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.textProperties.modify(v79);
    UIListContentConfiguration.TextProperties.font.setter(v14);
    v15(v79, 0);
    v16 = objc_msgSend(v12, "userVisibleLabel");
    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
    v19 = v18;

    v20 = UIListContentConfiguration.text.setter(v17, v19);
    v74 = v13;
    v21 = static UIFont.cafui_subtitleFont.getter(v20);
    v22 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.secondaryTextProperties.modify(v79);
    UIListContentConfiguration.TextProperties.font.setter(v21);
    v22(v79, 0);
    v75 = (id)objc_opt_self(UIColor);
    v23 = objc_msgSend(v75, "secondaryLabelColor");
    v24 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.secondaryTextProperties.modify(v79);
    UIListContentConfiguration.TextProperties.color.setter(v23);
    v24(v79, 0);
    v25 = objc_msgSend(v12, "userVisibleDescription");
    v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
    v28 = v27;

    UIListContentConfiguration.secondaryText.setter(v26, v28);
    v29 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.imageProperties.modify(v79);
    UIListContentConfiguration.ImageProperties.reservedLayoutSize.setter(36.0, 36.0);
    v29(v79, 0);
    v30 = objc_msgSend((id)objc_opt_self(UIImageSymbolConfiguration), "configurationWithWeight:", 6);
    v31 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.imageProperties.modify(v79);
    UIListContentConfiguration.ImageProperties.preferredSymbolConfiguration.setter(v30);
    v31(v79, 0);
    v32 = objc_msgSend(v12, "symbolName");
    v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
    v35 = v34;

    swift_bridgeObjectRelease(v35);
    v36 = HIBYTE(v35) & 0xF;
    if ((v35 & 0x2000000000000000) == 0)
      v36 = v33 & 0xFFFFFFFFFFFFLL;
    if (v36)
    {
      v37 = objc_msgSend(v12, "symbolName");
      static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
      v39 = v38;

    }
    else
    {
      v39 = 0xE400000000000000;
    }
    v40 = objc_msgSend(v12, "notificationSeverity");
    if (v40 > 2)
      v41 = 0;
    else
      v41 = objc_msgSend(v75, *off_100020FE8[(char)v40]);
    v42 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.imageProperties.modify(v79);
    UIListContentConfiguration.ImageProperties.tintColor.setter(v41);
    v42(v79, 0);
    v43 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v39);
    v44 = (id)CAFUIImageForSymbolName(v43);

    UIListContentConfiguration.image.setter(v44);
    v45 = v78;
    v79[3] = v78;
    v79[4] = &protocol witness table for UIListContentConfiguration;
    v46 = sub_100016804(v79);
    v47 = v77;
    (*(void (**)(_QWORD *, char *, uint64_t))(v77 + 16))(v46, v10, v45);
    UITableViewCell.contentConfiguration.setter(v79);
    v48 = objc_msgSend(v12, "timestamp");
    v49 = sub_100005904(0, (unint64_t *)&unk_100028620, NSUnitDuration_ptr);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)(v48, v49);

    v50 = Measurement.value.getter(v2);
    (*(void (**)(char *, uint64_t))(v76 + 8))(v5, v2);
    if (v50 <= 0.0)
    {
      v73 = *(void **)(v1 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_stackView);
      *(_QWORD *)(v1 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_stackView) = 0;
      sub_10001479C(v73);

    }
    else
    {
      v79[0] = _swiftEmptyArrayStorage;
      v51 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
      sub_1000143F0();
      v53 = v52;
      v54 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v53);
      objc_msgSend(v51, "setText:", v54);

      v55 = objc_msgSend(v75, "secondaryLabelColor");
      objc_msgSend(v51, "setTextColor:", v55);

      v57 = (void *)static UIFont.cafui_subtitleFont.getter(v56);
      objc_msgSend(v51, "setFont:", v57);

      objc_msgSend(v51, "sizeToFit");
      v58 = v51;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v60 = *(_QWORD *)((v79[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
      v59 = *(_QWORD *)((v79[0] & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v60 >= v59 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v59 > 1, v60 + 1, 1);
      v61 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v60, v58);
      specialized Array._endMutation()(v61);
      v62 = sub_1000031E4();
      v63 = *((_QWORD *)v62 + 2);
      swift_bridgeObjectRelease(v62);
      if (v63 || objc_msgSend(v12, "hasUserVisibleFullDescription"))
      {
        v64 = sub_1000151B4();
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        v66 = *(_QWORD *)((v79[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
        v65 = *(_QWORD *)((v79[0] & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v66 >= v65 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v65 > 1, v66 + 1, 1);
        v67 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v66, v64);
        specialized Array._endMutation()(v67);

      }
      v68 = v79[0];
      v69 = objc_allocWithZone((Class)type metadata accessor for CAFUIStackView(0));
      v70 = (void *)CAFUIStackView.init(views:axis:minWidth:)(v68, 0, 50.0);
      v71 = *(void **)(v1 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_stackView);
      *(_QWORD *)(v1 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_stackView) = v70;
      v72 = v70;
      sub_10001479C(v71);

    }
    return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v10, v45);
  }
  return result;
}

id sub_100015128()
{
  uint64_t v0;
  void *v1;
  unsigned int v2;
  id result;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_notificationItem);
  if (!v1
    || (v2 = objc_msgSend(v1, "notificationSeverity"), v2 > 2)
    || (result = objc_msgSend((id)objc_opt_self(UIColor), *off_100020FE8[(char)v2])) == 0)
  {
    sub_100005904(0, &qword_1000281F8, UIColor_ptr);
    return (id)static UIColor.cafui_carSystemFocus.getter();
  }
  return result;
}

id sub_1000151B4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell____lazy_storage___chevronImageView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell____lazy_storage___chevronImageView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell____lazy_storage___chevronImageView);
  }
  else
  {
    v4 = sub_100015210();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_100015210()
{
  id v0;
  id v1;
  NSString v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;

  v0 = objc_msgSend((id)objc_opt_self(UIFont), "boldSystemFontOfSize:", 13.0);
  v1 = objc_msgSend((id)objc_opt_self(UIImageSymbolConfiguration), "configurationWithFont:scale:", v0, -1);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:withConfiguration:", v2, v1);

  if (v3)
  {
    v4 = objc_msgSend(v3, "imageWithRenderingMode:", 2);

  }
  else
  {
    v4 = 0;
  }
  v5 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v4);
  v6 = objc_allocWithZone((Class)UIColor);
  v10[4] = sub_1000153E8;
  v11 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100016840;
  v10[3] = &unk_100020FC0;
  v7 = _Block_copy(v10);
  v8 = objc_msgSend(v6, "initWithDynamicProvider:", v7);
  _Block_release(v7);
  swift_release(v11);
  objc_msgSend(v5, "setTintColor:", v8);

  return v5;
}

id sub_1000153E8(void *a1)
{
  id v1;
  void *v2;
  char **v3;

  v1 = objc_msgSend(a1, "userInterfaceStyle");
  v2 = (void *)objc_opt_self(UIColor);
  v3 = &selRef_systemDarkGrayColor;
  if (v1 != (id)1)
    v3 = &selRef_secondaryLabelColor;
  return objc_msgSend(v2, *v3);
}

uint64_t sub_100015440(char a1, char a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  objc_class *v13;
  id v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD *, _QWORD);
  uint64_t v19;
  id v20;
  void *v22;
  id v23;
  void (*v24)(_QWORD *, _QWORD);
  id v25;
  void (*v26)(_QWORD *, _QWORD);
  _QWORD *v27;
  _QWORD v29[3];
  uint64_t v30;
  void *v31;
  objc_super v32;

  v3 = v2;
  v6 = sub_100005888(&qword_100028A98);
  __chkstk_darwin(v6);
  v8 = (char *)&v29[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for UIListContentConfiguration(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v29[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (objc_class *)type metadata accessor for VSNotificationTableCell();
  v32.receiver = v3;
  v32.super_class = v13;
  v14 = objc_msgSendSuper2(&v32, "setHighlighted:animated:", a1 & 1, a2 & 1);
  UITableViewCell.contentConfiguration.getter(v29, v14);
  if (!v30)
  {
    sub_10000BA58((uint64_t)v29, &qword_100028AA0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    return sub_10000BA58((uint64_t)v8, &qword_100028A98);
  }
  v15 = sub_100005888(&qword_100028AA8);
  v16 = swift_dynamicCast(v8, v29, v15, v9, 6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, v16 ^ 1u, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    return sub_10000BA58((uint64_t)v8, &qword_100028A98);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  if ((a1 & 1) != 0)
  {
    sub_100005904(0, &qword_1000281F8, UIColor_ptr);
    v17 = static UIColor.cafui_carSystemFocusLabel.getter();
    v18 = (uint64_t (*)(_QWORD *, _QWORD))UIListContentConfiguration.textProperties.modify(v29);
    UIListContentConfiguration.TextProperties.color.setter(v17);
    v19 = v18(v29, 0);
    v20 = (id)static UIColor.cafui_carSystemFocusSecondary.getter(v19);
  }
  else
  {
    v22 = (void *)objc_opt_self(UIColor);
    v23 = objc_msgSend(v22, "labelColor");
    v24 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.textProperties.modify(v29);
    UIListContentConfiguration.TextProperties.color.setter(v23);
    v24(v29, 0);
    v20 = objc_msgSend(v22, "secondaryLabelColor");
  }
  v25 = v20;
  v26 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.secondaryTextProperties.modify(v29);
  UIListContentConfiguration.TextProperties.color.setter(v25);
  v26(v29, 0);
  v30 = v9;
  v31 = &protocol witness table for UIListContentConfiguration;
  v27 = sub_100016804(v29);
  (*(void (**)(_QWORD *, char *, uint64_t))(v10 + 16))(v27, v12, v9);
  UITableViewCell.contentConfiguration.setter(v29);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

id sub_10001574C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  NSString v6;
  id v7;
  objc_super v9;

  *(_QWORD *)&v3[OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_stackView] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_notificationItem] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell____lazy_storage___chevronImageView] = 0;
  if (a3)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a3);
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for VSNotificationTableCell();
  v7 = objc_msgSendSuper2(&v9, "initWithStyle:reuseIdentifier:", a1, v6);

  return v7;
}

uint64_t sub_100015838(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_stackView] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_notificationItem] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell____lazy_storage___chevronImageView] = 0;
  return CAFUITableCell.init(reuseIdentifier:)(a1, a2);
}

void sub_10001589C()
{
  uint64_t v0;

}

id sub_1000158D8()
{
  return sub_1000167A4(type metadata accessor for VSNotificationTableCell);
}

uint64_t type metadata accessor for VSNotificationTableCell()
{
  return objc_opt_self(_TtC12AutoSettings23VSNotificationTableCell);
}

uint64_t sub_10001594C()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  id v14;
  void (*v15)(_QWORD *, _QWORD);
  id v16;
  id v17;
  void (*v18)(_QWORD *, _QWORD);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString v22;
  id v23;
  id v24;
  uint64_t v25;
  char v26;
  id v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[5];

  v1 = v0;
  v2 = type metadata accessor for UIListContentConfiguration(0);
  v3 = *(_QWORD *)(v2 - 8);
  result = __chkstk_darwin();
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = &v0[OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction];
  v8 = *(_QWORD *)&v0[OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction + 8];
  if (v8)
  {
    v9 = *((_QWORD *)v7 + 2);
    v10 = *((_QWORD *)v7 + 3);
    v32 = *(_QWORD *)v7;
    v33 = v9;
    v11 = *((_QWORD *)v7 + 5);
    v30 = *((_QWORD *)v7 + 4);
    v12 = v7[48];
    swift_bridgeObjectRetain(v10);
    v31 = v11;
    swift_bridgeObjectRetain(v11);
    v13 = swift_bridgeObjectRetain(v8);
    static UIListContentConfiguration.cell()(v13);
    v14 = objc_msgSend((id)objc_opt_self(UIFont), "systemFontOfSize:weight:", 16.0, UIFontWeightMedium);
    v15 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.textProperties.modify(v34);
    UIListContentConfiguration.TextProperties.font.setter(v14);
    v15(v34, 0);
    HIDWORD(v29) = v12;
    if ((v12 & 1) != 0)
    {
      v16 = objc_msgSend((id)objc_opt_self(UIColor), "systemRedColor");
    }
    else
    {
      sub_100005904(0, &qword_1000281F8, UIColor_ptr);
      v16 = (id)static UIColor.cafui_carSystemFocus.getter();
    }
    v17 = v16;
    v18 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.textProperties.modify(v34);
    UIListContentConfiguration.TextProperties.color.setter(v17);
    v18(v34, 0);
    swift_bridgeObjectRetain(v8);
    v19 = v32;
    UIListContentConfiguration.text.setter(v32, v8);
    if (v10)
    {
      v20 = HIBYTE(v10) & 0xF;
      v21 = v33;
      if ((v10 & 0x2000000000000000) == 0)
        v20 = v33 & 0xFFFFFFFFFFFFLL;
      if (v20)
      {
        swift_bridgeObjectRetain(v10);
        v22 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v10);
        v23 = (id)CAFUIImageForSymbolName(v22);

        v24 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v23);
        v25 = v8;
        v26 = BYTE4(v29);
        sub_1000058C8(v19, v25, v21, v10, v30, v31);
        if ((v26 & 1) != 0)
          v27 = objc_msgSend((id)objc_opt_self(UIColor), "systemRedColor");
        else
          v27 = 0;
        objc_msgSend(v24, "setTintColor:", v27);

        objc_msgSend(v1, "setAccessoryView:", v24);
        goto LABEL_15;
      }
    }
    else
    {
      v21 = v33;
    }
    sub_1000058C8(v19, v8, v21, v10, v30, v31);
    objc_msgSend(v1, "setAccessoryView:", 0);
LABEL_15:
    v34[3] = v2;
    v34[4] = &protocol witness table for UIListContentConfiguration;
    v28 = sub_100016804(v34);
    (*(void (**)(_QWORD *, char *, uint64_t))(v3 + 16))(v28, v6, v2);
    UITableViewCell.contentConfiguration.setter(v34);
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

uint64_t sub_100015C78(char a1, char a2)
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
  objc_class *v13;
  id v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  void (*v18)(_QWORD *, _QWORD);
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  id v33;
  int v34;
  void (*v35)(_QWORD *, _QWORD);
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD v42[3];
  uint64_t v43;
  void *v44;
  objc_super v45;

  v3 = v2;
  v6 = sub_100005888(&qword_100028A98);
  __chkstk_darwin(v6);
  v8 = (char *)&v42[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for UIListContentConfiguration(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v42[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (objc_class *)type metadata accessor for VSNotificationActionTableCell();
  v45.receiver = v3;
  v45.super_class = v13;
  v14 = objc_msgSendSuper2(&v45, "setHighlighted:animated:", a1 & 1, a2 & 1);
  UITableViewCell.contentConfiguration.getter(v42, v14);
  if (!v43)
  {
    sub_10000BA58((uint64_t)v42, &qword_100028AA0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    return sub_10000BA58((uint64_t)v8, &qword_100028A98);
  }
  v15 = sub_100005888(&qword_100028AA8);
  v16 = swift_dynamicCast(v8, v42, v15, v9, 6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, v16 ^ 1u, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    return sub_10000BA58((uint64_t)v8, &qword_100028A98);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  if ((a1 & 1) == 0)
  {
    v26 = &v3[OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction];
    v27 = *(_QWORD *)&v3[OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction + 8];
    if (!v27)
      goto LABEL_11;
    v28 = *((_QWORD *)v26 + 5);
    v41 = *((_QWORD *)v26 + 4);
    v29 = *((_QWORD *)v26 + 2);
    v30 = *((_QWORD *)v26 + 3);
    v31 = *(_QWORD *)v26;
    v32 = v26[48];
    swift_bridgeObjectRetain(v30);
    swift_bridgeObjectRetain(v28);
    swift_bridgeObjectRetain(v27);
    sub_1000058C8(v31, v27, v29, v30, v41, v28);
    if ((v32 & 1) != 0)
    {
      v33 = objc_msgSend((id)objc_opt_self(UIColor), "systemRedColor");
      v34 = 1;
    }
    else
    {
LABEL_11:
      sub_100005904(0, &qword_1000281F8, UIColor_ptr);
      v33 = (id)static UIColor.cafui_carSystemFocus.getter();
      v34 = 0;
    }
    v35 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.textProperties.modify(v42);
    UIListContentConfiguration.TextProperties.color.setter(v33);
    v35(v42, 0);
    v36 = objc_msgSend(v3, "accessoryView");
    if (!v36)
      goto LABEL_21;
    v20 = v36;
    v37 = objc_opt_self(UIImageView);
    v38 = swift_dynamicCastObjCClass(v20, v37);
    if (!v38)
      goto LABEL_20;
    v39 = (void *)v38;
    if (v34)
      v24 = objc_msgSend((id)objc_opt_self(UIColor), "systemRedColor");
    else
      v24 = 0;
    objc_msgSend(v39, "setTintColor:", v24);
    goto LABEL_19;
  }
  sub_100005904(0, &qword_1000281F8, UIColor_ptr);
  v17 = static UIColor.cafui_carSystemFocusLabel.getter();
  v18 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.textProperties.modify(v42);
  UIListContentConfiguration.TextProperties.color.setter(v17);
  v18(v42, 0);
  v19 = objc_msgSend(v3, "accessoryView");
  if (v19)
  {
    v20 = v19;
    v21 = objc_opt_self(UIImageView);
    v22 = swift_dynamicCastObjCClass(v20, v21);
    if (!v22)
    {
LABEL_20:

      goto LABEL_21;
    }
    v23 = (void *)v22;
    v24 = (id)static UIColor.cafui_carSystemFocusLabel.getter();
    objc_msgSend(v23, "setTintColor:", v24);
LABEL_19:

    v20 = v24;
    goto LABEL_20;
  }
LABEL_21:
  v43 = v9;
  v44 = &protocol witness table for UIListContentConfiguration;
  v40 = sub_100016804(v42);
  (*(void (**)(_QWORD *, char *, uint64_t))(v10 + 16))(v40, v12, v9);
  UITableViewCell.contentConfiguration.setter(v42);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_1000161DC()
{
  uint64_t v0;

  return sub_1000058C8(*(_QWORD *)(v0 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction), *(_QWORD *)(v0 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction + 8), *(_QWORD *)(v0 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction + 16), *(_QWORD *)(v0 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction + 24), *(_QWORD *)(v0 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction + 32), *(_QWORD *)(v0 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction + 40));
}

id sub_1000161FC()
{
  return sub_1000167A4(type metadata accessor for VSNotificationActionTableCell);
}

uint64_t type metadata accessor for VSNotificationActionTableCell()
{
  return objc_opt_self(_TtC12AutoSettings29VSNotificationActionTableCell);
}

uint64_t sub_100016248()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void (*v12)(_QWORD *, _QWORD);
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *, _QWORD);
  void *v20;
  id v21;
  void (*v22)(_QWORD *, _QWORD);
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unsigned int v33;
  id v34;
  id v35;
  void (*v36)(_QWORD *, _QWORD);
  void (*v37)(_QWORD *, _QWORD);
  id v38;
  void (*v39)(_QWORD *, _QWORD);
  NSString v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD v45[5];

  v1 = type metadata accessor for UIListContentConfiguration(0);
  v2 = *(_QWORD *)(v1 - 8);
  result = __chkstk_darwin();
  v5 = (char *)&v45[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void **)(v0 + OBJC_IVAR____TtC12AutoSettings24VSNotificationHeaderView_notificationItem);
  if (v6)
  {
    v7 = v6;
    static UIListContentConfiguration.subtitleCell()();
    sub_100005904(0, &qword_100028AB0, UIFont_ptr);
    v8 = (void *)static UIFont.cafui_titleFont.getter();
    v9 = objc_msgSend(v8, "fontDescriptor");
    v10 = objc_msgSend(v9, "fontDescriptorWithSymbolicTraits:", 2);

    if (v10)
    {
      v11 = objc_msgSend((id)objc_opt_self(UIFont), "fontWithDescriptor:size:", v10, 0.0);

      v8 = v11;
    }
    v12 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.textProperties.modify(v45);
    UIListContentConfiguration.TextProperties.font.setter(v8);
    v12(v45, 0);
    v13 = objc_msgSend(v7, "userVisibleLabel");
    v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
    v16 = v15;

    v17 = UIListContentConfiguration.text.setter(v14, v16);
    v18 = static UIFont.cafui_subtitleFont.getter(v17);
    v19 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.secondaryTextProperties.modify(v45);
    UIListContentConfiguration.TextProperties.font.setter(v18);
    v19(v45, 0);
    v20 = (void *)objc_opt_self(UIColor);
    v21 = objc_msgSend(v20, "secondaryLabelColor");
    v22 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.secondaryTextProperties.modify(v45);
    UIListContentConfiguration.TextProperties.color.setter(v21);
    v22(v45, 0);
    v23 = objc_msgSend(v7, "userVisibleFullDescription");
    if (v23)
    {
      v24 = v23;
      v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
      v27 = v26;

    }
    else
    {
      v25 = 0;
      v27 = 0;
    }
    UIListContentConfiguration.secondaryText.setter(v25, v27);
    v28 = objc_msgSend(v7, "symbolName");
    v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
    v31 = v30;

    swift_bridgeObjectRelease(v31);
    v32 = HIBYTE(v31) & 0xF;
    if ((v31 & 0x2000000000000000) == 0)
      v32 = v29 & 0xFFFFFFFFFFFFLL;
    if (v32)
    {
      v33 = objc_msgSend(v7, "notificationSeverity");
      if (v33 > 2)
        v34 = 0;
      else
        v34 = objc_msgSend(v20, *off_100020FE8[(char)v33]);
      v36 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.imageProperties.modify(v45);
      UIListContentConfiguration.ImageProperties.tintColor.setter(v34);
      v36(v45, 0);
      v37 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.imageProperties.modify(v45);
      UIListContentConfiguration.ImageProperties.reservedLayoutSize.setter(40.0, 50.0);
      v37(v45, 0);
      v38 = objc_msgSend((id)objc_opt_self(UIImageSymbolConfiguration), "configurationWithTextStyle:scale:", UIFontTextStyleTitle3, 3);
      v39 = (void (*)(_QWORD *, _QWORD))UIListContentConfiguration.imageProperties.modify(v45);
      UIListContentConfiguration.ImageProperties.preferredSymbolConfiguration.setter(v38);
      v39(v45, 0);
      v40 = objc_msgSend(v7, "symbolName");
      if (!v40)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)(0);
        v42 = v41;
        v40 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v42);
      }
      v35 = (id)CAFUIImageForSymbolName(v40);

    }
    else
    {
      v35 = 0;
    }
    UIListContentConfiguration.image.setter(v35);
    v45[3] = v1;
    v45[4] = &protocol witness table for UIListContentConfiguration;
    v43 = sub_100016804(v45);
    (*(void (**)(_QWORD *, char *, uint64_t))(v2 + 16))(v43, v5, v1);
    UITableViewHeaderFooterView.contentConfiguration.setter(v45);

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  return result;
}

void sub_100016788()
{
  uint64_t v0;

}

id sub_100016798()
{
  return sub_1000167A4(type metadata accessor for VSNotificationHeaderView);
}

id sub_1000167A4(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for VSNotificationHeaderView()
{
  return objc_opt_self(_TtC12AutoSettings24VSNotificationHeaderView);
}

_QWORD *sub_100016804(_QWORD *a1)
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

id sub_100016840(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t (*v4)(void);
  id v5;
  void *v6;

  v4 = *(uint64_t (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v6 = (void *)v4();
  swift_release(v3);

  return v6;
}

uint64_t sub_100016890(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000168A0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_1000168A8()
{
  void *v0;
  id v1;
  NSString v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  Class isa;
  objc_super v23;

  v23.receiver = v0;
  v23.super_class = (Class)type metadata accessor for VSClusterViewController();
  objc_msgSendSuper2(&v23, "viewDidLoad");
  v1 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v2 = String._bridgeToObjectiveC()();
  objc_msgSend(v1, "setText:", v2);

  v3 = objc_msgSend((id)objc_opt_self(UIColor), "labelColor");
  objc_msgSend(v1, "setTextColor:", v3);

  objc_msgSend(v1, "setTextAlignment:", 1);
  objc_msgSend(v1, "setNumberOfLines:", 2);
  v4 = objc_msgSend((id)objc_opt_self(UIFont), "systemFontOfSize:", 24.0);
  objc_msgSend(v1, "setFont:", v4);

  objc_msgSend(v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = objc_msgSend(v0, "view");
  if (!v5)
  {
    __break(1u);
    goto LABEL_6;
  }
  v6 = v5;
  objc_msgSend(v5, "addSubview:", v1);

  v7 = sub_100005888(&qword_100028038);
  v8 = swift_allocObject(v7, 48, 7);
  *(_OWORD *)(v8 + 16) = xmmword_100018460;
  v9 = objc_msgSend(v1, "centerXAnchor");
  v10 = objc_msgSend(v0, "view");
  if (!v10)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v11 = v10;
  v12 = objc_msgSend(v10, "centerXAnchor");

  v13 = objc_msgSend(v9, "constraintEqualToAnchor:", v12);
  *(_QWORD *)(v8 + 32) = v13;
  v14 = objc_msgSend(v1, "centerYAnchor");
  v15 = objc_msgSend(v0, "view");
  if (v15)
  {
    v16 = v15;
    v17 = (void *)objc_opt_self(NSLayoutConstraint);
    v18 = objc_msgSend(v16, "centerYAnchor");

    v19 = objc_msgSend(v14, "constraintEqualToAnchor:", v18);
    *(_QWORD *)(v8 + 40) = v19;
    specialized Array._endMutation()(v20);
    v21 = v8;
    sub_100016D24();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v21);
    objc_msgSend(v17, "activateConstraints:", isa);

    return;
  }
LABEL_7:
  __break(1u);
}

id sub_100016CD4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VSClusterViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for VSClusterViewController()
{
  return objc_opt_self(_TtC12AutoSettings23VSClusterViewController);
}

unint64_t sub_100016D24()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000283A8;
  if (!qword_1000283A8)
  {
    v1 = objc_opt_self(NSLayoutConstraint);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000283A8);
  }
  return result;
}

uint64_t sub_100016D60()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC12AutoSettingsP33_E809F94B26B3972D831A8C199707859A19ResourceBundleClass);
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}
