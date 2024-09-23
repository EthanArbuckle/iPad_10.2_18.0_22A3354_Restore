int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v3 = objc_autoreleasePoolPush();
  v4 = sub_1000027A0(&qword_1000088A8);
  v5 = swift_allocObject(v4, 64, 7);
  *(_OWORD *)(v5 + 16) = xmmword_100003550;
  *(_QWORD *)(v5 + 56) = &type metadata for String;
  *(_QWORD *)(v5 + 32) = 0x7075206D2769;
  *(_QWORD *)(v5 + 40) = 0xE600000000000000;
  print(_:separator:terminator:)();
  sub_10000311C();
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(VCBundleIdentifierRunner);
  v7 = String.utf8CString.getter(v6);
  sub_10000311C();
  _set_user_dir_suffix(v7 + 32);
  swift_release(v7);
  v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for Server()), "init");
  sub_100001C04();
  v9 = objc_msgSend((id)objc_opt_self(NSRunLoop), "mainRunLoop");
  objc_msgSend(v9, "run");

  objc_autoreleasePoolPop(v3);
  return 0;
}

id sub_100001C04()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + OBJC_IVAR____TtC13SystemActions6Server_listener);
  if (result)
    return objc_msgSend(result, "activate");
  __break(1u);
  return result;
}

char *sub_100001C24()
{
  char *v0;
  char *v1;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  char *v19;
  uint64_t v20;
  void *v21;
  objc_class *ObjectType;
  char v24[16];
  id v25;
  objc_super v26;
  void *v27;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType(v0);
  v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  sub_100003094();
  v6 = v5 - v4;
  v7 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  sub_10000310C();
  __chkstk_darwin();
  sub_100003094();
  v10 = v9 - v8;
  type metadata accessor for DispatchQoS(0);
  sub_10000310C();
  __chkstk_darwin();
  sub_100003094();
  v13 = v12 - v11;
  *(_QWORD *)&v1[OBJC_IVAR____TtC13SystemActions6Server_listener] = 0;
  sub_100002FA4(0, &qword_100008820, OS_dispatch_queue_ptr);
  v14 = v1;
  static DispatchQoS.unspecified.getter();
  v27 = &_swiftEmptyArrayStorage;
  v15 = sub_100002EDC(&qword_100008828, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v16 = sub_1000027A0(&qword_100008830);
  v17 = sub_100002F1C();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v27, v16, v17, v7, v15);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v6, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v2);
  *(_QWORD *)&v14[OBJC_IVAR____TtC13SystemActions6Server_serviceQueue] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000017, 0x8000000100003670, v13, v10, v6, 0);
  *(_QWORD *)&v14[OBJC_IVAR____TtC13SystemActions6Server_runners] = &_swiftEmptyDictionarySingleton;

  v26.receiver = v14;
  v26.super_class = ObjectType;
  v18 = objc_msgSendSuper2(&v26, "init");
  sub_100002FA4(0, &qword_100008840, BSServiceConnectionListener_ptr);
  v25 = v18;
  v19 = (char *)v18;
  v20 = sub_100001E6C((uint64_t)sub_100002FDC, (uint64_t)v24);

  v21 = *(void **)&v19[OBJC_IVAR____TtC13SystemActions6Server_listener];
  *(_QWORD *)&v19[OBJC_IVAR____TtC13SystemActions6Server_listener] = v20;

  return v19;
}

uint64_t sub_100001E6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  void *v6;
  void *ObjCClassFromMetadata;
  id v8;
  uint64_t result;
  _QWORD v10[5];
  uint64_t v11;

  v5 = swift_allocObject(&unk_100004518, 32, 7);
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v10[4] = sub_100003070;
  v11 = v5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100001F78;
  v10[3] = &unk_100004530;
  v6 = _Block_copy(v10);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v2);
  swift_retain(v5);
  v8 = objc_msgSend(ObjCClassFromMetadata, "listenerWithConfigurator:", v6);
  _Block_release(v6);
  swift_release(v11);
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation(v5, "", 0, 0, 0, 1);
  result = swift_release(v5);
  if ((v6 & 1) == 0)
    return (uint64_t)v8;
  __break(1u);
  return result;
}

id sub_100001F9C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for Server()
{
  return objc_opt_self(_TtC13SystemActions6Server);
}

void sub_100002038(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  _QWORD *v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  CFTimeInterval v50;
  _QWORD v51[4];
  uint64_t v52;

  v3 = v2;
  v5 = type metadata accessor for Logger(0);
  v48 = *(_QWORD *)(v5 - 8);
  v49 = v5;
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v47 = (char *)&v46 - v9;
  v10 = sub_1000030A4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v10);
  v14 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v46 - v15;
  sub_1000027A0(&qword_100008790);
  sub_10000310C();
  __chkstk_darwin(v17);
  sub_100003094();
  v20 = v19 - v18;
  v21 = a2;
  RunnerConnection.Policy.Client.init(client:)();
  v22 = type metadata accessor for RunnerConnection.Policy.Client(0);
  v23 = sub_1000027E0(v20, 1, v22);
  v24 = sub_1000027EC(v20);
  if (v23 == 1)
  {
    static WFLog.subscript.getter(WFLogCategoryXPCRunner);
    v25 = v21;
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)sub_100003134(12);
      v29 = (_QWORD *)sub_100003134(8);
      *(_DWORD *)v28 = 138412290;
      v50 = *(double *)&v25;
      v30 = v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, v51, v28 + 4, v28 + 12);
      *v29 = v25;

      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Client is not entitled as a trusted client: %@", v28, 0xCu);
      v31 = sub_1000027A0(&qword_100008798);
      swift_arrayDestroy(v29, 1, v31);
      sub_1000030E8((uint64_t)v29);
      sub_1000030E8((uint64_t)v28);
    }
    else
    {

      v26 = v25;
    }

    (*(void (**)(char *, uint64_t))(v48 + 8))(v8, v49);
    -[NSObject invalidate](v25, "invalidate");
LABEL_10:
    sub_1000030C4();
    return;
  }
  UUID.init()(v24);
  v32 = objc_msgSend(objc_allocWithZone((Class)WFBackgroundShortcutRunner), "initWithProcessPolicy:", 1);
  sub_100003124((uint64_t)v32, (uint64_t)&v50);
  v33 = v32;
  sub_100002978((uint64_t)v33, (uint64_t)v16);
  swift_endAccess(&v50);
  sub_100003104((uint64_t)v14, (uint64_t)v16, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16));
  v34 = *(unsigned __int8 *)(v11 + 80);
  v35 = (v34 + 32) & ~v34;
  v36 = swift_allocObject(&unk_100004450, v35 + v12, v34 | 7);
  *(_QWORD *)(v36 + 16) = v3;
  *(_QWORD *)(v36 + 24) = v33;
  sub_100003104(v36 + v35, (uint64_t)v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 32));
  v37 = swift_allocObject(&unk_100004478, 32, 7);
  *(_QWORD *)(v37 + 16) = sub_100002A30;
  *(_QWORD *)(v37 + 24) = v36;
  v51[3] = sub_100002A70;
  v52 = v37;
  v50 = COERCE_DOUBLE(_NSConcreteStackBlock);
  v51[0] = 1107296256;
  v38 = sub_10000313C((uint64_t)sub_100001F78);
  v39 = v52;
  v40 = v33;
  v41 = v3;
  swift_retain(v37);
  swift_release(v39);
  objc_msgSend(v21, "configureConnection:", v38);
  _Block_release(v38);
  LOBYTE(v38) = swift_isEscapingClosureAtFileLocation(v37, "", 86, 56, 40, 1);
  swift_release(v37);
  if ((v38 & 1) == 0)
  {
    objc_msgSend(v21, "activate");
    v42 = static WFLog.subscript.getter(WFLogCategoryXPCRunner);
    v43 = Logger.logObject.getter(v42);
    v44 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)sub_100003134(12);
      *(_DWORD *)v45 = 134217984;
      v50 = CACurrentMediaTime();
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, v51, v45 + 4, v45 + 12);
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "[Performance] Connection came in: %f", v45, 0xCu);
      sub_1000030E8((uint64_t)v45);
    }

    (*(void (**)(char *, uint64_t))(v48 + 8))(v47, v49);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    swift_release(v36);
    goto LABEL_10;
  }
  __break(1u);
}

void sub_1000024F8(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD v19[5];
  uint64_t v20;

  v8 = *(_QWORD *)(sub_1000030A4() - 8);
  v9 = *(_QWORD *)(v8 + 64);
  __chkstk_darwin();
  objc_msgSend(a1, "setTargetQueue:", *(_QWORD *)&a2[OBJC_IVAR____TtC13SystemActions6Server_serviceQueue]);
  v10 = objc_msgSend((id)objc_opt_self(BSServiceQuality), "userInitiated");
  sub_1000030DC((uint64_t)v10, "setServiceQuality:");

  type metadata accessor for RunnerConnection(0);
  v11 = (void *)static RunnerConnection.bsServiceInterface.getter();
  sub_1000030DC((uint64_t)v11, "setInterface:");

  objc_msgSend(a1, "setInterfaceTarget:", a3);
  sub_100003104((uint64_t)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
  v12 = *(unsigned __int8 *)(v8 + 80);
  v13 = (v12 + 24) & ~v12;
  v14 = swift_allocObject(&unk_1000044C8, v13 + v9, v12 | 7);
  *(_QWORD *)(v14 + 16) = a2;
  sub_100003104(v14 + v13, (uint64_t)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 32));
  v19[4] = sub_100002AEC;
  v20 = v14;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 1107296256;
  v15 = sub_10000313C((uint64_t)sub_100002698);
  v16 = v20;
  v17 = a2;
  v18 = swift_release(v16);
  sub_1000030DC(v18, "setInvalidationHandler:");
  _Block_release(v15);
  sub_1000030C4();
}

void sub_100002698(uint64_t a1, void *a2)
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

uint64_t sub_1000026E8(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain(a2);
  v3(a2);
  return swift_unknownObjectRelease(a2);
}

uint64_t sub_1000027A0(uint64_t *a1)
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

uint64_t sub_1000027E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_1000027EC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000027A0(&qword_100008790);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000282C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  unint64_t v5;
  char v6;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  Swift::Int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v2 = v1;
  v4 = *v2;
  swift_bridgeObjectRetain(*v2);
  v5 = sub_100002B54(a1);
  LOBYTE(a1) = v6;
  swift_bridgeObjectRelease(v4);
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  v17 = *v2;
  v8 = *v2;
  *v2 = 0x8000000000000000;
  v9 = *(_QWORD *)(v8 + 24);
  sub_1000027A0(&qword_100008800);
  _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v9);
  v10 = *(_QWORD *)(v17 + 48);
  v11 = type metadata accessor for UUID(0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v5, v11);
  v12 = *(_QWORD *)(*(_QWORD *)(v17 + 56) + 8 * v5);
  v13 = sub_100002FA4(0, &qword_100008808, WFBackgroundShortcutRunner_ptr);
  v14 = sub_100002EDC(&qword_100008810, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  _NativeDictionary._delete(at:)(v5, v17, v11, v13, v14);
  v15 = *v2;
  *v2 = v17;
  swift_bridgeObjectRelease(v15);
  return v12;
}

uint64_t sub_100002978(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  v8 = *v2;
  *v2 = 0x8000000000000000;
  sub_100002BC0(a1, a2, isUniquelyReferenced_nonNull_native);
  v6 = *v2;
  *v2 = v8;
  return swift_bridgeObjectRelease(v6);
}

uint64_t sub_1000029E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1000030A4();
  sub_1000030AC();

  sub_1000030F4();
  return sub_100003084(v0, v1, v2);
}

void sub_100002A30(void *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_1000030A4() - 8) + 80);
  sub_1000024F8(a1, *(char **)(v1 + 16), *(_QWORD *)(v1 + 24), v1 + ((v3 + 32) & ~v3));
}

uint64_t sub_100002A70()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100002A90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100002AA0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100002AA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1000030A4();
  sub_1000030AC();
  sub_1000030F4();
  return sub_100003084(v0, v1, v2);
}

void sub_100002AEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _BYTE v5[24];

  v1 = sub_1000030A4();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 24) & ~v2);
  sub_100003124(v1, (uint64_t)v5);
  v4 = (void *)sub_10000282C(v3);
  swift_endAccess(v5);

}

unint64_t sub_100002B54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 40);
  v5 = type metadata accessor for UUID(0);
  v6 = sub_100002EDC(&qword_100008810, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_100002D9C(a1, v7);
}

void sub_100002BC0(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  _BOOL8 v16;
  Swift::Int v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = (_QWORD **)v3;
  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v13 = sub_100002B54(a2);
  v15 = v12[2];
  v16 = (v14 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_10;
  }
  v18 = v13;
  v19 = v14;
  sub_1000027A0(&qword_100008800);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v17))
    goto LABEL_5;
  v20 = sub_100002B54(a2);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_10:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v8);
    __break(1u);
    return;
  }
  v18 = v20;
LABEL_5:
  v22 = *v4;
  if ((v19 & 1) != 0)
  {
    v23 = v22[7];

    *(_QWORD *)(v23 + 8 * v18) = a1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
    sub_100002D04(v18, (uint64_t)v11, a1, v22);
  }
}

uint64_t sub_100002D04(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = type metadata accessor for UUID(0);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

unint64_t sub_100002D9C(uint64_t a1, uint64_t a2)
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
  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
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
      v14 = sub_100002EDC(&qword_100008818, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
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

uint64_t sub_100002EDC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

unint64_t sub_100002F1C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008838;
  if (!qword_100008838)
  {
    v1 = sub_100002F60(&qword_100008830);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100008838);
  }
  return result;
}

uint64_t sub_100002F60(uint64_t *a1)
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

uint64_t sub_100002FA4(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

id sub_100002FDC(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  NSString v4;
  uint64_t v5;
  NSString v6;
  uint64_t v7;

  v3 = *(_QWORD *)(v1 + 16);
  static RunnerConnection.ServiceSpec.SystemRunner.domain.getter();
  v4 = String._bridgeToObjectiveC()();
  v5 = sub_10000311C();
  sub_100003148(v5, "setDomain:");

  static RunnerConnection.ServiceSpec.SystemRunner.serviceIdentifier.getter();
  v6 = String._bridgeToObjectiveC()();
  v7 = sub_10000311C();
  sub_100003148(v7, "setService:");

  return objc_msgSend(a1, "setDelegate:", v3);
}

uint64_t sub_100003074()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100003084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_deallocObject(a1, a2, a3);
}

uint64_t sub_1000030A4()
{
  return type metadata accessor for UUID(0);
}

void sub_1000030AC()
{
  uint64_t v0;

}

id sub_1000030DC(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_1000030E8(uint64_t a1)
{
  return swift_slowDealloc(a1, -1, -1);
}

uint64_t sub_1000030F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1 + v3, v0);
}

uint64_t sub_100003104@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t sub_10000311C()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100003124(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return swift_beginAccess(v2, a2, 33, 0);
}

uint64_t sub_100003134(uint64_t a1)
{
  return swift_slowAlloc(a1, -1);
}

void *sub_10000313C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = a1;
  *(_QWORD *)(v2 - 104) = v1;
  return _Block_copy((const void *)(v2 - 128));
}

id sub_100003148(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}
