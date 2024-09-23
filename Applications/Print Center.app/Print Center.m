uint64_t sub_100005324()
{
  uint64_t v0;
  uint64_t result;

  v0 = type metadata accessor for PrintMonitor(0);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  result = sub_1000053D0();
  qword_100021140 = result;
  return result;
}

uint64_t sub_100005360()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100018EE0);
  v2 = swift_getKeyPath(&unk_100018F08);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  return v4;
}

uint64_t sub_1000053D0()
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
  void (*v16)(uint64_t, char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  v1 = v0;
  v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v26 = *(_QWORD *)(v2 - 8);
  v27 = v2;
  __chkstk_darwin(v2);
  v25 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100006A30(&qword_100020C38);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = v1 + OBJC_IVAR____TtC12Print_Center12PrintMonitor__completedJobs;
  v28 = &_swiftEmptyArrayStorage;
  v15 = sub_100006A30((uint64_t *)&unk_100020B08);
  Published.init(initialValue:)(&v28, v15);
  v16 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
  v16(v14, v13, v10);
  v17 = v1 + OBJC_IVAR____TtC12Print_Center12PrintMonitor__pendingJobs;
  v28 = &_swiftEmptyArrayStorage;
  Published.init(initialValue:)(&v28, v15);
  v16(v17, v13, v10);
  v18 = OBJC_IVAR____TtC12Print_Center12PrintMonitor_workQueue;
  v19 = sub_10000853C(0, &qword_100020C40, OS_dispatch_queue_ptr);
  static DispatchQoS.unspecified.getter(v19);
  v28 = &_swiftEmptyArrayStorage;
  v20 = sub_1000085EC(&qword_100020C48, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v21 = sub_100006A30(&qword_100020C50);
  v22 = sub_1000091DC(&qword_100020C58, &qword_100020C50, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v28, v21, v22, v4, v20);
  v23 = v25;
  (*(void (**)(char *, _QWORD, uint64_t))(v26 + 104))(v25, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v27);
  *(_QWORD *)(v1 + v18) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0x6E6F4D746E697250, 0xED000051726F7469, v9, v6, v23, 0);
  sub_100005C14();
  return v1;
}

uint64_t sub_100005674()
{
  uint64_t v0;
  id v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void *v8;

  v1 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v1, "removeObserver:", v0);

  KeyPath = swift_getKeyPath(&unk_100018EE0);
  v3 = swift_getKeyPath(&unk_100018F08);
  v8 = &_swiftEmptyArrayStorage;
  swift_retain(v0);
  static Published.subscript.setter(&v8, v0, KeyPath, v3);
  v4 = v0 + OBJC_IVAR____TtC12Print_Center12PrintMonitor__completedJobs;
  v5 = sub_100006A30(&qword_100020C38);
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(v0 + OBJC_IVAR____TtC12Print_Center12PrintMonitor__pendingJobs, v5);

  return v0;
}

uint64_t sub_100005774()
{
  uint64_t v0;

  sub_100005674();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100005798()
{
  return type metadata accessor for PrintMonitor(0);
}

uint64_t type metadata accessor for PrintMonitor(uint64_t a1)
{
  uint64_t result;

  result = qword_100020AF0;
  if (!qword_100020AF0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PrintMonitor);
  return result;
}

void sub_1000057DC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  sub_10000677C(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = v4[0];
    v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
  }
}

uint64_t sub_100005858(void **a1, id *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void *v19;
  id v20;
  __objc2_class_ro *v21;
  id v22;
  void *v23;
  void (*v24)(char *, char *, uint64_t);
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v26)(char *, uint64_t, uint64_t);
  char *v27;
  char *v28;
  void (*v29)(char *, char *, uint64_t);
  id v30;
  void *v31;
  char *v32;
  char v33;
  void (*v34)(char *, uint64_t);
  id v36;
  uint64_t v37;
  unsigned int (*v38)(char *, uint64_t, uint64_t);
  void (*v39)(char *, uint64_t, uint64_t, uint64_t);
  char *v40;
  char *v41;
  id v42;

  v4 = sub_100006A30(&qword_100020CA0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v37 - v8;
  v10 = type metadata accessor for Date(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v41 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v37 - v15;
  __chkstk_darwin(v14);
  v18 = (char *)&v37 - v17;
  v19 = *a1;
  v20 = *a2;
  v21 = &PCPrintJob__metaData;
  if (objc_msgSend(v19, "state") != (id)5 && objc_msgSend(v19, "state") != (id)10
    || objc_msgSend(v20, "state") != (id)5 && objc_msgSend(v20, "state") != (id)10)
  {
    goto LABEL_16;
  }
  v42 = v20;
  v22 = objc_msgSend(v19, "timeAtProcessing");
  if (!v22)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
    v7 = v9;
LABEL_14:
    v20 = v42;
    goto LABEL_15;
  }
  v23 = v22;
  v40 = v18;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v24 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v24(v9, v16, v10);
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v25(v9, 0, 1, v10);
  v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v26(v9, 1, v10) != 1)
  {
    v38 = v26;
    v39 = v25;
    v27 = v40;
    v28 = v9;
    v29 = v24;
    v24(v40, v28, v10);
    v30 = objc_msgSend(v42, "timeAtProcessing");
    if (v30)
    {
      v31 = v30;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      v29(v7, v16, v10);
      v39(v7, 0, 1, v10);
      v21 = &PCPrintJob__metaData;
      if (v38(v7, 1, v10) != 1)
      {
        v32 = v41;
        v29(v41, v7, v10);
        v33 = static Date.< infix(_:_:)(v27, v32);
        v34 = *(void (**)(char *, uint64_t))(v11 + 8);
        v34(v32, v10);
        v34(v27, v10);
        return v33 & 1;
      }
    }
    else
    {
      v39(v7, 1, 1, v10);
      v21 = &PCPrintJob__metaData;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v27, v10);
    goto LABEL_14;
  }
  v7 = v9;
  v20 = v42;
  v21 = &PCPrintJob__metaData;
LABEL_15:
  sub_10000921C((uint64_t)v7);
LABEL_16:
  if (objc_msgSend(v19, *(SEL *)&v21[29].ivar_base_size) == (id)5
    || objc_msgSend(v19, *(SEL *)&v21[29].ivar_base_size) == (id)10)
  {
    v33 = 1;
  }
  else if (objc_msgSend(v20, *(SEL *)&v21[29].ivar_base_size) == (id)5
         || objc_msgSend(v20, *(SEL *)&v21[29].ivar_base_size) == (id)10)
  {
    v33 = 0;
  }
  else
  {
    v36 = objc_msgSend(v19, "localJobID");
    v33 = (uint64_t)v36 < (uint64_t)objc_msgSend(v20, "localJobID");
  }
  return v33 & 1;
}

void sub_100005C14()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void **v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  uint64_t (*v17)();
  uint64_t v18;

  sub_100005EC0();
  v1 = (void *)objc_opt_self(NSNotificationCenter);
  v2 = objc_msgSend(v1, "defaultCenter");
  v3 = (void *)objc_opt_self(NSOperationQueue);
  v4 = objc_msgSend(v3, "mainQueue");
  v17 = sub_1000091D0;
  v18 = v0;
  v13 = _NSConcreteStackBlock;
  v14 = 1107296256;
  v15 = sub_100005E1C;
  v16 = &unk_10001D028;
  v5 = _Block_copy(&v13);
  v6 = v18;
  swift_retain(v0);
  swift_release(v6);
  v7 = objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", CFSTR("PKJobListNotification"), 0, v4, v5);
  _Block_release(v5);
  swift_unknownObjectRelease(v7);

  v8 = objc_msgSend(v1, "defaultCenter");
  v9 = objc_msgSend(v3, "mainQueue");
  v17 = sub_1000091D4;
  v18 = v0;
  v13 = _NSConcreteStackBlock;
  v14 = 1107296256;
  v15 = sub_100005E1C;
  v16 = &unk_10001D050;
  v10 = _Block_copy(&v13);
  v11 = v18;
  swift_retain(v0);
  swift_release(v11);
  v12 = objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", CFSTR("PKJobProgressNotification"), 0, v9, v10);
  _Block_release(v10);
  swift_unknownObjectRelease(v12);

}

uint64_t sub_100005E1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *);
  uint64_t v11;

  v4 = type metadata accessor for Notification(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *))(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a2);
  swift_retain(v8);
  v9(v7);
  swift_release(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100005EC0()
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
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  void *v16;
  _QWORD aBlock[5];
  uint64_t v18;

  v1 = type metadata accessor for DispatchWorkItemFlags(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(v0 + OBJC_IVAR____TtC12Print_Center12PrintMonitor_workQueue);
  aBlock[4] = sub_1000085CC;
  v18 = v0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000065D8;
  aBlock[3] = &unk_10001CF88;
  v9 = _Block_copy(aBlock);
  v10 = swift_retain(v0);
  static DispatchQoS.unspecified.getter(v10);
  v16 = &_swiftEmptyArrayStorage;
  v11 = sub_1000085EC(&qword_100020C70, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v12 = sub_100006A30(&qword_100020C78);
  v13 = sub_1000091DC(&qword_100020C80, &qword_100020C78, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v16, v12, v13, v1, v11);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v4, v9);
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_release(v18);
}

uint64_t sub_10000609C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t i;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  _QWORD aBlock[5];
  uint64_t v43;

  v37 = a1;
  v1 = type metadata accessor for DispatchWorkItemFlags(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  v39 = *(_QWORD *)(v4 - 8);
  v40 = v4;
  __chkstk_darwin(v4);
  v38 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = swift_allocObject(&unk_10001CFC0, 24, 7);
  v7 = objc_msgSend((id)objc_opt_self(PCPrintJob), "jobs");
  v8 = sub_10000853C(0, (unint64_t *)&qword_100020C60, &off_10001C9D0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);

  *(_QWORD *)(v6 + 16) = v9;
  v10 = (uint64_t *)(v6 + 16);
  aBlock[0] = &_swiftEmptyArrayStorage;
  if ((unint64_t)v9 >> 62)
  {
    if (v9 < 0)
      v19 = v9;
    else
      v19 = v9 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v9);
    result = _CocoaArrayWrapper.endIndex.getter(v19);
    v11 = result;
    if (result)
      goto LABEL_3;
LABEL_20:
    swift_bridgeObjectRelease(v9);
    v18 = &_swiftEmptyArrayStorage;
    goto LABEL_21;
  }
  v11 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain(v9);
  if (!v11)
    goto LABEL_20;
LABEL_3:
  if (v11 < 1)
    goto LABEL_29;
  v35 = v2;
  v36 = v1;
  for (i = 0; i != v11; ++i)
  {
    if ((v9 & 0xC000000000000001) != 0)
      v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v9);
    else
      v14 = *(id *)(v9 + 8 * i + 32);
    v15 = v14;
    if (objc_msgSend(v14, "state", v35, v36) == (id)7
      || objc_msgSend(v15, "state") == (id)9
      || objc_msgSend(v15, "state") == (id)10
      || objc_msgSend(v15, "state") == (id)8)
    {
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      v16 = *(_QWORD *)(aBlock[0] + 16);
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v16);
      v17 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v16, v15);
      specialized ContiguousArray._endMutation()(v17);
    }
    else
    {

    }
  }
  swift_bridgeObjectRelease(v9);
  v18 = (void *)aBlock[0];
  v2 = v35;
  v1 = v36;
LABEL_21:
  swift_retain(v18);
  v20 = sub_100008A1C((uint64_t *)(v6 + 16), (uint64_t)v18);
  result = swift_release(v18);
  v21 = *v10;
  if ((unint64_t)*v10 >> 62)
  {
    if (v21 < 0)
      v34 = *v10;
    else
      v34 = v21 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v10);
    v22 = _CocoaArrayWrapper.endIndex.getter(v34);
    result = swift_bridgeObjectRelease(v21);
    if (v22 >= v20)
      goto LABEL_23;
  }
  else
  {
    v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v22 >= v20)
    {
LABEL_23:
      sub_100008EE8(v20, v22);
      swift_release(v18);
      sub_10000853C(0, &qword_100020C40, OS_dispatch_queue_ptr);
      v23 = (void *)static OS_dispatch_queue.main.getter();
      v24 = swift_allocObject(&unk_10001CFE8, 32, 7);
      v25 = v37;
      *(_QWORD *)(v24 + 16) = v6;
      *(_QWORD *)(v24 + 24) = v25;
      aBlock[4] = sub_1000091C8;
      v43 = v24;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000065D8;
      aBlock[3] = &unk_10001D000;
      v26 = _Block_copy(aBlock);
      v27 = v43;
      swift_retain(v6);
      swift_retain(v25);
      v28 = swift_release(v27);
      v29 = v38;
      static DispatchQoS.unspecified.getter(v28);
      aBlock[0] = &_swiftEmptyArrayStorage;
      v30 = sub_1000085EC(&qword_100020C70, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      v31 = sub_100006A30(&qword_100020C78);
      v32 = sub_1000091DC(&qword_100020C80, &qword_100020C78, (uint64_t)&protocol conformance descriptor for [A]);
      v33 = v41;
      dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v31, v32, v1, v30);
      OS_dispatch_queue.async(group:qos:flags:execute:)(0, v29, v33, v26);
      _Block_release(v26);

      (*(void (**)(char *, uint64_t))(v2 + 8))(v33, v1);
      (*(void (**)(char *, uint64_t))(v39 + 8))(v29, v40);
      return swift_release(v6);
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_100006504(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  _BYTE v12[24];

  swift_beginAccess(a1 + 16, v12, 0, 0);
  v4 = *(_QWORD *)(a1 + 16);
  KeyPath = swift_getKeyPath(&unk_100018EE0);
  v6 = swift_getKeyPath(&unk_100018F08);
  v11 = v4;
  swift_bridgeObjectRetain(v4);
  swift_retain(a2);
  static Published.subscript.setter(&v11, a2, KeyPath, v6);
  v7 = type metadata accessor for PrintMonitor(0);
  v8 = sub_1000085EC((unint64_t *)&qword_100020C88, type metadata accessor for PrintMonitor, (uint64_t)&unk_100018E58);
  v9 = ObservableObject<>.objectWillChange.getter(v7, v8);
  ObservableObjectPublisher.send()();
  return swift_release(v9);
}

uint64_t sub_1000065DC(uint64_t a1)
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

uint64_t sub_100006608()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  KeyPath = swift_getKeyPath(&unk_100018EE0);
  v2 = swift_getKeyPath(&unk_100018F08);
  static Published.subscript.getter(&v13, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  v3 = v13;
  if (!((unint64_t)v13 >> 62))
  {
    v4 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(v13);
    if (v4)
      goto LABEL_3;
    return swift_bridgeObjectRelease_n(v3, 2);
  }
  if (v13 < 0)
    v12 = v13;
  else
    v12 = v13 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v13);
  result = _CocoaArrayWrapper.endIndex.getter(v12);
  v4 = result;
  if (!result)
    return swift_bridgeObjectRelease_n(v3, 2);
LABEL_3:
  if (v4 >= 1)
  {
    v6 = 0;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v3);
      else
        v7 = *(id *)(v3 + 8 * v6 + 32);
      v8 = v7;
      ++v6;
      objc_msgSend(v7, "update");
      v9 = sub_10000853C(0, (unint64_t *)&qword_100020C60, &off_10001C9D0);
      v10 = sub_100008574();
      v11 = ObservableObject<>.objectWillChange.getter(v9, v10);
      ObservableObjectPublisher.send()();

      swift_release(v11);
    }
    while (v4 != v6);
    return swift_bridgeObjectRelease_n(v3, 2);
  }
  __break(1u);
  return result;
}

void sub_10000677C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100020B00)
  {
    v2 = sub_1000067D4((uint64_t *)&unk_100020B08);
    v3 = type metadata accessor for Published(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100020B00);
  }
}

uint64_t sub_1000067D4(uint64_t *a1)
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

void type metadata accessor for DisplayCategory(uint64_t a1)
{
  sub_100006840(a1, &qword_100020C28, (uint64_t)&unk_10001CF58);
}

void type metadata accessor for DeviceCategory(uint64_t a1)
{
  sub_100006840(a1, &qword_100020C30, (uint64_t)&unk_10001CF78);
}

void sub_100006840(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_100006884@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for PrintMonitor(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000068C0@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for PrintMonitor(0);
  result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_100006900()
{
  return 1;
}

uint64_t sub_100006908@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100018EE0);
  v5 = swift_getKeyPath(&unk_100018F08);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(KeyPath);
  result = swift_release(v5);
  *a2 = v7;
  return result;
}

uint64_t sub_100006984(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100018EE0);
  v5 = swift_getKeyPath(&unk_100018F08);
  v7 = v2;
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

void sub_1000069FC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_100006A08@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void *sub_100006A18()
{
  return &protocol witness table for ObjectIdentifier;
}

void *sub_100006A24()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100006A30(uint64_t *a1)
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

BOOL sub_100006A70(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100006A84(uint64_t *a1)
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
    v2 = sub_1000139E8(v2);
    *a1 = v2;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v7[0] = v2 + 32;
  v7[1] = v4;
  sub_100006BF0(v7);
  return specialized ContiguousArray._endMutation()(v5);
}

_QWORD *sub_100006AFC(unint64_t a1)
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
      v3 = sub_100006A30(&qword_100020C90);
      v4 = (_QWORD *)swift_allocObject(v3, 8 * v2 + 32, 7);
      v5 = j__malloc_size(v4);
      v6 = v5 - 32;
      if (v5 < 32)
        v6 = v5 - 25;
      v4[2] = v2;
      v4[3] = (2 * (v6 >> 3)) | 1;
    }
    swift_bridgeObjectRetain(v1);
    v7 = sub_100008290((uint64_t)(v4 + 4), v2, v1);
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

void sub_100006BF0(uint64_t *a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  Swift::Int v24;
  Swift::Int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  Swift::Int v30;
  char *v31;
  Swift::Int v32;
  uint64_t v33;
  __objc2_class_ro *v34;
  Swift::Int v35;
  Swift::Int v36;
  Swift::Int v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  Swift::Int v43;
  char v44;
  Swift::Int v45;
  uint64_t *v46;
  Swift::Int v47;
  Swift::Int v48;
  uint64_t *v49;
  uint64_t v50;
  Swift::Int v51;
  uint64_t v52;
  void *v53;
  Swift::Int v54;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  char *v61;
  uint64_t v62;
  void (*v63)(char *, char *, uint64_t);
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t (*v67)(char *, uint64_t, uint64_t);
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  void *v73;
  char *v74;
  uint64_t v75;
  char *v76;
  char *v77;
  char *v78;
  char v79;
  void (*v80)(char *, uint64_t);
  char *v81;
  char *v82;
  id v83;
  id v84;
  void *v85;
  id v86;
  id v87;
  int v88;
  void *v89;
  id v90;
  id v91;
  id v92;
  void *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  void (*v97)(char *, char *, uint64_t);
  char *v98;
  void (*v99)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t (*v100)(char *, uint64_t, uint64_t);
  int v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  void *v105;
  char *v106;
  uint64_t v107;
  char *v108;
  char *v109;
  char *v110;
  char v111;
  void (*v112)(char *, uint64_t);
  char v113;
  char *v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  char *v118;
  char *v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  BOOL v131;
  unint64_t v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  BOOL v141;
  uint64_t v142;
  char v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  BOOL v148;
  uint64_t v149;
  uint64_t v150;
  char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  uint64_t v160;
  char *v161;
  char *v162;
  uint64_t v163;
  char *v164;
  unint64_t v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  char *v170;
  uint64_t v171;
  uint64_t v172;
  unint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  char *v177;
  unint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t *v181;
  uint64_t v182;
  char *v183;
  char *v184;
  Swift::Int v185;
  char *v186;
  char *v187;
  char *v188;
  Swift::Int v189;
  char *v190;
  Swift::Int v191;
  Swift::Int v192;
  uint64_t v193;
  void **v194;
  char *v195;
  uint64_t v196;
  uint64_t v197;
  char *v198;
  char *v199;
  void (*v200)(char *, uint64_t, uint64_t, uint64_t);
  Swift::Int v201;
  char *v202;
  uint64_t v203;
  uint64_t v204;
  id v205;
  void *v206;
  uint64_t v207;

  v3 = sub_100006A30(&qword_100020CA0);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v180 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v202 = (char *)&v180 - v8;
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v180 - v10;
  __chkstk_darwin(v9);
  v188 = (char *)&v180 - v12;
  v13 = type metadata accessor for Date(0);
  v204 = *(_QWORD *)(v13 - 8);
  v14 = __chkstk_darwin(v13);
  v190 = (char *)&v180 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v14);
  v198 = (char *)&v180 - v17;
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v180 - v19;
  v21 = __chkstk_darwin(v18);
  v199 = (char *)&v180 - v22;
  __chkstk_darwin(v21);
  v186 = (char *)&v180 - v23;
  v24 = a1[1];
  v25 = _minimumMergeRunLength(_:)(v24);
  if (v25 >= v24)
  {
    if ((v24 & 0x8000000000000000) == 0)
    {
      if (v24)
        sub_100007A80(0, v24, 1, a1);
      return;
    }
    goto LABEL_189;
  }
  if (v24 >= 0)
    v26 = v24;
  else
    v26 = v24 + 1;
  if (v24 < -1)
  {
LABEL_188:
    __break(1u);
LABEL_189:
    __break(1u);
LABEL_190:
    __break(1u);
LABEL_191:
    __break(1u);
LABEL_192:
    __break(1u);
LABEL_193:
    __break(1u);
LABEL_194:
    __break(1u);
LABEL_195:
    __break(1u);
LABEL_196:
    __break(1u);
    return;
  }
  v183 = v20;
  v184 = v11;
  v195 = v6;
  v191 = v24;
  v185 = v25;
  v196 = v1;
  if (v24 <= 1)
  {
    v30 = v24;
    v31 = (char *)_swiftEmptyArrayStorage;
    v207 = (uint64_t)_swiftEmptyArrayStorage;
    v194 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v30 != 1)
    {
      v117 = _swiftEmptyArrayStorage[2];
      if (v117 < 2)
      {
LABEL_164:
        v179 = swift_bridgeObjectRelease(v31);
        *(_QWORD *)((v207 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
        specialized Array._endMutation()(v179);
        swift_bridgeObjectRelease(v207);
        return;
      }
      goto LABEL_151;
    }
  }
  else
  {
    v27 = v26 >> 1;
    v28 = sub_10000853C(0, (unint64_t *)&qword_100020C60, &off_10001C9D0);
    v29 = static Array._allocateBufferUninitialized(minimumCapacity:)(v27, v28);
    *(_QWORD *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10) = v27;
    v194 = (void **)((v29 & 0xFFFFFFFFFFFFFF8) + 32);
    v207 = v29;
  }
  v203 = v13;
  v32 = 0;
  v181 = a1;
  v33 = *a1;
  v182 = *a1 - 8;
  v31 = (char *)_swiftEmptyArrayStorage;
  v34 = &PCPrintJob__metaData;
  v35 = v191;
  v197 = v33;
  while (1)
  {
    v36 = v32;
    v37 = v32 + 1;
    v187 = v31;
    v192 = v32;
    if (v32 + 1 >= v35)
    {
      ++v32;
      goto LABEL_27;
    }
    v38 = *(void **)(v33 + 8 * v37);
    v205 = *(id *)(v33 + 8 * v32);
    v39 = v205;
    v206 = v38;
    v40 = v38;
    v41 = v39;
    v42 = v196;
    LODWORD(v201) = sub_100005858(&v206, &v205);
    if (v42)
    {
      swift_bridgeObjectRelease(v31);

      goto LABEL_149;
    }
    v196 = 0;

    v43 = v32 + 2;
    if (v32 + 2 < v191)
    {
      while (1)
      {
        while (1)
        {
          v89 = *(void **)(v33 + 8 * v37);
          v90 = *(id *)(v33 + 8 * v43);
          v91 = v89;
          if ((objc_msgSend(v90, *(SEL *)&v34[29].ivar_base_size) == (id)5
             || objc_msgSend(v90, *(SEL *)&v34[29].ivar_base_size) == (id)10)
            && (objc_msgSend(v91, *(SEL *)&v34[29].ivar_base_size) == (id)5
             || objc_msgSend(v91, *(SEL *)&v34[29].ivar_base_size) == (id)10))
          {
            v92 = objc_msgSend(v90, "timeAtProcessing");
            if (v92)
            {
              v93 = v92;
              v94 = v199;
              static Date._unconditionallyBridgeFromObjectiveC(_:)();

              v96 = v203;
              v95 = v204;
              v97 = *(void (**)(char *, char *, uint64_t))(v204 + 32);
              v98 = v188;
              v97(v188, v94, v203);
              v99 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v95 + 56);
              v99(v98, 0, 1, v96);
              v100 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v95 + 48);
              v101 = v100(v98, 1, v96);
              v102 = (uint64_t)v98;
              if (v101 != 1)
              {
                v103 = v203;
                v97(v186, v188, v203);
                v104 = objc_msgSend(v91, "timeAtProcessing");
                if (v104)
                {
                  v105 = v104;
                  v106 = v199;
                  static Date._unconditionallyBridgeFromObjectiveC(_:)();

                  v107 = (uint64_t)v184;
                  v108 = v106;
                  v33 = v197;
                  v97(v184, v108, v103);
                  v99((char *)v107, 0, 1, v103);
                  if (v100((char *)v107, 1, v103) != 1)
                  {
                    v109 = v183;
                    v97(v183, (char *)v107, v103);
                    v110 = v186;
                    v111 = static Date.< infix(_:_:)(v186, v109);
                    v112 = *(void (**)(char *, uint64_t))(v204 + 8);
                    v112(v109, v103);
                    v112(v110, v103);

                    v44 = v201;
                    v113 = v201 ^ v111;
                    v31 = v187;
                    v34 = &PCPrintJob__metaData;
                    v36 = v192;
                    if ((v113 & 1) != 0)
                      goto LABEL_16;
                    goto LABEL_67;
                  }
                }
                else
                {
                  v107 = (uint64_t)v184;
                  v99(v184, 1, 1, v103);
                }
                (*(void (**)(char *, uint64_t))(v204 + 8))(v186, v103);
                v102 = v107;
              }
            }
            else
            {
              v114 = v188;
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v204 + 56))(v188, 1, 1, v203);
              v102 = (uint64_t)v114;
            }
            sub_10000921C(v102);
            v31 = v187;
            v34 = &PCPrintJob__metaData;
            v36 = v192;
          }
          if (objc_msgSend(v90, *(SEL *)&v34[29].ivar_base_size) != (id)5
            && objc_msgSend(v90, *(SEL *)&v34[29].ivar_base_size) != (id)10)
          {
            break;
          }

          if ((v201 & 1) == 0)
          {
            v32 = v43;
            goto LABEL_27;
          }
          v44 = 1;
LABEL_67:
          v32 = v43 + 1;
          v37 = v43;
          v43 = v32;
          if (v32 >= v191)
            goto LABEL_17;
        }
        if (objc_msgSend(v91, *(SEL *)&v34[29].ivar_base_size) == (id)5)
        {

          if ((v201 & 1) != 0)
            goto LABEL_146;
          v44 = 0;
          goto LABEL_67;
        }
        if (objc_msgSend(v91, *(SEL *)&v34[29].ivar_base_size) != (id)10)
        {
          v86 = objc_msgSend(v90, "localJobID");
          v87 = objc_msgSend(v91, "localJobID");

          v148 = (uint64_t)v86 < (uint64_t)v87;
          v31 = v187;
          v88 = !v148;
          v44 = v201;
          if ((v201 & 1) == v88)
            break;
          goto LABEL_67;
        }

        if ((v201 & 1) != 0)
        {
LABEL_146:
          v32 = v43;
          goto LABEL_18;
        }
        v32 = v43 + 1;
        v37 = v43;
        v43 = v32;
        if (v32 >= v191)
          goto LABEL_27;
      }
    }
LABEL_16:
    v44 = v201;
    v32 = v43;
LABEL_17:
    if ((v44 & 1) != 0)
    {
LABEL_18:
      v45 = v185;
      if (v32 < v36)
        goto LABEL_192;
      if (v36 < v32)
      {
        v46 = (uint64_t *)(v182 + 8 * v32);
        v47 = v32;
        v48 = v36;
        v49 = (uint64_t *)(v33 + 8 * v36);
        do
        {
          if (v48 != --v47)
          {
            if (!v33)
              goto LABEL_195;
            v50 = *v49;
            *v49 = *v46;
            *v46 = v50;
          }
          ++v48;
          --v46;
          ++v49;
        }
        while (v48 < v47);
      }
    }
    else
    {
LABEL_27:
      v45 = v185;
    }
    if (v32 >= v191)
      goto LABEL_94;
    if (__OFSUB__(v32, v36))
      goto LABEL_187;
    if (v32 - v36 >= v45)
      goto LABEL_94;
    if (__OFADD__(v36, v45))
      goto LABEL_190;
    v51 = v191;
    if (v36 + v45 < v191)
      v51 = v36 + v45;
    if (v51 < v36)
      goto LABEL_191;
    if (v32 == v51)
      goto LABEL_94;
    v52 = v182 + 8 * v32;
    v189 = v51;
    while (2)
    {
      v53 = *(void **)(v33 + 8 * v32);
      v54 = v36;
      v193 = v52;
      v55 = v52;
      v201 = v32;
      while (1)
      {
        v56 = *(void **)v55;
        v57 = v53;
        v58 = v56;
        if ((objc_msgSend(v57, *(SEL *)&v34[29].ivar_base_size) == (id)5
           || objc_msgSend(v57, *(SEL *)&v34[29].ivar_base_size) == (id)10)
          && (objc_msgSend(v58, *(SEL *)&v34[29].ivar_base_size) == (id)5
           || objc_msgSend(v58, *(SEL *)&v34[29].ivar_base_size) == (id)10))
        {
          v59 = objc_msgSend(v57, "timeAtProcessing");
          if (v59)
          {
            v60 = v59;
            v61 = v199;
            static Date._unconditionallyBridgeFromObjectiveC(_:)();

            v62 = v204;
            v63 = *(void (**)(char *, char *, uint64_t))(v204 + 32);
            v64 = v202;
            v65 = v61;
            v66 = v203;
            v63(v202, v65, v203);
            v200 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v62 + 56);
            v200(v64, 0, 1, v66);
            v67 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v62 + 48);
            v68 = v66;
            v34 = &PCPrintJob__metaData;
            v69 = v67(v64, 1, v68);
            v70 = (uint64_t)v64;
            if (v69 != 1)
            {
              v71 = v203;
              v63(v198, v202, v203);
              v72 = objc_msgSend(v58, "timeAtProcessing");
              if (v72)
              {
                v73 = v72;
                v74 = v199;
                static Date._unconditionallyBridgeFromObjectiveC(_:)();

                v75 = (uint64_t)v195;
                v76 = v74;
                v33 = v197;
                v63(v195, v76, v71);
                v200((char *)v75, 0, 1, v71);
                if (v67((char *)v75, 1, v71) != 1)
                {
                  v77 = v190;
                  v63(v190, (char *)v75, v71);
                  v78 = v198;
                  v79 = static Date.< infix(_:_:)(v198, v77);
                  v80 = *(void (**)(char *, uint64_t))(v204 + 8);
                  v80(v77, v71);
                  v81 = v78;
                  v33 = v197;
                  v80(v81, v71);

                  v34 = &PCPrintJob__metaData;
                  v32 = v201;
                  if ((v79 & 1) == 0)
                    goto LABEL_38;
                  goto LABEL_60;
                }
              }
              else
              {
                v75 = (uint64_t)v195;
                v200(v195, 1, 1, v71);
              }
              (*(void (**)(char *, uint64_t))(v204 + 8))(v198, v71);
              v70 = v75;
              v34 = &PCPrintJob__metaData;
            }
          }
          else
          {
            v82 = v202;
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v204 + 56))(v202, 1, 1, v203);
            v70 = (uint64_t)v82;
          }
          sub_10000921C(v70);
          v32 = v201;
        }
        if (objc_msgSend(v57, *(SEL *)&v34[29].ivar_base_size) != (id)5
          && objc_msgSend(v57, *(SEL *)&v34[29].ivar_base_size) != (id)10)
        {
          break;
        }

LABEL_60:
        if (!v33)
          goto LABEL_193;
        v85 = *(void **)v55;
        v53 = *(void **)(v55 + 8);
        *(_QWORD *)v55 = v53;
        *(_QWORD *)(v55 + 8) = v85;
        v55 -= 8;
        if (v32 == ++v54)
          goto LABEL_38;
      }
      if (objc_msgSend(v58, *(SEL *)&v34[29].ivar_base_size) != (id)5
        && objc_msgSend(v58, *(SEL *)&v34[29].ivar_base_size) != (id)10)
      {
        v83 = objc_msgSend(v57, "localJobID");
        v84 = objc_msgSend(v58, "localJobID");

        if ((uint64_t)v83 >= (uint64_t)v84)
          goto LABEL_38;
        goto LABEL_60;
      }

LABEL_38:
      ++v32;
      v36 = v192;
      v52 = v193 + 8;
      if (v32 != v189)
        continue;
      break;
    }
    v32 = v189;
    v31 = v187;
LABEL_94:
    if (v32 < v36)
      goto LABEL_183;
    if ((swift_isUniquelyReferenced_nonNull_native(v31) & 1) == 0)
      v31 = sub_100013598(0, *((_QWORD *)v31 + 2) + 1, 1, v31);
    v116 = *((_QWORD *)v31 + 2);
    v115 = *((_QWORD *)v31 + 3);
    v117 = v116 + 1;
    if (v116 >= v115 >> 1)
      v31 = sub_100013598((char *)(v115 > 1), v116 + 1, 1, v31);
    *((_QWORD *)v31 + 2) = v117;
    v118 = v31 + 32;
    v119 = &v31[16 * v116 + 32];
    *(_QWORD *)v119 = v36;
    *((_QWORD *)v119 + 1) = v32;
    if (v116)
      break;
    v117 = 1;
LABEL_143:
    v35 = v191;
    if (v32 >= v191)
    {
      a1 = v181;
      if (v117 < 2)
        goto LABEL_164;
LABEL_151:
      v172 = *a1;
      while (1)
      {
        v173 = v117 - 2;
        if (v117 < 2)
          break;
        if (!v172)
          goto LABEL_196;
        v174 = *(_QWORD *)&v31[16 * v173 + 32];
        v175 = *(_QWORD *)&v31[16 * v117 + 24];
        v176 = v196;
        sub_100007EF8((id *)(v172 + 8 * v174), (void **)(v172 + 8 * *(_QWORD *)&v31[16 * v117 + 16]), v172 + 8 * v175, v194);
        v196 = v176;
        if (v176)
        {
          v170 = v31;
          goto LABEL_148;
        }
        if (v175 < v174)
          goto LABEL_184;
        if ((swift_isUniquelyReferenced_nonNull_native(v31) & 1) == 0)
          v31 = sub_100013690((uint64_t)v31);
        if (v173 >= *((_QWORD *)v31 + 2))
          goto LABEL_185;
        v177 = &v31[16 * v173 + 32];
        *(_QWORD *)v177 = v174;
        *((_QWORD *)v177 + 1) = v175;
        v178 = *((_QWORD *)v31 + 2);
        if (v117 > v178)
          goto LABEL_186;
        memmove(&v31[16 * v117 + 16], &v31[16 * v117 + 32], 16 * (v178 - v117));
        *((_QWORD *)v31 + 2) = v178 - 1;
        v117 = v178 - 1;
        if (v178 <= 2)
          goto LABEL_164;
      }
LABEL_182:
      __break(1u);
LABEL_183:
      __break(1u);
LABEL_184:
      __break(1u);
LABEL_185:
      __break(1u);
LABEL_186:
      __break(1u);
LABEL_187:
      __break(1u);
      goto LABEL_188;
    }
  }
  v201 = v32;
  while (1)
  {
    v120 = v117 - 1;
    if (v117 >= 4)
    {
      v125 = &v118[16 * v117];
      v126 = *((_QWORD *)v125 - 8);
      v127 = *((_QWORD *)v125 - 7);
      v131 = __OFSUB__(v127, v126);
      v128 = v127 - v126;
      if (v131)
        goto LABEL_171;
      v130 = *((_QWORD *)v125 - 6);
      v129 = *((_QWORD *)v125 - 5);
      v131 = __OFSUB__(v129, v130);
      v123 = v129 - v130;
      v124 = v131;
      if (v131)
        goto LABEL_172;
      v132 = v117 - 2;
      v133 = &v118[16 * v117 - 32];
      v135 = *(_QWORD *)v133;
      v134 = *((_QWORD *)v133 + 1);
      v131 = __OFSUB__(v134, v135);
      v136 = v134 - v135;
      if (v131)
        goto LABEL_173;
      v131 = __OFADD__(v123, v136);
      v137 = v123 + v136;
      if (v131)
        goto LABEL_175;
      if (v137 >= v128)
      {
        v155 = &v118[16 * v120];
        v157 = *(_QWORD *)v155;
        v156 = *((_QWORD *)v155 + 1);
        v131 = __OFSUB__(v156, v157);
        v158 = v156 - v157;
        if (v131)
          goto LABEL_181;
        v148 = v123 < v158;
        goto LABEL_132;
      }
    }
    else
    {
      if (v117 != 3)
      {
        v149 = *((_QWORD *)v31 + 4);
        v150 = *((_QWORD *)v31 + 5);
        v131 = __OFSUB__(v150, v149);
        v142 = v150 - v149;
        v143 = v131;
        goto LABEL_126;
      }
      v122 = *((_QWORD *)v31 + 4);
      v121 = *((_QWORD *)v31 + 5);
      v131 = __OFSUB__(v121, v122);
      v123 = v121 - v122;
      v124 = v131;
    }
    if ((v124 & 1) != 0)
      goto LABEL_174;
    v132 = v117 - 2;
    v138 = &v118[16 * v117 - 32];
    v140 = *(_QWORD *)v138;
    v139 = *((_QWORD *)v138 + 1);
    v141 = __OFSUB__(v139, v140);
    v142 = v139 - v140;
    v143 = v141;
    if (v141)
      goto LABEL_176;
    v144 = &v118[16 * v120];
    v146 = *(_QWORD *)v144;
    v145 = *((_QWORD *)v144 + 1);
    v131 = __OFSUB__(v145, v146);
    v147 = v145 - v146;
    if (v131)
      goto LABEL_178;
    if (__OFADD__(v142, v147))
      goto LABEL_180;
    if (v142 + v147 >= v123)
    {
      v148 = v123 < v147;
LABEL_132:
      if (v148)
        v120 = v132;
      goto LABEL_134;
    }
LABEL_126:
    if ((v143 & 1) != 0)
      goto LABEL_177;
    v151 = &v118[16 * v120];
    v153 = *(_QWORD *)v151;
    v152 = *((_QWORD *)v151 + 1);
    v131 = __OFSUB__(v152, v153);
    v154 = v152 - v153;
    if (v131)
      goto LABEL_179;
    if (v154 < v142)
      goto LABEL_143;
LABEL_134:
    v159 = v120 - 1;
    if (v120 - 1 >= v117)
    {
      __break(1u);
LABEL_168:
      __break(1u);
LABEL_169:
      __break(1u);
LABEL_170:
      __break(1u);
LABEL_171:
      __break(1u);
LABEL_172:
      __break(1u);
LABEL_173:
      __break(1u);
LABEL_174:
      __break(1u);
LABEL_175:
      __break(1u);
LABEL_176:
      __break(1u);
LABEL_177:
      __break(1u);
LABEL_178:
      __break(1u);
LABEL_179:
      __break(1u);
LABEL_180:
      __break(1u);
LABEL_181:
      __break(1u);
      goto LABEL_182;
    }
    v160 = v33;
    if (!v33)
      goto LABEL_194;
    v161 = v31;
    v162 = &v118[16 * v159];
    v163 = *(_QWORD *)v162;
    v164 = v118;
    v165 = v120;
    v166 = &v118[16 * v120];
    v167 = *((_QWORD *)v166 + 1);
    v168 = v196;
    sub_100007EF8((id *)(v160 + 8 * *(_QWORD *)v162), (void **)(v160 + 8 * *(_QWORD *)v166), v160 + 8 * v167, v194);
    v196 = v168;
    if (v168)
      break;
    if (v167 < v163)
      goto LABEL_168;
    if (v165 > *((_QWORD *)v161 + 2))
      goto LABEL_169;
    *(_QWORD *)v162 = v163;
    *(_QWORD *)&v164[16 * v159 + 8] = v167;
    v169 = *((_QWORD *)v161 + 2);
    if (v165 >= v169)
      goto LABEL_170;
    v31 = v161;
    v117 = v169 - 1;
    memmove(v166, v166 + 16, 16 * (v169 - 1 - v165));
    v118 = v164;
    *((_QWORD *)v161 + 2) = v169 - 1;
    v33 = v197;
    v32 = v201;
    if (v169 <= 2)
      goto LABEL_143;
  }
  v170 = v161;
LABEL_148:
  v171 = swift_bridgeObjectRelease(v170);
LABEL_149:
  *(_QWORD *)((v207 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
  specialized Array._endMutation()(v171);
  swift_bridgeObjectRelease(v207);
}

void sub_100007A80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
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
  __objc2_class_ro *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  void (*v30)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t (*v31)(char *, uint64_t, uint64_t);
  int v32;
  uint64_t v33;
  id v34;
  void *v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  char v40;
  void (*v41)(char *, uint64_t);
  char *v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  void (*v52)(char *, _QWORD, uint64_t, uint64_t);
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;

  v48 = a1;
  v7 = sub_100006A30(&qword_100020CA0);
  v8 = __chkstk_darwin(v7);
  v51 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v58 = (char *)&v46 - v10;
  v11 = type metadata accessor for Date(0);
  v57 = *(_QWORD *)(v11 - 8);
  v12 = __chkstk_darwin(v11);
  v49 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v12);
  v54 = (char *)&v46 - v15;
  __chkstk_darwin(v14);
  v53 = (char *)&v46 - v16;
  v47 = a2;
  if (a3 != a2)
  {
    v59 = *a4;
    v17 = v59 + 8 * a3 - 8;
    v18 = &PCPrintJob__metaData;
    v56 = v11;
LABEL_6:
    v19 = *(void **)(v59 + 8 * a3);
    v20 = v48;
    v50 = v17;
    v55 = a3;
    while (1)
    {
      v21 = *(void **)v17;
      v22 = v19;
      v23 = v21;
      if ((objc_msgSend(v22, *(SEL *)&v18[29].ivar_base_size) == (id)5
         || objc_msgSend(v22, *(SEL *)&v18[29].ivar_base_size) == (id)10)
        && (objc_msgSend(v23, *(SEL *)&v18[29].ivar_base_size) == (id)5
         || objc_msgSend(v23, *(SEL *)&v18[29].ivar_base_size) == (id)10))
      {
        v24 = objc_msgSend(v22, "timeAtProcessing");
        if (v24)
        {
          v25 = v24;
          v26 = v54;
          static Date._unconditionallyBridgeFromObjectiveC(_:)();

          v28 = v57;
          v27 = v58;
          v29 = *(void (**)(char *, char *, uint64_t))(v57 + 32);
          v29(v58, v26, v11);
          v30 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56);
          v30(v27, 0, 1, v11);
          v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
          v32 = v31(v27, 1, v11);
          v33 = (uint64_t)v27;
          if (v32 != 1)
          {
            v11 = v56;
            v29(v53, v58, v56);
            v34 = objc_msgSend(v23, "timeAtProcessing");
            if (v34)
            {
              v35 = v34;
              v52 = v30;
              v36 = v54;
              static Date._unconditionallyBridgeFromObjectiveC(_:)();

              v37 = v51;
              v29(v51, v36, v11);
              v52(v37, 0, 1, v11);
              if (v31(v37, 1, v11) != 1)
              {
                v38 = v49;
                v29(v49, v37, v11);
                v39 = v53;
                v40 = static Date.< infix(_:_:)(v53, v38);
                v41 = *(void (**)(char *, uint64_t))(v57 + 8);
                v41(v38, v11);
                v41(v39, v11);

                a3 = v55;
                v18 = &PCPrintJob__metaData;
                if ((v40 & 1) == 0)
                  goto LABEL_5;
                goto LABEL_27;
              }
            }
            else
            {
              v37 = v51;
              v30(v51, 1, 1, v11);
            }
            (*(void (**)(char *, uint64_t))(v57 + 8))(v53, v11);
            v33 = (uint64_t)v37;
          }
        }
        else
        {
          v42 = v58;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v57 + 56))(v58, 1, 1, v11);
          v33 = (uint64_t)v42;
        }
        sub_10000921C(v33);
        a3 = v55;
        v11 = v56;
        v18 = &PCPrintJob__metaData;
      }
      if (objc_msgSend(v22, *(SEL *)&v18[29].ivar_base_size) == (id)5
        || objc_msgSend(v22, *(SEL *)&v18[29].ivar_base_size) == (id)10)
      {

      }
      else
      {
        if (objc_msgSend(v23, *(SEL *)&v18[29].ivar_base_size) == (id)5
          || objc_msgSend(v23, *(SEL *)&v18[29].ivar_base_size) == (id)10)
        {

LABEL_5:
          ++a3;
          v17 = v50 + 8;
          if (a3 == v47)
            return;
          goto LABEL_6;
        }
        v43 = objc_msgSend(v22, "localJobID");
        v44 = objc_msgSend(v23, "localJobID");

        if ((uint64_t)v43 >= (uint64_t)v44)
          goto LABEL_5;
      }
LABEL_27:
      if (!v59)
      {
        __break(1u);
        return;
      }
      v45 = *(void **)v17;
      v19 = *(void **)(v17 + 8);
      *(_QWORD *)v17 = v19;
      *(_QWORD *)(v17 + 8) = v45;
      v17 -= 8;
      if (a3 == ++v20)
        goto LABEL_5;
    }
  }
}

uint64_t sub_100007EF8(id *__src, void **a2, unint64_t a3, void **__dst)
{
  uint64_t v4;
  void **v6;
  id *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id *v15;
  id *v16;
  void **v17;
  id v18;
  void *v19;
  id v20;
  char v21;
  char v22;
  id *v23;
  BOOL v24;
  void **v26;
  id *v27;
  char *v28;
  void **v29;
  id v30;
  void **v31;
  void *v32;
  id v33;
  char v34;
  char v35;
  void **v36;
  BOOL v37;
  unint64_t v38;
  uint64_t v39;
  size_t v40;
  void **v41;
  id *v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id *v47;
  id v50;
  void *v51;

  v6 = a2;
  v7 = __src;
  v8 = (char *)a2 - (char *)__src;
  v9 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v9 = (char *)a2 - (char *)__src;
  v10 = v9 >> 3;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 3;
  if (v10 < v12 >> 3)
  {
    if (__dst != __src || &__src[v10] <= __dst)
    {
      memmove(__dst, __src, 8 * v10);
      v6 = a2;
    }
    v15 = &__dst[v10];
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      v16 = __dst;
      while (1)
      {
        v17 = v6;
        v51 = *v6;
        v50 = *v16;
        v18 = v50;
        v19 = v51;
        v20 = v18;
        v21 = sub_100005858(&v51, &v50);
        if (v4)
        {

          v44 = (char *)v15 - (char *)v16 + 7;
          if ((char *)v15 - (char *)v16 >= 0)
            v44 = (char *)v15 - (char *)v16;
          if (v7 < v16 || v7 >= (id *)((char *)v16 + (v44 & 0xFFFFFFFFFFFFFFF8)) || v7 != v16)
          {
            v40 = 8 * (v44 >> 3);
            v41 = v7;
LABEL_50:
            v42 = v16;
LABEL_51:
            memmove(v41, v42, v40);
          }
          return 1;
        }
        v22 = v21;

        if ((v22 & 1) == 0)
          break;
        v23 = v17;
        v6 = v17 + 1;
        if (v7 != v17)
          goto LABEL_17;
LABEL_18:
        ++v7;
        if (v16 >= v15 || (unint64_t)v6 >= a3)
        {
          v6 = v7;
          goto LABEL_44;
        }
      }
      v23 = v16;
      v24 = v7 == v16++;
      v6 = v17;
      if (v24)
        goto LABEL_18;
LABEL_17:
      *v7 = *v23;
      goto LABEL_18;
    }
    v6 = v7;
    v16 = __dst;
LABEL_44:
    v39 = (char *)v15 - (char *)v16 + 7;
    if ((char *)v15 - (char *)v16 >= 0)
      v39 = (char *)v15 - (char *)v16;
    if (v6 < v16 || v6 >= (id *)((char *)v16 + (v39 & 0xFFFFFFFFFFFFFFF8)) || v6 != v16)
    {
      v40 = 8 * (v39 >> 3);
      v41 = v6;
      goto LABEL_50;
    }
    return 1;
  }
  v16 = __dst;
  if (__dst != a2 || &a2[v13] <= __dst)
  {
    memmove(__dst, a2, 8 * v13);
    v6 = a2;
  }
  v15 = &v16[v13];
  if (v7 >= v6 || v11 < 8)
    goto LABEL_44;
  v26 = (void **)(a3 - 8);
  v47 = v7;
  while (1)
  {
    v27 = v15;
    v28 = (char *)(v15 - 1);
    v51 = *(v15 - 1);
    v29 = v6;
    v31 = v6 - 1;
    v50 = *(v6 - 1);
    v30 = v50;
    v32 = v51;
    v33 = v30;
    v34 = sub_100005858(&v51, &v50);
    if (v4)
      break;
    v35 = v34;
    v36 = v26 + 1;

    if ((v35 & 1) == 0)
    {
      v6 = v29;
      v31 = (void **)v28;
      if (v36 == v27)
      {
        v15 = (id *)v28;
        v38 = (unint64_t)v47;
        v16 = __dst;
        if (v26 < v27)
          goto LABEL_40;
      }
      else
      {
        v15 = (id *)v28;
LABEL_38:
        v38 = (unint64_t)v47;
        v16 = __dst;
      }
LABEL_39:
      *v26 = *v31;
      goto LABEL_40;
    }
    v15 = v27;
    if (v36 != v29)
    {
      v6 = v31;
      goto LABEL_38;
    }
    v37 = v26 >= v29;
    v6 = v31;
    v38 = (unint64_t)v47;
    v16 = __dst;
    if (v37)
      goto LABEL_39;
LABEL_40:
    if ((unint64_t)v6 > v38)
    {
      --v26;
      if (v15 > v16)
        continue;
    }
    goto LABEL_44;
  }

  v42 = __dst;
  v45 = (char *)v27 - (char *)__dst + 7;
  if ((char *)v27 - (char *)__dst >= 0)
    v45 = (char *)v27 - (char *)__dst;
  v46 = v45 >> 3;
  if (v29 < __dst || v29 >= (void **)((char *)__dst + (v45 & 0xFFFFFFFFFFFFFFF8)))
  {
    memmove(v29, __dst, 8 * v46);
  }
  else if (v29 != __dst)
  {
    v40 = 8 * v46;
    v41 = v29;
    goto LABEL_51;
  }
  return 1;
}

uint64_t sub_100008290(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
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
  void (*v17[4])(id *);

  v5 = result;
  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v16 = a3;
    else
      v16 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    result = swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      if (a3 < 0)
        v10 = a3;
      else
        v10 = a3 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a3);
      v11 = _CocoaArrayWrapper.endIndex.getter(v10);
      result = swift_bridgeObjectRelease(a3);
      if (v11 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1000091DC(&qword_100020C98, (uint64_t *)&unk_100020B08, (uint64_t)&protocol conformance descriptor for [A]);
          swift_bridgeObjectRetain(a3);
          for (i = 0; i != v7; ++i)
          {
            sub_100006A30((uint64_t *)&unk_100020B08);
            v13 = sub_100008448(v17, i, a3);
            v15 = *v14;
            ((void (*)(void (**)(id *), _QWORD))v13)(v17, 0);
            *(_QWORD *)(v5 + 8 * i) = v15;
          }
          swift_bridgeObjectRelease(a3);
          return a3;
        }
        goto LABEL_22;
      }
    }
    else
    {
      v8 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v8 <= a2)
      {
        v9 = sub_10000853C(0, (unint64_t *)&qword_100020C60, &off_10001C9D0);
        swift_arrayInitWithCopy(v5, (a3 & 0xFFFFFFFFFFFFFF8) + 32, v8, v9);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_100008448(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1000084C8(v6, a2, a3);
  return sub_10000849C;
}

void sub_10000849C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1000084C8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
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
    return sub_100008534;
  }
  __break(1u);
  return result;
}

void sub_100008534(id *a1)
{

}

uint64_t sub_10000853C(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

unint64_t sub_100008574()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100020C68;
  if (!qword_100020C68)
  {
    v1 = sub_10000853C(255, (unint64_t *)&qword_100020C60, &off_10001C9D0);
    result = swift_getWitnessTable(&protocol conformance descriptor for PCPrintJob, v1);
    atomic_store(result, (unint64_t *)&qword_100020C68);
  }
  return result;
}

uint64_t sub_1000085CC()
{
  uint64_t v0;

  return sub_10000609C(v0);
}

uint64_t sub_1000085D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000085E4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000085EC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_10000862C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100008650(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v4 = a1;
    else
      v4 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v4);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

uint64_t sub_1000086B8()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  uint64_t v7;

  KeyPath = swift_getKeyPath(&unk_100018EE0);
  v2 = swift_getKeyPath(&unk_100018F08);
  static Published.subscript.getter(&v7, v0, KeyPath, v2);
  swift_release(KeyPath);
  swift_release(v2);
  v3 = v7;
  if (v7 < 0 || (v7 & 0x4000000000000000) != 0)
  {
    v6 = swift_bridgeObjectRetain(v7);
    v4 = (uint64_t)sub_100006AFC(v6);
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = v7 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v7);
  }
  v7 = v4;
  sub_100006A84(&v7);
  swift_bridgeObjectRelease(v3);
  return v7;
}

uint64_t sub_100008784(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;

  v3 = v2;
  v5 = a1;
  if (a1 >> 62)
    goto LABEL_37;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v6)
  {
    v7 = 0;
    v8 = v5 & 0xC000000000000001;
    v23 = v3;
    v24 = v5 + 32;
    v9 = a2 & 0xFFFFFFFFFFFFFF8;
    if (a2 < 0)
      v9 = a2;
    v27 = v5;
    v28 = v9;
    v29 = a2 & 0xC000000000000001;
    v10 = (unint64_t)a2 >> 62;
    v25 = v5 & 0xC000000000000001;
    v26 = v6;
    while (1)
    {
      if (v8)
      {
        v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7, v5);
        if (!v10)
          goto LABEL_8;
      }
      else
      {
        v11 = *(id *)(v24 + 8 * v7);
        if (!v10)
        {
LABEL_8:
          v12 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain(a2);
          if (!v12)
            goto LABEL_16;
          goto LABEL_9;
        }
      }
      swift_bridgeObjectRetain(a2);
      v12 = _CocoaArrayWrapper.endIndex.getter(v28);
      if (!v12)
      {
LABEL_16:

        swift_bridgeObjectRelease(a2);
        goto LABEL_29;
      }
LABEL_9:
      if (v29)
        v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a2);
      else
        v13 = *(id *)(a2 + 32);
      v5 = (uint64_t)v13;
      sub_10000853C(0, (unint64_t *)&qword_100020C60, &off_10001C9D0);
      v14 = static NSObject.== infix(_:_:)(v5, v11);

      if ((v14 & 1) != 0)
      {
LABEL_33:

        swift_bridgeObjectRelease(a2);
        return v7;
      }
      if (v12 != 1)
        break;

      swift_bridgeObjectRelease(a2);
LABEL_28:
      v6 = v26;
      v5 = v27;
      v10 = (unint64_t)a2 >> 62;
      v8 = v25;
LABEL_29:
      if (__OFADD__(v7++, 1))
        goto LABEL_36;
      if (v7 == v6)
        return 0;
    }
    if (v29)
    {
      v5 = 1;
      while (1)
      {
        v15 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5, a2);
        v3 = v5 + 1;
        if (__OFADD__(v5, 1))
          break;
        v16 = v15;
        v17 = static NSObject.== infix(_:_:)(v15, v11);
        swift_unknownObjectRelease(v16);
        if ((v17 & 1) != 0)
          goto LABEL_33;
        ++v5;
        if (v3 == v12)
          goto LABEL_27;
      }
      __break(1u);
    }
    else
    {
      v18 = 5;
      while (1)
      {
        v3 = v18 - 3;
        if (__OFADD__(v18 - 4, 1))
          break;
        v5 = (uint64_t)*(id *)(a2 + 8 * v18);
        v19 = static NSObject.== infix(_:_:)(v5, v11);

        if ((v19 & 1) != 0)
          goto LABEL_33;
        ++v18;
        if (v3 == v12)
        {
LABEL_27:

          swift_bridgeObjectRelease(a2);
          v3 = v23;
          goto LABEL_28;
        }
      }
    }
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    if (v5 < 0)
      v21 = v5;
    else
      v21 = v5 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v5);
    v6 = _CocoaArrayWrapper.endIndex.getter(v21);
    swift_bridgeObjectRelease(v5);
  }
  return 0;
}

uint64_t sub_100008A1C(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  char v19;
  BOOL v20;
  id v21;
  id v22;
  int isUniquelyReferenced_nonNull_bridgeObject;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;

  v4 = a1;
  v5 = *a1;
  v6 = swift_bridgeObjectRetain(*a1);
  v44 = a2;
  v7 = sub_100008784(v6, a2);
  v9 = v8;
  v10 = v2;
  swift_bridgeObjectRelease(v5);
  if (v2)
    return v7;
  if ((v9 & 1) == 0)
  {
    v11 = v7 + 1;
    if (__OFADD__(v7, 1))
      goto LABEL_87;
    v5 = *v4;
    if ((unint64_t)*v4 >> 62)
    {
LABEL_88:
      if (v5 < 0)
        v36 = v5;
      else
        v36 = v5 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v5);
      v37 = _CocoaArrayWrapper.endIndex.getter(v36);
      swift_bridgeObjectRelease(v5);
      if (v11 != v37)
        goto LABEL_6;
    }
    else if (v11 != *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      v12 = v44 & 0xFFFFFFFFFFFFFF8;
      if (v44 < 0)
        v12 = v44;
      v41 = v10;
      v42 = v12;
      v43 = v44 & 0xC000000000000001;
      v40 = v4;
      while (1)
      {
        v13 = *v4;
        if ((*v4 & 0xC000000000000001) != 0)
        {
          v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v11, v13);
        }
        else
        {
          if ((v11 & 0x8000000000000000) != 0)
            goto LABEL_76;
          if (v11 >= *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_77;
          v14 = *(id *)(v13 + 8 * v11 + 32);
        }
        v15 = v14;
        if ((unint64_t)v44 >> 62)
        {
          swift_bridgeObjectRetain(v44);
          v16 = _CocoaArrayWrapper.endIndex.getter(v42);
          if (!v16)
            goto LABEL_24;
        }
        else
        {
          v16 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain(v44);
          if (!v16)
            goto LABEL_24;
        }
        if (v43)
          v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v44);
        else
          v17 = *(id *)(v44 + 32);
        v18 = v17;
        v5 = sub_10000853C(0, (unint64_t *)&qword_100020C60, &off_10001C9D0);
        v19 = static NSObject.== infix(_:_:)(v18, v15);

        if ((v19 & 1) != 0)
        {

          swift_bridgeObjectRelease(v44);
          v20 = __OFADD__(v11++, 1);
          if (v20)
            goto LABEL_78;
          goto LABEL_45;
        }
        if (v16 != 1)
        {
          if (v43)
          {
            v28 = 1;
            while (1)
            {
              v29 = specialized _ArrayBuffer._getElementSlowPath(_:)(v28, v44);
              v4 = (uint64_t *)(v28 + 1);
              if (__OFADD__(v28, 1))
                break;
              v30 = v29;
              v10 = static NSObject.== infix(_:_:)(v29, v15);
              swift_unknownObjectRelease(v30);
              if ((v10 & 1) != 0)
                goto LABEL_61;
              ++v28;
              if (v4 == (uint64_t *)v16)
                goto LABEL_59;
            }
            __break(1u);
LABEL_76:
            __break(1u);
LABEL_77:
            __break(1u);
LABEL_78:
            __break(1u);
            goto LABEL_79;
          }
          v10 = 5;
          while (1)
          {
            v4 = (uint64_t *)(v10 - 3);
            if (__OFADD__(v10 - 4, 1))
              break;
            v31 = *(id *)(v44 + 8 * v10);
            v32 = static NSObject.== infix(_:_:)(v31, v15);

            if ((v32 & 1) != 0)
            {
LABEL_61:

              swift_bridgeObjectRelease(v44);
              v4 = v40;
              v10 = v41;
              v20 = __OFADD__(v11++, 1);
              if (v20)
                goto LABEL_78;
              goto LABEL_45;
            }
            ++v10;
            if (v4 == (uint64_t *)v16)
            {
LABEL_59:

              swift_bridgeObjectRelease(v44);
              v4 = v40;
              v10 = v41;
              if (v7 != v11)
                goto LABEL_25;
              goto LABEL_43;
            }
          }
LABEL_79:
          __break(1u);
LABEL_80:
          __break(1u);
LABEL_81:
          __break(1u);
LABEL_82:
          __break(1u);
LABEL_83:
          __break(1u);
LABEL_84:
          __break(1u);
LABEL_85:
          __break(1u);
LABEL_86:
          __break(1u);
LABEL_87:
          __break(1u);
          goto LABEL_88;
        }
LABEL_24:

        swift_bridgeObjectRelease(v44);
        if (v7 == v11)
          goto LABEL_43;
LABEL_25:
        v5 = *v4;
        if ((*v4 & 0xC000000000000001) != 0)
        {
          v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7, *v4);
          v5 = *v4;
          if ((*v4 & 0xC000000000000001) == 0)
            goto LABEL_29;
        }
        else
        {
          if ((v7 & 0x8000000000000000) != 0)
            goto LABEL_81;
          if (v7 >= *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_82;
          v21 = *(id *)(v5 + 8 * v7 + 32);
          if ((v5 & 0xC000000000000001) == 0)
          {
LABEL_29:
            if ((v11 & 0x8000000000000000) != 0)
              goto LABEL_83;
            if (v11 >= *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_84;
            v22 = *(id *)(v5 + 8 * v11 + 32);
            goto LABEL_32;
          }
        }
        v22 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v11, v5);
        v5 = *v4;
LABEL_32:
        isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(v5);
        *v4 = v5;
        if (!isUniquelyReferenced_nonNull_bridgeObject || v5 < 0 || (v5 & 0x4000000000000000) != 0)
        {
          v5 = sub_100008650(v5);
          *v4 = v5;
        }
        v24 = *(void **)((v5 & 0xFFFFFFFFFFFFFF8) + 8 * v7 + 0x20);
        *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 8 * v7 + 0x20) = v22;

        specialized Array._endMutation()();
        v5 = *v4;
        v25 = swift_isUniquelyReferenced_nonNull_bridgeObject(*v4);
        *v4 = v5;
        if (!v25 || v5 < 0 || (v5 & 0x4000000000000000) != 0)
        {
          v5 = sub_100008650(v5);
          *v4 = v5;
        }
        if ((v11 & 0x8000000000000000) != 0)
          goto LABEL_85;
        if (v11 >= *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_86;
        v26 = *(void **)((v5 & 0xFFFFFFFFFFFFFF8) + 8 * v11 + 0x20);
        *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 8 * v11 + 0x20) = v21;

        v5 = (uint64_t)v4;
        specialized Array._endMutation()();
LABEL_43:
        v20 = __OFADD__(v7++, 1);
        if (v20)
          goto LABEL_80;
        v20 = __OFADD__(v11++, 1);
        if (v20)
          goto LABEL_78;
LABEL_45:
        v5 = *v4;
        if ((unint64_t)*v4 >> 62)
        {
          if (v5 < 0)
            v33 = *v4;
          else
            v33 = v5 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(*v4);
          v27 = _CocoaArrayWrapper.endIndex.getter(v33);
          swift_bridgeObjectRelease(v5);
        }
        else
        {
          v27 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        if (v11 == v27)
          return v7;
      }
    }
    return v7;
  }
  v34 = *v4;
  if (!((unint64_t)*v4 >> 62))
    return *(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v34 < 0)
    v38 = *v4;
  else
    v38 = v34 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v4);
  v39 = _CocoaArrayWrapper.endIndex.getter(v38);
  swift_bridgeObjectRelease(v34);
  return v39;
}

void *sub_100008EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    v5 = *v3;
    if (!((unint64_t)*v3 >> 62))
    {
      v7 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v7 >= a2)
        goto LABEL_4;
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  if (v5 < 0)
    v25 = v5;
  else
    v25 = v5 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v5);
  v7 = _CocoaArrayWrapper.endIndex.getter(v25);
  swift_bridgeObjectRelease(v5);
  if (v7 < v2)
    goto LABEL_33;
LABEL_4:
  v5 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v6 = v4 - v2;
  if (__OFSUB__(0, v5))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v7 = *v3;
  if (!((unint64_t)*v3 >> 62))
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    v9 = v8 - v5;
    if (!__OFADD__(v8, v6))
      goto LABEL_8;
LABEL_41:
    __break(1u);
LABEL_42:
    if (v7 < 0)
      v27 = v7;
    else
      v27 = v7 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v7);
    v12 = _CocoaArrayWrapper.endIndex.getter(v27);
    swift_bridgeObjectRelease(v7);
    v7 = *v3;
    goto LABEL_15;
  }
LABEL_36:
  if (v7 < 0)
    v26 = v7;
  else
    v26 = v7 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v7);
  v8 = _CocoaArrayWrapper.endIndex.getter(v26);
  swift_bridgeObjectRelease(v7);
  v9 = v8 + v6;
  if (__OFADD__(v8, v6))
    goto LABEL_41;
LABEL_8:
  v7 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v3);
  *v3 = v7;
  v8 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v7 & 0x8000000000000000) == 0 && (v7 & 0x4000000000000000) == 0)
  {
    v11 = v7 & 0xFFFFFFFFFFFFFF8;
    if (v9 <= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v8 = 1;
  }
  if ((unint64_t)v7 >> 62)
    goto LABEL_42;
  v12 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v9)
    v12 = v9;
  swift_bridgeObjectRetain(v7);
  v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v8, v12, 1, v7);
  v14 = *v3;
  *v3 = v13;
  swift_bridgeObjectRelease(v14);
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v15 = v11 + 32;
  v16 = (char *)(v11 + 32 + 8 * v4);
  v17 = sub_10000853C(0, (unint64_t *)&qword_100020C60, &off_10001C9D0);
  result = (void *)swift_arrayDestroy(v16, v5, v17);
  if (!v6)
    return (void *)specialized Array._endMutation()(result);
  v19 = *v3;
  if (!((unint64_t)*v3 >> 62))
  {
    v20 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
    v21 = v20 - v2;
    if (!__OFSUB__(v20, v2))
      goto LABEL_21;
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (v19 < 0)
    v28 = *v3;
  else
    v28 = v19 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v3);
  v29 = _CocoaArrayWrapper.endIndex.getter(v28);
  result = (void *)swift_bridgeObjectRelease(v19);
  v21 = v29 - v2;
  if (__OFSUB__(v29, v2))
    goto LABEL_51;
LABEL_21:
  v22 = (char *)(v15 + 8 * v2);
  if (v4 != v2 || v16 >= &v22[8 * v21])
    result = memmove(v16, v22, 8 * v21);
  v2 = *v3;
  if ((unint64_t)*v3 >> 62)
  {
LABEL_52:
    if (v2 < 0)
      v30 = v2;
    else
      v30 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v2);
    v31 = _CocoaArrayWrapper.endIndex.getter(v30);
    result = (void *)swift_bridgeObjectRelease(v2);
    v24 = v31 + v6;
    if (!__OFADD__(v31, v6))
      goto LABEL_26;
    goto LABEL_57;
  }
  v23 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  v24 = v23 + v6;
  if (!__OFADD__(v23, v6))
  {
LABEL_26:
    *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v24;
    return (void *)specialized Array._endMutation()(result);
  }
LABEL_57:
  __break(1u);
  return result;
}

uint64_t sub_10000919C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000091C8()
{
  uint64_t v0;

  return sub_100006504(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1000091DC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000067D4(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000921C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006A30(&qword_100020CA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes()
{
  return &type metadata for PrintActivityAttributes;
}

BOOL sub_100009290(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000092A4()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000092E8()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100009310(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100009350()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_100009380 + 4 * byte_100018F30[*v0]))(0x656C746954626F6ALL, 0xE800000000000000);
}

uint64_t sub_100009380()
{
  return 0x73656761506D756ELL;
}

uint64_t sub_100009394()
{
  return 0x50746E6572727563;
}

uint64_t sub_1000093B4()
{
  return 0x617453726F727265;
}

uint64_t sub_1000093D4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100009C14(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000093F8()
{
  return 0;
}

void sub_100009404(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_100009410(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000A028();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100009438(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000A028();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100009460(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  char v23;

  v3 = v1;
  v5 = sub_100006A30(&qword_100020CE8);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_10000A004(a1, v9);
  v11 = sub_10000A028();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for PrintActivityAttributes.ContentState.CodingKeys, &type metadata for PrintActivityAttributes.ContentState.CodingKeys, v11, v9, v10);
  v12 = *v3;
  v13 = v3[1];
  v23 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, &v23, v5);
  if (!v2)
  {
    v14 = v3[2];
    v22 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, &v22, v5);
    v15 = v3[3];
    v21 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v15, &v21, v5);
    v16 = v3[4];
    v17 = v3[5];
    v20 = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v16, v17, &v20, v5);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

double sub_1000095C4@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;

  sub_100009DFC(a1, (uint64_t *)v6);
  if (!v2)
  {
    v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_100009604(_QWORD *a1)
{
  return sub_100009460(a1);
}

Swift::Int sub_100009618()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  Swift::UInt v3;
  Swift::UInt v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[9];

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v5 = v0[4];
  v6 = v0[5];
  Hasher.init(_seed:)(v8, 0);
  swift_bridgeObjectRetain(v2);
  String.hash(into:)(v8, v1, v2);
  swift_bridgeObjectRelease(v2);
  Hasher._combine(_:)(v3);
  Hasher._combine(_:)(v4);
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(v8, v5, v6);
  swift_bridgeObjectRelease(v6);
  return Hasher._finalize()();
}

uint64_t sub_1000096C8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  Swift::UInt v5;
  Swift::UInt v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *v1;
  v4 = v1[1];
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(a1, v3, v4);
  swift_bridgeObjectRelease(v4);
  Hasher._combine(_:)(v5);
  Hasher._combine(_:)(v6);
  swift_bridgeObjectRetain(v8);
  String.hash(into:)(a1, v7, v8);
  return swift_bridgeObjectRelease(v8);
}

Swift::Int sub_100009758(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  Swift::UInt v4;
  Swift::UInt v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[9];

  v2 = *v1;
  v3 = v1[1];
  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  Hasher.init(_seed:)(v9, a1);
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v9, v2, v3);
  swift_bridgeObjectRelease(v3);
  Hasher._combine(_:)(v4);
  Hasher._combine(_:)(v5);
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v9, v6, v7);
  swift_bridgeObjectRelease(v7);
  return Hasher._finalize()();
}

uint64_t sub_100009804(_OWORD *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[3];
  _OWORD v8[3];

  v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  v3 = *a2;
  v4 = a2[1];
  v7[2] = a1[2];
  v8[0] = v3;
  v5 = a2[2];
  v8[1] = v4;
  v8[2] = v5;
  return sub_100009B74(v7, v8) & 1;
}

uint64_t sub_100009848()
{
  return 0;
}

uint64_t sub_100009854@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease(a1);
  *a2 = 1;
  return result;
}

void sub_100009880(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10000988C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000A08C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000098B4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000A08C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000098DC(_QWORD *a1)
{
  return sub_10000A06C(a1);
}

uint64_t sub_100009900(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v2 = sub_100006A30(&qword_100020CF0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1[3];
  v7 = a1[4];
  sub_10000A004(a1, v6);
  v8 = sub_10000A08C();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for PrintActivityAttributes.CodingKeys, &type metadata for PrintActivityAttributes.CodingKeys, v8, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_1000099C8()
{
  unint64_t result;

  result = qword_100020CA8;
  if (!qword_100020CA8)
  {
    result = swift_getWitnessTable(&unk_100018F90, &type metadata for PrintActivityAttributes);
    atomic_store(result, (unint64_t *)&qword_100020CA8);
  }
  return result;
}

unint64_t sub_100009A10()
{
  unint64_t result;

  result = qword_100020CB0;
  if (!qword_100020CB0)
  {
    result = swift_getWitnessTable(&unk_100018F68, &type metadata for PrintActivityAttributes);
    atomic_store(result, (unint64_t *)&qword_100020CB0);
  }
  return result;
}

unint64_t sub_100009A58()
{
  unint64_t result;

  result = qword_100020CB8;
  if (!qword_100020CB8)
  {
    result = swift_getWitnessTable(&unk_100019098, &type metadata for PrintActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_100020CB8);
  }
  return result;
}

unint64_t sub_100009AA0()
{
  unint64_t result;

  result = qword_100020CC0;
  if (!qword_100020CC0)
  {
    result = swift_getWitnessTable(&unk_100019070, &type metadata for PrintActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_100020CC0);
  }
  return result;
}

unint64_t sub_100009AE8()
{
  unint64_t result;

  result = qword_100020CC8;
  if (!qword_100020CC8)
  {
    result = swift_getWitnessTable(&unk_100019008, &type metadata for PrintActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_100020CC8);
  }
  return result;
}

unint64_t sub_100009B30()
{
  unint64_t result;

  result = qword_100020CD0;
  if (!qword_100020CD0)
  {
    result = swift_getWitnessTable(&unk_100019048, &type metadata for PrintActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_100020CD0);
  }
  return result;
}

uint64_t sub_100009B74(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  char v5;
  uint64_t result;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v5 & 1) != 0))
  {
    if (a1[2] == a2[2] && a1[3] == a2[3])
    {
      if (a1[4] == a2[4] && a1[5] == a2[5])
        return 1;
      else
        return _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100009C14(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  char v9;

  if (a1 == 0x656C746954626F6ALL && a2 == 0xE800000000000000)
  {
    v5 = 0xE800000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x656C746954626F6ALL, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x73656761506D756ELL && a2 == 0xE800000000000000)
  {
    v7 = 0xE800000000000000;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x73656761506D756ELL, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x50746E6572727563 && a2 == 0xEB00000000656761)
  {
    v8 = 0xEB00000000656761;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x50746E6572727563, 0xEB00000000656761, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_20;
  }
  if (a1 == 0x617453726F727265 && a2 == 0xEB00000000737574)
  {
    swift_bridgeObjectRelease(0xEB00000000737574);
    return 3;
  }
  else
  {
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x617453726F727265, 0xEB00000000737574, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v9 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_100009DFC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  char v26;
  char v27;

  v5 = sub_100006A30(&qword_100020CD8);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_10000A004(a1, v9);
  v11 = sub_10000A028();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for PrintActivityAttributes.ContentState.CodingKeys, &type metadata for PrintActivityAttributes.ContentState.CodingKeys, v11, v9, v10);
  if (v2)
    return sub_10000A06C(a1);
  v27 = 0;
  v12 = KeyedDecodingContainer.decode(_:forKey:)(&v27, v5);
  v14 = v13;
  v26 = 1;
  swift_bridgeObjectRetain(v13);
  v23 = KeyedDecodingContainer.decode(_:forKey:)(&v26, v5);
  v25 = 2;
  v22 = KeyedDecodingContainer.decode(_:forKey:)(&v25, v5);
  v24 = 3;
  v15 = KeyedDecodingContainer.decode(_:forKey:)(&v24, v5);
  v17 = v16;
  v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  v19 = v15;
  v18(v8, v5);
  swift_bridgeObjectRetain(v17);
  sub_10000A06C(a1);
  swift_bridgeObjectRelease(v17);
  result = swift_bridgeObjectRelease(v14);
  *a2 = v12;
  a2[1] = v14;
  v21 = v22;
  a2[2] = v23;
  a2[3] = v21;
  a2[4] = v19;
  a2[5] = v17;
  return result;
}

_QWORD *sub_10000A004(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000A028()
{
  unint64_t result;

  result = qword_100020CE0;
  if (!qword_100020CE0)
  {
    result = swift_getWitnessTable(&unk_100019230, &type metadata for PrintActivityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100020CE0);
  }
  return result;
}

uint64_t sub_10000A06C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_10000A08C()
{
  unint64_t result;

  result = qword_100020CF8;
  if (!qword_100020CF8)
  {
    result = swift_getWitnessTable(&unk_1000191E0, &type metadata for PrintActivityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100020CF8);
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes.CodingKeys()
{
  return &type metadata for PrintActivityAttributes.CodingKeys;
}

_BYTE *initializeBufferWithCopyOfBuffer for PrintActivityAttributes.ContentState.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PrintActivityAttributes.ContentState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PrintActivityAttributes.ContentState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_10000A1CC + 4 * byte_100018F39[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_10000A200 + 4 * byte_100018F34[v4]))();
}

uint64_t sub_10000A200(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A208(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000A210);
  return result;
}

uint64_t sub_10000A21C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000A224);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_10000A228(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A230(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A23C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000A248(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes.ContentState.CodingKeys()
{
  return &type metadata for PrintActivityAttributes.ContentState.CodingKeys;
}

uint64_t initializeBufferWithCopyOfBuffer for PrintActivityAttributes.ContentState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for PrintActivityAttributes.ContentState(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));
}

uint64_t initializeWithCopy for PrintActivityAttributes.ContentState(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

_QWORD *assignWithCopy for PrintActivityAttributes.ContentState(_QWORD *a1, _QWORD *a2)
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
  a1[3] = a2[3];
  a1[4] = a2[4];
  v6 = a2[5];
  v7 = a1[5];
  a1[5] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

__n128 initializeWithTake for PrintActivityAttributes.ContentState(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PrintActivityAttributes.ContentState(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintActivityAttributes.ContentState(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrintActivityAttributes.ContentState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes.ContentState()
{
  return &type metadata for PrintActivityAttributes.ContentState;
}

unint64_t sub_10000A480()
{
  unint64_t result;

  result = qword_100020D00;
  if (!qword_100020D00)
  {
    result = swift_getWitnessTable(&unk_100019168, &type metadata for PrintActivityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100020D00);
  }
  return result;
}

unint64_t sub_10000A4C8()
{
  unint64_t result;

  result = qword_100020D08;
  if (!qword_100020D08)
  {
    result = swift_getWitnessTable(&unk_100019190, &type metadata for PrintActivityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100020D08);
  }
  return result;
}

unint64_t sub_10000A510()
{
  unint64_t result;

  result = qword_100020D10;
  if (!qword_100020D10)
  {
    result = swift_getWitnessTable(&unk_1000191B8, &type metadata for PrintActivityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100020D10);
  }
  return result;
}

unint64_t sub_10000A558()
{
  unint64_t result;

  result = qword_100020D18;
  if (!qword_100020D18)
  {
    result = swift_getWitnessTable(&unk_1000190D8, &type metadata for PrintActivityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100020D18);
  }
  return result;
}

unint64_t sub_10000A5A0()
{
  unint64_t result;

  result = qword_100020D20;
  if (!qword_100020D20)
  {
    result = swift_getWitnessTable(&unk_100019100, &type metadata for PrintActivityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100020D20);
  }
  return result;
}

uint64_t destroy for NoJobsView(_QWORD *a1)
{
  swift_release(*a1);
  return swift_release(a1[1]);
}

uint64_t *_s12Print_Center10NoJobsViewVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain(v3);
  swift_retain(v4);
  return a1;
}

uint64_t *assignWithCopy for NoJobsView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  v6 = a1[1];
  v7 = a2[1];
  a1[1] = v7;
  swift_retain(v7);
  swift_release(v6);
  return a1;
}

__n128 initializeWithTake for NoJobsView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for NoJobsView(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for NoJobsView(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NoJobsView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for NoJobsView()
{
  return &type metadata for NoJobsView;
}

uint64_t sub_10000A7A4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100019C00, 1);
}

uint64_t sub_10000A7B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char *v3;
  id v4;
  Swift::String v5;
  Swift::String v6;
  Swift::String v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  Swift::String v22;
  Swift::String v23;

  sub_100006A30(&qword_100020D28);
  __chkstk_darwin();
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v23._countAndFlagsBits = 0xD000000000000023;
  v23._object = (void *)0x8000000100017650;
  v5._object = (void *)0x8000000100017630;
  v5._countAndFlagsBits = 0xD000000000000012;
  v6._countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  v7 = NSLocalizedString(_:tableName:bundle:value:comment:)(v5, (Swift::String_optional)0, (NSBundle)v4, v6, v23);

  v22 = v7;
  v8 = sub_10000AA80();
  v9 = Text.init<A>(_:)(&v22, &type metadata for String, v8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  KeyPath = swift_getKeyPath(&unk_1000192F0);
  v17 = type metadata accessor for Font.Design(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v3, 1, 1, v17);
  v18 = static Font.system(size:weight:design:)(0, 1, v3, 20.0);
  sub_10000AB10((uint64_t)v3);
  v19 = swift_getKeyPath(&unk_100019320);
  v20 = static Color.secondary.getter();
  result = swift_getKeyPath(&unk_100019350);
  *(_QWORD *)a1 = v9;
  *(_QWORD *)(a1 + 8) = v11;
  *(_BYTE *)(a1 + 16) = v13 & 1;
  *(_QWORD *)(a1 + 24) = v15;
  *(_QWORD *)(a1 + 32) = KeyPath;
  *(_BYTE *)(a1 + 40) = 1;
  *(_QWORD *)(a1 + 48) = v19;
  *(_QWORD *)(a1 + 56) = v18;
  *(_QWORD *)(a1 + 64) = result;
  *(_QWORD *)(a1 + 72) = v20;
  return result;
}

uint64_t sub_10000A980()
{
  return static View._viewListCount(inputs:)();
}

void sub_10000A998(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _QWORD v18[2];
  char v19;
  __int128 v20;
  char v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;

  v17 = static HorizontalAlignment.center.getter();
  v2 = static VerticalAlignment.center.getter();
  v3 = sub_10000A7B4((uint64_t)v18);
  v4 = v18[0];
  v5 = v18[1];
  v6 = v19;
  v7 = v21;
  v8 = v23;
  v9 = v24;
  v15 = v20;
  v16 = v22;
  v27 = 1;
  v26 = 1;
  v25 = v19;
  v10 = static Edge.Set.top.getter(v3);
  v11 = EdgeInsets.init(_all:)(120.0);
  LOBYTE(v18[0]) = 0;
  *(_QWORD *)a1 = v17;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = v2;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  *(_QWORD *)(a1 + 48) = v4;
  *(_QWORD *)(a1 + 56) = v5;
  *(_BYTE *)(a1 + 64) = v6;
  *(_OWORD *)(a1 + 72) = v15;
  *(_BYTE *)(a1 + 88) = v7;
  *(_OWORD *)(a1 + 96) = v16;
  *(_QWORD *)(a1 + 112) = v8;
  *(_QWORD *)(a1 + 120) = v9;
  *(_BYTE *)(a1 + 128) = v10;
  *(double *)(a1 + 136) = v11;
  *(_QWORD *)(a1 + 144) = v12;
  *(_QWORD *)(a1 + 152) = v13;
  *(_QWORD *)(a1 + 160) = v14;
  *(_BYTE *)(a1 + 168) = v18[0];
}

unint64_t sub_10000AA80()
{
  unint64_t result;

  result = qword_100020D30;
  if (!qword_100020D30)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100020D30);
  }
  return result;
}

uint64_t sub_10000AAC4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000AAEC(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_10000AB10(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006A30(&qword_100020D28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000AB50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000AB78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000ABA0(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_10000ABC8(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_10000ABF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000AC18(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

unint64_t sub_10000AC44()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100020D38;
  if (!qword_100020D38)
  {
    v1 = sub_1000067D4(&qword_100020D40);
    sub_10000ACB0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100020D38);
  }
  return result;
}

unint64_t sub_10000ACB0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100020D48;
  if (!qword_100020D48)
  {
    v1 = sub_1000067D4(&qword_100020D50);
    result = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100020D48);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for JobCellView(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = v3;
  return a1;
}

void destroy for JobCellView(uint64_t a1)
{

}

uint64_t assignWithCopy for JobCellView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for JobCellView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for JobCellView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for JobCellView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for JobCellView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for JobCellView()
{
  return &type metadata for JobCellView;
}

uint64_t sub_10000AE70(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100019C44, 1);
}

uint64_t *sub_10000AE80@<X0>(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W2>, _OWORD *a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  id v24;
  uint64_t v25;
  _QWORD *v26;
  double v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  int v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned __int8 v65;
  unsigned __int8 v66;
  unsigned __int8 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78[2];
  char v79;
  char v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  double v87;
  double v88;
  double v89;
  unsigned int v90;
  unsigned int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unsigned __int8 v100;
  uint64_t v101;
  unsigned __int8 v102;
  uint64_t v103;
  uint64_t v104;
  double v105;
  unsigned int v106;
  unsigned int v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;

  v60 = a3;
  v59 = a1;
  v6 = sub_100006A30(&qword_100020D60);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v52 - v10;
  v12 = type metadata accessor for Image.ResizingMode(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = a2;
  v17 = sub_100010EBC();

  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, enum case for Image.ResizingMode.stretch(_:), v12);
  v18 = 0.0;
  v63 = Image.resizable(capInsets:resizingMode:)(v15, v17, 0.0, 0.0, 0.0, 0.0);
  swift_release(v17);
  v19 = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v20 = static Alignment.center.getter(v19);
  _FrameLayout.init(width:height:alignment:)(&v99, 0x4044000000000000, 0, 0, 1, v20, v21);
  v64 = v99;
  v22 = v100;
  v62 = v101;
  v23 = v102;
  v57 = v104;
  v58 = v103;
  v24 = v16;
  LOBYTE(v12) = sub_100010FB8();

  if ((v12 & 1) != 0)
    v18 = 1.0;
  v56 = static Color.secondary.getter(v25);
  v26 = StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)(&v105, 0, 0, &_swiftEmptyArrayStorage, 0.25, 10.0, 0.0);
  v27 = v105;
  v28 = v106;
  v55 = v106;
  v61 = v107;
  v29 = v108;
  v53 = v109;
  v30 = v110;
  v31 = static Alignment.center.getter(v26);
  v52 = v32;
  v67 = 1;
  v66 = v22;
  v65 = v23;
  v33 = (uint64_t)v11;
  *(_QWORD *)v11 = static HorizontalAlignment.leading.getter();
  *((_QWORD *)v11 + 1) = 0;
  v11[16] = 0;
  v34 = sub_100006A30(&qword_100020D68);
  sub_10000B270(v59, v24, v60, (uint64_t)&v11[*(int *)(v34 + 44)]);
  v35 = v67;
  v54 = v67;
  v36 = v66;
  LODWORD(v59) = v66;
  v37 = v65;
  v60 = v65;
  sub_10000C6E4(v33, (uint64_t)v9, &qword_100020D60);
  v68 = (unint64_t)v63;
  LOWORD(v69) = v35;
  *((_QWORD *)&v69 + 1) = v64;
  LOBYTE(v70) = v36;
  *((_QWORD *)&v70 + 1) = v62;
  LOBYTE(v71) = v37;
  v38 = v57;
  v39 = v58;
  *((_QWORD *)&v71 + 1) = v58;
  *(_QWORD *)&v72 = v57;
  *((double *)&v72 + 1) = v18;
  *(double *)&v73 = v27 * 0.5;
  *((double *)&v73 + 1) = v27;
  *(_QWORD *)&v74 = __PAIR64__(v61, v28);
  *((_QWORD *)&v74 + 1) = v29;
  v40 = v52;
  v41 = v53;
  *(_QWORD *)&v75 = v53;
  *((_QWORD *)&v75 + 1) = v30;
  v42 = v56;
  *(_QWORD *)&v76 = v56;
  WORD4(v76) = 256;
  *(_QWORD *)&v77 = v31;
  *((_QWORD *)&v77 + 1) = v52;
  v43 = v70;
  v44 = v71;
  v45 = v73;
  a4[4] = v72;
  a4[5] = v45;
  a4[2] = v43;
  a4[3] = v44;
  v46 = v69;
  *a4 = v68;
  a4[1] = v46;
  v47 = v74;
  v48 = v75;
  v49 = v77;
  a4[8] = v76;
  a4[9] = v49;
  a4[6] = v47;
  a4[7] = v48;
  v50 = (uint64_t)a4 + *(int *)(sub_100006A30(&qword_100020D70) + 48);
  sub_10000C6E4((uint64_t)v9, v50, &qword_100020D60);
  sub_10000C3CC(&v68);
  sub_10000C728(v33, &qword_100020D60);
  sub_10000C728((uint64_t)v9, &qword_100020D60);
  v78[0] = v63;
  v78[1] = 0;
  v79 = v54;
  v80 = 0;
  v81 = v64;
  v82 = v59;
  v83 = v62;
  v84 = v60;
  v85 = v39;
  v86 = v38;
  v87 = v18;
  v88 = v27 * 0.5;
  v89 = v27;
  v90 = v55;
  v91 = v61;
  v92 = v29;
  v93 = v41;
  v94 = v30;
  v95 = v42;
  v96 = 256;
  v97 = v31;
  v98 = v40;
  return sub_10000C414(v78);
}

uint64_t sub_10000B270@<X0>(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t KeyPath;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  double v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t *v123;
  void *v124;
  unint64_t v125;
  void (*v126)(char *, char *, uint64_t);
  void (*v127)(char *);
  unsigned int v128;
  uint64_t v129;
  int v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;

  v130 = a3;
  v129 = a1;
  v134 = a4;
  v5 = sub_100006A30(&qword_100020D78);
  v6 = __chkstk_darwin(v5);
  v133 = (uint64_t)&v120 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v140 = (uint64_t *)((char *)&v120 - v8);
  v142 = sub_100006A30(&qword_100020D80);
  __chkstk_darwin(v142);
  v10 = (uint64_t *)((char *)&v120 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v137 = type metadata accessor for Text.TruncationMode(0);
  v135 = *(_QWORD *)(v137 - 8);
  __chkstk_darwin(v137);
  v136 = (char *)&v120 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v141 = sub_100006A30(&qword_100020D88);
  __chkstk_darwin(v141);
  v13 = (char *)&v120 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v143 = sub_100006A30(&qword_100020D90);
  __chkstk_darwin(v143);
  v138 = (uint64_t)&v120 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v145 = sub_100006A30(&qword_100020D98);
  v15 = __chkstk_darwin(v145);
  v132 = (uint64_t)&v120 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v131 = (uint64_t)&v120 - v18;
  v19 = __chkstk_darwin(v17);
  v139 = (uint64_t)&v120 - v20;
  __chkstk_darwin(v19);
  v144 = (uint64_t)&v120 - v21;
  v22 = a2;
  v124 = v22;
  v23 = sub_100011204();
  v25 = v24;

  v146 = v23;
  v147 = v25;
  v125 = sub_10000AA80();
  v26 = Text.init<A>(_:)(&v146, &type metadata for String, v125);
  v28 = v27;
  v30 = v29;
  v32 = v31 & 1;
  v33 = static Font.subheadline.getter();
  v34 = Text.font(_:)(v33, v26, v28, v32, v30);
  v36 = v35;
  v38 = v37;
  v121 = v39;
  swift_release(v33);
  LOBYTE(v33) = v38 & 1;
  sub_10000C45C(v26, v28, v32);
  swift_bridgeObjectRelease(v30);
  v128 = enum case for Text.TruncationMode.middle(_:);
  v40 = v135;
  v127 = *(void (**)(char *))(v135 + 104);
  v42 = v136;
  v41 = v137;
  v127(v136);
  KeyPath = swift_getKeyPath(&unk_1000193F0);
  v44 = (char *)v10 + *(int *)(v142 + 28);
  v126 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  v45 = v41;
  v126(v44, v42, v41);
  *v10 = KeyPath;
  v46 = (uint64_t)&v13[*(int *)(v141 + 36)];
  v47 = (uint64_t)v10;
  v123 = v10;
  sub_10000C6E4((uint64_t)v10, v46, &qword_100020D80);
  v48 = (uint64_t)v13;
  *(_QWORD *)v13 = v34;
  *((_QWORD *)v13 + 1) = v36;
  v13[16] = v33;
  v49 = v121;
  *((_QWORD *)v13 + 3) = v121;
  v122 = v13;
  sub_10000C52C(v34, v36, v33);
  swift_bridgeObjectRetain(v49);
  sub_10000C728(v47, &qword_100020D80);
  v135 = *(_QWORD *)(v135 + 8);
  ((void (*)(char *, uint64_t))v135)(v42, v45);
  sub_10000C45C(v34, v36, v33);
  swift_bridgeObjectRelease(v49);
  v50 = swift_getKeyPath(&unk_100019420);
  v51 = (uint64_t)v13;
  v52 = v138;
  sub_10000C6E4(v51, v138, &qword_100020D88);
  v53 = v52 + *(int *)(v143 + 36);
  *(_QWORD *)v53 = v50;
  *(_QWORD *)(v53 + 8) = 0;
  *(_BYTE *)(v53 + 16) = 0;
  v54 = sub_10000C728(v48, &qword_100020D88);
  LOBYTE(v50) = static Edge.Set.trailing.getter(v54);
  v55 = EdgeInsets.init(_all:)(50.0);
  v57 = v56;
  v59 = v58;
  v61 = v60;
  v62 = v139;
  sub_10000C6E4(v52, v139, &qword_100020D90);
  v63 = v62 + *(int *)(v145 + 36);
  *(_BYTE *)v63 = v50;
  *(double *)(v63 + 8) = v55;
  *(_QWORD *)(v63 + 16) = v57;
  *(_QWORD *)(v63 + 24) = v59;
  *(_QWORD *)(v63 + 32) = v61;
  *(_BYTE *)(v63 + 40) = 0;
  sub_10000C728(v52, &qword_100020D90);
  v64 = sub_10000C598(v62, v144);
  v65 = static VerticalAlignment.center.getter(v64);
  v66 = v140;
  *v140 = v65;
  v66[1] = 0;
  *((_BYTE *)v66 + 16) = 1;
  v67 = (uint64_t)v66 + *(int *)(sub_100006A30(&qword_100020DA0) + 44);
  v68 = v124;
  LOBYTE(v50) = v130;
  sub_10000BB0C(v129, v124, v130, v67);
  v69 = v68;
  v70 = sub_1000113F8(v50);
  v72 = v71;

  v146 = v70;
  v147 = v72;
  v73 = Text.init<A>(_:)(&v146, &type metadata for String, v125);
  v75 = v74;
  v77 = v76;
  v79 = v78 & 1;
  v80 = static Font.subheadline.getter();
  v81 = Text.font(_:)(v80, v73, v75, v79, v77);
  v83 = v82;
  LOBYTE(v36) = v84;
  v86 = v85;
  swift_release(v80);
  LOBYTE(v80) = v36 & 1;
  sub_10000C45C(v73, v75, v79);
  swift_bridgeObjectRelease(v77);
  v87 = Text.monospacedDigit()(v81, v83, v36 & 1, v86);
  v89 = v88;
  v91 = v90;
  LOBYTE(v49) = v92 & 1;
  sub_10000C45C(v81, v83, v80);
  swift_bridgeObjectRelease(v86);
  v94 = v136;
  v93 = v137;
  ((void (*)(char *, _QWORD, uint64_t))v127)(v136, v128, v137);
  v95 = swift_getKeyPath(&unk_1000193F0);
  v96 = v123;
  v97 = v93;
  v126((char *)v123 + *(int *)(v142 + 28), v94, v93);
  *v96 = v95;
  v98 = (uint64_t)v122;
  sub_10000C6E4((uint64_t)v96, (uint64_t)&v122[*(int *)(v141 + 36)], &qword_100020D80);
  *(_QWORD *)v98 = v87;
  *(_QWORD *)(v98 + 8) = v89;
  *(_BYTE *)(v98 + 16) = v49;
  *(_QWORD *)(v98 + 24) = v91;
  sub_10000C52C(v87, v89, v49);
  swift_bridgeObjectRetain(v91);
  sub_10000C728((uint64_t)v96, &qword_100020D80);
  ((void (*)(char *, uint64_t))v135)(v94, v97);
  sub_10000C45C(v87, v89, v49);
  swift_bridgeObjectRelease(v91);
  v99 = swift_getKeyPath(&unk_100019420);
  v100 = v138;
  sub_10000C6E4(v98, v138, &qword_100020D88);
  v101 = v100 + *(int *)(v143 + 36);
  *(_QWORD *)v101 = v99;
  *(_QWORD *)(v101 + 8) = 0;
  *(_BYTE *)(v101 + 16) = 0;
  v102 = sub_10000C728(v98, &qword_100020D88);
  LOBYTE(v99) = static Edge.Set.bottom.getter(v102);
  v103 = EdgeInsets.init(_all:)(1.0);
  v105 = v104;
  v107 = v106;
  v109 = v108;
  v110 = v131;
  sub_10000C6E4(v100, v131, &qword_100020D90);
  v111 = v110 + *(int *)(v145 + 36);
  *(_BYTE *)v111 = v99;
  *(double *)(v111 + 8) = v103;
  *(_QWORD *)(v111 + 16) = v105;
  *(_QWORD *)(v111 + 24) = v107;
  *(_QWORD *)(v111 + 32) = v109;
  *(_BYTE *)(v111 + 40) = 0;
  sub_10000C728(v100, &qword_100020D90);
  v112 = v139;
  sub_10000C598(v110, v139);
  v113 = v144;
  sub_10000C6E4(v144, v110, &qword_100020D98);
  v114 = v140;
  v115 = v133;
  sub_10000C6E4((uint64_t)v140, v133, &qword_100020D78);
  v116 = v132;
  sub_10000C6E4(v112, v132, &qword_100020D98);
  v117 = v134;
  sub_10000C6E4(v110, v134, &qword_100020D98);
  v118 = sub_100006A30(&qword_100020DA8);
  sub_10000C6E4(v115, v117 + *(int *)(v118 + 48), &qword_100020D78);
  sub_10000C6E4(v116, v117 + *(int *)(v118 + 64), &qword_100020D98);
  sub_10000C728(v112, &qword_100020D98);
  sub_10000C728((uint64_t)v114, &qword_100020D78);
  sub_10000C728(v113, &qword_100020D98);
  sub_10000C728(v116, &qword_100020D98);
  sub_10000C728(v115, &qword_100020D78);
  return sub_10000C728(v110, &qword_100020D98);
}

uint64_t sub_10000BB0C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  id v33;
  double v34;
  id v35;
  id v36;
  char *v37;
  uint64_t v38;
  char *v39;
  id v40;
  BOOL v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  unint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t OpaqueTypeConformance2;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  id v62;
  double v63;
  uint64_t v64;
  id v65;
  double v66;
  id v67;
  double v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  void (*v77)(char *, char *, uint64_t);
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  void (*v96)(char *, char *, uint64_t);
  uint64_t v97;
  uint64_t v98;
  void (*v99)(char *, uint64_t);
  uint64_t v101;
  char *v102;
  char *v103;
  char *v104;
  char *v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  int v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  double v125;
  uint64_t v126;
  char *v127;
  unint64_t v128;
  uint64_t v129;

  v113 = a3;
  v115 = a1;
  v119 = a4;
  v117 = sub_100006A30(&qword_100020DB0);
  v114 = *(_QWORD *)(v117 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v121 = (char *)&v101 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006A30(&qword_100020DB8);
  v122 = *(_QWORD *)(v6 - 8);
  v123 = v6;
  v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v116 = (char *)&v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v118 = (char *)&v101 - v9;
  v109 = sub_100006A30(&qword_100020DC0);
  __chkstk_darwin(v109);
  v106 = (char *)&v101 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = type metadata accessor for LinearProgressViewStyle(0);
  v110 = *(_QWORD *)(v111 - 8);
  __chkstk_darwin(v111);
  v12 = (char *)&v101 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = sub_100006A30(&qword_100020DC8);
  v107 = *(_QWORD *)(v108 - 8);
  v13 = __chkstk_darwin(v108);
  v15 = (char *)&v101 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v101 - v16;
  v112 = sub_100006A30(&qword_100020DD0);
  v18 = *(_QWORD *)(v112 - 8);
  v19 = __chkstk_darwin(v112);
  v21 = (char *)&v101 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __chkstk_darwin(v19);
  v105 = (char *)&v101 - v23;
  v24 = __chkstk_darwin(v22);
  v26 = (char *)&v101 - v25;
  __chkstk_darwin(v24);
  v104 = (char *)&v101 - v27;
  v28 = sub_100006A30(&qword_100020DD8);
  v29 = __chkstk_darwin(v28);
  v120 = (uint64_t)&v101 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  v32 = (char *)&v101 - v31;
  v33 = a2;
  v34 = sub_100011338();

  v124 = v33;
  if (v34 == 0.0)
  {
    v35 = v33;
    if (objc_msgSend(v35, "state") == (id)5)
    {

LABEL_6:
      v42 = ProgressView<>.init<>()();
      LinearProgressViewStyle.init()(v42);
      v43 = v17;
      v44 = sub_1000091DC(&qword_100020DE8, &qword_100020DC8, (uint64_t)&protocol conformance descriptor for ProgressView<A, B>);
      v105 = (char *)v44;
      v45 = sub_10000C624();
      v46 = v106;
      v47 = v45;
      v48 = v12;
      v49 = v26;
      v50 = v12;
      v51 = v108;
      v52 = v111;
      View.progressViewStyle<A>(_:)(v48, v108, v111, v44, v47);
      (*(void (**)(char *, uint64_t))(v110 + 8))(v50, v52);
      (*(void (**)(char *, uint64_t))(v107 + 8))(v43, v51);
      v53 = v104;
      v54 = v112;
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v104, v49, v112);
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v46, v53, v54);
      swift_storeEnumTagMultiPayload(v46, v109, 0);
      v125 = *(double *)&v51;
      v126 = v52;
      v127 = v105;
      v128 = v47;
      OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v125, &opaque type descriptor for <<opaque return type of View.progressViewStyle<A>(_:)>>, 1);
      _ConditionalContent<>.init(storage:)(v46, v54, v54, OpaqueTypeConformance2, OpaqueTypeConformance2);
      v56 = v53;
      v57 = v18;
      v58 = v114;
      v59 = v115;
      v60 = v113;
      v61 = (uint64_t)v32;
      goto LABEL_12;
    }
    v36 = objc_msgSend(v35, "state");
    v102 = v26;
    v37 = v12;
    v38 = v18;
    v39 = v15;
    v40 = v36;

    v41 = v40 == (id)10;
    v15 = v39;
    v18 = v38;
    v12 = v37;
    v26 = v102;
    v33 = v124;
    if (v41)
      goto LABEL_6;
  }
  v62 = objc_msgSend(v33, "state");
  v63 = 0.0;
  v103 = v32;
  v64 = v18;
  if (v62 == (id)5)
  {
    v65 = v33;
    v66 = sub_100011338();

    v59 = v115;
    if (v66 != 0.0)
    {
      v67 = v65;
      v68 = sub_100011338();

      v63 = v68 * 100.0;
    }
  }
  else
  {
    v59 = v115;
  }
  v125 = v63;
  LOBYTE(v126) = 0;
  v129 = 0x4059000000000000;
  v69 = sub_10000C5E0();
  v70 = ProgressView.init<A>(value:total:)(&v125, &v129, &type metadata for Double, v69);
  LinearProgressViewStyle.init()(v70);
  v71 = sub_1000091DC(&qword_100020DE8, &qword_100020DC8, (uint64_t)&protocol conformance descriptor for ProgressView<A, B>);
  v72 = sub_10000C624();
  v73 = v12;
  v74 = v108;
  v75 = v12;
  v76 = v111;
  View.progressViewStyle<A>(_:)(v73, v108, v111, v71, v72);
  (*(void (**)(char *, uint64_t))(v110 + 8))(v75, v76);
  (*(void (**)(char *, uint64_t))(v107 + 8))(v15, v74);
  v57 = v64;
  v77 = *(void (**)(char *, char *, uint64_t))(v64 + 32);
  v78 = v105;
  v54 = v112;
  v77(v105, v21, v112);
  v79 = v106;
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v106, v78, v54);
  swift_storeEnumTagMultiPayload(v79, v109, 1);
  v125 = *(double *)&v74;
  v126 = v76;
  v127 = (char *)v71;
  v128 = v72;
  v80 = swift_getOpaqueTypeConformance2(&v125, &opaque type descriptor for <<opaque return type of View.progressViewStyle<A>(_:)>>, 1);
  v61 = (uint64_t)v103;
  _ConditionalContent<>.init(storage:)(v79, v54, v54, v80, v80);
  v56 = v78;
  v58 = v114;
  v60 = v113;
LABEL_12:
  (*(void (**)(char *, uint64_t))(v57 + 8))(v56, v54);
  v81 = swift_allocObject(&unk_10001D488, 33, 7);
  v82 = v124;
  *(_QWORD *)(v81 + 16) = v59;
  *(_QWORD *)(v81 + 24) = v82;
  *(_BYTE *)(v81 + 32) = v60 & 1;
  v83 = v82;
  v84 = v121;
  v85 = Button.init(action:label:)(sub_10000C690, v81, sub_10000C330, 0, &type metadata for Image, &protocol witness table for Image);
  v86 = static Color.secondary.getter(v85);
  v87 = static Color.white.getter();
  v125 = *(double *)&v86;
  v126 = v87;
  v88 = sub_1000091DC(&qword_100020DF8, &qword_100020DB0, (uint64_t)&protocol conformance descriptor for Button<A>);
  v89 = sub_10000C6A0();
  v91 = v116;
  v90 = v117;
  View.buttonStyle<A>(_:)(&v125, v117, &type metadata for PrintCenterCellButtonStyle, v88, v89);
  swift_release(v87);
  swift_release(v86);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v84, v90);
  v93 = v122;
  v92 = v123;
  v94 = v118;
  (*(void (**)(char *, char *, uint64_t))(v122 + 32))(v118, v91, v123);
  v95 = v120;
  sub_10000C6E4(v61, v120, &qword_100020DD8);
  v96 = *(void (**)(char *, char *, uint64_t))(v93 + 16);
  v96(v91, v94, v92);
  v97 = v119;
  sub_10000C6E4(v95, v119, &qword_100020DD8);
  v98 = sub_100006A30(&qword_100020E08);
  v96((char *)(v97 + *(int *)(v98 + 48)), v91, v92);
  v99 = *(void (**)(char *, uint64_t))(v93 + 8);
  v99(v94, v92);
  sub_10000C728(v61, &qword_100020DD8);
  v99(v91, v92);
  return sub_10000C728(v95, &qword_100020DD8);
}

uint64_t sub_10000C330@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = Image.init(systemName:)(0xD000000000000011, 0x8000000100017680);
  *a1 = result;
  return result;
}

uint64_t *sub_10000C36C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;

  v3 = *(_QWORD *)v1;
  v4 = *(void **)(v1 + 8);
  v5 = *(unsigned __int8 *)(v1 + 16);
  *(_QWORD *)a1 = static VerticalAlignment.top.getter();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v6 = sub_100006A30(&qword_100020D58);
  return sub_10000AE80(v3, v4, v5, (_OWORD *)(a1 + *(int *)(v6 + 44)));
}

_QWORD *sub_10000C3CC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[14];
  v3 = a1[16];
  swift_retain(*a1);
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  return a1;
}

uint64_t *sub_10000C414(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[14];
  swift_release(a1[16]);
  swift_bridgeObjectRelease(v3);
  swift_release(v2);
  return a1;
}

uint64_t sub_10000C45C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_10000C46C()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_10000C48C()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_10000C4AC(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for Text.TruncationMode(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.truncationMode.setter(v3);
}

uint64_t sub_10000C52C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_10000C53C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10000C56C(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_10000C598(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006A30(&qword_100020D98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000C5E0()
{
  unint64_t result;

  result = qword_100020DE0;
  if (!qword_100020DE0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Double, &type metadata for Double);
    atomic_store(result, (unint64_t *)&qword_100020DE0);
  }
  return result;
}

unint64_t sub_10000C624()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100020DF0;
  if (!qword_100020DF0)
  {
    v1 = type metadata accessor for LinearProgressViewStyle(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for LinearProgressViewStyle, v1);
    atomic_store(result, (unint64_t *)&qword_100020DF0);
  }
  return result;
}

uint64_t sub_10000C66C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 33, 7);
}

id sub_10000C690()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 24), "cancel");
}

unint64_t sub_10000C6A0()
{
  unint64_t result;

  result = qword_100020E00;
  if (!qword_100020E00)
  {
    result = swift_getWitnessTable(&unk_10001996C, &type metadata for PrintCenterCellButtonStyle);
    atomic_store(result, (unint64_t *)&qword_100020E00);
  }
  return result;
}

uint64_t sub_10000C6E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100006A30(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000C728(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100006A30(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000C764()
{
  return sub_1000091DC(&qword_100020E10, &qword_100020E18, (uint64_t)&protocol conformance descriptor for HStack<A>);
}

_UNKNOWN **static DeviceCategory.allCases.getter()
{
  return &off_10001CD98;
}

void sub_10000C7A4()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

void sub_10000C7D0(_QWORD *a1@<X8>)
{
  *a1 = &off_10001CDD8;
}

_UNKNOWN **static DisplayCategory.allCases.getter()
{
  return &off_10001CE18;
}

void *sub_10000C7EC()
{
  return &protocol witness table for Int;
}

uint64_t sub_10000C7F8()
{
  return sub_1000085EC(&qword_100020E20, (uint64_t (*)(uint64_t))type metadata accessor for DeviceCategory, (uint64_t)&unk_100018EB8);
}

uint64_t sub_10000C824()
{
  return sub_10000C91C(&qword_100020E28, &qword_100020E30);
}

uint64_t sub_10000C848()
{
  return sub_1000085EC(&qword_100020E38, (uint64_t (*)(uint64_t))type metadata accessor for DisplayCategory, (uint64_t)&unk_100018E90);
}

Swift::Int sub_10000C874()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_10000C8B8(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10000C8F8()
{
  return sub_10000C91C(&qword_100020E40, &qword_100020E48);
}

uint64_t sub_10000C91C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_1000067D4(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_10000C95C(_QWORD *a1@<X8>)
{
  *a1 = &off_10001CE18;
}

uint64_t sub_10000C970()
{
  uint64_t result;

  result = static Font.headline.getter();
  qword_100021148 = result;
  return result;
}

void sub_10000C98C()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v4._countAndFlagsBits = 0xD00000000000002ELL;
  v4._object = (void *)0x8000000100017730;
  v1._object = (void *)0x80000001000177E0;
  v1._countAndFlagsBits = 0xD000000000000010;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021150 = (__int128)v3;
}

void sub_10000CA40()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v4._countAndFlagsBits = 0xD000000000000035;
  v4._object = (void *)0x8000000100017780;
  v1._object = (void *)0x8000000100017760;
  v1._countAndFlagsBits = 0xD000000000000015;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021160 = (__int128)v3;
}

void sub_10000CAF4()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v4._object = (void *)0x80000001000176A0;
  v1._countAndFlagsBits = 0x676E6974696157;
  v1._object = (void *)0xE700000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000018;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021170 = (__int128)v3;
}

void sub_10000CBA0()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v4._object = (void *)0x8000000100017710;
  v1._countAndFlagsBits = 0x646573756150;
  v1._object = (void *)0xE600000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000015;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021180 = (__int128)v3;
}

void sub_10000CC48()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v4._object = (void *)0x8000000100017730;
  v1._countAndFlagsBits = 0x676E69746E697250;
  v1._object = (void *)0xE800000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD00000000000002ELL;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021190 = (__int128)v3;
}

void sub_10000CCF4()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v4._object = (void *)0x80000001000177C0;
  v1._countAndFlagsBits = 0x646570706F7453;
  v1._object = (void *)0xE700000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000018;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_1000211A0 = (__int128)v3;
}

void sub_10000CDA0()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v4._object = (void *)0x8000000100017800;
  v1._countAndFlagsBits = 0x64656C65636E6143;
  v1._object = (void *)0xE800000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000019;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_1000211B0 = (__int128)v3;
}

void sub_10000CE4C()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v4._object = (void *)0x8000000100017820;
  v1._countAndFlagsBits = 0x64656C696146;
  v1._object = (void *)0xE600000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000017;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_1000211C0 = (__int128)v3;
}

void sub_10000CEF4()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v4._object = (void *)0x8000000100017840;
  v1._countAndFlagsBits = 0x6574656C706D6F43;
  v1._object = (void *)0xE900000000000064;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000019;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_1000211D0 = (__int128)v3;
}

void sub_10000CFA4()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v4._object = (void *)0x8000000100017900;
  v1._countAndFlagsBits = 0x6E776F6E6B6E55;
  v1._object = (void *)0xE700000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000018;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_1000211E0 = (__int128)v3;
}

void sub_10000D050()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v4._object = (void *)0x8000000100017860;
  v1._countAndFlagsBits = 8236;
  v1._object = (void *)0xE200000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000027;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_1000211F0 = (__int128)v3;
}

void sub_10000D0F0()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v4._object = (void *)0xE400000000000000;
  v1._countAndFlagsBits = 9666786;
  v1._object = (void *)0xA300000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 1752392036;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021200 = (__int128)v3;
}

void sub_10000D188()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v4._object = (void *)0xE000000000000000;
  v1._countAndFlagsBits = 0x676E696D6F636E49;
  v1._object = (void *)0xE800000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021210 = (__int128)v3;
}

void sub_10000D224()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v4._countAndFlagsBits = 0xD000000000000026;
  v4._object = (void *)0x80000001000176E0;
  v1._object = (void *)0x80000001000176C0;
  v1._countAndFlagsBits = 0xD000000000000017;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021220 = (__int128)v3;
}

void sub_10000D2D8()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v4._object = (void *)0x80000001000178D0;
  v1._object = (void *)0x80000001000178B0;
  v1._countAndFlagsBits = 0x1000000000000016;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD00000000000002ALL;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021230 = (__int128)v3;
}

void sub_10000D388()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v4._object = (void *)0x8000000100017890;
  v1._countAndFlagsBits = 541074806;
  v1._object = (void *)0xE400000000000000;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v4._countAndFlagsBits = 0xD000000000000019;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v4);

  xmmword_100021240 = (__int128)v3;
}

__n128 sub_10000D42C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 result;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  __n128 v13;

  v2 = sub_100006A30(&qword_100020E88);
  State.projectedValue.getter(&v12, v2);
  v3 = v12;
  v11 = v13;
  if (qword_100020A18 != -1)
    swift_once(&qword_100020A18, sub_100005324);
  v4 = qword_100021140;
  v5 = type metadata accessor for PrintMonitor(0);
  v6 = sub_10000D97C();
  v7 = swift_retain(v4);
  v8 = ObservedObject.init(wrappedValue:)(v7, v5, v6);
  *(_QWORD *)a1 = v3;
  result = v11;
  *(__n128 *)(a1 + 8) = v11;
  *(_QWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 32) = v10;
  return result;
}

uint64_t sub_10000D4F0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = sub_100006A30(&qword_100020E60);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  v6 = v0[1];
  v8 = v0[2];
  v7 = v0[3];
  v9 = (_QWORD *)swift_allocObject(&unk_10001D5E0, 48, 7);
  v9[2] = v5;
  v9[3] = v6;
  v9[4] = v8;
  v9[5] = v7;
  swift_retain(v6);
  swift_retain(v7);
  swift_bridgeObjectRetain(v5);
  v10 = sub_100006A30(&qword_100020E68);
  v11 = sub_1000091DC(&qword_100020E70, &qword_100020E68, (uint64_t)&protocol conformance descriptor for NavigationStack<A, B>);
  WindowGroup.init(id:title:lazyContent:)(0, 0, 0, 0, 0, 0, sub_10000D9F8, v9, v10, v11);
  v12 = sub_1000091DC(&qword_100020E78, &qword_100020E60, (uint64_t)&protocol conformance descriptor for WindowGroup<A>);
  static SceneBuilder.buildBlock<A>(_:)(v4, v1, v12);
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_10000D64C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];

  v11 = &_swiftEmptySetSingleton;
  v2 = sub_100006A30(&qword_100020E58);
  State.init(wrappedValue:)(v12, &v11, v2);
  v3 = v12[0];
  v4 = v12[1];
  if (qword_100020A18 != -1)
    swift_once(&qword_100020A18, sub_100005324);
  v5 = qword_100021140;
  v6 = type metadata accessor for PrintMonitor(0);
  v7 = sub_10000D97C();
  v8 = swift_retain(v5);
  result = ObservedObject.init(wrappedValue:)(v8, v6, v7);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = result;
  a1[3] = v10;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  sub_10000D740();
  static App.main()();
  return 0;
}

unint64_t sub_10000D740()
{
  unint64_t result;

  result = qword_100020E50;
  if (!qword_100020E50)
  {
    result = swift_getWitnessTable(&unk_1000195F8, &type metadata for PrintCenterApp);
    atomic_store(result, (unint64_t *)&qword_100020E50);
  }
  return result;
}

uint64_t destroy for PrintCenterApp(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  swift_release(a1[1]);
  return swift_release(a1[3]);
}

uint64_t *initializeWithCopy for PrintCenterApp(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRetain(v3);
  swift_retain(v4);
  swift_retain(v5);
  return a1;
}

uint64_t *assignWithCopy for PrintCenterApp(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = a1[1];
  v7 = a2[1];
  a1[1] = v7;
  swift_retain(v7);
  swift_release(v6);
  a1[2] = a2[2];
  v8 = a2[3];
  v9 = a1[3];
  a1[3] = v8;
  swift_retain(v8);
  swift_release(v9);
  return a1;
}

__n128 initializeWithTake for PrintCenterApp(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for PrintCenterApp(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release(v4);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = a1[3];
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  swift_release(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintCenterApp(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrintCenterApp(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintCenterApp()
{
  return &type metadata for PrintCenterApp;
}

uint64_t sub_10000D96C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100019C88, 1);
}

unint64_t sub_10000D97C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100020C88;
  if (!qword_100020C88)
  {
    v1 = type metadata accessor for PrintMonitor(255);
    result = swift_getWitnessTable(&unk_100018E58, v1);
    atomic_store(result, (unint64_t *)&qword_100020C88);
  }
  return result;
}

uint64_t sub_10000D9C4()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[2]);
  swift_release(v0[3]);
  swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000D9F8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD v4[3];
  __int128 v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 40);
  v4[2] = *(_QWORD *)(v0 + 16);
  v5 = *(_OWORD *)(v0 + 24);
  v6 = v1;
  v2 = sub_10000DA64();
  return NavigationStack.init<>(root:)(sub_10000DA58, v4, &type metadata for JobsListView, v2);
}

double sub_10000DA58@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_10000D42C(a1).n128_u64[0];
  return result;
}

unint64_t sub_10000DA64()
{
  unint64_t result;

  result = qword_100020E80;
  if (!qword_100020E80)
  {
    result = swift_getWitnessTable(&unk_10001975C, &type metadata for JobsListView);
    atomic_store(result, (unint64_t *)&qword_100020E80);
  }
  return result;
}

uint64_t sub_10000DAA8()
{
  return sub_1000091DC(&qword_100020E78, &qword_100020E60, (uint64_t)&protocol conformance descriptor for WindowGroup<A>);
}

uint64_t destroy for PrinterMessageView(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
}

_QWORD *initializeWithCopy for PrinterMessageView(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for PrinterMessageView(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for PrinterMessageView(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for PrinterMessageView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PrinterMessageView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PrinterMessageView()
{
  return &type metadata for PrinterMessageView;
}

uint64_t sub_10000DC80(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100019CCC, 1);
}

void sub_10000DC90(unsigned __int8 a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _BYTE v10[48];
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v18 = a2;
  v12 = sub_100006A30(&qword_100020D80);
  __chkstk_darwin(v12);
  v16 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = type metadata accessor for Text.TruncationMode(0);
  v14 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v13 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = sub_100006A30(&qword_100020D88);
  v5 = __chkstk_darwin(v11);
  v17 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  v19 = &v10[-v7];
  v8 = sub_100006A30(&qword_100020E98);
  __chkstk_darwin(v8);
  v9 = (char *)sub_10000DE28 + 4 * (unsigned __int16)aGggl[a1];
  v22 = 0;
  v23 = 0;
  v20 = 0;
  v21 = 0;
  v24 = 0;
  __asm { BR              X10 }
}

uint64_t sub_10000DE28()
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
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t KeyPath;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v4 = static Color.red.getter();
  swift_bridgeObjectRetain(0x8000000100017940);
  v5 = Image.init(systemName:)(0xD00000000000001CLL, 0x8000000100017940);
  ((void (*)(void))static SymbolRenderingMode.palette.getter)();
  v6 = ((uint64_t (*)(_QWORD))type metadata accessor for SymbolRenderingMode)(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v2, 0, 1, v6);
  v7 = ((uint64_t (*)(uint64_t, uint64_t))Image.symbolRenderingMode(_:))(v2, v5);
  swift_release(v5);
  v8 = sub_10000C728(v2, &qword_100020E98);
  v9 = ((uint64_t (*)(uint64_t))static Color.white.getter)(v8);
  v10 = swift_retain(v4);
  v11 = static Alignment.center.getter(v10);
  v13 = _FrameLayout.init(width:height:alignment:)((_QWORD *)(v3 - 136), 0x4032000000000000, 0, 0, 1, v11, v12);
  v14 = *(_QWORD *)(v3 - 136);
  *(_QWORD *)(v3 - 184) = *(unsigned __int8 *)(v3 - 128);
  v15 = *(_QWORD *)(v3 - 120);
  *(_QWORD *)(v3 - 200) = *(unsigned __int8 *)(v3 - 112);
  *(_QWORD *)(v3 - 192) = v15;
  *(_QWORD *)(v3 - 208) = *(_QWORD *)(v3 - 104);
  *(_QWORD *)(v3 - 176) = *(_QWORD *)(v3 - 96);
  LOBYTE(v5) = ((uint64_t (*)(_QWORD *))static Edge.Set.leading.getter)(v13);
  swift_retain(v7);
  swift_release(v4);
  swift_release(v7);
  swift_bridgeObjectRelease(0x8000000100017940);
  *(_QWORD *)(v3 - 224) = v4;
  *(_QWORD *)(v3 - 320) = v9;
  *(_DWORD *)(v3 - 308) = 1;
  *(_QWORD *)(v3 - 304) = v14;
  *(_QWORD *)(v3 - 296) = v5;
  *(_QWORD *)(v3 - 152) = v1;
  *(_QWORD *)(v3 - 144) = v0;
  v16 = sub_10000AA80();
  swift_bridgeObjectRetain(v0);
  v17 = Text.init<A>(_:)(v3 - 152, &type metadata for String, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22 & 1;
  v24 = static Font.headline.getter();
  v25 = Text.font(_:)(v24, v17, v19, v23, v21);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  swift_release(v24);
  v32 = v29 & 1;
  sub_10000C45C(v17, v19, v23);
  v33 = swift_bridgeObjectRelease(v21);
  v34 = ((double (*)(uint64_t))static Font.Weight.medium.getter)(v33);
  v35 = ((uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))Text.fontWeight(_:))(*(_QWORD *)&v34, 0, v25, v27, v32, v31);
  v37 = v36;
  *(_QWORD *)(v3 - 328) = v38;
  LOBYTE(v17) = v39 & 1;
  sub_10000C45C(v25, v27, v32);
  swift_bridgeObjectRelease(v31);
  v40 = *(_QWORD *)(v3 - 264);
  v41 = *(_QWORD *)(v3 - 272);
  v42 = *(_QWORD *)(v3 - 256);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v40 + 104))(v41, enum case for Text.TruncationMode.middle(_:), v42);
  KeyPath = swift_getKeyPath(&unk_1000196F8);
  v44 = *(uint64_t **)(v3 - 248);
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))((char *)v44 + *(int *)(*(_QWORD *)(v3 - 280) + 28), v41, v42);
  *v44 = KeyPath;
  v45 = *(_QWORD *)(v3 - 240);
  sub_10000C6E4((uint64_t)v44, v45 + *(int *)(*(_QWORD *)(v3 - 288) + 36), &qword_100020D80);
  *(_QWORD *)v45 = v35;
  *(_QWORD *)(v45 + 8) = v37;
  *(_BYTE *)(v45 + 16) = v17;
  v46 = *(_QWORD *)(v3 - 328);
  *(_QWORD *)(v45 + 24) = v46;
  sub_10000C52C(v35, v37, v17);
  swift_bridgeObjectRetain(v46);
  sub_10000C728((uint64_t)v44, &qword_100020D80);
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v41, v42);
  sub_10000C45C(v35, v37, v17);
  swift_bridgeObjectRelease(v46);
  v47 = *(_QWORD *)(v3 - 216);
  sub_10000E3B8(v45, v47);
  sub_10000C6E4(v47, v45, &qword_100020D88);
  v48 = *(_QWORD *)(v3 - 232);
  v49 = *(_QWORD *)(v3 - 224);
  v50 = *(_QWORD *)(v3 - 320);
  *(_QWORD *)v48 = v7;
  *(_QWORD *)(v48 + 8) = v50;
  v51 = *(_QWORD *)(v3 - 304);
  *(_QWORD *)(v48 + 16) = v49;
  *(_QWORD *)(v48 + 24) = v51;
  v52 = *(_QWORD *)(v3 - 176);
  v53 = *(_QWORD *)(v3 - 192);
  *(_QWORD *)(v48 + 32) = *(_QWORD *)(v3 - 184);
  *(_QWORD *)(v48 + 40) = v53;
  v54 = *(_QWORD *)(v3 - 208);
  *(_QWORD *)(v48 + 48) = *(_QWORD *)(v3 - 200);
  *(_QWORD *)(v48 + 56) = v54;
  *(_QWORD *)(v3 - 176) = v52;
  v55 = v7;
  *(_QWORD *)(v3 - 336) = v7;
  v56 = *(_QWORD *)(v3 - 296);
  *(_QWORD *)(v48 + 64) = v52;
  *(_QWORD *)(v48 + 72) = v56;
  *(_OWORD *)(v48 + 80) = 0u;
  *(_OWORD *)(v48 + 96) = 0u;
  *(_BYTE *)(v48 + 112) = *(_DWORD *)(v3 - 308);
  v57 = sub_100006A30(&qword_100020EA0);
  sub_10000C6E4(v45, v48 + *(int *)(v57 + 48), &qword_100020D88);
  v58 = v48 + *(int *)(v57 + 64);
  *(_QWORD *)v58 = 0;
  *(_BYTE *)(v58 + 8) = 1;
  sub_10000E400(v55, v50, v49);
  sub_10000C728(*(_QWORD *)(v3 - 216), &qword_100020D88);
  sub_10000C728(v45, &qword_100020D88);
  return sub_10000E438(*(_QWORD *)(v3 - 336), v50, *(_QWORD *)(v3 - 224));
}

void sub_10000E2C8()
{
  static Color.yellow.getter();
  JUMPOUT(0x10000DE44);
}

void sub_10000E2E8()
{
  static Color.red.getter();
  JUMPOUT(0x10000DE44);
}

void sub_10000E30C()
{
  static Color.red.getter();
  JUMPOUT(0x10000DE4CLL);
}

void sub_10000E330(uint64_t a1@<X8>)
{
  uint64_t v1;
  unsigned __int8 v3;
  uint64_t v4;

  v3 = sub_100014CE4(*(_QWORD *)v1, *(void **)(v1 + 8));
  *(_QWORD *)a1 = static VerticalAlignment.firstTextBaseline.getter();
  *(_QWORD *)(a1 + 8) = 0x4000000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  v4 = sub_100006A30(&qword_100020E90);
  sub_10000DC90(v3, a1 + *(int *)(v4 + 44));
}

uint64_t sub_10000E3B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006A30(&qword_100020D88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E400(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    swift_retain(result);
    swift_retain(a2);
    return swift_retain(a3);
  }
  return result;
}

uint64_t sub_10000E438(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    swift_release(result);
    swift_release(a2);
    return swift_release(a3);
  }
  return result;
}

unint64_t sub_10000E474()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100020EA8;
  if (!qword_100020EA8)
  {
    v1 = sub_1000067D4(&qword_100020EB0);
    result = swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100020EA8);
  }
  return result;
}

uint64_t destroy for JobsListView(_QWORD *a1)
{
  swift_release(*a1);
  swift_release(a1[1]);
  swift_bridgeObjectRelease(a1[2]);
  return swift_release(a1[4]);
}

uint64_t *initializeWithCopy for JobsListView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v6 = a2[2];
  v5 = a2[3];
  a1[2] = v6;
  a1[3] = v5;
  v7 = a2[4];
  a1[4] = v7;
  swift_retain(v3);
  swift_retain(v4);
  swift_bridgeObjectRetain(v6);
  swift_retain(v7);
  return a1;
}

uint64_t *assignWithCopy for JobsListView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  v8 = a2[2];
  v9 = a1[2];
  a1[2] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[3] = a2[3];
  v10 = a2[4];
  v11 = a1[4];
  a1[4] = v10;
  swift_retain(v10);
  swift_release(v11);
  return a1;
}

__n128 initializeWithTake for JobsListView(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_QWORD *assignWithTake for JobsListView(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release(v4);
  v5 = a1[2];
  a1[2] = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = a1[4];
  a1[3] = *(_QWORD *)(a2 + 24);
  a1[4] = v6;
  swift_release(v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for JobsListView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for JobsListView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for JobsListView()
{
  return &type metadata for JobsListView;
}

uint64_t sub_10000E6F8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100019D10, 1);
}

uint64_t sub_10000E708@<X0>(uint64_t a1@<X8>)
{
  Swift::String *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  id v33;
  Swift::String v34;
  Swift::String v35;
  Swift::String v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  Swift::String v49;
  uint64_t countAndFlagsBits;
  uint64_t v51;
  Swift::String v52;

  v2 = (uint64_t)v1;
  v48 = a1;
  v3 = type metadata accessor for NavigationBarItem.TitleDisplayMode(0);
  v46 = *(_QWORD *)(v3 - 8);
  v47 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006A30(&qword_100020EB8);
  __chkstk_darwin(v6);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_100006A30(&qword_100020EC0);
  __chkstk_darwin(v43);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100006A30(&qword_100020EC8);
  v44 = *(_QWORD *)(v11 - 8);
  v45 = v11;
  __chkstk_darwin(v11);
  v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1000086B8();
  v49 = *v1;
  countAndFlagsBits = v1[1]._countAndFlagsBits;
  v15 = sub_100006A30(&qword_100020ED0);
  Binding.wrappedValue.getter(&v51);
  v16 = v51;
  swift_bridgeObjectRetain(v14);
  sub_100010284(v16, v14);
  v18 = v17;
  swift_bridgeObjectRelease(v14);
  v49 = *(Swift::String *)v2;
  countAndFlagsBits = *(_QWORD *)(v2 + 16);
  v51 = v18;
  Binding.wrappedValue.setter(&v51, v15);
  v19 = sub_1000105EC(v14);
  v21 = v20;
  sub_1000106FC(v19, v20);
  v23 = v22;
  v25 = v24;
  *(_QWORD *)v8 = static HorizontalAlignment.center.getter();
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 0;
  v26 = sub_100006A30(&qword_100020ED8);
  sub_10000EAA4(v14, v23, v25, v19, v21, v2, &v8[*(int *)(v26 + 44)]);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v25);
  v27 = swift_bridgeObjectRelease(v14);
  v28 = static Edge.Set.leading.getter(v27);
  v29 = Edge.Set.init(rawValue:)(0);
  v30 = v29;
  v31 = Edge.Set.init(rawValue:)(v29);
  if (Edge.Set.init(rawValue:)(v31 & v28) != v28)
    LOBYTE(v30) = Edge.Set.init(rawValue:)(v30 | v28);
  sub_100010798((uint64_t)v8, (uint64_t)v10);
  v32 = v43;
  v10[*(int *)(v43 + 36)] = v30;
  sub_10000C728((uint64_t)v8, &qword_100020EB8);
  v33 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v52._object = (void *)0xEB00000000726564;
  v34._countAndFlagsBits = 0x724F20746E697250;
  v34._object = (void *)0xEB00000000726564;
  v35._countAndFlagsBits = 0;
  v35._object = (void *)0xE000000000000000;
  v52._countAndFlagsBits = 0x724F20746E697250;
  v36 = NSLocalizedString(_:tableName:bundle:value:comment:)(v34, (Swift::String_optional)0, (NSBundle)v33, v35, v52);

  v49 = v36;
  v38 = v46;
  v37 = v47;
  (*(void (**)(char *, _QWORD, uint64_t))(v46 + 104))(v5, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v47);
  v39 = sub_1000107E0();
  v40 = sub_10000AA80();
  View.navigationBarTitle<A>(_:displayMode:)(&v49, v5, v32, &type metadata for String, v39, v40);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v37);
  swift_bridgeObjectRelease(v49._object);
  sub_10000C728((uint64_t)v10, &qword_100020EC0);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v44 + 32))(v48, v13, v45);
}

uint64_t sub_10000EAA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _BYTE *a7@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  unint64_t v43;
  _BYTE *v44;
  uint64_t v45;
  _BYTE *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE *v51;
  uint64_t v52;
  void (*v53)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v54;
  _BYTE *v55;
  uint64_t v56;
  _BYTE *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(_BYTE *, uint64_t);
  void (*v70)(_BYTE *, uint64_t);
  uint64_t v71;
  uint64_t v73;
  _BYTE v74[12];
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _BYTE *v80;
  uint64_t v81;
  _BYTE *v82;
  uint64_t v83;
  uint64_t v84;
  _BYTE *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _BYTE *v89;
  void (*v90)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v91;
  uint64_t v92;
  _BYTE *v93;
  _BYTE *v94;
  uint64_t v95;
  _BYTE *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _OWORD v105[2];
  __int128 v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unsigned __int8 v114;

  v81 = a6;
  v87 = type metadata accessor for PlainListStyle(0);
  v86 = *(_QWORD *)(v87 - 8);
  __chkstk_darwin(v87);
  v85 = &v74[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v84 = sub_100006A30(&qword_100020EF0);
  v83 = *(_QWORD *)(v84 - 8);
  __chkstk_darwin(v84);
  v82 = &v74[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = sub_100006A30(&qword_100020EF8);
  v97 = *(_QWORD *)(v15 - 8);
  v16 = __chkstk_darwin(v15);
  v18 = &v74[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v16);
  v96 = &v74[-v19];
  v98 = type metadata accessor for Divider(0);
  v95 = *(_QWORD *)(v98 - 8);
  v20 = __chkstk_darwin(v98);
  v22 = &v74[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v23 = __chkstk_darwin(v20);
  v25 = &v74[-v24];
  v26 = Divider.init()(v23);
  v90 = (void (*)(_BYTE *, _BYTE *, uint64_t))a1;
  if ((unint64_t)a1 >> 62)
  {
    v73 = a1;
    if (a1 >= 0)
      a1 &= 0xFFFFFFFFFFFFFF8uLL;
    swift_bridgeObjectRetain(v73);
    v27 = _CocoaArrayWrapper.endIndex.getter(a1);
    v26 = swift_bridgeObjectRelease(v90);
  }
  else
  {
    v27 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v89 = a7;
  v88 = v15;
  v94 = v25;
  if (v27)
  {
    v28 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0)
      v28 = a2 & 0xFFFFFFFFFFFFLL;
    if (!v28)
    {
      v40 = 0;
      v78 = 0;
      v92 = 0;
      v101 = 0;
      v100 = 0;
      v99 = 0;
      v91 = 0;
      v77 = 0;
      v76 = 0;
      v41 = 255;
      goto LABEL_11;
    }
    swift_bridgeObjectRetain(a5);
    v29 = swift_bridgeObjectRetain(a3);
    v30 = static Animation.easeInOut(duration:)(v29, 0.25);
    swift_bridgeObjectRetain_n(a3, 3);
    swift_bridgeObjectRetain(a5);
    swift_retain(v30);
    v102 = xmmword_100019730;
    *(_QWORD *)&v103 = a4;
    *((_QWORD *)&v103 + 1) = a5;
    *(_QWORD *)&v104 = a2;
    *((_QWORD *)&v104 + 1) = a3;
    *(_QWORD *)&v105[0] = v30;
    *((_QWORD *)&v105[0] + 1) = a2;
    *(_QWORD *)&v105[1] = a3;
    BYTE8(v105[1]) = 1;
    v31 = sub_100006A30(&qword_100020F00);
    v32 = v18;
    v33 = sub_100010864();
    v34 = sub_1000091DC(&qword_100020F10, &qword_100020F00, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v35 = v33;
    v18 = v32;
    _ConditionalContent<>.init(storage:)(&v102, &type metadata for NoJobsView, v31, v35, v34);
    swift_release(v30);
    swift_bridgeObjectRelease_n(a3, 2);
    v26 = swift_bridgeObjectRelease(a5);
  }
  else
  {
    *(_QWORD *)&v102 = 0;
    v36 = sub_100006A30(&qword_100020F60);
    State.init(wrappedValue:)(&v106, &v102, v36);
    v102 = v106;
    v103 = 0u;
    v104 = 0u;
    memset(v105, 0, 25);
    v37 = sub_100006A30(&qword_100020F00);
    v38 = sub_100010864();
    v39 = sub_1000091DC(&qword_100020F10, &qword_100020F00, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v26 = _ConditionalContent<>.init(storage:)(&v102, &type metadata for NoJobsView, v37, v38, v39);
  }
  v78 = *((_QWORD *)&v106 + 1);
  v40 = v106;
  v92 = v107;
  v101 = v108;
  v100 = v109;
  v99 = v110;
  v91 = v111;
  v77 = v112;
  v76 = v113;
  v41 = v114;
LABEL_11:
  v75 = v41;
  __chkstk_darwin(v26);
  v42 = sub_100006A30(&qword_100020F18);
  v43 = sub_1000108B0();
  v44 = v82;
  v45 = List<>.init(content:)(sub_1000108A8, &v74[-32], v42, v43);
  v46 = v85;
  PlainListStyle.init()(v45);
  v47 = sub_1000091DC(&qword_100020F50, &qword_100020EF0, (uint64_t)&protocol conformance descriptor for List<A, B>);
  v48 = v84;
  v49 = v87;
  View.listStyle<A>(_:)(v46, v84, v87, v47, &protocol witness table for PlainListStyle);
  (*(void (**)(_BYTE *, uint64_t))(v86 + 8))(v46, v49);
  (*(void (**)(_BYTE *, uint64_t))(v83 + 8))(v44, v48);
  v50 = v97;
  v51 = v96;
  v52 = v88;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v97 + 32))(v96, v18, v88);
  v53 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v95 + 16);
  v80 = v22;
  v93 = v18;
  v54 = v98;
  v53(v22, v94, v98);
  v90 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v50 + 16);
  v90(v18, v51, v52);
  v55 = v89;
  v53(v89, v22, v54);
  v56 = sub_100006A30(&qword_100020F58);
  v57 = &v55[*(int *)(v56 + 48)];
  v58 = v40;
  v79 = v40;
  v59 = v78;
  *(_QWORD *)v57 = v40;
  *((_QWORD *)v57 + 1) = v59;
  v60 = v101;
  *((_QWORD *)v57 + 2) = v92;
  *((_QWORD *)v57 + 3) = v60;
  v101 = v60;
  v61 = v100;
  v62 = v99;
  *((_QWORD *)v57 + 4) = v100;
  *((_QWORD *)v57 + 5) = v62;
  v99 = v62;
  v63 = v77;
  *((_QWORD *)v57 + 6) = v91;
  *((_QWORD *)v57 + 7) = v63;
  v64 = v76;
  *((_QWORD *)v57 + 8) = v76;
  LOBYTE(v50) = v75;
  v57[72] = v75;
  v90(&v55[*(int *)(v56 + 64)], v93, v52);
  v65 = v58;
  v66 = v92;
  v67 = v62;
  v68 = v91;
  sub_1000109DC(v65, v59, v92, v60, v61, v67, v91, v63, v64, v50);
  v69 = *(void (**)(_BYTE *, uint64_t))(v97 + 8);
  v69(v96, v52);
  v70 = *(void (**)(_BYTE *, uint64_t))(v95 + 8);
  v71 = v98;
  v70(v94, v98);
  v69(v93, v52);
  sub_100010A70(v79, v59, v66, v101, v100, v99, v68, v63, v64, v50);
  return ((uint64_t (*)(_BYTE *, uint64_t))v70)(v80, v71);
}

uint64_t sub_10000F230@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t KeyPath;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (**v21)();
  uint64_t (*v22)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v6 = sub_100006A30(&qword_100020F30);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = a1;
  KeyPath = swift_getKeyPath(&unk_1000197B8);
  v11 = *a2;
  v12 = a2[1];
  v27 = a2[2];
  v28 = v11;
  v26 = *(_OWORD *)(a2 + 3);
  v13 = swift_allocObject(&unk_10001D778, 56, 7);
  v14 = *((_OWORD *)a2 + 1);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v13 + 32) = v14;
  *(_QWORD *)(v13 + 48) = a2[4];
  swift_bridgeObjectRetain(a1);
  sub_100010B38(&v28);
  swift_retain(v12);
  sub_100010B60(&v27);
  sub_100010B88((uint64_t)&v26);
  v15 = sub_100006A30((uint64_t *)&unk_100020B08);
  v16 = sub_1000091DC(&qword_100020F68, (uint64_t *)&unk_100020B08, (uint64_t)&protocol conformance descriptor for [A]);
  v17 = sub_1000085EC(&qword_100020F70, (uint64_t (*)(uint64_t))sub_100010BB0, (uint64_t)&protocol conformance descriptor for NSObject);
  v18 = sub_100010998();
  ForEach<>.init(_:id:content:)(&v25, KeyPath, sub_100010B30, v13, v15, &type metadata for JobCellView, v16, v17, v18);
  v19 = swift_allocObject(&unk_10001D7A0, 24, 7);
  *(_QWORD *)(v19 + 16) = a1;
  v20 = swift_allocObject(&unk_10001D7C8, 32, 7);
  *(_QWORD *)(v20 + 16) = sub_100010C10;
  *(_QWORD *)(v20 + 24) = v19;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(a3, v9, v6);
  v21 = (uint64_t (**)())(a3 + *(int *)(sub_100006A30(&qword_100020F18) + 36));
  *v21 = sub_100010C3C;
  v21[1] = (uint64_t (*)())v20;
  v22 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  swift_bridgeObjectRetain(a1);
  return v22(v9, v6);
}

uint64_t sub_10000F448@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  v4 = sub_100010BB0();
  v5 = sub_1000085EC((unint64_t *)&qword_100020C68, (uint64_t (*)(uint64_t))sub_100010BB0, (uint64_t)&protocol conformance descriptor for PCPrintJob);
  result = ObservedObject.init(wrappedValue:)(v3, v4, v5);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 16) = 1;
  return result;
}

uint64_t sub_10000F4B8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain(a2);
  sub_10000FA34(a1, a2);
  return swift_bridgeObjectRelease(a2);
}

uint64_t sub_10000F504@<X0>(uint64_t a1@<X8>)
{
  return sub_10000E708(a1);
}

Swift::Int sub_10000F53C(uint64_t a1)
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
  sub_100006A30(&qword_100020F98);
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

Swift::Int sub_10000F7D8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  Swift::Int result;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  Swift::Int v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  Swift::Int v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  unint64_t *v29;

  v4 = a4;
  if (!a3)
  {
    v9 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release(v4);
    return (Swift::Int)v9;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  sub_100006A30(&qword_100020F98);
  result = static _SetStorage.allocate(capacity:)(v5);
  v9 = (_QWORD *)result;
  v29 = a1;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_39;
    if (v15 >= a2)
      goto LABEL_36;
    v16 = v29[v15];
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= a2)
        goto LABEL_36;
      v16 = v29[v11];
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= a2)
          goto LABEL_36;
        v16 = v29[v11];
        if (!v16)
          break;
      }
    }
LABEL_23:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    v18 = v9[5];
    v19 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    result = NSObject._rawHashValue(seed:)(v18);
    v20 = -1 << *((_BYTE *)v9 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v12 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v12 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v12 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v12 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(_QWORD *)(v9[6] + 8 * v23) = v19;
    ++v9[2];
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v17 = v15 + 3;
  if (v17 >= a2)
    goto LABEL_36;
  v16 = v29[v17];
  if (v16)
  {
    v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= a2)
      goto LABEL_36;
    v16 = v29[v11];
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_10000FA34(uint64_t a1, uint64_t a2)
{
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
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void (*v22)(char *, uint64_t);
  void (*v23)(_BYTE *, _QWORD);
  unint64_t *v24;
  unint64_t v25;
  char *v26;
  uint64_t result;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  char *v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  char *v40;
  _BYTE v41[32];
  uint64_t v42;

  v42 = a1;
  v3 = type metadata accessor for IndexSet.Index(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v40 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v39 = (char *)&v30 - v7;
  v8 = type metadata accessor for IndexSet(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100006A30(&qword_100020F78);
  __chkstk_darwin(v12);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = v9;
  v35 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v35(v11, v42, v8);
  v15 = sub_1000085EC(&qword_100020F80, (uint64_t (*)(uint64_t))&type metadata accessor for IndexSet, (uint64_t)&protocol conformance descriptor for IndexSet);
  v36 = v11;
  dispatch thunk of Sequence.makeIterator()(v8, v15);
  v16 = &v14[*(int *)(v12 + 36)];
  v42 = v4;
  v38 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v33 = a2 & 0xFFFFFFFFFFFFFF8;
  v34 = a2 & 0xC000000000000001;
  v31 = a2;
  v32 = a2 + 32;
  v18 = v39;
  v17 = v40;
  while (1)
  {
    v38(v18, v16, v3);
    v19 = sub_1000085EC(&qword_100020F88, (uint64_t (*)(uint64_t))&type metadata accessor for IndexSet, (uint64_t)&protocol conformance descriptor for IndexSet);
    dispatch thunk of Collection.endIndex.getter(v8, v19);
    v20 = sub_1000085EC(&qword_100020F90, (uint64_t (*)(uint64_t))&type metadata accessor for IndexSet.Index, (uint64_t)&protocol conformance descriptor for IndexSet.Index);
    v21 = dispatch thunk of static Equatable.== infix(_:_:)(v18, v17, v3, v20);
    v22 = *(void (**)(char *, uint64_t))(v42 + 8);
    v22(v17, v3);
    v22(v18, v3);
    if ((v21 & 1) != 0)
      return sub_10000C728((uint64_t)v14, &qword_100020F78);
    v23 = (void (*)(_BYTE *, _QWORD))dispatch thunk of Collection.subscript.read(v41, v16, v8, v19);
    v25 = *v24;
    v23(v41, 0);
    v26 = v36;
    v35(v36, (uint64_t)v14, v8);
    dispatch thunk of Collection.formIndex(after:)(v16, v8, v19);
    result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v26, v8);
    if (v34)
    {
      v28 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v25, v31);
      goto LABEL_7;
    }
    if ((v25 & 0x8000000000000000) != 0)
      break;
    if (v25 >= *(_QWORD *)(v33 + 16))
      goto LABEL_11;
    v28 = *(id *)(v32 + 8 * v25);
LABEL_7:
    v29 = v28;
    objc_msgSend(v28, "cancel");

  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void sub_10000FD44(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  int64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  char v31;
  id v32;
  uint64_t v33;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  int64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;

  v5 = a3;
  v37 = 0;
  v6 = 0;
  v39 = a3 + 56;
  v7 = 1 << *(_BYTE *)(a3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a3 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = a4 & 0xFFFFFFFFFFFFFF8;
  v42 = a4 & 0xFFFFFFFFFFFFFF8;
  if (a4 < 0)
    v11 = a4;
  v33 = v11;
  v40 = v10;
  v41 = a4 & 0xC000000000000001;
LABEL_7:
  while (v9)
  {
    v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    v13 = v12 | (v6 << 6);
LABEL_20:
    v17 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v13);
    if ((unint64_t)a4 >> 62)
    {
      v32 = v17;
      swift_bridgeObjectRetain(a4);
      v18 = _CocoaArrayWrapper.endIndex.getter(v33);
      if (v18)
        goto LABEL_22;
LABEL_6:

      swift_bridgeObjectRelease(a4);
    }
    else
    {
      v18 = *(_QWORD *)(v42 + 16);
      v19 = v17;
      swift_bridgeObjectRetain(a4);
      if (!v18)
        goto LABEL_6;
LABEL_22:
      v43 = v9;
      if (v41)
        v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a4);
      else
        v20 = *(id *)(a4 + 32);
      v21 = v20;
      sub_100010BB0();
      v22 = static NSObject.== infix(_:_:)(v21, v17);

      if ((v22 & 1) != 0)
      {

        swift_bridgeObjectRelease(a4);
        v9 = v43;
LABEL_39:
        *(unint64_t *)((char *)a1 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
        v14 = __OFADD__(v37++, 1);
        if (v14)
          goto LABEL_54;
      }
      else
      {
        if (v18 != 1)
        {
          v38 = v13;
          if (v41)
          {
            v23 = 1;
            while (1)
            {
              v24 = specialized _ArrayBuffer._getElementSlowPath(_:)(v23, a4);
              v25 = v23 + 1;
              if (__OFADD__(v23, 1))
                break;
              v26 = v24;
              v27 = static NSObject.== infix(_:_:)(v24, v17);
              swift_unknownObjectRelease(v26);
              if ((v27 & 1) != 0)
                goto LABEL_38;
              ++v23;
              if (v25 == v18)
                goto LABEL_37;
            }
            __break(1u);
          }
          else
          {
            v28 = 5;
            while (1)
            {
              v29 = v28 - 3;
              if (__OFADD__(v28 - 4, 1))
                break;
              v30 = *(id *)(a4 + 8 * v28);
              v31 = static NSObject.== infix(_:_:)(v30, v17);

              if ((v31 & 1) != 0)
              {
LABEL_38:

                swift_bridgeObjectRelease(a4);
                v5 = a3;
                v9 = v43;
                v13 = v38;
                goto LABEL_39;
              }
              ++v28;
              if (v29 == v18)
              {
LABEL_37:

                swift_bridgeObjectRelease(a4);
                v5 = a3;
                v9 = v43;
                goto LABEL_7;
              }
            }
          }
          __break(1u);
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
          goto LABEL_55;
        }

        swift_bridgeObjectRelease(a4);
        v9 = v43;
      }
    }
  }
  v14 = __OFADD__(v6++, 1);
  if (v14)
    goto LABEL_53;
  if (v6 >= v40)
  {
LABEL_50:
    swift_retain(v5);
    sub_10000F7D8(a1, a2, v37, v5);
    return;
  }
  v15 = *(_QWORD *)(v39 + 8 * v6);
  if (v15)
  {
LABEL_19:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v6 << 6);
    goto LABEL_20;
  }
  v16 = v6 + 1;
  if (v6 + 1 >= v40)
    goto LABEL_50;
  v15 = *(_QWORD *)(v39 + 8 * v16);
  if (v15)
    goto LABEL_18;
  v16 = v6 + 2;
  if (v6 + 2 >= v40)
    goto LABEL_50;
  v15 = *(_QWORD *)(v39 + 8 * v16);
  if (v15)
    goto LABEL_18;
  v16 = v6 + 3;
  if (v6 + 3 >= v40)
    goto LABEL_50;
  v15 = *(_QWORD *)(v39 + 8 * v16);
  if (v15)
  {
LABEL_18:
    v6 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    v6 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v6 >= v40)
      goto LABEL_50;
    v15 = *(_QWORD *)(v39 + 8 * v6);
    ++v16;
    if (v15)
      goto LABEL_19;
  }
LABEL_55:
  __break(1u);
}

uint64_t sub_1000100C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v5;
  unsigned int v6;
  unint64_t v7;
  size_t v8;
  uint64_t isStackAllocationSafe;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;

  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v7 = (unint64_t)((1 << v5) + 63) >> 6;
  v8 = 8 * v7;
  isStackAllocationSafe = swift_bridgeObjectRetain_n(a2, 2);
  if (v6 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(v8, 8), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v16 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain(a2);
    sub_10000FD44((unint64_t *)((char *)&v16 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0)), v7, a1, a2);
    v11 = v10;
    swift_release(a1);
    v12 = swift_bridgeObjectRelease(a2);
    if (v2)
      swift_willThrow(v12);
    swift_bridgeObjectRelease_n(a2, 2);
  }
  else
  {
    v13 = (void *)swift_slowAlloc(v8, -1);
    bzero(v13, v8);
    swift_bridgeObjectRetain(a2);
    sub_10000FD44((unint64_t *)v13, v7, a1, a2);
    v11 = v14;
    swift_release(a1);
    swift_bridgeObjectRelease(a2);
    swift_slowDealloc(v13, -1, -1);
    swift_bridgeObjectRelease_n(a2, 2);
  }
  return v11;
}

void sub_100010284(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  id v34;
  _QWORD *v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  id v40;
  _QWORD *v41;

  if ((a1 & 0xC000000000000001) == 0)
  {
    sub_1000100C0(a1, a2);
    return;
  }
  v41 = &_swiftEmptySetSingleton;
  if (a1 < 0)
    v3 = a1;
  else
    v3 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a2);
  v4 = __CocoaSet.makeIterator()(v3);
  v5 = __CocoaSet.Iterator.next()();
  if (!v5)
  {
LABEL_49:
    swift_bridgeObjectRelease(a2);
    swift_release(v4);
    return;
  }
  v6 = v5;
  v7 = sub_100010BB0();
  v8 = a2 & 0xFFFFFFFFFFFFFF8;
  if (a2 < 0)
    v9 = a2;
  else
    v9 = a2 & 0xFFFFFFFFFFFFFF8;
  v37 = v9;
  v38 = a2 & 0xC000000000000001;
  while (1)
  {
    v39 = v6;
    swift_dynamicCast(&v40, &v39, (char *)&type metadata for Swift.AnyObject + 8, v7, 7);
    v16 = v40;
    if ((unint64_t)a2 >> 62)
    {
      swift_bridgeObjectRetain(a2);
      v17 = _CocoaArrayWrapper.endIndex.getter(v37);
      if (!v17)
        goto LABEL_21;
    }
    else
    {
      v17 = *(_QWORD *)(v8 + 16);
      swift_bridgeObjectRetain(a2);
      if (!v17)
        goto LABEL_21;
    }
    if (v38)
      v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a2);
    else
      v18 = *(id *)(a2 + 32);
    v19 = v18;
    v20 = static NSObject.== infix(_:_:)(v18, v16);

    if ((v20 & 1) != 0)
    {
      swift_bridgeObjectRelease(a2);
LABEL_43:
      v34 = v40;
      v35 = v41;
      v36 = v41[2];
      if (v41[3] <= v36)
      {
        sub_10000F53C(v36 + 1);
        v35 = v41;
      }
      v10 = NSObject._rawHashValue(seed:)(v35[5]);
      v11 = v35 + 7;
      v12 = -1 << *((_BYTE *)v35 + 32);
      v13 = v10 & ~v12;
      v14 = v13 >> 6;
      if (((-1 << v13) & ~v35[(v13 >> 6) + 7]) != 0)
      {
        v15 = __clz(__rbit64((-1 << v13) & ~v35[(v13 >> 6) + 7])) | v13 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v12) >> 6;
        do
        {
          if (++v14 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_50;
          }
          v28 = v14 == v27;
          if (v14 == v27)
            v14 = 0;
          v26 |= v28;
          v29 = v11[v14];
        }
        while (v29 == -1);
        v15 = __clz(__rbit64(~v29)) + (v14 << 6);
      }
      *(_QWORD *)((char *)v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(v35[6] + 8 * v15) = v34;
      ++v35[2];
      goto LABEL_13;
    }
    if (v17 != 1)
      break;
LABEL_21:
    swift_bridgeObjectRelease(a2);
LABEL_22:

LABEL_13:
    v6 = __CocoaSet.Iterator.next()();
    if (!v6)
      goto LABEL_49;
  }
  if (v38)
  {
    v21 = 1;
    while (1)
    {
      v22 = specialized _ArrayBuffer._getElementSlowPath(_:)(v21, a2);
      v23 = v21 + 1;
      if (__OFADD__(v21, 1))
        break;
      v24 = v22;
      v25 = static NSObject.== infix(_:_:)(v22, v16);
      swift_unknownObjectRelease(v24);
      if ((v25 & 1) != 0)
        goto LABEL_42;
      ++v21;
      if (v23 == v17)
        goto LABEL_41;
    }
LABEL_50:
    __break(1u);
  }
  else
  {
    v30 = 5;
    while (1)
    {
      v31 = v30 - 3;
      if (__OFADD__(v30 - 4, 1))
        break;
      v32 = *(id *)(a2 + 8 * v30);
      v33 = static NSObject.== infix(_:_:)(v32, v16);

      if ((v33 & 1) != 0)
      {
LABEL_42:
        swift_bridgeObjectRelease(a2);
        v8 = a2 & 0xFFFFFFFFFFFFFF8;
        goto LABEL_43;
      }
      ++v30;
      if (v31 == v17)
      {
LABEL_41:
        swift_bridgeObjectRelease(a2);
        v8 = a2 & 0xFFFFFFFFFFFFFF8;
        goto LABEL_22;
      }
    }
  }
  __break(1u);
}

uint64_t sub_1000105EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  if ((unint64_t)a1 >> 62)
    goto LABEL_14;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v2; v2 = _CocoaArrayWrapper.endIndex.getter(v9))
  {
    v3 = 4;
    while (1)
    {
      v4 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v3 - 4, a1)
         : *(id *)(a1 + 8 * v3);
      v5 = v4;
      v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1))
        break;
      if (objc_msgSend(v4, "state") == (id)5)
      {
        swift_bridgeObjectRelease(a1);
        v7 = sub_100012228();

        return v7;
      }

      ++v3;
      if (v6 == v2)
        goto LABEL_10;
    }
    __break(1u);
LABEL_14:
    if (a1 < 0)
      v9 = a1;
    else
      v9 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
  }
LABEL_10:
  swift_bridgeObjectRelease(a1);
  return 0;
}

void sub_1000106FC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  char v5;
  uint64_t v6;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2
    || a1 == 0x646573756170 && a2 == 0xE600000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, 0x646573756170, 0xE600000000000000, 0) & 1) != 0
    || (v5 = sub_100014CE4(a1, (void *)a2), sub_100014A2C(v5), !v6))
  {
    swift_bridgeObjectRelease(0);
  }
}

uint64_t sub_100010798(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006A30(&qword_100020EB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000107E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100020EE0;
  if (!qword_100020EE0)
  {
    v1 = sub_1000067D4(&qword_100020EC0);
    sub_1000091DC(&qword_100020EE8, &qword_100020EB8, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100020EE0);
  }
  return result;
}

unint64_t sub_100010864()
{
  unint64_t result;

  result = qword_100020F08;
  if (!qword_100020F08)
  {
    result = swift_getWitnessTable("\tA", &type metadata for NoJobsView);
    atomic_store(result, (unint64_t *)&qword_100020F08);
  }
  return result;
}

uint64_t sub_1000108A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000F230(*(_QWORD *)(v1 + 16), *(uint64_t **)(v1 + 24), a1);
}

unint64_t sub_1000108B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100020F20;
  if (!qword_100020F20)
  {
    v1 = sub_1000067D4(&qword_100020F18);
    sub_100010934();
    sub_1000091DC(&qword_100020F40, &qword_100020F48, (uint64_t)&protocol conformance descriptor for _TraitWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100020F20);
  }
  return result;
}

unint64_t sub_100010934()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100020F28;
  if (!qword_100020F28)
  {
    v1 = sub_1000067D4(&qword_100020F30);
    sub_100010998();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_100020F28);
  }
  return result;
}

unint64_t sub_100010998()
{
  unint64_t result;

  result = qword_100020F38;
  if (!qword_100020F38)
  {
    result = swift_getWitnessTable(&unk_10001939C, &type metadata for JobCellView);
    atomic_store(result, (unint64_t *)&qword_100020F38);
  }
  return result;
}

uint64_t sub_1000109DC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10)
{
  if (a10 != 255)
    return sub_100010A00(result, a2, a3, a4, a5, a6, a7, a8, a9, a10 & 1);
  return result;
}

uint64_t sub_100010A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  if ((a10 & 1) != 0)
  {
    swift_retain(a7);
    swift_bridgeObjectRetain(a9);
    swift_bridgeObjectRetain(a4);
    return swift_bridgeObjectRetain(a6);
  }
  else
  {
    swift_retain(a2);
    return swift_retain(a1);
  }
}

uint64_t sub_100010A70(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10)
{
  if (a10 != 255)
    return sub_100010A94(result, a2, a3, a4, a5, a6, a7, a8, a9, a10 & 1);
  return result;
}

uint64_t sub_100010A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t v12;

  if ((a10 & 1) != 0)
  {
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a6);
    swift_bridgeObjectRelease(a9);
    v12 = a7;
  }
  else
  {
    v12 = a2;
    swift_release(a1);
  }
  return swift_release(v12);
}

uint64_t sub_100010AF4()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[3]);
  swift_bridgeObjectRelease(v0[4]);
  swift_release(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100010B30@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000F448(a1, a2);
}

_QWORD *sub_100010B38(_QWORD *a1)
{
  swift_retain(*a1);
  return a1;
}

_QWORD *sub_100010B60(_QWORD *a1)
{
  swift_bridgeObjectRetain(*a1);
  return a1;
}

uint64_t sub_100010B88(uint64_t a1)
{
  swift_retain(*(_QWORD *)(a1 + 8));
  return a1;
}

unint64_t sub_100010BB0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100020C60;
  if (!qword_100020C60)
  {
    v1 = objc_opt_self(PCPrintJob);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100020C60);
  }
  return result;
}

uint64_t sub_100010BEC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100010C10(uint64_t a1)
{
  uint64_t v1;

  return sub_10000F4B8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_100010C18()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100010C3C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100010C5C()
{
  _QWORD v1[4];

  v1[0] = sub_1000067D4(&qword_100020EC0);
  v1[1] = &type metadata for String;
  v1[2] = sub_1000107E0();
  v1[3] = sub_10000AA80();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.navigationBarTitle<A>(_:displayMode:)>>, 1);
}

uint64_t PCPrinter.id.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(v0, "name");
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t sub_100010D10@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;

  v4 = sub_100010DAC();
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

void *sub_100010D4C()
{
  return &protocol witness table for String;
}

void sub_100010D58(uint64_t *a1@<X8>)
{
  id *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*v1, "name");
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

unint64_t sub_100010DAC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100020FA0;
  if (!qword_100020FA0)
  {
    v1 = objc_opt_self(PCPrinter);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100020FA0);
  }
  return result;
}

id PCPrintJob.id.getter()
{
  void *v0;

  return objc_msgSend(v0, "localJobID");
}

uint64_t sub_100010DF8(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t *v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4];
  v8 = a3[5];
  if (v7 == a1 && v8 == a2)
    return 1;
  result = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, a1, a2, 0);
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v11 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v13 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v14 = *(v11 - 1);
    v15 = *v11;
    v16 = v14 == a1 && v15 == a2;
    if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, a1, a2, 0) & 1) != 0)
      return 1;
    result = 0;
    v11 += 2;
    if (v13 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_100010EBC()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  id v6;
  Class isa;
  id v8;
  uint64_t v9;

  v1 = objc_msgSend(v0, "thumbnailImage");
  if (v1)
  {
    v2 = v1;
    v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v4;

    v6 = objc_allocWithZone((Class)UIImage);
    sub_1000149A4(v3, v5);
    isa = Data._bridgeToObjectiveC()().super.isa;
    v8 = objc_msgSend(v6, "initWithData:", isa);
    sub_1000149E8(v3, v5);

    if (v8)
    {
      v9 = Image.init(uiImage:)(v8);
      sub_1000149E8(v3, v5);
      return v9;
    }
    sub_1000149E8(v3, v5);
  }
  return Image.init(_:bundle:)(0xD000000000000010, 0x8000000100017E90, 0);
}

uint64_t sub_100010FB8()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[24];
  uint64_t v19;

  v1 = objc_msgSend(v0, "settings");
  v2 = objc_msgSend(v1, "objectForKey:", PKOutputModeKey);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(&v16, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  sub_1000148D4((uint64_t)&v16, (uint64_t)v18);
  if (!v19)
  {
    sub_10000C728((uint64_t)v18, &qword_100020FD0);
LABEL_10:
    v6 = objc_msgSend(v0, "settings");
    v7 = objc_msgSend(v6, "objectForKey:", CFSTR("ColorModel"));

    if (v7)
    {
      _bridgeAnyObjectToAny(_:)(&v16, v7);
      swift_unknownObjectRelease(v7);
    }
    else
    {
      v16 = 0u;
      v17 = 0u;
    }
    sub_1000148D4((uint64_t)&v16, (uint64_t)v18);
    if (v19)
    {
      if ((swift_dynamicCast(&v14, v18, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
      {
        v9 = v14;
        v8 = v15;
        v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("Gray"));
        v12 = v10;
        if (v9 == v11 && v8 == v10)
        {
          swift_bridgeObjectRelease_n(v8, 2);
          v5 = 1;
        }
        else
        {
          v5 = _stringCompareWithSmolCheck(_:_:expecting:)(v9, v8, v11, v10, 0);
          swift_bridgeObjectRelease(v8);
          swift_bridgeObjectRelease(v12);
        }
        return v5 & 1;
      }
    }
    else
    {
      sub_10000C728((uint64_t)v18, &qword_100020FD0);
    }
    v5 = 0;
    return v5 & 1;
  }
  if ((swift_dynamicCast(&v14, v18, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
    goto LABEL_10;
  v4 = v14;
  v3 = v15;
  if (qword_100020AA8 != -1)
    swift_once(&qword_100020AA8, sub_100013430);
  v5 = sub_100010DF8(v4, v3, (_QWORD *)qword_100020FA8);
  swift_bridgeObjectRelease(v3);
  return v5 & 1;
}

uint64_t sub_100011204()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v7;
  _OWORD v8[2];
  _BYTE v9[24];
  uint64_t v10;

  v1 = v0;
  if (qword_100020A80 != -1)
    swift_once(&qword_100020A80, sub_10000D0F0);
  v2 = *((_QWORD *)&xmmword_100021200 + 1);
  v3 = xmmword_100021200;
  swift_bridgeObjectRetain(*((_QWORD *)&xmmword_100021200 + 1));
  v4 = objc_msgSend(v1, "settings");
  v5 = objc_msgSend(v4, "objectForKey:", CFSTR("job-name"));

  if (v5)
  {
    _bridgeAnyObjectToAny(_:)(v8, v5);
    swift_unknownObjectRelease(v5);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_1000148D4((uint64_t)v8, (uint64_t)v9);
  if (v10)
  {
    if ((swift_dynamicCast(&v7, v9, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
    {
      swift_bridgeObjectRelease(v2);
      return v7;
    }
  }
  else
  {
    sub_10000C728((uint64_t)v9, &qword_100020FD0);
  }
  return v3;
}

double sub_100011338()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;
  double v6;

  v1 = 0.0;
  if ((uint64_t)objc_msgSend(v0, "mediaSheets") >= 1)
  {
    v2 = 1.0 / (double)(uint64_t)objc_msgSend(v0, "mediaSheets");
    v3 = (double)(uint64_t)objc_msgSend(v0, "mediaSheetsCompleted");
    v4 = v3 / (double)(uint64_t)objc_msgSend(v0, "mediaSheets");
    v5 = objc_msgSend(v0, "mediaProgress");
    v6 = v4 + v2 * (double)(uint64_t)v5 / 100.0;
    if (v6 >= 0.0)
    {
      if (v6 <= 1.0)
        return v4 + v2 * (double)(uint64_t)v5 / 100.0;
      else
        return 1.0;
    }
  }
  return v1;
}

uint64_t sub_1000113F8(char a1)
{
  void *v1;
  void *v2;
  id v4;
  void *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 *v12;
  id v13;
  void *v14;
  _QWORD *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  const char *v36;
  char v37;
  const char *v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  __int128 v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  Swift::String v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  Swift::String v60;
  char v62;
  Swift::String v63;
  Swift::String v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  id v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  __int128 v92;
  Swift::String v93;

  v2 = v1;
  v4 = objc_msgSend(v1, "jobStateReasons");
  if (v4)
  {
    v5 = v4;
    v6 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, &type metadata for String);

  }
  else
  {
    v6 = &_swiftEmptyArrayStorage;
  }
  v7 = objc_msgSend(v2, "jobStateMessage");
  if (v7)
  {
    v8 = v7;
    v9 = ((uint64_t (*)(void))static String._unconditionallyBridgeFromObjectiveC(_:))();
    v11 = v10;

  }
  else
  {
    v9 = 0;
    v11 = (void *)0xE000000000000000;
  }
  switch((unint64_t)objc_msgSend(v2, "state"))
  {
    case 3uLL:
      swift_bridgeObjectRelease(v11);
      swift_bridgeObjectRelease(v6);
      if (qword_100020A38 != -1)
        swift_once(&qword_100020A38, sub_10000CAF4);
      v12 = &xmmword_100021170;
      goto LABEL_63;
    case 4uLL:
      if ((sub_100010DF8(0x6F636E692D626F6ALL, 0xEC000000676E696DLL, v6) & 1) != 0)
      {
        swift_bridgeObjectRelease(v11);
        swift_bridgeObjectRelease(v6);
LABEL_16:
        if (qword_100020A88 != -1)
          goto LABEL_123;
LABEL_17:
        v12 = &xmmword_100021210;
LABEL_63:
        v41 = (void *)*((_QWORD *)v12 + 1);
        v93._countAndFlagsBits = *(_QWORD *)v12;
        v93._object = v41;
        swift_bridgeObjectRetain(v41);
        if ((a1 & 1) == 0)
          goto LABEL_75;
        goto LABEL_64;
      }
      if ((sub_100010DF8(0xD000000000000018, 0x8000000100017C70, v6) & 1) != 0)
      {
        swift_bridgeObjectRelease(v6);
        if ((_stringCompareWithSmolCheck(_:_:expecting:)(0, 0xE000000000000000, 0xD000000000000012, 0x8000000100017CB0, 0) & 1) != 0)
        {
          swift_bridgeObjectRelease(v11);
LABEL_54:
          if (qword_100020A90 != -1)
            swift_once(&qword_100020A90, sub_10000D224);
          v12 = &xmmword_100021220;
          goto LABEL_63;
        }
        v93._countAndFlagsBits = v9;
        v93._object = v11;
        *(_QWORD *)&v92 = 0x676E696D6F636E69;
        *((_QWORD *)&v92 + 1) = 0xE800000000000000;
        v39 = sub_10000AA80();
        v40 = StringProtocol.caseInsensitiveCompare<A>(_:)(&v92, &type metadata for String, &type metadata for String, v39, v39);
        swift_bridgeObjectRelease(v11);
        if (!v40)
          goto LABEL_16;
      }
      else
      {
        swift_bridgeObjectRelease(v11);
        v37 = sub_100010DF8(0xD00000000000001CLL, 0x8000000100017C90, v6);
        swift_bridgeObjectRelease(v6);
        if ((v37 & 1) != 0
          && (_stringCompareWithSmolCheck(_:_:expecting:)(0, 0xE000000000000000, 0xD000000000000012, 0x8000000100017CB0, 0) & 1) != 0)
        {
          goto LABEL_54;
        }
      }
      if (qword_100020A40 != -1)
        swift_once(&qword_100020A40, sub_10000CBA0);
      v12 = &xmmword_100021180;
      goto LABEL_63;
    case 5uLL:
      swift_bridgeObjectRelease(v11);
      swift_bridgeObjectRelease(v6);
      v13 = objc_msgSend(v2, "jobPrinterStateReasons");
      if (v13)
      {
        v14 = v13;
        v15 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v13, &type metadata for String);

      }
      else
      {
        v15 = &_swiftEmptyArrayStorage;
      }
      if ((sub_100010DF8(0xD000000000000013, 0x80000001000179A0, v15) & 1) != 0)
      {
        swift_bridgeObjectRelease(v15);
        v32 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
        v33 = 0xD00000000000001ELL;
        v91 = 0x8000000100017C50;
        v34 = 0x6E6F207964616552;
        v35 = 0xEF72657672657320;
        goto LABEL_94;
      }
      if ((sub_100010DF8(0xD000000000000018, 0x80000001000179C0, v15) & 1) != 0)
      {
        swift_bridgeObjectRelease(v15);
        v32 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
        v34 = 0xD000000000000010;
        v33 = 0xD00000000000001FLL;
        v91 = 0x8000000100017C30;
        v36 = "Paused on server";
LABEL_93:
        v35 = (unint64_t)(v36 - 32) | 0x8000000000000000;
LABEL_94:
        v63._countAndFlagsBits = 0;
        v63._object = (void *)0xE000000000000000;
        v64 = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v34, (Swift::String_optional)0, (NSBundle)v32, v63, *(Swift::String *)&v33);

        v93 = v64;
        if ((a1 & 1) == 0)
          goto LABEL_75;
        goto LABEL_64;
      }
      if ((sub_100010DF8(0xD000000000000016, 0x80000001000179E0, v15) & 1) != 0)
      {
        swift_bridgeObjectRelease(v15);
        v32 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
        v33 = 0xD000000000000021;
        v91 = 0x8000000100017BE0;
        v38 = "Printing on server";
LABEL_88:
        v35 = (unint64_t)(v38 - 32) | 0x8000000000000000;
        v34 = 0xD000000000000012;
        goto LABEL_94;
      }
      if ((sub_100010DF8(0xD000000000000013, 0x8000000100017A00, v15) & 1) != 0)
      {
        swift_bridgeObjectRelease(v15);
        v32 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
        v34 = 0xD000000000000011;
        v33 = 0xD000000000000020;
        v91 = 0x8000000100017B90;
        v36 = "Stopped on server";
        goto LABEL_93;
      }
      if ((sub_100010DF8(0xD000000000000014, 0x8000000100017A20, v15) & 1) != 0)
      {
        swift_bridgeObjectRelease(v15);
        v32 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
        v33 = 0xD000000000000021;
        v91 = 0x8000000100017B40;
        v38 = "Canceled on server";
        goto LABEL_88;
      }
      if ((sub_100010DF8(0xD000000000000013, 0x8000000100017A40, v15) & 1) != 0)
      {
        swift_bridgeObjectRelease(v15);
        v32 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
        v34 = 0xD000000000000011;
        v33 = 0xD000000000000020;
        v91 = 0x8000000100017AF0;
        v36 = "Aborted on server";
        goto LABEL_93;
      }
      v62 = sub_100010DF8(0xD000000000000015, 0x8000000100017A60, v15);
      swift_bridgeObjectRelease(v15);
      if ((v62 & 1) != 0)
      {
        v32 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
        v34 = 0xD000000000000013;
        v33 = 0xD000000000000022;
        v91 = 0x8000000100017AA0;
        v36 = "Completed on server";
        goto LABEL_93;
      }
      v65 = (uint64_t)objc_msgSend(v2, "mediaSheets");
      v66 = sub_100012784();
      if (!v66)
      {
        __break(1u);
        goto LABEL_125;
      }
      v67 = v66;
      if (v65 == 0x8000000000000000 && v66 == -1)
        goto LABEL_126;
      v68 = objc_msgSend(v2, "mediaSheetsCompleted");
      if (__OFADD__(v68, 1))
      {
LABEL_125:
        __break(1u);
LABEL_126:
        __break(1u);
        goto LABEL_127;
      }
      if ((uint64_t)v68 + 1 <= 1)
        v69 = 1;
      else
        v69 = (uint64_t)v68 + 1;
      if ((uint64_t)objc_msgSend(v2, "mediaSheets") >= 1)
      {
        v70 = objc_msgSend(v2, "mediaSheets");
        if ((uint64_t)v70 < v69)
          v69 = (uint64_t)v70;
      }
      if (v65 / v67 < v69)
      {
        if (qword_100020A48 == -1)
        {
LABEL_108:
          v12 = &xmmword_100021190;
          goto LABEL_63;
        }
LABEL_127:
        swift_once(&qword_100020A48, sub_10000CC48);
        goto LABEL_108;
      }
      if (qword_100020A30 != -1)
        swift_once(&qword_100020A30, sub_10000CA40);
      v71 = xmmword_100021160;
      v72 = sub_100006A30(&qword_100020FC0);
      v73 = swift_allocObject(v72, 112, 7);
      *(_OWORD *)(v73 + 16) = xmmword_100019880;
      v74 = objc_msgSend(v2, "mediaSheetsCompleted");
      if (__OFADD__(v74, 1))
      {
        __break(1u);
LABEL_129:
        __break(1u);
        goto LABEL_130;
      }
      if ((uint64_t)v74 + 1 <= 1)
        v75 = 1;
      else
        v75 = (uint64_t)v74 + 1;
      if ((uint64_t)objc_msgSend(v2, "mediaSheets") >= 1)
      {
        v76 = objc_msgSend(v2, "mediaSheets");
        if ((uint64_t)v76 < v75)
          v75 = (uint64_t)v76;
      }
      v77 = (void *)objc_opt_self(NSNumberFormatter);
      v78 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", v75);
      v79 = objc_msgSend(v77, "localizedStringFromNumber:numberStyle:", v78, 1);

      v80 = static String._unconditionallyBridgeFromObjectiveC(_:)(v79);
      v82 = v81;

      *(_QWORD *)(v73 + 56) = &type metadata for String;
      v83 = sub_100014890();
      *(_QWORD *)(v73 + 64) = v83;
      *(_QWORD *)(v73 + 32) = v80;
      *(_QWORD *)(v73 + 40) = v82;
      v84 = (uint64_t)objc_msgSend(v2, "mediaSheets");
      v85 = sub_100012784();
      if (!v85)
        goto LABEL_129;
      if (v84 == 0x8000000000000000 && v85 == -1)
      {
LABEL_130:
        __break(1u);
        JUMPOUT(0x100012208);
      }
      v86 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", v84 / v85);
      v87 = objc_msgSend(*((id *)&v71 + 1), "localizedStringFromNumber:numberStyle:", v86, 1);

      v88 = static String._unconditionallyBridgeFromObjectiveC(_:)(v87);
      v90 = v89;

      *(_QWORD *)(v73 + 96) = &type metadata for String;
      *(_QWORD *)(v73 + 104) = v83;
      *(_QWORD *)(v73 + 72) = v88;
      *(_QWORD *)(v73 + 80) = v90;
      v29 = *((_QWORD *)&v71 + 1);
      v28 = v71;
      v30 = v73;
LABEL_42:
      v93._countAndFlagsBits = String.init(format:_:)(v28, v29, v30);
      v93._object = v31;
      if ((a1 & 1) != 0)
      {
LABEL_64:
        v42 = objc_msgSend(v2, "printerDisplayName");
        if (v42)
        {
          v43 = v42;
          v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(v42);
          v46 = v45;

        }
        else
        {
          if (qword_100020A80 != -1)
            swift_once(&qword_100020A80, sub_10000D0F0);
          v46 = *((_QWORD *)&xmmword_100021200 + 1);
          v44 = xmmword_100021200;
          swift_bridgeObjectRetain(*((_QWORD *)&xmmword_100021200 + 1));
        }
        swift_bridgeObjectRelease(v46);
        v47 = HIBYTE(v46) & 0xF;
        if ((v46 & 0x2000000000000000) == 0)
          v47 = v44 & 0xFFFFFFFFFFFFLL;
        if (v47)
        {
          if (qword_100020A78 != -1)
            swift_once(&qword_100020A78, sub_10000D050);
          v48 = xmmword_1000211F0;
          v49 = sub_1000123EC();
          v51 = v50;
          swift_bridgeObjectRelease(v52);
          v92 = v48;
          swift_bridgeObjectRetain(*((_QWORD *)&v48 + 1));
          v53._countAndFlagsBits = (uint64_t)v49;
          v53._object = v51;
          String.append(_:)(v53);
          swift_bridgeObjectRelease(v51);
          v54 = (void *)*((_QWORD *)&v92 + 1);
          String.append(_:)((Swift::String)v92);
          swift_bridgeObjectRelease(v54);
        }
      }
LABEL_75:
      v55 = sub_100012894();
      if (v56)
      {
        v57 = v55;
        v58 = (void *)v56;
        v59 = HIBYTE(v56) & 0xF;
        if ((v56 & 0x2000000000000000) == 0)
          v59 = v55 & 0xFFFFFFFFFFFFLL;
        if (v59)
        {
          if (qword_100020A78 != -1)
            swift_once(&qword_100020A78, sub_10000D050);
          v92 = xmmword_1000211F0;
          swift_bridgeObjectRetain(*((_QWORD *)&xmmword_1000211F0 + 1));
          v60._countAndFlagsBits = v57;
          v60._object = v58;
          String.append(_:)(v60);
          swift_bridgeObjectRelease(v58);
          v58 = (void *)*((_QWORD *)&v92 + 1);
          String.append(_:)((Swift::String)v92);
        }
        swift_bridgeObjectRelease(v58);
      }
      return v93._countAndFlagsBits;
    case 6uLL:
      swift_bridgeObjectRelease(v11);
      swift_bridgeObjectRelease(v6);
      if (qword_100020A50 != -1)
        swift_once(&qword_100020A50, sub_10000CCF4);
      v12 = &xmmword_1000211A0;
      goto LABEL_63;
    case 7uLL:
      swift_bridgeObjectRelease(v11);
      swift_bridgeObjectRelease(v6);
      if (qword_100020A58 != -1)
        swift_once(&qword_100020A58, sub_10000CDA0);
      v12 = &xmmword_1000211B0;
      goto LABEL_63;
    case 8uLL:
      swift_bridgeObjectRelease(v11);
      swift_bridgeObjectRelease(v6);
      if (qword_100020A60 != -1)
        swift_once(&qword_100020A60, sub_10000CE4C);
      v12 = &xmmword_1000211C0;
      goto LABEL_63;
    case 9uLL:
      swift_bridgeObjectRelease(v11);
      swift_bridgeObjectRelease(v6);
      if (qword_100020A68 != -1)
        swift_once(&qword_100020A68, sub_10000CEF4);
      v12 = &xmmword_1000211D0;
      goto LABEL_63;
    case 0xAuLL:
      swift_bridgeObjectRelease(v11);
      swift_bridgeObjectRelease(v6);
      if (qword_100020A28 != -1)
        swift_once(&qword_100020A28, sub_10000C98C);
      v16 = xmmword_100021150;
      v17 = sub_100006A30(&qword_100020FC0);
      v18 = swift_allocObject(v17, 72, 7);
      *(_OWORD *)(v18 + 16) = xmmword_100019870;
      v19 = objc_msgSend(v2, "mediaSheetsCompleted");
      if (!__OFADD__(v19, 1))
      {
        if ((uint64_t)v19 + 1 <= 1)
          v20 = 1;
        else
          v20 = (uint64_t)v19 + 1;
        if ((uint64_t)objc_msgSend(v2, "mediaSheets") >= 1)
        {
          v21 = objc_msgSend(v2, "mediaSheets");
          if ((uint64_t)v21 < v20)
            v20 = (uint64_t)v21;
        }
        v22 = (void *)objc_opt_self(NSNumberFormatter);
        v23 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", v20);
        v24 = objc_msgSend(v22, "localizedStringFromNumber:numberStyle:", v23, 1);

        v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
        v27 = v26;

        *(_QWORD *)(v18 + 56) = &type metadata for String;
        *(_QWORD *)(v18 + 64) = sub_100014890();
        *(_QWORD *)(v18 + 32) = v25;
        *(_QWORD *)(v18 + 40) = v27;
        v29 = *((_QWORD *)&v16 + 1);
        v28 = v16;
        v30 = v18;
        goto LABEL_42;
      }
      __break(1u);
LABEL_123:
      swift_once(&qword_100020A88, sub_10000D188);
      goto LABEL_17;
    default:
      swift_bridgeObjectRelease(v11);
      swift_bridgeObjectRelease(v6);
      if (qword_100020A70 != -1)
        swift_once(&qword_100020A70, sub_10000CFA4);
      v12 = &xmmword_1000211E0;
      goto LABEL_63;
  }
}

uint64_t sub_100012228()
{
  char *v0;
  char *v1;
  uint64_t v2;
  char *v4;

  v0 = sub_100013384();
  v4 = v0;
  swift_bridgeObjectRetain(v0);
  sub_100013530(&v4);
  swift_bridgeObjectRelease(v0);
  v1 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    v2 = *((_QWORD *)v4 + 4);
    swift_bridgeObjectRetain(*((_QWORD *)v4 + 5));
  }
  else
  {
    v2 = 0;
  }
  swift_release(v1);
  return v2;
}

uint64_t sub_1000122B8()
{
  void *v0;
  id v1;
  void *v2;
  _QWORD *v3;
  char v5;

  v1 = objc_msgSend(v0, "jobStateReasons");
  if (v1)
  {
    v2 = v1;
    v3 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, &type metadata for String);

  }
  else
  {
    v3 = &_swiftEmptyArrayStorage;
  }
  if ((sub_100010DF8(0x2D746E756F636361, 0xEE006465736F6C63, v3) & 1) != 0)
  {
    swift_bridgeObjectRelease(v3);
    return 2;
  }
  else if ((sub_100010DF8(0xD000000000000013, 0x8000000100017E30, v3) & 1) != 0)
  {
    swift_bridgeObjectRelease(v3);
    return 1;
  }
  else if ((sub_100010DF8(0xD000000000000015, 0x8000000100017E50, v3) & 1) != 0)
  {
    swift_bridgeObjectRelease(v3);
    return 3;
  }
  else
  {
    v5 = sub_100010DF8(0xD00000000000001CLL, 0x8000000100017E70, v3);
    swift_bridgeObjectRelease(v3);
    if ((v5 & 1) != 0)
      return 4;
    else
      return 0;
  }
}

id sub_1000123EC()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  id result;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;

  v1 = v0;
  v2 = sub_100006A30(&qword_100020FE0);
  __chkstk_darwin(v2);
  v4 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(v0, "printerDisplayName");
  if (v5)
  {
    v6 = v5;
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;

    if (qword_100020A80 != -1)
      swift_once(&qword_100020A80, sub_10000D0F0);
  }
  else
  {
    if (qword_100020A80 != -1)
      swift_once(&qword_100020A80, sub_10000D0F0);
    v9 = *((_QWORD *)&xmmword_100021200 + 1);
    v7 = xmmword_100021200;
    swift_bridgeObjectRetain(*((_QWORD *)&xmmword_100021200 + 1));
  }
  if (objc_msgSend(v1, "printerKind") == (id)3)
    goto LABEL_15;
  v10 = objc_msgSend(v1, "printerLocation");
  if (!v10)
    goto LABEL_15;

  result = objc_msgSend(v1, "printerLocation");
  if (!result)
    goto LABEL_31;
  v12 = result;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = v14;

  swift_bridgeObjectRelease(v15);
  v16 = HIBYTE(v15) & 0xF;
  if ((v15 & 0x2000000000000000) == 0)
    v16 = v13 & 0xFFFFFFFFFFFFLL;
  if (v16 && (v17 = objc_msgSend(v1, "printerLocation")) != 0)
  {
    v18 = v17;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v20 = v19;

  }
  else
  {
LABEL_15:
    v20 = 0;
  }
  v48 = v7;
  v49 = v9;
  v46 = 2113568;
  v47 = 0xE300000000000000;
  v21 = type metadata accessor for Locale(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v4, 1, 1, v21);
  v22 = sub_10000AA80();
  v23 = StringProtocol.range<A>(of:options:range:locale:)(&v46, 0, 0, 0, 1, v4, &type metadata for String, &type metadata for String, v22, v22);
  v25 = v24;
  v27 = v26;
  sub_10000C728((uint64_t)v4, &qword_100020FE0);
  swift_bridgeObjectRelease(v47);
  if ((v27 & 1) != 0)
    return (id)v7;
  swift_bridgeObjectRetain(v9);
  v28 = String.subscript.getter(15, v23, v7, v9);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  swift_bridgeObjectRelease(v9);
  v35 = static String._fromSubstring(_:)(v28, v30, v32, v34);
  swift_bridgeObjectRelease(v34);
  if (v20)
  {
    v36 = v9;
LABEL_28:
    swift_bridgeObjectRelease(v36);
    return (id)v35;
  }
  result = objc_msgSend(v1, "printerKind");
  if (result == (id)3)
  {
    swift_bridgeObjectRelease(v9);
    return (id)v35;
  }
  v37 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0)
    v37 = v7 & 0xFFFFFFFFFFFFLL;
  if (4 * v37 >= v25 >> 14)
  {
    v38 = 7;
    if (((v9 >> 60) & ((v7 & 0x800000000000000) == 0)) != 0)
      v38 = 11;
    v39 = String.subscript.getter(v25, v38 | (v37 << 16), v7, v9);
    v41 = v40;
    v43 = v42;
    v45 = v44;
    swift_bridgeObjectRelease(v9);
    static String._fromSubstring(_:)(v39, v41, v43, v45);
    v36 = v45;
    goto LABEL_28;
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_100012784()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  id v7;
  _OWORD v8[2];
  _BYTE v9[24];
  uint64_t v10;

  v1 = objc_msgSend(v0, "settings");
  v2 = objc_msgSend(v1, "objectForKey:", PKCopiesKey);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v8, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_1000148D4((uint64_t)v8, (uint64_t)v9);
  if (!v10)
  {
    sub_10000C728((uint64_t)v9, &qword_100020FD0);
    return 1;
  }
  v3 = sub_10000853C(0, &qword_100020FD8, NSNumber_ptr);
  if ((swift_dynamicCast(&v7, v9, (char *)&type metadata for Any + 8, v3, 6) & 1) == 0)
    return 1;
  v4 = v7;
  v5 = objc_msgSend(v7, "integerValue");

  return (uint64_t)v5;
}

uint64_t sub_100012894()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  void *v16;
  _QWORD *v17;
  char v18;
  objc_class *v19;
  unint64_t v20;
  const char *v21;
  char *v22;
  unint64_t v23;
  const char *v24;
  unint64_t v25;
  NSBundle v26;
  uint64_t v27;
  unint64_t v28;
  Swift::String v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  id v57;
  NSURL *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  char *v79;
  void *v81;
  uint64_t v82;
  unint64_t v83;
  char v84;
  int v85;
  uint64_t v86;
  unint64_t v87;
  id v88;
  void *v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  unint64_t v93;
  char v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t countAndFlagsBits;
  char *v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;
  unint64_t v112;

  v1 = v0;
  v108 = type metadata accessor for URL.DirectoryHint(0);
  v106 = *(_QWORD *)(v108 - 8);
  __chkstk_darwin(v108);
  v107 = (char *)&v103 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100006A30(&qword_100020FE8);
  __chkstk_darwin(v3);
  v105 = (char *)&v103 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v103 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v103 - v10;
  v12 = sub_100006A30(&qword_100020FE0);
  __chkstk_darwin(v12);
  v14 = (char *)&v103 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(v0, "state") == (id)4)
  {
    v15 = objc_msgSend(v0, "jobStateReasons");
    if (v15)
    {
      v16 = v15;
      v17 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v15, &type metadata for String);

    }
    else
    {
      v17 = &_swiftEmptyArrayStorage;
    }
    v18 = sub_100010DF8(0x6F636E692D626F6ALL, 0xEC000000676E696DLL, v17);
    swift_bridgeObjectRelease(v17);
    if ((v18 & 1) != 0)
      return 0;
  }
  switch(sub_1000122B8())
  {
    case 1:
      v19 = (objc_class *)objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v20 = 0xD000000000000024;
      v102 = 0x8000000100017E10;
      v21 = "missing required account information";
      goto LABEL_13;
    case 2:
      v19 = (objc_class *)objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v23 = 0xD000000000000014;
      v20 = 0xD000000000000017;
      v102 = 0x8000000100017DC0;
      v24 = "account has been closed";
      goto LABEL_11;
    case 3:
      v19 = (objc_class *)objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v23 = 0xD000000000000015;
      v20 = 0xD00000000000001ELL;
      v102 = 0x8000000100017D80;
      v24 = "insufficient funds/quota limit";
LABEL_11:
      v25 = (unint64_t)(v24 - 32) | 0x8000000000000000;
      v26.super.isa = v19;
      v27 = 0;
      v28 = 0xE000000000000000;
      goto LABEL_14;
    case 4:
      v19 = (objc_class *)objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v20 = 0xD000000000000025;
      v102 = 0x8000000100017D40;
      v21 = "missing/expired/bad authorization URI";
LABEL_13:
      v25 = (unint64_t)(v21 - 32) | 0x8000000000000000;
      v26.super.isa = v19;
      v27 = 0;
      v28 = 0xE000000000000000;
      v23 = 0xD00000000000001ALL;
LABEL_14:
      v29 = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v20, (Swift::String_optional)0, v26, *(Swift::String *)&v27, *(Swift::String *)(&v102 - 1));
      countAndFlagsBits = v29._countAndFlagsBits;

      v22 = sub_1000137A4(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
      v31 = *((_QWORD *)v22 + 2);
      v30 = *((_QWORD *)v22 + 3);
      if (v31 >= v30 >> 1)
        v22 = sub_1000137A4((char *)(v30 > 1), v31 + 1, 1, v22);
      *((_QWORD *)v22 + 2) = v31 + 1;
      v32 = &v22[16 * v31];
      *((_QWORD *)v32 + 4) = countAndFlagsBits;
      *((_QWORD *)v32 + 5) = v29._object;
      break;
    default:
      v22 = (char *)&_swiftEmptyArrayStorage;
      break;
  }
  if (objc_msgSend(v1, "state") == (id)5)
  {
LABEL_26:
    if (!*((_QWORD *)v22 + 2))
      goto LABEL_39;
    goto LABEL_27;
  }
  *(_QWORD *)&v109 = 0;
  *((_QWORD *)&v109 + 1) = 0xE000000000000000;
  v111 = 0x64656C69616620;
  v112 = 0xE700000000000000;
  v33 = type metadata accessor for Locale(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v14, 1, 1, v33);
  v34 = sub_10000AA80();
  v35 = StringProtocol.range<A>(of:options:range:locale:)(&v111, 0, 0, 0, 1, v14, &type metadata for String, &type metadata for String, v34, v34);
  v37 = v36;
  sub_10000C728((uint64_t)v14, &qword_100020FE0);
  swift_bridgeObjectRelease(v112);
  if ((v37 & 1) != 0)
  {
    objc_msgSend(v1, "state");
    goto LABEL_26;
  }
  v38 = 0xE000000000000000;
  v39 = String.subscript.getter(15, v35, 0, 0xE000000000000000);
  v41 = v40;
  v44 = static String._fromSubstring(_:)(v39, v42, v43, v40);
  v46 = v45;
  swift_bridgeObjectRelease(v41);
  v47 = v105;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v105, 1, 1, v5);
  v48 = v107;
  (*(void (**)(char *, _QWORD, uint64_t))(v106 + 104))(v107, enum case for URL.DirectoryHint.inferFromPath(_:), v108);
  v49 = URL.init(filePath:directoryHint:relativeTo:)(v44, v46, v48, v47);
  v50 = URL.lastPathComponent.getter(v49);
  v108 = v51;
  v52 = ((uint64_t (*)(void))URL.pathComponents.getter)();
  v53 = *(_QWORD *)(v52 + 16);
  swift_bridgeObjectRelease(v52);
  v107 = (char *)v50;
  if (v53 < 2)
  {
    v68 = 0;
    goto LABEL_32;
  }
  while (1)
  {
    v57 = objc_allocWithZone((Class)NSBundle);
    URL._bridgeToObjectiveC()(v58);
    v60 = v59;
    v61 = objc_msgSend(v57, "initWithURL:", v59);

    if (v61)
      break;
LABEL_21:
    URL.deletingLastPathComponent()();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    v54 = (*(uint64_t (**)(char *, char *, uint64_t))(v6 + 32))(v11, v9, v5);
    v55 = URL.pathComponents.getter(v54);
    v56 = *(_QWORD *)(v55 + 16);
    swift_bridgeObjectRelease(v55);
    if (v56 <= 1)
    {
      v68 = 0;
      v38 = 0xE000000000000000;
      goto LABEL_32;
    }
  }
  v62 = objc_msgSend(v61, "infoDictionary");
  if (!v62)
  {

    goto LABEL_21;
  }
  v81 = v62;
  swift_bridgeObjectRelease(v108);
  v82 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v81, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);

  if (*(_QWORD *)(v82 + 16) && (v83 = sub_1000138A4(0xD00000000000001ALL, 0x8000000100017CD0), (v84 & 1) != 0))
  {
    sub_100014968(*(_QWORD *)(v82 + 56) + 32 * v83, (uint64_t)&v109);
    v85 = swift_dynamicCast(&v111, &v109, (char *)&type metadata for Any + 8, &type metadata for String, 6);
    v86 = v111;
    if (!v85)
      v86 = 0;
    v106 = v86;
    if (v85)
      v87 = v112;
    else
      v87 = 0;
  }
  else
  {
    v106 = 0;
    v87 = 0;
  }
  v88 = objc_msgSend(v61, "localizedInfoDictionary");
  if (!v88)
    goto LABEL_59;
  v89 = v88;
  v90 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v88, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);

  if (*(_QWORD *)(v90 + 16) && (v91 = sub_1000138A4(0xD000000000000013, 0x8000000100017CF0), (v92 & 1) != 0))
  {
    sub_100014968(*(_QWORD *)(v90 + 56) + 32 * v91, (uint64_t)&v109);
  }
  else
  {
    v109 = 0u;
    v110 = 0u;
  }
  swift_bridgeObjectRelease(v90);
  if (!*((_QWORD *)&v110 + 1))
  {
    sub_10000C728((uint64_t)&v109, &qword_100020FD0);
    goto LABEL_59;
  }
  if ((swift_dynamicCast(&v111, &v109, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
  {
LABEL_59:
    if (*(_QWORD *)(v82 + 16) && (v93 = sub_1000138A4(0x656C646E75424643, 0xEC000000656D614ELL), (v94 & 1) != 0))
    {
      sub_100014968(*(_QWORD *)(v82 + 56) + 32 * v93, (uint64_t)&v109);
    }
    else
    {
      v109 = 0u;
      v110 = 0u;
    }
    swift_bridgeObjectRelease(v82);
    if (*((_QWORD *)&v110 + 1))
    {
      v95 = swift_dynamicCast(&v111, &v109, (char *)&type metadata for Any + 8, &type metadata for String, 6);
      if ((v95 & 1) != 0)
      {

        v107 = (char *)v111;
        v108 = v112;
        goto LABEL_68;
      }
    }
    else
    {
      v95 = sub_10000C728((uint64_t)&v109, &qword_100020FD0);
    }
    v107 = (char *)URL.lastPathComponent.getter(v95);
    v108 = v96;

    goto LABEL_68;
  }
  swift_bridgeObjectRelease(v82);

  v107 = (char *)v111;
  v108 = v112;
LABEL_68:
  if (v87)
  {
    if (qword_100020AA0 != -1)
      swift_once(&qword_100020AA0, sub_10000D388);
    v98 = *((_QWORD *)&xmmword_100021240 + 1);
    v97 = xmmword_100021240;
    v99 = sub_100006A30(&qword_100020FC0);
    v100 = swift_allocObject(v99, 72, 7);
    *(_OWORD *)(v100 + 16) = xmmword_100019870;
    *(_QWORD *)(v100 + 56) = &type metadata for String;
    *(_QWORD *)(v100 + 64) = sub_100014890();
    *(_QWORD *)(v100 + 32) = v106;
    *(_QWORD *)(v100 + 40) = v87;
    v68 = String.init(format:_:)(v97, v98, v100);
    v38 = v101;
  }
  else
  {
    v68 = 0;
    v38 = 0xE000000000000000;
  }
LABEL_32:
  if (qword_100020A98 != -1)
    swift_once(&qword_100020A98, sub_10000D2D8);
  v69 = xmmword_100021230;
  v70 = sub_100006A30(&qword_100020FC0);
  v71 = swift_allocObject(v70, 112, 7);
  *(_OWORD *)(v71 + 16) = xmmword_100019880;
  *(_QWORD *)(v71 + 56) = &type metadata for String;
  v72 = sub_100014890();
  v73 = v108;
  *(_QWORD *)(v71 + 32) = v107;
  *(_QWORD *)(v71 + 40) = v73;
  *(_QWORD *)(v71 + 96) = &type metadata for String;
  *(_QWORD *)(v71 + 104) = v72;
  *(_QWORD *)(v71 + 64) = v72;
  *(_QWORD *)(v71 + 72) = v68;
  *(_QWORD *)(v71 + 80) = v38;
  v74 = String.init(format:_:)(v69, *((_QWORD *)&v69 + 1), v71);
  v76 = v75;
  if ((swift_isUniquelyReferenced_nonNull_native(v22) & 1) == 0)
    v22 = sub_1000137A4(0, *((_QWORD *)v22 + 2) + 1, 1, v22);
  v78 = *((_QWORD *)v22 + 2);
  v77 = *((_QWORD *)v22 + 3);
  if (v78 >= v77 >> 1)
    v22 = sub_1000137A4((char *)(v77 > 1), v78 + 1, 1, v22);
  *((_QWORD *)v22 + 2) = v78 + 1;
  v79 = &v22[16 * v78];
  *((_QWORD *)v79 + 4) = v74;
  *((_QWORD *)v79 + 5) = v76;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  if (!*((_QWORD *)v22 + 2))
  {
LABEL_39:
    swift_bridgeObjectRelease(v22);
    return 0;
  }
LABEL_27:
  *(_QWORD *)&v109 = v22;
  if (qword_100020A78 != -1)
    swift_once(&qword_100020A78, sub_10000D050);
  v64 = *((_QWORD *)&xmmword_1000211F0 + 1);
  v63 = xmmword_1000211F0;
  v65 = sub_100006A30(&qword_100020FF0);
  v66 = sub_10001491C();
  v67 = BidirectionalCollection<>.joined(separator:)(v63, v64, v65, v66);
  swift_bridgeObjectRelease(v22);
  return v67;
}

char *sub_100013384()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  char *v5;

  v1 = objc_msgSend(v0, "jobPrinterStateReasons");
  if (v1)
  {
    v2 = v1;
    v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, &type metadata for String);

    if (*(_QWORD *)(v3 + 16))
    {
      v5 = (char *)v3;
      swift_bridgeObjectRetain(v3);
      sub_100013530(&v5);
      swift_bridgeObjectRelease(v3);
      return v5;
    }
    swift_bridgeObjectRelease(v3);
  }
  return (char *)_swiftEmptyArrayStorage;
}

uint64_t sub_100013430()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_100006A30(&qword_100020FB8);
  v1 = swift_allocObject(v0, 80, 7);
  *(_OWORD *)(v1 + 16) = xmmword_100019890;
  *(_QWORD *)(v1 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(PKOutputModeGray);
  *(_QWORD *)(v1 + 40) = v2;
  *(_QWORD *)(v1 + 48) = static String._unconditionallyBridgeFromObjectiveC(_:)(PKOutputModeAutoGray);
  *(_QWORD *)(v1 + 56) = v3;
  result = static String._unconditionallyBridgeFromObjectiveC(_:)(PKOutputModeProcessGray);
  *(_QWORD *)(v1 + 64) = result;
  *(_QWORD *)(v1 + 72) = v5;
  qword_100020FA8 = v1;
  return result;
}

uint64_t sub_1000134B4@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_10000853C(0, (unint64_t *)&qword_100020C60, &off_10001C9D0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

id sub_100013500@<X0>(_QWORD *a1@<X8>)
{
  id *v1;
  id result;

  result = objc_msgSend(*v1, "localJobID");
  *a1 = result;
  return result;
}

uint64_t sub_100013530(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v2 = sub_1000139FC((uint64_t)v2);
  v3 = *((_QWORD *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  result = sub_100013FA4(v5);
  *a1 = v2;
  return result;
}

char *sub_100013598(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_100006A30(&qword_100020FB0);
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
    v11 = (char *)&_swiftEmptyArrayStorage;
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

char *sub_100013690(uint64_t a1)
{
  return sub_100013598(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_1000136A4(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_100006A30(&qword_100020FB8);
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
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }
  swift_release(a4);
  return v11;
}

char *sub_1000137A4(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_100006A30(&qword_100020FB8);
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
    v11 = (char *)&_swiftEmptyArrayStorage;
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
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

unint64_t sub_1000138A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100013908(a1, a2, v5);
}

unint64_t sub_100013908(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_1000139E8(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, a1);
}

char *sub_1000139FC(uint64_t a1)
{
  return sub_1000136A4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100013A10(uint64_t *__dst, uint64_t *__src, unint64_t a3, uint64_t *a4)
{
  uint64_t *v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  char *v13;
  uint64_t *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unsigned __int8 v19;
  unint64_t v20;
  BOOL v21;
  char v22;
  uint64_t *v23;
  uint64_t *v24;
  char *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  void *v30;
  unsigned __int8 v31;
  unint64_t v32;
  char v34;
  uint64_t *v35;
  BOOL v36;
  uint64_t *v38;
  uint64_t *v40;
  uint64_t *v42;

  v5 = __src;
  v6 = (char *)__src - (char *)__dst;
  v7 = (char *)__src - (char *)__dst + 15;
  if ((char *)__src - (char *)__dst >= 0)
    v7 = (char *)__src - (char *)__dst;
  v8 = v7 >> 4;
  v9 = a3 - (_QWORD)__src;
  v10 = a3 - (_QWORD)__src + 15;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v10 = a3 - (_QWORD)__src;
  v11 = v10 >> 4;
  if (v8 >= v10 >> 4)
  {
    v14 = a4;
    if (a4 != __src || &__src[2 * v11] <= a4)
      memmove(a4, __src, 16 * v11);
    v13 = (char *)&a4[2 * v11];
    if (__dst >= v5 || v9 < 16)
      goto LABEL_58;
    v24 = (uint64_t *)(a3 - 16);
    v38 = a4;
    while (1)
    {
      v42 = (uint64_t *)v13;
      v27 = *((_QWORD *)v13 - 2);
      v26 = (void *)*((_QWORD *)v13 - 1);
      v25 = v13 - 16;
      v40 = v24 + 2;
      v28 = *(v5 - 2);
      v30 = (void *)*(v5 - 1);
      v29 = v5 - 2;
      swift_bridgeObjectRetain(v26);
      swift_bridgeObjectRetain(v30);
      v31 = sub_100014CE4(v27, v26);
      if (sub_100014CE4(v28, v30) < v31)
        break;
      if (v27 == 0x2D656E696C66666FLL && v26 == (void *)0xEE0074726F706572)
      {
        v32 = 0xEE0074726F706572;
        goto LABEL_45;
      }
      v34 = _stringCompareWithSmolCheck(_:_:expecting:)(v27, v26, 0x2D656E696C66666FLL, 0xEE0074726F706572, 0);
      swift_bridgeObjectRelease(v26);
      swift_bridgeObjectRelease(v30);
      if ((v34 & 1) == 0)
      {
        v29 = (uint64_t *)v25;
        if (v40 == v42)
        {
          v13 = v25;
          v35 = __dst;
          if (v24 < v42)
            goto LABEL_53;
        }
        else
        {
          v13 = v25;
LABEL_51:
          v35 = __dst;
        }
LABEL_52:
        *(_OWORD *)v24 = *(_OWORD *)v29;
        goto LABEL_53;
      }
LABEL_46:
      v13 = (char *)v42;
      if (v40 != v5)
      {
        v5 -= 2;
        goto LABEL_51;
      }
      v36 = v24 >= v5;
      v5 -= 2;
      v35 = __dst;
      if (v36)
        goto LABEL_52;
LABEL_53:
      if (v5 <= v35)
      {
        v14 = v38;
        goto LABEL_58;
      }
      v24 -= 2;
      v14 = v38;
      if (v13 <= (char *)v38)
        goto LABEL_58;
    }
    v32 = (unint64_t)v26;
LABEL_45:
    swift_bridgeObjectRelease(v32);
    swift_bridgeObjectRelease(v30);
    goto LABEL_46;
  }
  v12 = __dst;
  if (a4 != __dst || &__dst[2 * v8] <= a4)
    memmove(a4, __dst, 16 * v8);
  v13 = (char *)&a4[2 * v8];
  v14 = a4;
  if ((unint64_t)v5 < a3 && v6 >= 16)
  {
    while (1)
    {
      v16 = *v5;
      v15 = (void *)v5[1];
      v18 = *v14;
      v17 = (void *)v14[1];
      swift_bridgeObjectRetain(v15);
      swift_bridgeObjectRetain(v17);
      v19 = sub_100014CE4(v16, v15);
      if (sub_100014CE4(v18, v17) < v19)
        break;
      v21 = v16 == 0x2D656E696C66666FLL && v15 == (void *)0xEE0074726F706572;
      if (v21)
      {
        v20 = 0xEE0074726F706572;
LABEL_22:
        swift_bridgeObjectRelease(v20);
        swift_bridgeObjectRelease(v17);
LABEL_23:
        v23 = v5;
        v21 = v12 == v5;
        v5 += 2;
        if (v21)
          goto LABEL_25;
LABEL_24:
        *(_OWORD *)v12 = *(_OWORD *)v23;
        goto LABEL_25;
      }
      v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v15, 0x2D656E696C66666FLL, 0xEE0074726F706572, 0);
      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease(v17);
      if ((v22 & 1) != 0)
        goto LABEL_23;
      v23 = v14;
      v21 = v12 == v14;
      v14 += 2;
      if (!v21)
        goto LABEL_24;
LABEL_25:
      v12 += 2;
      if (v14 >= (uint64_t *)v13 || (unint64_t)v5 >= a3)
        goto LABEL_27;
    }
    v20 = (unint64_t)v15;
    goto LABEL_22;
  }
LABEL_27:
  v5 = v12;
LABEL_58:
  if (v5 != v14
    || v5 >= (uint64_t *)((char *)v14
                       + ((v13 - (char *)v14 + (v13 - (char *)v14 < 0 ? 0xFuLL : 0)) & 0xFFFFFFFFFFFFFFF0)))
  {
    memmove(v5, v14, 16 * ((v13 - (char *)v14) / 16));
  }
  return 1;
}

uint64_t sub_100013E00(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unsigned __int8 v12;
  unint64_t v13;
  char v14;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;

  v16 = result;
  if (a3 != a2)
  {
    v4 = a3;
    v18 = *a4;
    v5 = (uint64_t *)(*a4 + 16 * a3);
LABEL_5:
    v6 = (uint64_t *)(v18 + 16 * v4);
    v8 = *v6;
    v7 = (void *)v6[1];
    v9 = v16;
    v17 = v5;
    while (1)
    {
      v11 = *(v5 - 2);
      v10 = (void *)*(v5 - 1);
      swift_bridgeObjectRetain(v7);
      swift_bridgeObjectRetain(v10);
      v12 = sub_100014CE4(v8, v7);
      if (sub_100014CE4(v11, v10) < v12)
        break;
      if (v8 == 0x2D656E696C66666FLL && v7 == (void *)0xEE0074726F706572)
      {
        v13 = 0xEE0074726F706572;
        goto LABEL_11;
      }
      v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v8, v7, 0x2D656E696C66666FLL, 0xEE0074726F706572, 0);
      swift_bridgeObjectRelease(v7);
      result = swift_bridgeObjectRelease(v10);
      if ((v14 & 1) == 0)
        goto LABEL_4;
LABEL_13:
      if (!v18)
      {
        __break(1u);
        return result;
      }
      v8 = *v5;
      v7 = (void *)v5[1];
      *(_OWORD *)v5 = *((_OWORD *)v5 - 1);
      *(v5 - 1) = (uint64_t)v7;
      *(v5 - 2) = v8;
      v5 -= 2;
      if (v4 == ++v9)
      {
LABEL_4:
        ++v4;
        v5 = v17 + 2;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
    }
    v13 = (unint64_t)v7;
LABEL_11:
    swift_bridgeObjectRelease(v13);
    result = swift_bridgeObjectRelease(v10);
    goto LABEL_13;
  }
  return result;
}

uint64_t sub_100013FA4(uint64_t *a1)
{
  uint64_t v1;
  Swift::Int v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  Swift::Int v8;
  uint64_t v9;
  char *v10;
  Swift::Int v11;
  unint64_t v12;
  Swift::Int v13;
  uint64_t *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  unsigned __int8 v20;
  unint64_t v21;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 v32;
  unint64_t v33;
  uint64_t v35;
  uint64_t v36;
  Swift::Int v37;
  Swift::Int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  Swift::Int v42;
  uint64_t *v43;
  uint64_t *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  unsigned __int8 v49;
  unint64_t v50;
  char v51;
  unint64_t v52;
  unint64_t v53;
  _QWORD *v54;
  char *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  unint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  uint64_t v78;
  char v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  unint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  _QWORD *v109;
  uint64_t v110;
  char *v111;
  char *v112;
  Swift::Int v113;
  Swift::Int v114;
  Swift::Int v115;
  uint64_t *v116;
  uint64_t *v117;
  uint64_t v118;

  v3 = a1[1];
  result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_160;
    if (v3)
      return sub_100013E00(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_159;
  v115 = v3;
  v110 = result;
  v107 = a1;
  if (v3 <= 1)
  {
    v7 = _swiftEmptyArrayStorage;
    v117 = &_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      v12 = _swiftEmptyArrayStorage[2];
      v10 = (char *)_swiftEmptyArrayStorage;
LABEL_125:
      v109 = v7;
      if (v12 >= 2)
      {
        v101 = *v107;
        do
        {
          v102 = v12 - 2;
          if (v12 < 2)
            goto LABEL_154;
          if (!v101)
            goto LABEL_167;
          v103 = *(_QWORD *)&v10[16 * v102 + 32];
          v104 = *(_QWORD *)&v10[16 * v12 + 24];
          result = sub_100013A10((uint64_t *)(v101 + 16 * v103), (uint64_t *)(v101 + 16 * *(_QWORD *)&v10[16 * v12 + 16]), v101 + 16 * v104, v117);
          if (v1)
            break;
          if (v104 < v103)
            goto LABEL_155;
          result = swift_isUniquelyReferenced_nonNull_native(v10);
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_100013690((uint64_t)v10);
            v10 = (char *)result;
          }
          if (v102 >= *((_QWORD *)v10 + 2))
            goto LABEL_156;
          v105 = &v10[16 * v102 + 32];
          *(_QWORD *)v105 = v103;
          *((_QWORD *)v105 + 1) = v104;
          v106 = *((_QWORD *)v10 + 2);
          if (v12 > v106)
            goto LABEL_157;
          result = (uint64_t)memmove(&v10[16 * v12 + 16], &v10[16 * v12 + 32], 16 * (v106 - v12));
          *((_QWORD *)v10 + 2) = v106 - 1;
          v12 = v106 - 1;
        }
        while (v106 > 2);
      }
LABEL_136:
      swift_bridgeObjectRelease(v10);
      v109[2] = 0;
      return swift_bridgeObjectRelease(v109);
    }
    v109 = _swiftEmptyArrayStorage;
  }
  else
  {
    v6 = v5 >> 1;
    result = static Array._allocateBufferUninitialized(minimumCapacity:)(v5 >> 1, &type metadata for String);
    *(_QWORD *)(result + 16) = v6;
    v109 = (_QWORD *)result;
    v117 = (uint64_t *)(result + 32);
  }
  v8 = 0;
  v9 = *a1;
  v108 = *a1 + 24;
  v10 = (char *)_swiftEmptyArrayStorage;
  v11 = v115;
  v118 = *a1;
LABEL_16:
  v13 = v8++;
  v114 = v13;
  if (v8 >= v11)
    goto LABEL_52;
  v111 = v10;
  v14 = (uint64_t *)(v9 + 16 * v8);
  v16 = *v14;
  v15 = (void *)v14[1];
  v17 = (uint64_t *)(v9 + 16 * v13);
  v18 = *v17;
  v19 = (void *)v17[1];
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v19);
  v20 = sub_100014CE4(v16, v15);
  if (sub_100014CE4(v18, v19) >= v20)
  {
    if (v16 != 0x2D656E696C66666FLL || v15 != (void *)0xEE0074726F706572)
    {
      v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v15, 0x2D656E696C66666FLL, 0xEE0074726F706572, 0);
      swift_bridgeObjectRelease(v15);
      goto LABEL_26;
    }
    v21 = 0xEE0074726F706572;
  }
  else
  {
    v21 = (unint64_t)v15;
  }
  swift_bridgeObjectRelease(v21);
  v23 = 1;
LABEL_26:
  result = swift_bridgeObjectRelease(v19);
  v8 = v13 + 2;
  if (v13 + 2 < v115)
  {
    v24 = v108 + 16 * v13;
    while (1)
    {
      v26 = v24;
      v28 = *(void **)(v24 + 16);
      v24 += 16;
      v27 = v28;
      v30 = *(_QWORD *)(v26 - 8);
      v29 = *(void **)v26;
      v31 = *(_QWORD *)(v26 + 8);
      swift_bridgeObjectRetain(v28);
      swift_bridgeObjectRetain(v29);
      v32 = sub_100014CE4(v31, v28);
      if (sub_100014CE4(v30, v29) >= v32)
      {
        if (v31 != 0x2D656E696C66666FLL || v27 != (void *)0xEE0074726F706572)
        {
          v25 = _stringCompareWithSmolCheck(_:_:expecting:)(v31, v27, 0x2D656E696C66666FLL, 0xEE0074726F706572, 0);
          swift_bridgeObjectRelease(v27);
          result = swift_bridgeObjectRelease(v29);
          if (((v23 ^ v25) & 1) != 0)
            goto LABEL_50;
          goto LABEL_29;
        }
        v33 = 0xEE0074726F706572;
      }
      else
      {
        v33 = (unint64_t)v27;
      }
      swift_bridgeObjectRelease(v33);
      result = swift_bridgeObjectRelease(v29);
      if ((v23 & 1) == 0)
      {
        v10 = v111;
        v13 = v114;
        v11 = v115;
        v9 = v118;
        if (v8 >= v115)
          goto LABEL_76;
        goto LABEL_53;
      }
LABEL_29:
      if (v115 == ++v8)
      {
        v8 = v115;
LABEL_50:
        v9 = v118;
        v13 = v114;
        v10 = v111;
        if ((v23 & 1) != 0)
          goto LABEL_42;
LABEL_51:
        v11 = v115;
LABEL_52:
        if (v8 >= v11)
          goto LABEL_76;
LABEL_53:
        if (__OFSUB__(v8, v13))
          goto LABEL_158;
        if (v8 - v13 >= v110)
          goto LABEL_76;
        v42 = v13 + v110;
        if (__OFADD__(v13, v110))
          goto LABEL_161;
        if (v42 >= v11)
          v42 = v11;
        if (v42 < v13)
        {
LABEL_162:
          __break(1u);
          goto LABEL_163;
        }
        if (v8 == v42)
          goto LABEL_76;
        v112 = v10;
        v113 = v42;
        v43 = (uint64_t *)(v9 + 16 * v8);
        while (2)
        {
          v44 = (uint64_t *)(v9 + 16 * v8);
          v46 = *v44;
          v45 = (void *)v44[1];
          v116 = v43;
          while (2)
          {
            v48 = *(v43 - 2);
            v47 = (void *)*(v43 - 1);
            swift_bridgeObjectRetain(v45);
            swift_bridgeObjectRetain(v47);
            v49 = sub_100014CE4(v46, v45);
            if (sub_100014CE4(v48, v47) < v49)
            {
              v50 = (unint64_t)v45;
              goto LABEL_69;
            }
            if (v46 == 0x2D656E696C66666FLL && v45 == (void *)0xEE0074726F706572)
            {
              v50 = 0xEE0074726F706572;
LABEL_69:
              swift_bridgeObjectRelease(v50);
              result = swift_bridgeObjectRelease(v47);
LABEL_71:
              v9 = v118;
              if (!v118)
                goto LABEL_164;
              v46 = *v43;
              v45 = (void *)v43[1];
              *(_OWORD *)v43 = *((_OWORD *)v43 - 1);
              *(v43 - 1) = (uint64_t)v45;
              *(v43 - 2) = v46;
              v43 -= 2;
              if (v8 == ++v13)
                goto LABEL_62;
              continue;
            }
            break;
          }
          v51 = _stringCompareWithSmolCheck(_:_:expecting:)(v46, v45, 0x2D656E696C66666FLL, 0xEE0074726F706572, 0);
          swift_bridgeObjectRelease(v45);
          result = swift_bridgeObjectRelease(v47);
          if ((v51 & 1) != 0)
            goto LABEL_71;
          v9 = v118;
LABEL_62:
          ++v8;
          v43 = v116 + 2;
          v13 = v114;
          if (v8 != v113)
            continue;
          break;
        }
        v8 = v113;
        v10 = v112;
LABEL_76:
        if (v8 < v13)
          goto LABEL_153;
        result = swift_isUniquelyReferenced_nonNull_native(v10);
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_100013598(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
          v10 = (char *)result;
        }
        v53 = *((_QWORD *)v10 + 2);
        v52 = *((_QWORD *)v10 + 3);
        v12 = v53 + 1;
        v9 = v118;
        if (v53 >= v52 >> 1)
        {
          result = (uint64_t)sub_100013598((char *)(v52 > 1), v53 + 1, 1, v10);
          v9 = v118;
          v10 = (char *)result;
        }
        *((_QWORD *)v10 + 2) = v12;
        v54 = v10 + 32;
        v55 = &v10[16 * v53 + 32];
        *(_QWORD *)v55 = v13;
        *((_QWORD *)v55 + 1) = v8;
        if (v53)
        {
          while (2)
          {
            v56 = v12 - 1;
            if (v12 >= 4)
            {
              v61 = &v54[2 * v12];
              v62 = *(v61 - 8);
              v63 = *(v61 - 7);
              v67 = __OFSUB__(v63, v62);
              v64 = v63 - v62;
              if (v67)
                goto LABEL_142;
              v66 = *(v61 - 6);
              v65 = *(v61 - 5);
              v67 = __OFSUB__(v65, v66);
              v59 = v65 - v66;
              v60 = v67;
              if (v67)
                goto LABEL_143;
              v68 = v12 - 2;
              v69 = &v54[2 * v12 - 4];
              v71 = *v69;
              v70 = v69[1];
              v67 = __OFSUB__(v70, v71);
              v72 = v70 - v71;
              if (v67)
                goto LABEL_144;
              v67 = __OFADD__(v59, v72);
              v73 = v59 + v72;
              if (v67)
                goto LABEL_146;
              if (v73 >= v64)
              {
                v91 = &v54[2 * v56];
                v93 = *v91;
                v92 = v91[1];
                v67 = __OFSUB__(v92, v93);
                v94 = v92 - v93;
                if (v67)
                  goto LABEL_152;
                v84 = v59 < v94;
              }
              else
              {
LABEL_95:
                if ((v60 & 1) != 0)
                  goto LABEL_145;
                v68 = v12 - 2;
                v74 = &v54[2 * v12 - 4];
                v76 = *v74;
                v75 = v74[1];
                v77 = __OFSUB__(v75, v76);
                v78 = v75 - v76;
                v79 = v77;
                if (v77)
                  goto LABEL_147;
                v80 = &v54[2 * v56];
                v82 = *v80;
                v81 = v80[1];
                v67 = __OFSUB__(v81, v82);
                v83 = v81 - v82;
                if (v67)
                  goto LABEL_149;
                if (__OFADD__(v78, v83))
                  goto LABEL_151;
                if (v78 + v83 < v59)
                  goto LABEL_107;
                v84 = v59 < v83;
              }
              if (v84)
                v56 = v68;
            }
            else
            {
              if (v12 == 3)
              {
                v58 = *((_QWORD *)v10 + 4);
                v57 = *((_QWORD *)v10 + 5);
                v67 = __OFSUB__(v57, v58);
                v59 = v57 - v58;
                v60 = v67;
                goto LABEL_95;
              }
              v85 = *((_QWORD *)v10 + 4);
              v86 = *((_QWORD *)v10 + 5);
              v67 = __OFSUB__(v86, v85);
              v78 = v86 - v85;
              v79 = v67;
LABEL_107:
              if ((v79 & 1) != 0)
                goto LABEL_148;
              v87 = &v54[2 * v56];
              v89 = *v87;
              v88 = v87[1];
              v67 = __OFSUB__(v88, v89);
              v90 = v88 - v89;
              if (v67)
                goto LABEL_150;
              if (v90 < v78)
                goto LABEL_15;
            }
            v95 = v56 - 1;
            if (v56 - 1 >= v12)
            {
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
LABEL_148:
              __break(1u);
LABEL_149:
              __break(1u);
LABEL_150:
              __break(1u);
LABEL_151:
              __break(1u);
LABEL_152:
              __break(1u);
LABEL_153:
              __break(1u);
LABEL_154:
              __break(1u);
LABEL_155:
              __break(1u);
LABEL_156:
              __break(1u);
LABEL_157:
              __break(1u);
LABEL_158:
              __break(1u);
LABEL_159:
              __break(1u);
LABEL_160:
              __break(1u);
LABEL_161:
              __break(1u);
              goto LABEL_162;
            }
            if (!v9)
              goto LABEL_165;
            v96 = &v54[2 * v95];
            v97 = *v96;
            v98 = &v54[2 * v56];
            v99 = v98[1];
            result = sub_100013A10((uint64_t *)(v9 + 16 * *v96), (uint64_t *)(v9 + 16 * *v98), v9 + 16 * v99, v117);
            if (v1)
              goto LABEL_136;
            if (v99 < v97)
              goto LABEL_139;
            if (v56 > *((_QWORD *)v10 + 2))
              goto LABEL_140;
            *v96 = v97;
            v54[2 * v95 + 1] = v99;
            v100 = *((_QWORD *)v10 + 2);
            if (v56 >= v100)
              goto LABEL_141;
            v12 = v100 - 1;
            result = (uint64_t)memmove(&v54[2 * v56], v98 + 2, 16 * (v100 - 1 - v56));
            *((_QWORD *)v10 + 2) = v100 - 1;
            v9 = v118;
            if (v100 <= 2)
              goto LABEL_15;
            continue;
          }
        }
        v12 = 1;
LABEL_15:
        v11 = v115;
        if (v8 >= v115)
        {
          v7 = v109;
          goto LABEL_125;
        }
        goto LABEL_16;
      }
    }
  }
  v9 = v118;
  v10 = v111;
  if ((v23 & 1) == 0)
    goto LABEL_51;
LABEL_42:
  if (v8 >= v13)
  {
    if (v13 < v8)
    {
      v35 = 16 * v8;
      v36 = 16 * v13;
      v37 = v8;
      v38 = v13;
      v11 = v115;
      while (1)
      {
        if (v38 != --v37)
        {
          if (!v9)
            goto LABEL_166;
          v39 = v9 + v35;
          v40 = *(_QWORD *)(v9 + v36);
          v41 = *(_QWORD *)(v9 + v36 + 8);
          *(_OWORD *)(v9 + v36) = *(_OWORD *)(v9 + v35 - 16);
          *(_QWORD *)(v39 - 16) = v40;
          *(_QWORD *)(v39 - 8) = v41;
        }
        ++v38;
        v35 -= 16;
        v36 += 16;
        if (v38 >= v37)
          goto LABEL_52;
      }
    }
    v11 = v115;
    if (v8 >= v115)
      goto LABEL_76;
    goto LABEL_53;
  }
LABEL_163:
  __break(1u);
LABEL_164:
  __break(1u);
LABEL_165:
  __break(1u);
LABEL_166:
  __break(1u);
LABEL_167:
  __break(1u);
  return result;
}

unint64_t sub_100014890()
{
  unint64_t result;

  result = qword_100020FC8;
  if (!qword_100020FC8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100020FC8);
  }
  return result;
}

uint64_t sub_1000148D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006A30(&qword_100020FD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001491C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100020FF8;
  if (!qword_100020FF8)
  {
    v1 = sub_1000067D4(&qword_100020FF0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100020FF8);
  }
  return result;
}

uint64_t sub_100014968(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000149A4(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000149E8(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

void sub_100014A2C(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_100014A80()
{
  id v0;
  NSString v1;
  NSString v2;
  NSString v3;
  id v4;
  uint64_t v5;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v1 = String._bridgeToObjectiveC()();
  v2 = String._bridgeToObjectiveC()();
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend(v0, "localizedStringForKey:value:table:", v1, v2, v3);

  v5 = ((uint64_t (*)(id))static String._unconditionallyBridgeFromObjectiveC(_:))(v4);
  swift_bridgeObjectRelease(0x8000000100017EB0);

  return v5;
}

void sub_100014C24()
{
  JUMPOUT(0x100014B54);
}

uint64_t sub_100014CE4(uint64_t a1, void *a2)
{
  Swift::String v5;
  Swift::String v6;
  Swift::String v7;
  Swift::String v8;
  Swift::String v9;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  Swift::String v23;
  Swift::String v24;
  Swift::String v25;
  Swift::String v26;
  Swift::String v27;
  Swift::String v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  Swift::String v34;
  Swift::String v35;
  id v36;
  Swift::String v37;
  Swift::String_optional v38;
  Swift::String v39;
  void *object;
  Swift::String v41;
  Swift::String v42;
  Swift::Bool v43;
  Swift::String v44;

  if (a1 == 0xD000000000000014 && a2 == (void *)0x80000001000181C0
    || (_stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, 0xD000000000000014, 0x80000001000181C0, 0) & 1) != 0)
  {
    return 2;
  }
  v5._countAndFlagsBits = 0xD000000000000011;
  v5._object = (void *)0x80000001000181E0;
  if (String.hasPrefix(_:)(v5))
    return 20;
  v6._countAndFlagsBits = 0xD000000000000018;
  v6._object = (void *)0x8000000100018200;
  if (String.hasPrefix(_:)(v6))
    return 4;
  if (a1 == 0x646573756170 && a2 == (void *)0xE600000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, 0x646573756170, 0xE600000000000000, 0) & 1) != 0)
  {
    return 3;
  }
  v7._countAndFlagsBits = 0x6F6C2D616964656DLL;
  v7._object = (void *)0xE900000000000077;
  if (String.hasPrefix(_:)(v7))
    return 5;
  v8._countAndFlagsBits = 0x65706F6C65766564;
  v8._object = (void *)0xED0000776F6C2D72;
  if (String.hasPrefix(_:)(v8))
    return 6;
  v9._countAndFlagsBits = 0x6F6C2D72656E6F74;
  v9._object = (void *)0xE900000000000077;
  if (String.hasPrefix(_:)(v9))
    return 6;
  v10._countAndFlagsBits = 0xD000000000000011;
  v10._object = (void *)0x8000000100018220;
  if (String.hasPrefix(_:)(v10))
    return 7;
  v11._countAndFlagsBits = 0x6D652D616964656DLL;
  v11._object = (void *)0xEB00000000797470;
  if (String.hasPrefix(_:)(v11))
    return 10;
  v12._object = (void *)0xE90000000000006DLL;
  v12._countAndFlagsBits = 0x616A2D616964656DLL;
  if (String.hasPrefix(_:)(v12))
    return 12;
  v13._countAndFlagsBits = 0x656E2D616964656DLL;
  v13._object = (void *)0xEC00000064656465;
  if (String.hasPrefix(_:)(v13))
    return 11;
  v14._countAndFlagsBits = 0x65706F6C65766564;
  v14._object = (void *)0xEF7974706D652D72;
  if (String.hasPrefix(_:)(v14))
    return 13;
  v15._countAndFlagsBits = 0x6D652D72656E6F74;
  v15._object = (void *)0xEB00000000797470;
  if (String.hasPrefix(_:)(v15))
    return 13;
  v16._countAndFlagsBits = 0xD000000000000013;
  v16._object = (void *)0x8000000100018240;
  if (String.hasPrefix(_:)(v16))
    return 14;
  v17._countAndFlagsBits = 0xD000000000000012;
  v17._object = (void *)0x8000000100018260;
  if (String.hasPrefix(_:)(v17))
    return 15;
  v18._countAndFlagsBits = 0xD000000000000013;
  v18._object = (void *)0x8000000100018280;
  if (String.hasPrefix(_:)(v18))
    return 15;
  v19._object = (void *)0xE90000000000006ELL;
  v19._countAndFlagsBits = 0x65706F2D726F6F64;
  if (String.hasPrefix(_:)(v19))
    return 16;
  v20._countAndFlagsBits = 0x706F2D7265766F63;
  v20._object = (void *)0xEA00000000006E65;
  if (String.hasPrefix(_:)(v20))
    return 17;
  v21._countAndFlagsBits = 0x636F6C7265746E69;
  v21._object = (void *)0xEE006E65706F2D6BLL;
  if (String.hasPrefix(_:)(v21))
    return 17;
  v22._countAndFlagsBits = 0x2D656E696C66666FLL;
  v22._object = (void *)0xEE0074726F706572;
  if (String.hasPrefix(_:)(v22))
    return 26;
  v23._countAndFlagsBits = 0x72612D6C6F6F7073;
  v23._object = (void *)0xEF6C6C75662D6165;
  if (String.hasPrefix(_:)(v23))
    return 21;
  v24._object = (void *)0x80000001000182A0;
  v24._countAndFlagsBits = 0xD000000000000010;
  if (String.hasPrefix(_:)(v24))
    return 22;
  v25._countAndFlagsBits = 0xD000000000000017;
  v25._object = (void *)0x80000001000182C0;
  if (String.hasPrefix(_:)(v25))
    return 18;
  v26._countAndFlagsBits = 0x766F2D7265737566;
  v26._object = (void *)0xEF706D65742D7265;
  if (String.hasPrefix(_:)(v26))
    return 18;
  v27._object = (void *)0x80000001000182E0;
  v27._countAndFlagsBits = 0xD000000000000010;
  if (String.hasPrefix(_:)(v27))
    return 18;
  v28._countAndFlagsBits = 0x7261656E2D63706FLL;
  v28._object = (void *)0xEC0000006C6F652DLL;
  if (String.hasPrefix(_:)(v28))
    return 18;
  v29._countAndFlagsBits = 0x6566696C2D63706FLL;
  v29._object = (void *)0xED00007265766F2DLL;
  if (String.hasPrefix(_:)(v29))
    return 25;
  v30._countAndFlagsBits = 0xD000000000000013;
  v30._object = (void *)0x8000000100018300;
  if (String.hasPrefix(_:)(v30))
    return 23;
  v31._countAndFlagsBits = 0xD00000000000001CLL;
  v31._object = (void *)0x8000000100018320;
  if (String.hasPrefix(_:)(v31))
    return 27;
  v32._object = (void *)0x8000000100018340;
  v32._countAndFlagsBits = 0xD000000000000010;
  if (String.hasPrefix(_:)(v32))
    return 28;
  v33._object = (void *)0x8000000100018360;
  v33._countAndFlagsBits = 0xD000000000000010;
  if (String.hasPrefix(_:)(v33))
    return 29;
  v34._object = (void *)0x8000000100018380;
  v34._countAndFlagsBits = 0xD000000000000010;
  if (String.hasPrefix(_:)(v34))
    return 30;
  v35._object = (void *)0x80000001000183A0;
  v35._countAndFlagsBits = 0xD000000000000010;
  if (String.hasPrefix(_:)(v35))
    return 31;
  v36 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v44._object = (void *)0xE000000000000000;
  v37._countAndFlagsBits = a1;
  v37._object = a2;
  v38.value._countAndFlagsBits = 1684957515;
  v38.value._object = (void *)0xE400000000000000;
  v39._countAndFlagsBits = a1;
  v39._object = a2;
  v44._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v37, v38, (NSBundle)v36, v39, v44)._object;

  v41._countAndFlagsBits = 0x726F7272652DLL;
  v41._object = (void *)0xE600000000000000;
  if (String.hasSuffix(_:)(v41))
  {
    swift_bridgeObjectRelease(object);
    return 25;
  }
  else
  {
    v42._countAndFlagsBits = 0x676E696E7261772DLL;
    v42._object = (void *)0xE800000000000000;
    v43 = String.hasSuffix(_:)(v42);
    swift_bridgeObjectRelease(object);
    if (v43)
      return 18;
    else
      return 0;
  }
}

uint64_t *assignWithCopy for PrintCenterCellButtonStyle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintCenterCellButtonStyle(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrintCenterCellButtonStyle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintCenterCellButtonStyle()
{
  return &type metadata for PrintCenterCellButtonStyle;
}

uint64_t sub_100015528(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100019D54, 1);
}

uint64_t sub_100015538@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
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
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t KeyPath;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v67 = a3;
  v68 = a2;
  v70 = a4;
  v5 = sub_100006A30(&qword_100020E98);
  __chkstk_darwin(v5);
  v66 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for BorderlessButtonStyle(0);
  v58 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v9 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for ButtonStyleConfiguration.Label(0);
  v56 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100006A30(&qword_100021000);
  v60 = *(_QWORD *)(v13 - 8);
  v61 = v13;
  __chkstk_darwin(v13);
  v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = sub_100006A30(&qword_100021008);
  __chkstk_darwin(v57);
  v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = sub_100006A30(&qword_100021010);
  __chkstk_darwin(v59);
  v19 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = sub_100006A30(&qword_100021018);
  __chkstk_darwin(v62);
  v21 = (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = sub_100006A30(&qword_100021020);
  __chkstk_darwin(v63);
  v23 = (char *)&v56 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = sub_100006A30(&qword_100021028);
  v24 = __chkstk_darwin(v64);
  v65 = (uint64_t)&v56 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = a1;
  v26 = ButtonStyleConfiguration.label.getter(v24);
  BorderlessButtonStyle.init()(v26);
  v27 = sub_1000085EC(&qword_100021030, (uint64_t (*)(uint64_t))&type metadata accessor for ButtonStyleConfiguration.Label, (uint64_t)&protocol conformance descriptor for ButtonStyleConfiguration.Label);
  v28 = sub_1000085EC(&qword_100021038, (uint64_t (*)(uint64_t))&type metadata accessor for BorderlessButtonStyle, (uint64_t)&protocol conformance descriptor for BorderlessButtonStyle);
  View.buttonStyle<A>(_:)(v9, v10, v7, v27, v28);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v12, v10);
  if (qword_100020A20 != -1)
    swift_once(&qword_100020A20, sub_10000C970);
  v29 = qword_100021148;
  KeyPath = swift_getKeyPath(&unk_1000199A8);
  v32 = v60;
  v31 = v61;
  (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v17, v15, v61);
  v33 = (uint64_t *)&v17[*(int *)(v57 + 36)];
  *v33 = KeyPath;
  v33[1] = v29;
  v34 = *(uint64_t (**)(char *, uint64_t))(v32 + 8);
  swift_retain(v29);
  v35 = v34(v15, v31);
  v36 = (uint64_t)v66;
  static SymbolRenderingMode.palette.getter(v35);
  v37 = type metadata accessor for SymbolRenderingMode(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v36, 0, 1, v37);
  v38 = swift_getKeyPath(&unk_1000199D8);
  v39 = (uint64_t *)&v19[*(int *)(v59 + 36)];
  v40 = sub_100006A30(&qword_100021040);
  sub_10000C6E4(v36, (uint64_t)v39 + *(int *)(v40 + 28), &qword_100020E98);
  *v39 = v38;
  sub_10000C6E4((uint64_t)v17, (uint64_t)v19, &qword_100021008);
  sub_10000C728(v36, &qword_100020E98);
  sub_10000C728((uint64_t)v17, &qword_100021008);
  sub_10000C6E4((uint64_t)v19, (uint64_t)v21, &qword_100021010);
  v41 = &v21[*(int *)(v62 + 36)];
  v42 = v67;
  v43 = v68;
  *(_QWORD *)v41 = v67;
  *((_QWORD *)v41 + 1) = v43;
  swift_retain(v42);
  swift_retain(v43);
  v44 = sub_10000C728((uint64_t)v19, &qword_100021010);
  if ((ButtonStyleConfiguration.isPressed.getter(v44) & 1) != 0)
    v45 = 1.2;
  else
    v45 = 1.0;
  v46 = static UnitPoint.center.getter();
  v48 = v47;
  sub_10000C6E4((uint64_t)v21, (uint64_t)v23, &qword_100021018);
  v49 = &v23[*(int *)(v63 + 36)];
  *(double *)v49 = v45;
  *((double *)v49 + 1) = v45;
  *((double *)v49 + 2) = v46;
  *((_QWORD *)v49 + 3) = v48;
  v50 = sub_10000C728((uint64_t)v21, &qword_100021018);
  v51 = static Animation.easeOut(duration:)(v50, 0.2);
  v52 = ButtonStyleConfiguration.isPressed.getter(v51);
  v53 = v65;
  sub_10000C6E4((uint64_t)v23, v65, &qword_100021020);
  v54 = v53 + *(int *)(v64 + 36);
  *(_QWORD *)v54 = v51;
  *(_BYTE *)(v54 + 8) = v52 & 1;
  sub_10000C728((uint64_t)v23, &qword_100021020);
  return sub_100015B34(v53, v70);
}

uint64_t sub_100015A80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_100015538(a1, *v2, v2[1], a2);
}

uint64_t sub_100015A90()
{
  return EnvironmentValues.symbolRenderingMode.getter();
}

uint64_t sub_100015AB0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = sub_100006A30(&qword_100020E98);
  __chkstk_darwin(v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C6E4(a1, (uint64_t)v4, &qword_100020E98);
  return EnvironmentValues.symbolRenderingMode.setter(v4);
}

uint64_t sub_100015B34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006A30(&qword_100021028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100015B80()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021048;
  if (!qword_100021048)
  {
    v1 = sub_1000067D4(&qword_100021028);
    sub_100015C04();
    sub_1000091DC(&qword_100021098, &qword_1000210A0, (uint64_t)&protocol conformance descriptor for _AnimationModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100021048);
  }
  return result;
}

unint64_t sub_100015C04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021050;
  if (!qword_100021050)
  {
    v1 = sub_1000067D4(&qword_100021020);
    sub_100015C70();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100021050);
  }
  return result;
}

unint64_t sub_100015C70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021058;
  if (!qword_100021058)
  {
    v1 = sub_1000067D4(&qword_100021018);
    sub_100015CF4();
    sub_1000091DC(&qword_100021088, &qword_100021090, (uint64_t)&protocol conformance descriptor for _ForegroundStyleModifier2<A, B>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100021058);
  }
  return result;
}

unint64_t sub_100015CF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021060;
  if (!qword_100021060)
  {
    v1 = sub_1000067D4(&qword_100021010);
    sub_100015D78();
    sub_1000091DC(&qword_100021080, &qword_100021040, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100021060);
  }
  return result;
}

unint64_t sub_100015D78()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_100021068;
  if (!qword_100021068)
  {
    v1 = sub_1000067D4(&qword_100021008);
    v2[0] = type metadata accessor for ButtonStyleConfiguration.Label(255);
    v2[1] = type metadata accessor for BorderlessButtonStyle(255);
    v2[2] = sub_1000085EC(&qword_100021030, (uint64_t (*)(uint64_t))&type metadata accessor for ButtonStyleConfiguration.Label, (uint64_t)&protocol conformance descriptor for ButtonStyleConfiguration.Label);
    v2[3] = sub_1000085EC(&qword_100021038, (uint64_t (*)(uint64_t))&type metadata accessor for BorderlessButtonStyle, (uint64_t)&protocol conformance descriptor for BorderlessButtonStyle);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>, 1);
    sub_1000091DC(&qword_100021070, &qword_100021078, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100021068);
  }
  return result;
}

uint64_t sub_100015E80()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC12Print_CenterP33_CC0061141BF95813B446B8436E7533E119ResourceBundleClass);
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__uuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_uuid");
}

id objc_msgSend_addAttributes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttributes:range:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_authInfoRequired(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authInfoRequired");
}

id objc_msgSend_browseInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "browseInfo");
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "category");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_deviceURI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceURI");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayName");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "host");
}

id objc_msgSend_iCloudPrinters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iCloudPrinters");
}

id objc_msgSend_initJob_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initJob:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_localJobID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localJobID");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "location");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_printerInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "printerInfo");
}

id objc_msgSend_printerURI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "printerURI");
}

id objc_msgSend_printerURLs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "printerURLs");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheme");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondaryLabelColor");
}

id objc_msgSend_setPrinterInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrinterInfo:");
}

id objc_msgSend_set_uuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_uuid:");
}

id objc_msgSend_smallSystemFontSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "smallSystemFontSize");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_updatableState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatableState");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuid");
}
