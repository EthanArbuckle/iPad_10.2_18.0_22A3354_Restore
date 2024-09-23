void sub_10008EF60()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t Strong;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t ObjectType;
  void (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  id v22;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedMessage);
  if (v1)
  {
    v2 = v0;
    v3 = *(void **)(v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedMessageInfo);
    if (v3)
    {
      v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedEvent);
      if (v4)
      {
        v5 = *(void **)(v0 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_message);
        v6 = *(void **)(v0 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_conversation);
        v7 = (void *)BCMessageRootEventKey;
        v8 = v1;
        v9 = v3;
        swift_retain_n(v4, 2);
        v22 = v8;
        v10 = v9;
        v11 = v5;
        v12 = v6;
        v13 = v7;
        sub_1000371DC(1);
        v14 = v2 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController__dismissalDelegate;
        Strong = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController__dismissalDelegate);
        swift_unknownObjectRelease(Strong);
        if (Strong)
        {
          v16 = swift_unknownObjectWeakLoadStrong(v14);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)(v14 + 8);
            ObjectType = swift_getObjectType(v16);
            v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 16);
            v21 = type metadata accessor for IMBTimeSelectionTableViewController();
            v20(v2, v21, ObjectType, v18);

            swift_unknownObjectRelease(v17);
          }
          else
          {

          }
          swift_release_n(v4, 2);

        }
        else
        {
          __break(1u);
        }
      }
    }
  }
}

void sub_10008F11C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  char *v8;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedTimeslot);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedTimeslot) = 0;
  swift_release(v1);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedEvent);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedEvent) = 0;
  swift_release(v2);
  v3 = *(void **)(v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedMessage);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedMessage) = 0;

  v4 = *(void **)(v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedMessageInfo);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedMessageInfo) = 0;

  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView), "reloadData");
  v8 = sub_100082DDC();
  v6 = v5;
  ObjectType = swift_getObjectType(v8);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v6 + 48))(0, ObjectType, v6);

}

uint64_t sub_10008F1D4()
{
  char *v0;
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
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void (*v23)(char *, _QWORD, uint64_t);
  char *v24;
  uint64_t v25;
  id v26;
  id v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t (**v36)(uint64_t);
  void *v37;
  id v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  _QWORD aBlock[5];
  uint64_t v73;

  v1 = type metadata accessor for DispatchWorkItemFlags(0);
  v66 = *(_QWORD *)(v1 - 8);
  v67 = v1;
  __chkstk_darwin(v1, v2);
  v65 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  v63 = *(_QWORD *)(v4 - 8);
  v64 = v4;
  __chkstk_darwin(v4, v5);
  v62 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Date(0);
  v60 = *(_QWORD *)(v7 - 8);
  v61 = v7;
  v8 = *(_QWORD *)(v60 + 64);
  __chkstk_darwin(v7, v9);
  v59 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = type metadata accessor for DispatchQoS.QoSClass(0);
  v57 = *(_QWORD *)(v58 - 8);
  result = __chkstk_darwin(v58, v10);
  v56 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = v0;
  v13 = *(_QWORD *)&v0[OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_proposedEvent];
  if (!v13)
    return result;
  v14 = *(_QWORD *)(v13 + 80);
  if (!v14)
  {
LABEL_19:
    __break(1u);
    return result;
  }
  if (!((unint64_t)v14 >> 62))
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_retain(v13);
    swift_bridgeObjectRetain(v14);
    if (v15)
      goto LABEL_5;
LABEL_17:
    swift_release(v13);
    return swift_bridgeObjectRelease(v14);
  }
  if (v14 >= 0)
    v48 = v14 & 0xFFFFFFFFFFFFFF8;
  else
    v48 = *(_QWORD *)(v13 + 80);
  swift_retain(v13);
  swift_bridgeObjectRetain(v14);
  v15 = _CocoaArrayWrapper.endIndex.getter(v48);
  if (!v15)
    goto LABEL_17;
LABEL_5:
  result = sub_1000090C8(0, (unint64_t *)&qword_1000EBD00, OS_dispatch_queue_ptr);
  v54 = result;
  if (v15 < 1)
  {
    __break(1u);
    goto LABEL_19;
  }
  v55 = v13;
  v16 = 0;
  v51 = v14 & 0xC000000000000001;
  v50 = enum case for DispatchQoS.QoSClass.default(_:);
  v49 = v8 + 7;
  v53 = v14;
  v52 = v15;
  do
  {
    if (v51)
    {
      v17 = specialized _ArrayBuffer._getElementSlowPath(_:)(v16, v14);
    }
    else
    {
      v17 = *(_QWORD *)(v14 + 8 * v16 + 32);
      swift_retain(v17);
    }
    ++v16;
    v18 = *(void **)(v55 + 16);
    v19 = v17 + OBJC_IVAR____TtC8Business15IMBProposedDate_date;
    v20 = swift_allocObject(&unk_1000DA1C0, 32, 7);
    v21 = v68;
    *(_QWORD *)(v20 + 16) = v68;
    *(_QWORD *)(v20 + 24) = v17;
    v22 = v57;
    v23 = *(void (**)(char *, _QWORD, uint64_t))(v57 + 104);
    v24 = v56;
    v70 = v17;
    v25 = v58;
    v23(v56, v50, v58);
    v26 = v18;
    v27 = v21;
    swift_retain(v17);
    v69 = static OS_dispatch_queue.global(qos:)(v24);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v25);
    v28 = v59;
    v29 = v60;
    v30 = v61;
    (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v59, v19, v61);
    v31 = *(unsigned __int8 *)(v29 + 80);
    v32 = (v31 + 16) & ~v31;
    v33 = (v49 + v32) & 0xFFFFFFFFFFFFFFF8;
    v34 = (v33 + 15) & 0xFFFFFFFFFFFFFFF8;
    v35 = swift_allocObject(&unk_1000DA1E8, v34 + 16, v31 | 7);
    (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v35 + v32, v28, v30);
    *(_QWORD *)(v35 + v33) = v26;
    v36 = (uint64_t (**)(uint64_t))(v35 + v34);
    *v36 = sub_100090724;
    v36[1] = (uint64_t (*)(uint64_t))v20;
    aBlock[4] = sub_100065580;
    v73 = v35;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100025AB0;
    aBlock[3] = &unk_1000DA200;
    v37 = _Block_copy(aBlock);
    v38 = v26;
    swift_retain(v20);
    v39 = v62;
    static DispatchQoS.unspecified.getter(v40);
    v71 = _swiftEmptyArrayStorage;
    v41 = sub_100041F44();
    v42 = sub_100007D40((uint64_t *)&unk_1000EEBA0);
    v43 = sub_100041F8C();
    v44 = v65;
    v45 = v67;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v71, v42, v43, v67, v41);
    v46 = (void *)v69;
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v39, v44, v37);
    _Block_release(v37);

    (*(void (**)(char *, uint64_t))(v66 + 8))(v44, v45);
    (*(void (**)(char *, uint64_t))(v63 + 8))(v39, v64);
    v47 = v73;
    swift_release(v70);

    swift_release(v20);
    swift_release(v47);
    v14 = v53;
  }
  while (v52 != v16);
  swift_release(v55);
  return swift_bridgeObjectRelease(v14);
}

uint64_t sub_10008F6D0(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[24];

  if (result)
  {
    v4 = result;
    v6 = *(_QWORD *)(a3 + 16);
    v5 = *(_QWORD *)(a3 + 24);
    v7 = (uint64_t *)(a2 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_datesDictionary);
    result = swift_beginAccess(a2 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_datesDictionary, v13, 0, 0);
    v8 = *v7;
    if (*(_QWORD *)(v8 + 16))
    {
      swift_bridgeObjectRetain(v5);
      swift_bridgeObjectRetain(v8);
      v9 = sub_10004F068(v6, v5);
      if ((v10 & 1) != 0)
      {
        v11 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v9);
        swift_retain(v11);
        swift_bridgeObjectRelease(v5);
        swift_bridgeObjectRelease(v8);
        v12 = *(_QWORD *)(v11 + 32);
        *(_QWORD *)(v11 + 32) = v4;
        swift_bridgeObjectRetain(v4);
        swift_bridgeObjectRelease(v12);
        objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView), "reloadData");
        return swift_release(v11);
      }
      else
      {
        swift_bridgeObjectRelease(v5);
        return swift_bridgeObjectRelease(v8);
      }
    }
  }
  return result;
}

id sub_10008F7CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id *isa;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  Class v33;
  id v34;
  NSString v35;
  NSString v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  NSString v62;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  id v70;
  id v71;

  v67 = a1;
  v2 = sub_100007D40(&qword_1000EC5F0);
  v4 = __chkstk_darwin(v2, v3);
  v6 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4, v7);
  v9 = (char *)&v64 - v8;
  v10 = *(void **)(v1 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_message);
  v11 = objc_msgSend(v10, "replyMessage");
  if (v11
    && (v12 = v11, v13 = objc_msgSend(v11, "imageIdentifier"),
                   v12,
                   v13))
  {
    v65 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
    v69 = v14;

  }
  else
  {
    v65 = 0;
    v69 = 0;
  }
  v15 = objc_msgSend(v10, "replyMessage");
  if (v15
    && (v16 = v15,
        v17 = objc_msgSend(v15, "imageDescription"),
        v16,
        v17))
  {
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    v64 = v19;

  }
  else
  {
    v18 = 0;
    v64 = 0;
  }
  v20 = objc_msgSend(v10, "replyMessage", v64);
  if (v20 || (v20 = objc_msgSend(v10, "receivedMessage")) != 0)
  {
    v21 = v20;
    v70 = objc_msgSend(v20, "style");

  }
  else
  {
    v70 = BCBubbleViewStyleIcon;
  }
  v66 = *(id *)(v1 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_conversation);
  v22 = objc_msgSend(v66, "selectedMessage");
  v23 = objc_msgSend(v22, "session");

  if (!v23)
    v23 = objc_msgSend(objc_allocWithZone((Class)MSSession), "init");
  v24 = objc_allocWithZone((Class)MSMessage);
  v68 = v23;
  v71 = objc_msgSend(v24, "initWithSession:", v23);
  v25 = objc_msgSend(objc_allocWithZone((Class)MSMessageTemplateLayout), "init");
  v26 = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
  objc_msgSend(v26, "setTimeStyle:", 1);
  objc_msgSend(v26, "setDateStyle:", 2);
  isa = *(id **)(v1 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_proposedEvent);
  if (isa)
  {
    v28 = objc_msgSend(isa[7], "timeZone", swift_retain(isa).n128_f64[0]);
    if (v28)
    {
      v29 = v28;
      static TimeZone._unconditionallyBridgeFromObjectiveC(_:)();

      v30 = type metadata accessor for TimeZone(0);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v6, 0, 1, v30);
    }
    else
    {
      v30 = type metadata accessor for TimeZone(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v6, 1, 1, v30);
    }
    sub_100014560((uint64_t)v6, (uint64_t)v9);
    swift_release(isa);
    type metadata accessor for TimeZone(0);
    v32 = *(_QWORD *)(v30 - 8);
    isa = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v9, 1, v30) != 1)
    {
      isa = (id *)TimeZone._bridgeToObjectiveC()().super.isa;
      (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v30);
    }
  }
  else
  {
    v31 = type metadata accessor for TimeZone(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v9, 1, 1, v31);
  }
  objc_msgSend(v26, "setTimeZone:", isa);

  v33 = Date._bridgeToObjectiveC()().super.isa;
  v34 = objc_msgSend(v26, "stringFromDate:", v33);

  v35 = v34;
  v36 = v34;
  if (!v34)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v38 = v37;
    v36 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v38);
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v40 = v39;
    v35 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v40);
  }
  v67 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
  v42 = v41;
  v43 = v34;
  objc_msgSend(v25, "setCaption:", v36);

  objc_msgSend(v71, "setAccessibilityLabel:", v35);
  v44 = objc_msgSend(v10, "replyMessage");
  if (v44)
  {
    v45 = v44;
    v46 = objc_msgSend(v44, "image");

  }
  else
  {
    v46 = 0;
  }
  objc_msgSend(v25, "setImage:", v46);

  v47 = objc_msgSend(v10, "replyMessage");
  if (v47
    && (v48 = v47, v49 = objc_msgSend(v47, "subtitle"), v48, v49))
  {
    v50 = v69;
    v51 = static String._unconditionallyBridgeFromObjectiveC(_:)(v49);
    v53 = v52;

  }
  else
  {
    v50 = v69;
    v51 = 0;
    v53 = 0;
  }
  v54 = objc_msgSend(v66, "selectedMessage");
  if (!v54
    || (v55 = v54, v56 = objc_msgSend(v54, "layout"), v55, !v56)
    || (v57 = objc_opt_self(MSMessageLiveLayout),
        v58 = swift_dynamicCastObjCClass(v56, v57),
        v56,
        !v58))
  {
    objc_msgSend(v71, "setLayout:", v25);
    v60 = v64;
    v61 = v65;
    if (!v53)
      goto LABEL_34;
LABEL_36:
    swift_bridgeObjectRetain(v53);
    v62 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v53);
    goto LABEL_37;
  }
  v59 = objc_msgSend(objc_allocWithZone((Class)MSMessageLiveLayout), "initWithAlternateLayout:", v25);
  objc_msgSend(v71, "setLayout:", v59);

  v60 = v64;
  v61 = v65;
  if (v53)
    goto LABEL_36;
LABEL_34:
  v62 = 0;
LABEL_37:
  objc_msgSend(v25, "setSubcaption:", v62);

  objc_allocWithZone((Class)BCMessageInfo);
  swift_bridgeObjectRetain(v42);
  sub_1000631C0(v67, v42, v51, v53, v70, v67, v42, v61, v50, v18, v60);

  return v71;
}

uint64_t sub_10008FEA8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  char *v58;
  unint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  _BYTE v62[24];

  v1 = sub_100007D40(&qword_1000EC5F0);
  v3 = __chkstk_darwin(v1, v2);
  v5 = (uint64_t)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v3, v6);
  isUniquelyReferenced_nonNull_native = (uint64_t)&v51 - v8;
  v11 = __chkstk_darwin(v7, v10);
  v13 = (unint64_t)&v51 - v12;
  result = __chkstk_darwin(v11, v14);
  v17 = (char *)&v51 - v16;
  v18 = *(_QWORD *)((char *)v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_proposedEvent);
  if (v18)
  {
    v19 = *(_QWORD *)(v18 + 80);
    if (v19)
    {
      v20 = v19 & 0xFFFFFFFFFFFFFF8;
      if ((unint64_t)v19 >> 62)
        goto LABEL_33;
      v21 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(*(_QWORD *)(v18 + 80));
      swift_retain(v18);
      if (!v21)
      {
LABEL_37:
        swift_release(v18);
        return swift_bridgeObjectRelease(v19);
      }
      while (v21 >= 1)
      {
        v22 = 0;
        v60 = (_QWORD *)((char *)v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_datesDictionary);
        v52 = (_QWORD *)((char *)v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_dates);
        v53 = v21;
        v58 = v17;
        v59 = v19 & 0xC000000000000001;
        v56 = v13;
        v57 = v5;
        v54 = v18;
        v55 = v19;
        while (1)
        {
          if (v59)
          {
            v23 = specialized _ArrayBuffer._getElementSlowPath(_:)(v22, v19);
          }
          else
          {
            v23 = *(_QWORD *)(v19 + 8 * v22 + 32);
            swift_retain(v23);
          }
          v24 = objc_msgSend(*(id *)(v18 + 56), "timeZone", swift_retain(v23).n128_f64[0]);
          if (v24)
          {
            v25 = v24;
            static TimeZone._unconditionallyBridgeFromObjectiveC(_:)();

            v26 = type metadata accessor for TimeZone(0);
            (*(void (**)(unint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v13, 0, 1, v26);
          }
          else
          {
            v26 = type metadata accessor for TimeZone(0);
            (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v13, 1, 1, v26);
          }
          sub_100014560(v13, (uint64_t)v17);
          v27 = type metadata accessor for IMBTableViewCellData(0);
          v18 = swift_allocObject(v27, *(unsigned int *)(v27 + 48), *(unsigned __int16 *)(v27 + 52));
          *(_BYTE *)(v18 + 24) = 0;
          *(_QWORD *)(v18 + 32) = 0;
          v28 = v18 + OBJC_IVAR____TtC8Business20IMBTableViewCellData_timezone;
          type metadata accessor for TimeZone(0);
          v29 = *(_QWORD *)(v26 - 8);
          v30 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56);
          v30(v28, 1, 1, v26);
          *(_QWORD *)(v18 + 16) = v23;
          sub_100014518((uint64_t)v17, v5);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v5, 1, v26) == 1)
          {
            static TimeZone.current.getter();
            sub_10007374C((uint64_t)v17);
            sub_10007374C(v5);
          }
          else
          {
            sub_10007374C((uint64_t)v17);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(isUniquelyReferenced_nonNull_native, v5, v26);
          }
          v30(isUniquelyReferenced_nonNull_native, 0, 1, v26);
          v31 = v18 + OBJC_IVAR____TtC8Business20IMBTableViewCellData_timezone;
          swift_beginAccess(v18 + OBJC_IVAR____TtC8Business20IMBTableViewCellData_timezone, v62, 33, 0);
          v17 = (char *)isUniquelyReferenced_nonNull_native;
          sub_1000906B0(isUniquelyReferenced_nonNull_native, v31);
          swift_endAccess(v62);
          v32 = *(_QWORD *)(v23 + 16);
          v19 = *(_QWORD *)(v23 + 24);
          v33 = v60;
          swift_beginAccess(v60, v62, 33, 0);
          swift_bridgeObjectRetain(v19);
          swift_retain(v18);
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v33);
          v61 = (_QWORD *)*v33;
          v0 = v61;
          *v33 = 0x8000000000000000;
          v13 = sub_10004F068(v32, v19);
          v20 = v0[2];
          v35 = (v34 & 1) == 0;
          v36 = v20 + v35;
          if (__OFADD__(v20, v35))
            break;
          v5 = v34;
          if (v0[3] >= v36)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              sub_10003B288();
          }
          else
          {
            sub_100039858(v36, isUniquelyReferenced_nonNull_native);
            v37 = sub_10004F068(v32, v19);
            if ((v5 & 1) != (v38 & 1))
              goto LABEL_40;
            v13 = v37;
          }
          isUniquelyReferenced_nonNull_native = (uint64_t)v17;
          v0 = v61;
          v17 = v58;
          if ((v5 & 1) != 0)
          {
            v39 = v61[7];
            v40 = 8 * v13;
            swift_release(*(_QWORD *)(v39 + v40));
            *(_QWORD *)(v39 + v40) = v18;
          }
          else
          {
            v61[(v13 >> 6) + 8] |= 1 << v13;
            v41 = (uint64_t *)(v0[6] + 16 * v13);
            *v41 = v32;
            v41[1] = v19;
            *(_QWORD *)(v0[7] + 8 * v13) = v18;
            v42 = v0[2];
            v43 = __OFADD__(v42, 1);
            v20 = v42 + 1;
            if (v43)
              goto LABEL_32;
            v0[2] = v20;
            swift_bridgeObjectRetain(v19);
          }
          v44 = *v60;
          *v60 = v0;
          swift_bridgeObjectRelease(v19);
          swift_bridgeObjectRelease(v44);
          swift_endAccess(v62);
          v45 = v52;
          swift_beginAccess(v52, v62, 33, 0);
          swift_retain(v18);
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v46);
          v48 = *(_QWORD *)((*v45 & 0xFFFFFFFFFFFFFF8) + 0x10);
          v47 = *(_QWORD *)((*v45 & 0xFFFFFFFFFFFFFF8) + 0x18);
          v13 = v56;
          v5 = v57;
          if (v48 >= v47 >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v47 > 1, v48 + 1, 1);
          ++v22;
          v49 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v48, v18);
          specialized Array._endMutation()(v49);
          swift_endAccess(v62);
          swift_release(v23);
          swift_release(v18);
          v18 = v54;
          v19 = v55;
          if (v53 == v22)
          {
            swift_release(v54);
            return swift_bridgeObjectRelease(v19);
          }
        }
        __break(1u);
LABEL_32:
        __break(1u);
LABEL_33:
        if (v19 >= 0)
          v50 = v20;
        else
          v50 = v19;
        swift_bridgeObjectRetain_n(v19, 2);
        swift_retain(v18);
        v21 = _CocoaArrayWrapper.endIndex.getter(v50);
        swift_bridgeObjectRelease(v19);
        if (!v21)
          goto LABEL_37;
      }
      __break(1u);
    }
    __break(1u);
LABEL_40:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
  }
  return result;
}

id sub_100090420(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_proposedEvent] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_dates] = _swiftEmptyArrayStorage;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_datesDictionary] = _swiftEmptyDictionarySingleton;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_conflictedEvents] = _swiftEmptyDictionarySingleton;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedTimeslot] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedEvent] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedMessage] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedMessageInfo] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for IMBTimeSelectionTableViewController();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

void sub_100090500()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_proposedEvent));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_dates));
  swift_bridgeObjectRelease(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_datesDictionary));
  swift_bridgeObjectRelease(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_conflictedEvents));
  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedTimeslot));
  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedEvent));

}

id sub_10009058C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMBTimeSelectionTableViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IMBTimeSelectionTableViewController()
{
  return objc_opt_self(_TtC8Business35IMBTimeSelectionTableViewController);
}

id sub_100090678()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView), "endUpdates");
}

id sub_100090694()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView), "beginUpdates");
}

uint64_t sub_1000906B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007D40(&qword_1000EC5F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000906F8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100090724(uint64_t a1)
{
  uint64_t v1;

  return sub_10008F6D0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10009072C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v1 = type metadata accessor for Date(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_release(*(_QWORD *)(v0 + v7 + 8));
  return swift_deallocObject(v0, v7 + 16, v5);
}

uint64_t sub_1000907BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000907CC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id sub_1000907D4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, double a6)
{
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t inited;
  uint64_t v18;
  uint64_t v19;
  NSString *v20;
  NSString *v21;
  unint64_t v22;
  unint64_t v23;
  Class isa;
  id v25;
  id v26;
  id v27;
  id v28;
  _BYTE v30[48];
  _BYTE v31[72];

  v12 = objc_msgSend((id)objc_opt_self(UIFontDescriptor), "preferredFontDescriptorWithTextStyle:", a1);
  v13 = v12;
  if ((_DWORD)a2)
  {
    v14 = objc_msgSend(v12, "fontDescriptorWithSymbolicTraits:", a2);
    if (v14)
    {
      v15 = v14;

      v13 = v15;
    }
  }
  if ((a4 & 1) == 0)
  {
    v16 = sub_100007D40(&qword_1000F03B8);
    inited = swift_initStackObject(v16, v31);
    *(_OWORD *)(inited + 16) = xmmword_1000AF070;
    *(_QWORD *)(inited + 32) = UIFontDescriptorTraitsAttribute;
    v18 = sub_100007D40(&qword_1000F03C0);
    v19 = swift_initStackObject(v18, v30);
    *(_OWORD *)(v19 + 16) = xmmword_1000AF070;
    *(_QWORD *)(v19 + 32) = UIFontWeightTrait;
    *(_QWORD *)(v19 + 40) = a3;
    v20 = UIFontDescriptorTraitsAttribute;
    v21 = UIFontWeightTrait;
    v22 = sub_10004DB50(v19);
    *(_QWORD *)(inited + 64) = sub_100007D40(&qword_1000F03C8);
    *(_QWORD *)(inited + 40) = v22;
    v23 = sub_10004DC58(inited);
    type metadata accessor for AttributeName(0);
    sub_100090A10();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v23);
    v25 = objc_msgSend(v13, "fontDescriptorByAddingAttributes:", isa);

    v13 = v25;
  }
  v26 = objc_msgSend((id)objc_opt_self(UIFont), "fontWithDescriptor:size:", v13, a6);
  if ((a5 & 1) != 0 && a6 > 0.0)
  {
    v27 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", a1);
    v28 = objc_msgSend(v27, "scaledFontForFont:", v26);

    v26 = v28;
  }

  return v26;
}

unint64_t sub_100090A10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000EBFD8;
  if (!qword_1000EBFD8)
  {
    type metadata accessor for AttributeName(255);
    result = swift_getWitnessTable(&unk_1000AEFF8, v1);
    atomic_store(result, (unint64_t *)&qword_1000EBFD8);
  }
  return result;
}

void sub_100090A58(char a1, void *a2)
{
  sub_100090A70(a1, a2, (uint64_t (*)(void))sub_100017244);
}

void sub_100090A64(char a1, void *a2)
{
  sub_100090A70(a1, a2, (uint64_t (*)(void))sub_1000706D8);
}

void sub_100090A70(char a1, void *a2, uint64_t (*a3)(void))
{
  void *v3;
  void *v7;
  void *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  double v14;
  id v15;
  uint64_t v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v7 = (void *)a3();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (void *)a3();
  v9 = objc_msgSend(v8, "heightAnchor");

  v10 = objc_msgSend(v3, "traitCollection");
  objc_msgSend(v10, "displayScale");
  v12 = v11;

  if (v12 <= 0.0)
  {
    v13 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
    objc_msgSend(v13, "scale");
    v12 = v14;

    if (v12 <= 0.0)
      v12 = 1.0;
  }
  v15 = objc_msgSend(v9, "constraintEqualToConstant:", 1.0 / v12);

  objc_msgSend(v15, "setActive:", 1);
  v16 = sub_10002DA10();
  v17 = 0.0;
  if (v16 == 2)
  {
    v16 = sub_10002DA10();
    v17 = 20.0;
  }
  v18 = (void *)((uint64_t (*)(uint64_t))a3)(v16);
  v19 = objc_msgSend(v18, "leadingAnchor");

  v20 = objc_msgSend(a2, "leadingAnchor");
  v21 = objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, v17);

  objc_msgSend(v21, "setActive:", 1);
  v22 = (void *)a3();
  v23 = objc_msgSend(v22, "trailingAnchor");

  v24 = objc_msgSend(a2, "trailingAnchor");
  v25 = objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -v17);

  objc_msgSend(v25, "setActive:", 1);
  v26 = (void *)a3();
  v27 = v26;
  if ((a1 & 1) != 0)
  {
    v28 = objc_msgSend(v26, "bottomAnchor");

    v29 = objc_msgSend(a2, "bottomAnchor");
  }
  else
  {
    v28 = objc_msgSend(v26, "topAnchor");

    v29 = objc_msgSend(a2, "topAnchor");
  }
  v30 = v29;
  v31 = objc_msgSend(v28, "constraintEqualToAnchor:", v30);

  objc_msgSend(v31, "setActive:", 1);
}

id sub_100090D80()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v1 = OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___titleLabel;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___titleLabel);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___titleLabel);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
    sub_10002DAB4();
    v6 = v5;
    objc_msgSend(v4, "setFont:", v5);

    v7 = objc_msgSend((id)objc_opt_self(UIColor), "labelColor");
    objc_msgSend(v4, "setTextColor:", v7);

    objc_msgSend(v4, "setNumberOfLines:", 0);
    v8 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v9 = v2;
  return v3;
}

id sub_100090E64()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___subtitleLabel;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___subtitleLabel);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___subtitleLabel);
  }
  else
  {
    v4 = sub_100090EC0();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_100090EC0()
{
  id v0;
  id v1;
  id v2;
  id v3;
  id v4;

  v0 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  if (sub_10002DA10() >= 2u)
  {
    v2 = objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleSubheadline);
    v3 = objc_msgSend((id)objc_opt_self(UIFont), "systemFontOfSize:", 11.0);
    v1 = objc_msgSend(v2, "scaledFontForFont:", v3);

  }
  else
  {
    v1 = objc_msgSend((id)objc_opt_self(UIFont), "preferredFontForTextStyle:", UIFontTextStyleSubheadline);
  }
  objc_msgSend(v0, "setFont:", v1);

  sub_10002DA10();
  v4 = objc_msgSend((id)objc_opt_self(UIColor), "secondaryLabelColor");
  objc_msgSend(v0, "setTextColor:", v4);

  objc_msgSend(v0, "setNumberOfLines:", 0);
  return v0;
}

char *sub_10009102C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  char *v5;
  uint64_t v9;
  void *v10;
  char *v11;
  char *v12;
  id v13;
  NSString v14;
  id v15;
  NSString v16;
  void *v17;
  id v18;
  objc_super v20;

  *(_QWORD *)&v5[OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___titleLabel] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___subtitleLabel] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___separatorView] = 0;
  v9 = OBJC_IVAR____TtC8Business18IMBTableHeaderView_separatorColor;
  v10 = (void *)objc_opt_self(UIColor);
  v11 = v5;
  *(_QWORD *)&v5[v9] = objc_msgSend(v10, "blackColor");

  v20.receiver = v11;
  v20.super_class = (Class)type metadata accessor for IMBTableHeaderView();
  v12 = (char *)objc_msgSendSuper2(&v20, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v13 = sub_100090D80();
  if (a2)
  {
    v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v13, "setText:", v14);

  v15 = sub_100090E64();
  if (a4)
  {
    v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a4);
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v15, "setText:", v16);

  v17 = *(void **)&v12[OBJC_IVAR____TtC8Business18IMBTableHeaderView_separatorColor];
  *(_QWORD *)&v12[OBJC_IVAR____TtC8Business18IMBTableHeaderView_separatorColor] = a5;
  v18 = a5;

  sub_100091294();
  sub_1000913F0();

  return v12;
}

void sub_100091294()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  if (sub_10002DA10() >= 2u)
  {
    if (qword_1000EBBF8 != -1)
      swift_once(&qword_1000EBBF8, sub_10002D65C);
    v1 = (id)qword_1000F8978;
  }
  else
  {
    v1 = objc_msgSend((id)objc_opt_self(UIColor), "systemBackgroundColor");
  }
  v2 = v1;
  objc_msgSend(v0, "setBackgroundColor:", v1);

  v3 = sub_1000918E4();
  v4 = *(id *)&v0[OBJC_IVAR____TtC8Business18IMBTableHeaderView_separatorColor];
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = sub_100090D80();
  objc_msgSend(v0, "addSubview:", v5);

  v6 = sub_100090E64();
  objc_msgSend(v0, "addSubview:", v6);

  if (sub_10002DA10() != 2)
  {
    v7 = sub_1000918E4();
    objc_msgSend(v0, "addSubview:", v7);

  }
}

void sub_1000913F0()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  char v5;
  double v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;
  double v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  double v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  double v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;

  v1 = sub_100090D80();
  objc_msgSend(v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v2 = sub_100090D80();
  v3 = objc_msgSend(v2, "topAnchor");

  v4 = objc_msgSend(v0, "topAnchor");
  v5 = sub_10002DA10();
  v6 = 18.0;
  if (v5 == 2)
    v6 = 20.0;
  v7 = objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, v6);

  objc_msgSend(v7, "setActive:", 1);
  v8 = sub_100090D80();
  v9 = objc_msgSend(v8, "leadingAnchor");

  v10 = objc_msgSend(v0, "safeAreaLayoutGuide");
  v11 = objc_msgSend(v10, "leadingAnchor");

  if ((sub_10002DA10() & 0xFE) != 0)
    v12 = 16.0;
  else
    v12 = 20.0;
  v13 = objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, v12);

  objc_msgSend(v13, "setActive:", 1);
  v14 = sub_100090D80();
  v15 = objc_msgSend(v14, "trailingAnchor");

  v16 = objc_msgSend(v0, "safeAreaLayoutGuide");
  v17 = objc_msgSend(v16, "trailingAnchor");

  if ((sub_10002DA10() & 0xFE) != 0)
    v18 = 16.0;
  else
    v18 = 20.0;
  v19 = objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -v18);

  objc_msgSend(v19, "setActive:", 1);
  v20 = sub_100090E64();
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v21 = sub_100090E64();
  v22 = objc_msgSend(v21, "topAnchor");

  v23 = sub_100090D80();
  v24 = objc_msgSend(v23, "bottomAnchor");

  v25 = sub_10002DA10();
  v26 = 2.0;
  if (v25 == 2)
    v26 = 4.0;
  v27 = objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, v26);

  objc_msgSend(v27, "setActive:", 1);
  v28 = sub_100090E64();
  v29 = objc_msgSend(v28, "leadingAnchor");

  v30 = objc_msgSend(v0, "safeAreaLayoutGuide");
  v31 = objc_msgSend(v30, "leadingAnchor");

  if ((sub_10002DA10() & 0xFE) != 0)
    v32 = 16.0;
  else
    v32 = 20.0;
  v33 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, v32);

  objc_msgSend(v33, "setActive:", 1);
  v34 = sub_100090E64();
  v35 = objc_msgSend(v34, "trailingAnchor");

  v36 = objc_msgSend(v0, "safeAreaLayoutGuide");
  v37 = objc_msgSend(v36, "trailingAnchor");

  if ((sub_10002DA10() & 0xFE) != 0)
    v38 = 16.0;
  else
    v38 = 20.0;
  v39 = objc_msgSend(v35, "constraintEqualToAnchor:constant:", v37, -v38);

  objc_msgSend(v39, "setActive:", 1);
  if (sub_10002DA10() == 2)
  {
    v40 = objc_msgSend(v0, "bottomAnchor");
    v41 = sub_100090E64();
    v42 = objc_msgSend(v41, "bottomAnchor");

    v43 = objc_msgSend(v40, "constraintEqualToAnchor:constant:", v42, 20.0);
  }
  else
  {
    sub_100090A70(1, v0, (uint64_t (*)(void))sub_1000918E4);
    v44 = sub_1000918E4();
    v40 = objc_msgSend(v44, "topAnchor");

    v45 = sub_100090E64();
    v42 = objc_msgSend(v45, "bottomAnchor");

    v43 = objc_msgSend(v40, "constraintEqualToAnchor:constant:", v42, 18.0);
  }
  v46 = v43;

  objc_msgSend(v46, "setActive:", 1);
}

id sub_1000918E4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___separatorView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___separatorView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC8Business18IMBTableHeaderView____lazy_storage___separatorView);
  }
  else
  {
    v4 = type metadata accessor for SeparatorView();
    v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v4)), "init");
    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

id sub_100091984()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMBTableHeaderView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IMBTableHeaderView()
{
  return objc_opt_self(_TtC8Business18IMBTableHeaderView);
}

uint64_t sub_100091A2C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _BYTE v17[24];
  __int128 v18;
  __int128 v19;
  _BYTE v20[24];

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC8Business14IMBNetworkBody__body);
  swift_beginAccess(v0 + OBJC_IVAR____TtC8Business14IMBNetworkBody__body, v20, 1, 0);
  v2 = *v1;
  *v1 = (uint64_t)&_swiftEmptyDictionarySingleton;
  swift_bridgeObjectRelease(v2);
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(BCMessageDataRequestIdentifierKey);
  v5 = v4;
  v6 = *(void **)(v0 + OBJC_IVAR____TtC8Business14IMBNetworkBody_message);
  v7 = objc_msgSend(v6, "requestIdentifier");
  if (v7)
  {
    v8 = v7;
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    v11 = v10;

    *((_QWORD *)&v19 + 1) = &type metadata for String;
    *(_QWORD *)&v18 = v9;
    *((_QWORD *)&v18 + 1) = v11;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  swift_beginAccess(v1, v17, 33, 0);
  sub_100038418((uint64_t)&v18, v3, v5);
  swift_endAccess(v17);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(BCMessageDataVersionKey);
  v14 = v13;
  v15 = objc_msgSend(v6, "version");
  *((_QWORD *)&v19 + 1) = &type metadata for Int;
  *(_QWORD *)&v18 = v15;
  swift_beginAccess(v1, v17, 33, 0);
  sub_100038418((uint64_t)&v18, v12, v14);
  return swift_endAccess(v17);
}

unint64_t sub_100091BA0(uint64_t a1)
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
    sub_100007D40(&qword_1000ED5B8);
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
        sub_10004F0CC(a1);
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
    sub_100008FC8(*(_QWORD *)(a1 + 48) + 40 * v12, (uint64_t)v37);
    sub_100009C74(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v38 + 8);
    v35[0] = v38[0];
    v35[1] = v38[1];
    v36 = v39;
    v34[0] = v37[0];
    v34[1] = v37[1];
    sub_100008FC8((uint64_t)v34, (uint64_t)v29);
    if (!swift_dynamicCast(&v27, v29, &type metadata for AnyHashable, &type metadata for String, 6))
    {
      v27 = 0;
      v28 = 0;
      sub_1000928F8((uint64_t)v34);
      swift_bridgeObjectRelease(v28);
      sub_10004F0CC(a1);
      swift_release(v3);
      return 0;
    }
    v17 = v27;
    v18 = v28;
    sub_100009C74((uint64_t)v35 + 8, (uint64_t)v29);
    sub_1000928F8((uint64_t)v34);
    sub_100009CF0(v29, v30);
    *(_QWORD *)&v31 = v17;
    *((_QWORD *)&v31 + 1) = v18;
    sub_100009CF0(v30, v32);
    v19 = v31;
    sub_100009CF0(v32, v33);
    sub_100009CF0(v33, &v31);
    result = sub_10004F068(v19, *((uint64_t *)&v19 + 1));
    v20 = result;
    if ((v21 & 1) != 0)
    {
      v9 = v3[6] + 16 * result;
      swift_bridgeObjectRelease(*(_QWORD *)(v9 + 8));
      *(_OWORD *)v9 = v19;
      v10 = (_QWORD *)(v3[7] + 32 * v20);
      sub_100010C40(v10);
      result = (unint64_t)sub_100009CF0(&v31, v10);
      goto LABEL_8;
    }
    if (v3[2] >= v3[3])
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v3[6] + 16 * result) = v19;
    result = (unint64_t)sub_100009CF0(&v31, (_OWORD *)(v3[7] + 32 * result));
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

id sub_100091F8C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMBNetworkBody();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IMBNetworkBody()
{
  return objc_opt_self(_TtC8Business14IMBNetworkBody);
}

uint64_t sub_100092014(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD v20[2];
  __int128 v21;
  uint64_t v22;

  v3 = v2;
  sub_100091A2C();
  v5 = sub_10000DE58();
  *(_QWORD *)&v21 = _swiftEmptyArrayStorage;
  if (!((unint64_t)a2 >> 62))
  {
    v6 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(a2);
    if (v6)
      goto LABEL_3;
LABEL_14:
    swift_bridgeObjectRelease(a2);
    v12 = _swiftEmptyArrayStorage;
LABEL_15:
    v22 = sub_100007D40(&qword_1000F0468);
    *(_QWORD *)&v21 = v12;
    sub_100009CF0(&v21, v20);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v5);
    sub_10003A658(v20, 0x73726F727265, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
    v15 = v5;
    swift_bridgeObjectRelease(0x8000000000000000);
    v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(BCMessageRootPaymentKey);
    v18 = v17;
    v22 = sub_100007D40(&qword_1000EC478);
    *(_QWORD *)&v21 = v15;
    v19 = v3 + OBJC_IVAR____TtC8Business14IMBNetworkBody__body;
    swift_beginAccess(v19, v20, 33, 0);
    sub_100038418((uint64_t)&v21, v16, v18);
    swift_endAccess(v20);
    return *(_QWORD *)v19;
  }
  if (a2 < 0)
    v13 = a2;
  else
    v13 = a2 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a2);
  result = _CocoaArrayWrapper.endIndex.getter(v13);
  v6 = result;
  if (!result)
    goto LABEL_14;
LABEL_3:
  if (v6 >= 1)
  {
    v8 = 0;
    do
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        v9 = specialized _ArrayBuffer._getElementSlowPath(_:)(v8, a2);
      }
      else
      {
        v9 = *(_QWORD *)(a2 + 8 * v8 + 32);
        swift_retain(v9);
      }
      ++v8;
      sub_100022724();
      v11 = v10;
      swift_release(v9);
      sub_10009AC28(v11);
    }
    while (v6 != v8);
    swift_bridgeObjectRelease(a2);
    v12 = (_QWORD *)v21;
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_100092200(void *a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[24];
  _QWORD v13[4];

  sub_100091A2C();
  v3 = objc_msgSend(a1, "dictionaryRepresentation");
  if (v3
    && (v4 = v3,
        v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable), v4, v6 = sub_100091BA0(v5), swift_bridgeObjectRelease(v5), v6))
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(BCMessageRootPaymentKey);
    v9 = v8;
    v13[3] = sub_100007D40(&qword_1000EC478);
    v13[0] = v6;
    v10 = v1 + OBJC_IVAR____TtC8Business14IMBNetworkBody__body;
    swift_beginAccess(v10, v12, 33, 0);
    sub_100038418((uint64_t)v13, v7, v9);
    swift_endAccess(v12);
  }
  else
  {
    v10 = v1 + OBJC_IVAR____TtC8Business14IMBNetworkBody__body;
    swift_beginAccess(v10, v13, 0, 0);
  }
  return *(_QWORD *)v10;
}

uint64_t sub_10009231C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t inited;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  _OWORD v29[2];
  char v30[96];
  __int128 v31;
  uint64_t v32;

  v2 = v1;
  sub_100091A2C();
  v4 = objc_msgSend(a1, "dictionaryRepresentation");
  if (v4
    && (v5 = v4,
        v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable), v5, v7 = sub_100091BA0(v6), swift_bridgeObjectRelease(v6), v7))
  {
    v8 = sub_10004DF18((uint64_t)_swiftEmptyArrayStorage);
    v9 = sub_100007D40(&qword_1000EC478);
    v32 = v9;
    *(_QWORD *)&v31 = v7;
    sub_100009CF0(&v31, v29);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v8);
    sub_10003A658(v29, 0x4D746E656D796170, 0xED0000646F687465, isUniquelyReferenced_nonNull_native);
    v11 = v8;
    swift_bridgeObjectRelease(0x8000000000000000);
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(BCMessageRootPaymentKey);
    v14 = v13;
    v32 = v9;
    *(_QWORD *)&v31 = v11;
    v15 = v2 + OBJC_IVAR____TtC8Business14IMBNetworkBody__body;
    swift_beginAccess(v2 + OBJC_IVAR____TtC8Business14IMBNetworkBody__body, v29, 33, 0);
    v16 = v12;
    v17 = v14;
  }
  else
  {
    v18 = sub_100007D40(&qword_1000F0458);
    inited = swift_initStackObject(v18, v30);
    *(_OWORD *)(inited + 16) = xmmword_1000ADFC0;
    strcpy((char *)(inited + 32), "paymentNetwork");
    *(_BYTE *)(inited + 47) = -18;
    v20 = objc_msgSend(a1, "network");
    if (v20)
    {
      v21 = v20;
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
      v24 = v23;

    }
    else
    {
      v22 = 0;
      v24 = 0;
    }
    *(_QWORD *)(inited + 48) = v22;
    *(_QWORD *)(inited + 56) = v24;
    *(_QWORD *)(inited + 64) = 0x54746E656D796170;
    *(_QWORD *)(inited + 72) = 0xEB00000000657079;
    *(_QWORD *)&v31 = objc_msgSend(a1, "type");
    type metadata accessor for PKPaymentMethodType(0);
    *(_QWORD *)(inited + 80) = String.init<A>(reflecting:)(&v31, v25);
    *(_QWORD *)(inited + 88) = v26;
    v27 = sub_10004E04C(inited);
    v32 = sub_100007D40(&qword_1000F0460);
    *(_QWORD *)&v31 = v27;
    v15 = v2 + OBJC_IVAR____TtC8Business14IMBNetworkBody__body;
    swift_beginAccess(v2 + OBJC_IVAR____TtC8Business14IMBNetworkBody__body, v29, 33, 0);
    v16 = 0x4D746E656D796170;
    v17 = 0xED0000646F687465;
  }
  sub_100038418((uint64_t)&v31, v16, v17);
  swift_endAccess(v29);
  return *(_QWORD *)v15;
}

uint64_t sub_1000925CC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v17[2];
  __int128 v18;
  uint64_t v19;

  v2 = v1;
  sub_100091A2C();
  v4 = objc_msgSend(a1, "dictionaryRepresentation");
  if (v4)
  {
    v5 = v4;
    v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    v7 = sub_100091BA0(v6);
    swift_bridgeObjectRelease(v6);
    if (v7)
    {
      v8 = sub_10004DF18((uint64_t)_swiftEmptyArrayStorage);
      v9 = sub_100007D40(&qword_1000EC478);
      v19 = v9;
      *(_QWORD *)&v18 = v7;
      sub_100009CF0(&v18, v17);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v8);
      sub_10003A658(v17, 0x676E697070696873, 0xEE00646F6874654DLL, isUniquelyReferenced_nonNull_native);
      v11 = v8;
      swift_bridgeObjectRelease(0x8000000000000000);
      v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(BCMessageRootPaymentKey);
      v14 = v13;
      v19 = v9;
      *(_QWORD *)&v18 = v11;
      swift_beginAccess(v2 + OBJC_IVAR____TtC8Business14IMBNetworkBody__body, v17, 33, 0);
      sub_100038418((uint64_t)&v18, v12, v14);
      swift_endAccess(v17);
    }
  }
  v15 = v2 + OBJC_IVAR____TtC8Business14IMBNetworkBody__body;
  swift_beginAccess(v15, &v18, 0, 0);
  return *(_QWORD *)v15;
}

uint64_t sub_100092760(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v17[2];
  __int128 v18;
  uint64_t v19;

  v2 = v1;
  sub_100091A2C();
  v4 = objc_msgSend(a1, "dictionaryRepresentation");
  if (v4
    && (v5 = v4,
        v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable), v5, v7 = sub_100091BA0(v6), swift_bridgeObjectRelease(v6), v7))
  {
    v8 = sub_10004DF18((uint64_t)_swiftEmptyArrayStorage);
    v9 = sub_100007D40(&qword_1000EC478);
    v19 = v9;
    *(_QWORD *)&v18 = v7;
    sub_100009CF0(&v18, v17);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v8);
    sub_10003A658(v17, 0x676E697070696873, 0xEF746361746E6F43, isUniquelyReferenced_nonNull_native);
    v11 = v8;
    swift_bridgeObjectRelease(0x8000000000000000);
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(BCMessageRootPaymentKey);
    v14 = v13;
    v19 = v9;
    *(_QWORD *)&v18 = v11;
    v15 = v2 + OBJC_IVAR____TtC8Business14IMBNetworkBody__body;
    swift_beginAccess(v2 + OBJC_IVAR____TtC8Business14IMBNetworkBody__body, v17, 33, 0);
    sub_100038418((uint64_t)&v18, v12, v14);
    swift_endAccess(v17);
  }
  else
  {
    v15 = v2 + OBJC_IVAR____TtC8Business14IMBNetworkBody__body;
    swift_beginAccess(v2 + OBJC_IVAR____TtC8Business14IMBNetworkBody__body, &v18, 0, 0);
  }
  return *(_QWORD *)v15;
}

uint64_t sub_1000928F8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100007D40(&qword_1000F0450);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_100092938()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC8Business9RetryView____lazy_storage___messageLabel;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC8Business9RetryView____lazy_storage___messageLabel);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC8Business9RetryView____lazy_storage___messageLabel);
  }
  else
  {
    v4 = sub_100092994();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_100092994()
{
  id v0;
  id v1;
  Swift::String v2;
  Swift::String v3;
  void *object;
  NSString v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  Swift::String v12;

  v0 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v1 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v12._object = (void *)0xE000000000000000;
  v2._object = (void *)0x80000001000BB780;
  v2._countAndFlagsBits = 0xD000000000000010;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v12._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v2, (Swift::String_optional)0, (NSBundle)v1, v3, v12)._object;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v0, "setText:", v5);

  v6 = objc_msgSend((id)objc_opt_self(UIFont), "preferredFontForTextStyle:", UIFontTextStyleFootnote);
  objc_msgSend(v0, "setFont:", v6);

  objc_msgSend(v0, "setNumberOfLines:", 0);
  objc_msgSend(v0, "setTextAlignment:", 1);
  LODWORD(v7) = 1148846080;
  objc_msgSend(v0, "setContentHuggingPriority:forAxis:", 1, v7);
  LODWORD(v8) = 1148846080;
  objc_msgSend(v0, "setContentHuggingPriority:forAxis:", 0, v8);
  LODWORD(v9) = 1148846080;
  objc_msgSend(v0, "setContentCompressionResistancePriority:forAxis:", 1, v9);
  LODWORD(v10) = 1148846080;
  objc_msgSend(v0, "setContentCompressionResistancePriority:forAxis:", 0, v10);
  return v0;
}

id sub_100092B50()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC8Business9RetryView____lazy_storage___retryButton;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC8Business9RetryView____lazy_storage___retryButton);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC8Business9RetryView____lazy_storage___retryButton);
  }
  else
  {
    v4 = sub_100092BB0(v0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_100092BB0(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  Swift::String v7;
  Swift::String v8;
  void *object;
  NSString v10;
  double v11;
  double v12;
  Swift::String v14;

  v2 = objc_msgSend((id)objc_opt_self(UIButton), "buttonWithType:", 1);
  v3 = objc_msgSend(v2, "titleLabel");
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(UIFont), "preferredFontForTextStyle:", UIFontTextStyleSubheadline);
    objc_msgSend(v4, "setFont:", v5);

  }
  v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v14._object = (void *)0xE000000000000000;
  v7._object = (void *)0x80000001000BB760;
  v7._countAndFlagsBits = 0xD000000000000012;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  v14._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v7, (Swift::String_optional)0, (NSBundle)v6, v8, v14)._object;

  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v2, "setTitle:forState:", v10, 0);

  objc_msgSend(v2, "addTarget:action:forControlEvents:", a1, "retryLoadingBundle", 64);
  objc_msgSend(v2, "setContentHorizontalAlignment:", 0);
  LODWORD(v11) = 1148846080;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 1, v11);
  LODWORD(v12) = 1148846080;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 0, v12);
  return v2;
}

id sub_100092D88()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  objc_super v9;

  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business9RetryView____lazy_storage___messageLabel] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business9RetryView____lazy_storage___retryButton] = 0;
  v1 = &v0[OBJC_IVAR____TtC8Business9RetryView_delegate];
  *((_QWORD *)v1 + 1) = 0;
  swift_unknownObjectWeakInit(v1, 0);
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for RetryView();
  v2 = objc_msgSendSuper2(&v9, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_1000090C8(0, (unint64_t *)&qword_1000ECE70, OS_os_log_ptr);
  v3 = v2;
  v4 = (void *)static OS_os_log.default.getter(v3);
  v5 = static os_log_type_t.default.getter(v4);
  os_log(_:dso:log:type:_:)("JITAppKit : Setting up Retry Page View", 38, 2, &_mh_execute_header, v4, v5, _swiftEmptyArrayStorage);

  v6 = sub_100092938();
  objc_msgSend(v3, "addSubview:", v6);

  v7 = sub_100092B50();
  objc_msgSend(v3, "addSubview:", v7);

  sub_100092F7C();
  return v3;
}

void sub_100092F7C()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
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
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
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
  uint64_t v38;
  void *v39;
  Class isa;

  v1 = sub_100092938();
  objc_msgSend(v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v2 = sub_100092B50();
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v39 = (void *)objc_opt_self(NSLayoutConstraint);
  v3 = sub_100007D40((uint64_t *)&unk_1000ED490);
  v4 = swift_allocObject(v3, 88, 7);
  *(_OWORD *)(v4 + 16) = xmmword_1000AF590;
  v5 = sub_100092938();
  v6 = objc_msgSend(v5, "topAnchor");

  v7 = objc_msgSend(v0, "topAnchor");
  v8 = objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 0.0);

  *(_QWORD *)(v4 + 32) = v8;
  v9 = sub_100092938();
  v10 = objc_msgSend(v9, "bottomAnchor");

  v11 = sub_100092B50();
  v12 = objc_msgSend(v11, "topAnchor");

  v13 = objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, -20.0);
  *(_QWORD *)(v4 + 40) = v13;
  v14 = sub_100092938();
  v15 = objc_msgSend(v14, "leadingAnchor");

  v16 = objc_msgSend(v0, "layoutMarginsGuide");
  v17 = objc_msgSend(v16, "leadingAnchor");

  v18 = objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  *(_QWORD *)(v4 + 48) = v18;
  v19 = sub_100092938();
  v20 = objc_msgSend(v19, "trailingAnchor");

  v21 = objc_msgSend(v0, "layoutMarginsGuide");
  v22 = objc_msgSend(v21, "trailingAnchor");

  v23 = objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  *(_QWORD *)(v4 + 56) = v23;
  v24 = sub_100092B50();
  v25 = objc_msgSend(v24, "leadingAnchor");

  v26 = objc_msgSend(v0, "layoutMarginsGuide");
  v27 = objc_msgSend(v26, "leadingAnchor");

  v28 = objc_msgSend(v25, "constraintEqualToAnchor:", v27);
  *(_QWORD *)(v4 + 64) = v28;
  v29 = sub_100092B50();
  v30 = objc_msgSend(v29, "trailingAnchor");

  v31 = objc_msgSend(v0, "layoutMarginsGuide");
  v32 = objc_msgSend(v31, "trailingAnchor");

  v33 = objc_msgSend(v30, "constraintEqualToAnchor:", v32);
  *(_QWORD *)(v4 + 72) = v33;
  v34 = sub_100092B50();
  v35 = objc_msgSend(v34, "bottomAnchor");

  v36 = objc_msgSend(v0, "bottomAnchor");
  v37 = objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, 0.0);

  *(_QWORD *)(v4 + 80) = v37;
  specialized Array._endMutation()(v38);
  sub_1000090C8(0, (unint64_t *)&qword_1000EEB90, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  objc_msgSend(v39, "activateConstraints:", isa);

}

id sub_1000933B8()
{
  char *v0;
  void *v1;
  uint64_t Strong;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  Swift::String v7;

  v1 = v0;
  Strong = swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC8Business9RetryView_delegate]);
  if (Strong)
  {
    v3 = Strong;
    v4 = *(void **)(Strong + OBJC_IVAR____TtC8Business26IMBJITAppKitViewController_bundleVersion + 8);
    if (v4)
    {
      v5 = *(_QWORD *)(Strong + OBJC_IVAR____TtC8Business26IMBJITAppKitViewController_bundleVersion);
      swift_bridgeObjectRetain(*(_QWORD *)(Strong
                                         + OBJC_IVAR____TtC8Business26IMBJITAppKitViewController_bundleVersion
                                         + 8));
      sub_10006BAE0();
      sub_100069F24();
      if (qword_1000EBCF0 != -1)
        swift_once(&qword_1000EBCF0, sub_100097FB0);
      objc_msgSend((id)qword_1000F0850, "setBundleState:", 0);
      v6 = (id)qword_1000F0850;
      v7._countAndFlagsBits = v5;
      v7._object = v4;
      IMBJITAppBundleManager.load(_:)(v7);
      swift_unknownObjectRelease(v3);
      swift_bridgeObjectRelease(v4);

    }
    else
    {
      swift_unknownObjectRelease(Strong);
    }
  }
  objc_msgSend(v1, "removeFromSuperview");
  return objc_msgSend(v1, "setHidden:", 1);
}

id sub_100093524()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RetryView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RetryView()
{
  return objc_opt_self(_TtC8Business9RetryView);
}

_QWORD *sub_1000935BC(char a1, void *a2, void *a3)
{
  void *v3;
  _BYTE *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;
  id v13;
  id v14;
  _QWORD *v15;
  __objc2_prot *v17;

  v7 = v3;
  v8 = objc_msgSend(a3, "rootObject");
  if (!v8)
    goto LABEL_5;
  v9 = v8;
  v17 = &OBJC_PROTOCOL___BCOAuth2ResponseProtocol;
  v10 = (void *)swift_dynamicCastObjCProtocolConditional(v8, 1, &v17);
  if (!v10)
  {
    swift_unknownObjectRelease(v9);
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v11 = objc_msgSend(v10, "error");

  swift_unknownObjectRelease(v9);
  v12 = v11 != 0;
LABEL_6:
  v7[OBJC_IVAR____TtC8Business27IMBAuthenticationBubbleView_authenticationFailed] = v12;

  v13 = a2;
  v14 = a3;
  v15 = sub_10007F810(a1 & 1, v13, v14);
  sub_100093760();

  return v15;
}

void sub_100093720()
{
  uint64_t v0;

  *(_BYTE *)(v0 + OBJC_IVAR____TtC8Business19IMBActionBubbleView_shouldShowImage) = (*(_BYTE *)(v0
                                                                                              + OBJC_IVAR____TtC8Business19IMBActionBubbleView_isInvalid) & 1) == 0;
  sub_10007FB34();
  sub_100093760();
}

void sub_100093760()
{
  _BYTE *v0;
  void *v1;
  unsigned int v2;
  char **v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSString v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  NSString v35;
  uint64_t v36;
  uint64_t v37;
  id v38;

  v1 = *(void **)&v0[OBJC_IVAR____TtC8Business19IMBActionBubbleView_message];
  v2 = objc_msgSend(v1, "isFromMe");
  v3 = &selRef_replyMessage;
  if (!v2)
    v3 = &selRef_receivedMessage;
  v4 = objc_msgSend(v1, *v3);
  v38 = v4;
  if (v0[OBJC_IVAR____TtC8Business19IMBActionBubbleView_isInvalid] == 1)
  {
    v5 = objc_msgSend((id)objc_opt_self(BCMessage), "defaultBubbleTitleFor:", v1);
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
    v8 = v7;

    v9 = (uint64_t *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_title];
    v10 = *(_QWORD *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_title + 8];
    *v9 = v6;
    v9[1] = v8;
    swift_bridgeObjectRelease(v10);
    sub_1000AA190();
    v11 = 0;
  }
  else
  {
    if (!v4
      || (v12 = objc_msgSend(v4, "alternateTitle")) == 0
      && (v12 = objc_msgSend(v38, "title")) == 0)
    {
      v12 = objc_msgSend((id)objc_opt_self(BCMessage), "defaultBubbleTitleFor:", v1);
    }
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
    v15 = v14;

    v16 = (uint64_t *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_title];
    v17 = *(_QWORD *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_title + 8];
    *v16 = v13;
    v16[1] = v15;
    swift_bridgeObjectRelease(v17);
    sub_1000AA190();
    if (v38 && (v18 = objc_msgSend(v38, "subtitle")) != 0)
    {
      v19 = v18;
      v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
      v22 = v21;

    }
    else
    {
      v20 = 0;
      v22 = 0;
    }
    v23 = (uint64_t *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitle];
    v24 = *(_QWORD *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitle + 8];
    *v23 = v20;
    v23[1] = v22;
    swift_bridgeObjectRelease(v24);
    v25 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabel];
    v26 = v23[1];
    if (v26)
    {
      swift_bridgeObjectRetain(v23[1]);
      v27 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v26);
    }
    else
    {
      v27 = 0;
    }
    objc_msgSend(v25, "setText:", v27);

    v28 = v38;
    if (v38)
      v28 = objc_msgSend(v38, "image");
    v29 = OBJC_IVAR____TtC8Business13IMBBubbleView_image;
    v30 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_image];
    *(_QWORD *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_image] = v28;
    v31 = v28;

    sub_1000AA424();
    v32 = *(void **)&v0[v29];
    if (v32)
    {
      v33 = v32;
      if (v38)
      {
        v34 = objc_msgSend(v38, "imageDescription");
        v35 = v34;
        if (v34)
        {
          static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
          v37 = v36;

          v35 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v37);
        }
      }
      else
      {
        v35 = 0;
      }
      objc_msgSend(v33, "setAccessibilityLabel:", v35);

    }
    v11 = objc_msgSend(v1, "isFromMe") ^ 1;
  }
  objc_msgSend(v0, "setUserInteractionEnabled:", v11);

}

id sub_100093AA4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMBAuthenticationBubbleView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IMBAuthenticationBubbleView()
{
  return objc_opt_self(_TtC8Business27IMBAuthenticationBubbleView);
}

uint64_t sub_100093AF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  id v16;
  char v17;
  uint64_t v18;

  if ((unint64_t)a2 >> 62)
    goto LABEL_20;
  v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a2);
  for (; v4; v4 = _CocoaArrayWrapper.endIndex.getter(v18))
  {
    v5 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      v6 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a2);
LABEL_5:
      v7 = v6;
      sub_100093DF4();
      v8 = static NSObject.== infix(_:_:)(v7, a1);

      if ((v8 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease(a2);
        return 1;
      }
      if (v4 == 1)
        goto LABEL_18;
      if (v5)
        break;
      v5 = 5;
      while (1)
      {
        v15 = v5 - 3;
        if (__OFADD__(v5 - 4, 1))
          break;
        v16 = *(id *)(a2 + 8 * v5);
        v17 = static NSObject.== infix(_:_:)(v16, a1);

        if ((v17 & 1) != 0)
          goto LABEL_6;
        ++v5;
        if (v15 == v4)
          goto LABEL_18;
      }
      __break(1u);
    }
    v10 = 1;
    while (1)
    {
      v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(v10, a2);
      v12 = v10 + 1;
      if (__OFADD__(v10, 1))
        break;
      v13 = v11;
      v14 = static NSObject.== infix(_:_:)(v11, a1);
      swift_unknownObjectRelease(v13);
      if ((v14 & 1) != 0)
        goto LABEL_6;
      ++v10;
      if (v12 == v4)
        goto LABEL_18;
    }
    __break(1u);
LABEL_20:
    if (a2 < 0)
      v18 = a2;
    else
      v18 = a2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a2);
  }
LABEL_18:
  swift_bridgeObjectRelease(a2);
  return 0;
}

void sub_100093C68(void *a1)
{
  void *v1;
  id v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v3 = objc_msgSend(v1, "childViewControllers");
  v4 = sub_100093DF4();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  LOBYTE(v3) = sub_100093AF4((uint64_t)a1, v5);
  swift_bridgeObjectRelease(v5);
  if ((v3 & 1) != 0)
  {
    v6 = objc_msgSend(v1, "view");
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(a1, "view");
      if (v8)
      {
        v13 = v8;
        objc_msgSend(v7, "bringSubviewToFront:");

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_10;
  }
  objc_msgSend(a1, "willMoveToParentViewController:", v1);
  objc_msgSend(v1, "addChildViewController:", a1);
  v9 = objc_msgSend(v1, "view");
  if (!v9)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v10 = v9;
  v11 = objc_msgSend(a1, "view");
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v10, "addSubview:", v11);

    objc_msgSend(a1, "didMoveToParentViewController:", v1);
    return;
  }
LABEL_11:
  __break(1u);
}

unint64_t sub_100093DF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000EEB78;
  if (!qword_1000EEB78)
  {
    v1 = objc_opt_self(UIViewController);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000EEB78);
  }
  return result;
}

id sub_100093F18()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BubbleHostingView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for BubbleHostingView()
{
  return objc_opt_self(_TtC8Business17BubbleHostingView);
}

uint64_t sub_100093FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC8Business17BubbleHostingView_delegate);
  v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtC8Business17BubbleHostingView_delegate);
  *v3 = a1;
  v3[1] = a2;
  return swift_unknownObjectRelease(v4);
}

double sub_100093FBC()
{
  uint64_t v0;
  void *v1;
  double result;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8Business17BubbleHostingView_subview);
  if (!v1)
    return 0.0;
  objc_msgSend(v1, "sizeThatFits:");
  return result;
}

void sub_100093FF8(void *a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  Class isa;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  char *v17;
  _QWORD *v18;
  Class v19;

  v3 = OBJC_IVAR____TtC8Business17BubbleHostingView_subview;
  v4 = *(void **)&v1[OBJC_IVAR____TtC8Business17BubbleHostingView_subview];
  if (!v4)
    goto LABEL_4;
  v5 = objc_msgSend(v4, "constraints");
  v6 = sub_100011A28();
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

  v8 = (void *)objc_opt_self(NSLayoutConstraint);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  objc_msgSend(v8, "deactivateConstraints:", isa);

  v10 = *(void **)&v1[v3];
  if (v10)
  {
    objc_msgSend(v10, "removeFromSuperview");
    v11 = *(void **)&v1[v3];
  }
  else
  {
LABEL_4:
    v11 = 0;
  }
  *(_QWORD *)&v1[v3] = a1;
  v12 = a1;

  v13 = *(void **)&v1[v3];
  if (v13)
  {
    v14 = v13;
    objc_msgSend(v1, "addSubview:", v14);
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (void *)objc_opt_self(NSLayoutConstraint);
    v16 = v14;
    v17 = v1;
    v18 = sub_10003FBA4((uint64_t)&off_1000D5C28, (uint64_t)v16, (uint64_t)v17);

    sub_100011A28();
    v19 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v18);
    objc_msgSend(v15, "activateConstraints:", v19);

  }
}

uint64_t sub_1000941B0()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 80));
  return swift_deallocClassInstance(v0, 90, 7);
}

uint64_t type metadata accessor for IMBSelectedCellData()
{
  return objc_opt_self(_TtC8Business19IMBSelectedCellData);
}

id sub_100094214()
{
  char *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  objc_super v7;

  v1 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_message], "rootObject");
  if (v1)
  {
    v2 = v1;
    v3 = type metadata accessor for IMBProposedEvent();
    v4 = swift_dynamicCastClass(v2, v3);
    if (v4)
    {
      v5 = *(_QWORD *)&v0[OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_proposedEvent];
      *(_QWORD *)&v0[OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_proposedEvent] = v4;
      swift_release(v5);
    }
    else
    {
      swift_unknownObjectRelease(v2);
    }
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for IMBTimeSelectedViewController();
  objc_msgSendSuper2(&v7, "viewDidLoad");
  sub_1000947F4();
  result = (id)sub_10002DA10();
  if (result == 2)
    return objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView], "setSeparatorInset:", 0.0, 16.0, 0.0, 16.0);
  return result;
}

char *sub_1000943C8()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t countAndFlagsBits;
  void *object;
  Swift::String v7;
  Swift::String v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  Swift::String v20;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_message);
  v2 = objc_msgSend(v1, "replyMessage");
  if (v2 && (v3 = v2, v4 = objc_msgSend(v2, "title"), v3, v4))
  {
    countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v20._object = (void *)0xE000000000000000;
    v7._object = (void *)0x80000001000BB9A0;
    v7._countAndFlagsBits = 0xD000000000000022;
    v8._countAndFlagsBits = 0;
    v8._object = (void *)0xE000000000000000;
    v20._countAndFlagsBits = 0;
    v9 = NSLocalizedString(_:tableName:bundle:value:comment:)(v7, (Swift::String_optional)0, (NSBundle)v4, v8, v20);
    object = v9._object;
    countAndFlagsBits = v9._countAndFlagsBits;
  }
  v10 = countAndFlagsBits;
  v11 = (uint64_t)object;

  v12 = objc_msgSend(v1, "replyMessage");
  v13 = v12;
  if (!v12)
    goto LABEL_9;
  v14 = objc_msgSend(v12, "subtitle");

  if (!v14)
  {
    v13 = 0;
LABEL_9:
    v16 = 0;
    goto LABEL_10;
  }
  v13 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  v16 = v15;

LABEL_10:
  v17 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView), "separatorColor");
  v18 = objc_allocWithZone((Class)type metadata accessor for IMBTableHeaderView());
  return sub_10009102C(v10, v11, (uint64_t)v13, v16, v17);
}

uint64_t sub_100094574()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v6;
  uint64_t result;
  Swift::String v8;

  if (sub_10002DA10() == 2)
  {
    v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v8._object = (void *)0xE000000000000000;
    v1._countAndFlagsBits = 1162760004;
    v1._object = (void *)0xE400000000000000;
    v2._countAndFlagsBits = 0;
    v2._object = (void *)0xE000000000000000;
    v8._countAndFlagsBits = 0;
    v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v8);
    countAndFlagsBits = v3._countAndFlagsBits;
    object = v3._object;

  }
  else
  {
    countAndFlagsBits = 0;
    object = (void *)0xE000000000000000;
  }
  v6 = type metadata accessor for FooterToolbarModel();
  result = swift_allocObject(v6, 97, 7);
  *(_QWORD *)(result + 80) = 0;
  *(_QWORD *)(result + 88) = 0;
  *(_BYTE *)(result + 96) = 1;
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = 0xE000000000000000;
  *(_QWORD *)(result + 32) = 0;
  *(_QWORD *)(result + 40) = 0;
  *(_QWORD *)(result + 48) = 0xE000000000000000;
  *(_QWORD *)(result + 56) = 2;
  *(_QWORD *)(result + 64) = countAndFlagsBits;
  *(_QWORD *)(result + 72) = object;
  return result;
}

void sub_10009464C()
{
  char *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t ObjCClassFromMetadata;
  NSString v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;

  sub_100082930();
  if (sub_10002DA10() != 2)
  {
LABEL_6:
    v3 = *(void **)&v0[OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView];
    objc_msgSend(v3, "setEstimatedRowHeight:", 44.0);
    v4 = type metadata accessor for IMBInfoTableViewCell();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v4);
    v6 = String._bridgeToObjectiveC()();
    objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", ObjCClassFromMetadata, v6);

    v7 = type metadata accessor for IMBImageTableViewCell();
    v8 = swift_getObjCClassFromMetadata(v7);
    v9 = String._bridgeToObjectiveC()();
    objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v8, v9);

    v10 = type metadata accessor for IMBActionTableViewCell();
    v11 = swift_getObjCClassFromMetadata(v10);
    v12 = String._bridgeToObjectiveC()();
    objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v11, v12);

    return;
  }
  v1 = objc_msgSend(v0, "view");
  if (v1)
  {
    v2 = v1;
    if (qword_1000EBBF8 != -1)
      swift_once(&qword_1000EBBF8, sub_10002D65C);
    objc_msgSend(v2, "setBackgroundColor:", qword_1000F8978);

    goto LABEL_6;
  }
  __break(1u);
}

void sub_1000947F4()
{
  uint64_t v0;
  uint64_t v1;
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
  _UNKNOWN **v12;
  char **v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSString v27;
  uint64_t v28;
  id v29;
  _QWORD *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  Class isa;
  id v49;
  Swift::String v50;
  Swift::String v51;
  Swift::String v52;
  Class v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  void *v66;
  _UNKNOWN **v67;
  id v68;
  unint64_t v69;
  Swift::String v70;
  Swift::String v71;
  Swift::String v72;
  id v73;
  void *v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  id v84;
  Swift::String v85;
  Swift::String v86;
  Swift::String v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  void *v95;
  id v96;
  Swift::String v97;
  Swift::String v98;
  Swift::String v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  id v103;
  Swift::String v104;
  Class v105;
  _QWORD *v106;
  uint64_t v107;
  unint64_t v108;
  unint64_t v109;
  uint64_t v110;
  id v111;
  Swift::String v112;
  Swift::String v113;
  Swift::String v114;
  uint64_t v115;
  id *v116;
  id v117;
  id v118;
  Swift::String v119;
  Class v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  void *v124;
  id v125;
  uint64_t v126;
  unint64_t v127;
  unint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  _BYTE v132[24];
  _BYTE v133[24];
  Swift::String v134;
  Swift::String v135;
  Swift::String v136;
  Swift::String v137;
  Swift::String v138;

  v1 = v0;
  v2 = sub_100007D40(&qword_1000EC5F0);
  v4 = __chkstk_darwin(v2, v3);
  v6 = (char *)&v130 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4, v7);
  v9 = (char *)&v130 - v8;
  v10 = OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_proposedEvent;
  v11 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_proposedEvent);
  v12 = &_ss6HasherV8_combineyys5UInt8VF_ptr;
  v13 = &selRef_layoutMarginsGuide;
  v131 = OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_proposedEvent;
  if (!v11)
    goto LABEL_50;
  v14 = *(void **)(v11 + 88);
  if (v14)
  {
    v15 = objc_msgSend(v14, "image");
    if (v15)
    {
      v16 = v15;
      v17 = type metadata accessor for IMBSelectedCellData();
      v18 = swift_allocObject(v17, 90, 7);
      *(_QWORD *)(v18 + 72) = 0;
      *(_QWORD *)(v18 + 80) = 0;
      *(_QWORD *)(v18 + 16) = 0;
      *(_QWORD *)(v18 + 24) = 0xE000000000000000;
      *(_QWORD *)(v18 + 32) = 0;
      *(_QWORD *)(v18 + 40) = 0xE000000000000000;
      *(_QWORD *)(v18 + 48) = 0x6C65436567616D49;
      *(_QWORD *)(v18 + 56) = 0xE90000000000006CLL;
      *(_QWORD *)(v18 + 64) = v16;
      *(_WORD *)(v18 + 88) = 257;
      v19 = v16;
      v20 = v19;
      v21 = *(_QWORD *)(v1 + v10);
      if (v21 && (v22 = *(void **)(v21 + 88)) != 0)
      {
        v23 = v19;
        v24 = objc_msgSend(v22, "description");
        static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
        v26 = v25;

        v27 = String._bridgeToObjectiveC()();
        v28 = v26;
        v13 = &selRef_layoutMarginsGuide;
        swift_bridgeObjectRelease(v28);
      }
      else
      {
        v29 = v19;
        v27 = 0;
      }
      objc_msgSend(v20, "setAccessibilityLabel:", v27);

      *(_BYTE *)(v18 + 89) = sub_10002DA10() < 2u;
      v30 = (_QWORD *)(v1 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData);
      swift_beginAccess(v1 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData, v133, 33, 0);
      swift_retain(v18);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v31);
      v33 = *(_QWORD *)((*v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v32 = *(_QWORD *)((*v30 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v33 >= v32 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v32 > 1, v33 + 1, 1);
      v34 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v33, v18);
      specialized Array._endMutation()(v34);
      swift_endAccess(v133);
      swift_release(v18);

      v12 = &_ss6HasherV8_combineyys5UInt8VF_ptr;
    }
  }
  v35 = *(_QWORD *)(v1 + v10);
  if (!v35)
    goto LABEL_50;
  v36 = *(_QWORD *)(v35 + 80);
  if (!v36)
  {
    __break(1u);
    return;
  }
  v37 = v10;
  v38 = v36 & 0xFFFFFFFFFFFFFF8;
  if (!((unint64_t)v36 >> 62))
  {
    v39 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_retain(v35);
    swift_bridgeObjectRetain(v36);
    if (v39)
      goto LABEL_15;
LABEL_34:
    swift_release(v35);
    swift_bridgeObjectRelease(v36);
    v38 = v37;
    goto LABEL_42;
  }
  if (v36 >= 0)
    v62 = v36 & 0xFFFFFFFFFFFFFF8;
  else
    v62 = *(_QWORD *)(v35 + 80);
  swift_retain(v35);
  swift_bridgeObjectRetain(v36);
  if (!_CocoaArrayWrapper.endIndex.getter(v62))
    goto LABEL_34;
LABEL_15:
  if ((v36 & 0xC000000000000001) != 0)
  {
    v40 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v36);
  }
  else
  {
    if (!*(_QWORD *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_37;
    }
    v40 = *(_QWORD *)(v36 + 32);
    swift_retain(v40);
  }
  v38 = v37;
  swift_bridgeObjectRelease(v36);
  v41 = (uint64_t *)(v40 + OBJC_IVAR____TtC8Business15IMBProposedDate_timeslots);
  swift_beginAccess(v40 + OBJC_IVAR____TtC8Business15IMBProposedDate_timeslots, v132, 0, 0);
  v36 = *v41;
  swift_bridgeObjectRetain(v36);
  swift_release(v40);
  if (!((unint64_t)v36 >> 62))
  {
    v42 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v42)
      goto LABEL_20;
LABEL_41:
    swift_release(v35);
    swift_bridgeObjectRelease(v36);
    goto LABEL_42;
  }
LABEL_37:
  if (v36 < 0)
    v63 = v36;
  else
    v63 = v36 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v36);
  v42 = _CocoaArrayWrapper.endIndex.getter(v63);
  swift_bridgeObjectRelease(v36);
  if (!v42)
    goto LABEL_41;
LABEL_20:
  if ((v36 & 0xC000000000000001) != 0)
  {
    v42 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v36);
LABEL_23:
    swift_bridgeObjectRelease(v36);
    v12 = (_UNKNOWN **)objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
    objc_msgSend(v12, "setTimeStyle:", 1);
    objc_msgSend(v12, "setDateStyle:", 2);
    objc_msgSend(v12, "setDoesRelativeDateFormatting:", 1);
    v44 = objc_msgSend(*(id *)(v35 + 56), "timeZone");
    if (v44)
    {
      v45 = v44;
      static TimeZone._unconditionallyBridgeFromObjectiveC(_:)();

      v46 = type metadata accessor for TimeZone(0);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v6, 0, 1, v46);
    }
    else
    {
      v46 = type metadata accessor for TimeZone(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v6, 1, 1, v46);
    }
    sub_100014560((uint64_t)v6, (uint64_t)v9);
    type metadata accessor for TimeZone(0);
    v47 = *(_QWORD *)(v46 - 8);
    isa = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v9, 1, v46) != 1)
    {
      isa = TimeZone._bridgeToObjectiveC()().super.isa;
      (*(void (**)(char *, uint64_t))(v47 + 8))(v9, v46);
    }
    objc_msgSend(v12, "setTimeZone:", isa);

    v49 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v134._object = (void *)0xE000000000000000;
    v50._countAndFlagsBits = 1162692948;
    v50._object = (void *)0xE400000000000000;
    v51._countAndFlagsBits = 0;
    v51._object = (void *)0xE000000000000000;
    v134._countAndFlagsBits = 0;
    v52 = NSLocalizedString(_:tableName:bundle:value:comment:)(v50, (Swift::String_optional)0, (NSBundle)v49, v51, v134);

    v53 = Date._bridgeToObjectiveC()().super.isa;
    v54 = objc_msgSend(v12, "stringFromDate:", v53);

    v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
    v57 = v56;

    v58 = type metadata accessor for IMBSelectedCellData();
    v37 = swift_allocObject(v58, 90, 7);
    *(_QWORD *)(v37 + 72) = 0;
    *(_QWORD *)(v37 + 80) = 0;
    *(Swift::String *)(v37 + 16) = v52;
    *(_QWORD *)(v37 + 32) = v55;
    *(_QWORD *)(v37 + 40) = v57;
    *(_QWORD *)(v37 + 48) = 0x6C65436C6562614CLL;
    *(_QWORD *)(v37 + 56) = 0xE90000000000006CLL;
    *(_QWORD *)(v37 + 64) = 0;
    *(_QWORD *)(v37 + 64) = objc_msgSend(objc_allocWithZone((Class)UIImage), "init");
    *(_WORD *)(v37 + 88) = 257;
    v59 = (_QWORD *)(v1 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData);
    swift_beginAccess(v1 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData, v133, 33, 0);
    swift_retain(v37);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v60);
    v6 = *(char **)((*v59 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v43 = *(_QWORD *)((*v59 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if ((unint64_t)v6 < v43 >> 1)
      goto LABEL_29;
    goto LABEL_72;
  }
  v43 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v43)
  {
    v42 = *(_QWORD *)(v36 + 32);
    swift_retain(v42);
    goto LABEL_23;
  }
  __break(1u);
LABEL_72:
  specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v43 > 1, v6 + 1, 1);
LABEL_29:
  v61 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v6, v37);
  specialized Array._endMutation()(v61);
  swift_endAccess(v133);
  swift_release(v35);
  swift_release(v42);

  swift_release(v37);
  v38 = v131;
  v13 = &selRef_layoutMarginsGuide;
  v12 = &_ss6HasherV8_combineyys5UInt8VF_ptr;
LABEL_42:
  v64 = *(_QWORD *)(v1 + v38);
  if (v64)
  {
    v65 = objc_msgSend(*(id *)(v64 + 56), "structuredLocation");
    if (v65)
    {
      v66 = v65;
      v67 = v12;
      v68 = objc_msgSend((id)objc_opt_self(v12[113]), v13[33]);
      v69 = 0xE000000000000000;
      v135._object = (void *)0xE000000000000000;
      v70._countAndFlagsBits = 0x4E4F495441434F4CLL;
      v70._object = (void *)0xE800000000000000;
      v71._countAndFlagsBits = 0;
      v71._object = (void *)0xE000000000000000;
      v135._countAndFlagsBits = 0;
      v72 = NSLocalizedString(_:tableName:bundle:value:comment:)(v70, (Swift::String_optional)0, (NSBundle)v68, v71, v135);

      v73 = objc_msgSend(v66, "title");
      if (v73)
      {
        v74 = v73;
        v75 = static String._unconditionallyBridgeFromObjectiveC(_:)(v73);
        v69 = v76;

      }
      else
      {
        v75 = 0;
      }
      v77 = type metadata accessor for IMBSelectedCellData();
      v78 = swift_allocObject(v77, 90, 7);
      *(_QWORD *)(v78 + 72) = 0;
      *(_QWORD *)(v78 + 80) = 0;
      *(Swift::String *)(v78 + 16) = v72;
      *(_QWORD *)(v78 + 32) = v75;
      *(_QWORD *)(v78 + 40) = v69;
      *(_QWORD *)(v78 + 48) = 0x6C65436C6562614CLL;
      *(_QWORD *)(v78 + 56) = 0xE90000000000006CLL;
      *(_QWORD *)(v78 + 64) = 0;
      *(_QWORD *)(v78 + 64) = objc_msgSend(objc_allocWithZone((Class)UIImage), "init");
      *(_WORD *)(v78 + 88) = 257;
      v79 = (_QWORD *)(v1 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData);
      swift_beginAccess(v1 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData, v133, 33, 0);
      swift_retain(v78);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v80);
      v82 = *(_QWORD *)((*v79 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v81 = *(_QWORD *)((*v79 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v82 >= v81 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v81 > 1, v82 + 1, 1);
      v83 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v82, v78);
      specialized Array._endMutation()(v83);
      swift_endAccess(v133);

      swift_release(v78);
      v12 = v67;
    }
  }
LABEL_50:
  if (sub_10002DA10() != 2)
  {
    v84 = objc_msgSend((id)objc_opt_self(v12[113]), v13[33]);
    v136._object = (void *)0xE000000000000000;
    v85._countAndFlagsBits = 0;
    v85._object = (void *)0xE000000000000000;
    v86._countAndFlagsBits = 0;
    v86._object = (void *)0xE000000000000000;
    v136._countAndFlagsBits = 0;
    v87 = NSLocalizedString(_:tableName:bundle:value:comment:)(v85, (Swift::String_optional)0, (NSBundle)v84, v86, v136);

    v88 = type metadata accessor for IMBSelectedCellData();
    v89 = swift_allocObject(v88, 90, 7);
    *(_QWORD *)(v89 + 72) = 0;
    *(_QWORD *)(v89 + 80) = 0;
    *(_QWORD *)(v89 + 56) = 0xE90000000000006CLL;
    *(_QWORD *)(v89 + 64) = 0;
    *(Swift::String *)(v89 + 16) = v87;
    *(_QWORD *)(v89 + 32) = 0;
    *(_QWORD *)(v89 + 40) = 0xE000000000000000;
    *(_QWORD *)(v89 + 48) = 0x6C65436C6562614CLL;
    *(_QWORD *)(v89 + 64) = objc_msgSend(objc_allocWithZone((Class)UIImage), "init");
    *(_WORD *)(v89 + 88) = 1;
    v90 = (_QWORD *)(v1 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData);
    swift_beginAccess(v1 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData, v133, 33, 0);
    swift_retain(v89);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v91);
    v93 = *(_QWORD *)((*v90 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v92 = *(_QWORD *)((*v90 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v93 >= v92 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v92 > 1, v93 + 1, 1);
    v94 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v93, v89);
    specialized Array._endMutation()(v94);
    swift_endAccess(v133);
    swift_release(v89);
  }
  v95 = (void *)objc_opt_self(v12[113]);
  v96 = objc_msgSend(v95, v13[33]);
  v137._object = (void *)0xE000000000000000;
  v97._countAndFlagsBits = 0x435F4F545F444441;
  v97._object = (void *)0xEF5241444E454C41;
  v98._countAndFlagsBits = 0;
  v98._object = (void *)0xE000000000000000;
  v137._countAndFlagsBits = 0;
  v99 = NSLocalizedString(_:tableName:bundle:value:comment:)(v97, (Swift::String_optional)0, (NSBundle)v96, v98, v137);

  v100 = type metadata accessor for IMBSelectedCellData();
  v101 = swift_allocObject(v100, 90, 7);
  *(_QWORD *)(v101 + 64) = 0;
  *(_QWORD *)(v101 + 72) = 0;
  *(_QWORD *)(v101 + 80) = 0;
  *(Swift::String *)(v101 + 16) = v99;
  *(_QWORD *)(v101 + 32) = 0;
  *(_QWORD *)(v101 + 40) = 0xE000000000000000;
  *(_QWORD *)(v101 + 48) = 0x65436E6F69746341;
  *(_QWORD *)(v101 + 56) = 0xEA00000000006C6CLL;
  v102 = objc_msgSend(objc_allocWithZone((Class)UIImage), "init");
  *(_QWORD *)(v101 + 64) = v102;
  *(_WORD *)(v101 + 88) = 257;
  if (sub_10002DA10() == 2)
  {
    v103 = 0;
  }
  else
  {
    sub_1000090C8(0, (unint64_t *)&unk_1000F07E0, UIImage_ptr);
    v104._countAndFlagsBits = 0x6E656C6143646441;
    v104._object = (void *)0xEF6E6F6349726164;
    v105 = UIImage.init(imageLiteralResourceName:)(v104).super.isa;
    v103 = -[objc_class imageWithRenderingMode:](v105, "imageWithRenderingMode:", 2);

    v102 = *(id *)(v101 + 64);
  }
  *(_QWORD *)(v101 + 64) = v103;

  *(_BYTE *)(v101 + 88) = *(_QWORD *)(v1 + v131) != 0;
  v130 = v1;
  v106 = (_QWORD *)(v1 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData);
  swift_beginAccess(v1 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData, v133, 33, 0);
  swift_retain(v101);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v107);
  v109 = *(_QWORD *)((*v106 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v108 = *(_QWORD *)((*v106 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v109 >= v108 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v108 > 1, v109 + 1, 1);
  v110 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v109, v101);
  specialized Array._endMutation()(v110);
  swift_endAccess(v133);
  v111 = objc_msgSend(v95, "mainBundle");
  v138._object = (void *)0xE000000000000000;
  v112._countAndFlagsBits = 0x455249445F544547;
  v112._object = (void *)0xEE00534E4F495443;
  v113._countAndFlagsBits = 0;
  v113._object = (void *)0xE000000000000000;
  v138._countAndFlagsBits = 0;
  v114 = NSLocalizedString(_:tableName:bundle:value:comment:)(v112, (Swift::String_optional)0, (NSBundle)v111, v113, v138);

  v115 = swift_allocObject(v100, 90, 7);
  *(_QWORD *)(v115 + 64) = 0;
  v116 = (id *)(v115 + 64);
  *(_QWORD *)(v115 + 72) = 0;
  *(_QWORD *)(v115 + 80) = 0;
  *(Swift::String *)(v115 + 16) = v114;
  *(_QWORD *)(v115 + 32) = 0;
  *(_QWORD *)(v115 + 40) = 0xE000000000000000;
  *(_QWORD *)(v115 + 48) = 0x65436E6F69746341;
  *(_QWORD *)(v115 + 56) = 0xEA00000000006C6CLL;
  v117 = objc_msgSend(objc_allocWithZone((Class)UIImage), "init");
  *(_QWORD *)(v115 + 64) = v117;
  *(_WORD *)(v115 + 88) = 257;
  if (sub_10002DA10() == 2)
  {
    v118 = 0;
  }
  else
  {
    sub_1000090C8(0, (unint64_t *)&unk_1000F07E0, UIImage_ptr);
    v119._countAndFlagsBits = 0x6F69746365726944;
    v119._object = (void *)0xEE006E6F6349736ELL;
    v120 = UIImage.init(imageLiteralResourceName:)(v119).super.isa;
    v118 = -[objc_class imageWithRenderingMode:](v120, "imageWithRenderingMode:", 2);

    v117 = *v116;
  }
  v121 = v130;
  *v116 = v118;

  v122 = *(_QWORD *)(v121 + v131);
  if (v122)
  {
    v123 = objc_msgSend(*(id *)(v122 + 56), "structuredLocation");
    if (v123
      && (v124 = v123,
          v125 = objc_msgSend(v123, "geoLocation"),
          v124,
          v125))
    {

      LOBYTE(v122) = 1;
    }
    else
    {
      LOBYTE(v122) = 0;
    }
  }
  *(_BYTE *)(v115 + 88) = v122;
  *(_BYTE *)(v115 + 89) = sub_10002DA10() > 1u;
  swift_beginAccess(v106, v133, 33, 0);
  swift_retain(v115);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v126);
  v128 = *(_QWORD *)((*v106 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v127 = *(_QWORD *)((*v106 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v128 >= v127 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v127 > 1, v128 + 1, 1);
  v129 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v128, v115);
  specialized Array._endMutation()(v129);
  swift_endAccess(v133);
  objc_msgSend(*(id *)(v121 + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView), "reloadData");
  swift_release(v101);
  swift_release(v115);
}

uint64_t sub_100095620()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _QWORD *v33;
  uint64_t v34;
  id v35;
  id v36;
  Class isa;
  uint64_t v38;
  double v39;
  Class v40;
  void (*v41)(char *);
  unsigned int v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  char *v59;
  uint64_t v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  char *v88;
  id v89[5];
  char v90[24];

  v1 = v0;
  v2 = sub_100007D40(&qword_1000ED070);
  v4 = __chkstk_darwin(v2, v3);
  v6 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4, v7);
  v9 = (char *)&v78 - v8;
  v10 = sub_100007D40((uint64_t *)&unk_1000ED480);
  __chkstk_darwin(v10, v11);
  v13 = (char *)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for URL(0);
  v87 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14, v15);
  v86 = (char *)&v78 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (_QWORD *)type metadata accessor for Date(0);
  v18 = *(v17 - 1);
  result = __chkstk_darwin(v17, v19);
  v22 = (char *)&v78 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_proposedEvent;
  v24 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_proposedEvent);
  if (v24)
  {
    v84 = v6;
    v85 = v14;
    v25 = *(_QWORD *)(v24 + 80);
    if (!v25)
    {
      __break(1u);
      goto LABEL_46;
    }
    v83 = v2;
    if ((unint64_t)v25 >> 62)
    {
      if (v25 >= 0)
        v76 = v25 & 0xFFFFFFFFFFFFFF8;
      else
        v76 = v25;
      swift_bridgeObjectRetain(v25);
      if (_CocoaArrayWrapper.endIndex.getter(v76))
      {
LABEL_5:
        if ((v25 & 0xC000000000000001) != 0)
        {
          v27 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v25);
        }
        else
        {
          if (!*(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_35;
          }
          v27 = *(_QWORD *)(v25 + 32);
          swift_retain(v27);
        }
        swift_bridgeObjectRelease(v25);
        v28 = (uint64_t *)(v27 + OBJC_IVAR____TtC8Business15IMBProposedDate_timeslots);
        swift_beginAccess(v27 + OBJC_IVAR____TtC8Business15IMBProposedDate_timeslots, v90, 0, 0);
        v25 = *v28;
        swift_bridgeObjectRetain(v25);
        swift_release(v27);
        if (!((unint64_t)v25 >> 62))
        {
          v29 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v29)
            goto LABEL_10;
          goto LABEL_39;
        }
LABEL_35:
        if (v25 < 0)
          v77 = v25;
        else
          v77 = v25 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v25);
        v29 = _CocoaArrayWrapper.endIndex.getter(v77);
        swift_bridgeObjectRelease(v25);
        if (v29)
        {
LABEL_10:
          if ((v25 & 0xC000000000000001) != 0)
          {
            v30 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v25);
          }
          else
          {
            if (!*(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              goto LABEL_44;
            }
            v30 = *(_QWORD *)(v25 + 32);
            swift_retain(v30);
          }
          swift_bridgeObjectRelease(v25);
          v31 = *(_QWORD *)(v1 + v23);
          if (!v31)
            return swift_release(v30);
          v32 = *(void **)(v31 + 16);
          v33 = *(id *)(v31 + 56);
          v82 = (uint64_t)v17;
          v17 = v33;
          v34 = v30;
          v35 = v32;
          v36 = objc_msgSend(v35, "defaultCalendarForNewEvents");
          objc_msgSend(v17, "setCalendar:", v36);

          isa = Date._bridgeToObjectiveC()().super.isa;
          objc_msgSend(v17, "setStartDate:", isa);

          v39 = Date.timeIntervalSince1970.getter(v38);
          v81 = v34;
          Date.init(timeIntervalSince1970:)(v39 + (double)*(uint64_t *)(v34
                                                                     + OBJC_IVAR____TtC8Business19IMBProposedTimeslot_duration));
          v40 = Date._bridgeToObjectiveC()().super.isa;
          v41 = *(void (**)(char *))(v18 + 8);
          v25 = v82;
          v41(v22);
          objc_msgSend(v17, "setEndDate:", v40);

          v89[0] = 0;
          v80 = v35;
          v42 = objc_msgSend(v35, "saveEvent:span:error:", v17, 0, v89);
          v43 = v89[0];
          if (v42)
          {
            v78 = (_QWORD *)(v1 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_urlHelper);
            sub_10003D1A8(v1 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_urlHelper, (uint64_t)v89);
            sub_100008FA4(v89, (uint64_t)v89[3]);
            v44 = v43;
            v79 = v17;
            v45 = objc_msgSend(v17, "startDate");
            if (v45)
            {
              v46 = v45;
              static Date._unconditionallyBridgeFromObjectiveC(_:)(v45);

              v47 = v25;
              (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v9, v22, v25);
              v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
              v48(v9, 0, 1, v25);
              result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v9, 1, v25);
              v49 = v81;
              v50 = v85;
              if ((_DWORD)result != 1)
              {
                sub_10004EB94();
                ((void (*)(char *, uint64_t))v41)(v9, v25);
                v51 = v87;
                if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v87 + 48))(v13, 1, v50) != 1)
                {
                  v71 = (uint64_t)v86;
                  (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v86, v13, v50);
                  sub_100010C40(v89);
                  sub_100008FA4(v78, v78[3]);
                  sub_10004E4AC(v71, 1, 0, 0);

                  swift_release(v49);
                  return (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 8))(v71, v50);
                }
                sub_10004AF88((uint64_t)v13);
                v52 = sub_100010C40(v89);
                if (qword_1000EBCB8 != -1)
                  v52 = swift_once(&qword_1000EBCB8, sub_100082798);
                v53 = qword_1000F8A90;
                v54 = static os_log_type_t.error.getter(v52);
                v55 = sub_100007D40((uint64_t *)&unk_1000ECE50);
                v56 = swift_allocObject(v55, 72, 7);
                *(_OWORD *)(v56 + 16) = xmmword_1000AF070;
                v57 = objc_msgSend(v79, "startDate");
                if (v57)
                {
                  v58 = v57;
                  v59 = v84;
                  static Date._unconditionallyBridgeFromObjectiveC(_:)(v57);

                  v60 = 0;
                }
                else
                {
                  v60 = 1;
                  v59 = v84;
                }
                v48(v59, v60, 1, v47);
                v72 = String.init<A>(describing:)(v59, v83);
                v74 = v73;
                *(_QWORD *)(v56 + 56) = &type metadata for String;
                *(_QWORD *)(v56 + 64) = sub_100009084();
                *(_QWORD *)(v56 + 32) = v72;
                *(_QWORD *)(v56 + 40) = v74;
                os_log(_:dso:log:type:_:)("IMBTimeSelectedViewController: Failed to generate calShow url for date %@", 73, 2, &_mh_execute_header, v53, v54, v56);
                swift_release(v49);

                v75 = v56;
                return swift_bridgeObjectRelease(v75);
              }
LABEL_47:
              __break(1u);
              return result;
            }
LABEL_46:
            result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v9, 1, 1, v25);
            goto LABEL_47;
          }
          v61 = v89[0];
          v62 = (void *)_convertNSErrorToError(_:)(v43);

          swift_willThrow(v63);
          v89[0] = v62;
          v64 = sub_100007D40(&qword_1000F07D0);
          v29 = sub_1000090C8(0, &qword_1000F0900, NSError_ptr);
          v65 = swift_dynamicCast(&v88, v89, v64, v29, 0);
          v9 = v88;
          if (qword_1000EBCB8 == -1)
          {
LABEL_24:
            v66 = qword_1000F8A90;
            v67 = static os_log_type_t.error.getter(v65);
            v68 = sub_100007D40((uint64_t *)&unk_1000ECE50);
            v69 = swift_allocObject(v68, 72, 7);
            *(_OWORD *)(v69 + 16) = xmmword_1000AF070;
            *(_QWORD *)(v69 + 56) = v29;
            *(_QWORD *)(v69 + 64) = sub_100096FD0();
            *(_QWORD *)(v69 + 32) = v9;
            v70 = v9;
            os_log(_:dso:log:type:_:)("IMBTimeSelectedViewController: Failed to add event to calendar %@", 65, 2, &_mh_execute_header, v66, v67, v69);

            swift_bridgeObjectRelease(v69);
            swift_release(v81);

            return swift_errorRelease(v89[0]);
          }
LABEL_44:
          v65 = swift_once(&qword_1000EBCB8, sub_100082798);
          goto LABEL_24;
        }
LABEL_39:
        v75 = v25;
        return swift_bridgeObjectRelease(v75);
      }
    }
    else
    {
      v26 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(v25);
      if (v26)
        goto LABEL_5;
    }
    return swift_bridgeObjectRelease(v25);
  }
  return result;
}

void sub_100095E40()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char isUniquelyReferenced_nonNull_native;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  Class isa;
  unint64_t v24;
  Class v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_proposedEvent);
  if (v1)
  {
    v2 = objc_msgSend(*(id *)(v1 + 56), "structuredLocation");
    if (v2)
    {
      v29 = v2;
      v3 = objc_msgSend(v2, "geoLocation");
      if (v3)
      {
        v4 = v3;
        v5 = objc_opt_self(MKMapItem);
        v6 = objc_msgSend((id)v5, "mapItemForCurrentLocation");
        objc_msgSend(v4, "coordinate");
        v9 = objc_msgSend(objc_allocWithZone((Class)MKPlacemark), "initWithCoordinate:", v7, v8);
        v10 = objc_msgSend(objc_allocWithZone((Class)MKMapItem), "initWithPlacemark:", v9);
        v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(MKLaunchOptionsDirectionsModeKey);
        v13 = v12;
        v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(MKLaunchOptionsDirectionsModeDefault);
        v16 = v15;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(_swiftEmptyDictionarySingleton);
        sub_10003AA50(v14, v16, v11, v13, isUniquelyReferenced_nonNull_native);
        swift_bridgeObjectRelease(v13);
        swift_bridgeObjectRelease(0x8000000000000000);
        v18 = objc_msgSend(v29, "title");
        objc_msgSend(v10, "setName:", v18);

        v19 = sub_100007D40((uint64_t *)&unk_1000ED490);
        v20 = swift_allocObject(v19, 48, 7);
        *(_OWORD *)(v20 + 16) = xmmword_1000B1DA0;
        *(_QWORD *)(v20 + 32) = v6;
        *(_QWORD *)(v20 + 40) = v10;
        v30 = v20;
        specialized Array._endMutation()(v20);
        sub_1000090C8(0, &qword_1000F07C8, MKMapItem_ptr);
        v21 = v6;
        v22 = v10;
        isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v30);
        v24 = sub_10004D120((uint64_t)_swiftEmptyDictionarySingleton);
        swift_bridgeObjectRelease(_swiftEmptyDictionarySingleton);
        v25 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v24);
        LOBYTE(v5) = objc_msgSend((id)v5, "openMapsWithItems:launchOptions:", isa, v25);

        if ((v5 & 1) == 0)
        {
          if (qword_1000EBCB8 != -1)
            v26 = swift_once(&qword_1000EBCB8, sub_100082798);
          v27 = qword_1000F8A90;
          v28 = static os_log_type_t.error.getter(v26);
          os_log(_:dso:log:type:_:)("IMBTimeSelectedViewController: Failed to get directions", 55, 2, &_mh_execute_header, v27, v28, _swiftEmptyArrayStorage);
        }

      }
    }
  }
}

void sub_100096240(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  NSString v11;
  id v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  id v16;
  NSString v17;
  uint64_t v18;
  id v19;
  NSString v20;
  BOOL v21;
  NSString v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  Class isa;
  NSString v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  NSString v37;
  uint64_t v38;
  UIAccessibilityTraits v39;
  UIAccessibilityTraits v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _BYTE v46[24];

  v2 = v1;
  v4 = IndexPath.row.getter(a1);
  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData);
  swift_beginAccess(v5, v46, 0, 0);
  v6 = *v5;
  if ((*v5 & 0xC000000000000001) == 0)
  {
    if ((v4 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v4 < *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v7 = *(_QWORD *)(v6 + 8 * v4 + 32);
      swift_retain(v7);
      goto LABEL_5;
    }
    __break(1u);
    goto LABEL_33;
  }
  swift_bridgeObjectRetain(*v5);
  v7 = specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v6);
  swift_bridgeObjectRelease(v6);
LABEL_5:
  v9 = *(_QWORD *)(v7 + 48);
  v8 = *(_QWORD *)(v7 + 56);
  v10 = v9 == 0x6C65436C6562614CLL && v8 == 0xE90000000000006CLL;
  if (!v10
    && (_stringCompareWithSmolCheck(_:_:expecting:)(*(_QWORD *)(v7 + 48), *(_QWORD *)(v7 + 56), 0x6C65436C6562614CLL, 0xE90000000000006CLL, 0) & 1) == 0)
  {
    v21 = v9 == 0x6C65436567616D49 && v8 == 0xE90000000000006CLL;
    if (!v21
      && (_stringCompareWithSmolCheck(_:_:expecting:)(v9, v8, 0x6C65436567616D49, 0xE90000000000006CLL, 0) & 1) == 0)
    {
      swift_bridgeObjectRetain(v8);
      v31 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v8);
      v32 = objc_msgSend(a1, "dequeueReusableCellWithIdentifier:", v31);

      if (v32)
      {
        v33 = type metadata accessor for IMBActionTableViewCell();
        v14 = (_BYTE *)swift_dynamicCastClassUnconditional(v32, v33, 0, 0, 0);
        v34 = *(void **)&v14[OBJC_IVAR____TtC8Business22IMBActionTableViewCell_iconView];
        objc_msgSend(v34, "setImage:", *(_QWORD *)(v7 + 64));
        objc_msgSend(v34, "setHidden:", *(_QWORD *)(v7 + 64) == 0);
        v35 = *(_QWORD *)(v7 + 24);
        v36 = *(id *)&v14[OBJC_IVAR____TtC8Business22IMBActionTableViewCell_titleLabel];
        swift_bridgeObjectRetain(v35);
        v37 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v35);
        objc_msgSend(v36, "setText:", v37);

        v38 = OBJC_IVAR____TtC8Business22IMBActionTableViewCell_actionEnabled;
        v14[OBJC_IVAR____TtC8Business22IMBActionTableViewCell_actionEnabled] = *(_BYTE *)(v7 + 88);
        sub_100054500();
        v39 = UIAccessibilityTraitButton;
        if ((v14[v38] & 1) == 0)
        {
          v40 = UIAccessibilityTraitNotEnabled;
          if ((UIAccessibilityTraitNotEnabled & ~UIAccessibilityTraitButton) == 0)
            v40 = 0;
          v39 = v40 | UIAccessibilityTraitButton;
        }
        objc_msgSend(v14, "setAccessibilityTraits:", v39);
        goto LABEL_25;
      }
LABEL_35:
      __break(1u);
      return;
    }
    swift_bridgeObjectRetain(v8);
    v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
    v23 = objc_msgSend(a1, "dequeueReusableCellWithIdentifier:", v22);

    if (v23)
    {
      v24 = type metadata accessor for IMBImageTableViewCell();
      v14 = (_BYTE *)swift_dynamicCastClassUnconditional(v23, v24, 0, 0, 0);
      v25 = *(void **)&v14[OBJC_IVAR____TtC8Business21IMBImageTableViewCell_largeImageView];
      objc_msgSend(v25, "setImage:", *(_QWORD *)(v7 + 64));
      v26 = sub_100007D40(&qword_1000ED4B0);
      v27 = swift_allocObject(v26, 64, 7);
      *(_OWORD *)(v27 + 16) = xmmword_1000AF070;
      *(_QWORD *)(v27 + 56) = sub_1000090C8(0, &qword_1000EC780, UIImageView_ptr);
      *(_QWORD *)(v27 + 32) = v25;
      v28 = v23;
      v29 = v25;
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v27);
      objc_msgSend(v14, "setAccessibilityElements:", isa);

      goto LABEL_25;
    }
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  swift_bridgeObjectRetain(v8);
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  v12 = objc_msgSend(a1, "dequeueReusableCellWithIdentifier:", v11);

  if (!v12)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v13 = type metadata accessor for IMBInfoTableViewCell();
  v14 = (_BYTE *)swift_dynamicCastClassUnconditional(v12, v13, 0, 0, 0);
  v15 = *(_QWORD *)(v7 + 24);
  v16 = *(id *)&v14[OBJC_IVAR____TtC8Business20IMBInfoTableViewCell_leftLabel];
  swift_bridgeObjectRetain(v15);
  v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v15);
  objc_msgSend(v16, "setText:", v17);

  v18 = *(_QWORD *)(v7 + 40);
  v19 = *(id *)&v14[OBJC_IVAR____TtC8Business20IMBInfoTableViewCell_rightLabel];
  swift_bridgeObjectRetain(v18);
  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v18);
  objc_msgSend(v19, "setText:", v20);

LABEL_25:
  if (*(_BYTE *)(v7 + 89) == 1)
  {
    if (sub_10002DA10() != 2)
    {
      objc_msgSend(a1, "layoutMargins");
      objc_msgSend(v14, "setSeparatorInset:", v41, v42, v43, v44);
    }
  }
  else
  {
    objc_msgSend(a1, "bounds");
    objc_msgSend(v14, "setSeparatorInset:", 0.0, v45, 0.0, 0.0);
  }
  swift_release(v7);
}

uint64_t sub_100096930(void *a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  Class isa;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  char v20;
  void *v21;
  uint64_t v22;
  id v23;
  Swift::String v24;
  Swift::String v25;
  Swift::String v26;
  char v27;
  _BYTE v28[24];
  Swift::String v29;
  Swift::String v30;

  v3 = IndexPath.row.getter(a1);
  v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData);
  result = swift_beginAccess(v1 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData, v28, 0, 0);
  v6 = *v4;
  if ((v6 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain(v6);
    v7 = specialized _ArrayBuffer._getElementSlowPath(_:)(v3, v6);
    swift_bridgeObjectRelease(v6);
LABEL_5:
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    objc_msgSend(a1, "deselectRowAtIndexPath:animated:", isa, 1);

    v9 = *(_QWORD *)(v7 + 48);
    v10 = *(_QWORD *)(v7 + 56);
    v11 = v9 == 0x65436E6F69746341 && v10 == 0xEA00000000006C6CLL;
    if (!v11
      && (_stringCompareWithSmolCheck(_:_:expecting:)(v9, v10, 0x65436E6F69746341, 0xEA00000000006C6CLL, 0) & 1) == 0
      || *(_BYTE *)(v7 + 88) != 1)
    {
      return swift_release(v7);
    }
    v13 = *(_QWORD *)(v7 + 16);
    v12 = *(void **)(v7 + 24);
    v14 = (void *)objc_opt_self(NSBundle);
    swift_bridgeObjectRetain(v12);
    v15 = objc_msgSend(v14, "mainBundle");
    v29._object = (void *)0xE000000000000000;
    v16._countAndFlagsBits = 0x435F4F545F444441;
    v16._object = (void *)0xEF5241444E454C41;
    v17._countAndFlagsBits = 0;
    v17._object = (void *)0xE000000000000000;
    v29._countAndFlagsBits = 0;
    v18 = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, (Swift::String_optional)0, (NSBundle)v15, v17, v29);

    if (v13 == v18._countAndFlagsBits && v12 == v18._object)
    {
      swift_bridgeObjectRelease_n(v12, 2);
    }
    else
    {
      v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v12, v18._countAndFlagsBits, v18._object, 0);
      swift_bridgeObjectRelease(v12);
      swift_bridgeObjectRelease(v18._object);
      if ((v20 & 1) == 0)
      {
        v22 = *(_QWORD *)(v7 + 16);
        v21 = *(void **)(v7 + 24);
        swift_bridgeObjectRetain(v21);
        v23 = objc_msgSend(v14, "mainBundle");
        v30._object = (void *)0xE000000000000000;
        v24._countAndFlagsBits = 0x455249445F544547;
        v24._object = (void *)0xEE00534E4F495443;
        v25._countAndFlagsBits = 0;
        v25._object = (void *)0xE000000000000000;
        v30._countAndFlagsBits = 0;
        v26 = NSLocalizedString(_:tableName:bundle:value:comment:)(v24, (Swift::String_optional)0, (NSBundle)v23, v25, v30);

        if (v22 == v26._countAndFlagsBits && v21 == v26._object)
        {
          swift_bridgeObjectRelease_n(v21, 2);
LABEL_23:
          sub_100095E40();
          return swift_release(v7);
        }
        v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v22, v21, v26._countAndFlagsBits, v26._object, 0);
        swift_bridgeObjectRelease(v21);
        swift_bridgeObjectRelease(v26._object);
        if ((v27 & 1) != 0)
          goto LABEL_23;
        return swift_release(v7);
      }
    }
    sub_100095620();
    return swift_release(v7);
  }
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(_QWORD *)(v6 + 8 * v3 + 32);
    swift_retain(v7);
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id sub_100096CDC(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  v3 = OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_dayLabel;
  v4 = objc_allocWithZone((Class)UILabel);
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, "init");
  v6 = OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_dateLabel;
  *(_QWORD *)&v5[v6] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v7 = OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_timeLabel;
  *(_QWORD *)&v5[v7] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v8 = OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_warningLabel;
  *(_QWORD *)&v5[v8] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v9 = OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_containerView;
  *(_QWORD *)&v5[v9] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  *(_QWORD *)&v5[OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData] = _swiftEmptyArrayStorage;
  *(_QWORD *)&v5[OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_proposedEvent] = 0;

  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for IMBTimeSelectedViewController();
  v10 = objc_msgSendSuper2(&v12, "initWithCoder:", a1);

  return v10;
}

uint64_t sub_100096E30()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData));
  return swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_proposedEvent));
}

id sub_100096EAC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMBTimeSelectedViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IMBTimeSelectedViewController()
{
  return objc_opt_self(_TtC8Business29IMBTimeSelectedViewController);
}

unint64_t sub_100096FD0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000F07D8;
  if (!qword_1000F07D8)
  {
    v1 = sub_1000090C8(255, &qword_1000F0900, NSError_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_1000F07D8);
  }
  return result;
}

uint64_t sub_100097028(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _BYTE v11[24];
  CGRect v12;

  v2 = v1;
  v3 = IndexPath.row.getter(a1);
  v4 = (uint64_t *)(v2 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData);
  result = swift_beginAccess(v2 + OBJC_IVAR____TtC8Business29IMBTimeSelectedViewController_tableViewData, v11, 0, 0);
  v6 = *v4;
  if ((v6 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain(v6);
    v7 = specialized _ArrayBuffer._getElementSlowPath(_:)(v3, v6);
    swift_bridgeObjectRelease(v6);
    goto LABEL_5;
  }
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v3 >= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_14:
    __break(1u);
    return result;
  }
  v7 = *(_QWORD *)(v6 + 8 * v3 + 32);
  swift_retain(v7);
LABEL_5:
  v8 = *(_QWORD *)(v7 + 48);
  v9 = *(_QWORD *)(v7 + 56);
  v10 = v8 == 0x6C65436567616D49 && v9 == 0xE90000000000006CLL;
  if (!v10
    && (_stringCompareWithSmolCheck(_:_:expecting:)(v8, v9, 0x6C65436567616D49, 0xE90000000000006CLL, 0) & 1) == 0)
  {
    return swift_release(v7);
  }
  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView), "bounds");
  CGRectGetWidth(v12);
  return swift_release(v7);
}

uint64_t initializeBufferWithCopyOfBuffer for QuickReplyModel(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for QuickReplyModel(_QWORD *a1)
{
  return swift_bridgeObjectRelease(*a1);
}

uint64_t *assignWithCopy for QuickReplyModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = a2[1];
  *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
  a1[1] = v6;
  return a1;
}

__n128 initializeWithTake for QuickReplyModel(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t *assignWithTake for QuickReplyModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4);
  a1[1] = a2[1];
  *((_BYTE *)a1 + 16) = *((_BYTE *)a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for QuickReplyModel(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for QuickReplyModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for QuickReplyModel()
{
  return &type metadata for QuickReplyModel;
}

_QWORD *sub_100097310(char a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;

  if (!a2)
  {
    v57 = 0u;
    v58 = 0u;
    goto LABEL_15;
  }
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(BCMessageRootQuickReplyKey);
  v6 = v5;
  if (!*(_QWORD *)(a2 + 16) || (v7 = sub_10004F068(v4, v5), (v8 & 1) == 0))
  {
    v57 = 0u;
    v58 = 0u;
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(a2);
    goto LABEL_15;
  }
  sub_100009C74(*(_QWORD *)(a2 + 56) + 32 * v7, (uint64_t)&v57);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(a2);
  if (!*((_QWORD *)&v58 + 1))
  {
LABEL_15:
    v10 = sub_100009CB0((uint64_t)&v57);
    goto LABEL_16;
  }
  v9 = sub_100007D40(&qword_1000EC478);
  v10 = swift_dynamicCast(&v55, &v57, (char *)&type metadata for Any + 8, v9, 6);
  if ((v10 & 1) == 0)
  {
LABEL_16:
    if (qword_1000EBCB8 != -1)
      v10 = swift_once(&qword_1000EBCB8, sub_100082798);
    v20 = qword_1000F8A90;
    v21 = static os_log_type_t.error.getter(v10);
    v22 = "quickReply json is required";
    goto LABEL_19;
  }
  v11 = (_QWORD *)v55;
  if (!*(_QWORD *)(v55 + 16)
    || (v12 = sub_10004F068(0x736D657469, 0xE500000000000000), (v13 & 1) == 0)
    || (sub_100009C74(v11[7] + 32 * v12, (uint64_t)&v57),
        v14 = sub_100007D40(&qword_1000ED040),
        (swift_dynamicCast(&v55, &v57, (char *)&type metadata for Any + 8, v14, 6) & 1) == 0))
  {
    v26 = swift_bridgeObjectRelease(v11);
    if (qword_1000EBCB8 != -1)
      v26 = swift_once(&qword_1000EBCB8, sub_100082798);
    v20 = qword_1000F8A90;
    v21 = static os_log_type_t.error.getter(v26);
    v22 = "items json is required";
    goto LABEL_26;
  }
  v54 = (_QWORD *)v55;
  v53 = *(_QWORD *)(v55 + 16);
  if ((unint64_t)(v53 - 6) < 0xFFFFFFFFFFFFFFFCLL)
  {
    v15 = swift_bridgeObjectRelease(v11);
    if (qword_1000EBCB8 != -1)
      v15 = swift_once(&qword_1000EBCB8, sub_100082798);
    v16 = qword_1000F8A90;
    v17 = static os_log_type_t.error.getter(v15);
    v18 = sub_100007D40((uint64_t *)&unk_1000ECE50);
    v19 = swift_allocObject(v18, 72, 7);
    *(_OWORD *)(v19 + 16) = xmmword_1000AF070;
    swift_bridgeObjectRelease(v54);
    *(_QWORD *)(v19 + 56) = &type metadata for Int;
    *(_QWORD *)(v19 + 64) = &protocol witness table for Int;
    *(_QWORD *)(v19 + 32) = v53;
    os_log(_:dso:log:type:_:)("message must have 2 to 5 items - count: %{public}ld", 51, 2, &_mh_execute_header, v16, v17, v19);
    swift_bridgeObjectRelease(v19);
    return 0;
  }
  v27 = 0;
  v24 = _swiftEmptyArrayStorage;
  do
  {
    v28 = (_QWORD *)v54[v27 + 4];
    if (!v28[2])
    {
      swift_bridgeObjectRelease(v54);
      v40 = v11;
LABEL_45:
      swift_bridgeObjectRelease(v40);
      v41 = v24;
LABEL_47:
      v42 = swift_bridgeObjectRelease(v41);
      if (qword_1000EBCB8 != -1)
        v42 = swift_once(&qword_1000EBCB8, sub_100082798);
      v20 = qword_1000F8A90;
      v21 = static os_log_type_t.error.getter(v42);
      v22 = "item identifier is required";
LABEL_19:
      v23 = 27;
LABEL_20:
      os_log(_:dso:log:type:_:)(v22, v23, 2, &_mh_execute_header, v20, v21, _swiftEmptyArrayStorage);
      return 0;
    }
    swift_bridgeObjectRetain(v54[v27 + 4]);
    v29 = sub_10004F068(0x696669746E656469, 0xEA00000000007265);
    if ((v30 & 1) == 0)
    {
      swift_bridgeObjectRelease(v54);
      swift_bridgeObjectRelease(v11);
      v40 = v28;
      goto LABEL_45;
    }
    sub_100009C74(v28[7] + 32 * v29, (uint64_t)&v57);
    if ((swift_dynamicCast(&v55, &v57, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
    {
      swift_bridgeObjectRelease(v24);
      swift_bridgeObjectRelease(v54);
      swift_bridgeObjectRelease(v11);
      v41 = v28;
      goto LABEL_47;
    }
    v32 = v55;
    v31 = v56;
    if (v28[2] && (v33 = sub_10004F068(0x656C746974, 0xE500000000000000), (v34 & 1) != 0))
    {
      sub_100009C74(v28[7] + 32 * v33, (uint64_t)&v57);
    }
    else
    {
      v57 = 0u;
      v58 = 0u;
    }
    swift_bridgeObjectRelease(v28);
    if (!*((_QWORD *)&v58 + 1))
    {
      swift_bridgeObjectRelease(v31);
      swift_bridgeObjectRelease(v11);
      sub_100009CB0((uint64_t)&v57);
      swift_bridgeObjectRelease(v24);
      v43 = v54;
LABEL_52:
      v44 = swift_bridgeObjectRelease(v43);
      if (qword_1000EBCB8 != -1)
        v44 = swift_once(&qword_1000EBCB8, sub_100082798);
      v20 = qword_1000F8A90;
      v21 = static os_log_type_t.error.getter(v44);
      v22 = "item title is required";
LABEL_26:
      v23 = 22;
      goto LABEL_20;
    }
    if ((swift_dynamicCast(&v55, &v57, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
    {
      swift_bridgeObjectRelease(v24);
      swift_bridgeObjectRelease(v54);
      swift_bridgeObjectRelease(v31);
      v43 = v11;
      goto LABEL_52;
    }
    v36 = v55;
    v35 = v56;
    if ((swift_isUniquelyReferenced_nonNull_native(v24) & 1) == 0)
      v24 = sub_100038AC0(0, v24[2] + 1, 1, v24);
    v38 = v24[2];
    v37 = v24[3];
    if (v38 >= v37 >> 1)
      v24 = sub_100038AC0((_QWORD *)(v37 > 1), v38 + 1, 1, v24);
    ++v27;
    v24[2] = v38 + 1;
    v39 = &v24[4 * v38];
    v39[4] = v32;
    v39[5] = v31;
    v39[6] = v36;
    v39[7] = v35;
  }
  while (v53 != v27);
  swift_bridgeObjectRelease(v54);
  if ((a1 & 1) == 0)
  {
    swift_bridgeObjectRelease(v11);
    return v24;
  }
  if (v11[2] && (v45 = sub_10004F068(0x64657463656C6573, 0xED00007865646E49), (v46 & 1) != 0))
  {
    sub_100009C74(v11[7] + 32 * v45, (uint64_t)&v57);
  }
  else
  {
    v57 = 0u;
    v58 = 0u;
  }
  swift_bridgeObjectRelease(v11);
  if (!*((_QWORD *)&v58 + 1))
  {
    sub_100009CB0((uint64_t)&v57);
    goto LABEL_70;
  }
  if ((swift_dynamicCast(&v55, &v57, (char *)&type metadata for Any + 8, &type metadata for Int, 6) & 1) == 0)
  {
LABEL_70:
    v50 = swift_bridgeObjectRelease(v24);
    if (qword_1000EBCB8 != -1)
      v50 = swift_once(&qword_1000EBCB8, sub_100082798);
    v51 = qword_1000F8A90;
    v52 = static os_log_type_t.error.getter(v50);
    os_log(_:dso:log:type:_:)("message from me must have a selected item index", 47, 2, &_mh_execute_header, v51, v52, _swiftEmptyArrayStorage);
    return 0;
  }
  if ((v55 & 0x8000000000000000) == 0 && v55 < v24[2])
    return v24;
  v47 = swift_bridgeObjectRelease(v24);
  if (qword_1000EBCB8 != -1)
    v47 = swift_once(&qword_1000EBCB8, sub_100082798);
  v48 = qword_1000F8A90;
  v49 = static os_log_type_t.error.getter(v47);
  os_log(_:dso:log:type:_:)("message from me must contain selected item index", 48, 2, &_mh_execute_header, v48, v49, _swiftEmptyArrayStorage);
  return 0;
}

uint64_t destroy for QuickReplyModel.Item(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
}

_QWORD *initializeWithCopy for QuickReplyModel.Item(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for QuickReplyModel.Item(_QWORD *a1, _QWORD *a2)
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

__n128 initializeWithTake for QuickReplyModel.Item(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for QuickReplyModel.Item(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for QuickReplyModel.Item(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for QuickReplyModel.Item(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for QuickReplyModel.Item()
{
  return &type metadata for QuickReplyModel.Item;
}

unint64_t IMBJITAppBundleState.init(rawValue:)(unint64_t a1)
{
  return sub_10009A8F4(a1);
}

Swift::Int sub_100097C0C()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100097C50()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100097C78()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t sub_100097CB8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_10009A8F4(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

id IMBJITAppBundleManager.containerID.getter()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  NSString v6;
  id v7;
  void *v8;
  id v9;

  v1 = OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___containerID;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___containerID);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___containerID);
  }
  else
  {
    if (_BSIsInternalInstall(0))
      v4 = 2;
    else
      v4 = 1;
    v5 = objc_allocWithZone((Class)CKContainerID);
    v6 = String._bridgeToObjectiveC()();
    v7 = objc_msgSend(v5, "initWithContainerIdentifier:environment:", v6, v4);

    v8 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v7;
    v3 = v7;

    v2 = 0;
  }
  v9 = v2;
  return v3;
}

id IMBJITAppBundleManager.container.getter()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___container;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___container);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___container);
  }
  else
  {
    v4 = IMBJITAppBundleManager.containerID.getter();
    v5 = objc_msgSend(objc_allocWithZone((Class)CKContainer), "initWithContainerID:", v4);

    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

id IMBJITAppBundleManager.database.getter()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___database;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___database);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___database);
  }
  else
  {
    v4 = IMBJITAppBundleManager.container.getter();
    v5 = objc_msgSend(v4, "publicCloudDatabase");

    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

uint64_t IMBJITAppBundleManager.currentLoadedBundleVersion.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _BYTE v4[24];

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_currentLoadedBundleVersion);
  swift_beginAccess(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_currentLoadedBundleVersion, v4, 0, 0);
  v2 = *v1;
  swift_bridgeObjectRetain(v1[1]);
  return v2;
}

uint64_t IMBJITAppBundleManager.currentLoadedBundleVersion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  _BYTE v8[24];

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_currentLoadedBundleVersion);
  swift_beginAccess(v5, v8, 1, 0);
  v6 = v5[1];
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease(v6);
}

uint64_t (*IMBJITAppBundleManager.currentLoadedBundleVersion.modify(uint64_t a1))(_QWORD)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_currentLoadedBundleVersion, a1, 33, 0);
  return j__swift_endAccess;
}

id sub_100097FB0()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for IMBJITAppBundleManager()), "init");
  qword_1000F0850 = (uint64_t)result;
  return result;
}

uint64_t IMBJITAppBundleManager.bundleState.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_bundleState;
  swift_beginAccess(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_bundleState, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t IMBJITAppBundleManager.bundleState.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;
  _BYTE v6[24];

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_bundleState);
  swift_beginAccess(v1 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_bundleState, v6, 1, 0);
  *v3 = a1;
  result = swift_unknownObjectWeakLoadStrong(v1 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_delegate);
  if (result)
  {
    v5 = result;
    sub_10006BF88();
    return swift_unknownObjectRelease(v5);
  }
  return result;
}

uint64_t IMBJITAppBundleManager.savedBundleVersion.getter()
{
  uint64_t v0;
  void *v1;
  NSString v2;
  id v3;
  uint64_t v4;
  NSString v5;
  NSString v6;
  uint64_t v8;
  _OWORD v9[2];
  _BYTE v10[24];
  uint64_t v11;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_userDefaults);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "valueForKey:", v2);

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(v3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_10002B588((uint64_t)v9, (uint64_t)v10);
  if (!v11)
  {
    sub_100010A98((uint64_t)v10, (uint64_t *)&unk_1000EEB60);
    goto LABEL_8;
  }
  if ((swift_dynamicCast(&v8, v10, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
  {
LABEL_8:
    v4 = 3157552;
    v5 = String._bridgeToObjectiveC()();
    v6 = String._bridgeToObjectiveC()();
    objc_msgSend(v1, "setObject:forKey:", v5, v6);

    return v4;
  }
  return v8;
}

uint64_t IMBJITAppBundleManager.recordChangeTag.getter()
{
  uint64_t v0;
  void *v1;
  NSString v2;
  id v3;
  uint64_t v5;
  _OWORD v6[2];
  _BYTE v7[24];
  uint64_t v8;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_userDefaults);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "valueForKey:", v2);

  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(v3);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_10002B588((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    if ((swift_dynamicCast(&v5, v7, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
      return v5;
  }
  else
  {
    sub_100010A98((uint64_t)v7, (uint64_t *)&unk_1000EEB60);
  }
  return 0;
}

uint64_t IMBJITAppBundleManager.bundleBasePath.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v17;

  v2 = sub_100007D40((uint64_t *)&unk_1000ED480);
  __chkstk_darwin(v2, v3);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v12 = objc_msgSend(v11, "URLsForDirectory:inDomains:", 13, 1);
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v12, v6);

  if (*(_QWORD *)(v13 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v5, v13 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), v6);
    v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v14(v5, 0, 1, v6);
  }
  else
  {
    v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v14(v5, 1, 1, v6);
  }
  swift_bridgeObjectRelease(v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {

    sub_100010A98((uint64_t)v5, (uint64_t *)&unk_1000ED480);
    v15 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v5, v6);
    URL.appendingPathComponent(_:)(0xD000000000000018, 0x80000001000BC020);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    v15 = 0;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v14)(a1, v15, 1, v6);
}

uint64_t IMBJITAppBundleManager.savedBundlePath.getter@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  NSString v17;
  id v18;
  void (*v19)(char *, char *, uint64_t);
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSString v24;
  char *v25;
  uint64_t v26;
  uint64_t v28;

  v3 = sub_100007D40((uint64_t *)&unk_1000ED480);
  __chkstk_darwin(v3, v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v10 = __chkstk_darwin(v7, v9);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10, v13);
  v15 = (char *)&v28 - v14;
  v16 = *(void **)(v1 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_userDefaults);
  v17 = String._bridgeToObjectiveC()();
  v18 = objc_msgSend(v16, "URLForKey:", v17);

  if (!v18)
  {
    v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
    v20(v6, 1, 1, v7);
    goto LABEL_6;
  }
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v18);

  v19 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v19(v6, v12, v7);
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v20(v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_6:
    sub_100010A98((uint64_t)v6, (uint64_t *)&unk_1000ED480);
LABEL_7:
    v25 = a1;
    v26 = 1;
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v20)(v25, v26, 1, v7);
  }
  v19(v15, v6, v7);
  v21 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  URL.path.getter();
  v23 = v22;
  v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v23);
  LODWORD(v23) = objc_msgSend(v21, "fileExistsAtPath:", v24);

  if (!(_DWORD)v23)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v15, v7);
    goto LABEL_7;
  }
  v19(a1, v15, v7);
  v25 = a1;
  v26 = 0;
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v20)(v25, v26, 1, v7);
}

Swift::Void __swiftcall IMBJITAppBundleManager.load(_:)(Swift::String a1)
{
  void *v1;
  void *v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[3];
  uint64_t v28;

  v2 = v1;
  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v5 = sub_100007D40((uint64_t *)&unk_1000F0880);
  __chkstk_darwin(v5, v6);
  v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100007D40((uint64_t *)&unk_1000ED480);
  __chkstk_darwin(v9, v10);
  v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for URL(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  v17 = (char *)v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  IMBJITAppBundleManager.savedBundlePath.getter(v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_100010A98((uint64_t)v12, (uint64_t *)&unk_1000ED480);
LABEL_5:
    objc_msgSend(v2, "setBundleState:", 4);
    goto LABEL_6;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v12, v13);
  v27[2] = IMBJITAppBundleManager.savedBundleVersion.getter();
  v28 = v18;
  v27[0] = countAndFlagsBits;
  v27[1] = object;
  v19 = type metadata accessor for Locale(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v8, 1, 1, v19);
  v20 = sub_10002CDE8();
  v21 = StringProtocol.compare<A>(_:options:range:locale:)(v27, 64, 0, 0, 1, v8, &type metadata for String, &type metadata for String, v20, v20);
  sub_100010A98((uint64_t)v8, (uint64_t *)&unk_1000F0880);
  swift_bridgeObjectRelease(v28);
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    goto LABEL_5;
  }
  v22 = objc_msgSend(v2, "bundleState");
  if (v22 == (id)3)
  {
    if (qword_1000EBCB8 != -1)
      v22 = (id)swift_once(&qword_1000EBCB8, sub_100082798);
    v23 = qword_1000F8A90;
    v24 = static os_log_type_t.info.getter(v22);
    os_log(_:dso:log:type:_:)("JITAppKit : Template Bundle with the same version already loaded, skip load.", 76, 2, &_mh_execute_header, v23, v24, _swiftEmptyArrayStorage);
  }
  else
  {
    if (qword_1000EBCB8 != -1)
      v22 = (id)swift_once(&qword_1000EBCB8, sub_100082798);
    v25 = qword_1000F8A90;
    v26 = static os_log_type_t.info.getter(v22);
    os_log(_:dso:log:type:_:)("JITAppKit : Template Bundle not loaded. Proceed to load bundle.", 63, 2, &_mh_execute_header, v25, v26, _swiftEmptyArrayStorage);
    IMBJITAppBundleManager.loadBundle(_:version:)((uint64_t)v17, countAndFlagsBits, (uint64_t)object);
  }
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
LABEL_6:
  IMBJITAppBundleManager.updateBundle(_:)(countAndFlagsBits, (uint64_t)object);
}

void IMBJITAppBundleManager.updateBundle(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSPredicate *v30;
  Swift::String v31;
  Class isa;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  __n128 v37;
  uint64_t v38;
  _QWORD *v39;
  __n128 v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[3];
  uint64_t v47;

  v3 = v2;
  v6 = sub_100007D40((uint64_t *)&unk_1000F0880);
  __chkstk_darwin(v6, v7);
  v9 = (char *)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingBundleUpdate;
  if (*(_BYTE *)(v2 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingBundleUpdate) != 1)
  {
LABEL_6:
    v25 = (_QWORD *)(v3 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion);
    v26 = *(_QWORD *)(v3 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion + 8);
    *v25 = a1;
    v25[1] = a2;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRelease(v26);
    *(_BYTE *)(v3 + v10) = 1;
    sub_1000090C8(0, &qword_1000F0910, NSPredicate_ptr);
    v27 = sub_100007D40((uint64_t *)&unk_1000ECE50);
    v28 = swift_allocObject(v27, 72, 7);
    *(_OWORD *)(v28 + 16) = xmmword_1000AF070;
    *(_QWORD *)(v28 + 56) = &type metadata for String;
    *(_QWORD *)(v28 + 64) = sub_100009084();
    *(_QWORD *)(v28 + 32) = a1;
    *(_QWORD *)(v28 + 40) = a2;
    swift_bridgeObjectRetain(a2);
    v29 = (void *)NSPredicate.init(format:_:)(0x206E6F6973726576, 0xED00004025203D3DLL, v28);
    sub_1000090C8(0, &qword_1000F0918, CKQuery_ptr);
    v30 = v29;
    v31._countAndFlagsBits = 0x6F43656C646E7542;
    v31._object = (void *)0xEC0000006769666ELL;
    isa = CKQuery.init(recordType:predicate:)(v31, v30).super.isa;
    v33 = objc_msgSend(objc_allocWithZone((Class)CKQueryOperation), "initWithQuery:", isa);
    v34 = objc_msgSend((id)objc_opt_self(CKRecordZone), "defaultRecordZone");
    v35 = objc_msgSend(v34, "zoneID");

    objc_msgSend(v33, "setZoneID:", v35);
    objc_msgSend(v33, "setQualityOfService:", 25);
    v36 = swift_allocObject(&unk_1000DA508, 24, 7);
    *(_QWORD *)(v36 + 16) = _swiftEmptyArrayStorage;
    v37 = swift_retain(v36);
    CKQueryOperation.recordMatchedBlock.setter(sub_10009A9F0, v36, v37);
    v38 = swift_allocObject(&unk_1000DA530, 24, 7);
    swift_unknownObjectWeakInit(v38 + 16, v3);
    v39 = (_QWORD *)swift_allocObject(&unk_1000DA558, 48, 7);
    v39[2] = v36;
    v39[3] = v38;
    v39[4] = a1;
    v39[5] = a2;
    swift_bridgeObjectRetain(a2);
    swift_retain(v36);
    v40 = swift_retain(v38);
    CKQueryOperation.queryResultBlock.setter(sub_10009AA54, v39, v40);
    swift_release(v38);
    v41 = *(void **)(v3 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingQueryOperation);
    *(_QWORD *)(v3 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingQueryOperation) = v33;
    v42 = v33;

    v43 = IMBJITAppBundleManager.database.getter();
    objc_msgSend(v43, "addOperation:", v42);

    swift_release(v36);
    return;
  }
  v11 = (_QWORD *)(v2 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion);
  v12 = *(_QWORD *)(v2 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion + 8);
  v46[2] = *v11;
  v47 = v12;
  v46[0] = a1;
  v46[1] = a2;
  v13 = type metadata accessor for Locale(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 1, 1, v13);
  v14 = sub_10002CDE8();
  swift_bridgeObjectRetain(v12);
  v15 = StringProtocol.compare<A>(_:options:range:locale:)(v46, 64, 0, 0, 1, v9, &type metadata for String, &type metadata for String, v14, v14);
  sub_100010A98((uint64_t)v9, (uint64_t *)&unk_1000F0880);
  v16 = swift_bridgeObjectRelease(v47);
  if (v15)
  {
    if (qword_1000EBCB8 != -1)
      v16 = swift_once(&qword_1000EBCB8, sub_100082798);
    v17 = qword_1000F8A90;
    v18 = static os_log_type_t.info.getter(v16);
    v19 = sub_100007D40((uint64_t *)&unk_1000ECE50);
    v20 = swift_allocObject(v19, 112, 7);
    *(_OWORD *)(v20 + 16) = xmmword_1000ADFC0;
    v22 = *v11;
    v21 = v11[1];
    *(_QWORD *)(v20 + 56) = &type metadata for String;
    v23 = sub_100009084();
    *(_QWORD *)(v20 + 32) = v22;
    *(_QWORD *)(v20 + 40) = v21;
    *(_QWORD *)(v20 + 96) = &type metadata for String;
    *(_QWORD *)(v20 + 104) = v23;
    *(_QWORD *)(v20 + 64) = v23;
    *(_QWORD *)(v20 + 72) = a1;
    *(_QWORD *)(v20 + 80) = a2;
    swift_bridgeObjectRetain(v21);
    swift_bridgeObjectRetain(a2);
    os_log(_:dso:log:type:_:)("JITAppKit : Cancelling ongoing template update due to mismatch in template bundle version. \nOngoing Update Version: %@ Requested Version: %@", 140, 2, &_mh_execute_header, v17, v18, v20);
    v24 = swift_bridgeObjectRelease(v20);
    IMBJITAppBundleManager.clearUpdateFlags()(v24);
    goto LABEL_6;
  }
  if (qword_1000EBCB8 != -1)
    v16 = swift_once(&qword_1000EBCB8, sub_100082798);
  v44 = qword_1000F8A90;
  v45 = static os_log_type_t.info.getter(v16);
  os_log(_:dso:log:type:_:)("JITAppKit : update template bundle in progress for the same version. Skipping update", 84, 2, &_mh_execute_header, v44, v45, _swiftEmptyArrayStorage);
}

void sub_100099068(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  _QWORD *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[24];
  _QWORD v19[3];
  _BYTE v20[8];

  if ((a3 & 1) != 0)
  {
    v10 = swift_errorRetain(a2);
    if (qword_1000EBCB8 != -1)
      v10 = swift_once(&qword_1000EBCB8, sub_100082798);
    v11 = qword_1000F8A90;
    v12 = static os_log_type_t.error.getter(v10);
    v13 = sub_100007D40((uint64_t *)&unk_1000ECE50);
    v14 = swift_allocObject(v13, 72, 7);
    *(_OWORD *)(v14 + 16) = xmmword_1000AF070;
    swift_getErrorValue(a2, v20, v19);
    v15 = Error.localizedDescription.getter(v19[1], v19[2]);
    v17 = v16;
    *(_QWORD *)(v14 + 56) = &type metadata for String;
    *(_QWORD *)(v14 + 64) = sub_100009084();
    *(_QWORD *)(v14 + 32) = v15;
    *(_QWORD *)(v14 + 40) = v17;
    os_log(_:dso:log:type:_:)("JITAppKit: Error while fetching record: %@", 42, 2, &_mh_execute_header, v11, v12, v14);
    swift_bridgeObjectRelease(v14);
    sub_10009AA64(a2, 1);
  }
  else
  {
    v5 = (_QWORD *)(a4 + 16);
    swift_beginAccess(a4 + 16, v18, 33, 0);
    v6 = a2;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v6);
    v8 = *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v7 = *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v8 >= v7 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v7 > 1, v8 + 1, 1);
    v9 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v8, v6);
    specialized Array._endMutation()(v9);
    swift_endAccess(v18);
  }
}

void sub_1000991EC(void *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *Strong;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  _BYTE v34[24];
  _BYTE v35[24];
  _QWORD v36[3];
  _BYTE v37[8];

  v6 = a4 + 16;
  if ((a2 & 1) != 0)
  {
    v17 = swift_errorRetain(a1);
    if (qword_1000EBCB8 != -1)
      v17 = swift_once(&qword_1000EBCB8, sub_100082798);
    v18 = qword_1000F8A90;
    v19 = static os_log_type_t.error.getter(v17);
    v20 = sub_100007D40((uint64_t *)&unk_1000ECE50);
    v21 = swift_allocObject(v20, 72, 7);
    *(_OWORD *)(v21 + 16) = xmmword_1000AF070;
    swift_getErrorValue(a1, v37, v36);
    v22 = Error.localizedDescription.getter(v36[1], v36[2]);
    v24 = v23;
    *(_QWORD *)(v21 + 56) = &type metadata for String;
    *(_QWORD *)(v21 + 64) = sub_100009084();
    *(_QWORD *)(v21 + 32) = v22;
    *(_QWORD *)(v21 + 40) = v24;
    os_log(_:dso:log:type:_:)("JITAppKit : Error querying CloudKit: %@", 39, 2, &_mh_execute_header, v18, v19, v21);
    swift_bridgeObjectRelease(v21);
    swift_beginAccess(v6, v35, 0, 0);
    Strong = (void *)swift_unknownObjectWeakLoadStrong(v6);
    if (!Strong)
    {
      sub_10009AA64(a1, 1);
      return;
    }
    v26 = Strong;
    if (objc_msgSend(Strong, "bundleState") != (id)2 || (v27 = objc_msgSend(v26, "bundleState"), v27 != (id)3))
      v27 = objc_msgSend(v26, "setBundleState:", 5);
    IMBJITAppBundleManager.clearUpdateFlags()((uint64_t)v27);
    sub_10009AA64(a1, 1);
LABEL_28:

    return;
  }
  swift_beginAccess(a3 + 16, v35, 0, 0);
  v10 = *(_QWORD *)(a3 + 16);
  if (!((unint64_t)v10 >> 62))
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v10);
    if (v11)
      goto LABEL_4;
LABEL_22:
    v29 = swift_bridgeObjectRelease(v10);
    if (qword_1000EBCB8 == -1)
    {
LABEL_23:
      v30 = qword_1000F8A90;
      v31 = static os_log_type_t.error.getter(v29);
      os_log(_:dso:log:type:_:)("JITAppKit : Error querying CloudKit: Could not find bundle matching the version", 79, 2, &_mh_execute_header, v30, v31, _swiftEmptyArrayStorage);
      swift_beginAccess(v6, v34, 0, 0);
      v32 = (void *)swift_unknownObjectWeakLoadStrong(v6);
      if (!v32)
        return;
      v26 = v32;
      if (objc_msgSend(v32, "bundleState") != (id)2 || (v33 = objc_msgSend(v26, "bundleState"), v33 != (id)3))
        v33 = objc_msgSend(v26, "setBundleState:", 5);
      IMBJITAppBundleManager.clearUpdateFlags()((uint64_t)v33);
      goto LABEL_28;
    }
LABEL_32:
    v29 = swift_once(&qword_1000EBCB8, sub_100082798);
    goto LABEL_23;
  }
  if (v10 < 0)
    v28 = *(_QWORD *)(a3 + 16);
  else
    v28 = v10 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v10);
  if (!_CocoaArrayWrapper.endIndex.getter(v28))
    goto LABEL_22;
LABEL_4:
  if ((v10 & 0xC000000000000001) != 0)
  {
    v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v10);
    goto LABEL_7;
  }
  if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_32;
  }
  v12 = *(id *)(v10 + 32);
LABEL_7:
  v13 = v12;
  swift_bridgeObjectRelease(v10);
  swift_beginAccess(v6, v34, 0, 0);
  v14 = swift_unknownObjectWeakLoadStrong(v6);
  if (v14)
  {
    v15 = (void *)v14;
    IMBJITAppBundleManager.processFetchedRecord(_:version:)(v13, a5, a6);

  }
}

void IMBJITAppBundleManager.processFetchedRecord(_:version:)(void *a1, uint64_t a2, uint64_t a3)
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  id v36;
  uint64_t v37;
  uint64_t (*v38)(char *, uint64_t, uint64_t);
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  void (*v54)(char *, char *, uint64_t);
  int v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  NSString v78;
  NSString v79;
  NSString v80;
  id v81;
  uint64_t v82;
  NSURL *v83;
  void *v84;
  void *v85;
  NSString v86;
  uint64_t v87;
  void (*v88)(uint64_t, uint64_t);
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  char *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  _QWORD v99[2];
  uint64_t v100;
  uint64_t v101;

  v97 = a3;
  v96 = a2;
  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v7 = __chkstk_darwin(v4, v6);
  v94 = (char *)&v89 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7, v9);
  v12 = (char *)&v89 - v11;
  __chkstk_darwin(v10, v13);
  v95 = (char *)&v89 - v14;
  v15 = sub_100007D40((uint64_t *)&unk_1000F0880);
  __chkstk_darwin(v15, v16);
  v18 = (char *)&v89 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_100007D40((uint64_t *)&unk_1000ED480);
  v21 = __chkstk_darwin(v19, v20);
  v23 = (char *)&v89 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __chkstk_darwin(v21, v24);
  v27 = (char *)&v89 - v26;
  __chkstk_darwin(v25, v28);
  v30 = (char *)&v89 - v29;
  v31 = CKRecord.subscript.getter(0x6E6F6973726576, 0xE700000000000000);
  if (!v31)
    return;
  v99[0] = v31;
  v32 = sub_100007D40(&qword_1000F0908);
  if ((swift_dynamicCast(&v100, v99, v32, &type metadata for String, 6) & 1) == 0)
    return;
  v33 = v101;
  v34 = *(_QWORD *)&v98[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion + 8];
  if (v100 == *(_QWORD *)&v98[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion] && v101 == v34)
  {
    swift_bridgeObjectRelease(v101);
  }
  else
  {
    v35 = _stringCompareWithSmolCheck(_:_:expecting:)(v100, v101, *(_QWORD *)&v98[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion], v34, 0);
    swift_bridgeObjectRelease(v33);
    if ((v35 & 1) == 0)
      return;
  }
  v36 = objc_msgSend(a1, "recordChangeTag");
  if (!v36)
    return;
  v92 = v36;
  v91 = static String._unconditionallyBridgeFromObjectiveC(_:)(v36);
  v93 = v37;
  IMBJITAppBundleManager.savedBundlePath.getter(v30);
  v38 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  v39 = v38(v30, 1, v4);
  sub_100010A98((uint64_t)v30, (uint64_t *)&unk_1000ED480);
  if (v39 != 1)
  {
    v40 = IMBJITAppBundleManager.recordChangeTag.getter();
    v42 = v41;
    if (v40 == v91 && v41 == v93)
    {
      swift_bridgeObjectRelease(v93);
    }
    else
    {
      v43 = _stringCompareWithSmolCheck(_:_:expecting:)(v40, v41, v91, v93, 0);
      swift_bridgeObjectRelease(v42);
      if ((v43 & 1) == 0)
        goto LABEL_14;
    }
    v100 = IMBJITAppBundleManager.savedBundleVersion.getter();
    v101 = v44;
    v99[0] = v96;
    v99[1] = v97;
    v45 = type metadata accessor for Locale(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v18, 1, 1, v45);
    v46 = sub_10002CDE8();
    v47 = StringProtocol.compare<A>(_:options:range:locale:)(v99, 64, 0, 0, 1, v18, &type metadata for String, &type metadata for String, v46, v46);
    sub_100010A98((uint64_t)v18, (uint64_t *)&unk_1000F0880);
    swift_bridgeObjectRelease(v101);
    if (!v47)
    {

      if (qword_1000EBCB8 != -1)
        v60 = swift_once(&qword_1000EBCB8, sub_100082798);
      v61 = qword_1000F8A90;
      v62 = static os_log_type_t.info.getter(v60);
      v63 = sub_100007D40((uint64_t *)&unk_1000ECE50);
      v64 = swift_allocObject(v63, 72, 7);
      *(_OWORD *)(v64 + 16) = xmmword_1000AF070;
      *(_QWORD *)(v64 + 56) = &type metadata for String;
      *(_QWORD *)(v64 + 64) = sub_100009084();
      v65 = v93;
      *(_QWORD *)(v64 + 32) = v91;
      *(_QWORD *)(v64 + 40) = v65;
      os_log(_:dso:log:type:_:)("JITAppKit : CloudKit Contains the same bundle as stored on disk. changeTag: %@", 78, 2, &_mh_execute_header, v61, v62, v64);
      v66 = (id)swift_bridgeObjectRelease(v64);
      goto LABEL_32;
    }
  }
LABEL_14:
  v48 = CKRecord.subscript.getter(0x656C646E7562, 0xE600000000000000);
  if (!v48)
  {
LABEL_21:

    v59 = swift_bridgeObjectRelease(v93);
    v56 = v98;
LABEL_28:
    if (qword_1000EBCB8 != -1)
      v59 = swift_once(&qword_1000EBCB8, sub_100082798);
    v67 = qword_1000F8A90;
    v68 = static os_log_type_t.error.getter(v59);
    os_log(_:dso:log:type:_:)("JITAppKit : Unable to load bundle!", 34, 2, &_mh_execute_header, v67, v68, _swiftEmptyArrayStorage);
    v66 = objc_msgSend(v56, "bundleState");
    if (v66 == (id)4)
      v66 = objc_msgSend(v56, "setBundleState:", 5);
LABEL_32:
    IMBJITAppBundleManager.clearUpdateFlags()((uint64_t)v66);
    return;
  }
  v49 = v48;
  v50 = objc_opt_self(CKAsset);
  v51 = (void *)swift_dynamicCastObjCClass(v49, v50);
  if (!v51)
  {
    swift_unknownObjectRelease(v49);
    goto LABEL_21;
  }
  v52 = objc_msgSend(v51, "fileURL");
  if (!v52)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v27, 1, 1, v4);
    v56 = v98;
    goto LABEL_26;
  }
  v53 = v52;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v52);

  v54 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v54(v27, v12, v4);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v27, 0, 1, v4);
  v55 = v38(v27, 1, v4);
  v56 = v98;
  if (v55 == 1)
  {
LABEL_26:

    swift_bridgeObjectRelease(v93);
    swift_unknownObjectRelease(v49);
    v58 = (uint64_t)v27;
    goto LABEL_27;
  }
  v57 = v95;
  v54(v95, v27, v4);
  IMBJITAppBundleManager.copyBundle(_:)(v23);
  if (v38(v23, 1, v4) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v57, v4);
    swift_bridgeObjectRelease(v93);
    swift_unknownObjectRelease(v49);

    v58 = (uint64_t)v23;
LABEL_27:
    v59 = sub_100010A98(v58, (uint64_t *)&unk_1000ED480);
    goto LABEL_28;
  }
  v90 = v49;
  v69 = ((uint64_t (*)(char *, char *, uint64_t))v54)(v94, v23, v4);
  if (qword_1000EBCB8 != -1)
    v69 = swift_once(&qword_1000EBCB8, sub_100082798);
  v70 = qword_1000F8A90;
  v71 = static os_log_type_t.info.getter(v69);
  v72 = sub_100007D40((uint64_t *)&unk_1000ECE50);
  v73 = swift_allocObject(v72, 72, 7);
  *(_OWORD *)(v73 + 16) = xmmword_1000AF070;
  *(_QWORD *)(v73 + 56) = &type metadata for String;
  *(_QWORD *)(v73 + 64) = sub_100009084();
  v74 = v93;
  *(_QWORD *)(v73 + 32) = v91;
  *(_QWORD *)(v73 + 40) = v74;
  os_log(_:dso:log:type:_:)("JITAppKit : Copied new templates ! for newTag : %@", 50, 2, &_mh_execute_header, v70, v71, v73);
  swift_bridgeObjectRelease(v73);
  v75 = *(void **)&v56[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_userDefaults];
  v77 = v96;
  v76 = v97;
  v78 = String._bridgeToObjectiveC()();
  v79 = String._bridgeToObjectiveC()();
  objc_msgSend(v75, "setObject:forKey:", v78, v79);

  v80 = String._bridgeToObjectiveC()();
  v81 = v92;
  objc_msgSend(v75, "setObject:forKey:", v92, v80);

  v82 = (uint64_t)v94;
  URL._bridgeToObjectiveC()(v83);
  v85 = v84;
  v86 = String._bridgeToObjectiveC()();
  objc_msgSend(v75, "setURL:forKey:", v85, v86);

  IMBJITAppBundleManager.loadBundle(_:version:)(v82, v77, v76);
  IMBJITAppBundleManager.clearUpdateFlags()(v87);
  swift_unknownObjectRelease(v90);
  v88 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v88(v82, v4);
  v88((uint64_t)v95, v4);
}

void IMBJITAppBundleManager.clearUpdateFlags()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (qword_1000EBCB8 != -1)
    a1 = swift_once(&qword_1000EBCB8, sub_100082798);
  v2 = qword_1000F8A90;
  v3 = static os_log_type_t.info.getter(a1);
  os_log(_:dso:log:type:_:)("JITAppKit : Clearing update flags", 33, 2, &_mh_execute_header, v2, v3, _swiftEmptyArrayStorage);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingBundleUpdate) = 0;
  v4 = (_QWORD *)(v1 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion);
  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion + 8);
  *v4 = 3157552;
  v4[1] = 0xE300000000000000;
  swift_bridgeObjectRelease(v5);
  v6 = OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingQueryOperation;
  v7 = *(void **)(v1 + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingQueryOperation);
  if (v7)
  {
    objc_msgSend(v7, "cancel");
    v7 = *(void **)(v1 + v6);
  }
  *(_QWORD *)(v1 + v6) = 0;

}

uint64_t IMBJITAppBundleManager.copyBundle(_:)@<X0>(char *a1@<X8>)
{
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  void (*v20)(char *, char *, uint64_t);
  NSURL *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSString v32;
  uint64_t v33;
  NSURL *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSURL *v40;
  void *v41;
  void *v42;
  void (*v43)(char *, uint64_t);
  unsigned int v44;
  id v45;
  char *v46;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(char *, uint64_t);
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  id v69[2];
  id v70;

  v2 = sub_100007D40((uint64_t *)&unk_1000ED480);
  __chkstk_darwin(v2, v3);
  v5 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v9 = __chkstk_darwin(v6, v8);
  v11 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v9, v12);
  v15 = (char *)&v67 - v14;
  __chkstk_darwin(v13, v16);
  v18 = (char *)&v67 - v17;
  v19 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  IMBJITAppBundleManager.bundleBasePath.getter((uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {

    sub_100010A98((uint64_t)v5, (uint64_t *)&unk_1000ED480);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, 1, 1, v6);
  }
  v68 = a1;
  v20 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v20(v18, v5, v6);
  URL._bridgeToObjectiveC()(v21);
  v23 = v22;
  v70 = 0;
  v24 = objc_msgSend(v19, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v22, 1, 0, &v70);

  v25 = v70;
  if (v24)
  {
    v26 = URL.lastPathComponent.getter(v70);
    v28 = v27;
    URL.appendingPathComponent(_:)(v26, v27);
    v29 = swift_bridgeObjectRelease(v28);
    URL.path.getter(v29);
    v31 = v30;
    v32 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v31);
    LODWORD(v31) = objc_msgSend(v19, "fileExistsAtPath:", v32);

    if (!(_DWORD)v31)
    {
      if (qword_1000EBCB8 != -1)
        v33 = swift_once(&qword_1000EBCB8, sub_100082798);
      v56 = qword_1000F8A90;
      v57 = static os_log_type_t.error.getter(v33);
      os_log(_:dso:log:type:_:)("JITAppKit : File does not exist at given path.", 46, 2, &_mh_execute_header, v56, v57, _swiftEmptyArrayStorage);

      v58 = *(void (**)(char *, uint64_t))(v7 + 8);
      v58(v15, v6);
      v58(v18, v6);
      a1 = v68;
      return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, 1, 1, v6);
    }
    URL._bridgeToObjectiveC()(v34);
    v36 = v35;
    v37 = URL.path.getter(v35);
    v39 = v38;
    URL.init(fileURLWithPath:)(v37, v38);
    swift_bridgeObjectRelease(v39);
    URL._bridgeToObjectiveC()(v40);
    v42 = v41;
    v43 = *(void (**)(char *, uint64_t))(v7 + 8);
    v43(v11, v6);
    v70 = 0;
    v44 = objc_msgSend(v19, "copyItemAtURL:toURL:error:", v36, v42, &v70);

    v45 = v70;
    if (v44)
    {
      v43(v18, v6);

      v46 = v68;
      v20(v68, v15, v6);
      return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v46, 0, 1, v6);
    }
    v59 = v45;
    v60 = (void *)_convertNSErrorToError(_:)(v45);

    swift_willThrow(v61);
    v70 = v60;
    v62 = sub_100007D40(&qword_1000F07D0);
    v63 = sub_1000090C8(0, &qword_1000F0900, NSError_ptr);
    swift_dynamicCast(v69, &v70, v62, v63, 0);

    if (qword_1000EBCB8 != -1)
      v64 = swift_once(&qword_1000EBCB8, sub_100082798);
    v65 = qword_1000F8A90;
    v66 = static os_log_type_t.error.getter(v64);
    os_log(_:dso:log:type:_:)("JITAppKit : Unable to copy item to specified location", 53, 2, &_mh_execute_header, v65, v66, _swiftEmptyArrayStorage);

    v43(v15, v6);
    v43(v18, v6);
  }
  else
  {
    v48 = v70;
    v49 = (void *)_convertNSErrorToError(_:)(v25);

    swift_willThrow(v50);
    v70 = v49;
    v51 = sub_100007D40(&qword_1000F07D0);
    v52 = sub_1000090C8(0, &qword_1000F0900, NSError_ptr);
    swift_dynamicCast(v69, &v70, v51, v52, 0);

    if (qword_1000EBCB8 != -1)
      v53 = swift_once(&qword_1000EBCB8, sub_100082798);
    v54 = qword_1000F8A90;
    v55 = static os_log_type_t.error.getter(v53);
    os_log(_:dso:log:type:_:)("JITAppKit : Unable to create destination folder !", 49, 2, &_mh_execute_header, v54, v55, _swiftEmptyArrayStorage);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v18, v6);
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v68, 1, 1, v6);
  return swift_errorRelease(v70);
}

void IMBJITAppBundleManager.loadBundle(_:version:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSURL *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  id v17;
  _QWORD v18[5];
  _QWORD *v19;

  v4 = v3;
  v7 = objc_msgSend(v3, "setBundleState:", 2);
  if (qword_1000EBCB8 != -1)
    v7 = (id)swift_once(&qword_1000EBCB8, sub_100082798);
  v8 = qword_1000F8A90;
  v9 = static os_log_type_t.info.getter(v7);
  os_log(_:dso:log:type:_:)("JITAppKit : Trying to load template bundle", 42, 2, &_mh_execute_header, v8, v9, _swiftEmptyArrayStorage);
  v10 = objc_msgSend((id)objc_opt_self(TKApplication), "shared");
  URL._bridgeToObjectiveC()(v11);
  v13 = v12;
  v14 = (_QWORD *)swift_allocObject(&unk_1000DA4B8, 40, 7);
  v14[2] = v4;
  v14[3] = a2;
  v14[4] = a3;
  v18[4] = sub_10009A9A8;
  v19 = v14;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_1000384FC;
  v18[3] = &unk_1000DA4D0;
  v15 = _Block_copy(v18);
  v16 = v19;
  v17 = v4;
  swift_bridgeObjectRetain(a3);
  swift_release(v16);
  objc_msgSend(v10, "loadBundle:completion:", v13, v15);
  _Block_release(v15);

}

uint64_t sub_10009A510(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD v21[3];
  char v22[8];
  char v23[24];

  if (a1)
  {
    v5 = a1;
    v6 = swift_errorRetain(a1);
    if (qword_1000EBCB8 != -1)
      v6 = swift_once(&qword_1000EBCB8, sub_100082798);
    v7 = qword_1000F8A90;
    v8 = static os_log_type_t.error.getter(v6);
    v9 = sub_100007D40((uint64_t *)&unk_1000ECE50);
    v10 = swift_allocObject(v9, 72, 7);
    *(_OWORD *)(v10 + 16) = xmmword_1000AF070;
    swift_getErrorValue(v5, v22, v21);
    v11 = Error.localizedDescription.getter(v21[1], v21[2]);
    v13 = v12;
    *(_QWORD *)(v10 + 56) = &type metadata for String;
    *(_QWORD *)(v10 + 64) = sub_100009084();
    *(_QWORD *)(v10 + 32) = v11;
    *(_QWORD *)(v10 + 40) = v13;
    os_log(_:dso:log:type:_:)("JITAppKit : Error while trying to load bundle from stored location : %@", 71, 2, &_mh_execute_header, v7, v8, v10);
    swift_bridgeObjectRelease(v10);
    objc_msgSend(a2, "setBundleState:", 5);
    return swift_errorRelease(v5);
  }
  else
  {
    if (qword_1000EBCB8 != -1)
      a1 = swift_once(&qword_1000EBCB8, sub_100082798);
    v17 = qword_1000F8A90;
    v18 = static os_log_type_t.info.getter(a1);
    os_log(_:dso:log:type:_:)("JITAppKit : Bundle sucessfully loaded, ready to load view", 57, 2, &_mh_execute_header, v17, v18, _swiftEmptyArrayStorage);
    objc_msgSend(a2, "setBundleState:", 3);
    v19 = &a2[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_currentLoadedBundleVersion];
    swift_beginAccess(v19, v23, 1, 0);
    v20 = *((_QWORD *)v19 + 1);
    *(_QWORD *)v19 = a3;
    *((_QWORD *)v19 + 1) = a4;
    swift_bridgeObjectRetain(a4);
    return swift_bridgeObjectRelease(v20);
  }
}

id IMBJITAppBundleManager.init()()
{
  char *v0;
  uint64_t v1;
  void *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  objc_super v8;

  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___containerID] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___container] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___database] = 0;
  v1 = OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_userDefaults;
  v2 = (void *)objc_opt_self(NSUserDefaults);
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, "standardUserDefaults");
  v3[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingBundleUpdate] = 0;
  v4 = &v3[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingUpdateVersion];
  *(_QWORD *)v4 = 3157552;
  *((_QWORD *)v4 + 1) = 0xE300000000000000;
  *(_QWORD *)&v3[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_pendingQueryOperation] = 0;
  v5 = &v3[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_currentLoadedBundleVersion];
  *(_QWORD *)v5 = 3157552;
  *((_QWORD *)v5 + 1) = 0xE300000000000000;
  v6 = &v3[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_delegate];
  *((_QWORD *)v6 + 1) = 0;
  swift_unknownObjectWeakInit(v6, 0);
  *(_QWORD *)&v3[OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_bundleState] = 0;

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for IMBJITAppBundleManager();
  return objc_msgSendSuper2(&v8, "init");
}

id IMBJITAppBundleManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMBJITAppBundleManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

unint64_t sub_10009A8F4(unint64_t result)
{
  if (result > 8)
    return 0;
  return result;
}

uint64_t type metadata accessor for IMBJITAppBundleManager()
{
  return objc_opt_self(_TtC8Business22IMBJITAppBundleManager);
}

unint64_t sub_10009A928()
{
  unint64_t result;

  result = qword_1000F08C8;
  if (!qword_1000F08C8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for IMBJITAppBundleState, &type metadata for IMBJITAppBundleState);
    atomic_store(result, (unint64_t *)&qword_1000F08C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for IMBJITAppBundleState()
{
  return &type metadata for IMBJITAppBundleState;
}

uint64_t sub_10009A97C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10009A9A8(uint64_t a1)
{
  uint64_t v1;

  return sub_10009A510(a1, *(char **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_10009A9B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10009A9C4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10009A9CC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10009A9F0(uint64_t a1, void *a2, char a3)
{
  uint64_t v3;

  sub_100099068(a1, a2, a3 & 1, v3);
}

uint64_t sub_10009A9FC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10009AA20()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[3]);
  swift_bridgeObjectRelease(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

void sub_10009AA54(void *a1, char a2)
{
  uint64_t *v2;

  sub_1000991EC(a1, a2 & 1, v2[2], v2[3], v2[4], v2[5]);
}

void sub_10009AA64(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    swift_errorRelease(a1);
  else

}

uint64_t sub_10009AA70(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v16 = a1;
    else
      v16 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v4 < 0)
    v17 = *v1;
  else
    v17 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v1);
  v5 = _CocoaArrayWrapper.endIndex.getter(v17);
  swift_bridgeObjectRelease(v4);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_29;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if ((unint64_t)v4 >> 62)
    goto LABEL_31;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain(v4);
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v5, v9, 1, v4);
    swift_bridgeObjectRelease(*v1);
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_10009CB94(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    if (v4 < 0)
      v18 = v4;
    else
      v18 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v9 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(v4);
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    v15 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v15);
  }
  __break(1u);
  return result;
}

uint64_t sub_10009AC28(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  BOOL v15;
  char *v16;
  uint64_t result;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  int64_t v31;
  _QWORD *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  _OWORD *v39;
  __int128 v40;
  __int128 v41;
  int64_t v42;
  unint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  _OWORD v48[3];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55[2];
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = (_QWORD *)*v2;
  v5 = *(_QWORD *)(*v2 + 16);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v7 = a1;
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native(*v2);
  *v2 = v4;
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v9 = v4[3] >> 1, v9 < v6))
  {
    if (v5 <= v6)
      v10 = v5 + v3;
    else
      v10 = v5;
    v4 = sub_10003899C(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    *v2 = v4;
    v9 = v4[3] >> 1;
  }
  v11 = v4[2];
  v12 = v9 - v11;
  v13 = sub_1000A55F4(v55, &v4[6 * v11 + 4], v9 - v11, v7);
  if ((uint64_t)v13 < v3)
    goto LABEL_15;
  if (v13)
  {
    v14 = v4[2];
    v15 = __OFADD__(v14, v13);
    v16 = (char *)v13 + v14;
    if (v15)
    {
      __break(1u);
LABEL_20:
      v24 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
      }
      else
      {
        v20 = v56;
        v25 = (unint64_t)(v56 + 64) >> 6;
        v3 = v7;
        if (v24 >= v25)
          goto LABEL_41;
        v26 = *(_QWORD *)(v46 + 8 * v24);
        if (v26)
        {
LABEL_23:
          v18 = (v26 - 1) & v26;
          v19 = __clz(__rbit64(v26)) + (v24 << 6);
          v7 = v24;
          goto LABEL_18;
        }
        v27 = v7 + 2;
        v3 = v7 + 1;
        if (v7 + 2 >= v25)
          goto LABEL_41;
        v1 = v56;
        v26 = *(_QWORD *)(v46 + 8 * v27);
        if (v26)
        {
LABEL_26:
          v24 = v27;
LABEL_27:
          v20 = v56;
          goto LABEL_23;
        }
        v3 = v7 + 2;
        if (v7 + 3 >= v25)
          goto LABEL_41;
        v26 = *(_QWORD *)(v46 + 8 * (v7 + 3));
        if (v26)
        {
          v24 = v7 + 3;
          goto LABEL_27;
        }
        v27 = v7 + 4;
        v3 = v7 + 3;
        v20 = v56;
        if (v7 + 4 >= v25)
          goto LABEL_41;
        v26 = *(_QWORD *)(v46 + 8 * v27);
        if (v26)
          goto LABEL_26;
        v24 = v7 + 5;
        v3 = v7 + 4;
        v20 = v56;
        if (v7 + 5 >= v25)
        {
LABEL_41:
          v18 = 0;
          v53 = 0u;
          v54 = 0u;
          v52 = 0u;
          goto LABEL_42;
        }
        v26 = *(_QWORD *)(v46 + 8 * v24);
        if (v26)
          goto LABEL_23;
        v3 = v25 - 1;
        v28 = v7 + 6;
        while (v25 != v28)
        {
          v26 = *(_QWORD *)(v46 + 8 * v28++);
          if (v26)
          {
            v24 = v28 - 1;
            goto LABEL_27;
          }
        }
      }
      v20 = v1;
      goto LABEL_41;
    }
    v4[2] = v16;
  }
  if (v13 != (_QWORD *)v12)
    return sub_10004F0CC(v55[0]);
LABEL_16:
  v12 = v4[2];
  v4 = (_QWORD *)v55[0];
  v46 = v55[1];
  v7 = v57;
  if (!v58)
    goto LABEL_20;
  v18 = (v58 - 1) & v58;
  v19 = __clz(__rbit64(v58)) | (v57 << 6);
  v20 = v56;
LABEL_18:
  v21 = (uint64_t *)(v4[6] + 16 * v19);
  v23 = *v21;
  v22 = v21[1];
  sub_100009C74(v4[7] + 32 * v19, (uint64_t)&v53);
  *(_QWORD *)&v52 = v23;
  *((_QWORD *)&v52 + 1) = v22;
  swift_bridgeObjectRetain(v22);
  v3 = v7;
LABEL_42:
  sub_100010BA4((uint64_t)&v52, (uint64_t)&v49, &qword_1000F09B0);
  if (!*((_QWORD *)&v49 + 1))
  {
LABEL_80:
    sub_100010A98((uint64_t)&v52, &qword_1000F09B0);
    sub_10004F0CC((uint64_t)v4);
    return sub_100010A98((uint64_t)&v49, &qword_1000F09B0);
  }
  v47 = (unint64_t)(v20 + 64) >> 6;
  while (1)
  {
    sub_100010A98((uint64_t)&v49, &qword_1000F09B0);
    v29 = (_QWORD *)*v2;
    v30 = *(_QWORD *)(*v2 + 24);
    v31 = v30 >> 1;
    if ((uint64_t)(v30 >> 1) < v12 + 1)
    {
      v29 = sub_10003899C((_QWORD *)(v30 > 1), v12 + 1, 1, (_QWORD *)*v2);
      *v2 = v29;
      v31 = v29[3] >> 1;
    }
    sub_100010BA4((uint64_t)&v52, (uint64_t)v48, &qword_1000F09B0);
    if (*((_QWORD *)&v48[0] + 1))
      break;
    v38 = v3;
LABEL_79:
    sub_100010A98((uint64_t)v48, &qword_1000F09B0);
    v3 = v38;
    v31 = v12;
LABEL_45:
    *(_QWORD *)(*v2 + 16) = v31;
    sub_100010BA4((uint64_t)&v52, (uint64_t)&v49, &qword_1000F09B0);
    if (!*((_QWORD *)&v49 + 1))
      goto LABEL_80;
  }
  v32 = v29 + 4;
  if (v12 > v31)
    v31 = v12;
  while (1)
  {
    v49 = v48[0];
    v50 = v48[1];
    v51 = v48[2];
    if (v12 == v31)
    {
      sub_100010A98((uint64_t)&v49, &qword_1000ED5C0);
      v12 = v31;
      goto LABEL_45;
    }
    result = sub_100010A98((uint64_t)&v52, &qword_1000F09B0);
    v39 = &v32[6 * v12];
    v41 = v50;
    v40 = v51;
    *v39 = v49;
    v39[1] = v41;
    v39[2] = v40;
    if (!v18)
      break;
    v33 = __clz(__rbit64(v18));
    v18 &= v18 - 1;
    v34 = v33 | (v3 << 6);
LABEL_53:
    v35 = (uint64_t *)(v4[6] + 16 * v34);
    v36 = *v35;
    v37 = v35[1];
    sub_100009C74(v4[7] + 32 * v34, (uint64_t)&v53);
    *(_QWORD *)&v52 = v36;
    *((_QWORD *)&v52 + 1) = v37;
    swift_bridgeObjectRetain(v37);
    v38 = v3;
LABEL_54:
    ++v12;
    sub_100010BA4((uint64_t)&v52, (uint64_t)v48, &qword_1000F09B0);
    if (!*((_QWORD *)&v48[0] + 1))
      goto LABEL_79;
  }
  v42 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v42 >= v47)
    {
      v38 = v3;
LABEL_62:
      v18 = 0;
      v53 = 0u;
      v54 = 0u;
      v3 = v38;
      v52 = 0u;
      goto LABEL_54;
    }
    v43 = *(_QWORD *)(v46 + 8 * v42);
    if (v43)
      goto LABEL_60;
    v44 = v3 + 2;
    v38 = v3 + 1;
    if (v3 + 2 >= v47)
      goto LABEL_62;
    v43 = *(_QWORD *)(v46 + 8 * v44);
    if (!v43)
    {
      v38 = v3 + 2;
      if (v3 + 3 >= v47)
        goto LABEL_62;
      v43 = *(_QWORD *)(v46 + 8 * (v3 + 3));
      if (v43)
      {
        v42 = v3 + 3;
        goto LABEL_60;
      }
      v44 = v3 + 4;
      v38 = v3 + 3;
      if (v3 + 4 >= v47)
        goto LABEL_62;
      v43 = *(_QWORD *)(v46 + 8 * v44);
      if (!v43)
      {
        v42 = v3 + 5;
        v38 = v3 + 4;
        if (v3 + 5 >= v47)
          goto LABEL_62;
        v43 = *(_QWORD *)(v46 + 8 * v42);
        if (!v43)
        {
          v45 = v3 + 6;
          while (v47 != v45)
          {
            v43 = *(_QWORD *)(v46 + 8 * v45++);
            if (v43)
            {
              v42 = v45 - 1;
              goto LABEL_60;
            }
          }
          v38 = v47 - 1;
          goto LABEL_62;
        }
        goto LABEL_60;
      }
    }
    v42 = v44;
LABEL_60:
    v18 = (v43 - 1) & v43;
    v34 = __clz(__rbit64(v43)) + (v42 << 6);
    v3 = v42;
    goto LABEL_53;
  }
  __break(1u);
  return result;
}

id sub_10009B1B0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController____lazy_storage___optionsLabel;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController____lazy_storage___optionsLabel);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController____lazy_storage___optionsLabel);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void sub_10009B220()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  double v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSString v15;
  id v16;
  double v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t inited;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  NSString v29;
  unint64_t v30;
  Class isa;
  unint64_t v32;
  Class v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  NSString v37;
  unint64_t v38;
  Class v39;
  unint64_t v40;
  Class v41;
  id v42;
  uint64_t v43;
  NSString v44;
  unint64_t v45;
  Class v46;
  unint64_t v47;
  Class v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  Class v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE v60[88];

  v1 = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  objc_msgSend(v0, "setView:", v1);

  v2 = objc_msgSend(v0, "view");
  if (!v2)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v3 = v2;
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = sub_10009B1B0();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = sub_10009B1B0();
  if (qword_1000EBC38 != -1)
    swift_once(&qword_1000EBC38, sub_10002D80C);
  objc_msgSend(v5, "setTextColor:", qword_1000F89B8);

  v6 = sub_10009B1B0();
  if (qword_1000EBC30 != -1)
    swift_once(&qword_1000EBC30, sub_10002D774);
  objc_msgSend(v6, "setFont:", qword_1000F89B0);

  v7 = sub_10009B1B0();
  objc_msgSend(v7, "setLineBreakMode:", 0);

  v8 = sub_10009B1B0();
  objc_msgSend(v8, "setNumberOfLines:", 0);

  v9 = sub_10009B1B0();
  LODWORD(v10) = 1148846080;
  objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 1, v10);

  v11 = objc_msgSend(v0, "view");
  if (!v11)
    goto LABEL_14;
  v12 = v11;
  v13 = sub_10009B1B0();
  objc_msgSend(v12, "addSubview:", v13);

  v14 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "init");
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v14, "setTintColor:", qword_1000F89B8);
  objc_msgSend(v14, "setContentMode:", 1);
  v15 = String._bridgeToObjectiveC()();
  v16 = objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:", v15);

  objc_msgSend(v14, "setImage:", v16);
  LODWORD(v17) = 1148846080;
  objc_msgSend(v14, "setContentHuggingPriority:forAxis:", 0, v17);
  v18 = objc_msgSend(v0, "view");
  if (!v18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v19 = v18;
  objc_msgSend(v18, "addSubview:", v14);

  v20 = objc_msgSend(v0, "view");
  if (!v20)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v21 = v20;
  objc_msgSend(v20, "_setCornerRadius:", 8.0);

  v22 = objc_msgSend(v0, "view");
  if (!v22)
  {
LABEL_17:
    __break(1u);
    return;
  }
  v23 = v22;
  if (qword_1000EBC40 != -1)
    swift_once(&qword_1000EBC40, sub_10002D820);
  objc_msgSend(v23, "setBackgroundColor:", qword_1000F89C0);

  v24 = sub_100007D40(&qword_1000F0968);
  inited = swift_initStackObject(v24, v60);
  *(_OWORD *)(inited + 16) = xmmword_1000ADFC0;
  strcpy((char *)(inited + 32), "optionsLabel");
  *(_BYTE *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(_QWORD *)(inited + 48) = sub_10009B1B0();
  strcpy((char *)(inited + 56), "optionsChevron");
  *(_BYTE *)(inited + 71) = -18;
  *(_QWORD *)(inited + 72) = v14;
  v56 = v14;
  v26 = sub_10004E27C(inited);
  v27 = sub_10004E39C((uint64_t)&off_1000D61A8);
  v28 = (void *)objc_opt_self(NSLayoutConstraint);
  v29 = String._bridgeToObjectiveC()();
  v30 = sub_10004D488(v27);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v30);
  v32 = sub_10004D7E0(v26);
  v33 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v32);
  v34 = objc_msgSend(v28, "constraintsWithVisualFormat:options:metrics:views:", v29, 0, isa, v33);

  v35 = sub_1000090C8(0, (unint64_t *)&qword_1000EEB90, NSLayoutConstraint_ptr);
  v36 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v34, v35);

  v57 = v36;
  v37 = String._bridgeToObjectiveC()();
  v38 = sub_10004D488(v27);
  v39 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v38);
  v40 = sub_10004D7E0(v26);
  v41 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v40);
  v42 = objc_msgSend(v28, "constraintsWithVisualFormat:options:metrics:views:", v37, 0, v39, v41);

  v43 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v42, v35);
  v58 = v43;
  v44 = String._bridgeToObjectiveC()();
  v45 = sub_10004D488(v27);
  swift_bridgeObjectRelease(v27);
  v46 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v45);
  v47 = sub_10004D7E0(v26);
  swift_bridgeObjectRelease(v26);
  v48 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v47);
  v49 = objc_msgSend(v28, "constraintsWithVisualFormat:options:metrics:views:", v44, 0, v46, v48);

  v50 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v49, v35);
  v59 = v50;
  v51 = swift_bridgeObjectRetain(v57);
  sub_10009AA70(v51);
  v52 = swift_bridgeObjectRetain(v58);
  sub_10009AA70(v52);
  v53 = swift_bridgeObjectRetain(v50);
  sub_10009AA70(v53);
  v54 = sub_100007D40(&qword_1000F0970);
  swift_arrayDestroy(&v57, 3, v54);
  v55 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  objc_msgSend(v28, "activateConstraints:", v55);

}

uint64_t sub_10009B9D8()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  id v15;
  NSString v16;
  uint64_t KeyPath;
  uint64_t v18;
  char *v20;
  _BYTE v21[7];
  char v22;
  _BYTE v23[24];

  v1 = type metadata accessor for BIABubbleViewModelUserInteractionParadigm(0);
  __chkstk_darwin(v1, v2);
  v4 = &v21[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_100007D40(&qword_1000ED6C0);
  __chkstk_darwin(v5, v6);
  v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = type metadata accessor for BIABubbleViewModel(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  v13 = &v21[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = (uint64_t)&v0[OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_viewModel];
  swift_beginAccess(&v0[OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_viewModel], v23, 0, 0);
  sub_100010BA4(v14, (uint64_t)v8, &qword_1000ED6C0);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
  {
    sub_10005DA78((uint64_t)v8, (uint64_t)v13, type metadata accessor for BIABubbleViewModel);
    sub_10009CAD8((uint64_t)&v13[*(int *)(v9 + 32)], (uint64_t)v4, type metadata accessor for BIABubbleViewModelUserInteractionParadigm);
    v20 = (char *)&loc_10009BBCC + 4 * byte_1000B3740[swift_getEnumCaseMultiPayload(v4, v1)];
    __asm { BR              X10 }
  }
  sub_100010A98((uint64_t)v8, &qword_1000ED6C0);
  v15 = sub_10009B1B0();
  v16 = String._bridgeToObjectiveC()();
  objc_msgSend(v15, "setText:", v16);

  KeyPath = swift_getKeyPath(&unk_1000B3790);
  v18 = swift_getKeyPath(&unk_1000B37B8);
  v22 = 0;
  return static Published.subscript.setter(&v22, v0, KeyPath, v18);
}

void sub_10009BD24(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v4 = OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController_containingViewGestureRecognizer;
  if (a1
    && *(_QWORD *)(v2 + OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController_containingViewGestureRecognizer))
  {
    objc_msgSend(a1, "removeGestureRecognizer:");
    v4 = OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController_containingViewGestureRecognizer;
  }
  v5 = *(void **)(v2 + v4);
  *(_QWORD *)(v2 + v4) = 0;

  if (a2)
  {
    v6 = objc_allocWithZone((Class)UITapGestureRecognizer);
    v7 = a2;
    v8 = objc_msgSend(v6, "initWithTarget:action:", v2, "_handleBubbleTapped");
    objc_msgSend(v7, "addGestureRecognizer:", v8);
    v9 = *(id *)(v2 + v4);
    *(_QWORD *)(v2 + v4) = v8;

  }
}

void sub_10009BE08()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  _QWORD v23[6];
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  _BYTE v28[32];

  v27 = sub_100007D40(&qword_1000EDF20);
  v23[5] = *(_QWORD *)(v27 - 8);
  v2 = __chkstk_darwin(v27, v1);
  v26 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2, v4);
  v5 = type metadata accessor for BIABubbleViewModelUserAction(0);
  __chkstk_darwin(v5, v6);
  v25 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for BIABubbleViewModelUserInteractionParadigm(0);
  __chkstk_darwin(v8, v9);
  v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100007D40(&qword_1000ED6C0);
  __chkstk_darwin(v12, v13);
  v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for BIABubbleViewModel(0);
  v17 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16, v18);
  v20 = (char *)v23 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = v0;
  v21 = v0 + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_viewModel;
  swift_beginAccess(v0 + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_viewModel, v28, 0, 0);
  sub_100010BA4(v21, (uint64_t)v15, &qword_1000ED6C0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) != 1)
  {
    sub_10005DA78((uint64_t)v15, (uint64_t)v20, type metadata accessor for BIABubbleViewModel);
    sub_10009CAD8((uint64_t)&v20[*(int *)(v16 + 32)], (uint64_t)v11, type metadata accessor for BIABubbleViewModelUserInteractionParadigm);
    v22 = (char *)&loc_10009C018 + *((int *)qword_10009C6B0 + swift_getEnumCaseMultiPayload(v11, v8));
    __asm { BR              X10 }
  }
  sub_100010A98((uint64_t)v15, &qword_1000ED6C0);
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001FLL, 0x80000001000BC390, "Business/BIABubbleOptionsiOSViewController.swift", 48, 2);
  __break(1u);
  JUMPOUT(0x10009C6B0);
}

uint64_t sub_10009C6C0(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void **v14;
  uint64_t v15;

  v6 = sub_100007D40(&qword_1000EDF20);
  result = __chkstk_darwin(v6, v7);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a2 + 16);
  if (v12 != a1)
  {
    if (a1 < 0 || v12 <= a1)
    {
      __break(1u);
    }
    else
    {
      sub_100010BA4(a2+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * a1, (uint64_t)v11, &qword_1000EDF20);
      swift_bridgeObjectRelease(*((_QWORD *)v11 + 1));
      swift_bridgeObjectRelease(*((_QWORD *)v11 + 3));
      v13 = (uint64_t)&v11[*(int *)(v6 + 64)];
      v14 = (void **)sub_100008FA4((_QWORD *)(a3 + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_context), *(_QWORD *)(a3 + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_context + 24));
      sub_10009D254(*v14, v13);
      return sub_1000367CC(v13, type metadata accessor for BIABubbleViewModelUserAction);
    }
  }
  return result;
}

void sub_10009C85C()
{
  uint64_t v0;

}

id sub_10009C888()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BIABubbleOptionsiOSViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10009C8F4()
{
  return type metadata accessor for BIABubbleOptionsiOSViewController(0);
}

uint64_t type metadata accessor for BIABubbleOptionsiOSViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_1000F0958;
  if (!qword_1000F0958)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for BIABubbleOptionsiOSViewController);
  return result;
}

uint64_t sub_10009C938(uint64_t a1)
{
  _QWORD v2[2];

  v2[0] = "\b";
  v2[1] = "\b";
  return swift_updateClassMetadata2(a1, 256, 2, v2, a1 + 240);
}

uint64_t sub_10009C978@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_1000B3790);
  v5 = swift_getKeyPath(&unk_1000B37B8);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_10009C9F8(char *a1, void **a2)
{
  char v2;
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_1000B3790);
  v5 = swift_getKeyPath(&unk_1000B37B8);
  v7 = v2;
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_10009CA68(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1000A2224(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_10009CA84(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1000A23AC(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_10009CAA0(char a1, int64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1000A2594(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_10009CABC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1000A2774(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10009CAD8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10009CB1C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10009CB48(int a1)
{
  uint64_t v1;

  return sub_10009C6C0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10009CB50()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10009CB74(uint64_t a1)
{
  uint64_t v1;

  return sub_100018770(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_10009CB7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10009CB8C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10009CB94(unint64_t a1, uint64_t a2, uint64_t a3)
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
        sub_10009D4F8(&qword_1000F0978, &qword_1000F0970);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_100007D40(&qword_1000F0970);
          v13 = sub_100063590(v18, i, a3);
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
    sub_1000090C8(0, (unint64_t *)&qword_1000EEB90, NSLayoutConstraint_ptr);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10009CDA8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10009CDF0(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for IMBProposedDate, &qword_1000F09C0, &qword_1000F09B8, (uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000635E8);
}

uint64_t sub_10009CDCC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10009CDF0(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for IMBProposedTimeslot, &qword_1000F09A8, &qword_1000F09A0, (uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000635E8);
}

uint64_t sub_10009CDF0(unint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD), unint64_t *a5, uint64_t *a6, uint64_t (*a7)(_BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))
{
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void (*v23)(_BYTE *, _QWORD);
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  _BYTE v28[32];

  v14 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v26 = a3;
    else
      v26 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v15 = _CocoaArrayWrapper.endIndex.getter(v26);
    swift_bridgeObjectRelease(a3);
    if (!v15)
      return a3;
  }
  else
  {
    v15 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v15)
      return a3;
  }
  if (!a1)
    goto LABEL_25;
  v16 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v14)
  {
    if (a3 < 0)
      v18 = a3;
    else
      v18 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v19 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(a3);
    if (v19 <= a2)
    {
      if (v15 >= 1)
      {
        v20 = sub_10009D4F8(a5, a6);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v15; ++i)
        {
          v22 = sub_100007D40(a6);
          v23 = (void (*)(_BYTE *, _QWORD))a7(v28, i, a3, v22, v20);
          v25 = *v24;
          swift_retain(*v24);
          v23(v28, 0);
          *(_QWORD *)(a1 + 8 * i) = v25;
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
  v17 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v17 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v16 + 32 >= a1 + 8 * v17 || v16 + 32 + 8 * v17 <= a1)
  {
    a4(0);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10009CFF8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10009CDF0(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for IMBListItem, &qword_1000F0998, &qword_1000F0990, (uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))sub_10006363C);
}

uint64_t sub_10009D01C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10009CDF0(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for IMBListSection, &qword_1000F0988, &qword_1000F0980, (uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000635E8);
}

uint64_t sub_10009D040(unint64_t a1, uint64_t a2, uint64_t a3)
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
        sub_10009D4F8(&qword_1000F09D0, &qword_1000F09C8);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_100007D40(&qword_1000F09C8);
          v13 = sub_100063690(v18, i, a3);
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
    sub_1000090C8(0, &qword_1000EE988, EKEvent_ptr);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10009D254(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v33[16];
  uint64_t v34[2];
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[4];
  _QWORD v41[5];

  v4 = type metadata accessor for URLHelper(0);
  __chkstk_darwin(v4, v5);
  v7 = &v33[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = &v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for BIABubbleViewModelUserAction(0);
  __chkstk_darwin(v13, v14);
  v16 = &v33[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = type metadata accessor for PluginBubbleContext();
  v41[3] = v17;
  v41[4] = &off_1000D6B68;
  v41[0] = a1;
  sub_10009CAD8(a2, (uint64_t)v16, type metadata accessor for BIABubbleViewModelUserAction);
  if (swift_getEnumCaseMultiPayload(v16, v13) == 1)
  {
    v18 = *(_QWORD *)v16;
    v19 = *((_QWORD *)v16 + 1);
    v20 = v16[16];
    v22 = *((_QWORD *)v16 + 3);
    v21 = *((_QWORD *)v16 + 4);
    v24 = *((_QWORD *)v16 + 5);
    v23 = *((_QWORD *)v16 + 6);
    sub_100008FA4(v41, v17);
    v34[0] = v18;
    v34[1] = v19;
    v35 = v20;
    v36 = v22;
    v37 = v21;
    v38 = v24;
    v39 = v23;
    v25 = sub_100023310();
    v26 = sub_100023354();
    v27 = a1;
    swift_bridgeObjectRetain(v21);
    static DictionarySerialization.encode(_:)(v40, v34, &type metadata for BIAReply, v25, v26);
    v29 = (void *)BCMessageRootNotificationKey;
    v30 = sub_100007D40(&qword_1000EC478);
    swift_dynamicCast(v34, v40, (char *)&type metadata for Any + 8, v30, 7);
    v31 = v34[0];
    sub_100018560(v29, v34[0]);
    swift_bridgeObjectRelease(v23);
    swift_bridgeObjectRelease(v19);
    swift_bridgeObjectRelease_n(v21, 2);
    swift_bridgeObjectRelease(v31);
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v9 + 32))(v12, v16, v8);
    v28 = a1;
    sub_10004EA08((uint64_t)v7);
    sub_10004E4AC((uint64_t)v12, 1, sub_100059578, 0);
    sub_1000367CC((uint64_t)v7, type metadata accessor for URLHelper);
    (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v12, v8);
  }
  return sub_100010C40(v41);
}

uint64_t sub_10009D4F8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_100007DCC(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10009D538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v22;
  uint64_t v23;

  v5 = type metadata accessor for IndexPath(0, a2, a3);
  v23 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16)
    && (v10 = *(_QWORD *)(a2 + 40),
        v11 = sub_10009FE90((unint64_t *)&qword_1000ED600, (uint64_t)&protocol conformance descriptor for IndexPath, v7), v12 = dispatch thunk of Hashable._rawHashValue(seed:)(v10, v5, v11), v13 = -1 << *(_BYTE *)(a2 + 32), v14 = v12 & ~v13, ((*(_QWORD *)(a2 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0))
  {
    v15 = ~v13;
    v16 = *(_QWORD *)(v23 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v23 + 16);
    do
    {
      v17(v9, *(_QWORD *)(a2 + 48) + v16 * v14, v5);
      v19 = sub_10009FE90((unint64_t *)&qword_1000ECC90, (uint64_t)&protocol conformance descriptor for IndexPath, v18);
      v20 = dispatch thunk of static Equatable.== infix(_:_:)(v9, a1, v5, v19);
      (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v5);
      if ((v20 & 1) != 0)
        break;
      v14 = (v14 + 1) & v15;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
  }
  else
  {
    v20 = 0;
  }
  return v20 & 1;
}

void sub_10009D728()
{
  char *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t ObjCClassFromMetadata;
  NSString v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;
  uint64_t v10;
  char **v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  Swift::String v17;
  Swift::String v18;
  void *object;
  NSString v20;
  char *v21;
  _BOOL8 v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t ObjectType;
  uint64_t v27;
  char v28[24];
  objc_super v29;
  Swift::String v30;

  v29.receiver = v0;
  v29.super_class = (Class)type metadata accessor for MacListPickerTableViewController();
  objc_msgSendSuper2(&v29, "viewDidLoad");
  v1 = objc_msgSend(v0, "view");
  if (!v1)
  {
    __break(1u);
    return;
  }
  v2 = v1;
  if (qword_1000EBBF8 != -1)
    swift_once(&qword_1000EBBF8, sub_10002D65C);
  objc_msgSend(v2, "setBackgroundColor:", qword_1000F8978);

  v3 = *(void **)&v0[OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView];
  v4 = type metadata accessor for IMBDefaultSectionHeader();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v4);
  v6 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "registerClass:forHeaderFooterViewReuseIdentifier:", ObjCClassFromMetadata, v6);

  v7 = type metadata accessor for MacListPickerTableViewCell();
  v8 = swift_getObjCClassFromMetadata(v7);
  v9 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v8, v9);

  objc_msgSend(v3, "setEstimatedRowHeight:", 140.0);
  objc_msgSend(v3, "setSectionHeaderHeight:", UITableViewAutomaticDimension);
  objc_msgSend(v3, "setEstimatedSectionHeaderHeight:", 80.0);
  objc_msgSend(v3, "setSeparatorStyle:", 0);
  objc_msgSend(v3, "setBackgroundColor:", qword_1000F8978);
  objc_msgSend(v3, "_setSectionContentInset:", 0.0, 8.0, 0.0, 8.0);
  objc_msgSend(v3, "_setSectionCornerRadius:", 0.0);
  if (!v0[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectionType])
  {
    v10 = 0;
    v11 = &selRef_setAllowsSelection_;
    goto LABEL_8;
  }
  if (v0[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectionType] == 2)
  {
    v10 = 1;
    v11 = &selRef_setAllowsMultipleSelection_;
LABEL_8:
    objc_msgSend(v3, *v11, v10);
  }
  v12 = *(void **)&v0[OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_nothingAvailableLabel];
  v13 = *(_QWORD *)&v0[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest];
  if (v13)
  {
    v14 = *(_QWORD *)(v13 + 24);
    if ((unint64_t)v14 >> 62)
    {
      if (v14 < 0)
        v27 = *(_QWORD *)(v13 + 24);
      else
        v27 = v14 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v14);
      v15 = _CocoaArrayWrapper.endIndex.getter(v27);
      swift_bridgeObjectRelease(v14);
    }
    else
    {
      v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v12, "setHidden:", v15 > 0);
  v16 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v30._object = (void *)0xE000000000000000;
  v17._object = (void *)0x80000001000B54E0;
  v17._countAndFlagsBits = 0xD000000000000012;
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  v30._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v17, (Swift::String_optional)0, (NSBundle)v16, v18, v30)._object;

  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v12, "setText:", v20);

  v21 = &v0[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths];
  swift_beginAccess(&v0[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths], v28, 0, 0);
  v22 = *(_QWORD *)(*(_QWORD *)v21 + 16) != 0;
  v23 = sub_100082DDC();
  v25 = v24;
  ObjectType = swift_getObjectType(v23);
  (*(void (**)(_BOOL8, uint64_t, uint64_t))(v25 + 48))(v22, ObjectType, v25);

}

id sub_10009DB14()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  int v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *object;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  NSString v13;
  id v14;
  id v15;
  NSString v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  Swift::String v24;
  Swift::String v25;
  void *v26;
  NSString v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  Swift::String v37;
  Swift::String v38;

  v1 = v0;
  v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MacTableHeaderView()), "init");
  v3 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectionType);
  v4 = sub_100015104();
  v5 = *(void **)(v1 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_message);
  if (v3)
  {
    v6 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_message), "receivedMessage");
    if (v6 && (v7 = v6, v8 = objc_msgSend(v6, "title"), v7, v8))
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    }
    else
    {
      v8 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v37._object = (void *)0xE000000000000000;
      v10._object = (void *)0x80000001000B54C0;
      v10._countAndFlagsBits = 0xD000000000000019;
      v11._countAndFlagsBits = 0;
      v11._object = (void *)0xE000000000000000;
      v37._countAndFlagsBits = 0;
      object = NSLocalizedString(_:tableName:bundle:value:comment:)(v10, (Swift::String_optional)0, (NSBundle)v8, v11, v37)._object;
    }
    v12 = object;

    v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v12);
    objc_msgSend(v4, "setText:", v13);

    v14 = sub_100015210();
    v15 = objc_msgSend(v5, "receivedMessage");
    v16 = v15;
    if (v15)
    {
      v17 = objc_msgSend(v15, "subtitle");

      if (v17)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
        v19 = v18;

        v16 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v19);
      }
      else
      {
        v16 = 0;
      }
    }
    objc_msgSend(v14, "setText:", v16);

  }
  else
  {
    v20 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_message), "replyMessage");
    if (v20
      && (v21 = v20, v22 = objc_msgSend(v20, "title"), v21, v22))
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
    }
    else
    {
      v22 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v24._countAndFlagsBits = 0xD000000000000022;
      v38._object = (void *)0xE000000000000000;
      v24._object = (void *)0x80000001000B5490;
      v25._countAndFlagsBits = 0;
      v25._object = (void *)0xE000000000000000;
      v38._countAndFlagsBits = 0;
      v23 = NSLocalizedString(_:tableName:bundle:value:comment:)(v24, (Swift::String_optional)0, (NSBundle)v22, v25, v38)._object;
    }
    v26 = v23;

    v27 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v26);
    objc_msgSend(v4, "setText:", v27);

    v16 = sub_100015210();
    objc_msgSend(v16, "setText:", 0);
  }

  v28 = objc_msgSend((id)objc_opt_self(UIColor), "separatorColor");
  v29 = v2;
  v30 = sub_100015968();

  objc_msgSend(v30, "setBackgroundColor:", v28);
  v31 = sub_100015968();
  v32 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest);
  if (v32)
  {
    v33 = *(_QWORD *)(v32 + 24);
    if ((unint64_t)v33 >> 62)
    {
      if (v33 < 0)
        v36 = *(_QWORD *)(v32 + 24);
      else
        v36 = v33 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v33);
      v34 = _CocoaArrayWrapper.endIndex.getter(v36);
      swift_bridgeObjectRelease(v33);
    }
    else
    {
      v34 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
  }
  else
  {
    v34 = 0;
  }
  objc_msgSend(v31, "setHidden:", v34 > 1);

  return v29;
}

uint64_t sub_10009DEF0()
{
  uint64_t v0;
  int v1;
  void *v2;
  id v3;
  Swift::String v4;
  Swift::String v5;
  uint64_t v6;
  Swift::String v7;
  id v8;
  Swift::String v9;
  Swift::String v10;
  Swift::String v11;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v14;
  uint64_t result;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  Swift::String v19;
  uint64_t v20;
  unint64_t v21;
  Swift::String v22;

  v1 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectionType);
  v2 = (void *)objc_opt_self(NSBundle);
  v3 = objc_msgSend(v2, "mainBundle");
  v21 = 0xE000000000000000;
  if (v1)
  {
    v4._countAndFlagsBits = 1145980243;
    v4._object = (void *)0xE400000000000000;
    v5._countAndFlagsBits = 0;
    v5._object = (void *)0xE000000000000000;
    v6 = 0;
    v7 = NSLocalizedString(_:tableName:bundle:value:comment:)(v4, (Swift::String_optional)0, (NSBundle)v3, v5, *(Swift::String *)(&v21 - 1));

    v8 = objc_msgSend(v2, "mainBundle");
    v22._object = (void *)0xE000000000000000;
    v9._countAndFlagsBits = 0x4C45434E4143;
    v9._object = (void *)0xE600000000000000;
    v10._countAndFlagsBits = 0;
    v10._object = (void *)0xE000000000000000;
    v22._countAndFlagsBits = 0;
    v11 = NSLocalizedString(_:tableName:bundle:value:comment:)(v9, (Swift::String_optional)0, (NSBundle)v8, v10, v22);
    countAndFlagsBits = v11._countAndFlagsBits;
    object = v11._object;

    v14 = type metadata accessor for FooterToolbarModel();
    result = swift_allocObject(v14, 97, 7);
    *(_QWORD *)(result + 80) = 0;
    *(_QWORD *)(result + 88) = 0;
    *(_BYTE *)(result + 96) = 1;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0xE000000000000000;
    *(_QWORD *)(result + 32) = 0;
    *(Swift::String *)(result + 40) = v7;
  }
  else
  {
    v16._countAndFlagsBits = 1162760004;
    v16._object = (void *)0xE400000000000000;
    v17._countAndFlagsBits = 0;
    v17._object = (void *)0xE000000000000000;
    v18 = 0;
    v19 = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, (Swift::String_optional)0, (NSBundle)v3, v17, *(Swift::String *)(&v21 - 1));
    countAndFlagsBits = v19._countAndFlagsBits;
    object = v19._object;

    v20 = type metadata accessor for FooterToolbarModel();
    result = swift_allocObject(v20, 97, 7);
    *(_QWORD *)(result + 80) = 0;
    *(_QWORD *)(result + 88) = 0;
    *(_BYTE *)(result + 96) = 1;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0xE000000000000000;
    *(_QWORD *)(result + 32) = 0;
    *(_QWORD *)(result + 40) = 0;
    *(_QWORD *)(result + 48) = 0xE000000000000000;
  }
  *(_QWORD *)(result + 56) = 2;
  *(_QWORD *)(result + 64) = countAndFlagsBits;
  *(_QWORD *)(result + 72) = object;
  return result;
}

void sub_10009E08C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  Class isa;
  id v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  UIAccessibilityTraits v43;
  UIAccessibilityTraits v44;
  UIAccessibilityTraits v45;
  UIAccessibilityTraits v46;
  int v47;
  UIAccessibilityTraits v48;
  UIAccessibilityTraits v49;
  _BOOL8 v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t ObjectType;
  UIAccessibilityTraits v56;
  UIAccessibilityTraits v57;
  UIAccessibilityTraits v58;
  UIAccessibilityTraits v59;
  char *v60;
  uint64_t v61;
  int64_t v62;
  id v63;
  char *v64;
  int64_t v65;
  _BYTE v66[24];
  char v67[24];

  v4 = type metadata accessor for IndexPath(0, a2, a3);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100007D40(&qword_1000ECC88);
  v11 = __chkstk_darwin(v9, v10);
  v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11, v14);
  v16 = (char *)&v56 - v15;
  v17 = &v3[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths];
  swift_beginAccess(&v3[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths], v67, 0, 0);
  v18 = *(_QWORD *)v17;
  v19 = *(_QWORD *)(*(_QWORD *)v17 + 56);
  v61 = *(_QWORD *)v17 + 56;
  v20 = 1 << *(_BYTE *)(v18 + 32);
  v21 = -1;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  v22 = v21 & v19;
  v62 = (unint64_t)(v20 + 63) >> 6;
  v59 = UIAccessibilityTraitStaticText;
  v58 = UIAccessibilityTraitButton;
  v57 = UIAccessibilityTraitNotEnabled;
  v56 = UIAccessibilityTraitSelected;
  swift_bridgeObjectRetain_n(v18, 2);
  v64 = v3;
  v23 = 0;
  v60 = v16;
  while (1)
  {
    if (v22)
    {
      v24 = __clz(__rbit64(v22));
      v22 &= v22 - 1;
      v25 = v24 | (v23 << 6);
      goto LABEL_24;
    }
    v26 = v23 + 1;
    if (__OFADD__(v23, 1))
    {
      __break(1u);
      goto LABEL_43;
    }
    if (v26 >= v62)
      goto LABEL_40;
    v27 = *(_QWORD *)(v61 + 8 * v26);
    ++v23;
    if (!v27)
    {
      v23 = v26 + 1;
      if (v26 + 1 >= v62)
        goto LABEL_40;
      v27 = *(_QWORD *)(v61 + 8 * v23);
      if (!v27)
      {
        v23 = v26 + 2;
        if (v26 + 2 >= v62)
          goto LABEL_40;
        v27 = *(_QWORD *)(v61 + 8 * v23);
        if (!v27)
        {
          v23 = v26 + 3;
          if (v26 + 3 >= v62)
            goto LABEL_40;
          v27 = *(_QWORD *)(v61 + 8 * v23);
          if (!v27)
            break;
        }
      }
    }
LABEL_23:
    v22 = (v27 - 1) & v27;
    v25 = __clz(__rbit64(v27)) + (v23 << 6);
LABEL_24:
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v16, *(_QWORD *)(v18 + 48) + *(_QWORD *)(v5 + 72) * v25, v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v16, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v16, 1, v4) == 1)
      goto LABEL_41;
    v65 = v23;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v16, v4);
    swift_beginAccess(v17, v66, 33, 0);
    sub_1000A431C((uint64_t)v8, v29, v30, (uint64_t)v13);
    sub_100020F10((uint64_t)v13);
    swift_endAccess(v66);
    v31 = *(void **)&v64[OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView];
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v33 = objc_msgSend(v31, "cellForRowAtIndexPath:", isa);

    if (v33)
    {
      v34 = type metadata accessor for MacListPickerTableViewCell();
      v35 = swift_dynamicCastClass(v33, v34);
      if (v35)
      {
        v36 = (_BYTE *)v35;
        v37 = v4;
        v38 = v18;
        v39 = v13;
        v40 = v8;
        v41 = v17;
        v42 = OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItemSelected;
        *(_BYTE *)(v35 + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItemSelected) = 0;
        v63 = v33;
        sub_1000678A0();
        v43 = v59;
        if (v36[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_accessibilityRoleIsButton])
          v43 = v58;
        v44 = v57;
        if ((v57 & ~v43) == 0)
          v44 = 0;
        if (v36[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_isDimmed])
          v45 = v44;
        else
          v45 = 0;
        v46 = v43 | v45;
        v47 = v36[v42];
        v17 = v41;
        v8 = v40;
        v13 = v39;
        v18 = v38;
        v4 = v37;
        v16 = v60;
        v48 = v56;
        if ((v56 & ~v46) == 0)
          v48 = 0;
        if (v47)
          v49 = v48;
        else
          v49 = 0;
        objc_msgSend(v36, "setAccessibilityTraits:", v46 | v49);

      }
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v23 = v65;
  }
  v28 = v26 + 4;
  if (v28 >= v62)
  {
LABEL_40:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v16, 1, 1, v4);
LABEL_41:
    swift_release(v18);
    swift_bridgeObjectRelease(v18);
    v50 = *(_QWORD *)(*(_QWORD *)v17 + 16) != 0;
    v51 = v64;
    v52 = sub_100082DDC();
    v54 = v53;
    ObjectType = swift_getObjectType(v52);
    (*(void (**)(_BOOL8, uint64_t, uint64_t))(v54 + 48))(v50, ObjectType, v54);

    return;
  }
  v27 = *(_QWORD *)(v61 + 8 * v28);
  if (v27)
  {
    v23 = v28;
    goto LABEL_23;
  }
  while (1)
  {
    v23 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v23 >= v62)
      goto LABEL_40;
    v27 = *(_QWORD *)(v61 + 8 * v23);
    ++v28;
    if (v27)
      goto LABEL_23;
  }
LABEL_43:
  __break(1u);
}

void sub_10009E554(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t Strong;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t ObjectType;
  void (*v22)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD *v27;
  _BYTE v28[24];

  v3 = v2;
  if (qword_1000EBCC0 != -1)
    a1 = swift_once(&qword_1000EBCC0, sub_1000827F0);
  v4 = qword_1000F8A98;
  v5 = static os_log_type_t.debug.getter(a1, a2);
  os_log(_:dso:log:type:_:)("Right button tapped", 19, 2, &_mh_execute_header, v4, v5, _swiftEmptyArrayStorage);
  v6 = *(_QWORD *)(v3 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest);
  if (v6)
  {
    v7 = (uint64_t *)(v3 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths);
    swift_beginAccess(v3 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths, v28, 0, 0);
    v8 = *v7;
    swift_retain_n(v6, 2);
    v9 = swift_bridgeObjectRetain(v8);
    v10 = sub_1000A2B5C(v9);
    swift_bridgeObjectRelease(v8);
    v11 = type metadata accessor for IMBListResponse();
    v12 = (_QWORD *)swift_allocObject(v11, 40, 7);
    v12[4] = 0;
    v12[2] = v6;
    v27 = v10;
    swift_retain(v6);
    swift_retain(v10);
    sub_1000A28DC(&v27, v13, v14);
    swift_release(v10);
    swift_release(v6);
    v15 = *(void **)(v3 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_conversation);
    v12[3] = v27;
    sub_1000613F4(v15, *(id *)(v3 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_message));
    v16 = v3 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController__dismissalDelegate;
    Strong = swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController__dismissalDelegate);
    swift_unknownObjectRelease(Strong);
    if (Strong)
    {
      v18 = swift_unknownObjectWeakLoadStrong(v16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)(v16 + 8);
        ObjectType = swift_getObjectType(v18);
        v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 16);
        v23 = type metadata accessor for MacListPickerTableViewController();
        v22(v3, v23, ObjectType, v20);
        swift_release(v12);
        swift_unknownObjectRelease(v19);
      }
      else
      {
        swift_release(v12);
      }
      swift_release(v6);
    }
    else
    {
      __break(1u);
      swift_release(v27);
      __break(1u);
    }
  }
  else
  {
    v24 = sub_1000090C8(0, (unint64_t *)&qword_1000ECE70, OS_os_log_ptr);
    v26 = (id)static OS_os_log.default.getter(v24);
    v25 = static os_log_type_t.default.getter(v26);
    os_log(_:dso:log:type:_:)("Failed to send reply because there is no list request", 53, 2, &_mh_execute_header, v26, v25, _swiftEmptyArrayStorage);

  }
}

unint64_t sub_10009E9B4(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  id v28;
  BOOL v29;
  uint64_t v30;
  id v31;
  void *v32;
  double v33;
  id v34;
  uint64_t v35;
  BOOL *v36;
  id v37;
  _BYTE v38[24];

  v4 = v2;
  v7 = String._bridgeToObjectiveC()();
  v8 = objc_msgSend(a1, "dequeueReusableCellWithIdentifier:", v7);

  if (!v8)
    return (unint64_t)objc_msgSend(objc_allocWithZone((Class)UITableViewCell), "init");
  v9 = type metadata accessor for MacListPickerTableViewCell();
  v10 = swift_dynamicCastClass(v8, v9);
  if (!v10)
  {

    return (unint64_t)objc_msgSend(objc_allocWithZone((Class)UITableViewCell), "init");
  }
  v11 = *(_QWORD *)(v2 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest);
  if (!v11)
  {
    v12 = objc_msgSend(objc_allocWithZone((Class)UITableViewCell), "init");

    return (unint64_t)v12;
  }
  v12 = (_BYTE *)v10;
  v13 = *(_QWORD *)(v11 + 24);
  v14 = swift_bridgeObjectRetain(v13);
  result = IndexPath.section.getter(v14);
  if ((v13 & 0xC000000000000001) == 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (result < *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v16 = *(_QWORD *)(v13 + 8 * result + 32);
      swift_retain(v16);
      goto LABEL_8;
    }
    __break(1u);
    goto LABEL_29;
  }
  v16 = specialized _ArrayBuffer._getElementSlowPath(_:)(result, v13);
LABEL_8:
  swift_bridgeObjectRelease(v13);
  v3 = *(_QWORD *)(v16 + 40);
  swift_bridgeObjectRetain(v3);
  v17 = swift_release(v16);
  result = IndexPath.row.getter(v17);
  if ((v3 & 0xC000000000000001) == 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (result < *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v18 = *(_QWORD *)(v3 + 8 * result + 32);
      swift_retain(v18);
      goto LABEL_12;
    }
    __break(1u);
    goto LABEL_32;
  }
LABEL_29:
  v18 = specialized _ArrayBuffer._getElementSlowPath(_:)(result, v3);
LABEL_12:
  swift_bridgeObjectRelease(v3);
  v19 = *(unsigned __int8 *)(v4 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectionType);
  v12[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_selectionType] = v19;
  sub_1000678A0();
  v20 = *(_QWORD *)&v12[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItem];
  *(_QWORD *)&v12[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItem] = v18;
  swift_retain_n(v18, 2);
  swift_release(v20);
  sub_1000678A0();
  swift_release(v18);
  v21 = (void *)objc_opt_self(UIColor);
  v22 = v8;
  v23 = objc_msgSend(v21, "separatorColor");
  objc_msgSend(v12, "setSeparatorColor:", v23);

  objc_msgSend(v12, "setSelectionStyle:", 0);
  v24 = (uint64_t *)(v4 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths);
  swift_beginAccess(v4 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths, v38, 0, 0);
  v25 = *v24;
  swift_bridgeObjectRetain(v25);
  v27 = sub_10009D538(a2, v25, v26);
  swift_bridgeObjectRelease(v25);
  v12[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItemSelected] = v27 & 1;
  sub_1000678A0();
  sub_100067C78();
  if (v19)
  {
    v12[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_accessibilityRoleIsButton] = 1;
  }
  else
  {
    v12[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_accessibilityRoleIsButton] = 0;
    v28 = sub_100067C78();
    v29 = IndexPath.section.getter(v28) != 0;
    v30 = OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_isDimmed;
    v12[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_isDimmed] = v29;
    v31 = objc_msgSend(v12, "contentView");
    v32 = v31;
    v33 = 0.3;
    if (!v12[v30])
      v33 = 1.0;
    objc_msgSend(v31, "setAlpha:", v33);

  }
  v34 = sub_100067C78();
  v35 = IndexPath.row.getter(v34);
  result = (unint64_t)objc_msgSend(a1, "numberOfRowsInSection:", IndexPath.section.getter(v35));
  if (!__OFSUB__(result, 1))
  {
    v36 = &v12[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_showsSeparator];
    *v36 = v35 != result - 1;
    v37 = sub_100067D08();
    objc_msgSend(v37, "setHidden:", !*v36);
    swift_release(v18);

    return (unint64_t)v12;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_10009EF0C(void *a1, unint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSString v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *object;
  NSString v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v5 = *(_QWORD *)(v2 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest);
  if (!v5)
    return 0;
  v8 = *(_QWORD *)(v5 + 24);
  if ((v8 & 0xC000000000000001) == 0)
  {
    if ((a2 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
    {
      v9 = *(_QWORD *)(v8 + 8 * a2 + 32);
      swift_retain(*(_QWORD *)(v2 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest));
      swift_retain(v9);
      goto LABEL_6;
    }
    __break(1u);
LABEL_23:
    v24 = v3;
    v16 = specialized _ArrayBuffer._getElementSlowPath(_:)(a2, v4);
    goto LABEL_15;
  }
  swift_retain(*(_QWORD *)(v2 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest));
  v9 = specialized _ArrayBuffer._getElementSlowPath(_:)(a2, v8);
LABEL_6:
  v10 = *(_QWORD *)(v9 + 16);
  v11 = *(_QWORD *)(v9 + 24);
  swift_release(v9);
  v12 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0)
    v12 = v10 & 0xFFFFFFFFFFFFLL;
  if (!v12
    || (v13 = String._bridgeToObjectiveC()(),
        v8 = (unint64_t)objc_msgSend(a1, "dequeueReusableHeaderFooterViewWithIdentifier:", v13),
        v13,
        !v8))
  {
    swift_release(v5);
    return 0;
  }
  v14 = type metadata accessor for IMBDefaultSectionHeader();
  result = swift_dynamicCastClass(v8, v14);
  a1 = (void *)result;
  if (!result)
  {

    swift_release(v5);
    return (uint64_t)a1;
  }
  v3 = *(void **)(result + OBJC_IVAR____TtC8Business23IMBDefaultSectionHeader_headerLabel);
  v4 = *(_QWORD *)(v5 + 24);
  if ((v4 & 0xC000000000000001) != 0)
    goto LABEL_23;
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v16 = *(_QWORD *)(v4 + 8 * a2 + 32);
    v17 = v3;
    swift_retain(v16);
LABEL_15:
    v18 = *(_QWORD *)(v16 + 24);
    swift_bridgeObjectRetain(v18);
    swift_release(v16);
    object = String.uppercased()()._object;
    swift_bridgeObjectRelease(v18);
    v20 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object);
    objc_msgSend(v3, "setText:", v20);

    v21 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView), "separatorColor");
    v22 = (id)v8;
    v23 = sub_10008DA74();

    objc_msgSend(v23, "setBackgroundColor:", v21);
    swift_release(v5);

    return (uint64_t)a1;
  }
  __break(1u);
  return result;
}

void sub_10009F1E0(void *a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  char *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  int64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  unint64_t v47;
  unint64_t v48;
  int64_t v49;
  unint64_t v50;
  int64_t v51;
  Class isa;
  uint64_t v53;
  uint64_t v54;
  Class v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  UIAccessibilityTraits v64;
  UIAccessibilityTraits v65;
  UIAccessibilityTraits v66;
  UIAccessibilityTraits v67;
  int v68;
  UIAccessibilityTraits v69;
  UIAccessibilityTraits v70;
  _BOOL8 v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t ObjectType;
  void *v76;
  UIAccessibilityTraits v77;
  UIAccessibilityTraits v78;
  UIAccessibilityTraits v79;
  UIAccessibilityTraits v80;
  uint64_t v81;
  int64_t v82;
  uint64_t v83;
  uint64_t *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  _BYTE v88[32];
  char v89[32];

  v4 = a2;
  v86 = type metadata accessor for IndexPath(0, a2, a3);
  v6 = *(_QWORD *)(v86 - 8);
  __chkstk_darwin(v86, v7);
  v9 = (char *)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100007D40(&qword_1000ECC88);
  v12 = __chkstk_darwin(v10, v11);
  __chkstk_darwin(v12, v13);
  if (!v3[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectionType])
    return;
  v85 = (char *)&v76 - v14;
  v83 = v15;
  v16 = (uint64_t *)&v3[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths];
  v17 = swift_beginAccess(&v3[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths], v89, 0, 0);
  v84 = v16;
  v18 = *v16;
  __chkstk_darwin(v17, v19);
  *(&v76 - 2) = (void *)v4;
  v20 = a1;
  v21 = v3;
  swift_bridgeObjectRetain(v18);
  v87 = sub_1000A47DC((uint64_t)sub_100020E64, (uint64_t)(&v76 - 4), v18);
  v22 = v21;
  v23 = *(_QWORD *)&v21[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest];
  if (!v23)
    goto LABEL_7;
  v24 = *(_QWORD *)(v23 + 24);
  v25 = swift_bridgeObjectRetain(v24);
  v26 = IndexPath.section.getter(v25);
  if ((v24 & 0xC000000000000001) == 0)
  {
    if ((v26 & 0x8000000000000000) != 0)
    {
LABEL_58:
      __break(1u);
    }
    else if (v26 < *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v27 = *(_QWORD *)(v24 + 8 * v26 + 32);
      swift_retain(v27);
      swift_bridgeObjectRelease(v24);
      v28 = *(_BYTE *)(v27 + 48);
      swift_release(v27);
      if ((v28 & 1) != 0)
        goto LABEL_7;
      goto LABEL_10;
    }
    __break(1u);
    goto LABEL_60;
  }
  v34 = specialized _ArrayBuffer._getElementSlowPath(_:)(v26, v24);
  swift_bridgeObjectRelease(v24);
  v35 = *(_BYTE *)(v34 + 48);
  swift_unknownObjectRelease(v34);
  if ((v35 & 1) != 0)
  {
LABEL_7:
    swift_release(v87);
    v29 = v84;
    v30 = *v84;
    swift_bridgeObjectRetain(*v84);
    v32 = sub_10009D538(v4, v30, v31);
    swift_bridgeObjectRelease(v30);
    if ((v32 & 1) == 0)
    {
      v33 = v4;
LABEL_54:
      sub_10009F850(v33, (uint64_t)v22, v20);
      goto LABEL_55;
    }
LABEL_12:
    sub_10009F9BC(v4, v20, (uint64_t)v22);
LABEL_55:
    v71 = *(_QWORD *)(*v29 + 16) != 0;
    v72 = sub_100082DDC();
    v74 = v73;
    ObjectType = swift_getObjectType(v72);
    (*(void (**)(_BOOL8, uint64_t, uint64_t))(v74 + 48))(v71, ObjectType, v74);

    return;
  }
LABEL_10:
  v29 = v84;
  v36 = *v84;
  swift_bridgeObjectRetain(*v84);
  v38 = sub_10009D538(v4, v36, v37);
  swift_bridgeObjectRelease(v36);
  if ((v38 & 1) != 0)
  {
    swift_release(v87);
    goto LABEL_12;
  }
  v76 = v22;
  v39 = *(_QWORD *)(v87 + 56);
  v81 = v87 + 56;
  v40 = 1 << *(_BYTE *)(v87 + 32);
  v41 = -1;
  if (v40 < 64)
    v41 = ~(-1 << v40);
  v42 = v41 & v39;
  v82 = (unint64_t)(v40 + 63) >> 6;
  v80 = UIAccessibilityTraitStaticText;
  v79 = UIAccessibilityTraitButton;
  v78 = UIAccessibilityTraitNotEnabled;
  v77 = UIAccessibilityTraitSelected;
  swift_bridgeObjectRetain(v87);
  v43 = 0;
  v44 = v83;
  v45 = v86;
  while (1)
  {
    v46 = v85;
    if (v42)
    {
      v47 = __clz(__rbit64(v42));
      v42 &= v42 - 1;
      v48 = v47 | (v43 << 6);
      goto LABEL_36;
    }
    v49 = v43 + 1;
    if (__OFADD__(v43, 1))
    {
      __break(1u);
      goto LABEL_58;
    }
    if (v49 >= v82)
      goto LABEL_52;
    v50 = *(_QWORD *)(v81 + 8 * v49);
    ++v43;
    if (!v50)
    {
      v43 = v49 + 1;
      if (v49 + 1 >= v82)
        goto LABEL_52;
      v50 = *(_QWORD *)(v81 + 8 * v43);
      if (!v50)
      {
        v43 = v49 + 2;
        if (v49 + 2 >= v82)
          goto LABEL_52;
        v50 = *(_QWORD *)(v81 + 8 * v43);
        if (!v50)
        {
          v43 = v49 + 3;
          if (v49 + 3 >= v82)
            goto LABEL_52;
          v50 = *(_QWORD *)(v81 + 8 * v43);
          if (!v50)
            break;
        }
      }
    }
LABEL_35:
    v42 = (v50 - 1) & v50;
    v48 = __clz(__rbit64(v50)) + (v43 << 6);
LABEL_36:
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v85, *(_QWORD *)(v87 + 48) + *(_QWORD *)(v6 + 72) * v48, v45);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v46, 0, 1, v45);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v46, 1, v45) == 1)
      goto LABEL_53;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v46, v45);
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v20, "deselectRowAtIndexPath:animated:", isa, 1);

    swift_beginAccess(v29, v88, 33, 0);
    sub_1000A431C((uint64_t)v9, v53, v54, v44);
    sub_100020F10(v44);
    swift_endAccess(v88);
    v55 = IndexPath._bridgeToObjectiveC()().super.isa;
    v56 = objc_msgSend(v20, "cellForRowAtIndexPath:", v55);

    if (v56)
    {
      v57 = type metadata accessor for MacListPickerTableViewCell();
      v58 = swift_dynamicCastClass(v56, v57);
      if (v58)
      {
        v59 = (_BYTE *)v58;
        v60 = v20;
        v61 = v4;
        v62 = OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItemSelected;
        *(_BYTE *)(v58 + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItemSelected) = 0;
        v63 = v56;
        sub_1000678A0();
        v64 = v80;
        if (v59[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_accessibilityRoleIsButton])
          v64 = v79;
        v65 = v78;
        if ((v78 & ~v64) == 0)
          v65 = 0;
        if (v59[OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_isDimmed])
          v66 = v65;
        else
          v66 = 0;
        v67 = v64 | v66;
        v68 = v59[v62];
        v4 = v61;
        v20 = v60;
        v29 = v84;
        v69 = v77;
        if ((v77 & ~v67) == 0)
          v69 = 0;
        if (v68)
          v70 = v69;
        else
          v70 = 0;
        objc_msgSend(v59, "setAccessibilityTraits:", v67 | v70, v76);

        v44 = v83;
      }

    }
    v45 = v86;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v86);
  }
  v51 = v49 + 4;
  if (v51 >= v82)
  {
LABEL_52:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v85, 1, 1, v45);
LABEL_53:
    swift_release_n(v87, 2);
    v33 = v4;
    v22 = v76;
    goto LABEL_54;
  }
  v50 = *(_QWORD *)(v81 + 8 * v51);
  if (v50)
  {
    v43 = v51;
    goto LABEL_35;
  }
  while (1)
  {
    v43 = v51 + 1;
    if (__OFADD__(v51, 1))
      break;
    if (v43 >= v82)
      goto LABEL_52;
    v50 = *(_QWORD *)(v81 + 8 * v43);
    ++v51;
    if (v50)
      goto LABEL_35;
  }
LABEL_60:
  __break(1u);
}

void sub_10009F850(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  Class isa;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _BYTE v22[24];

  v6 = type metadata accessor for IndexPath(0, a2, a3);
  v7 = *(_QWORD *)(v6 - 8);
  v9 = __chkstk_darwin(v6, v8);
  v11 = &v22[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v9, v12);
  v14 = &v22[-v13 - 8];
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v11, a1, v6);
  swift_beginAccess(a2 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths, v22, 33, 0);
  sub_1000A02A4((uint64_t)v14, v11, v15);
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v14, v6);
  swift_endAccess(v22);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v17 = objc_msgSend(a3, "cellForRowAtIndexPath:", isa);

  if (v17)
  {
    v18 = type metadata accessor for MacListPickerTableViewCell();
    v19 = swift_dynamicCastClass(v17, v18);
    if (v19)
    {
      *(_BYTE *)(v19 + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItemSelected) = 1;
      v20 = v17;
      sub_1000678A0();
      sub_100067C78();

    }
  }
}

void sub_10009F9BC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  Class isa;
  uint64_t v11;
  uint64_t v12;
  Class v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _BYTE v19[24];

  v6 = sub_100007D40(&qword_1000ECC88);
  __chkstk_darwin(v6, v7);
  v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  objc_msgSend(a2, "deselectRowAtIndexPath:animated:", isa, 1);

  swift_beginAccess(a3 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths, v19, 33, 0);
  sub_1000A431C(a1, v11, v12, (uint64_t)v9);
  sub_100020F10((uint64_t)v9);
  swift_endAccess(v19);
  v13 = IndexPath._bridgeToObjectiveC()().super.isa;
  v14 = objc_msgSend(a2, "cellForRowAtIndexPath:", v13);

  if (v14)
  {
    v15 = type metadata accessor for MacListPickerTableViewCell();
    v16 = swift_dynamicCastClass(v14, v15);
    if (v16)
    {
      *(_BYTE *)(v16 + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItemSelected) = 0;
      v17 = v14;
      sub_1000678A0();
      sub_100067C78();

    }
  }
}

uint64_t sub_10009FCC8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest));
  return swift_bridgeObjectRelease(*(_QWORD *)(v0
                                             + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths));
}

id sub_10009FCF4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MacListPickerTableViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MacListPickerTableViewController()
{
  return objc_opt_self(_TtC8Business32MacListPickerTableViewController);
}

uint64_t storeEnumTagSinglePayload for MacListPickerTableViewController.SelectionType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10009FDC8 + 4 * byte_1000B37E5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10009FDFC + 4 * byte_1000B37E0[v4]))();
}

uint64_t sub_10009FDFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10009FE04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10009FE0CLL);
  return result;
}

uint64_t sub_10009FE18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10009FE20);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10009FE24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10009FE2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MacListPickerTableViewController.SelectionType()
{
  return &type metadata for MacListPickerTableViewController.SelectionType;
}

unint64_t sub_10009FE4C()
{
  unint64_t result;

  result = qword_1000F0A18;
  if (!qword_1000F0A18)
  {
    result = swift_getWitnessTable(&unk_1000B3860, &type metadata for MacListPickerTableViewController.SelectionType);
    atomic_store(result, (unint64_t *)&qword_1000F0A18);
  }
  return result;
}

uint64_t sub_10009FE90(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = type metadata accessor for IndexPath(255, a2, a3);
    result = swift_getWitnessTable(a2, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10009FED0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  _QWORD v24[9];

  v7 = *v3;
  Hasher.init(_seed:)(v24);
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v24, a2, a3);
  v8 = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = v12[1];
    v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      v15 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain(v16);
      return 0;
    }
    v18 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v18;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v19 = (_QWORD *)(v11 + 16 * v10);
      v20 = v19[1];
      v21 = *v19 == a2 && v20 == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, a2, a3, 0) & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease(v7);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v24[0] = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain(a3);
  sub_1000A0E48(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v23 = *v3;
  *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1000A007C(_QWORD *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char v28;
  char isUniquelyReferenced_nonNull_native;
  id v30;
  uint64_t v31;
  void *v33;
  id v34;
  _QWORD v35[9];

  v3 = v2;
  v6 = *v2;
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v9 = v8;
  Hasher.init(_seed:)(v35);
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(v35, v7, v9);
  v10 = Hasher._finalize()();
  swift_bridgeObjectRelease(v9);
  v11 = -1 << *(_BYTE *)(v6 + 32);
  v12 = v10 & ~v11;
  if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v35[0] = *v3;
    *v3 = 0x8000000000000000;
    v30 = a2;
    sub_1000A0FE0(v30, v12, isUniquelyReferenced_nonNull_native);
    v31 = *v3;
    *v3 = v35[0];
    swift_bridgeObjectRelease(v31);
    *a1 = v30;
    return 1;
  }
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v12));
  v15 = v14;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  if (v13 == v16 && v15 == v17)
  {
LABEL_16:
    swift_bridgeObjectRelease_n(v15, 2);
  }
  else
  {
    v19 = v17;
    v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v15, v16, v17, 0);
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v19);
    if ((v20 & 1) == 0)
    {
      v21 = ~v11;
      do
      {
        v12 = (v12 + 1) & v21;
        if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
          goto LABEL_15;
        v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v12));
        v15 = v23;
        v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
        if (v22 == v24 && v15 == v25)
          goto LABEL_16;
        v27 = v25;
        v28 = _stringCompareWithSmolCheck(_:_:expecting:)(v22, v15, v24, v25, 0);
        swift_bridgeObjectRelease(v15);
        swift_bridgeObjectRelease(v27);
      }
      while ((v28 & 1) == 0);
    }
  }

  swift_bridgeObjectRelease(v6);
  v33 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v12);
  *a1 = v33;
  v34 = v33;
  return 0;
}

uint64_t sub_1000A02A4(uint64_t a1, char *a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  uint64_t v22;
  void (*v23)(_QWORD, _QWORD, _QWORD);
  uint64_t v24;
  void (*v25)(_QWORD, _QWORD, _QWORD);
  uint64_t v26;
  uint64_t v27;
  char v28;
  void (*v29)(char *, uint64_t);
  uint64_t isUniquelyReferenced_nonNull_native;
  char *v31;
  uint64_t v32;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;

  v4 = v3;
  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v3;
  v13 = *(_QWORD *)(*v3 + 40);
  v15 = sub_10009FE90((unint64_t *)&qword_1000ED600, (uint64_t)&protocol conformance descriptor for IndexPath, v14);
  swift_bridgeObjectRetain(v12);
  v38 = a2;
  v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v13, v7, v15);
  v17 = -1 << *(_BYTE *)(v12 + 32);
  v18 = v16 & ~v17;
  v19 = v12;
  v20 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0)
  {
    v34 = v4;
    v35 = a1;
    v36 = ~v17;
    v21 = v8;
    v22 = *(_QWORD *)(v8 + 72);
    v37 = v21;
    v23 = *(void (**)(_QWORD, _QWORD, _QWORD))(v21 + 16);
    while (1)
    {
      v24 = v19;
      v25 = v23;
      v23(v11, *(_QWORD *)(v19 + 48) + v22 * v18, v7);
      v27 = sub_10009FE90((unint64_t *)&qword_1000ECC90, (uint64_t)&protocol conformance descriptor for IndexPath, v26);
      v28 = dispatch thunk of static Equatable.== infix(_:_:)(v11, v38, v7, v27);
      v29 = *(void (**)(char *, uint64_t))(v37 + 8);
      v29(v11, v7);
      if ((v28 & 1) != 0)
        break;
      v18 = (v18 + 1) & v36;
      v19 = v24;
      v23 = v25;
      if (((*(_QWORD *)(v20 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
      {
        swift_bridgeObjectRelease(v24);
        v4 = v34;
        a1 = v35;
        v8 = v37;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease(v24);
    v29(v38, v7);
    v25(v35, *(_QWORD *)(*v34 + 48) + v22 * v18, v7);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease(v12);
    v23 = *(void (**)(_QWORD, _QWORD, _QWORD))(v8 + 16);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v31 = v38;
    v23(v11, v38, v7);
    v39 = *v4;
    *v4 = 0x8000000000000000;
    sub_1000A120C((uint64_t)v11, v18, isUniquelyReferenced_nonNull_native);
    v32 = *v4;
    *v4 = v39;
    swift_bridgeObjectRelease(v32);
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(a1, v31, v7);
    return 1;
  }
}

Swift::Int sub_1000A04F8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  Swift::Int result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD v34[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100007D40(&qword_1000F0A50);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v32 = v2;
    v33 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v3 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = v5 + 56;
    result = swift_retain(v3);
    v13 = 0;
    while (1)
    {
      if (v9)
      {
        v16 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v10)
          goto LABEL_36;
        v19 = v33[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v10)
            goto LABEL_36;
          v19 = v33[v13];
          if (!v19)
          {
            v13 = v18 + 2;
            if (v18 + 2 >= v10)
              goto LABEL_36;
            v19 = v33[v13];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v10)
              {
LABEL_36:
                swift_release(v3);
                v2 = v32;
                v31 = 1 << *(_BYTE *)(v3 + 32);
                if (v31 > 63)
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v31;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v33[v20];
              if (!v19)
              {
                while (1)
                {
                  v13 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v13 >= v10)
                    goto LABEL_36;
                  v19 = v33[v13];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v13 = v20;
            }
          }
        }
LABEL_26:
        v9 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
      v22 = *v21;
      v23 = v21[1];
      Hasher.init(_seed:)(v34);
      String.hash(into:)(v34, v22, v23);
      result = Hasher._finalize()();
      v24 = -1 << *(_BYTE *)(v6 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v11 + 8 * v26);
        }
        while (v30 == -1);
        v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
      *v15 = v22;
      v15[1] = v23;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

uint64_t sub_1000A07D4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  Swift::Int v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  int64_t v33;
  _QWORD *v34;
  _QWORD v35[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100007D40(&qword_1000F0A58);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v32 = v2;
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v34 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v3 + 56);
    v33 = (unint64_t)(v7 + 63) >> 6;
    v10 = v5 + 56;
    result = swift_retain(v3);
    v12 = 0;
    while (1)
    {
      if (v9)
      {
        v14 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v16 >= v33)
          goto LABEL_36;
        v17 = v34[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v33)
            goto LABEL_36;
          v17 = v34[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v33)
              goto LABEL_36;
            v17 = v34[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v33)
              {
LABEL_36:
                swift_release(v3);
                v2 = v32;
                v31 = 1 << *(_BYTE *)(v3 + 32);
                if (v31 > 63)
                  bzero(v34, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v31;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v17 = v34[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_42;
                  if (v12 >= v33)
                    goto LABEL_36;
                  v17 = v34[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_26;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_26:
        v9 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v15);
      v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
      v22 = v21;
      Hasher.init(_seed:)(v35);
      String.hash(into:)(v35, v20, v22);
      v23 = Hasher._finalize()();
      result = swift_bridgeObjectRelease(v22);
      v24 = -1 << *(_BYTE *)(v6 + 32);
      v25 = v23 & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v10 + 8 * (v25 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v10 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v10 + 8 * v26);
        }
        while (v30 == -1);
        v13 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

void sub_1000A0AE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  __n128 v18;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(char *, unint64_t, uint64_t, __n128);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  int64_t v43;
  _QWORD *v44;
  uint64_t v45;

  v4 = v3;
  v6 = type metadata accessor for IndexPath(0, a2, a3);
  v45 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6, v7);
  v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v4;
  if (*(_QWORD *)(*v4 + 24) > a1)
    a1 = *(_QWORD *)(*v4 + 24);
  sub_100007D40(&qword_1000F0A30);
  v11 = static _SetStorage.resize(original:capacity:move:)(v10, a1, 1);
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_39;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 56);
  v44 = (_QWORD *)(v10 + 56);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v42 = v4;
  v43 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 56;
  v18 = swift_retain(v10);
  v19 = 0;
  while (1)
  {
    if (v16)
    {
      v21 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v22 = v21 | (v19 << 6);
      goto LABEL_26;
    }
    v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      return;
    }
    if (v23 >= v43)
      goto LABEL_35;
    v24 = v44[v23];
    ++v19;
    if (!v24)
    {
      v19 = v23 + 1;
      if (v23 + 1 >= v43)
        goto LABEL_35;
      v24 = v44[v19];
      if (!v24)
      {
        v19 = v23 + 2;
        if (v23 + 2 >= v43)
          goto LABEL_35;
        v24 = v44[v19];
        if (!v24)
          break;
      }
    }
LABEL_25:
    v16 = (v24 - 1) & v24;
    v22 = __clz(__rbit64(v24)) + (v19 << 6);
LABEL_26:
    v26 = v10;
    v27 = *(_QWORD *)(v45 + 72);
    v28 = *(_QWORD *)(v10 + 48) + v27 * v22;
    v29 = *(void (**)(char *, unint64_t, uint64_t, __n128))(v45 + 32);
    v29(v9, v28, v6, v18);
    v30 = *(_QWORD *)(v12 + 40);
    v32 = sub_10009FE90((unint64_t *)&qword_1000ED600, (uint64_t)&protocol conformance descriptor for IndexPath, v31);
    v33 = dispatch thunk of Hashable._rawHashValue(seed:)(v30, v6, v32);
    v34 = -1 << *(_BYTE *)(v12 + 32);
    v35 = v33 & ~v34;
    v36 = v35 >> 6;
    if (((-1 << v35) & ~*(_QWORD *)(v17 + 8 * (v35 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v35) & ~*(_QWORD *)(v17 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v37 = 0;
      v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_40;
        }
        v39 = v36 == v38;
        if (v36 == v38)
          v36 = 0;
        v37 |= v39;
        v40 = *(_QWORD *)(v17 + 8 * v36);
      }
      while (v40 == -1);
      v20 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(_QWORD *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    ((void (*)(unint64_t, char *, uint64_t))v29)(*(_QWORD *)(v12 + 48) + v20 * v27, v9, v6);
    ++*(_QWORD *)(v12 + 16);
    v10 = v26;
  }
  v25 = v23 + 3;
  if (v25 < v43)
  {
    v24 = v44[v25];
    if (!v24)
    {
      while (1)
      {
        v19 = v25 + 1;
        if (__OFADD__(v25, 1))
          goto LABEL_41;
        if (v19 >= v43)
          goto LABEL_35;
        v24 = v44[v19];
        ++v25;
        if (v24)
          goto LABEL_25;
      }
    }
    v19 = v25;
    goto LABEL_25;
  }
LABEL_35:
  swift_release(v10);
  v4 = v42;
  v41 = 1 << *(_BYTE *)(v10 + 32);
  if (v41 > 63)
    bzero(v44, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v44 = -1 << v41;
  *(_QWORD *)(v10 + 16) = 0;
LABEL_39:
  swift_release(v10);
  *v4 = v12;
}

uint64_t sub_1000A0E48(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD v28[9];

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_1000A04F8(v11);
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_1000A1400();
      goto LABEL_22;
    }
    sub_1000A197C(v11);
  }
  v12 = *v4;
  Hasher.init(_seed:)(v28);
  String.hash(into:)(v28, v8, a2);
  result = Hasher._finalize()();
  v13 = -1 << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  v14 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v15 = *(_QWORD *)(v12 + 48);
    v16 = (_QWORD *)(v15 + 16 * a3);
    v17 = v16[1];
    v18 = *v16 == v8 && v17 == a2;
    if (v18 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, a2, 0), (result & 1) != 0))
    {
LABEL_21:
      result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }
    else
    {
      v19 = ~v13;
      while (1)
      {
        a3 = (a3 + 1) & v19;
        if (((*(_QWORD *)(v14 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v20 = (_QWORD *)(v15 + 16 * a3);
        v21 = v20[1];
        if (*v20 != v8 || v21 != a2)
        {
          result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, a2, 0);
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v23 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v24 = (uint64_t *)(*(_QWORD *)(v23 + 48) + 16 * a3);
  *v24 = v8;
  v24[1] = a2;
  v25 = *(_QWORD *)(v23 + 16);
  v26 = __OFADD__(v25, 1);
  v27 = v25 + 1;
  if (v26)
    __break(1u);
  else
    *(_QWORD *)(v23 + 16) = v27;
  return result;
}

id sub_1000A0FE0(id result, unint64_t a2, char a3)
{
  Swift::Int v3;
  uint64_t *v4;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Swift::Int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  Swift::Int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[9];

  v4 = (uint64_t *)v3;
  v6 = result;
  v7 = *(_QWORD *)(*(_QWORD *)v3 + 16);
  v8 = *(_QWORD *)(*(_QWORD *)v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_22;
  v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1000A07D4(v9);
  }
  else
  {
    if (v8 > v7)
    {
      result = sub_1000A15B0();
LABEL_22:
      v30 = *v4;
      *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      *(_QWORD *)(*(_QWORD *)(v30 + 48) + 8 * a2) = v6;
      v31 = *(_QWORD *)(v30 + 16);
      v32 = __OFADD__(v31, 1);
      v33 = v31 + 1;
      if (!v32)
      {
        *(_QWORD *)(v30 + 16) = v33;
        return result;
      }
      __break(1u);
      goto LABEL_25;
    }
    sub_1000A1C28(v9);
  }
  v10 = *(_QWORD *)v3;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v13 = v12;
  Hasher.init(_seed:)(v35);
  String.hash(into:)(v35, v11, v13);
  v3 = Hasher._finalize()();
  result = (id)swift_bridgeObjectRelease(v13);
  v14 = -1 << *(_BYTE *)(v10 + 32);
  a2 = v3 & ~v14;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
    goto LABEL_22;
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * a2));
  v3 = v16;
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  if (v15 == v17 && v3 == v18)
  {
LABEL_25:
    swift_bridgeObjectRelease_n(v3, 2);
    goto LABEL_26;
  }
  v20 = v18;
  v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v3, v17, v18, 0);
  swift_bridgeObjectRelease(v3);
  result = (id)swift_bridgeObjectRelease(v20);
  if ((v21 & 1) == 0)
  {
    v22 = ~v14;
    do
    {
      a2 = (a2 + 1) & v22;
      if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
        goto LABEL_22;
      v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * a2));
      v3 = v24;
      v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
      if (v23 == v25 && v3 == v26)
        goto LABEL_25;
      v28 = v26;
      v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v3, v25, v26, 0);
      swift_bridgeObjectRelease(v3);
      result = (id)swift_bridgeObjectRelease(v28);
    }
    while ((v29 & 1) == 0);
  }
LABEL_26:
  type metadata accessor for PKContactField(0);
  result = (id)ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v34);
  __break(1u);
  return result;
}

uint64_t sub_1000A120C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;

  v4 = a3;
  v5 = a2;
  v35 = a1;
  v6 = type metadata accessor for IndexPath(0, a2, a3);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(*v3 + 16);
  v14 = *(_QWORD *)(*v3 + 24);
  v34 = v3;
  if (v14 > v13 && (v4 & 1) != 0)
    goto LABEL_12;
  v15 = v13 + 1;
  if ((v4 & 1) != 0)
  {
    sub_1000A0AE4(v15, v9, v10);
  }
  else
  {
    if (v14 > v13)
    {
      sub_1000A1758(v15, v9, v10);
      goto LABEL_12;
    }
    sub_1000A1F04(v15, v9, v10);
  }
  v17 = *v3;
  v18 = *(_QWORD *)(*v3 + 40);
  v19 = sub_10009FE90((unint64_t *)&qword_1000ED600, (uint64_t)&protocol conformance descriptor for IndexPath, v16);
  v20 = dispatch thunk of Hashable._rawHashValue(seed:)(v18, v6, v19);
  v21 = -1 << *(_BYTE *)(v17 + 32);
  v5 = v20 & ~v21;
  if (((*(_QWORD *)(v17 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v22 = ~v21;
    v23 = *(_QWORD *)(v7 + 72);
    v24 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v24(v12, *(_QWORD *)(v17 + 48) + v23 * v5, v6);
      v26 = sub_10009FE90((unint64_t *)&qword_1000ECC90, (uint64_t)&protocol conformance descriptor for IndexPath, v25);
      v27 = dispatch thunk of static Equatable.== infix(_:_:)(v12, v35, v6, v26);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      if ((v27 & 1) != 0)
        goto LABEL_15;
      v5 = (v5 + 1) & v22;
    }
    while (((*(_QWORD *)(v17 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
LABEL_12:
  v28 = v35;
  v29 = *v34;
  *(_QWORD *)(*v34 + 8 * (v5 >> 6) + 56) |= 1 << v5;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v29 + 48) + *(_QWORD *)(v7 + 72) * v5, v28, v6);
  v31 = *(_QWORD *)(v29 + 16);
  v32 = __OFADD__(v31, 1);
  v33 = v31 + 1;
  if (!v32)
  {
    *(_QWORD *)(v29 + 16) = v33;
    return result;
  }
  __break(1u);
LABEL_15:
  result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v6);
  __break(1u);
  return result;
}

void *sub_1000A1400()
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
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_100007D40(&qword_1000F0A50);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain(v18);
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1000A15B0()
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
  sub_100007D40(&qword_1000F0A58);
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

void *sub_1000A1758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *result;
  uint64_t v14;
  unint64_t v15;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t *v29;

  v4 = v3;
  v5 = type metadata accessor for IndexPath(0, a2, a3);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007D40(&qword_1000F0A30);
  v10 = *v3;
  v11 = static _SetStorage.copy(original:)(*v3);
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
  {
    result = (void *)swift_release(v10);
LABEL_30:
    *v4 = v12;
    return result;
  }
  v29 = v4;
  result = (void *)(v11 + 56);
  v14 = v10 + 56;
  v15 = (unint64_t)((1 << *(_BYTE *)(v12 + 32)) + 63) >> 6;
  if (v12 != v10 || (unint64_t)result >= v10 + 56 + 8 * v15)
    result = memmove(result, (const void *)(v10 + 56), 8 * v15);
  v17 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v10 + 16);
  v18 = 1 << *(_BYTE *)(v10 + 32);
  v19 = -1;
  if (v18 < 64)
    v19 = ~(-1 << v18);
  v20 = v19 & *(_QWORD *)(v10 + 56);
  v21 = (unint64_t)(v18 + 63) >> 6;
  while (1)
  {
    if (v20)
    {
      v22 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      v23 = v22 | (v17 << 6);
      goto LABEL_12;
    }
    v25 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v25 >= v21)
      goto LABEL_28;
    v26 = *(_QWORD *)(v14 + 8 * v25);
    ++v17;
    if (!v26)
    {
      v17 = v25 + 1;
      if (v25 + 1 >= v21)
        goto LABEL_28;
      v26 = *(_QWORD *)(v14 + 8 * v17);
      if (!v26)
      {
        v17 = v25 + 2;
        if (v25 + 2 >= v21)
          goto LABEL_28;
        v26 = *(_QWORD *)(v14 + 8 * v17);
        if (!v26)
          break;
      }
    }
LABEL_27:
    v20 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v17 << 6);
LABEL_12:
    v24 = *(_QWORD *)(v6 + 72) * v23;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v9, *(_QWORD *)(v10 + 48) + v24, v5);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v12 + 48) + v24, v9, v5);
  }
  v27 = v25 + 3;
  if (v27 >= v21)
  {
LABEL_28:
    result = (void *)swift_release(v10);
    v4 = v29;
    goto LABEL_30;
  }
  v26 = *(_QWORD *)(v14 + 8 * v27);
  if (v26)
  {
    v17 = v27;
    goto LABEL_27;
  }
  while (1)
  {
    v17 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v17 >= v21)
      goto LABEL_28;
    v26 = *(_QWORD *)(v14 + 8 * v17);
    ++v27;
    if (v26)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

Swift::Int sub_1000A197C(uint64_t a1)
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
  uint64_t v11;
  Swift::Int result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  int64_t v32;
  _QWORD v33[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100007D40(&qword_1000F0A50);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v31 = v2;
  v32 = (unint64_t)(v7 + 63) >> 6;
  v11 = v5 + 56;
  result = swift_retain(v3);
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_27;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v13;
    if (!v19)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v32)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v13);
      if (!v19)
      {
        v13 = v18 + 2;
        if (v18 + 2 >= v32)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v13);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
    v22 = *v21;
    v23 = v21[1];
    Hasher.init(_seed:)(v33);
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v33, v22, v23);
    result = Hasher._finalize()();
    v24 = -1 << *(_BYTE *)(v6 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v26);
      }
      while (v30 == -1);
      v14 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
    *v15 = v22;
    v15[1] = v23;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v31;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v13 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v13 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v13 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v13);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1000A1C28(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  Swift::Int v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int64_t v34;
  _QWORD v35[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100007D40(&qword_1000F0A58);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v32 = v2;
  v33 = v3 + 56;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v3 + 56);
  v34 = (unint64_t)(v7 + 63) >> 6;
  v10 = v5 + 56;
  result = swift_retain(v3);
  v12 = 0;
  while (1)
  {
    if (v9)
    {
      v14 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_27;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v16 >= v34)
      goto LABEL_36;
    v17 = *(_QWORD *)(v33 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v34)
        goto LABEL_36;
      v17 = *(_QWORD *)(v33 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v34)
          goto LABEL_36;
        v17 = *(_QWORD *)(v33 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_26:
    v9 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_27:
    v19 = *(void **)(*(_QWORD *)(v3 + 48) + 8 * v15);
    v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
    v22 = v21;
    Hasher.init(_seed:)(v35);
    v23 = v19;
    String.hash(into:)(v35, v20, v22);
    v24 = Hasher._finalize()();
    result = swift_bridgeObjectRelease(v22);
    v25 = -1 << *(_BYTE *)(v6 + 32);
    v26 = v24 & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v10 + 8 * (v26 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v10 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v30 = v27 == v29;
        if (v27 == v29)
          v27 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v10 + 8 * v27);
      }
      while (v31 == -1);
      v13 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v13) = v23;
    ++*(_QWORD *)(v6 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v34)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v32;
    goto LABEL_38;
  }
  v17 = *(_QWORD *)(v33 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_26;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v34)
      goto LABEL_36;
    v17 = *(_QWORD *)(v33 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

void sub_1000A1F04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  __n128 v19;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int64_t v42;

  v4 = v3;
  v6 = type metadata accessor for IndexPath(0, a2, a3);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v4;
  if (*(_QWORD *)(*v4 + 24) > a1)
    a1 = *(_QWORD *)(*v4 + 24);
  sub_100007D40(&qword_1000F0A30);
  v12 = static _SetStorage.resize(original:capacity:move:)(v11, a1, 0);
  v13 = v12;
  if (!*(_QWORD *)(v11 + 16))
  {
    swift_release(v11);
LABEL_37:
    *v4 = v13;
    return;
  }
  v14 = 1 << *(_BYTE *)(v11 + 32);
  v15 = *(_QWORD *)(v11 + 56);
  v40 = v4;
  v41 = v11 + 56;
  if (v14 < 64)
    v16 = ~(-1 << v14);
  else
    v16 = -1;
  v17 = v16 & v15;
  v42 = (unint64_t)(v14 + 63) >> 6;
  v18 = v12 + 56;
  v19 = swift_retain(v11);
  v20 = 0;
  while (1)
  {
    if (v17)
    {
      v22 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v23 = v22 | (v20 << 6);
      goto LABEL_26;
    }
    v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v24 >= v42)
      goto LABEL_35;
    v25 = *(_QWORD *)(v41 + 8 * v24);
    ++v20;
    if (!v25)
    {
      v20 = v24 + 1;
      if (v24 + 1 >= v42)
        goto LABEL_35;
      v25 = *(_QWORD *)(v41 + 8 * v20);
      if (!v25)
      {
        v20 = v24 + 2;
        if (v24 + 2 >= v42)
          goto LABEL_35;
        v25 = *(_QWORD *)(v41 + 8 * v20);
        if (!v25)
          break;
      }
    }
LABEL_25:
    v17 = (v25 - 1) & v25;
    v23 = __clz(__rbit64(v25)) + (v20 << 6);
LABEL_26:
    v27 = *(_QWORD *)(v7 + 72);
    (*(void (**)(char *, unint64_t, uint64_t, __n128))(v7 + 16))(v10, *(_QWORD *)(v11 + 48) + v27 * v23, v6, v19);
    v28 = *(_QWORD *)(v13 + 40);
    v30 = sub_10009FE90((unint64_t *)&qword_1000ED600, (uint64_t)&protocol conformance descriptor for IndexPath, v29);
    v31 = dispatch thunk of Hashable._rawHashValue(seed:)(v28, v6, v30);
    v32 = -1 << *(_BYTE *)(v13 + 32);
    v33 = v31 & ~v32;
    v34 = v33 >> 6;
    if (((-1 << v33) & ~*(_QWORD *)(v18 + 8 * (v33 >> 6))) != 0)
    {
      v21 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v18 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v37 = v34 == v36;
        if (v34 == v36)
          v34 = 0;
        v35 |= v37;
        v38 = *(_QWORD *)(v18 + 8 * v34);
      }
      while (v38 == -1);
      v21 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(_QWORD *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(*(_QWORD *)(v13 + 48) + v21 * v27, v10, v6);
    ++*(_QWORD *)(v13 + 16);
  }
  v26 = v24 + 3;
  if (v26 >= v42)
  {
LABEL_35:
    swift_release_n(v11, 2);
    v4 = v40;
    goto LABEL_37;
  }
  v25 = *(_QWORD *)(v41 + 8 * v26);
  if (v25)
  {
    v20 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v20 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v20 >= v42)
      goto LABEL_35;
    v25 = *(_QWORD *)(v41 + 8 * v20);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_39:
  __break(1u);
}

uint64_t sub_1000A2224(char a1, int64_t a2, char a3, _QWORD *a4)
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
    v10 = sub_100007D40(&qword_1000F0A40);
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
    sub_100007D40(&qword_1000F0A48);
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

uint64_t sub_1000A23AC(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100007D40(&qword_1000F0A38);
  v11 = *(_QWORD *)(sub_100007D40(&qword_1000EDF20) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_34;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = *(_QWORD *)(sub_100007D40(&qword_1000EDF20) - 8);
  v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v20 = (char *)v15 + v19;
  v21 = (char *)a4 + v19;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v20 >= &v21[*(_QWORD *)(v18 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v20, v21);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v20, v21);
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v22 = *(_QWORD *)(v18 + 72) * v8;
  v23 = &v20[v22];
  v24 = (unint64_t)&v21[v22];
  if (v21 >= v23 || (unint64_t)v20 >= v24)
  {
    swift_arrayInitWithCopy(v20);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000A2594(char a1, int64_t a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  size_t v18;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    v17 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100007D40(&qword_1000ED5E8);
  v13 = *(_QWORD *)(type metadata accessor for IndexPath(0, v11, v12) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = *(unsigned __int8 *)(v13 + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = (_QWORD *)swift_allocObject(v10, v16 + v14 * v9, v15 | 7);
  v18 = j__malloc_size(v17);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v18 - v16 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v17[2] = v8;
  v17[3] = 2 * ((uint64_t)(v18 - v16) / v14);
LABEL_19:
  v20 = *(_QWORD *)(type metadata accessor for IndexPath(0, a2, a3) - 8);
  v21 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v22 = (char *)v17 + v21;
  v23 = (char *)a4 + v21;
  if ((a1 & 1) != 0)
  {
    if (v17 < a4 || v22 >= &v23[*(_QWORD *)(v20 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v22, v23);
    }
    else if (v17 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v22, v23);
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v24 = *(_QWORD *)(v20 + 72) * v8;
  v25 = &v22[v24];
  v26 = (unint64_t)&v23[v24];
  if (v23 >= v25 || (unint64_t)v22 >= v26)
  {
    swift_arrayInitWithCopy(v22);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v17;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000A2774(char a1, int64_t a2, char a3, char *a4)
{
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100007D40(&qword_1000ED618);
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
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

Swift::Int sub_1000A28DC(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Int result;
  _QWORD v10[2];

  v4 = *(_QWORD *)(type metadata accessor for IndexPath(0, a2, a3) - 8);
  v5 = (_QWORD *)*a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v5 = (_QWORD *)sub_1000A5D80(v5);
  v8 = v5[2];
  v10[0] = (char *)v5 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v10[1] = v8;
  result = sub_1000A2E70(v10, v6, v7);
  *a1 = v5;
  return result;
}

_QWORD *sub_1000A295C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return _swiftEmptyArrayStorage;
  v3 = sub_100007D40(&qword_1000ED618);
  v4 = (_QWORD *)swift_allocObject(v3, 16 * v1 + 32, 7);
  v5 = j__malloc_size(v4);
  v6 = v5 - 32;
  if (v5 < 32)
    v6 = v5 - 17;
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  v7 = sub_1000A4EB8((uint64_t)&v10, v4 + 4, v1, a1);
  v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_10004F0CC(v8);
  if (v7 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v4;
}

_QWORD *sub_1000A2A40(uint64_t a1)
{
  return sub_1000A2C78(a1, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_10009CDA8);
}

_QWORD *sub_1000A2A4C(uint64_t a1)
{
  return sub_1000A2D84(a1, (uint64_t (*)(uint64_t *, _QWORD *, uint64_t, uint64_t))sub_1000A50B4);
}

_QWORD *sub_1000A2A58(uint64_t a1)
{
  return sub_1000A2C78(a1, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_10009CDCC);
}

_QWORD *sub_1000A2A64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *result;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return _swiftEmptyArrayStorage;
  v3 = sub_100007D40(&qword_1000ED5E8);
  v6 = *(_QWORD *)(type metadata accessor for IndexPath(0, v4, v5) - 8);
  v7 = *(_QWORD *)(v6 + 72);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v9 = (v8 + 32) & ~v8;
  v10 = (_QWORD *)swift_allocObject(v3, v9 + v7 * v1, v8 | 7);
  result = (_QWORD *)j__malloc_size(v10);
  if (v7)
  {
    if ((_QWORD *)((char *)result - v9) != (_QWORD *)0x8000000000000000 || v7 != -1)
    {
      v10[2] = v1;
      v10[3] = 2 * (((uint64_t)result - v9) / v7);
      swift_bridgeObjectRetain(a1);
      v13 = sub_1000A52AC(&v14, (uint64_t)v10 + v9, v1, a1);
      sub_10004F0CC(v14);
      if (v13 == v1)
        return v10;
      __break(1u);
      return _swiftEmptyArrayStorage;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

_QWORD *sub_1000A2B5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *result;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return _swiftEmptyArrayStorage;
  v3 = sub_100007D40(&qword_1000ED5E8);
  v6 = *(_QWORD *)(type metadata accessor for IndexPath(0, v4, v5) - 8);
  v7 = *(_QWORD *)(v6 + 72);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v9 = (v8 + 32) & ~v8;
  v10 = (_QWORD *)swift_allocObject(v3, v9 + v7 * v1, v8 | 7);
  result = (_QWORD *)j__malloc_size(v10);
  if (v7)
  {
    if ((_QWORD *)((char *)result - v9) != (_QWORD *)0x8000000000000000 || v7 != -1)
    {
      v10[2] = v1;
      v10[3] = 2 * (((uint64_t)result - v9) / v7);
      swift_bridgeObjectRetain(a1);
      v13 = sub_1000A5840(&v14, (uint64_t)v10 + v9, v1, a1);
      sub_10004F0CC(v14);
      if (v13 == v1)
        return v10;
      __break(1u);
      return _swiftEmptyArrayStorage;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

_QWORD *sub_1000A2C54(uint64_t a1)
{
  return sub_1000A2C78(a1, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_10009CFF8);
}

_QWORD *sub_1000A2C60(uint64_t a1)
{
  return sub_1000A2C78(a1, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_10009D01C);
}

_QWORD *sub_1000A2C6C(uint64_t a1)
{
  return sub_1000A2C78(a1, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_10009D040);
}

_QWORD *sub_1000A2C78(uint64_t a1, uint64_t (*a2)(_QWORD *, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(_QWORD *, uint64_t, uint64_t);
  uint64_t v11;

  if ((unint64_t)a1 >> 62)
    goto LABEL_10;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return _swiftEmptyArrayStorage;
  while (1)
  {
    if (v4 <= 0)
    {
      v6 = _swiftEmptyArrayStorage;
    }
    else
    {
      v5 = sub_100007D40((uint64_t *)&unk_1000ED490);
      v6 = (_QWORD *)swift_allocObject(v5, 8 * v4 + 32, 7);
      v7 = j__malloc_size(v6);
      v8 = v7 - 32;
      if (v7 < 32)
        v8 = v7 - 25;
      v6[2] = v4;
      v6[3] = (2 * (v8 >> 3)) | 1;
    }
    swift_bridgeObjectRetain(a1);
    v9 = a2(v6 + 4, v4, a1);
    a2 = v10;
    swift_bridgeObjectRelease(v9);
    if (a2 == (uint64_t (*)(_QWORD *, uint64_t, uint64_t))v4)
      break;
    __break(1u);
LABEL_10:
    if (a1 < 0)
      v11 = a1;
    else
      v11 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v4 = _CocoaArrayWrapper.endIndex.getter(v11);
    swift_bridgeObjectRelease(a1);
    if (!v4)
      return _swiftEmptyArrayStorage;
  }
  return v6;
}

_QWORD *sub_1000A2D78(uint64_t a1)
{
  return sub_1000A2D84(a1, (uint64_t (*)(uint64_t *, _QWORD *, uint64_t, uint64_t))sub_1000A5B88);
}

_QWORD *sub_1000A2D84(uint64_t a1, uint64_t (*a2)(uint64_t *, _QWORD *, uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v5;
  _QWORD *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return _swiftEmptyArrayStorage;
  v5 = sub_100007D40((uint64_t *)&unk_1000ED490);
  v6 = (_QWORD *)swift_allocObject(v5, 8 * v2 + 32, 7);
  v7 = j__malloc_size(v6);
  v8 = v7 - 32;
  if (v7 < 32)
    v8 = v7 - 25;
  v6[2] = v2;
  v6[3] = (2 * (v8 >> 3)) | 1;
  v9 = a2(&v12, v6 + 4, v2, a1);
  v10 = v12;
  swift_bridgeObjectRetain(a1);
  sub_10004F0CC(v10);
  if (v9 != v2)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v6;
}

Swift::Int sub_1000A2E70(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  Swift::Int v18;
  Swift::Int result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  Swift::Int v25;
  char *v26;
  unint64_t v27;
  Swift::Int v28;
  Swift::Int v29;
  char *v30;
  uint64_t v31;
  Swift::Int v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  void (*v40)(char *, uint64_t);
  char *v41;
  Swift::Int v42;
  char *v43;
  Swift::Int v44;
  Swift::Int v45;
  char *v46;
  uint64_t v47;
  char *v48;
  int v49;
  Swift::Int v50;
  uint64_t v51;
  uint64_t v52;
  Swift::Int v53;
  Swift::Int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  Swift::Int v62;
  uint64_t v63;
  uint64_t v64;
  Swift::Int v65;
  Swift::Int v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  void (*v71)(char *, uint64_t, uint64_t);
  uint64_t v72;
  _QWORD *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t);
  uint64_t v78;
  char *v79;
  char *v80;
  void (*v81)(char *, char *, uint64_t);
  uint64_t v82;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v84;
  unint64_t v85;
  char *v86;
  char *v87;
  Swift::Int v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  BOOL v100;
  unint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  BOOL v110;
  uint64_t v111;
  char v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  BOOL v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  char *v129;
  char *v130;
  char *v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  char *v135;
  unint64_t v136;
  char *v137;
  unint64_t v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  char *v142;
  unint64_t v143;
  char *v144;
  _QWORD *v145;
  uint64_t v146;
  uint64_t v147;
  _QWORD *v148;
  Swift::Int v149;
  char *v150;
  Swift::Int v151;
  char *v152;
  Swift::Int v153;
  unint64_t v154;
  char *v155;
  uint64_t v156;
  void (*v157)(char *, char *, uint64_t);
  Swift::Int v158;
  char *v159;
  char *v160;
  _QWORD *v161;
  Swift::Int v162;
  uint64_t v163;
  char *v164;
  Swift::Int v165;
  uint64_t v166;

  v4 = v3;
  v6 = type metadata accessor for IndexPath(0, a2, a3);
  v166 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6, v7);
  v152 = (char *)&v146 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8, v10);
  v164 = (char *)&v146 - v12;
  v14 = __chkstk_darwin(v11, v13);
  v159 = (char *)&v146 - v15;
  __chkstk_darwin(v14, v16);
  v160 = (char *)&v146 - v17;
  v18 = a1[1];
  result = _minimumMergeRunLength(_:)(v18);
  if (result >= v18)
  {
    if (v18 < 0)
      goto LABEL_143;
    if (v18)
      return sub_1000A38CC(0, v18, 1, a1);
    return result;
  }
  if (v18 >= 0)
    v20 = v18;
  else
    v20 = v18 + 1;
  if (v18 < -1)
    goto LABEL_151;
  v163 = v6;
  v149 = result;
  if (v18 < 2)
  {
    v24 = _swiftEmptyArrayStorage;
    v154 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v166 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v166 + 80));
    if (v18 != 1)
    {
      v27 = _swiftEmptyArrayStorage[2];
      v26 = (char *)_swiftEmptyArrayStorage;
LABEL_105:
      v148 = v24;
      if (v27 >= 2)
      {
        v137 = (char *)*a1;
        do
        {
          v138 = v27 - 2;
          if (v27 < 2)
            goto LABEL_138;
          if (!v137)
            goto LABEL_150;
          v130 = v26;
          v139 = v26 + 32;
          v140 = *(_QWORD *)&v26[16 * v138 + 32];
          v141 = *(_QWORD *)&v26[16 * v27 + 24];
          sub_1000A3B3C((unint64_t)&v137[*(_QWORD *)(v166 + 72) * v140], (unint64_t)&v137[*(_QWORD *)(v166 + 72) * *(_QWORD *)&v139[16 * v27 - 16]], (unint64_t)&v137[*(_QWORD *)(v166 + 72) * v141], v154);
          if (v4)
            goto LABEL_117;
          if (v141 < v140)
            goto LABEL_139;
          if ((swift_isUniquelyReferenced_nonNull_native(v130) & 1) == 0)
            v130 = sub_1000A4308((uint64_t)v130);
          if (v138 >= *((_QWORD *)v130 + 2))
            goto LABEL_140;
          v142 = &v130[16 * v138 + 32];
          *(_QWORD *)v142 = v140;
          *((_QWORD *)v142 + 1) = v141;
          v143 = *((_QWORD *)v130 + 2);
          if (v27 > v143)
            goto LABEL_141;
          v26 = v130;
          memmove(&v130[16 * v27 + 16], &v130[16 * v27 + 32], 16 * (v143 - v27));
          *((_QWORD *)v130 + 2) = v143 - 1;
          v27 = v143 - 1;
        }
        while (v143 > 2);
      }
      v144 = v26;
LABEL_119:
      swift_bridgeObjectRelease(v144);
      v145 = v148;
      v148[2] = 0;
      return swift_bridgeObjectRelease(v145);
    }
    v148 = _swiftEmptyArrayStorage;
  }
  else
  {
    v21 = v20 >> 1;
    v22 = static Array._allocateBufferUninitialized(minimumCapacity:)(v20 >> 1, v6);
    *(_QWORD *)(v22 + 16) = v21;
    v23 = *(unsigned __int8 *)(v166 + 80);
    v148 = (_QWORD *)v22;
    v154 = v22 + ((v23 + 32) & ~v23);
  }
  v25 = 0;
  v26 = (char *)_swiftEmptyArrayStorage;
  v161 = a1;
  while (1)
  {
    v28 = v25;
    v29 = v25 + 1;
    v153 = v25;
    if (v25 + 1 >= v18)
    {
      v42 = v25 + 1;
    }
    else
    {
      v30 = (char *)*a1;
      v31 = v166;
      v32 = *(_QWORD *)(v166 + 72);
      v155 = v30;
      v158 = v18;
      v33 = *(void (**)(char *, char *, uint64_t))(v166 + 16);
      v34 = v163;
      v33(v160, &v30[v32 * v29], v163);
      v35 = &v30[v32 * v28];
      v36 = v159;
      v33(v159, v35, v34);
      v38 = sub_10009FE90(&qword_1000F0A20, (uint64_t)&protocol conformance descriptor for IndexPath, v37);
      v39 = v160;
      v162 = v38;
      LODWORD(v157) = dispatch thunk of static Comparable.< infix(_:_:)(v160, v36, v34, v38);
      v40 = *(void (**)(char *, uint64_t))(v31 + 8);
      v41 = v36;
      v28 = v153;
      v40(v41, v34);
      v40(v39, v34);
      v42 = v28 + 2;
      v165 = v32;
      if (v28 + 2 >= v158)
      {
        v18 = v158;
        v50 = v32;
      }
      else
      {
        v150 = v26;
        v147 = v4;
        v156 = v32 * v29;
        v43 = v155;
        v44 = v32 * v42;
        while (1)
        {
          v45 = v42;
          v46 = v160;
          v47 = v163;
          v33(v160, &v43[v44], v163);
          v48 = v159;
          v33(v159, &v43[v156], v47);
          v49 = dispatch thunk of static Comparable.< infix(_:_:)(v46, v48, v47, v162);
          v40(v48, v47);
          v40(v46, v47);
          if (((v157 ^ v49) & 1) != 0)
            break;
          v42 = v45 + 1;
          v50 = v165;
          v43 += v165;
          if (v158 == v45 + 1)
          {
            v18 = v158;
            v42 = v158;
            v4 = v147;
            v26 = v150;
            v28 = v153;
            goto LABEL_25;
          }
        }
        v26 = v150;
        v42 = v45;
        v4 = v147;
        v28 = v153;
        v18 = v158;
        v50 = v165;
      }
LABEL_25:
      a1 = v161;
      if ((v157 & 1) != 0)
      {
        if (v42 < v28)
          goto LABEL_144;
        if (v28 < v42)
        {
          v150 = v26;
          v51 = 0;
          v52 = v50 * (v42 - 1);
          v53 = v42 * v50;
          v54 = v28;
          v55 = v28 * v50;
          v162 = v42;
          do
          {
            if (v54 != v42 + v51 - 1)
            {
              if (!v155)
                goto LABEL_149;
              v57 = v4;
              v58 = &v155[v55];
              v59 = &v155[v52];
              v60 = v155;
              v157 = *(void (**)(char *, char *, uint64_t))(v166 + 32);
              v157(v152, &v155[v55], v163);
              if (v55 < v52 || v58 >= &v60[v53])
              {
                v56 = v163;
                swift_arrayInitWithTakeFrontToBack(v58, v59);
              }
              else
              {
                v56 = v163;
                if (v55 != v52)
                  swift_arrayInitWithTakeBackToFront(v58, v59);
              }
              v157(v59, v152, v56);
              v4 = v57;
              a1 = v161;
              v42 = v162;
              v50 = v165;
            }
            ++v54;
            --v51;
            v52 -= v50;
            v53 -= v50;
            v55 += v50;
          }
          while (v54 < v42 + v51);
          v26 = v150;
          v28 = v153;
          v18 = v158;
        }
      }
    }
    v61 = v163;
    if (v42 >= v18)
      goto LABEL_57;
    if (__OFSUB__(v42, v28))
      goto LABEL_142;
    if (v42 - v28 >= v149)
      goto LABEL_57;
    if (__OFADD__(v28, v149))
      goto LABEL_145;
    v62 = v28 + v149 >= v18 ? v18 : v28 + v149;
    if (v62 < v28)
      break;
    if (v42 != v62)
    {
      v150 = v26;
      v151 = v62;
      v147 = v4;
      v63 = *(_QWORD *)(v166 + 72);
      v155 = *(char **)(v166 + 16);
      v156 = v63;
      v64 = v63 * (v42 - 1);
      v65 = v42 * v63;
      do
      {
        v67 = 0;
        v162 = v42;
        v157 = (void (*)(char *, char *, uint64_t))v65;
        v158 = v64;
        while (1)
        {
          v165 = v28;
          v68 = *a1;
          v69 = (char *)(v65 + v67 + *a1);
          v70 = v160;
          v71 = (void (*)(char *, uint64_t, uint64_t))v155;
          ((void (*)(char *, char *, uint64_t))v155)(v160, v69, v61);
          v72 = v64 + v67 + v68;
          v73 = a1;
          v74 = v159;
          v71(v159, v72, v61);
          v76 = sub_10009FE90(&qword_1000F0A20, (uint64_t)&protocol conformance descriptor for IndexPath, v75);
          LOBYTE(v68) = dispatch thunk of static Comparable.< infix(_:_:)(v70, v74, v61, v76);
          v77 = *(void (**)(char *, uint64_t))(v166 + 8);
          v77(v74, v61);
          v77(v70, v61);
          if ((v68 & 1) == 0)
            break;
          v78 = *v73;
          if (!*v73)
            goto LABEL_147;
          v65 = (Swift::Int)v157;
          v64 = v158;
          v79 = (char *)v157 + v78 + v67;
          v80 = (char *)(v78 + v158 + v67);
          v81 = *(void (**)(char *, char *, uint64_t))(v166 + 32);
          v82 = v163;
          v81(v164, v79, v163);
          v61 = v82;
          swift_arrayInitWithTakeFrontToBack(v79, v80);
          v81(v80, v164, v82);
          v67 -= v156;
          v28 = v165 + 1;
          a1 = v161;
          v66 = v162;
          if (v162 == v165 + 1)
            goto LABEL_50;
        }
        v66 = v162;
        v61 = v163;
        a1 = v73;
        v65 = (Swift::Int)v157;
        v64 = v158;
LABEL_50:
        v42 = v66 + 1;
        v64 += v156;
        v65 += v156;
        v28 = v153;
      }
      while (v42 != v151);
      v42 = v151;
      v4 = v147;
      v26 = v150;
    }
LABEL_57:
    if (v42 < v28)
      goto LABEL_137;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v26);
    v162 = v42;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v26 = sub_1000A4058(0, *((_QWORD *)v26 + 2) + 1, 1, v26);
    v85 = *((_QWORD *)v26 + 2);
    v84 = *((_QWORD *)v26 + 3);
    v27 = v85 + 1;
    if (v85 >= v84 >> 1)
      v26 = sub_1000A4058((char *)(v84 > 1), v85 + 1, 1, v26);
    *((_QWORD *)v26 + 2) = v27;
    v86 = v26 + 32;
    v87 = &v26[16 * v85 + 32];
    v88 = v162;
    *(_QWORD *)v87 = v28;
    *((_QWORD *)v87 + 1) = v88;
    if (v85)
    {
      while (1)
      {
        v89 = v27 - 1;
        if (v27 >= 4)
        {
          v94 = &v86[16 * v27];
          v95 = *((_QWORD *)v94 - 8);
          v96 = *((_QWORD *)v94 - 7);
          v100 = __OFSUB__(v96, v95);
          v97 = v96 - v95;
          if (v100)
            goto LABEL_126;
          v99 = *((_QWORD *)v94 - 6);
          v98 = *((_QWORD *)v94 - 5);
          v100 = __OFSUB__(v98, v99);
          v92 = v98 - v99;
          v93 = v100;
          if (v100)
            goto LABEL_127;
          v101 = v27 - 2;
          v102 = &v86[16 * v27 - 32];
          v104 = *(_QWORD *)v102;
          v103 = *((_QWORD *)v102 + 1);
          v100 = __OFSUB__(v103, v104);
          v105 = v103 - v104;
          if (v100)
            goto LABEL_129;
          v100 = __OFADD__(v92, v105);
          v106 = v92 + v105;
          if (v100)
            goto LABEL_132;
          if (v106 >= v97)
          {
            v124 = &v86[16 * v89];
            v126 = *(_QWORD *)v124;
            v125 = *((_QWORD *)v124 + 1);
            v100 = __OFSUB__(v125, v126);
            v127 = v125 - v126;
            if (v100)
              goto LABEL_136;
            v117 = v92 < v127;
            goto LABEL_94;
          }
        }
        else
        {
          if (v27 != 3)
          {
            v118 = *((_QWORD *)v26 + 4);
            v119 = *((_QWORD *)v26 + 5);
            v100 = __OFSUB__(v119, v118);
            v111 = v119 - v118;
            v112 = v100;
            goto LABEL_88;
          }
          v91 = *((_QWORD *)v26 + 4);
          v90 = *((_QWORD *)v26 + 5);
          v100 = __OFSUB__(v90, v91);
          v92 = v90 - v91;
          v93 = v100;
        }
        if ((v93 & 1) != 0)
          goto LABEL_128;
        v101 = v27 - 2;
        v107 = &v86[16 * v27 - 32];
        v109 = *(_QWORD *)v107;
        v108 = *((_QWORD *)v107 + 1);
        v110 = __OFSUB__(v108, v109);
        v111 = v108 - v109;
        v112 = v110;
        if (v110)
          goto LABEL_131;
        v113 = &v86[16 * v89];
        v115 = *(_QWORD *)v113;
        v114 = *((_QWORD *)v113 + 1);
        v100 = __OFSUB__(v114, v115);
        v116 = v114 - v115;
        if (v100)
          goto LABEL_134;
        if (__OFADD__(v111, v116))
          goto LABEL_135;
        if (v111 + v116 >= v92)
        {
          v117 = v92 < v116;
LABEL_94:
          if (v117)
            v89 = v101;
          goto LABEL_96;
        }
LABEL_88:
        if ((v112 & 1) != 0)
          goto LABEL_130;
        v120 = &v86[16 * v89];
        v122 = *(_QWORD *)v120;
        v121 = *((_QWORD *)v120 + 1);
        v100 = __OFSUB__(v121, v122);
        v123 = v121 - v122;
        if (v100)
          goto LABEL_133;
        if (v123 < v111)
          goto LABEL_15;
LABEL_96:
        v128 = v89 - 1;
        if (v89 - 1 >= v27)
        {
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
          goto LABEL_146;
        }
        v129 = (char *)*a1;
        if (!*a1)
          goto LABEL_148;
        v130 = v26;
        v131 = &v86[16 * v128];
        v132 = *(_QWORD *)v131;
        v133 = &v86[16 * v89];
        v134 = *((_QWORD *)v133 + 1);
        sub_1000A3B3C((unint64_t)&v129[*(_QWORD *)(v166 + 72) * *(_QWORD *)v131], (unint64_t)&v129[*(_QWORD *)(v166 + 72) * *(_QWORD *)v133], (unint64_t)&v129[*(_QWORD *)(v166 + 72) * v134], v154);
        if (v4)
        {
LABEL_117:
          v144 = v130;
          goto LABEL_119;
        }
        if (v134 < v132)
          goto LABEL_123;
        if (v89 > *((_QWORD *)v130 + 2))
          goto LABEL_124;
        v135 = v130;
        *(_QWORD *)v131 = v132;
        *(_QWORD *)&v86[16 * v128 + 8] = v134;
        v136 = *((_QWORD *)v130 + 2);
        if (v89 >= v136)
          goto LABEL_125;
        v26 = v135;
        v27 = v136 - 1;
        memmove(&v86[16 * v89], v133 + 16, 16 * (v136 - 1 - v89));
        *((_QWORD *)v26 + 2) = v136 - 1;
        a1 = v161;
        if (v136 <= 2)
          goto LABEL_15;
      }
    }
    v27 = 1;
LABEL_15:
    v18 = a1[1];
    v25 = v162;
    if (v162 >= v18)
    {
      v24 = v148;
      goto LABEL_105;
    }
  }
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  __break(1u);
LABEL_149:
  __break(1u);
LABEL_150:
  __break(1u);
LABEL_151:
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000A38CC(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t, uint64_t);
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  _QWORD *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;

  v34 = a1;
  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v42 = *(_QWORD **)(v7 - 8);
  v9 = __chkstk_darwin(v7, v8);
  v41 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9, v11);
  v38 = (char *)&v32 - v13;
  result = __chkstk_darwin(v12, v14);
  v37 = (char *)&v32 - v16;
  v40 = a3;
  v33 = a2;
  if (a3 != a2)
  {
    v17 = v42[9];
    v35 = (void (*)(char *, uint64_t, uint64_t))v42[2];
    v36 = a4;
    v44 = v17 * (v40 - 1);
    v39 = v17;
    v43 = v17 * v40;
LABEL_5:
    v18 = 0;
    v19 = v34;
    while (1)
    {
      v20 = *a4;
      v21 = v37;
      v22 = v35;
      v35(v37, v43 + v18 + *a4, v7);
      v23 = v38;
      v22(v38, v44 + v18 + v20, v7);
      v25 = sub_10009FE90(&qword_1000F0A20, (uint64_t)&protocol conformance descriptor for IndexPath, v24);
      LOBYTE(v20) = dispatch thunk of static Comparable.< infix(_:_:)(v21, v23, v7, v25);
      v26 = (void (*)(char *, uint64_t))v42[1];
      v27 = v23;
      a4 = v36;
      v26(v27, v7);
      result = ((uint64_t (*)(char *, uint64_t))v26)(v21, v7);
      if ((v20 & 1) == 0)
      {
LABEL_4:
        v44 += v39;
        v43 += v39;
        if (++v40 == v33)
          return result;
        goto LABEL_5;
      }
      v28 = *a4;
      if (!*a4)
        break;
      v29 = v28 + v43 + v18;
      v30 = v28 + v44 + v18;
      v31 = (void (*)(char *, uint64_t, uint64_t))v42[4];
      v31(v41, v29, v7);
      swift_arrayInitWithTakeFrontToBack(v29, v30);
      result = ((uint64_t (*)(uint64_t, char *, uint64_t))v31)(v30, v41, v7);
      v18 -= v39;
      if (v40 == ++v19)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1000A3B3C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v22)(char *, unint64_t, uint64_t);
  char *v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  void (*v30)(char *, uint64_t);
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  void (*v39)(char *, unint64_t, uint64_t);
  unint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  void (*v46)(char *, uint64_t);
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t result;
  uint64_t v52;
  void (*v53)(char *, unint64_t, uint64_t);
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;

  v5 = a3;
  v6 = a2;
  v8 = type metadata accessor for IndexPath(0, a2, a3);
  v10 = __chkstk_darwin(v8, v9);
  v58 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10, v12);
  v57 = (char *)&v52 - v13;
  v59 = v14;
  v15 = *(_QWORD *)(v14 + 72);
  if (!v15)
  {
    __break(1u);
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  if (v6 - a1 == 0x8000000000000000 && v15 == -1)
    goto LABEL_63;
  v16 = v5 - v6;
  if (v5 - v6 == 0x8000000000000000 && v15 == -1)
    goto LABEL_64;
  v17 = (uint64_t)(v6 - a1) / v15;
  v62 = a1;
  v61 = a4;
  v18 = v16 / v15;
  if (v17 >= v16 / v15)
  {
    if ((v18 & 0x8000000000000000) == 0)
    {
      v20 = v18 * v15;
      if (a4 < v6 || v6 + v20 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack(a4, v6);
      }
      else if (a4 != v6)
      {
        swift_arrayInitWithTakeBackToFront(a4, v6);
      }
      v34 = a4 + v20;
      v60 = a4 + v20;
      v62 = v6;
      if (v20 >= 1 && a1 < v6)
      {
        v36 = -v15;
        v53 = *(void (**)(char *, unint64_t, uint64_t))(v59 + 16);
        v54 = a1;
        v55 = a4;
        v56 = -v15;
        do
        {
          v37 = v5 + v36;
          v38 = v57;
          v39 = v53;
          v53(v57, v34 + v36, v8);
          v40 = v6 + v36;
          v41 = v5;
          v42 = v58;
          v39(v58, v40, v8);
          v44 = sub_10009FE90(&qword_1000F0A20, (uint64_t)&protocol conformance descriptor for IndexPath, v43);
          v45 = dispatch thunk of static Comparable.< infix(_:_:)(v38, v42, v8, v44);
          v46 = *(void (**)(char *, uint64_t))(v59 + 8);
          v46(v42, v8);
          v46(v38, v8);
          if ((v45 & 1) != 0)
          {
            if (v41 < v6 || v37 >= v6)
            {
              swift_arrayInitWithTakeFrontToBack(v37, v40);
              v47 = v54;
              v48 = v55;
            }
            else
            {
              v47 = v54;
              v48 = v55;
              if (v41 != v6)
                swift_arrayInitWithTakeBackToFront(v37, v40);
            }
            v36 = v56;
            v62 += v56;
          }
          else
          {
            v49 = v60;
            v50 = v60 + v56;
            v60 += v56;
            if (v41 < v49 || v37 >= v49)
            {
              swift_arrayInitWithTakeFrontToBack(v37, v50);
              v40 = v6;
              v47 = v54;
              v48 = v55;
            }
            else
            {
              v47 = v54;
              v48 = v55;
              if (v41 != v49)
                swift_arrayInitWithTakeBackToFront(v37, v50);
              v40 = v6;
            }
            v36 = v56;
          }
          v34 = v60;
          if (v60 <= v48)
            break;
          v6 = v40;
          v5 = v37;
        }
        while (v40 > v47);
      }
      goto LABEL_61;
    }
  }
  else if ((v17 & 0x8000000000000000) == 0)
  {
    v19 = v17 * v15;
    if (a4 < a1 || a1 + v19 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack(a4, a1);
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront(a4, a1);
    }
    v56 = a4 + v19;
    v60 = a4 + v19;
    if (v19 >= 1 && v6 < v5)
    {
      v22 = *(void (**)(char *, unint64_t, uint64_t))(v59 + 16);
      v23 = v57;
      do
      {
        v24 = a4;
        v25 = v5;
        v22(v23, v6, v8);
        v26 = v58;
        v22(v58, v24, v8);
        v28 = sub_10009FE90(&qword_1000F0A20, (uint64_t)&protocol conformance descriptor for IndexPath, v27);
        v29 = dispatch thunk of static Comparable.< infix(_:_:)(v23, v26, v8, v28);
        v30 = *(void (**)(char *, uint64_t))(v59 + 8);
        v30(v26, v8);
        v30(v23, v8);
        v31 = v62;
        if ((v29 & 1) != 0)
        {
          v32 = v6 + v15;
          if (v62 < v6 || v62 >= v32)
          {
            swift_arrayInitWithTakeFrontToBack(v62, v6);
            v5 = v25;
          }
          else
          {
            v5 = v25;
            if (v62 == v6)
              v31 = v6;
            else
              swift_arrayInitWithTakeBackToFront(v62, v6);
          }
        }
        else
        {
          v33 = v61 + v15;
          if (v62 < v61 || v62 >= v33)
          {
            swift_arrayInitWithTakeFrontToBack(v62, v61);
            v5 = v25;
          }
          else
          {
            v5 = v25;
            if (v62 != v61)
              swift_arrayInitWithTakeBackToFront(v62, v61);
          }
          v61 = v33;
          v32 = v6;
        }
        v62 = v31 + v15;
        a4 = v61;
        if (v61 >= v56)
          break;
        v6 = v32;
      }
      while (v32 < v5);
    }
LABEL_61:
    sub_1000A4154(&v62, &v61, (uint64_t *)&v60);
    return 1;
  }
LABEL_65:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

char *sub_1000A4058(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_100007D40(&qword_1000F0A28);
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

uint64_t sub_1000A4154(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for IndexPath(0, a2, a3);
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack(v3, v4);
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront(v3, v4);
  return result;
}

char *sub_1000A4260(void **a1, const void **a2, _QWORD *a3)
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

char *sub_1000A4308(uint64_t a1)
{
  return sub_1000A4058(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1000A431C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, unint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v5 = v4;
  v8 = type metadata accessor for IndexPath(0, a2, a3);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *v4;
  v14 = *(_QWORD *)(*v4 + 40);
  v16 = sub_10009FE90((unint64_t *)&qword_1000ED600, (uint64_t)&protocol conformance descriptor for IndexPath, v15);
  swift_bridgeObjectRetain(v13);
  v39 = a1;
  v17 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v8, v16);
  v18 = -1 << *(_BYTE *)(v13 + 32);
  v19 = v17 & ~v18;
  if (((*(_QWORD *)(v13 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) != 0)
  {
    v37 = v5;
    v38 = a4;
    v20 = ~v18;
    v21 = *(_QWORD *)(v9 + 72);
    v40 = v9;
    v22 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    while (1)
    {
      v22(v12, *(_QWORD *)(v13 + 48) + v21 * v19, v8);
      v24 = sub_10009FE90((unint64_t *)&qword_1000ECC90, (uint64_t)&protocol conformance descriptor for IndexPath, v23);
      v25 = dispatch thunk of static Equatable.== infix(_:_:)(v12, v39, v8, v24);
      (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v8);
      if ((v25 & 1) != 0)
        break;
      v19 = (v19 + 1) & v20;
      if (((*(_QWORD *)(v13 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
      {
        swift_bridgeObjectRelease(v13);
        v26 = 1;
        a4 = v38;
        v9 = v40;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a4, v26, 1, v8);
      }
    }
    swift_bridgeObjectRelease(v13);
    v27 = v37;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v37);
    v31 = *v27;
    v41 = *v27;
    *v27 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_1000A1758(isUniquelyReferenced_nonNull_native, v29, v30);
      v31 = v41;
    }
    v9 = v40;
    a4 = v38;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v40 + 32))(v38, *(_QWORD *)(v31 + 48) + v21 * v19, v8);
    sub_1000A454C(v19, v32, v33);
    v34 = *v27;
    *v27 = v41;
    swift_bridgeObjectRelease(v34);
    v26 = 0;
  }
  else
  {
    swift_bridgeObjectRelease(v13);
    v26 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a4, v26, 1, v8);
}

uint64_t sub_1000A454C(int64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v27;
  int64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  void (*v36)(char *, unint64_t, uint64_t);
  unint64_t v37;
  uint64_t v38;

  v5 = type metadata accessor for IndexPath(0, a2, a3);
  v38 = *(_QWORD *)(v5 - 8);
  result = __chkstk_darwin(v5, v6);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  v11 = *v3 + 56;
  v12 = -1 << *(_BYTE *)(*v3 + 32);
  v13 = (a1 + 1) & ~v12;
  if (((1 << v13) & *(_QWORD *)(v11 + 8 * (v13 >> 6))) != 0)
  {
    v35 = v3;
    v14 = ~v12;
    swift_retain(v10);
    v15 = _HashTable.previousHole(before:)(a1, v11, v14);
    if ((*(_QWORD *)(v11 + 8 * (v13 >> 6)) & (1 << v13)) != 0)
    {
      v37 = (v15 + 1) & v14;
      v16 = *(_QWORD *)(v38 + 72);
      v36 = *(void (**)(char *, unint64_t, uint64_t))(v38 + 16);
      do
      {
        v17 = v11;
        v18 = v16;
        v19 = v16 * v13;
        v36(v9, *(_QWORD *)(v10 + 48) + v16 * v13, v5);
        v20 = *(_QWORD *)(v10 + 40);
        v22 = sub_10009FE90((unint64_t *)&qword_1000ED600, (uint64_t)&protocol conformance descriptor for IndexPath, v21);
        v23 = dispatch thunk of Hashable._rawHashValue(seed:)(v20, v5, v22);
        (*(void (**)(char *, uint64_t))(v38 + 8))(v9, v5);
        v24 = v23 & v14;
        if (a1 >= (uint64_t)v37)
        {
          if (v24 < v37 || a1 < (uint64_t)v24)
          {
LABEL_4:
            v11 = v17;
            v16 = v18;
            goto LABEL_5;
          }
        }
        else if (v24 < v37 && a1 < (uint64_t)v24)
        {
          goto LABEL_4;
        }
        v27 = *(_QWORD *)(v10 + 48);
        v28 = v18 * a1;
        v29 = v27 + v18 * a1;
        v30 = v27 + v19;
        v11 = v17;
        if (v18 * a1 < v19 || (v16 = v18, v29 >= v30 + v18))
        {
          swift_arrayInitWithTakeFrontToBack(v29, v30);
          goto LABEL_21;
        }
        a1 = v13;
        if (v28 != v19)
        {
          swift_arrayInitWithTakeBackToFront(v29, v30);
LABEL_21:
          v16 = v18;
          a1 = v13;
        }
LABEL_5:
        v13 = (v13 + 1) & v14;
      }
      while (((*(_QWORD *)(v11 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
    }
    *(_QWORD *)(v11 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    result = swift_release(v10);
    v3 = v35;
  }
  else
  {
    *(_QWORD *)(v11 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  v31 = *v3;
  v32 = *(_QWORD *)(*v3 + 16);
  v33 = __OFSUB__(v32, 1);
  v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v31 + 16) = v34;
    ++*(_DWORD *)(v31 + 36);
  }
  return result;
}

uint64_t sub_1000A47DC(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v5)(char *);
  char v6;
  unsigned int v7;
  unint64_t v8;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v5 = (uint64_t (*)(char *))isStackAllocationSafe;
  v6 = *(_BYTE *)(a3 + 32);
  v7 = v6 & 0x3F;
  v8 = (1 << v6) + 63;
  v9 = v8 >> 6;
  v10 = 8 * (v8 >> 6);
  if (v7 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(8 * (v8 >> 6), 8), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe, a2);
    bzero((char *)&v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v10);
    v11 = sub_1000A4958((unint64_t *)((char *)&v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0)), v9, a3, v5);
    v12 = swift_release(a3);
    if (v3)
      swift_willThrow(v12);
  }
  else
  {
    v13 = (void *)swift_slowAlloc(v10, -1);
    bzero(v13, v10);
    v11 = sub_1000A4958((unint64_t *)v13, v9, a3, v5);
    swift_release(a3);
    swift_slowDealloc(v13, -1, -1);
  }
  return v11;
}

uint64_t sub_1000A4958(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *))
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  BOOL v19;
  unint64_t v20;
  int64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t (*v32)(char *);
  uint64_t v33;

  v32 = a4;
  v27 = a2;
  v28 = a1;
  v6 = type metadata accessor for IndexPath(0, a2, a3);
  v7 = *(_QWORD *)(v6 - 8);
  result = __chkstk_darwin(v6, v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = 0;
  v33 = a3;
  v13 = *(_QWORD *)(a3 + 56);
  v29 = 0;
  v30 = a3 + 56;
  v14 = 1 << *(_BYTE *)(a3 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v13;
  v31 = (unint64_t)(v14 + 63) >> 6;
  while (v16)
  {
    v17 = __clz(__rbit64(v16));
    v16 &= v16 - 1;
    v18 = v17 | (v12 << 6);
LABEL_17:
    (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v11, *(_QWORD *)(v33 + 48) + *(_QWORD *)(v7 + 72) * v18, v6);
    v22 = v32(v11);
    if (v4)
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v11, v6);
    v23 = v22;
    result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v11, v6);
    if ((v23 & 1) != 0)
    {
      *(unint64_t *)((char *)v28 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v19 = __OFADD__(v29++, 1);
      if (v19)
        goto LABEL_30;
    }
  }
  v19 = __OFADD__(v12++, 1);
  if (v19)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v12 >= v31)
    goto LABEL_27;
  v20 = *(_QWORD *)(v30 + 8 * v12);
  if (v20)
  {
LABEL_16:
    v16 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v12 << 6);
    goto LABEL_17;
  }
  v21 = v12 + 1;
  if (v12 + 1 >= v31)
    goto LABEL_27;
  v20 = *(_QWORD *)(v30 + 8 * v21);
  if (v20)
    goto LABEL_15;
  v21 = v12 + 2;
  if (v12 + 2 >= v31)
    goto LABEL_27;
  v20 = *(_QWORD *)(v30 + 8 * v21);
  if (v20)
    goto LABEL_15;
  v21 = v12 + 3;
  if (v12 + 3 >= v31)
  {
LABEL_27:
    v24 = v27;
    v25 = v29;
    v26 = v33;
    swift_retain(v33);
    return sub_1000A4BC0(v28, v24, v25, v26);
  }
  v20 = *(_QWORD *)(v30 + 8 * v21);
  if (v20)
  {
LABEL_15:
    v12 = v21;
    goto LABEL_16;
  }
  while (1)
  {
    v12 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v12 >= v31)
      goto LABEL_27;
    v20 = *(_QWORD *)(v30 + 8 * v12);
    ++v21;
    if (v20)
      goto LABEL_16;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1000A4BC0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t result;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v39;
  unint64_t *v40;
  uint64_t v41;
  uint64_t v42;

  v5 = a3;
  v8 = type metadata accessor for IndexPath(0, a2, a3);
  __chkstk_darwin(v8, v9);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v5)
  {
    swift_release(a4);
    return (uint64_t)&_swiftEmptySetSingleton;
  }
  if (*(_QWORD *)(a4 + 16) == v5)
    return a4;
  v42 = v10;
  sub_100007D40(&qword_1000F0A30);
  result = static _SetStorage.allocate(capacity:)(v5);
  v13 = result;
  v40 = a1;
  v41 = a2;
  if (a2 < 1)
    v15 = 0;
  else
    v15 = *a1;
  v16 = 0;
  v17 = result + 56;
  v18 = v42;
  while (1)
  {
    if (v15)
    {
      v19 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v20 = v19 | (v16 << 6);
    }
    else
    {
      v21 = v16 + 1;
      if (__OFADD__(v16, 1))
        goto LABEL_40;
      if (v21 >= v41)
      {
LABEL_37:
        swift_release(a4);
        return v13;
      }
      v22 = v40[v21];
      ++v16;
      if (!v22)
      {
        v16 = v21 + 1;
        if (v21 + 1 >= v41)
          goto LABEL_37;
        v22 = v40[v16];
        if (!v22)
        {
          v16 = v21 + 2;
          if (v21 + 2 >= v41)
            goto LABEL_37;
          v22 = v40[v16];
          if (!v22)
          {
            v23 = v21 + 3;
            if (v23 >= v41)
              goto LABEL_37;
            v22 = v40[v23];
            if (!v22)
            {
              while (1)
              {
                v16 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v16 >= v41)
                  goto LABEL_37;
                v22 = v40[v16];
                ++v23;
                if (v22)
                  goto LABEL_24;
              }
            }
            v16 = v23;
          }
        }
      }
LABEL_24:
      v15 = (v22 - 1) & v22;
      v20 = __clz(__rbit64(v22)) + (v16 << 6);
    }
    v24 = a4;
    v25 = *(_QWORD *)(a4 + 48);
    v26 = *(_QWORD *)(v18 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v18 + 16))(v12, v25 + v26 * v20, v8);
    v27 = *(_QWORD *)(v13 + 40);
    v29 = sub_10009FE90((unint64_t *)&qword_1000ED600, (uint64_t)&protocol conformance descriptor for IndexPath, v28);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v27, v8, v29);
    v30 = -1 << *(_BYTE *)(v13 + 32);
    v31 = result & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(_QWORD *)(v17 + 8 * (v31 >> 6))) != 0)
    {
      v33 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v17 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
      v18 = v42;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v30) >> 6;
      v18 = v42;
      do
      {
        if (++v32 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v36 = v32 == v35;
        if (v32 == v35)
          v32 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v17 + 8 * v32);
      }
      while (v37 == -1);
      v33 = __clz(__rbit64(~v37)) + (v32 << 6);
    }
    *(_QWORD *)(v17 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v18 + 32))(*(_QWORD *)(v13 + 48) + v33 * v26, v12, v8);
    ++*(_QWORD *)(v13 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    a4 = v24;
    if (!v5)
      goto LABEL_37;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1000A4EB8(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain(v21);
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain(v21);
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1000A50B4(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = v20;
    if (v13 == v10)
    {
      swift_retain(v20);
      goto LABEL_38;
    }
    ++v11;
    result = swift_retain(v20);
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1000A52AC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  int64_t v30;
  unint64_t v31;
  int64_t v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;

  v8 = sub_100007D40(&qword_1000ECC88);
  __chkstk_darwin(v8, v9);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for IndexPath(0, v12, v13);
  v45 = *(_QWORD *)(v14 - 8);
  result = __chkstk_darwin(v14, v15);
  v44 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = a4;
  v19 = a4 + 64;
  v18 = *(_QWORD *)(a4 + 64);
  v20 = -1 << *(_BYTE *)(a4 + 32);
  v39 = a1;
  v40 = v20;
  v21 = -v20;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  else
    v22 = -1;
  v23 = v22 & v18;
  if (!a2)
  {
    v24 = 0;
    v25 = 0;
LABEL_39:
    v35 = v39;
    v36 = ~v40;
    *v39 = v46;
    v35[1] = v19;
    v35[2] = v36;
    v35[3] = v24;
    v35[4] = v23;
    return v25;
  }
  if (!a3)
  {
    v24 = 0;
    v25 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v24 = 0;
  v25 = 0;
  v41 = a4 + 64;
  v42 = (unint64_t)(63 - v40) >> 6;
  v38 = v42 - 1;
  v43 = a3;
  v26 = v44;
  v27 = v45;
  if (!v23)
    goto LABEL_9;
LABEL_8:
  v28 = __clz(__rbit64(v23));
  v23 &= v23 - 1;
  v29 = v28 | (v24 << 6);
  while (1)
  {
    v33 = *(_QWORD *)(v27 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v27 + 16))(v11, *(_QWORD *)(v46 + 48) + v33 * v29, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v11, 0, 1, v14);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v11, 1, v14) == 1)
    {
      v19 = v41;
      goto LABEL_38;
    }
    ++v25;
    v34 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
    v34(v26, v11, v14);
    result = ((uint64_t (*)(uint64_t, char *, uint64_t))v34)(a2, v26, v14);
    if (v25 == v43)
    {
      v25 = v43;
      v19 = v41;
      goto LABEL_39;
    }
    a2 += v33;
    v27 = v45;
    if (v23)
      goto LABEL_8;
LABEL_9:
    v30 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    v19 = v41;
    if (v30 >= v42)
      goto LABEL_37;
    v31 = *(_QWORD *)(v41 + 8 * v30);
    if (!v31)
    {
      v32 = v24 + 2;
      ++v24;
      if (v30 + 1 >= v42)
        goto LABEL_37;
      v31 = *(_QWORD *)(v41 + 8 * v32);
      if (v31)
        goto LABEL_14;
      v24 = v30 + 1;
      if (v30 + 2 >= v42)
        goto LABEL_37;
      v31 = *(_QWORD *)(v41 + 8 * (v30 + 2));
      if (v31)
      {
        v30 += 2;
      }
      else
      {
        v24 = v30 + 2;
        if (v30 + 3 >= v42)
          goto LABEL_37;
        v31 = *(_QWORD *)(v41 + 8 * (v30 + 3));
        if (!v31)
        {
          v32 = v30 + 4;
          v24 = v30 + 3;
          if (v30 + 4 < v42)
          {
            v31 = *(_QWORD *)(v41 + 8 * v32);
            if (!v31)
            {
              while (1)
              {
                v30 = v32 + 1;
                if (__OFADD__(v32, 1))
                  goto LABEL_42;
                if (v30 >= v42)
                {
                  v24 = v38;
                  goto LABEL_37;
                }
                v31 = *(_QWORD *)(v41 + 8 * v30);
                ++v32;
                if (v31)
                  goto LABEL_21;
              }
            }
LABEL_14:
            v30 = v32;
            goto LABEL_21;
          }
LABEL_37:
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v11, 1, 1, v14);
          v23 = 0;
LABEL_38:
          sub_100020F10((uint64_t)v11);
          goto LABEL_39;
        }
        v30 += 3;
      }
    }
LABEL_21:
    v23 = (v31 - 1) & v31;
    v29 = __clz(__rbit64(v31)) + (v30 << 6);
    v24 = v30;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

_QWORD *sub_1000A55F4(_QWORD *result, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _OWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v5 = a4 + 64;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v7 = ~(-1 << -(char)v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v11 = 0;
    v12 = 0;
LABEL_37:
    *result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (_QWORD *)v12;
  }
  if (!a3)
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_37;
  }
  if (a3 < 0)
    goto LABEL_39;
  v10 = a2;
  v23 = -1 << *(_BYTE *)(a4 + 32);
  v24 = result;
  v11 = 0;
  v12 = 0;
  v25 = (unint64_t)(63 - v6) >> 6;
  if (!v8)
    goto LABEL_9;
LABEL_8:
  v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  v14 = v13 | (v11 << 6);
  while (1)
  {
    ++v12;
    v18 = (uint64_t *)(*(_QWORD *)(a4 + 48) + 16 * v14);
    v20 = *v18;
    v19 = v18[1];
    sub_100009C74(*(_QWORD *)(a4 + 56) + 32 * v14, (uint64_t)&v27);
    *(_QWORD *)&v26 = v20;
    *((_QWORD *)&v26 + 1) = v19;
    v22 = v27;
    v21 = v28;
    v30 = v27;
    v31 = v28;
    v29 = v26;
    *v10 = v26;
    v10[1] = v22;
    v10[2] = v21;
    if (v12 == a3)
    {
      swift_bridgeObjectRetain(v19);
      v12 = a3;
      goto LABEL_36;
    }
    v10 += 3;
    result = (_QWORD *)swift_bridgeObjectRetain(v19);
    if (v8)
      goto LABEL_8;
LABEL_9:
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v15 >= v25)
      goto LABEL_35;
    v16 = *(_QWORD *)(v5 + 8 * v15);
    if (!v16)
    {
      v17 = v11 + 2;
      ++v11;
      if (v15 + 1 >= v25)
        goto LABEL_35;
      v16 = *(_QWORD *)(v5 + 8 * v17);
      if (v16)
        goto LABEL_14;
      v11 = v15 + 1;
      if (v15 + 2 >= v25)
        goto LABEL_35;
      v16 = *(_QWORD *)(v5 + 8 * (v15 + 2));
      if (v16)
      {
        v15 += 2;
      }
      else
      {
        v11 = v15 + 2;
        if (v15 + 3 >= v25)
          goto LABEL_35;
        v16 = *(_QWORD *)(v5 + 8 * (v15 + 3));
        if (!v16)
        {
          v17 = v15 + 4;
          v11 = v15 + 3;
          if (v15 + 4 < v25)
          {
            v16 = *(_QWORD *)(v5 + 8 * v17);
            if (!v16)
            {
              while (1)
              {
                v15 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_40;
                if (v15 >= v25)
                {
                  v11 = v25 - 1;
                  goto LABEL_35;
                }
                v16 = *(_QWORD *)(v5 + 8 * v15);
                ++v17;
                if (v16)
                  goto LABEL_21;
              }
            }
LABEL_14:
            v15 = v17;
            goto LABEL_21;
          }
LABEL_35:
          v8 = 0;
LABEL_36:
          v6 = v23;
          result = v24;
          goto LABEL_37;
        }
        v15 += 3;
      }
    }
LABEL_21:
    v8 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v15 << 6);
    v11 = v15;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1000A5840(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  int64_t v30;
  unint64_t v31;
  int64_t v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;

  v8 = sub_100007D40(&qword_1000ECC88);
  __chkstk_darwin(v8, v9);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for IndexPath(0, v12, v13);
  v45 = *(_QWORD *)(v14 - 8);
  result = __chkstk_darwin(v14, v15);
  v44 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = a4;
  v19 = a4 + 56;
  v18 = *(_QWORD *)(a4 + 56);
  v20 = -1 << *(_BYTE *)(a4 + 32);
  v39 = a1;
  v40 = v20;
  v21 = -v20;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  else
    v22 = -1;
  v23 = v22 & v18;
  if (!a2)
  {
    v24 = 0;
    v25 = 0;
LABEL_39:
    v35 = v39;
    v36 = ~v40;
    *v39 = v46;
    v35[1] = v19;
    v35[2] = v36;
    v35[3] = v24;
    v35[4] = v23;
    return v25;
  }
  if (!a3)
  {
    v24 = 0;
    v25 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v24 = 0;
  v25 = 0;
  v41 = a4 + 56;
  v42 = (unint64_t)(63 - v40) >> 6;
  v38 = v42 - 1;
  v43 = a3;
  v26 = v44;
  v27 = v45;
  if (!v23)
    goto LABEL_9;
LABEL_8:
  v28 = __clz(__rbit64(v23));
  v23 &= v23 - 1;
  v29 = v28 | (v24 << 6);
  while (1)
  {
    v33 = *(_QWORD *)(v27 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v27 + 16))(v11, *(_QWORD *)(v46 + 48) + v33 * v29, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v11, 0, 1, v14);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v11, 1, v14) == 1)
    {
      v19 = v41;
      goto LABEL_38;
    }
    ++v25;
    v34 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
    v34(v26, v11, v14);
    result = ((uint64_t (*)(uint64_t, char *, uint64_t))v34)(a2, v26, v14);
    if (v25 == v43)
    {
      v25 = v43;
      v19 = v41;
      goto LABEL_39;
    }
    a2 += v33;
    v27 = v45;
    if (v23)
      goto LABEL_8;
LABEL_9:
    v30 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    v19 = v41;
    if (v30 >= v42)
      goto LABEL_37;
    v31 = *(_QWORD *)(v41 + 8 * v30);
    if (!v31)
    {
      v32 = v24 + 2;
      ++v24;
      if (v30 + 1 >= v42)
        goto LABEL_37;
      v31 = *(_QWORD *)(v41 + 8 * v32);
      if (v31)
        goto LABEL_14;
      v24 = v30 + 1;
      if (v30 + 2 >= v42)
        goto LABEL_37;
      v31 = *(_QWORD *)(v41 + 8 * (v30 + 2));
      if (v31)
      {
        v30 += 2;
      }
      else
      {
        v24 = v30 + 2;
        if (v30 + 3 >= v42)
          goto LABEL_37;
        v31 = *(_QWORD *)(v41 + 8 * (v30 + 3));
        if (!v31)
        {
          v32 = v30 + 4;
          v24 = v30 + 3;
          if (v30 + 4 < v42)
          {
            v31 = *(_QWORD *)(v41 + 8 * v32);
            if (!v31)
            {
              while (1)
              {
                v30 = v32 + 1;
                if (__OFADD__(v32, 1))
                  goto LABEL_42;
                if (v30 >= v42)
                {
                  v24 = v38;
                  goto LABEL_37;
                }
                v31 = *(_QWORD *)(v41 + 8 * v30);
                ++v32;
                if (v31)
                  goto LABEL_21;
              }
            }
LABEL_14:
            v30 = v32;
            goto LABEL_21;
          }
LABEL_37:
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v11, 1, 1, v14);
          v23 = 0;
LABEL_38:
          sub_100020F10((uint64_t)v11);
          goto LABEL_39;
        }
        v30 += 3;
      }
    }
LABEL_21:
    v23 = (v31 - 1) & v31;
    v29 = __clz(__rbit64(v31)) + (v30 << 6);
    v24 = v30;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

_QWORD *sub_1000A5B88(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  void *v20;
  id v21;

  v5 = result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (_QWORD *)v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = *(void **)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = v20;
    if (v13 == v10)
    {
      v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    result = v20;
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1000A5D80(_QWORD *a1)
{
  return sub_1000A2594(0, a1[2], 0, a1);
}

uint64_t sub_1000A5D94(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, a1);
}

id sub_1000A5DA8(void *a1, void *a2, uint64_t a3, char *a4)
{
  _QWORD *v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t ObjectType;
  objc_class *ObjCClassFromMetadata;
  NSString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  objc_super v27;
  _QWORD v28[5];

  v28[3] = type metadata accessor for URLHelper(0);
  v28[4] = &off_1000D8BD0;
  v8 = sub_100030FF8(v28);
  sub_100042128(a3, (uint64_t)v8);
  v9 = &a4[OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController__dismissalDelegate];
  *((_QWORD *)v9 + 1) = 0;
  swift_unknownObjectWeakInit(v9, 0);
  *(_QWORD *)&a4[OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_conversation] = a1;
  *(_QWORD *)&a4[OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_message] = a2;
  sub_10003D1A8((uint64_t)v28, (uint64_t)&a4[OBJC_IVAR____TtC8Business32IMBDetailedMessageViewController_urlHelper]);
  v27.receiver = a4;
  v27.super_class = (Class)type metadata accessor for IMBDetailedMessageViewController();
  v10 = a1;
  v11 = a2;
  v12 = objc_msgSendSuper2(&v27, "initWithNibName:bundle:", 0, 0);
  v13 = qword_1000EBCB8;
  v14 = v12;
  if (v13 != -1)
    swift_once(&qword_1000EBCB8, sub_100082798);
  v15 = qword_1000F8A90;
  v16 = static os_log_type_t.debug.getter();
  v17 = sub_100007D40((uint64_t *)&unk_1000ECE50);
  v18 = swift_allocObject(v17, 112, 7);
  *(_OWORD *)(v18 + 16) = xmmword_1000ADFC0;
  ObjectType = swift_getObjectType(v14);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(ObjectType);
  v21 = NSStringFromClass(ObjCClassFromMetadata);
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
  v24 = v23;

  *(_QWORD *)(v18 + 56) = &type metadata for String;
  *(_QWORD *)(v18 + 64) = sub_100009084();
  *(_QWORD *)(v18 + 32) = v22;
  *(_QWORD *)(v18 + 40) = v24;
  *(_QWORD *)(v18 + 96) = sub_1000090C8(0, &qword_1000EBE68, BCMessage_ptr);
  *(_QWORD *)(v18 + 104) = sub_100041FE0();
  *(_QWORD *)(v18 + 72) = v11;
  v25 = v11;
  os_log(_:dso:log:type:_:)("Created a %@ for message: %@", 28, 2, &_mh_execute_header, v15, v16, v18);
  swift_bridgeObjectRelease(v18);

  sub_100010C40(v28);
  return v14;
}

id sub_1000A5FB4(void *a1, void *a2, uint64_t a3, char *a4)
{
  _QWORD *v8;
  uint64_t v9;
  id v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id v18;
  _QWORD v20[5];
  _QWORD v21[5];

  v21[3] = type metadata accessor for URLHelper(0);
  v21[4] = &off_1000D8BD0;
  v8 = sub_100030FF8(v21);
  sub_100042128(a3, (uint64_t)v8);
  v9 = OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_tableView;
  v10 = objc_allocWithZone((Class)UITableView);
  v11 = a4;
  *(_QWORD *)&a4[v9] = objc_msgSend(v10, "initWithFrame:style:", 1, 0.0, 0.0, 0.0, 0.0);
  v12 = OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController_nothingAvailableLabel;
  *(_QWORD *)&v11[v12] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  *(_QWORD *)&v11[OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController____lazy_storage___tableViewHeader] = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController____lazy_storage___footerToolbarModel] = 0;
  v13 = &v11[OBJC_IVAR____TtC8Business37IMBDetailedMessageTableViewController____lazy_storage___footerToolbarViewController];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;

  sub_10003D1A8((uint64_t)v21, (uint64_t)v20);
  v14 = sub_100031BA4((uint64_t)v20, v20[3]);
  __chkstk_darwin(v14, v14);
  v16 = (char *)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v17 + 16))(v16);
  v18 = sub_1000A5DA8(a1, a2, (uint64_t)v16, v11);
  sub_100010C40(v20);
  sub_100010C40(v21);
  return v18;
}

id sub_1000A6144(void *a1, void *a2, char a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  id v21;
  uint64_t v23;

  v7 = type metadata accessor for URLHelper(0);
  v9 = __chkstk_darwin(v7, v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v12);
  v14 = (char *)&v23 - v13;
  *(_QWORD *)&v3[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths] = &_swiftEmptySetSingleton;
  v15 = v3;
  v16 = objc_msgSend(a2, "rootObject");
  if (!v16)
    goto LABEL_8;
  v17 = v16;
  v18 = type metadata accessor for IMBListRequest();
  v19 = swift_dynamicCastClass(v17, v18);
  if (!v19)
  {
    swift_unknownObjectRelease(v17);
LABEL_8:
    v20 = 0;
    *(_QWORD *)&v15[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest] = 0;
    goto LABEL_10;
  }
  *(_QWORD *)&v15[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest] = v19;
  if ((a3 & 1) != 0)
  {
    if (*(_BYTE *)(v19 + 16))
      v20 = 2;
    else
      v20 = 1;
  }
  else
  {
    v20 = 0;
  }
LABEL_10:
  v15[OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectionType] = v20;

  sub_10004EA08((uint64_t)v14);
  sub_100020D60((uint64_t)v14, (uint64_t)v11);
  v21 = sub_1000A5FB4(a1, a2, (uint64_t)v11, v15);
  sub_100020DA4((uint64_t)v14);
  return v21;
}

uint64_t sub_1000A62B8()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_bridgeObjectRelease(v0[4]);
  sub_10007374C((uint64_t)v0 + OBJC_IVAR____TtC8Business20IMBTableViewCellData_timezone);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48), *(unsigned __int16 *)(*v0 + 52));
}

uint64_t sub_1000A62F8()
{
  return type metadata accessor for IMBTableViewCellData(0);
}

uint64_t type metadata accessor for IMBTableViewCellData(uint64_t a1)
{
  uint64_t result;

  result = qword_1000F0A88;
  if (!qword_1000F0A88)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for IMBTableViewCellData);
  return result;
}

void sub_1000A633C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[4];

  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[1] = &unk_1000B38C8;
  v4[2] = &unk_1000B38E0;
  sub_100073554(319);
  if (v3 <= 0x3F)
  {
    v4[3] = *(_QWORD *)(v2 - 8) + 64;
    swift_updateClassMetadata2(a1, 256, 4, v4, a1 + 80);
  }
}

id sub_1000A6538()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMBDetailedMessageViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IMBDetailedMessageViewController()
{
  return objc_opt_self(_TtC8Business32IMBDetailedMessageViewController);
}

char *sub_1000A65E0(uint64_t a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  *(_QWORD *)&v1[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_delegate + 8] = 0;
  ((void (*)(void))swift_unknownObjectWeakInit)();
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___separatorView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macFooterToolbarStackView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macLeftButton] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macRightButton] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macDismissButton] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_footerToolbarModel] = a1;
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for MacFooterToolbarViewController();
  v3 = (char *)objc_msgSendSuper2(&v9, "initWithNibName:bundle:", 0, 0);
  v4 = *(_QWORD *)&v3[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_footerToolbarModel];
  v5 = swift_allocObject(&unk_1000DA810, 24, 7);
  swift_unknownObjectWeakInit(v5 + 16, v3);
  v6 = *(_QWORD *)(v4 + 80);
  v7 = *(_QWORD *)(v4 + 88);
  *(_QWORD *)(v4 + 80) = sub_1000A7EF8;
  *(_QWORD *)(v4 + 88) = v5;
  sub_100028980(v6, v7);
  return v3;
}

void sub_1000A66D4(char a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  id v6;
  _BYTE v7[24];

  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v7, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    v6 = sub_1000A7370();

    objc_msgSend(v6, "setHidden:", (a1 & 1) == 0);
  }
}

void sub_1000A6774()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  NSString v13;
  id v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  NSString v21;
  id v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  NSString v27;
  id v28;
  id v29;
  id v30;
  char *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  double v37;
  id v38;
  double v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  Class isa;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  _QWORD v80[5];
  _QWORD v81[5];
  objc_super v82;

  v82.receiver = v0;
  v82.super_class = (Class)type metadata accessor for MacFooterToolbarViewController();
  objc_msgSendSuper2(&v82, "viewDidLoad");
  v1 = objc_msgSend(v0, "view");
  if (!v1)
  {
    __break(1u);
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v2 = v1;
  if (qword_1000EBBF8 != -1)
    swift_once(&qword_1000EBBF8, sub_10002D65C);
  objc_msgSend(v2, "setBackgroundColor:", qword_1000F8978);

  v3 = objc_msgSend(v0, "view");
  if (!v3)
    goto LABEL_37;
  v4 = v3;
  v5 = sub_1000A7370();
  objc_msgSend(v4, "addSubview:", v5);

  v6 = objc_msgSend(v0, "view");
  if (!v6)
  {
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v7 = v6;
  v8 = sub_1000A73E4();
  objc_msgSend(v7, "addSubview:", v8);

  v9 = *(_QWORD *)&v0[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_footerToolbarModel];
  v10 = *(_QWORD *)(v9 + 24);
  v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0)
    v11 = *(_QWORD *)(v9 + 16) & 0xFFFFFFFFFFFFLL;
  if (v11)
  {
    v12 = sub_1000A74B8();
    swift_bridgeObjectRetain(v10);
    v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v10);
    objc_msgSend(v12, "setTitle:forState:", v13, 0);

    v14 = sub_1000A73E4();
    v15 = sub_1000A74B8();
    objc_msgSend(v14, "addArrangedSubview:", v15);

  }
  v16 = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = sub_1000A73E4();
  objc_msgSend(v17, "addArrangedSubview:", v16);

  v18 = *(_QWORD *)(v9 + 72);
  v19 = HIBYTE(v18) & 0xF;
  if ((v18 & 0x2000000000000000) == 0)
    v19 = *(_QWORD *)(v9 + 64) & 0xFFFFFFFFFFFFLL;
  if (v19 && sub_10002DA10() == 2)
  {
    v20 = sub_1000A7580();
    swift_bridgeObjectRetain(v18);
    v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v18);
    objc_msgSend(v20, "setTitle:forState:", v21, 0);

    v22 = sub_1000A73E4();
    v23 = sub_1000A7580();
    objc_msgSend(v22, "addArrangedSubview:", v23);

  }
  v24 = *(_QWORD *)(v9 + 48);
  v25 = HIBYTE(v24) & 0xF;
  if ((v24 & 0x2000000000000000) == 0)
    v25 = *(_QWORD *)(v9 + 40) & 0xFFFFFFFFFFFFLL;
  if (v25)
  {
    v26 = sub_1000A7568();
    swift_bridgeObjectRetain(v24);
    v27 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v24);
    objc_msgSend(v26, "setTitle:forState:", v27, 0);

    v28 = sub_1000A73E4();
    v29 = sub_1000A7568();
    objc_msgSend(v28, "addArrangedSubview:", v29);

  }
  v30 = objc_msgSend((id)objc_opt_self(UIColor), "separatorColor");
  v31 = v0;
  v32 = sub_1000A7370();

  objc_msgSend(v32, "setBackgroundColor:", v30);
  v33 = sub_1000A7370();
  objc_msgSend(v33, "setHidden:", (*(_BYTE *)(v9 + 96) & 1) == 0);

  v34 = objc_msgSend(v31, "view");
  if (!v34)
    goto LABEL_39;
  v35 = v34;
  v36 = sub_1000090C8(0, (unint64_t *)&qword_1000EEB80, UIView_ptr);
  v81[3] = v36;
  v81[4] = &off_1000D9C90;
  v81[0] = v35;
  if (qword_1000EBCF8 != -1)
    swift_once(&qword_1000EBCF8, sub_1000A7A84);
  v37 = *(double *)&qword_1000F0BB8;
  v38 = objc_msgSend(v31, "view");
  if (!v38)
    goto LABEL_40;
  v80[3] = v36;
  v80[4] = &off_1000D9C90;
  v80[0] = v38;
  v39 = *(double *)&qword_1000F0BB8;
  v40 = objc_msgSend(v31, "view");
  if (!v40)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v41 = v40;
  sub_1000A7A94(0, v81, v80, v40, v31, 0.0, v37, v39);

  sub_100010C40(v80);
  sub_100010C40(v81);
  v42 = sub_100007D40((uint64_t *)&unk_1000ED490);
  v43 = swift_allocObject(v42, 64, 7);
  *(_OWORD *)(v43 + 16) = xmmword_1000AF130;
  v44 = sub_1000A73E4();
  v45 = objc_msgSend(v44, "leadingAnchor");

  v46 = objc_msgSend(v31, "view");
  if (!v46)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v47 = v46;
  v48 = objc_msgSend(v46, "leadingAnchor");

  v49 = objc_msgSend(v45, "constraintEqualToAnchor:constant:", v48, *(double *)&qword_1000F0BB8);
  *(_QWORD *)(v43 + 32) = v49;
  v50 = sub_1000A73E4();
  v51 = objc_msgSend(v50, "topAnchor");

  v52 = sub_1000A7370();
  v53 = objc_msgSend(v52, "bottomAnchor");

  v54 = objc_msgSend(v51, "constraintEqualToAnchor:constant:", v53, *(double *)&qword_1000F0BB8);
  *(_QWORD *)(v43 + 40) = v54;
  v55 = sub_1000A73E4();
  v56 = objc_msgSend(v55, "trailingAnchor");

  v57 = objc_msgSend(v31, "view");
  if (!v57)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v58 = v57;
  v59 = objc_msgSend(v57, "trailingAnchor");

  v60 = objc_msgSend(v56, "constraintEqualToAnchor:constant:", v59, -*(double *)&qword_1000F0BB8);
  *(_QWORD *)(v43 + 48) = v60;
  v61 = sub_1000A73E4();
  v62 = objc_msgSend(v61, "bottomAnchor");

  v63 = objc_msgSend(v31, "view");
  if (!v63)
  {
LABEL_44:
    __break(1u);
    return;
  }
  v64 = v63;
  v65 = (void *)objc_opt_self(NSLayoutConstraint);
  v66 = objc_msgSend(v64, "bottomAnchor");

  v67 = objc_msgSend(v62, "constraintEqualToAnchor:constant:", v66, -*(double *)&qword_1000F0BB8);
  *(_QWORD *)(v43 + 56) = v67;
  v81[0] = v43;
  specialized Array._endMutation()(v68);
  v69 = v81[0];
  sub_1000090C8(0, (unint64_t *)&qword_1000EEB90, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v69);
  objc_msgSend(v65, "activateConstraints:", isa);

  v71 = *(_QWORD *)(v9 + 72);
  v72 = *(_QWORD *)(v9 + 64) & 0xFFFFFFFFFFFFLL;
  if ((v71 & 0x2000000000000000) != 0)
    v72 = HIBYTE(v71) & 0xF;
  if (v72 && sub_10002DA10() == 2)
  {
    v73 = *(_QWORD *)(v9 + 48);
    v74 = *(_QWORD *)(v9 + 40) & 0xFFFFFFFFFFFFLL;
    if ((v73 & 0x2000000000000000) != 0)
      v74 = HIBYTE(v73) & 0xF;
    if (v74)
    {
      v75 = sub_1000A7580();
      v76 = objc_msgSend(v75, "widthAnchor");

      v77 = sub_1000A7568();
      v78 = objc_msgSend(v77, "widthAnchor");

      v79 = objc_msgSend(v76, "constraintEqualToAnchor:", v78);
      objc_msgSend(v79, "setActive:", 1);

    }
  }

}

unint64_t sub_1000A70D4()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  NSString v13;
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  unsigned int v22;
  NSString v23;
  id v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v30;
  objc_super v31;
  unint64_t v32;

  v1 = v0;
  v31.receiver = v0;
  v31.super_class = (Class)type metadata accessor for MacFooterToolbarViewController();
  v2 = objc_msgSendSuper2(&v31, "keyCommands");
  if (v2)
  {
    v3 = v2;
    v4 = sub_1000090C8(0, &qword_1000F0C48, UIKeyCommand_ptr);
    v5 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  }
  else
  {
    v5 = _swiftEmptyArrayStorage;
  }
  v32 = (unint64_t)v5;
  v6 = *(_QWORD **)&v1[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_footerToolbarModel];
  v7 = v6[9];
  v8 = v6[8] & 0xFFFFFFFFFFFFLL;
  if ((v7 & 0x2000000000000000) != 0)
    v8 = HIBYTE(v7) & 0xF;
  if (v8)
  {
    if (sub_10002DA10() == 2)
    {
      v9 = sub_1000A7580();
      v10 = objc_msgSend(v9, "isEnabled");

      if (v10)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)(UIKeyInputEscape);
        v12 = v11;
        v13 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v12);
        v14 = objc_msgSend((id)objc_opt_self(UIKeyCommand), "keyCommandWithInput:modifierFlags:action:", v13, 0, "dismissButtonTapped");

        v15 = v14;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v15);
        v16 = *(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v17 = *(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v16 >= v17 >> 1)
        {
          v30 = *(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v17 > 1, v16 + 1, 1);
          v16 = v30;
        }
        v18 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v16, v15);
        specialized Array._endMutation()(v18);

      }
    }
  }
  v19 = v6[6];
  v20 = v6[5] & 0xFFFFFFFFFFFFLL;
  if ((v19 & 0x2000000000000000) != 0)
    v20 = HIBYTE(v19) & 0xF;
  if (v20)
  {
    v21 = sub_1000A7568();
    v22 = objc_msgSend(v21, "isEnabled");

    if (v22)
    {
      v23 = String._bridgeToObjectiveC()();
      v24 = objc_msgSend((id)objc_opt_self(UIKeyCommand), "keyCommandWithInput:modifierFlags:action:", v23, 0, "rightButtonTapped");

      v25 = v24;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v25);
      v27 = *(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v26 = *(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v27 >= v26 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v26 > 1, v27 + 1, 1);
      v28 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v27, v25);
      specialized Array._endMutation()(v28);

    }
  }
  return v32;
}

id sub_1000A7370()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___separatorView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___separatorView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___separatorView);
  }
  else
  {
    v4 = type metadata accessor for SeparatorView();
    v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v4)), "init");
    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

id sub_1000A73E4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macFooterToolbarStackView;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macFooterToolbarStackView);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macFooterToolbarStackView);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)UIStackView), "init");
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "setAxis:", 0);
    objc_msgSend(v4, "setDistribution:", 0);
    objc_msgSend(v4, "setAlignment:", 5);
    objc_msgSend(v4, "setSpacing:", 12.0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_1000A74B8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macLeftButton;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macLeftButton);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macLeftButton);
  }
  else
  {
    v4 = type metadata accessor for MacLeftButton();
    v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(v4), "buttonWithType:", 1);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addTarget:action:forControlEvents:", v0, "leftButtonTapped", 64);
    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

id sub_1000A7568()
{
  return sub_1000A7598(&OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macRightButton, &selRef_rightButtonTapped, 1);
}

id sub_1000A7580()
{
  return sub_1000A7598(&OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macDismissButton, &selRef_dismissButtonTapped, 2);
}

id sub_1000A7598(uint64_t *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v9;
  void *v10;
  id v11;

  v4 = *a1;
  v5 = *(void **)(v3 + *a1);
  if (v5)
  {
    v6 = *(id *)(v3 + *a1);
  }
  else
  {
    v9 = objc_msgSend((id)objc_opt_self(UIButton), "buttonWithType:", 1);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addTarget:action:forControlEvents:", v3, *a2, 64);
    objc_msgSend(v9, "setRole:", a3);
    v10 = *(void **)(v3 + v4);
    *(_QWORD *)(v3 + v4) = v9;
    v6 = v9;

    v5 = 0;
  }
  v11 = v5;
  return v6;
}

id sub_1000A7844(uint64_t a1)
{
  return sub_100032A74(a1, type metadata accessor for MacFooterToolbarViewController);
}

uint64_t type metadata accessor for MacFooterToolbarViewController()
{
  return objc_opt_self(_TtC8Business30MacFooterToolbarViewController);
}

uint64_t sub_1000A78F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_delegate;
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign(v4, a1);
  return swift_unknownObjectRelease(a1);
}

void sub_1000A7930(char a1)
{
  id v2;
  uint64_t v3;
  id v4;

  v2 = sub_1000A74B8();
  v3 = a1 & 1;
  objc_msgSend(v2, "setEnabled:", v3);

  v4 = sub_1000A7568();
  objc_msgSend(v4, "setEnabled:", v3);

}

id sub_1000A7A54()
{
  return sub_100032A74(0, type metadata accessor for MacLeftButton);
}

uint64_t type metadata accessor for MacLeftButton()
{
  return objc_opt_self(_TtC8BusinessP33_5C9C658DE8F7DD0151CD16655D6CBEF813MacLeftButton);
}

void sub_1000A7A84()
{
  qword_1000F0BB8 = 0x4030000000000000;
}

void sub_1000A7A94(char a1, _QWORD *a2, _QWORD *a3, void *a4, void *a5, double a6, double a7, double a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  double v22;
  double v23;
  id v24;
  double v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;

  v15 = a4;
  v16 = a5;
  v17 = sub_1000A7370();

  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = v16;
  v19 = sub_1000A7370();

  v20 = objc_msgSend(v19, "heightAnchor");
  v21 = objc_msgSend(v18, "traitCollection");
  objc_msgSend(v21, "displayScale");
  v23 = v22;

  if (v23 <= 0.0)
  {
    v24 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
    objc_msgSend(v24, "scale");
    v23 = v25;

    if (v23 <= 0.0)
      v23 = 1.0;
  }
  v26 = objc_msgSend(v20, "constraintEqualToConstant:", 1.0 / v23);

  objc_msgSend(v26, "setActive:", 1);
  v27 = v18;
  v28 = sub_1000A7370();

  if ((a1 & 1) != 0)
  {
    v29 = objc_msgSend(v28, "bottomAnchor");

    v33 = a2[3];
    v34 = a2[4];
    sub_100008FA4(a2, v33);
    v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 32))(v33, v34);
  }
  else
  {
    v29 = objc_msgSend(v28, "topAnchor");

    v30 = a2[3];
    v31 = a2[4];
    sub_100008FA4(a2, v30);
    v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 24))(v30, v31);
  }
  v35 = (void *)v32;
  v36 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v32, a6);

  objc_msgSend(v36, "setActive:", 1);
  v37 = v27;
  v38 = sub_1000A7370();

  v39 = objc_msgSend(v38, "leadingAnchor");
  v40 = a3[3];
  v41 = a3[4];
  sub_100008FA4(a3, v40);
  v42 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v41 + 8))(v40, v41);
  v43 = objc_msgSend(v39, "constraintEqualToAnchor:constant:", v42, a7);

  objc_msgSend(v43, "setActive:", 1);
  v44 = v37;
  v45 = sub_1000A7370();

  v46 = objc_msgSend(v45, "trailingAnchor");
  v47 = objc_msgSend(v15, "trailingAnchor");
  v48 = objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, -a8);

  objc_msgSend(v48, "setActive:", 1);
}

void sub_1000A7E24()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___separatorView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macFooterToolbarStackView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macLeftButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macRightButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business30MacFooterToolbarViewController____lazy_storage___macDismissButton] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/MacFooterToolbarViewController.swift", 45, 2, 23, 0);
  __break(1u);
}

uint64_t sub_1000A7ED4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000A7EF8(char a1)
{
  uint64_t v1;

  sub_1000A66D4(a1, v1);
}

uint64_t sub_1000A7F00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v76;

  v1 = v0;
  v76 = sub_100007D40((uint64_t *)&unk_1000ED490);
  v2 = swift_allocObject(v76, 88, 7);
  *(_OWORD *)(v2 + 16) = xmmword_1000AF590;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainer);
  v4 = objc_msgSend(v3, "leadingAnchor");
  v5 = *(void **)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_informationView);
  v6 = objc_msgSend(v5, "leadingAnchor");
  v7 = objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 4.0);

  *(_QWORD *)(v2 + 32) = v7;
  v8 = objc_msgSend(v3, "topAnchor");
  v9 = objc_msgSend(v5, "topAnchor");
  v10 = objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v9, 10.0);

  *(_QWORD *)(v2 + 40) = v10;
  v11 = objc_msgSend(v3, "bottomAnchor");
  v12 = objc_msgSend(v5, "bottomAnchor");
  v13 = objc_msgSend(v11, "constraintLessThanOrEqualToAnchor:constant:", v12, -10.0);

  *(_QWORD *)(v2 + 48) = v13;
  v14 = *(void **)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_imageView);
  v15 = objc_msgSend(v14, "leadingAnchor");
  v16 = objc_msgSend(v3, "trailingAnchor");
  v17 = objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 10.0);

  *(_QWORD *)(v2 + 56) = v17;
  v18 = objc_msgSend(v14, "trailingAnchor");
  v19 = objc_msgSend(v5, "trailingAnchor");
  v20 = objc_msgSend(v18, "constraintEqualToAnchor:", v19);

  *(_QWORD *)(v2 + 64) = v20;
  v21 = objc_msgSend(v14, "centerYAnchor");
  v22 = objc_msgSend(v5, "centerYAnchor");
  v23 = objc_msgSend(v21, "constraintEqualToAnchor:", v22);

  *(_QWORD *)(v2 + 72) = v23;
  v24 = objc_msgSend(v3, "centerYAnchor");
  v25 = objc_msgSend(v5, "centerYAnchor");
  v26 = objc_msgSend(v24, "constraintEqualToAnchor:", v25);

  *(_QWORD *)(v2 + 80) = v26;
  specialized Array._endMutation()(v27);
  v28 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainerFirstConstraintsIconSmall);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainerFirstConstraintsIconSmall) = v2;
  swift_bridgeObjectRelease(v28);
  v29 = objc_msgSend(v3, "leadingAnchor");
  v30 = objc_msgSend(v14, "trailingAnchor");
  v31 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 10.0);

  v32 = OBJC_IVAR____TtC8Business13IMBBubbleView_labelRightConstraint;
  v33 = *(void **)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_labelRightConstraint);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_labelRightConstraint) = v31;

  v34 = swift_allocObject(v76, 88, 7);
  *(_OWORD *)(v34 + 16) = xmmword_1000AF590;
  v35 = objc_msgSend(v14, "centerYAnchor");
  v36 = objc_msgSend(v5, "centerYAnchor");
  v37 = objc_msgSend(v35, "constraintEqualToAnchor:", v36);

  *(_QWORD *)(v34 + 32) = v37;
  v38 = objc_msgSend(v14, "leadingAnchor");
  v39 = objc_msgSend(v5, "leadingAnchor");
  v40 = objc_msgSend(v38, "constraintEqualToAnchor:", v39);

  v41 = *(void **)(v1 + v32);
  *(_QWORD *)(v34 + 40) = v40;
  *(_QWORD *)(v34 + 48) = v41;
  v42 = v41;
  v43 = objc_msgSend(v3, "topAnchor");
  v44 = objc_msgSend(v5, "topAnchor");
  v45 = objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:constant:", v44, 10.0);

  *(_QWORD *)(v34 + 56) = v45;
  v46 = objc_msgSend(v3, "bottomAnchor");
  v47 = objc_msgSend(v5, "bottomAnchor");
  v48 = objc_msgSend(v46, "constraintLessThanOrEqualToAnchor:constant:", v47, -10.0);

  *(_QWORD *)(v34 + 64) = v48;
  v49 = objc_msgSend(v3, "trailingAnchor");
  v50 = objc_msgSend(v5, "trailingAnchor");
  v51 = objc_msgSend(v49, "constraintEqualToAnchor:", v50);

  *(_QWORD *)(v34 + 72) = v51;
  v52 = objc_msgSend(v3, "centerYAnchor");
  v53 = objc_msgSend(v5, "centerYAnchor");
  v54 = objc_msgSend(v52, "constraintEqualToAnchor:", v53);

  *(_QWORD *)(v34 + 80) = v54;
  specialized Array._endMutation()(v55);
  v56 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewFirstConstraintsIconSmall);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewFirstConstraintsIconSmall) = v34;
  swift_bridgeObjectRelease(v56);
  v57 = swift_allocObject(v76, 72, 7);
  *(_OWORD *)(v57 + 16) = xmmword_1000AF580;
  v58 = objc_msgSend(v3, "leadingAnchor");
  v59 = objc_msgSend(v5, "leadingAnchor");
  v60 = objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, 4.0);

  *(_QWORD *)(v57 + 32) = v60;
  v61 = objc_msgSend(v3, "topAnchor");
  v62 = objc_msgSend(v5, "topAnchor");
  v63 = objc_msgSend(v61, "constraintGreaterThanOrEqualToAnchor:constant:", v62, 10.0);

  *(_QWORD *)(v57 + 40) = v63;
  v64 = objc_msgSend(v3, "bottomAnchor");
  v65 = objc_msgSend(v5, "bottomAnchor");
  v66 = objc_msgSend(v64, "constraintLessThanOrEqualToAnchor:constant:", v65, -10.0);

  *(_QWORD *)(v57 + 48) = v66;
  v67 = objc_msgSend(v3, "trailingAnchor");
  v68 = objc_msgSend(v5, "trailingAnchor");
  v69 = objc_msgSend(v67, "constraintEqualToAnchor:", v68);

  *(_QWORD *)(v57 + 56) = v69;
  v70 = objc_msgSend(v3, "centerYAnchor");
  v71 = objc_msgSend(v5, "centerYAnchor");
  v72 = objc_msgSend(v70, "constraintEqualToAnchor:", v71);

  *(_QWORD *)(v57 + 64) = v72;
  specialized Array._endMutation()(v73);
  v74 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_largeLabelContainerConstraints);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC8Business13IMBBubbleView_largeLabelContainerConstraints) = v57;
  return swift_bridgeObjectRelease(v74);
}

void sub_1000A878C()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  id v18;

  objc_msgSend(v0, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v1 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_style];
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(BCBubbleViewStyleSmall);
  v4 = v3;
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  if (v2 == v5 && v4 == v6)
  {
    v18 = v1;
    swift_bridgeObjectRelease_n(v4, 2);
    goto LABEL_12;
  }
  v8 = v6;
  v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v2, v4, v5, v6, 0);
  v10 = v1;
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v8);
  if ((v9 & 1) != 0)
  {
LABEL_12:

    return;
  }
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(BCBubbleViewStyleLarge);
  v13 = v12;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  if (v11 == v14 && v13 == v15)
  {

    swift_bridgeObjectRelease_n(v13, 2);
  }
  else
  {
    v17 = v15;
    _stringCompareWithSmolCheck(_:_:expecting:)(v11, v13, v14, v15, 0);

    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(v17);
  }
}

void sub_1000A88F0()
{
  char *v0;
  uint64_t v1;
  id v2;
  int IsAccessibilityContentSizeCategory;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  void *v29;
  id v30;

  v1 = *(_QWORD *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_defaultColor];
  objc_msgSend(v0, "setBackgroundColor:", v1);
  objc_msgSend(v0, "setLayoutMargins:", 0.0, 15.0, 0.0, 15.0);
  if (!UIApp)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v2 = objc_msgSend(UIApp, "preferredContentSizeCategory");
  IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  v4 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabel];
  if (IsAccessibilityContentSizeCategory)
    v5 = 0;
  else
    v5 = 3;
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabel], "setNumberOfLines:", v5);
  v6 = (void *)objc_opt_self(UIFont);
  v7 = objc_msgSend(v6, "preferredFontForTextStyle:", UIFontTextStyleCaption1);
  v8 = objc_msgSend(v7, "fontDescriptor");
  v9 = objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", 2);

  if (!v9)
    goto LABEL_17;
  v10 = objc_msgSend(v6, "fontWithDescriptor:size:", v9, 0.0);

  objc_msgSend(v4, "setFont:", v10);
  objc_msgSend(v4, "setLineBreakMode:", 4);
  v11 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabel];
  v12 = objc_msgSend(v6, "preferredFontForTextStyle:", UIFontTextStyleCaption1);
  v13 = objc_msgSend(v12, "fontDescriptor");
  v14 = objc_msgSend(v13, "fontDescriptorWithSymbolicTraits:", 0x8000);

  if (v14)
  {
    v15 = objc_msgSend(v6, "fontWithDescriptor:size:", v14, 0.0);

    objc_msgSend(v11, "setFont:", v15);
    objc_msgSend(v11, "setLineBreakMode:", 4);
    v16 = objc_msgSend((id)objc_opt_self(UIColor), "secondaryLabelColor");
    objc_msgSend(v11, "setTextColor:", v16);

    objc_msgSend(v11, "setNumberOfLines:", 0);
    v17 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_imageView];
    objc_msgSend(v17, "setContentMode:", 2);
    v18 = objc_msgSend(v17, "layer");
    objc_msgSend(v18, "setMasksToBounds:", 1);

    v19 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainer];
    objc_msgSend(v19, "addSubview:", v4);
    objc_msgSend(v19, "addSubview:", v11);
    v20 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_informationBackground];
    objc_msgSend(v20, "setBackgroundColor:", v1);
    v21 = BCBubbleViewStyleLarge;
    v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_style]);
    v24 = v23;
    v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
    v27 = v25;
    if (v22 == v26 && v24 == v25)
    {
      swift_bridgeObjectRelease_n(v24, 2);
    }
    else
    {
      v28 = _stringCompareWithSmolCheck(_:_:expecting:)(v22, v24, v26, v25, 0);
      swift_bridgeObjectRelease(v24);
      swift_bridgeObjectRelease(v27);
      if ((v28 & 1) == 0)
      {
        v29 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_informationView];
        objc_msgSend(v29, "addSubview:", v19);
        objc_msgSend(v29, "addSubview:", v17);
        v30 = objc_msgSend(v17, "layer");
        if (qword_1000EBBE8 != -1)
          swift_once(&qword_1000EBBE8, sub_10002D61C);
        objc_msgSend(v30, "setCornerRadius:", *(double *)&qword_1000F8968);

        goto LABEL_15;
      }
    }
    v29 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_informationView];
    objc_msgSend(v29, "addSubview:", v19);
    objc_msgSend(v0, "addSubview:", v17);
LABEL_15:
    objc_msgSend(v0, "addSubview:", v20);
    objc_msgSend(v0, "addSubview:", v29);
    return;
  }
LABEL_18:
  __break(1u);
}

void sub_1000A8DA0()
{
  char *v0;
  char *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  Class isa;
  double v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  double v29;
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
  double v42;
  id v43;
  id v44;
  void *v45;
  double v46;
  double v47;
  id v48;
  void *v49;
  int v50;
  double v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  double v58;
  id v59;
  id v60;
  double v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  Class v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  uint64_t v114;
  NSArray v115;
  uint64_t *v116;
  uint64_t v117;
  Class v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  char v127;
  id v128;
  id v129;
  id v130;
  id v131;
  void *v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  uint64_t v153;
  id v154;
  void *v155;
  id v156;
  char v157;
  id v158;
  void *v159;
  uint64_t v160;
  id v161;
  id v162;
  id v163;
  void *v164;
  id v165;
  id v166;
  uint64_t v167;
  uint64_t v168;

  v1 = v0;
  sub_1000A7F00();
  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v2 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainer];
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v164 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_imageView];
  objc_msgSend(v164, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabel];
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabel];
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v165 = *(id *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_informationView];
  objc_msgSend(v165, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v163 = *(id *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_informationBackground];
  objc_msgSend(v163, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = objc_msgSend(v0, "widthAnchor");
  v6 = objc_msgSend(v5, "constraintEqualToConstant:", 0.0);

  v7 = OBJC_IVAR____TtC8Business13IMBBubbleView_widthConstraint;
  v8 = *(void **)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_widthConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_widthConstraint] = v6;

  v9 = objc_msgSend(v1, "heightAnchor");
  v10 = objc_msgSend(v9, "constraintEqualToConstant:", 0.0);

  v11 = OBJC_IVAR____TtC8Business13IMBBubbleView_heightConstraint;
  v12 = *(void **)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_heightConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_heightConstraint] = v10;

  LODWORD(v13) = 1148846080;
  objc_msgSend(*(id *)&v1[v11], "setPriority:", v13);
  v14 = (void *)objc_opt_self(NSLayoutConstraint);
  v161 = (id)sub_100007D40((uint64_t *)&unk_1000ED490);
  v15 = swift_allocObject(v161, 40, 7);
  *(_OWORD *)(v15 + 16) = xmmword_1000AF120;
  v16 = *(void **)&v1[v7];
  *(_QWORD *)(v15 + 32) = v16;
  v167 = v15;
  specialized Array._endMutation()(v15);
  sub_1000090C8(0, (unint64_t *)&qword_1000EEB90, NSLayoutConstraint_ptr);
  v17 = v16;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v167);
  v166 = v14;
  objc_msgSend(v14, "activateConstraints:", isa);

  LODWORD(v19) = 1144750080;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 1, v19);
  v20 = objc_msgSend(v3, "topAnchor");
  v21 = objc_msgSend(v2, "topAnchor");
  v22 = objc_msgSend(v20, "constraintEqualToAnchor:", v21);

  objc_msgSend(v22, "setActive:", 1);
  v23 = objc_msgSend(v3, "leftAnchor");
  v24 = objc_msgSend(v2, "leftAnchor");
  v25 = objc_msgSend(v23, "constraintEqualToAnchor:", v24);

  objc_msgSend(v25, "setActive:", 1);
  v26 = objc_msgSend(v3, "rightAnchor");
  v27 = objc_msgSend(v2, "rightAnchor");
  v28 = objc_msgSend(v26, "constraintEqualToAnchor:", v27);

  objc_msgSend(v28, "setActive:", 1);
  LODWORD(v29) = 1148846080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 1, v29);
  v30 = objc_msgSend(v4, "firstBaselineAnchor");
  v31 = objc_msgSend(v3, "lastBaselineAnchor");
  v32 = objc_msgSend(v30, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v31, 1.0);

  objc_msgSend(v32, "setActive:", 1);
  v33 = objc_msgSend(v4, "leftAnchor");
  v34 = objc_msgSend(v2, "leftAnchor");
  v35 = objc_msgSend(v33, "constraintEqualToAnchor:", v34);

  objc_msgSend(v35, "setActive:", 1);
  v36 = objc_msgSend(v4, "rightAnchor");
  v37 = objc_msgSend(v2, "rightAnchor");
  v38 = objc_msgSend(v36, "constraintEqualToAnchor:", v37);

  objc_msgSend(v38, "setActive:", 1);
  v39 = objc_msgSend(v4, "bottomAnchor");
  v40 = objc_msgSend(v2, "bottomAnchor");
  v41 = objc_msgSend(v39, "constraintEqualToAnchor:", v40);

  objc_msgSend(v41, "setActive:", 1);
  LODWORD(v42) = 1144750080;
  objc_msgSend(v4, "setContentCompressionResistancePriority:forAxis:", 1, v42);
  v43 = objc_msgSend(v4, "heightAnchor");
  v44 = objc_msgSend(v4, "font");
  if (v44)
  {
    v45 = v44;
    objc_msgSend(v44, "lineHeight");
    v47 = v46;

    v48 = objc_msgSend(v43, "constraintGreaterThanOrEqualToConstant:", v47);
    v49 = *(void **)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabelHeightConstraint];
    *(_QWORD *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabelHeightConstraint] = v48;

    v160 = OBJC_IVAR____TtC8Business13IMBBubbleView_type;
    v50 = v1[OBJC_IVAR____TtC8Business13IMBBubbleView_type];
    if (v1[OBJC_IVAR____TtC8Business13IMBBubbleView_type])
      v51 = -5.0;
    else
      v51 = 1.0;
    v52 = type metadata accessor for IMBActionBubbleView();
    if (!swift_dynamicCastClass(v1, v52) || (v50 & 1) != 0)
    {
      if (v50)
        v58 = -1.0;
      else
        v58 = 5.0;
      v53 = v165;
      v54 = objc_msgSend(v165, "rightAnchor");
      v59 = objc_msgSend(v1, "layoutMarginsGuide");
      v56 = objc_msgSend(v59, "rightAnchor");

      v57 = objc_msgSend(v54, "constraintEqualToAnchor:constant:", v56, v58);
    }
    else
    {
      v53 = v165;
      v54 = objc_msgSend(v165, "rightAnchor");
      v55 = objc_msgSend(v1, "layoutMarginsGuide");
      v56 = objc_msgSend(v55, "rightAnchor");

      v57 = objc_msgSend(v54, "constraintEqualToAnchor:", v56);
    }
    v60 = v57;

    LODWORD(v61) = 1148829696;
    objc_msgSend(v60, "setPriority:", v61);
    v62 = objc_msgSend(v53, "leftAnchor");
    v63 = objc_msgSend(v1, "layoutMarginsGuide");
    v64 = objc_msgSend(v63, "leftAnchor");

    v65 = objc_msgSend(v62, "constraintEqualToAnchor:constant:", v64, v51);
    objc_msgSend(v65, "setActive:", 1);

    v66 = objc_msgSend(v53, "bottomAnchor");
    v67 = objc_msgSend(v1, "bottomAnchor");
    v68 = objc_msgSend(v66, "constraintEqualToAnchor:", v67);

    objc_msgSend(v68, "setActive:", 1);
    v69 = swift_allocObject(v161, 40, 7);
    *(_OWORD *)(v69 + 16) = xmmword_1000AF120;
    *(_QWORD *)(v69 + 32) = v60;
    v168 = v69;
    specialized Array._endMutation()(v69);
    v162 = v60;
    v70 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v168);
    objc_msgSend(v166, "activateConstraints:", v70);

    v71 = objc_msgSend(v163, "heightAnchor");
    v72 = objc_msgSend(v53, "heightAnchor");
    v73 = objc_msgSend(v71, "constraintEqualToAnchor:", v72);

    objc_msgSend(v73, "setActive:", 1);
    v74 = objc_msgSend(v163, "leftAnchor");
    v75 = objc_msgSend(v1, "leftAnchor");
    v76 = objc_msgSend(v74, "constraintEqualToAnchor:", v75);

    objc_msgSend(v76, "setActive:", 1);
    v77 = objc_msgSend(v163, "rightAnchor");
    v78 = objc_msgSend(v1, "rightAnchor");
    v79 = objc_msgSend(v77, "constraintEqualToAnchor:", v78);

    objc_msgSend(v79, "setActive:", 1);
    v80 = objc_msgSend(v163, "bottomAnchor");
    v81 = objc_msgSend(v1, "bottomAnchor");
    v82 = objc_msgSend(v80, "constraintEqualToAnchor:", v81);

    objc_msgSend(v82, "setActive:", 1);
    v83 = OBJC_IVAR____TtC8Business13IMBBubbleView_style;
    v84 = BCBubbleViewStyleIcon;
    v85 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_style]);
    v87 = v86;
    v89 = static String._unconditionallyBridgeFromObjectiveC(_:)(v84);
    v90 = v88;
    if (v85 == v89 && v87 == v88)
    {
      v92 = v164;
      v91 = v165;
LABEL_18:
      swift_bridgeObjectRelease_n(v87, 2);
      goto LABEL_19;
    }
    v93 = _stringCompareWithSmolCheck(_:_:expecting:)(v85, v87, v89, v88, 0);
    swift_bridgeObjectRelease(v87);
    swift_bridgeObjectRelease(v90);
    v92 = v164;
    v91 = v165;
    if ((v93 & 1) == 0)
    {
      v94 = BCBubbleViewStyleSmall;
      v95 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)&v1[v83]);
      v87 = v96;
      v98 = static String._unconditionallyBridgeFromObjectiveC(_:)(v94);
      v99 = v97;
      if (v95 == v98 && v87 == v97)
        goto LABEL_18;
      v140 = _stringCompareWithSmolCheck(_:_:expecting:)(v95, v87, v98, v97, 0);
      swift_bridgeObjectRelease(v87);
      swift_bridgeObjectRelease(v99);
      if ((v140 & 1) == 0)
      {
        v141 = objc_msgSend(v164, "topAnchor");
        v142 = objc_msgSend(v1, "topAnchor");
        v143 = objc_msgSend(v141, "constraintEqualToAnchor:", v142);

        objc_msgSend(v143, "setActive:", 1);
        v144 = objc_msgSend(v164, "leftAnchor");
        v145 = objc_msgSend(v1, "leftAnchor");
        v146 = objc_msgSend(v144, "constraintEqualToAnchor:", v145);

        objc_msgSend(v146, "setActive:", 1);
        v147 = objc_msgSend(v164, "rightAnchor");
        v148 = objc_msgSend(v1, "rightAnchor");
        v149 = objc_msgSend(v147, "constraintEqualToAnchor:", v148);

        objc_msgSend(v149, "setActive:", 1);
        v150 = objc_msgSend(v164, "bottomAnchor");
        v151 = objc_msgSend(v165, "topAnchor");
        v152 = objc_msgSend(v150, "constraintEqualToAnchor:", v151);

        objc_msgSend(v152, "setActive:", 1);
        v153 = *(_QWORD *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_image];
        v154 = objc_msgSend(v164, "heightAnchor");
        v155 = v154;
        if (v153)
          v156 = objc_msgSend(v154, "constraintEqualToConstant:", 150.0);
        else
          v156 = objc_msgSend(v154, "constraintEqualToConstant:", 0.0);
        v158 = v156;

        v159 = *(void **)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewHeightContraint];
        *(_QWORD *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewHeightContraint] = v158;

        objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewHeightContraint], "setActive:", 1);
LABEL_20:
        v106 = BCBubbleViewStyleLarge;
        v107 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)&v1[v83]);
        v109 = v108;
        v111 = static String._unconditionallyBridgeFromObjectiveC(_:)(v106);
        v112 = v110;
        if (v107 == v111 && v109 == v110)
        {
          swift_bridgeObjectRelease_n(v109, 2);
        }
        else
        {
          v113 = _stringCompareWithSmolCheck(_:_:expecting:)(v107, v109, v111, v110, 0);
          swift_bridgeObjectRelease(v109);
          swift_bridgeObjectRelease(v112);
          if ((v113 & 1) == 0)
          {
            if (v1[v160])
              v116 = &OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewFirstConstraintsIconSmall;
            else
              v116 = &OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainerFirstConstraintsIconSmall;
            v117 = *(_QWORD *)&v1[*v116];
            swift_bridgeObjectRetain(v117);
            v118 = Array._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease(v117);
            objc_msgSend(v166, "activateConstraints:", v118);

            v115.super.isa = (Class)objc_msgSend(v92, "layer");
            -[objc_class setCornerRadius:](v115.super.isa, "setCornerRadius:", 10.0);
LABEL_29:

            v119 = *(void **)&v1[v83];
            v120 = static String._unconditionallyBridgeFromObjectiveC(_:)(BCBubbleViewStyleSmall);
            v122 = v121;
            v124 = static String._unconditionallyBridgeFromObjectiveC(_:)(v119);
            v125 = v123;
            if (v120 == v124 && v122 == v123)
            {
              v126 = v119;
              swift_bridgeObjectRelease_n(v122, 2);
            }
            else
            {
              v127 = _stringCompareWithSmolCheck(_:_:expecting:)(v120, v122, v124, v123, 0);
              v128 = v119;
              swift_bridgeObjectRelease(v122);
              swift_bridgeObjectRelease(v125);
              if ((v127 & 1) == 0)
              {
                v134 = static String._unconditionallyBridgeFromObjectiveC(_:)(v106);
                v136 = v135;
                v138 = static String._unconditionallyBridgeFromObjectiveC(_:)(v119);
                v139 = v137;
                if (v134 == v138 && v136 == v137)
                {

                  swift_bridgeObjectRelease_n(v136, 2);
                  goto LABEL_35;
                }
                v157 = _stringCompareWithSmolCheck(_:_:expecting:)(v134, v136, v138, v137, 0);

                swift_bridgeObjectRelease(v136);
                swift_bridgeObjectRelease(v139);
                if ((v157 & 1) != 0)
                  goto LABEL_35;
                v129 = objc_msgSend(v92, "widthAnchor");
                v130 = objc_msgSend(v129, "constraintEqualToConstant:", 40.0);
LABEL_34:
                v131 = v130;

                v132 = *(void **)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewWidthConstraint];
                *(_QWORD *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewWidthConstraint] = v131;

LABEL_35:
                v133 = *(id *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewWidthConstraint];
                objc_msgSend(v133, "setActive:", 1);

                return;
              }
            }

            v129 = objc_msgSend(v92, "widthAnchor");
            v130 = objc_msgSend(v129, "constraintEqualToConstant:", 60.0);
            goto LABEL_34;
          }
        }
        v114 = *(_QWORD *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_largeLabelContainerConstraints];
        swift_bridgeObjectRetain(v114);
        v115.super.isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v114);
        objc_msgSend(v166, "activateConstraints:", v115.super.isa);
        goto LABEL_29;
      }
    }
LABEL_19:
    v100 = objc_msgSend(v91, "topAnchor");
    v101 = objc_msgSend(v1, "topAnchor");
    v102 = objc_msgSend(v100, "constraintEqualToAnchor:", v101);

    objc_msgSend(v102, "setActive:", 1);
    v103 = objc_msgSend(v92, "heightAnchor");
    v104 = objc_msgSend(v92, "widthAnchor");
    v105 = objc_msgSend(v103, "constraintEqualToAnchor:multiplier:", v104, 1.0);

    objc_msgSend(v105, "setActive:", 1);
    goto LABEL_20;
  }
  __break(1u);
}

id sub_1000A9F80()
{
  char *v0;
  char *v1;
  uint64_t v2;

  v1 = &v0[OBJC_IVAR____TtC8Business13IMBBubbleView_touch];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  v1[16] = 1;
  v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_defaultColor];
  objc_msgSend(v0, "setBackgroundColor:", v2);
  return objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_informationBackground], "setBackgroundColor:", v2);
}

uint64_t sub_1000A9FEC(uint64_t a1)
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
  result = sub_1000AAE94(a1);
  if ((v13 & 1) == 0)
  {
    v6 = v12;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v12)
    {
      v4 = result;
      if (result == 1 << *(_BYTE *)(a1 + 32))
      {
LABEL_6:
        sub_1000AB5E0(v4, v6, v2 != 0);
        return 0;
      }
LABEL_10:
      sub_1000AAC2C(v4, v6, v2 != 0, a1);
      v10 = v14;
      sub_1000AB5E0(v4, v6, v2 != 0);
      return v10;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000AA0F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;

  v1 = v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_delegate;
  result = swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_delegate);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(v1 + 8);
    ObjectType = swift_getObjectType(result);
    (*(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v4 + 8))(v0, &off_1000DA838, ObjectType, v4);
    return swift_unknownObjectRelease(v3);
  }
  return result;
}

void sub_1000AA190()
{
  uint64_t v0;
  id v1;
  int IsAccessibilityContentSizeCategory;
  uint64_t v3;
  NSString v4;
  NSString v5;
  NSString v6;
  NSString v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;
  id v14;
  id v15;

  if (UIApp)
  {
    v1 = objc_msgSend(UIApp, "preferredContentSizeCategory");
    IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

    v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_title + 8);
    if (IsAccessibilityContentSizeCategory)
    {
      if (v3)
      {
        swift_bridgeObjectRetain(*(_QWORD *)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_title + 8));
        v4 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v3);
        v5 = String._bridgeToObjectiveC()();
        v6 = String._bridgeToObjectiveC()();
        v7 = objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", v5, v6);

        if (!v7)
        {
          static String._unconditionallyBridgeFromObjectiveC(_:)(0);
          v9 = v8;
          v7 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v9);
        }
      }
      else
      {
        v7 = 0;
      }
      v10 = *(void **)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabel);
    }
    else
    {
      v10 = *(void **)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabel);
      if (v3)
      {
        swift_bridgeObjectRetain(*(_QWORD *)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_title + 8));
        v7 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v3);
      }
      else
      {
        v7 = 0;
      }
    }
    objc_msgSend(v10, "setText:", v7);

    v11 = (_QWORD *)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_title);
    v12 = *(_QWORD *)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_title + 8);
    if (!v12
      || (!*v11 ? (v13 = v12 == 0xE000000000000000) : (v13 = 0),
          v13 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v11, v12, 0, 0xE000000000000000, 0) & 1) != 0))
    {
      v14 = objc_msgSend(v10, "heightAnchor");
      v15 = objc_msgSend(v14, "constraintEqualToConstant:", 0.0);

      objc_msgSend(v15, "setActive:", 1);
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_1000AA424()
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
  uint64_t v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  char v32;
  void *v33;
  double v34;
  id v35;

  v1 = OBJC_IVAR____TtC8Business13IMBBubbleView_image;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_imageView), "setImage:", *(_QWORD *)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_image));
  if (!*(_QWORD *)(v0 + v1))
  {
    v23 = *(void **)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewWidthConstraint);
    if (v23)
      objc_msgSend(v23, "setConstant:", 1.0);
    objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_labelRightConstraint), "setConstant:", 0.0);
    v24 = BCBubbleViewStyleLarge;
    v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(v0
                                                                           + OBJC_IVAR____TtC8Business13IMBBubbleView_style));
    v27 = v26;
    v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
    if (v25 == v28 && v27 == v29)
    {
      swift_bridgeObjectRelease_n(v27, 2);
    }
    else
    {
      v31 = v29;
      v32 = _stringCompareWithSmolCheck(_:_:expecting:)(v25, v27, v28, v29, 0);
      swift_bridgeObjectRelease(v27);
      swift_bridgeObjectRelease(v31);
      if ((v32 & 1) == 0)
        return;
    }
    v33 = *(void **)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewHeightContraint);
    v34 = 0.0;
    goto LABEL_29;
  }
  v2 = OBJC_IVAR____TtC8Business13IMBBubbleView_style;
  v3 = BCBubbleViewStyleLarge;
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(v0
                                                                        + OBJC_IVAR____TtC8Business13IMBBubbleView_style));
  v6 = v5;
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  if (v4 == v7 && v6 == v8)
  {
    swift_bridgeObjectRelease_n(v6, 2);
    goto LABEL_24;
  }
  v10 = v8;
  v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, v7, v8, 0);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v10);
  if ((v11 & 1) != 0)
  {
LABEL_24:
    v33 = *(void **)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewHeightContraint);
    if (!v33)
      return;
    v34 = 150.0;
LABEL_29:
    objc_msgSend(v33, "setConstant:", v34);
    return;
  }
  v12 = *(void **)(v0 + OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewWidthConstraint);
  if (v12)
  {
    v13 = *(_QWORD *)(v0 + v2);
    v14 = BCBubbleViewStyleIcon;
    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
    v17 = v16;
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    v20 = v19;
    if (v15 == v18 && v17 == v19)
    {
      v22 = 40.0;
    }
    else if ((_stringCompareWithSmolCheck(_:_:expecting:)(v15, v17, v18, v19, 0) & 1) != 0)
    {
      v22 = 40.0;
    }
    else
    {
      v22 = 60.0;
    }
    v35 = v12;
    swift_bridgeObjectRelease(v17);
    swift_bridgeObjectRelease(v20);
    objc_msgSend(v35, "setConstant:", v22);

  }
}

void sub_1000AA700()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  char v11;
  id v12;
  objc_super v13;

  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for IMBBubbleView();
  objc_msgSendSuper2(&v13, "layoutSubviews");
  v1 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabelHeightConstraint];
  v2 = *(void **)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabel];
  v3 = v1;
  v4 = objc_msgSend(v2, "text");
  if (!v4)
    goto LABEL_7;
  v6 = v4;
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v9 = v8;

  if (v7)
    v10 = 0;
  else
    v10 = v9 == 0xE000000000000000;
  if (v10)
  {
    swift_bridgeObjectRelease(0xE000000000000000);
    goto LABEL_10;
  }
  v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, 0, 0xE000000000000000, 0);
  swift_bridgeObjectRelease(v9);
  v5 = 0;
  if ((v11 & 1) == 0)
  {
LABEL_7:
    v12 = objc_msgSend(v2, "text", v5);
    if (v12)
    {

      v5 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v5 = 0;
  }
LABEL_11:
  objc_msgSend(v3, "setActive:", v5);

}

uint64_t sub_1000AA864(void *a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(uint64_t))
{
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v9 = sub_1000090C8(0, &qword_1000EF7F0, UITouch_ptr);
  v10 = sub_100081938();
  v11 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v9, v10);
  v12 = a4;
  v13 = a1;
  a5(v11);

  return swift_bridgeObjectRelease(v11);
}

id sub_1000AA9A8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMBBubbleView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IMBBubbleView()
{
  return objc_opt_self(_TtC8Business13IMBBubbleView);
}

uint64_t sub_1000AABD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC8Business13IMBBubbleView_delegate;
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign(v4, a1);
  return swift_unknownObjectRelease(a1);
}

uint64_t sub_1000AAC10()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x3B0))();
}

void sub_1000AAC2C(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
        v12 = sub_1000090C8(0, &qword_1000EF7F0, UITouch_ptr);
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
          v16 = static NSObject.== infix(_:_:)(v15, v4);

          if ((v16 & 1) == 0)
          {
            v17 = ~v14;
            do
            {
              v7 = (v7 + 1) & v17;
              if (((*(_QWORD *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
                goto LABEL_24;
              v18 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v7);
              v19 = static NSObject.== infix(_:_:)(v18, v4);

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
  v10 = sub_1000090C8(0, &qword_1000EF7F0, UITouch_ptr);
  swift_unknownObjectRetain(v9);
  swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
  swift_unknownObjectRelease(v9);
}

uint64_t sub_1000AAE94(uint64_t a1)
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

void sub_1000AAF1C()
{
  _BYTE *v0;
  char *v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;

  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_touchDelay] = 0x4000000000000000;
  v1 = &v0[OBJC_IVAR____TtC8Business13IMBBubbleView_delegate];
  *((_QWORD *)v1 + 1) = 0;
  swift_unknownObjectWeakInit(v1, 0);
  v2 = (void *)BCBubbleViewStyleIcon;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_style] = BCBubbleViewStyleIcon;
  v0[OBJC_IVAR____TtC8Business13IMBBubbleView_type] = 0;
  v3 = OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabel;
  v4 = objc_allocWithZone((Class)UILabel);
  v5 = v2;
  *(_QWORD *)&v0[v3] = objc_msgSend(v4, "init");
  v6 = OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabel;
  *(_QWORD *)&v0[v6] = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v7 = OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainer;
  *(_QWORD *)&v0[v7] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  v8 = OBJC_IVAR____TtC8Business13IMBBubbleView_informationView;
  *(_QWORD *)&v0[v8] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  v9 = OBJC_IVAR____TtC8Business13IMBBubbleView_informationBackground;
  *(_QWORD *)&v0[v9] = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  v10 = OBJC_IVAR____TtC8Business13IMBBubbleView_imageView;
  *(_QWORD *)&v0[v10] = objc_msgSend(objc_allocWithZone((Class)UIImageView), "init");
  v11 = OBJC_IVAR____TtC8Business13IMBBubbleView_defaultColor;
  if (qword_1000EBBD8 != -1)
    swift_once(&qword_1000EBBD8, sub_10002D56C);
  v12 = (void *)qword_1000F8958;
  *(_QWORD *)&v0[v11] = qword_1000F8958;
  v13 = OBJC_IVAR____TtC8Business13IMBBubbleView_highlightColor;
  v14 = qword_1000EBBE0;
  v15 = v12;
  if (v14 != -1)
    swift_once(&qword_1000EBBE0, sub_10002D594);
  v16 = (void *)qword_1000F8960;
  *(_QWORD *)&v0[v13] = qword_1000F8960;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewHeightContraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewWidthConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_labelWidthConstraint] = 0;
  v17 = &v0[OBJC_IVAR____TtC8Business13IMBBubbleView_touch];
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = 0;
  v17[16] = 1;
  v18 = &v0[OBJC_IVAR____TtC8Business13IMBBubbleView_touchTimestamp];
  *(_QWORD *)v18 = 0;
  v18[8] = 1;
  v0[OBJC_IVAR____TtC8Business13IMBBubbleView_useAlternateTapTarget] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainerFirstConstraintsIconSmall] = _swiftEmptyArrayStorage;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewFirstConstraintsIconSmall] = _swiftEmptyArrayStorage;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_largeLabelContainerConstraints] = _swiftEmptyArrayStorage;
  v19 = OBJC_IVAR____TtC8Business13IMBBubbleView_imageViewSpacingConstraint;
  v20 = objc_allocWithZone((Class)NSLayoutConstraint);
  v21 = v16;
  *(_QWORD *)&v0[v19] = objc_msgSend(v20, "init");
  v22 = OBJC_IVAR____TtC8Business13IMBBubbleView_labelContainerWidthConstraint;
  *(_QWORD *)&v0[v22] = objc_msgSend(objc_allocWithZone((Class)NSLayoutConstraint), "init");
  v23 = OBJC_IVAR____TtC8Business13IMBBubbleView_labelRightConstraint;
  *(_QWORD *)&v0[v23] = objc_msgSend(objc_allocWithZone((Class)NSLayoutConstraint), "init");
  v24 = OBJC_IVAR____TtC8Business13IMBBubbleView_titleLabelWidthConstraint;
  *(_QWORD *)&v0[v24] = objc_msgSend(objc_allocWithZone((Class)NSLayoutConstraint), "init");
  v25 = OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabelWidthConstraint;
  *(_QWORD *)&v0[v25] = objc_msgSend(objc_allocWithZone((Class)NSLayoutConstraint), "init");
  v26 = OBJC_IVAR____TtC8Business13IMBBubbleView_subtitleLabelHeightConstraint;
  *(_QWORD *)&v0[v26] = objc_msgSend(objc_allocWithZone((Class)NSLayoutConstraint), "init");
  v27 = OBJC_IVAR____TtC8Business13IMBBubbleView_widthConstraint;
  *(_QWORD *)&v0[v27] = objc_msgSend(objc_allocWithZone((Class)NSLayoutConstraint), "init");
  v28 = OBJC_IVAR____TtC8Business13IMBBubbleView_heightConstraint;
  *(_QWORD *)&v0[v28] = objc_msgSend(objc_allocWithZone((Class)NSLayoutConstraint), "init");
  v29 = &v0[OBJC_IVAR____TtC8Business13IMBBubbleView_title];
  *v29 = 0;
  v29[1] = 0;
  v30 = &v0[OBJC_IVAR____TtC8Business13IMBBubbleView_subtitle];
  *v30 = 0;
  v30[1] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC8Business13IMBBubbleView_image] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000003ALL, 0x80000001000BCB40, "Business/IMBBubbleView.swift", 28, 2);
  __break(1u);
}

id sub_1000AB2AC(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  v3 = swift_bridgeObjectRetain(a1);
  v4 = (void *)sub_1000A9FEC(v3);
  swift_bridgeObjectRelease(a1);
  if (v4)
  {
    v5 = objc_msgSend(v1, "window");
    objc_msgSend(v4, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = &v1[OBJC_IVAR____TtC8Business13IMBBubbleView_touch];
  *(_QWORD *)v10 = v7;
  *((_QWORD *)v10 + 1) = v9;
  v10[16] = v4 == 0;
  v11 = *(_QWORD *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_highlightColor];
  objc_msgSend(v1, "setBackgroundColor:", v11);
  return objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC8Business13IMBBubbleView_informationBackground], "setBackgroundColor:", v11);
}

void sub_1000AB38C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t Strong;
  char *v6;
  double v7;
  double v8;
  uint64_t v9;
  double *v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t ObjectType;
  id v27;
  CGPoint v28;
  CGRect v29;

  v2 = v1;
  v4 = swift_bridgeObjectRetain(a1);
  v27 = (id)sub_1000A9FEC(v4);
  swift_bridgeObjectRelease(a1);
  if (!v27)
  {
    (*(void (**)(void))((swift_isaMask & *v2) + 0x3A8))();
    return;
  }
  Strong = (uint64_t)objc_msgSend(v27, "tapCount");
  if (Strong)
  {
    v6 = (char *)v2 + OBJC_IVAR____TtC8Business13IMBBubbleView_touchTimestamp;
    if ((*((_BYTE *)v2 + OBJC_IVAR____TtC8Business13IMBBubbleView_touchTimestamp + 8) & 1) != 0
      || (v7 = *(double *)v6 + 2.0, Strong = (uint64_t)objc_msgSend(v27, "timestamp"), v8 >= v7))
    {
      Strong = (uint64_t)objc_msgSend(v27, "timestamp");
      *(_QWORD *)v6 = v9;
      v6[8] = 0;
      v10 = (double *)((char *)v2 + OBJC_IVAR____TtC8Business13IMBBubbleView_touch);
      if ((*((_BYTE *)v2 + OBJC_IVAR____TtC8Business13IMBBubbleView_touch + 16) & 1) == 0)
      {
        v12 = *v10;
        v11 = v10[1];
        v13 = objc_msgSend(v2, "window");
        objc_msgSend(v27, "locationInView:", v13);
        v15 = v14;
        v17 = v16;

        v18 = sqrt((v12 - v15) * (v12 - v15) + (v11 - v17) * (v11 - v17));
        Strong = (uint64_t)objc_msgSend(v27, "locationInView:", v2);
        if (*((_BYTE *)v2 + OBJC_IVAR____TtC8Business13IMBBubbleView_useAlternateTapTarget) == 1)
        {
          v21 = v19;
          v22 = v20;
          objc_msgSend(*(id *)((char *)v2 + OBJC_IVAR____TtC8Business13IMBBubbleView_informationBackground), "frame");
          v28.x = v21;
          v28.y = v22;
          Strong = CGRectContainsPoint(v29, v28);
          if (v18 < 15.0)
          {
            if ((Strong & 1) == 0)
            {
              v23 = (char *)v2 + OBJC_IVAR____TtC8Business13IMBBubbleView_delegate;
              Strong = swift_unknownObjectWeakLoadStrong((char *)v2 + OBJC_IVAR____TtC8Business13IMBBubbleView_delegate);
              if (Strong)
              {
                v24 = Strong;
                v25 = *((_QWORD *)v23 + 1);
                ObjectType = swift_getObjectType(Strong);
                (*(void (**)(_QWORD *, _UNKNOWN **, uint64_t, uint64_t))(v25 + 16))(v2, &off_1000DA838, ObjectType, v25);
                Strong = swift_unknownObjectRelease(v24);
              }
              goto LABEL_14;
            }
            goto LABEL_13;
          }
        }
        else if (v18 < 15.0)
        {
LABEL_13:
          Strong = (*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x3B8))();
        }
      }
    }
  }
LABEL_14:
  (*(void (**)(uint64_t))((swift_isaMask & *v2) + 0x3A8))(Strong);

}

uint64_t sub_1000AB5E0(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC8BusinessP33_C097B0C5F69240201C3AD7A1914B5D6019ResourceBundleClass);
}
