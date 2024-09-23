_QWORD *sub_100002740@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100002750(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void type metadata accessor for AVAudioDeviceTestSequenceOutputMode()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_10002DAE0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100028A48);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10002DAE0);
  }
}

void sub_1000027B4(uint64_t a1)
{
  sub_100002808(a1, 0x800000010001E910, &qword_1000353B0);
}

void sub_1000027D0(uint64_t a1)
{
  sub_100002808(a1, 0x800000010001EAA0, &qword_1000353B8);
}

void sub_1000027EC(uint64_t a1)
{
  sub_100002808(a1, 0x800000010001EA70, &qword_1000353C0);
}

void sub_100002808(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  NSString v4;
  id v5;

  v4 = String._bridgeToObjectiveC()();
  v5 = objc_msgSend((id)objc_opt_self(CBUUID), "UUIDWithString:", v4);

  *a3 = v5;
}

id sub_10000286C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
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
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void *v24;
  id v25;
  Class isa;
  id result;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  char *v37;
  void *v38;
  uint64_t v39;
  id v40;
  Class v41;
  void *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD aBlock[5];
  uint64_t v68;

  v66 = a3;
  v8 = type metadata accessor for DispatchWorkItemFlags(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for DispatchQoS(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for DispatchTime(0);
  v17 = __chkstk_darwin(v16);
  v18 = __chkstk_darwin(v17);
  v22 = &v4[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxSerial];
  if (*(_QWORD *)&v4[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxSerial + 8])
  {
    v23 = static os_log_type_t.fault.getter(v18);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    os_log(_:dso:log:_:_:)(v23, &_mh_execute_header, qword_1000353C8, "connectToAudioBox(withSerial:completion:) can only be called once", 65, 2, &_swiftEmptyArrayStorage);
    v24 = (void *)*sub_10000ACF4(&v4[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate], *(_QWORD *)&v4[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24]);
    v25 = objc_msgSend(v24, "result");
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v25, "setStatusCode:", isa);

    return objc_msgSend(v24, "setFinished:", 1);
  }
  else
  {
    v57 = v21;
    v58 = v20;
    v60 = (char *)&v57 - v19;
    v61 = v18;
    v62 = v15;
    v63 = v13;
    v64 = v11;
    v65 = v9;
    v59 = v8;
    *(_QWORD *)v22 = a1;
    *((_QWORD *)v22 + 1) = a2;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRelease(0);
    v28 = (uint64_t *)&v4[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxConnectionCompletion];
    v29 = *(_QWORD *)&v4[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxConnectionCompletion];
    v30 = *(_QWORD *)&v4[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxConnectionCompletion + 8];
    *v28 = v66;
    v28[1] = a4;
    swift_retain(a4);
    result = (id)sub_10000ADB8(v29, v30);
    v31 = *(void **)&v4[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_centralManager];
    if (v31)
    {
      v32 = v4;
      v33 = sub_100009A34(&qword_10002E128);
      v34 = swift_allocObject(v33, 40, 7);
      *(_OWORD *)(v34 + 16) = xmmword_10001F900;
      v35 = qword_10002DA60;
      v36 = v31;
      v37 = v64;
      v66 = v12;
      if (v35 != -1)
        swift_once(&qword_10002DA60, sub_1000027B4);
      v38 = (void *)qword_1000353B0;
      *(_QWORD *)(v34 + 32) = qword_1000353B0;
      aBlock[0] = v34;
      specialized Array._endMutation()();
      v39 = aBlock[0];
      sub_10000B120(0, &qword_10002E0F0, CBUUID_ptr);
      v40 = v38;
      v41 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v39);
      objc_msgSend(v36, "scanForPeripheralsWithServices:options:", v41, 0);

      sub_10000B120(0, &qword_10002E1B0, OS_dispatch_queue_ptr);
      v42 = (void *)static OS_dispatch_queue.main.getter();
      v43 = v57;
      static DispatchTime.now()();
      v44 = v60;
      + infix(_:_:)(v43, &v32[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_peripheralScanTimeout]);
      v58 = *(_QWORD *)(v58 + 8);
      v45 = v61;
      ((void (*)(uint64_t, uint64_t))v58)(v43, v61);
      v46 = swift_allocObject(&unk_100028B60, 24, 7);
      *(_QWORD *)(v46 + 16) = v32;
      aBlock[4] = sub_10000B21C;
      v68 = v46;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100002EA8;
      aBlock[3] = &unk_100028B78;
      v47 = _Block_copy(aBlock);
      v48 = v68;
      v49 = v32;
      v50 = swift_release(v48);
      v51 = v62;
      static DispatchQoS.unspecified.getter(v50);
      aBlock[0] = &_swiftEmptyArrayStorage;
      v52 = sub_10000B19C(&qword_10002E1B8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      v53 = sub_100009A34(&qword_10002E1C0);
      v54 = sub_10000B1DC(&qword_10002E1C8, &qword_10002E1C0, (uint64_t)&protocol conformance descriptor for [A]);
      v55 = v37;
      v56 = v59;
      dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v53, v54, v59, v52);
      OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v44, v51, v55, v47);
      _Block_release(v47);

      (*(void (**)(char *, uint64_t))(v65 + 8))(v55, v56);
      (*(void (**)(char *, uint64_t))(v63 + 8))(v51, v66);
      return (id)((uint64_t (*)(char *, uint64_t))v58)(v44, v45);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

char *sub_100002D78(char *result)
{
  char *v1;
  uint64_t v2;
  void *v3;
  id v4;
  Class isa;

  if (!*(_QWORD *)&result[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBox])
  {
    v1 = result;
    v2 = static os_log_type_t.error.getter(result);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    os_log(_:dso:log:_:_:)(v2, &_mh_execute_header, qword_1000353C8, "Timed out scanning for peripherals", 34, 2, &_swiftEmptyArrayStorage);
    result = *(char **)&v1[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_centralManager];
    if (result)
    {
      objc_msgSend(result, "stopScan");
      v3 = (void *)*sub_10000ACF4(&v1[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate], *(_QWORD *)&v1[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24]);
      v4 = objc_msgSend(v3, "result");
      isa = Int._bridgeToObjectiveC()().super.super.isa;
      objc_msgSend(v4, "setStatusCode:", isa);

      return (char *)objc_msgSend(v3, "setFinished:", 1);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_100002EA8(uint64_t a1)
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

uint64_t sub_100002ED4(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t), uint64_t a4)
{
  char *v4;
  char *v5;
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
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD aBlock[5];
  uint64_t v46;

  v5 = v4;
  v38 = a3;
  v41 = type metadata accessor for DispatchWorkItemFlags(0);
  v44 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v40 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchQoS(0);
  v42 = *(_QWORD *)(v10 - 8);
  v43 = v10;
  __chkstk_darwin(v10);
  v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DispatchTime(0);
  v14 = *(_QWORD *)(v13 - 8);
  v39 = v13;
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)&v37 - v18;
  v20 = &v5[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_expectedAudioBoxToken];
  v21 = *(_QWORD *)&v5[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_expectedAudioBoxToken + 8];
  *(_QWORD *)v20 = a1;
  *((_QWORD *)v20 + 1) = a2;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRelease(v21);
  v22 = &v5[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxAuthenticationCompletion];
  v23 = *(_QWORD *)&v5[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxAuthenticationCompletion];
  v24 = *(_QWORD *)&v5[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxAuthenticationCompletion + 8];
  *(_QWORD *)v22 = v38;
  *((_QWORD *)v22 + 1) = a4;
  swift_retain(a4);
  sub_10000ADB8(v23, v24);
  sub_10000B120(0, &qword_10002E1B0, OS_dispatch_queue_ptr);
  v25 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)(v17, &v5[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_authenticationTimeout]);
  v38 = *(void (**)(char *, uint64_t))(v14 + 8);
  v38(v17, v13);
  v26 = swift_allocObject(&unk_100028B10, 24, 7);
  *(_QWORD *)(v26 + 16) = v5;
  aBlock[4] = sub_10000B17C;
  v46 = v26;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100002EA8;
  aBlock[3] = &unk_100028B28;
  v27 = _Block_copy(aBlock);
  v28 = v46;
  v29 = v5;
  v30 = swift_release(v28);
  static DispatchQoS.unspecified.getter(v30);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v31 = sub_10000B19C(&qword_10002E1B8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v32 = sub_100009A34(&qword_10002E1C0);
  v33 = sub_10000B1DC(&qword_10002E1C8, &qword_10002E1C0, (uint64_t)&protocol conformance descriptor for [A]);
  v35 = v40;
  v34 = v41;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v32, v33, v41, v31);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v19, v12, v35, v27);
  _Block_release(v27);

  (*(void (**)(char *, uint64_t))(v44 + 8))(v35, v34);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v12, v43);
  return ((uint64_t (*)(char *, uint64_t))v38)(v19, v39);
}

_BYTE *sub_1000031E4(_BYTE *result)
{
  _BYTE *v1;
  uint64_t v2;
  void *v3;
  id v4;
  Class isa;

  if ((result[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_isAudioBoxAuthenticated] & 1) == 0)
  {
    v1 = result;
    v2 = static os_log_type_t.error.getter(result);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    os_log(_:dso:log:_:_:)(v2, &_mh_execute_header, qword_1000353C8, "Timed out authenticating AudioBox", 33, 2, &_swiftEmptyArrayStorage);
    v3 = (void *)*sub_10000ACF4(&v1[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate], *(_QWORD *)&v1[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24]);
    v4 = objc_msgSend(v3, "result");
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v4, "setStatusCode:", isa);

    return objc_msgSend(v3, "setFinished:", 1);
  }
  return result;
}

id sub_1000032F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  Class isa;
  uint64_t v29;

  v3 = v2;
  v5 = a1;
  v6 = (_QWORD *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_expectedAudioBoxToken);
  v7 = *(_QWORD *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_expectedAudioBoxToken + 8);
  if (v7
    && (*v6 == a1 ? (v8 = v7 == a2) : (v8 = 0),
        v8 || (a1 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, *v6, v7, 0), (a1 & 1) != 0)))
  {
    v9 = static os_log_type_t.default.getter(a1);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    v10 = qword_1000353C8;
    v11 = sub_100009A34(&qword_10002E0B0);
    v12 = swift_allocObject(v11, 72, 7);
    *(_OWORD *)(v12 + 16) = xmmword_10001F910;
    *(_QWORD *)(v12 + 56) = &type metadata for String;
    *(_QWORD *)(v12 + 64) = sub_100009A78();
    *(_QWORD *)(v12 + 32) = v5;
    *(_QWORD *)(v12 + 40) = a2;
    swift_bridgeObjectRetain(a2);
    os_log(_:dso:log:_:_:)(v9, &_mh_execute_header, v10, "Successfully authenticated AudioBox with token: %@", 50, 2, v12);
    swift_bridgeObjectRelease(v12);
    *(_BYTE *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_isAudioBoxAuthenticated) = 1;
    v13 = (uint64_t *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxAuthenticationCompletion);
    v14 = *(void (**)(uint64_t))(v3
                                         + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxAuthenticationCompletion);
    if (v14)
    {
      v15 = v13[1];
      v16 = swift_retain(v15);
      v14(v16);
      sub_10000ADB8((uint64_t)v14, v15);
      v17 = *v13;
    }
    else
    {
      v17 = 0;
    }
    v29 = v13[1];
    *v13 = 0;
    v13[1] = 0;
    return (id)sub_10000ADB8(v17, v29);
  }
  else
  {
    v18 = static os_log_type_t.error.getter(a1);
    v19 = sub_100009A34(&qword_10002E0B0);
    v20 = swift_allocObject(v19, 112, 7);
    *(_OWORD *)(v20 + 16) = xmmword_10001F920;
    *(_QWORD *)(v20 + 56) = &type metadata for String;
    result = (id)sub_100009A78();
    *(_QWORD *)(v20 + 64) = result;
    *(_QWORD *)(v20 + 32) = v5;
    *(_QWORD *)(v20 + 40) = a2;
    v22 = v6[1];
    if (v22)
    {
      v23 = *v6;
      *(_QWORD *)(v20 + 96) = &type metadata for String;
      *(_QWORD *)(v20 + 104) = result;
      *(_QWORD *)(v20 + 72) = v23;
      *(_QWORD *)(v20 + 80) = v22;
      sub_10000B120(0, (unint64_t *)&qword_10002E1A8, OS_os_log_ptr);
      swift_bridgeObjectRetain(a2);
      v24 = swift_bridgeObjectRetain(v22);
      v25 = (void *)static OS_os_log.default.getter(v24);
      os_log(_:dso:log:_:_:)(v18, &_mh_execute_header, v25, "Failed to authenticate AudioBox with token: %@ (expected token: %@)", 67, 2, v20);
      swift_bridgeObjectRelease(v20);

      v26 = (void *)*sub_10000ACF4((_QWORD *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
      v27 = objc_msgSend(v26, "result");
      isa = Int._bridgeToObjectiveC()().super.super.isa;
      objc_msgSend(v27, "setStatusCode:", isa);

      return objc_msgSend(v26, "setFinished:", 1);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void sub_1000035BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  Class isa;
  _QWORD v19[5];

  v2 = v1;
  v4 = type metadata accessor for JSONEncoder(0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  v5 = JSONEncoder.init()();
  sub_10000B08C(a1, (uint64_t)v19);
  v6 = sub_10000B0C8();
  v7 = dispatch thunk of JSONEncoder.encode<A>(_:)(v19, &type metadata for OutgoingMessage, v6);
  v9 = v8;
  v10 = swift_release(v5);
  v11 = *(void **)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBox);
  if (v11
    && (v12 = *(void **)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagingCharacteristic)) != 0)
  {
    sub_1000089F0(v7, v9);
    v13 = v11;
    v14 = v12;
    sub_100009248(v7, v9, v13, (uint64_t)v14);
    sub_100008A34(v7, v9);
    sub_100008A34(v7, v9);

  }
  else
  {
    v15 = static os_log_type_t.error.getter(v10);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    os_log(_:dso:log:_:_:)(v15, &_mh_execute_header, qword_1000353C8, "Error: audioBox or messagingCharacteristic is nil", 49, 2, &_swiftEmptyArrayStorage);
    v16 = (void *)*sub_10000ACF4((_QWORD *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    v17 = objc_msgSend(v16, "result");
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v17, "setStatusCode:", isa);

    objc_msgSend(v16, "setFinished:", 1);
    sub_100008A34(v7, v9);
  }
}

uint64_t sub_1000038FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
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
  void *v21;
  id v22;
  Class isa;
  uint64_t v24;
  _BYTE v26[56];
  _QWORD v27[6];
  char v28;

  v1 = v0;
  v2 = OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagePacketsReceived;
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagePacketsReceived);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain(*(_QWORD *)(v0
                                       + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagePacketsReceived));
    v5 = (unint64_t *)(v3 + 40);
    do
    {
      v6 = *(v5 - 1);
      v7 = *v5;
      sub_1000089F0(v6, *v5);
      Data.append(_:)(v6, v7);
      sub_100008A34(v6, v7);
      v5 += 2;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease(v3);
    v3 = *(_QWORD *)(v0 + v2);
  }
  *(_QWORD *)(v0 + v2) = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease(v3);
  v8 = type metadata accessor for JSONDecoder(0);
  swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
  v9 = JSONDecoder.init()();
  sub_1000089F0(0, 0xC000000000000000);
  v10 = sub_10000AEE0();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)(v27, &type metadata for IncomingMessage, 0, 0xC000000000000000, &type metadata for IncomingMessage, v10);
  sub_100008A34(0, 0xC000000000000000);
  swift_release(v9);
  v11 = sub_10000AF24((uint64_t)v27, (uint64_t)v26);
  v12 = static os_log_type_t.default.getter(v11);
  if (qword_10002DA78 != -1)
    swift_once(&qword_10002DA78, sub_100018040);
  v13 = qword_1000353C8;
  v14 = sub_100009A34(&qword_10002E0B0);
  v15 = swift_allocObject(v14, 72, 7);
  *(_OWORD *)(v15 + 16) = xmmword_10001F910;
  sub_10000AF24((uint64_t)v26, (uint64_t)v27);
  sub_10000AFD8((uint64_t)v26, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000AF60);
  v16 = String.init<A>(describing:)(v27, &type metadata for IncomingMessage);
  v18 = v17;
  *(_QWORD *)(v15 + 56) = &type metadata for String;
  *(_QWORD *)(v15 + 64) = sub_100009A78();
  *(_QWORD *)(v15 + 32) = v16;
  *(_QWORD *)(v15 + 40) = v18;
  os_log(_:dso:log:_:_:)(v12, &_mh_execute_header, v13, "Received message: %@", 20, 2, v15);
  swift_bridgeObjectRelease(v15);
  v19 = sub_10000AF24((uint64_t)v26, (uint64_t)v27);
  if (!v28)
  {
    if (*(_BYTE *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_isAudioBoxAuthenticated))
    {
      v24 = static os_log_type_t.error.getter(v19);
      os_log(_:dso:log:_:_:)(v24, &_mh_execute_header, qword_1000353C8, "AudioBox is already authenticated", 33, 2, &_swiftEmptyArrayStorage);
      goto LABEL_13;
    }
LABEL_12:
    sub_10000ACF4((_QWORD *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    sub_100019BA4((uint64_t)v26);
    goto LABEL_13;
  }
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_isAudioBoxAuthenticated) & 1) != 0)
    goto LABEL_12;
  v20 = static os_log_type_t.error.getter(v19);
  os_log(_:dso:log:_:_:)(v20, &_mh_execute_header, qword_1000353C8, "Received bad message while AudioBox is unauthenticated", 54, 2, &_swiftEmptyArrayStorage);
  v21 = (void *)*sub_10000ACF4((_QWORD *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
  v22 = objc_msgSend(v21, "result");
  isa = Int._bridgeToObjectiveC()().super.super.isa;
  objc_msgSend(v22, "setStatusCode:", isa);

  objc_msgSend(v21, "setFinished:", 1);
LABEL_13:
  sub_10000AFD8((uint64_t)v26, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B014);
  return sub_100008A34(0, 0xC000000000000000);
}

void sub_100003DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;

  static os_log_type_t.default.getter(a1);
  if (qword_10002DA78 != -1)
    swift_once(&qword_10002DA78, sub_100018040);
  v7 = sub_100009A34(&qword_10002E0B0);
  v8 = swift_allocObject(v7, 112, 7);
  *(_OWORD *)(v8 + 16) = xmmword_10001F920;
  *(_QWORD *)(v8 + 56) = &type metadata for String;
  *(_QWORD *)(v8 + 64) = sub_100009A78();
  *(_QWORD *)(v8 + 32) = a1;
  *(_QWORD *)(v8 + 40) = a2;
  __asm { BR              X10 }
}

void sub_10000414C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19)
{
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  _BYTE v24[24];

  v20 = *(void **)(v19 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capChannel);
  if (v20)
  {
    v21 = objc_msgSend(v20, "outputStream");
    if (v21)
    {
      v23 = v21;
      if (objc_msgSend(v21, "hasSpaceAvailable"))
      {
        v22 = v19 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataToSend;
        swift_beginAccess(v19 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataToSend, v24, 1, 0);
        __asm { BR              X10 }
      }

    }
  }
}

uint64_t sub_100004AB8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[24];
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_expectedFiles);
  v2 = v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataReceived;
  result = swift_beginAccess(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataReceived, v7, 0, 0);
  v4 = *v1;
  if (*(_QWORD *)(*v1 + 16))
  {
    v5 = *(_QWORD *)(v4 + 40);
    v6 = *(_QWORD *)(v4 + 64);
    v8 = *(_QWORD *)(v4 + 32);
    v9 = v5;
    v10 = *(_OWORD *)(v4 + 48);
    v11 = v6;
    __asm { BR              X9 }
  }
  return result;
}

id sub_100004CD0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  id result;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
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
  uint64_t v31;
  void *v32;
  id v33;
  unsigned int v34;
  uint64_t v35;
  _QWORD v36[2];
  __int128 v37;
  char v38;

  sub_1000095BC(a1, a2);
  v9 = v8;
  v11 = a3[3];
  v10 = a3[4];
  v12 = v7 == v11 && v8 == v10;
  if (v12 || (v13 = v7, v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, a3[3], a3[4], 0), (v14 & 1) != 0))
  {
    swift_bridgeObjectRelease(v9);
    sub_10000ACF4((_QWORD *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    return sub_10001A720(*a3, a3[1], a1, a2, 0);
  }
  else
  {
    v34 = static os_log_type_t.error.getter(v14);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    v16 = qword_1000353C8;
    v35 = sub_100009A34(&qword_10002E0B0);
    v17 = swift_allocObject(v35, 112, 7);
    *(_OWORD *)(v17 + 16) = xmmword_10001F920;
    *(_QWORD *)(v17 + 56) = &type metadata for String;
    v18 = sub_100009A78();
    *(_QWORD *)(v17 + 32) = v11;
    *(_QWORD *)(v17 + 40) = v10;
    *(_QWORD *)(v17 + 96) = &type metadata for String;
    *(_QWORD *)(v17 + 104) = v18;
    *(_QWORD *)(v17 + 64) = v18;
    *(_QWORD *)(v17 + 72) = v13;
    *(_QWORD *)(v17 + 80) = v9;
    swift_bridgeObjectRetain(v10);
    os_log(_:dso:log:_:_:)(v34, &_mh_execute_header, v16, "File checksum does not match (expected %@, calculated %@)", 57, 2, v17);
    swift_bridgeObjectRelease(v17);
    v19 = sub_10000ACF4((_QWORD *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v3 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    v21 = *a3;
    v20 = a3[1];
    v22 = sub_10000AE9C();
    v23 = swift_allocError(&type metadata for AudioBoxBluetoothManager.ProtocolError, v22, 0, 0);
    v24 = *v19;
    v25 = swift_errorRetain(v23);
    v26 = static os_log_type_t.error.getter(v25);
    v27 = qword_1000353C8;
    v28 = swift_allocObject(v35, 72, 7);
    *(_OWORD *)(v28 + 16) = xmmword_10001F910;
    v36[0] = v23;
    swift_errorRetain(v23);
    v29 = sub_100009A34((uint64_t *)&unk_10002EC10);
    v30 = String.init<A>(describing:)(v36, v29);
    *(_QWORD *)(v28 + 56) = &type metadata for String;
    *(_QWORD *)(v28 + 64) = v18;
    *(_QWORD *)(v28 + 32) = v30;
    *(_QWORD *)(v28 + 40) = v31;
    os_log(_:dso:log:_:_:)(v26, &_mh_execute_header, v27, "Error receiving file: %@", 24, 2, v28);
    result = (id)swift_bridgeObjectRelease(v28);
    v36[0] = v21;
    v36[1] = v20;
    v37 = xmmword_10001F950;
    v38 = 1;
    v32 = *(void **)(v24 + OBJC_IVAR___AudioBoxController_bluetoothManager);
    if (v32)
    {
      swift_bridgeObjectRetain(v20);
      v33 = v32;
      sub_1000035BC((uint64_t)v36);
      swift_bridgeObjectRelease(v20);

      swift_errorRelease(v23);
      return (id)swift_errorRelease(v23);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

char *sub_100004F88(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char *result;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  unint64_t v40;
  _QWORD *v41;

  v2 = type metadata accessor for SHA256Digest(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000B19C(&qword_10002E188, v6, (uint64_t)&protocol conformance descriptor for SHA256Digest);
  v8 = dispatch thunk of Sequence.underestimatedCount.getter(v2, v7);
  v41 = &_swiftEmptyArrayStorage;
  sub_100009018(0, v8 & ~(v8 >> 63), 0);
  v9 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  result = (char *)dispatch thunk of Sequence.makeIterator()(&v39, v2, v7);
  if ((v8 & 0x8000000000000000) == 0)
  {
    v11 = v40;
    if (v8)
    {
      v12 = *(_QWORD *)(v39 + 16);
      v37 = v39;
      *(_QWORD *)&v38 = v12;
      v36 = v39 + 32;
      v35 = xmmword_10001F910;
      v13 = v40;
      while ((_QWORD)v38 != v13)
      {
        if ((v11 & 0x8000000000000000) != 0)
          goto LABEL_21;
        if (v13 >= *(_QWORD *)(v37 + 16))
          goto LABEL_22;
        v14 = *(_BYTE *)(v36 + v13);
        v15 = sub_100009A34(&qword_10002E0B0);
        v16 = swift_allocObject(v15, 72, 7);
        *(_OWORD *)(v16 + 16) = v35;
        *(_QWORD *)(v16 + 56) = &type metadata for UInt8;
        *(_QWORD *)(v16 + 64) = &protocol witness table for UInt8;
        *(_BYTE *)(v16 + 32) = v14;
        result = (char *)String.init(format:_:)(0x786868323025, 0xE600000000000000, v16);
        v17 = result;
        v19 = v18;
        v41 = v9;
        v21 = v9[2];
        v20 = v9[3];
        if (v21 >= v20 >> 1)
        {
          result = sub_100009018((char *)(v20 > 1), v21 + 1, 1);
          v9 = v41;
        }
        v9[2] = v21 + 1;
        v22 = &v9[2 * v21];
        v22[4] = v17;
        v22[5] = v19;
        ++v13;
        if (!--v8)
        {
          v40 = v13;
          goto LABEL_12;
        }
      }
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      __break(1u);
    }
    else
    {
      v13 = v40;
LABEL_12:
      v23 = v39;
      v24 = *(_QWORD *)(v39 + 16);
      if (v13 == v24)
      {
LABEL_13:
        swift_bridgeObjectRelease(v23);
        return (char *)v9;
      }
      v38 = xmmword_10001F910;
      while (v13 < v24)
      {
        v25 = *(_BYTE *)(v23 + 32 + v13);
        v40 = v13 + 1;
        v26 = sub_100009A34(&qword_10002E0B0);
        v27 = swift_allocObject(v26, 72, 7);
        *(_OWORD *)(v27 + 16) = v38;
        *(_QWORD *)(v27 + 56) = &type metadata for UInt8;
        *(_QWORD *)(v27 + 64) = &protocol witness table for UInt8;
        *(_BYTE *)(v27 + 32) = v25;
        result = (char *)String.init(format:_:)(0x786868323025, 0xE600000000000000, v27);
        v28 = result;
        v30 = v29;
        v41 = v9;
        v32 = v9[2];
        v31 = v9[3];
        if (v32 >= v31 >> 1)
        {
          result = sub_100009018((char *)(v31 > 1), v32 + 1, 1);
          v9 = v41;
        }
        v9[2] = v32 + 1;
        v33 = &v9[2 * v32];
        v33[4] = v28;
        v33[5] = v30;
        v13 = v40;
        v24 = *(_QWORD *)(v23 + 16);
        if (v40 == v24)
          goto LABEL_13;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_1000052E0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioBoxBluetoothManager(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100005490()
{
  return type metadata accessor for AudioBoxBluetoothManager(0);
}

uint64_t type metadata accessor for AudioBoxBluetoothManager(uint64_t a1)
{
  uint64_t result;

  result = qword_10002DF78;
  if (!qword_10002DF78)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AudioBoxBluetoothManager);
  return result;
}

uint64_t sub_1000054D4(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  void *v15;
  void *v16;
  char *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = "(";
  result = type metadata accessor for DispatchTimeInterval(319);
  if (v3 <= 0x3F)
  {
    v5 = *(_QWORD *)(result - 8) + 64;
    v6 = v5;
    v7 = &unk_10001FA18;
    v8 = &unk_10001FA18;
    v9 = &unk_10001FA18;
    v10 = &unk_10001FA18;
    v11 = &unk_10001FA18;
    v12 = &unk_10001FA30;
    v13 = &unk_10001FA30;
    v14 = (char *)&value witness table for Builtin.BridgeObject + 64;
    v15 = &unk_10001FA48;
    v16 = &unk_10001FA48;
    v17 = (char *)&value witness table for Builtin.BridgeObject + 64;
    v18 = (char *)&value witness table for Builtin.BridgeObject + 64;
    v19 = &unk_10001FA60;
    v20 = &unk_10001FA60;
    v21 = &unk_10001FA30;
    v22 = &unk_10001FA30;
    v23 = &unk_10001FA30;
    return swift_updateClassMetadata2(a1, 256, 20, &v4, a1 + 80);
  }
  return result;
}

id sub_100005598(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Class isa;
  uint64_t v16;
  uint64_t *v17;
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;

  switch((unint64_t)objc_msgSend(a1, "state"))
  {
    case 1uLL:
      v2 = static os_log_type_t.default.getter();
      if (qword_10002DA78 != -1)
        swift_once(&qword_10002DA78, sub_100018040);
      return (id)os_log(_:dso:log:_:_:)(v2, &_mh_execute_header, qword_1000353C8, "Bluetooth connection is resetting", 33, 2, &_swiftEmptyArrayStorage);
    case 2uLL:
      v7 = static os_log_type_t.error.getter();
      if (qword_10002DA78 != -1)
        swift_once(&qword_10002DA78, sub_100018040);
      os_log(_:dso:log:_:_:)(v7, &_mh_execute_header, qword_1000353C8, "Bluetooth is unsupported", 24, 2, &_swiftEmptyArrayStorage);
      v5 = (void *)*sub_10000ACF4((_QWORD *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
      v6 = objc_msgSend(v5, "result");
      goto LABEL_17;
    case 3uLL:
      v8 = sub_10000B120(0, &qword_10002E160, CBCentralManager_ptr);
      v9 = objc_msgSend((id)swift_getObjCClassFromMetadata(v8), "authorization");
      v10 = static os_log_type_t.error.getter();
      if (qword_10002DA78 != -1)
        swift_once(&qword_10002DA78, sub_100018040);
      v11 = qword_1000353C8;
      v12 = sub_100009A34(&qword_10002E0B0);
      v13 = swift_allocObject(v12, 72, 7);
      *(_OWORD *)(v13 + 16) = xmmword_10001F910;
      *(_QWORD *)(v13 + 56) = &type metadata for Int;
      *(_QWORD *)(v13 + 64) = &protocol witness table for Int;
      *(_QWORD *)(v13 + 32) = v9;
      os_log(_:dso:log:_:_:)(v10, &_mh_execute_header, v11, "Bluetooth is unauthorized (CBManagerAuthorization %d)", v23);
      swift_bridgeObjectRelease(v13);
      v5 = (void *)*sub_10000ACF4((_QWORD *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
      v6 = objc_msgSend(v5, "result");
      goto LABEL_17;
    case 4uLL:
      v14 = static os_log_type_t.error.getter();
      if (qword_10002DA78 != -1)
        swift_once(&qword_10002DA78, sub_100018040);
      os_log(_:dso:log:_:_:)(v14, &_mh_execute_header, qword_1000353C8, "Bluetooth is powered off", 24, 2, &_swiftEmptyArrayStorage);
      v5 = (void *)*sub_10000ACF4((_QWORD *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
      v6 = objc_msgSend(v5, "result");
      goto LABEL_17;
    case 5uLL:
      v16 = static os_log_type_t.default.getter();
      if (qword_10002DA78 != -1)
        swift_once(&qword_10002DA78, sub_100018040);
      os_log(_:dso:log:_:_:)(v16, &_mh_execute_header, qword_1000353C8, "Bluetooth powered on", 20, 2, &_swiftEmptyArrayStorage);
      *(_BYTE *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_isBluetoothReady) = 1;
      v17 = (uint64_t *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_bluetoothReadyCallback);
      v18 = *(void (**)(uint64_t))(v1
                                           + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_bluetoothReadyCallback);
      if (v18)
      {
        v19 = v17[1];
        v20 = swift_retain(v19);
        v18(v20);
        sub_10000ADB8((uint64_t)v18, v19);
        v21 = *v17;
      }
      else
      {
        v21 = 0;
      }
      v22 = v17[1];
      *v17 = 0;
      v17[1] = 0;
      return (id)sub_10000ADB8(v21, v22);
    default:
      v4 = static os_log_type_t.error.getter();
      if (qword_10002DA78 != -1)
        swift_once(&qword_10002DA78, sub_100018040);
      os_log(_:dso:log:_:_:)(v4, &_mh_execute_header, qword_1000353C8, "Bluetooth state unknown", 23, 2, &_swiftEmptyArrayStorage);
      v5 = (void *)*sub_10000ACF4((_QWORD *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
      v6 = objc_msgSend(v5, "result");
LABEL_17:
      isa = Int._bridgeToObjectiveC()().super.super.isa;
      objc_msgSend(v6, "setStatusCode:", isa);

      return objc_msgSend(v5, "setFinished:", 1);
  }
}

uint64_t sub_100005AA4(uint64_t a1, uint64_t a2)
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
      sub_10000B120(0, &qword_10002E0F0, CBUUID_ptr);
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

unint64_t sub_100005C28(uint64_t a1)
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
  sub_100009A34(&qword_10002E150);
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
    sub_10000AE44(v7, (uint64_t)&v16);
    v8 = v16;
    v9 = v17;
    result = sub_10001C790(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_10000AE8C(&v18, (_OWORD *)(v4[7] + 32 * result));
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

void sub_100005F30(void *a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  Class isa;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  Class v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  unint64_t v54;
  Class v55;
  uint64_t v56;

  v5 = (void *)static os_log_type_t.debug.getter();
  if (qword_10002DA78 != -1)
LABEL_23:
    swift_once(&qword_10002DA78, sub_100018040);
  v6 = qword_1000353C8;
  v7 = sub_100009A34(&qword_10002E0B0);
  v8 = swift_allocObject(v7, 72, 7);
  *(_OWORD *)(v8 + 16) = xmmword_10001F910;
  *(_QWORD *)(v8 + 56) = &type metadata for String;
  v9 = sub_100009A78();
  *(_QWORD *)(v8 + 64) = v9;
  *(_QWORD *)(v8 + 32) = 0xD000000000000022;
  *(_QWORD *)(v8 + 40) = 0x800000010001EBD0;
  os_log(_:dso:log:_:_:)(v5, &_mh_execute_header, v6, "%@", 2, 2, v8);
  swift_bridgeObjectRelease(v8);
  if (a2)
  {
    v10 = swift_errorRetain(a2);
    v11 = static os_log_type_t.error.getter(v10);
    v12 = qword_1000353C8;
    v13 = swift_allocObject(v7, 72, 7);
    *(_OWORD *)(v13 + 16) = xmmword_10001F910;
    v56 = a2;
    swift_errorRetain(a2);
    v14 = sub_100009A34((uint64_t *)&unk_10002EC10);
    v15 = String.init<A>(describing:)(&v56, v14);
    *(_QWORD *)(v13 + 56) = &type metadata for String;
    *(_QWORD *)(v13 + 64) = v9;
    *(_QWORD *)(v13 + 32) = v15;
    *(_QWORD *)(v13 + 40) = v16;
    os_log(_:dso:log:_:_:)(v11, &_mh_execute_header, v12, "Error discovering services %@", 29, 2, v13);
    swift_bridgeObjectRelease(v13);
    v17 = (void *)*sub_10000ACF4((_QWORD *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    v18 = objc_msgSend(v17, "result");
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v18, "setStatusCode:", isa);

    objc_msgSend(v17, "setFinished:", 1);
    swift_errorRelease(a2);
    return;
  }
  v54 = v9;
  v20 = objc_msgSend(a1, "services");
  if (!v20)
    goto LABEL_29;
  v21 = v20;
  v51 = v7;
  v22 = sub_10000B120(0, &qword_10002E0E0, CBService_ptr);
  v23 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v21, v22);

  v52 = v2;
  v53 = a1;
  if (!((unint64_t)v23 >> 62))
  {
    v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v23);
    if (v24)
      goto LABEL_7;
    goto LABEL_28;
  }
  if (v23 < 0)
    v37 = v23;
  else
    v37 = v23 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v23);
  v24 = _CocoaArrayWrapper.endIndex.getter(v37);
  if (!v24)
  {
LABEL_28:
    swift_bridgeObjectRelease_n(v23, 2);
    v2 = v52;
    a1 = v53;
    v7 = v51;
LABEL_29:
    v38 = ((uint64_t (*)(void))static os_log_type_t.error.getter)();
    v39 = qword_1000353C8;
    v40 = swift_allocObject(v7, 72, 7);
    *(_OWORD *)(v40 + 16) = xmmword_10001F910;
    v41 = objc_msgSend(a1, "services");
    if (v41)
    {
      v42 = v41;
      v43 = sub_10000B120(0, &qword_10002E0E0, CBService_ptr);
      v44 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v42, v43);

    }
    else
    {
      v44 = 0;
    }
    v56 = v44;
    v45 = sub_100009A34(&qword_10002E120);
    v46 = String.init<A>(describing:)(&v56, v45);
    *(_QWORD *)(v40 + 56) = &type metadata for String;
    *(_QWORD *)(v40 + 64) = v54;
    *(_QWORD *)(v40 + 32) = v46;
    *(_QWORD *)(v40 + 40) = v47;
    os_log(_:dso:log:_:_:)(v38, &_mh_execute_header, v39, "Error: AudioBox service not found (discovered: %@)", 50, 2, v40);
    swift_bridgeObjectRelease(v40);
    v48 = (void *)*sub_10000ACF4((_QWORD *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    v49 = objc_msgSend(v48, "result");
    v50 = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v49, "setStatusCode:", v50);

    objc_msgSend(v48, "setFinished:", 1);
    return;
  }
LABEL_7:
  v2 = sub_10000B120(0, &qword_10002E0E8, NSObject_ptr);
  a1 = (void *)(v23 & 0xC000000000000001);
  v25 = 4;
  while (1)
  {
    a2 = v25 - 4;
    if (a1)
      v26 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v25 - 4, v23);
    else
      v26 = *(id *)(v23 + 8 * v25);
    v5 = v26;
    v27 = v25 - 3;
    if (__OFADD__(a2, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    v28 = objc_msgSend(v26, "UUID");
    if (qword_10002DA60 != -1)
      swift_once(&qword_10002DA60, sub_1000027B4);
    v29 = static NSObject.== infix(_:_:)(v28, qword_1000353B0);

    if ((v29 & 1) != 0)
      break;

    ++v25;
    if (v27 == v24)
      goto LABEL_28;
  }
  swift_bridgeObjectRelease_n(v23, 2);
  v30 = sub_100009A34(&qword_10002E128);
  v31 = swift_allocObject(v30, 48, 7);
  *(_OWORD *)(v31 + 16) = xmmword_10001F960;
  if (qword_10002DA68 != -1)
    swift_once(&qword_10002DA68, sub_1000027D0);
  v32 = (void *)qword_1000353B8;
  *(_QWORD *)(v31 + 32) = qword_1000353B8;
  v33 = qword_10002DA70;
  v34 = v32;
  if (v33 != -1)
    swift_once(&qword_10002DA70, sub_1000027EC);
  v35 = (void *)qword_1000353C0;
  *(_QWORD *)(v31 + 40) = qword_1000353C0;
  v56 = v31;
  specialized Array._endMutation()();
  sub_10000B120(0, &qword_10002E0F0, CBUUID_ptr);
  v36 = v35;
  v55 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v31);
  objc_msgSend(v53, "discoverCharacteristics:forService:", v55, v5);

}

void sub_10000659C(void *a1, id a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  Class isa;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  char v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  char v53;
  id v54;
  char v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  void (*v66)(uint64_t);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  Class v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;

  v5 = static os_log_type_t.debug.getter();
  if (qword_10002DA78 == -1)
    goto LABEL_2;
  while (1)
  {
    swift_once(&qword_10002DA78, sub_100018040);
LABEL_2:
    v6 = qword_1000353C8;
    v91 = sub_100009A34(&qword_10002E0B0);
    v7 = swift_allocObject(v91, 112, 7);
    *(_OWORD *)(v7 + 16) = xmmword_10001F920;
    *(_QWORD *)(v7 + 56) = &type metadata for String;
    v8 = sub_100009A78();
    *(_QWORD *)(v7 + 64) = v8;
    *(_QWORD *)(v7 + 32) = 0xD000000000000032;
    *(_QWORD *)(v7 + 40) = 0x800000010001EAE0;
    a2 = a2;
    v9 = objc_msgSend(a2, "description");
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v12 = v11;

    v13 = v8;
    *(_QWORD *)(v7 + 96) = &type metadata for String;
    *(_QWORD *)(v7 + 104) = v8;
    *(_QWORD *)(v7 + 72) = v10;
    *(_QWORD *)(v7 + 80) = v12;
    os_log(_:dso:log:_:_:)(v5, &_mh_execute_header, v6, "%@ service: %@", 14, 2, v7);
    swift_bridgeObjectRelease(v7);
    v5 = sub_10000B120(0, &qword_10002E0E8, NSObject_ptr);
    v14 = objc_msgSend(a2, "UUID");
    if (qword_10002DA60 != -1)
      swift_once(&qword_10002DA60, sub_1000027B4);
    v15 = static NSObject.== infix(_:_:)(v14, qword_1000353B0);

    if ((v15 & 1) == 0)
      break;
    if (a3)
    {
      v16 = swift_errorRetain(a3);
      v17 = static os_log_type_t.error.getter(v16);
      v18 = qword_1000353C8;
      v19 = swift_allocObject(v91, 72, 7);
      *(_OWORD *)(v19 + 16) = xmmword_10001F910;
      v94 = a3;
      swift_errorRetain(a3);
      v20 = sub_100009A34((uint64_t *)&unk_10002EC10);
      v21 = String.init<A>(describing:)(&v94, v20);
      *(_QWORD *)(v19 + 56) = &type metadata for String;
      *(_QWORD *)(v19 + 64) = v8;
      *(_QWORD *)(v19 + 32) = v21;
      *(_QWORD *)(v19 + 40) = v22;
      os_log(_:dso:log:_:_:)(v17, &_mh_execute_header, v18, "Error discovering characteristics: %@", 37, 2, v19);
      swift_bridgeObjectRelease(v19);
      v23 = (void *)*sub_10000ACF4((_QWORD *)(v92 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v92 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
      v24 = objc_msgSend(v23, "result");
      isa = Int._bridgeToObjectiveC()().super.super.isa;
      objc_msgSend(v24, "setStatusCode:", isa);

      objc_msgSend(v23, "setFinished:", 1);
      swift_errorRelease(a3);
      return;
    }
    v26 = objc_msgSend(a2, "characteristics");
    if (!v26)
      goto LABEL_54;
    v27 = v26;
    v28 = sub_10000B120(0, &qword_10002E118, CBCharacteristic_ptr);
    a3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v27, v28);

    v89 = v8;
    if (!((unint64_t)a3 >> 62))
    {
      v29 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(a3);
      if (v29)
        goto LABEL_10;
LABEL_53:
      v26 = (id)swift_bridgeObjectRelease_n(a3, 2);
      v13 = v89;
LABEL_54:
      v72 = static os_log_type_t.error.getter(v26);
      v73 = qword_1000353C8;
      v74 = swift_allocObject(v91, 72, 7);
      *(_OWORD *)(v74 + 16) = xmmword_10001F910;
      v75 = objc_msgSend(a2, "characteristics");
      if (v75)
      {
        v76 = v75;
        v77 = sub_10000B120(0, &qword_10002E118, CBCharacteristic_ptr);
        v78 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v76, v77);

      }
      else
      {
        v78 = 0;
      }
      v94 = v78;
      v79 = sub_100009A34(&qword_10002E110);
      v80 = String.init<A>(describing:)(&v94, v79);
      *(_QWORD *)(v74 + 56) = &type metadata for String;
      *(_QWORD *)(v74 + 64) = v13;
      *(_QWORD *)(v74 + 32) = v80;
      *(_QWORD *)(v74 + 40) = v81;
      os_log(_:dso:log:_:_:)(v72, &_mh_execute_header, v73, "Error: AudioBox service is missing expected characteristics (discovered: %@)", 76, 2, v74);
      swift_bridgeObjectRelease(v74);
      v82 = (void *)*sub_10000ACF4((_QWORD *)(v92 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v92 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
      v83 = objc_msgSend(v82, "result");
      v84 = Int._bridgeToObjectiveC()().super.super.isa;
      objc_msgSend(v83, "setStatusCode:", v84);

      objc_msgSend(v82, "setFinished:", 1);
      return;
    }
LABEL_49:
    if (a3 < 0)
      v71 = a3;
    else
      v71 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v29 = _CocoaArrayWrapper.endIndex.getter(v71);
    if (!v29)
      goto LABEL_53;
LABEL_10:
    v93 = a3 & 0xC000000000000001;
    v30 = 4;
    while (1)
    {
      v31 = v93 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v30 - 4, a3) : *(id *)(a3 + 8 * v30);
      v32 = v31;
      v33 = v30 - 3;
      if (__OFADD__(v30 - 4, 1))
        break;
      v34 = objc_msgSend(v31, "UUID");
      if (qword_10002DA68 != -1)
        swift_once(&qword_10002DA68, sub_1000027D0);
      v35 = static NSObject.== infix(_:_:)(v34, qword_1000353B8);

      if ((v35 & 1) != 0)
      {
        v36 = 4;
        while (1)
        {
          v37 = v93
              ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v36 - 4, a3)
              : *(id *)(a3 + 8 * v36);
          v38 = v37;
          v39 = v36 - 3;
          if (__OFADD__(v36 - 4, 1))
            break;
          v40 = objc_msgSend(v37, "UUID");
          if (qword_10002DA70 != -1)
            swift_once(&qword_10002DA70, sub_1000027EC);
          v41 = static NSObject.== infix(_:_:)(v40, qword_1000353C0);

          if ((v41 & 1) != 0)
          {
            swift_bridgeObjectRelease(a3);
            sub_10000B120(0, &qword_10002E0F0, CBUUID_ptr);
            if (v29 < 1)
            {
              __break(1u);
              return;
            }
            v42 = 0;
            v86 = OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capPSMCharacteristic;
            v88 = OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagingCharacteristic;
            v85 = xmmword_10001F910;
            v43 = v92;
            v44 = a1;
            while (1)
            {
              if (v93)
                v47 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v42, a3);
              else
                v47 = *(id *)(a3 + 8 * v42 + 32);
              v48 = v47;
              v49 = objc_msgSend(v47, "UUID", v85);
              v50 = (void *)qword_1000353B8;
              v51 = v49;
              v52 = v50;
              v53 = static NSObject.== infix(_:_:)(v52, v51);

              if ((v53 & 1) != 0)
              {

                v45 = *(void **)(v43 + v88);
                *(_QWORD *)(v43 + v88) = v48;
                v46 = v48;

              }
              else
              {
                v54 = (id)qword_1000353C0;
                v55 = static NSObject.== infix(_:_:)(v54, v51);

                if ((v55 & 1) == 0)
                {
                  v58 = static os_log_type_t.error.getter(v56);
                  v87 = qword_1000353C8;
                  v59 = swift_allocObject(v91, 72, 7);
                  *(_OWORD *)(v59 + 16) = v85;
                  v60 = objc_msgSend(v48, "UUID");
                  v61 = objc_msgSend(v60, "UUIDString");

                  v62 = static String._unconditionallyBridgeFromObjectiveC(_:)(v61);
                  v64 = v63;

                  *(_QWORD *)(v59 + 56) = &type metadata for String;
                  *(_QWORD *)(v59 + 64) = v89;
                  *(_QWORD *)(v59 + 32) = v62;
                  *(_QWORD *)(v59 + 40) = v64;
                  v44 = a1;
                  v43 = v92;
                  os_log(_:dso:log:_:_:)(v58, &_mh_execute_header, v87, "Discovered unknown characteristic %@", 36, 2, v59);
                  swift_bridgeObjectRelease(v59);
                  goto LABEL_34;
                }
                v57 = *(void **)(v43 + v86);
                *(_QWORD *)(v43 + v86) = v48;
                v46 = v48;

                objc_msgSend(v44, "readValueForCharacteristic:", v46);
              }
              objc_msgSend(v44, "setNotifyValue:forCharacteristic:", 1, v46);
LABEL_34:
              ++v42;

              if (v29 == v42)
              {
                swift_bridgeObjectRelease(a3);
                v65 = (uint64_t *)(v43
                                + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxConnectionCompletion);
                v66 = (void (*)(uint64_t))*v65;
                if (*v65)
                {
                  v67 = v65[1];
                  v68 = swift_retain(v67);
                  v66(v68);
                  sub_10000ADB8((uint64_t)v66, v67);
                  v69 = *v65;
                }
                else
                {
                  v69 = 0;
                }
                v70 = v65[1];
                *v65 = 0;
                v65[1] = 0;
                sub_10000ADB8(v69, v70);
                return;
              }
            }
          }
          ++v36;
          if (v39 == v29)
            goto LABEL_53;
        }
        __break(1u);
        goto LABEL_49;
      }
      ++v30;
      if (v33 == v29)
        goto LABEL_53;
    }
    __break(1u);
  }
}

id sub_100006E9C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  Class isa;
  id v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  Class v42;
  id v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  id v62;
  __int128 v63;
  uint64_t v64;
  _QWORD v65[2];

  v62 = a1;
  type metadata accessor for String.Encoding(0);
  v5 = __chkstk_darwin();
  v7 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = static os_log_type_t.debug.getter(v5);
  if (qword_10002DA78 != -1)
    swift_once(&qword_10002DA78, sub_100018040);
  v9 = qword_1000353C8;
  v10 = sub_100009A34(&qword_10002E0B0);
  v11 = swift_allocObject(v10, 72, 7);
  v63 = xmmword_10001F910;
  *(_OWORD *)(v11 + 16) = xmmword_10001F910;
  *(_QWORD *)(v11 + 56) = &type metadata for String;
  v12 = sub_100009A78();
  *(_QWORD *)(v11 + 64) = v12;
  *(_QWORD *)(v11 + 32) = 0xD000000000000026;
  *(_QWORD *)(v11 + 40) = 0x800000010001E940;
  os_log(_:dso:log:_:_:)(v8, &_mh_execute_header, v9, "%@", 2, 2, v11);
  swift_bridgeObjectRelease(v11);
  if (a3)
  {
    v13 = swift_errorRetain(a3);
    v14 = static os_log_type_t.error.getter(v13);
    v15 = qword_1000353C8;
    v16 = swift_allocObject(v10, 72, 7);
    *(_OWORD *)(v16 + 16) = v63;
    v65[0] = a3;
    swift_errorRetain(a3);
    v17 = sub_100009A34((uint64_t *)&unk_10002EC10);
    v18 = String.init<A>(describing:)(v65, v17);
    *(_QWORD *)(v16 + 56) = &type metadata for String;
    *(_QWORD *)(v16 + 64) = v12;
    *(_QWORD *)(v16 + 32) = v18;
    *(_QWORD *)(v16 + 40) = v19;
    os_log(_:dso:log:_:_:)(v14, &_mh_execute_header, v15, "Error updating characteristic value: %@", 39, 2, v16);
    swift_bridgeObjectRelease(v16);
    v20 = (void *)*sub_10000ACF4((_QWORD *)(v64 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v64 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    v21 = objc_msgSend(v20, "result");
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v21, "setStatusCode:", isa);

    objc_msgSend(v20, "setFinished:", 1);
    return (id)swift_errorRelease(a3);
  }
  v24 = objc_msgSend(a2, "value");
  if (!v24)
  {
    v39 = static os_log_type_t.error.getter(0);
    os_log(_:dso:log:_:_:)(v39, &_mh_execute_header, qword_1000353C8, "Error: characteristic.value is nil", 34, 2, &_swiftEmptyArrayStorage);
    v40 = (void *)*sub_10000ACF4((_QWORD *)(v64 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v64 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    v41 = objc_msgSend(v40, "result");
    v42 = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v41, "setStatusCode:", v42);

    return objc_msgSend(v40, "setFinished:", 1);
  }
  v25 = v24;
  v26 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v61 = v27;

  v28 = objc_msgSend(a2, "UUID");
  v29 = qword_10002DA68;
  v30 = v28;
  if (v29 != -1)
    swift_once(&qword_10002DA68, sub_1000027D0);
  v31 = qword_1000353B8;
  sub_10000B120(0, &qword_10002E0F0, CBUUID_ptr);
  v32 = (id)v31;
  LOBYTE(v31) = static NSObject.== infix(_:_:)(v32, v30);

  if ((v31 & 1) != 0)
  {

    static String.Encoding.utf8.getter();
    v33 = v26;
    v34 = v26;
    v35 = v61;
    v36 = String.init(data:encoding:)(v34, v61, v7);
    if (v37)
    {
      v38 = v37;
      if (v36 == 0x3E4D4F453CLL && v37 == 0xE500000000000000)
      {
        v36 = swift_bridgeObjectRelease(0xE500000000000000);
LABEL_20:
        v53 = static os_log_type_t.debug.getter(v36);
        os_log(_:dso:log:_:_:)(v53, &_mh_execute_header, qword_1000353C8, "Received EOM", 12, 2, &_swiftEmptyArrayStorage);
        sub_1000038FC();
        v56 = v33;
        return (id)sub_100008A34(v56, v35);
      }
      v52 = _stringCompareWithSmolCheck(_:_:expecting:)(v36, v37, 0x3E4D4F453CLL, 0xE500000000000000, 0);
      v36 = swift_bridgeObjectRelease(v38);
      if ((v52 & 1) != 0)
        goto LABEL_20;
    }
    static os_log_type_t.debug.getter(v36);
    v54 = swift_allocObject(v10, 72, 7);
    *(_OWORD *)(v54 + 16) = v63;
    __asm { BR              X11 }
  }
  if (qword_10002DA70 != -1)
    swift_once(&qword_10002DA70, sub_1000027EC);
  v43 = (id)qword_1000353C0;
  v44 = static NSObject.== infix(_:_:)(v43, v30);

  if ((v44 & 1) == 0)
    return (id)sub_100008A34(v26, v61);
  v45 = type metadata accessor for JSONDecoder(0);
  swift_allocObject(v45, *(unsigned int *)(v45 + 48), *(unsigned __int16 *)(v45 + 52));
  v46 = JSONDecoder.init()();
  v47 = sub_100009A34(&qword_10002E0F8);
  v48 = sub_10000AD18();
  v49 = v26;
  v50 = v26;
  v35 = v61;
  dispatch thunk of JSONDecoder.decode<A>(_:from:)(v65, v47, v50, v61, v47, v48);
  v51 = swift_release(v46);
  if ((v65[0] & 0x10000) != 0)
  {
    v55 = static os_log_type_t.default.getter(v51);
    os_log(_:dso:log:_:_:)(v55, &_mh_execute_header, qword_1000353C8, "Received nil L2CAP PSM", 22, 2, &_swiftEmptyArrayStorage);
    sub_10000775C();
  }
  else
  {
    v57 = LOWORD(v65[0]);
    v58 = static os_log_type_t.default.getter(v51);
    v59 = qword_1000353C8;
    v60 = swift_allocObject(v10, 72, 7);
    *(_OWORD *)(v60 + 16) = v63;
    *(_QWORD *)(v60 + 56) = &type metadata for UInt16;
    *(_QWORD *)(v60 + 64) = &protocol witness table for UInt16;
    *(_WORD *)(v60 + 32) = v57;
    os_log(_:dso:log:_:_:)(v58, &_mh_execute_header, v59, "Received L2CAP PSM: %d", v61);
    swift_bridgeObjectRelease(v60);
    objc_msgSend(v62, "openL2CAPChannel:", v57);
  }
  v56 = v49;
  return (id)sub_100008A34(v56, v35);
}

void sub_10000775C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int16 v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  id v25;

  v1 = OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capChannel;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capChannel);
  if (v2)
  {
    v3 = v2;
    v4 = static os_log_type_t.default.getter(v3);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    v5 = qword_1000353C8;
    v6 = sub_100009A34(&qword_10002E0B0);
    v7 = swift_allocObject(v6, 72, 7);
    *(_OWORD *)(v7 + 16) = xmmword_10001F910;
    v8 = (unsigned __int16)objc_msgSend(v3, "PSM");
    *(_QWORD *)(v7 + 56) = &type metadata for UInt16;
    *(_QWORD *)(v7 + 64) = &protocol witness table for UInt16;
    *(_WORD *)(v7 + 32) = v8;
    os_log(_:dso:log:_:_:)(v4, &_mh_execute_header, v5, "Closing L2CAP connection with PSM %d", v24);
    swift_bridgeObjectRelease(v7);
    v9 = objc_msgSend(v3, "outputStream");
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "close");

      v11 = objc_msgSend(v3, "inputStream");
      if (v11)
      {
        v12 = v11;
        objc_msgSend(v11, "close");

        v13 = objc_msgSend(v3, "inputStream");
        if (v13)
        {
          v14 = v13;
          v15 = (void *)objc_opt_self(NSRunLoop);
          v16 = objc_msgSend(v15, "mainRunLoop");
          objc_msgSend(v14, "removeFromRunLoop:forMode:", v16, NSDefaultRunLoopMode);

          v17 = objc_msgSend(v3, "outputStream");
          if (v17)
          {
            v18 = v17;
            v19 = objc_msgSend(v15, "mainRunLoop");
            objc_msgSend(v18, "removeFromRunLoop:forMode:", v19, NSDefaultRunLoopMode);

            v20 = objc_msgSend(v3, "inputStream");
            if (v20)
            {
              v21 = v20;
              objc_msgSend(v20, "setDelegate:", 0);

              v22 = objc_msgSend(v3, "outputStream");
              if (v22)
              {
                v23 = v22;
                objc_msgSend(v22, "setDelegate:", 0);

                v25 = *(id *)(v0 + v1);
                *(_QWORD *)(v0 + v1) = 0;

                return;
              }
              goto LABEL_17;
            }
LABEL_16:
            __break(1u);
LABEL_17:
            __break(1u);
            return;
          }
LABEL_15:
          __break(1u);
          goto LABEL_16;
        }
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_14;
  }
}

void sub_100007A40(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void (*a6)(id, id, void *))
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a3;
  v11 = a4;
  v12 = a1;
  v13 = a5;
  a6(v10, v11, a5);

}

void sub_100007BB0(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int16 v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  int v25;
  id v26;

  v3 = OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capChannel;
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capChannel))
    sub_10000775C();
  v4 = static os_log_type_t.default.getter(a1);
  if (qword_10002DA78 != -1)
    swift_once(&qword_10002DA78, sub_100018040);
  v5 = qword_1000353C8;
  v6 = sub_100009A34(&qword_10002E0B0);
  v7 = swift_allocObject(v6, 72, 7);
  *(_OWORD *)(v7 + 16) = xmmword_10001F910;
  v8 = (unsigned __int16)objc_msgSend(a1, "PSM");
  *(_QWORD *)(v7 + 56) = &type metadata for UInt16;
  *(_QWORD *)(v7 + 64) = &protocol witness table for UInt16;
  *(_WORD *)(v7 + 32) = v8;
  os_log(_:dso:log:_:_:)(v4, &_mh_execute_header, v5, "Opened L2CAP channel with PSM %d", v25);
  swift_bridgeObjectRelease(v7);
  v9 = objc_msgSend(a1, "inputStream");
  if (!v9)
  {
    __break(1u);
    goto LABEL_13;
  }
  v10 = v9;
  objc_msgSend(v9, "setDelegate:", v1);

  v11 = objc_msgSend(a1, "outputStream");
  if (!v11)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v12 = v11;
  objc_msgSend(v11, "setDelegate:", v1);

  v13 = objc_msgSend(a1, "inputStream");
  if (!v13)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v13;
  v15 = (void *)objc_opt_self(NSRunLoop);
  v16 = objc_msgSend(v15, "mainRunLoop");
  objc_msgSend(v14, "scheduleInRunLoop:forMode:", v16, NSDefaultRunLoopMode);

  v17 = objc_msgSend(a1, "outputStream");
  if (!v17)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v18 = v17;
  v19 = objc_msgSend(v15, "mainRunLoop");
  objc_msgSend(v18, "scheduleInRunLoop:forMode:", v19, NSDefaultRunLoopMode);

  v20 = objc_msgSend(a1, "inputStream");
  if (!v20)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v21 = v20;
  objc_msgSend(v20, "open");

  v22 = objc_msgSend(a1, "outputStream");
  if (v22)
  {
    v23 = v22;
    objc_msgSend(v22, "open");

    v26 = *(id *)(v1 + v3);
    *(_QWORD *)(v1 + v3) = a1;
    v24 = a1;

    return;
  }
LABEL_17:
  __break(1u);
}

void sub_100007EE4(void *a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;

  switch(a2)
  {
    case 1:
      v20 = static os_log_type_t.default.getter(a1);
      if (qword_10002DA78 != -1)
        swift_once(&qword_10002DA78, sub_100018040);
      v21 = qword_1000353C8;
      v22 = sub_100009A34(&qword_10002E0B0);
      v23 = swift_allocObject(v22, 72, 7);
      *(_OWORD *)(v23 + 16) = xmmword_10001F910;
      v24 = a1;
      v25 = objc_msgSend(v24, "description");
      v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
      v28 = v27;

      *(_QWORD *)(v23 + 56) = &type metadata for String;
      *(_QWORD *)(v23 + 64) = sub_100009A78();
      *(_QWORD *)(v23 + 32) = v26;
      *(_QWORD *)(v23 + 40) = v28;
      os_log(_:dso:log:_:_:)(v20, &_mh_execute_header, v21, "L2CAP stream opened: %@", 23, 2, v23);
      goto LABEL_16;
    case 2:
      sub_100008364();
      return;
    case 4:
      sub_10000414C((int)a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19);
      return;
    case 8:
      v37 = static os_log_type_t.error.getter(a1);
      if (qword_10002DA78 != -1)
        swift_once(&qword_10002DA78, sub_100018040);
      v38 = qword_1000353C8;
      v39 = sub_100009A34(&qword_10002E0B0);
      v40 = swift_allocObject(v39, 112, 7);
      *(_OWORD *)(v40 + 16) = xmmword_10001F920;
      v41 = a1;
      v42 = objc_msgSend(v41, "description");
      v43 = static String._unconditionallyBridgeFromObjectiveC(_:)(v42);
      v45 = v44;

      *(_QWORD *)(v40 + 56) = &type metadata for String;
      v46 = sub_100009A78();
      *(_QWORD *)(v40 + 64) = v46;
      *(_QWORD *)(v40 + 32) = v43;
      *(_QWORD *)(v40 + 40) = v45;
      v58 = objc_msgSend(v41, "streamError");
      v47 = sub_100009A34((uint64_t *)&unk_10002E0C0);
      v48 = String.init<A>(describing:)(&v58, v47);
      *(_QWORD *)(v40 + 96) = &type metadata for String;
      *(_QWORD *)(v40 + 104) = v46;
      *(_QWORD *)(v40 + 72) = v48;
      *(_QWORD *)(v40 + 80) = v49;
      os_log(_:dso:log:_:_:)(v37, &_mh_execute_header, v38, "Error occurred in L2CAP stream %@: %@", 37, 2, v40);
      swift_bridgeObjectRelease(v40);
      return;
    case 16:
      v50 = static os_log_type_t.default.getter(a1);
      if (qword_10002DA78 != -1)
        swift_once(&qword_10002DA78, sub_100018040);
      v51 = qword_1000353C8;
      v52 = sub_100009A34(&qword_10002E0B0);
      v23 = swift_allocObject(v52, 72, 7);
      *(_OWORD *)(v23 + 16) = xmmword_10001F910;
      v53 = a1;
      v54 = objc_msgSend(v53, "description");
      v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
      v57 = v56;

      *(_QWORD *)(v23 + 56) = &type metadata for String;
      *(_QWORD *)(v23 + 64) = sub_100009A78();
      *(_QWORD *)(v23 + 32) = v55;
      *(_QWORD *)(v23 + 40) = v57;
      os_log(_:dso:log:_:_:)(v50, &_mh_execute_header, v51, "L2CAP stream ended: %@", 22, 2, v23);
      goto LABEL_16;
    default:
      v29 = static os_log_type_t.error.getter(a1);
      if (qword_10002DA78 != -1)
        swift_once(&qword_10002DA78, sub_100018040);
      v30 = qword_1000353C8;
      v31 = sub_100009A34(&qword_10002E0B0);
      v23 = swift_allocObject(v31, 72, 7);
      *(_OWORD *)(v23 + 16) = xmmword_10001F910;
      v32 = a1;
      v33 = objc_msgSend(v32, "description");
      v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
      v36 = v35;

      *(_QWORD *)(v23 + 56) = &type metadata for String;
      *(_QWORD *)(v23 + 64) = sub_100009A78();
      *(_QWORD *)(v23 + 32) = v34;
      *(_QWORD *)(v23 + 40) = v36;
      os_log(_:dso:log:_:_:)(v29, &_mh_execute_header, v30, "L2CAP stream %@ encountered unknown event", 41, 2, v23);
LABEL_16:
      swift_bridgeObjectRelease(v23);
      return;
  }
}

void sub_100008364()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[3];

  v1 = *(void **)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capChannel);
  if (v1)
  {
    v2 = v0;
    v3 = objc_msgSend(v1, "inputStream");
    if (v3)
    {
      v4 = v3;
      v5 = swift_slowAlloc(1024, -1);
      v6 = (char *)objc_msgSend(v4, "read:maxLength:", v5, 1024);
      v7 = objc_msgSend(v4, "streamError");
      if (v7)
      {
        v8 = v7;
        v9 = (_QWORD *)static os_log_type_t.error.getter(v7);
        if (qword_10002DA78 == -1)
        {
LABEL_5:
          v10 = qword_1000353C8;
          v11 = sub_100009A34(&qword_10002E0B0);
          v12 = swift_allocObject(v11, 72, 7);
          *(_OWORD *)(v12 + 16) = xmmword_10001F910;
          v32[0] = v8;
          v13 = v8;
          v14 = sub_100009A34((uint64_t *)&unk_10002EC10);
          v15 = String.init<A>(describing:)(v32, v14);
          v17 = v16;
          *(_QWORD *)(v12 + 56) = &type metadata for String;
          *(_QWORD *)(v12 + 64) = sub_100009A78();
          *(_QWORD *)(v12 + 32) = v15;
          *(_QWORD *)(v12 + 40) = v17;
          os_log(_:dso:log:_:_:)(v9, &_mh_execute_header, v10, "Error reading from stream: %@", 29, 2, v12);

          swift_bridgeObjectRelease(v12);
          swift_slowDealloc(v5, -1, -1);

          return;
        }
      }
      else
      {
        v8 = (void *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataReceived);
        swift_beginAccess(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataReceived, v32, 33, 0);
        if (v6)
          Data._Representation.append(contentsOf:)(v5, &v6[v5]);
        swift_endAccess(v32);
        v18 = *(_QWORD *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_expectedFiles);
        v19 = *(_QWORD *)(v18 + 16);
        v9 = &_swiftEmptyArrayStorage;
        if (v19)
        {
          v31 = v8;
          v32[0] = &_swiftEmptyArrayStorage;
          swift_bridgeObjectRetain(v18);
          sub_100009034(0, v19, 0);
          v9 = (_QWORD *)v32[0];
          v20 = *(_QWORD *)(v32[0] + 16);
          v21 = 48;
          do
          {
            v22 = *(_QWORD *)(v18 + v21);
            v32[0] = v9;
            v23 = v9[3];
            if (v20 >= v23 >> 1)
            {
              sub_100009034((char *)(v23 > 1), v20 + 1, 1);
              v9 = (_QWORD *)v32[0];
            }
            v9[2] = v20 + 1;
            v9[v20 + 4] = v22;
            v21 += 40;
            ++v20;
            --v19;
          }
          while (v19);
          swift_bridgeObjectRelease(v18);
          v8 = v31;
        }
        v24 = v9[2];
        if (!v24)
        {
LABEL_18:
          v29 = swift_bridgeObjectRelease(v9);
          static os_log_type_t.default.getter(v29);
          if (qword_10002DA78 != -1)
            swift_once(&qword_10002DA78, sub_100018040);
          v30 = sub_100009A34(&qword_10002E0B0);
          *(_OWORD *)(swift_allocObject(v30, 112, 7) + 16) = xmmword_10001F920;
          __asm { BR              X13 }
        }
        v25 = 0;
        v26 = v9 + 4;
        while (1)
        {
          v27 = *v26++;
          v28 = __CFADD__(v25, v27);
          v25 += v27;
          if (v28)
            break;
          if (!--v24)
            goto LABEL_18;
        }
        __break(1u);
      }
      swift_once(&qword_10002DA78, sub_100018040);
      goto LABEL_5;
    }
  }
}

#error "1000087B4: call analysis failed (funcsize=23)"

uint64_t initializeBufferWithCopyOfBuffer for AudioBoxBluetoothManager.SendingFileInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for AudioBoxBluetoothManager.SendingFileInfo(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_release(*(_QWORD *)(a1 + 32));
}

_QWORD *initializeWithCopy for AudioBoxBluetoothManager.SendingFileInfo(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v6 = a2[4];
  v5 = a2[5];
  a1[4] = v6;
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_retain(v6);
  return a1;
}

_QWORD *assignWithCopy for AudioBoxBluetoothManager.SendingFileInfo(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = *a2;
  v4 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v4);
  a1[2] = a2[2];
  v5 = a2[4];
  v6 = a1[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_retain(v5);
  swift_release(v6);
  a1[5] = a2[5];
  return a1;
}

__n128 initializeWithTake for AudioBoxBluetoothManager.SendingFileInfo(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for AudioBoxBluetoothManager.SendingFileInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release(v6);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioBoxBluetoothManager.SendingFileInfo(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AudioBoxBluetoothManager.SendingFileInfo(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AudioBoxBluetoothManager.SendingFileInfo()
{
  return &type metadata for AudioBoxBluetoothManager.SendingFileInfo;
}

uint64_t sub_1000089F0(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100008A34(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100008A78@<X0>(uint64_t result@<X0>, uint64_t a2@<X3>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  _BYTE v4[24];

  if (result)
  {
    v3 = a2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataToSend;
    swift_beginAccess(a2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataToSend, v4, 0, 0);
    __asm { BR              X12 }
  }
  *a3 = 0;
  return result;
}

uint64_t sub_100008B5C()
{
  return 1;
}

Swift::Int sub_100008B64()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_100008BA4()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_100008BC8(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

char *sub_100008C14(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

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
    v10 = sub_100009A34(&qword_10002E0A8);
    v11 = (char *)swift_allocObject(v10, 40 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 40);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[40 * v8])
      memmove(v13, v14, 40 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v13, v14, v8, &type metadata for FileInfo);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_100008D28(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_100009A34(&qword_10002E108);
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
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for Data);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_100008E28(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

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
    v10 = sub_100009A34(&qword_10002E0D8);
    v11 = (char *)swift_allocObject(v10, 48 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 48);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[48 * v8])
      memmove(v13, v14, 48 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v13, v14, v8, &type metadata for AudioBoxBluetoothManager.SendingFileInfo);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_100008F40(uint64_t a1)
{
  return sub_100008E28(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100008F54(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = __DataStorage._bytes.getter();
  v5 = result;
  if (result)
  {
    result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v5 += a1 - result;
  }
  v6 = __OFSUB__(a2, a1);
  v7 = a2 - a1;
  if (v6)
  {
    __break(1u);
    goto LABEL_13;
  }
  v8 = __DataStorage._length.getter();
  if (v8 >= v7)
    v9 = v7;
  else
    v9 = v8;
  v10 = v5 + v9;
  if (v5)
    v11 = v10;
  else
    v11 = 0;
  v12 = type metadata accessor for SHA256(0);
  v13 = sub_10000B19C(&qword_10002E170, (uint64_t (*)(uint64_t))&type metadata accessor for SHA256, (uint64_t)&protocol conformance descriptor for SHA256);
  return dispatch thunk of HashFunction.update(bufferPointer:)(v5, v11, v12, v13);
}

char *sub_100009018(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_100009050(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_100009034(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_100009150(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_100009050(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_100009A34(&qword_10002E190);
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
  swift_release(a4);
  return v11;
}

char *sub_100009150(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_100009A34(&qword_10002E0D0);
    v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v8])
      memmove(v14, v15, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 8 * v8);
  }
  swift_release(a4);
  return v11;
}

uint64_t sub_100009248(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t result;
  Class v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  Class isa;
  int v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL4 v43;
  __int128 v44;
  uint64_t v45;
  unint64_t v46;
  id v47;
  uint64_t v48;

  v48 = a4;
  v8 = type metadata accessor for String.Encoding(0);
  v40 = *(_QWORD *)(v8 - 8);
  v41 = v8;
  __chkstk_darwin();
  v39 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = a3;
  v10 = objc_msgSend(a3, "maximumWriteValueLengthForType:", 0);
  v45 = (uint64_t)v10;
  v46 = a2;
  v11 = a2 >> 62;
  v12 = __OFSUB__(HIDWORD(a1), (_DWORD)a1);
  v43 = v12;
  if ((_DWORD)v11 == 3)
    goto LABEL_5;
  v10 = 0;
  v42 = HIDWORD(a1) - (int)a1;
  v20 = BYTE6(v46);
  v44 = xmmword_10001F910;
  v21 = BYTE6(v46);
  if (!(_DWORD)v11)
    goto LABEL_13;
LABEL_9:
  if ((_DWORD)v11 == 1)
  {
    v21 = v42;
    if (!v43)
      goto LABEL_13;
LABEL_32:
    __break(1u);
  }
  else
  {
    v23 = *(_QWORD *)(a1 + 16);
    v22 = *(_QWORD *)(a1 + 24);
    v24 = __OFSUB__(v22, v23);
    v21 = v22 - v23;
    if (!v24)
    {
LABEL_13:
      while ((uint64_t)v10 < v21)
      {
        v25 = v20;
        if ((_DWORD)v11)
        {
          if ((_DWORD)v11 == 1)
          {
            v25 = v42;
            if (v43)
              goto LABEL_34;
          }
          else
          {
            v27 = *(_QWORD *)(a1 + 16);
            v26 = *(_QWORD *)(a1 + 24);
            v24 = __OFSUB__(v26, v27);
            v25 = v26 - v27;
            if (v24)
              goto LABEL_35;
          }
        }
        v24 = __OFSUB__(v25, v10);
        v28 = v25 - (_QWORD)v10;
        if (v24)
        {
          __break(1u);
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
          goto LABEL_32;
        }
        if (v28 >= v45)
          v29 = v45;
        else
          v29 = v28;
        v4 = (uint64_t)v10 + v29;
        if (__OFADD__(v10, v29))
          goto LABEL_30;
        if (v4 < (uint64_t)v10)
          goto LABEL_31;
        v30 = Data.subdata(in:)();
        v32 = v31;
        v33 = static os_log_type_t.debug.getter(v30);
        if (qword_10002DA78 != -1)
          swift_once(&qword_10002DA78, sub_100018040);
        v34 = qword_1000353C8;
        v35 = sub_100009A34(&qword_10002E0B0);
        v36 = swift_allocObject(v35, 72, 7);
        *(_OWORD *)(v36 + 16) = v44;
        *(_QWORD *)(v36 + 56) = &type metadata for Int;
        *(_QWORD *)(v36 + 64) = &protocol witness table for Int;
        *(_QWORD *)(v36 + 32) = v29;
        os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v34, "Sending %d bytes", v38);
        swift_bridgeObjectRelease(v36);
        isa = Data._bridgeToObjectiveC()().super.isa;
        objc_msgSend(v47, "writeValue:forCharacteristic:type:", isa, v48, 0);
        sub_100008A34(v30, v32);

        v10 = (id)v4;
        v21 = v20;
        if ((_DWORD)v11)
          goto LABEL_9;
      }
LABEL_5:
      v4 = static os_log_type_t.debug.getter(v10);
      if (qword_10002DA78 == -1)
        goto LABEL_6;
      goto LABEL_36;
    }
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  swift_once(&qword_10002DA78, sub_100018040);
LABEL_6:
  v13 = os_log(_:dso:log:_:_:)(v4, &_mh_execute_header, qword_1000353C8, "Sending EOM", 11, 2, &_swiftEmptyArrayStorage);
  v14 = v39;
  static String.Encoding.utf8.getter(v13);
  v15 = String.data(using:allowLossyConversion:)(v14, 0, 0x3E4D4F453CLL, 0xE500000000000000);
  v17 = v16;
  result = (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v14, v41);
  if (v17 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    v19 = Data._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v47, "writeValue:forCharacteristic:type:", v19, v48, 0);

    return sub_10000B10C(v15, v17);
  }
  return result;
}

void sub_1000095BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = type metadata accessor for SHA256(0);
  __chkstk_darwin();
  type metadata accessor for SHA256Digest(0);
  __chkstk_darwin();
  v4 = sub_10000B19C(&qword_10002E170, (uint64_t (*)(uint64_t))&type metadata accessor for SHA256, (uint64_t)&protocol conformance descriptor for SHA256);
  dispatch thunk of HashFunction.init()(v3, v4);
  __asm { BR              X10 }
}

uint64_t sub_1000096C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)(v8 - 120) = v5;
  *(_WORD *)(v8 - 112) = v4;
  *(_BYTE *)(v8 - 110) = BYTE2(v4);
  *(_BYTE *)(v8 - 109) = BYTE3(v4);
  *(_BYTE *)(v8 - 108) = BYTE4(v4);
  *(_BYTE *)(v8 - 107) = BYTE5(v4);
  dispatch thunk of HashFunction.update(bufferPointer:)(v8 - 120, v8 - 120 + BYTE6(v4), v0, v6);
  sub_100008A34(v5, v4);
  ((void (*)(uint64_t, uint64_t))dispatch thunk of HashFunction.finalize())(v0, v6);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
  v9 = sub_100004F88(v3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 128) + 8))(v3, v7);
  *(_QWORD *)(v8 - 120) = v9;
  v10 = sub_100009A34(&qword_10002E178);
  v11 = sub_10000B1DC(&qword_10002E180, &qword_10002E178, (uint64_t)&protocol conformance descriptor for [A]);
  v12 = ((uint64_t (*)(_QWORD, unint64_t, uint64_t, uint64_t))BidirectionalCollection<>.joined(separator:))(0, 0xE000000000000000, v10, v11);
  swift_bridgeObjectRelease(v9);
  return v12;
}

uint64_t sub_100009910(uint64_t result, int64_t a2)
{
  char **v2;
  char *v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  v4 = *v2;
  v5 = *((_QWORD *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v6 = result;
  v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v2);
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > *((_QWORD *)v4 + 3) >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_100008C14(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  result = swift_arrayDestroy(&v4[40 * v6 + 32], v7, &type metadata for FileInfo);
  if (!v7)
    goto LABEL_19;
  v12 = *((_QWORD *)v4 + 2);
  v13 = __OFSUB__(v12, a2);
  v14 = v12 - a2;
  if (v13)
    goto LABEL_25;
  v15 = &v4[40 * a2 + 32];
  if (v6 != a2 || &v4[40 * v6 + 32] >= &v15[40 * v14])
    result = (uint64_t)memmove(&v4[40 * v6 + 32], v15, 40 * v14);
  v16 = *((_QWORD *)v4 + 2);
  v13 = __OFADD__(v16, v8);
  v17 = v16 - v7;
  if (!v13)
  {
    *((_QWORD *)v4 + 2) = v17;
LABEL_19:
    *v2 = v4;
    return result;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_100009A34(uint64_t *a1)
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

unint64_t sub_100009A78()
{
  unint64_t result;

  result = qword_10002E0B8;
  if (!qword_10002E0B8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10002E0B8);
  }
  return result;
}

uint64_t sub_100009ABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  result = __DataStorage._bytes.getter();
  v10 = result;
  if (result)
  {
    result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v10 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  __DataStorage._length.getter();
  result = sub_100008A78(v10, a5, &v11);
  if (!v5)
    return v11;
  return result;
}

uint64_t sub_100009B6C(uint64_t result, int64_t a2)
{
  char **v2;
  char *v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  v4 = *v2;
  v5 = *((_QWORD *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v6 = result;
  v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v2);
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > *((_QWORD *)v4 + 3) >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_100008E28(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  result = swift_arrayDestroy(&v4[48 * v6 + 32], v7, &type metadata for AudioBoxBluetoothManager.SendingFileInfo);
  if (!v7)
    goto LABEL_19;
  v12 = *((_QWORD *)v4 + 2);
  v13 = __OFSUB__(v12, a2);
  v14 = v12 - a2;
  if (v13)
    goto LABEL_25;
  v15 = &v4[48 * a2 + 32];
  if (v6 != a2 || &v4[48 * v6 + 32] >= &v15[48 * v14])
    result = (uint64_t)memmove(&v4[48 * v6 + 32], v15, 48 * v14);
  v16 = *((_QWORD *)v4 + 2);
  v13 = __OFADD__(v16, v8);
  v17 = v16 - v7;
  if (!v13)
  {
    *((_QWORD *)v4 + 2) = v17;
LABEL_19:
    *v2 = v4;
    return result;
  }
LABEL_26:
  __break(1u);
  return result;
}

void sub_100009C90(void *a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t inited;
  uint64_t v36;
  Class isa;
  unint64_t v38;
  Class v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47[80];
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;

  v4 = v3;
  v8 = static os_log_type_t.debug.getter();
  if (qword_10002DA78 != -1)
    swift_once(&qword_10002DA78, sub_100018040);
  v9 = qword_1000353C8;
  v10 = sub_100009A34(&qword_10002E0B0);
  v11 = swift_allocObject(v10, 72, 7);
  *(_OWORD *)(v11 + 16) = xmmword_10001F910;
  *(_QWORD *)(v11 + 56) = &type metadata for String;
  v12 = sub_100009A78();
  *(_QWORD *)(v11 + 64) = v12;
  *(_QWORD *)(v11 + 32) = 0xD000000000000035;
  *(_QWORD *)(v11 + 40) = 0x800000010001ECF0;
  os_log(_:dso:log:_:_:)(v8, &_mh_execute_header, v9, "%@", 2, 2, v11);
  swift_bridgeObjectRelease(v11);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(CBAdvertisementDataServiceUUIDsKey);
  v15 = v14;
  if (!*(_QWORD *)(a3 + 16) || (v16 = sub_10001C790(v13, v14), (v17 & 1) == 0))
  {
    v50 = 0u;
    v51 = 0u;
    swift_bridgeObjectRelease(v15);
    goto LABEL_14;
  }
  sub_10000AE08(*(_QWORD *)(a3 + 56) + 32 * v16, (uint64_t)&v50);
  swift_bridgeObjectRelease(v15);
  if (!*((_QWORD *)&v51 + 1))
  {
LABEL_14:
    sub_10000ADC8((uint64_t)&v50);
    return;
  }
  v18 = sub_100009A34(&qword_10002E138);
  if ((swift_dynamicCast(&v48, &v50, (char *)&type metadata for Any + 8, v18, 6) & 1) != 0)
  {
    v19 = v48;
    if (qword_10002DA60 != -1)
      swift_once(&qword_10002DA60, sub_1000027B4);
    v20 = (id)qword_1000353B0;
    v21 = sub_100005AA4((uint64_t)v20, v19);
    swift_bridgeObjectRelease(v19);

    if ((v21 & 1) != 0)
    {
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(CBAdvertisementDataLocalNameKey);
      v24 = v23;
      if (*(_QWORD *)(a3 + 16) && (v25 = sub_10001C790(v22, v23), (v26 & 1) != 0))
      {
        sub_10000AE08(*(_QWORD *)(a3 + 56) + 32 * v25, (uint64_t)&v50);
      }
      else
      {
        v50 = 0u;
        v51 = 0u;
      }
      swift_bridgeObjectRelease(v24);
      if (*((_QWORD *)&v51 + 1))
      {
        if ((swift_dynamicCast(&v48, &v50, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
        {
          v27 = v48;
          v28 = v49;
          v29 = (_QWORD *)(v4 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxSerial);
          v30 = *(_QWORD *)(v4 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxSerial + 8);
          if (v30
            && (v48 == *v29 && v30 == v49
             || (_stringCompareWithSmolCheck(_:_:expecting:)(v48, v49, *v29, v30, 0) & 1) != 0))
          {
            v31 = static os_log_type_t.default.getter();
            v32 = qword_1000353C8;
            v33 = swift_allocObject(v10, 72, 7);
            *(_OWORD *)(v33 + 16) = xmmword_10001F910;
            *(_QWORD *)(v33 + 56) = &type metadata for String;
            *(_QWORD *)(v33 + 64) = v12;
            *(_QWORD *)(v33 + 32) = v27;
            *(_QWORD *)(v33 + 40) = v28;
            os_log(_:dso:log:_:_:)(v31, &_mh_execute_header, v32, "Discovered audio box matching serial %@", 39, 2, v33);
            swift_bridgeObjectRelease(v33);
            objc_msgSend(a1, "stopScan");
            v34 = sub_100009A34(&qword_10002E140);
            inited = swift_initStackObject(v34, v47);
            *(_OWORD *)(inited + 16) = xmmword_10001F910;
            *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(CBConnectPeripheralOptionConnectionUseCase);
            *(_QWORD *)(inited + 40) = v36;
            isa = UInt32._bridgeToObjectiveC()().super.super.isa;
            *(_QWORD *)(inited + 72) = sub_10000B120(0, &qword_10002E148, NSNumber_ptr);
            *(_QWORD *)(inited + 48) = isa;
            v38 = sub_100005C28(inited);
            v39 = Dictionary._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease(v38);
            objc_msgSend(a1, "connectPeripheral:options:", a2, v39);

            objc_msgSend(a2, "setDelegate:", v4);
            v40 = *(void **)(v4 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBox);
            *(_QWORD *)(v4 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBox) = a2;
            v41 = a2;

          }
          else
          {
            v42 = static os_log_type_t.default.getter();
            v43 = qword_1000353C8;
            v44 = swift_allocObject(v10, 112, 7);
            *(_OWORD *)(v44 + 16) = xmmword_10001F920;
            *(_QWORD *)(v44 + 56) = &type metadata for String;
            *(_QWORD *)(v44 + 64) = v12;
            *(_QWORD *)(v44 + 32) = v27;
            *(_QWORD *)(v44 + 40) = v28;
            v45 = v29[1];
            if (v45)
            {
              v46 = *v29;
              *(_QWORD *)(v44 + 96) = &type metadata for String;
              *(_QWORD *)(v44 + 104) = v12;
              *(_QWORD *)(v44 + 72) = v46;
              *(_QWORD *)(v44 + 80) = v45;
              swift_bridgeObjectRetain(v45);
              os_log(_:dso:log:_:_:)(v42, &_mh_execute_header, v43, "Discovered audio box with serial %@, doesn't match %@", 53, 2, v44);
              swift_bridgeObjectRelease(v44);
            }
            else
            {
              __break(1u);
            }
          }
        }
        return;
      }
      goto LABEL_14;
    }
  }
}

void sub_10000A128(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  Class isa;

  v2 = static os_log_type_t.debug.getter();
  if (qword_10002DA78 != -1)
    swift_once(&qword_10002DA78, sub_100018040);
  v3 = qword_1000353C8;
  v4 = sub_100009A34(&qword_10002E0B0);
  v5 = swift_allocObject(v4, 72, 7);
  *(_OWORD *)(v5 + 16) = xmmword_10001F910;
  *(_QWORD *)(v5 + 56) = &type metadata for String;
  *(_QWORD *)(v5 + 64) = sub_100009A78();
  *(_QWORD *)(v5 + 32) = 0xD00000000000001DLL;
  *(_QWORD *)(v5 + 40) = 0x800000010001ECD0;
  os_log(_:dso:log:_:_:)(v2, &_mh_execute_header, v3, "%@", 2, 2, v5);
  swift_bridgeObjectRelease(v5);
  v6 = sub_100009A34(&qword_10002E128);
  v7 = swift_allocObject(v6, 40, 7);
  *(_OWORD *)(v7 + 16) = xmmword_10001F900;
  if (qword_10002DA60 != -1)
    swift_once(&qword_10002DA60, sub_1000027B4);
  v8 = (void *)qword_1000353B0;
  *(_QWORD *)(v7 + 32) = qword_1000353B0;
  specialized Array._endMutation()();
  sub_10000B120(0, &qword_10002E0F0, CBUUID_ptr);
  v9 = v8;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  objc_msgSend(a1, "discoverServices:", isa);

}

id sub_10000A2D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  Class isa;

  v1 = static os_log_type_t.debug.getter();
  if (qword_10002DA78 != -1)
    swift_once(&qword_10002DA78, sub_100018040);
  v2 = qword_1000353C8;
  v3 = sub_100009A34(&qword_10002E0B0);
  v4 = swift_allocObject(v3, 72, 7);
  *(_OWORD *)(v4 + 16) = xmmword_10001F910;
  *(_QWORD *)(v4 + 56) = &type metadata for String;
  *(_QWORD *)(v4 + 64) = sub_100009A78();
  *(_QWORD *)(v4 + 32) = 0xD000000000000029;
  *(_QWORD *)(v4 + 40) = 0x800000010001ECA0;
  os_log(_:dso:log:_:_:)(v1, &_mh_execute_header, v2, "%@", 2, 2, v4);
  swift_bridgeObjectRelease(v4);
  v5 = (void *)*sub_10000ACF4((_QWORD *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
  v6 = objc_msgSend(v5, "result");
  isa = Int._bridgeToObjectiveC()().super.super.isa;
  objc_msgSend(v6, "setStatusCode:", isa);

  return objc_msgSend(v5, "setFinished:", 1);
}

id sub_10000A41C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  Class isa;

  v1 = static os_log_type_t.debug.getter();
  if (qword_10002DA78 != -1)
    swift_once(&qword_10002DA78, sub_100018040);
  v2 = qword_1000353C8;
  v3 = sub_100009A34(&qword_10002E0B0);
  v4 = swift_allocObject(v3, 72, 7);
  *(_OWORD *)(v4 + 16) = xmmword_10001F910;
  *(_QWORD *)(v4 + 56) = &type metadata for String;
  *(_QWORD *)(v4 + 64) = sub_100009A78();
  *(_QWORD *)(v4 + 32) = 0xD000000000000030;
  *(_QWORD *)(v4 + 40) = 0x800000010001EC60;
  os_log(_:dso:log:_:_:)(v1, &_mh_execute_header, v2, "%@", 2, 2, v4);
  swift_bridgeObjectRelease(v4);
  v5 = (void *)*sub_10000ACF4((_QWORD *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v0 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
  v6 = objc_msgSend(v5, "result");
  isa = Int._bridgeToObjectiveC()().super.super.isa;
  objc_msgSend(v6, "setStatusCode:", isa);

  return objc_msgSend(v5, "setFinished:", 1);
}

id sub_10000A568(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
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
  uint64_t i;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  Class isa;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v3 = static os_log_type_t.debug.getter(a1);
  if (qword_10002DA78 != -1)
    goto LABEL_16;
  while (1)
  {
    v4 = qword_1000353C8;
    v5 = sub_100009A34(&qword_10002E0B0);
    v6 = swift_allocObject(v5, 112, 7);
    *(_OWORD *)(v6 + 16) = xmmword_10001F920;
    *(_QWORD *)(v6 + 56) = &type metadata for String;
    v7 = sub_100009A78();
    *(_QWORD *)(v6 + 64) = v7;
    *(_QWORD *)(v6 + 32) = 0xD000000000000020;
    *(_QWORD *)(v6 + 40) = 0x800000010001E8B0;
    v8 = sub_10000B120(0, &qword_10002E0E0, CBService_ptr);
    v9 = swift_bridgeObjectRetain(a1);
    v35 = v8;
    v10 = Array.description.getter(v9, v8);
    v12 = v11;
    swift_bridgeObjectRelease(a1);
    *(_QWORD *)(v6 + 96) = &type metadata for String;
    *(_QWORD *)(v6 + 104) = v7;
    *(_QWORD *)(v6 + 72) = v10;
    *(_QWORD *)(v6 + 80) = v12;
    os_log(_:dso:log:_:_:)(v3, &_mh_execute_header, v4, "%@ (invalidated: %@)", 20, 2, v6);
    swift_bridgeObjectRelease(v6);
    if ((unint64_t)a1 >> 62)
      break;
    v13 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(a1);
    if (!v13)
      return (id)swift_bridgeObjectRelease(a1);
LABEL_4:
    v33 = v7;
    v34 = v1;
    v1 = sub_10000B120(0, &qword_10002E0E8, NSObject_ptr);
    v3 = a1 & 0xC000000000000001;
    for (i = 4; ; ++i)
    {
      v15 = v3 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i - 4, a1) : *(id *)(a1 + 8 * i);
      v16 = v15;
      v17 = i - 3;
      if (__OFADD__(i - 4, 1))
        break;
      v18 = objc_msgSend(v15, "UUID");
      if (qword_10002DA60 != -1)
        swift_once(&qword_10002DA60, sub_1000027B4);
      v19 = static NSObject.== infix(_:_:)(v18, qword_1000353B0);

      if ((v19 & 1) != 0)
      {
        v20 = swift_bridgeObjectRelease(a1);
        v21 = static os_log_type_t.error.getter(v20);
        v22 = qword_1000353C8;
        v23 = swift_allocObject(v5, 72, 7);
        *(_OWORD *)(v23 + 16) = xmmword_10001F910;
        v24 = swift_bridgeObjectRetain(a1);
        v25 = Array.description.getter(v24, v35);
        v27 = v26;
        swift_bridgeObjectRelease(a1);
        *(_QWORD *)(v23 + 56) = &type metadata for String;
        *(_QWORD *)(v23 + 64) = v33;
        *(_QWORD *)(v23 + 32) = v25;
        *(_QWORD *)(v23 + 40) = v27;
        os_log(_:dso:log:_:_:)(v21, &_mh_execute_header, v22, "AudioBox service was invalidated: %@", 36, 2, v23);
        swift_bridgeObjectRelease(v23);
        v28 = (void *)*sub_10000ACF4((_QWORD *)(v34 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v34 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
        v29 = objc_msgSend(v28, "result");
        isa = Int._bridgeToObjectiveC()().super.super.isa;
        objc_msgSend(v29, "setStatusCode:", isa);

        return objc_msgSend(v28, "setFinished:", 1);
      }
      if (v17 == v13)
        return (id)swift_bridgeObjectRelease(a1);
    }
    __break(1u);
LABEL_16:
    swift_once(&qword_10002DA78, sub_100018040);
  }
  if (a1 < 0)
    v32 = a1;
  else
    v32 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a1);
  v13 = _CocoaArrayWrapper.endIndex.getter(v32);
  if (v13)
    goto LABEL_4;
  return (id)swift_bridgeObjectRelease(a1);
}

uint64_t sub_10000A8FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  Class isa;
  uint64_t v19;

  v3 = static os_log_type_t.debug.getter(a1);
  if (qword_10002DA78 != -1)
    swift_once(&qword_10002DA78, sub_100018040);
  v4 = qword_1000353C8;
  v5 = sub_100009A34(&qword_10002E0B0);
  v6 = swift_allocObject(v5, 72, 7);
  *(_OWORD *)(v6 + 16) = xmmword_10001F910;
  *(_QWORD *)(v6 + 56) = &type metadata for String;
  v7 = sub_100009A78();
  *(_QWORD *)(v6 + 64) = v7;
  *(_QWORD *)(v6 + 32) = 0xD000000000000025;
  *(_QWORD *)(v6 + 40) = 0x800000010001E840;
  os_log(_:dso:log:_:_:)(v3, &_mh_execute_header, v4, "%@", 2, 2, v6);
  result = swift_bridgeObjectRelease(v6);
  if (a1)
  {
    v9 = swift_errorRetain(a1);
    v10 = static os_log_type_t.error.getter(v9);
    v11 = qword_1000353C8;
    v12 = swift_allocObject(v5, 72, 7);
    *(_OWORD *)(v12 + 16) = xmmword_10001F910;
    v19 = a1;
    swift_errorRetain(a1);
    v13 = sub_100009A34((uint64_t *)&unk_10002EC10);
    v14 = String.init<A>(describing:)(&v19, v13);
    *(_QWORD *)(v12 + 56) = &type metadata for String;
    *(_QWORD *)(v12 + 64) = v7;
    *(_QWORD *)(v12 + 32) = v14;
    *(_QWORD *)(v12 + 40) = v15;
    os_log(_:dso:log:_:_:)(v10, &_mh_execute_header, v11, "Error writing value: %@", 23, 2, v12);
    swift_bridgeObjectRelease(v12);
    v16 = (void *)*sub_10000ACF4((_QWORD *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate), *(_QWORD *)(v1 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate + 24));
    v17 = objc_msgSend(v16, "result");
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v17, "setStatusCode:", isa);

    objc_msgSend(v16, "setFinished:", 1);
    return swift_errorRelease(a1);
  }
  return result;
}

void sub_10000AB14(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;

  v4 = static os_log_type_t.debug.getter(a1);
  if (qword_10002DA78 != -1)
    swift_once(&qword_10002DA78, sub_100018040);
  v5 = qword_1000353C8;
  v6 = sub_100009A34(&qword_10002E0B0);
  v7 = swift_allocObject(v6, 72, 7);
  *(_OWORD *)(v7 + 16) = xmmword_10001F910;
  *(_QWORD *)(v7 + 56) = &type metadata for String;
  v8 = sub_100009A78();
  *(_QWORD *)(v7 + 64) = v8;
  *(_QWORD *)(v7 + 32) = 0xD00000000000001CLL;
  *(_QWORD *)(v7 + 40) = 0x800000010001E7A0;
  os_log(_:dso:log:_:_:)(v4, &_mh_execute_header, v5, "%@", 2, 2, v7);
  swift_bridgeObjectRelease(v7);
  if (a2)
  {
    v9 = swift_errorRetain(a2);
    v10 = static os_log_type_t.error.getter(v9);
    v11 = qword_1000353C8;
    v12 = swift_allocObject(v6, 72, 7);
    *(_OWORD *)(v12 + 16) = xmmword_10001F910;
    v17 = a2;
    swift_errorRetain(a2);
    v13 = sub_100009A34((uint64_t *)&unk_10002EC10);
    v14 = String.init<A>(describing:)(&v17, v13);
    *(_QWORD *)(v12 + 56) = &type metadata for String;
    *(_QWORD *)(v12 + 64) = v8;
    *(_QWORD *)(v12 + 32) = v14;
    *(_QWORD *)(v12 + 40) = v15;
    os_log(_:dso:log:_:_:)(v10, &_mh_execute_header, v11, "Error opening L2CAP channel: %@", 31, 2, v12);
    swift_bridgeObjectRelease(v12);
    swift_errorRelease(a2);
  }
  else if (a1)
  {
    v16 = a1;
    sub_100007BB0(v16);

  }
}

_QWORD *sub_10000ACF4(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000AD18()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002E100;
  if (!qword_10002E100)
  {
    v1 = sub_10000AD74(&qword_10002E0F8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_10002E100);
  }
  return result;
}

uint64_t sub_10000AD74(uint64_t *a1)
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

uint64_t sub_10000ADB8(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_10000ADC8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100009A34(&qword_10002E130);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000AE08(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000AE44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100009A34(&qword_10002E158);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10000AE8C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_10000AE9C()
{
  unint64_t result;

  result = qword_10002E168;
  if (!qword_10002E168)
  {
    result = swift_getWitnessTable(&unk_10001FB00, &type metadata for AudioBoxBluetoothManager.ProtocolError);
    atomic_store(result, (unint64_t *)&qword_10002E168);
  }
  return result;
}

unint64_t sub_10000AEE0()
{
  unint64_t result;

  result = qword_10002E198;
  if (!qword_10002E198)
  {
    result = swift_getWitnessTable(&unk_10001FDFC, &type metadata for IncomingMessage);
    atomic_store(result, (unint64_t *)&qword_10002E198);
  }
  return result;
}

uint64_t sub_10000AF24(uint64_t a1, uint64_t a2)
{
  initializeWithTake for IncomingMessage(a2, a1);
  return a2;
}

uint64_t sub_10000AF60(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  switch(a7)
  {
    case 0:
      swift_bridgeObjectRetain(a2);
      result = swift_bridgeObjectRetain(a4);
      break;
    case 2:
      goto LABEL_5;
    case 3:
      swift_bridgeObjectRetain(a6);
      result = swift_bridgeObjectRetain(a5);
      break;
    case 4:
      result = a2;
LABEL_5:
      result = swift_bridgeObjectRetain(result);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000AFD8(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  return a1;
}

uint64_t sub_10000B014(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  switch(a7)
  {
    case 0:
      swift_bridgeObjectRelease(a2);
      result = swift_bridgeObjectRelease(a4);
      break;
    case 2:
      goto LABEL_5;
    case 3:
      swift_bridgeObjectRelease(a5);
      result = swift_bridgeObjectRelease(a6);
      break;
    case 4:
      result = a2;
LABEL_5:
      result = swift_bridgeObjectRelease(result);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000B08C(uint64_t a1, uint64_t a2)
{
  initializeWithTake for OutgoingMessage(a2, a1);
  return a2;
}

unint64_t sub_10000B0C8()
{
  unint64_t result;

  result = qword_10002E1A0;
  if (!qword_10002E1A0)
  {
    result = swift_getWitnessTable(&unk_10001FDD4, &type metadata for OutgoingMessage);
    atomic_store(result, (unint64_t *)&qword_10002E1A0);
  }
  return result;
}

uint64_t sub_10000B10C(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100008A34(result, a2);
  return result;
}

uint64_t sub_10000B120(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_10000B158()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

_BYTE *sub_10000B17C()
{
  uint64_t v0;

  return sub_1000031E4(*(_BYTE **)(v0 + 16));
}

uint64_t sub_10000B184(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000B194(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000B19C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_10000B1DC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000AD74(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

char *sub_10000B21C()
{
  uint64_t v0;

  return sub_100002D78(*(char **)(v0 + 16));
}

uint64_t sub_10000B224(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t getEnumTagSinglePayload for AudioBoxBluetoothManager.ProtocolError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for AudioBoxBluetoothManager.ProtocolError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_10000B2DC + 4 * byte_10001F98A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10000B2FC + 4 * byte_10001F98F[v4]))();
}

_BYTE *sub_10000B2DC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10000B2FC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000B304(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000B30C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000B314(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000B31C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_10000B328()
{
  return 0;
}

ValueMetadata *type metadata accessor for AudioBoxBluetoothManager.ProtocolError()
{
  return &type metadata for AudioBoxBluetoothManager.ProtocolError;
}

unint64_t sub_10000B348()
{
  unint64_t result;

  result = qword_10002E1D0;
  if (!qword_10002E1D0)
  {
    result = swift_getWitnessTable(&unk_10001FAD8, &type metadata for AudioBoxBluetoothManager.ProtocolError);
    atomic_store(result, (unint64_t *)&qword_10002E1D0);
  }
  return result;
}

uint64_t sub_10000B3A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;

  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_33:
    v39 = 0u;
    v40 = 0u;
    goto LABEL_34;
  }
  v2 = v1;
  v5 = *(_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_audioBoxIDKey);
  v4 = *(_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_audioBoxIDKey + 8);
  swift_bridgeObjectRetain(v4);
  v6 = sub_10001C790(v5, v4);
  if ((v7 & 1) == 0)
    goto LABEL_8;
  sub_10000AE08(*(_QWORD *)(a1 + 56) + 32 * v6, (uint64_t)&v39);
  swift_bridgeObjectRelease(v4);
  if (!*((_QWORD *)&v40 + 1))
  {
LABEL_34:
    sub_10000ADC8((uint64_t)&v39);
    return 0;
  }
  if ((swift_dynamicCast(&v37, &v39, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
    return 0;
  v4 = v38;
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_8:
    v39 = 0u;
    v40 = 0u;
LABEL_9:
    swift_bridgeObjectRelease(v4);
    goto LABEL_34;
  }
  v8 = v37;
  v10 = *(_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_audioBoxTokenKey);
  v9 = *(_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_audioBoxTokenKey + 8);
  swift_bridgeObjectRetain(v9);
  v11 = sub_10001C790(v10, v9);
  if ((v12 & 1) != 0)
  {
    sub_10000AE08(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)&v39);
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
  }
  swift_bridgeObjectRelease(v9);
  if (!*((_QWORD *)&v40 + 1))
    goto LABEL_9;
  if ((swift_dynamicCast(&v37, &v39, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
  {
    swift_bridgeObjectRelease(v4);
    return 0;
  }
  v13 = v37;
  v14 = v38;
  v15 = (_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_audioBoxID);
  v16 = *(_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_audioBoxID + 8);
  *v15 = v8;
  v15[1] = v4;
  swift_bridgeObjectRelease(v16);
  v17 = (_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_audioBoxToken);
  v18 = *(_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_audioBoxToken + 8);
  *v17 = v13;
  v17[1] = v14;
  swift_bridgeObjectRelease(v18);
  v19 = *(_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_parameters);
  *(_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_parameters) = a1;
  swift_bridgeObjectRetain(a1);
  swift_bridgeObjectRelease(v19);
  if (!*(_QWORD *)(a1 + 16))
  {
    v39 = 0u;
    v40 = 0u;
LABEL_25:
    sub_10000ADC8((uint64_t)&v39);
    return 1;
  }
  v21 = *(_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_downloadAudioFilesKey);
  v20 = *(_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_downloadAudioFilesKey + 8);
  swift_bridgeObjectRetain(v20);
  v22 = sub_10001C790(v21, v20);
  if ((v23 & 1) != 0)
  {
    sub_10000AE08(*(_QWORD *)(a1 + 56) + 32 * v22, (uint64_t)&v39);
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
  }
  swift_bridgeObjectRelease(v20);
  if (!*((_QWORD *)&v40 + 1))
    goto LABEL_25;
  if (!swift_dynamicCast(&v37, &v39, (char *)&type metadata for Any + 8, &type metadata for Bool, 6))
    return 1;
  result = 1;
  if ((v37 & 1) == 0)
    return result;
  *(_BYTE *)(v2 + OBJC_IVAR___AudioBoxInputs_downloadAudioFiles) = 1;
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_33;
  v26 = *(_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_fileDownloadTimeoutKey);
  v25 = *(_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_fileDownloadTimeoutKey + 8);
  swift_bridgeObjectRetain(v25);
  v27 = sub_10001C790(v26, v25);
  if ((v28 & 1) != 0)
  {
    sub_10000AE08(*(_QWORD *)(a1 + 56) + 32 * v27, (uint64_t)&v39);
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
  }
  swift_bridgeObjectRelease(v25);
  if (!*((_QWORD *)&v40 + 1))
    goto LABEL_34;
  if ((swift_dynamicCast(&v37, &v39, (char *)&type metadata for Any + 8, &type metadata for UInt, 6) & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 16))
    {
      v29 = v37;
      v31 = *(_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_sourcesKey);
      v30 = *(_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_sourcesKey + 8);
      swift_bridgeObjectRetain(v30);
      v32 = sub_10001C790(v31, v30);
      if ((v33 & 1) != 0)
      {
        sub_10000AE08(*(_QWORD *)(a1 + 56) + 32 * v32, (uint64_t)&v39);
      }
      else
      {
        v39 = 0u;
        v40 = 0u;
      }
      swift_bridgeObjectRelease(v30);
      if (*((_QWORD *)&v40 + 1))
      {
        v34 = sub_100009A34(&qword_10002E178);
        if ((swift_dynamicCast(&v37, &v39, (char *)&type metadata for Any + 8, v34, 6) & 1) != 0)
        {
          v35 = v37;
          *(_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_fileDownloadTimeout) = v29;
          v36 = *(_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_sources);
          *(_QWORD *)(v2 + OBJC_IVAR___AudioBoxInputs_sources) = v35;
          swift_bridgeObjectRelease(v36);
          return 1;
        }
        return 0;
      }
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  return 0;
}

uint64_t sub_10000B7C4(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;

  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v7 = *(_QWORD *)(a1 + *a4);
  *(_QWORD *)(a1 + *a4) = v6;
  swift_bridgeObjectRelease(v7);
  return 1;
}

id sub_10000B824()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  objc_super v9;

  v1 = &v0[OBJC_IVAR___AudioBoxInputs_audioBoxIDKey];
  *(_QWORD *)v1 = 0x786F426F69647561;
  *((_QWORD *)v1 + 1) = 0xEA00000000004449;
  v2 = &v0[OBJC_IVAR___AudioBoxInputs_audioBoxTokenKey];
  strcpy(&v0[OBJC_IVAR___AudioBoxInputs_audioBoxTokenKey], "audioBoxToken");
  *((_WORD *)v2 + 7) = -4864;
  v3 = &v0[OBJC_IVAR___AudioBoxInputs_downloadAudioFilesKey];
  *(_QWORD *)v3 = 0xD000000000000012;
  *((_QWORD *)v3 + 1) = 0x800000010001F260;
  v4 = &v0[OBJC_IVAR___AudioBoxInputs_fileDownloadTimeoutKey];
  *(_QWORD *)v4 = 0xD000000000000013;
  *((_QWORD *)v4 + 1) = 0x800000010001F280;
  v5 = &v0[OBJC_IVAR___AudioBoxInputs_sourcesKey];
  *(_QWORD *)v5 = 0x73656372756F73;
  *((_QWORD *)v5 + 1) = 0xE700000000000000;
  v6 = &v0[OBJC_IVAR___AudioBoxInputs_audioBoxID];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &v0[OBJC_IVAR___AudioBoxInputs_audioBoxToken];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v0[OBJC_IVAR___AudioBoxInputs_downloadAudioFiles] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___AudioBoxInputs_fileDownloadTimeout] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___AudioBoxInputs_sources] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v0[OBJC_IVAR___AudioBoxInputs_predicates] = &_swiftEmptyDictionarySingleton;
  *(_QWORD *)&v0[OBJC_IVAR___AudioBoxInputs_parameters] = &_swiftEmptyDictionarySingleton;
  *(_QWORD *)&v0[OBJC_IVAR___AudioBoxInputs_specifications] = &_swiftEmptyDictionarySingleton;
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for AudioBoxInputs();
  return objc_msgSendSuper2(&v9, "init");
}

id sub_10000B9A4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioBoxInputs();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AudioBoxInputs()
{
  return objc_opt_self(AudioBoxInputs);
}

uint64_t destroy for FileInfo(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 32));
}

uint64_t initializeWithCopy for FileInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

_QWORD *assignWithCopy for FileInfo(_QWORD *a1, _QWORD *a2)
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
  v6 = a2[4];
  v7 = a1[4];
  a1[4] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

__n128 initializeWithTake for FileInfo(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for FileInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FileInfo(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FileInfo(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FileInfo()
{
  return &type metadata for FileInfo;
}

void sub_10000BCB8(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_10000BD14(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_10000BD70 + 4 * byte_10001FB64[a2]))(0x746E6F7246);
}

uint64_t sub_10000BD70(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x746E6F7246 && v1 == 0xE500000000000000)
    v2 = 1;
  else
    v2 = ((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))();
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xE500000000000000);
  return v2 & 1;
}

uint64_t sub_10000BE1C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10000BE4C + 4 * byte_10001FB68[*v0]))(0x796669746E656469, 0xE800000000000000);
}

uint64_t sub_10000BE4C()
{
  return 0x73736572676F7270;
}

uint64_t sub_10000BE60()
{
  return 0x6E617254656C6966;
}

uint64_t sub_10000BE80()
{
  return 0x6F63655279616C70;
}

uint64_t sub_10000BEC0()
{
  return 0x706D6F4374736574;
}

uint64_t sub_10000BEE0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10000F660(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000BF04()
{
  return 0;
}

void sub_10000BF10(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_10000BF1C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100011D54();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000BF44(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100011D54();
  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_10000BF6C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD v10[16];
  _BYTE v11[48];

  v2 = sub_100009A34(&qword_10002E3A0);
  v10[6] = *(_QWORD *)(v2 - 8);
  v10[7] = v2;
  __chkstk_darwin();
  v10[5] = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100009A34(&qword_10002E3A8);
  v10[3] = *(_QWORD *)(v4 - 8);
  v10[4] = v4;
  __chkstk_darwin();
  v5 = sub_100009A34(&qword_10002E3B0);
  v10[1] = *(_QWORD *)(v5 - 8);
  v10[2] = v5;
  __chkstk_darwin();
  sub_100009A34(&qword_10002E3B8);
  __chkstk_darwin();
  v6 = sub_100009A34(&qword_10002E3C0);
  v10[8] = *(_QWORD *)(v6 - 8);
  v10[9] = v6;
  __chkstk_darwin();
  v8 = a1[3];
  v7 = a1[4];
  sub_10000ACF4(a1, v8);
  v9 = sub_100012084();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for OutgoingMessage.CodingKeys, &type metadata for OutgoingMessage.CodingKeys, v9, v8, v7);
  sub_10000B08C(v10[10], (uint64_t)v11);
  __asm { BR              X10 }
}

uint64_t sub_10000C128()
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

  *(_OWORD *)(v4 - 176) = *(_OWORD *)(v4 - 128);
  v5 = *(_QWORD *)(v4 - 112);
  v6 = *(_QWORD *)(v4 - 104);
  *(_BYTE *)(v4 - 160) = 0;
  v7 = sub_100012260();
  v8 = *(_QWORD *)(v4 - 184);
  ((void (*)(ValueMetadata *, uint64_t, uint64_t, ValueMetadata *, unint64_t))KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:))(&type metadata for OutgoingMessage.IdentifyCodingKeys, v4 - 160, v8, &type metadata for OutgoingMessage.IdentifyCodingKeys, v7);
  *(_OWORD *)(v4 - 160) = *(_OWORD *)(v4 - 176);
  *(_QWORD *)(v4 - 144) = v5;
  *(_QWORD *)(v4 - 136) = v6;
  sub_1000122A4();
  ((void (*)(uint64_t))KeyedEncodingContainer.encode<A>(_:forKey:))(v4 - 160);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 192) + 8))(v2, v8);
}

uint64_t sub_10000C37C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10000C3BC + 4 * byte_10001FB72[a1]))(0x6965636552646964, 0xEE00656C69466576);
}

unint64_t sub_10000C3BC()
{
  return 0xD000000000000010;
}

unint64_t sub_10000C3F8()
{
  return 0xD000000000000011;
}

unint64_t sub_10000C434()
{
  return 0xD000000000000011;
}

void sub_10000C44C()
{
  JUMPOUT(0x10000C460);
}

uint64_t sub_10000C46C()
{
  return 0x6E6964726F636572;
}

void sub_10000C490(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD v21[3];
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v46 = a4;
  v42 = a3;
  v47 = a2;
  v5 = sub_100009A34(&qword_10002E898);
  v36 = *(_QWORD *)(v5 - 8);
  v37 = v5;
  __chkstk_darwin();
  v35 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100009A34(&qword_10002E8A0);
  v33 = *(_QWORD *)(v7 - 8);
  v34 = v7;
  __chkstk_darwin();
  v32 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100009A34(&qword_10002E8A8);
  v30 = *(_QWORD *)(v9 - 8);
  v31 = v9;
  __chkstk_darwin();
  v29 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_100009A34(&qword_10002E8B0);
  v27 = *(_QWORD *)(v28 - 8);
  __chkstk_darwin();
  v26 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100009A34(&qword_10002E8B8);
  v24 = *(_QWORD *)(v25 - 8);
  __chkstk_darwin();
  v23 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_100009A34(&qword_10002E8C0);
  v21[2] = *(_QWORD *)(v22 - 8);
  __chkstk_darwin();
  v21[1] = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100009A34(&qword_10002E8C8);
  v40 = *(_QWORD *)(v14 - 8);
  v41 = v14;
  __chkstk_darwin();
  v15 = sub_100009A34(&qword_10002E8D0);
  v38 = *(_QWORD *)(v15 - 8);
  v39 = v15;
  __chkstk_darwin();
  sub_100009A34(&qword_10002E8D8);
  __chkstk_darwin();
  v45 = sub_100009A34(&qword_10002E8E0);
  v43 = *(_QWORD *)(v45 - 8);
  __chkstk_darwin();
  v17 = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = a1[3];
  v18 = a1[4];
  sub_10000ACF4(a1, v19);
  v20 = sub_1000169C0();
  v44 = v17;
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for Status.CodingKeys, &type metadata for Status.CodingKeys, v20, v19, v18);
  __asm { BR              X10 }
}

uint64_t sub_10000C7C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v3 - 89) = 0;
  v4 = sub_100016C24();
  v6 = *(_QWORD *)(v3 - 136);
  v5 = *(_QWORD *)(v3 - 128);
  ((void (*)(ValueMetadata *, uint64_t, uint64_t, ValueMetadata *, unint64_t))KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:))(&type metadata for Status.DidReceiveFileCodingKeys, v3 - 89, v5, &type metadata for Status.DidReceiveFileCodingKeys, v4);
  ((void (*)(_QWORD, _QWORD))KeyedEncodingContainer.encode(_:forKey:))(*(_QWORD *)(v3 - 104), *(_QWORD *)(v3 - 152));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 144) + 8))(v6, v5);
}

uint64_t sub_10000CB2C(_QWORD *a1)
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
  uint64_t v18;
  char v19;
  char v20;
  char v21;

  v3 = v1;
  v5 = sub_100009A34(&qword_10002E2E0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_10000ACF4(a1, v9);
  v11 = sub_100011528();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for FileInfo.CodingKeys, &type metadata for FileInfo.CodingKeys, v11, v9, v10);
  v12 = *v3;
  v13 = v3[1];
  v21 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, &v21, v5);
  if (!v2)
  {
    v14 = v3[2];
    v20 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, &v20, v5);
    v15 = v3[3];
    v16 = v3[4];
    v19 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v15, v16, &v19, v5);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10000CC70()
{
  return 0x6574656D61726170;
}

void sub_10000CC90(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10000CC9C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100011EEC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000CCC4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100011EEC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000CCEC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100011FFC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000CD14(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100011FFC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000CD3C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100011E64();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000CD64(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100011E64();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000CD8C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100011F74();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000CDB4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100011F74();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000CDDC()
{
  return 0;
}

uint64_t sub_10000CDE8@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease(a1);
  *a2 = 1;
  return result;
}

uint64_t sub_10000CE14(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100011E20();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000CE3C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100011E20();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000CE64(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100011D98();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000CE8C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100011D98();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000CEB4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  _BYTE v5[56];

  result = sub_10000F958(a1, (uint64_t)v5);
  if (!v2)
    return sub_10000AF24((uint64_t)v5, a2);
  return result;
}

uint64_t sub_10000CEF8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10000CF28 + 4 * byte_10001FB85[*v0]))(0x796669746E656469, 0xE800000000000000);
}

uint64_t sub_10000CF28()
{
  return 0x737574617473;
}

uint64_t sub_10000CF3C()
{
  return 0x6E617254656C6966;
}

uint64_t sub_10000CF5C()
{
  return 0x7365547472617473;
}

uint64_t sub_10000CF78@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100010238(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000CF9C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_10000CFA8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100012084();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000CFD0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100012084();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000CFF8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100012150();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D020(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100012150();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000D048(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100012260();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D070(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100012260();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000D098(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000120C8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D0C0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000120C8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000D0E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v6;
  uint64_t result;
  char v8;

  if (a1 == 0x6574656D61726170 && a2 == 0xEA00000000007372)
  {
    result = swift_bridgeObjectRelease(0xEA00000000007372);
    v8 = 0;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6574656D61726170, 0xEA00000000007372, a1, a2, 0);
    result = swift_bridgeObjectRelease(a2);
    v8 = v6 ^ 1;
  }
  *a3 = v8 & 1;
  return result;
}

uint64_t sub_10000D188(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000121D8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D1B0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000121D8();
  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_10000D1D8(_QWORD *a1)
{
  uint64_t v1;
  _BYTE v3[40];

  sub_10000B08C(v1, (uint64_t)v3);
  sub_10000BF6C(a1);
}

uint64_t sub_10000D224()
{
  unsigned __int8 *v0;

  return sub_10000C37C(*v0);
}

uint64_t sub_10000D22C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10001040C(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000D250(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_10000D25C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000169C0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D284(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000169C0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000D2AC()
{
  return 0x656D614E656C6966;
}

uint64_t sub_10000D2C8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016C24();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D2F0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016C24();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000D318(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016BE0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D340(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016BE0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000D368@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v6;
  uint64_t result;
  char v8;

  if (a1 == 0x656D614E656C6966 && a2 == 0xE800000000000000)
  {
    result = swift_bridgeObjectRelease(0xE800000000000000);
    v8 = 0;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x656D614E656C6966, 0xE800000000000000, a1, a2, 0);
    result = swift_bridgeObjectRelease(a2);
    v8 = v6 ^ 1;
  }
  *a3 = v8 & 1;
  return result;
}

uint64_t sub_10000D3FC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016B9C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D424(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016B9C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000D44C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016B14();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D474(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016B14();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000D49C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016B58();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D4C4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016B58();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000D4EC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016AD0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D514(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016AD0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000D53C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016A48();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D564(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016A48();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000D58C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016A8C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D5B4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016A8C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000D5DC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016A04();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D604(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016A04();
  return CodingKey.debugDescription.getter(a1, v2);
}

char *sub_10000D62C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char *result;
  uint64_t v5;
  char v6;

  result = sub_100010800(a1);
  if (!v2)
  {
    *(_QWORD *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
    *(_BYTE *)(a2 + 16) = v6;
  }
  return result;
}

void sub_10000D658(_QWORD *a1)
{
  uint64_t v1;

  sub_10000C490(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_10000D674()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 1702521203;
  if (*v0 != 1)
    v1 = 0x6D75736B63656863;
  if (*v0)
    return v1;
  else
    return 1701667182;
}

uint64_t sub_10000D6C0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100011218(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000D6E4(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_10000D6F0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100011528();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D718(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100011528();
  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10000D740@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  sub_10001134C(a1, (uint64_t *)v6);
  if (!v2)
  {
    result = *(double *)v6;
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_QWORD *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_10000D784(_QWORD *a1)
{
  return sub_10000CB2C(a1);
}

BOOL sub_10000D798(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void sub_10000D7B0()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

uint64_t sub_10000D7D8()
{
  _BYTE *v0;

  if (*v0)
    return 0x6C656E6E616863;
  else
    return 1701080941;
}

uint64_t sub_10000D80C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1000122E8(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000D830(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10000D83C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100015488();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D864(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100015488();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000D88C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = sub_1000123C8(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

BOOL sub_10000D8B4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10000D8C8()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x656D756C6F76;
  if (*v0 != 1)
    v1 = 0x73756C756D697473;
  if (*v0)
    return v1;
  else
    return 0x6E656E6F706D6F63;
}

uint64_t sub_10000D92C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100012554(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000D950(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001286C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D978(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001286C();
  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10000D9A0@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  sub_1000126C4(a1, (uint64_t)v6);
  if (!v2)
  {
    result = *(double *)v6;
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_QWORD *)(a2 + 32) = v7;
  }
  return result;
}

void sub_10000D9E4(char *a1)
{
  sub_10000BCB8(*a1);
}

void sub_10000D9F0()
{
  unsigned __int8 *v0;
  uint64_t v1;
  _QWORD v2[9];

  v1 = *v0;
  Hasher.init(_seed:)(v2, 0);
  __asm { BR              X9 }
}

Swift::Int sub_10000DA40()
{
  uint64_t v1;

  ((void (*)(uint64_t *, uint64_t, unint64_t))String.hash(into:))(&v1, 0x746E6F7246, 0xE500000000000000);
  swift_bridgeObjectRelease(0xE500000000000000);
  return Hasher._finalize()();
}

void sub_10000DAAC()
{
  __asm { BR              X10 }
}

uint64_t sub_10000DAEC(uint64_t a1)
{
  ((void (*)(uint64_t, uint64_t, unint64_t))String.hash(into:))(a1, 0x746E6F7246, 0xE500000000000000);
  return swift_bridgeObjectRelease(0xE500000000000000);
}

void sub_10000DB44(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v2;
  _QWORD v3[9];

  v2 = *v1;
  Hasher.init(_seed:)(v3, a1);
  __asm { BR              X9 }
}

Swift::Int sub_10000DB90()
{
  uint64_t v1;

  ((void (*)(uint64_t *, uint64_t, unint64_t))String.hash(into:))(&v1, 0x746E6F7246, 0xE500000000000000);
  swift_bridgeObjectRelease(0xE500000000000000);
  return Hasher._finalize()();
}

unint64_t sub_10000DBFC@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_100013FDC(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000DC28()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_10000DC5C + 4 * byte_10001FB95[*v0]))();
}

void sub_10000DC5C(_QWORD *a1@<X8>)
{
  *a1 = 0x746E6F7246;
  a1[1] = 0xE500000000000000;
}

void sub_10000DC74(_QWORD *a1@<X8>)
{
  *a1 = 1801675074;
  a1[1] = 0xE400000000000000;
}

void sub_10000DC88(_QWORD *a1@<X8>)
{
  *a1 = 0x746F427468676952;
  a1[1] = 0xEB000000006D6F74;
}

uint64_t sub_10000DCAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100017ED0();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_10000DD08()
{
  return 0x6E656E6F706D6F63;
}

uint64_t sub_10000DD24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v6;
  uint64_t result;
  char v8;

  if (a1 == 0x6E656E6F706D6F63 && a2 == 0xE900000000000074)
  {
    result = swift_bridgeObjectRelease(0xE900000000000074);
    v8 = 0;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E656E6F706D6F63, 0xE900000000000074, a1, a2, 0);
    result = swift_bridgeObjectRelease(a2);
    v8 = v6 ^ 1;
  }
  *a3 = v8 & 1;
  return result;
}

uint64_t sub_10000DDC4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016624();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000DDEC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016624();
  return CodingKey.debugDescription.getter(a1, v2);
}

unint64_t sub_10000DE14@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  unint64_t result;

  result = sub_100014024(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_10000DE3C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  char v20;

  v17 = a3;
  v8 = sub_100009A34(&qword_10002E938);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v13 = a1[4];
  sub_10000ACF4(a1, v12);
  v14 = sub_100016C68();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for OSVersion.CodingKeys, &type metadata for OSVersion.CodingKeys, v14, v12, v13);
  v20 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(a2, &v20, v8);
  if (!v4)
  {
    v19 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v17, &v19, v8);
    v18 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(a4, &v18, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_10000DF88(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v4 = sub_100009A34(&qword_10002E630);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  sub_10000ACF4(a1, v8);
  v10 = sub_1000150DC();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for FileTransferParameters.CodingKeys, &type metadata for FileTransferParameters.CodingKeys, v10, v8, v9);
  v13 = a2;
  sub_100009A34(&qword_10002E5C8);
  sub_1000152D0(&qword_10002E638, &qword_10002E5C8, (void (*)(void))sub_100015334, (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v13);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_10000E0AC()
{
  char *v0;

  return qword_100022868[*v0];
}

uint64_t sub_10000E0CC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100014144(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000E0F0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016C68();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E118(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016C68();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E140@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_1000142D0(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_10000E16C(_QWORD *a1)
{
  uint64_t *v1;

  return sub_10000DE3C(a1, *v1, v1[1], v1[2]);
}

uint64_t sub_10000E188()
{
  return 0x73656C6966;
}

uint64_t sub_10000E19C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v6;
  uint64_t result;
  char v8;

  if (a1 == 0x73656C6966 && a2 == 0xE500000000000000)
  {
    result = swift_bridgeObjectRelease(0xE500000000000000);
    v8 = 0;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x73656C6966, 0xE500000000000000, a1, a2, 0);
    result = swift_bridgeObjectRelease(a2);
    v8 = v6 ^ 1;
  }
  *a3 = v8 & 1;
  return result;
}

uint64_t sub_10000E228(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000150DC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E250(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000150DC();
  return CodingKey.debugDescription.getter(a1, v2);
}

_QWORD *sub_10000E278@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_100014448(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_10000E2A0(_QWORD *a1)
{
  uint64_t *v1;

  return sub_10000DF88(a1, *v1);
}

uint64_t sub_10000E2B8()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6C6F636F746F7270;
  if (*v0 != 1)
    v1 = 0x656C69666F7270;
  if (*v0)
    return v1;
  else
    return 0x6E656B6F74;
}

uint64_t sub_10000E31C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100014594(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000E340(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000151EC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E368(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000151EC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E390@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_100014704(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_10000E3BC()
{
  return 0x73736572676F7270;
}

uint64_t sub_10000E3D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v6;
  uint64_t result;
  char v8;

  if (a1 == 0x73736572676F7270 && a2 == 0xE800000000000000)
  {
    result = swift_bridgeObjectRelease(0xE800000000000000);
    v8 = 0;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x73736572676F7270, 0xE800000000000000, a1, a2, 0);
    result = swift_bridgeObjectRelease(a2);
    v8 = v6 ^ 1;
  }
  *a3 = v8 & 1;
  return result;
}

uint64_t sub_10000E468(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100015164();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E490(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100015164();
  return CodingKey.debugDescription.getter(a1, v2);
}

_QWORD *sub_10000E4B8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_1000148FC(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_10000E4E0()
{
  _BYTE *v0;

  if (*v0)
    return 0x737475706E69;
  else
    return 0x74757074756FLL;
}

uint64_t sub_10000E50C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100014A48(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000E530(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100015010();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E558(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100015010();
  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10000E580@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;

  sub_100014B28(a1, v6);
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

uint64_t sub_10000E5C0()
{
  _BYTE *v0;

  if (*v0)
    return 0x73746C75736572;
  else
    return 0x6F43737574617473;
}

uint64_t sub_10000E600@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100014D44(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000E624(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100014FCC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E64C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100014FCC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E674@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = sub_100014E40(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_10000E69C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[3];
  char v21;

  v18 = a4;
  v19 = a5;
  v9 = sub_100009A34(&qword_10002E660);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[3];
  v13 = a1[4];
  sub_10000ACF4(a1, v14);
  v15 = sub_100015400();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for OutgoingIdentifyParameters.CodingKeys, &type metadata for OutgoingIdentifyParameters.CodingKeys, v15, v14, v13);
  LOBYTE(v20[0]) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(a2, v20, v9);
  if (!v5)
  {
    v20[0] = a3;
    v20[1] = v18;
    v20[2] = v19;
    v21 = 1;
    sub_100015444();
    KeyedEncodingContainer.encode<A>(_:forKey:)(v20);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_10000E7E0(_QWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD v17[2];
  char v18;

  v8 = sub_100009A34(&qword_10002E648);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v17[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v13 = a1[4];
  sub_10000ACF4(a1, v12);
  v14 = sub_100015378();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for StatusParameters.CodingKeys, &type metadata for StatusParameters.CodingKeys, v14, v12, v13);
  v17[0] = a2;
  v17[1] = a3;
  v18 = a4;
  sub_1000153BC();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v17);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_10000E8EC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v16 = a3;
  v8 = sub_100009A34(&qword_10002E618);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v13 = a1[4];
  sub_10000ACF4(a1, v12);
  v14 = sub_10001528C();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for StartTestParameters.CodingKeys, &type metadata for StartTestParameters.CodingKeys, v14, v12, v13);
  v18 = a2;
  v17 = 0;
  sub_100009A34(&qword_10002E578);
  sub_10000B1DC(&qword_10002E628, &qword_10002E578, (uint64_t)&unk_1000218E8);
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v18);
  if (!v4)
  {
    v18 = v16;
    v17 = 1;
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v18);
    v18 = a4;
    v17 = 2;
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v18);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

Swift::Int sub_10000EA90()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_10000EAD4(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10000EB14()
{
  _BYTE *v0;

  if (*v0)
    return 0x6F6973726556736FLL;
  else
    return 0x6C6F636F746F7270;
}

uint64_t sub_10000EB60@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1000166AC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000EB84(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100015400();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000EBAC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100015400();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000EBD4(_QWORD *a1)
{
  uint64_t *v1;

  return sub_10000E69C(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_10000EBF0()
{
  return 0x737574617473;
}

uint64_t sub_10000EC04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v6;
  uint64_t result;
  char v8;

  if (a1 == 0x737574617473 && a2 == 0xE600000000000000)
  {
    result = swift_bridgeObjectRelease(0xE600000000000000);
    v8 = 0;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x737574617473, 0xE600000000000000, a1, a2, 0);
    result = swift_bridgeObjectRelease(a2);
    v8 = v6 ^ 1;
  }
  *a3 = v8 & 1;
  return result;
}

uint64_t sub_10000EC90(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100015378();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000ECB8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100015378();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000ECE0(_QWORD *a1)
{
  uint64_t v1;

  return sub_10000E7E0(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_BYTE *)(v1 + 16));
}

uint64_t sub_10000ECFC()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6574656D61726170;
  if (*v0 != 1)
    v1 = 0x6369666963657073;
  if (*v0)
    return v1;
  else
    return 0x7461636964657270;
}

uint64_t sub_10000ED68@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1000167CC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000ED8C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001528C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000EDB4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001528C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000EDDC(_QWORD *a1)
{
  uint64_t *v1;

  return sub_10000E8EC(a1, *v1, v1[1], v1[2]);
}

uint64_t sub_10000EDF8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  void (*v29)(char *, char *, uint64_t);
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t WitnessTable;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  void (*v42)(char *, char *, uint64_t);
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t AssociatedTypeWitness;
  _QWORD v61[3];
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;

  v53 = a5;
  v9 = type metadata accessor for Optional(0);
  v51 = *(_QWORD *)(v9 - 8);
  v52 = v9;
  v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  v57 = (char *)&v45 - v11;
  v55 = *(_QWORD *)(a2 - 8);
  __chkstk_darwin(v10);
  v50 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, a3, a2, &protocol requirements base descriptor for RawRepresentable, &associated type descriptor for RawRepresentable.RawValue);
  v56 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v13 = __chkstk_darwin(AssociatedTypeWitness);
  v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v58 = (char *)&v45 - v16;
  v59 = a4;
  v54 = a3;
  v17 = type metadata accessor for RawValueDecodable(0, a2, a3, a4);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v45 - v19;
  v22 = a1[3];
  v21 = a1[4];
  sub_10000ACF4(a1, v22);
  v23 = v64;
  dispatch thunk of Decoder.singleValueContainer()(v61, v22, v21);
  if (!v23)
  {
    v48 = v17;
    v49 = v15;
    v46 = v20;
    v47 = v18;
    v64 = a1;
    v24 = v56;
    v25 = v57;
    v27 = v62;
    v26 = v63;
    sub_10000ACF4(v61, v62);
    v28 = v58;
    dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)(AssociatedTypeWitness, AssociatedTypeWitness, v59, v27, v26);
    v29 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
    v30 = v49;
    v29(v49, v28, AssociatedTypeWitness);
    v31 = a2;
    v32 = a2;
    v33 = v54;
    dispatch thunk of RawRepresentable.init(rawValue:)(v30, v32, v54);
    v34 = v55;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v55 + 48))(v25, 1, v31) != 1)
    {
      (*(void (**)(char *, uint64_t))(v24 + 8))(v28, AssociatedTypeWitness);
      v42 = *(void (**)(char *, char *, uint64_t))(v34 + 32);
      v43 = v50;
      v42(v50, v25, v31);
      v44 = v46;
      v42(v46, v43, v31);
      sub_10000B224(v61);
      (*(void (**)(uint64_t, char *, uint64_t))(v47 + 32))(v53, v44, v48);
      v40 = v64;
      return sub_10000B224(v40);
    }
    (*(void (**)(char *, uint64_t))(v51 + 8))(v25, v52);
    v35 = type metadata accessor for RawValueDecodable.DecodingError(0, v31, v33, v59);
    WitnessTable = swift_getWitnessTable(&unk_1000223F8, v35);
    swift_allocError(v35, WitnessTable, 0, 0);
    v37 = AssociatedTypeWitness;
    v39 = ((uint64_t (*)(uint64_t, char *, uint64_t))v29)(v38, v28, AssociatedTypeWitness);
    swift_willThrow(v39);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v28, v37);
    sub_10000B224(v61);
    a1 = v64;
  }
  v40 = a1;
  return sub_10000B224(v40);
}

uint64_t sub_10000F144@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10000EDF8(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_10000F164@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  id v23;
  void *v24;
  Class isa;
  id v26;
  id v27;
  _QWORD *v28;
  id v29;
  char *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t, uint64_t);
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  char *v37;
  _QWORD *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t WitnessTable;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  id v56[4];
  _QWORD v57[3];
  uint64_t v58;
  uint64_t v59;

  v52 = a3;
  v5 = type metadata accessor for Optional(0);
  v50 = *(_QWORD *)(v5 - 8);
  v51 = v5;
  v6 = __chkstk_darwin(v5);
  v54 = (char *)&v46 - v7;
  v53 = *(_QWORD *)(a2 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for SerializedCodable(0, a2, v10, v11);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v46 - v14;
  v16 = a1[3];
  v17 = a1[4];
  sub_10000ACF4(a1, v16);
  v18 = v55;
  dispatch thunk of Decoder.singleValueContainer()(v57, v16, v17);
  if (v18)
    goto LABEL_10;
  v47 = v15;
  v48 = v13;
  v49 = v9;
  v55 = v12;
  v20 = v58;
  v19 = v59;
  sub_10000ACF4(v57, v58);
  v21 = sub_1000165D4();
  dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)(&type metadata for Data, &type metadata for Data, v21, v20, v19);
  v23 = v56[0];
  v22 = v56[1];
  v24 = (void *)objc_opt_self(NSJSONSerialization);
  isa = Data._bridgeToObjectiveC()().super.isa;
  v56[0] = 0;
  v26 = objc_msgSend(v24, "JSONObjectWithData:options:error:", isa, 0, v56);

  v27 = v56[0];
  if (!v26)
  {
    v39 = v56[0];
    _convertNSErrorToError(_:)(v27);

    goto LABEL_8;
  }
  v28 = a1;
  v29 = v56[0];
  _bridgeAnyObjectToAny(_:)(v56, v26);
  swift_unknownObjectRelease(v26);
  v30 = v54;
  v31 = a2;
  v32 = swift_dynamicCast(v54, v56, (char *)&type metadata for Any + 8, a2, 6);
  v33 = v53;
  v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v53 + 56);
  if ((v32 & 1) == 0)
  {
    v34(v30, 1, 1, a2);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v30, v51);
    v43 = type metadata accessor for SerializedCodable.DecodingError(0, a2, v41, v42);
    WitnessTable = swift_getWitnessTable(&unk_100022820, v43);
    v40 = swift_allocError(v43, WitnessTable, 0, 0);
LABEL_8:
    swift_willThrow(v40);
    sub_100008A34((uint64_t)v23, (unint64_t)v22);
    sub_10000B224(v57);
LABEL_10:
    v38 = a1;
    return sub_10000B224(v38);
  }
  v34(v30, 0, 1, a2);
  sub_100008A34((uint64_t)v23, (unint64_t)v22);
  v35 = *(void (**)(char *, char *, uint64_t))(v33 + 32);
  v36 = v49;
  v35(v49, v30, a2);
  v37 = v47;
  v35(v47, v36, v31);
  sub_10000B224(v57);
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))(v52, v37, v55);
  v38 = v28;
  return sub_10000B224(v38);
}

uint64_t sub_10000F4C4(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  id v20[2];
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;

  v3 = v2;
  v5 = a1[3];
  v6 = a1[4];
  sub_10000ACF4(a1, v5);
  dispatch thunk of Encoder.singleValueContainer()(v21, v5, v6);
  v7 = (void *)objc_opt_self(NSJSONSerialization);
  v8 = _bridgeAnythingToObjectiveC<A>(_:)(v3, *(_QWORD *)(a2 + 16));
  v20[0] = 0;
  v9 = objc_msgSend(v7, "dataWithJSONObject:options:error:", v8, 0, v20);
  swift_unknownObjectRelease(v8);
  v10 = v20[0];
  if (v9)
  {
    v11 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v13 = v12;

    v20[0] = v11;
    v20[1] = v13;
    v14 = v22;
    v15 = v23;
    sub_100016954((uint64_t)v21, v22);
    v16 = sub_10001697C();
    dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)(v20, &type metadata for Data, v16, v14, v15);
    sub_100008A34((uint64_t)v11, (unint64_t)v13);
  }
  else
  {
    v17 = v10;
    _convertNSErrorToError(_:)(v10);

    swift_willThrow(v18);
  }
  return sub_10000B224(v21);
}

uint64_t sub_10000F634@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10000F164(a1, *(_QWORD *)(a2 + 16), a3);
}

uint64_t sub_10000F64C(_QWORD *a1, uint64_t a2)
{
  return sub_10000F4C4(a1, a2);
}

uint64_t sub_10000F660(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char v11;

  if (a1 == 0x796669746E656469 && a2 == 0xE800000000000000)
  {
    v5 = 0xE800000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x796669746E656469, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x73736572676F7270 && a2 == 0xE800000000000000)
  {
    v7 = 0xE800000000000000;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x73736572676F7270, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x6E617254656C6966 && a2 == 0xEC00000072656673)
  {
    v8 = 0xEC00000072656673;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6E617254656C6966, 0xEC00000072656673, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_20;
  }
  if (a1 == 0x6F63655279616C70 && a2 == 0xEF6F696475416472)
  {
    v9 = 0xEF6F696475416472;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6F63655279616C70, 0xEF6F696475416472, a1, a2, 0) & 1) != 0)
  {
    v9 = a2;
    goto LABEL_26;
  }
  if (a1 == 0x6F636552706F7473 && a2 == 0xED0000676E696472)
  {
    v10 = 0xED0000676E696472;
LABEL_32:
    swift_bridgeObjectRelease(v10);
    return 4;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6F636552706F7473, 0xED0000676E696472, a1, a2, 0) & 1) != 0)
  {
    v10 = a2;
    goto LABEL_32;
  }
  if (a1 == 0x706D6F4374736574 && a2 == 0xEC0000006574656CLL)
  {
    swift_bridgeObjectRelease(0xEC0000006574656CLL);
    return 5;
  }
  else
  {
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)(0x706D6F4374736574, 0xEC0000006574656CLL, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v11 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_10000F958@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
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
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;

  v44 = a2;
  v3 = sub_100009A34(&qword_10002E300);
  v47 = *(_QWORD *)(v3 - 8);
  v48 = v3;
  __chkstk_darwin();
  v46 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100009A34(&qword_10002E308);
  v37 = *(_QWORD *)(v5 - 8);
  v38 = v5;
  __chkstk_darwin();
  v43 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100009A34(&qword_10002E310);
  v8 = *(_QWORD *)(v7 - 8);
  v39 = v7;
  v40 = v8;
  __chkstk_darwin();
  v45 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100009A34(&qword_10002E318);
  v35 = *(_QWORD *)(v10 - 8);
  v36 = v10;
  __chkstk_darwin();
  v42 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_100009A34(&qword_10002E320);
  v33[4] = *(_QWORD *)(v34 - 8);
  __chkstk_darwin();
  v41 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100009A34(&qword_10002E328);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin();
  v16 = (char *)v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100009A34(&qword_10002E330);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin();
  v20 = (char *)v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = a1[3];
  v22 = a1[4];
  v49 = a1;
  sub_10000ACF4(a1, v21);
  v23 = sub_100011D54();
  v24 = v50;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for IncomingMessage.CodingKeys, &type metadata for IncomingMessage.CodingKeys, v23, v21, v22);
  if (!v24)
  {
    v33[3] = v16;
    v33[1] = v14;
    v33[2] = v13;
    v50 = v18;
    v25 = KeyedDecodingContainer.allKeys.getter(v17);
    v26 = v25;
    if (*(_QWORD *)(v25 + 16) == 1)
      __asm { BR              X10 }
    v27 = type metadata accessor for DecodingError(0);
    swift_allocError(v27, &protocol witness table for DecodingError, 0, 0);
    v29 = v28;
    sub_100009A34(&qword_10002E340);
    *v29 = &type metadata for IncomingMessage;
    v30 = KeyedDecodingContainer.codingPath.getter(v17);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)(v30, 0xD00000000000002BLL, 0x800000010001F2D0, 0);
    v31 = (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v29, enum case for DecodingError.typeMismatch(_:), v27);
    swift_willThrow(v31);
    swift_bridgeObjectRelease(v26);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v20, v17);
  }
  return sub_10000B224(v49);
}

uint64_t sub_100010238(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  char v9;

  if (a1 == 0x796669746E656469 && a2 == 0xE800000000000000)
  {
    v5 = 0xE800000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x796669746E656469, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x737574617473 && a2 == 0xE600000000000000)
  {
    v7 = 0xE600000000000000;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x737574617473, 0xE600000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x6E617254656C6966 && a2 == 0xEC00000072656673)
  {
    v8 = 0xEC00000072656673;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6E617254656C6966, 0xEC00000072656673, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_20;
  }
  if (a1 == 0x7365547472617473 && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease(0xE900000000000074);
    return 3;
  }
  else
  {
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0x7365547472617473, 0xE900000000000074, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v9 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_10001040C(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;

  if (a1 == 0x6965636552646964 && a2 == 0xEE00656C69466576)
  {
    v5 = 0xEE00656C69466576;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6965636552646964, 0xEE00656C69466576, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0xD000000000000010)
  {
    v7 = 0x800000010001F300;
    if (a2 == 0x800000010001F300)
      goto LABEL_13;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010, 0x800000010001F300, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
LABEL_13:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if (a1 == 0x646E6553656C6966 && a2 == 0xED0000726F727245)
  {
    v8 = 0xED0000726F727245;
LABEL_19:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x646E6553656C6966, 0xED0000726F727245, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_19;
  }
  if (a1 == 0xD000000000000010)
  {
    v9 = 0x800000010001F320;
    if (a2 == 0x800000010001F320)
      goto LABEL_24;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010, 0x800000010001F320, a1, a2, 0) & 1) != 0)
  {
    v9 = a2;
LABEL_24:
    swift_bridgeObjectRelease(v9);
    return 3;
  }
  if (a1 == 0xD000000000000011)
  {
    v10 = 0x800000010001F340;
    if (a2 == 0x800000010001F340)
      goto LABEL_29;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011, 0x800000010001F340, a1, a2, 0) & 1) != 0)
  {
    v10 = a2;
LABEL_29:
    swift_bridgeObjectRelease(v10);
    return 4;
  }
  if (a1 == 0x6B63616279616C70 && a2 == 0xED0000726F727245)
  {
    v11 = 0xED0000726F727245;
LABEL_35:
    swift_bridgeObjectRelease(v11);
    return 5;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6B63616279616C70, 0xED0000726F727245, a1, a2, 0) & 1) != 0)
  {
    v11 = a2;
    goto LABEL_35;
  }
  if (a1 == 0xD000000000000011)
  {
    v12 = 0x800000010001F360;
    if (a2 == 0x800000010001F360)
      goto LABEL_40;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011, 0x800000010001F360, a1, a2, 0) & 1) != 0)
  {
    v12 = a2;
LABEL_40:
    swift_bridgeObjectRelease(v12);
    return 6;
  }
  if (a1 == 0xD000000000000012 && a2 == 0x800000010001F380)
  {
    v13 = 0x800000010001F380;
LABEL_46:
    swift_bridgeObjectRelease(v13);
    return 7;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012, 0x800000010001F380, a1, a2, 0) & 1) != 0)
  {
    v13 = a2;
    goto LABEL_46;
  }
  if (a1 == 0x6E6964726F636572 && a2 == 0xEE00726F72724567)
  {
    swift_bridgeObjectRelease(0xEE00726F72724567);
    return 8;
  }
  else
  {
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E6964726F636572, 0xEE00726F72724567, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v14 & 1) != 0)
      return 8;
    else
      return 9;
  }
}

char *sub_100010800(_QWORD *a1)
{
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
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
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;

  v56 = sub_100009A34(&qword_10002E948);
  v47 = *(_QWORD *)(v56 - 8);
  __chkstk_darwin();
  v50 = (char *)v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100009A34(&qword_10002E950);
  v45 = *(_QWORD *)(v3 - 8);
  v46 = v3;
  __chkstk_darwin();
  v55 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = sub_100009A34(&qword_10002E958);
  v41 = *(_QWORD *)(v44 - 8);
  __chkstk_darwin();
  v52 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100009A34(&qword_10002E960);
  v42 = *(_QWORD *)(v6 - 8);
  v43 = v6;
  __chkstk_darwin();
  v54 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100009A34(&qword_10002E968);
  v39 = *(_QWORD *)(v8 - 8);
  v40 = v8;
  __chkstk_darwin();
  v51 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_100009A34(&qword_10002E970);
  v35 = *(_QWORD *)(v37 - 8);
  __chkstk_darwin();
  v49 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = sub_100009A34(&qword_10002E978);
  v36 = *(_QWORD *)(v38 - 8);
  __chkstk_darwin();
  v53 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_100009A34(&qword_10002E980);
  v33[4] = *(_QWORD *)(v34 - 8);
  __chkstk_darwin();
  v48 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100009A34(&qword_10002E988);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin();
  v16 = (char *)v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100009A34(&qword_10002E990);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin();
  v20 = (char *)v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = a1[3];
  v21 = (char *)a1[4];
  v57 = a1;
  sub_10000ACF4(a1, v22);
  v23 = sub_1000169C0();
  v24 = v58;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for Status.CodingKeys, &type metadata for Status.CodingKeys, v23, v22, v21);
  if (!v24)
  {
    v33[3] = v16;
    v33[1] = v14;
    v33[2] = v13;
    v58 = v18;
    v25 = KeyedDecodingContainer.allKeys.getter(v17);
    v26 = v25;
    if (*(_QWORD *)(v25 + 16) == 1)
      __asm { BR              X10 }
    v27 = type metadata accessor for DecodingError(0);
    swift_allocError(v27, &protocol witness table for DecodingError, 0, 0);
    v29 = v28;
    v21 = (char *)v28 + *(int *)(sub_100009A34(&qword_10002E340) + 48);
    *v29 = &type metadata for Status;
    v30 = KeyedDecodingContainer.codingPath.getter(v17);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)(v30, 0xD00000000000002BLL, 0x800000010001F2D0, 0);
    v31 = (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v29, enum case for DecodingError.typeMismatch(_:), v27);
    swift_willThrow(v31);
    swift_bridgeObjectRelease(v26);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v20, v17);
  }
  sub_10000B224(v57);
  return v21;
}

uint64_t sub_100011218(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  char v8;

  if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    v5 = 0xE400000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1701667182, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 1702521203 && a2 == 0xE400000000000000)
  {
    v7 = 0xE400000000000000;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1702521203, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x6D75736B63656863 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease(0xE800000000000000);
    return 2;
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6D75736B63656863, 0xE800000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v8 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_10001134C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  char v23;
  char v24;
  char v25;

  v5 = sub_100009A34(&qword_10002E2D0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_10000ACF4(a1, v9);
  v11 = sub_100011528();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for FileInfo.CodingKeys, &type metadata for FileInfo.CodingKeys, v11, v9, v10);
  if (v2)
    return sub_10000B224(a1);
  v25 = 0;
  v12 = KeyedDecodingContainer.decode(_:forKey:)(&v25, v5);
  v14 = v13;
  v24 = 1;
  swift_bridgeObjectRetain(v13);
  v22 = KeyedDecodingContainer.decode(_:forKey:)(&v24, v5);
  v23 = 2;
  v15 = KeyedDecodingContainer.decode(_:forKey:)(&v23, v5);
  v17 = v16;
  v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  v19 = v15;
  v18(v8, v5);
  swift_bridgeObjectRetain(v17);
  sub_10000B224(a1);
  swift_bridgeObjectRelease(v17);
  result = swift_bridgeObjectRelease(v14);
  *a2 = v12;
  a2[1] = v14;
  a2[2] = v22;
  a2[3] = v19;
  a2[4] = v17;
  return result;
}

unint64_t sub_100011528()
{
  unint64_t result;

  result = qword_10002E2D8;
  if (!qword_10002E2D8)
  {
    result = swift_getWitnessTable(&unk_10001FE24, &type metadata for FileInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E2D8);
  }
  return result;
}

uint64_t sub_10001156C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 3:
      swift_bridgeObjectRetain(result);
      swift_bridgeObjectRetain(a2);
      result = a3;
      return swift_bridgeObjectRetain(result);
    case 2:
      return swift_bridgeObjectRetain(result);
    case 1:
      return sub_1000115D8(result, a2, a3);
  }
  return result;
}

uint64_t sub_1000115D8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRetain(a2);
  return result;
}

uint64_t destroy for OutgoingMessage(uint64_t a1)
{
  return sub_100011604(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t sub_100011604(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 3:
      swift_bridgeObjectRelease(result);
      swift_bridgeObjectRelease(a2);
      result = a3;
      return swift_bridgeObjectRelease(result);
    case 2:
      return swift_bridgeObjectRelease(result);
    case 1:
      return sub_100011670(result, a2, a3);
  }
  return result;
}

uint64_t sub_100011670(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRelease(a2);
  return result;
}

uint64_t initializeWithCopy for OutgoingMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_10001156C(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for OutgoingMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_10001156C(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_100011604(v8, v9, v10, v11, v12);
  return a1;
}

__n128 initializeWithTake for OutgoingMessage(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for OutgoingMessage(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  char v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_100011604(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for OutgoingMessage(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OutgoingMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_100011844(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_10001184C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for OutgoingMessage()
{
  return &type metadata for OutgoingMessage;
}

uint64_t destroy for IncomingMessage(uint64_t a1)
{
  return sub_10000B014(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
}

uint64_t initializeWithCopy for IncomingMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_10000AF60(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for IncomingMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_10000AF60(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9);
  v10 = *(_QWORD *)a1;
  v11 = *(_QWORD *)(a1 + 8);
  v12 = *(_QWORD *)(a1 + 16);
  v13 = *(_QWORD *)(a1 + 24);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  v16 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v9;
  sub_10000B014(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

__n128 initializeWithTake for IncomingMessage(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for IncomingMessage(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;

  v3 = *(_BYTE *)(a2 + 48);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v11 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v3;
  sub_10000B014(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for IncomingMessage(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 49))
    return (*(_DWORD *)a1 + 251);
  v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 <= 5)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for IncomingMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 - 251;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 49) = 0;
    if (a2)
      *(_BYTE *)(result + 48) = -(char)a2;
  }
  return result;
}

uint64_t sub_100011A8C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 48) <= 4u)
    return *(unsigned __int8 *)(a1 + 48);
  else
    return (*(_DWORD *)a1 + 5);
}

uint64_t sub_100011AA4(uint64_t result, unsigned int a2)
{
  if (a2 >= 5)
  {
    *(_QWORD *)result = a2 - 5;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)(result + 40) = 0;
    LOBYTE(a2) = 5;
  }
  *(_BYTE *)(result + 48) = a2;
  return result;
}

ValueMetadata *type metadata accessor for IncomingMessage()
{
  return &type metadata for IncomingMessage;
}

uint64_t destroy for AudioOutput(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 32));
}

uint64_t initializeWithCopy for AudioOutput(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t assignWithCopy for AudioOutput(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t assignWithTake for AudioOutput(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioOutput(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioOutput(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioOutput()
{
  return &type metadata for AudioOutput;
}

_BYTE *initializeBufferWithCopyOfBuffer for AudioInput.Component(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for FileInfo.CodingKeys()
{
  return &type metadata for FileInfo.CodingKeys;
}

unint64_t sub_100011C80()
{
  unint64_t result;

  result = qword_10002E2E8;
  if (!qword_10002E2E8)
  {
    result = swift_getWitnessTable(&unk_10001FD84, &type metadata for FileInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E2E8);
  }
  return result;
}

unint64_t sub_100011CC8()
{
  unint64_t result;

  result = qword_10002E2F0;
  if (!qword_10002E2F0)
  {
    result = swift_getWitnessTable(&unk_10001FCF4, &type metadata for FileInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E2F0);
  }
  return result;
}

unint64_t sub_100011D10()
{
  unint64_t result;

  result = qword_10002E2F8;
  if (!qword_10002E2F8)
  {
    result = swift_getWitnessTable(&unk_10001FD1C, &type metadata for FileInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E2F8);
  }
  return result;
}

unint64_t sub_100011D54()
{
  unint64_t result;

  result = qword_10002E338;
  if (!qword_10002E338)
  {
    result = swift_getWitnessTable(&unk_100020FE0, &type metadata for IncomingMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E338);
  }
  return result;
}

unint64_t sub_100011D98()
{
  unint64_t result;

  result = qword_10002E348;
  if (!qword_10002E348)
  {
    result = swift_getWitnessTable(&unk_100020F90, &type metadata for IncomingMessage.TestCompleteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E348);
  }
  return result;
}

unint64_t sub_100011DDC()
{
  unint64_t result;

  result = qword_10002E350;
  if (!qword_10002E350)
  {
    result = swift_getWitnessTable(&unk_100020F68, &type metadata for TestCompleteParameters);
    atomic_store(result, (unint64_t *)&qword_10002E350);
  }
  return result;
}

unint64_t sub_100011E20()
{
  unint64_t result;

  result = qword_10002E358;
  if (!qword_10002E358)
  {
    result = swift_getWitnessTable(&unk_100020F18, &type metadata for IncomingMessage.StopRecordingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E358);
  }
  return result;
}

unint64_t sub_100011E64()
{
  unint64_t result;

  result = qword_10002E360;
  if (!qword_10002E360)
  {
    result = swift_getWitnessTable(&unk_100020EC8, &type metadata for IncomingMessage.PlayRecordAudioCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E360);
  }
  return result;
}

unint64_t sub_100011EA8()
{
  unint64_t result;

  result = qword_10002E368;
  if (!qword_10002E368)
  {
    result = swift_getWitnessTable(&unk_100020EA0, &type metadata for PlayRecordAudioParameters);
    atomic_store(result, (unint64_t *)&qword_10002E368);
  }
  return result;
}

unint64_t sub_100011EEC()
{
  unint64_t result;

  result = qword_10002E370;
  if (!qword_10002E370)
  {
    result = swift_getWitnessTable(&unk_100020E50, &type metadata for IncomingMessage.FileTransferCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E370);
  }
  return result;
}

unint64_t sub_100011F30()
{
  unint64_t result;

  result = qword_10002E378;
  if (!qword_10002E378)
  {
    result = swift_getWitnessTable(&unk_100020E28, &type metadata for FileTransferParameters);
    atomic_store(result, (unint64_t *)&qword_10002E378);
  }
  return result;
}

unint64_t sub_100011F74()
{
  unint64_t result;

  result = qword_10002E380;
  if (!qword_10002E380)
  {
    result = swift_getWitnessTable(&unk_100020DD8, &type metadata for IncomingMessage.ProgressCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E380);
  }
  return result;
}

unint64_t sub_100011FB8()
{
  unint64_t result;

  result = qword_10002E388;
  if (!qword_10002E388)
  {
    result = swift_getWitnessTable(&unk_100020DB0, &type metadata for ProgressParameters);
    atomic_store(result, (unint64_t *)&qword_10002E388);
  }
  return result;
}

unint64_t sub_100011FFC()
{
  unint64_t result;

  result = qword_10002E390;
  if (!qword_10002E390)
  {
    result = swift_getWitnessTable(&unk_100020D60, &type metadata for IncomingMessage.IdentifyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E390);
  }
  return result;
}

unint64_t sub_100012040()
{
  unint64_t result;

  result = qword_10002E398;
  if (!qword_10002E398)
  {
    result = swift_getWitnessTable(&unk_100020D38, &type metadata for IncomingIdentifyParameters);
    atomic_store(result, (unint64_t *)&qword_10002E398);
  }
  return result;
}

unint64_t sub_100012084()
{
  unint64_t result;

  result = qword_10002E3C8;
  if (!qword_10002E3C8)
  {
    result = swift_getWitnessTable(&unk_100020CE8, &type metadata for OutgoingMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E3C8);
  }
  return result;
}

unint64_t sub_1000120C8()
{
  unint64_t result;

  result = qword_10002E3D0;
  if (!qword_10002E3D0)
  {
    result = swift_getWitnessTable(&unk_100020C98, &type metadata for OutgoingMessage.StartTestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E3D0);
  }
  return result;
}

unint64_t sub_10001210C()
{
  unint64_t result;

  result = qword_10002E3D8;
  if (!qword_10002E3D8)
  {
    result = swift_getWitnessTable(&unk_100020C70, &type metadata for StartTestParameters);
    atomic_store(result, (unint64_t *)&qword_10002E3D8);
  }
  return result;
}

unint64_t sub_100012150()
{
  unint64_t result;

  result = qword_10002E3E0;
  if (!qword_10002E3E0)
  {
    result = swift_getWitnessTable(&unk_100020C20, &type metadata for OutgoingMessage.FileTransferCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E3E0);
  }
  return result;
}

unint64_t sub_100012194()
{
  unint64_t result;

  result = qword_10002E3E8;
  if (!qword_10002E3E8)
  {
    result = swift_getWitnessTable(&unk_100020BF8, &type metadata for FileTransferParameters);
    atomic_store(result, (unint64_t *)&qword_10002E3E8);
  }
  return result;
}

unint64_t sub_1000121D8()
{
  unint64_t result;

  result = qword_10002E3F0;
  if (!qword_10002E3F0)
  {
    result = swift_getWitnessTable(&unk_100020BA8, &type metadata for OutgoingMessage.StatusCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E3F0);
  }
  return result;
}

unint64_t sub_10001221C()
{
  unint64_t result;

  result = qword_10002E3F8;
  if (!qword_10002E3F8)
  {
    result = swift_getWitnessTable(&unk_100020B80, &type metadata for StatusParameters);
    atomic_store(result, (unint64_t *)&qword_10002E3F8);
  }
  return result;
}

unint64_t sub_100012260()
{
  unint64_t result;

  result = qword_10002E400;
  if (!qword_10002E400)
  {
    result = swift_getWitnessTable(&unk_100020B30, &type metadata for OutgoingMessage.IdentifyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E400);
  }
  return result;
}

unint64_t sub_1000122A4()
{
  unint64_t result;

  result = qword_10002E408;
  if (!qword_10002E408)
  {
    result = swift_getWitnessTable(&unk_100020B08, &type metadata for OutgoingIdentifyParameters);
    atomic_store(result, (unint64_t *)&qword_10002E408);
  }
  return result;
}

uint64_t sub_1000122E8(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  char v7;

  if (a1 == 1701080941 && a2 == 0xE400000000000000)
  {
    v5 = 0xE400000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1701080941, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6C656E6E616863 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease(0xE700000000000000);
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6C656E6E616863, 0xE700000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1000123C8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v2 = sub_100009A34(&qword_10002E678);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1[3];
  v7 = a1[4];
  sub_10000ACF4(a1, v6);
  v8 = sub_100015488();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for AudioOutput.Component.CodingKeys, &type metadata for AudioOutput.Component.CodingKeys, v8, v6, v7);
  v9 = sub_100009A34(&qword_10002E688);
  HIBYTE(v13) = 0;
  v10 = sub_10000B1DC(qword_10002E690, &qword_10002E688, (uint64_t)&unk_100021780);
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v14, v9, (char *)&v13 + 7, v2, v9, v10);
  v11 = v14;
  BYTE6(v13) = 1;
  KeyedDecodingContainer.decode(_:forKey:)((char *)&v13 + 6, v2);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_10000B224(a1);
  return v11;
}

uint64_t sub_100012554(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  char v8;

  if (a1 == 0x6E656E6F706D6F63 && a2 == 0xE900000000000074)
  {
    v5 = 0xE900000000000074;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6E656E6F706D6F63, 0xE900000000000074, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x656D756C6F76 && a2 == 0xE600000000000000)
  {
    v7 = 0xE600000000000000;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x656D756C6F76, 0xE600000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x73756C756D697473 && a2 == 0xEC000000656C6946)
  {
    swift_bridgeObjectRelease(0xEC000000656C6946);
    return 2;
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x73756C756D697473, 0xEC000000656C6946, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v8 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_1000126C4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  char v23;
  _QWORD v24[2];

  v5 = sub_100009A34(&qword_10002E410);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_10000ACF4(a1, v9);
  v11 = sub_10001286C();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for AudioOutput.CodingKeys, &type metadata for AudioOutput.CodingKeys, v11, v9, v10);
  if (v2)
    return sub_10000B224(a1);
  v23 = 0;
  v12 = sub_1000128B0();
  KeyedDecodingContainer.decode<A>(_:forKey:)(v24, &type metadata for AudioOutput.Component, &v23, v5, &type metadata for AudioOutput.Component, v12);
  v14 = v24[0];
  v13 = v24[1];
  LOBYTE(v24[0]) = 1;
  KeyedDecodingContainer.decode(_:forKey:)(v24, v5);
  v16 = v15;
  LOBYTE(v24[0]) = 2;
  v17 = KeyedDecodingContainer.decode(_:forKey:)(v24, v5);
  v18 = v8;
  v20 = v19;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v18, v5);
  result = sub_10000B224(a1);
  *(_QWORD *)a2 = v14;
  *(_QWORD *)(a2 + 8) = v13;
  *(_DWORD *)(a2 + 16) = v16;
  *(_QWORD *)(a2 + 24) = v17;
  *(_QWORD *)(a2 + 32) = v20;
  return result;
}

unint64_t sub_10001286C()
{
  unint64_t result;

  result = qword_10002E418;
  if (!qword_10002E418)
  {
    result = swift_getWitnessTable(&unk_100020AB8, &type metadata for AudioOutput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E418);
  }
  return result;
}

unint64_t sub_1000128B0()
{
  unint64_t result;

  result = qword_10002E420;
  if (!qword_10002E420)
  {
    result = swift_getWitnessTable(&unk_100020A90, &type metadata for AudioOutput.Component);
    atomic_store(result, (unint64_t *)&qword_10002E420);
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioOutput.CodingKeys()
{
  return &type metadata for AudioOutput.CodingKeys;
}

ValueMetadata *type metadata accessor for OutgoingMessage.CodingKeys()
{
  return &type metadata for OutgoingMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for OutgoingMessage.IdentifyCodingKeys()
{
  return &type metadata for OutgoingMessage.IdentifyCodingKeys;
}

ValueMetadata *type metadata accessor for OutgoingMessage.StatusCodingKeys()
{
  return &type metadata for OutgoingMessage.StatusCodingKeys;
}

ValueMetadata *type metadata accessor for OutgoingMessage.FileTransferCodingKeys()
{
  return &type metadata for OutgoingMessage.FileTransferCodingKeys;
}

ValueMetadata *type metadata accessor for OutgoingMessage.StartTestCodingKeys()
{
  return &type metadata for OutgoingMessage.StartTestCodingKeys;
}

uint64_t getEnumTagSinglePayload for IncomingMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for IncomingMessage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_100012A40 + 4 * byte_10001FBC1[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_100012A74 + 4 * byte_10001FBBC[v4]))();
}

uint64_t sub_100012A74(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100012A7C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100012A84);
  return result;
}

uint64_t sub_100012A90(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100012A98);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_100012A9C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100012AA4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IncomingMessage.CodingKeys()
{
  return &type metadata for IncomingMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for IncomingMessage.IdentifyCodingKeys()
{
  return &type metadata for IncomingMessage.IdentifyCodingKeys;
}

ValueMetadata *type metadata accessor for IncomingMessage.ProgressCodingKeys()
{
  return &type metadata for IncomingMessage.ProgressCodingKeys;
}

ValueMetadata *type metadata accessor for IncomingMessage.FileTransferCodingKeys()
{
  return &type metadata for IncomingMessage.FileTransferCodingKeys;
}

ValueMetadata *type metadata accessor for IncomingMessage.PlayRecordAudioCodingKeys()
{
  return &type metadata for IncomingMessage.PlayRecordAudioCodingKeys;
}

ValueMetadata *type metadata accessor for IncomingMessage.StopRecordingCodingKeys()
{
  return &type metadata for IncomingMessage.StopRecordingCodingKeys;
}

ValueMetadata *type metadata accessor for IncomingMessage.TestCompleteCodingKeys()
{
  return &type metadata for IncomingMessage.TestCompleteCodingKeys;
}

uint64_t destroy for StartTestParameters(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  swift_bridgeObjectRelease(a1[1]);
  return swift_bridgeObjectRelease(a1[2]);
}

uint64_t *_s15Diagnostic_838919StartTestParametersVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[2];
  a1[2] = v5;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t *assignWithCopy for StartTestParameters(uint64_t *a1, uint64_t *a2)
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
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = a2[2];
  v9 = a1[2];
  a1[2] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

__n128 initializeBufferWithCopyOfBuffer for OSVersion(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *assignWithTake for StartTestParameters(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease(v4);
  v5 = a1[2];
  a1[2] = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for StartTestParameters(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StartTestParameters(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StartTestParameters()
{
  return &type metadata for StartTestParameters;
}

uint64_t destroy for StatusParameters(uint64_t a1)
{
  return sub_100011670(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

__n128 initializeWithTake for Status(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for StatusParameters()
{
  return &type metadata for StatusParameters;
}

__n128 initializeWithCopy for OutgoingIdentifyParameters(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for OutgoingIdentifyParameters(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for OutgoingIdentifyParameters(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for OutgoingIdentifyParameters()
{
  return &type metadata for OutgoingIdentifyParameters;
}

_QWORD *initializeBufferWithCopyOfBuffer for TestCompleteParameters(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for TestCompleteParameters(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for TestCompleteParameters(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

__n128 initializeBufferWithCopyOfBuffer for AudioOutput.Component(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for TestCompleteParameters(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for TestCompleteParameters(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TestCompleteParameters(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TestCompleteParameters()
{
  return &type metadata for TestCompleteParameters;
}

uint64_t destroy for PlayRecordAudioParameters(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 32));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));
}

uint64_t initializeWithCopy for PlayRecordAudioParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

uint64_t assignWithCopy for PlayRecordAudioParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v6);
  return a1;
}

uint64_t assignWithTake for PlayRecordAudioParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 32));
  v4 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for PlayRecordAudioParameters(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PlayRecordAudioParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
      *(_QWORD *)(result + 32) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PlayRecordAudioParameters()
{
  return &type metadata for PlayRecordAudioParameters;
}

ValueMetadata *type metadata accessor for FileTransferParameters()
{
  return &type metadata for FileTransferParameters;
}

ValueMetadata *type metadata accessor for ProgressParameters()
{
  return &type metadata for ProgressParameters;
}

uint64_t destroy for IncomingIdentifyParameters(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
}

_QWORD *initializeWithCopy for IncomingIdentifyParameters(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for IncomingIdentifyParameters(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for IncomingIdentifyParameters(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for IncomingIdentifyParameters(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for IncomingIdentifyParameters(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for IncomingIdentifyParameters()
{
  return &type metadata for IncomingIdentifyParameters;
}

uint64_t getEnumTagSinglePayload for AudioOutput.Component(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AudioOutput.Component(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AudioOutput.Component()
{
  return &type metadata for AudioOutput.Component;
}

unint64_t sub_100013334(uint64_t a1)
{
  unint64_t result;

  result = sub_100012040();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100013358(uint64_t a1)
{
  unint64_t result;

  result = sub_100011FB8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10001337C(uint64_t a1)
{
  unint64_t result;

  result = sub_100012194();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000133A0(uint64_t a1)
{
  unint64_t result;

  result = sub_100011F30();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000133C4(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1000133F0();
  result = sub_100013434();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1000133F0()
{
  unint64_t result;

  result = qword_10002E428;
  if (!qword_10002E428)
  {
    result = swift_getWitnessTable(&unk_1000200DC, &type metadata for FileTransferParameters);
    atomic_store(result, (unint64_t *)&qword_10002E428);
  }
  return result;
}

unint64_t sub_100013434()
{
  unint64_t result;

  result = qword_10002E430;
  if (!qword_10002E430)
  {
    result = swift_getWitnessTable(&unk_1000200C0, &type metadata for FileTransferParameters);
    atomic_store(result, (unint64_t *)&qword_10002E430);
  }
  return result;
}

unint64_t sub_100013478(uint64_t a1)
{
  unint64_t result;

  result = sub_100011EA8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10001349C(uint64_t a1)
{
  unint64_t result;

  result = sub_100011DDC();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000134C0(uint64_t a1)
{
  unint64_t result;

  result = sub_1000122A4();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1000134E4(uint64_t a1)
{
  unint64_t result;

  result = sub_10001221C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100013508(uint64_t a1)
{
  unint64_t result;

  result = sub_10001210C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100013530()
{
  unint64_t result;

  result = qword_10002E438;
  if (!qword_10002E438)
  {
    result = swift_getWitnessTable(&unk_100020230, &type metadata for IncomingMessage.TestCompleteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E438);
  }
  return result;
}

unint64_t sub_100013578()
{
  unint64_t result;

  result = qword_10002E440;
  if (!qword_10002E440)
  {
    result = swift_getWitnessTable(&unk_100020338, &type metadata for IncomingMessage.PlayRecordAudioCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E440);
  }
  return result;
}

unint64_t sub_1000135C0()
{
  unint64_t result;

  result = qword_10002E448;
  if (!qword_10002E448)
  {
    result = swift_getWitnessTable(&unk_1000203F0, &type metadata for IncomingMessage.FileTransferCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E448);
  }
  return result;
}

unint64_t sub_100013608()
{
  unint64_t result;

  result = qword_10002E450;
  if (!qword_10002E450)
  {
    result = swift_getWitnessTable(&unk_1000204A8, &type metadata for IncomingMessage.ProgressCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E450);
  }
  return result;
}

unint64_t sub_100013650()
{
  unint64_t result;

  result = qword_10002E458;
  if (!qword_10002E458)
  {
    result = swift_getWitnessTable(&unk_100020560, &type metadata for IncomingMessage.IdentifyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E458);
  }
  return result;
}

unint64_t sub_100013698()
{
  unint64_t result;

  result = qword_10002E460;
  if (!qword_10002E460)
  {
    result = swift_getWitnessTable(&unk_100020618, &type metadata for IncomingMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E460);
  }
  return result;
}

unint64_t sub_1000136E0()
{
  unint64_t result;

  result = qword_10002E468;
  if (!qword_10002E468)
  {
    result = swift_getWitnessTable(&unk_1000206D0, &type metadata for OutgoingMessage.StartTestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E468);
  }
  return result;
}

unint64_t sub_100013728()
{
  unint64_t result;

  result = qword_10002E470;
  if (!qword_10002E470)
  {
    result = swift_getWitnessTable(&unk_100020788, &type metadata for OutgoingMessage.FileTransferCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E470);
  }
  return result;
}

unint64_t sub_100013770()
{
  unint64_t result;

  result = qword_10002E478;
  if (!qword_10002E478)
  {
    result = swift_getWitnessTable(&unk_100020840, &type metadata for OutgoingMessage.StatusCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E478);
  }
  return result;
}

unint64_t sub_1000137B8()
{
  unint64_t result;

  result = qword_10002E480;
  if (!qword_10002E480)
  {
    result = swift_getWitnessTable(&unk_1000208F8, &type metadata for OutgoingMessage.IdentifyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E480);
  }
  return result;
}

unint64_t sub_100013800()
{
  unint64_t result;

  result = qword_10002E488;
  if (!qword_10002E488)
  {
    result = swift_getWitnessTable(&unk_1000209B0, &type metadata for OutgoingMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E488);
  }
  return result;
}

unint64_t sub_100013848()
{
  unint64_t result;

  result = qword_10002E490;
  if (!qword_10002E490)
  {
    result = swift_getWitnessTable(&unk_100020A68, &type metadata for AudioOutput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E490);
  }
  return result;
}

unint64_t sub_100013890()
{
  unint64_t result;

  result = qword_10002E498;
  if (!qword_10002E498)
  {
    result = swift_getWitnessTable(&unk_1000209D8, &type metadata for AudioOutput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E498);
  }
  return result;
}

unint64_t sub_1000138D8()
{
  unint64_t result;

  result = qword_10002E4A0;
  if (!qword_10002E4A0)
  {
    result = swift_getWitnessTable(&unk_100020A00, &type metadata for AudioOutput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E4A0);
  }
  return result;
}

unint64_t sub_100013920()
{
  unint64_t result;

  result = qword_10002E4A8;
  if (!qword_10002E4A8)
  {
    result = swift_getWitnessTable(&unk_100020868, &type metadata for OutgoingMessage.IdentifyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E4A8);
  }
  return result;
}

unint64_t sub_100013968()
{
  unint64_t result;

  result = qword_10002E4B0;
  if (!qword_10002E4B0)
  {
    result = swift_getWitnessTable(&unk_100020890, &type metadata for OutgoingMessage.IdentifyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E4B0);
  }
  return result;
}

unint64_t sub_1000139B0()
{
  unint64_t result;

  result = qword_10002E4B8;
  if (!qword_10002E4B8)
  {
    result = swift_getWitnessTable(&unk_1000207B0, &type metadata for OutgoingMessage.StatusCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E4B8);
  }
  return result;
}

unint64_t sub_1000139F8()
{
  unint64_t result;

  result = qword_10002E4C0;
  if (!qword_10002E4C0)
  {
    result = swift_getWitnessTable(&unk_1000207D8, &type metadata for OutgoingMessage.StatusCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E4C0);
  }
  return result;
}

unint64_t sub_100013A40()
{
  unint64_t result;

  result = qword_10002E4C8;
  if (!qword_10002E4C8)
  {
    result = swift_getWitnessTable(&unk_1000206F8, &type metadata for OutgoingMessage.FileTransferCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E4C8);
  }
  return result;
}

unint64_t sub_100013A88()
{
  unint64_t result;

  result = qword_10002E4D0;
  if (!qword_10002E4D0)
  {
    result = swift_getWitnessTable(&unk_100020720, &type metadata for OutgoingMessage.FileTransferCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E4D0);
  }
  return result;
}

unint64_t sub_100013AD0()
{
  unint64_t result;

  result = qword_10002E4D8;
  if (!qword_10002E4D8)
  {
    result = swift_getWitnessTable(&unk_100020640, &type metadata for OutgoingMessage.StartTestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E4D8);
  }
  return result;
}

unint64_t sub_100013B18()
{
  unint64_t result;

  result = qword_10002E4E0;
  if (!qword_10002E4E0)
  {
    result = swift_getWitnessTable(&unk_100020668, &type metadata for OutgoingMessage.StartTestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E4E0);
  }
  return result;
}

unint64_t sub_100013B60()
{
  unint64_t result;

  result = qword_10002E4E8;
  if (!qword_10002E4E8)
  {
    result = swift_getWitnessTable(&unk_100020920, &type metadata for OutgoingMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E4E8);
  }
  return result;
}

unint64_t sub_100013BA8()
{
  unint64_t result;

  result = qword_10002E4F0;
  if (!qword_10002E4F0)
  {
    result = swift_getWitnessTable(&unk_100020948, &type metadata for OutgoingMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E4F0);
  }
  return result;
}

unint64_t sub_100013BF0()
{
  unint64_t result;

  result = qword_10002E4F8;
  if (!qword_10002E4F8)
  {
    result = swift_getWitnessTable(&unk_1000204D0, &type metadata for IncomingMessage.IdentifyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E4F8);
  }
  return result;
}

unint64_t sub_100013C38()
{
  unint64_t result;

  result = qword_10002E500;
  if (!qword_10002E500)
  {
    result = swift_getWitnessTable(&unk_1000204F8, &type metadata for IncomingMessage.IdentifyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E500);
  }
  return result;
}

unint64_t sub_100013C80()
{
  unint64_t result;

  result = qword_10002E508;
  if (!qword_10002E508)
  {
    result = swift_getWitnessTable(&unk_100020418, &type metadata for IncomingMessage.ProgressCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E508);
  }
  return result;
}

unint64_t sub_100013CC8()
{
  unint64_t result;

  result = qword_10002E510;
  if (!qword_10002E510)
  {
    result = swift_getWitnessTable(&unk_100020440, &type metadata for IncomingMessage.ProgressCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E510);
  }
  return result;
}

unint64_t sub_100013D10()
{
  unint64_t result;

  result = qword_10002E518;
  if (!qword_10002E518)
  {
    result = swift_getWitnessTable(&unk_100020360, &type metadata for IncomingMessage.FileTransferCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E518);
  }
  return result;
}

unint64_t sub_100013D58()
{
  unint64_t result;

  result = qword_10002E520;
  if (!qword_10002E520)
  {
    result = swift_getWitnessTable(&unk_100020388, &type metadata for IncomingMessage.FileTransferCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E520);
  }
  return result;
}

unint64_t sub_100013DA0()
{
  unint64_t result;

  result = qword_10002E528;
  if (!qword_10002E528)
  {
    result = swift_getWitnessTable(&unk_1000202A8, &type metadata for IncomingMessage.PlayRecordAudioCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E528);
  }
  return result;
}

unint64_t sub_100013DE8()
{
  unint64_t result;

  result = qword_10002E530;
  if (!qword_10002E530)
  {
    result = swift_getWitnessTable(&unk_1000202D0, &type metadata for IncomingMessage.PlayRecordAudioCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E530);
  }
  return result;
}

unint64_t sub_100013E30()
{
  unint64_t result;

  result = qword_10002E538;
  if (!qword_10002E538)
  {
    result = swift_getWitnessTable(&unk_100020258, &type metadata for IncomingMessage.StopRecordingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E538);
  }
  return result;
}

unint64_t sub_100013E78()
{
  unint64_t result;

  result = qword_10002E540;
  if (!qword_10002E540)
  {
    result = swift_getWitnessTable(&unk_100020280, &type metadata for IncomingMessage.StopRecordingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E540);
  }
  return result;
}

unint64_t sub_100013EC0()
{
  unint64_t result;

  result = qword_10002E548;
  if (!qword_10002E548)
  {
    result = swift_getWitnessTable(&unk_1000201A0, &type metadata for IncomingMessage.TestCompleteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E548);
  }
  return result;
}

unint64_t sub_100013F08()
{
  unint64_t result;

  result = qword_10002E550;
  if (!qword_10002E550)
  {
    result = swift_getWitnessTable(&unk_1000201C8, &type metadata for IncomingMessage.TestCompleteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E550);
  }
  return result;
}

unint64_t sub_100013F50()
{
  unint64_t result;

  result = qword_10002E558;
  if (!qword_10002E558)
  {
    result = swift_getWitnessTable(&unk_100020588, &type metadata for IncomingMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E558);
  }
  return result;
}

unint64_t sub_100013F98()
{
  unint64_t result;

  result = qword_10002E560;
  if (!qword_10002E560)
  {
    result = swift_getWitnessTable(&unk_1000205B0, &type metadata for IncomingMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E560);
  }
  return result;
}

unint64_t sub_100013FDC(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000288D8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 4)
    return 4;
  else
    return v3;
}

unint64_t sub_100014024(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v3 = sub_100009A34(&qword_10002E878);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  v9 = (unint64_t)sub_10000ACF4(a1, v7);
  v10 = sub_100016624();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for AudioInput.CodingKeys, &type metadata for AudioInput.CodingKeys, v10, v7, v8);
  if (v1)
  {
    sub_10000B224(a1);
  }
  else
  {
    v11 = sub_100016668();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v15, &type metadata for AudioInput.Component, v12, v3, &type metadata for AudioInput.Component, v11);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v9 = v15;
    sub_10000B224(a1);
  }
  return v9;
}

uint64_t sub_100014144(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  char v8;

  if (a1 == 0x726556726F6A616DLL && a2 == 0xEC0000006E6F6973)
  {
    v5 = 0xEC0000006E6F6973;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x726556726F6A616DLL, 0xEC0000006E6F6973, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x726556726F6E696DLL && a2 == 0xEC0000006E6F6973)
  {
    v7 = 0xEC0000006E6F6973;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x726556726F6E696DLL, 0xEC0000006E6F6973, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x7265566863746170 && a2 == 0xEC0000006E6F6973)
  {
    swift_bridgeObjectRelease(0xEC0000006E6F6973);
    return 2;
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x7265566863746170, 0xEC0000006E6F6973, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v8 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_1000142D0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;
  char v12;
  char v13;
  char v14;

  v2 = sub_100009A34(qword_10002E998);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1[3];
  v7 = a1[4];
  sub_10000ACF4(a1, v6);
  v8 = sub_100016C68();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for OSVersion.CodingKeys, &type metadata for OSVersion.CodingKeys, v8, v6, v7);
  v14 = 0;
  v9 = KeyedDecodingContainer.decode(_:forKey:)(&v14, v2);
  v13 = 1;
  KeyedDecodingContainer.decode(_:forKey:)(&v13, v2);
  v12 = 2;
  KeyedDecodingContainer.decode(_:forKey:)(&v12, v2);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_10000B224(a1);
  return v9;
}

_QWORD *sub_100014448(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  _QWORD *v16;

  v3 = sub_100009A34(&qword_10002E5B8);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  v9 = sub_10000ACF4(a1, v7);
  v10 = sub_1000150DC();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for FileTransferParameters.CodingKeys, &type metadata for FileTransferParameters.CodingKeys, v10, v7, v8);
  if (v1)
  {
    sub_10000B224(a1);
  }
  else
  {
    v11 = sub_100009A34(&qword_10002E5C8);
    v12 = sub_1000152D0(&qword_10002E5D0, &qword_10002E5C8, (void (*)(void))sub_100015120, (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v16, v11, v13, v3, v11, v12);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v9 = v16;
    sub_10000B224(a1);
  }
  return v9;
}

uint64_t sub_100014594(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  char v8;

  if (a1 == 0x6E656B6F74 && a2 == 0xE500000000000000)
  {
    v5 = 0xE500000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6E656B6F74, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6C6F636F746F7270 && a2 == 0xEF6E6F6973726556)
  {
    v7 = 0xEF6E6F6973726556;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6C6F636F746F7270, 0xEF6E6F6973726556, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x656C69666F7270 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease(0xE700000000000000);
    return 2;
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x656C69666F7270, 0xE700000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v8 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_100014704(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  char v20;

  v3 = sub_100009A34(&qword_10002E5F8);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  sub_10000ACF4(a1, v7);
  v9 = sub_1000151EC();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for IncomingIdentifyParameters.CodingKeys, &type metadata for IncomingIdentifyParameters.CodingKeys, v9, v7, v8);
  if (v1)
  {
    sub_10000B224(a1);
  }
  else
  {
    v20 = 0;
    v8 = KeyedDecodingContainer.decode(_:forKey:)(&v20, v3);
    v12 = v11;
    v19 = 1;
    swift_bridgeObjectRetain(v11);
    KeyedDecodingContainer.decode(_:forKey:)(&v19, v3);
    v13 = sub_100009A34(&qword_10002E608);
    v18 = 2;
    v14 = sub_100015230();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v17, v13, &v18, v3, v13, v14);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v15 = v17;
    swift_bridgeObjectRetain(v17);
    sub_10000B224(a1);
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v12);
  }
  return v8;
}

_QWORD *sub_1000148FC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;

  v3 = sub_100009A34(&qword_10002E5E0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  v9 = sub_10000ACF4(a1, v7);
  v10 = sub_100015164();
  v11 = dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for ProgressParameters.CodingKeys, &type metadata for ProgressParameters.CodingKeys, v10, v7, v8);
  if (!v1)
  {
    v9 = (_QWORD *)KeyedDecodingContainer.decode(_:forKey:)(v11, v3);
    if ((unint64_t)v9 - 101 >= 0xFFFFFFFFFFFFFF9ALL)
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      sub_10000B224(a1);
      return v9;
    }
    v12 = sub_1000151A8();
    v13 = swift_allocError(&type metadata for ProgressParameters.DecodingError, v12, 0, 0);
    *v14 = v9;
    swift_willThrow(v13);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_10000B224(a1);
  return v9;
}

uint64_t sub_100014A48(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  char v7;

  if (a1 == 0x74757074756FLL && a2 == 0xE600000000000000)
  {
    v5 = 0xE600000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x74757074756FLL, 0xE600000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x737475706E69 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease(0xE600000000000000);
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0x737475706E69, 0xE600000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_100014B28@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  char v26;

  v5 = sub_100009A34(&qword_10002E588);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_10000ACF4(a1, v9);
  v11 = sub_100015010();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for PlayRecordAudioParameters.CodingKeys, &type metadata for PlayRecordAudioParameters.CodingKeys, v11, v9, v10);
  if (v2)
    return sub_10000B224(a1);
  v26 = 0;
  v12 = sub_100015054();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v25, &type metadata for AudioOutput, &v26, v5, &type metadata for AudioOutput, v12);
  v23 = v25[1];
  v24 = v25[0];
  v13 = v25[4];
  v21 = v25[3];
  v22 = v25[2];
  v14 = sub_100009A34(&qword_10002E5A0);
  v26 = 1;
  v15 = sub_1000152D0(&qword_10002E5A8, &qword_10002E5A0, (void (*)(void))sub_100015098, (uint64_t)&protocol conformance descriptor for <A> [A]);
  swift_bridgeObjectRetain(v13);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v25, v14, &v26, v5, v14, v15);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v16 = v25[0];
  swift_bridgeObjectRetain(v25[0]);
  sub_10000B224(a1);
  swift_bridgeObjectRelease(v16);
  result = swift_bridgeObjectRelease(v13);
  v18 = v23;
  *a2 = v24;
  a2[1] = v18;
  v19 = v21;
  a2[2] = v22;
  a2[3] = v19;
  a2[4] = v13;
  a2[5] = v16;
  return result;
}

uint64_t sub_100014D44(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  char v7;

  if (a1 == 0x6F43737574617473 && a2 == 0xEA00000000006564)
  {
    v5 = 0xEA00000000006564;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6F43737574617473, 0xEA00000000006564, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x73746C75736572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease(0xE700000000000000);
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0x73746C75736572, 0xE700000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_100014E40(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;

  v3 = sub_100009A34(&qword_10002E568);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  sub_10000ACF4(a1, v7);
  v9 = sub_100014FCC();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for TestCompleteParameters.CodingKeys, &type metadata for TestCompleteParameters.CodingKeys, v9, v7, v8);
  if (!v1)
  {
    v16 = 0;
    v7 = KeyedDecodingContainer.decode(_:forKey:)(&v16, v3);
    v10 = sub_100009A34(&qword_10002E578);
    v14 = 1;
    v11 = sub_10000B1DC(&qword_10002E580, &qword_10002E578, (uint64_t)&unk_100021B08);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v15, v10, &v14, v3, v10, v11);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_10000B224(a1);
  return v7;
}

unint64_t sub_100014FCC()
{
  unint64_t result;

  result = qword_10002E570;
  if (!qword_10002E570)
  {
    result = swift_getWitnessTable(&unk_100021B30, &type metadata for TestCompleteParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E570);
  }
  return result;
}

unint64_t sub_100015010()
{
  unint64_t result;

  result = qword_10002E590;
  if (!qword_10002E590)
  {
    result = swift_getWitnessTable(&unk_100021AB8, &type metadata for PlayRecordAudioParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E590);
  }
  return result;
}

unint64_t sub_100015054()
{
  unint64_t result;

  result = qword_10002E598;
  if (!qword_10002E598)
  {
    result = swift_getWitnessTable(&unk_10001FDAC, &type metadata for AudioOutput);
    atomic_store(result, (unint64_t *)&qword_10002E598);
  }
  return result;
}

unint64_t sub_100015098()
{
  unint64_t result;

  result = qword_10002E5B0;
  if (!qword_10002E5B0)
  {
    result = swift_getWitnessTable(&unk_100021A90, &type metadata for AudioInput);
    atomic_store(result, (unint64_t *)&qword_10002E5B0);
  }
  return result;
}

unint64_t sub_1000150DC()
{
  unint64_t result;

  result = qword_10002E5C0;
  if (!qword_10002E5C0)
  {
    result = swift_getWitnessTable(&unk_100021A40, &type metadata for FileTransferParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E5C0);
  }
  return result;
}

unint64_t sub_100015120()
{
  unint64_t result;

  result = qword_10002E5D8;
  if (!qword_10002E5D8)
  {
    result = swift_getWitnessTable(&unk_10001FC94, &type metadata for FileInfo);
    atomic_store(result, (unint64_t *)&qword_10002E5D8);
  }
  return result;
}

unint64_t sub_100015164()
{
  unint64_t result;

  result = qword_10002E5E8;
  if (!qword_10002E5E8)
  {
    result = swift_getWitnessTable(&unk_1000219F0, &type metadata for ProgressParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E5E8);
  }
  return result;
}

unint64_t sub_1000151A8()
{
  unint64_t result;

  result = qword_10002E5F0;
  if (!qword_10002E5F0)
  {
    result = swift_getWitnessTable(&unk_1000219B0, &type metadata for ProgressParameters.DecodingError);
    atomic_store(result, (unint64_t *)&qword_10002E5F0);
  }
  return result;
}

unint64_t sub_1000151EC()
{
  unint64_t result;

  result = qword_10002E600;
  if (!qword_10002E600)
  {
    result = swift_getWitnessTable(&unk_100021960, &type metadata for IncomingIdentifyParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E600);
  }
  return result;
}

unint64_t sub_100015230()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002E610;
  if (!qword_10002E610)
  {
    v1 = sub_10000AD74(&qword_10002E608);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> [A : B], v1);
    atomic_store(result, (unint64_t *)&qword_10002E610);
  }
  return result;
}

unint64_t sub_10001528C()
{
  unint64_t result;

  result = qword_10002E620;
  if (!qword_10002E620)
  {
    result = swift_getWitnessTable(&unk_100021910, &type metadata for StartTestParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E620);
  }
  return result;
}

uint64_t sub_1000152D0(unint64_t *a1, uint64_t *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v8 = sub_10000AD74(a2);
    a3();
    result = swift_getWitnessTable(a4, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100015334()
{
  unint64_t result;

  result = qword_10002E640;
  if (!qword_10002E640)
  {
    result = swift_getWitnessTable("ͫ", &type metadata for FileInfo);
    atomic_store(result, (unint64_t *)&qword_10002E640);
  }
  return result;
}

unint64_t sub_100015378()
{
  unint64_t result;

  result = qword_10002E650;
  if (!qword_10002E650)
  {
    result = swift_getWitnessTable(&unk_100021898, &type metadata for StatusParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E650);
  }
  return result;
}

unint64_t sub_1000153BC()
{
  unint64_t result;

  result = qword_10002E658;
  if (!qword_10002E658)
  {
    result = swift_getWitnessTable(&unk_100021870, &type metadata for Status);
    atomic_store(result, (unint64_t *)&qword_10002E658);
  }
  return result;
}

unint64_t sub_100015400()
{
  unint64_t result;

  result = qword_10002E668;
  if (!qword_10002E668)
  {
    result = swift_getWitnessTable(&unk_100021820, &type metadata for OutgoingIdentifyParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E668);
  }
  return result;
}

unint64_t sub_100015444()
{
  unint64_t result;

  result = qword_10002E670;
  if (!qword_10002E670)
  {
    result = swift_getWitnessTable(&unk_1000217F8, &type metadata for OSVersion);
    atomic_store(result, (unint64_t *)&qword_10002E670);
  }
  return result;
}

unint64_t sub_100015488()
{
  unint64_t result;

  result = qword_10002E680;
  if (!qword_10002E680)
  {
    result = swift_getWitnessTable(&unk_1000217A8, &type metadata for AudioOutput.Component.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E680);
  }
  return result;
}

uint64_t sub_1000154D4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1000154DC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AudioOutput.Component.CodingKeys()
{
  return &type metadata for AudioOutput.Component.CodingKeys;
}

ValueMetadata *type metadata accessor for OutgoingIdentifyParameters.CodingKeys()
{
  return &type metadata for OutgoingIdentifyParameters.CodingKeys;
}

ValueMetadata *type metadata accessor for StatusParameters.CodingKeys()
{
  return &type metadata for StatusParameters.CodingKeys;
}

ValueMetadata *type metadata accessor for StartTestParameters.CodingKeys()
{
  return &type metadata for StartTestParameters.CodingKeys;
}

ValueMetadata *type metadata accessor for IncomingIdentifyParameters.CodingKeys()
{
  return &type metadata for IncomingIdentifyParameters.CodingKeys;
}

_QWORD *initializeBufferWithCopyOfBuffer for ProgressParameters.DecodingError(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ProgressParameters.DecodingError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ProgressParameters.DecodingError(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ProgressParameters.DecodingError()
{
  return &type metadata for ProgressParameters.DecodingError;
}

ValueMetadata *type metadata accessor for ProgressParameters.CodingKeys()
{
  return &type metadata for ProgressParameters.CodingKeys;
}

ValueMetadata *type metadata accessor for FileTransferParameters.CodingKeys()
{
  return &type metadata for FileTransferParameters.CodingKeys;
}

ValueMetadata *type metadata accessor for PlayRecordAudioParameters.CodingKeys()
{
  return &type metadata for PlayRecordAudioParameters.CodingKeys;
}

uint64_t _s15Diagnostic_838911AudioOutputV9ComponentV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s15Diagnostic_838911AudioOutputV9ComponentV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1000156A8 + 4 * byte_10001FBCB[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1000156DC + 4 * byte_10001FBC6[v4]))();
}

uint64_t sub_1000156DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000156E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000156ECLL);
  return result;
}

uint64_t sub_1000156F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100015700);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100015704(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001570C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TestCompleteParameters.CodingKeys()
{
  return &type metadata for TestCompleteParameters.CodingKeys;
}

uint64_t _s15Diagnostic_83896StatusOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1000115D8(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s15Diagnostic_83896StatusOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1000115D8(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_100011670(v6, v7, v8);
  return a1;
}

uint64_t _s15Diagnostic_83896StatusOwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_100011670(v4, v5, v6);
  return a1;
}

uint64_t _s15Diagnostic_83896StatusOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s15Diagnostic_83896StatusOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_100015894(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_1000158AC(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Status()
{
  return &type metadata for Status;
}

uint64_t getEnumTagSinglePayload for OSVersion(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for OSVersion(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for OSVersion()
{
  return &type metadata for OSVersion;
}

uint64_t sub_100015930(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 16);
}

uint64_t sub_100015938(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = swift_checkMetadataState(319, *(_QWORD *)(a1 + 16));
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 0, 1, &v4, a1 + 24);
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for SerializedCodable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100016CB8(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SerializedCodable);
}

ValueMetadata *type metadata accessor for AudioInput()
{
  return &type metadata for AudioInput;
}

uint64_t sub_1000159CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_1000159D4(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = swift_checkMetadataState(319, *(_QWORD *)(a1 + 16));
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 0, 1, &v4, a1 + 40);
    return 0;
  }
  return result;
}

uint64_t *sub_100015A40(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain(v8);
  }
  return v3;
}

uint64_t sub_100015AB0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_100015AC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t sub_100015AF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_100015B20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t sub_100015B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_100015B80(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_100015C30 + 4 * byte_10001FBD0[(v7 - 1)]))();
}

void sub_100015C80(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = &dword_100000004;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = &_mh_execute_header.magic + 1;
    }
  }
  else
  {
    v11 = 0;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t type metadata accessor for RawValueDecodable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100016CB8(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RawValueDecodable);
}

unint64_t sub_100015E40()
{
  unint64_t result;

  result = qword_10002E798;
  if (!qword_10002E798)
  {
    result = swift_getWitnessTable(&unk_100021198, &type metadata for TestCompleteParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E798);
  }
  return result;
}

unint64_t sub_100015E88()
{
  unint64_t result;

  result = qword_10002E7A0;
  if (!qword_10002E7A0)
  {
    result = swift_getWitnessTable(&unk_100021250, &type metadata for PlayRecordAudioParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E7A0);
  }
  return result;
}

unint64_t sub_100015ED0()
{
  unint64_t result;

  result = qword_10002E7A8;
  if (!qword_10002E7A8)
  {
    result = swift_getWitnessTable(&unk_100021308, &type metadata for FileTransferParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E7A8);
  }
  return result;
}

unint64_t sub_100015F18()
{
  unint64_t result;

  result = qword_10002E7B0;
  if (!qword_10002E7B0)
  {
    result = swift_getWitnessTable(&unk_1000213C0, &type metadata for ProgressParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E7B0);
  }
  return result;
}

unint64_t sub_100015F60()
{
  unint64_t result;

  result = qword_10002E7B8;
  if (!qword_10002E7B8)
  {
    result = swift_getWitnessTable(&unk_100021478, &type metadata for IncomingIdentifyParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E7B8);
  }
  return result;
}

unint64_t sub_100015FA8()
{
  unint64_t result;

  result = qword_10002E7C0;
  if (!qword_10002E7C0)
  {
    result = swift_getWitnessTable(&unk_100021530, &type metadata for StartTestParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E7C0);
  }
  return result;
}

unint64_t sub_100015FF0()
{
  unint64_t result;

  result = qword_10002E7C8;
  if (!qword_10002E7C8)
  {
    result = swift_getWitnessTable(&unk_1000215E8, &type metadata for StatusParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E7C8);
  }
  return result;
}

unint64_t sub_100016038()
{
  unint64_t result;

  result = qword_10002E7D0;
  if (!qword_10002E7D0)
  {
    result = swift_getWitnessTable(&unk_1000216A0, &type metadata for OutgoingIdentifyParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E7D0);
  }
  return result;
}

unint64_t sub_100016080()
{
  unint64_t result;

  result = qword_10002E7D8;
  if (!qword_10002E7D8)
  {
    result = swift_getWitnessTable(&unk_100021758, &type metadata for AudioOutput.Component.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E7D8);
  }
  return result;
}

unint64_t sub_1000160C8()
{
  unint64_t result;

  result = qword_10002E7E0;
  if (!qword_10002E7E0)
  {
    result = swift_getWitnessTable(&unk_1000216C8, &type metadata for AudioOutput.Component.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E7E0);
  }
  return result;
}

unint64_t sub_100016110()
{
  unint64_t result;

  result = qword_10002E7E8;
  if (!qword_10002E7E8)
  {
    result = swift_getWitnessTable(&unk_1000216F0, &type metadata for AudioOutput.Component.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E7E8);
  }
  return result;
}

unint64_t sub_100016158()
{
  unint64_t result;

  result = qword_10002E7F0;
  if (!qword_10002E7F0)
  {
    result = swift_getWitnessTable(&unk_100021610, &type metadata for OutgoingIdentifyParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E7F0);
  }
  return result;
}

unint64_t sub_1000161A0()
{
  unint64_t result;

  result = qword_10002E7F8;
  if (!qword_10002E7F8)
  {
    result = swift_getWitnessTable(&unk_100021638, &type metadata for OutgoingIdentifyParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E7F8);
  }
  return result;
}

unint64_t sub_1000161E8()
{
  unint64_t result;

  result = qword_10002E800;
  if (!qword_10002E800)
  {
    result = swift_getWitnessTable(&unk_100021558, &type metadata for StatusParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E800);
  }
  return result;
}

unint64_t sub_100016230()
{
  unint64_t result;

  result = qword_10002E808;
  if (!qword_10002E808)
  {
    result = swift_getWitnessTable(&unk_100021580, &type metadata for StatusParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E808);
  }
  return result;
}

unint64_t sub_100016278()
{
  unint64_t result;

  result = qword_10002E810;
  if (!qword_10002E810)
  {
    result = swift_getWitnessTable(&unk_1000214A0, &type metadata for StartTestParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E810);
  }
  return result;
}

unint64_t sub_1000162C0()
{
  unint64_t result;

  result = qword_10002E818;
  if (!qword_10002E818)
  {
    result = swift_getWitnessTable(&unk_1000214C8, &type metadata for StartTestParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E818);
  }
  return result;
}

unint64_t sub_100016308()
{
  unint64_t result;

  result = qword_10002E820;
  if (!qword_10002E820)
  {
    result = swift_getWitnessTable(&unk_1000213E8, &type metadata for IncomingIdentifyParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E820);
  }
  return result;
}

unint64_t sub_100016350()
{
  unint64_t result;

  result = qword_10002E828;
  if (!qword_10002E828)
  {
    result = swift_getWitnessTable(&unk_100021410, &type metadata for IncomingIdentifyParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E828);
  }
  return result;
}

unint64_t sub_100016398()
{
  unint64_t result;

  result = qword_10002E830;
  if (!qword_10002E830)
  {
    result = swift_getWitnessTable(&unk_100021330, &type metadata for ProgressParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E830);
  }
  return result;
}

unint64_t sub_1000163E0()
{
  unint64_t result;

  result = qword_10002E838;
  if (!qword_10002E838)
  {
    result = swift_getWitnessTable(&unk_100021358, &type metadata for ProgressParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E838);
  }
  return result;
}

unint64_t sub_100016428()
{
  unint64_t result;

  result = qword_10002E840;
  if (!qword_10002E840)
  {
    result = swift_getWitnessTable(&unk_100021278, &type metadata for FileTransferParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E840);
  }
  return result;
}

unint64_t sub_100016470()
{
  unint64_t result;

  result = qword_10002E848;
  if (!qword_10002E848)
  {
    result = swift_getWitnessTable(&unk_1000212A0, &type metadata for FileTransferParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E848);
  }
  return result;
}

unint64_t sub_1000164B8()
{
  unint64_t result;

  result = qword_10002E850;
  if (!qword_10002E850)
  {
    result = swift_getWitnessTable(&unk_1000211C0, &type metadata for PlayRecordAudioParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E850);
  }
  return result;
}

unint64_t sub_100016500()
{
  unint64_t result;

  result = qword_10002E858;
  if (!qword_10002E858)
  {
    result = swift_getWitnessTable(&unk_1000211E8, &type metadata for PlayRecordAudioParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E858);
  }
  return result;
}

unint64_t sub_100016548()
{
  unint64_t result;

  result = qword_10002E860;
  if (!qword_10002E860)
  {
    result = swift_getWitnessTable(&unk_100021108, &type metadata for TestCompleteParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E860);
  }
  return result;
}

unint64_t sub_100016590()
{
  unint64_t result;

  result = qword_10002E868;
  if (!qword_10002E868)
  {
    result = swift_getWitnessTable(&unk_100021130, &type metadata for TestCompleteParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E868);
  }
  return result;
}

unint64_t sub_1000165D4()
{
  unint64_t result;

  result = qword_10002E870;
  if (!qword_10002E870)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_10002E870);
  }
  return result;
}

uint64_t type metadata accessor for SerializedCodable.DecodingError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100016CB8(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SerializedCodable.DecodingError);
}

unint64_t sub_100016624()
{
  unint64_t result;

  result = qword_10002E880;
  if (!qword_10002E880)
  {
    result = swift_getWitnessTable(&unk_1000227D0, &type metadata for AudioInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E880);
  }
  return result;
}

unint64_t sub_100016668()
{
  unint64_t result;

  result = qword_10002E888;
  if (!qword_10002E888)
  {
    result = swift_getWitnessTable(&unk_1000227A8, &type metadata for AudioInput.Component);
    atomic_store(result, (unint64_t *)&qword_10002E888);
  }
  return result;
}

uint64_t sub_1000166AC(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  char v7;

  if (a1 == 0x6C6F636F746F7270 && a2 == 0xEF6E6F6973726556)
  {
    v5 = 0xEF6E6F6973726556;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6C6F636F746F7270, 0xEF6E6F6973726556, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6F6973726556736FLL && a2 == 0xE90000000000006ELL)
  {
    swift_bridgeObjectRelease(0xE90000000000006ELL);
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6F6973726556736FLL, 0xE90000000000006ELL, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1000167CC(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  char v8;

  if (a1 == 0x7461636964657270 && a2 == 0xEA00000000007365)
  {
    v5 = 0xEA00000000007365;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7461636964657270, 0xEA00000000007365, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6574656D61726170 && a2 == 0xEA00000000007372)
  {
    v7 = 0xEA00000000007372;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6574656D61726170, 0xEA00000000007372, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x6369666963657073 && a2 == 0xEE00736E6F697461)
  {
    swift_bridgeObjectRelease(0xEE00736E6F697461);
    return 2;
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6369666963657073, 0xEE00736E6F697461, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v8 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_100016954(uint64_t a1, uint64_t a2)
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

unint64_t sub_10001697C()
{
  unint64_t result;

  result = qword_10002E890;
  if (!qword_10002E890)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_10002E890);
  }
  return result;
}

unint64_t sub_1000169C0()
{
  unint64_t result;

  result = qword_10002E8E8;
  if (!qword_10002E8E8)
  {
    result = swift_getWitnessTable(&unk_100022758, &type metadata for Status.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E8E8);
  }
  return result;
}

unint64_t sub_100016A04()
{
  unint64_t result;

  result = qword_10002E8F0;
  if (!qword_10002E8F0)
  {
    result = swift_getWitnessTable(&unk_100022708, &type metadata for Status.RecordingErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E8F0);
  }
  return result;
}

unint64_t sub_100016A48()
{
  unint64_t result;

  result = qword_10002E8F8;
  if (!qword_10002E8F8)
  {
    result = swift_getWitnessTable(&unk_1000226B8, &type metadata for Status.RecordingDidFinishCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E8F8);
  }
  return result;
}

unint64_t sub_100016A8C()
{
  unint64_t result;

  result = qword_10002E900;
  if (!qword_10002E900)
  {
    result = swift_getWitnessTable(&unk_100022668, &type metadata for Status.RecordingDidStartCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E900);
  }
  return result;
}

unint64_t sub_100016AD0()
{
  unint64_t result;

  result = qword_10002E908;
  if (!qword_10002E908)
  {
    result = swift_getWitnessTable(&unk_100022618, &type metadata for Status.PlaybackErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E908);
  }
  return result;
}

unint64_t sub_100016B14()
{
  unint64_t result;

  result = qword_10002E910;
  if (!qword_10002E910)
  {
    result = swift_getWitnessTable(&unk_1000225C8, &type metadata for Status.PlaybackDidFinishCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E910);
  }
  return result;
}

unint64_t sub_100016B58()
{
  unint64_t result;

  result = qword_10002E918;
  if (!qword_10002E918)
  {
    result = swift_getWitnessTable(&unk_100022578, &type metadata for Status.PlaybackDidStartCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E918);
  }
  return result;
}

unint64_t sub_100016B9C()
{
  unint64_t result;

  result = qword_10002E920;
  if (!qword_10002E920)
  {
    result = swift_getWitnessTable(&unk_100022528, &type metadata for Status.FileSendErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E920);
  }
  return result;
}

unint64_t sub_100016BE0()
{
  unint64_t result;

  result = qword_10002E928;
  if (!qword_10002E928)
  {
    result = swift_getWitnessTable(&unk_1000224D8, &type metadata for Status.FileReceiveErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E928);
  }
  return result;
}

unint64_t sub_100016C24()
{
  unint64_t result;

  result = qword_10002E930;
  if (!qword_10002E930)
  {
    result = swift_getWitnessTable(&unk_100022488, &type metadata for Status.DidReceiveFileCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E930);
  }
  return result;
}

unint64_t sub_100016C68()
{
  unint64_t result;

  result = qword_10002E940;
  if (!qword_10002E940)
  {
    result = swift_getWitnessTable(&unk_100022438, &type metadata for OSVersion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002E940);
  }
  return result;
}

uint64_t type metadata accessor for RawValueDecodable.DecodingError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100016CB8(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RawValueDecodable.DecodingError);
}

uint64_t sub_100016CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t sub_100016CE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t sub_100016CEC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = swift_getAssociatedTypeWitness(319, *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 16), &protocol requirements base descriptor for RawRepresentable, &associated type descriptor for RawRepresentable.RawValue);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8);
    swift_initEnumMetadataSingleCase(a1, 0, v4 + 64);
    result = 0;
    *(_DWORD *)(*(_QWORD *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t *sub_100016D5C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, *(_QWORD *)(a3 + 24), *(_QWORD *)(a3 + 16), &protocol requirements base descriptor for RawRepresentable, &associated type descriptor for RawRepresentable.RawValue);
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (v7 <= 7 && *(_QWORD *)(v6 + 64) <= 0x18uLL && (*(_DWORD *)(v6 + 80) & 0x100000) == 0)
  {
    v11 = AssociatedTypeWitness;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(uint64_t *, _QWORD, _QWORD, uint64_t))(v6 + 56))(a1, 0, 0, v11);
  }
  else
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v7 + 16) & ~v7));
    swift_retain(v10);
  }
  return a1;
}

uint64_t sub_100016E14(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 16), &protocol requirements base descriptor for RawRepresentable, &associated type descriptor for RawRepresentable.RawValue);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
}

uint64_t sub_100016E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v6;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, *(_QWORD *)(a3 + 24), *(_QWORD *)(a3 + 16), &protocol requirements base descriptor for RawRepresentable, &associated type descriptor for RawRepresentable.RawValue);
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, a2, AssociatedTypeWitness);
  (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v6 + 56))(a1, 0, 0, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_100016EDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, *(_QWORD *)(a3 + 24), *(_QWORD *)(a3 + 16), &protocol requirements base descriptor for RawRepresentable, &associated type descriptor for RawRepresentable.RawValue);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 24))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_100016F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v6;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, *(_QWORD *)(a3 + 24), *(_QWORD *)(a3 + 16), &protocol requirements base descriptor for RawRepresentable, &associated type descriptor for RawRepresentable.RawValue);
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, a2, AssociatedTypeWitness);
  (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v6 + 56))(a1, 0, 0, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_100016FB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, *(_QWORD *)(a3 + 24), *(_QWORD *)(a3 + 16), &protocol requirements base descriptor for RawRepresentable, &associated type descriptor for RawRepresentable.RawValue);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 40))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_100017008(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, *(_QWORD *)(a3 + 24), *(_QWORD *)(a3 + 16), &protocol requirements base descriptor for RawRepresentable, &associated type descriptor for RawRepresentable.RawValue);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 48))(a1, a2, AssociatedTypeWitness);
}

uint64_t sub_100017058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, *(_QWORD *)(a4 + 24), *(_QWORD *)(a4 + 16), &protocol requirements base descriptor for RawRepresentable, &associated type descriptor for RawRepresentable.RawValue);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(a1, a2, a3, AssociatedTypeWitness);
}

uint64_t _s15Diagnostic_83898FileInfoV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s15Diagnostic_83898FileInfoV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100017194 + 4 * byte_10001FBE3[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1000171C8 + 4 * byte_10001FBDE[v4]))();
}

uint64_t sub_1000171C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000171D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000171D8);
  return result;
}

uint64_t sub_1000171E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000171ECLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1000171F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000171F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for OSVersion.CodingKeys()
{
  return &type metadata for OSVersion.CodingKeys;
}

uint64_t getEnumTagSinglePayload for Status.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Status.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_1000172F0 + 4 * byte_10001FBED[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_100017324 + 4 * byte_10001FBE8[v4]))();
}

uint64_t sub_100017324(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001732C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100017334);
  return result;
}

uint64_t sub_100017340(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100017348);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_10001734C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100017354(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Status.CodingKeys()
{
  return &type metadata for Status.CodingKeys;
}

ValueMetadata *type metadata accessor for Status.DidReceiveFileCodingKeys()
{
  return &type metadata for Status.DidReceiveFileCodingKeys;
}

ValueMetadata *type metadata accessor for Status.FileReceiveErrorCodingKeys()
{
  return &type metadata for Status.FileReceiveErrorCodingKeys;
}

ValueMetadata *type metadata accessor for Status.FileSendErrorCodingKeys()
{
  return &type metadata for Status.FileSendErrorCodingKeys;
}

ValueMetadata *type metadata accessor for Status.PlaybackDidStartCodingKeys()
{
  return &type metadata for Status.PlaybackDidStartCodingKeys;
}

ValueMetadata *type metadata accessor for Status.PlaybackDidFinishCodingKeys()
{
  return &type metadata for Status.PlaybackDidFinishCodingKeys;
}

ValueMetadata *type metadata accessor for Status.PlaybackErrorCodingKeys()
{
  return &type metadata for Status.PlaybackErrorCodingKeys;
}

ValueMetadata *type metadata accessor for Status.RecordingDidStartCodingKeys()
{
  return &type metadata for Status.RecordingDidStartCodingKeys;
}

ValueMetadata *type metadata accessor for Status.RecordingDidFinishCodingKeys()
{
  return &type metadata for Status.RecordingDidFinishCodingKeys;
}

ValueMetadata *type metadata accessor for Status.RecordingErrorCodingKeys()
{
  return &type metadata for Status.RecordingErrorCodingKeys;
}

ValueMetadata *type metadata accessor for AudioInput.CodingKeys()
{
  return &type metadata for AudioInput.CodingKeys;
}

uint64_t sub_100017410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 8);
}

uint64_t _s15Diagnostic_838915OutgoingMessageO18IdentifyCodingKeysOwst_0(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_100017458 + 4 * byte_10001FBF2[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100017478 + 4 * byte_10001FBF7[v4]))();
}

_BYTE *sub_100017458(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100017478(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100017480(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100017488(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100017490(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100017498(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t _s15Diagnostic_838910AudioInputV9ComponentOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s15Diagnostic_838910AudioInputV9ComponentOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100017580 + 4 * byte_10001FC01[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1000175B4 + 4 * byte_10001FBFC[v4]))();
}

uint64_t sub_1000175B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000175BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000175C4);
  return result;
}

uint64_t sub_1000175D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000175D8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1000175DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000175E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1000175F0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AudioInput.Component()
{
  return &type metadata for AudioInput.Component;
}

unint64_t sub_10001760C()
{
  unint64_t result;

  result = qword_10002EAA0;
  if (!qword_10002EAA0)
  {
    result = swift_getWitnessTable(&unk_100021D38, &type metadata for AudioInput.Component);
    atomic_store(result, (unint64_t *)&qword_10002EAA0);
  }
  return result;
}

uint64_t sub_100017650(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100021DA0, a1);
}

unint64_t sub_100017664()
{
  unint64_t result;

  result = qword_10002EAA8;
  if (!qword_10002EAA8)
  {
    result = swift_getWitnessTable(&unk_100021E58, &type metadata for AudioInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EAA8);
  }
  return result;
}

unint64_t sub_1000176AC()
{
  unint64_t result;

  result = qword_10002EAB0;
  if (!qword_10002EAB0)
  {
    result = swift_getWitnessTable(&unk_1000220F0, &type metadata for Status.FileSendErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EAB0);
  }
  return result;
}

unint64_t sub_1000176F4()
{
  unint64_t result;

  result = qword_10002EAB8;
  if (!qword_10002EAB8)
  {
    result = swift_getWitnessTable(&unk_1000221A8, &type metadata for Status.FileReceiveErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EAB8);
  }
  return result;
}

unint64_t sub_10001773C()
{
  unint64_t result;

  result = qword_10002EAC0;
  if (!qword_10002EAC0)
  {
    result = swift_getWitnessTable(&unk_100022260, &type metadata for Status.DidReceiveFileCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EAC0);
  }
  return result;
}

unint64_t sub_100017784()
{
  unint64_t result;

  result = qword_10002EAC8;
  if (!qword_10002EAC8)
  {
    result = swift_getWitnessTable(&unk_100022318, &type metadata for Status.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EAC8);
  }
  return result;
}

unint64_t sub_1000177CC()
{
  unint64_t result;

  result = qword_10002EAD0;
  if (!qword_10002EAD0)
  {
    result = swift_getWitnessTable(&unk_1000223D0, &type metadata for OSVersion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EAD0);
  }
  return result;
}

unint64_t sub_100017814()
{
  unint64_t result;

  result = qword_10002EAD8;
  if (!qword_10002EAD8)
  {
    result = swift_getWitnessTable(&unk_100022340, &type metadata for OSVersion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EAD8);
  }
  return result;
}

unint64_t sub_10001785C()
{
  unint64_t result;

  result = qword_10002EAE0;
  if (!qword_10002EAE0)
  {
    result = swift_getWitnessTable(&unk_100022368, &type metadata for OSVersion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EAE0);
  }
  return result;
}

unint64_t sub_1000178A4()
{
  unint64_t result;

  result = qword_10002EAE8;
  if (!qword_10002EAE8)
  {
    result = swift_getWitnessTable(&unk_1000221D0, &type metadata for Status.DidReceiveFileCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EAE8);
  }
  return result;
}

unint64_t sub_1000178EC()
{
  unint64_t result;

  result = qword_10002EAF0;
  if (!qword_10002EAF0)
  {
    result = swift_getWitnessTable(&unk_1000221F8, &type metadata for Status.DidReceiveFileCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EAF0);
  }
  return result;
}

unint64_t sub_100017934()
{
  unint64_t result;

  result = qword_10002EAF8;
  if (!qword_10002EAF8)
  {
    result = swift_getWitnessTable(&unk_100022118, &type metadata for Status.FileReceiveErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EAF8);
  }
  return result;
}

unint64_t sub_10001797C()
{
  unint64_t result;

  result = qword_10002EB00;
  if (!qword_10002EB00)
  {
    result = swift_getWitnessTable(&unk_100022140, &type metadata for Status.FileReceiveErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB00);
  }
  return result;
}

unint64_t sub_1000179C4()
{
  unint64_t result;

  result = qword_10002EB08;
  if (!qword_10002EB08)
  {
    result = swift_getWitnessTable(&unk_100022060, &type metadata for Status.FileSendErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB08);
  }
  return result;
}

unint64_t sub_100017A0C()
{
  unint64_t result;

  result = qword_10002EB10;
  if (!qword_10002EB10)
  {
    result = swift_getWitnessTable(&unk_100022088, &type metadata for Status.FileSendErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB10);
  }
  return result;
}

unint64_t sub_100017A54()
{
  unint64_t result;

  result = qword_10002EB18;
  if (!qword_10002EB18)
  {
    result = swift_getWitnessTable(&unk_100022010, &type metadata for Status.PlaybackDidStartCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB18);
  }
  return result;
}

unint64_t sub_100017A9C()
{
  unint64_t result;

  result = qword_10002EB20;
  if (!qword_10002EB20)
  {
    result = swift_getWitnessTable(&unk_100022038, &type metadata for Status.PlaybackDidStartCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB20);
  }
  return result;
}

unint64_t sub_100017AE4()
{
  unint64_t result;

  result = qword_10002EB28;
  if (!qword_10002EB28)
  {
    result = swift_getWitnessTable(&unk_100021FC0, &type metadata for Status.PlaybackDidFinishCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB28);
  }
  return result;
}

unint64_t sub_100017B2C()
{
  unint64_t result;

  result = qword_10002EB30;
  if (!qword_10002EB30)
  {
    result = swift_getWitnessTable(&unk_100021FE8, &type metadata for Status.PlaybackDidFinishCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB30);
  }
  return result;
}

unint64_t sub_100017B74()
{
  unint64_t result;

  result = qword_10002EB38;
  if (!qword_10002EB38)
  {
    result = swift_getWitnessTable(&unk_100021F70, &type metadata for Status.PlaybackErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB38);
  }
  return result;
}

unint64_t sub_100017BBC()
{
  unint64_t result;

  result = qword_10002EB40;
  if (!qword_10002EB40)
  {
    result = swift_getWitnessTable(&unk_100021F98, &type metadata for Status.PlaybackErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB40);
  }
  return result;
}

unint64_t sub_100017C04()
{
  unint64_t result;

  result = qword_10002EB48;
  if (!qword_10002EB48)
  {
    result = swift_getWitnessTable(&unk_100021F20, &type metadata for Status.RecordingDidStartCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB48);
  }
  return result;
}

unint64_t sub_100017C4C()
{
  unint64_t result;

  result = qword_10002EB50;
  if (!qword_10002EB50)
  {
    result = swift_getWitnessTable(&unk_100021F48, &type metadata for Status.RecordingDidStartCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB50);
  }
  return result;
}

unint64_t sub_100017C94()
{
  unint64_t result;

  result = qword_10002EB58;
  if (!qword_10002EB58)
  {
    result = swift_getWitnessTable(&unk_100021ED0, &type metadata for Status.RecordingDidFinishCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB58);
  }
  return result;
}

unint64_t sub_100017CDC()
{
  unint64_t result;

  result = qword_10002EB60;
  if (!qword_10002EB60)
  {
    result = swift_getWitnessTable(&unk_100021EF8, &type metadata for Status.RecordingDidFinishCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB60);
  }
  return result;
}

unint64_t sub_100017D24()
{
  unint64_t result;

  result = qword_10002EB68;
  if (!qword_10002EB68)
  {
    result = swift_getWitnessTable(&unk_100021E80, &type metadata for Status.RecordingErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB68);
  }
  return result;
}

unint64_t sub_100017D6C()
{
  unint64_t result;

  result = qword_10002EB70;
  if (!qword_10002EB70)
  {
    result = swift_getWitnessTable(&unk_100021EA8, &type metadata for Status.RecordingErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB70);
  }
  return result;
}

unint64_t sub_100017DB4()
{
  unint64_t result;

  result = qword_10002EB78;
  if (!qword_10002EB78)
  {
    result = swift_getWitnessTable(&unk_100022288, &type metadata for Status.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB78);
  }
  return result;
}

unint64_t sub_100017DFC()
{
  unint64_t result;

  result = qword_10002EB80;
  if (!qword_10002EB80)
  {
    result = swift_getWitnessTable(&unk_1000222B0, &type metadata for Status.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB80);
  }
  return result;
}

unint64_t sub_100017E44()
{
  unint64_t result;

  result = qword_10002EB88;
  if (!qword_10002EB88)
  {
    result = swift_getWitnessTable(&unk_100021DC8, &type metadata for AudioInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB88);
  }
  return result;
}

unint64_t sub_100017E8C()
{
  unint64_t result;

  result = qword_10002EB90;
  if (!qword_10002EB90)
  {
    result = swift_getWitnessTable(&unk_100021DF0, &type metadata for AudioInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002EB90);
  }
  return result;
}

unint64_t sub_100017ED0()
{
  unint64_t result;

  result = qword_10002EB98;
  if (!qword_10002EB98)
  {
    result = swift_getWitnessTable(&unk_100021CC0, &type metadata for AudioInput.Component);
    atomic_store(result, (unint64_t *)&qword_10002EB98);
  }
  return result;
}

char *sub_100017F54(char *result)
{
  char **v1;
  uint64_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  int64_t v11;

  v2 = *((_QWORD *)result + 2);
  v3 = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = (char *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)result && v5 <= *((_QWORD *)v3 + 3) >> 1)
  {
    if (*((_QWORD *)v6 + 2))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v11 = v4 + v2;
  else
    v11 = v4;
  result = sub_100008C14(result, v11, 1, v3);
  v3 = result;
  if (!*((_QWORD *)v6 + 2))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  v7 = *((_QWORD *)v3 + 2);
  if ((*((_QWORD *)v3 + 3) >> 1) - v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = (char *)swift_arrayInitWithCopy(&v3[40 * v7 + 32], v6 + 32, v2, &type metadata for FileInfo);
  if (!v2)
  {
LABEL_14:
    result = (char *)swift_bridgeObjectRelease(v6);
    *v1 = v3;
    return result;
  }
  v8 = *((_QWORD *)v3 + 2);
  v9 = __OFADD__(v8, v2);
  v10 = v8 + v2;
  if (!v9)
  {
    *((_QWORD *)v3 + 2) = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_100018040()
{
  uint64_t result;

  sub_10001C96C();
  result = OS_os_log.init(subsystem:category:)(0xD000000000000015, 0x800000010001F5E0, 0x74736F6E67616964, 0xEA00000000006369);
  qword_1000353C8 = result;
  return result;
}

uint64_t sub_1000180A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  Swift::String v5;
  void *object;
  uint64_t v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v1 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[0] = 0;
  v10[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(16);
  swift_bridgeObjectRelease(v10[1]);
  strcpy((char *)v10, "UUT-Recording-");
  HIBYTE(v10[1]) = -18;
  v9[1] = *(_QWORD *)(v0 + OBJC_IVAR___AudioBoxController_recordingNumber);
  v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  object = v5._object;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(object);
  v7 = v10[1];
  URL.appendingPathComponent(_:)(v10[0], v10[1]);
  swift_bridgeObjectRelease(v7);
  URL.appendingPathExtension(_:)(6709603, 0xE300000000000000);
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

id sub_1000181E4(uint64_t a1, void *a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  void *v18;
  id v20;
  Class isa;
  _QWORD v23[3];
  uint64_t v24;
  _UNKNOWN **v25;

  if (a1 && (v5 = type metadata accessor for AudioBoxInputs(), (v6 = swift_dynamicCastClass(a1, v5)) != 0))
  {
    v7 = v6;
    v8 = *(void **)&v2[OBJC_IVAR___AudioBoxController_inputs];
    *(_QWORD *)&v2[OBJC_IVAR___AudioBoxController_inputs] = v6;
    swift_unknownObjectRetain_n(a1, 2);

    v9 = *(_QWORD *)&v2[OBJC_IVAR___AudioBoxController_responder];
    *(_QWORD *)&v2[OBJC_IVAR___AudioBoxController_responder] = a2;
    swift_unknownObjectRetain(a2);
    swift_unknownObjectRelease(v9);
    v24 = type metadata accessor for AudioBoxController(0);
    v25 = &off_10002A928;
    v23[0] = v2;
    v10 = objc_allocWithZone((Class)type metadata accessor for AudioBoxBluetoothManager(0));
    v11 = sub_100016954((uint64_t)v23, v24);
    __chkstk_darwin(v11);
    v13 = (_QWORD *)((char *)&v23[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v14 + 16))(v13);
    v15 = *v13;
    v16 = v2;
    v17 = sub_10001D64C(v15, v10);
    sub_10000B224(v23);
    v18 = *(void **)&v16[OBJC_IVAR___AudioBoxController_bluetoothManager];
    *(_QWORD *)&v16[OBJC_IVAR___AudioBoxController_bluetoothManager] = v17;

    objc_msgSend(a2, "enableVolumeHUD:", 0);
    sub_100018A10();
    if (*(_BYTE *)(v7 + OBJC_IVAR___AudioBoxInputs_downloadAudioFiles) == 1)
      sub_100018FD0();
    return (id)swift_unknownObjectRelease(a1);
  }
  else
  {
    v20 = objc_msgSend(v2, "result");
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v20, "setStatusCode:", isa);

    return objc_msgSend(v2, "setFinished:", 1);
  }
}

void sub_10001845C()
{
  char *v0;
  id v1;
  id v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _BYTE *v12;
  uint64_t (**v13)();
  uint64_t v14;
  uint64_t v15;
  char *v16;

  v1 = objc_msgSend(v0, "progress");
  objc_msgSend(v1, "setCompletedUnitCount:", -1);

  v2 = objc_msgSend(v0, "progress");
  objc_msgSend(v2, "setTotalUnitCount:", 100);

  v3 = *(_BYTE **)&v0[OBJC_IVAR___AudioBoxController_bluetoothManager];
  if (v3)
  {
    v4 = swift_allocObject(&unk_10002AAE8, 24, 7);
    v5 = v4;
    *(_QWORD *)(v4 + 16) = v0;
    if (v3[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_isBluetoothReady] != 1)
    {
      v13 = (uint64_t (**)())&v3[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_bluetoothReadyCallback];
      v14 = *(_QWORD *)&v3[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_bluetoothReadyCallback];
      v15 = *(_QWORD *)&v3[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_bluetoothReadyCallback + 8];
      *v13 = sub_10001D634;
      v13[1] = (uint64_t (*)())v4;
      v16 = v0;
      sub_10000ADB8(v14, v15);
      return;
    }
    v6 = *(_QWORD *)&v0[OBJC_IVAR___AudioBoxController_inputs];
    if (v6)
    {
      v7 = (uint64_t *)(v6 + OBJC_IVAR___AudioBoxInputs_audioBoxID);
      v8 = v7[1];
      if (v8)
      {
        v9 = *v7;
        v10 = swift_allocObject(&unk_10002AB10, 24, 7);
        *(_QWORD *)(v10 + 16) = v0;
        v11 = v0;
        v12 = v3;
        swift_bridgeObjectRetain(v8);
        sub_10000286C(v9, v8, (uint64_t)sub_10001D63C, v10);

        swift_release(v5);
        swift_bridgeObjectRelease(v8);
        swift_release(v10);
        return;
      }
      goto LABEL_9;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_9:
  __break(1u);
}

uint64_t sub_100018618(uint64_t result)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v1 = *(void **)(result + OBJC_IVAR___AudioBoxController_bluetoothManager);
  if (!v1)
  {
    __break(1u);
    goto LABEL_6;
  }
  v2 = (void *)result;
  v3 = *(_QWORD *)(result + OBJC_IVAR___AudioBoxController_inputs);
  if (!v3)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v4 = (uint64_t *)(v3 + OBJC_IVAR___AudioBoxInputs_audioBoxID);
  v5 = v4[1];
  if (v5)
  {
    v6 = *v4;
    v7 = swift_allocObject(&unk_10002AB60, 24, 7);
    *(_QWORD *)(v7 + 16) = v2;
    v8 = v1;
    swift_bridgeObjectRetain(v5);
    v9 = v2;
    sub_10000286C(v6, v5, (uint64_t)sub_10001D8D0, v7);

    swift_bridgeObjectRelease(v5);
    return swift_release(v7);
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_1000186E8(char *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  char *v14;
  __int128 v15;
  _BYTE v16[24];
  uint64_t v17;
  char v18;

  v2 = objc_msgSend((id)objc_opt_self(NSProcessInfo), "processInfo");
  objc_msgSend(v2, "operatingSystemVersion");
  v3 = *(_QWORD *)&v16[16];
  v15 = *(_OWORD *)v16;

  *(_QWORD *)v16 = 1;
  *(_OWORD *)&v16[8] = v15;
  v17 = v3;
  v18 = 0;
  v4 = OBJC_IVAR___AudioBoxController_bluetoothManager;
  v5 = *(void **)&a1[OBJC_IVAR___AudioBoxController_bluetoothManager];
  if (!v5)
  {
    __break(1u);
    goto LABEL_7;
  }
  v6 = v5;
  sub_1000035BC((uint64_t)v16);

  v7 = *(void **)&a1[v4];
  if (!v7)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v8 = *(_QWORD *)&a1[OBJC_IVAR___AudioBoxController_inputs];
  if (!v8)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v9 = (uint64_t *)(v8 + OBJC_IVAR___AudioBoxInputs_audioBoxToken);
  v10 = v9[1];
  if (v10)
  {
    v11 = *v9;
    v12 = swift_allocObject(&unk_10002AB38, 24, 7);
    *(_QWORD *)(v12 + 16) = a1;
    v13 = v7;
    swift_bridgeObjectRetain(v10);
    v14 = a1;
    sub_100002ED4(v11, v10, (void (*)(char *, uint64_t))sub_10001D644, v12);

    swift_bridgeObjectRelease(v10);
    swift_release(v12);
    return;
  }
LABEL_9:
  __break(1u);
}

void sub_10001883C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  char v8;

  v1 = *(_QWORD *)(a1 + OBJC_IVAR___AudioBoxController_inputs);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + OBJC_IVAR___AudioBoxInputs_predicates);
    v3 = *(_QWORD *)(v1 + OBJC_IVAR___AudioBoxInputs_parameters);
    v4 = *(_QWORD *)(v1 + OBJC_IVAR___AudioBoxInputs_specifications);
    v7[0] = v2;
    v7[1] = v3;
    v7[2] = v4;
    v7[3] = 0;
    v8 = 3;
    v5 = *(void **)(a1 + OBJC_IVAR___AudioBoxController_bluetoothManager);
    if (v5)
    {
      swift_bridgeObjectRetain(v2);
      swift_bridgeObjectRetain(v3);
      swift_bridgeObjectRetain(v4);
      v6 = v5;
      sub_1000035BC((uint64_t)v7);
      swift_bridgeObjectRelease(v4);
      swift_bridgeObjectRelease(v3);
      swift_bridgeObjectRelease(v2);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_10001894C()
{
  uint64_t v0;
  id result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(v0 + OBJC_IVAR___AudioBoxController_audioTest), "cancel");
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___AudioBoxController_bluetoothManager);
  if (!v2)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (!*(_QWORD *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBox))
  {
LABEL_5:
    sub_100018CFC();
    result = *(id *)(v0 + OBJC_IVAR___AudioBoxController_responder);
    if (result)
      return objc_msgSend(result, "enableVolumeHUD:", 1);
    goto LABEL_8;
  }
  result = *(id *)(v2 + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_centralManager);
  if (result)
  {
    objc_msgSend(result, "cancelPeripheralConnection:");
    goto LABEL_5;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100018A10()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  void *v16;
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
  id v27;
  Class isa;
  id v29;

  v1 = v0;
  sub_100018CFC();
  v2 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  URL._bridgeToObjectiveC()((NSURL *)OBJC_IVAR___AudioBoxController_audioFileFolderURL);
  v4 = v3;
  v29 = 0;
  v5 = objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 0, 0, &v29);

  v6 = v29;
  if (v5)
  {
    v7 = static os_log_type_t.default.getter(v29);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    v8 = qword_1000353C8;
    v9 = sub_100009A34(&qword_10002E0B0);
    v10 = swift_allocObject(v9, 72, 7);
    *(_OWORD *)(v10 + 16) = xmmword_10001F910;
    v11 = URL.path.getter();
    v13 = v12;
    *(_QWORD *)(v10 + 56) = &type metadata for String;
    *(_QWORD *)(v10 + 64) = sub_100009A78();
    *(_QWORD *)(v10 + 32) = v11;
    *(_QWORD *)(v10 + 40) = v13;
    os_log(_:dso:log:_:_:)(v7, &_mh_execute_header, v8, "Created directory: %@", 21, 2, v10);
    return swift_bridgeObjectRelease(v10);
  }
  else
  {
    v15 = v29;
    v16 = (void *)_convertNSErrorToError(_:)(v6);

    v18 = swift_willThrow(v17);
    v19 = static os_log_type_t.error.getter(v18);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    v20 = qword_1000353C8;
    v21 = sub_100009A34(&qword_10002E0B0);
    v22 = swift_allocObject(v21, 72, 7);
    *(_OWORD *)(v22 + 16) = xmmword_10001F910;
    v29 = v16;
    swift_errorRetain(v16);
    v23 = sub_100009A34((uint64_t *)&unk_10002EC10);
    v24 = String.init<A>(describing:)(&v29, v23);
    v26 = v25;
    *(_QWORD *)(v22 + 56) = &type metadata for String;
    *(_QWORD *)(v22 + 64) = sub_100009A78();
    *(_QWORD *)(v22 + 32) = v24;
    *(_QWORD *)(v22 + 40) = v26;
    os_log(_:dso:log:_:_:)(v19, &_mh_execute_header, v20, "Error creating directory: %@", 28, 2, v22);
    swift_bridgeObjectRelease(v22);
    v27 = objc_msgSend(v1, "result");
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v27, "setStatusCode:", isa);

    objc_msgSend(v1, "setFinished:", 1);
    return swift_errorRelease(v16);
  }
}

void sub_100018CFC()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  id v5;
  NSURL *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v0 = (void *)objc_opt_self(NSFileManager);
  v1 = objc_msgSend(v0, "defaultManager");
  URL.path.getter();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  LODWORD(v3) = objc_msgSend(v1, "fileExistsAtPath:", v4);

  if ((_DWORD)v3)
  {
    v5 = objc_msgSend(v0, "defaultManager");
    URL._bridgeToObjectiveC()(v6);
    v8 = v7;
    v30 = 0;
    v9 = objc_msgSend(v5, "removeItemAtURL:error:", v7, &v30);

    v10 = v30;
    if (v9)
    {
      v11 = static os_log_type_t.default.getter(v30);
      if (qword_10002DA78 != -1)
        swift_once(&qword_10002DA78, sub_100018040);
      v12 = qword_1000353C8;
      v13 = sub_100009A34(&qword_10002E0B0);
      v14 = swift_allocObject(v13, 72, 7);
      *(_OWORD *)(v14 + 16) = xmmword_10001F910;
      v15 = URL.path.getter();
      v17 = v16;
      *(_QWORD *)(v14 + 56) = &type metadata for String;
      *(_QWORD *)(v14 + 64) = sub_100009A78();
      *(_QWORD *)(v14 + 32) = v15;
      *(_QWORD *)(v14 + 40) = v17;
      os_log(_:dso:log:_:_:)(v11, &_mh_execute_header, v12, "Deleted directory: %@", 21, 2, v14);
      swift_bridgeObjectRelease(v14);
    }
    else
    {
      v18 = v30;
      v19 = (void *)_convertNSErrorToError(_:)(v10);

      v21 = swift_willThrow(v20);
      v22 = static os_log_type_t.error.getter(v21);
      if (qword_10002DA78 != -1)
        swift_once(&qword_10002DA78, sub_100018040);
      v23 = qword_1000353C8;
      v24 = sub_100009A34(&qword_10002E0B0);
      v25 = swift_allocObject(v24, 72, 7);
      *(_OWORD *)(v25 + 16) = xmmword_10001F910;
      v30 = v19;
      swift_errorRetain(v19);
      v26 = sub_100009A34((uint64_t *)&unk_10002EC10);
      v27 = String.init<A>(describing:)(&v30, v26);
      v29 = v28;
      *(_QWORD *)(v25 + 56) = &type metadata for String;
      *(_QWORD *)(v25 + 64) = sub_100009A78();
      *(_QWORD *)(v25 + 32) = v27;
      *(_QWORD *)(v25 + 40) = v29;
      os_log(_:dso:log:_:_:)(v22, &_mh_execute_header, v23, "Error deleting directory: %@", 28, 2, v25);
      swift_bridgeObjectRelease(v25);
      swift_errorRelease(v19);
    }
  }
}

void sub_100018FD0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  dispatch_group_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  char *v32;
  uint64_t v33;
  void *v34;
  _QWORD *v35;
  NSObject *v36;
  char *v37;
  void *v38;
  const void *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  void (*v44)(char *, _QWORD *);
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  Class isa;
  int v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  char *v63;
  char *v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  NSString v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD aBlock[5];
  _QWORD *v75;

  v1 = v0;
  v2 = type metadata accessor for DispatchTimeInterval(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (_QWORD *)((char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = (_QWORD *)type metadata accessor for DispatchTime(0);
  v7 = *(v6 - 1);
  v8 = __chkstk_darwin(v6);
  v64 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v63 = (char *)&v55 - v10;
  v73 = type metadata accessor for URL(0);
  v69 = *(_QWORD *)(v73 - 8);
  v11 = __chkstk_darwin(v73);
  v67 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = v12;
  __chkstk_darwin(v11);
  v70 = (char *)&v55 - v13;
  v14 = dispatch_group_create();
  v15 = OBJC_IVAR___AudioBoxController_inputs;
  v16 = *(_QWORD *)&v1[OBJC_IVAR___AudioBoxController_inputs];
  if (!v16)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v17 = v14;
  v18 = *(_QWORD *)(v16 + OBJC_IVAR___AudioBoxInputs_sources);
  v19 = *(_QWORD *)(v18 + 16);
  if (v19)
  {
    v57 = v7;
    v58 = v5;
    v59 = v3;
    v60 = v2;
    v61 = OBJC_IVAR___AudioBoxController_inputs;
    v62 = v6;
    v66 = &v1[OBJC_IVAR___AudioBoxController_audioFileFolderURL];
    v65 = OBJC_IVAR___AudioBoxController_responder;
    v56 = swift_bridgeObjectRetain(v18);
    v20 = (_QWORD *)(v56 + 40);
    v21 = v70;
    while (1)
    {
      v23 = *(v20 - 1);
      v22 = *v20;
      swift_bridgeObjectRetain(*v20);
      if ((objc_msgSend(v1, "isFinished") & 1) != 0)
      {
        swift_bridgeObjectRelease(v22);
LABEL_9:
        swift_bridgeObjectRelease(v56);
        v15 = v61;
        v6 = v62;
        v2 = v60;
        v3 = v59;
        v5 = v58;
        v7 = v57;
        goto LABEL_10;
      }
      v72 = v19;
      URL.appendingPathComponent(_:)(v23, v22);
      dispatch_group_enter(v17);
      v24 = v17;
      v25 = *(void **)&v1[v65];
      if (!v25)
        break;
      v26 = v1;
      v20 += 2;
      swift_unknownObjectRetain(*(_QWORD *)&v1[v65]);
      v71 = String._bridgeToObjectiveC()();
      v27 = v69;
      v28 = v67;
      (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v67, v21, v73);
      v29 = *(unsigned __int8 *)(v27 + 80);
      v30 = (v29 + 48) & ~v29;
      v31 = (_QWORD *)swift_allocObject(&unk_10002AA98, v30 + v68, v29 | 7);
      v31[2] = v24;
      v31[3] = v23;
      v31[4] = v22;
      v31[5] = v26;
      v32 = (char *)v31 + v30;
      v33 = v73;
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v32, v28, v73);
      aBlock[4] = sub_10001D5E0;
      v75 = v31;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100019B24;
      aBlock[3] = &unk_10002AAB0;
      v34 = _Block_copy(aBlock);
      v35 = v75;
      v36 = v24;
      v37 = v26;
      swift_release(v35);
      v38 = v71;
      objc_msgSend(v25, "getAsset:completion:", v71, v34);
      v39 = v34;
      v21 = v70;
      _Block_release(v39);
      swift_unknownObjectRelease(v25);

      (*(void (**)(char *, uint64_t))(v27 + 8))(v21, v33);
      v19 = v72 - 1;
      v1 = v26;
      v17 = v24;
      if (v72 == 1)
        goto LABEL_9;
    }
    __break(1u);
    goto LABEL_20;
  }
LABEL_10:
  static DispatchTime.now()();
  v40 = *(_QWORD *)&v1[v15];
  if (!v40)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v41 = *(_QWORD *)(v40 + OBJC_IVAR___AudioBoxInputs_fileDownloadTimeout);
  if (v41 < 0)
  {
    __break(1u);
LABEL_18:
    swift_once(&qword_10002DA78, sub_100018040);
    goto LABEL_14;
  }
  *v5 = v41;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for DispatchTimeInterval.seconds(_:), v2);
  v43 = v63;
  v42 = v64;
  + infix(_:_:)(v64, v5);
  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  v44 = *(void (**)(char *, _QWORD *))(v7 + 8);
  v44(v42, v6);
  v45 = OS_dispatch_group.wait(timeout:)(v43);
  v46 = ((uint64_t (*)(char *, _QWORD *))v44)(v43, v6);
  if ((v45 & 1) == 0)
  {
LABEL_16:

    return;
  }
  v6 = v1;
  v2 = static os_log_type_t.error.getter(v46);
  if (qword_10002DA78 != -1)
    goto LABEL_18;
LABEL_14:
  v47 = qword_1000353C8;
  v48 = sub_100009A34(&qword_10002E0B0);
  v49 = swift_allocObject(v48, 72, 7);
  *(_OWORD *)(v49 + 16) = xmmword_10001F910;
  v50 = *(_QWORD *)((char *)v6 + v15);
  if (v50)
  {
    v51 = v49;
    v52 = *(_QWORD *)(v50 + OBJC_IVAR___AudioBoxInputs_fileDownloadTimeout);
    *(_QWORD *)(v49 + 56) = &type metadata for UInt;
    *(_QWORD *)(v49 + 64) = &protocol witness table for UInt;
    *(_QWORD *)(v49 + 32) = v52;
    os_log(_:dso:log:_:_:)(v2, &_mh_execute_header, v47, "File download timed out after %d seconds", v55);
    swift_bridgeObjectRelease(v51);
    v53 = objc_msgSend(v6, "result");
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v53, "setStatusCode:", isa);

    objc_msgSend(v6, "setFinished:", 1);
    goto LABEL_16;
  }
LABEL_22:
  __break(1u);
}

void sub_100019520(uint64_t a1, unint64_t a2, NSObject *a3, uint64_t a4, uint64_t a5, char *a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  Class isa;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  dispatch_group_t v35;
  _QWORD v36[4];

  v14 = sub_100009A34(&qword_10002EC08);
  v15 = __chkstk_darwin(v14);
  v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 >> 60 == 15)
  {
    v18 = static os_log_type_t.error.getter(v15);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    v19 = qword_1000353C8;
    v20 = sub_100009A34(&qword_10002E0B0);
    v21 = swift_allocObject(v20, 72, 7);
    *(_OWORD *)(v21 + 16) = xmmword_10001F910;
    *(_QWORD *)(v21 + 56) = &type metadata for String;
    *(_QWORD *)(v21 + 64) = sub_100009A78();
    *(_QWORD *)(v21 + 32) = a4;
    *(_QWORD *)(v21 + 40) = a5;
    swift_bridgeObjectRetain(a5);
    os_log(_:dso:log:_:_:)(v18, &_mh_execute_header, v19, "Failed to download asset: %@", 28, 2, v21);
    swift_bridgeObjectRelease(v21);
    v22 = objc_msgSend(a6, "result");
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v22, "setStatusCode:", isa);

    objc_msgSend(a6, "setFinished:", 1);
    dispatch_group_leave(a3);
  }
  else
  {
    sub_1000089F0(a1, a2);
    Data.write(to:options:)(a7, 268435457, a1, a2);
    v35 = a3;
    v24 = type metadata accessor for URL(0);
    v25 = *(_QWORD *)(v24 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v17, a7, v24);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v17, 0, 1, v24);
    swift_beginAccess(&a6[OBJC_IVAR___AudioBoxController_fileNameToURLMap], v36, 33, 0);
    swift_bridgeObjectRetain(a5);
    sub_1000199C0((uint64_t)v17, a4, a5);
    v26 = swift_endAccess(v36);
    HIDWORD(v34) = static os_log_type_t.default.getter(v26);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    v27 = qword_1000353C8;
    v28 = sub_100009A34(&qword_10002E0B0);
    v29 = swift_allocObject(v28, 112, 7);
    *(_OWORD *)(v29 + 16) = xmmword_10001F920;
    *(_QWORD *)(v29 + 56) = &type metadata for String;
    v30 = sub_100009A78();
    *(_QWORD *)(v29 + 64) = v30;
    *(_QWORD *)(v29 + 32) = a4;
    *(_QWORD *)(v29 + 40) = a5;
    v31 = swift_bridgeObjectRetain(a5);
    v32 = URL.path.getter(v31);
    *(_QWORD *)(v29 + 96) = &type metadata for String;
    *(_QWORD *)(v29 + 104) = v30;
    *(_QWORD *)(v29 + 72) = v32;
    *(_QWORD *)(v29 + 80) = v33;
    os_log(_:dso:log:_:_:)(HIDWORD(v34), &_mh_execute_header, v27, "Saved asset %@ to %@", 20, 2, v29);
    sub_10000B10C(a1, a2);
    swift_bridgeObjectRelease(v29);
    dispatch_group_leave(v35);
  }
}

uint64_t sub_1000199C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  sub_100009A34(&qword_10002EC08);
  __chkstk_darwin();
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin();
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a1, 1, v10) == 1)
  {
    sub_10001C81C(a1);
    sub_10001C9A8(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease(a3);
    return sub_10001C81C((uint64_t)v9);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v13, a1, v10);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v18 = *v4;
    *v4 = 0x8000000000000000;
    sub_10001D03C((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    v16 = *v4;
    *v4 = v18;
    swift_bridgeObjectRelease(a3);
    return swift_bridgeObjectRelease(v16);
  }
}

uint64_t sub_100019B24(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void (*v4)(void *, unint64_t);
  id v5;
  unint64_t v6;
  unint64_t v7;

  v2 = a2;
  v4 = *(void (**)(void *, unint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    swift_retain(v3);
    v5 = v2;
    v2 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)(v2);
    v7 = v6;

  }
  else
  {
    swift_retain(v3);
    v7 = 0xF000000000000000;
  }
  v4(v2, v7);
  sub_10000B10C((uint64_t)v2, v7);
  return swift_release(v3);
}

void sub_100019BA4(uint64_t a1)
{
  _BYTE v2[8];
  _BYTE v3[64];

  sub_10000AF24(a1, (uint64_t)v2);
  sub_10000AF24(a1, (uint64_t)v3);
  __asm { BR              X10 }
}

void sub_100019BF8()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + OBJC_IVAR___AudioBoxController_bluetoothManager);
  if (!v1)
  {
    __break(1u);
    JUMPOUT(0x100019ECCLL);
  }
  v2 = v1;
  sub_1000032F4(v3, v4);

}

uint64_t sub_100019EE8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _OWORD v33[2];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _OWORD v37[2];
  _OWORD v38[3];
  _OWORD v39[2];
  __int128 v40;
  _OWORD v41[2];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_100009A34(&qword_10002EC28);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v29 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v28 = (unint64_t)(63 - v4) >> 6;
  v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  result = swift_retain(v3);
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }
    v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v14 >= v28)
      goto LABEL_37;
    v15 = *(_QWORD *)(v29 + 8 * v14);
    v16 = v9 + 1;
    if (!v15)
    {
      v16 = v9 + 2;
      if (v9 + 2 >= v28)
        goto LABEL_37;
      v15 = *(_QWORD *)(v29 + 8 * v16);
      if (!v15)
      {
        v16 = v9 + 3;
        if (v9 + 3 >= v28)
          goto LABEL_37;
        v15 = *(_QWORD *)(v29 + 8 * v16);
        if (!v15)
        {
          v16 = v9 + 4;
          if (v9 + 4 >= v28)
            goto LABEL_37;
          v15 = *(_QWORD *)(v29 + 8 * v16);
          if (!v15)
            break;
        }
      }
    }
LABEL_27:
    v6 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v16 << 6);
    v9 = v16;
LABEL_28:
    v18 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v13);
    v20 = *v18;
    v19 = v18[1];
    sub_10000AE08(*(_QWORD *)(a1 + 56) + 32 * v13, (uint64_t)v41);
    *(_QWORD *)&v40 = v20;
    *((_QWORD *)&v40 + 1) = v19;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(_QWORD *)&v38[0] = v20;
    *((_QWORD *)&v38[0] + 1) = v19;
    swift_bridgeObjectRetain(v19);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7);
    sub_10000AE8C(v39, v33);
    v34 = v30;
    v35 = v31;
    v36 = v32;
    sub_10000AE8C(v33, v37);
    v30 = v34;
    v31 = v35;
    v32 = v36;
    sub_10000AE8C(v37, v38);
    sub_10000AE8C(v38, &v34);
    result = AnyHashable._rawHashValue(seed:)(v3[5]);
    v21 = -1 << *((_BYTE *)v3 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)]) != 0)
    {
      v10 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)])) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)&v7[8 * v23];
      }
      while (v27 == -1);
      v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v10;
    v11 = v3[6] + 40 * v10;
    *(_OWORD *)v11 = v30;
    *(_OWORD *)(v11 + 16) = v31;
    *(_QWORD *)(v11 + 32) = v32;
    result = (uint64_t)sub_10000AE8C(&v34, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }
  v17 = v9 + 5;
  if (v9 + 5 >= v28)
  {
LABEL_37:
    swift_release(v3);
    sub_10001D554(a1);
    return (uint64_t)v3;
  }
  v15 = *(_QWORD *)(v29 + 8 * v17);
  if (v15)
  {
    v16 = v9 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v16 >= v28)
      goto LABEL_37;
    v15 = *(_QWORD *)(v29 + 8 * v16);
    ++v17;
    if (v15)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_10001A2AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char **p_type;
  _QWORD *v7;
  char *v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSURL *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  _QWORD v53[2];
  __int128 v54;
  char v55;

  p_type = &stru_10002CFF0.type;
  v7 = &unk_100035000;
  v8 = "essage: %@";
  if (a1)
  {
    v11 = swift_errorRetain(a1);
    v12 = static os_log_type_t.error.getter(v11);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    v13 = qword_1000353C8;
    v14 = sub_100009A34(&qword_10002E0B0);
    v15 = swift_allocObject(v14, 72, 7);
    *(_OWORD *)(v15 + 16) = xmmword_10001F910;
    v53[0] = a1;
    swift_errorRetain(a1);
    v16 = sub_100009A34((uint64_t *)&unk_10002EC10);
    v17 = String.init<A>(describing:)(v53, v16);
    v19 = v18;
    *(_QWORD *)(v15 + 56) = &type metadata for String;
    *(_QWORD *)(v15 + 64) = sub_100009A78();
    *(_QWORD *)(v15 + 32) = v17;
    *(_QWORD *)(v15 + 40) = v19;
    os_log(_:dso:log:_:_:)(v12, &_mh_execute_header, v13, "Error sending file: %@", 22, 2, v15);
    result = swift_bridgeObjectRelease(v15);
    v53[0] = a3;
    v53[1] = a4;
    v54 = xmmword_100022880;
    v55 = 1;
    v21 = *(void **)(a2 + OBJC_IVAR___AudioBoxController_bluetoothManager);
    if (!v21)
    {
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain(a4);
    v22 = v21;
    sub_1000035BC((uint64_t)v53);
    swift_bridgeObjectRelease(a4);

    swift_errorRelease(a1);
    v7 = (_QWORD *)&unk_100035000;
    v8 = "Error encoding message: %@" + 16;
    p_type = (char **)(&stru_10002CFF0 + 16);
  }
  else
  {
    v23 = static os_log_type_t.default.getter(0);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    v24 = qword_1000353C8;
    v25 = sub_100009A34(&qword_10002E0B0);
    v26 = swift_allocObject(v25, 72, 7);
    *(_OWORD *)(v26 + 16) = xmmword_10001F910;
    *(_QWORD *)(v26 + 56) = &type metadata for String;
    *(_QWORD *)(v26 + 64) = sub_100009A78();
    *(_QWORD *)(v26 + 32) = a3;
    *(_QWORD *)(v26 + 40) = a4;
    swift_bridgeObjectRetain(a4);
    os_log(_:dso:log:_:_:)(v23, &_mh_execute_header, v24, "Finished sending file %@", 24, 2, v26);
    swift_bridgeObjectRelease(v26);
  }
  v27 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  URL._bridgeToObjectiveC()(v28);
  v30 = v29;
  v52 = 0;
  v31 = objc_msgSend(v27, "removeItemAtURL:error:", v29, &v52);

  v32 = v52;
  if (v31)
  {
    v33 = static os_log_type_t.default.getter(v52);
    if (p_type[335] != (char *)-1)
      swift_once(&qword_10002DA78, sub_100018040);
    v34 = v7[121];
    v35 = sub_100009A34(&qword_10002E0B0);
    v36 = swift_allocObject(v35, 72, 7);
    *(_OWORD *)(v36 + 16) = *((_OWORD *)v8 + 145);
    v37 = URL.path.getter(v36);
    v39 = v38;
    *(_QWORD *)(v36 + 56) = &type metadata for String;
    *(_QWORD *)(v36 + 64) = sub_100009A78();
    *(_QWORD *)(v36 + 32) = v37;
    *(_QWORD *)(v36 + 40) = v39;
    os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v34, "Deleted file %@", 15, 2, v36);
    return swift_bridgeObjectRelease(v36);
  }
  else
  {
    v40 = v52;
    v41 = (void *)_convertNSErrorToError(_:)(v32);

    v43 = swift_willThrow(v42);
    v44 = static os_log_type_t.error.getter(v43);
    if (p_type[335] != (char *)-1)
      swift_once(&qword_10002DA78, sub_100018040);
    v45 = v7[121];
    v46 = sub_100009A34(&qword_10002E0B0);
    v47 = swift_allocObject(v46, 112, 7);
    *(_OWORD *)(v47 + 16) = xmmword_10001F920;
    *(_QWORD *)(v47 + 56) = &type metadata for String;
    v48 = sub_100009A78();
    *(_QWORD *)(v47 + 64) = v48;
    *(_QWORD *)(v47 + 32) = a3;
    *(_QWORD *)(v47 + 40) = a4;
    v52 = v41;
    swift_bridgeObjectRetain(a4);
    swift_errorRetain(v41);
    v49 = sub_100009A34((uint64_t *)&unk_10002EC10);
    v50 = String.init<A>(describing:)(&v52, v49);
    *(_QWORD *)(v47 + 96) = &type metadata for String;
    *(_QWORD *)(v47 + 104) = v48;
    *(_QWORD *)(v47 + 72) = v50;
    *(_QWORD *)(v47 + 80) = v51;
    os_log(_:dso:log:_:_:)(v44, &_mh_execute_header, v45, "Error deleting file %@: %@", 26, 2, v47);
    swift_bridgeObjectRelease(v47);
    return swift_errorRelease(v41);
  }
}

id sub_10001A720(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  char *v5;
  char *v6;
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
  void *v22;
  id v23;
  uint64_t v25;
  id v26;
  Class isa;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  __int128 v32;
  char v33;

  v6 = v5;
  sub_100009A34(&qword_10002EC08);
  __chkstk_darwin();
  type metadata accessor for URL(0);
  v12 = __chkstk_darwin();
  if (a5)
  {
    v13 = swift_errorRetain(a5);
    v14 = static os_log_type_t.error.getter(v13);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    v15 = qword_1000353C8;
    v16 = sub_100009A34(&qword_10002E0B0);
    v17 = swift_allocObject(v16, 72, 7);
    *(_OWORD *)(v17 + 16) = xmmword_10001F910;
    v31[0] = a5;
    swift_errorRetain(a5);
    v18 = sub_100009A34((uint64_t *)&unk_10002EC10);
    v19 = String.init<A>(describing:)(v31, v18);
    v21 = v20;
    *(_QWORD *)(v17 + 56) = &type metadata for String;
    *(_QWORD *)(v17 + 64) = sub_100009A78();
    *(_QWORD *)(v17 + 32) = v19;
    *(_QWORD *)(v17 + 40) = v21;
    os_log(_:dso:log:_:_:)(v14, &_mh_execute_header, v15, "Error receiving file: %@", 24, 2, v17);
    swift_bridgeObjectRelease(v17);
    v31[0] = a1;
    v31[1] = a2;
    v32 = xmmword_10001F950;
    v33 = 1;
    v22 = *(void **)&v6[OBJC_IVAR___AudioBoxController_bluetoothManager];
    if (!v22)
    {
      __break(1u);
      JUMPOUT(0x10001ADCCLL);
    }
    swift_bridgeObjectRetain(a2);
    v23 = v22;
    sub_1000035BC((uint64_t)v31);
    swift_bridgeObjectRelease(a2);

    return (id)swift_errorRelease(a5);
  }
  else
  {
    if (a4 >> 60 != 15)
    {
      v28 = sub_1000089F0(a3, a4);
      static os_log_type_t.default.getter(v28);
      if (qword_10002DA78 != -1)
        swift_once(&qword_10002DA78, sub_100018040);
      v30 = sub_100009A34(&qword_10002E0B0);
      v29 = swift_allocObject(v30, 112, 7);
      *(_OWORD *)(v29 + 16) = xmmword_10001F920;
      *(_QWORD *)(v29 + 56) = &type metadata for String;
      *(_QWORD *)(v29 + 64) = sub_100009A78();
      *(_QWORD *)(v29 + 32) = a1;
      *(_QWORD *)(v29 + 40) = a2;
      __asm { BR              X11 }
    }
    v25 = static os_log_type_t.fault.getter(v12);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    os_log(_:dso:log:_:_:)(v25, &_mh_execute_header, qword_1000353C8, "Both fileData and error are nil", 31, 2, &_swiftEmptyArrayStorage);
    v26 = objc_msgSend(v6, "result");
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v26, "setStatusCode:", isa);

    return objc_msgSend(v6, "setFinished:", 1);
  }
}

void sub_10001ADE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  _BOOL4 v17;
  NSString v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  int v29;
  NSURL *v30;
  char *v31;
  double v32;
  char v33;
  char *v34;
  _BOOL4 v35;
  NSString v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  _QWORD *v59;
  void *v60;
  _QWORD *v61;
  char *v62;
  const void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  uint64_t v76;
  void *v77;
  _QWORD *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _BOOL4 v85;
  char *v86;
  char v87[24];
  __int128 aBlock;
  __int128 v89;
  void (*v90)(uint64_t);
  _QWORD *v91;
  _QWORD v92[5];
  char v93[32];
  uint64_t v94;
  char v95[32];
  uint64_t v96;
  _QWORD v97[2];
  __int128 v98;
  char v99;

  sub_10001C6C8(a1, (uint64_t)v92);
  v4 = v92[0];
  v5 = v92[1];
  v81 = v92[2];
  v6 = v92[4];
  v84 = v92[3];
  v7 = sub_100009A34(&qword_10002EC08);
  __chkstk_darwin(v7);
  v9 = (char *)&v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v80 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v80 - v15;
  v83 = v5;
  v82 = v4;
  if (a2)
    v17 = *(_QWORD *)(a2 + 16) != 0;
  else
    v17 = 0;
  v18 = objc_msgSend(objc_allocWithZone((Class)AVAudioDeviceTestSequence), "init");
  objc_msgSend(v18, "setOutputMode:", 0);
  objc_msgSend(v18, "setPriority:", 0);
  sub_10001C6C8(a1, (uint64_t)v95);
  v85 = v17;
  if (v96)
  {
    v19 = &v86[OBJC_IVAR___AudioBoxController_fileNameToURLMap];
    swift_beginAccess(&v86[OBJC_IVAR___AudioBoxController_fileNameToURLMap], v87, 0, 0);
    v20 = *(_QWORD *)v19;
    if (*(_QWORD *)(v20 + 16))
    {
      sub_10001C7F4(a1);
      swift_bridgeObjectRetain(v20);
      v21 = sub_10001C790(v84, v6);
      if ((v22 & 1) != 0)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v9, *(_QWORD *)(v20 + 56) + *(_QWORD *)(v11 + 72) * v21, v10);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
      }
      swift_bridgeObjectRelease(v20);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
      swift_bridgeObjectRetain(v6);
    }
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    {
      v23 = sub_10001C81C((uint64_t)v9);
      v9 = (char *)static os_log_type_t.error.getter(v23);
      if (qword_10002DA78 == -1)
        goto LABEL_13;
      goto LABEL_41;
    }
    v29 = v81;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
    URL._bridgeToObjectiveC()(v30);
    v9 = v31;
    objc_msgSend(v18, "setStimulusURL:", v31);

    objc_msgSend(v18, "setOutputMode:", v82);
    objc_msgSend(v18, "setOutputID:", v83);
    LODWORD(v32) = v29;
    objc_msgSend(v18, "setVolume:", v32);
    sub_10001C85C(a1);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    v17 = v85;
  }
  v33 = !v17;
  if (!a2)
    v33 = 1;
  v34 = v86;
  if ((v33 & 1) != 0)
  {
LABEL_23:
    v40 = sub_10001C6C8(a1, (uint64_t)v93);
    if (v94)
    {
      if (v17)
      {
        v41 = sub_1000180A0();
        URL.path.getter(v41);
        v43 = v42;
        v40 = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
      }
      else
      {
        v43 = 0;
      }
      v64 = static os_log_type_t.default.getter(v40);
      if (qword_10002DA78 != -1)
        swift_once(&qword_10002DA78, sub_100018040);
      v65 = qword_1000353C8;
      v66 = sub_100009A34(&qword_10002E0B0);
      v67 = swift_allocObject(v66, 72, 7);
      *(_OWORD *)(v67 + 16) = xmmword_10001F910;
      v68 = v18;
      v69 = objc_msgSend(v68, "description");
      v70 = static String._unconditionallyBridgeFromObjectiveC(_:)(v69);
      v72 = v71;

      *(_QWORD *)(v67 + 56) = &type metadata for String;
      *(_QWORD *)(v67 + 64) = sub_100009A78();
      *(_QWORD *)(v67 + 32) = v70;
      *(_QWORD *)(v67 + 40) = v72;
      os_log(_:dso:log:_:_:)(v64, &_mh_execute_header, v65, "Playing audio with sequence: %@", 31, 2, v67);
      swift_bridgeObjectRelease(v67);
      v97[0] = 0;
      v97[1] = 0;
      v98 = xmmword_100022890;
      v99 = 1;
      v73 = *(void **)&v34[OBJC_IVAR___AudioBoxController_bluetoothManager];
      if (!v73)
      {
        __break(1u);
        goto LABEL_43;
      }
      v74 = v73;
      sub_1000035BC((uint64_t)v97);

      v75 = *(void **)&v34[OBJC_IVAR___AudioBoxController_audioTest];
      if (v43)
      {
        v18 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v43);
      }
      else
      {
        v18 = 0;
      }
      v76 = swift_allocObject(&unk_10002A9A8, 25, 7);
      *(_QWORD *)(v76 + 16) = v34;
      *(_BYTE *)(v76 + 24) = v85;
      v90 = sub_10001C784;
      v91 = (_QWORD *)v76;
      *(_QWORD *)&aBlock = _NSConcreteStackBlock;
      *((_QWORD *)&aBlock + 1) = 1107296256;
      *(_QWORD *)&v89 = sub_10001BC1C;
      *((_QWORD *)&v89 + 1) = &unk_10002A9C0;
      v77 = _Block_copy(&aBlock);
      v78 = v91;
      v79 = v34;
      swift_release(v78);
      objc_msgSend(v75, "playback:filePath:completion:", v68, v18, v77);

      v63 = v77;
    }
    else
    {
      if (!v17)
        goto LABEL_39;
      v44 = sub_1000180A0();
      v45 = URL.path.getter(v44);
      v47 = v46;
      v48 = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
      v49 = static os_log_type_t.default.getter(v48);
      if (qword_10002DA78 != -1)
        swift_once(&qword_10002DA78, sub_100018040);
      v50 = qword_1000353C8;
      v51 = sub_100009A34(&qword_10002E0B0);
      v52 = swift_allocObject(v51, 72, 7);
      *(_OWORD *)(v52 + 16) = xmmword_10001F910;
      v53 = v18;
      v54 = objc_msgSend(v53, "description");
      v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
      v57 = v56;

      *(_QWORD *)(v52 + 56) = &type metadata for String;
      *(_QWORD *)(v52 + 64) = sub_100009A78();
      *(_QWORD *)(v52 + 32) = v55;
      *(_QWORD *)(v52 + 40) = v57;
      os_log(_:dso:log:_:_:)(v49, &_mh_execute_header, v50, "Recording audio with sequence: %@", 33, 2, v52);
      swift_bridgeObjectRelease(v52);
      v58 = *(void **)&v34[OBJC_IVAR___AudioBoxController_audioTest];
      v18 = String._bridgeToObjectiveC()();
      v59 = (_QWORD *)swift_allocObject(&unk_10002A958, 40, 7);
      v59[2] = v34;
      v59[3] = v45;
      v59[4] = v47;
      v90 = sub_10001C73C;
      v91 = v59;
      *(_QWORD *)&aBlock = _NSConcreteStackBlock;
      *((_QWORD *)&aBlock + 1) = 1107296256;
      *(_QWORD *)&v89 = sub_10001BC1C;
      *((_QWORD *)&v89 + 1) = &unk_10002A970;
      v60 = _Block_copy(&aBlock);
      v61 = v91;
      v62 = v34;
      swift_release(v61);
      objc_msgSend(v58, "startRecording:filePath:completion:", v53, v18, v60);

      v63 = v60;
    }
    _Block_release(v63);
    goto LABEL_39;
  }
  if (*(_QWORD *)(a2 + 16) == 1)
    __asm { BR              X10 }
  v35 = v17;
  v36 = String._bridgeToObjectiveC()();
  objc_msgSend(v18, "setMicrophone:", v36);

  v37 = *(_QWORD *)&v34[OBJC_IVAR___AudioBoxController_recordingNumber];
  v38 = __OFADD__(v37, 1);
  v39 = v37 + 1;
  if (!v38)
  {
    *(_QWORD *)&v34[OBJC_IVAR___AudioBoxController_recordingNumber] = v39;
    v17 = v35;
    goto LABEL_23;
  }
  __break(1u);
LABEL_41:
  swift_once(&qword_10002DA78, sub_100018040);
LABEL_13:
  v24 = qword_1000353C8;
  v25 = sub_100009A34(&qword_10002E0B0);
  v26 = swift_allocObject(v25, 72, 7);
  *(_OWORD *)(v26 + 16) = xmmword_10001F910;
  *(_QWORD *)(v26 + 56) = &type metadata for String;
  *(_QWORD *)(v26 + 64) = sub_100009A78();
  *(_QWORD *)(v26 + 32) = v84;
  *(_QWORD *)(v26 + 40) = v6;
  os_log(_:dso:log:_:_:)(v9, &_mh_execute_header, v24, "Error: No URL found for file %@", 31, 2, v26);
  swift_bridgeObjectRelease(v26);
  aBlock = xmmword_100022880;
  v89 = xmmword_100022890;
  LOBYTE(v90) = 1;
  v27 = *(void **)&v86[OBJC_IVAR___AudioBoxController_bluetoothManager];
  if (!v27)
  {
LABEL_43:
    __break(1u);
    JUMPOUT(0x10001B768);
  }
  v28 = v27;
  sub_1000035BC((uint64_t)&aBlock);

  v18 = v28;
LABEL_39:

}

void sub_10001B778(uint64_t a1, void *a2, char a3)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  char *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  void *v39;
  uint64_t v40;
  char *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  char *v48;
  __int128 v49;
  __int128 v50;
  char v51;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = __chkstk_darwin(v6);
  v10 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v45 - v12;
  if (a1)
  {
    v14 = swift_errorRetain(a1);
    v15 = static os_log_type_t.error.getter(v14);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    v16 = qword_1000353C8;
    v17 = sub_100009A34(&qword_10002E0B0);
    v18 = swift_allocObject(v17, 72, 7);
    *(_OWORD *)(v18 + 16) = xmmword_10001F910;
    *(_QWORD *)&v49 = a1;
    swift_errorRetain(a1);
    v19 = sub_100009A34((uint64_t *)&unk_10002EC10);
    v20 = String.init<A>(describing:)(&v49, v19);
    v22 = v21;
    *(_QWORD *)(v18 + 56) = &type metadata for String;
    *(_QWORD *)(v18 + 64) = sub_100009A78();
    *(_QWORD *)(v18 + 32) = v20;
    *(_QWORD *)(v18 + 40) = v22;
    os_log(_:dso:log:_:_:)(v15, &_mh_execute_header, v16, "Error running test sequence: %@", 31, 2, v18);
    swift_bridgeObjectRelease(v18);
    v49 = xmmword_100022880;
    v50 = xmmword_100022890;
    v51 = 1;
    v23 = *(void **)((char *)a2 + OBJC_IVAR___AudioBoxController_bluetoothManager);
    if (v23)
    {
      v24 = v23;
      sub_1000035BC((uint64_t)&v49);

      swift_errorRelease(a1);
      return;
    }
    __break(1u);
    goto LABEL_14;
  }
  v25 = static os_log_type_t.default.getter(v11);
  if (qword_10002DA78 != -1)
    swift_once(&qword_10002DA78, sub_100018040);
  os_log(_:dso:log:_:_:)(v25, &_mh_execute_header, qword_1000353C8, "Finished playing audio!", 23, 2, &_swiftEmptyArrayStorage);
  v49 = xmmword_10001F950;
  v50 = xmmword_100022890;
  v51 = 1;
  v26 = (char *)OBJC_IVAR___AudioBoxController_bluetoothManager;
  v27 = *(void **)((char *)a2 + OBJC_IVAR___AudioBoxController_bluetoothManager);
  if (!v27)
  {
LABEL_14:
    __break(1u);
    __break(1u);
    goto LABEL_15;
  }
  v28 = v27;
  sub_1000035BC((uint64_t)&v49);

  if ((a3 & 1) != 0)
  {
    v48 = v26;
    v29 = sub_1000180A0();
    v30 = URL.lastPathComponent.getter(v29);
    v32 = v31;
    v33 = Data.init(contentsOf:options:)(v13, 0);
    v47 = a2;
    v45 = v33;
    v46 = v30;
    v48 = *(char **)&v48[(_QWORD)a2];
    if (!v48)
    {
LABEL_15:
      __break(1u);
      return;
    }
    v35 = v34;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v13, v6);
    v36 = *(unsigned __int8 *)(v7 + 80);
    v37 = (v36 + 40) & ~v36;
    v38 = (char *)swift_allocObject(&unk_10002A9F8, v37 + v8, v36 | 7);
    v40 = v46;
    v39 = v47;
    *((_QWORD *)v38 + 2) = v47;
    *((_QWORD *)v38 + 3) = v40;
    *((_QWORD *)v38 + 4) = v32;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v38[v37], v10, v6);
    v41 = v48;
    v42 = v39;
    swift_bridgeObjectRetain(v32);
    v43 = v40;
    v44 = v45;
    sub_100003DAC(v43, v32, v45, v35);

    sub_100008A34(v44, v35);
    swift_release(v38);
    swift_bridgeObjectRelease(v32);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  }
}

void sub_10001BC1C(uint64_t a1, void *a2)
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

void sub_10001BC70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  char v27;

  if (a1)
  {
    v6 = swift_errorRetain(a1);
    v7 = static os_log_type_t.error.getter(v6);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    v8 = qword_1000353C8;
    v9 = sub_100009A34(&qword_10002E0B0);
    v10 = swift_allocObject(v9, 72, 7);
    *(_OWORD *)(v10 + 16) = xmmword_10001F910;
    *(_QWORD *)&v25 = a1;
    swift_errorRetain(a1);
    v11 = sub_100009A34((uint64_t *)&unk_10002EC10);
    v12 = String.init<A>(describing:)(&v25, v11);
    v14 = v13;
    *(_QWORD *)(v10 + 56) = &type metadata for String;
    *(_QWORD *)(v10 + 64) = sub_100009A78();
    *(_QWORD *)(v10 + 32) = v12;
    *(_QWORD *)(v10 + 40) = v14;
    os_log(_:dso:log:_:_:)(v7, &_mh_execute_header, v8, "Error recording: %@", 19, 2, v10);
    swift_bridgeObjectRelease(v10);
    v25 = xmmword_1000228A0;
    v26 = xmmword_100022890;
    v27 = 1;
    v15 = *(void **)(a2 + OBJC_IVAR___AudioBoxController_bluetoothManager);
    if (v15)
    {
      v16 = v15;
      sub_1000035BC((uint64_t)&v25);

      swift_errorRelease(a1);
      return;
    }
    __break(1u);
  }
  else
  {
    v19 = static os_log_type_t.default.getter(0);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    v20 = qword_1000353C8;
    v21 = sub_100009A34(&qword_10002E0B0);
    v22 = swift_allocObject(v21, 72, 7);
    *(_OWORD *)(v22 + 16) = xmmword_10001F910;
    *(_QWORD *)(v22 + 56) = &type metadata for String;
    *(_QWORD *)(v22 + 64) = sub_100009A78();
    *(_QWORD *)(v22 + 32) = a3;
    *(_QWORD *)(v22 + 40) = a4;
    swift_bridgeObjectRetain(a4);
    os_log(_:dso:log:_:_:)(v19, &_mh_execute_header, v20, "Started recording to %@", 23, 2, v22);
    swift_bridgeObjectRelease(v22);
    v25 = xmmword_100022890;
    v26 = xmmword_100022890;
    v27 = 1;
    v23 = *(void **)(a2 + OBJC_IVAR___AudioBoxController_bluetoothManager);
    if (v23)
    {
      v24 = v23;
      sub_1000035BC((uint64_t)&v25);

      return;
    }
  }
  __break(1u);
}

uint64_t sub_10001BEF0(uint64_t a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v20;
  uint64_t result;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  id v39;
  char *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  char v48;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = __chkstk_darwin(v4);
  v8 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v42 - v10;
  if (a1)
  {
    v12 = swift_errorRetain(a1);
    v13 = static os_log_type_t.error.getter(v12);
    if (qword_10002DA78 != -1)
      swift_once(&qword_10002DA78, sub_100018040);
    v14 = qword_1000353C8;
    v15 = sub_100009A34(&qword_10002E0B0);
    v16 = swift_allocObject(v15, 72, 7);
    *(_OWORD *)(v16 + 16) = xmmword_10001F910;
    *(_QWORD *)&v46 = a1;
    swift_errorRetain(a1);
    v17 = sub_100009A34((uint64_t *)&unk_10002EC10);
    v18 = String.init<A>(describing:)(&v46, v17);
    v20 = v19;
    *(_QWORD *)(v16 + 56) = &type metadata for String;
    *(_QWORD *)(v16 + 64) = sub_100009A78();
    *(_QWORD *)(v16 + 32) = v18;
    *(_QWORD *)(v16 + 40) = v20;
    os_log(_:dso:log:_:_:)(v13, &_mh_execute_header, v14, "Error saving recording file: %@", 31, 2, v16);
    result = swift_bridgeObjectRelease(v16);
    v46 = xmmword_1000228A0;
    v47 = xmmword_100022890;
    v48 = 1;
    v22 = *(void **)&a2[OBJC_IVAR___AudioBoxController_bluetoothManager];
    if (v22)
    {
      v23 = v22;
      sub_1000035BC((uint64_t)&v46);

      return swift_errorRelease(a1);
    }
    __break(1u);
    goto LABEL_12;
  }
  v24 = static os_log_type_t.default.getter(v9);
  if (qword_10002DA78 != -1)
    swift_once(&qword_10002DA78, sub_100018040);
  v45 = v4;
  result = os_log(_:dso:log:_:_:)(v24, &_mh_execute_header, qword_1000353C8, "Finished recording!", 19, 2, &_swiftEmptyArrayStorage);
  v46 = xmmword_1000228B0;
  v47 = xmmword_100022890;
  v48 = 1;
  v25 = OBJC_IVAR___AudioBoxController_bluetoothManager;
  v26 = *(void **)&a2[OBJC_IVAR___AudioBoxController_bluetoothManager];
  if (!v26)
  {
LABEL_12:
    __break(1u);
    __break(1u);
    goto LABEL_13;
  }
  v27 = v26;
  sub_1000035BC((uint64_t)&v46);

  v28 = sub_1000180A0();
  v29 = URL.lastPathComponent.getter(v28);
  v31 = v30;
  result = Data.init(contentsOf:options:)(v11, 0);
  v43 = result;
  v44 = v29;
  v42 = *(id *)&a2[v25];
  if (v42)
  {
    v33 = v32;
    v34 = v45;
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v11, v45);
    v35 = *(unsigned __int8 *)(v5 + 80);
    v36 = (v35 + 40) & ~v35;
    v37 = (char *)swift_allocObject(&unk_10002AA70, v36 + v6, v35 | 7);
    v38 = v44;
    *((_QWORD *)v37 + 2) = a2;
    *((_QWORD *)v37 + 3) = v38;
    *((_QWORD *)v37 + 4) = v31;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v37[v36], v8, v34);
    v39 = v42;
    v40 = a2;
    swift_bridgeObjectRetain(v31);
    v41 = v43;
    sub_100003DAC(v38, v31, v43, v33);

    sub_100008A34(v41, v33);
    swift_release(v37);
    swift_bridgeObjectRelease(v31);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v34);
  }
LABEL_13:
  __break(1u);
  return result;
}

id sub_10001C390()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  char *v7;
  objc_class *v8;
  objc_super v10;

  v1 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OBJC_IVAR___AudioBoxController_audioTest;
  v6 = objc_allocWithZone((Class)AVAudioDeviceTest);
  v7 = v0;
  *(_QWORD *)&v0[v5] = objc_msgSend(v6, "init");
  *(_QWORD *)&v7[OBJC_IVAR___AudioBoxController_bluetoothManager] = 0;
  *(_QWORD *)&v7[OBJC_IVAR___AudioBoxController_inputs] = 0;
  *(_QWORD *)&v7[OBJC_IVAR___AudioBoxController_responder] = 0;
  *(_QWORD *)&v7[OBJC_IVAR___AudioBoxController_fileNameToURLMap] = &_swiftEmptyDictionarySingleton;
  URL.init(fileURLWithPath:)(0xD000000000000011, 0x800000010001F820);
  URL.appendingPathComponent(_:isDirectory:)(0xD00000000000002CLL, 0x800000010001F840, 1);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  *(_QWORD *)&v7[OBJC_IVAR___AudioBoxController_recordingNumber] = 0;

  v8 = (objc_class *)type metadata accessor for AudioBoxController(0);
  v10.receiver = v7;
  v10.super_class = v8;
  return objc_msgSendSuper2(&v10, "init");
}

id sub_10001C51C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioBoxController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001C5E0()
{
  return type metadata accessor for AudioBoxController(0);
}

uint64_t type metadata accessor for AudioBoxController(uint64_t a1)
{
  uint64_t result;

  result = qword_10002EBF0;
  if (!qword_10002EBF0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AudioBoxController);
  return result;
}

uint64_t sub_10001C624(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[7];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = "\b";
  v4[2] = "\b";
  v4[3] = "\b";
  v4[4] = (char *)&value witness table for Builtin.BridgeObject + 64;
  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(result - 8) + 64;
    v4[6] = (char *)&value witness table for Builtin.Int64 + 64;
    result = swift_updateClassMetadata2(a1, 256, 7, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_10001C6C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100009A34(&qword_10002EC00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001C710()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_10001C73C(uint64_t a1)
{
  uint64_t *v1;

  sub_10001BC70(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10001C748(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001C758(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001C760()
{
  uint64_t v0;

  return swift_deallocObject(v0, 25, 7);
}

void sub_10001C784(uint64_t a1)
{
  uint64_t v1;

  sub_10001B778(a1, *(void **)(v1 + 16), *(_BYTE *)(v1 + 24));
}

unint64_t sub_10001C790(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10001C884(a1, a2, v5);
}

uint64_t sub_10001C7F4(uint64_t a1)
{
  swift_bridgeObjectRetain(*(_QWORD *)(a1 + 32));
  return a1;
}

uint64_t sub_10001C81C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100009A34(&qword_10002EC08);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001C85C(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 32));
  return a1;
}

unint64_t sub_10001C884(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_10001C96C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002E1A8;
  if (!qword_10002E1A8)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10002E1A8);
  }
  return result;
}

uint64_t sub_10001C9A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  unint64_t v9;
  char v10;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v4 = v3;
  v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  v9 = sub_10001C790(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v12 = *v4;
    v19 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10001D208();
      v12 = v19;
    }
    swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v9 + 8));
    v13 = *(_QWORD *)(v12 + 56);
    v14 = type metadata accessor for URL(0);
    v15 = *(_QWORD *)(v14 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v15 + 32))(a3, v13 + *(_QWORD *)(v15 + 72) * v9, v14);
    sub_10001CE40(v9, v12);
    v16 = *v4;
    *v4 = v12;
    swift_bridgeObjectRelease(v16);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v15 + 56))(a3, 0, 1, v14);
  }
  else
  {
    v18 = type metadata accessor for URL(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a3, 1, 1, v18);
  }
}

Swift::Int sub_10001CAD8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  Swift::Int result;
  int64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
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
  uint64_t v40;
  uint64_t *v41;
  int64_t v42;
  _QWORD *v43;
  int v44;
  char *v45;
  uint64_t v46;
  _QWORD v47[9];

  v3 = v2;
  v46 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v46 - 8);
  __chkstk_darwin();
  v45 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v3;
  if (*(_QWORD *)(*v3 + 24) > a1)
    a1 = *(_QWORD *)(*v3 + 24);
  sub_100009A34(&qword_10002EC20);
  v44 = a2;
  v9 = static _DictionaryStorage.resize(original:capacity:move:)(v8, a1, a2);
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v41 = v3;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v43 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v42 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain(v8);
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_24;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v42)
      goto LABEL_36;
    v23 = v43[v22];
    ++v17;
    if (!v23)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v42)
        goto LABEL_36;
      v23 = v43[v17];
      if (!v23)
        break;
    }
LABEL_23:
    v14 = (v23 - 1) & v23;
    v21 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_24:
    v25 = *(_QWORD *)(v8 + 56);
    v26 = v8;
    v27 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v21);
    v29 = *v27;
    v28 = v27[1];
    v30 = *(_QWORD *)(v6 + 72);
    v31 = v25 + v30 * v21;
    if ((v44 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v45, v31, v46);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v45, v31, v46);
      swift_bridgeObjectRetain(v28);
    }
    Hasher.init(_seed:)(v47, *(_QWORD *)(v10 + 40));
    String.hash(into:)(v47, v29, v28);
    result = Hasher._finalize()();
    v32 = -1 << *(_BYTE *)(v10 + 32);
    v33 = result & ~v32;
    v34 = v33 >> 6;
    if (((-1 << v33) & ~*(_QWORD *)(v15 + 8 * (v33 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v15 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_42;
        }
        v37 = v34 == v36;
        if (v34 == v36)
          v34 = 0;
        v35 |= v37;
        v38 = *(_QWORD *)(v15 + 8 * v34);
      }
      while (v38 == -1);
      v18 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v18);
    *v19 = v29;
    v19[1] = v28;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v10 + 56) + v30 * v18, v45, v46);
    ++*(_QWORD *)(v10 + 16);
    v8 = v26;
  }
  v24 = v22 + 2;
  if (v24 < v42)
  {
    v23 = v43[v24];
    if (!v23)
    {
      while (1)
      {
        v17 = v24 + 1;
        if (__OFADD__(v24, 1))
          goto LABEL_43;
        if (v17 >= v42)
          goto LABEL_36;
        v23 = v43[v17];
        ++v24;
        if (v23)
          goto LABEL_23;
      }
    }
    v17 = v24;
    goto LABEL_23;
  }
LABEL_36:
  swift_release(v8);
  v3 = v41;
  if ((v44 & 1) != 0)
  {
    v39 = 1 << *(_BYTE *)(v8 + 32);
    if (v39 >= 64)
      bzero(v43, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    else
      *v43 = -1 << v39;
    *(_QWORD *)(v8 + 16) = 0;
  }
LABEL_41:
  result = swift_release(v8);
  *v3 = v10;
  return result;
}

unint64_t sub_10001CE40(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Int v12;
  unint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  unint64_t v21;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD v29[9];

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
      while (1)
      {
        v9 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v10 = *v9;
        v11 = v9[1];
        Hasher.init(_seed:)(v29, *(_QWORD *)(a2 + 40));
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v29, v10, v11);
        v12 = Hasher._finalize()();
        result = swift_bridgeObjectRelease(v11);
        v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v13 < v8)
          goto LABEL_11;
LABEL_12:
        v14 = *(_QWORD *)(a2 + 48);
        v15 = (_OWORD *)(v14 + 16 * v3);
        v16 = (_OWORD *)(v14 + 16 * v6);
        if (v3 != v6 || v15 >= v16 + 1)
          *v15 = *v16;
        v17 = *(_QWORD *)(a2 + 56);
        v18 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for URL(0) - 8) + 72);
        v19 = v18 * v3;
        result = v17 + v18 * v3;
        v20 = v18 * v6;
        v21 = v17 + v18 * v6 + v18;
        if (v19 < v20 || result >= v21)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v19 == v20)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v13 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v13)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v23 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v24 = *v23;
    v25 = (-1 << v3) - 1;
  }
  else
  {
    v23 = (uint64_t *)(v4 + 8 * (result >> 6));
    v25 = *v23;
    v24 = (-1 << result) - 1;
  }
  *v23 = v25 & v24;
  v26 = *(_QWORD *)(a2 + 16);
  v27 = __OFSUB__(v26, 1);
  v28 = v26 - 1;
  if (v27)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v28;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10001D03C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_10001C790(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7];
        v20 = type metadata accessor for URL(0);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v12, a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10001D208();
      goto LABEL_7;
    }
    sub_10001CAD8(v15, a4 & 1);
    v22 = sub_10001C790(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_10001D178(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain(a3);
    }
  }
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_10001D178(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = type metadata accessor for URL(0);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, a4, v10);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

void *sub_10001D208()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = type metadata accessor for URL(0);
  v1 = *(_QWORD *)(v34 - 8);
  __chkstk_darwin();
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009A34(&qword_10002EC20);
  v31 = v0;
  v4 = *v0;
  v5 = static _DictionaryStorage.copy(original:)(*v0);
  v6 = *(_QWORD *)(v4 + 16);
  v35 = v5;
  if (!v6)
  {
    result = (void *)swift_release(v4);
    v29 = v35;
    v28 = v31;
LABEL_28:
    *v28 = v29;
    return result;
  }
  v7 = v5;
  result = (void *)(v5 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    v7 = v35;
  }
  v32 = v4 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v4 + 16);
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v33 = (unint64_t)(v12 + 63) >> 6;
  v15 = v34;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      v11 = v25 + 1;
      if (v25 + 1 >= v33)
        goto LABEL_26;
      v26 = *(_QWORD *)(v32 + 8 * v11);
      if (!v26)
        break;
    }
LABEL_25:
    v14 = (v26 - 1) & v26;
    v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(_QWORD *)(v4 + 56) + v22, v15);
    v23 = v35;
    v24 = (_QWORD *)(*(_QWORD *)(v35 + 48) + v18);
    *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v23 + 56) + v22, v3, v15);
    result = (void *)swift_bridgeObjectRetain(v20);
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release(v4);
    v28 = v31;
    v29 = v35;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v32 + 8 * v27);
  if (v26)
  {
    v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v11 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v11);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10001D464()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001D488(uint64_t a1)
{
  uint64_t v1;

  return sub_10001BEF0(a1, *(char **)(v1 + 16));
}

uint64_t sub_10001D494()
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

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001D510(uint64_t a1)
{
  uint64_t *v1;

  type metadata accessor for URL(0);
  return sub_10001A2AC(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10001D554(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10001D55C()
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
  v4 = (v3 + 48) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_10001D5E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for URL(0) - 8) + 80);
  sub_100019520(a1, a2, *(NSObject **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(char **)(v2 + 40), v2 + ((v5 + 48) & ~v5));
}

uint64_t sub_10001D634()
{
  uint64_t v0;

  return sub_100018618(*(_QWORD *)(v0 + 16));
}

void sub_10001D63C()
{
  uint64_t v0;

  sub_1000186E8(*(char **)(v0 + 16));
}

void sub_10001D644()
{
  uint64_t v0;

  sub_10001883C(*(_QWORD *)(v0 + 16));
}

char *sub_10001D64C(uint64_t a1, _BYTE *a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  char *v13;
  id v14;
  void *v15;
  objc_super v17;
  _QWORD v18[5];

  v18[3] = type metadata accessor for AudioBoxController(0);
  v18[4] = &off_10002A928;
  v18[0] = a1;
  v4 = &a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_peripheralScanTimeout];
  *(_QWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_peripheralScanTimeout] = 30;
  v5 = enum case for DispatchTimeInterval.seconds(_:);
  v6 = type metadata accessor for DispatchTimeInterval(0);
  v7 = *(void (**)(void))(*(_QWORD *)(v6 - 8) + 104);
  ((void (*)(char *, uint64_t, uint64_t))v7)(v4, v5, v6);
  *(_QWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_authenticationTimeout] = 15;
  v7();
  *(_QWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_centralManager] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagingCharacteristic] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capPSMCharacteristic] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capChannel] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBox] = 0;
  v8 = &a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxSerial];
  *v8 = 0;
  v8[1] = 0;
  v9 = &a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_expectedAudioBoxToken];
  *v9 = 0;
  v9[1] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagePacketsReceived] = &_swiftEmptyArrayStorage;
  *(_OWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataReceived] = xmmword_10001F930;
  *(_OWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataToSend] = xmmword_10001F930;
  *(_QWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_expectedFiles] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_filesToSend] = &_swiftEmptyArrayStorage;
  a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_isBluetoothReady] = 0;
  a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_isAudioBoxAuthenticated] = 0;
  v10 = &a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_bluetoothReadyCallback];
  *v10 = 0;
  v10[1] = 0;
  v11 = &a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxConnectionCompletion];
  *v11 = 0;
  v11[1] = 0;
  v12 = &a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxAuthenticationCompletion];
  *v12 = 0;
  v12[1] = 0;
  sub_10001D864((uint64_t)v18, (uint64_t)&a2[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate]);
  v17.receiver = a2;
  v17.super_class = (Class)type metadata accessor for AudioBoxBluetoothManager(0);
  v13 = (char *)objc_msgSendSuper2(&v17, "init");
  v14 = objc_msgSend(objc_allocWithZone((Class)CBCentralManager), "initWithDelegate:queue:", v13, 0);
  sub_10000B224(v18);
  v15 = *(void **)&v13[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_centralManager];
  *(_QWORD *)&v13[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_centralManager] = v14;

  return v13;
}

uint64_t sub_10001D864(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

