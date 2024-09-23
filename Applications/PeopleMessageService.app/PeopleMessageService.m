id sub_100002A68()
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
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0, 0, v9, v11);
  swift_bridgeObjectRelease(v11);
  exit((int)v8);
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC20PeopleMessageService11AppDelegate);
}

void type metadata accessor for UIBackgroundTaskIdentifier()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1000197F8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100014A48);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000197F8);
  }
}

NSNumber sub_100002B94()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100002B9C(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v6 = 0;
  v7 = 1;
  result = static Int._forceBridgeFromObjectiveC(_:result:)(a1, &v6);
  v4 = v6;
  v5 = v7;
  if (v7)
    v4 = 0;
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_100002BEC(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v7;
  char v8;

  v7 = 0;
  v8 = 1;
  v3 = static Int._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v7);
  v4 = v7;
  v5 = v8;
  if (v8)
    v4 = 0;
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v5;
  return v3 & 1;
}

uint64_t sub_100002C40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static Int._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  return result;
}

BOOL sub_100002C64(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_100002C78@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100002C88(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_100002C94(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100002DBC(&qword_100019818, (uint64_t)&unk_100012A44);
  v3 = sub_100002DBC((unint64_t *)&unk_100019820, (uint64_t)&unk_1000129E4);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for Int);
}

uint64_t sub_100002D18()
{
  return sub_100002DBC(&qword_100019800, (uint64_t)&unk_1000129A8);
}

uint64_t sub_100002D3C()
{
  return sub_100002DBC(&qword_100019808, (uint64_t)&unk_10001297C);
}

uint64_t sub_100002D60()
{
  return sub_100002DBC(&qword_100019810, (uint64_t)&unk_100012A18);
}

uint64_t sub_100002D84()
{
  _QWORD *v0;

  return Int.hashValue.getter(*v0);
}

void sub_100002D8C()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

uint64_t sub_100002DB4(uint64_t a1)
{
  _QWORD *v1;

  return static Hasher._hash(seed:_:)(a1, *v1);
}

uint64_t sub_100002DBC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for UIBackgroundTaskIdentifier();
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_100002DFC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  id v19;
  _BYTE v20[24];
  _BYTE v21[24];

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  v8 = &v20[-v7];
  v9 = (_QWORD *)(a1 + 16);
  v10 = swift_beginAccess(a1 + 16, v21, 0, 0);
  if (*(_QWORD *)(a1 + 16) == UIBackgroundTaskInvalid)
  {
    v11 = static PeopleLogger.messages.getter(v10);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "sendMessage cleanup but task invalid", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    v15 = static PeopleLogger.messages.getter(v10);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "sendMessage cleanup task", v18, 2u);
      swift_slowDealloc(v18, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v8, v2);
    v19 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    swift_beginAccess(v9, v20, 0, 0);
    objc_msgSend(v19, "endBackgroundTask:", *v9);

  }
}

uint64_t sub_10000301C(uint64_t a1)
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

id sub_100003084()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessageComposer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MessageComposer()
{
  return objc_opt_self(_TtC20PeopleMessageService15MessageComposer);
}

unint64_t sub_1000030D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 40);
  v5 = type metadata accessor for MessageDetails.EventSource(0);
  v6 = sub_100006754(&qword_1000198E8, (uint64_t (*)(uint64_t))&type metadata accessor for MessageDetails.EventSource, (uint64_t)&protocol conformance descriptor for MessageDetails.EventSource);
  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_100003140(a1, v7);
}

unint64_t sub_100003140(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  char v15;
  uint64_t v17;
  uint64_t v18;

  v3 = v2;
  v18 = a1;
  v5 = type metadata accessor for MessageDetails.EventSource(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      v14 = sub_100006754(&qword_1000198F0, (uint64_t (*)(uint64_t))&type metadata accessor for MessageDetails.EventSource, (uint64_t)&protocol conformance descriptor for MessageDetails.EventSource);
      v15 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v18, v5, v14);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v15 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_100003280()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  char *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t);
  int v19;
  uint64_t *v20;
  char v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v25;

  v0 = type metadata accessor for PeopleURL.PathAction(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100006600(&qword_1000198F8);
  __chkstk_darwin(v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100006600(&qword_100019900);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v25 - v12;
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v25 - v15;
  URLComponents.peopleAction.getter(v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v13, enum case for PeopleURL.PathAction.sendMessage(_:), v0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v1 + 56))(v13, 0, 1, v0);
  v17 = (uint64_t)&v6[*(int *)(v4 + 48)];
  sub_1000066D4((uint64_t)v16, (uint64_t)v6, &qword_100019900);
  sub_1000066D4((uint64_t)v13, v17, &qword_100019900);
  v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  if (v18((uint64_t)v6, 1, v0) == 1)
  {
    sub_100006718((uint64_t)v13, &qword_100019900);
    sub_100006718((uint64_t)v16, &qword_100019900);
    v19 = v18(v17, 1, v0);
    if (v19 == 1)
      v20 = &qword_100019900;
    else
      v20 = &qword_1000198F8;
    if (v19 == 1)
      v21 = -1;
    else
      v21 = 0;
  }
  else
  {
    sub_1000066D4((uint64_t)v6, (uint64_t)v10, &qword_100019900);
    if (v18(v17, 1, v0) == 1)
    {
      sub_100006718((uint64_t)v13, &qword_100019900);
      sub_100006718((uint64_t)v16, &qword_100019900);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v10, v0);
      v21 = 0;
      v20 = &qword_1000198F8;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v3, v17, v0);
      v22 = sub_100006754(&qword_100019908, (uint64_t (*)(uint64_t))&type metadata accessor for PeopleURL.PathAction, (uint64_t)&protocol conformance descriptor for PeopleURL.PathAction);
      v21 = dispatch thunk of static Equatable.== infix(_:_:)(v10, v3, v0, v22);
      v23 = *(void (**)(char *, uint64_t))(v1 + 8);
      v23(v3, v0);
      v20 = &qword_100019900;
      sub_100006718((uint64_t)v13, &qword_100019900);
      sub_100006718((uint64_t)v16, &qword_100019900);
      v23(v10, v0);
    }
  }
  sub_100006718((uint64_t)v6, v20);
  return v21 & 1;
}

uint64_t sub_10000356C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1[38] = a1;
  v2 = sub_100006600(&qword_1000198C0);
  v1[39] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100006600(&qword_1000198C8);
  v1[40] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DiscoveredHandles(0);
  v1[41] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v1[42] = v5;
  v1[43] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006600(&qword_1000198D0);
  v1[44] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for ResolvedFamily(0);
  v1[45] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v1[46] = v8;
  v1[47] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MessageDetails.EventStatus(0);
  v1[48] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v1[49] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[50] = swift_task_alloc(v11);
  v1[51] = swift_task_alloc(v11);
  v1[52] = swift_task_alloc(v11);
  v12 = type metadata accessor for Logger(0);
  v1[53] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v1[54] = v13;
  v14 = (*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[55] = swift_task_alloc(v14);
  v1[56] = swift_task_alloc(v14);
  v1[57] = swift_task_alloc(v14);
  v1[58] = swift_task_alloc(v14);
  v1[59] = swift_task_alloc(v14);
  v1[60] = swift_task_alloc(v14);
  v15 = type metadata accessor for MessageDetails(0);
  v1[61] = v15;
  v16 = *(_QWORD *)(v15 - 8);
  v1[62] = v16;
  v17 = (*(_QWORD *)(v16 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[63] = swift_task_alloc(v17);
  v1[64] = swift_task_alloc(v17);
  v1[65] = swift_task_alloc(v17);
  v18 = (*(_QWORD *)(*(_QWORD *)(sub_100006600(&qword_1000198D8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[66] = swift_task_alloc(v18);
  v1[67] = swift_task_alloc(v18);
  v1[68] = swift_task_alloc(v18);
  v19 = type metadata accessor for MessageDetails.EventSource(0);
  v1[69] = v19;
  v20 = *(_QWORD *)(v19 - 8);
  v1[70] = v20;
  v1[71] = swift_task_alloc((*(_QWORD *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for PeopleURL.Parameter(0);
  v1[72] = v21;
  v22 = *(_QWORD *)(v21 - 8);
  v1[73] = v22;
  v23 = (*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[74] = swift_task_alloc(v23);
  v1[75] = swift_task_alloc(v23);
  v24 = type metadata accessor for MainActor(0);
  v1[76] = static MainActor.shared.getter();
  v25 = dispatch thunk of Actor.unownedExecutor.getter(v24, &protocol witness table for MainActor);
  v1[77] = v25;
  v1[78] = v26;
  return swift_task_switch(sub_100003828, v25, v26);
}

uint64_t sub_100003828()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unsigned int (*v19)(uint64_t, uint64_t, uint64_t);
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
  uint64_t v31;
  _QWORD *v32;
  id v33;
  NSString v34;
  void *v35;
  uint64_t v36;
  id v37;
  _QWORD *v38;
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
  uint64_t v53;

  v1 = *(_QWORD *)(v0 + 600);
  v2 = *(_QWORD *)(v0 + 584);
  v3 = *(_QWORD *)(v0 + 576);
  v4 = *(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104);
  v4(v1, enum case for PeopleURL.Parameter.requestID(_:), v3);
  v5 = URLComponents.subscript.getter(v1);
  v7 = v6;
  *(_QWORD *)(v0 + 632) = v6;
  v8 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v8(v1, v3);
  if (!v7)
  {
    swift_release(*(_QWORD *)(v0 + 608));
    goto LABEL_11;
  }
  v52 = v5;
  v9 = *(_QWORD *)(v0 + 592);
  v10 = *(_QWORD *)(v0 + 576);
  v11 = *(_QWORD *)(v0 + 560);
  v12 = *(_QWORD *)(v0 + 552);
  v13 = *(_QWORD *)(v0 + 544);
  v4(v9, enum case for PeopleURL.Parameter.eventSource(_:), v10);
  v14 = URLComponents.subscript.getter(v9);
  v16 = v15;
  v8(v9, v10);
  if (v16)
    v17 = v14;
  else
    v17 = 0;
  if (v16)
    v18 = v16;
  else
    v18 = 0xE000000000000000;
  MessageDetails.EventSource.init(rawValue:)(v17, v18);
  v19 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  *(_QWORD *)(v0 + 640) = v19;
  if (v19(v13, 1, v12) == 1)
  {
    v20 = *(_QWORD *)(v0 + 544);
    swift_release(*(_QWORD *)(v0 + 608));
    swift_bridgeObjectRelease(v7);
    sub_100006718(v20, &qword_1000198D8);
LABEL_11:
    v53 = static PeopleErrors.createError(_:code:)(0xD000000000000016, 0x8000000100012130, 500);
    swift_willThrow(v53);
    v21 = *(_QWORD *)(v0 + 592);
    v22 = *(_QWORD *)(v0 + 568);
    v23 = *(_QWORD *)(v0 + 544);
    v24 = *(_QWORD *)(v0 + 536);
    v25 = *(_QWORD *)(v0 + 528);
    v26 = *(_QWORD *)(v0 + 520);
    v28 = *(_QWORD *)(v0 + 504);
    v27 = *(_QWORD *)(v0 + 512);
    v29 = *(_QWORD *)(v0 + 480);
    v39 = *(_QWORD *)(v0 + 472);
    v40 = *(_QWORD *)(v0 + 464);
    v41 = *(_QWORD *)(v0 + 456);
    v42 = *(_QWORD *)(v0 + 448);
    v43 = *(_QWORD *)(v0 + 440);
    v44 = *(_QWORD *)(v0 + 416);
    v45 = *(_QWORD *)(v0 + 408);
    v46 = *(_QWORD *)(v0 + 400);
    v47 = *(_QWORD *)(v0 + 376);
    v48 = *(_QWORD *)(v0 + 352);
    v49 = *(_QWORD *)(v0 + 344);
    v50 = *(_QWORD *)(v0 + 320);
    v51 = *(_QWORD *)(v0 + 312);
    swift_task_dealloc(*(_QWORD *)(v0 + 600));
    swift_task_dealloc(v21);
    swift_task_dealloc(v22);
    swift_task_dealloc(v23);
    swift_task_dealloc(v24);
    swift_task_dealloc(v25);
    swift_task_dealloc(v26);
    swift_task_dealloc(v27);
    swift_task_dealloc(v28);
    swift_task_dealloc(v29);
    swift_task_dealloc(v39);
    swift_task_dealloc(v40);
    swift_task_dealloc(v41);
    swift_task_dealloc(v42);
    swift_task_dealloc(v43);
    swift_task_dealloc(v44);
    swift_task_dealloc(v45);
    swift_task_dealloc(v46);
    swift_task_dealloc(v47);
    swift_task_dealloc(v48);
    swift_task_dealloc(v49);
    swift_task_dealloc(v50);
    swift_task_dealloc(v51);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 560) + 32))(*(_QWORD *)(v0 + 568), *(_QWORD *)(v0 + 544), *(_QWORD *)(v0 + 552));
  v31 = swift_allocObject(&unk_100014B20, 24, 7);
  *(_QWORD *)(v0 + 648) = v31;
  *(_QWORD *)(v31 + 16) = UIBackgroundTaskInvalid;
  v32 = (_QWORD *)(v31 + 16);
  v33 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v34 = String._bridgeToObjectiveC()();
  *(_QWORD *)(v0 + 48) = sub_100006650;
  *(_QWORD *)(v0 + 56) = v31;
  *(_QWORD *)(v0 + 16) = _NSConcreteStackBlock;
  *(_QWORD *)(v0 + 24) = 1107296256;
  *(_QWORD *)(v0 + 32) = sub_10000301C;
  *(_QWORD *)(v0 + 40) = &unk_100014B38;
  v35 = _Block_copy((const void *)(v0 + 16));
  v36 = *(_QWORD *)(v0 + 56);
  swift_retain(v31);
  swift_release(v36);
  v37 = objc_msgSend(v33, "beginBackgroundTaskWithName:expirationHandler:", v34, v35);
  _Block_release(v35);

  swift_beginAccess(v32, v0 + 224, 1, 0);
  *v32 = v37;
  if (qword_100019760 != -1)
    swift_once(&qword_100019760, sub_100008C18);
  v38 = (_QWORD *)swift_task_alloc(dword_100019ADC);
  *(_QWORD *)(v0 + 656) = v38;
  *v38 = v0;
  v38[1] = sub_100003C90;
  return sub_1000092A4(*(_QWORD *)(v0 + 520), v52, v7, *(_QWORD *)(v0 + 568));
}

uint64_t sub_100003C90()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 656);
  *(_QWORD *)(*(_QWORD *)v1 + 664) = v0;
  swift_task_dealloc(v3);
  swift_bridgeObjectRelease(v2[79]);
  if (v0)
    v4 = sub_100006458;
  else
    v4 = sub_100003CFC;
  return swift_task_switch(v4, v2[77], v2[78]);
}

uint64_t sub_100003CFC(uint64_t a1)
{
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
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
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
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(void);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t);
  uint64_t v57;
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
  NSObject *v68;
  os_log_type_t v69;
  _BOOL4 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint8_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  void *v85;
  unsigned int v86;
  unsigned int (*v87)(uint64_t, uint64_t, uint64_t);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  os_log_type_t v94;
  uint8_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  int v117;
  uint64_t v118;
  char v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD *v123;
  uint64_t (*v124)();
  uint64_t v125;
  char v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  os_log_type_t type[8];
  os_log_type_t typea;
  os_log_type_t typeb[8];
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void (*v154)(uint64_t, uint64_t);
  uint64_t v155;
  uint64_t v156;
  void (*v157)(uint64_t, uint64_t);
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t (*v184)(uint64_t, uint64_t, uint64_t);
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  char *v188;
  uint64_t v189;
  uint64_t v190[2];

  v2 = *(_QWORD *)(v1 + 520);
  v3 = *(_QWORD *)(v1 + 512);
  v4 = *(_QWORD *)(v1 + 488);
  v5 = *(_QWORD *)(v1 + 496);
  static PeopleLogger.messages.getter(a1);
  v184 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v6 = v184(v3, v2, v4);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = *(_QWORD *)(v1 + 512);
    v160 = *(_QWORD *)(v1 + 496);
    v164 = *(_QWORD *)(v1 + 488);
    v169 = *(_QWORD *)(v1 + 432);
    v174 = *(_QWORD *)(v1 + 424);
    v179 = *(_QWORD *)(v1 + 480);
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v190[0] = v11;
    *(_DWORD *)v10 = 136315138;
    v12 = MessageDetails.debugDescription.getter();
    v14 = v13;
    *(_QWORD *)(v1 + 296) = sub_100006F70(v12, v13, v190);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 296, v1 + 304, v10 + 4, v10 + 12);
    swift_bridgeObjectRelease(v14);
    v15 = *(void (**)(uint64_t, uint64_t))(v160 + 8);
    v15(v9, v164);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Fetched & created %s", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

    v16 = *(void (**)(uint64_t, uint64_t))(v169 + 8);
    v16(v179, v174);
  }
  else
  {
    v17 = *(_QWORD *)(v1 + 480);
    v18 = *(_QWORD *)(v1 + 424);
    v19 = *(_QWORD *)(v1 + 432);
    v15 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 496) + 8);
    v15(*(_QWORD *)(v1 + 512), *(_QWORD *)(v1 + 488));

    v16 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v16(v17, v18);
  }
  *(_QWORD *)(v1 + 680) = v15;
  *(_QWORD *)(v1 + 672) = v16;
  if (qword_100019768 != -1)
    swift_once(&qword_100019768, sub_100008CBC);
  v20 = qword_100019FB8;
  if (!*(_QWORD *)(qword_100019FB8 + 16) || (v21 = sub_1000030D4(*(_QWORD *)(v1 + 568)), (v22 & 1) == 0))
  {
    v36 = *(_QWORD *)(v1 + 648);
    v37 = *(_QWORD *)(v1 + 568);
    v38 = *(_QWORD *)(v1 + 560);
    v39 = *(_QWORD *)(v1 + 552);
    v40 = *(_QWORD *)(v1 + 520);
    v41 = *(_QWORD *)(v1 + 488);
    swift_release(*(_QWORD *)(v1 + 608));
    v138 = static PeopleErrors.createError(_:code:)(0xD000000000000023, 0x8000000100012170, 500);
    swift_willThrow(v138);
    v15(v40, v41);
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
LABEL_12:
    swift_release(v36);
    v42 = *(_QWORD *)(v1 + 592);
    v43 = *(_QWORD *)(v1 + 568);
    v44 = *(_QWORD *)(v1 + 544);
    v45 = *(_QWORD *)(v1 + 536);
    v46 = *(_QWORD *)(v1 + 528);
    v47 = *(_QWORD *)(v1 + 520);
    v49 = *(_QWORD *)(v1 + 504);
    v48 = *(_QWORD *)(v1 + 512);
    v50 = *(_QWORD *)(v1 + 480);
    v140 = *(_QWORD *)(v1 + 472);
    v143 = *(_QWORD *)(v1 + 464);
    v145 = *(_QWORD *)(v1 + 456);
    *(_QWORD *)type = *(_QWORD *)(v1 + 448);
    v151 = *(_QWORD *)(v1 + 440);
    v155 = *(_QWORD *)(v1 + 416);
    v158 = *(_QWORD *)(v1 + 408);
    v162 = *(_QWORD *)(v1 + 400);
    v166 = *(_QWORD *)(v1 + 376);
    v171 = *(_QWORD *)(v1 + 352);
    v176 = *(_QWORD *)(v1 + 344);
    v180 = *(_QWORD *)(v1 + 320);
    v185 = *(_QWORD *)(v1 + 312);
    swift_task_dealloc(*(_QWORD *)(v1 + 600));
    swift_task_dealloc(v42);
    swift_task_dealloc(v43);
    swift_task_dealloc(v44);
    swift_task_dealloc(v45);
    swift_task_dealloc(v46);
    swift_task_dealloc(v47);
    swift_task_dealloc(v48);
    swift_task_dealloc(v49);
    swift_task_dealloc(v50);
    swift_task_dealloc(v140);
    swift_task_dealloc(v143);
    swift_task_dealloc(v145);
    swift_task_dealloc(*(_QWORD *)type);
    swift_task_dealloc(v151);
    swift_task_dealloc(v155);
    swift_task_dealloc(v158);
    swift_task_dealloc(v162);
    swift_task_dealloc(v166);
    swift_task_dealloc(v171);
    swift_task_dealloc(v176);
    swift_task_dealloc(v180);
    swift_task_dealloc(v185);
    v51 = *(uint64_t (**)(void))(v1 + 8);
    return v51();
  }
  v154 = v16;
  v157 = v15;
  v23 = *(_QWORD *)(v1 + 408);
  v25 = *(_QWORD *)(v1 + 384);
  v24 = *(_QWORD *)(v1 + 392);
  v26 = (_QWORD *)(*(_QWORD *)(v20 + 56) + (v21 << 6));
  *(_QWORD *)(v1 + 688) = *v26;
  v27 = v26[1];
  *(_QWORD *)(v1 + 696) = v27;
  v28 = v26[3];
  *(_QWORD *)(v1 + 704) = v28;
  v29 = v26[5];
  *(_QWORD *)(v1 + 712) = v29;
  v30 = v26[7];
  *(_QWORD *)(v1 + 720) = v30;
  v161 = v27;
  swift_bridgeObjectRetain(v27);
  v165 = v28;
  swift_bridgeObjectRetain(v28);
  v170 = v29;
  swift_bridgeObjectRetain(v29);
  v175 = v30;
  v31 = swift_bridgeObjectRetain(v30);
  MessageDetails.status.getter(v31);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v24 + 104))(v23, enum case for MessageDetails.EventStatus.pending(_:), v25);
  v32 = sub_100006754(&qword_1000198E0, (uint64_t (*)(uint64_t))&type metadata accessor for MessageDetails.EventStatus, (uint64_t)&protocol conformance descriptor for MessageDetails.EventStatus);
  dispatch thunk of RawRepresentable.rawValue.getter(v25, v32);
  dispatch thunk of RawRepresentable.rawValue.getter(v25, v32);
  v33 = *(_QWORD *)(v1 + 256);
  v34 = *(_QWORD *)(v1 + 272);
  if (*(_QWORD *)(v1 + 248) == *(_QWORD *)(v1 + 264) && v33 == v34)
  {
    v35 = 1;
    v34 = *(_QWORD *)(v1 + 256);
  }
  else
  {
    v35 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  v53 = *(_QWORD *)(v1 + 408);
  v52 = *(_QWORD *)(v1 + 416);
  v55 = *(_QWORD *)(v1 + 384);
  v54 = *(_QWORD *)(v1 + 392);
  swift_bridgeObjectRelease(v34);
  swift_bridgeObjectRelease(v33);
  v56 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
  v56(v53, v55);
  v57 = ((uint64_t (*)(uint64_t, uint64_t))v56)(v52, v55);
  if ((v35 & 1) == 0)
  {
    v63 = *(_QWORD *)(v1 + 520);
    v64 = *(_QWORD *)(v1 + 504);
    v65 = *(_QWORD *)(v1 + 488);
    swift_release(*(_QWORD *)(v1 + 608));
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v29);
    v66 = swift_bridgeObjectRelease(v175);
    static PeopleLogger.messages.getter(v66);
    v67 = v184(v64, v63, v65);
    v68 = Logger.logObject.getter(v67);
    v69 = static os_log_type_t.debug.getter();
    v70 = os_log_type_enabled(v68, v69);
    v186 = *(_QWORD *)(v1 + 648);
    v71 = *(_QWORD *)(v1 + 568);
    v72 = *(_QWORD *)(v1 + 560);
    v73 = *(_QWORD *)(v1 + 552);
    v74 = *(_QWORD *)(v1 + 520);
    v75 = *(_QWORD *)(v1 + 504);
    v76 = *(_QWORD *)(v1 + 488);
    v177 = *(_QWORD *)(v1 + 424);
    v181 = *(_QWORD *)(v1 + 440);
    if (v70)
    {
      v172 = *(_QWORD *)(v1 + 520);
      v77 = *(_QWORD *)(v1 + 400);
      v141 = *(_QWORD *)(v1 + 384);
      v146 = *(_QWORD *)(v1 + 488);
      typea = v69;
      v167 = *(_QWORD *)(v1 + 552);
      v78 = (uint8_t *)swift_slowAlloc(12, -1);
      v79 = swift_slowAlloc(32, -1);
      v190[0] = v79;
      *(_DWORD *)v78 = 136315138;
      v80 = MessageDetails.status.getter(v79);
      v81 = MessageDetails.EventStatus.rawValue.getter(v80);
      v152 = v72;
      v83 = v82;
      v56(v77, v141);
      *(_QWORD *)(v1 + 288) = sub_100006F70(v81, v83, v190);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 288, v1 + 296, v78 + 4, v78 + 12);
      swift_bridgeObjectRelease(v83);
      v157(v75, v146);
      _os_log_impl((void *)&_mh_execute_header, v68, typea, "Event status != pending (%s), no message to send", v78, 0xCu);
      swift_arrayDestroy(v79, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v79, -1, -1);
      swift_slowDealloc(v78, -1, -1);

      v154(v181, v177);
      v157(v172, v146);
      (*(void (**)(uint64_t, uint64_t))(v152 + 8))(v71, v167);
    }
    else
    {

      v157(v75, v76);
      v154(v181, v177);
      v157(v74, v76);
      (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v71, v73);
    }
    v90 = v186;
    goto LABEL_28;
  }
  v58 = *(_QWORD *)(v1 + 360);
  v59 = *(_QWORD *)(v1 + 368);
  v60 = *(_QWORD *)(v1 + 352);
  MessageDetails.family.getter(v57);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48))(v60, 1, v58) == 1)
  {
    v61 = *(_QWORD *)(v1 + 352);
    swift_release(*(_QWORD *)(v1 + 608));
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v29);
    swift_bridgeObjectRelease(v175);
    v62 = sub_100006718(v61, &qword_1000198D0);
LABEL_25:
    v92 = static PeopleLogger.messages.getter(v62);
    v93 = Logger.logObject.getter(v92);
    v94 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v93, v94))
    {
      v95 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v95 = 0;
      _os_log_impl((void *)&_mh_execute_header, v93, v94, "Only send message if I am requesting family member ", v95, 2u);
      swift_slowDealloc(v95, -1, -1);
    }
    v96 = *(_QWORD *)(v1 + 648);
    v97 = *(_QWORD *)(v1 + 568);
    v98 = *(_QWORD *)(v1 + 560);
    v99 = *(_QWORD *)(v1 + 552);
    v100 = *(_QWORD *)(v1 + 520);
    v101 = *(_QWORD *)(v1 + 488);
    v102 = *(_QWORD *)(v1 + 448);
    v103 = *(_QWORD *)(v1 + 424);

    v154(v102, v103);
    v157(v100, v101);
    (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v97, v99);
    v90 = v96;
LABEL_28:
    swift_release(v90);
    v104 = *(_QWORD *)(v1 + 592);
    v105 = *(_QWORD *)(v1 + 568);
    v106 = *(_QWORD *)(v1 + 544);
    v107 = *(_QWORD *)(v1 + 536);
    v108 = *(_QWORD *)(v1 + 528);
    v109 = *(_QWORD *)(v1 + 520);
    v110 = *(_QWORD *)(v1 + 504);
    v111 = *(_QWORD *)(v1 + 512);
    v112 = *(_QWORD *)(v1 + 480);
    v142 = *(_QWORD *)(v1 + 472);
    v144 = *(_QWORD *)(v1 + 464);
    v147 = *(_QWORD *)(v1 + 456);
    *(_QWORD *)typeb = *(_QWORD *)(v1 + 448);
    v153 = *(_QWORD *)(v1 + 440);
    v156 = *(_QWORD *)(v1 + 416);
    v159 = *(_QWORD *)(v1 + 408);
    v163 = *(_QWORD *)(v1 + 400);
    v168 = *(_QWORD *)(v1 + 376);
    v173 = *(_QWORD *)(v1 + 352);
    v178 = *(_QWORD *)(v1 + 344);
    v182 = *(_QWORD *)(v1 + 320);
    v187 = *(_QWORD *)(v1 + 312);
    swift_task_dealloc(*(_QWORD *)(v1 + 600));
    swift_task_dealloc(v104);
    swift_task_dealloc(v105);
    swift_task_dealloc(v106);
    swift_task_dealloc(v107);
    swift_task_dealloc(v108);
    swift_task_dealloc(v109);
    swift_task_dealloc(v111);
    swift_task_dealloc(v110);
    swift_task_dealloc(v112);
    swift_task_dealloc(v142);
    swift_task_dealloc(v144);
    swift_task_dealloc(v147);
    swift_task_dealloc(*(_QWORD *)typeb);
    swift_task_dealloc(v153);
    swift_task_dealloc(v156);
    swift_task_dealloc(v159);
    swift_task_dealloc(v163);
    swift_task_dealloc(v168);
    swift_task_dealloc(v173);
    swift_task_dealloc(v178);
    swift_task_dealloc(v182);
    swift_task_dealloc(v187);
    v51 = *(uint64_t (**)(void))(v1 + 8);
    return v51();
  }
  v84 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v1 + 368) + 32))(*(_QWORD *)(v1 + 376), *(_QWORD *)(v1 + 352), *(_QWORD *)(v1 + 360));
  v85 = (void *)ResolvedFamily.requestingFamilyMember.getter(v84);
  v86 = objc_msgSend(v85, "isMe");

  if (!v86)
  {
    v91 = *(_QWORD *)(v1 + 608);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 368) + 8))(*(_QWORD *)(v1 + 376), *(_QWORD *)(v1 + 360));
    swift_release(v91);
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v29);
    v62 = swift_bridgeObjectRelease(v175);
    goto LABEL_25;
  }
  v87 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 640);
  v88 = *(_QWORD *)(v1 + 552);
  v89 = *(_QWORD *)(v1 + 536);
  MessageDetails.eventSource.getter();
  if (v87(v89, 1, v88) == 1)
  {
    swift_release(*(_QWORD *)(v1 + 608));
    swift_bridgeObjectRelease(v161);
    swift_bridgeObjectRelease(v165);
    swift_bridgeObjectRelease(v170);
    swift_bridgeObjectRelease(v175);
LABEL_38:
    v36 = *(_QWORD *)(v1 + 648);
    v183 = *(_QWORD *)(v1 + 568);
    v131 = *(_QWORD *)(v1 + 560);
    v132 = *(_QWORD *)(v1 + 552);
    v189 = *(_QWORD *)(v1 + 536);
    v133 = *(_QWORD *)(v1 + 520);
    v134 = *(_QWORD *)(v1 + 488);
    v135 = *(_QWORD *)(v1 + 368);
    v136 = *(_QWORD *)(v1 + 376);
    v137 = *(_QWORD *)(v1 + 360);
    v139 = static PeopleErrors.createError(_:code:)(0xD000000000000021, 0x80000001000121A0, 500);
    swift_willThrow(v139);
    (*(void (**)(uint64_t, uint64_t))(v135 + 8))(v136, v137);
    v157(v133, v134);
    (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v183, v132);
    sub_100006718(v189, &qword_1000198D8);
    goto LABEL_12;
  }
  v114 = *(_QWORD *)(v1 + 560);
  v115 = *(_QWORD *)(v1 + 552);
  v116 = *(_QWORD *)(v1 + 528);
  sub_1000066D4(*(_QWORD *)(v1 + 536), v116, &qword_1000198D8);
  v117 = (*(uint64_t (**)(uint64_t, uint64_t))(v114 + 88))(v116, v115);
  if (v117 == enum case for MessageDetails.EventSource.askToBuy(_:))
  {
    type metadata accessor for ServerFeatureFlag(0);
    v118 = static ServerFeatureFlag.shared.getter();
    v119 = ServerFeatureFlag.preventAskToBuyDeviceValidation.getter();
    *(_BYTE *)(v1 + 898) = v119 & 1;
    swift_release(v118);
    type metadata accessor for MessageSendRules(0);
    *(_QWORD *)(v1 + 792) = static MessageSendRules.sharedInstance.getter();
    v120 = ResolvedFamily.approvers.getter();
    *(_QWORD *)(v1 + 800) = v120;
    v121 = type metadata accessor for MessageDeviceCapabilityLookup(0);
    if ((v119 & 1) != 0)
    {
      *(_QWORD *)(v1 + 184) = static MessageDeviceCapabilityLookup.sharedInstance.getter();
      v122 = v1 + 184;
      *(_QWORD *)(v1 + 208) = v121;
      *(_QWORD *)(v1 + 216) = &protocol witness table for MessageDeviceCapabilityLookup;
      v188 = (char *)&async function pointer to dispatch thunk of MessageSendRules.iMessageHandles(for:lookup:)
           + async function pointer to dispatch thunk of MessageSendRules.iMessageHandles(for:lookup:);
      v123 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of MessageSendRules.iMessageHandles(for:lookup:)
                                        + 1));
      *(_QWORD *)(v1 + 808) = v123;
      v124 = sub_10000544C;
    }
    else
    {
      *(_QWORD *)(v1 + 64) = static MessageDeviceCapabilityLookup.sharedInstance.getter();
      v122 = v1 + 64;
      *(_QWORD *)(v1 + 88) = v121;
      *(_QWORD *)(v1 + 96) = &protocol witness table for MessageDeviceCapabilityLookup;
      v188 = (char *)&async function pointer to dispatch thunk of MessageSendRules.approversSupportingAskToBuyMessage(_:lookup:)
           + async function pointer to dispatch thunk of MessageSendRules.approversSupportingAskToBuyMessage(_:lookup:);
      v123 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of MessageSendRules.approversSupportingAskToBuyMessage(_:lookup:)
                                        + 1));
      *(_QWORD *)(v1 + 816) = v123;
      v124 = sub_1000055BC;
    }
  }
  else
  {
    if (v117 != enum case for MessageDetails.EventSource.screenTime(_:))
    {
      v128 = *(_QWORD *)(v1 + 560);
      v129 = *(_QWORD *)(v1 + 552);
      v130 = *(_QWORD *)(v1 + 528);
      swift_release(*(_QWORD *)(v1 + 608));
      swift_bridgeObjectRelease(v161);
      swift_bridgeObjectRelease(v165);
      swift_bridgeObjectRelease(v170);
      swift_bridgeObjectRelease(v175);
      (*(void (**)(uint64_t, uint64_t))(v128 + 8))(v130, v129);
      goto LABEL_38;
    }
    type metadata accessor for ServerFeatureFlag(0);
    v125 = static ServerFeatureFlag.shared.getter();
    v126 = ServerFeatureFlag.preventScreenTimeMessageDeviceValidation.getter();
    *(_BYTE *)(v1 + 896) = v126 & 1;
    swift_release(v125);
    type metadata accessor for MessageSendRules(0);
    *(_QWORD *)(v1 + 728) = static MessageSendRules.sharedInstance.getter();
    v120 = ResolvedFamily.approvers.getter();
    *(_QWORD *)(v1 + 736) = v120;
    v127 = type metadata accessor for MessageDeviceCapabilityLookup(0);
    if ((v126 & 1) != 0)
    {
      *(_QWORD *)(v1 + 104) = static MessageDeviceCapabilityLookup.sharedInstance.getter();
      v122 = v1 + 104;
      *(_QWORD *)(v1 + 128) = v127;
      *(_QWORD *)(v1 + 136) = &protocol witness table for MessageDeviceCapabilityLookup;
      v188 = (char *)&async function pointer to dispatch thunk of MessageSendRules.iMessageHandles(for:lookup:)
           + async function pointer to dispatch thunk of MessageSendRules.iMessageHandles(for:lookup:);
      v123 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of MessageSendRules.iMessageHandles(for:lookup:)
                                        + 1));
      *(_QWORD *)(v1 + 744) = v123;
      v124 = sub_100004B0C;
    }
    else
    {
      *(_QWORD *)(v1 + 144) = static MessageDeviceCapabilityLookup.sharedInstance.getter();
      v122 = v1 + 144;
      *(_QWORD *)(v1 + 168) = v127;
      *(_QWORD *)(v1 + 176) = &protocol witness table for MessageDeviceCapabilityLookup;
      v188 = (char *)&async function pointer to dispatch thunk of MessageSendRules.approversSupportingScreenTimeMessage(_:lookup:)
           + async function pointer to dispatch thunk of MessageSendRules.approversSupportingScreenTimeMessage(_:lookup:);
      v123 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of MessageSendRules.approversSupportingScreenTimeMessage(_:lookup:)
                                        + 1));
      *(_QWORD *)(v1 + 752) = v123;
      v124 = sub_100004C7C;
    }
  }
  *v123 = v1;
  v123[1] = v124;
  return ((uint64_t (*)(_QWORD, uint64_t, uint64_t))v188)(*(_QWORD *)(v1 + 344), v120, v122);
}

uint64_t sub_100004B0C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)v0;
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 736);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 728);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 744));
  swift_bridgeObjectRelease(v2);
  swift_release(v3);
  sub_100006670(v1 + 13);
  return swift_task_switch(sub_100004B88, v1[77], v1[78]);
}

uint64_t sub_100004B88()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  char *v9;

  v2 = v0[42];
  v1 = v0[43];
  v4 = v0[40];
  v3 = v0[41];
  type metadata accessor for MessageSendRules(0);
  v0[95] = static MessageSendRules.sharedInstance.getter();
  v5 = ResolvedFamily.requestingFamilyMember.getter();
  v0[96] = v5;
  v6 = ResolvedFamily.approvers.getter();
  v0[97] = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v4, v1, v3);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v4, 0, 1, v3);
  v9 = (char *)&async function pointer to dispatch thunk of MessageSendRules.willSendScreenTimeRequest(from:to:client:discoveredHandles:)
     + async function pointer to dispatch thunk of MessageSendRules.willSendScreenTimeRequest(from:to:client:discoveredHandles:);
  v7 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of MessageSendRules.willSendScreenTimeRequest(from:to:client:discoveredHandles:)
                                  + 1));
  v0[98] = v7;
  *v7 = v0;
  v7[1] = sub_100004CF8;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))v9)(v5, v6, 0, v0[40]);
}

uint64_t sub_100004C7C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)v0;
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 736);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 728);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 752));
  swift_bridgeObjectRelease(v2);
  swift_release(v3);
  sub_100006670(v1 + 18);
  return swift_task_switch(sub_100006794, v1[77], v1[78]);
}

uint64_t sub_100004CF8(char a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 784);
  v4 = *(_QWORD *)(*v1 + 776);
  v5 = *(void **)(*v1 + 768);
  v6 = *(_QWORD *)(*v1 + 760);
  v7 = *(_QWORD *)(*v1 + 320);
  *(_BYTE *)(*v1 + 897) = a1;
  swift_task_dealloc(v3);
  swift_bridgeObjectRelease(v4);

  swift_release(v6);
  sub_100006718(v7, &qword_1000198C8);
  return swift_task_switch(sub_100004D98, *(_QWORD *)(v2 + 616), *(_QWORD *)(v2 + 624));
}

uint64_t sub_100004D98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint8_t *v17;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(void);
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
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
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
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void (*v89)(uint64_t, uint64_t);
  uint64_t v90;
  void (*v91)(uint64_t, uint64_t);
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;

  if (*(_BYTE *)(v0 + 897) != 1)
  {
    v68 = *(_QWORD *)(v0 + 720);
    v18 = *(_QWORD *)(v0 + 712);
    v19 = *(_QWORD *)(v0 + 704);
    v20 = *(_QWORD *)(v0 + 696);
    v89 = *(void (**)(uint64_t, uint64_t))(v0 + 680);
    v102 = *(_QWORD *)(v0 + 648);
    v80 = *(_QWORD *)(v0 + 560);
    v84 = *(_QWORD *)(v0 + 552);
    v93 = *(_QWORD *)(v0 + 568);
    v97 = *(_QWORD *)(v0 + 536);
    v72 = *(_QWORD *)(v0 + 488);
    v76 = *(_QWORD *)(v0 + 520);
    v22 = *(_QWORD *)(v0 + 368);
    v21 = *(_QWORD *)(v0 + 376);
    v23 = *(_QWORD *)(v0 + 360);
    v24 = *(_QWORD *)(v0 + 336);
    v25 = *(_QWORD *)(v0 + 344);
    v26 = *(_QWORD *)(v0 + 328);
    swift_release(*(_QWORD *)(v0 + 608));
    swift_bridgeObjectRelease(v20);
    swift_bridgeObjectRelease(v19);
    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease(v68);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v26);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    v89(v76, v72);
    (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v93, v84);
    sub_100006718(v97, &qword_1000198D8);
    swift_release(v102);
    v27 = *(_QWORD *)(v0 + 592);
    v28 = *(_QWORD *)(v0 + 568);
    v29 = *(_QWORD *)(v0 + 544);
    v30 = *(_QWORD *)(v0 + 536);
    v31 = *(_QWORD *)(v0 + 528);
    v32 = *(_QWORD *)(v0 + 520);
    v33 = *(_QWORD *)(v0 + 504);
    v34 = *(_QWORD *)(v0 + 512);
    v35 = *(_QWORD *)(v0 + 480);
    v60 = *(_QWORD *)(v0 + 472);
    v62 = *(_QWORD *)(v0 + 464);
    v64 = *(_QWORD *)(v0 + 456);
    v66 = *(_QWORD *)(v0 + 448);
    v69 = *(_QWORD *)(v0 + 440);
    v73 = *(_QWORD *)(v0 + 416);
    v77 = *(_QWORD *)(v0 + 408);
    v81 = *(_QWORD *)(v0 + 400);
    v85 = *(_QWORD *)(v0 + 376);
    v90 = *(_QWORD *)(v0 + 352);
    v94 = *(_QWORD *)(v0 + 344);
    v98 = *(_QWORD *)(v0 + 320);
    v103 = *(_QWORD *)(v0 + 312);
    swift_task_dealloc(*(_QWORD *)(v0 + 600));
    swift_task_dealloc(v27);
    swift_task_dealloc(v28);
    swift_task_dealloc(v29);
    swift_task_dealloc(v30);
    swift_task_dealloc(v31);
    swift_task_dealloc(v32);
    swift_task_dealloc(v34);
    swift_task_dealloc(v33);
    swift_task_dealloc(v35);
    swift_task_dealloc(v60);
    swift_task_dealloc(v62);
    swift_task_dealloc(v64);
    swift_task_dealloc(v66);
    swift_task_dealloc(v69);
    swift_task_dealloc(v73);
    swift_task_dealloc(v77);
    swift_task_dealloc(v81);
    swift_task_dealloc(v85);
    swift_task_dealloc(v90);
    swift_task_dealloc(v94);
    swift_task_dealloc(v98);
    swift_task_dealloc(v103);
    v36 = *(uint64_t (**)(void))(v0 + 8);
    return v36();
  }
  v1 = *(unsigned __int8 *)(v0 + 896);
  v2 = sub_100006718(*(_QWORD *)(v0 + 536), &qword_1000198D8);
  if ((DiscoveredHandles.allMembersMeetRequirements.getter(v2) & 1) == 0)
  {
    v37 = *(_QWORD *)(v0 + 720);
    v38 = *(_QWORD *)(v0 + 712);
    v39 = *(_QWORD *)(v0 + 704);
    v40 = *(_QWORD *)(v0 + 696);
    v99 = *(_QWORD *)(v0 + 648);
    v91 = *(void (**)(uint64_t, uint64_t))(v0 + 680);
    v95 = *(_QWORD *)(v0 + 568);
    v82 = *(_QWORD *)(v0 + 560);
    v86 = *(_QWORD *)(v0 + 552);
    v74 = *(_QWORD *)(v0 + 488);
    v78 = *(_QWORD *)(v0 + 520);
    v41 = *(_QWORD *)(v0 + 368);
    v70 = *(_QWORD *)(v0 + 376);
    v42 = *(_QWORD *)(v0 + 360);
    v43 = *(_QWORD *)(v0 + 336);
    v44 = *(_QWORD *)(v0 + 344);
    v45 = *(_QWORD *)(v0 + 328);
    swift_release(*(_QWORD *)(v0 + 608));
    swift_bridgeObjectRelease(v40);
    swift_bridgeObjectRelease(v39);
    swift_bridgeObjectRelease(v38);
    swift_bridgeObjectRelease(v37);
    v104 = static PeopleErrors.createError(_:code:)(0xD000000000000023, 0x80000001000121D0, 500);
    swift_willThrow(v104);
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v44, v45);
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v70, v42);
    v91(v78, v74);
    (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v95, v86);
    swift_release(v99);
    v46 = *(_QWORD *)(v0 + 592);
    v47 = *(_QWORD *)(v0 + 568);
    v48 = *(_QWORD *)(v0 + 544);
    v49 = *(_QWORD *)(v0 + 536);
    v50 = *(_QWORD *)(v0 + 528);
    v51 = *(_QWORD *)(v0 + 520);
    v52 = *(_QWORD *)(v0 + 504);
    v53 = *(_QWORD *)(v0 + 512);
    v54 = *(_QWORD *)(v0 + 480);
    v59 = *(_QWORD *)(v0 + 472);
    v61 = *(_QWORD *)(v0 + 464);
    v63 = *(_QWORD *)(v0 + 456);
    v65 = *(_QWORD *)(v0 + 448);
    v67 = *(_QWORD *)(v0 + 440);
    v71 = *(_QWORD *)(v0 + 416);
    v75 = *(_QWORD *)(v0 + 408);
    v79 = *(_QWORD *)(v0 + 400);
    v83 = *(_QWORD *)(v0 + 376);
    v87 = *(_QWORD *)(v0 + 352);
    v92 = *(_QWORD *)(v0 + 344);
    v96 = *(_QWORD *)(v0 + 320);
    v100 = *(_QWORD *)(v0 + 312);
    swift_task_dealloc(*(_QWORD *)(v0 + 600));
    swift_task_dealloc(v46);
    swift_task_dealloc(v47);
    swift_task_dealloc(v48);
    swift_task_dealloc(v49);
    swift_task_dealloc(v50);
    swift_task_dealloc(v51);
    swift_task_dealloc(v53);
    swift_task_dealloc(v52);
    swift_task_dealloc(v54);
    swift_task_dealloc(v59);
    swift_task_dealloc(v61);
    swift_task_dealloc(v63);
    swift_task_dealloc(v65);
    swift_task_dealloc(v67);
    swift_task_dealloc(v71);
    swift_task_dealloc(v75);
    swift_task_dealloc(v79);
    swift_task_dealloc(v83);
    swift_task_dealloc(v87);
    swift_task_dealloc(v92);
    swift_task_dealloc(v96);
    swift_task_dealloc(v100);
    v36 = *(uint64_t (**)(void))(v0 + 8);
    return v36();
  }
  v3 = DiscoveredHandles.iMessageHandles.getter();
  *(_QWORD *)(v0 + 856) = v3;
  static PeopleLogger.messages.getter(v3);
  v4 = swift_bridgeObjectRetain_n(v3, 2);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.debug.getter();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void (**)(uint64_t, uint64_t))(v0 + 672);
  v9 = *(_QWORD *)(v0 + 472);
  v10 = *(_QWORD *)(v0 + 424);
  if (v7)
  {
    v101 = v1;
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    v106 = v12;
    *(_DWORD *)v11 = 136315138;
    v13 = swift_bridgeObjectRetain(v3);
    v88 = v9;
    v14 = Array.description.getter(v13, &type metadata for String);
    v16 = v15;
    swift_bridgeObjectRelease(v3);
    *(_QWORD *)(v0 + 280) = sub_100006F70(v14, v16, &v106);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 280, v0 + 288, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease(v16);
    swift_bridgeObjectRelease_n(v3, 2);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "MessageComposer validated destinations %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    v17 = v11;
    v1 = v101;
    swift_slowDealloc(v17, -1, -1);

    v8(v88, v10);
  }
  else
  {
    swift_bridgeObjectRelease_n(v3, 2);

    v8(v9, v10);
  }
  v56 = *(_QWORD *)(v0 + 312);
  v57 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v56, 1, 1, v57);
  v105 = (char *)&dword_100019B90 + dword_100019B90;
  v58 = (_QWORD *)swift_task_alloc(unk_100019B94);
  *(_QWORD *)(v0 + 864) = v58;
  *v58 = v0;
  v58[1] = sub_100005D8C;
  return ((uint64_t (*)(_QWORD, uint64_t, _QWORD))v105)(*(_QWORD *)(v0 + 520), v1, *(_QWORD *)(v0 + 312));
}

uint64_t sub_10000544C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)v0;
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 800);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 792);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 808));
  swift_bridgeObjectRelease(v2);
  swift_release(v3);
  sub_100006670(v1 + 23);
  return swift_task_switch(sub_1000054C8, v1[77], v1[78]);
}

uint64_t sub_1000054C8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  char *v9;

  v2 = v0[42];
  v1 = v0[43];
  v4 = v0[40];
  v3 = v0[41];
  type metadata accessor for MessageSendRules(0);
  v0[103] = static MessageSendRules.sharedInstance.getter();
  v5 = ResolvedFamily.requestingFamilyMember.getter();
  v0[104] = v5;
  v6 = ResolvedFamily.approvers.getter();
  v0[105] = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v4, v1, v3);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v4, 0, 1, v3);
  v9 = (char *)&async function pointer to dispatch thunk of MessageSendRules.willSendAskToBuyRequest(from:to:client:discoveredHandles:)
     + async function pointer to dispatch thunk of MessageSendRules.willSendAskToBuyRequest(from:to:client:discoveredHandles:);
  v7 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of MessageSendRules.willSendAskToBuyRequest(from:to:client:discoveredHandles:)
                                  + 1));
  v0[106] = v7;
  *v7 = v0;
  v7[1] = sub_100005638;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))v9)(v5, v6, 0, v0[40]);
}

uint64_t sub_1000055BC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)v0;
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 800);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 792);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 816));
  swift_bridgeObjectRelease(v2);
  swift_release(v3);
  sub_100006670(v1 + 8);
  return swift_task_switch(sub_100006798, v1[77], v1[78]);
}

uint64_t sub_100005638(char a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 848);
  v4 = *(_QWORD *)(*v1 + 840);
  v5 = *(void **)(*v1 + 832);
  v6 = *(_QWORD *)(*v1 + 824);
  v7 = *(_QWORD *)(*v1 + 320);
  *(_BYTE *)(*v1 + 899) = a1;
  swift_task_dealloc(v3);
  swift_bridgeObjectRelease(v4);

  swift_release(v6);
  sub_100006718(v7, &qword_1000198C8);
  return swift_task_switch(sub_1000056D8, *(_QWORD *)(v2 + 616), *(_QWORD *)(v2 + 624));
}

uint64_t sub_1000056D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint8_t *v17;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(void);
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
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
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
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void (*v89)(uint64_t, uint64_t);
  uint64_t v90;
  void (*v91)(uint64_t, uint64_t);
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;

  if (*(_BYTE *)(v0 + 899) != 1)
  {
    v68 = *(_QWORD *)(v0 + 720);
    v18 = *(_QWORD *)(v0 + 712);
    v19 = *(_QWORD *)(v0 + 704);
    v20 = *(_QWORD *)(v0 + 696);
    v89 = *(void (**)(uint64_t, uint64_t))(v0 + 680);
    v102 = *(_QWORD *)(v0 + 648);
    v80 = *(_QWORD *)(v0 + 560);
    v84 = *(_QWORD *)(v0 + 552);
    v93 = *(_QWORD *)(v0 + 568);
    v97 = *(_QWORD *)(v0 + 536);
    v72 = *(_QWORD *)(v0 + 488);
    v76 = *(_QWORD *)(v0 + 520);
    v22 = *(_QWORD *)(v0 + 368);
    v21 = *(_QWORD *)(v0 + 376);
    v23 = *(_QWORD *)(v0 + 360);
    v24 = *(_QWORD *)(v0 + 336);
    v25 = *(_QWORD *)(v0 + 344);
    v26 = *(_QWORD *)(v0 + 328);
    swift_release(*(_QWORD *)(v0 + 608));
    swift_bridgeObjectRelease(v20);
    swift_bridgeObjectRelease(v19);
    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease(v68);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v26);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    v89(v76, v72);
    (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v93, v84);
    sub_100006718(v97, &qword_1000198D8);
    swift_release(v102);
    v27 = *(_QWORD *)(v0 + 592);
    v28 = *(_QWORD *)(v0 + 568);
    v29 = *(_QWORD *)(v0 + 544);
    v30 = *(_QWORD *)(v0 + 536);
    v31 = *(_QWORD *)(v0 + 528);
    v32 = *(_QWORD *)(v0 + 520);
    v33 = *(_QWORD *)(v0 + 504);
    v34 = *(_QWORD *)(v0 + 512);
    v35 = *(_QWORD *)(v0 + 480);
    v60 = *(_QWORD *)(v0 + 472);
    v62 = *(_QWORD *)(v0 + 464);
    v64 = *(_QWORD *)(v0 + 456);
    v66 = *(_QWORD *)(v0 + 448);
    v69 = *(_QWORD *)(v0 + 440);
    v73 = *(_QWORD *)(v0 + 416);
    v77 = *(_QWORD *)(v0 + 408);
    v81 = *(_QWORD *)(v0 + 400);
    v85 = *(_QWORD *)(v0 + 376);
    v90 = *(_QWORD *)(v0 + 352);
    v94 = *(_QWORD *)(v0 + 344);
    v98 = *(_QWORD *)(v0 + 320);
    v103 = *(_QWORD *)(v0 + 312);
    swift_task_dealloc(*(_QWORD *)(v0 + 600));
    swift_task_dealloc(v27);
    swift_task_dealloc(v28);
    swift_task_dealloc(v29);
    swift_task_dealloc(v30);
    swift_task_dealloc(v31);
    swift_task_dealloc(v32);
    swift_task_dealloc(v34);
    swift_task_dealloc(v33);
    swift_task_dealloc(v35);
    swift_task_dealloc(v60);
    swift_task_dealloc(v62);
    swift_task_dealloc(v64);
    swift_task_dealloc(v66);
    swift_task_dealloc(v69);
    swift_task_dealloc(v73);
    swift_task_dealloc(v77);
    swift_task_dealloc(v81);
    swift_task_dealloc(v85);
    swift_task_dealloc(v90);
    swift_task_dealloc(v94);
    swift_task_dealloc(v98);
    swift_task_dealloc(v103);
    v36 = *(uint64_t (**)(void))(v0 + 8);
    return v36();
  }
  v1 = *(unsigned __int8 *)(v0 + 898);
  v2 = sub_100006718(*(_QWORD *)(v0 + 536), &qword_1000198D8);
  if ((DiscoveredHandles.allMembersMeetRequirements.getter(v2) & 1) == 0)
  {
    v37 = *(_QWORD *)(v0 + 720);
    v38 = *(_QWORD *)(v0 + 712);
    v39 = *(_QWORD *)(v0 + 704);
    v40 = *(_QWORD *)(v0 + 696);
    v99 = *(_QWORD *)(v0 + 648);
    v91 = *(void (**)(uint64_t, uint64_t))(v0 + 680);
    v95 = *(_QWORD *)(v0 + 568);
    v82 = *(_QWORD *)(v0 + 560);
    v86 = *(_QWORD *)(v0 + 552);
    v74 = *(_QWORD *)(v0 + 488);
    v78 = *(_QWORD *)(v0 + 520);
    v41 = *(_QWORD *)(v0 + 368);
    v70 = *(_QWORD *)(v0 + 376);
    v42 = *(_QWORD *)(v0 + 360);
    v43 = *(_QWORD *)(v0 + 336);
    v44 = *(_QWORD *)(v0 + 344);
    v45 = *(_QWORD *)(v0 + 328);
    swift_release(*(_QWORD *)(v0 + 608));
    swift_bridgeObjectRelease(v40);
    swift_bridgeObjectRelease(v39);
    swift_bridgeObjectRelease(v38);
    swift_bridgeObjectRelease(v37);
    v104 = static PeopleErrors.createError(_:code:)(0xD000000000000023, 0x80000001000121D0, 500);
    swift_willThrow(v104);
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v44, v45);
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v70, v42);
    v91(v78, v74);
    (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v95, v86);
    swift_release(v99);
    v46 = *(_QWORD *)(v0 + 592);
    v47 = *(_QWORD *)(v0 + 568);
    v48 = *(_QWORD *)(v0 + 544);
    v49 = *(_QWORD *)(v0 + 536);
    v50 = *(_QWORD *)(v0 + 528);
    v51 = *(_QWORD *)(v0 + 520);
    v52 = *(_QWORD *)(v0 + 504);
    v53 = *(_QWORD *)(v0 + 512);
    v54 = *(_QWORD *)(v0 + 480);
    v59 = *(_QWORD *)(v0 + 472);
    v61 = *(_QWORD *)(v0 + 464);
    v63 = *(_QWORD *)(v0 + 456);
    v65 = *(_QWORD *)(v0 + 448);
    v67 = *(_QWORD *)(v0 + 440);
    v71 = *(_QWORD *)(v0 + 416);
    v75 = *(_QWORD *)(v0 + 408);
    v79 = *(_QWORD *)(v0 + 400);
    v83 = *(_QWORD *)(v0 + 376);
    v87 = *(_QWORD *)(v0 + 352);
    v92 = *(_QWORD *)(v0 + 344);
    v96 = *(_QWORD *)(v0 + 320);
    v100 = *(_QWORD *)(v0 + 312);
    swift_task_dealloc(*(_QWORD *)(v0 + 600));
    swift_task_dealloc(v46);
    swift_task_dealloc(v47);
    swift_task_dealloc(v48);
    swift_task_dealloc(v49);
    swift_task_dealloc(v50);
    swift_task_dealloc(v51);
    swift_task_dealloc(v53);
    swift_task_dealloc(v52);
    swift_task_dealloc(v54);
    swift_task_dealloc(v59);
    swift_task_dealloc(v61);
    swift_task_dealloc(v63);
    swift_task_dealloc(v65);
    swift_task_dealloc(v67);
    swift_task_dealloc(v71);
    swift_task_dealloc(v75);
    swift_task_dealloc(v79);
    swift_task_dealloc(v83);
    swift_task_dealloc(v87);
    swift_task_dealloc(v92);
    swift_task_dealloc(v96);
    swift_task_dealloc(v100);
    v36 = *(uint64_t (**)(void))(v0 + 8);
    return v36();
  }
  v3 = DiscoveredHandles.iMessageHandles.getter();
  *(_QWORD *)(v0 + 856) = v3;
  static PeopleLogger.messages.getter(v3);
  v4 = swift_bridgeObjectRetain_n(v3, 2);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.debug.getter();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void (**)(uint64_t, uint64_t))(v0 + 672);
  v9 = *(_QWORD *)(v0 + 472);
  v10 = *(_QWORD *)(v0 + 424);
  if (v7)
  {
    v101 = v1;
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    v106 = v12;
    *(_DWORD *)v11 = 136315138;
    v13 = swift_bridgeObjectRetain(v3);
    v88 = v9;
    v14 = Array.description.getter(v13, &type metadata for String);
    v16 = v15;
    swift_bridgeObjectRelease(v3);
    *(_QWORD *)(v0 + 280) = sub_100006F70(v14, v16, &v106);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 280, v0 + 288, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease(v16);
    swift_bridgeObjectRelease_n(v3, 2);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "MessageComposer validated destinations %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    v17 = v11;
    v1 = v101;
    swift_slowDealloc(v17, -1, -1);

    v8(v88, v10);
  }
  else
  {
    swift_bridgeObjectRelease_n(v3, 2);

    v8(v9, v10);
  }
  v56 = *(_QWORD *)(v0 + 312);
  v57 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v56, 1, 1, v57);
  v105 = (char *)&dword_100019B90 + dword_100019B90;
  v58 = (_QWORD *)swift_task_alloc(unk_100019B94);
  *(_QWORD *)(v0 + 864) = v58;
  *v58 = v0;
  v58[1] = sub_100005D8C;
  return ((uint64_t (*)(_QWORD, uint64_t, _QWORD))v105)(*(_QWORD *)(v0 + 520), v1, *(_QWORD *)(v0 + 312));
}

uint64_t sub_100005D8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t **v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)();

  v4 = *v3;
  v5 = (*v3)[108];
  v4[109] = a1;
  v4[110] = a2;
  v4[111] = v2;
  swift_task_dealloc(v5);
  if (v2)
  {
    v6 = v4[107];
    v7 = v4[90];
    v8 = v4[89];
    v9 = v4[88];
    v10 = v4[87];
    sub_100006718(v4[39], &qword_1000198C0);
    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v8);
    swift_bridgeObjectRelease(v7);
    swift_bridgeObjectRelease(v6);
    v11 = v4[78];
    v12 = v4[77];
    v13 = sub_100006258;
  }
  else
  {
    sub_100006718(v4[39], &qword_1000198C0);
    v11 = v4[78];
    v12 = v4[77];
    v13 = sub_100005E74;
  }
  return swift_task_switch(v13, v12, v11);
}

uint64_t sub_100005E74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Class isa;
  NSString v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;
  Class v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint8_t *v18;
  const char *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
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
  void (*v53)(uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;

  v1 = *(_QWORD *)(v0 + 856);
  v2 = *(_QWORD *)(v0 + 720);
  v3 = *(_QWORD *)(v0 + 712);
  v4 = *(_QWORD *)(v0 + 704);
  v5 = *(_QWORD *)(v0 + 696);
  swift_release(*(_QWORD *)(v0 + 608));
  v59 = (void *)objc_opt_self(MSMessageConverter);
  isa = Data._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  v7 = String._bridgeToObjectiveC()();
  v8 = swift_bridgeObjectRelease(v5);
  MessageDetails.requestID.getter(v8);
  v10 = v9;
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  v12 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v1);
  LODWORD(v1) = objc_msgSend(v59, "sendPayload:extensionBundleID:chatGUID:withRecipients:", isa, v7, v11, v12);

  if (!(_DWORD)v1)
  {
    v14 = (uint64_t *)(v0 + 456);
    v20 = static PeopleLogger.messages.getter(v13);
    v16 = Logger.logObject.getter(v20);
    v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, (os_log_type_t)v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      v19 = "Message send with imcore failed";
      goto LABEL_6;
    }
LABEL_7:
    v60 = v16;
    goto LABEL_8;
  }
  v14 = (uint64_t *)(v0 + 464);
  v15 = static PeopleLogger.messages.getter(v13);
  v16 = Logger.logObject.getter(v15);
  LOBYTE(v17) = static os_log_type_t.info.getter();
  if (!os_log_type_enabled(v16, (os_log_type_t)v17))
    goto LABEL_7;
  v18 = (uint8_t *)swift_slowAlloc(2, -1);
  *(_WORD *)v18 = 0;
  v19 = "Message send with imcore seems OK";
LABEL_6:
  _os_log_impl((void *)&_mh_execute_header, v16, (os_log_type_t)v17, v19, v18, 2u);
  v60 = v16;
  swift_slowDealloc(v18, -1, -1);
LABEL_8:
  v21 = *(void (**)(uint64_t, uint64_t))(v0 + 672);
  v57 = *(_QWORD *)(v0 + 648);
  v53 = *(void (**)(uint64_t, uint64_t))(v0 + 680);
  v55 = *(_QWORD *)(v0 + 568);
  v49 = *(_QWORD *)(v0 + 560);
  v51 = *(_QWORD *)(v0 + 552);
  v45 = *(_QWORD *)(v0 + 488);
  v47 = *(_QWORD *)(v0 + 520);
  v22 = *v14;
  v23 = *(_QWORD *)(v0 + 424);
  v24 = *(_QWORD *)(v0 + 368);
  v25 = *(_QWORD *)(v0 + 376);
  v26 = *(_QWORD *)(v0 + 360);
  v28 = *(_QWORD *)(v0 + 336);
  v27 = *(_QWORD *)(v0 + 344);
  v29 = *(_QWORD *)(v0 + 328);
  sub_100006690(*(_QWORD *)(v0 + 872), *(_QWORD *)(v0 + 880));

  v21(v22, v23);
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v26);
  v53(v47, v45);
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v55, v51);
  swift_release(v57);
  v30 = *(_QWORD *)(v0 + 592);
  v31 = *(_QWORD *)(v0 + 568);
  v32 = *(_QWORD *)(v0 + 544);
  v33 = *(_QWORD *)(v0 + 536);
  v34 = *(_QWORD *)(v0 + 528);
  v35 = *(_QWORD *)(v0 + 520);
  v36 = *(_QWORD *)(v0 + 504);
  v37 = *(_QWORD *)(v0 + 512);
  v38 = *(_QWORD *)(v0 + 480);
  v40 = *(_QWORD *)(v0 + 472);
  v41 = *(_QWORD *)(v0 + 464);
  v42 = *(_QWORD *)(v0 + 456);
  v43 = *(_QWORD *)(v0 + 448);
  v44 = *(_QWORD *)(v0 + 440);
  v46 = *(_QWORD *)(v0 + 416);
  v48 = *(_QWORD *)(v0 + 408);
  v50 = *(_QWORD *)(v0 + 400);
  v52 = *(_QWORD *)(v0 + 376);
  v54 = *(_QWORD *)(v0 + 352);
  v56 = *(_QWORD *)(v0 + 344);
  v58 = *(_QWORD *)(v0 + 320);
  v61 = *(_QWORD *)(v0 + 312);
  swift_task_dealloc(*(_QWORD *)(v0 + 600));
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v37);
  swift_task_dealloc(v36);
  swift_task_dealloc(v38);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  swift_task_dealloc(v44);
  swift_task_dealloc(v46);
  swift_task_dealloc(v48);
  swift_task_dealloc(v50);
  swift_task_dealloc(v52);
  swift_task_dealloc(v54);
  swift_task_dealloc(v56);
  swift_task_dealloc(v58);
  swift_task_dealloc(v61);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100006258()
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v32 = *(void (**)(uint64_t, uint64_t))(v0 + 680);
  v34 = *(_QWORD *)(v0 + 568);
  v36 = *(_QWORD *)(v0 + 648);
  v1 = *(_QWORD *)(v0 + 560);
  v30 = *(_QWORD *)(v0 + 552);
  v2 = *(_QWORD *)(v0 + 520);
  v3 = *(_QWORD *)(v0 + 488);
  v4 = *(_QWORD *)(v0 + 368);
  v5 = *(_QWORD *)(v0 + 376);
  v6 = *(_QWORD *)(v0 + 360);
  v7 = *(_QWORD *)(v0 + 336);
  v8 = *(_QWORD *)(v0 + 344);
  v9 = *(_QWORD *)(v0 + 328);
  swift_release(*(_QWORD *)(v0 + 608));
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  v32(v2, v3);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v34, v30);
  swift_release(v36);
  v10 = *(_QWORD *)(v0 + 592);
  v11 = *(_QWORD *)(v0 + 568);
  v12 = *(_QWORD *)(v0 + 544);
  v13 = *(_QWORD *)(v0 + 536);
  v14 = *(_QWORD *)(v0 + 528);
  v15 = *(_QWORD *)(v0 + 520);
  v17 = *(_QWORD *)(v0 + 504);
  v16 = *(_QWORD *)(v0 + 512);
  v18 = *(_QWORD *)(v0 + 480);
  v20 = *(_QWORD *)(v0 + 472);
  v21 = *(_QWORD *)(v0 + 464);
  v22 = *(_QWORD *)(v0 + 456);
  v23 = *(_QWORD *)(v0 + 448);
  v24 = *(_QWORD *)(v0 + 440);
  v25 = *(_QWORD *)(v0 + 416);
  v26 = *(_QWORD *)(v0 + 408);
  v27 = *(_QWORD *)(v0 + 400);
  v28 = *(_QWORD *)(v0 + 376);
  v29 = *(_QWORD *)(v0 + 352);
  v31 = *(_QWORD *)(v0 + 344);
  v33 = *(_QWORD *)(v0 + 320);
  v35 = *(_QWORD *)(v0 + 312);
  swift_task_dealloc(*(_QWORD *)(v0 + 600));
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v31);
  swift_task_dealloc(v33);
  swift_task_dealloc(v35);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100006458()
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
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
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

  v1 = *(_QWORD *)(v0 + 648);
  v2 = *(_QWORD *)(v0 + 568);
  v3 = *(_QWORD *)(v0 + 560);
  v4 = *(_QWORD *)(v0 + 552);
  swift_release(*(_QWORD *)(v0 + 608));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release(v1);
  v5 = *(_QWORD *)(v0 + 592);
  v6 = *(_QWORD *)(v0 + 568);
  v7 = *(_QWORD *)(v0 + 544);
  v8 = *(_QWORD *)(v0 + 536);
  v9 = *(_QWORD *)(v0 + 528);
  v10 = *(_QWORD *)(v0 + 520);
  v12 = *(_QWORD *)(v0 + 504);
  v11 = *(_QWORD *)(v0 + 512);
  v13 = *(_QWORD *)(v0 + 480);
  v15 = *(_QWORD *)(v0 + 472);
  v16 = *(_QWORD *)(v0 + 464);
  v17 = *(_QWORD *)(v0 + 456);
  v18 = *(_QWORD *)(v0 + 448);
  v19 = *(_QWORD *)(v0 + 440);
  v20 = *(_QWORD *)(v0 + 416);
  v21 = *(_QWORD *)(v0 + 408);
  v22 = *(_QWORD *)(v0 + 400);
  v23 = *(_QWORD *)(v0 + 376);
  v24 = *(_QWORD *)(v0 + 352);
  v25 = *(_QWORD *)(v0 + 344);
  v26 = *(_QWORD *)(v0 + 320);
  v27 = *(_QWORD *)(v0 + 312);
  swift_task_dealloc(*(_QWORD *)(v0 + 600));
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100006600(uint64_t *a1)
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

uint64_t sub_100006640()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_100006650()
{
  uint64_t v0;

  sub_100002DFC(v0);
}

uint64_t sub_100006658(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100006668(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100006670(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100006690(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000066D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100006600(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006718(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100006600(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006754(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

id sub_100006918()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RootContainerViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RootContainerViewController()
{
  return objc_opt_self(_TtC20PeopleMessageService27RootContainerViewController);
}

uint64_t sub_100006A2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t);

  v7 = type metadata accessor for Logger(0);
  v5[2] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[3] = v8;
  v5[4] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5[5] = type metadata accessor for MainActor(0);
  v5[6] = static MainActor.shared.getter();
  v11 = (uint64_t (*)(uint64_t))((char *)&dword_1000198B8 + dword_1000198B8);
  v9 = (_QWORD *)swift_task_alloc(unk_1000198BC);
  v5[7] = v9;
  *v9 = v5;
  v9[1] = sub_100006AD0;
  return v11(a5);
}

uint64_t sub_100006AD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc(v2);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  if (v0)
    v6 = sub_100006B90;
  else
    v6 = sub_100006B58;
  return swift_task_switch(v6, v5, v4);
}

uint64_t sub_100006B58()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 48));
  swift_task_dealloc(*(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100006B90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 16);
  v5 = swift_release(*(_QWORD *)(v0 + 48));
  static PeopleLogger.messages.getter(v5);
  swift_errorRetain(v1);
  Logger.ifError(_:message:)(v1, 0xD000000000000015, 0x8000000100012360);
  swift_errorRelease(v1);
  swift_errorRelease(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc(*(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_100006CB8()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  char *v4;
  objc_super v6;

  *(_QWORD *)&v0[OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_window] = 0;
  v1 = OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_rootViewController;
  v2 = type metadata accessor for RootContainerViewController();
  v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  v4 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v3, "init");
  *(_QWORD *)&v4[OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_messageComposer] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_backgroundTaskID] = UIBackgroundTaskInvalid;

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v6, "init");
}

id sub_100006D88()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(_TtC20PeopleMessageService13SceneDelegate);
}

unint64_t sub_100006E20()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019A48;
  if (!qword_100019A48)
  {
    v1 = objc_opt_self(UIOpenURLContext);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100019A48);
  }
  return result;
}

uint64_t sub_100006E5C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100006EC0;
  return v6(a1);
}

uint64_t sub_100006EC0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100006F0C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100008AC0;
  return v6(a1);
}

uint64_t sub_100006F70(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100007040(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000084F8((uint64_t)v12, *a3);
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
      sub_1000084F8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100006670(v12);
  return v7;
}

uint64_t sub_100007040(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_1000071F8(a5, a6);
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

uint64_t sub_1000071F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000728C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100007464(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100007464(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000728C(uint64_t a1, unint64_t a2)
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
      v5 = sub_100007400(v4, 0);
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

_QWORD *sub_100007400(uint64_t a1, uint64_t a2)
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
  v4 = sub_100006600((uint64_t *)&unk_100019AA0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100007464(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100006600((uint64_t *)&unk_100019AA0);
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

void sub_1000075B0(uint64_t a1)
{
  uint64_t v1;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  char *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  id v57;
  int64_t v58;
  unint64_t v59;
  uint64_t v60;
  id v61;
  char *v62;
  char *v63;
  uint64_t v64;
  id v65;
  NSObject *v66;
  os_log_type_t v67;
  _BOOL4 v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t (*v83)(char *, uint64_t, uint64_t);
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  NSObject *v109;
  os_log_type_t v110;
  uint8_t *v111;
  unsigned __int8 v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t ObjectType;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD *v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  char *v128;
  uint64_t v129;
  char *v130;
  id v131;
  char *v132;
  uint64_t v133;
  int64_t v134;
  uint64_t v135;
  char *v136;
  unint64_t v137;
  __int128 v138;
  unsigned int v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  id v155;
  void (*v156)(char *, uint64_t);
  uint64_t v157;
  uint64_t v158;
  char *v159;
  char *v160;
  uint64_t v161;
  _QWORD v162[4];
  void *v163;
  uint64_t v164[5];

  v3 = sub_100006600(&qword_100019A58);
  __chkstk_darwin(v3);
  v130 = (char *)&v126 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v142 = type metadata accessor for PeopleURL.Scheme(0);
  v141 = *(_QWORD *)(v142 - 8);
  __chkstk_darwin(v142);
  v140 = (char *)&v126 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100006600(&qword_100019A60);
  __chkstk_darwin(v6);
  v148 = (char *)&v126 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for URLComponents(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v128 = (char *)&v126 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = v11;
  __chkstk_darwin(v10);
  v143 = (char *)&v126 - v12;
  v154 = type metadata accessor for Logger(0);
  v149 = *(_QWORD *)(v154 - 8);
  v13 = __chkstk_darwin(v154);
  v15 = (char *)&v126 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v126 - v17;
  __chkstk_darwin(v16);
  v20 = (char *)&v126 - v19;
  v150 = type metadata accessor for URL(0);
  v21 = *(_QWORD *)(v150 - 8);
  v22 = __chkstk_darwin(v150);
  v24 = (char *)&v126 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __chkstk_darwin(v22);
  v160 = (char *)&v126 - v26;
  v131 = *(id *)(v1 + OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_messageComposer);
  if (v131)
  {
    v147 = v20;
    v151 = v9;
    if ((a1 & 0xC000000000000001) != 0)
    {
      if (a1 < 0)
        v27 = a1;
      else
        v27 = a1 & 0xFFFFFFFFFFFFFF8;
      v28 = v131;
      swift_bridgeObjectRetain(a1);
      v29 = __CocoaSet.makeIterator()(v27);
      v30 = sub_100006E20();
      v31 = sub_100006754(&qword_100019A50, (uint64_t (*)(uint64_t))sub_100006E20, (uint64_t)&protocol conformance descriptor for NSObject);
      v32 = Set.Iterator.init(_cocoa:)(v164, v29, v30, v31);
      a1 = v164[0];
      v135 = v164[1];
      v34 = v164[2];
      v35 = v164[3];
      v36 = v164[4];
    }
    else
    {
      v42 = -1 << *(_BYTE *)(a1 + 32);
      v43 = *(_QWORD *)(a1 + 56);
      v135 = a1 + 56;
      v34 = ~v42;
      v44 = -v42;
      if (v44 < 64)
        v45 = ~(-1 << v44);
      else
        v45 = -1;
      v36 = v45 & v43;
      v46 = v131;
      v32 = (_QWORD *)swift_bridgeObjectRetain(a1);
      v35 = 0;
    }
    v47 = v150;
    v133 = a1 & 0x7FFFFFFFFFFFFFFFLL;
    v134 = (unint64_t)(v34 + 64) >> 6;
    v139 = enum case for PeopleURL.Scheme.message(_:);
    *(_QWORD *)&v33 = 136315650;
    v138 = v33;
    v137 = 0x8000000100012340;
    v136 = (char *)&type metadata for Any + 8;
    v127 = (char *)&type metadata for () + 8;
    v132 = (char *)&type metadata for Swift.AnyObject + 8;
    v153 = a1;
    v145 = v8;
    v144 = v18;
    v152 = v21;
    v48 = v24;
    v159 = v24;
    v146 = v34;
    while (1)
    {
      if (a1 < 0)
      {
        v51 = __CocoaSet.Iterator.next()(v32);
        if (!v51)
          goto LABEL_60;
        v52 = v51;
        v161 = v51;
        v53 = v48;
        v54 = sub_100006E20();
        swift_unknownObjectRetain(v52, v55);
        v56 = v54;
        v48 = v53;
        swift_dynamicCast(&v163, &v161, v132, v56, 7);
        v57 = v163;
        swift_unknownObjectRelease(v52);
        v50 = v35;
        v158 = v36;
        if (!v57)
          goto LABEL_60;
      }
      else
      {
        if (v36)
        {
          v158 = (v36 - 1) & v36;
          v49 = __clz(__rbit64(v36)) | (v35 << 6);
          v50 = v35;
        }
        else
        {
          v58 = v35 + 1;
          if (__OFADD__(v35, 1))
          {
            __break(1u);
            return;
          }
          if (v58 >= v134)
            goto LABEL_60;
          v59 = *(_QWORD *)(v135 + 8 * v58);
          v50 = v35 + 1;
          if (!v59)
          {
            v50 = v35 + 2;
            if (v35 + 2 >= v134)
              goto LABEL_60;
            v59 = *(_QWORD *)(v135 + 8 * v50);
            if (!v59)
            {
              v50 = v35 + 3;
              if (v35 + 3 >= v134)
                goto LABEL_60;
              v59 = *(_QWORD *)(v135 + 8 * v50);
              if (!v59)
              {
                v50 = v35 + 4;
                if (v35 + 4 >= v134)
                  goto LABEL_60;
                v59 = *(_QWORD *)(v135 + 8 * v50);
                if (!v59)
                {
                  v60 = v35 + 5;
                  while (v134 != v60)
                  {
                    v59 = *(_QWORD *)(v135 + 8 * v60++);
                    if (v59)
                    {
                      v50 = v60 - 1;
                      a1 = v153;
                      goto LABEL_37;
                    }
                  }
LABEL_60:
                  sub_100008304(v153);

                  return;
                }
              }
            }
          }
LABEL_37:
          v158 = (v59 - 1) & v59;
          v49 = __clz(__rbit64(v59)) + (v50 << 6);
        }
        v57 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v49);
        if (!v57)
          goto LABEL_60;
      }
      v157 = v50;
      v61 = objc_msgSend(v57, "URL");
      v62 = v160;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      v63 = v147;
      static PeopleLogger.messages.getter(v64);
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v48, v62, v47);
      v65 = v57;
      v66 = Logger.logObject.getter(v65);
      v67 = static os_log_type_t.default.getter();
      v68 = os_log_type_enabled(v66, v67);
      v155 = v65;
      if (v68)
      {
        v69 = swift_slowAlloc(32, -1);
        v70 = (_QWORD *)swift_slowAlloc(8, -1);
        v71 = swift_slowAlloc(64, -1);
        v163 = (void *)v71;
        *(_DWORD *)v69 = v138;
        *(_QWORD *)(v69 + 4) = sub_100006F70(0xD000000000000019, v137, (uint64_t *)&v163);
        *(_WORD *)(v69 + 12) = 2112;
        *(_QWORD *)(v69 + 14) = v65;
        *v70 = v57;
        *(_WORD *)(v69 + 22) = 2080;
        v72 = sub_100006754(&qword_100019A88, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
        v73 = dispatch thunk of CustomStringConvertible.description.getter(v47, v72);
        v75 = v74;
        *(_QWORD *)(v69 + 24) = sub_100006F70(v73, v74, (uint64_t *)&v163);
        swift_bridgeObjectRelease(v75);
        v156 = *(void (**)(char *, uint64_t))(v152 + 8);
        v156(v159, v47);
        _os_log_impl((void *)&_mh_execute_header, v66, v67, "%s url centext: %@ url: %s", (uint8_t *)v69, 0x20u);
        v76 = sub_100006600(&qword_100019A90);
        swift_arrayDestroy(v70, 1, v76);
        swift_slowDealloc(v70, -1, -1);
        swift_arrayDestroy(v71, 2, v136);
        swift_slowDealloc(v71, -1, -1);
        v77 = v69;
        v8 = v145;
        a1 = v153;
        swift_slowDealloc(v77, -1, -1);

        v78 = *(void (**)(char *, uint64_t))(v149 + 8);
        v78(v63, v154);
      }
      else
      {

        v156 = *(void (**)(char *, uint64_t))(v21 + 8);
        v156(v48, v47);

        v78 = *(void (**)(char *, uint64_t))(v149 + 8);
        v78(v63, v154);
        a1 = v153;
      }
      v79 = (uint64_t)v148;
      URLComponents.init(url:resolvingAgainstBaseURL:)(v160, 0);
      v80 = v151;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v151 + 48))(v79, 1, v8) == 1)
        break;
      v83 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v80 + 32);
      v84 = v143;
      v85 = v83(v143, v79, v8);
      v86 = URLComponents.scheme.getter(v85);
      v88 = v87;
      v89 = v141;
      v90 = v80;
      v91 = v8;
      v92 = v140;
      v93 = v142;
      (*(void (**)(char *, _QWORD, uint64_t))(v141 + 104))(v140, v139, v142);
      LOBYTE(v86) = static PeopleURL.Scheme.== infix(_:_:)(v86, v88, v92);
      swift_bridgeObjectRelease(v88);
      (*(void (**)(char *, uint64_t))(v89 + 8))(v92, v93);
      if ((v86 & 1) == 0)
      {
        v81 = (*(uint64_t (**)(char *, uint64_t))(v90 + 8))(v84, v91);
        v8 = v91;
        v82 = v144;
        v21 = v152;
        a1 = v153;
        goto LABEL_49;
      }
      v94 = sub_100003280();
      a1 = v153;
      if ((v94 & 1) == 0)
      {

        v8 = v145;
        (*(void (**)(char *, uint64_t))(v151 + 8))(v84, v145);
        v47 = v150;
        v21 = v152;
        v48 = v159;
LABEL_16:
        v35 = v157;
        v36 = v158;
        goto LABEL_17;
      }
      v95 = type metadata accessor for TaskPriority(0);
      v96 = *(_QWORD *)(v95 - 8);
      v97 = (uint64_t)v130;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v96 + 56))(v130, 1, 1, v95);
      v98 = v151;
      v99 = v128;
      v100 = v145;
      (*(void (**)(char *, char *, uint64_t))(v151 + 16))(v128, v84, v145);
      type metadata accessor for MainActor(0);
      v101 = v131;
      v102 = static MainActor.shared.getter();
      v103 = *(unsigned __int8 *)(v98 + 80);
      v104 = (v103 + 40) & ~v103;
      v105 = (char *)swift_allocObject(&unk_100014B78, v104 + v129, v103 | 7);
      *((_QWORD *)v105 + 2) = v102;
      *((_QWORD *)v105 + 3) = &protocol witness table for MainActor;
      *((_QWORD *)v105 + 4) = v101;
      v83(&v105[v104], (uint64_t)v99, v100);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v96 + 48))(v97, 1, v95) == 1)
      {
        sub_100006718(v97, &qword_100019A58);
        v106 = 0;
      }
      else
      {
        v112 = TaskPriority.rawValue.getter();
        (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v97, v95);
        v106 = v112;
      }
      v113 = *((_QWORD *)v105 + 2);
      v114 = v151;
      v21 = v152;
      v115 = v159;
      if (v113)
      {
        v116 = *((_QWORD *)v105 + 3);
        ObjectType = swift_getObjectType(*((_QWORD *)v105 + 2));
        swift_unknownObjectRetain(v113, v118);
        v119 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v116);
        v121 = v120;
        swift_unknownObjectRelease(v113);
      }
      else
      {
        v119 = 0;
        v121 = 0;
      }
      v47 = v150;
      v122 = swift_allocObject(&unk_100014BA0, 32, 7);
      *(_QWORD *)(v122 + 16) = &unk_100019A70;
      *(_QWORD *)(v122 + 24) = v105;
      if (v121 | v119)
      {
        v162[0] = 0;
        v162[1] = 0;
        v123 = v162;
        v162[2] = v119;
        v162[3] = v121;
      }
      else
      {
        v123 = 0;
      }
      v48 = v115;
      v36 = v158;
      v124 = v155;
      v125 = swift_task_create(v106 | 0x1C00, v123, v127, &unk_100019A80, v122);

      swift_release(v125);
      v8 = v145;
      (*(void (**)(char *, uint64_t))(v114 + 8))(v143, v145);
      a1 = v153;
      v35 = v157;
LABEL_17:
      v32 = (_QWORD *)((uint64_t (*)(char *, uint64_t))v156)(v160, v47);
    }
    v81 = sub_100006718(v79, &qword_100019A60);
    v82 = v144;
    v21 = v152;
LABEL_49:
    v107 = v155;
    v108 = static PeopleLogger.messages.getter(v81);
    v109 = Logger.logObject.getter(v108);
    v110 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v109, v110))
    {
      v111 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v111 = 0;
      _os_log_impl((void *)&_mh_execute_header, v109, v110, "Url does not represent people/can't be parsed", v111, 2u);
      swift_slowDealloc(v111, -1, -1);
    }

    v78(v82, v154);
    v47 = v150;
    v48 = v159;
    goto LABEL_16;
  }
  v37 = static PeopleLogger.messages.getter(v25);
  v38 = Logger.logObject.getter(v37);
  v39 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v38, v39))
  {
    v40 = (uint8_t *)swift_slowAlloc(12, -1);
    v41 = swift_slowAlloc(32, -1);
    v164[0] = v41;
    *(_DWORD *)v40 = 136315138;
    v163 = (void *)sub_100006F70(0xD000000000000019, 0x8000000100012340, v164);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v163, v164, v40 + 4, v40 + 12);
    _os_log_impl((void *)&_mh_execute_header, v38, v39, "%s impossible error, no peopleView", v40, 0xCu);
    swift_arrayDestroy(v41, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v41, -1, -1);
    swift_slowDealloc(v40, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v149 + 8))(v15, v154);
}

uint64_t sub_100008304(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000830C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for URLComponents(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100008388(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for URLComponents(0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc(dword_100019A6C);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_10000841C;
  return sub_100006A2C(a1, v5, v6, v7, v8);
}

uint64_t sub_10000841C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100008464()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100008488(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100019A7C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000841C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100019A78 + dword_100019A78))(a1, v4);
}

uint64_t sub_1000084F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100008538(void (*a1)(char *, uint64_t), void *a2)
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
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint8_t *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  void *v27;
  void (*v28)(char *, uint64_t);
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  char *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint64_t v61;
  uint64_t v62;
  uint8_t *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t);
  id v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v66 - v10;
  v12 = static PeopleLogger.messages.getter(v9);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  v15 = os_log_type_enabled(v13, v14);
  v68 = a2;
  if (v15)
  {
    v16 = swift_slowAlloc(12, -1);
    v67 = a1;
    v17 = (uint8_t *)v16;
    v18 = v8;
    v19 = v4;
    v20 = swift_slowAlloc(32, -1);
    v71 = v20;
    *(_DWORD *)v17 = 136315138;
    v70 = sub_100006F70(0xD00000000000001FLL, 0x80000001000125C0, &v71);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v17 + 4, v17 + 12);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "%s", v17, 0xCu);
    swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
    v21 = v20;
    v4 = v19;
    v8 = v18;
    swift_slowDealloc(v21, -1, -1);
    v22 = v17;
    a1 = v67;
    swift_slowDealloc(v22, -1, -1);
  }

  v23 = *(void (**)(char *, uint64_t))(v5 + 8);
  v23(v11, v4);
  v24 = objc_opt_self(UIWindowScene);
  result = swift_dynamicCastObjCClass(a1, v24);
  if (result)
  {
    v26 = result;
    v67 = v23;
    v27 = (void *)objc_opt_self(UIScreen);
    v28 = a1;
    v29 = objc_msgSend(v27, "mainScreen");
    objc_msgSend(v29, "bounds");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;

    v38 = objc_msgSend(objc_allocWithZone((Class)UIWindow), "initWithFrame:", v31, v33, v35, v37);
    v39 = v69;
    v40 = *(void **)&v69[OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_window];
    *(_QWORD *)&v69[OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_window] = v38;
    v41 = v38;

    objc_msgSend(v41, "setOpaque:", 0);
    v42 = (void *)objc_opt_self(UIColor);
    v43 = v41;
    v44 = objc_msgSend(v42, "clearColor");
    objc_msgSend(v43, "setBackgroundColor:", v44);

    objc_msgSend(v43, "setWindowScene:", v26);
    objc_msgSend(v43, "setRootViewController:", *(_QWORD *)&v39[OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_rootViewController]);
    objc_msgSend(v43, "makeKeyAndVisible");
    v45 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MessageComposer()), "init");
    v46 = *(void **)&v39[OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_messageComposer];
    *(_QWORD *)&v39[OBJC_IVAR____TtC20PeopleMessageService13SceneDelegate_messageComposer] = v45;

    v47 = v68;
    v48 = objc_msgSend(v68, "URLContexts");
    v49 = sub_100006E20();
    v50 = sub_100006754(&qword_100019A50, (uint64_t (*)(uint64_t))sub_100006E20, (uint64_t)&protocol conformance descriptor for NSObject);
    v51 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v48, v49, v50);

    v52 = v4;
    if ((v51 & 0xC000000000000001) != 0)
    {
      if (v51 < 0)
        v53 = v51;
      else
        v53 = v51 & 0xFFFFFFFFFFFFFF8;
      v54 = __CocoaSet.count.getter(v53);
    }
    else
    {
      v54 = *(_QWORD *)(v51 + 16);
    }
    v55 = swift_bridgeObjectRelease(v51);
    if (v54)
    {
      v56 = objc_msgSend(v47, "URLContexts");
      v57 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v56, v49, v50);

      sub_1000075B0(v57);
      return swift_bridgeObjectRelease(v57);
    }
    else
    {
      v58 = static PeopleLogger.messages.getter(v55);
      v59 = Logger.logObject.getter(v58);
      v60 = static os_log_type_t.error.getter();
      v61 = v52;
      if (os_log_type_enabled(v59, v60))
      {
        v62 = swift_slowAlloc(12, -1);
        v69 = v8;
        v63 = (uint8_t *)v62;
        v64 = swift_slowAlloc(32, -1);
        v71 = v64;
        *(_DWORD *)v63 = 136315138;
        v70 = sub_100006F70(0xD00000000000001FLL, 0x80000001000125C0, &v71);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v63 + 4, v63 + 12);
        _os_log_impl((void *)&_mh_execute_header, v59, v60, "%s missing URL data", v63, 0xCu);
        swift_arrayDestroy(v64, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v64, -1, -1);
        swift_slowDealloc(v63, -1, -1);

        v65 = v69;
      }
      else
      {

        v65 = v8;
      }
      return ((uint64_t (*)(char *, uint64_t))v67)(v65, v61);
    }
  }
  return result;
}

uint64_t sub_100008AC4(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD v21[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_100006718(a1, &qword_100019A58);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v16 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v17 = swift_allocObject(&unk_100014BF0, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  v18 = sub_100006600(&qword_100019BE0);
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
  return swift_task_create(v8, v19, v18, &unk_100019BE8, v17);
}

uint64_t sub_100008C18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  __int128 v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  void *v9;

  v0 = type metadata accessor for RequestMessageDetailsBuilder(0);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  v8 = v0;
  v9 = &protocol witness table for RequestMessageDetailsBuilder;
  *(_QWORD *)&v7 = RequestMessageDetailsBuilder.init()();
  v5 = type metadata accessor for ContactFetcher(0);
  v6 = &protocol witness table for ContactFetcher;
  *(_QWORD *)&v4 = ContactFetcher.__allocating_init()();
  v1 = type metadata accessor for MessagePackage();
  v2 = swift_allocObject(v1, 96, 7);
  sub_10000F73C(&v7, v2 + 16);
  result = sub_10000F73C(&v4, v2 + 56);
  qword_100019FB0 = v2;
  return result;
}

unint64_t sub_100008CBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t result;

  v0 = sub_100006600(&qword_100019BF8);
  v1 = sub_100006600(&qword_100019C00);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = *(unsigned __int8 *)(v2 + 80);
  v5 = (v4 + 32) & ~v4;
  v6 = swift_allocObject(v0, v5 + 2 * v3, v4 | 7);
  *(_OWORD *)(v6 + 16) = xmmword_100012B60;
  v7 = v6 + v5;
  v8 = (_QWORD *)(v7 + *(int *)(v1 + 48));
  v9 = enum case for MessageDetails.EventSource.screenTime(_:);
  v10 = type metadata accessor for MessageDetails.EventSource(0);
  v11 = *(void (**)(void))(*(_QWORD *)(v10 - 8) + 104);
  ((void (*)(uint64_t, uint64_t, uint64_t))v11)(v7, v9, v10);
  *v8 = 0xD000000000000029;
  v8[1] = 0x80000001000127C0;
  v8[2] = 0xD000000000000011;
  v8[3] = 0x80000001000127F0;
  v8[4] = 0xD000000000000022;
  v8[5] = 0x8000000100012810;
  v8[6] = static String._unconditionallyBridgeFromObjectiveC(_:)(IDSRegistrationPropertySupportsPeopleRequestMessages);
  v8[7] = v12;
  v13 = (_QWORD *)(v7 + v3 + *(int *)(v1 + 48));
  v11();
  *v13 = 0xD000000000000027;
  v13[1] = 0x8000000100012840;
  v13[2] = 0x7975426F546B7341;
  v13[3] = 0xE800000000000000;
  v13[4] = 0xD000000000000022;
  v13[5] = 0x8000000100012870;
  v13[6] = static String._unconditionallyBridgeFromObjectiveC(_:)(IDSRegistrationPropertySupportsPeopleRequestMessagesV3);
  v13[7] = v14;
  result = sub_100008E68(v6);
  qword_100019FB8 = result;
  return result;
}

unint64_t sub_100008E68(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v2 = sub_100006600(&qword_100019C00);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v28 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v28);
    return (unint64_t)v8;
  }
  sub_100006600(&qword_100019C08);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = &v5[*(int *)(v2 + 48)];
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v30 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_1000066D4(v13, (uint64_t)v5, &qword_100019C00);
    result = sub_1000030D4((uint64_t)v5);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v18 = v8[6];
    v19 = type metadata accessor for MessageDetails.EventSource(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v5, v19);
    v20 = v8[7] + (v17 << 6);
    v21 = *((_OWORD *)v10 + 1);
    v22 = *((_OWORD *)v10 + 2);
    v23 = *((_QWORD *)v10 + 6);
    v24 = *((_QWORD *)v10 + 7);
    *(_OWORD *)v20 = *(_OWORD *)v10;
    *(_OWORD *)(v20 + 16) = v21;
    *(_OWORD *)(v20 + 32) = v22;
    *(_QWORD *)(v20 + 48) = v23;
    *(_QWORD *)(v20 + 56) = v24;
    v25 = v8[2];
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
      goto LABEL_12;
    v8[2] = v27;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      v28 = v30;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_100009018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[3] = a1;
  v4[4] = a4;
  v5 = type metadata accessor for URL(0);
  v4[5] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[6] = v6;
  v4[7] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Logger(0);
  v4[8] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v4[9] = v8;
  v4[10] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000090A0, 0, 0);
}

uint64_t sub_1000090A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v3 = *(_QWORD *)(v1 + 48);
  v2 = *(_QWORD *)(v1 + 56);
  v5 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  static PeopleLogger.messages.getter(a1);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = *(_QWORD *)(v1 + 56);
    v27 = *(_QWORD *)(v1 + 64);
    v28 = *(_QWORD *)(v1 + 80);
    v10 = *(_QWORD *)(v1 + 48);
    v25 = *(_QWORD *)(v1 + 40);
    v26 = *(_QWORD *)(v1 + 72);
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    v29 = v12;
    *(_DWORD *)v11 = 136315138;
    v13 = URL.absoluteString.getter(v12);
    v15 = v14;
    *(_QWORD *)(v1 + 16) = sub_100006F70(v13, v14, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 16, v1 + 24, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease(v15);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v25);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Fetching %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v28, v27);
  }
  else
  {
    v17 = *(_QWORD *)(v1 + 72);
    v16 = *(_QWORD *)(v1 + 80);
    v18 = *(_QWORD *)(v1 + 64);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 48) + 8))(*(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 40));

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  v19 = Data.init(contentsOf:options:)(*(_QWORD *)(v1 + 32), 0);
  v20 = *(_QWORD *)(v1 + 80);
  v21 = *(_QWORD *)(v1 + 56);
  v22 = *(uint64_t **)(v1 + 24);
  *v22 = v19;
  v22[1] = v23;
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000092A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v5[9] = a4;
  v5[10] = v4;
  v5[7] = a2;
  v5[8] = a3;
  v5[6] = a1;
  v6 = type metadata accessor for Logger(0);
  v5[11] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[12] = v7;
  v5[13] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100006600(&qword_100019B80);
  v5[14] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v5[15] = v9;
  v5[16] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for MessageDetails.EventSource(0);
  v5[17] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v5[18] = v11;
  v12 = (*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[19] = swift_task_alloc(v12);
  v5[20] = swift_task_alloc(v12);
  return swift_task_switch(sub_100009370, 0, 0);
}

uint64_t sub_100009370()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;

  v1 = *(_QWORD *)(v0 + 136);
  (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(v0 + 144) + 104))(*(_QWORD *)(v0 + 160), enum case for MessageDetails.EventSource.unknown(_:), v1);
  v2 = sub_100006754(&qword_100019B88, (uint64_t (*)(uint64_t))&type metadata accessor for MessageDetails.EventSource, (uint64_t)&protocol conformance descriptor for MessageDetails.EventSource);
  dispatch thunk of RawRepresentable.rawValue.getter(v1, v2);
  dispatch thunk of RawRepresentable.rawValue.getter(v1, v2);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 160);
  v6 = *(_QWORD *)(v0 + 136);
  v7 = *(_QWORD *)(v0 + 144);
  if (*(_QWORD *)(v0 + 16) == *(_QWORD *)(v0 + 32) && v3 == v4)
  {
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 24), 2);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
LABEL_5:
    v10 = static PeopleErrors.createError(_:code:)(0xD00000000000001DLL, 0x8000000100012660, 500);
    v11 = swift_willThrow(v10);
    v13 = *(_QWORD *)(v0 + 152);
    v12 = *(_QWORD *)(v0 + 160);
    v14 = *(_QWORD *)(v0 + 128);
    v16 = *(_QWORD *)(v0 + 96);
    v15 = *(_QWORD *)(v0 + 104);
    v17 = *(_QWORD *)(v0 + 88);
    static PeopleLogger.messages.getter(v11);
    swift_errorRetain(v10);
    Logger.ifError(_:message:)(v10, 0xD000000000000027, 0x8000000100012630);
    swift_errorRelease(v10);
    v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    swift_willThrow(v18);
    swift_task_dealloc(v12);
    swift_task_dealloc(v13);
    swift_task_dealloc(v14);
    swift_task_dealloc(v15);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v9(v5, v6);
  if ((v8 & 1) != 0)
    goto LABEL_5;
  v21 = *(_QWORD *)(v0 + 144);
  v20 = *(_QWORD *)(v0 + 152);
  v22 = *(_QWORD *)(v0 + 136);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v21 + 16))(v20, *(_QWORD *)(v0 + 72), v22);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v21 + 88))(v20, v22) == enum case for MessageDetails.EventSource.screenTime(_:))
  {
    static PeopleConstants.screenTimeRequestEventTTL.getter();
  }
  else
  {
    v23 = *(_QWORD *)(v0 + 152);
    v24 = *(_QWORD *)(v0 + 136);
    static PeopleConstants.askToBuyEventTTL.getter();
    v9(v23, v24);
  }
  v25 = *(_QWORD *)(v0 + 80);
  sub_1000099A8((_QWORD *)(v25 + 16), *(_QWORD *)(v25 + 40));
  v26 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of RequestMessageDetailsBuilderProtocol.fromPersistence(_:eventID:useFamilyCache:resolveAppBundleInfo:maxAge:withContactFetcher:)[1]);
  *(_QWORD *)(v0 + 168) = v26;
  *v26 = v0;
  v26[1] = sub_100009640;
  return dispatch thunk of RequestMessageDetailsBuilderProtocol.fromPersistence(_:eventID:useFamilyCache:resolveAppBundleInfo:maxAge:withContactFetcher:)(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), 0, 1, *(_QWORD *)(v0 + 128), v25 + 56);
}

uint64_t sub_100009640()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_100009710;
  else
    v3 = sub_1000096A4;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000096A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 104);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(v3, *(_QWORD *)(v0 + 112));
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009710()
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

  v1 = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
  v2 = *(_QWORD *)(v0 + 176);
  v4 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 128);
  v7 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 104);
  v8 = *(_QWORD *)(v0 + 88);
  static PeopleLogger.messages.getter(v1);
  swift_errorRetain(v2);
  Logger.ifError(_:message:)(v2, 0xD000000000000027, 0x8000000100012630);
  swift_errorRelease(v2);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  swift_willThrow(v9);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000097E8(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  uint64_t result;
  char v26;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v24 = v4 + v2;
  else
    v24 = v4;
  v3 = sub_1000099CC(isUniquelyReferenced_nonNull_native, v24, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *(_QWORD *)(v3 + 16);
  v10 = (*(_QWORD *)(v3 + 24) >> 1) - v9;
  v11 = type metadata accessor for URLQueryItem(0);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v3 + v13 + v14 * v9;
  v16 = a1 + v13;
  v17 = v14 * v8;
  v18 = v15 + v17;
  v19 = v16 + v17;
  if (v16 < v18 && v15 < v19)
    goto LABEL_24;
  swift_arrayInitWithCopy(v15);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v21 = *(_QWORD *)(v3 + 16);
  v22 = __OFADD__(v21, v8);
  v23 = v21 + v8;
  if (!v22)
  {
    *(_QWORD *)(v3 + 16) = v23;
LABEL_19:
    result = swift_bridgeObjectRelease(a1);
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  v26 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, v26, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000995C()
{
  uint64_t v0;

  sub_100006670((_QWORD *)(v0 + 16));
  sub_100006670((_QWORD *)(v0 + 56));
  return swift_deallocClassInstance(v0, 96, 7);
}

uint64_t type metadata accessor for MessagePackage()
{
  return objc_opt_self(_TtC20PeopleMessageService14MessagePackage);
}

_QWORD *sub_1000099A8(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000099CC(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
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
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100006600(&qword_100019BF0);
  v11 = *(_QWORD *)(type metadata accessor for URLQueryItem(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
    goto LABEL_29;
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for URLQueryItem(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(_QWORD *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000A224(0, v8, v21, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

uint64_t sub_100009BD4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100009BF0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100009BF0(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100006600(&qword_100019B98);
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

uint64_t sub_100009D58(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v1[5] = a1;
  v2 = type metadata accessor for Logger(0);
  v1[6] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[7] = v3;
  v1[8] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL(0);
  v1[9] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v1[10] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v1[11] = v6;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[12] = swift_task_alloc(v7);
  v1[13] = swift_task_alloc(v7);
  v8 = sub_100006600(&qword_100019A58);
  v1[14] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100009E18, 0, 0);
}

uint64_t sub_100009E18()
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v1 = static AMSBagHelper.isTrustedDomain(for:)(*(_QWORD *)(v0 + 40));
  if ((v1 & 1) != 0)
  {
    v3 = *(_QWORD *)(v0 + 104);
    v2 = *(_QWORD *)(v0 + 112);
    v5 = *(_QWORD *)(v0 + 80);
    v4 = *(_QWORD *)(v0 + 88);
    v6 = *(_QWORD *)(v0 + 72);
    v7 = *(_QWORD *)(v0 + 40);
    static TaskPriority.userInitiated.getter();
    v8 = type metadata accessor for TaskPriority(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v2, 0, 1, v8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v7, v6);
    v9 = *(unsigned __int8 *)(v5 + 80);
    v10 = (v9 + 32) & ~v9;
    v11 = swift_allocObject(&unk_100014BC8, v10 + v4, v9 | 7);
    *(_QWORD *)(v11 + 16) = 0;
    *(_QWORD *)(v11 + 24) = 0;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v11 + v10, v3, v6);
    v12 = sub_100008AC4(v2, (uint64_t)&unk_100019BD8, v11);
    *(_QWORD *)(v0 + 120) = v12;
    v13 = (_QWORD *)swift_task_alloc(async function pointer to Task<>.value.getter[1]);
    *(_QWORD *)(v0 + 128) = v13;
    v14 = sub_100006600(&qword_100019BE0);
    *v13 = v0;
    v13[1] = sub_10000A15C;
    return Task<>.value.getter(v0 + 16, v12, v14);
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 96);
    v17 = *(_QWORD *)(v0 + 72);
    v18 = *(_QWORD *)(v0 + 80);
    v19 = *(_QWORD *)(v0 + 40);
    static PeopleLogger.messages.getter(v1);
    v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, v19, v17);
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.error.getter();
    v23 = os_log_type_enabled(v21, v22);
    v24 = *(_QWORD *)(v0 + 96);
    v25 = *(_QWORD *)(v0 + 72);
    v27 = *(_QWORD *)(v0 + 56);
    v26 = *(_QWORD *)(v0 + 64);
    v28 = *(_QWORD *)(v0 + 48);
    if (v23)
    {
      v38 = *(_QWORD *)(v0 + 80);
      v40 = *(_QWORD *)(v0 + 64);
      v39 = *(_QWORD *)(v0 + 48);
      v29 = (uint8_t *)swift_slowAlloc(12, -1);
      v30 = swift_slowAlloc(32, -1);
      v41 = v30;
      *(_DWORD *)v29 = 136315138;
      v31 = sub_100006754(&qword_100019A88, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v32 = dispatch thunk of CustomStringConvertible.description.getter(v25, v31);
      v34 = v33;
      *(_QWORD *)(v0 + 32) = sub_100006F70(v32, v33, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v29 + 4, v29 + 12);
      swift_bridgeObjectRelease(v34);
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v24, v25);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "%s not in trusted list", v29, 0xCu);
      swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v29, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v40, v39);
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 72));

      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    }
    v35 = *(_QWORD *)(v0 + 104);
    v36 = *(_QWORD *)(v0 + 96);
    v37 = *(_QWORD *)(v0 + 64);
    swift_task_dealloc(*(_QWORD *)(v0 + 112));
    swift_task_dealloc(v35);
    swift_task_dealloc(v36);
    swift_task_dealloc(v37);
    return (*(uint64_t (**)(_QWORD, unint64_t))(v0 + 8))(0, 0xF000000000000000);
  }
}

uint64_t sub_10000A15C()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 128));
  return swift_task_switch(sub_10000A1B0, 0, 0);
}

uint64_t sub_10000A1B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_release(*(_QWORD *)(v0 + 120));
  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 64);
  swift_task_dealloc(*(_QWORD *)(v0 + 112));
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_10000A224(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
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
  v8 = *(_QWORD *)(type metadata accessor for URLQueryItem(0) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v8 + 72);
  v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  v12 = v10 * v4;
  v13 = a3 + v12;
  v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10000A33C(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t PartyApps;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;

  *(_BYTE *)(v3 + 864) = a2;
  *(_QWORD *)(v3 + 312) = a1;
  *(_QWORD *)(v3 + 320) = a3;
  v4 = type metadata accessor for Logger(0);
  *(_QWORD *)(v3 + 328) = v4;
  v5 = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 336) = v5;
  v6 = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v3 + 344) = swift_task_alloc(v6);
  *(_QWORD *)(v3 + 352) = swift_task_alloc(v6);
  *(_QWORD *)(v3 + 360) = swift_task_alloc(v6);
  *(_QWORD *)(v3 + 368) = swift_task_alloc(v6);
  *(_QWORD *)(v3 + 376) = swift_task_alloc(v6);
  *(_QWORD *)(v3 + 384) = swift_task_alloc(v6);
  *(_QWORD *)(v3 + 392) = swift_task_alloc(v6);
  *(_QWORD *)(v3 + 400) = swift_task_alloc(v6);
  v7 = type metadata accessor for URLQueryItem(0);
  *(_QWORD *)(v3 + 408) = v7;
  v8 = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v3 + 416) = v8;
  v9 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v3 + 424) = swift_task_alloc(v9);
  *(_QWORD *)(v3 + 432) = swift_task_alloc(v9);
  v10 = type metadata accessor for ATURL.Parser(0);
  *(_QWORD *)(v3 + 440) = v10;
  v11 = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v3 + 448) = v11;
  *(_QWORD *)(v3 + 456) = swift_task_alloc((*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100006600(&qword_100019A60);
  *(_QWORD *)(v3 + 464) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v12 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for URLComponents(0);
  *(_QWORD *)(v3 + 472) = v13;
  v14 = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v3 + 480) = v14;
  v15 = (*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v3 + 488) = swift_task_alloc(v15);
  *(_QWORD *)(v3 + 496) = swift_task_alloc(v15);
  PartyApps = type metadata accessor for FirstPartyApps(0);
  *(_QWORD *)(v3 + 504) = PartyApps;
  v17 = *(_QWORD *)(PartyApps - 8);
  *(_QWORD *)(v3 + 512) = v17;
  *(_QWORD *)(v3 + 520) = swift_task_alloc((*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100006600(&qword_1000198C0);
  *(_QWORD *)(v3 + 528) = v18;
  v19 = (*(_QWORD *)(*(_QWORD *)(v18 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v3 + 536) = swift_task_alloc(v19);
  *(_QWORD *)(v3 + 544) = swift_task_alloc(v19);
  *(_QWORD *)(v3 + 552) = swift_task_alloc(v19);
  *(_QWORD *)(v3 + 560) = swift_task_alloc(v19);
  *(_QWORD *)(v3 + 568) = swift_task_alloc(v19);
  *(_QWORD *)(v3 + 576) = swift_task_alloc(v19);
  *(_QWORD *)(v3 + 584) = swift_task_alloc(v19);
  *(_QWORD *)(v3 + 592) = swift_task_alloc(v19);
  v20 = type metadata accessor for URL(0);
  *(_QWORD *)(v3 + 600) = v20;
  v21 = *(_QWORD *)(v20 - 8);
  *(_QWORD *)(v3 + 608) = v21;
  v22 = (*(_QWORD *)(v21 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v3 + 616) = swift_task_alloc(v22);
  *(_QWORD *)(v3 + 624) = swift_task_alloc(v22);
  *(_QWORD *)(v3 + 632) = swift_task_alloc(v22);
  *(_QWORD *)(v3 + 640) = swift_task_alloc(v22);
  *(_QWORD *)(v3 + 648) = swift_task_alloc(v22);
  v23 = sub_100006600(&qword_1000198D8);
  *(_QWORD *)(v3 + 656) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v23 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for MessageDetails.EventSource(0);
  *(_QWORD *)(v3 + 664) = v24;
  v25 = *(_QWORD *)(v24 - 8);
  *(_QWORD *)(v3 + 672) = v25;
  v26 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v3 + 680) = swift_task_alloc(v26);
  *(_QWORD *)(v3 + 688) = swift_task_alloc(v26);
  *(_QWORD *)(v3 + 696) = swift_task_alloc(v26);
  *(_QWORD *)(v3 + 704) = swift_task_alloc(v26);
  *(_QWORD *)(v3 + 712) = swift_task_alloc(v26);
  v27 = type metadata accessor for MessageDetails(0);
  *(_QWORD *)(v3 + 720) = v27;
  v28 = *(_QWORD *)(v27 - 8);
  *(_QWORD *)(v3 + 728) = v28;
  *(_QWORD *)(v3 + 736) = swift_task_alloc((*(_QWORD *)(v28 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000A68C, 0, 0);
}

uint64_t sub_10000A68C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  unint64_t v41;
  char v42;
  _QWORD *v43;
  uint64_t v44;
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
  unint64_t v59;
  unint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;

  v1 = *(_QWORD *)(v0 + 672);
  v2 = *(_QWORD *)(v0 + 664);
  v3 = *(_QWORD *)(v0 + 656);
  v4 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 728) + 16))(*(_QWORD *)(v0 + 736), *(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 720));
  MessageDetails.eventSource.getter(v4);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2);
  v6 = *(_QWORD *)(v0 + 712);
  v7 = *(_QWORD *)(v0 + 672);
  v8 = *(_QWORD *)(v0 + 664);
  v9 = *(_QWORD *)(v0 + 656);
  if (v5 == 1)
  {
    v10 = enum case for MessageDetails.EventSource.unknown(_:);
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 104);
    v11(v6, enum case for MessageDetails.EventSource.unknown(_:), v8);
    sub_100006718(v9, &qword_1000198D8);
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 32))(v6, *(_QWORD *)(v0 + 656), v8);
    v10 = enum case for MessageDetails.EventSource.unknown(_:);
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 104);
  }
  *(_QWORD *)(v0 + 744) = v11;
  v12 = *(_QWORD *)(v0 + 664);
  v11(*(_QWORD *)(v0 + 704), v10, v12);
  v13 = sub_100006754(&qword_100019B88, (uint64_t (*)(uint64_t))&type metadata accessor for MessageDetails.EventSource, (uint64_t)&protocol conformance descriptor for MessageDetails.EventSource);
  *(_QWORD *)(v0 + 752) = v13;
  dispatch thunk of RawRepresentable.rawValue.getter(v12, v13);
  dispatch thunk of RawRepresentable.rawValue.getter(v12, v13);
  v14 = *(_QWORD *)(v0 + 136);
  v15 = *(_QWORD *)(v0 + 144);
  v16 = *(_QWORD *)(v0 + 152);
  v17 = *(_QWORD *)(v0 + 160);
  v18 = *(_QWORD *)(v0 + 704);
  v19 = *(_QWORD *)(v0 + 672);
  v20 = *(_QWORD *)(v0 + 664);
  if (v14 == v16 && v15 == v17)
  {
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 144), 2);
    v21 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v21(v18, v20);
LABEL_8:
    v23 = *(_QWORD *)(v0 + 736);
    v24 = *(_QWORD *)(v0 + 728);
    v25 = *(_QWORD *)(v0 + 720);
    v26 = *(_QWORD *)(v0 + 712);
    v27 = *(_QWORD *)(v0 + 664);
    v28 = 0x8000000100012660;
    v29 = 0xD00000000000001DLL;
LABEL_9:
    v64 = static PeopleErrors.createError(_:code:)(v29, v28, 500);
    swift_willThrow(v64);
    v21(v26, v27);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
    v30 = *(_QWORD *)(v0 + 712);
    v31 = *(_QWORD *)(v0 + 704);
    v32 = *(_QWORD *)(v0 + 696);
    v33 = *(_QWORD *)(v0 + 688);
    v34 = *(_QWORD *)(v0 + 680);
    v35 = *(_QWORD *)(v0 + 656);
    v36 = *(_QWORD *)(v0 + 648);
    v37 = *(_QWORD *)(v0 + 640);
    v38 = *(_QWORD *)(v0 + 632);
    v65 = *(_QWORD *)(v0 + 624);
    v66 = *(_QWORD *)(v0 + 616);
    v67 = *(_QWORD *)(v0 + 592);
    v68 = *(_QWORD *)(v0 + 584);
    v69 = *(_QWORD *)(v0 + 576);
    v70 = *(_QWORD *)(v0 + 568);
    v71 = *(_QWORD *)(v0 + 560);
    v72 = *(_QWORD *)(v0 + 552);
    v73 = *(_QWORD *)(v0 + 544);
    v74 = *(_QWORD *)(v0 + 536);
    v75 = *(_QWORD *)(v0 + 520);
    v76 = *(_QWORD *)(v0 + 496);
    v77 = *(_QWORD *)(v0 + 488);
    v78 = *(_QWORD *)(v0 + 464);
    v79 = *(_QWORD *)(v0 + 456);
    v80 = *(_QWORD *)(v0 + 432);
    v81 = *(_QWORD *)(v0 + 424);
    v82 = *(_QWORD *)(v0 + 400);
    v83 = *(_QWORD *)(v0 + 392);
    v84 = *(_QWORD *)(v0 + 384);
    v85 = *(_QWORD *)(v0 + 376);
    v86 = *(_QWORD *)(v0 + 368);
    v87 = *(_QWORD *)(v0 + 360);
    v88 = *(_QWORD *)(v0 + 352);
    v89 = *(_QWORD *)(v0 + 344);
    swift_task_dealloc(*(_QWORD *)(v0 + 736));
    swift_task_dealloc(v30);
    swift_task_dealloc(v31);
    swift_task_dealloc(v32);
    swift_task_dealloc(v33);
    swift_task_dealloc(v34);
    swift_task_dealloc(v35);
    swift_task_dealloc(v36);
    swift_task_dealloc(v37);
    swift_task_dealloc(v38);
    swift_task_dealloc(v65);
    swift_task_dealloc(v66);
    swift_task_dealloc(v67);
    swift_task_dealloc(v68);
    swift_task_dealloc(v69);
    swift_task_dealloc(v70);
    swift_task_dealloc(v71);
    swift_task_dealloc(v72);
    swift_task_dealloc(v73);
    swift_task_dealloc(v74);
    swift_task_dealloc(v75);
    swift_task_dealloc(v76);
    swift_task_dealloc(v77);
    swift_task_dealloc(v78);
    swift_task_dealloc(v79);
    swift_task_dealloc(v80);
    swift_task_dealloc(v81);
    swift_task_dealloc(v82);
    swift_task_dealloc(v83);
    swift_task_dealloc(v84);
    swift_task_dealloc(v85);
    swift_task_dealloc(v86);
    swift_task_dealloc(v87);
    swift_task_dealloc(v88);
    swift_task_dealloc(v89);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, *(_QWORD *)(v0 + 144), v16, *(_QWORD *)(v0 + 160), 0);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v15);
  v21 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
  *(_QWORD *)(v0 + 760) = v21;
  v21(v18, v20);
  if ((v22 & 1) != 0)
    goto LABEL_8;
  if (qword_100019768 != -1)
    swift_once(&qword_100019768, sub_100008CBC);
  v40 = qword_100019FB8;
  if (!*(_QWORD *)(qword_100019FB8 + 16) || (v41 = sub_1000030D4(*(_QWORD *)(v0 + 712)), (v42 & 1) == 0))
  {
    v23 = *(_QWORD *)(v0 + 736);
    v24 = *(_QWORD *)(v0 + 728);
    v25 = *(_QWORD *)(v0 + 720);
    v26 = *(_QWORD *)(v0 + 712);
    v29 = 0xD000000000000023;
    v27 = *(_QWORD *)(v0 + 664);
    v28 = 0x8000000100012170;
    goto LABEL_9;
  }
  v43 = (_QWORD *)(*(_QWORD *)(v40 + 56) + (v41 << 6));
  v44 = v43[1];
  *(_QWORD *)(v0 + 768) = v44;
  *(_QWORD *)(v0 + 776) = v43[2];
  v45 = v43[3];
  *(_QWORD *)(v0 + 784) = v45;
  *(_QWORD *)(v0 + 792) = v43[4];
  v46 = v43[5];
  *(_QWORD *)(v0 + 800) = v46;
  *(_QWORD *)(v0 + 808) = v43[6];
  v47 = v43[7];
  *(_QWORD *)(v0 + 816) = v47;
  swift_bridgeObjectRetain(v44);
  swift_bridgeObjectRetain(v45);
  swift_bridgeObjectRetain(v46);
  v48 = swift_bridgeObjectRetain(v47);
  v49 = MessageDetails.thumbnailPath.getter(v48);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)(v0 + 608);
    v53 = *(_QWORD *)(v0 + 600);
    v54 = *(_QWORD *)(v0 + 592);
    URL.init(string:)(v49, v50);
    swift_bridgeObjectRelease(v51);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v54, 1, v53) != 1)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 608) + 32))(*(_QWORD *)(v0 + 648), *(_QWORD *)(v0 + 592), *(_QWORD *)(v0 + 600));
      v62 = dword_100019BC8;
      v63 = (_QWORD *)swift_task_alloc(unk_100019BCC);
      *(_QWORD *)(v0 + 824) = v63;
      *v63 = v0;
      v63[1] = sub_10000AD3C;
      return ((uint64_t (*)(uint64_t))((char *)&dword_100019BC8 + v62))(*(_QWORD *)(v0 + 648));
    }
    v49 = sub_100006718(*(_QWORD *)(v0 + 592), &qword_1000198C0);
  }
  v55 = *(_QWORD *)(v0 + 520);
  v56 = *(_QWORD *)(v0 + 504);
  v57 = *(_QWORD *)(v0 + 512);
  v58 = MessageDetails.bundleId.getter(v49);
  v60 = v59;
  *(_QWORD *)(v0 + 840) = v59;
  type metadata accessor for AppBundleResolver(0);
  if (!v60)
  {
    v58 = 0;
    v60 = 0xE000000000000000;
  }
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v57 + 104))(v55, enum case for FirstPartyApps.none(_:), v56);
  v61 = (_QWORD *)swift_task_alloc(async function pointer to static AppBundleResolver.resolveThumbnail(_:_:)[1]);
  *(_QWORD *)(v0 + 848) = v61;
  *v61 = v0;
  v61[1] = sub_10000D170;
  return static AppBundleResolver.resolveThumbnail(_:_:)(v58, v60, *(_QWORD *)(v0 + 520));
}

uint64_t sub_10000AD3C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)*v2;
  v3[11] = v2;
  v3[12] = a1;
  v3[13] = a2;
  v4 = v3[103];
  v3[104] = a2;
  swift_task_dealloc(v4);
  return swift_task_switch(sub_10000ADC4, 0, 0);
}

uint64_t sub_10000ADC4()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  Class isa;
  UIImage *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(_QWORD, _QWORD, _QWORD);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
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
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  NSData *v87;
  NSData *v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  os_log_type_t v96;
  uint64_t v97;
  int64_t v98;
  _QWORD *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t, uint64_t);
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void (*v116)(uint64_t, uint64_t);
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  _QWORD *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  int v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  NSObject *v145;
  os_log_type_t v146;
  _BOOL4 v147;
  void (*v148)(uint64_t, uint64_t);
  uint64_t v149;
  _QWORD *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint8_t *v154;
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  unint64_t v158;
  id v159;
  uint64_t v160;
  uint64_t v161;
  NSString v162;
  id v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t (*v171)(uint64_t, uint64_t);
  uint64_t v172;
  uint64_t v173;
  char v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  unint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t (*v188)(uint64_t, uint64_t, uint64_t);
  uint64_t v189;
  uint64_t v190;
  Swift::String v191;
  uint64_t v192;
  void *v193;
  uint64_t v194;
  void *v195;
  uint64_t v196;
  char v197;
  uint64_t v198;
  uint64_t v199;
  void (*v200)(uint64_t, uint64_t, uint64_t);
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  void (*v207)(uint64_t, uint64_t);
  uint64_t v208;
  uint64_t v209;
  char v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  Swift::String_optional v214;
  uint64_t v215;
  uint64_t v216;
  _QWORD *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  NSObject *v224;
  os_log_type_t v225;
  uint64_t v226;
  uint64_t v227;
  uint8_t *v228;
  uint64_t *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void (*v237)(uint64_t, uint64_t);
  unint64_t v238;
  uint64_t v239;
  uint64_t *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  NSURL *v247;
  void *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  NSString v253;
  NSData *v254;
  NSData *v255;
  uint64_t v256;
  unint64_t v257;
  unint64_t v258;
  NSData v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  id v263;
  id v264;
  uint64_t v265;
  uint64_t v266;
  Class v267;
  id v268;
  id v269;
  NSURL *v270;
  void *v271;
  void *v272;
  uint64_t v273;
  uint64_t v274;
  NSString v275;
  uint64_t v276;
  id v277;
  NSObject *v278;
  os_log_type_t v279;
  uint8_t *v280;
  uint64_t v281;
  id v282;
  void *v283;
  _QWORD *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  unint64_t v295;
  unint64_t v296;
  unint64_t v297;
  UIImage *v298;
  NSData *v299;
  Class v300;
  uint64_t v301;
  unint64_t v302;
  unint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  NSString v310;
  id v311;
  id v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  NSObject *v318;
  os_log_type_t v319;
  uint8_t *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  NSObject *v331;
  uint64_t v332;
  uint8_t *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  void (*v356)(uint64_t, uint64_t);
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  void (*v394)(uint64_t, uint64_t);
  uint64_t v395;
  uint64_t v396;
  _QWORD *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  os_log_type_t v405;
  uint64_t *v406;
  uint64_t *v407;
  uint64_t *v408;
  uint64_t *v409;
  uint8_t *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  NSObject *v415;
  uint64_t v416;
  uint64_t v417;
  void (*v418)(uint64_t, uint64_t);
  uint64_t v419;
  _QWORD *v420;
  _QWORD *v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  _QWORD *v425;
  uint64_t v426;
  uint64_t v427;
  void **v428;
  _QWORD *v429;
  unint64_t v430;
  uint64_t v431;
  uint64_t v432;
  _QWORD *v433;
  uint64_t v434;
  uint64_t v435;
  void *v436;
  uint64_t v437;
  unsigned int (*v438)(_QWORD, _QWORD, _QWORD);
  unsigned int (*v439)(_QWORD, _QWORD, _QWORD);
  void (*v440)(uint64_t, uint64_t);
  uint64_t (*v441)(uint64_t, uint64_t, uint64_t);
  void *v442;
  uint64_t v443;
  UIImage *v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  void (*v449)(uint64_t, uint64_t);
  uint64_t v450;
  _QWORD *v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457[3];

  v1 = v0;
  v2 = v0[104];
  if (v2 >> 60 == 15)
  {
    v3 = (*(uint64_t (**)(_QWORD, _QWORD))(v0[76] + 8))(v0[81], v0[75]);
LABEL_6:
    v17 = v1[65];
    v19 = v1[63];
    v18 = v1[64];
    v20 = MessageDetails.bundleId.getter(v3);
    v22 = v21;
    v1[105] = v21;
    type metadata accessor for AppBundleResolver(0);
    if (!v22)
    {
      v20 = 0;
      v22 = 0xE000000000000000;
    }
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 104))(v17, enum case for FirstPartyApps.none(_:), v19);
    v23 = (_QWORD *)swift_task_alloc(async function pointer to static AppBundleResolver.resolveThumbnail(_:_:)[1]);
    v1[106] = v23;
    *v23 = v1;
    v23[1] = sub_10000D170;
    return static AppBundleResolver.resolveThumbnail(_:_:)(v20, v22, v1[65]);
  }
  v4 = v0[12];
  v5 = v0[81];
  v6 = v0[76];
  v7 = v1[75];
  v8 = objc_allocWithZone((Class)UIImage);
  isa = Data._bridgeToObjectiveC()().super.isa;
  v10 = (UIImage *)objc_msgSend(v8, "initWithData:", isa);
  sub_10000F488(v4, v2);

  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  if (!v10)
    goto LABEL_6;
  v428 = (void **)(v1 + 36);
  v11 = v1[76];
  v12 = v1[75];
  v13 = v1[73];
  v14 = v1[40];
  URLComponents.init()(v3);
  v1[29] = &_swiftEmptyArrayStorage;
  sub_1000066D4(v14, v13, &qword_1000198C0);
  v15 = *(unsigned int (**)(_QWORD, _QWORD, _QWORD))(v11 + 48);
  v451 = v1;
  v444 = v10;
  if (v15(v13, 1, v12) == 1)
  {
    v16 = sub_100006718(v1[73], &qword_1000198C0);
  }
  else
  {
    v25 = v1[80];
    v26 = v1[59];
    v27 = v1[60];
    v28 = v1[58];
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v1[76] + 32))(v25, v1[73], v1[75]);
    URLComponents.init(url:resolvingAgainstBaseURL:)(v25, 1);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v28, 1, v26) == 1)
    {
      v29 = v1[58];
      (*(void (**)(_QWORD, _QWORD))(v1[76] + 8))(v1[80], v1[75]);
      v16 = sub_100006718(v29, &qword_100019A60);
    }
    else
    {
      v30 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v1[60] + 32))(v1[61], v1[58], v1[59]);
      v31 = URLComponents.queryItems.getter(v30);
      if (v31)
      {
        v32 = v31;
        v438 = v15;
        v33 = *(_QWORD *)(v31 + 16);
        v34 = v1[80];
        if (v33)
        {
          ATURL.Parser.init()();
          v35 = type metadata accessor for ATPayload(0);
          v36 = sub_100006754(&qword_100019BB8, (uint64_t (*)(uint64_t))&type metadata accessor for ATPayload, (uint64_t)&protocol conformance descriptor for ATPayload);
          v37 = sub_100006754(&qword_100019BC0, (uint64_t (*)(uint64_t))&type metadata accessor for ATPayload, (uint64_t)&protocol conformance descriptor for ATPayload);
          v38 = ATURL.Parser.parse<A>(_:from:)(v35, v34, v35, v36, v37);
          v47 = *v428;
          v48 = (void *)ATPayload.question.getter(v38);
          v49 = ATQuestion.notificationText.getter();
          v51 = v50;

          if (!v51)
          {
            v53 = (void *)ATPayload.question.getter(v52);
            v49 = ATQuestion.summary.getter();
            v51 = v54;

          }
          v55 = v1[52];
          MessageDetails.notificationCaption.setter(v49, v51);

          v56 = v32 + ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80));
          swift_bridgeObjectRetain(v32);
          v57 = 0;
          while (1)
          {
            v58 = v57 + 1;
            if (__OFADD__(v57, 1))
              __break(1u);
            v59 = (*(uint64_t (**)(_QWORD, unint64_t, _QWORD))(v55 + 16))(v451[54], v56 + *(_QWORD *)(v55 + 72) * v57, v451[51]);
            v60 = URLQueryItem.name.getter(v59);
            v62 = v451[54];
            v63 = v451[51];
            if (v60 == 0x69616E626D756874 && v61 == 0xED0000617461446CLL)
              break;
            v65 = v61;
            v66 = _stringCompareWithSmolCheck(_:_:expecting:)(v60, v61, 0x69616E626D756874, 0xED0000617461446CLL, 0);
            swift_bridgeObjectRelease(v65);
            (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v62, v63);
            if ((v66 & 1) == 0)
            {
              ++v57;
              if (v58 != v33)
                continue;
            }
            goto LABEL_28;
          }
          swift_bridgeObjectRelease(0xED0000617461446CLL);
          (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v62, v63);
          v66 = 1;
LABEL_28:
          v1 = v451;
          v446 = v451[80];
          v67 = v451[76];
          v432 = v451[75];
          v69 = v451[60];
          v68 = v451[61];
          v70 = v451[59];
          v71 = v451[56];
          v72 = v451[57];
          v73 = v451[55];
          swift_bridgeObjectRelease(v32);
          (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v72, v73);
          (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v68, v70);
          (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v446, v432);
          v16 = swift_bridgeObjectRelease(v451[29]);
          v451[29] = v32;
          v15 = v438;
          v10 = v444;
          if ((v66 & 1) != 0)
          {
            v74 = static PeopleLogger.messages.getter(v16);
            v75 = Logger.logObject.getter(v74);
            v76 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v75, v76))
            {
              v77 = (uint8_t *)swift_slowAlloc(2, -1);
              *(_WORD *)v77 = 0;
              _os_log_impl((void *)&_mh_execute_header, v75, v76, "AskTo supplied the thumbnail data. Removing the existing thumbnailData.", v77, 2u);
              swift_slowDealloc(v77, -1, -1);
            }
            v78 = v451[50];
            v79 = v451[41];
            v80 = v451[42];

            (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v78, v79);
            v81 = 0;
            v82 = 0xF000000000000000;
            goto LABEL_37;
          }
        }
        else
        {
          v42 = v1[76];
          v43 = v1[75];
          v45 = v1[60];
          v44 = v1[61];
          v46 = v1[59];
          swift_bridgeObjectRelease(v31);
          (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
          v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 8))(v34, v43);
          v15 = v438;
        }
      }
      else
      {
        v39 = v1[80];
        v40 = v1[76];
        v41 = v1[75];
        (*(void (**)(_QWORD, _QWORD))(v1[60] + 8))(v1[61], v1[59]);
        v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 8))(v39, v41);
      }
    }
  }
  v83 = MessageDetails.thumbnailData.getter(v16);
  v85 = v84;
  v86 = sub_10000F488(v83, v84);
  if (v85 >> 60 != 15)
    goto LABEL_38;
  v87 = UIImagePNGRepresentation(v10);
  if (v87)
  {
    v88 = v87;
    v89 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v87);
    v91 = v90;

  }
  else
  {
    v89 = 0;
    v91 = 0xF000000000000000;
  }
  v81 = v89;
  v82 = v91;
LABEL_37:
  v86 = MessageDetails.thumbnailData.setter(v81, v82);
LABEL_38:
  v92 = v1 + 8;
  v455 = MessageDetails.queryItems.getter(v86);
  static PeopleLogger.messages.getter(v455);
  v93 = v1[29];
  v94 = swift_bridgeObjectRetain_n(v93, 3);
  v95 = Logger.logObject.getter(v94);
  v96 = static os_log_type_t.default.getter();
  v425 = v1 + 34;
  v433 = v1 + 29;
  if (os_log_type_enabled(v95, v96))
  {
    v405 = v96;
    v415 = v95;
    v420 = v1 + 8;
    v439 = v15;
    v97 = swift_slowAlloc(22, -1);
    v401 = swift_slowAlloc(32, -1);
    v456 = v401;
    *(_DWORD *)v97 = 134218242;
    v1[34] = *(_QWORD *)(v93 + 16);
    v397 = v1 + 35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 34, v1 + 35, v97 + 4, v97 + 12);
    swift_bridgeObjectRelease(v93);
    v410 = (uint8_t *)v97;
    *(_WORD *)(v97 + 12) = 2080;
    v98 = *(_QWORD *)(v93 + 16);
    v99 = &_swiftEmptyArrayStorage;
    if (v98)
    {
      v100 = v1[52];
      v457[0] = (uint64_t)&_swiftEmptyArrayStorage;
      swift_bridgeObjectRetain(v93);
      sub_100009BD4(0, v98, 0);
      v101 = v93 + ((*(unsigned __int8 *)(v100 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v100 + 80));
      v447 = *(_QWORD *)(v100 + 72);
      v102 = v100;
      v103 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v100 + 16);
      do
      {
        v104 = v451[53];
        v105 = v451[51];
        v106 = v103(v104, v101, v105);
        v107 = URLQueryItem.name.getter(v106);
        v109 = v108;
        (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v104, v105);
        v99 = (_QWORD *)v457[0];
        if ((swift_isUniquelyReferenced_nonNull_native(v457[0]) & 1) == 0)
        {
          sub_100009BD4(0, *(_QWORD *)(v457[0] + 16) + 1, 1);
          v99 = (_QWORD *)v457[0];
        }
        v111 = v99[2];
        v110 = v99[3];
        if (v111 >= v110 >> 1)
        {
          sub_100009BD4(v110 > 1, v111 + 1, 1);
          v99 = (_QWORD *)v457[0];
        }
        v99[2] = v111 + 1;
        v112 = (char *)&v99[2 * v111];
        *((_QWORD *)v112 + 4) = v107;
        *((_QWORD *)v112 + 5) = v109;
        v101 += v447;
        --v98;
      }
      while (v98);
      swift_bridgeObjectRelease(v93);
      v1 = v451;
    }
    v117 = v1[49];
    v118 = v1[41];
    v119 = v1[42];
    v120 = Array.description.getter(v99, &type metadata for String);
    v122 = v121;
    swift_bridgeObjectRelease(v99);
    v1[35] = sub_100006F70(v120, v122, &v456);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v397, v428, v410 + 14, v410 + 22);
    swift_bridgeObjectRelease(v122);
    swift_bridgeObjectRelease_n(v93, 2);
    _os_log_impl((void *)&_mh_execute_header, v415, v405, "Appending %ld additional components to conversation url: %s", v410, 0x16u);
    swift_arrayDestroy(v401, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v401, -1, -1);
    swift_slowDealloc(v410, -1, -1);

    v116 = *(void (**)(uint64_t, uint64_t))(v119 + 8);
    v116(v117, v118);
    v15 = v439;
    v10 = v444;
    v92 = v420;
  }
  else
  {
    v113 = v1[49];
    v114 = v1[41];
    v115 = v1[42];
    swift_bridgeObjectRelease_n(v93, 3);

    v116 = *(void (**)(uint64_t, uint64_t))(v115 + 8);
    v116(v113, v114);
  }
  v123 = v1[75];
  v124 = v1[72];
  swift_beginAccess(v433, v92, 0, 0);
  sub_1000097E8(v1[29]);
  v125 = URLComponents.queryItems.setter(v455);
  URLComponents.url.getter(v125);
  if (v15(v124, 1, v123) == 1)
  {
    v126 = v1[102];
    v127 = v1[100];
    v128 = v1[98];
    v129 = v1[96];
    v434 = v1[91];
    v440 = (void (*)(uint64_t, uint64_t))v1[95];
    v448 = v1[90];
    v452 = v1[92];
    v130 = v1[89];
    v131 = v1[83];
    v132 = v1;
    v133 = v1[72];
    v134 = v132[62];
    v136 = v132[59];
    v135 = v132[60];
    swift_bridgeObjectRelease(v129);
    swift_bridgeObjectRelease(v128);
    swift_bridgeObjectRelease(v127);
    swift_bridgeObjectRelease(v126);
    sub_100006718(v133, &qword_1000198C0);
    v369 = static PeopleErrors.createError(_:code:)(0xD00000000000001CLL, 0x8000000100012690, 500);
    swift_willThrow(v369);
    (*(void (**)(uint64_t, uint64_t))(v135 + 8))(v134, v136);
    v440(v130, v131);
    (*(void (**)(uint64_t, uint64_t))(v434 + 8))(v452, v448);
LABEL_105:

    v342 = v132[89];
    v343 = v132[88];
    v344 = v132[87];
    v345 = v132[86];
    v346 = v132[85];
    v347 = v132[82];
    v348 = v132[81];
    v349 = v132[80];
    v350 = v132[79];
    v373 = v132[78];
    v375 = v132[77];
    v377 = v132[74];
    v379 = v132[73];
    v381 = v132[72];
    v383 = v132[71];
    v385 = v132[70];
    v387 = v132[69];
    v389 = v132[68];
    v391 = v132[67];
    v393 = v132[65];
    v396 = v132[62];
    v400 = v132[61];
    v404 = v132[58];
    v409 = (uint64_t *)v132[57];
    v414 = v132[54];
    v419 = v132[53];
    v424 = v132[50];
    v427 = v132[49];
    v431 = v132[48];
    v437 = v132[47];
    v443 = v132[46];
    v445 = v132[45];
    v450 = v132[44];
    v454 = v132[43];
    swift_task_dealloc(v132[92]);
    swift_task_dealloc(v342);
    swift_task_dealloc(v343);
    swift_task_dealloc(v344);
    swift_task_dealloc(v345);
    swift_task_dealloc(v346);
    swift_task_dealloc(v347);
    swift_task_dealloc(v348);
    swift_task_dealloc(v349);
    swift_task_dealloc(v350);
    swift_task_dealloc(v373);
    swift_task_dealloc(v375);
    swift_task_dealloc(v377);
    swift_task_dealloc(v379);
    swift_task_dealloc(v381);
    swift_task_dealloc(v383);
    swift_task_dealloc(v385);
    swift_task_dealloc(v387);
    swift_task_dealloc(v389);
    swift_task_dealloc(v391);
    swift_task_dealloc(v393);
    swift_task_dealloc(v396);
    swift_task_dealloc(v400);
    swift_task_dealloc(v404);
    swift_task_dealloc(v409);
    swift_task_dealloc(v414);
    swift_task_dealloc(v419);
    swift_task_dealloc(v424);
    swift_task_dealloc(v427);
    swift_task_dealloc(v431);
    swift_task_dealloc(v437);
    swift_task_dealloc(v443);
    swift_task_dealloc(v445);
    swift_task_dealloc(v450);
    swift_task_dealloc(v454);
    return ((uint64_t (*)(void))v132[1])();
  }
  v429 = v1 + 31;
  v137 = *((unsigned __int8 *)v1 + 864);
  v138 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v1[76] + 32))(v1[79], v1[72], v1[75]);
  v449 = v116;
  if (v137 != 1)
  {
    v159 = objc_msgSend(objc_allocWithZone((Class)MSMessageTemplateLayout), "init");
    MessageDetails.notificationCaption.getter(objc_msgSend(v159, "setImage:", v10));
    v161 = v160;
    v162 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v161);
    objc_msgSend(v159, "setCaption:", v162);

    v163 = objc_msgSend(objc_allocWithZone((Class)MSMessageLiveLayout), "initWithAlternateLayout:", v159);
    goto LABEL_89;
  }
  v139 = v1[89];
  v140 = v1[87];
  v141 = v1 + 33;
  v142 = v1[84];
  v143 = v1[83];
  static PeopleLogger.messages.getter(v138);
  v144 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v142 + 16))(v140, v139, v143);
  v145 = Logger.logObject.getter(v144);
  v146 = static os_log_type_t.debug.getter();
  v147 = os_log_type_enabled(v145, v146);
  v148 = (void (*)(uint64_t, uint64_t))v1[95];
  v149 = v1[87];
  v150 = v1;
  v151 = v1[83];
  v152 = v150[48];
  v153 = v150[41];
  v441 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v15;
  v406 = v141;
  if (v147)
  {
    v394 = v148;
    v154 = (uint8_t *)swift_slowAlloc(12, -1);
    v398 = v153;
    v155 = swift_slowAlloc(32, -1);
    v457[0] = v155;
    *(_DWORD *)v154 = 136315138;
    v156 = MessageDetails.EventSource.rawValue.getter();
    v158 = v157;
    *v141 = sub_100006F70(v156, v157, v457);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v141, v425, v154 + 4, v154 + 12);
    swift_bridgeObjectRelease(v158);
    v394(v149, v151);
    _os_log_impl((void *)&_mh_execute_header, v145, v146, "Using LP fallback for %s", v154, 0xCu);
    swift_arrayDestroy(v155, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v155, -1, -1);
    swift_slowDealloc(v154, -1, -1);

    v116(v152, v398);
  }
  else
  {
    v148(v149, v151);

    v116(v152, v153);
  }
  v1 = v451;
  v164 = v451[94];
  v165 = v451[83];
  v166 = enum case for MessageDetails.EventSource.screenTime(_:);
  ((void (*)(_QWORD, _QWORD, uint64_t))v451[93])(v451[86], enum case for MessageDetails.EventSource.screenTime(_:), v165);
  dispatch thunk of RawRepresentable.rawValue.getter(v165, v164);
  dispatch thunk of RawRepresentable.rawValue.getter(v165, v164);
  v167 = v451[21];
  v168 = v451[22];
  v169 = v451[23];
  v170 = v451[24];
  v171 = (uint64_t (*)(uint64_t, uint64_t))v451[95];
  v172 = v451[86];
  v173 = v451[83];
  if (v167 != v169 || v168 != v170)
  {
    v174 = _stringCompareWithSmolCheck(_:_:expecting:)(v167, v451[22], v169, v451[24], 0);
    swift_bridgeObjectRelease(v170);
    swift_bridgeObjectRelease(v168);
    v175 = v171(v172, v173);
    if ((v174 & 1) != 0)
      goto LABEL_60;
    MessageDetails.title.getter(v175);
    v190 = v189;
    v191 = String.trim()();
    v192 = swift_bridgeObjectRelease(v190);
    v194 = static MessageDetails.titleFallbackKey.getter(v192);
    v195 = v193;
    if (v191._countAndFlagsBits == v194 && v191._object == v193)
    {
      v196 = swift_bridgeObjectRelease_n(v191._object, 2);
      v188 = v441;
    }
    else
    {
      v197 = _stringCompareWithSmolCheck(_:_:expecting:)(v191._countAndFlagsBits, v191._object, v194, v193, 0);
      swift_bridgeObjectRelease(v191._object);
      v196 = swift_bridgeObjectRelease(v195);
      v188 = v441;
      if ((v197 & 1) == 0)
      {
        MessageDetails.title.getter(v196);
        goto LABEL_67;
      }
    }
    MessageDetails.notificationCaption.getter(v196);
LABEL_67:
    v435 = v198;
    goto LABEL_68;
  }
  swift_bridgeObjectRelease_n(v451[22], 2);
  v171(v172, v173);
LABEL_60:
  v176 = String.localized.getter(0xD00000000000001BLL, 0x80000001000126E0);
  v178 = v177;
  v179 = sub_100006600(&qword_100019BA8);
  v180 = swift_allocObject(v179, 112, 7);
  *(_OWORD *)(v180 + 16) = xmmword_100012B60;
  v181 = MessageDetails.childName.getter();
  v183 = v182;
  *(_QWORD *)(v180 + 56) = &type metadata for String;
  v184 = sub_10000F56C();
  *(_QWORD *)(v180 + 64) = v184;
  *(_QWORD *)(v180 + 32) = v181;
  *(_QWORD *)(v180 + 40) = v183;
  v185 = MessageDetails.title.getter(v184);
  *(_QWORD *)(v180 + 96) = &type metadata for String;
  *(_QWORD *)(v180 + 104) = v184;
  *(_QWORD *)(v180 + 72) = v185;
  *(_QWORD *)(v180 + 80) = v186;
  String.init(format:_:)(v176, v178, v180);
  v435 = v187;
  swift_bridgeObjectRelease(v178);
  v188 = v441;
LABEL_68:
  v199 = v451[94];
  v200 = (void (*)(uint64_t, uint64_t, uint64_t))v451[93];
  v201 = v451[85];
  v202 = v451[83];
  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v451[76] + 56))(v451[71], 1, 1, v451[75]);
  v200(v201, v166, v202);
  dispatch thunk of RawRepresentable.rawValue.getter(v202, v199);
  dispatch thunk of RawRepresentable.rawValue.getter(v202, v199);
  v203 = v451[25];
  v204 = v451[26];
  v205 = v451[27];
  v206 = v451[28];
  v207 = (void (*)(uint64_t, uint64_t))v451[95];
  v208 = v451[85];
  v209 = v451[83];
  if (v203 == v205 && v204 == v206)
  {
    swift_bridgeObjectRelease_n(v451[26], 2);
    v207(v208, v209);
    v116 = v449;
  }
  else
  {
    v210 = _stringCompareWithSmolCheck(_:_:expecting:)(v203, v451[26], v205, v451[28], 0);
    swift_bridgeObjectRelease(v206);
    swift_bridgeObjectRelease(v204);
    v207(v208, v209);
    v116 = v449;
    if ((v210 & 1) == 0)
    {
      type metadata accessor for ServerFeatureFlag(0);
      v211 = static ServerFeatureFlag.shared.getter();
      ServerFeatureFlag.lpForAskToBuyFallback.getter();
      goto LABEL_74;
    }
  }
  type metadata accessor for ServerFeatureFlag(0);
  v211 = static ServerFeatureFlag.shared.getter();
  ServerFeatureFlag.lpForScreenTimeFallback.getter();
LABEL_74:
  v213 = v212;
  swift_release(v211);
  v214 = String.trimToNil()();
  swift_bridgeObjectRelease(v213);
  if (v214.value._object)
  {
    v215 = v451[71];
    v216 = v451[70];
    URL.init(string:)(v214.value._countAndFlagsBits, v214.value._object);
    swift_bridgeObjectRelease(v214.value._object);
    sub_10000F4E0(v216, v215);
  }
  v217 = v451 + 2;
  v218 = v451[75];
  v219 = v451[69];
  sub_1000066D4(v451[71], v219, &qword_1000198C0);
  LODWORD(v218) = v188(v219, 1, v218);
  v220 = sub_100006718(v219, &qword_1000198C0);
  if ((_DWORD)v218 == 1)
  {
    v221 = v451[71];
    v222 = v451[70];
    URL.init(string:)(v451[99], v451[100]);
    v220 = sub_10000F4E0(v222, v221);
  }
  v223 = static PeopleLogger.messages.getter(v220);
  v224 = Logger.logObject.getter(v223);
  v225 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v224, v225))
  {
    v421 = v451 + 32;
    v226 = v451[75];
    v227 = v451[71];
    v228 = (uint8_t *)swift_slowAlloc(12, -1);
    v229 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v228 = 138412290;
    swift_beginAccess(v227, v451 + 5, 0, 0);
    if (v441(v227, 1, v226))
    {
      *v429 = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v429, v421, v228 + 4, v228 + 12);
      v230 = 0;
    }
    else
    {
      v231 = v451[78];
      v232 = v451[76];
      v233 = v451[75];
      v234 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v232 + 16))(v231, v451[71], v233);
      v235 = URL.absoluteString.getter(v234);
      v411 = v236;
      v416 = v235;
      v237 = *(void (**)(uint64_t, uint64_t))(v232 + 8);
      v217 = v451 + 2;
      v237(v231, v233);
      v238 = sub_10000F528();
      v239 = swift_allocError(&type metadata for String, v238, 0, 0);
      *v240 = v416;
      v240[1] = v411;
      v230 = _swift_stdlib_bridgeErrorToNSError(v239);
      v451[32] = v230;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v421, v406, v228 + 4, v228 + 12);
    }
    *v229 = v230;
    _os_log_impl((void *)&_mh_execute_header, v224, v225, "alternate url %@", v228, 0xCu);
    v241 = sub_100006600(&qword_100019A90);
    swift_arrayDestroy(v229, 1, v241);
    swift_slowDealloc(v229, -1, -1);
    swift_slowDealloc(v228, -1, -1);
    v116 = v449;
    v1 = v451;
  }
  v242 = v1[75];
  v243 = v1[71];
  v244 = v1[68];
  v245 = v1[47];
  v246 = v1[41];

  v116(v245, v246);
  swift_beginAccess(v243, v217, 0, 0);
  sub_1000066D4(v243, v244, &qword_1000198C0);
  v248 = 0;
  if (v441(v244, 1, v242) != 1)
  {
    v249 = v1[76];
    v250 = v1[75];
    v251 = v1[68];
    URL._bridgeToObjectiveC()(v247);
    v248 = v252;
    (*(void (**)(uint64_t, uint64_t))(v249 + 8))(v251, v250);
  }
  v253 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v435);
  v10 = v444;
  v254 = UIImagePNGRepresentation(v444);
  if (v254)
  {
    v255 = v254;
    v256 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v254);
    v258 = v257;

    v259.super.isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100006690(v256, v258);
  }
  else
  {
    v259.super.isa = 0;
  }
  v260 = v1[102];
  v261 = v1[101];
  v262 = v1[71];
  v263 = objc_msgSend((id)objc_opt_self(PPLMessageRichLinkLayout), "createRichLinkLayoutWithURL:title:imageData:", v248, v253, v259.super.isa);

  v264 = objc_msgSend(objc_allocWithZone((Class)MSMessageLiveLayout), "initWithAlternateLayout:", v263);
  v265 = sub_100006600(&qword_100019B98);
  v266 = swift_allocObject(v265, 48, 7);
  *(_OWORD *)(v266 + 16) = xmmword_100012B70;
  *(_QWORD *)(v266 + 32) = v261;
  *(_QWORD *)(v266 + 40) = v260;
  swift_bridgeObjectRetain(v260);
  v163 = v264;
  v267 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v266);
  objc_msgSend(v163, "setPpl_requiredCapabilities:", v267);

  sub_100006718(v262, &qword_1000198C0);
LABEL_89:
  v436 = v163;
  v268 = objc_msgSend(objc_allocWithZone((Class)MSSession), "init");
  v269 = objc_msgSend(objc_allocWithZone((Class)MSMessage), "initWithSession:", v268);

  URL._bridgeToObjectiveC()(v270);
  v272 = v271;
  objc_msgSend(v269, "setURL:", v271);

  MessageDetails.notificationCaption.getter(objc_msgSend(v269, "setLayout:", v163));
  v274 = v273;
  v275 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v274);
  objc_msgSend(v269, "setSummaryText:", v275);

  static PeopleLogger.messages.getter(v276);
  v277 = v269;
  v278 = Logger.logObject.getter(v277);
  v279 = static os_log_type_t.debug.getter();
  v442 = v277;
  if (os_log_type_enabled(v278, v279))
  {
    v280 = (uint8_t *)swift_slowAlloc(12, -1);
    v281 = swift_slowAlloc(32, -1);
    v457[0] = v281;
    *(_DWORD *)v280 = 136315138;
    v282 = objc_msgSend(v277, "URL");
    if (v282)
    {
      v283 = v282;
      v284 = v1 + 30;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      v285 = 0;
    }
    else
    {
      v284 = v1 + 30;
      v285 = 1;
    }
    v288 = v1[76];
    v289 = v1[75];
    v290 = v451[67];
    v291 = v451[66];
    v292 = v451[46];
    v293 = v451[41];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v288 + 56))(v290, v285, 1, v289);
    v294 = String.init<A>(describing:)(v290, v291);
    v296 = v295;
    v451[30] = sub_100006F70(v294, v295, v457);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v284, v429, v280 + 4, v280 + 12);
    v297 = v296;
    v1 = v451;
    swift_bridgeObjectRelease(v297);
    v277 = v442;

    _os_log_impl((void *)&_mh_execute_header, v278, v279, "message url %s", v280, 0xCu);
    swift_arrayDestroy(v281, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v281, -1, -1);
    swift_slowDealloc(v280, -1, -1);

    v449(v292, v293);
    v10 = v444;
  }
  else
  {
    v286 = v1[46];
    v287 = v1[41];

    v116(v286, v287);
  }
  v298 = v10;
  v299 = UIImageJPEGRepresentation(v298, 0.4);
  v300 = (Class)v299;
  v444 = v298;
  if (v299)
  {
    v301 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v299);
    v303 = v302;

    sub_10000F49C(v301, v303);
    v300 = Data._bridgeToObjectiveC()().super.isa;
    v426 = v301;
    v430 = v303;
    sub_100006690(v301, v303);
  }
  else
  {

    v426 = 0;
    v430 = 0xF000000000000000;
  }
  v304 = v1[100];
  v305 = v1[98];
  v306 = v1[97];
  v307 = v1[96];
  swift_bridgeObjectRelease(v1[102]);
  swift_bridgeObjectRelease(v304);
  swift_bridgeObjectRelease(v307);
  String.localized.getter(v306, v305);
  v309 = v308;
  swift_bridgeObjectRelease(v305);
  v310 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v309);
  v311 = objc_msgSend(v277, "ppl_pluginPayloadWithAppIconData:appName:allowDataPayloads:", v300, v310, 0);

  v312 = objc_msgSend(v311, "data");
  if (!v312)
  {
    v330 = static PeopleLogger.messages.getter(v313);
    v331 = Logger.logObject.getter(v330);
    v332 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v331, (os_log_type_t)v332))
    {
      v333 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v333 = 0;
      _os_log_impl((void *)&_mh_execute_header, v331, (os_log_type_t)v332, "Message _pluginPayload create failed", v333, 2u);
      swift_slowDealloc(v333, -1, -1);
    }
    v453 = v1[92];
    v413 = v1[91];
    v418 = (void (*)(uint64_t, uint64_t))v1[95];
    v423 = v1[90];
    v403 = v1[83];
    v408 = (uint64_t *)v1[89];
    v334 = v1[79];
    v335 = v1[76];
    v336 = v1[75];
    v132 = v1;
    v337 = v1[62];
    v339 = v132[59];
    v338 = v132[60];
    v340 = v132[44];
    v341 = v132[41];

    v449(v340, v341);
    v371 = static PeopleErrors.createError(_:code:)(0xD000000000000024, 0x80000001000126B0, 500);
    swift_willThrow(v371);

    sub_10000F488(v426, v430);
    (*(void (**)(uint64_t, uint64_t))(v335 + 8))(v334, v336);
    (*(void (**)(uint64_t, uint64_t))(v338 + 8))(v337, v339);
    v418((uint64_t)v408, v403);
    (*(void (**)(uint64_t, uint64_t))(v413 + 8))(v453, v423);
    goto LABEL_105;
  }
  v314 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v312);
  v351 = v315;
  v352 = v314;

  v317 = static PeopleLogger.messages.getter(v316);
  v318 = Logger.logObject.getter(v317);
  v319 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v318, v319))
  {
    v320 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v320 = 0;
    _os_log_impl((void *)&_mh_execute_header, v318, v319, "SPI Payload successful!", v320, 2u);
    swift_slowDealloc(v320, -1, -1);
  }
  v321 = v1[92];
  v355 = v1[91];
  v356 = (void (*)(uint64_t, uint64_t))v1[95];
  v357 = v1[90];
  v322 = v451[89];
  v358 = v451[88];
  v359 = v451[87];
  v360 = v451[86];
  v361 = v451[85];
  v354 = v451[83];
  v362 = v451[82];
  v363 = v451[81];
  v364 = v451[80];
  v353 = v451[79];
  v365 = v451[78];
  v366 = v451[77];
  v323 = v451[76];
  v324 = v451[75];
  v367 = v451[74];
  v368 = v451[73];
  v370 = v451[72];
  v372 = v451[71];
  v374 = v451[70];
  v376 = v451[69];
  v378 = v451[68];
  v380 = v451[67];
  v382 = v451[65];
  v325 = v451[62];
  v384 = v451[61];
  v326 = v451[60];
  v327 = v451[59];
  v386 = v451[58];
  v388 = v451[57];
  v390 = v451[54];
  v392 = v451[53];
  v395 = v451[50];
  v399 = v451[49];
  v402 = v451[48];
  v407 = (uint64_t *)v451[47];
  v328 = v451[45];
  v412 = v451[46];
  v417 = v451[44];
  v422 = v451[43];
  v329 = v451[41];

  sub_10000F488(v426, v430);
  v449(v328, v329);
  (*(void (**)(uint64_t, uint64_t))(v323 + 8))(v353, v324);
  (*(void (**)(uint64_t, uint64_t))(v326 + 8))(v325, v327);
  v356(v322, v354);
  (*(void (**)(uint64_t, uint64_t))(v355 + 8))(v321, v357);

  swift_task_dealloc(v321);
  swift_task_dealloc(v322);
  swift_task_dealloc(v358);
  swift_task_dealloc(v359);
  swift_task_dealloc(v360);
  swift_task_dealloc(v361);
  swift_task_dealloc(v362);
  swift_task_dealloc(v363);
  swift_task_dealloc(v364);
  swift_task_dealloc(v353);
  swift_task_dealloc(v365);
  swift_task_dealloc(v366);
  swift_task_dealloc(v367);
  swift_task_dealloc(v368);
  swift_task_dealloc(v370);
  swift_task_dealloc(v372);
  swift_task_dealloc(v374);
  swift_task_dealloc(v376);
  swift_task_dealloc(v378);
  swift_task_dealloc(v380);
  swift_task_dealloc(v382);
  swift_task_dealloc(v325);
  swift_task_dealloc(v384);
  swift_task_dealloc(v386);
  swift_task_dealloc(v388);
  swift_task_dealloc(v390);
  swift_task_dealloc(v392);
  swift_task_dealloc(v395);
  swift_task_dealloc(v399);
  swift_task_dealloc(v402);
  swift_task_dealloc(v407);
  swift_task_dealloc(v412);
  swift_task_dealloc(v328);
  swift_task_dealloc(v417);
  swift_task_dealloc(v422);
  return ((uint64_t (*)(uint64_t, uint64_t))v451[1])(v352, v351);
}

uint64_t sub_10000D170(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = (_QWORD *)*v2;
  v3[14] = v2;
  v3[15] = a1;
  v3[16] = a2;
  v4 = v3[106];
  v5 = v3[65];
  v6 = v3[63];
  v7 = v3[64];
  if (v3[105])
    v8 = v3[105];
  else
    v8 = 0xE000000000000000;
  v3[107] = a2;
  swift_task_dealloc(v4);
  swift_bridgeObjectRelease(v8);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return swift_task_switch(sub_10000D23C, 0, 0);
}

uint64_t sub_10000D23C()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  id v4;
  Class isa;
  UIImage *v6;
  NSString v7;
  void **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(_QWORD, _QWORD, _QWORD);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  NSData *v77;
  NSData *v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  os_log_type_t v86;
  uint64_t v87;
  int64_t v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void (*v106)(uint64_t, uint64_t);
  uint64_t v107;
  void **v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v133;
  os_log_type_t v134;
  _BOOL4 v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint8_t *v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;
  unint64_t v144;
  _QWORD *v145;
  uint64_t v146;
  uint64_t v147;
  id v148;
  uint64_t v149;
  uint64_t v150;
  NSString v151;
  id v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t (*v158)(uint64_t, uint64_t);
  uint64_t v159;
  uint64_t v160;
  char v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t (*v175)(uint64_t, uint64_t, uint64_t);
  uint64_t v176;
  uint64_t v177;
  Swift::String v178;
  uint64_t v179;
  void *v180;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  char v184;
  uint64_t v185;
  uint64_t v186;
  void (*v187)(uint64_t, uint64_t, uint64_t);
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void (*v194)(uint64_t, uint64_t);
  uint64_t v195;
  uint64_t v196;
  char v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  Swift::String_optional v201;
  uint64_t v202;
  uint64_t v203;
  _QWORD *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  NSObject *v211;
  os_log_type_t v212;
  _QWORD *v213;
  uint64_t v214;
  _QWORD *v215;
  uint64_t v216;
  uint8_t *v217;
  uint64_t *v218;
  uint64_t v219;
  uint64_t v220;
  _QWORD *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  void (*v227)(uint64_t, uint64_t);
  unint64_t v228;
  uint64_t v229;
  uint64_t *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  NSURL *v237;
  void *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  NSString v243;
  NSData *v244;
  NSData *v245;
  uint64_t v246;
  unint64_t v247;
  unint64_t v248;
  NSData v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  id v253;
  id v254;
  uint64_t v255;
  uint64_t v256;
  Class v257;
  id v258;
  id v259;
  NSURL *v260;
  void *v261;
  void *v262;
  uint64_t v263;
  uint64_t v264;
  NSString v265;
  uint64_t v266;
  id v267;
  NSObject *v268;
  os_log_type_t v269;
  _QWORD *v270;
  uint8_t *v271;
  uint64_t v272;
  id v273;
  void *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  unint64_t v285;
  unint64_t v286;
  uint64_t v287;
  UIImage *v288;
  NSData *v289;
  NSData *v290;
  uint64_t v291;
  unint64_t v292;
  unint64_t v293;
  NSData v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  NSString v301;
  id v302;
  id v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  NSObject *v309;
  os_log_type_t v310;
  uint8_t *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v322;
  NSObject *v323;
  uint64_t v324;
  uint8_t *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  void (*v348)(uint64_t, uint64_t);
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  void (*v387)(uint64_t, uint64_t);
  uint64_t v388;
  uint64_t v389;
  void **v390;
  void **v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  _QWORD *v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  _QWORD *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  os_log_type_t v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint8_t *v409;
  uint64_t v410;
  uint64_t v411;
  void (*v412)(uint64_t, uint64_t);
  uint64_t v413;
  NSObject *v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  _QWORD *v418;
  _QWORD *v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  _QWORD *v423;
  uint64_t v424;
  unint64_t v425;
  uint64_t v426;
  uint64_t v427;
  _QWORD *v428;
  uint64_t v429;
  void (*v430)(uint64_t, uint64_t);
  uint64_t v431;
  unsigned int (*v432)(_QWORD, _QWORD, _QWORD);
  unsigned int (*v433)(_QWORD, _QWORD, _QWORD);
  void (*v434)(uint64_t, uint64_t);
  uint64_t (*v435)(uint64_t, uint64_t, uint64_t);
  void *v436;
  uint64_t v437;
  UIImage *v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  _QWORD *v444;
  void *v445;
  uint64_t v446;
  _QWORD *v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453[3];

  v1 = v0;
  v2 = v0[107];
  if (v2 >> 60 == 15
    || (v3 = v0[15],
        v4 = objc_allocWithZone((Class)UIImage),
        isa = Data._bridgeToObjectiveC()().super.isa,
        v6 = (UIImage *)objc_msgSend(v4, "initWithData:", isa),
        sub_10000F488(v3, v2),
        isa,
        !v6))
  {
    v7 = String._bridgeToObjectiveC()();
    v6 = (UIImage *)objc_msgSend((id)objc_opt_self(UIImage), "imageNamed:", v7);

  }
  v8 = (void **)(v0 + 36);
  v9 = v0[76];
  v10 = v1[75];
  v11 = v1[73];
  v12 = v1[40];
  URLComponents.init()();
  v1[29] = &_swiftEmptyArrayStorage;
  sub_1000066D4(v12, v11, &qword_1000198C0);
  v13 = *(unsigned int (**)(_QWORD, _QWORD, _QWORD))(v9 + 48);
  v447 = v1;
  v438 = v6;
  if (v13(v11, 1, v10) == 1)
  {
    v14 = sub_100006718(v1[73], &qword_1000198C0);
  }
  else
  {
    v15 = v1[80];
    v16 = v1[59];
    v17 = v1[60];
    v18 = v1[58];
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v1[76] + 32))(v15, v1[73], v1[75]);
    URLComponents.init(url:resolvingAgainstBaseURL:)(v15, 1);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v18, 1, v16) == 1)
    {
      v19 = v1[58];
      (*(void (**)(_QWORD, _QWORD))(v1[76] + 8))(v1[80], v1[75]);
      v14 = sub_100006718(v19, &qword_100019A60);
    }
    else
    {
      v20 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v1[60] + 32))(v1[61], v1[58], v1[59]);
      v21 = URLComponents.queryItems.getter(v20);
      if (v21)
      {
        v432 = v13;
        v22 = *(_QWORD *)(v21 + 16);
        v23 = v1[80];
        if (v22)
        {
          v427 = v21;
          ATURL.Parser.init()();
          v24 = type metadata accessor for ATPayload(0);
          v25 = sub_100006754(&qword_100019BB8, (uint64_t (*)(uint64_t))&type metadata accessor for ATPayload, (uint64_t)&protocol conformance descriptor for ATPayload);
          v26 = sub_100006754(&qword_100019BC0, (uint64_t (*)(uint64_t))&type metadata accessor for ATPayload, (uint64_t)&protocol conformance descriptor for ATPayload);
          v27 = ATURL.Parser.parse<A>(_:from:)(v24, v23, v24, v25, v26);
          v36 = *v8;
          v37 = (void *)ATPayload.question.getter(v27);
          v38 = ATQuestion.notificationText.getter();
          v40 = v39;

          v390 = v8;
          if (!v40)
          {
            v42 = (void *)ATPayload.question.getter(v41);
            v38 = ATQuestion.summary.getter();
            v40 = v43;

          }
          v44 = v1[52];
          MessageDetails.notificationCaption.setter(v38, v40);

          v45 = v427 + ((*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80));
          swift_bridgeObjectRetain(v427);
          v46 = 0;
          while (1)
          {
            v47 = v46 + 1;
            if (__OFADD__(v46, 1))
              __break(1u);
            v48 = (*(uint64_t (**)(_QWORD, unint64_t, _QWORD))(v44 + 16))(v1[54], v45 + *(_QWORD *)(v44 + 72) * v46, v1[51]);
            v49 = URLQueryItem.name.getter(v48);
            v51 = v1[54];
            v52 = v1[51];
            if (v49 == 0x69616E626D756874 && v50 == 0xED0000617461446CLL)
              break;
            v54 = v50;
            v55 = ((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))();
            swift_bridgeObjectRelease(v54);
            (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v51, v52);
            if ((v55 & 1) == 0)
            {
              ++v46;
              if (v47 != v22)
                continue;
            }
            goto LABEL_25;
          }
          swift_bridgeObjectRelease(0xED0000617461446CLL);
          (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v51, v52);
          v55 = 1;
LABEL_25:
          v440 = v1[80];
          v56 = v1[76];
          v422 = v1[75];
          v58 = v1[60];
          v57 = v1[61];
          v59 = v1[59];
          v60 = v1[56];
          v61 = v1[57];
          v62 = v447[55];
          swift_bridgeObjectRelease(v427);
          v63 = v61;
          v1 = v447;
          (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v63, v62);
          (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v59);
          (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v440, v422);
          v14 = swift_bridgeObjectRelease(v447[29]);
          v447[29] = v427;
          v13 = v432;
          v6 = v438;
          v8 = v390;
          if ((v55 & 1) != 0)
          {
            v64 = static PeopleLogger.messages.getter(v14);
            v65 = Logger.logObject.getter(v64);
            v66 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v65, v66))
            {
              v67 = (uint8_t *)swift_slowAlloc(2, -1);
              *(_WORD *)v67 = 0;
              _os_log_impl((void *)&_mh_execute_header, v65, v66, "AskTo supplied the thumbnail data. Removing the existing thumbnailData.", v67, 2u);
              swift_slowDealloc(v67, -1, -1);
            }
            v68 = v447[50];
            v69 = v447[41];
            v70 = v447[42];

            (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v68, v69);
            v71 = 0;
            v72 = 0xF000000000000000;
            goto LABEL_35;
          }
        }
        else
        {
          v31 = v1[76];
          v32 = v1[75];
          v34 = v1[60];
          v33 = v1[61];
          v35 = v1[59];
          swift_bridgeObjectRelease(v21);
          (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v35);
          v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 8))(v23, v32);
          v13 = v432;
        }
      }
      else
      {
        v28 = v1[80];
        v29 = v1[76];
        v30 = v1[75];
        (*(void (**)(_QWORD, _QWORD))(v1[60] + 8))(v1[61], v1[59]);
        v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
      }
    }
  }
  v73 = MessageDetails.thumbnailData.getter(v14);
  v75 = v74;
  v76 = sub_10000F488(v73, v74);
  if (v75 >> 60 != 15)
    goto LABEL_36;
  if (v6 && (v77 = UIImagePNGRepresentation(v6)) != 0)
  {
    v78 = v77;
    v79 = ((uint64_t (*)(void))static Data._unconditionallyBridgeFromObjectiveC(_:))();
    v81 = v80;

  }
  else
  {
    v79 = 0;
    v81 = 0xF000000000000000;
  }
  v71 = v79;
  v72 = v81;
LABEL_35:
  v76 = MessageDetails.thumbnailData.setter(v71, v72);
LABEL_36:
  v82 = v1 + 8;
  v428 = v1 + 29;
  v451 = MessageDetails.queryItems.getter(v76);
  static PeopleLogger.messages.getter(v451);
  v83 = v1[29];
  v84 = swift_bridgeObjectRetain_n(v83, 3);
  v85 = Logger.logObject.getter(v84);
  v86 = static os_log_type_t.default.getter();
  v423 = v1 + 34;
  if (os_log_type_enabled(v85, v86))
  {
    v404 = v86;
    v414 = v85;
    v418 = v1 + 8;
    v433 = v13;
    v87 = swift_slowAlloc(22, -1);
    v399 = swift_slowAlloc(32, -1);
    v452 = v399;
    *(_DWORD *)v87 = 134218242;
    v1[34] = *(_QWORD *)(v83 + 16);
    v395 = v1 + 35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 34, v1 + 35, v87 + 4, v87 + 12);
    swift_bridgeObjectRelease(v83);
    v409 = (uint8_t *)v87;
    *(_WORD *)(v87 + 12) = 2080;
    v88 = *(_QWORD *)(v83 + 16);
    v89 = &_swiftEmptyArrayStorage;
    if (v88)
    {
      v391 = v8;
      v90 = v1[52];
      v453[0] = (uint64_t)&_swiftEmptyArrayStorage;
      swift_bridgeObjectRetain(v83);
      sub_100009BD4(0, v88, 0);
      v386 = v83;
      v91 = v83 + ((*(unsigned __int8 *)(v90 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v90 + 80));
      v441 = *(_QWORD *)(v90 + 72);
      v92 = v90;
      v93 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v90 + 16);
      do
      {
        v94 = v1[53];
        v95 = v1[51];
        v96 = v93(v94, v91, v95);
        v97 = URLQueryItem.name.getter(v96);
        v99 = v98;
        (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v94, v95);
        v89 = (_QWORD *)v453[0];
        if ((swift_isUniquelyReferenced_nonNull_native(v453[0]) & 1) == 0)
        {
          sub_100009BD4(0, *(_QWORD *)(v453[0] + 16) + 1, 1);
          v89 = (_QWORD *)v453[0];
        }
        v101 = v89[2];
        v100 = v89[3];
        if (v101 >= v100 >> 1)
        {
          sub_100009BD4(v100 > 1, v101 + 1, 1);
          v89 = (_QWORD *)v453[0];
        }
        v89[2] = v101 + 1;
        v102 = (char *)&v89[2 * v101];
        *((_QWORD *)v102 + 4) = v97;
        *((_QWORD *)v102 + 5) = v99;
        v1 = v447;
        v91 += v441;
        --v88;
      }
      while (v88);
      v107 = v386;
      swift_bridgeObjectRelease(v386);
      v108 = v391;
    }
    else
    {
      v108 = v8;
      v107 = v83;
    }
    v442 = v1[49];
    v109 = v1[41];
    v110 = v1[42];
    v111 = Array.description.getter(v89, &type metadata for String);
    v113 = v112;
    swift_bridgeObjectRelease(v89);
    v1[35] = sub_100006F70(v111, v113, &v452);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v395, v108, v409 + 14, v409 + 22);
    swift_bridgeObjectRelease(v113);
    swift_bridgeObjectRelease_n(v107, 2);
    _os_log_impl((void *)&_mh_execute_header, v414, v404, "Appending %ld additional components to conversation url: %s", v409, 0x16u);
    swift_arrayDestroy(v399, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v399, -1, -1);
    swift_slowDealloc(v409, -1, -1);

    v106 = *(void (**)(uint64_t, uint64_t))(v110 + 8);
    v106(v442, v109);
    v13 = v433;
    v6 = v438;
    v82 = v418;
  }
  else
  {
    v103 = v1[49];
    v104 = v1[41];
    v105 = v1[42];
    swift_bridgeObjectRelease_n(v83, 3);

    v106 = *(void (**)(uint64_t, uint64_t))(v105 + 8);
    v106(v103, v104);
  }
  v114 = v1[75];
  v115 = v1[72];
  swift_beginAccess(v428, v82, 0, 0);
  sub_1000097E8(v1[29]);
  v116 = URLComponents.queryItems.setter(v451);
  URLComponents.url.getter(v116);
  if (v13(v115, 1, v114) == 1)
  {
    v117 = v1[102];
    v118 = v1[100];
    v119 = v1[98];
    v429 = v1[91];
    v434 = (void (*)(uint64_t, uint64_t))v1[95];
    v443 = v1[90];
    v448 = v1[92];
    v120 = v1[89];
    v121 = v1[83];
    v122 = v1[72];
    v123 = v1[62];
    v124 = v1[59];
    v125 = v1[60];
    swift_bridgeObjectRelease(v1[96]);
    swift_bridgeObjectRelease(v119);
    swift_bridgeObjectRelease(v118);
    swift_bridgeObjectRelease(v117);
    sub_100006718(v122, &qword_1000198C0);
    v361 = static PeopleErrors.createError(_:code:)(0xD00000000000001CLL, 0x8000000100012690, 500);
    swift_willThrow(v361);
    (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v123, v124);
    v434(v120, v121);
    (*(void (**)(uint64_t, uint64_t))(v429 + 8))(v448, v443);
LABEL_107:

    v334 = v1[89];
    v335 = v1[88];
    v336 = v1[87];
    v337 = v1[86];
    v338 = v1[85];
    v339 = v1[82];
    v340 = v1[81];
    v341 = v1[80];
    v342 = v1[79];
    v365 = v1[78];
    v367 = v1[77];
    v369 = v1[74];
    v371 = v1[73];
    v373 = v1[72];
    v375 = v1[71];
    v377 = v1[70];
    v379 = v1[69];
    v381 = v1[68];
    v383 = v1[67];
    v385 = v1[65];
    v389 = v1[62];
    v394 = v1[61];
    v398 = v1[58];
    v403 = v1[57];
    v408 = v1[54];
    v413 = v1[53];
    v417 = v1[50];
    v421 = v1[49];
    v426 = v1[48];
    v431 = v1[47];
    v437 = v1[46];
    v439 = v1[45];
    v446 = v1[44];
    v450 = v1[43];
    swift_task_dealloc(v1[92]);
    swift_task_dealloc(v334);
    swift_task_dealloc(v335);
    swift_task_dealloc(v336);
    swift_task_dealloc(v337);
    swift_task_dealloc(v338);
    swift_task_dealloc(v339);
    swift_task_dealloc(v340);
    swift_task_dealloc(v341);
    swift_task_dealloc(v342);
    swift_task_dealloc(v365);
    swift_task_dealloc(v367);
    swift_task_dealloc(v369);
    swift_task_dealloc(v371);
    swift_task_dealloc(v373);
    swift_task_dealloc(v375);
    swift_task_dealloc(v377);
    swift_task_dealloc(v379);
    swift_task_dealloc(v381);
    swift_task_dealloc(v383);
    swift_task_dealloc(v385);
    swift_task_dealloc(v389);
    swift_task_dealloc(v394);
    swift_task_dealloc(v398);
    swift_task_dealloc(v403);
    swift_task_dealloc(v408);
    swift_task_dealloc(v413);
    swift_task_dealloc(v417);
    swift_task_dealloc(v421);
    swift_task_dealloc(v426);
    swift_task_dealloc(v431);
    swift_task_dealloc(v437);
    swift_task_dealloc(v439);
    swift_task_dealloc(v446);
    swift_task_dealloc(v450);
    return ((uint64_t (*)(void))v1[1])();
  }
  v419 = v1 + 31;
  v126 = *((unsigned __int8 *)v1 + 864);
  v127 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v1[76] + 32))(v1[79], v1[72], v1[75]);
  v430 = v106;
  if (v126 != 1)
  {
    v148 = objc_msgSend(objc_allocWithZone((Class)MSMessageTemplateLayout), "init");
    MessageDetails.notificationCaption.getter(objc_msgSend(v148, "setImage:", v6));
    v150 = v149;
    v151 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v150);
    objc_msgSend(v148, "setCaption:", v151);

    v152 = objc_msgSend(objc_allocWithZone((Class)MSMessageLiveLayout), "initWithAlternateLayout:", v148);
    goto LABEL_89;
  }
  v128 = v1[89];
  v129 = v1[87];
  v130 = v1[84];
  v131 = v1[83];
  static PeopleLogger.messages.getter(v127);
  v132 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v130 + 16))(v129, v128, v131);
  v133 = Logger.logObject.getter(v132);
  v134 = static os_log_type_t.debug.getter();
  v135 = os_log_type_enabled(v133, v134);
  v136 = v1[87];
  v137 = v1[83];
  v138 = v1[48];
  v139 = v1[41];
  v435 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v13;
  v400 = v1 + 33;
  if (v135)
  {
    v387 = (void (*)(uint64_t, uint64_t))v1[95];
    v140 = (uint8_t *)swift_slowAlloc(12, -1);
    v392 = v139;
    v141 = swift_slowAlloc(32, -1);
    v453[0] = v141;
    *(_DWORD *)v140 = 136315138;
    v142 = MessageDetails.EventSource.rawValue.getter();
    v144 = v143;
    v1[33] = sub_100006F70(v142, v143, v453);
    v145 = v1 + 33;
    v1 = v447;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v145, v423, v140 + 4, v140 + 12);
    swift_bridgeObjectRelease(v144);
    v387(v136, v137);
    _os_log_impl((void *)&_mh_execute_header, v133, v134, "Using LP fallback for %s", v140, 0xCu);
    swift_arrayDestroy(v141, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v141, -1, -1);
    swift_slowDealloc(v140, -1, -1);

    v147 = v392;
    v146 = v138;
  }
  else
  {
    ((void (*)(uint64_t, uint64_t))v1[95])(v136, v137);

    v146 = v138;
    v147 = v139;
  }
  v106 = v430;
  v430(v146, v147);
  v153 = v1[94];
  v154 = v1[83];
  v155 = enum case for MessageDetails.EventSource.screenTime(_:);
  ((void (*)(_QWORD, _QWORD, uint64_t))v1[93])(v1[86], enum case for MessageDetails.EventSource.screenTime(_:), v154);
  dispatch thunk of RawRepresentable.rawValue.getter(v154, v153);
  dispatch thunk of RawRepresentable.rawValue.getter(v154, v153);
  v156 = v1[22];
  v157 = v1[24];
  v158 = (uint64_t (*)(uint64_t, uint64_t))v1[95];
  v159 = v1[86];
  v160 = v1[83];
  if (v1[21] != v1[23] || v156 != v157)
  {
    v161 = ((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))();
    swift_bridgeObjectRelease(v157);
    swift_bridgeObjectRelease(v156);
    v162 = v158(v159, v160);
    if ((v161 & 1) != 0)
      goto LABEL_59;
    MessageDetails.title.getter(v162);
    v177 = v176;
    v178 = String.trim()();
    v179 = swift_bridgeObjectRelease(v177);
    v181 = static MessageDetails.titleFallbackKey.getter(v179);
    v182 = v180;
    if (v178._countAndFlagsBits == v181 && v178._object == v180)
    {
      v183 = swift_bridgeObjectRelease_n(v178._object, 2);
      v175 = v435;
    }
    else
    {
      v184 = _stringCompareWithSmolCheck(_:_:expecting:)(v178._countAndFlagsBits, v178._object, v181, v180, 0);
      swift_bridgeObjectRelease(v178._object);
      v183 = swift_bridgeObjectRelease(v182);
      v175 = v435;
      if ((v184 & 1) == 0)
      {
        MessageDetails.title.getter(v183);
        goto LABEL_66;
      }
    }
    MessageDetails.notificationCaption.getter(v183);
LABEL_66:
    v424 = v185;
    goto LABEL_67;
  }
  swift_bridgeObjectRelease_n(v1[22], 2);
  v158(v159, v160);
LABEL_59:
  v163 = String.localized.getter(0xD00000000000001BLL, 0x80000001000126E0);
  v165 = v164;
  v166 = sub_100006600(&qword_100019BA8);
  v167 = swift_allocObject(v166, 112, 7);
  *(_OWORD *)(v167 + 16) = xmmword_100012B60;
  v168 = MessageDetails.childName.getter();
  v170 = v169;
  *(_QWORD *)(v167 + 56) = &type metadata for String;
  v171 = sub_10000F56C();
  *(_QWORD *)(v167 + 64) = v171;
  *(_QWORD *)(v167 + 32) = v168;
  *(_QWORD *)(v167 + 40) = v170;
  v172 = MessageDetails.title.getter(v171);
  *(_QWORD *)(v167 + 96) = &type metadata for String;
  *(_QWORD *)(v167 + 104) = v171;
  v1 = v447;
  *(_QWORD *)(v167 + 72) = v172;
  *(_QWORD *)(v167 + 80) = v173;
  String.init(format:_:)(v163, v165, v167);
  v424 = v174;
  swift_bridgeObjectRelease(v165);
  v175 = v435;
LABEL_67:
  v186 = v1[94];
  v187 = (void (*)(uint64_t, uint64_t, uint64_t))v1[93];
  v188 = v1[85];
  v189 = v1[83];
  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v1[76] + 56))(v1[71], 1, 1, v1[75]);
  v187(v188, v155, v189);
  dispatch thunk of RawRepresentable.rawValue.getter(v189, v186);
  dispatch thunk of RawRepresentable.rawValue.getter(v189, v186);
  v190 = v1[25];
  v191 = v1[26];
  v192 = v1[27];
  v193 = v1[28];
  v194 = (void (*)(uint64_t, uint64_t))v1[95];
  v195 = v1[85];
  v196 = v1[83];
  if (v190 == v192 && v191 == v193)
  {
    swift_bridgeObjectRelease_n(v1[26], 2);
    v194(v195, v196);
  }
  else
  {
    v197 = _stringCompareWithSmolCheck(_:_:expecting:)(v190, v1[26], v192, v1[28], 0);
    swift_bridgeObjectRelease(v193);
    swift_bridgeObjectRelease(v191);
    v194(v195, v196);
    if ((v197 & 1) == 0)
    {
      type metadata accessor for ServerFeatureFlag(0);
      v198 = static ServerFeatureFlag.shared.getter();
      ServerFeatureFlag.lpForAskToBuyFallback.getter();
      goto LABEL_73;
    }
  }
  type metadata accessor for ServerFeatureFlag(0);
  v198 = static ServerFeatureFlag.shared.getter();
  ServerFeatureFlag.lpForScreenTimeFallback.getter();
LABEL_73:
  v200 = v199;
  swift_release(v198);
  v201 = String.trimToNil()();
  swift_bridgeObjectRelease(v200);
  if (v201.value._object)
  {
    v202 = v1[71];
    v203 = v1[70];
    URL.init(string:)(v201.value._countAndFlagsBits, v201.value._object);
    swift_bridgeObjectRelease(v201.value._object);
    sub_10000F4E0(v203, v202);
  }
  v204 = v1 + 2;
  v205 = v1[75];
  v206 = v1[69];
  sub_1000066D4(v1[71], v206, &qword_1000198C0);
  LODWORD(v205) = v175(v206, 1, v205);
  v207 = sub_100006718(v206, &qword_1000198C0);
  if ((_DWORD)v205 == 1)
  {
    v208 = v1[71];
    v209 = v1[70];
    URL.init(string:)(v1[99], v1[100]);
    v207 = sub_10000F4E0(v209, v208);
  }
  v210 = static PeopleLogger.messages.getter(v207);
  v211 = Logger.logObject.getter(v210);
  v212 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v211, v212))
  {
    v213 = v1 + 5;
    v444 = v1 + 32;
    v214 = v1[75];
    v215 = v1;
    v216 = v1[71];
    v217 = (uint8_t *)swift_slowAlloc(12, -1);
    v218 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v217 = 138412290;
    swift_beginAccess(v216, v213, 0, 0);
    if (v435(v216, 1, v214))
    {
      *v419 = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v419, v444, v217 + 4, v217 + 12);
      v219 = 0;
    }
    else
    {
      v220 = v215[78];
      v221 = v204;
      v222 = v215[76];
      v223 = v215[75];
      v224 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v222 + 16))(v220, v215[71], v223);
      v225 = URL.absoluteString.getter(v224);
      v405 = v226;
      v410 = v225;
      v227 = *(void (**)(uint64_t, uint64_t))(v222 + 8);
      v204 = v221;
      v227(v220, v223);
      v228 = sub_10000F528();
      v229 = swift_allocError(&type metadata for String, v228, 0, 0);
      *v230 = v410;
      v230[1] = v405;
      v219 = _swift_stdlib_bridgeErrorToNSError(v229);
      v215[32] = v219;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v444, v400, v217 + 4, v217 + 12);
    }
    v1 = v215;
    *v218 = v219;
    _os_log_impl((void *)&_mh_execute_header, v211, v212, "alternate url %@", v217, 0xCu);
    v231 = sub_100006600(&qword_100019A90);
    swift_arrayDestroy(v218, 1, v231);
    swift_slowDealloc(v218, -1, -1);
    swift_slowDealloc(v217, -1, -1);
    v106 = v430;
  }
  v232 = v1[75];
  v233 = v1[71];
  v234 = v1[68];
  v235 = v1[47];
  v236 = v1[41];

  v106(v235, v236);
  swift_beginAccess(v233, v204, 0, 0);
  sub_1000066D4(v233, v234, &qword_1000198C0);
  v238 = 0;
  if (v435(v234, 1, v232) != 1)
  {
    v239 = v1[76];
    v240 = v1[75];
    v241 = v1[68];
    URL._bridgeToObjectiveC()(v237);
    v238 = v242;
    (*(void (**)(uint64_t, uint64_t))(v239 + 8))(v241, v240);
  }
  v243 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v424);
  v6 = v438;
  if (v438 && (v244 = UIImagePNGRepresentation(v438)) != 0)
  {
    v245 = v244;
    v246 = ((uint64_t (*)(void))static Data._unconditionallyBridgeFromObjectiveC(_:))();
    v248 = v247;

    v249.super.isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100006690(v246, v248);
  }
  else
  {
    v249.super.isa = 0;
  }
  v250 = v1[102];
  v251 = v1[101];
  v252 = v1[71];
  v253 = objc_msgSend((id)objc_opt_self(PPLMessageRichLinkLayout), "createRichLinkLayoutWithURL:title:imageData:", v238, v243, v249.super.isa);

  v254 = objc_msgSend(objc_allocWithZone((Class)MSMessageLiveLayout), "initWithAlternateLayout:", v253);
  v255 = sub_100006600(&qword_100019B98);
  v256 = swift_allocObject(v255, 48, 7);
  *(_OWORD *)(v256 + 16) = xmmword_100012B70;
  *(_QWORD *)(v256 + 32) = v251;
  *(_QWORD *)(v256 + 40) = v250;
  swift_bridgeObjectRetain(v250);
  v152 = v254;
  v257 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v256);
  objc_msgSend(v152, "setPpl_requiredCapabilities:", v257);

  sub_100006718(v252, &qword_1000198C0);
LABEL_89:
  v258 = objc_msgSend(objc_allocWithZone((Class)MSSession), "init");
  v259 = objc_msgSend(objc_allocWithZone((Class)MSMessage), "initWithSession:", v258);

  URL._bridgeToObjectiveC()(v260);
  v262 = v261;
  objc_msgSend(v259, "setURL:", v261);

  MessageDetails.notificationCaption.getter(objc_msgSend(v259, "setLayout:", v152));
  v264 = v263;
  v265 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v264);
  objc_msgSend(v259, "setSummaryText:", v265);

  static PeopleLogger.messages.getter(v266);
  v267 = v259;
  v268 = Logger.logObject.getter(v267);
  v269 = static os_log_type_t.debug.getter();
  v445 = v267;
  v436 = v152;
  if (os_log_type_enabled(v268, v269))
  {
    v270 = v1 + 30;
    v271 = (uint8_t *)swift_slowAlloc(12, -1);
    v272 = swift_slowAlloc(32, -1);
    v453[0] = v272;
    *(_DWORD *)v271 = 136315138;
    v273 = objc_msgSend(v267, "URL");
    if (v273)
    {
      v274 = v273;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      v275 = 0;
    }
    else
    {
      v275 = 1;
    }
    v278 = v1[76];
    v279 = v1[75];
    v280 = v1[67];
    v281 = v1[66];
    v282 = v1[46];
    v283 = v447[41];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v278 + 56))(v280, v275, 1, v279);
    v284 = String.init<A>(describing:)(v280, v281);
    v286 = v285;
    v447[30] = sub_100006F70(v284, v285, v453);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v270, v419, v271 + 4, v271 + 12);
    swift_bridgeObjectRelease(v286);

    _os_log_impl((void *)&_mh_execute_header, v268, v269, "message url %s", v271, 0xCu);
    swift_arrayDestroy(v272, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v272, -1, -1);
    swift_slowDealloc(v271, -1, -1);

    v287 = v283;
    v1 = v447;
    v430(v282, v287);
    v6 = v438;
    if (!v438)
      goto LABEL_99;
  }
  else
  {
    v276 = v1[46];
    v277 = v1[41];

    v106(v276, v277);
    if (!v6)
      goto LABEL_99;
  }
  v288 = v6;
  v289 = UIImageJPEGRepresentation(v288, 0.4);
  if (v289)
  {
    v290 = v289;
    v291 = ((uint64_t (*)(void))static Data._unconditionallyBridgeFromObjectiveC(_:))();
    v293 = v292;

    sub_10000F49C(v291, v293);
    v294.super.isa = Data._bridgeToObjectiveC()().super.isa;
    v420 = v291;
    v425 = v293;
    sub_100006690(v291, v293);
    goto LABEL_100;
  }

LABEL_99:
  v294.super.isa = 0;
  v420 = 0;
  v425 = 0xF000000000000000;
LABEL_100:
  v295 = v1[100];
  v296 = v1[98];
  v297 = v1[97];
  v298 = v1[96];
  swift_bridgeObjectRelease(v1[102]);
  swift_bridgeObjectRelease(v295);
  swift_bridgeObjectRelease(v298);
  String.localized.getter(v297, v296);
  v300 = v299;
  swift_bridgeObjectRelease(v296);
  v301 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v300);
  v302 = objc_msgSend(v445, "ppl_pluginPayloadWithAppIconData:appName:allowDataPayloads:", v294.super.isa, v301, 0);

  v303 = objc_msgSend(v302, "data");
  if (!v303)
  {
    v322 = static PeopleLogger.messages.getter(v304);
    v323 = Logger.logObject.getter(v322);
    v324 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v323, (os_log_type_t)v324))
    {
      v325 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v325 = 0;
      _os_log_impl((void *)&_mh_execute_header, v323, (os_log_type_t)v324, "Message _pluginPayload create failed", v325, 2u);
      swift_slowDealloc(v325, -1, -1);
    }
    v449 = v1[92];
    v407 = v1[91];
    v412 = (void (*)(uint64_t, uint64_t))v1[95];
    v416 = v1[90];
    v397 = v1[83];
    v402 = v1[89];
    v326 = v1[79];
    v327 = v1[76];
    v328 = v1[75];
    v329 = v1[62];
    v331 = v1[59];
    v330 = v1[60];
    v332 = v1[44];
    v333 = v1[41];

    v430(v332, v333);
    v363 = static PeopleErrors.createError(_:code:)(0xD000000000000024, 0x80000001000126B0, 500);
    swift_willThrow(v363);

    sub_10000F488(v420, v425);
    (*(void (**)(uint64_t, uint64_t))(v327 + 8))(v326, v328);
    (*(void (**)(uint64_t, uint64_t))(v330 + 8))(v329, v331);
    v412(v402, v397);
    (*(void (**)(uint64_t, uint64_t))(v407 + 8))(v449, v416);
    goto LABEL_107;
  }
  v305 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v303);
  v343 = v306;
  v344 = v305;

  v308 = static PeopleLogger.messages.getter(v307);
  v309 = Logger.logObject.getter(v308);
  v310 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v309, v310))
  {
    v311 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v311 = 0;
    _os_log_impl((void *)&_mh_execute_header, v309, v310, "SPI Payload successful!", v311, 2u);
    swift_slowDealloc(v311, -1, -1);
  }
  v312 = v1[92];
  v347 = v1[91];
  v348 = (void (*)(uint64_t, uint64_t))v1[95];
  v313 = v1[89];
  v349 = v1[90];
  v350 = v1[88];
  v351 = v1[87];
  v352 = v1[86];
  v353 = v1[85];
  v354 = v1[82];
  v355 = v1[81];
  v356 = v1[80];
  v345 = v1[79];
  v346 = v1[83];
  v357 = v1[78];
  v358 = v1[77];
  v314 = v1[76];
  v315 = v1[75];
  v359 = v1[74];
  v360 = v1[73];
  v362 = v1[72];
  v364 = v1[71];
  v366 = v1[70];
  v368 = v1[69];
  v370 = v1[68];
  v372 = v1[67];
  v316 = v1[62];
  v374 = v1[65];
  v376 = v1[61];
  v317 = v1[60];
  v318 = v447[59];
  v378 = v447[58];
  v380 = v447[57];
  v382 = v447[54];
  v384 = v447[53];
  v388 = v447[50];
  v393 = v447[49];
  v396 = v447[48];
  v401 = v447[47];
  v319 = v447[45];
  v406 = v447[46];
  v411 = v447[44];
  v415 = v447[43];
  v320 = v447[41];

  sub_10000F488(v420, v425);
  v430(v319, v320);
  (*(void (**)(uint64_t, uint64_t))(v314 + 8))(v345, v315);
  (*(void (**)(uint64_t, uint64_t))(v317 + 8))(v316, v318);
  v348(v313, v346);
  (*(void (**)(uint64_t, uint64_t))(v347 + 8))(v312, v349);

  swift_task_dealloc(v312);
  swift_task_dealloc(v313);
  swift_task_dealloc(v350);
  swift_task_dealloc(v351);
  swift_task_dealloc(v352);
  swift_task_dealloc(v353);
  swift_task_dealloc(v354);
  swift_task_dealloc(v355);
  swift_task_dealloc(v356);
  swift_task_dealloc(v345);
  swift_task_dealloc(v357);
  swift_task_dealloc(v358);
  swift_task_dealloc(v359);
  swift_task_dealloc(v360);
  swift_task_dealloc(v362);
  swift_task_dealloc(v364);
  swift_task_dealloc(v366);
  swift_task_dealloc(v368);
  swift_task_dealloc(v370);
  swift_task_dealloc(v372);
  swift_task_dealloc(v374);
  swift_task_dealloc(v316);
  swift_task_dealloc(v376);
  swift_task_dealloc(v378);
  swift_task_dealloc(v380);
  swift_task_dealloc(v382);
  swift_task_dealloc(v384);
  swift_task_dealloc(v388);
  swift_task_dealloc(v393);
  swift_task_dealloc(v396);
  swift_task_dealloc(v401);
  swift_task_dealloc(v406);
  swift_task_dealloc(v319);
  swift_task_dealloc(v411);
  swift_task_dealloc(v415);
  return ((uint64_t (*)(uint64_t, uint64_t))v447[1])(v344, v343);
}

uint64_t sub_10000F488(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100006690(result, a2);
  return result;
}

uint64_t sub_10000F49C(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000F4E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006600(&qword_1000198C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000F528()
{
  unint64_t result;

  result = qword_100019BA0;
  if (!qword_100019BA0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100019BA0);
  }
  return result;
}

unint64_t sub_10000F56C()
{
  unint64_t result;

  result = qword_100019BB0;
  if (!qword_100019BB0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100019BB0);
  }
  return result;
}

uint64_t sub_10000F5B0()
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
  v4 = (v3 + 32) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000F624(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for URL(0) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc(dword_100019BD4);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_10000841C;
  return sub_100009018(a1, v5, v6, v7);
}

uint64_t sub_10000F6A8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000F6CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100019A9C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000841C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100019A98 + dword_100019A98))(a1, v4);
}

uint64_t sub_10000F73C(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10000F754()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC20PeopleMessageServiceP33_E04000ACAEE14EF47D812A682D9BB85A19ResourceBundleClass);
}

id objc_msgSend_initWithData_MIMEType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:MIMEType:");
}

id objc_msgSend_initWithLinkMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLinkMetadata:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL:");
}
