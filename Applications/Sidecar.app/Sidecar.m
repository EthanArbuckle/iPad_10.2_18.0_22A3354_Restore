uint64_t sub_100003688()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100005418(v0, qword_1000230C8);
  sub_100005400(v0, (uint64_t)qword_1000230C8);
  return Logger.init(subsystem:category:)(0xD000000000000011, 0x8000000100016C90, 0x65746E6573657270, 0xE900000000000072);
}

id sub_100003700()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t sub_100003750(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  Class isa;
  Class v15;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  if (qword_100022670 != -1)
    swift_once(&qword_100022670, sub_100003688);
  v6 = sub_100005AF0();
  sub_100005400(v6, (uint64_t)qword_1000230C8);
  v7 = swift_bridgeObjectRetain_n(a2, 2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = sub_100005A70(18);
    v11 = (_QWORD *)sub_100005A70(8);
    *(_DWORD *)v10 = 67109379;
    HIDWORD(v16) = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)((char *)&v16 + 4, &v17, v10 + 4);
    *(_WORD *)(v10 + 8) = 2113;
    v12 = a2;
    if (!a2)
      v12 = Dictionary.init(dictionaryLiteral:)(&_swiftEmptyArrayStorage, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
    swift_bridgeObjectRetain(a2);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v12);
    v15 = isa;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v10 + 10);
    *v11 = isa;
    sub_100005AD0();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "applicationDidFinishLaunching: suspended=%{BOOL}d, options=%{private}@", (uint8_t *)v10, 0x12u);
    sub_1000054F4(&qword_100022830);
    swift_arrayDestroy(v11, 1);
    sub_1000059B4((uint64_t)v11);
    sub_1000059B4(v10);

  }
  else
  {

    sub_100005AD0();
  }
  return SidecarRegisterServicePresenter(v3);
}

uint64_t sub_100003944()
{
  if (qword_100022678 != -1)
    swift_once(&qword_100022678, sub_100006C00);
  return 1;
}

uint64_t sub_100003A20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a2)
    v2 = sub_100003A68(a2);
  else
    v2 = 0;
  sub_100003750(0, v2);
  swift_bridgeObjectRelease(v2);
  return 1;
}

uint64_t sub_100003A68(uint64_t a1)
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
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  _OWORD v34[2];
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _OWORD v38[2];
  _OWORD v39[2];
  _OWORD v40[2];
  uint64_t v41;
  _OWORD v42[2];
  uint64_t v43;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_1000054F4(&qword_100022828);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v30 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v29 = (unint64_t)(63 - v4) >> 6;
  v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  result = swift_retain(v3);
  v9 = 0;
  if (!v6)
    goto LABEL_9;
LABEL_8:
  v10 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v11 = v10 | (v9 << 6);
  while (1)
  {
    v16 = *(void **)(*(_QWORD *)(a1 + 48) + 8 * v11);
    sub_10000571C(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v42 + 8);
    *(_QWORD *)&v42[0] = v16;
    v40[0] = v42[0];
    v40[1] = v42[1];
    v41 = v43;
    *(_QWORD *)&v39[0] = v16;
    type metadata accessor for LaunchOptionsKey(0);
    v18 = v17;
    v19 = v16;
    swift_dynamicCast(&v31, v39, v18, &type metadata for AnyHashable, 7);
    sub_10000570C((_OWORD *)((char *)v40 + 8), v34);
    v35 = v31;
    v36 = v32;
    v37 = v33;
    sub_10000570C(v34, v38);
    v31 = v35;
    v32 = v36;
    v33 = v37;
    sub_10000570C(v38, v39);
    sub_10000570C(v39, &v35);
    result = AnyHashable._rawHashValue(seed:)(v3[5]);
    v20 = -1 << *((_BYTE *)v3 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)&v7[8 * (v21 >> 6)]) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)&v7[8 * v22];
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)&v7[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(_QWORD *)&v7[(v23 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v23;
    v28 = v3[6] + 40 * v23;
    *(_OWORD *)v28 = v31;
    *(_OWORD *)(v28 + 16) = v32;
    *(_QWORD *)(v28 + 32) = v33;
    result = (uint64_t)sub_10000570C(&v35, (_OWORD *)(v3[7] + 32 * v23));
    ++v3[2];
    if (v6)
      goto LABEL_8;
LABEL_9:
    v12 = v9 + 1;
    if (__OFADD__(v9, 1))
      goto LABEL_38;
    if (v12 >= v29)
      goto LABEL_36;
    v13 = *(_QWORD *)(v30 + 8 * v12);
    v14 = v9 + 1;
    if (!v13)
    {
      v14 = v9 + 2;
      if (v9 + 2 >= v29)
        goto LABEL_36;
      v13 = *(_QWORD *)(v30 + 8 * v14);
      if (!v13)
      {
        v14 = v9 + 3;
        if (v9 + 3 >= v29)
          goto LABEL_36;
        v13 = *(_QWORD *)(v30 + 8 * v14);
        if (!v13)
        {
          v14 = v9 + 4;
          if (v9 + 4 >= v29)
            goto LABEL_36;
          v13 = *(_QWORD *)(v30 + 8 * v14);
          if (!v13)
            break;
        }
      }
    }
LABEL_24:
    v6 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v14 << 6);
    v9 = v14;
  }
  v15 = v9 + 5;
  if (v9 + 5 >= v29)
  {
LABEL_36:
    swift_release(v3);
    sub_10000576C(a1);
    return (uint64_t)v3;
  }
  v13 = *(_QWORD *)(v30 + 8 * v15);
  if (v13)
  {
    v14 = v9 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    v14 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v14 >= v29)
      goto LABEL_36;
    v13 = *(_QWORD *)(v30 + 8 * v14);
    ++v15;
    if (v13)
      goto LABEL_24;
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_100003ED4()
{
  if (qword_100022678 != -1)
    swift_once(&qword_100022678, sub_100006C00);
  *(_BYTE *)(qword_1000230E0 + OBJC_IVAR____TtC7Sidecar14ServiceManager_inBackground) = 1;
  sub_100006C2C();
  sub_1000059DC();
}

void sub_100003F74()
{
  if (qword_100022678 != -1)
    swift_once(&qword_100022678, sub_100006C00);
  *(_BYTE *)(qword_1000230E0 + OBJC_IVAR____TtC7Sidecar14ServiceManager_inBackground) = 0;
  sub_100006C2C();
  sub_1000059DC();
}

void sub_10000400C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  os_log_type_t v3;
  _WORD *v4;
  uint64_t v5;
  uint64_t v6;

  if (qword_100022670 != -1)
    swift_once(&qword_100022670, sub_100003688);
  v0 = sub_100005AF0();
  v1 = sub_100005400(v0, (uint64_t)qword_1000230C8);
  v2 = (void *)Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (sub_100005A90(v3))
  {
    v4 = (_WORD *)sub_100005A70(2);
    *v4 = 0;
    sub_100005A30((void *)&_mh_execute_header, v5, v6, "=== Application Will Terminate ===");
    sub_1000059B4((uint64_t)v4);
  }

  if (qword_100022678 != -1)
    swift_once(&qword_100022678, sub_100006C00);
  sub_10000CCE8();
  sub_100005AB0();
}

id sub_100004118()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_10000414C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;

  v9 = type metadata accessor for DispatchWorkItemFlags(0);
  v10 = sub_100005A58(v9);
  __chkstk_darwin(v10);
  v11 = sub_1000059C0();
  v12 = sub_100005ABC(v11);
  __chkstk_darwin(v12);
  sub_100005A78();
  sub_10000562C(0, (unint64_t *)&qword_1000227F8, OS_dispatch_queue_ptr);
  v13 = (void *)static OS_dispatch_queue.main.getter();
  v14 = (_QWORD *)swift_allocObject(&unk_10001C9F8, 56, 7);
  v14[2] = v4;
  v14[3] = a1;
  v14[4] = a2;
  v14[5] = a3;
  v14[6] = a4;
  v24 = v14;
  v15 = sub_100005ADC((uint64_t)sub_1000128C4);
  v16 = v4;
  swift_bridgeObjectRetain(a2);
  swift_retain(a4);
  v17 = swift_release(v24);
  static DispatchQoS.unspecified.getter(v17);
  sub_100005774((unint64_t *)&qword_100022800, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v19 = v18;
  sub_1000054F4(&qword_100022808);
  sub_100005534();
  v20 = sub_100005A14();
  dispatch thunk of SetAlgebra.init<A>(_:)(v20, v21, v22, v23, v19);
  sub_1000059FC();
  _Block_release(v15);

  sub_100005A44();
  sub_100005AA0();
  sub_1000059E4();
}

void sub_1000042C8(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD), uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  char *v35;
  uint64_t v36;
  void (*v37)(_QWORD);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v38 = a2;
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100022670 != -1)
    swift_once(&qword_100022670, sub_100003688);
  v12 = sub_100005400(v8, (uint64_t)qword_1000230C8);
  v13 = swift_bridgeObjectRetain_n(a3, 2);
  v37 = (void (*)(_QWORD))v12;
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v35 = v11;
    v16 = swift_slowAlloc(12, -1);
    v36 = a5;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc(32, -1);
    v40 = v18;
    *(_DWORD *)v17 = 136446210;
    swift_bridgeObjectRetain(a3);
    v39 = sub_100013928(v38, a3, &v40);
    v11 = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v17 + 4);
    swift_bridgeObjectRelease_n(a3, 3);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "=== Starting Service Extension '%{public}s' ===", v17, 0xCu);
    swift_arrayDestroy(v18, 1);
    swift_slowDealloc(v18, -1, -1);
    v19 = v17;
    a5 = v36;
    swift_slowDealloc(v19, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a3, 2);
  }
  if (qword_100022678 != -1)
    swift_once(&qword_100022678, sub_100006C00);
  v20 = v38;
  v21 = sub_100007334();
  if (v21)
  {
    v22 = v21;
    v23 = swift_bridgeObjectRetain_n(a3, 2);
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v37 = a4;
      v26 = (uint8_t *)swift_slowAlloc(12, -1);
      v27 = swift_slowAlloc(32, -1);
      v40 = v27;
      *(_DWORD *)v26 = 136446210;
      swift_bridgeObjectRetain(a3);
      v39 = sub_100013928(v20, a3, &v40);
      a4 = v37;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40, v26 + 4);
      swift_bridgeObjectRelease_n(a3, 3);
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "=== Activating Service Extension '%{public}s' ===", v26, 0xCu);
      swift_arrayDestroy(v27, 1);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v26, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a3, 2);
    }
    sub_100007618(v22, (uint64_t)a4, a5);
    swift_release(v22);
  }
  else
  {
    sub_10000562C(0, &qword_100022818, NSError_ptr);
    v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(SidecarErrorDomain);
    v30 = sub_100004E64(v28, v29, -103, 0, 0, 0);
    v31 = (*(uint64_t (**)(char *, void (*)(_QWORD), uint64_t))(v9 + 16))(v11, v37, v8);
    v32 = __chkstk_darwin(v31);
    __chkstk_darwin(v32);
    sub_100005EE8(sub_100005664, v33, (uint64_t (*)(void))sub_10000566C);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v34 = v30;
    a4(v30);

  }
}

uint64_t sub_100004774(uint64_t a1, void *a2)
{
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v8;

  v8 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)(35, 1);
  v4._object = (void *)0x8000000100016CD0;
  v4._countAndFlagsBits = 0xD000000000000017;
  String.append(_:)(v4);
  v5._countAndFlagsBits = a1;
  v5._object = a2;
  String.append(_:)(v5);
  v6._countAndFlagsBits = 0x64656C6961462027;
  v6._object = (void *)0xEC0000003D3D3D20;
  String.append(_:)(v6);
  return v8;
}

void sub_1000048A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = _convertErrorToNSError(_:)();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

void sub_1000048F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[32];
  void **v22;
  uint64_t v23;
  void (*v24)();
  uint64_t v25;

  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = sub_100005A58(v2);
  __chkstk_darwin(v3);
  v4 = sub_1000059C0();
  v5 = sub_100005ABC(v4);
  __chkstk_darwin(v5);
  sub_100005A78();
  v6 = sub_100005AE8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  __chkstk_darwin(v6);
  sub_10000562C(0, (unint64_t *)&qword_1000227F8, OS_dispatch_queue_ptr);
  v9 = (void *)static OS_dispatch_queue.main.getter();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(&v21[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)], a1, v6);
  v10 = *(unsigned __int8 *)(v7 + 80);
  v11 = (v10 + 16) & ~v10;
  v12 = swift_allocObject(&unk_10001C980, v11 + v8, v10 | 7);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v7 + 32))(v12 + v11, &v21[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)], v6);
  v24 = sub_1000054B4;
  v25 = v12;
  v22 = _NSConcreteStackBlock;
  v23 = 1107296256;
  v13 = sub_100005ADC((uint64_t)sub_1000128C4);
  v14 = swift_release(v25);
  static DispatchQoS.unspecified.getter(v14);
  v22 = (void **)&_swiftEmptyArrayStorage;
  sub_100005774((unint64_t *)&qword_100022800, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v16 = v15;
  sub_1000054F4(&qword_100022808);
  sub_100005534();
  v17 = sub_100005A14();
  dispatch thunk of SetAlgebra.init<A>(_:)(v17, v18, v19, v20, v16);
  sub_1000059FC();
  _Block_release(v13);

  sub_100005A44();
  sub_100005AA0();
  sub_1000059E4();
}

void sub_100004AA4()
{
  if (qword_100022678 != -1)
    swift_once(&qword_100022678, sub_100006C00);
  sub_100008F6C();
}

void sub_100004B94()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  os_log_type_t v3;
  _WORD *v4;
  uint64_t v5;
  uint64_t v6;

  if (qword_100022670 != -1)
    swift_once(&qword_100022670, sub_100003688);
  v0 = sub_100005AF0();
  v1 = sub_100005400(v0, (uint64_t)qword_1000230C8);
  v2 = (void *)Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (sub_100005A90(v3))
  {
    v4 = (_WORD *)sub_100005A70(2);
    *v4 = 0;
    sub_100005A30((void *)&_mh_execute_header, v5, v6, "=== Terminate (from Relay) ===");
    sub_1000059B4((uint64_t)v4);
  }

  if (qword_100022678 != -1)
    swift_once(&qword_100022678, sub_100006C00);
  sub_100009380(0);
  sub_100005AB0();
}

int main(int argc, const char **argv, const char **envp)
{
  objc_class *v5;
  NSString *v6;

  v5 = (objc_class *)type metadata accessor for AppDelegate();
  v6 = NSStringFromClass(v5);
  UIApplicationMain(argc, (char **)argv, 0, v6);

  return 0;
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC7Sidecar11AppDelegate);
}

void type metadata accessor for SidecarCompletionAnimation(uint64_t a1)
{
  sub_100005950(a1, &qword_1000227D8, (uint64_t)&unk_10001C900);
}

void type metadata accessor for UIBackgroundStyle(uint64_t a1)
{
  sub_100005950(a1, &qword_1000227E0, (uint64_t)&unk_10001C920);
}

void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
  sub_100005950(a1, &qword_1000227E8, (uint64_t)&unk_10001C940);
}

void type metadata accessor for UIDeviceOrientation(uint64_t a1)
{
  sub_100005950(a1, &qword_1000227F0, (uint64_t)&unk_10001C960);
}

uint64_t sub_100004D54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_10000570C((_OWORD *)a1, v6);
    sub_1000105A4(v6, a2, a3);
    return swift_bridgeObjectRelease(a3);
  }
  else
  {
    sub_1000056CC(a1);
    sub_10001036C(a2, a3, v6);
    swift_bridgeObjectRelease(a3);
    return sub_1000056CC((uint64_t)v6);
  }
}

uint64_t sub_100004DD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v3 = ((uint64_t (*)(void))static String._unconditionallyBridgeFromObjectiveC(_:))();
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
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

BOOL sub_100004E58(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

id sub_100004E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  id v21;
  NSString v22;
  uint64_t v23;
  Class isa;
  id v25;
  uint64_t v27;
  _QWORD *v28;
  char v29[8];
  _QWORD v30[3];
  void *v31;
  uint64_t v32;

  v7 = v6;
  v32 = Dictionary.init(dictionaryLiteral:)(&_swiftEmptyArrayStorage, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  if (a5)
  {
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSDebugDescriptionErrorKey);
    v31 = &type metadata for String;
    v30[0] = a4;
    v30[1] = a5;
    sub_100004D54((uint64_t)v30, v13, v14);
  }
  if (a6)
  {
    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSUnderlyingErrorKey);
    v17 = v16;
    swift_getErrorValue(a6, v29, &v27);
    v18 = v27;
    v19 = v28;
    v31 = v28;
    v20 = sub_100005690(v30);
    (*(void (**)(_QWORD *, uint64_t, _QWORD *))(*(v19 - 1) + 16))(v20, v18, v19);
    sub_100004D54((uint64_t)v30, v15, v17);
  }
  v21 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v7));
  v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v23 = v32;
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v23);
  v25 = objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, a3, isa);

  swift_errorRelease(a6);
  return v25;
}

void sub_100005014()
{
  uint64_t *v0;

  sub_100005114(*v0, (void (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100005034(uint64_t a1)
{
  uint64_t *v1;

  return sub_10000503C(a1, *v1);
}

uint64_t sub_10000503C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_10000507C(uint64_t a1)
{
  uint64_t *v1;

  return sub_100005084(a1, *v1);
}

Swift::Int sub_100005084(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

void sub_1000050F4()
{
  uint64_t *v0;

  sub_100005114(*v0, (void (*)(uint64_t))&String._bridgeToObjectiveC());
}

void sub_100005114(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v5 = v4;
  a2(v3);
  swift_bridgeObjectRelease(v5);
  sub_1000059DC();
}

uint64_t sub_10000514C(uint64_t a1, id *a2)
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

uint64_t sub_1000051C4(uint64_t a1, id *a2)
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

NSString sub_100005240@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  NSString result;

  result = sub_100005264(a1);
  *a2 = result;
  return result;
}

NSString sub_100005264(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSString v3;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v2 = v1;
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return v3;
}

BOOL sub_100005298(uint64_t *a1, uint64_t *a2)
{
  return sub_100004E58(*a1, *a2);
}

void sub_1000052A4(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_1000052D4();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

void sub_1000052DC(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = nullsub_1(*v2, a1);
  sub_1000059DC();
}

uint64_t sub_100005300(uint64_t *a1, uint64_t *a2)
{
  return sub_100004DD4(*a1, *a2);
}

uint64_t sub_10000530C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100005350@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = j___sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000537C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100005774(&qword_100022838, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_10001693C);
  v3 = v2;
  sub_100005774(&qword_100022868, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100016890);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v4, &protocol witness table for String);
}

uint64_t sub_100005400(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_100005418(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100005458()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_100005AE8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_1000054B4()
{
  sub_100005AE8();
  sub_100004AA4();
}

uint64_t sub_1000054DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000054EC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000054F4(uint64_t *a1)
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

unint64_t sub_100005534()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100022810;
  if (!qword_100022810)
  {
    v1 = sub_100005578(&qword_100022808);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100022810);
  }
  return result;
}

uint64_t sub_100005578(uint64_t *a1)
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

uint64_t sub_1000055BC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000055E0(uint64_t a1)
{
  uint64_t v1;

  sub_1000048A4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1000055E8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

void sub_10000561C()
{
  uint64_t v0;

  sub_1000042C8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void (**)(_QWORD))(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_10000562C(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_100005664()
{
  uint64_t v0;

  return sub_100004774(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_10000566C()
{
  uint64_t v0;

  swift_errorRetain(*(_QWORD *)(v0 + 16));
  sub_1000059DC();
}

_QWORD *sub_100005690(_QWORD *a1)
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

uint64_t sub_1000056CC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000054F4(&qword_100022820);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_10000570C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000571C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
  sub_100005950(a1, &qword_100022840, (uint64_t)&unk_10001CA48);
}

uint64_t sub_10000576C(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

void sub_100005774(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }
  sub_1000059DC();
}

uint64_t sub_1000057B0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_1000057E4(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000057F0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100005810(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_100005950(a1, &qword_100022848, (uint64_t)&unk_10001CAC8);
}

void sub_100005850()
{
  sub_100005774(&qword_100022850, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100016854);
}

void sub_10000587C()
{
  sub_100005774(&qword_100022858, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100016828);
}

void sub_1000058A8()
{
  sub_100005774(&qword_100022860, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_1000168C4);
}

__n128 sub_1000058D4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000058E0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100005900(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_100005950(a1, &qword_100022870, (uint64_t)&unk_10001CB48);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_100005950(a1, &qword_100022878, (uint64_t)&unk_10001CBC8);
}

void sub_100005950(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_1000059B4(uint64_t a1)
{
  return swift_slowDealloc(a1, -1, -1);
}

uint64_t sub_1000059C0()
{
  return type metadata accessor for DispatchQoS(0);
}

uint64_t sub_1000059FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return OS_dispatch_queue.async(group:qos:flags:execute:)(0, v1, v0, v2);
}

uint64_t sub_100005A14()
{
  uint64_t v0;

  return v0 - 128;
}

void sub_100005A30(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_100005A44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 136) + 8))(v1, v0);
}

uint64_t sub_100005A58(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = *(_QWORD *)(result - 8);
  return result;
}

uint64_t sub_100005A70(uint64_t a1)
{
  return swift_slowAlloc(a1, -1);
}

BOOL sub_100005A90(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100005AA0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 152) + 8))(v0, *(_QWORD *)(v1 - 144));
}

uint64_t sub_100005ABC(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 152) = *(_QWORD *)(result - 8);
  *(_QWORD *)(v1 - 144) = result;
  return result;
}

uint64_t sub_100005AD0()
{
  uint64_t v0;

  return swift_bridgeObjectRelease_n(v0, 2);
}

void *sub_100005ADC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = a1;
  *(_QWORD *)(v2 - 104) = v1;
  return _Block_copy((const void *)(v2 - 128));
}

uint64_t sub_100005AE8()
{
  return type metadata accessor for UUID(0);
}

uint64_t sub_100005AF0()
{
  return type metadata accessor for Logger(0);
}

uint64_t sub_100005AFC(uint64_t (*a1)(void), uint64_t a2, NSObject *a3, uint64_t a4)
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
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
  os_log_type_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
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
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v7 = (void *)_convertErrorToNSError(_:)(a4);
  v8 = objc_msgSend(v7, "localizedDescription");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v10 = v9;

  v11 = a1();
  if (v12)
  {
    v13 = v11;
    v14 = v12;
    v15 = v7;
    swift_bridgeObjectRetain(v14);
    v16 = sub_100006374();
    v17 = a3;
    Logger.logObject.getter(v16);
    v18 = sub_10000636C();
    if (sub_10000635C(v18))
    {
      v19 = sub_100005A70(42);
      v63 = sub_100005A70(96);
      v70 = v63;
      *(_DWORD *)v19 = 136446979;
      swift_bridgeObjectRetain(v14);
      v65 = sub_100013928(v13, v14, &v70);
      sub_10000637C(v65, v20, v21, v19 + 12);
      v22 = sub_100006324(v14);
      *(_WORD *)(v19 + 12) = 2082;
      v23 = sub_10000632C(v22, "domain");
      v64 = a4;
      v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
      v26 = v25;

      v66 = sub_100013928(v24, v26, &v70);
      sub_10000637C(v66, v27, v28, v19 + 22);

      v29 = swift_bridgeObjectRelease(v26);
      *(_WORD *)(v19 + 22) = 2048;
      sub_10000632C(v29, "code");

      sub_10000638C(v30, v31, v32, v19 + 32);
      *(_WORD *)(v19 + 32) = 2081;
      v33 = sub_100006374();
      v67 = sub_1000063AC(v33, v34, v35, v36, v37);
      sub_10000638C(v67, v38, v39, v19 + 42);
      sub_100006324(v10);
      _os_log_impl((void *)&_mh_execute_header, v17, (os_log_type_t)a1, "%{public}s: %{public}s (%ld) %{private}s", (uint8_t *)v19, 0x2Au);
      sub_1000063BC();
      v40 = v63;
LABEL_6:
      sub_1000059B4(v40);
      sub_1000059B4(v19);

      return swift_errorRelease(v64);
    }
    sub_100006354(v10);
    v62 = v14;
  }
  else
  {
    v15 = v7;
    v41 = sub_100006374();
    v17 = a3;
    Logger.logObject.getter(v41);
    v42 = sub_10000636C();
    if (sub_10000635C(v42))
    {
      v19 = sub_100005A70(32);
      v43 = sub_100005A70(64);
      v70 = v43;
      *(_DWORD *)v19 = 136446723;
      v64 = a4;
      v44 = sub_10000632C(v43, "domain");
      v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(v44);
      v47 = v46;

      v68 = sub_100013928(v45, v47, &v70);
      sub_100006314(v68, v48, v49, v19 + 12);

      v50 = swift_bridgeObjectRelease(v47);
      *(_WORD *)(v19 + 12) = 2048;
      sub_10000632C(v50, "code");

      sub_100006314(v51, v52, v53, v19 + 22);
      *(_WORD *)(v19 + 22) = 2081;
      v54 = sub_100006374();
      v69 = sub_1000063AC(v54, v55, v56, v57, v58);
      sub_100006314(v69, v59, v60, v19 + 32);
      sub_100006324(v10);
      _os_log_impl((void *)&_mh_execute_header, v17, (os_log_type_t)a1, "%{public}s (%ld) %{private}s", (uint8_t *)v19, 0x20u);
      swift_arrayDestroy(v43, 2);
      v40 = v43;
      goto LABEL_6;
    }
    v62 = v10;
  }
  sub_100006354(v62);

  return swift_errorRelease(a4);
}

void sub_100005EE8(uint64_t (*a1)(void), uint64_t a2, uint64_t (*a3)(void))
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  id v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  os_log_type_t v77;
  uint64_t v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  id v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  uint64_t v120;
  uint64_t v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  uint64_t v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  uint64_t v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v147;
  int v148;
  int v149;
  int v150;
  int v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  int v159;
  int v160;
  int v161;
  int v162;
  int v163;
  int v164;
  int v165;
  int v166;
  int v167;
  int v168;
  int v169;
  int v170;
  int v171;
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
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  id v188;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  id v202;
  id v203;
  uint64_t v204;
  uint64_t v205;

  v4 = v3;
  v6 = a3();
  v7 = (void *)_convertErrorToNSError(_:)();
  v8 = swift_errorRelease(v6);
  v9 = sub_10000632C(v8, "localizedDescription");
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
  v12 = v11;

  v13 = a1();
  if (v14)
  {
    v15 = v13;
    v16 = v14;
    v188 = v7;
    swift_bridgeObjectRetain(v16);
    v17 = sub_100006334();
    v18 = v4;
    Logger.logObject.getter(v17);
    v19 = sub_10000636C();
    if (sub_10000639C(v19))
    {
      v20 = sub_100005A70(42);
      v173 = sub_100005A70(96);
      v205 = v173;
      *(_DWORD *)v20 = 136446979;
      swift_bridgeObjectRetain(v16);
      v204 = sub_100013928(v15, v16, &v205);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v204, &v205, v20 + 4);
      v21 = sub_100006324(v16);
      *(_WORD *)(v20 + 12) = 2082;
      v28 = sub_10000633C(v21, "domain", v22, v23, v24, v25, v26, v27, v173, v188);
      v29 = v10;
      v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
      v32 = v31;

      v204 = sub_100013928(v30, v32, &v205);
      v33 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v204, &v205, v20 + 14);
      sub_1000062FC(v33, v34, v35, v36, v37, v38, v39, v40, v174, v189);
      sub_1000062FC(v41, v42, v43, v44, v45, v46, v47, v48, v175, v190);
      v49 = swift_bridgeObjectRelease(v32);
      *(_WORD *)(v20 + 22) = 2048;
      v56 = sub_10000633C(v49, "code", v50, v51, v52, v53, v54, v55, v176, v191);
      sub_1000062FC((int)v56, v57, v58, v59, v60, v61, v62, v63, v177, v192);
      v204 = (uint64_t)v56;
      v66 = sub_100006344(v64, v65);
      sub_1000062FC(v66, v67, v68, v69, v70, v71, v72, v73, v178, v193);
      *(_WORD *)(v20 + 32) = 2081;
      sub_100006334();
      v204 = sub_100013928(v29, v12, &v205);
      sub_100006344(v204, v74);
      sub_100006324(v12);
      _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v7, "%{public}s: %{public}s (%ld) %{private}s", (uint8_t *)v20, 0x2Au);
      sub_1000063BC();
      v75 = v179;
LABEL_6:
      sub_1000059B4(v75);
      sub_1000059B4(v20);

      sub_1000062FC(v131, v132, v133, v134, v135, v136, v137, v138, v179, v194);
      return;
    }
    sub_100006354(v12);
    v139 = v16;
  }
  else
  {
    v188 = v7;
    v76 = sub_100006334();
    v18 = v4;
    Logger.logObject.getter(v76);
    v77 = sub_10000636C();
    if (sub_10000639C(v77))
    {
      v20 = sub_100005A70(32);
      v78 = sub_100005A70(64);
      v205 = v78;
      *(_DWORD *)v20 = 136446723;
      v85 = sub_10000633C(v78, "domain", v79, v80, v81, v82, v83, v84, v172, v188);
      v86 = static String._unconditionallyBridgeFromObjectiveC(_:)(v85);
      v88 = v87;

      v204 = sub_100013928(v86, v88, &v205);
      v90 = sub_100006304(v204, v89);
      sub_1000062FC(v90, v91, v92, v93, v94, v95, v96, v97, v180, v195);
      sub_1000062FC(v98, v99, v100, v101, v102, v103, v104, v105, v181, v196);
      v106 = swift_bridgeObjectRelease(v88);
      *(_WORD *)(v20 + 12) = 2048;
      LODWORD(v86) = sub_10000633C(v106, "code", v107, v108, v109, v110, v111, v112, v182, v197);
      sub_1000062FC(v86, v113, v114, v115, v116, v117, v118, v119, v183, v198);
      v122 = sub_100006304(v120, v121);
      sub_1000062FC(v122, v123, v124, v125, v126, v127, v128, v129, v184, v199);
      *(_WORD *)(v20 + 22) = 2081;
      sub_100006334();
      v204 = sub_100013928(v10, v12, &v205);
      sub_100006304(v204, v130);
      sub_100006324(v12);
      _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v7, "%{public}s (%ld) %{private}s", (uint8_t *)v20, 0x20u);
      swift_arrayDestroy(v78, 2);
      v75 = v78;
      goto LABEL_6;
    }
    v139 = v12;
  }
  sub_100006354(v139);

  sub_1000062FC(v140, v141, v142, v143, v144, v145, v146, v147, v172, v188);
  sub_1000062FC(v148, v149, v150, v151, v152, v153, v154, v155, v185, v200);
  sub_1000062FC(v156, v157, v158, v159, v160, v161, v162, v163, v186, v201);
  sub_1000062FC(v164, v165, v166, v167, v168, v169, v170, v171, v187, v202);

}

void sub_1000062FC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

}

uint64_t sub_100006304(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v3;
  va_list va;

  va_start(va, a2);
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(va, v3, v2);
}

uint64_t sub_100006314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v4;
  uint64_t v5;
  va_list va;

  va_start(va, a4);
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(va, v5, v4);
}

uint64_t sub_100006324(uint64_t a1)
{
  return swift_bridgeObjectRelease_n(a1, 3);
}

id sub_10000632C(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_100006334()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(v0);
}

id sub_10000633C(int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  return objc_msgSend(a10, a2);
}

uint64_t sub_100006344(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v3;
  va_list va;

  va_start(va, a2);
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(va, v3, v2);
}

uint64_t sub_100006354(uint64_t a1)
{
  return swift_bridgeObjectRelease_n(a1, 2);
}

BOOL sub_10000635C(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_10000636C()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006374()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_10000637C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v4;
  uint64_t v5;
  va_list va;

  va_start(va, a4);
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(va, v5, v4);
}

uint64_t sub_10000638C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v4;
  uint64_t v5;
  va_list va;

  va_start(va, a4);
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(va, v5, v4);
}

BOOL sub_10000639C(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_1000063AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  unint64_t v5;
  va_list va;

  va_start(va, a5);
  return sub_100013928(a3, v5, (uint64_t *)va);
}

uint64_t sub_1000063BC()
{
  uint64_t v0;

  return swift_arrayDestroy(v0, 3);
}

void sub_1000063C8()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_100006AC8(OBJC_IVAR___HostRemoteViewController_serviceExtension);
  if (v0)
  {
    v1 = v0;
    if (qword_100022678 != -1)
      swift_once(&qword_100022678, sub_100006C00);
    sub_100009614();
    sub_100006ABC(v1);
  }
  else
  {
    sub_100005AB0();
  }
}

id sub_1000064A0(_QWORD *a1)
{
  return objc_msgSend((id)objc_opt_self(NSXPCInterface), "interfaceWithProtocol:", *a1);
}

id sub_100006500(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  NSString v6;
  id v7;
  objc_super v9;

  sub_100006AD0(OBJC_IVAR___HostRemoteViewController_serviceExtension);
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
  v9.super_class = (Class)type metadata accessor for HostRemoteViewController();
  v7 = objc_msgSendSuper2(&v9, "initWithNibName:bundle:", v6, a3);

  return v7;
}

id sub_1000065F0(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  sub_100006AD0(OBJC_IVAR___HostRemoteViewController_serviceExtension);
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HostRemoteViewController();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_10000666C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HostRemoteViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for HostRemoteViewController()
{
  return objc_opt_self(HostRemoteViewController);
}

void sub_1000066CC(uint64_t a1, uint64_t a2, void (**a3)(_QWORD))
{
  uint64_t Strong;
  uint64_t v5;

  Strong = swift_weakLoadStrong(a2 + OBJC_IVAR___HostRemoteViewController_serviceExtension);
  if (Strong)
  {
    v5 = Strong;
    _Block_copy(a3);
    if (qword_100022678 != -1)
      swift_once(&qword_100022678, sub_100006C00);
    _Block_copy(a3);
    sub_10000A72C();
    swift_release(v5);
    _Block_release(a3);
  }
  else
  {
    a3[2](a3);
  }
  _Block_release(a3);
}

uint64_t sub_1000067E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void sub_1000067F0(char a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100006AC8(OBJC_IVAR___HostRemoteViewController_serviceExtension);
  if (v2)
  {
    v3 = v2;
    if (qword_100022678 != -1)
      swift_once(&qword_100022678, sub_100006C00);
    *(_BYTE *)(v3 + 64) = a1 & 1;
    sub_10000BA14();
    sub_100006ABC(v3);
  }
  else
  {
    sub_100005AB0();
  }
}

void sub_1000068A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100006AC8(OBJC_IVAR___HostRemoteViewController_serviceExtension);
  if (v2)
  {
    v3 = v2;
    if (qword_100022678 != -1)
      swift_once(&qword_100022678, sub_100006C00);
    *(_QWORD *)(v3 + 72) = a1;
    sub_10000BAC0();
    sub_100006ABC(v3);
  }
  else
  {
    sub_100005AB0();
  }
}

uint64_t sub_10000695C()
{
  uint64_t result;
  uint64_t v1;

  result = sub_100006AC8(OBJC_IVAR___HostRemoteViewController_serviceExtension);
  if (result)
  {
    v1 = result;
    if (qword_100022678 != -1)
      swift_once(&qword_100022678, sub_100006C00);
    sub_10000CF04(v1);
    return swift_release(v1);
  }
  return result;
}

void sub_100006A04(char a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100006AC8(OBJC_IVAR___HostRemoteViewController_serviceExtension);
  if (v2)
  {
    v3 = v2;
    if (qword_100022678 != -1)
      swift_once(&qword_100022678, sub_100006C00);
    sub_10000CFD4(v3, a1 & 1);
    sub_100006ABC(v3);
  }
  else
  {
    sub_100005AB0();
  }
}

uint64_t sub_100006ABC(uint64_t a1)
{
  return swift_release(a1);
}

uint64_t sub_100006AC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return swift_weakLoadStrong(v1 + a1);
}

uint64_t sub_100006AD0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return swift_weakInit(v1 + a1, 0);
}

void sub_100006B18()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)sub_100012624();
  sub_100012550((uint64_t)v7.super_class, "initWithFrame:", v1, v2, v3, v4, v5, v6, v7);
  sub_100012710();
}

void sub_100006B9C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)sub_100012624();
  sub_100012550((uint64_t)v7.super_class, "initWithContentRect:", v1, v2, v3, v4, v5, v6, v7);
  sub_100012710();
}

id sub_100006BF4(uint64_t a1)
{
  return sub_10000F968(a1, type metadata accessor for SecureWindow);
}

id sub_100006C00()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ServiceManager()), "init");
  qword_1000230E0 = (uint64_t)result;
  return result;
}

void sub_100006C2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _BYTE v10[24];

  v1 = v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions;
  sub_100012358(v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions, (uint64_t)v10);
  sub_100012850();
  if (!v2)
  {
    v3 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    sub_100006334();
    if (v3)
      goto LABEL_3;
LABEL_10:
    sub_10001238C();
LABEL_11:
    sub_100012488();
    return;
  }
  sub_100006334();
  v3 = sub_1000126A8();
  if (!v3)
    goto LABEL_10;
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    v3 = sub_100012458();
LABEL_6:
    sub_10001238C();
    v5 = *(void **)(v3 + 56);
    v6 = v5;
    v7 = sub_100012540();
    if (v5)
    {
      v8 = sub_10001288C(v7, "serviceViewControllerProxy");
      v9 = sub_100012800(v8);

      sub_100012698();
      if (v9)
      {
        objc_msgSend(v9, "sidecarServiceSetBackgrounded:", *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager_inBackground));
        swift_unknownObjectRelease(v9);
      }
    }
    goto LABEL_11;
  }
  sub_100012844();
  if (v4)
  {
    sub_1000124B0();
    goto LABEL_6;
  }
  __break(1u);
}

void sub_100006D2C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__secureScreen);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__secureScreen) = a1;

}

id sub_100006D40()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  id v3;
  NSString v4;
  id v5;

  v1 = OBJC_IVAR____TtC7Sidecar14ServiceManager____lazy_storage____showDebugColors;
  v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager____lazy_storage____showDebugColors);
  if (v2 != 2)
    return (id)(v2 & 1);
  v3 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  v4 = String._bridgeToObjectiveC()();
  v5 = objc_msgSend(v3, "BOOLForKey:", v4);

  *(_BYTE *)(v0 + v1) = (_BYTE)v5;
  return v5;
}

uint64_t sub_100006DF4()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100005418(v0, qword_1000230E8);
  sub_100005400(v0, (uint64_t)qword_1000230E8);
  return Logger.init(subsystem:category:)(0xD000000000000011, 0x8000000100016C90, 0x65746E6573657270, 0xE900000000000072);
}

char *sub_100006E6C()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  _BYTE *v4;
  _QWORD *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char *v19;
  void *v20;
  char *v21;
  id v22;
  uint64_t v23;
  char *result;
  char *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v49;

  v0[OBJC_IVAR____TtC7Sidecar14ServiceManager_inBackground] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v0[OBJC_IVAR____TtC7Sidecar14ServiceManager__secureScreen] = 0;
  v1 = OBJC_IVAR____TtC7Sidecar14ServiceManager__baseViewController;
  v2 = type metadata accessor for ColorUIViewController();
  v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  v4 = v0;
  *(_QWORD *)&v0[v1] = sub_100012548((uint64_t)v4, "init");
  v4[OBJC_IVAR____TtC7Sidecar14ServiceManager____lazy_storage____showDebugColors] = 2;
  *(_QWORD *)&v4[OBJC_IVAR____TtC7Sidecar14ServiceManager_pendingActiveServices] = &_swiftEmptyDictionarySingleton;
  *(_QWORD *)&v4[OBJC_IVAR____TtC7Sidecar14ServiceManager_readyServiceUUIDs] = &_swiftEmptySetSingleton;
  v4[OBJC_IVAR____TtC7Sidecar14ServiceManager__wantsVolumeButtonEvents] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC7Sidecar14ServiceManager__backgroundStyle] = 0;
  v5 = &v4[OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig];
  v5[1] = 0;
  v5[2] = 0;
  *v5 = 0;
  v6 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SecureWindow()), "initWithFrame:", v8, v10, v12, v14);
  *(_QWORD *)&v4[OBJC_IVAR____TtC7Sidecar14ServiceManager_window] = v15;
  objc_msgSend(v15, "setHidden:", 0);
  v16 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ServiceNavigationController()), "initWithRootViewController:", *(_QWORD *)&v0[v1]);
  *(_QWORD *)&v4[OBJC_IVAR____TtC7Sidecar14ServiceManager_navigationController] = v16;
  v17 = objc_msgSend(v16, "navigationBar");
  objc_msgSend(v17, "setHidden:", 1);

  v18 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  objc_msgSend(v18, "beginGeneratingDeviceOrientationNotifications");

  v49.receiver = v4;
  v49.super_class = (Class)type metadata accessor for ServiceManager();
  v19 = (char *)objc_msgSendSuper2(&v49, "init");
  v20 = *(void **)&v19[OBJC_IVAR____TtC7Sidecar14ServiceManager_navigationController];
  v21 = v19;
  sub_1000125D8(v20, "setDelegate:");
  v22 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  v23 = OBJC_IVAR____TtC7Sidecar14ServiceManager_window;
  objc_msgSend(*(id *)&v21[OBJC_IVAR____TtC7Sidecar14ServiceManager_window], "setRootViewController:", v20);
  if ((sub_100006D40() & 1) == 0)
    goto LABEL_4;
  result = (char *)objc_msgSend(*(id *)&v21[OBJC_IVAR____TtC7Sidecar14ServiceManager__baseViewController], "view");
  if (result)
  {
    v25 = result;
    v26 = objc_msgSend((id)objc_opt_self(UIColor), "greenColor");
    sub_100012788(v25, "setBackgroundColor:");

LABEL_4:
    v27 = objc_msgSend(*(id *)&v21[v23], "makeKeyAndVisible");
    v30 = sub_1000125A4((uint64_t)v27, v28, v29, (uint64_t)"_screenDidConnectWithNote:", (uint64_t)UIScreenDidConnectNotification);
    v33 = sub_1000125A4((uint64_t)v30, v31, v32, (uint64_t)"_screenDidDisconnectWithNote:", (uint64_t)UIScreenDidDisconnectNotification);
    v37 = sub_100012374((uint64_t)v33, v34, v35, v36, _UIApplicationVolumeDownButtonDownNotification);
    v41 = sub_100012374((uint64_t)v37, v38, v39, v40, _UIApplicationVolumeDownButtonUpNotification);
    v45 = sub_100012374((uint64_t)v41, v42, v43, v44, _UIApplicationVolumeUpButtonDownNotification);
    sub_100012374((uint64_t)v45, v46, v47, v48, _UIApplicationVolumeUpButtonUpNotification);

    return v21;
  }
  __break(1u);
  return result;
}

id sub_10000721C()
{
  void *v0;
  id v1;
  objc_super v3;

  v1 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  sub_1000125D8(v1, "removeObserver:");

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for ServiceManager();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_100007334()
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
  id v10;
  uint64_t v11;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24[12];
  uint64_t v25;
  uint64_t v26;

  sub_100012394();
  v25 = v2;
  v26 = v3;
  v5 = v4;
  v7 = v6;
  v8 = sub_100005AF0();
  sub_100012400();
  ((void (*)(void))__chkstk_darwin)();
  sub_100012640();
  sub_100012464(v9, &qword_100022D90, NSExtension_ptr);
  sub_10001259C();
  v10 = sub_100007538(v7, v5);
  v13 = v10;
  if (!v10)
    return 0;
  if (qword_100022680 != -1)
    swift_once(&qword_100022680, sub_100006DF4);
  v14 = sub_100005400(v8, (uint64_t)qword_1000230E8);
  sub_1000123BC(v0, (uint64_t)v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  v15 = type metadata accessor for ServiceExtension(0);
  swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
  v16 = v13;
  v11 = sub_1000128F0(v0, v16);
  v17 = swift_retain(v11);
  Logger.logObject.getter(v17);
  v18 = sub_1000125C8();
  if (sub_10000639C(v18))
  {
    v19 = (uint8_t *)sub_100005A70(12);
    v20 = sub_100005A70(32);
    v24[0] = v20;
    *(_DWORD *)v19 = 136446210;
    v21 = *(_QWORD *)(v11 + 16);
    sub_1000126E0();
    v23 = sub_1000126D8(v21, v22, v24);
    sub_100012830((uint64_t)&v23, (uint64_t)v24);
    sub_100012884();
    sub_10001287C();
    sub_100012440((void *)&_mh_execute_header, v14, (os_log_type_t)v14, "Found Service Extension '%{public}s'", v19);
    sub_1000124A0(v20);
    sub_1000059B4(v20);
    sub_1000059B4((uint64_t)v19);

  }
  else
  {

    sub_100012884();
  }
  return v11;
}

id sub_100007538(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSString v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;

  if (a2)
  {
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v4 = 0;
  }
  v10 = 0;
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(v2), "extensionWithIdentifier:error:", v4, &v10);

  v6 = v10;
  if (v5)
  {
    v7 = v10;
  }
  else
  {
    v8 = v10;
    _convertNSErrorToError(_:)(v6);

    swift_willThrow();
  }
  return v5;
}

uint64_t sub_100007618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _QWORD *v7;
  id v8;

  v7 = (_QWORD *)sub_1000127D4((uint64_t)&unk_10001CEF8, 48);
  v7[2] = a1;
  v7[3] = a2;
  v7[4] = a3;
  v7[5] = v3;
  sub_100012438();
  swift_retain(a3);
  v8 = v3;
  sub_100012B10((uint64_t)sub_1000120C0, (uint64_t)v7);
  return swift_release(v7);
}

uint64_t sub_100007690(char a1, NSObject *a2, void (*a3)(uint64_t), uint64_t a4, char *a5)
{
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
  unint64_t v17;
  uint64_t isa;
  uint64_t v19;
  void (*v21)(char *, char *, uint64_t);
  Class v22;
  id v23;
  objc_class *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  void *v31;
  char *v32;
  char *v33;
  objc_class *v34;
  uint64_t v35;
  unint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  objc_class *v38;
  void (*v39)(uint64_t);
  uint64_t v40;
  char *v41;
  _QWORD aBlock[5];
  char *v43;
  char v44[24];

  v40 = a4;
  v41 = a5;
  v39 = a3;
  v7 = sub_1000054F4(&qword_100022D40);
  __chkstk_darwin(v7);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v10);
  v14 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v35 - v15;
  isa = (uint64_t)a2[2].isa;
  v17 = (unint64_t)a2[3].isa;
  if ((a1 & 1) == 0)
  {
    swift_bridgeObjectRetain(a2[3].isa);
    goto LABEL_5;
  }
  v19 = (uint64_t)a2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  swift_beginAccess((char *)a2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid, v44, 0, 0);
  sub_100011E38(v19, (uint64_t)v9, &qword_100022D40);
  if (sub_100011E28((uint64_t)v9, 1, v10) == 1)
  {
    swift_bridgeObjectRetain(v17);
    sub_100012018((uint64_t)v9, &qword_100022D40);
LABEL_5:
    sub_1000079D4(0, v39, v40, (uint64_t)v41, a2, isa, v17);
    return swift_bridgeObjectRelease(v17);
  }
  v21 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v21(v16, v9, v10);
  v22 = a2[7].isa;
  if (!v22)
  {
    swift_bridgeObjectRetain(v17);
    goto LABEL_10;
  }
  v37 = v21;
  swift_bridgeObjectRetain(v17);
  v38 = v22;
  v23 = -[objc_class serviceViewControllerProxy](v38, "serviceViewControllerProxy");
  v24 = (objc_class *)v23;

  swift_unknownObjectRelease(v23);
  v38 = v24;
  if (!v24)
  {
LABEL_10:
    sub_100007DEC(v41, isa, v17, (uint64_t)v16, (uint64_t)a2, (uint64_t (*)(_QWORD))v39, v40);
    swift_bridgeObjectRelease(v17);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  v25 = *(unsigned __int8 *)(v11 + 80);
  v26 = (v25 + 40) & ~v25;
  v27 = (v12 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
  v36 = (v27 + 23) & 0xFFFFFFFFFFFFFFF8;
  v28 = (char *)swift_allocObject(&unk_10001CF20, v36 + 8, v25 | 7);
  *((_QWORD *)v28 + 2) = v41;
  *((_QWORD *)v28 + 3) = isa;
  *((_QWORD *)v28 + 4) = v17;
  v37(&v28[v26], v14, v10);
  v29 = &v28[v27];
  v30 = v40;
  *(_QWORD *)v29 = v39;
  *((_QWORD *)v29 + 1) = v30;
  *(_QWORD *)&v28[v36] = a2;
  aBlock[4] = sub_100012138;
  v43 = v28;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100008944;
  aBlock[3] = &unk_10001CF38;
  v31 = _Block_copy(aBlock);
  v32 = v43;
  v33 = v41;
  swift_retain(v30);
  swift_retain(a2);
  swift_release(v32);
  v34 = v38;
  -[objc_class sidecarServiceShouldPresentWithCompletion:](v38, "sidecarServiceShouldPresentWithCompletion:", v31);
  _Block_release(v31);
  swift_unknownObjectRelease(v34);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

uint64_t sub_1000079D4(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, NSObject *a5, uint64_t a6, unint64_t a7)
{
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char v47[24];
  char v48[24];

  v43 = a6;
  sub_1000054F4(&qword_100022D40);
  ((void (*)(void))__chkstk_darwin)();
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for UUID(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = ((uint64_t (*)(void))__chkstk_darwin)();
  v18 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v44 = (char *)&v41 - v19;
  a2(a1);
  v20 = (uint64_t *)(a4 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions);
  result = swift_beginAccess(a4 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions, v48, 0, 0);
  v22 = *v20;
  if ((unint64_t)v22 >> 62)
  {
    if (v22 < 0)
      v39 = v22;
    else
      v39 = v22 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v22);
    v40 = _CocoaArrayWrapper.endIndex.getter(v39);
    result = swift_bridgeObjectRelease(v22);
    if (v40)
      return result;
  }
  else if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    return result;
  }
  v23 = (uint64_t)a5 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  swift_beginAccess((char *)a5 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid, v47, 0, 0);
  sub_100011E38(v23, (uint64_t)v13, &qword_100022D40);
  if (sub_100011E28((uint64_t)v13, 1, v14) == 1)
  {
    v24 = v44;
    if (qword_100022688 != -1)
      swift_once(&qword_100022688, sub_10000FE94);
    v25 = sub_100005400(v14, (uint64_t)qword_100022A30);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v24, v25, v14);
    sub_100012018((uint64_t)v13, &qword_100022D40);
  }
  else
  {
    v24 = v44;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v44, v13, v14);
  }
  if (qword_100022680 != -1)
    swift_once(&qword_100022680, sub_100006DF4);
  v42 = a5;
  v26 = type metadata accessor for Logger(0);
  sub_100005400(v26, (uint64_t)qword_1000230E8);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v18, v24, v14);
  v27 = swift_bridgeObjectRetain_n(a7, 2);
  v28 = Logger.logObject.getter(v27);
  v29 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = swift_slowAlloc(22, -1);
    v41 = a4;
    v31 = v30;
    v32 = swift_slowAlloc(64, -1);
    v46 = v32;
    *(_DWORD *)v31 = 136446466;
    swift_bridgeObjectRetain(a7);
    v45 = sub_100013928(v43, a7, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v31 + 4);
    v33 = swift_bridgeObjectRelease_n(a7, 3);
    *(_WORD *)(v31 + 12) = 2082;
    v34 = UUID.uuidString.getter(v33);
    v36 = v35;
    v45 = sub_100013928(v34, v35, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v31 + 14);
    swift_bridgeObjectRelease(v36);
    v37 = *(void (**)(char *, uint64_t))(v15 + 8);
    v37(v18, v14);
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "Service Extension '%{public}s' %{public}s Activation Failed", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy(v32, 2);
    v38 = v32;
    v24 = v44;
    swift_slowDealloc(v38, -1, -1);
    swift_slowDealloc(v31, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(a7, 2);
    v37 = *(void (**)(char *, uint64_t))(v15 + 8);
    v37(v18, v14);
  }

  sub_100009380(v42);
  return ((uint64_t (*)(char *, uint64_t))v37)(v24, v14);
}

uint64_t sub_100007DEC(char *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(_QWORD), uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  void *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  void *v44;
  _QWORD *v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  os_log_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t (*v63)(_QWORD);
  uint64_t v64;
  _BYTE v65[16];
  uint64_t v66[3];

  v61 = a7;
  v62 = a2;
  v63 = a6;
  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v58 = v14;
  v59 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v54 - v15;
  if (qword_100022680 != -1)
    swift_once(&qword_100022680, sub_100006DF4);
  v17 = type metadata accessor for Logger(0);
  sub_100005400(v17, (uint64_t)qword_1000230E8);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v18(v16, a4, v11);
  v19 = swift_bridgeObjectRetain_n(a3, 2);
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.default.getter();
  v22 = os_log_type_enabled(v20, v21);
  v60 = a3;
  if (v22)
  {
    v23 = swift_slowAlloc(22, -1);
    v57 = a5;
    v24 = v23;
    v56 = swift_slowAlloc(64, -1);
    v66[0] = v56;
    *(_DWORD *)v24 = 136446466;
    v55 = v20;
    swift_bridgeObjectRetain(a3);
    v64 = sub_100013928(v62, a3, v66);
    v54 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, v65, v24 + 4);
    v25 = swift_bridgeObjectRelease_n(a3, 3);
    *(_WORD *)(v24 + 12) = 2082;
    v26 = UUID.uuidString.getter(v25);
    v28 = v27;
    v64 = sub_100013928(v26, v27, v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, v65, v24 + 14);
    swift_bridgeObjectRelease(v28);
    v29 = v12;
    v11 = v54;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v54);
    v20 = v55;
    _os_log_impl((void *)&_mh_execute_header, v55, v21, "Loading Service Extension '%{public}s' %{public}s", (uint8_t *)v24, 0x16u);
    v30 = v56;
    swift_arrayDestroy(v56, 2);
    swift_slowDealloc(v30, -1, -1);
    v31 = v24;
    a5 = v57;
    swift_slowDealloc(v31, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(a3, 2);
    v29 = v12;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v11);
  }

  v32 = v11;
  v33 = (uint64_t *)&a1[OBJC_IVAR____TtC7Sidecar14ServiceManager_readyServiceUUIDs];
  swift_beginAccess(&a1[OBJC_IVAR____TtC7Sidecar14ServiceManager_readyServiceUUIDs], v66, 0, 0);
  v34 = *v33;
  swift_bridgeObjectRetain(v34);
  v35 = sub_100008244(a4, v34);
  swift_bridgeObjectRelease(v34);
  if ((v35 & 1) != 0)
  {
    sub_100008998();
  }
  else
  {
    sub_10000562C(0, (unint64_t *)&qword_1000227F8, OS_dispatch_queue_ptr);
    v36 = (void *)static OS_dispatch_queue.main.getter();
    v37 = v59;
    v18(v59, a4, v32);
    v38 = v29;
    v39 = *(unsigned __int8 *)(v29 + 80);
    v40 = (v39 + 40) & ~v39;
    v41 = (v58 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
    v42 = (_QWORD *)swift_allocObject(&unk_10001CF70, v41 + 8, v39 | 7);
    v43 = v32;
    v44 = a1;
    v45 = v42;
    v46 = v62;
    v42[2] = v44;
    v42[3] = v46;
    v47 = v60;
    v42[4] = v60;
    (*(void (**)(char *, char *, uint64_t))(v38 + 32))((char *)v42 + v40, v37, v43);
    *(_QWORD *)((char *)v45 + v41) = a5;
    swift_bridgeObjectRetain(v47);
    v48 = v44;
    swift_retain(a5);
    OS_dispatch_queue.once(_:closure:)();
    v50 = v49;
    swift_release(v45);

    v51 = *(_QWORD *)(a5 + 88);
    *(_QWORD *)(a5 + 88) = v50;
    swift_unknownObjectRetain(v50);
    swift_unknownObjectRelease(v51);
    swift_beginAccess(&v48[OBJC_IVAR____TtC7Sidecar14ServiceManager_pendingActiveServices], &v64, 33, 0);
    v52 = swift_retain(a5);
    sub_100010610(v52, a4);
    swift_endAccess(&v64);
    swift_unknownObjectRelease(v50);
  }
  return v63(0);
}

uint64_t sub_100008244(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, unint64_t, uint64_t);
  uint64_t v15;
  char v16;
  uint64_t v18;
  uint64_t v19;

  v4 = type metadata accessor for UUID(0);
  v19 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16)
    && (v7 = *(_QWORD *)(a2 + 40),
        sub_100012050(&qword_100022D78, (uint64_t)&protocol conformance descriptor for UUID),
        v9 = dispatch thunk of Hashable._rawHashValue(seed:)(v7, v4, v8),
        v10 = -1 << *(_BYTE *)(a2 + 32),
        v11 = v9 & ~v10,
        ((*(_QWORD *)(a2 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0))
  {
    v12 = ~v10;
    v13 = *(_QWORD *)(v19 + 72);
    v14 = *(void (**)(char *, unint64_t, uint64_t))(v19 + 16);
    do
    {
      v14(v6, *(_QWORD *)(a2 + 48) + v13 * v11, v4);
      sub_100012050(&qword_100022D68, (uint64_t)&protocol conformance descriptor for UUID);
      v16 = dispatch thunk of static Equatable.== infix(_:_:)(v6, a1, v4, v15);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v4);
      if ((v16 & 1) != 0)
        break;
      v11 = (v11 + 1) & v12;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  }
  else
  {
    v16 = 0;
  }
  return v16 & 1;
}

void sub_1000083B8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD v25[4];
  uint64_t v26;
  uint64_t v27;

  v25[3] = a1;
  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100022680 != -1)
    swift_once(&qword_100022680, sub_100006DF4);
  v13 = type metadata accessor for Logger(0);
  sub_100005400(v13, (uint64_t)qword_1000230E8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a4, v9);
  v14 = swift_bridgeObjectRetain_n(a3, 2);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc(22, -1);
    v25[1] = a5;
    v18 = v17;
    v19 = swift_slowAlloc(64, -1);
    v25[2] = a4;
    v20 = v19;
    v27 = v19;
    *(_DWORD *)v18 = 136446466;
    swift_bridgeObjectRetain(a3);
    v26 = sub_100013928(a2, a3, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v18 + 4);
    v21 = swift_bridgeObjectRelease_n(a3, 3);
    *(_WORD *)(v18 + 12) = 2082;
    v22 = UUID.uuidString.getter(v21);
    v24 = v23;
    v26 = sub_100013928(v22, v23, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v18 + 14);
    swift_bridgeObjectRelease(v24);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Service Extension '%{public}s' %{public}s Timed Out (Activating Anyway)", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy(v20, 2);
    swift_slowDealloc(v20, -1, -1);
    swift_slowDealloc(v18, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(a3, 2);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }

  sub_100008998();
}

uint64_t sub_10000862C(uint64_t a1, char *a2, uint64_t a3, unint64_t a4, uint64_t a5, void (*a6)(uint64_t), uint64_t a7, NSObject *a8)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  os_log_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  os_log_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  char *v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  uint64_t v46;
  uint64_t v47;

  v45 = a6;
  v15 = type metadata accessor for UUID(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
    return sub_100007DEC(a2, a3, a4, a5, (uint64_t)a8, (uint64_t (*)(_QWORD))v45, a7);
  v43 = a2;
  v44 = a3;
  swift_errorRetain(a1);
  if (qword_100022680 != -1)
    swift_once(&qword_100022680, sub_100006DF4);
  v19 = type metadata accessor for Logger(0);
  sub_100005400(v19, (uint64_t)qword_1000230E8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a5, v15);
  v20 = swift_bridgeObjectRetain_n(a4, 2);
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.default.getter();
  v23 = v22;
  if (os_log_type_enabled(v21, v22))
  {
    v24 = swift_slowAlloc(22, -1);
    v42 = a8;
    v25 = v24;
    v40 = swift_slowAlloc(64, -1);
    v47 = v40;
    *(_DWORD *)v25 = 136446466;
    v39 = v23;
    swift_bridgeObjectRetain(a4);
    v38 = v21;
    v26 = v44;
    v46 = sub_100013928(v44, a4, &v47);
    v41 = a7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47, v25 + 4);
    v27 = swift_bridgeObjectRelease_n(a4, 3);
    *(_WORD *)(v25 + 12) = 2082;
    v28 = UUID.uuidString.getter(v27);
    v30 = v29;
    v46 = sub_100013928(v28, v29, &v47);
    a7 = v41;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47, v25 + 14);
    v31 = v30;
    v32 = v26;
    swift_bridgeObjectRelease(v31);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    v33 = v38;
    _os_log_impl((void *)&_mh_execute_header, v38, (os_log_type_t)v39, "Service Extension '%{public}s' %{public}s Declined Presentation", (uint8_t *)v25, 0x16u);
    v34 = v40;
    swift_arrayDestroy(v40, 2);
    swift_slowDealloc(v34, -1, -1);
    v35 = v25;
    a8 = v42;
    swift_slowDealloc(v35, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n(a4, 2);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);

    v32 = v44;
  }
  v37 = (uint64_t)v43;
  swift_errorRetain(a1);
  sub_1000079D4(a1, v45, a7, v37, a8, v32, a4);
  swift_errorRelease(a1);
  return swift_errorRelease(a1);
}

void sub_100008944(uint64_t a1, void *a2)
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

void sub_100008998()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[3];

  sub_100012394();
  v2 = v0;
  v4 = v3;
  v6 = v5;
  sub_1000054F4(&qword_100022D40);
  sub_1000123AC();
  __chkstk_darwin(v7);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100005AE8();
  sub_100012400();
  __chkstk_darwin(v11);
  sub_100012510();
  v14 = v13 - v12;
  v15 = v6[11];
  if (v15)
  {
    swift_getObjectType(v6[11]);
    sub_100012810();
    OS_dispatch_source.cancel()();
    swift_unknownObjectRelease(v15);
    v16 = v6[11];
    v6[11] = 0;
    swift_unknownObjectRelease(v16);
  }
  if (qword_100022680 != -1)
    swift_once(&qword_100022680, sub_100006DF4);
  v17 = sub_100005AF0();
  sub_100012730(v17, (uint64_t)qword_1000230E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v14, v4, v10);
  v18 = swift_retain(v6);
  v19 = v10;
  v20 = Logger.logObject.getter(v18);
  v21 = static os_log_type_t.default.getter();
  if (sub_100012668(v20))
  {
    v22 = sub_100005A70(22);
    v33 = v9;
    v23 = v22;
    v24 = sub_100005A70(64);
    v32 = v19;
    v25 = v24;
    v37[0] = v24;
    *(_DWORD *)v23 = 136446466;
    v34 = v4;
    v35 = v2;
    v26 = v6[2];
    v27 = v6[3];
    swift_bridgeObjectRetain(v27);
    v36 = sub_100013928(v26, v27, v37);
    sub_1000125D0((uint64_t)&v36, (uint64_t)v37);
    sub_100012540();
    v28 = sub_100012690();
    *(_WORD *)(v23 + 12) = 2082;
    v29 = UUID.uuidString.getter(v28);
    v36 = sub_100012588(v29, v30);
    v4 = v34;
    v2 = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37, v23 + 14);
    sub_10001236C();
    (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v14, v32);
    sub_1000123C4((void *)&_mh_execute_header, v20, v21, "Service Extension '%{public}s' %{public}s Activated", (uint8_t *)v23);
    sub_100012448(v25);
    sub_1000059B4(v25);
    v31 = v23;
    v9 = v33;
    sub_1000059B4(v31);
  }
  else
  {
    sub_100012540();
    sub_100012450(v14, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  }

  sub_100012364(v2 + OBJC_IVAR____TtC7Sidecar14ServiceManager_readyServiceUUIDs, (uint64_t)v37, 33);
  sub_1000109F8(v4, (uint64_t)v9);
  sub_100012018((uint64_t)v9, &qword_100022D40);
  sub_10001283C();
  sub_100008C28((uint64_t)v6);
  sub_1000059E4();
}

void sub_100008C28(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[24];
  _BYTE v24[24];

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions);
  swift_beginAccess(v3, v24, 0, 0);
  v4 = *v3;
  if ((unint64_t)*v3 >> 62)
  {
    if (v4 < 0)
      v18 = *v3;
    else
      v18 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v3);
    v5 = _CocoaArrayWrapper.endIndex.getter(v18);
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(*v3);
  }
  if (!v5)
  {
    swift_bridgeObjectRelease(v4);
    goto LABEL_11;
  }
  if ((v4 & 0xC000000000000001) != 0)
    goto LABEL_38;
  if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v6 = *(_QWORD *)(v4 + 32);
  swift_retain(v6);
  while (1)
  {
    swift_bridgeObjectRelease(v4);
    v7 = *(void **)(v6 + 56);
    v8 = v7;
    swift_release(v6);
    if (v7)
    {
      v9 = objc_msgSend(v8, "serviceViewControllerProxy");
      v10 = v9;

      swift_unknownObjectRelease(v9);
      if (v10)
      {
        objc_msgSend(v10, "sidecarServiceSetActive:", 0);
        swift_unknownObjectRelease(v10);
      }
    }
LABEL_11:
    v11 = *v3;
    if ((unint64_t)*v3 >> 62)
    {
      if (v11 < 0)
        v19 = *v3;
      else
        v19 = v11 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*v3);
      if (!_CocoaArrayWrapper.endIndex.getter(v19))
      {
LABEL_27:
        swift_bridgeObjectRelease(v11);
        goto LABEL_28;
      }
    }
    else
    {
      v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(*v3);
      if (!v12)
        goto LABEL_27;
    }
    if ((v11 & 0xC000000000000001) != 0)
    {
      v13 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v11);
    }
    else
    {
      if (!*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_41;
      v13 = *(_QWORD *)(v11 + 32);
      swift_retain(v13);
    }
    swift_bridgeObjectRelease(v11);
    v14 = *(void **)(v13 + 56);
    v15 = v14;
    swift_release(v13);
    if (v14)
    {
      v16 = objc_msgSend(v15, "serviceViewControllerProxy");
      v17 = v16;

      swift_unknownObjectRelease(v16);
      if (v17)
      {
        objc_msgSend(v17, "sidecarServiceSetBackgrounded:", 1);
        swift_unknownObjectRelease(v17);
      }
    }
LABEL_28:
    swift_beginAccess(v3, v23, 33, 0);
    v4 = *v3;
    if (!((unint64_t)*v3 >> 62))
      break;
    if (v4 < 0)
      v21 = *v3;
    else
      v21 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_retain(a1);
    swift_bridgeObjectRetain(v4);
    v22 = _CocoaArrayWrapper.endIndex.getter(v21);
    swift_bridgeObjectRelease(v4);
    if ((v22 & 0x8000000000000000) == 0)
      goto LABEL_30;
    __break(1u);
LABEL_38:
    v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v4);
  }
  swift_retain(a1);
LABEL_30:
  sub_100011728(0, 0, a1);
  swift_endAccess(v23);
  v20 = *(void **)(a1 + 56);
  if (!v20 || ((unint64_t)objc_msgSend(v20, "supportedInterfaceOrientations") & 0x8000000000000000) == 0)
  {
    SidecarServicePresenterReady();
    sub_10000E08C(a1);
    return;
  }
LABEL_42:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Not enough bits to represent the passed value", 45, 2, "Swift/Integers.swift", 20, 2, 3687, 0);
  __break(1u);
}

void sub_100008F6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  os_log_type_t v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t (*v48)(char *, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53[3];

  sub_100012394();
  v1 = v0;
  v3 = v2;
  v4 = sub_100005AE8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = ((char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v46 - v10;
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v46 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v46 - v15;
  sub_100012364(v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager_pendingActiveServices, (uint64_t)v53, 33);
  v17 = sub_10001047C(v3);
  sub_10001283C();
  if (v17)
  {
    if (qword_100022680 != -1)
      swift_once(&qword_100022680, sub_100006DF4);
    v18 = sub_100005AF0();
    sub_100012730(v18, (uint64_t)qword_1000230E8);
    sub_1000123BC((uint64_t)v16, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
    v19 = swift_retain(v17);
    Logger.logObject.getter(v19);
    v20 = sub_100012744();
    if (os_log_type_enabled(v8, v20))
    {
      v21 = (uint8_t *)sub_100005A70(22);
      v49 = sub_100005A70(64);
      v53[0] = v49;
      *(_DWORD *)v21 = 136446466;
      v51 = v0;
      v48 = (uint64_t (*)(char *, uint64_t, uint64_t))v4;
      v22 = *(_QWORD *)(v17 + 16);
      v23 = *(_QWORD *)(v17 + 24);
      sub_100006374();
      v52 = sub_100013928(v22, v23, v53);
      v50 = v5;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, v53, v21 + 4);
      sub_100012670();
      swift_bridgeObjectRelease(v23);
      sub_1000128B0();
      v25 = UUID.uuidString.getter(v24);
      v52 = sub_100012588(v25, v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, v53, v21 + 14);
      sub_10001236C();
      (*(void (**)(char *, uint64_t (*)(char *, uint64_t, uint64_t)))(v50 + 8))(v16, v48);
      sub_1000123C4((void *)&_mh_execute_header, v8, v20, "Service Extension '%{public}s' %{public}s Ready", v21);
      v27 = v49;
      sub_100012448(v49);
      sub_1000059B4(v27);
      sub_1000059B4((uint64_t)v21);
    }
    else
    {
      sub_100012670();
      sub_100012638((uint64_t)v16, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
    }

    sub_100008998();
    sub_100012670();
  }
  else
  {
    if (qword_100022680 != -1)
      swift_once(&qword_100022680, sub_100006DF4);
    v28 = sub_100005AF0();
    sub_100012730(v28, (uint64_t)qword_1000230E8);
    v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v49 = v3;
    v30 = v29(v14, v3, v4);
    v31 = Logger.logObject.getter(v30);
    v32 = v5;
    v33 = static os_log_type_t.default.getter();
    if (sub_100012668(v31))
    {
      v50 = v32;
      v34 = sub_100005A70(12);
      v48 = v29;
      v35 = (uint8_t *)v34;
      v36 = sub_100005A70(32);
      v51 = v1;
      v37 = v36;
      v53[0] = v36;
      *(_DWORD *)v35 = 136446210;
      v47 = v35 + 4;
      v38 = UUID.uuidString.getter(v36);
      v40 = sub_100012588(v38, v39);
      v41 = sub_10001274C(v40);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v41, v42, v47);
      sub_10001236C();
      v43 = *(void (**)(char *, uint64_t))(v50 + 8);
      sub_100012870();
      sub_100012440((void *)&_mh_execute_header, v31, v33, "Service Extension %{public}s Ready (Not Loaded)", v35);
      sub_1000124A0(v37);
      v44 = v37;
      v1 = v51;
      sub_1000059B4(v44);
      v45 = (uint64_t)v35;
      v29 = v48;
      sub_1000059B4(v45);
    }
    else
    {
      v43 = *(void (**)(char *, uint64_t))(v32 + 8);
      sub_100012870();
    }

    v29((char *)v8, v49, v4);
    sub_100012364(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager_readyServiceUUIDs, (uint64_t)v53, 33);
    sub_100011984((uint64_t)v11, (char *)v8);
    v43(v11, v4);
    sub_10001283C();
  }
  sub_1000059E4();
}

void sub_100009380(NSObject *a1)
{
  uint64_t v1;
  os_log_type_t v2;
  uint64_t v3;
  _BOOL8 v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t isa;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = v1;
  HIBYTE(v18) = 0;
  if (SBSGetScreenLockStatus((char *)&v18 + 7))
  {
    v5 = HIBYTE(v18) != 0;
    v6 = 0xD000000000000018;
    v7 = 0x8000000100017380;
LABEL_3:
    SBSLockDevice(v5, 0);
    goto LABEL_10;
  }
  v6 = 0xD000000000000010;
  if (a1)
  {
    if ((isa = (uint64_t)a1[2].isa, v9 = (uint64_t)a1[3].isa, isa == 0xD000000000000023) && v9 == 0x80000001000173C0
      || (sub_1000128A0(isa, v9, 0xD000000000000023, 0x80000001000173C0) & 1) != 0)
    {
      if ((*(_BYTE *)(v3 + OBJC_IVAR____TtC7Sidecar14ServiceManager_inBackground) & 1) == 0)
      {
        v6 = 0xD000000000000021;
        v7 = 0x80000001000173F0;
        v5 = 1;
        goto LABEL_3;
      }
    }
  }
  v7 = 0x80000001000173A0;
LABEL_10:
  if (qword_100022680 != -1)
    swift_once(&qword_100022680, sub_100006DF4);
  v10 = sub_100005AF0();
  sub_100012730(v10, (uint64_t)qword_1000230E8);
  v11 = sub_1000127E4();
  Logger.logObject.getter(v11);
  v12 = sub_1000125C8();
  if (sub_1000124C8(v12))
  {
    v13 = (uint8_t *)sub_100005A70(12);
    v14 = sub_100005A70(32);
    v19 = v14;
    *(_DWORD *)v13 = 136446210;
    sub_1000127E4();
    v17 = sub_100013928(v6, v7, &v19);
    sub_100012894((uint64_t)&v17, (uint64_t)&v18);
    swift_bridgeObjectRelease_n(v7, 3);
    sub_100012440((void *)&_mh_execute_header, a1, v2, "Idle Exiting: %{public}s", v13);
    sub_1000124A0(v14);
    sub_1000059B4(v14);
    sub_1000059B4((uint64_t)v13);

  }
  else
  {

    swift_bridgeObjectRelease_n(v7, 2);
  }
  v15 = *(void **)(v3 + OBJC_IVAR____TtC7Sidecar14ServiceManager_window);
  v16 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
  sub_1000125D8(v15, "setScreen:");

  if (!UIApp)
    __break(1u);
  objc_msgSend(UIApp, "terminateWithSuccess");
  sub_10001246C();
}

void sub_100009614()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  sub_100012394();
  v42 = v0;
  v3 = v2;
  v5 = v4;
  v6 = sub_100005AF0();
  sub_100012400();
  __chkstk_darwin(v7);
  sub_100012510();
  v10 = v9 - v8;
  sub_1000054F4(&qword_100022D40);
  sub_1000123AC();
  __chkstk_darwin(v11);
  v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100005AE8();
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  sub_1000124FC();
  v41 = v16;
  sub_10001285C();
  __chkstk_darwin(v17);
  v19 = (char *)&v40 - v18;
  v44 = v5;
  v20 = v5 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  sub_100012358(v20, (uint64_t)&v47);
  sub_100011E38(v20, (uint64_t)v13, &qword_100022D40);
  sub_1000126BC((uint64_t)v13);
  v43 = v15;
  if (v21)
  {
    if (qword_100022688 != -1)
      swift_once(&qword_100022688, sub_10000FE94);
    v22 = sub_100005400(v14, (uint64_t)qword_100022A30);
    v23 = v43;
    sub_1000123BC((uint64_t)v19, v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v43 + 16));
    sub_100012018((uint64_t)v13, &qword_100022D40);
    v24 = v44;
    if (!v3)
      goto LABEL_10;
  }
  else
  {
    sub_1000123BC((uint64_t)v19, (uint64_t)v13, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 32));
    v24 = v44;
    v23 = v15;
    if (!v3)
    {
LABEL_10:
      if (qword_100022680 != -1)
        swift_once(&qword_100022680, sub_100006DF4);
      sub_100012730(v6, (uint64_t)qword_1000230E8);
      v27 = v41;
      sub_1000123BC(v41, (uint64_t)v19, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 16));
      v28 = swift_retain(v24);
      v29 = Logger.logObject.getter(v28);
      v30 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = sub_100005A70(22);
        v40 = sub_100005A70(64);
        v46 = v40;
        *(_DWORD *)v31 = 136446466;
        v32 = *(_QWORD *)(v24 + 16);
        v33 = *(_QWORD *)(v44 + 24);
        sub_1000126E0();
        v45 = sub_1000126D8(v32, v34, &v46);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v31 + 4);
        swift_release(v44);
        v35 = v33;
        v24 = v44;
        v36 = swift_bridgeObjectRelease(v35);
        *(_WORD *)(v31 + 12) = 2082;
        v37 = UUID.uuidString.getter(v36);
        v45 = sub_100013928(v37, v38, &v46);
        v23 = v43;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, &v46, v31 + 14);
        sub_10001236C();
        sub_100012638(v27, *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
        sub_1000123C4((void *)&_mh_execute_header, v29, v30, "Service Extension '%{public}s' %{public}s Terminated", (uint8_t *)v31);
        v39 = v40;
        sub_100012448(v40);
        sub_1000059B4(v39);
        sub_1000059B4(v31);
      }
      else
      {
        swift_release(v24);
        sub_100012638(v27, *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
      }

      goto LABEL_16;
    }
  }
  swift_errorRetain(v3);
  if (qword_100022680 != -1)
    swift_once(&qword_100022680, sub_100006DF4);
  v25 = sub_100005400(v6, (uint64_t)qword_1000230E8);
  v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v10, v25, v6);
  __chkstk_darwin(v26);
  *(&v40 - 2) = v24;
  *(&v40 - 1) = (uint64_t)v19;
  swift_errorRetain(v3);
  sub_100005AF8(sub_100011EC0, &v40 - 4, v10, v3);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v10, v6);
  swift_errorRelease(v3);
  v23 = v43;
LABEL_16:
  sub_100009A18(v24, 0, v42);
  sub_100012638((uint64_t)v19, *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
  sub_1000059E4();
}

void sub_100009A18(unint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  unint64_t v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  char v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  char v84;
  id v85;
  uint64_t *v86;
  id v87;
  uint64_t v88;
  _QWORD *v89;
  id v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  id v96;
  unint64_t v97;
  char v98;
  char v99;
  id v100;
  uint64_t v101;
  Class isa;
  id v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  void *v113;
  id v114;
  id v115;
  id v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t *v121;
  char *v122;
  uint64_t v123;
  unint64_t v124;
  char *v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  _BYTE v129[24];
  uint64_t v130[3];
  char v131[24];

  v6 = sub_1000054F4(&qword_100022D40);
  __chkstk_darwin(v6);
  v8 = (char *)&v120 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v126 = (char *)&v120 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v120 - v14;
  __chkstk_darwin(v13);
  v17 = (char *)&v120 - v16;
  v18 = a1 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  swift_beginAccess(a1 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid, v131, 0, 0);
  sub_100011E38(v18, (uint64_t)v8, &qword_100022D40);
  if (sub_100011E28((uint64_t)v8, 1, v9) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v17, v8, v9);
    swift_beginAccess(&a3[OBJC_IVAR____TtC7Sidecar14ServiceManager_pendingActiveServices], v130, 33, 0);
    v33 = (_QWORD *)sub_10001047C((uint64_t)v17);
    swift_endAccess(v130);
    v125 = a3;
    v123 = a2;
    if (v33)
    {
      if (qword_100022680 != -1)
        swift_once(&qword_100022680, sub_100006DF4);
      v34 = type metadata accessor for Logger(0);
      sub_100005400(v34, (uint64_t)qword_1000230E8);
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v15, v17, v9);
      v35 = swift_retain(v33);
      v36 = Logger.logObject.getter(v35);
      v37 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = swift_slowAlloc(22, -1);
        v124 = a1;
        v39 = v38;
        v40 = swift_slowAlloc(64, -1);
        v121 = (uint64_t *)v9;
        v41 = v40;
        v130[0] = v40;
        *(_DWORD *)v39 = 136446466;
        v122 = v17;
        v42 = v33[2];
        v43 = v33[3];
        swift_bridgeObjectRetain(v43);
        v128 = sub_100013928(v42, v43, v130);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v128, v129, v39 + 4);
        swift_release(v33);
        v44 = swift_bridgeObjectRelease(v43);
        *(_WORD *)(v39 + 12) = 2082;
        v45 = UUID.uuidString.getter(v44);
        v47 = v46;
        v128 = sub_100013928(v45, v46, v130);
        v17 = v122;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v128, v129, v39 + 14);
        swift_bridgeObjectRelease(v47);
        (*(void (**)(char *, uint64_t *))(v10 + 8))(v15, v121);
        _os_log_impl((void *)&_mh_execute_header, v36, v37, "Service Extension '%{public}s' %{public}s Deactivated (Not Active)", (uint8_t *)v39, 0x16u);
        swift_arrayDestroy(v41, 2);
        v48 = v41;
        v9 = (uint64_t)v121;
        swift_slowDealloc(v48, -1, -1);
        v49 = v39;
        a1 = v124;
        swift_slowDealloc(v49, -1, -1);
      }
      else
      {
        swift_release(v33);
        (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
      }

      v50 = v33[11];
      a3 = v125;
      if (v50)
      {
        swift_getObjectType(v33[11]);
        swift_unknownObjectRetain(v50);
        OS_dispatch_source.cancel()();
        swift_unknownObjectRelease(v50);
        v51 = v33[11];
      }
      else
      {
        v51 = 0;
      }
      v33[11] = 0;
      swift_release(v33);
      swift_unknownObjectRelease(v51);
    }
    v52 = (uint64_t *)&a3[OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions];
    v53 = swift_beginAccess(&a3[OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions], v130, 0, 0);
    v54 = *v52;
    __chkstk_darwin(v53);
    *(&v120 - 2) = (uint64_t)v17;
    swift_bridgeObjectRetain(v54);
    v55 = sub_10000B614(sub_100011EF8, (uint64_t)(&v120 - 4), v54);
    v57 = v56;
    swift_bridgeObjectRelease(v54);
    if ((v57 & 1) != 0)
    {
      sub_100013484();
      sub_10000C324();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v17, v9);
      return;
    }
    v124 = v55;
    if (qword_100022680 != -1)
      swift_once(&qword_100022680, sub_100006DF4);
    v58 = type metadata accessor for Logger(0);
    sub_100005400(v58, (uint64_t)qword_1000230E8);
    v59 = v126;
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v126, v17, v9);
    v60 = swift_retain(a1);
    v61 = Logger.logObject.getter(v60);
    v62 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = swift_slowAlloc(22, -1);
      v121 = v52;
      v64 = a1;
      v65 = v63;
      v120 = swift_slowAlloc(64, -1);
      v128 = v120;
      *(_DWORD *)v65 = 136446466;
      v122 = v17;
      v66 = v9;
      v67 = *(_QWORD *)(v64 + 16);
      v68 = *(_QWORD *)(v64 + 24);
      swift_bridgeObjectRetain(v68);
      v127 = sub_100013928(v67, v68, &v128);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128, v65 + 4);
      swift_release(v64);
      v69 = swift_bridgeObjectRelease(v68);
      *(_WORD *)(v65 + 12) = 2082;
      v70 = UUID.uuidString.getter(v69);
      v72 = v71;
      v127 = sub_100013928(v70, v71, &v128);
      v9 = v66;
      v17 = v122;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128, v65 + 14);
      swift_bridgeObjectRelease(v72);
      v126 = *(char **)(v10 + 8);
      ((void (*)(char *, uint64_t))v126)(v59, v9);
      _os_log_impl((void *)&_mh_execute_header, v61, v62, "Service Extension '%{public}s' %{public}s Deactivated", (uint8_t *)v65, 0x16u);
      v73 = v120;
      swift_arrayDestroy(v120, 2);
      swift_slowDealloc(v73, -1, -1);
      v74 = v65;
      a1 = v64;
      v52 = v121;
      swift_slowDealloc(v74, -1, -1);
    }
    else
    {
      swift_release(a1);
      v126 = *(char **)(v10 + 8);
      ((void (*)(char *, uint64_t))v126)(v59, v9);
    }

    swift_beginAccess(v52, &v128, 33, 0);
    sub_10000B72C(v124);
    v76 = v75;
    swift_endAccess(&v128);
    swift_release(v76);
    v77 = v125;
    v78 = *(void **)&v125[OBJC_IVAR____TtC7Sidecar14ServiceManager_navigationController];
    v79 = objc_msgSend(v78, "topViewController");
    v80 = *(void **)(a1 + 56);
    if (v79)
    {
      v81 = v79;
      if (!v80)
      {

        goto LABEL_39;
      }
      sub_10000562C(0, &qword_100022D30, UIViewController_ptr);
      v82 = v80;
      v83 = v81;
      v84 = static NSObject.== infix(_:_:)(v83, v82);

      if ((v84 & 1) == 0)
      {
LABEL_39:
        v91 = v9;
        v92 = objc_msgSend(v78, "viewControllers");
        v93 = sub_10000562C(0, &qword_100022D30, UIViewController_ptr);
        v94 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v92, v93);

        v128 = v94;
        v95 = *(void **)(a1 + 56);
        if (v95)
        {
          swift_bridgeObjectRetain(v94);
          v96 = v95;
          v97 = sub_10000C18C((uint64_t)v96, v94);
          v99 = v98;
          swift_bridgeObjectRelease(v94);

          if ((v99 & 1) != 0)
          {
            swift_bridgeObjectRelease(v94);
          }
          else
          {
            sub_10000B72C(v97);

            v101 = v128;
            isa = Array._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease(v101);
            objc_msgSend(v78, "setViewControllers:", isa);

          }
          sub_100013484();
          sub_10000C324();
LABEL_61:
          v117 = v17;
          v118 = v91;
LABEL_62:
          ((void (*)(char *, uint64_t))v126)(v117, v118);
          return;
        }
        goto LABEL_70;
      }
    }
    else
    {
      if (v80)
        goto LABEL_39;
      v85 = 0;
    }
    if (!UIApp)
    {
LABEL_71:
      __break(1u);
      return;
    }
    v86 = v52;
    v87 = objc_msgSend(UIApp, "applicationState");
    v88 = v123;
    if (!v123 || v87)
    {

      sub_100013484();
      sub_10000C324();
    }
    else
    {
      v121 = (uint64_t *)v9;
      v89 = (_QWORD *)swift_allocObject(&unk_10001CE80, 48, 7);
      v89[2] = v77;
      v89[3] = a1;
      v89[4] = nullsub_1;
      v89[5] = 0;
      swift_retain(a1);
      v77;
      sub_10000D3F8(v88, (uint64_t)sub_100011F18, (uint64_t)v89);
      v90 = objc_msgSend(v78, "popViewControllerAnimated:", 1);
      sub_10000D3F8(0, 0, 0);
      if (v90)
      {

      }
      else
      {
        sub_100013484();
        sub_10000C324();
      }
      v9 = (uint64_t)v121;
    }
    v103 = objc_msgSend(v78, "topViewController");
    if (v103)
    {
      v104 = v103;
      sub_10000B7F4((unint64_t)objc_msgSend(v103, "supportedInterfaceOrientations"));

    }
    sub_10000BA14();
    sub_10000BAC0();
    sub_10000CFE0();
    v105 = *v86;
    if ((unint64_t)*v86 >> 62)
    {
      if (v105 < 0)
        v119 = *v86;
      else
        v119 = v105 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*v86);
      if (_CocoaArrayWrapper.endIndex.getter(v119))
      {
LABEL_51:
        if ((v105 & 0xC000000000000001) != 0)
        {
          v91 = v9;
          v107 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v105);
        }
        else
        {
          if (!*(_QWORD *)((v105 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
LABEL_70:
            __break(1u);
            goto LABEL_71;
          }
          v91 = v9;
          v107 = *(_QWORD *)(v105 + 32);
          swift_retain(v107);
        }
        v108 = swift_bridgeObjectRelease(v105);
        v109 = *(void **)(v107 + 56);
        if (v109)
        {
          v110 = v109;
          v111 = objc_msgSend(v110, "serviceViewControllerProxy");
          v112 = v111;

          v108 = swift_unknownObjectRelease(v111);
          if (v112)
          {
            objc_msgSend(v112, "sidecarServiceSetActive:", 1);
            v108 = swift_unknownObjectRelease(v112);
          }
          v113 = *(void **)(v107 + 56);
          if (v113)
          {
            v114 = v113;
            v115 = objc_msgSend(v114, "serviceViewControllerProxy");
            v116 = v115;

            v108 = swift_unknownObjectRelease(v115);
            if (v116)
            {
              objc_msgSend(v116, "sidecarServiceSetBackgrounded:", 0);
              v108 = swift_unknownObjectRelease(v116);
            }
          }
        }
        SBSUndimScreen(v108);
        sub_10000BB6C();
        swift_release(v107);
        goto LABEL_61;
      }
    }
    else
    {
      v106 = *(_QWORD *)((v105 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(*v86);
      if (v106)
        goto LABEL_51;
    }
    swift_bridgeObjectRelease(v105);
    v117 = v17;
    v118 = v9;
    goto LABEL_62;
  }
  sub_100012018((uint64_t)v8, &qword_100022D40);
  if (qword_100022680 != -1)
    swift_once(&qword_100022680, sub_100006DF4);
  v19 = type metadata accessor for Logger(0);
  sub_100005400(v19, (uint64_t)qword_1000230E8);
  v20 = swift_retain(a1);
  v21 = Logger.logObject.getter(v20);
  v22 = a1;
  v23 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v23))
  {
    v24 = v9;
    v25 = swift_slowAlloc(22, -1);
    v26 = swift_slowAlloc(64, -1);
    v130[0] = v26;
    *(_DWORD *)v25 = 136446466;
    v27 = *(_QWORD *)(v22 + 16);
    v28 = *(_QWORD *)(v22 + 24);
    swift_bridgeObjectRetain(v28);
    v128 = sub_100013928(v27, v28, v130);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v128, v129, v25 + 4);
    v124 = v22;
    swift_release(v22);
    swift_bridgeObjectRelease(v28);
    *(_WORD *)(v25 + 12) = 2082;
    if (qword_100022688 != -1)
      swift_once(&qword_100022688, sub_10000FE94);
    v29 = sub_100005400(v24, (uint64_t)qword_100022A30);
    v30 = UUID.uuidString.getter(v29);
    v32 = v31;
    v128 = sub_100013928(v30, v31, v130);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v128, v129, v25 + 14);
    swift_bridgeObjectRelease(v32);
    _os_log_impl((void *)&_mh_execute_header, v21, v23, "Service Extension '%{public}s' %{public}s Deactivated (Not Loaded)", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy(v26, 2);
    swift_slowDealloc(v26, -1, -1);
    swift_slowDealloc(v25, -1, -1);

  }
  else
  {

    swift_release(v22);
  }
  sub_100013484();
  sub_10000C324();
}

void sub_10000A72C()
{
  uint64_t v0;
  objc_class *v1;
  objc_class *v2;
  char *v3;
  char *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  os_log_type_t v61;
  uint64_t v62;
  uint64_t v63;
  objc_class *v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  void (*v70)(uint64_t, void (**)(_QWORD));
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  uint64_t v74;
  _QWORD *v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  char v81;
  id v82;
  id v83;
  _QWORD *v84;
  _QWORD *v85;
  void *v86;
  id v87;
  uint64_t v88;
  void (**v89)(_QWORD);
  id v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  id v94;
  unint64_t v95;
  char v96;
  char v97;
  id v98;
  Class isa;
  objc_class *v100;
  id v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  id v108;
  id v109;
  void *v110;
  id v111;
  id v112;
  uint64_t v113;
  void (**v114)(_QWORD);
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  NSObject *v120;
  char *v121;
  _QWORD *v122;
  uint64_t v123;
  uint64_t v124;
  _BYTE v125[24];
  uint64_t v126[3];
  uint64_t v127;

  sub_100012394();
  v2 = v1;
  v4 = v3;
  v117 = v5;
  v7 = v6;
  sub_1000054F4(&qword_100022D40);
  sub_1000123AC();
  __chkstk_darwin(v8);
  sub_100012640();
  v9 = (void (**)(_QWORD))sub_100005AE8();
  v10 = (uint64_t)*(v9 - 1);
  __chkstk_darwin(v9);
  sub_1000124FC();
  v119 = v11;
  sub_10001285C();
  v13 = __chkstk_darwin(v12);
  v15 = (char *)&v113 - v14;
  __chkstk_darwin(v13);
  v17 = (char *)&v113 - v16;
  v18 = sub_1000127D4((uint64_t)&unk_10001CF98, 24);
  v18[2].isa = v2;
  v122 = v7;
  v19 = (uint64_t)v7 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  sub_100012358(v19, (uint64_t)&v127);
  sub_100011E38(v19, v0, &qword_100022D40);
  v20 = &off_100022000;
  if (sub_100012824(v0) == 1)
  {
    v21 = (uint64_t)v9;
    _Block_copy(v2);
    sub_100012018(v0, &qword_100022D40);
    if (qword_100022680 != -1)
      swift_once(&qword_100022680, sub_100006DF4);
    v22 = sub_100005AF0();
    sub_100012730(v22, (uint64_t)qword_1000230E8);
    v23 = v122;
    v24 = sub_100012438();
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v116 = (uint64_t *)v2;
      v120 = v18;
      v27 = sub_100005A70(22);
      v28 = sub_100005A70(64);
      v126[0] = v28;
      *(_DWORD *)v27 = 136446466;
      v29 = v23;
      v30 = v23[2];
      v31 = v23[3];
      sub_1000127E4();
      v124 = sub_100013928(v30, v31, v126);
      sub_1000125D0((uint64_t)&v124, (uint64_t)v125);
      swift_release(v29);
      sub_1000126A0();
      *(_WORD *)(v27 + 12) = 2082;
      if (qword_100022688 != -1)
        swift_once(&qword_100022688, sub_10000FE94);
      v32 = sub_100012730(v21, (uint64_t)qword_100022A30);
      v33 = UUID.uuidString.getter(v32);
      v124 = sub_10001277C(v33, v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v124, v125, v27 + 14);
      sub_10001236C();
      sub_1000123C4((void *)&_mh_execute_header, v25, v26, "Service Extension '%{public}s' %{public}s Deactivated (Not Loaded)", (uint8_t *)v27);
      sub_100012448(v28);
      sub_1000059B4(v28);
      sub_1000059B4(v27);

      v18 = v120;
      v2 = (objc_class *)v116;
    }
    else
    {

      sub_100012498();
    }
    sub_100013484();
    sub_10000C324();
    sub_1000124BC();
    v47 = v18;
    goto LABEL_63;
  }
  v120 = v18;
  sub_100012774((uint64_t)v17, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 32));
  sub_100012364((uint64_t)&v4[OBJC_IVAR____TtC7Sidecar14ServiceManager_pendingActiveServices], (uint64_t)v126, 33);
  _Block_copy(v2);
  v121 = v17;
  v35 = sub_10001047C((uint64_t)v17);
  swift_endAccess(v126);
  if (v35)
  {
    if (qword_100022680 != -1)
      swift_once(&qword_100022680, sub_100006DF4);
    v36 = sub_100005AF0();
    sub_100005400(v36, (uint64_t)qword_1000230E8);
    sub_100012774((uint64_t)v15, (uint64_t)v121, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16));
    v37 = sub_100012868();
    Logger.logObject.getter(v37);
    v38 = sub_100012744();
    if (sub_100012700(v38))
    {
      v39 = sub_100005A70(22);
      v115 = sub_100005A70(64);
      v126[0] = v115;
      *(_DWORD *)v39 = 136446466;
      v116 = (uint64_t *)v2;
      v118 = v4;
      v40 = *(_QWORD *)(v35 + 16);
      sub_1000126E0();
      v124 = sub_1000126D8(v40, v41, v126);
      sub_1000125D0((uint64_t)&v124, (uint64_t)v125);
      sub_1000125E0();
      v42 = sub_10001287C();
      *(_WORD *)(v39 + 12) = 2082;
      v43 = UUID.uuidString.getter(v42);
      v124 = sub_10001277C(v43, v44);
      v2 = (objc_class *)v116;
      v4 = v118;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v124, v125, v39 + 14);
      sub_10001236C();
      sub_100012450((uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
      sub_1000123C4((void *)&_mh_execute_header, v18, (os_log_type_t)v9, "Service Extension '%{public}s' %{public}s Deactivated (Not Active)", (uint8_t *)v39);
      v45 = v115;
      sub_100012448(v115);
      sub_1000059B4(v45);
      v46 = v39;
      v20 = &off_100022000;
      sub_1000059B4(v46);
    }
    else
    {
      sub_1000125E0();
      sub_100012450((uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
    }

    v48 = *(_QWORD *)(v35 + 88);
    if (v48)
    {
      swift_getObjectType(*(_QWORD *)(v35 + 88));
      sub_100012810();
      OS_dispatch_source.cancel()();
      swift_unknownObjectRelease(v48);
    }
    *(_QWORD *)(v35 + 88) = 0;
    sub_1000125E0();
    sub_1000126E8();
  }
  v49 = v20;
  v50 = (uint64_t *)&v4[OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions];
  v51 = sub_100012358((uint64_t)&v4[OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions], (uint64_t)v126);
  v116 = v50;
  v52 = *v50;
  __chkstk_darwin(v51);
  v53 = (uint64_t)v121;
  *(&v113 - 2) = (uint64_t)v121;
  sub_100006334();
  v54 = sub_10000B614(sub_1000122F8, (uint64_t)(&v113 - 4), v52);
  v56 = v55;
  sub_10001238C();
  if ((v56 & 1) != 0)
  {
    sub_100013484();
    sub_10000C324();
    sub_1000124BC();
    (*(void (**)(uint64_t, void (**)(_QWORD)))(v10 + 8))(v53, v9);
    v47 = v120;
LABEL_63:
    swift_release(v47);
    v100 = v2;
LABEL_64:
    _Block_release(v100);
    sub_1000059E4();
    return;
  }
  v115 = v54;
  v57 = v122;
  if (v49[208].isa != (Class)-1)
    swift_once(&qword_100022680, sub_100006DF4);
  v118 = v4;
  v58 = sub_100005AF0();
  sub_100005400(v58, (uint64_t)qword_1000230E8);
  v59 = v119;
  sub_100012774(v119, v53, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16));
  v60 = sub_100012438();
  Logger.logObject.getter(v60);
  v61 = sub_100012744();
  if (os_log_type_enabled(v49, v61))
  {
    v62 = sub_100005A70(22);
    v113 = sub_100005A70(64);
    v114 = v9;
    v124 = v113;
    *(_DWORD *)v62 = 136446466;
    v63 = v122[2];
    v64 = v2;
    v65 = v122[3];
    sub_100012808();
    v123 = sub_100013928(v63, v65, &v124);
    sub_100012580((uint64_t)&v123, (uint64_t)&v124);
    swift_release(v122);
    v66 = v65;
    v2 = v64;
    v53 = (uint64_t)v121;
    v67 = swift_bridgeObjectRelease(v66);
    *(_WORD *)(v62 + 12) = 2082;
    v68 = UUID.uuidString.getter(v67);
    v123 = sub_1000127AC(v68, v69);
    sub_100012580((uint64_t)&v123, (uint64_t)&v124);
    sub_10001236C();
    v70 = *(void (**)(uint64_t, void (**)(_QWORD)))(v10 + 8);
    v70(v59, v114);
    sub_1000123C4((void *)&_mh_execute_header, v49, v61, "Service Extension '%{public}s' %{public}s Deactivated", (uint8_t *)v62);
    v71 = v113;
    sub_100012448(v113);
    v9 = v114;
    sub_1000059B4(v71);
    v72 = v62;
    v57 = v122;
    sub_1000059B4(v72);
  }
  else
  {
    sub_100012498();
    v70 = *(void (**)(uint64_t, void (**)(_QWORD)))(v10 + 8);
    v70(v59, v9);
  }

  v73 = v120;
  sub_100012364((uint64_t)v116, (uint64_t)&v124, 33);
  sub_10000B72C(v115);
  swift_endAccess(&v124);
  v74 = sub_100012884();
  v75 = *(_QWORD **)&v118[OBJC_IVAR____TtC7Sidecar14ServiceManager_navigationController];
  v76 = sub_100012548(v74, "topViewController");
  v77 = (void *)v57[7];
  if (v76)
  {
    v78 = v76;
    if (!v77)
    {

      goto LABEL_38;
    }
    sub_100012464((uint64_t)v76, &qword_100022D30, UIViewController_ptr);
    v79 = v77;
    v80 = v78;
    v81 = static NSObject.== infix(_:_:)(v80, v79);

    if ((v81 & 1) == 0)
    {
LABEL_38:
      v89 = v9;
      v9 = (void (**)(_QWORD))v2;
      v90 = sub_100012548((uint64_t)v76, "viewControllers");
      v91 = sub_100012464((uint64_t)v90, &qword_100022D30, UIViewController_ptr);
      v92 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v90, v91);

      v124 = v92;
      v93 = (void *)v122[7];
      if (v93)
      {
        sub_10001259C();
        v94 = v93;
        v95 = sub_10000C18C((uint64_t)v94, v92);
        v97 = v96;
        sub_10001236C();

        if ((v97 & 1) != 0)
        {
          sub_10001236C();
        }
        else
        {
          sub_10000B72C(v95);

          isa = Array._bridgeToObjectiveC()().super.isa;
          sub_10001236C();
          objc_msgSend(v75, "setViewControllers:", isa);

        }
        sub_100013484();
        sub_10000C324();
        v9[2](v9);
        v70((uint64_t)v121, v89);
        swift_release(v73);
        v100 = (objc_class *)v9;
        goto LABEL_64;
      }
      goto LABEL_67;
    }
  }
  else
  {
    if (v77)
      goto LABEL_38;
    v82 = 0;
  }
  if (UIApp)
  {
    v83 = objc_msgSend(UIApp, "applicationState");
    v84 = v122;
    if (!v117 || v83)
    {

      sub_100013484();
      sub_10000C324();
      v88 = sub_1000124BC();
    }
    else
    {
      v85 = (_QWORD *)sub_1000127D4((uint64_t)&unk_10001CFC0, 48);
      v86 = v118;
      v85[2] = v118;
      v85[3] = v84;
      v85[4] = sub_10001229C;
      v85[5] = v73;
      sub_100012438();
      v86;
      swift_retain(v73);
      sub_10000D3F8(v117, (uint64_t)sub_100012310, (uint64_t)v85);
      v87 = objc_msgSend(v75, "popViewControllerAnimated:", 1);
      sub_10000D3F8(0, 0, 0);
      if (v87)
      {

      }
      else
      {
        sub_100013484();
        sub_10000C324();
        v88 = sub_1000124BC();
      }
      v73 = v120;
    }
    v101 = sub_100012548(v88, "topViewController");
    if (v101)
    {
      v102 = v101;
      sub_10000B7F4((unint64_t)objc_msgSend(v101, "supportedInterfaceOrientations"));

    }
    sub_10000BA14();
    sub_10000BAC0();
    sub_10000CFE0();
    v103 = *v116;
    if ((unint64_t)*v116 >> 62)
    {
      sub_100006334();
      if (sub_100012594())
        goto LABEL_50;
    }
    else
    {
      v104 = *(_QWORD *)((v103 & 0xFFFFFFFFFFFFF8) + 0x10);
      sub_100006334();
      if (v104)
      {
LABEL_50:
        if ((v103 & 0xC000000000000001) != 0)
        {
          v75 = (_QWORD *)sub_100012458();
        }
        else
        {
          sub_100012844();
          if (!v105)
          {
            __break(1u);
LABEL_67:
            _Block_release(v9);
            __break(1u);
            goto LABEL_68;
          }
          sub_1000124B0();
        }
        v106 = sub_10001238C();
        v107 = (void *)v75[7];
        if (v107)
        {
          v108 = v107;
          v109 = sub_100012800(objc_msgSend(v108, "serviceViewControllerProxy"));

          v106 = sub_100012698();
          if (v109)
          {
            objc_msgSend(v109, "sidecarServiceSetActive:", 1);
            v106 = sub_1000126E8();
          }
          v110 = (void *)v75[7];
          if (v110)
          {
            v111 = v110;
            v112 = sub_100012800(objc_msgSend(v111, "serviceViewControllerProxy"));

            v106 = sub_100012698();
            if (v112)
            {
              objc_msgSend(v112, "sidecarServiceSetBackgrounded:", 0);
              v106 = sub_1000126E8();
            }
          }
        }
        SBSUndimScreen(v106);
        sub_10000BB6C();
        sub_100012540();
        goto LABEL_62;
      }
    }
    sub_10001238C();
LABEL_62:
    v70(v53, v9);
    v47 = v73;
    goto LABEL_63;
  }
LABEL_68:
  _Block_release(v2);
  __break(1u);
}

uint64_t sub_10000B2F4(_QWORD *a1, uint64_t a2)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t *v21;
  char v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char v31[24];

  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v29 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000054F4(&qword_100022D60);
  __chkstk_darwin(v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000054F4(&qword_100022D40);
  v11 = __chkstk_darwin(v10);
  v30 = (uint64_t)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v28 - v14;
  __chkstk_darwin(v13);
  v17 = (char *)&v28 - v16;
  v18 = *a1 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  swift_beginAccess(v18, v31, 0, 0);
  sub_100011E38(v18, (uint64_t)v17, &qword_100022D40);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v15, a2, v4);
  sub_10000FF08((uint64_t)v15, 0, 1, v4);
  v19 = (uint64_t)&v9[*(int *)(v7 + 48)];
  sub_100011E38((uint64_t)v17, (uint64_t)v9, &qword_100022D40);
  sub_100011E38((uint64_t)v15, v19, &qword_100022D40);
  if (sub_100011E28((uint64_t)v9, 1, v4) == 1)
  {
    sub_100012018((uint64_t)v15, &qword_100022D40);
    sub_100012018((uint64_t)v17, &qword_100022D40);
    v20 = sub_100011E28(v19, 1, v4);
    if (v20 == 1)
      v21 = &qword_100022D40;
    else
      v21 = &qword_100022D60;
    if (v20 == 1)
      v22 = -1;
    else
      v22 = 0;
  }
  else
  {
    v23 = v30;
    sub_100011E38((uint64_t)v9, v30, &qword_100022D40);
    if (sub_100011E28(v19, 1, v4) == 1)
    {
      sub_100012018((uint64_t)v15, &qword_100022D40);
      sub_100012018((uint64_t)v17, &qword_100022D40);
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v23, v4);
      v22 = 0;
      v21 = &qword_100022D60;
    }
    else
    {
      v24 = v29;
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v29, v19, v4);
      sub_100012050(&qword_100022D68, (uint64_t)&protocol conformance descriptor for UUID);
      v22 = dispatch thunk of static Equatable.== infix(_:_:)(v23, v24, v4, v25);
      v26 = *(void (**)(char *, uint64_t))(v5 + 8);
      v26(v24, v4);
      v21 = &qword_100022D40;
      sub_100012018((uint64_t)v15, &qword_100022D40);
      sub_100012018((uint64_t)v17, &qword_100022D40);
      v26((char *)v23, v4);
    }
  }
  sub_100012018((uint64_t)v9, v21);
  return v22 & 1;
}

uint64_t sub_10000B614(uint64_t (*a1)(uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v4 = v3;
  if ((unint64_t)a3 >> 62)
  {
LABEL_14:
    if (a3 < 0)
      v13 = a3;
    else
      v13 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v13);
    swift_bridgeObjectRelease(a3);
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v8 = 0;
  if (v7)
  {
    while (1)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        v9 = specialized _ArrayBuffer._getElementSlowPath(_:)(v8, a3);
      }
      else
      {
        v9 = *(_QWORD *)(a3 + 8 * v8 + 32);
        swift_retain(v9);
      }
      v14 = v9;
      v10 = a1(&v14);
      swift_release(v9);
      if (v4 || (v10 & 1) != 0)
        break;
      v11 = v8 + 1;
      if (__OFADD__(v8, 1))
      {
        __break(1u);
        goto LABEL_14;
      }
      ++v8;
      if (v11 == v7)
        return 0;
    }
  }
  return v8;
}

void sub_10000B72C(unint64_t a1)
{
  unint64_t *v1;
  unint64_t v3;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;

  v3 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    v3 = sub_100011DCC(v3);
    *v1 = v3;
  }
  v5 = v3 & 0xFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = sub_10000FF14((char *)(v5 + 8 * a1 + 40), v6 - 1 - a1, (char *)(v5 + 8 * a1 + 32));
    *(_QWORD *)(v5 + 16) = v7;
    specialized Array._endMutation()(v8);
    sub_100005AB0();
  }
}

uint64_t sub_10000B7AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  sub_100013484();
  sub_10000C324();
  return a3();
}

void sub_10000B7F4(unint64_t a1)
{
  NSObject *v1;
  os_log_type_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31[2];

  v3 = a1;
  if ((sub_10000F998(a1) & 1) == 0)
  {
    v4 = 2;
    v5 = 3;
    if ((v3 & 0x10) == 0)
      v5 = 4;
    v6 = 3;
    if ((~v3 & 0x18) != 0)
      v6 = v5;
    if ((v3 & 4) == 0)
      v4 = v6;
    if ((v3 & 2) != 0)
      v7 = 1;
    else
      v7 = v4;
    if (qword_100022680 != -1)
      swift_once(&qword_100022680, sub_100006DF4);
    v8 = sub_100005AF0();
    sub_100005400(v8, (uint64_t)qword_1000230E8);
    sub_1000124A8();
    v9 = sub_1000125C8();
    if (sub_10000639C(v9))
    {
      v10 = sub_100005A70(32);
      v11 = sub_100005A70(64);
      v31[1] = v11;
      *(_DWORD *)v10 = 136446722;
      v12 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
      v13 = objc_msgSend(v12, "orientation");

      v14 = UIDeviceOrientation.description.getter((uint64_t)v13);
      v16 = v15;
      sub_1000127DC(v14, v15, v17);
      sub_100012718();
      sub_100012580(v18, v19);
      swift_bridgeObjectRelease(v16);
      *(_WORD *)(v10 + 12) = 2082;
      v20 = UIDeviceOrientation.description.getter(v7);
      v22 = v21;
      v31[0] = sub_1000127DC(v20, v21, v23);
      sub_100012580((uint64_t)v31, (uint64_t)v13);
      v24 = swift_bridgeObjectRelease(v22);
      *(_WORD *)(v10 + 22) = 2048;
      sub_100012680(v24, v25, v10 + 24, v10 + 32, v26, v27, v28, v29, v31[0]);
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Forcing Orientation: %{public}s -> %{public}s (extension mask %lx)", (uint8_t *)v10, 0x20u);
      sub_100012448(v11);
      sub_1000059B4(v11);
      sub_1000059B4(v10);
    }

    v30 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
    objc_msgSend(v30, "setOrientation:animated:", v7, 0);

  }
}

void sub_10000BA14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  _BYTE v6[24];

  v1 = v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions;
  sub_100012358(v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions, (uint64_t)v6);
  sub_100012850();
  if (!v2)
  {
    v3 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    sub_100006334();
    if (v3)
      goto LABEL_3;
LABEL_8:
    sub_10001238C();
    v5 = 0;
    goto LABEL_9;
  }
  sub_100006334();
  v3 = sub_1000126A8();
  if (!v3)
    goto LABEL_8;
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    v3 = sub_100012458();
    goto LABEL_6;
  }
  sub_100012844();
  if (v4)
  {
    sub_1000124B0();
LABEL_6:
    sub_10001238C();
    v5 = *(_BYTE *)(v3 + 64);
    sub_100012540();
LABEL_9:
    sub_10000D2D4(v5);
    sub_100012488();
    return;
  }
  __break(1u);
}

void sub_10000BAC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[24];

  v1 = v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions;
  sub_100012358(v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions, (uint64_t)v6);
  sub_100012850();
  if (!v2)
  {
    v3 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    sub_100006334();
    if (v3)
      goto LABEL_3;
LABEL_8:
    sub_10001238C();
    v5 = 0;
    goto LABEL_9;
  }
  sub_100006334();
  v3 = sub_1000126A8();
  if (!v3)
    goto LABEL_8;
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    v3 = sub_100012458();
    goto LABEL_6;
  }
  sub_100012844();
  if (v4)
  {
    sub_1000124B0();
LABEL_6:
    sub_10001238C();
    v5 = *(_QWORD *)(v3 + 72);
    sub_100012540();
LABEL_9:
    sub_10000D3E0(v5);
    sub_100012488();
    return;
  }
  __break(1u);
}

void sub_10000BB6C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
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
  char v20;
  uint64_t v21;
  void (**v22)(id, uint64_t);
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void (**v37)(id, uint64_t);
  uint64_t v38;
  int v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  void (**v43)(id, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t inited;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  NSString v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void (*v61)(uint64_t, char *, uint64_t);
  void *v62;
  id v63;
  id v64;
  const void *v65;
  void **v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, char *, uint64_t);
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  int v75;
  char *v76;
  id v77;
  void (**v78)(id, uint64_t);
  uint64_t v79;
  void **v80;
  uint64_t v81;
  void (*v82)(uint64_t, void *, void *);
  void *v83;
  uint64_t (*v84)();
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;

  sub_100012394();
  v74 = v0;
  v2 = v1;
  v3 = sub_100005AF0();
  v78 = *(void (***)(id, uint64_t))(v3 - 8);
  __chkstk_darwin(v3);
  sub_100012760();
  v77 = v4;
  sub_1000054F4(&qword_100022D40);
  sub_1000123AC();
  __chkstk_darwin(v5);
  sub_100012510();
  v8 = v7 - v6;
  v9 = sub_100005AE8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v71 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v66 - v14;
  v70 = v16;
  __chkstk_darwin(v13);
  v18 = (char *)&v66 - v17;
  v75 = SBSGetScreenLockStatus(0);
  v19 = v2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  sub_100012358(v2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid, (uint64_t)&v87);
  sub_100011E38(v19, v8, &qword_100022D40);
  sub_1000126BC(v8);
  if (v20)
  {
    if (qword_100022688 != -1)
      swift_once(&qword_100022688, sub_10000FE94);
    v21 = sub_100005400(v9, (uint64_t)qword_100022A30);
    sub_1000123BC((uint64_t)v18, v21, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16));
    sub_100012018(v8, &qword_100022D40);
  }
  else
  {
    sub_1000123BC((uint64_t)v18, v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 32));
  }
  v23 = v77;
  v22 = v78;
  if (qword_100022680 != -1)
    swift_once(&qword_100022680, sub_100006DF4);
  v24 = sub_100005400(v3, (uint64_t)qword_1000230E8);
  ((void (*)(id, uint64_t, uint64_t))v22[2])(v23, v24, v3);
  v69 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v69(v15, v18, v9);
  v25 = sub_100012868();
  v26 = Logger.logObject.getter(v25);
  v27 = static os_log_type_t.default.getter();
  v28 = os_log_type_enabled(v26, v27);
  v72 = v10;
  v73 = v2;
  if (v28)
  {
    v29 = sub_100005A70(32);
    v76 = v18;
    v30 = v29;
    v66 = (void **)sub_100005A70(96);
    v80 = v66;
    *(_DWORD *)v30 = 136446722;
    v67 = v3;
    v68 = v9;
    v31 = v10;
    v32 = *(_QWORD *)(v2 + 16);
    sub_1000126E0();
    v79 = sub_1000126D8(v32, v33, (uint64_t *)&v80);
    sub_1000125D0((uint64_t)&v79, (uint64_t)&v80);
    sub_1000125E0();
    v34 = sub_10001287C();
    *(_WORD *)(v30 + 12) = 2082;
    v35 = UUID.uuidString.getter(v34);
    v79 = sub_100013928(v35, v36, (uint64_t *)&v80);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v79, &v80, v30 + 14);
    sub_10001236C();
    v37 = *(void (***)(id, uint64_t))(v31 + 8);
    v9 = v68;
    ((void (*)(char *, uint64_t))v37)(v15, v68);
    *(_WORD *)(v30 + 22) = 2082;
    v39 = v75;
    if (v75)
      v40 = 0x64656B636F4CLL;
    else
      v40 = 0x64656B636F6C6E55;
    if (v75)
      v41 = 0xE600000000000000;
    else
      v41 = 0xE800000000000000;
    v79 = sub_1000128A8(v40, v38, (uint64_t *)&v80);
    sub_100012580((uint64_t)&v79, (uint64_t)&v80);
    v42 = v41;
    v43 = v37;
    swift_bridgeObjectRelease(v42);
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Launching Service Extension '%{public}s' %{public}s (Screen %{public}s)", (uint8_t *)v30, 0x20u);
    v44 = (uint64_t)v66;
    swift_arrayDestroy(v66, 3);
    sub_1000059B4(v44);
    v45 = v30;
    v18 = v76;
    sub_1000059B4(v45);

    v78[1](v77, v67);
    if (!v39)
      goto LABEL_18;
  }
  else
  {
    sub_1000125E0();
    v43 = *(void (***)(id, uint64_t))(v10 + 8);
    ((void (*)(char *, uint64_t))v43)(v15, v9);

    v78[1](v77, v3);
    if (!v75)
    {
LABEL_18:
      v77 = objc_msgSend(objc_allocWithZone((Class)FBSOpenApplicationService), "init");
      sub_100012464((uint64_t)v77, &qword_100022D50, FBSOpenApplicationOptions_ptr);
      v78 = v43;
      v46 = sub_1000054F4(&qword_100022D58);
      inited = swift_initStackObject(v46, &v86);
      *(_OWORD *)(inited + 16) = xmmword_1000169F0;
      v76 = v18;
      v80 = (void **)static String._unconditionallyBridgeFromObjectiveC(_:)(FBSOpenApplicationOptionKeyActivateSuspended);
      v81 = v48;
      sub_1000125E8();
      *(_QWORD *)(inited + 96) = &type metadata for Bool;
      *(_BYTE *)(inited + 72) = 0;
      v80 = (void **)static String._unconditionallyBridgeFromObjectiveC(_:)(SBSOpenApplicationOptionKeyLaunchWithoutAnimation);
      v81 = v49;
      sub_1000125E8();
      *(_QWORD *)(inited + 168) = &type metadata for Bool;
      *(_BYTE *)(inited + 144) = 1;
      v50 = Dictionary.init(dictionaryLiteral:)(inited, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
      v51 = sub_10000E3E4(v50);
      v52 = String._bridgeToObjectiveC()();
      v53 = v71;
      v69(v71, v76, v9);
      v54 = v9;
      v55 = v72;
      v56 = *(unsigned __int8 *)(v72 + 80);
      v57 = (v56 + 32) & ~v56;
      v58 = swift_allocObject(&unk_10001CEA8, v57 + v70, v56 | 7);
      v60 = v73;
      v59 = v74;
      *(_QWORD *)(v58 + 16) = v74;
      *(_QWORD *)(v58 + 24) = v60;
      v61 = *(void (**)(uint64_t, char *, uint64_t))(v55 + 32);
      v9 = v54;
      v61(v58 + v57, v53, v54);
      v84 = sub_100011F94;
      v85 = v58;
      v80 = _NSConcreteStackBlock;
      v81 = 1107296256;
      v82 = sub_10000E650;
      v83 = &unk_10001CEC0;
      v62 = _Block_copy(&v80);
      sub_100012868();
      v63 = v59;
      sub_100012670();
      v64 = v77;
      objc_msgSend(v77, "openApplication:withOptions:completion:", v52, v51, v62);
      v65 = v62;
      v18 = v76;
      _Block_release(v65);

      v43 = v78;
    }
  }
  ((void (*)(char *, uint64_t))v43)(v18, v9);
  sub_1000059E4();
}

uint64_t sub_10000C18C(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  char v7;
  unint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;

  v3 = result;
  if ((unint64_t)a2 >> 62)
    goto LABEL_22;
  v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    if ((a2 & 0xC000000000000001) != 0)
    {
      v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a2);
    }
    else
    {
      if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return result;
      }
      v5 = *(id *)(a2 + 32);
    }
    v6 = v5;
    sub_10000562C(0, &qword_100022D30, UIViewController_ptr);
    v7 = static NSObject.== infix(_:_:)(v6, v3);

    if ((v7 & 1) != 0)
      return 0;
    for (i = 0; ; ++i)
    {
      v8 = i + 1;
      if (__OFADD__(i, 1))
        break;
      if (v8 == v4)
        return 0;
      if ((a2 & 0xC000000000000001) != 0)
      {
        v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i + 1, a2);
      }
      else
      {
        if ((v8 & 0x8000000000000000) != 0)
          goto LABEL_20;
        if (v8 >= *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_21;
        v10 = *(id *)(a2 + 32 + 8 * v8);
      }
      v11 = v10;
      v12 = static NSObject.== infix(_:_:)(v10, v3);

      if ((v12 & 1) != 0)
        return v8;
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    if (a2 < 0)
      v13 = a2;
    else
      v13 = a2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a2);
    v4 = _CocoaArrayWrapper.endIndex.getter(v13);
    result = swift_bridgeObjectRelease(a2);
  }
  return 0;
}

void sub_10000C324()
{
  NSObject *v0;
  NSObject *v1;
  NSObject *v2;
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t);
  uint64_t v50;
  NSObject *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  os_log_type_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  __n128 v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  uint64_t v95;
  os_log_type_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  char *v110;
  __int128 v111;
  char *v112;
  __n128 v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;

  sub_100012394();
  v2 = v1;
  sub_1000054F4(&qword_100022D38);
  sub_1000123AC();
  __chkstk_darwin(v3);
  sub_1000124FC();
  v115 = v4;
  sub_10001285C();
  __chkstk_darwin(v5);
  v116 = (char *)&v107 - v6;
  sub_1000054F4(&qword_100022D40);
  sub_1000123AC();
  __chkstk_darwin(v7);
  sub_100012760();
  v117 = v8;
  v119 = sub_100005AE8();
  v122 = *(_QWORD *)(v119 - 8);
  v9 = __chkstk_darwin(v119);
  v11 = (char *)&v107 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v107 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v107 - v15;
  sub_10001285C();
  __chkstk_darwin(v17);
  v19 = (char *)&v107 - v18;
  v20 = (uint64_t *)((char *)v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions);
  sub_100012358((uint64_t)v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions, (uint64_t)&v128);
  v21 = *v20;
  if ((unint64_t)*v20 >> 62)
  {
    if (v21 < 0)
      v67 = *v20;
    else
      v67 = v21 & 0xFFFFFFFFFFFFFF8;
    sub_100012808();
    v22 = _CocoaArrayWrapper.endIndex.getter(v67);
    swift_bridgeObjectRelease(v21);
  }
  else
  {
    v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v22)
  {
    v23 = (char *)v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager_pendingActiveServices;
    sub_100012358((uint64_t)v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager_pendingActiveServices, (uint64_t)&v123);
    if (!*(_QWORD *)(*(_QWORD *)v23 + 16))
    {
      sub_10000BA14();
      sub_10000BAC0();
      sub_100009380(v2);
LABEL_79:
      sub_1000059E4();
      return;
    }
  }
  v24 = *v20;
  if ((unint64_t)*v20 >> 62)
  {
    if (v24 < 0)
      v68 = *v20;
    else
      v68 = v24 & 0xFFFFFFFFFFFFFF8;
    sub_100012808();
    v25 = _CocoaArrayWrapper.endIndex.getter(v68);
    swift_bridgeObjectRelease(v24);
  }
  else
  {
    v25 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v26 = v16;
  v27 = (char *)v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager_pendingActiveServices;
  sub_100012358((uint64_t)v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager_pendingActiveServices, (uint64_t)&v127);
  v108 = (uint64_t)v27;
  v28 = *(_QWORD *)(*(_QWORD *)v27 + 16);
  v29 = v25 + v28;
  v30 = v115;
  if (__OFADD__(v25, v28))
  {
    __break(1u);
  }
  else if (qword_100022680 == -1)
  {
    goto LABEL_9;
  }
  swift_once(&qword_100022680, sub_100006DF4);
LABEL_9:
  v31 = sub_100005AF0();
  v118 = sub_100005400(v31, (uint64_t)qword_1000230E8);
  sub_1000124A8();
  v32 = sub_1000125C8();
  if (sub_10000639C(v32))
  {
    v33 = (uint8_t *)sub_100005A70(12);
    *(_DWORD *)v33 = 134217984;
    v26 = v16;
    v125 = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, &v126, v33 + 4);
    sub_100012440((void *)&_mh_execute_header, v0, (os_log_type_t)v25, "Continuing with %ld Active Services", v33);
    v34 = (uint64_t)v33;
    v30 = v115;
    sub_1000059B4(v34);
  }

  v35 = *v20;
  if ((unint64_t)*v20 >> 62)
  {
    if (v35 < 0)
      v69 = *v20;
    else
      v69 = v35 & 0xFFFFFFFFFFFFFF8;
    sub_10001259C();
    v36 = _CocoaArrayWrapper.endIndex.getter(v69);
    sub_10001236C();
  }
  else
  {
    v36 = *(_QWORD *)((v35 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v37 = v119;
  v121 = v11;
  if (v36)
  {
    v38 = *v20;
    if ((unint64_t)*v20 >> 62)
    {
      sub_100006334();
      v39 = sub_100012594();
      if (v39)
        goto LABEL_16;
    }
    else
    {
      v39 = *(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10);
      sub_100006334();
      if (v39)
      {
LABEL_16:
        if (v39 < 1)
        {
LABEL_81:
          __break(1u);
          goto LABEL_82;
        }
        v41 = 0;
        v112 = (char *)(v38 & 0xC000000000000001);
        *(_QWORD *)&v40 = 136446466;
        v111 = v40;
        v109 = (char *)&type metadata for Any + 8;
        v120 = v19;
        v114 = v38;
        v113.n128_u64[0] = v39;
        v110 = v14;
        do
        {
          if (v112)
          {
            v42 = specialized _ArrayBuffer._getElementSlowPath(_:)(v41, v38);
          }
          else
          {
            v42 = *(_QWORD *)(v38 + 8 * v41 + 32);
            swift_retain(v42);
          }
          v43 = v42 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
          sub_100012358(v42 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid, (uint64_t)&v125);
          v44 = v43;
          v45 = v117;
          sub_100011E38(v44, v117, &qword_100022D40);
          sub_1000126BC(v45);
          if (v46)
          {
            if (qword_100022688 != -1)
              swift_once(&qword_100022688, sub_10000FE94);
            v47 = sub_100005400(v37, (uint64_t)qword_100022A30);
            v49 = *(void (**)(char *, uint64_t, uint64_t))(v122 + 16);
            v49(v19, v47, v37);
            sub_100012018(v45, &qword_100022D40);
          }
          else
          {
            v48 = v122;
            sub_1000123BC((uint64_t)v19, v45, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v122 + 32));
            v49 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 16);
          }
          v49(v26, (uint64_t)v19, v37);
          v50 = sub_1000127B4();
          v51 = Logger.logObject.getter(v50);
          v52 = v19;
          v53 = v37;
          v54 = v26;
          v55 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v51, v55))
          {
            v56 = sub_100005A70(22);
            v57 = sub_100005A70(64);
            v124 = v57;
            *(_DWORD *)v56 = v111;
            v59 = *(_QWORD *)(v42 + 16);
            v58 = *(_QWORD *)(v42 + 24);
            sub_100006334();
            v60 = sub_100013928(v59, v58, &v124);
            sub_1000126F0(v60);
            sub_10001238C();
            sub_1000128B0();
            v62 = UUID.uuidString.getter(v61);
            v49 = (void (*)(char *, uint64_t, uint64_t))v63;
            *(_QWORD *)(v56 + 14) = sub_1000127AC(v62, v63);
            sub_10001238C();
            sub_100012610();
            sub_1000123C4((void *)&_mh_execute_header, v51, v55, "- Service Extension '%{public}s' %{public}s Active", (uint8_t *)v56);
            swift_arrayDestroy(v57, 2);
            v64 = v57;
            v14 = v110;
            sub_1000059B4(v64);
            v65 = v56;
            v30 = v115;
            sub_1000059B4(v65);
            swift_release(v42);

            v66 = v120;
          }
          else
          {

            sub_100012610();
            sub_1000127C0();
            v66 = v52;
          }
          ((void (*)(char *, uint64_t))v49)(v66, v53);
          v26 = v54;
          ++v41;
          v19 = v120;
          v11 = v121;
          v37 = v119;
          v38 = v114;
        }
        while (v113.n128_u64[0] != v41);
      }
    }
    sub_10001238C();
  }
  v70 = *(_QWORD *)v108;
  if (!*(_QWORD *)(*(_QWORD *)v108 + 16))
    goto LABEL_79;
  v71 = *(_QWORD *)(v70 + 64);
  v109 = (char *)(v70 + 64);
  v72 = 1 << *(_BYTE *)(v70 + 32);
  v73 = -1;
  if (v72 < 64)
    v73 = ~(-1 << v72);
  v74 = v73 & v71;
  *(_QWORD *)&v111 = (unint64_t)(v72 + 63) >> 6;
  v108 = v111 - 1;
  v114 = v70;
  v75 = swift_bridgeObjectRetain(v70);
  v117 = 0;
  v75.n128_u64[0] = 136446466;
  v113 = v75;
  v112 = (char *)&type metadata for Any + 8;
  while (1)
  {
    v76 = (uint64_t)v116;
    if (v74)
    {
      v77 = __clz(__rbit64(v74));
      v78 = (v74 - 1) & v74;
      v79 = v77 | (v117 << 6);
      v80 = v122;
LABEL_54:
      v81 = v114;
      sub_1000123BC(v30, *(_QWORD *)(v114 + 48) + *(_QWORD *)(v80 + 72) * v79, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v80 + 16));
      v82 = *(_QWORD *)(v81 + 56);
      v83 = sub_1000127CC();
      v84 = *(_QWORD *)(v82 + 8 * v79);
      *(_QWORD *)(v30 + *(int *)(v83 + 48)) = v84;
      sub_10001281C(v30, 0, v85, v83);
      swift_retain(v84);
      goto LABEL_73;
    }
    v86 = v117 + 1;
    if (__OFADD__(v117, 1))
    {
      __break(1u);
      goto LABEL_81;
    }
    v80 = v122;
    if (v86 < (uint64_t)v111)
    {
      v87 = *(_QWORD *)&v109[8 * v86];
      if (v87)
        goto LABEL_58;
      v88 = v117 + 2;
      ++v117;
      if (v86 + 1 < (uint64_t)v111)
      {
        v87 = *(_QWORD *)&v109[8 * v88];
        if (v87)
          goto LABEL_61;
        v117 = v86 + 1;
        if (v86 + 2 < (uint64_t)v111)
        {
          v87 = *(_QWORD *)&v109[8 * v86 + 16];
          if (v87)
          {
            v86 += 2;
            goto LABEL_58;
          }
          v88 = v86 + 3;
          v117 = v86 + 2;
          if (v86 + 3 < (uint64_t)v111)
            break;
        }
      }
    }
LABEL_72:
    v89 = sub_1000127CC();
    sub_10001281C(v30, 1, v90, v89);
    v78 = 0;
LABEL_73:
    sub_100011E78(v30, v76);
    v91 = sub_1000127CC();
    if (sub_100011E28(v76, 1, v91) == 1)
    {
      swift_release(v114);
      goto LABEL_79;
    }
    v120 = (char *)v78;
    v92 = *(_QWORD *)(v76 + *(int *)(v91 + 48));
    sub_1000123BC((uint64_t)v14, v76, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v80 + 32));
    sub_1000123BC((uint64_t)v11, (uint64_t)v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v80 + 16));
    v93 = sub_1000127B4();
    v94 = Logger.logObject.getter(v93);
    v95 = (uint64_t)v14;
    v96 = static os_log_type_t.default.getter();
    if (sub_100012668(v94))
    {
      v97 = sub_100005A70(22);
      v98 = sub_100005A70(64);
      v124 = v98;
      *(_DWORD *)v97 = v113.n128_u32[0];
      v99 = *(_QWORD *)(v92 + 16);
      sub_10001259C();
      v101 = sub_1000128A8(v99, v100, &v124);
      sub_1000126F0(v101);
      sub_10001236C();
      sub_1000128B0();
      v103 = UUID.uuidString.getter(v102);
      *(_QWORD *)(v97 + 14) = sub_1000127AC(v103, v104);
      sub_10001238C();
      sub_1000128BC((uint64_t)v121);
      sub_1000123C4((void *)&_mh_execute_header, v94, v96, "- Service Extension '%{public}s' %{public}s Loaded", (uint8_t *)v97);
      swift_arrayDestroy(v98, 2);
      v105 = v98;
      v11 = v121;
      sub_1000059B4(v105);
      v106 = v97;
      v30 = v115;
      sub_1000059B4(v106);
      swift_release(v92);

    }
    else
    {

      sub_1000128BC((uint64_t)v11);
      sub_1000127C0();
    }
    sub_1000128BC(v95);
    v14 = (char *)v95;
    v74 = (unint64_t)v120;
  }
  v87 = *(_QWORD *)&v109[8 * v88];
  if (v87)
  {
LABEL_61:
    v86 = v88;
LABEL_58:
    v78 = (v87 - 1) & v87;
    v79 = __clz(__rbit64(v87)) + (v86 << 6);
    v117 = v86;
    goto LABEL_54;
  }
  while (1)
  {
    v86 = v88 + 1;
    if (__OFADD__(v88, 1))
      break;
    if (v86 >= (uint64_t)v111)
    {
      v117 = v108;
      goto LABEL_72;
    }
    v87 = *(_QWORD *)&v109[8 * v86];
    ++v88;
    if (v87)
      goto LABEL_58;
  }
LABEL_82:
  __break(1u);
}

void sub_10000CCE8()
{
  uint64_t v0;
  NSObject **v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _BYTE v18[24];

  v1 = (NSObject **)(v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions);
  sub_100012358(v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions, (uint64_t)v18);
  v2 = (unint64_t)*v1;
  if ((unint64_t)*v1 >> 62)
  {
    sub_10001259C();
    v3 = sub_1000126A8();
    sub_10001236C();
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v3 < 1)
    goto LABEL_21;
  if (qword_100022680 != -1)
    swift_once(&qword_100022680, sub_100006DF4);
  v4 = sub_100005AF0();
  sub_100005400(v4, (uint64_t)qword_1000230E8);
  sub_1000124A8();
  v5 = sub_1000125C8();
  if (os_log_type_enabled((os_log_t)v2, v5))
  {
    v6 = (uint8_t *)sub_100005A70(12);
    *(_DWORD *)v6 = 134217984;
    v17 = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, v18, v6 + 4);
    sub_100012440((void *)&_mh_execute_header, v2, v5, "Canceling %ld Services", v6);
    sub_1000059B4((uint64_t)v6);
  }

  sub_100012850();
  if (!v7)
  {
    v8 = *(_QWORD *)(((unint64_t)v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    sub_100006334();
    if (v8)
      goto LABEL_10;
LABEL_20:
    sub_10001238C();
LABEL_21:
    sub_10001246C();
    return;
  }
  sub_100006334();
  v8 = sub_100012594();
  if (!v8)
    goto LABEL_20;
LABEL_10:
  if (v8 >= 1)
  {
    for (i = 0; i != v8; ++i)
    {
      if (((unint64_t)v1 & 0xC000000000000001) != 0)
      {
        v10 = sub_1000126B0();
        v12 = specialized _ArrayBuffer._getElementSlowPath(_:)(v10, v11);
      }
      else
      {
        v12 = (uint64_t)v1[i + 4];
        sub_100012438();
      }
      v13 = *(void **)(v12 + 56);
      if (v13
        && (v14 = v13,
            v15 = objc_msgSend(v14, "serviceViewControllerProxy"),
            v16 = v15,
            v14,
            swift_unknownObjectRelease(v15),
            v16))
      {
        objc_msgSend(v16, "sidecarServiceCancel");
        sub_100012498();
        swift_unknownObjectRelease(v16);
      }
      else
      {
        sub_100012498();
      }
    }
    goto LABEL_20;
  }
  __break(1u);
}

void sub_10000CF04(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v1 = *(void **)(a1 + 56);
  if (v1)
  {
    v8 = v1;
    v2 = sub_10001288C((uint64_t)v8, "topViewController");
    if (v2)
    {
      v3 = v2;
      sub_100012464((uint64_t)v2, &qword_100022D30, UIViewController_ptr);
      v4 = v8;
      v5 = v3;
      LOBYTE(v3) = static NSObject.== infix(_:_:)(v5, v4);

      if ((v3 & 1) != 0)
      {
        v7 = sub_10001288C(v6, "supportedInterfaceOrientations");
        sub_10000B7F4((unint64_t)v7);
      }
    }
    sub_1000123F8(v8);
  }
}

void sub_10000CFD4(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 80) = a2 ^ 1;
  sub_10000CFE0();
}

void sub_10000CFE0()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  os_log_type_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  sub_100012394();
  v5 = sub_100005AF0();
  sub_100012400();
  __chkstk_darwin(v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t *)(v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions);
  sub_100012358((uint64_t)v9, (uint64_t)&v28);
  v10 = *v9;
  if (!((unint64_t)*v9 >> 62))
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    sub_100006374();
    if (v11)
      goto LABEL_3;
LABEL_15:
    sub_1000125B8();
    v10 = 0;
    goto LABEL_16;
  }
  sub_100006374();
  v11 = sub_100012594();
  if (!v11)
    goto LABEL_15;
LABEL_3:
  if ((v10 & 0xC000000000000001) != 0)
  {
    v11 = sub_1000127A0();
  }
  else
  {
    if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_20;
    }
    v11 = *(_QWORD *)(v10 + 32);
    sub_100012438();
  }
  sub_1000125B8();
  v4 = *(unsigned __int8 *)(v11 + 80);
  v10 = v4 ^ 1u;
  if (qword_100022680 != -1)
LABEL_20:
    swift_once(&qword_100022680, sub_100006DF4);
  v12 = sub_100005400(v5, (uint64_t)qword_1000230E8);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v8, v12, v5);
  v13 = sub_100012438();
  Logger.logObject.getter(v13);
  v14 = sub_100012744();
  if (sub_100012700(v14))
  {
    v15 = sub_100005A70(22);
    v24 = v2;
    v16 = (uint8_t *)v15;
    v23 = sub_100005A70(64);
    v27 = v23;
    *(_DWORD *)v16 = 136446466;
    v25 = v10;
    v18 = *(_QWORD *)(v11 + 16);
    v17 = *(_QWORD *)(v11 + 24);
    sub_100006374();
    v26 = sub_100013928(v18, v17, &v27);
    sub_1000125D0((uint64_t)&v26, (uint64_t)&v27);
    sub_100012498();
    sub_1000125B8();
    sub_1000128B0();
    if (v4)
      v20 = 0x6465776F6C6C41;
    else
      v20 = 0x64656C6261736944;
    v26 = sub_1000128A8(v20, v19, &v27);
    v10 = v25;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v16 + 14);
    sub_10001236C();
    sub_1000123C4((void *)&_mh_execute_header, v1, v3, "Service %{public}s %{public}s Sleep", v16);
    v21 = v23;
    sub_100012448(v23);
    sub_1000059B4(v21);
    sub_1000059B4((uint64_t)v16);
    sub_100012498();

    v22 = *(uint64_t (**)(uint64_t, uint64_t))(v24 + 8);
  }
  else
  {

    swift_release_n(v11, 2);
    v22 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
  }
  sub_100012450((uint64_t)v8, v22);
LABEL_16:
  if (UIApp)
  {
    objc_msgSend(UIApp, "setIdleTimerDisabled:", v10);
    sub_1000059E4();
  }
  else
  {
    __break(1u);
  }
}

id sub_10000D298(id result)
{
  uint64_t v1;

  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__wantsVolumeButtonEvents) != (result & 1))
  {
    result = (id)UIApp;
    if (UIApp)
      return objc_msgSend(UIApp, "setWantsVolumeButtonEvents:");
    else
      __break(1u);
  }
  return result;
}

id sub_10000D2D4(char a1)
{
  uint64_t v1;
  void *v2;

  v2 = (void *)*(unsigned __int8 *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__wantsVolumeButtonEvents);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__wantsVolumeButtonEvents) = a1;
  return sub_10000D298(v2);
}

void sub_10000D2EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char **v7;
  id v8;

  v2 = OBJC_IVAR____TtC7Sidecar14ServiceManager__backgroundStyle;
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__backgroundStyle) == a1)
    return;
  if (!UIApp)
  {
    __break(1u);
    goto LABEL_8;
  }
  objc_msgSend(UIApp, "_setBackgroundStyle:");
  v3 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR____TtC7Sidecar14ServiceManager_navigationController), "view"));
  if (!v3)
  {
LABEL_8:
    __break(1u);
    return;
  }
  v4 = v3;
  v5 = *(_QWORD *)(v1 + v2);
  v6 = (void *)objc_opt_self(UIColor);
  v7 = &selRef_blackColor;
  if (v5)
    v7 = &selRef_clearColor;
  v8 = objc_msgSend(v6, *v7);
  objc_msgSend(v4, "setBackgroundColor:", v8);

}

void sub_10000D3E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__backgroundStyle);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__backgroundStyle) = a1;
  sub_10000D2EC(v2);
}

uint64_t sub_10000D3F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (_QWORD *)(v3 + OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig);
  v5 = *(_QWORD *)(v3 + OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig);
  v6 = *(_QWORD *)(v3 + OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig + 8);
  v7 = *(_QWORD *)(v3 + OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig + 16);
  *v4 = a1;
  v4[1] = a2;
  v4[2] = a3;
  return sub_10000FE84(v5, v6, v7);
}

void sub_10000D424()
{
  NSObject *v0;
  os_log_type_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  os_log_type_t v20;
  uint8_t *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27[4];

  v2 = v0;
  if (qword_100022680 != -1)
    swift_once(&qword_100022680, sub_100006DF4);
  v3 = sub_100005AF0();
  v4 = sub_100005400(v3, (uint64_t)qword_1000230E8);
  sub_1000124A8();
  v5 = sub_1000125C0();
  if (sub_1000124C8(v5))
  {
    v6 = (uint8_t *)sub_100005A70(12);
    v7 = sub_100005A70(32);
    v27[0] = v7;
    *(_DWORD *)v6 = 136446210;
    sub_100013928(0xD000000000000018, 0x80000001000172B0, v27);
    sub_1000127EC();
    sub_100012894(v8, v9);
    sub_100012440((void *)&_mh_execute_header, v0, v1, "%{public}s", v6);
    sub_1000124A0(v7);
    sub_1000059B4(v7);
    sub_1000059B4((uint64_t)v6);
  }

  v10 = Notification.object.getter(v27);
  if (!v27[3])
  {
    sub_100012018((uint64_t)v27, &qword_100022820);
    goto LABEL_17;
  }
  v11 = sub_100012464((uint64_t)v10, &qword_100022D28, UIScreen_ptr);
  if ((sub_100012658(v11, v12, (uint64_t)&type metadata for Any + 8, v11, v13) & 1) == 0)
  {
LABEL_17:
    sub_1000124D8();
    return;
  }
  v14 = objc_msgSend(v26, "displayIdentity");
  if (v14)
  {
    v15 = v14;
    v16 = objc_msgSend(v14, "expectsSecureRendering");

    if (!v16)
    {

      goto LABEL_17;
    }
    v17 = v26;
    sub_100006D2C((uint64_t)v26);
    v18 = v4;
    Logger.logObject.getter(v19);
    v20 = sub_1000125C0();
    if (os_log_type_enabled(v18, v20))
    {
      v21 = (uint8_t *)sub_100005A70(2);
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v20, "Moving window to Secure Screen", v21, 2u);
      sub_1000059B4((uint64_t)v21);
    }

    v22 = *(Class *)((char *)&v2->isa + OBJC_IVAR____TtC7Sidecar14ServiceManager_window);
    sub_100012788(v22, "setScreen:");
    objc_msgSend(v22, "makeKeyAndVisible");
    if ((sub_100006D40() & 1) == 0)
      goto LABEL_14;
    v23 = objc_msgSend(*(id *)((char *)&v2->isa + OBJC_IVAR____TtC7Sidecar14ServiceManager__baseViewController), "view");
    if (v23)
    {
      v24 = v23;
      v25 = objc_msgSend((id)objc_opt_self(UIColor), "redColor");
      sub_1000125D8(v24, "setBackgroundColor:");

LABEL_14:
      goto LABEL_17;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_10000D6FC()
{
  NSObject *v0;
  os_log_type_t v1;
  NSObject *v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23[4];

  v2 = v0;
  if (qword_100022680 != -1)
    swift_once(&qword_100022680, sub_100006DF4);
  v3 = sub_100005AF0();
  sub_100005400(v3, (uint64_t)qword_1000230E8);
  sub_1000124A8();
  v4 = sub_1000125C0();
  if (sub_10000639C(v4))
  {
    v5 = (uint8_t *)sub_100005A70(12);
    v6 = sub_100005A70(32);
    v23[0] = v6;
    *(_DWORD *)v5 = 136446210;
    sub_100013928(0xD00000000000001BLL, 0x8000000100017290, v23);
    sub_1000127EC();
    sub_100012830(v7, v8);
    sub_100012440((void *)&_mh_execute_header, v0, v1, "%{public}s", v5);
    sub_1000124A0(v6);
    sub_1000059B4(v6);
    sub_1000059B4((uint64_t)v5);
  }

  v9 = Notification.object.getter(v23);
  if (!v23[3])
  {
    sub_100012018((uint64_t)v23, &qword_100022820);
    goto LABEL_14;
  }
  v10 = sub_100012464((uint64_t)v9, &qword_100022D28, UIScreen_ptr);
  v13 = sub_100012658(v10, v11, (uint64_t)&type metadata for Any + 8, v10, v12);
  if ((v13 & 1) == 0)
  {
LABEL_14:
    sub_1000124D8();
    return;
  }
  v14 = sub_100012548(v13, "displayIdentity");
  if (v14)
  {
    v15 = v14;
    v16 = objc_msgSend(v14, "expectsSecureRendering");

    if (!v16)
      goto LABEL_12;
    sub_100006D2C(0);
    v17 = *(Class *)((char *)&v2->isa + OBJC_IVAR____TtC7Sidecar14ServiceManager_window);
    v18 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
    sub_100012788(v17, "setScreen:");

    if ((sub_100006D40() & 1) == 0)
      goto LABEL_12;
    v19 = objc_msgSend(*(id *)((char *)&v2->isa + OBJC_IVAR____TtC7Sidecar14ServiceManager__baseViewController), "view");
    if (v19)
    {
      v20 = v19;
      v21 = objc_msgSend((id)objc_opt_self(UIColor), "greenColor");
      sub_1000125D8(v20, "setBackgroundColor:");

LABEL_12:
      goto LABEL_14;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_10000D974(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  id v10;

  sub_100012678();
  sub_100012400();
  __chkstk_darwin(v9);
  sub_100005A78();
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = a1;
  a4(v4);

  return sub_100012638(v4, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
}

void sub_10000D9F4()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  NSObject *oslog;
  uint64_t v6;
  uint64_t v7;

  if (qword_100022680 != -1)
    swift_once(&qword_100022680, sub_100006DF4);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_100005400(v0, (uint64_t)qword_1000230E8);
  oslog = Logger.logObject.getter(v1);
  v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc(12, -1);
    v4 = swift_slowAlloc(32, -1);
    v7 = v4;
    *(_DWORD *)v3 = 136446210;
    v6 = sub_100013928(0xD00000000000001FLL, 0x8000000100017270, &v7);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v6, &v7, v3 + 4);
    _os_log_impl((void *)&_mh_execute_header, oslog, v2, "%{public}s", v3, 0xCu);
    swift_arrayDestroy(v4, 1);
    swift_slowDealloc(v4, -1, -1);
    swift_slowDealloc(v3, -1, -1);

  }
  else
  {

  }
}

void sub_10000DC70()
{
  NSObject *v0;
  uint64_t v1;
  SEL *v2;
  SEL *v3;
  void **v4;
  void **v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  void **v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46[3];

  sub_100012394();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = v0;
  v12 = v11;
  sub_1000054F4((uint64_t *)&unk_100022D18);
  sub_1000123AC();
  __chkstk_darwin(v13);
  sub_100005A78();
  if (qword_100022680 != -1)
    swift_once(&qword_100022680, sub_100006DF4);
  v14 = sub_100005AF0();
  sub_100005400(v14, (uint64_t)qword_1000230E8);
  sub_1000124A8();
  v15 = sub_1000125C0();
  if (sub_100012668(v0))
  {
    v16 = (uint8_t *)sub_100005A70(12);
    v17 = sub_100005A70(32);
    v18 = v9;
    v19 = v5;
    v20 = v17;
    v46[0] = v17;
    *(_DWORD *)v16 = 136446210;
    v21 = sub_100013928(v18, v7, v46);
    v22 = sub_10001274C(v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v22, v23, v16 + 4);
    sub_100012440((void *)&_mh_execute_header, v0, v15, "%{public}s", v16);
    sub_1000124A0(v20);
    v24 = v20;
    v5 = v19;
    sub_1000059B4(v24);
    v25 = (uint64_t)v16;
    v10 = v0;
    sub_1000059B4(v25);
  }

  sub_100011E38(v12, v1, (uint64_t *)&unk_100022D18);
  v26 = sub_100012678();
  if (sub_100012824(v1) == 1)
  {
    sub_100012018(v1, (uint64_t *)&unk_100022D18);
    v27 = 0;
  }
  else
  {
    v28 = (void *)Notification.name.getter();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(v1, v26);
    v29 = *v5;
    v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
    v32 = v31;
    v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
    if (v30 == v33 && v32 == v34)
      v27 = 1;
    else
      v27 = sub_1000128A0(v30, v32, v33, v34);
    v36 = v29;

    sub_1000126A0();
    sub_100012690();
  }
  v37 = (uint64_t *)((char *)v10 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions);
  sub_100012358((uint64_t)v10 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions, (uint64_t)v46);
  v38 = *v37;
  if (!((unint64_t)*v37 >> 62))
  {
    v39 = *(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10);
    sub_100006374();
    if (v39)
      goto LABEL_16;
LABEL_26:
    sub_1000125B8();
LABEL_27:
    sub_1000059E4();
    return;
  }
  if (v38 < 0)
    v45 = *v37;
  else
    v45 = v38 & 0xFFFFFFFFFFFFFF8;
  sub_100006374();
  if (!_CocoaArrayWrapper.endIndex.getter(v45))
    goto LABEL_26;
LABEL_16:
  if ((v38 & 0xC000000000000001) != 0)
  {
    v40 = sub_1000127A0();
LABEL_19:
    sub_1000125B8();
    v41 = *(void **)(v40 + 56);
    v42 = v41;
    v43 = sub_100012498();
    if (v41)
    {
      v44 = sub_100012548(v43, "serviceViewControllerProxy");

      sub_1000126E8();
      if (v44)
      {
        objc_msgSend(v44, *v3, v27 & 1);
        sub_100012698();
      }
    }
    goto LABEL_27;
  }
  if (*(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v40 = *(_QWORD *)(v38 + 32);
    sub_100012438();
    goto LABEL_19;
  }
  __break(1u);
}

void sub_10000DFB0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  sub_1000054F4((uint64_t *)&unk_100022D18);
  sub_1000123AC();
  __chkstk_darwin(v5);
  sub_100012510();
  v8 = v7 - v6;
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v10 = sub_100012678();
    v11 = 0;
  }
  else
  {
    v10 = sub_100012678();
    v11 = 1;
  }
  sub_10001281C(v8, v11, v9, v10);
  v12 = a1;
  sub_10000DC70();

  sub_100012018(v8, (uint64_t *)&unk_100022D18);
}

void sub_10000E08C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  char v16;
  char v17;
  void *v18;
  _BOOL8 v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;

  v2 = v1;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager_window);
  v5 = *(void **)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__secureScreen);
  if (v5)
  {
    v6 = *(id *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__secureScreen);
  }
  else
  {
    v6 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
    v5 = 0;
  }
  v7 = v5;
  objc_msgSend(v4, "setScreen:", v6);

  v8 = *(void **)(a1 + 56);
  if (!v8)
    goto LABEL_28;
  v9 = *(void **)(v2 + OBJC_IVAR____TtC7Sidecar14ServiceManager_navigationController);
  v31 = v8;
  v10 = objc_msgSend(v9, "viewControllers");
  v11 = sub_10000562C(0, &qword_100022D30, UIViewController_ptr);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);

  if ((unint64_t)v12 >> 62)
  {
    if (v12 < 0)
      v30 = v12;
    else
      v30 = v12 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v12);
    v13 = _CocoaArrayWrapper.endIndex.getter(v30);
  }
  else
  {
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v12);
  }
  sub_10000D3F8(1, (uint64_t)nullsub_1, 0);
  v14 = objc_msgSend(v31, "supportedInterfaceOrientations");
  swift_bridgeObjectRetain(v12);
  v15 = sub_10000C18C((uint64_t)v31, v12);
  v17 = v16;
  swift_bridgeObjectRelease_n(v12, 2);
  if ((v17 & 1) != 0)
  {
    v18 = *(void **)(a1 + 56);
    if (v18)
    {
      v19 = v13 > 1;
LABEL_15:
      v21 = v18;
      swift_bridgeObjectRelease(v12);
      objc_msgSend(v9, "pushViewController:animated:", v21, v19);

      goto LABEL_16;
    }
    goto LABEL_29;
  }
  if (__OFSUB__(v13, 1))
  {
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v15 != v13 - 1)
  {
    sub_10000B72C(v15);

    v18 = *(void **)(a1 + 56);
    if (v18)
    {
      v19 = v13 > 1;
      goto LABEL_15;
    }
LABEL_30:
    __break(1u);
    return;
  }
  swift_bridgeObjectRelease(v12);
LABEL_16:
  objc_msgSend(v9, "setNeedsStatusBarAppearanceUpdate");
  sub_10000B7F4((unint64_t)v14);
  SBSUndimScreen();
  sub_10000BB6C();
  sub_10000D3F8(0, 0, 0);
  objc_msgSend(v4, "makeKeyAndVisible");
  v22 = *(void **)(a1 + 56);
  if (v22)
  {
    v23 = v22;
    v24 = objc_msgSend(v23, "serviceViewControllerProxy");
    v25 = v24;

    swift_unknownObjectRelease(v24);
    if (v25)
    {
      objc_msgSend(v25, "sidecarServiceActive");
      swift_unknownObjectRelease(v25);
    }
    v26 = *(void **)(a1 + 56);
    if (v26)
    {
      v27 = v26;
      v28 = objc_msgSend(v27, "serviceViewControllerProxy");
      v29 = v28;

      swift_unknownObjectRelease(v28);
      if (v29)
      {
        objc_msgSend(v29, "sidecarServiceSetActive:", 1);
        swift_unknownObjectRelease(v29);
      }
    }
  }
  sub_10000BA14();
  sub_10000BAC0();
  sub_10000CFE0();

}

id sub_10000E3E4(uint64_t a1)
{
  uint64_t v1;
  NSDictionary v3;
  id v4;

  if (a1)
  {
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3.super.isa = 0;
  }
  v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(v1), "optionsWithDictionary:", v3.super.isa);

  return v4;
}

uint64_t sub_10000E46C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  result = __chkstk_darwin(v8);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain(a2);
    if (qword_100022680 != -1)
      swift_once(&qword_100022680, sub_100006DF4);
    v13 = sub_100005400(v8, (uint64_t)qword_1000230E8);
    v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v13, v8);
    __chkstk_darwin(v14);
    *(&v15 - 2) = a4;
    *(&v15 - 1) = a5;
    swift_errorRetain(a2);
    sub_100005AF8(sub_100011FDC, &v15 - 4, v12, a2);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    return swift_errorRelease(a2);
  }
  return result;
}

uint64_t sub_10000E59C(Swift::String *a1, uint64_t a2, uint64_t a3)
{
  Swift::String v4;
  Swift::String v5;
  uint64_t v6;
  Swift::String v7;
  Swift::String v8;
  uint64_t v10;

  v10 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)(a3, 2);
  v4._object = (void *)0x80000001000172D0;
  v4._countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v4);
  String.append(_:)(a1[1]);
  v5._countAndFlagsBits = 8231;
  v5._object = (void *)0xE200000000000000;
  String.append(_:)(v5);
  v7._countAndFlagsBits = UUID.uuidString.getter(v6);
  String.append(_:)(v7);
  sub_1000126A0();
  v8._countAndFlagsBits = sub_1000126B0();
  String.append(_:)(v8);
  return v10;
}

void sub_10000E650(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(void *, void *);
  id v7;
  id v8;

  v6 = *(void (**)(void *, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v8 = a2;
  v7 = a3;
  v6(a2, a3);
  swift_release(v5);

}

void sub_10000E6C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig);
  v4 = *(void (**)(uint64_t))(v2 + OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig + 8);
  if (v4)
  {
    v5 = v3[2];
    if (*v3 == 1)
    {
      v6 = (objc_class *)type metadata accessor for Fade();
    }
    else
    {
      if (*v3 != 2)
      {
        v7 = swift_retain(v3[2]);
        v4(v7);
        v8 = sub_1000126B0();
        sub_10000FE84(v8, v9, v5);
        goto LABEL_11;
      }
      if (a2 == 1)
        v6 = (objc_class *)type metadata accessor for SlideIn();
      else
        v6 = (objc_class *)type metadata accessor for SlideOut();
    }
    objc_allocWithZone(v6);
    swift_retain(v5);
    sub_10000E7E8((uint64_t)v4, v5);
  }
LABEL_11:
  sub_100005AB0();
}

id sub_10000E7E8(uint64_t a1, uint64_t a2)
{
  _BYTE *v2;
  _QWORD *v3;
  objc_super v5;

  v2[OBJC_IVAR____TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation_sentCompletion] = 0;
  v3 = &v2[OBJC_IVAR____TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation_completion];
  *v3 = a1;
  v3[1] = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for Animation();
  return objc_msgSendSuper2(&v5, "init");
}

id sub_10000E838()
{
  char *v0;
  char *v1;
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  objc_super v6;

  v1 = v0;
  if ((v0[OBJC_IVAR____TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation_sentCompletion] & 1) == 0)
  {
    v3 = *(void (**)(uint64_t))&v0[OBJC_IVAR____TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation_completion];
    v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation_completion + 8];
    v4 = swift_retain(*(_QWORD *)&v1[OBJC_IVAR____TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation_completion
                                   + 8]);
    v3(v4);
    swift_release(v2);
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for Animation();
  return objc_msgSendSuper2(&v6, "dealloc");
}

double sub_10000E8EC()
{
  return 0.25;
}

uint64_t sub_10000E93C()
{
  uint64_t v0;

  *(_BYTE *)(v0 + OBJC_IVAR____TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation_sentCompletion) = 1;
  return (*(uint64_t (**)(void))(v0 + OBJC_IVAR____TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation_completion))();
}

void sub_10000E9B8()
{
  _swift_stdlib_reportUnimplementedInitializer("Sidecar.Animation", 17, "init()", 6, 0);
  __break(1u);
}

void sub_10000EA04(void *a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  CGFloat *v23;
  void *v24;
  CGFloat *v25;
  id v26;
  uint64_t v27;
  void *v28;
  CGFloat *v29;
  void **v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id (*v34)();
  CGFloat *v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v2 = objc_msgSend(a1, "viewControllerForKey:", UITransitionContextFromViewControllerKey);
  if (!v2)
  {
    __break(1u);
    goto LABEL_8;
  }
  v3 = v2;
  v4 = objc_msgSend(a1, "viewControllerForKey:", UITransitionContextToViewControllerKey);
  if (!v4)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v5 = v4;
  objc_msgSend(a1, "finalFrameForViewController:", v4);
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  v10 = -CGRectGetHeight(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v38 = CGRectOffset(v37, 0.0, v10);
  v11 = v38.origin.x;
  v12 = v38.origin.y;
  v13 = v38.size.width;
  v14 = v38.size.height;
  v15 = objc_msgSend(v5, "view");
  if (!v15)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v16 = v15;
  objc_msgSend(v15, "setFrame:", v11, v12, v13, v14);

  v17 = objc_msgSend(a1, "containerView");
  v18 = objc_msgSend(v5, "view");
  if (!v18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v19 = v18;
  v20 = objc_msgSend(v3, "view");
  if (v20)
  {
    v21 = v20;
    objc_msgSend(v17, "insertSubview:aboveSubview:", v19, v20);

    v22 = (void *)objc_opt_self(UIView);
    v23 = (CGFloat *)swift_allocObject(&unk_10001CDE0, 56, 7);
    *((_QWORD *)v23 + 2) = v5;
    v23[3] = x;
    v23[4] = y;
    v23[5] = width;
    v23[6] = height;
    v34 = (id (*)())sub_10000FE08;
    v35 = v23;
    v30 = _NSConcreteStackBlock;
    v31 = 1107296256;
    v32 = sub_1000128C4;
    v33 = &unk_10001CDF8;
    v24 = _Block_copy(&v30);
    v25 = v35;
    v26 = v5;
    swift_release(v25);
    v27 = swift_allocObject(&unk_10001CE30, 24, 7);
    *(_QWORD *)(v27 + 16) = a1;
    v34 = sub_10000FE70;
    v35 = (CGFloat *)v27;
    v30 = _NSConcreteStackBlock;
    v31 = 1107296256;
    v32 = sub_10000ECEC;
    v33 = &unk_10001CE48;
    v28 = _Block_copy(&v30);
    v29 = v35;
    swift_unknownObjectRetain(a1);
    swift_release(v29);
    objc_msgSend(v22, "animateWithDuration:animations:completion:", v24, v28, 0.25);
    _Block_release(v28);
    _Block_release(v24);

    return;
  }
LABEL_11:
  __break(1u);
}

uint64_t sub_10000ECEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

id sub_10000ED34()
{
  return sub_10000F968(0, type metadata accessor for SlideIn);
}

void sub_10000ED44(void *a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  CGFloat *v21;
  void *v22;
  CGFloat *v23;
  id v24;
  uint64_t v25;
  void *v26;
  CGFloat *v27;
  void **v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id (*v32)();
  CGFloat *v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v2 = objc_msgSend(a1, "viewControllerForKey:", UITransitionContextFromViewControllerKey);
  if (!v2)
  {
    __break(1u);
    goto LABEL_7;
  }
  v3 = v2;
  v4 = objc_msgSend(a1, "viewControllerForKey:", UITransitionContextToViewControllerKey);
  if (!v4)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v5 = v4;
  objc_msgSend(a1, "initialFrameForViewController:", v3);
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;
  v10 = -CGRectGetHeight(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v36 = CGRectOffset(v35, 0.0, v10);
  v11 = v36.origin.x;
  v12 = v36.origin.y;
  v13 = v36.size.width;
  v14 = v36.size.height;
  v15 = objc_msgSend(a1, "containerView");
  v16 = objc_msgSend(v5, "view");
  if (!v16)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v17 = v16;
  v18 = objc_msgSend(v3, "view");
  if (v18)
  {
    v19 = v18;
    objc_msgSend(v15, "insertSubview:belowSubview:", v17, v18);

    v20 = (void *)objc_opt_self(UIView);
    v21 = (CGFloat *)swift_allocObject(&unk_10001CD40, 56, 7);
    *((_QWORD *)v21 + 2) = v3;
    v21[3] = v11;
    v21[4] = v12;
    v21[5] = v13;
    v21[6] = v14;
    v32 = (id (*)())sub_10000FE08;
    v33 = v21;
    v28 = _NSConcreteStackBlock;
    v29 = 1107296256;
    v30 = sub_1000128C4;
    v31 = &unk_10001CD58;
    v22 = _Block_copy(&v28);
    v23 = v33;
    v24 = v3;
    swift_release(v23);
    v25 = swift_allocObject(&unk_10001CD90, 24, 7);
    *(_QWORD *)(v25 + 16) = a1;
    v32 = sub_100012314;
    v33 = (CGFloat *)v25;
    v28 = _NSConcreteStackBlock;
    v29 = 1107296256;
    v30 = sub_10000ECEC;
    v31 = &unk_10001CDA8;
    v26 = _Block_copy(&v28);
    v27 = v33;
    swift_unknownObjectRetain(a1);
    swift_release(v27);
    objc_msgSend(v20, "animateWithDuration:animations:completion:", v22, v26, 0.25);
    _Block_release(v26);
    _Block_release(v22);

    return;
  }
LABEL_9:
  __break(1u);
}

void sub_10000EFDC(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;

  v9 = objc_msgSend(a1, "view");
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "setFrame:", a2, a3, a4, a5);
    sub_1000123F8(v10);
  }
  else
  {
    __break(1u);
  }
}

id sub_10000F05C()
{
  return sub_10000F968(0, type metadata accessor for SlideOut);
}

void sub_10000F06C(void *a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void **v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;

  v2 = objc_msgSend(a1, "viewControllerForKey:", UITransitionContextFromViewControllerKey);
  if (!v2)
  {
    __break(1u);
    goto LABEL_8;
  }
  v3 = v2;
  v4 = objc_msgSend(a1, "viewControllerForKey:", UITransitionContextToViewControllerKey);
  if (!v4)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, "view");
  if (!v6)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v7 = v6;
  objc_msgSend(v6, "setAlpha:", 0.0);

  v8 = objc_msgSend(a1, "containerView");
  v9 = objc_msgSend(v5, "view");
  if (!v9)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v10 = v9;
  v11 = objc_msgSend(v3, "view");
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v8, "insertSubview:belowSubview:", v10, v11);

    v13 = (void *)objc_opt_self(UIView);
    v14 = swift_allocObject(&unk_10001CCA0, 32, 7);
    *(_QWORD *)(v14 + 16) = v3;
    *(_QWORD *)(v14 + 24) = v5;
    v27 = sub_10000FDB8;
    v28 = v14;
    v23 = _NSConcreteStackBlock;
    v24 = 1107296256;
    v25 = sub_1000128C4;
    v26 = &unk_10001CCB8;
    v15 = _Block_copy(&v23);
    v16 = v28;
    v17 = v3;
    v18 = v5;
    swift_release(v16);
    v19 = swift_allocObject(&unk_10001CCF0, 32, 7);
    *(_QWORD *)(v19 + 16) = v17;
    *(_QWORD *)(v19 + 24) = a1;
    v27 = sub_10000FE00;
    v28 = v19;
    v23 = _NSConcreteStackBlock;
    v24 = 1107296256;
    v25 = sub_10000ECEC;
    v26 = &unk_10001CD08;
    v20 = _Block_copy(&v23);
    v21 = v28;
    v22 = v17;
    swift_unknownObjectRetain(a1);
    swift_release(v21);
    objc_msgSend(v13, "animateWithDuration:animations:completion:", v15, v20, 0.25);
    _Block_release(v20);
    _Block_release(v15);

    return;
  }
LABEL_11:
  __break(1u);
}

void sub_10000F2E0(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = objc_msgSend(a1, "view");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setAlpha:", 0.0);

    v5 = objc_msgSend(a2, "view");
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "setAlpha:", 1.0);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_10000F370(int a1, id a2, void *a3)
{
  id result;
  id v5;

  result = objc_msgSend(a2, "view");
  if (result)
  {
    v5 = result;
    objc_msgSend(result, "setAlpha:", 1.0);

    return objc_msgSend(a3, "completeTransition:", 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10000F3E0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  id v7;

  swift_unknownObjectRetain(a3);
  v7 = a1;
  a4(a3);
  swift_unknownObjectRelease(a3);
  sub_1000123F8(v7);
}

id sub_10000F43C()
{
  return sub_10000F968(0, type metadata accessor for Fade);
}

void sub_10000F454()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(objc_allocWithZone((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v0, "setView:", v1);

}

id sub_10000F51C(uint64_t a1)
{
  return sub_10000F968(a1, type metadata accessor for ColorUIViewController);
}

uint64_t sub_10000F560()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, "topViewController");
  if (!v1)
    return 1;
  v2 = v1;
  v3 = objc_msgSend(v1, "shouldAutorotate");

  return (uint64_t)v3;
}

void sub_10000F5E8()
{
  void *v0;
  id v1;
  void *v2;

  v1 = objc_msgSend(v0, "topViewController");
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "supportedInterfaceOrientations");

  }
  sub_1000059DC();
}

id sub_10000F66C()
{
  void *v0;

  return objc_msgSend(v0, "topViewController");
}

void sub_10000F690(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t ObjCClassFromMetadata;
  objc_super v5;

  v3 = a2;
  if (!a1)
  {
    ObjCClassFromMetadata = 0;
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(a1);
  if (v3)
LABEL_3:
    v3 = swift_getObjCClassFromMetadata(v3);
LABEL_4:
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for ServiceNavigationController();
  objc_msgSendSuper2(&v5, "initWithNavigationBarClass:toolbarClass:", ObjCClassFromMetadata, v3);
  sub_100012710();
}

void sub_10000F760(void *a1, uint64_t (*a2)(void), SEL *a3)
{
  void *v3;
  objc_super v6;

  v6.receiver = v3;
  v6.super_class = (Class)a2();
  objc_msgSendSuper2(&v6, *a3, a1);

  sub_100012710();
}

id sub_10000F7E4(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t))
{
  void *v4;
  NSString v7;
  id v8;
  objc_super v10;

  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    a1 = sub_100012690();
  }
  else
  {
    v7 = 0;
  }
  v10.receiver = v4;
  v10.super_class = (Class)a4(a1);
  v8 = objc_msgSendSuper2(&v10, "initWithNibName:bundle:", v7, a3);

  return v8;
}

id sub_10000F874(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (a3)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = a4;
  return sub_10000F7E4(v7, v9, a4, a5);
}

id sub_10000F8E4(void *a1, uint64_t (*a2)(void))
{
  void *v2;
  id v4;
  objc_super v6;

  v6.receiver = v2;
  v6.super_class = (Class)a2();
  v4 = objc_msgSendSuper2(&v6, "initWithCoder:", a1);

  return v4;
}

id sub_10000F95C(uint64_t a1)
{
  return sub_10000F968(a1, type metadata accessor for ServiceNavigationController);
}

id sub_10000F968(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t sub_10000F998(unint64_t a1)
{
  NSObject *v1;
  os_log_type_t v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  os_log_type_t v7;
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
  uint64_t v21;
  uint64_t v22;

  if (!UIApp)
  {
    __break(1u);
    JUMPOUT(0x10000FB44);
  }
  v4 = objc_msgSend(UIApp, "statusBarOrientation");
  switch((unint64_t)v4)
  {
    case 1uLL:
      v5 = (a1 & 6) != 0;
      break;
    case 2uLL:
      v5 = (a1 >> 2) & 1;
      break;
    case 3uLL:
      v5 = (a1 >> 3) & 1;
      break;
    case 4uLL:
      v5 = (a1 >> 4) & 1;
      break;
    default:
      v5 = 0;
      break;
  }
  if (qword_100022680 != -1)
    swift_once(&qword_100022680, sub_100006DF4);
  v6 = sub_100005AF0();
  sub_100005400(v6, (uint64_t)qword_1000230E8);
  sub_1000124A8();
  v7 = sub_1000125C0();
  if (sub_1000124C8(v7))
  {
    v8 = sub_100005A70(22);
    v22 = sub_100005A70(32);
    *(_DWORD *)v8 = 136446466;
    v9 = UIInterfaceOrientation.description.getter((uint64_t)v4);
    sub_1000127DC(v9, v10, v11);
    sub_100012718();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v12, v13, v8 + 4);
    v14 = sub_1000126A0();
    *(_WORD *)(v8 + 12) = 2048;
    sub_100012680(v14, v15, v8 + 14, v8 + 22, v16, v17, v18, v19, v21);
    sub_1000123C4((void *)&_mh_execute_header, v1, v2, "Orientation: %{public}s (extension mask %lx)", (uint8_t *)v8);
    sub_1000124A0(v22);
    sub_1000059B4(v22);
    sub_1000059B4(v8);
  }

  return v5;
}

uint64_t UIDeviceOrientation.description.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = a1 - 1;
  result = 0xD000000000000012;
  switch(v1)
  {
    case 0:
      result = sub_100012568();
      break;
    case 1:
      return result;
    case 2:
    case 3:
      result = sub_1000125FC();
      break;
    case 4:
      result = 0x705565636166;
      break;
    case 5:
      result = 0x6E776F4465636166;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t sub_10000FC00()
{
  uint64_t *v0;

  return UIDeviceOrientation.description.getter(*v0);
}

uint64_t UIInterfaceOrientation.description.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = a1 - 1;
  result = 0xD000000000000012;
  switch(v1)
  {
    case 0:
      result = sub_100012568();
      break;
    case 1:
      return result;
    case 2:
    case 3:
      result = sub_1000125FC();
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t sub_10000FC88()
{
  uint64_t *v0;

  return UIInterfaceOrientation.description.getter(*v0);
}

uint64_t type metadata accessor for SecureWindow()
{
  return objc_opt_self(_TtC7Sidecar12SecureWindow);
}

uint64_t type metadata accessor for ServiceManager()
{
  return objc_opt_self(_TtC7Sidecar14ServiceManager);
}

uint64_t type metadata accessor for Animation()
{
  return objc_opt_self(_TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation);
}

uint64_t type metadata accessor for SlideIn()
{
  return objc_opt_self(_TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B77SlideIn);
}

uint64_t type metadata accessor for SlideOut()
{
  return objc_opt_self(_TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B78SlideOut);
}

uint64_t type metadata accessor for Fade()
{
  return objc_opt_self(_TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B74Fade);
}

uint64_t type metadata accessor for ColorUIViewController()
{
  return objc_opt_self(_TtC7Sidecar21ColorUIViewController);
}

uint64_t type metadata accessor for ServiceNavigationController()
{
  return objc_opt_self(_TtC7Sidecar27ServiceNavigationController);
}

uint64_t sub_10000FD90()
{
  uint64_t v0;

  sub_1000124F4();

  return swift_deallocObject(v0, 32, 7);
}

void sub_10000FDB8()
{
  uint64_t v0;

  sub_10000F2E0(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10000FDC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000FDD0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000FDD8()
{
  uint64_t v0;

  sub_1000124F4();
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

id sub_10000FE00(int a1)
{
  uint64_t v1;

  return sub_10000F370(a1, *(id *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_10000FE0C()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000FE30()
{
  uint64_t v0;

  sub_1000124F4();
  return swift_deallocObject(v0, 56, 7);
}

void sub_10000FE50()
{
  uint64_t v0;

  sub_10000EFDC(*(void **)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
}

id sub_10000FE70()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "completeTransition:", 1);
}

uint64_t sub_10000FE84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a2)
    return swift_release(a3);
  return result;
}

uint64_t sub_10000FE94()
{
  uint64_t v0;

  v0 = type metadata accessor for UUID(0);
  sub_100005418(v0, qword_100022A30);
  sub_100005400(v0, (uint64_t)qword_100022A30);
  return UUID.init(uuid:)(0, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t sub_10000FF08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

char *sub_10000FF14(char *__src, uint64_t a2, char *__dst)
{
  char v4;

  if (a2 < 0)
  {
    v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v4, 1046, 0);
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

unint64_t sub_10000FF98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100010090(a1, v4);
}

unint64_t sub_10000FFC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100010154(a1, a2, v5);
}

unint64_t sub_10001002C(uint64_t a1)
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
  sub_100012050(&qword_100022D78, (uint64_t)&protocol conformance descriptor for UUID);
  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_100010234(a1, v7);
}

unint64_t sub_100010090(uint64_t a1, uint64_t a2)
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
      sub_100012208(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100012244((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100010154(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_100010234(uint64_t a1, uint64_t a2)
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
      sub_100012050(&qword_100022D68, (uint64_t)&protocol conformance descriptor for UUID);
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

double sub_10001036C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  Swift::Int v12;
  uint64_t v13;
  double result;
  uint64_t v15;

  v4 = v3;
  swift_bridgeObjectRetain(*v4);
  v8 = sub_10000FFC8(a1, a2);
  LOBYTE(a2) = v9;
  sub_100012690();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v15 = *v4;
    v11 = *v4;
    *v4 = 0x8000000000000000;
    v12 = *(_QWORD *)(v11 + 24);
    sub_1000054F4(&qword_100022D98);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v12);
    swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v15 + 48) + 16 * v8 + 8));
    sub_10000570C((_OWORD *)(*(_QWORD *)(v15 + 56) + 32 * v8), a3);
    _NativeDictionary._delete(at:)(v8, v15, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
    v13 = *v4;
    *v4 = v15;
    sub_100012424(v13);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_10001047C(uint64_t a1)
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
  v5 = sub_10001002C(a1);
  LOBYTE(a1) = v6;
  swift_bridgeObjectRelease(v4);
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  v17 = *v2;
  v8 = *v2;
  *v2 = 0x8000000000000000;
  v9 = *(_QWORD *)(v8 + 24);
  sub_1000054F4(&qword_100022D70);
  _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v9);
  v10 = *(_QWORD *)(v17 + 48);
  v11 = type metadata accessor for UUID(0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v5, v11);
  v12 = *(_QWORD *)(*(_QWORD *)(v17 + 56) + 8 * v5);
  v13 = type metadata accessor for ServiceExtension(0);
  sub_100012050(&qword_100022D78, (uint64_t)&protocol conformance descriptor for UUID);
  _NativeDictionary._delete(at:)(v5, v17, v11, v13, v14);
  v15 = *v2;
  *v2 = v17;
  swift_bridgeObjectRelease(v15);
  return v12;
}

uint64_t sub_1000105A4(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v10;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v10 = *v3;
  *v3 = 0x8000000000000000;
  sub_10001067C(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  v8 = *v3;
  *v3 = v10;
  return sub_100012424(v8);
}

uint64_t sub_100010610(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  v8 = *v2;
  *v2 = 0x8000000000000000;
  sub_100010798(a1, a2, isUniquelyReferenced_nonNull_native);
  v6 = *v2;
  *v2 = v8;
  return swift_bridgeObjectRelease(v6);
}

_OWORD *sub_10001067C(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  _BOOL8 v14;
  Swift::Int v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  _QWORD *v20;
  _QWORD *v21;
  _OWORD *result;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v11 = sub_10000FFC8(a2, a3);
  v13 = v10[2];
  v14 = (v12 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }
  v16 = v11;
  v17 = v12;
  sub_1000054F4(&qword_100022D98);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15))
    goto LABEL_5;
  v18 = sub_10000FFC8(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return result;
  }
  v16 = v18;
LABEL_5:
  v20 = *v5;
  if ((v17 & 1) != 0)
  {
    v21 = (_QWORD *)(v20[7] + 32 * v16);
    sub_1000122D8(v21);
    return sub_10000570C(a1, v21);
  }
  else
  {
    sub_1000108DC(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain(a3);
  }
}

uint64_t sub_100010798(uint64_t a1, uint64_t a2, char a3)
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
  uint64_t result;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v13 = sub_10001002C(a2);
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
  sub_1000054F4(&qword_100022D70);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v17))
    goto LABEL_5;
  v20 = sub_10001002C(a2);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_10:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v8);
    __break(1u);
    return result;
  }
  v18 = v20;
LABEL_5:
  v22 = *v4;
  if ((v19 & 1) != 0)
  {
    v23 = v22[7];
    result = swift_release(*(_QWORD *)(v23 + 8 * v18));
    *(_QWORD *)(v23 + 8 * v18) = a1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
    return sub_100010944(v18, (uint64_t)v11, a1, v22);
  }
  return result;
}

_OWORD *sub_1000108DC(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_10000570C(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_100010944(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
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

uint64_t sub_1000109DC(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_1000109F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
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
  uint64_t v18;
  void (*v19)(char *, unint64_t, uint64_t);
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v3 = v2;
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v2;
  v11 = *(_QWORD *)(*v2 + 40);
  sub_100012050(&qword_100022D78, (uint64_t)&protocol conformance descriptor for UUID);
  v13 = v12;
  swift_bridgeObjectRetain(v10);
  v33 = a1;
  v14 = dispatch thunk of Hashable._rawHashValue(seed:)(v11, v6, v13);
  v15 = -1 << *(_BYTE *)(v10 + 32);
  v16 = v14 & ~v15;
  if (((*(_QWORD *)(v10 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0)
  {
    v30 = v3;
    v31 = a2;
    v17 = ~v15;
    v18 = *(_QWORD *)(v7 + 72);
    v32 = v7;
    v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    while (1)
    {
      v19(v9, *(_QWORD *)(v10 + 48) + v18 * v16, v6);
      sub_100012050(&qword_100022D68, (uint64_t)&protocol conformance descriptor for UUID);
      v21 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v33, v6, v20);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v16 = (v16 + 1) & v17;
      if (((*(_QWORD *)(v10 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
      {
        swift_bridgeObjectRelease(v10);
        v22 = 1;
        a2 = v31;
        return sub_10000FF08(a2, v22, 1, v6);
      }
    }
    swift_bridgeObjectRelease(v10);
    v23 = v30;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v30);
    v25 = *v23;
    v34 = *v23;
    *v23 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_100010C1C();
      v25 = v34;
    }
    v26 = *(_QWORD *)(v25 + 48) + v18 * v16;
    a2 = v31;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v32 + 32))(v31, v26, v6);
    sub_1000114C0(v16);
    v27 = *v23;
    *v23 = v34;
    swift_bridgeObjectRelease(v27);
    v22 = 0;
  }
  else
  {
    swift_bridgeObjectRelease(v10);
    v22 = 1;
  }
  return sub_10000FF08(a2, v22, 1, v6);
}

void *sub_100010C1C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t i;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = type metadata accessor for UUID(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000054F4((uint64_t *)&unk_100022D80);
  v6 = *v0;
  v7 = static _SetStorage.copy(original:)(*v0);
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release(v6);
LABEL_30:
    *v1 = v8;
    return result;
  }
  v26 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = *(_QWORD *)(v6 + 56);
  v16 = -1;
  if (v14 < 64)
    v16 = ~(-1 << v14);
  v17 = v16 & v15;
  v18 = (unint64_t)(v14 + 63) >> 6;
  if ((v16 & v15) == 0)
    goto LABEL_12;
LABEL_11:
  v19 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (i = v19 | (v13 << 6); ; i = __clz(__rbit64(v22)) + (v13 << 6))
  {
    v24 = *(_QWORD *)(v3 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v24, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v24, v5, v2);
    if (v17)
      goto LABEL_11;
LABEL_12:
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v18)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v18)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v18)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_25:
    v17 = (v22 - 1) & v22;
  }
  v23 = v21 + 3;
  if (v23 >= v18)
  {
LABEL_28:
    result = (void *)swift_release(v6);
    v1 = v26;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v18)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_100010E44(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  unint64_t i;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int64_t v37;

  v2 = v1;
  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  sub_1000054F4((uint64_t *)&unk_100022D80);
  v9 = static _SetStorage.resize(original:capacity:move:)(v8, a1, 0);
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
  {
    result = swift_release(v8);
LABEL_36:
    *v2 = v10;
    return result;
  }
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 56);
  v35 = v2;
  v36 = v8 + 56;
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v37 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 56;
  result = swift_retain(v8);
  v17 = 0;
  if (!v14)
    goto LABEL_9;
LABEL_8:
  v18 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  for (i = v18 | (v17 << 6); ; i = __clz(__rbit64(v21)) + (v17 << 6))
  {
    v23 = *(_QWORD *)(v5 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(_QWORD *)(v8 + 48) + v23 * i, v4);
    v24 = *(_QWORD *)(v10 + 40);
    sub_100012050(&qword_100022D78, (uint64_t)&protocol conformance descriptor for UUID);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v24, v4, v25);
    v26 = -1 << *(_BYTE *)(v10 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v15 + 8 * (v27 >> 6))) == 0)
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v26) >> 6;
      while (++v28 != v31 || (v30 & 1) == 0)
      {
        v32 = v28 == v31;
        if (v28 == v31)
          v28 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v15 + 8 * v28);
        if (v33 != -1)
        {
          v29 = __clz(__rbit64(~v33)) + (v28 << 6);
          goto LABEL_32;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    v29 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v15 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_32:
    *(_QWORD *)(v15 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v10 + 48) + v29 * v23, v7, v4);
    ++*(_QWORD *)(v10 + 16);
    if (v14)
      goto LABEL_8;
LABEL_9:
    v20 = v17 + 1;
    if (__OFADD__(v17, 1))
      goto LABEL_38;
    if (v20 >= v37)
      goto LABEL_34;
    v21 = *(_QWORD *)(v36 + 8 * v20);
    ++v17;
    if (!v21)
    {
      v17 = v20 + 1;
      if (v20 + 1 >= v37)
        goto LABEL_34;
      v21 = *(_QWORD *)(v36 + 8 * v17);
      if (!v21)
      {
        v17 = v20 + 2;
        if (v20 + 2 >= v37)
          goto LABEL_34;
        v21 = *(_QWORD *)(v36 + 8 * v17);
        if (!v21)
          break;
      }
    }
LABEL_22:
    v14 = (v21 - 1) & v21;
  }
  v22 = v20 + 3;
  if (v22 >= v37)
  {
LABEL_34:
    result = swift_release_n(v8, 2);
    v2 = v35;
    goto LABEL_36;
  }
  v21 = *(_QWORD *)(v36 + 8 * v22);
  if (v21)
  {
    v17 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    v17 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v17 >= v37)
      goto LABEL_34;
    v21 = *(_QWORD *)(v36 + 8 * v17);
    ++v22;
    if (v21)
      goto LABEL_22;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_100011160(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  unint64_t i;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(char *, unint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t v40;

  v2 = v1;
  v4 = type metadata accessor for UUID(0);
  v40 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  sub_1000054F4((uint64_t *)&unk_100022D80);
  v8 = static _SetStorage.resize(original:capacity:move:)(v7, a1, 1);
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
    goto LABEL_38;
  v10 = 1 << *(_BYTE *)(v7 + 32);
  v11 = *(_QWORD *)(v7 + 56);
  v39 = (_QWORD *)(v7 + 56);
  if (v10 < 64)
    v12 = ~(-1 << v10);
  else
    v12 = -1;
  v13 = v12 & v11;
  v37 = v2;
  v38 = (unint64_t)(v10 + 63) >> 6;
  v14 = v8 + 56;
  result = swift_retain(v7);
  v16 = 0;
  if (!v13)
    goto LABEL_9;
LABEL_8:
  v17 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v17 | (v16 << 6); ; i = __clz(__rbit64(v20)) + (v16 << 6))
  {
    v22 = v7;
    v23 = *(_QWORD *)(v40 + 72);
    v24 = *(_QWORD *)(v7 + 48) + v23 * i;
    v25 = *(void (**)(char *, unint64_t, uint64_t))(v40 + 32);
    v25(v6, v24, v4);
    v26 = *(_QWORD *)(v9 + 40);
    sub_100012050(&qword_100022D78, (uint64_t)&protocol conformance descriptor for UUID);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v26, v4, v27);
    v28 = -1 << *(_BYTE *)(v9 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v14 + 8 * (v29 >> 6))) == 0)
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v28) >> 6;
      while (++v30 != v33 || (v32 & 1) == 0)
      {
        v34 = v30 == v33;
        if (v30 == v33)
          v30 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v14 + 8 * v30);
        if (v35 != -1)
        {
          v31 = __clz(__rbit64(~v35)) + (v30 << 6);
          goto LABEL_32;
        }
      }
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      return result;
    }
    v31 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v14 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
LABEL_32:
    *(_QWORD *)(v14 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v31;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v25)(*(_QWORD *)(v9 + 48) + v31 * v23, v6, v4);
    ++*(_QWORD *)(v9 + 16);
    v7 = v22;
    if (v13)
      goto LABEL_8;
LABEL_9:
    v19 = v16 + 1;
    if (__OFADD__(v16, 1))
      goto LABEL_40;
    if (v19 >= v38)
      goto LABEL_34;
    v20 = v39[v19];
    ++v16;
    if (!v20)
    {
      v16 = v19 + 1;
      if (v19 + 1 >= v38)
        goto LABEL_34;
      v20 = v39[v16];
      if (!v20)
      {
        v16 = v19 + 2;
        if (v19 + 2 >= v38)
          goto LABEL_34;
        v20 = v39[v16];
        if (!v20)
          break;
      }
    }
LABEL_22:
    v13 = (v20 - 1) & v20;
  }
  v21 = v19 + 3;
  if (v21 < v38)
  {
    v20 = v39[v21];
    if (!v20)
    {
      while (1)
      {
        v16 = v21 + 1;
        if (__OFADD__(v21, 1))
          goto LABEL_41;
        if (v16 >= v38)
          goto LABEL_34;
        v20 = v39[v16];
        ++v21;
        if (v20)
          goto LABEL_22;
      }
    }
    v16 = v21;
    goto LABEL_22;
  }
LABEL_34:
  swift_release(v7);
  v2 = v37;
  v36 = 1 << *(_BYTE *)(v7 + 32);
  if (v36 > 63)
    sub_1000109DC(0, (unint64_t)(v36 + 63) >> 6, v39);
  else
    *v39 = -1 << v36;
  *(_QWORD *)(v7 + 16) = 0;
LABEL_38:
  result = swift_release(v7);
  *v2 = v9;
  return result;
}

uint64_t sub_1000114C0(int64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  void (*v31)(char *, unint64_t, uint64_t);
  unint64_t v32;
  uint64_t v33;

  v3 = type metadata accessor for UUID(0);
  v33 = *(_QWORD *)(v3 - 8);
  result = __chkstk_darwin(v3);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v8 = *v1 + 56;
  v9 = -1 << *(_BYTE *)(*v1 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    v30 = v1;
    v11 = ~v9;
    swift_retain(v7);
    v12 = _HashTable.previousHole(before:)(a1, v8, v11);
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v32 = (v12 + 1) & v11;
      v13 = *(_QWORD *)(v33 + 72);
      v31 = *(void (**)(char *, unint64_t, uint64_t))(v33 + 16);
      while (1)
      {
        v14 = v13 * v10;
        v31(v6, *(_QWORD *)(v7 + 48) + v13 * v10, v3);
        v15 = *(_QWORD *)(v7 + 40);
        sub_100012050(&qword_100022D78, (uint64_t)&protocol conformance descriptor for UUID);
        v17 = dispatch thunk of Hashable._rawHashValue(seed:)(v15, v3, v16);
        (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v3);
        v18 = v17 & v11;
        if (a1 >= (uint64_t)v32)
        {
          if (v18 < v32 || a1 < (uint64_t)v18)
            goto LABEL_24;
        }
        else if (v18 < v32 && a1 < (uint64_t)v18)
        {
          goto LABEL_24;
        }
        v21 = *(_QWORD *)(v7 + 48);
        v22 = v13 * a1;
        v23 = v21 + v13 * a1;
        v24 = v21 + v14 + v13;
        if (v13 * a1 < v14 || v23 >= v24)
          break;
        a1 = v10;
        if (v22 != v14)
        {
          swift_arrayInitWithTakeBackToFront();
          goto LABEL_23;
        }
LABEL_24:
        v10 = (v10 + 1) & v11;
        if (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
          goto LABEL_25;
      }
      swift_arrayInitWithTakeFrontToBack();
LABEL_23:
      a1 = v10;
      goto LABEL_24;
    }
LABEL_25:
    *(_QWORD *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    result = swift_release(v7);
    v1 = v30;
  }
  else
  {
    *(_QWORD *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  v26 = *v1;
  v27 = *(_QWORD *)(*v1 + 16);
  v28 = __OFSUB__(v27, 1);
  v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v26 + 16) = v29;
    ++*(_DWORD *)(v26 + 36);
  }
  return result;
}

char *sub_100011728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v3 = a3;
    v5 = a2;
    v6 = a1;
    v7 = *v4;
    if (!((unint64_t)*v4 >> 62))
    {
      v9 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  if (v7 < 0)
    v19 = v7;
  else
    v19 = v7 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v7);
  v9 = _CocoaArrayWrapper.endIndex.getter(v19);
  swift_bridgeObjectRelease(v7);
LABEL_4:
  if (v9 < v5)
  {
    __break(1u);
    goto LABEL_35;
  }
  v9 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v8 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v7 = *v4;
  if (!((unint64_t)*v4 >> 62))
  {
    v10 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_9;
  }
LABEL_37:
  if (v7 < 0)
    v20 = v7;
  else
    v20 = v7 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v7);
  v10 = _CocoaArrayWrapper.endIndex.getter(v20);
  swift_bridgeObjectRelease(v7);
LABEL_9:
  v11 = v10 + v8;
  if (__OFADD__(v10, v8))
  {
    __break(1u);
LABEL_42:
    if (v7 < 0)
      v21 = v7;
    else
      v21 = v7 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v7);
    v14 = _CocoaArrayWrapper.endIndex.getter(v21);
    swift_bridgeObjectRelease(v7);
    goto LABEL_17;
  }
  v7 = *v4;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v4);
  *v4 = v7;
  v10 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v7 & 0x8000000000000000) == 0 && (v7 & 0x4000000000000000) == 0)
  {
    v13 = v7 & 0xFFFFFFFFFFFFFF8;
    if (v11 <= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_20;
    v10 = 1;
  }
  if ((unint64_t)v7 >> 62)
    goto LABEL_42;
  v14 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_17:
  if (v14 <= v11)
    v14 = v11;
  swift_bridgeObjectRetain(v7);
  v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v10, v14, 1, v7);
  swift_bridgeObjectRelease(*v4);
  *v4 = v7;
  v13 = v7 & 0xFFFFFFFFFFFFFF8;
LABEL_20:
  v15 = v13 + 32 + 8 * v6;
  type metadata accessor for ServiceExtension(0);
  result = (char *)swift_arrayDestroy(v15, v9);
  if (!v8)
  {
LABEL_28:
    *(_QWORD *)v15 = v3;
    return (char *)specialized Array._endMutation()(result);
  }
  if ((unint64_t)v7 >> 62)
  {
    if (v7 < 0)
      v22 = v7;
    else
      v22 = v13;
    swift_bridgeObjectRetain(v7);
    v17 = _CocoaArrayWrapper.endIndex.getter(v22);
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v17 = *(_QWORD *)(v13 + 16);
  }
  if (__OFSUB__(v17, v5))
  {
    __break(1u);
  }
  else
  {
    result = sub_10000FF14((char *)(v13 + 32 + 8 * v5), v17 - v5, (char *)(v15 + 8));
    if (!((unint64_t)v7 >> 62))
    {
      v18 = *(_QWORD *)(v13 + 16);
      goto LABEL_26;
    }
  }
  if (v7 < 0)
    v23 = v7;
  else
    v23 = v13;
  swift_bridgeObjectRetain(v7);
  v18 = _CocoaArrayWrapper.endIndex.getter(v23);
  result = (char *)swift_bridgeObjectRelease(v7);
LABEL_26:
  if (!__OFADD__(v18, v8))
  {
    *(_QWORD *)(v13 + 16) = v18 + v8;
    goto LABEL_28;
  }
  __break(1u);
  return result;
}

uint64_t sub_100011984(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD, _QWORD, _QWORD);
  uint64_t v22;
  void (*v23)(_QWORD, _QWORD, _QWORD);
  uint64_t v24;
  char v25;
  void (*v26)(char *, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  char *v28;
  uint64_t v29;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;

  v3 = v2;
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v2;
  v11 = *(_QWORD *)(*v2 + 40);
  sub_100012050(&qword_100022D78, (uint64_t)&protocol conformance descriptor for UUID);
  v13 = v12;
  swift_bridgeObjectRetain(v10);
  v35 = a2;
  v14 = dispatch thunk of Hashable._rawHashValue(seed:)(v11, v6, v13);
  v15 = -1 << *(_BYTE *)(v10 + 32);
  v16 = v14 & ~v15;
  v17 = v10;
  v18 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0)
  {
    v31 = v3;
    v32 = a1;
    v33 = ~v15;
    v19 = v7;
    v20 = *(_QWORD *)(v7 + 72);
    v34 = v19;
    v21 = *(void (**)(_QWORD, _QWORD, _QWORD))(v19 + 16);
    while (1)
    {
      v22 = v17;
      v23 = v21;
      v21(v9, *(_QWORD *)(v17 + 48) + v20 * v16, v6);
      sub_100012050(&qword_100022D68, (uint64_t)&protocol conformance descriptor for UUID);
      v25 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v35, v6, v24);
      v26 = *(void (**)(char *, uint64_t))(v34 + 8);
      v26(v9, v6);
      if ((v25 & 1) != 0)
        break;
      v16 = (v16 + 1) & v33;
      v17 = v22;
      v21 = v23;
      if (((*(_QWORD *)(v18 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
      {
        swift_bridgeObjectRelease(v22);
        v3 = v31;
        a1 = v32;
        v7 = v34;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease(v22);
    v26(v35, v6);
    v23(v32, *(_QWORD *)(*v31 + 48) + v20 * v16, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease(v10);
    v21 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v28 = v35;
    v21(v9, v35, v6);
    v36 = *v3;
    *v3 = 0x8000000000000000;
    sub_100011BD8((uint64_t)v9, v16, isUniquelyReferenced_nonNull_native);
    v29 = *v3;
    *v3 = v36;
    swift_bridgeObjectRelease(v29);
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v28, v6);
    return 1;
  }
}

uint64_t sub_100011BD8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, unint64_t, uint64_t);
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = a1;
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v29 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_100011160(v12);
  }
  else
  {
    if (v11 > v10)
    {
      sub_100010C1C();
      goto LABEL_12;
    }
    sub_100010E44(v12);
  }
  v13 = *v3;
  v14 = *(_QWORD *)(*v3 + 40);
  sub_100012050(&qword_100022D78, (uint64_t)&protocol conformance descriptor for UUID);
  v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v6, v15);
  v17 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v16 & ~v17;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v18 = ~v17;
    v19 = *(_QWORD *)(v7 + 72);
    v20 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v20(v9, *(_QWORD *)(v13 + 48) + v19 * a2, v6);
      sub_100012050(&qword_100022D68, (uint64_t)&protocol conformance descriptor for UUID);
      v22 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v30, v6, v21);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v22 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v18;
    }
    while (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v23 = v30;
  v24 = *v29;
  *(_QWORD *)(*v29 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v24 + 48) + *(_QWORD *)(v7 + 72) * a2, v23, v6);
  v26 = *(_QWORD *)(v24 + 16);
  v27 = __OFADD__(v26, 1);
  v28 = v26 + 1;
  if (!v27)
  {
    *(_QWORD *)(v24 + 16) = v28;
    return result;
  }
  __break(1u);
LABEL_15:
  result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v6);
  __break(1u);
  return result;
}

uint64_t sub_100011DCC(unint64_t a1)
{
  uint64_t v2;

  if (a1 >> 62)
  {
    sub_100006334();
    v2 = sub_100012594();
    sub_10001238C();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

uint64_t sub_100011E28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

void sub_100011E38(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000054F4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  sub_1000059DC();
}

uint64_t sub_100011E78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000054F4(&qword_100022D38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100011EC0()
{
  uint64_t v0;

  return sub_10000E59C(*(Swift::String **)(v0 + 16), *(_QWORD *)(v0 + 24), 32);
}

uint64_t sub_100011EF8(_QWORD *a1)
{
  uint64_t v1;

  return sub_10000B2F4(a1, *(_QWORD *)(v1 + 16)) & 1;
}

uint64_t sub_100011F18()
{
  uint64_t v0;

  return sub_10000B7AC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t (**)(void))(v0 + 32));
}

uint64_t sub_100011F24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(sub_100005AE8() - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 32) & ~v2;
  v4 = v3 + *(_QWORD *)(v1 + 64);
  v5 = v2 | 7;
  sub_1000124F4();
  swift_release(*(_QWORD *)(v0 + 24));
  sub_100012450(v0 + v3, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  return swift_deallocObject(v0, v4, v5);
}

uint64_t sub_100011F94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100005AE8();
  v0 = sub_1000126B0();
  return sub_10000E46C(v0, v1, v2, v3, v4);
}

uint64_t sub_100011FDC()
{
  uint64_t v0;

  return sub_10000E59C(*(Swift::String **)(v0 + 16), *(_QWORD *)(v0 + 24), 35);
}

void sub_100012018(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000054F4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_1000059DC();
}

void sub_100012050(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = type metadata accessor for UUID(255);
    atomic_store(swift_getWitnessTable(a2, v4), a1);
  }
  sub_1000059DC();
}

uint64_t sub_10001208C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000120C0(char a1)
{
  uint64_t v1;

  return sub_100007690(a1, *(NSObject **)(v1 + 16), *(void (**)(uint64_t))(v1 + 24), *(_QWORD *)(v1 + 32), *(char **)(v1 + 40));
}

uint64_t sub_1000120CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  sub_100005AE8();
  sub_1000123CC();
  v5 = (v4 + 23) & 0xFFFFFFFFFFFFFFF8;
  sub_1000124F4();
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  sub_100012450(v0 + v3, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  swift_release(*(_QWORD *)(v0 + v4 + 8));
  swift_release(*(_QWORD *)(v0 + v5));
  return sub_100012410(v0, v5 + 8, v1);
}

uint64_t sub_100012138(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  sub_100005AE8();
  sub_100012520();
  return sub_10000862C(a1, *(char **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), v1 + v4, *(void (**)(uint64_t))(v1 + (v3 & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + (v3 & 0xFFFFFFFFFFFFFFF8) + 8), *(NSObject **)(v1 + (((v3 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_100012184()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100005AE8();
  sub_1000123CC();
  sub_1000124F4();
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  sub_100012450(v0 + v3, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  swift_release(*(_QWORD *)(v0 + v4));
  return sub_100012410(v0, v4 + 8, v1);
}

void sub_1000121DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_100005AE8();
  sub_100012520();
  sub_1000083B8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), v0 + v2, *(_QWORD *)(v0 + (v1 & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_100012208(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100012244(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100012278()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001229C()
{
  uint64_t v0;

  return sub_1000067E8(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1000122A8()
{
  uint64_t v0;

  sub_1000124F4();
  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000122D8(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000122F8(_QWORD *a1)
{
  return sub_100011EF8(a1) & 1;
}

uint64_t sub_100012358(uint64_t a1, uint64_t a2)
{
  return swift_beginAccess(a1, a2, 0, 0);
}

uint64_t sub_100012364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_beginAccess(a1, a2, a3, 0);
}

uint64_t sub_10001236C()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

id sub_100012374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  return objc_msgSend(v5, *(SEL *)(v8 + 2936), v6, v7, a5, 0);
}

uint64_t sub_10001238C()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000123BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void sub_1000123C4(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x16u);
}

void sub_1000123F8(id a1)
{

}

uint64_t sub_100012410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_deallocObject(a1, a2, a3);
}

uint64_t sub_100012424(uint64_t a1)
{
  return swift_bridgeObjectRelease(a1);
}

uint64_t sub_100012438()
{
  uint64_t v0;

  return swift_retain(v0);
}

void sub_100012440(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t sub_100012448(uint64_t a1)
{
  return swift_arrayDestroy(a1, 2);
}

uint64_t sub_100012450@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_100012458()
{
  uint64_t v0;

  return specialized _ArrayBuffer._getElementSlowPath(_:)(0, v0);
}

uint64_t sub_100012464(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  return sub_10000562C(0, a2, a3);
}

uint64_t sub_100012498()
{
  uint64_t v0;

  return swift_release(v0);
}

uint64_t sub_1000124A0(uint64_t a1)
{
  return swift_arrayDestroy(a1, 1);
}

uint64_t sub_1000124A8()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000124B0()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(v0 + 32));
}

uint64_t sub_1000124BC()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(v0 + 16))(v0);
}

BOOL sub_1000124C8(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void sub_1000124F4()
{
  uint64_t v0;

}

uint64_t sub_100012540()
{
  uint64_t v0;

  return swift_release(v0);
}

id sub_100012548(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id sub_100012550(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  double v9;
  double v10;
  double v11;
  double v12;

  return objc_msgSendSuper2(&a9, a2, v12, v11, v10, v9);
}

uint64_t sub_100012568()
{
  return 0x7469617274726F70;
}

uint64_t sub_100012580(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2, v2);
}

uint64_t sub_100012588(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_100013928(a1, a2, (uint64_t *)(v2 - 104));
}

uint64_t sub_100012594()
{
  uint64_t v0;

  return _CocoaArrayWrapper.endIndex.getter(v0);
}

uint64_t sub_10001259C()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(v0);
}

id sub_1000125A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  return objc_msgSend(v5, *(SEL *)(v7 + 2936), v6, a4, a5, 0);
}

uint64_t sub_1000125B8()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000125C0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1000125C8()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000125D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2, v2);
}

id sub_1000125D8(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t sub_1000125E0()
{
  uint64_t v0;

  return swift_release(v0);
}

uint64_t sub_1000125E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return AnyHashable.init<A>(_:)(v0 + 112, v1, v2);
}

uint64_t sub_1000125FC()
{
  return 0x70616373646E616CLL;
}

uint64_t sub_100012610()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 200) + 8))(v1, v0);
}

uint64_t sub_100012624()
{
  return type metadata accessor for SecureWindow();
}

uint64_t sub_100012638@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_100012658(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v6;
  va_list va;
  va_list va1;

  va_start(va1, a5);
  va_start(va, a5);
  v6 = va_arg(va1, _QWORD);
  return swift_dynamicCast((uint64_t *)va, va1, a3, a4, 6);
}

BOOL sub_100012668(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t sub_100012670()
{
  uint64_t v0;

  return swift_release(v0);
}

uint64_t sub_100012678()
{
  return type metadata accessor for Notification(0);
}

uint64_t sub_100012680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  a9 = v9;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(&a9, v10, a3);
}

uint64_t sub_100012690()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100012698()
{
  uint64_t v0;

  return swift_unknownObjectRelease(v0);
}

uint64_t sub_1000126A0()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000126A8()
{
  uint64_t v0;

  return _CocoaArrayWrapper.endIndex.getter(v0);
}

uint64_t sub_1000126B0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1000126BC(uint64_t a1)
{
  uint64_t v1;

  return sub_100011E28(a1, 1, v1);
}

uint64_t sub_1000126D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_100013928(a1, v3, a3);
}

uint64_t sub_1000126E0()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_1000126E8()
{
  uint64_t v0;

  return swift_unknownObjectRelease(v0);
}

uint64_t sub_1000126F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 4) = a1;
  return swift_release_n(v1, 2);
}

BOOL sub_100012700(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100012730(uint64_t a1, uint64_t a2)
{
  return sub_100005400(a1, a2);
}

uint64_t sub_100012744()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10001274C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t sub_100012774@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t sub_10001277C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_100013928(a1, a2, (uint64_t *)(v2 - 136));
}

id sub_100012788(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t sub_100012790@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return swift_bridgeObjectRelease(*(_QWORD *)(v1 + a1));
}

void sub_100012798(uint64_t a1@<X8>)
{
  uint64_t v1;

}

uint64_t sub_1000127A0()
{
  uint64_t v0;

  return specialized _ArrayBuffer._getElementSlowPath(_:)(0, v0);
}

uint64_t sub_1000127AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_100013928(a1, a2, (uint64_t *)(v2 - 168));
}

uint64_t sub_1000127B4()
{
  uint64_t v0;

  return swift_retain_n(v0, 2);
}

uint64_t sub_1000127C0()
{
  uint64_t v0;

  return swift_release_n(v0, 3);
}

uint64_t sub_1000127CC()
{
  uint64_t *v0;

  return sub_1000054F4(v0);
}

uint64_t sub_1000127D4(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7);
}

uint64_t sub_1000127DC(uint64_t a1, unint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  return sub_100013928(a1, a2, (uint64_t *)va);
}

uint64_t sub_1000127E4()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(v0);
}

id sub_100012800(id a1)
{
  return a1;
}

uint64_t sub_100012808()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_100012810()
{
  uint64_t v0;

  return swift_unknownObjectRetain(v0);
}

uint64_t sub_10001281C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000FF08(a1, a2, 1, a4);
}

uint64_t sub_100012824(uint64_t a1)
{
  uint64_t v1;

  return sub_100011E28(a1, 1, v1);
}

uint64_t sub_100012830(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2, v2);
}

uint64_t sub_10001283C()
{
  uint64_t v0;

  return swift_endAccess(v0 - 104);
}

uint64_t sub_100012868()
{
  uint64_t v0;

  return swift_retain(v0);
}

uint64_t sub_100012870()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t sub_10001287C()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100012884()
{
  uint64_t v0;

  return swift_release(v0);
}

id sub_10001288C(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_100012894(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2, v2);
}

uint64_t sub_1000128A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, a4, 0);
}

uint64_t sub_1000128A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_100013928(a1, v3, a3);
}

void sub_1000128B0()
{
  uint64_t v0;

  *(_WORD *)(v0 + 12) = 2082;
}

uint64_t sub_1000128BC(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_1000128C4(uint64_t a1)
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

uint64_t sub_1000128F0(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _BYTE v19[40];
  __int128 v20;
  uint64_t v21;

  *(_QWORD *)(v2 + 56) = 0;
  *(_BYTE *)(v2 + 64) = 0;
  *(_QWORD *)(v2 + 72) = 0;
  *(_BYTE *)(v2 + 80) = 1;
  *(_QWORD *)(v2 + 88) = 0;
  v5 = v2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  v6 = type metadata accessor for UUID(0);
  sub_10000FF08(v5, 1, 1, v6);
  *(_BYTE *)(v2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_loaded) = 0;
  *(_BYTE *)(v2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_loading) = 0;
  v7 = v2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_logger;
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, a1, v8);
  result = sub_100014244(a2);
  if (!v11)
  {
    __break(1u);
    goto LABEL_11;
  }
  *(_QWORD *)(v2 + 16) = result;
  *(_QWORD *)(v2 + 24) = v11;
  *(_QWORD *)(v2 + 48) = a2;
  v12 = a2;
  result = sub_1000142A4(v12);
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v13 = result;
  v17 = 0xD000000000000012;
  v18 = 0x80000001000178C0;
  AnyHashable.init<A>(_:)(&v17, &type metadata for String, &protocol witness table for String);
  sub_100012AC0((uint64_t)v19, v13, &v20);
  swift_bridgeObjectRelease(v13);
  sub_100012244((uint64_t)v19);
  if (v21)
  {
    if ((swift_dynamicCast(&v17, &v20, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
    {

      v14 = v17;
      v15 = v18;
LABEL_9:
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
      *(_QWORD *)(v2 + 32) = v14;
      *(_QWORD *)(v2 + 40) = v15;
      return v2;
    }
  }
  else
  {
    sub_10001430C((uint64_t)&v20, &qword_100022820);
  }
  result = sub_100014244(v12);
  if (v16)
  {
    v14 = result;
    v15 = v16;

    goto LABEL_9;
  }
LABEL_12:
  __break(1u);
  return result;
}

double sub_100012AC0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v5;
  char v6;
  double result;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_10000FF98(a1), (v6 & 1) != 0))
  {
    sub_10000571C(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void sub_100012B10(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void **v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  Swift::String v22;
  Swift::String v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void **aBlock;
  unint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t, void *, void *);
  void *v30;
  uint64_t (*v31)(uint64_t, void *, void *);
  _QWORD *v32;

  v3 = v2;
  if ((*((_BYTE *)v2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_loaded) & 1) != 0
    || (v4 = OBJC_IVAR____TtC7Sidecar16ServiceExtension_loading,
        *((_BYTE *)v2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_loading) == 1))
  {
    _StringGuts.grow(_:)(45);
    swift_bridgeObjectRelease(0xE000000000000000);
    aBlock = (void **)0xD000000000000011;
    v28 = 0x8000000100017860;
    v21 = v2[2];
    v20 = (void *)v2[3];
    swift_bridgeObjectRetain(v20);
    v22._countAndFlagsBits = v21;
    v22._object = v20;
    String.append(_:)(v22);
    swift_bridgeObjectRelease(v20);
    v23._countAndFlagsBits = 0xD00000000000001ALL;
    v23._object = (void *)0x8000000100017880;
    String.append(_:)(v23);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000011, 0x8000000100017860, "Sidecar/ServiceExtension.swift", 30, 2, 44, 0);
    __break(1u);
  }
  else
  {
    v7 = sub_10001435C();
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v24 = a1;
      v10 = (uint8_t *)sub_100005A70(12);
      v25 = a2;
      v11 = (void **)sub_100005A70(32);
      aBlock = v11;
      *(_DWORD *)v10 = 136446210;
      v13 = v3[2];
      v12 = v3[3];
      swift_bridgeObjectRetain(v12);
      v26 = sub_100013928(v13, v12, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &aBlock, v10 + 4);
      sub_10001433C();
      v14 = v12;
      a1 = v24;
      swift_bridgeObjectRelease(v14);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "=== Loading Service %{public}s ===", v10, 0xCu);
      swift_arrayDestroy(v11, 1);
      v15 = (uint64_t)v11;
      a2 = v25;
      sub_1000059B4(v15);
      sub_1000059B4((uint64_t)v10);
    }
    else
    {
      sub_10001433C();
    }

    *((_BYTE *)v3 + v4) = 1;
    v16 = (void *)v3[6];
    v17 = (_QWORD *)swift_allocObject(&unk_10001CFF8, 40, 7);
    v17[2] = v3;
    v17[3] = a1;
    v17[4] = a2;
    v31 = sub_1000140C0;
    v32 = v17;
    aBlock = _NSConcreteStackBlock;
    v28 = 1107296256;
    v29 = sub_1000133FC;
    v30 = &unk_10001D010;
    v18 = _Block_copy(&aBlock);
    v19 = v32;
    swift_retain(v3);
    swift_retain(a2);
    swift_release(v19);
    objc_msgSend(v16, "instantiateViewControllerWithInputItems:connectionHandler:", 0, v18);
    _Block_release(v18);
  }
}

uint64_t sub_100012DE4(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t (*a5)(_QWORD), uint64_t a6)
{
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
  _QWORD *v20;
  uint64_t (*v21)(_QWORD);
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(_QWORD);
  uint64_t aBlock[5];
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;

  v42 = a6;
  v43 = a5;
  v10 = type metadata accessor for DispatchWorkItemFlags(0);
  v41 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DispatchQoS(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_BYTE *)(a4 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_loading) = 0;
  if (a2 && (v18 = type metadata accessor for HostRemoteViewController(), (v15 = swift_dynamicCastClass(a2, v18)) != 0))
  {
    v19 = v15;
    sub_1000140EC();
    v39 = a2;
    v40 = static OS_dispatch_queue.main.getter();
    v20 = (_QWORD *)swift_allocObject(&unk_10001D048, 56, 7);
    v20[2] = v19;
    v20[3] = a4;
    v22 = v42;
    v21 = v43;
    v20[4] = a1;
    v20[5] = v21;
    v20[6] = v22;
    aBlock[4] = (uint64_t)sub_100014164;
    v45 = v20;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1000128C4;
    aBlock[3] = (uint64_t)&unk_10001D060;
    v23 = _Block_copy(aBlock);
    v24 = v45;
    swift_unknownObjectRetain(a1);
    swift_retain(v22);
    v25 = v39;
    swift_retain(a4);
    v26 = swift_release(v24);
    static DispatchQoS.unspecified.getter(v26);
    aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
    v27 = sub_100014174();
    v28 = sub_1000054F4(&qword_100022808);
    v29 = sub_100005534();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v28, v29, v10, v27);
    v30 = (void *)v40;
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v17, v12, v23);
    _Block_release(v23);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }
  else
  {
    if (a3)
    {
      __chkstk_darwin(v15);
      *(&v39 - 2) = a3;
      swift_errorRetain(a3);
      sub_100005EE8(sub_1000140E4, a4, (uint64_t (*)(void))sub_10000566C);
      swift_errorRelease(a3);
    }
    else
    {
      v32 = swift_retain_n(a4, 2);
      v33 = Logger.logObject.getter(v32);
      v34 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc(12, -1);
        v36 = swift_slowAlloc(32, -1);
        aBlock[0] = v36;
        *(_DWORD *)v35 = 136446210;
        v37 = *(_QWORD *)(a4 + 16);
        v38 = *(_QWORD *)(a4 + 24);
        swift_bridgeObjectRetain(v38);
        v46 = sub_100013928(v37, v38, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47, v35 + 4);
        swift_release_n(a4, 2);
        swift_bridgeObjectRelease(v38);
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "=== Service '%{public}s' Activation Failed ===", v35, 0xCu);
        swift_arrayDestroy(v36, 1);
        swift_slowDealloc(v36, -1, -1);
        swift_slowDealloc(v35, -1, -1);
      }
      else
      {
        swift_release_n(a4, 2);
      }

    }
    return v43(0);
  }
}

uint64_t sub_1000131DC(Swift::String *a1)
{
  Swift::String v2;
  Swift::String v3;
  uint64_t v5;

  v5 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)(36, 1);
  v2._countAndFlagsBits = 0x76726553203D3D3DLL;
  v2._object = (void *)0xED00002720656369;
  String.append(_:)(v2);
  String.append(_:)(a1[1]);
  v3._object = (void *)0x80000001000178A0;
  v3._countAndFlagsBits = 0xD000000000000017;
  String.append(_:)(v3);
  return v5;
}

uint64_t sub_100013268(char *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char *v21;
  _QWORD v24[3];

  v8 = sub_1000054F4(&qword_100022D40);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v24[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v24[-1] - v12;
  swift_weakAssign(&a1[OBJC_IVAR___HostRemoteViewController_serviceExtension], a2);
  if (a3)
  {
    v24[0] = a3;
    swift_unknownObjectRetain(a3);
    v14 = sub_1000054F4(&qword_100023008);
    v15 = type metadata accessor for UUID(0);
    v16 = swift_dynamicCast(v13, v24, v14, v15, 6) ^ 1;
    v17 = (uint64_t)v13;
    v18 = v15;
  }
  else
  {
    v18 = type metadata accessor for UUID(0);
    v17 = (uint64_t)v13;
    v16 = 1;
  }
  sub_10000FF08(v17, v16, 1, v18);
  sub_1000141B4((uint64_t)v13, (uint64_t)v11);
  v19 = a2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  swift_beginAccess(a2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid, v24, 33, 0);
  sub_1000141FC((uint64_t)v11, v19);
  swift_endAccess(v24);
  *(_BYTE *)(a2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_loaded) = 1;
  v20 = *(void **)(a2 + 56);
  *(_QWORD *)(a2 + 56) = a1;
  v21 = a1;

  return a4(1);
}

uint64_t sub_1000133FC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7;
  void (*v8)(uint64_t, void *, void *);
  id v9;
  id v10;

  v8 = *(void (**)(uint64_t, void *, void *))(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  swift_retain(v7);
  swift_unknownObjectRetain(a2);
  v9 = a3;
  v10 = a4;
  v8(a2, a3, a4);
  swift_release(v7);

  return swift_unknownObjectRelease(a2);
}

void sub_100013484()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  Class isa;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25[3];

  v1 = v0;
  v2 = sub_1000054F4(&qword_100022D40);
  __chkstk_darwin(v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OBJC_IVAR____TtC7Sidecar16ServiceExtension_loaded;
  v6 = &unk_100023000;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_loaded) & 1) != 0
    || *(_BYTE *)(v0 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_loading) == 1)
  {
    v7 = sub_10001435C();
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)sub_100005A70(12);
      v11 = sub_100005A70(32);
      v23 = v5;
      v12 = v11;
      v25[0] = v11;
      *(_DWORD *)v10 = 136446210;
      v13 = *(_QWORD *)(v1 + 16);
      v14 = *(_QWORD *)(v1 + 24);
      swift_bridgeObjectRetain(v14);
      v24 = sub_100013928(v13, v14, v25);
      v6 = (_QWORD *)&unk_100023000;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, v25, v10 + 4);
      sub_10001433C();
      swift_bridgeObjectRelease(v14);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "=== Unloading Service %{public}s ===", v10, 0xCu);
      swift_arrayDestroy(v12, 1);
      v15 = v12;
      v5 = v23;
      sub_1000059B4(v15);
      sub_1000059B4((uint64_t)v10);
    }
    else
    {
      sub_10001433C();
    }

    v16 = *(void **)(v1 + 56);
    if (v16)
    {
      v17 = v16;
      v18 = objc_msgSend(v17, "disconnect");

    }
    v19 = v1 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
    swift_beginAccess(v1 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid, v25, 0, 0);
    sub_1000138E0(v19, (uint64_t)v4);
    v20 = type metadata accessor for UUID(0);
    if (sub_100011E28((uint64_t)v4, 1, v20) != 1)
    {
      isa = UUID._bridgeToObjectiveC()().super.isa;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v4, v20);
      objc_msgSend(*(id *)(v1 + 48), "cancelExtensionRequestWithIdentifier:", isa);

    }
    *(_BYTE *)(v1 + v5) = 0;
    *(_BYTE *)(v1 + v6[34]) = 0;
  }
}

void sub_1000136F0()
{
  uint64_t v0;
  uint64_t v1;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 88));
  v1 = type metadata accessor for Logger(0);
  sub_100014348(v1);
  sub_10001430C(v0 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid, &qword_100022D40);
  sub_1000059DC();
}

uint64_t sub_100013760()
{
  uint64_t v0;

  sub_1000136F0();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100013784()
{
  return type metadata accessor for ServiceExtension(0);
}

uint64_t type metadata accessor for ServiceExtension(uint64_t a1)
{
  uint64_t result;

  result = qword_100022DD0;
  if (!qword_100022DD0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ServiceExtension);
  return result;
}

void sub_1000137C4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[12];

  v6[0] = &unk_100016B58;
  v6[1] = &unk_100016B58;
  v6[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v6[3] = &unk_100016B70;
  v6[4] = &unk_100016B88;
  v6[5] = (char *)&value witness table for Builtin.Int64 + 64;
  v6[6] = &unk_100016B88;
  v6[7] = &unk_100016B70;
  v2 = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v6[8] = *(_QWORD *)(v2 - 8) + 64;
    sub_10001388C(319);
    if (v5 <= 0x3F)
    {
      v6[9] = *(_QWORD *)(v4 - 8) + 64;
      v6[10] = &unk_100016B88;
      v6[11] = &unk_100016B88;
      swift_updateClassMetadata2(a1, 256, 12, v6, a1 + 80);
    }
  }
}

void sub_10001388C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100022DE0)
  {
    v2 = type metadata accessor for UUID(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100022DE0);
  }
}

uint64_t sub_1000138E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000054F4(&qword_100022D40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100013928(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  void *ObjectType;

  v6 = sub_1000139F8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000571C((uint64_t)v12, *a3);
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
      sub_10000571C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000122D8(v12);
  return v7;
}

_QWORD *sub_1000139F8(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  _QWORD *result;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100013B4C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_100013C10(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = _StringObject.sharedUTF8.getter(a5, a6);
    if (!v8)
    {
      result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return (_QWORD *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

void *sub_100013B4C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) != 0)
  {
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory with negative count", 60, 2, "Swift/UnsafeRawPointer.swift", 28, 2, 1170, 0);
  }
  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst)
      return memcpy(__dst, __src, __n);
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, 2, 1173, 0);
  }
  __break(1u);
  return result;
}

_QWORD *sub_100013C10(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_100013CA4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_100013E78(0, v2[2] + 1, 1, (uint64_t)v2);
  v4 = v2[2];
  v3 = v2[3];
  if (v4 >= v3 >> 1)
    v2 = sub_100013E78((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

_QWORD *sub_100013CA4(uint64_t a1, unint64_t a2)
{
  Swift::Int v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v4 = String.UTF8View._foreignCount()();
    if (v4)
      goto LABEL_6;
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    return &_swiftEmptyArrayStorage;
LABEL_6:
  v5 = sub_100013E14(v4, 0);
  if (v4 < 0)
  {
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, 2, 71, 0);
    __break(1u);
    goto LABEL_14;
  }
  v6 = v5;
  v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
  if ((v8 & 1) != 0)
  {
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    goto LABEL_15;
  }
  if (v7 == v4)
    return v6;
  result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, 2, 1122, 0);
LABEL_15:
  __break(1u);
  return result;
}

_QWORD *sub_100013E14(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000054F4((uint64_t *)&unk_100022F90);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_100013E78(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000054F4((uint64_t *)&unk_100022F90);
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
  v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_100014010(v14, v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_100013F4C(v14, v8, v13);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_100013F4C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) != 0)
  {
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst)
      return memcpy(__dst, __src, __n);
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

char *sub_100014010(char *__src, size_t __len, char *__dst)
{
  char v4;

  if ((__len & 0x8000000000000000) != 0)
  {
    v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v4, 1046, 0);
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_100014094()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000140C0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;

  return sub_100012DE4(a1, a2, a3, *(_QWORD *)(v3 + 16), *(uint64_t (**)(_QWORD))(v3 + 24), *(_QWORD *)(v3 + 32));
}

uint64_t sub_1000140CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000140DC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000140E4()
{
  Swift::String *v0;

  return sub_1000131DC(v0);
}

unint64_t sub_1000140EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000227F8;
  if (!qword_1000227F8)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000227F8);
  }
  return result;
}

uint64_t sub_100014128()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100014164()
{
  uint64_t v0;

  return sub_100013268(*(char **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(uint64_t (**)(uint64_t))(v0 + 40));
}

unint64_t sub_100014174()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100022800;
  if (!qword_100022800)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_100022800);
  }
  return result;
}

uint64_t sub_1000141B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000054F4(&qword_100022D40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000141FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000054F4(&qword_100022D40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100014244(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, "identifier");
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);

  return v3;
}

uint64_t sub_1000142A4(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, "infoDictionary");
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v1, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  return v3;
}

void sub_10001430C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = sub_1000054F4(a2);
  sub_100014348(v2);
  sub_1000059DC();
}

uint64_t sub_10001433C()
{
  uint64_t v0;

  return swift_release_n(v0, 2);
}

uint64_t sub_100014348(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t sub_10001435C()
{
  uint64_t v0;

  return swift_retain_n(v0, 2);
}

uint64_t sub_10001436C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC7SidecarP33_0288F9AF9923AFAC7CB167AF1998CFBB19ResourceBundleClass);
}

uint64_t static DispatchTimeInterval.seconds(_:)(double a1)
{
  double v1;
  char v2;
  double v3;
  char v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t result;

  if (a1 < 0.0)
    goto LABEL_37;
  if (a1 < 9223372040.0)
  {
    sub_1000157E0();
    if (v2)
    {
      __break(1u);
    }
    else if (v1 > -9.22337204e18)
    {
      sub_1000157D0();
      if (!v4)
        goto LABEL_28;
      goto LABEL_24;
    }
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (a1 < 9.22337204e12)
  {
    sub_1000157E0();
    if (v2)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    if (v5 <= -9.22337204e18)
    {
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    sub_1000157D0();
    if (!v4)
      goto LABEL_31;
    goto LABEL_24;
  }
  if (a1 < 9.22337204e15)
  {
    sub_1000157E0();
    if (v2)
    {
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    if (v6 <= -9.22337204e18)
    {
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    sub_1000157D0();
    if (!v4)
      goto LABEL_34;
    goto LABEL_24;
  }
  sub_1000157D0();
  if (!v4)
    goto LABEL_25;
  sub_1000157E0();
  if (v2)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (v3 > -9.22337204e18)
  {
LABEL_24:
    sub_100015A30(v3);
LABEL_25:
    sub_100015750();
    v7 = sub_100015938();
    return v8(v7);
  }
LABEL_36:
  __break(1u);
LABEL_37:
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000002BLL, 0x8000000100017950, "EyeCandyCore/Queue.swift", 24, 2, 16, 0);
  __break(1u);
  return result;
}

Swift::Void __swiftcall OS_dispatch_source_timer.reset(_:)(Swift::Double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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

  sub_1000156D4();
  v14 = v5;
  v15 = v6;
  sub_100015750();
  sub_100015A68();
  __chkstk_darwin(v7);
  sub_1000158C4();
  __chkstk_darwin(v8);
  v10 = (char *)&v13 - v9;
  sub_1000157B0();
  sub_100015A1C();
  __chkstk_darwin(v11);
  sub_10001563C();
  __chkstk_darwin(v12);
  sub_100015850();
  sub_1000159C8();
  sub_1000159C0(v2);
  (*(void (**)(char *, _QWORD))(v4 + 104))(v10, enum case for DispatchTimeInterval.never(_:));
  sub_100015A5C();
  sub_1000158A8();
  sub_100015950(v1);
  sub_100015950((uint64_t)v10);
  sub_1000159C0(v3);
  sub_100015658();
}

Swift::Void __swiftcall OS_dispatch_source_timer.reset(_:interval:)(Swift::Double _, Swift::Double interval)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_1000156D4();
  v16 = v5;
  v17 = v6;
  v8 = v7;
  sub_100015750();
  sub_100015A68();
  __chkstk_darwin(v9);
  sub_1000158C4();
  __chkstk_darwin(v10);
  v12 = (char *)&v15 - v11;
  sub_1000157B0();
  sub_100015A1C();
  __chkstk_darwin(v13);
  sub_10001563C();
  __chkstk_darwin(v14);
  sub_100015850();
  sub_1000159D8();
  sub_1000159C0(v3);
  static DispatchTimeInterval.seconds(_:)(v8);
  sub_100015A5C();
  sub_1000158A8();
  sub_100015950(v2);
  sub_100015950((uint64_t)v12);
  sub_1000159C0(v4);
  sub_100015658();
}

uint64_t sub_100014704()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v0 = type metadata accessor for DispatchQoS.QoSClass(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  sub_100012510();
  v4 = v3 - v2;
  sub_100012464(v5, (unint64_t *)&qword_1000227F8, OS_dispatch_queue_ptr);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 104))(v4, enum case for DispatchQoS.QoSClass.default(_:), v0);
  v6 = static OS_dispatch_queue.global(qos:)(v4);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
  static OS_dispatch_queue.defaultPriority = v6;
  return result;
}

uint64_t *OS_dispatch_queue.defaultPriority.unsafeMutableAddressor()
{
  if (qword_100023720 != -1)
    swift_once(&qword_100023720, sub_100014704);
  return &static OS_dispatch_queue.defaultPriority;
}

id static OS_dispatch_queue.defaultPriority.getter()
{
  if (qword_100023720 != -1)
    swift_once(&qword_100023720, sub_100014704);
  return (id)static OS_dispatch_queue.defaultPriority;
}

void OS_dispatch_queue.after(_:closure:)()
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t);
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[5];
  uint64_t v35;

  sub_1000156D4();
  v1 = v0;
  v3 = v2;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v32 = *(_QWORD *)(v4 - 8);
  sub_1000156B0();
  __chkstk_darwin(v5);
  sub_100012510();
  v8 = v7 - v6;
  v9 = type metadata accessor for DispatchQoS(0);
  v30 = *(_QWORD *)(v9 - 8);
  v31 = v9;
  sub_1000156B0();
  __chkstk_darwin(v10);
  sub_100012510();
  v13 = v12 - v11;
  v14 = sub_1000157B0();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __chkstk_darwin(v16);
  v21 = (char *)&v29 - v20;
  static DispatchTime.now()(v19);
  sub_1000159C8();
  v22 = *(void (**)(char *, uint64_t))(v15 + 8);
  v22(v18, v14);
  v34[4] = v3;
  v35 = v1;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 1107296256;
  v34[2] = sub_100014A40;
  v34[3] = &unk_10001D088;
  v23 = _Block_copy(v34);
  v24 = swift_retain(v1);
  static DispatchQoS.unspecified.getter(v24);
  v33 = &_swiftEmptyArrayStorage;
  sub_100005774((unint64_t *)&qword_100022800, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v26 = v25;
  v27 = sub_100015820();
  sub_1000158BC((unint64_t *)&qword_100022810);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v33, v27, v28, v4, v26);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v21, v13, v8, v23);
  _Block_release(v23);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v8, v4);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v13, v31);
  v22(v21, v14);
  swift_release(v35);
  sub_100015658();
}

uint64_t sub_100014A44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100014A54(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void OS_dispatch_queue.once(_:closure:)()
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
  _QWORD *v29;
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
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  void **v53;
  uint64_t v54;
  void (*v55)();
  _QWORD *v56;

  sub_1000156D4();
  v40 = v0;
  v45 = v3;
  v46 = v4;
  v5 = sub_100015750();
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  sub_1000156B0();
  __chkstk_darwin(v6);
  sub_100015690(v7, v39);
  __chkstk_darwin(v8);
  v50 = (char *)&v39 - v9;
  v10 = sub_1000157B0();
  v48 = *(_QWORD *)(v10 - 8);
  v49 = v10;
  sub_1000156B0();
  __chkstk_darwin(v11);
  sub_10001563C();
  v13 = __chkstk_darwin(v12);
  v21 = sub_1000156BC(v13, v14, v15, v16, v17, v18, v19, v20, v39);
  v43 = *(_QWORD *)(v21 - 8);
  v44 = v21;
  sub_1000156B0();
  __chkstk_darwin(v22);
  v23 = sub_100015674();
  v41 = *(_QWORD *)(v23 - 8);
  v42 = v23;
  sub_1000156B0();
  __chkstk_darwin(v24);
  sub_10001576C();
  sub_100012400();
  __chkstk_darwin(v25);
  sub_100015988();
  sub_100012464(v26, &qword_1000230A8, OS_dispatch_source_ptr);
  v53 = (void **)&_swiftEmptyArrayStorage;
  sub_100015958(&qword_1000230B0, v27, (uint64_t)&protocol conformance descriptor for OS_dispatch_source.TimerFlags);
  sub_100015820();
  sub_1000158BC(&qword_1000230C0);
  sub_100015730(v28);
  sub_100015878();
  sub_10001583C();
  sub_100015930();
  v29 = (_QWORD *)sub_100015A50((uint64_t)&unk_10001D0C0);
  v30 = v46;
  v29[2] = v45;
  v29[3] = v30;
  v29[4] = &unk_1000230B8;
  v55 = sub_100014CD8;
  v56 = v29;
  v53 = _NSConcreteStackBlock;
  v54 = 1107296256;
  sub_100015760((uint64_t)sub_1000128C4);
  sub_1000157A4();
  v31 = swift_unknownObjectRetain(&unk_1000230B8);
  static DispatchQoS.unspecified.getter(v31);
  sub_1000159F8();
  sub_1000158E0();
  sub_100015918();
  sub_100015908();
  sub_1000159E8();
  v32 = sub_1000159D0();
  static DispatchTime.now()(v32);
  v33 = v47;
  sub_1000159C8();
  v34 = sub_1000156F0();
  sub_100015808(v34, enum case for DispatchTimeInterval.never(_:));
  sub_100015960();
  v35 = sub_100015A3C();
  OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)(v35, v36, v37, v38);
  sub_100015758(v1);
  sub_100015758(v2);
  sub_100015708(v33);
  OS_dispatch_source.resume()();
  sub_100015A10();
  sub_100015658();
}

void sub_100014C98(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = sub_100005578(a2);
    atomic_store(swift_getWitnessTable(&protocol conformance descriptor for [A], v3), a1);
  }
  sub_1000059DC();
}

uint64_t sub_100014CDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;

  v0 = type metadata accessor for DispatchWorkItemFlags(0);
  v6 = &_swiftEmptyArrayStorage;
  sub_100005774((unint64_t *)&qword_100022800, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v2 = v1;
  v3 = sub_1000054F4(&qword_100022808);
  sub_100014C98((unint64_t *)&qword_100022810, &qword_100022808);
  return dispatch thunk of SetAlgebra.init<A>(_:)(&v6, v3, v4, v0, v2);
}

void OS_dispatch_queue.wallOnce(_:closure:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
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
  _QWORD *v34;
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

  sub_1000156D4();
  v42 = v3;
  v43 = v4;
  v6 = v5;
  sub_100015750();
  sub_1000156B0();
  __chkstk_darwin(v7);
  sub_100015690(v8, v39);
  v10 = __chkstk_darwin(v9);
  sub_1000157B8(v10, v11, v12, v13, v14, v15, v16, v17, v40);
  sub_1000156B0();
  __chkstk_darwin(v18);
  sub_10001563C();
  v20 = __chkstk_darwin(v19);
  sub_1000156BC(v20, v21, v22, v23, v24, v25, v26, v27, v41);
  sub_1000156B0();
  __chkstk_darwin(v28);
  sub_100015674();
  sub_1000156B0();
  __chkstk_darwin(v29);
  sub_10001576C();
  sub_100012400();
  __chkstk_darwin(v30);
  sub_100015988();
  sub_100012464(v31, &qword_1000230A8, OS_dispatch_source_ptr);
  sub_100015958(&qword_1000230B0, v32, (uint64_t)&protocol conformance descriptor for OS_dispatch_source.TimerFlags);
  sub_100015820();
  sub_1000158BC(&qword_1000230C0);
  sub_100015730(v33);
  sub_100015878();
  sub_10001583C();
  sub_100015930();
  v34 = (_QWORD *)sub_100015A50((uint64_t)&unk_10001D110);
  v34[2] = v42;
  v34[3] = v43;
  v34[4] = &unk_1000230B8;
  sub_100015760((uint64_t)sub_1000128C4);
  sub_1000157A4();
  v35 = swift_unknownObjectRetain(&unk_1000230B8);
  static DispatchQoS.unspecified.getter(v35);
  sub_1000159F8();
  sub_1000158E0();
  sub_100015918();
  sub_100015908();
  sub_1000159E8();
  v36 = sub_1000159D0();
  static DispatchWallTime.now()(v36);
  + infix(_:_:)(v2, v6);
  v37 = sub_1000156F0();
  sub_100015808(v37, enum case for DispatchTimeInterval.never(_:));
  sub_100015960();
  v38 = sub_100015A3C();
  OS_dispatch_source_timer.schedule(wallDeadline:repeating:leeway:)(v38);
  sub_100015758(v0);
  sub_100015758(v1);
  sub_100015708(v44);
  OS_dispatch_source.resume()();
  sub_100015A10();
  sub_100015658();
}

uint64_t sub_100014FBC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_100014FE8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  (*(void (**)(void))(v0 + 16))();
  swift_getObjectType(v1);
  OS_dispatch_source.cancel()();
}

uint64_t sub_100015020@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t);

  *a1 = 0;
  sub_100015750();
  v1 = sub_100015938();
  return v2(v1);
}

void OS_dispatch_queue.timer(_:interval:closure:)()
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
  uint64_t v34[2];
  uint64_t v35;
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
  void **v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  sub_1000156D4();
  v37 = v0;
  v39 = v2;
  v40 = v3;
  v4 = sub_100015750();
  v45 = *(_QWORD *)(v4 - 8);
  v46 = v4;
  sub_1000156B0();
  __chkstk_darwin(v5);
  sub_100015690(v6, v34[0]);
  __chkstk_darwin(v7);
  v44 = (char *)v34 - v8;
  v9 = sub_1000157B0();
  v42 = *(_QWORD *)(v9 - 8);
  v43 = v9;
  sub_1000156B0();
  __chkstk_darwin(v10);
  sub_10001563C();
  v12 = __chkstk_darwin(v11);
  v38 = sub_1000156BC(v12, v13, v14, v15, v16, v17, v18, v19, v34[0]);
  v36 = *(_QWORD *)(v38 - 8);
  sub_1000156B0();
  __chkstk_darwin(v20);
  v35 = sub_100015674();
  v34[1] = *(_QWORD *)(v35 - 8);
  sub_1000156B0();
  __chkstk_darwin(v21);
  sub_100015788();
  sub_100012400();
  __chkstk_darwin(v22);
  sub_100015970();
  sub_100012464(v23, &qword_1000230A8, OS_dispatch_source_ptr);
  v47 = (void **)&_swiftEmptyArrayStorage;
  sub_100015958(&qword_1000230B0, v24, (uint64_t)&protocol conformance descriptor for OS_dispatch_source.TimerFlags);
  v25 = sub_100015820();
  sub_1000158BC(&qword_1000230C0);
  sub_100015710(v26);
  sub_100015920();
  sub_100015828();
  sub_100015930();
  v49 = v39;
  v50 = v40;
  v47 = _NSConcreteStackBlock;
  v48 = 1107296256;
  sub_100015760((uint64_t)sub_1000128C4);
  v27 = sub_1000157A4();
  static DispatchQoS.unspecified.getter(v27);
  sub_100015A04();
  sub_100015864();
  sub_100015918();
  sub_1000158F4();
  sub_1000157F0();
  v28 = sub_1000159D0();
  static DispatchTime.now()(v28);
  v29 = v41;
  sub_1000159D8();
  sub_1000156F0();
  sub_1000159B0();
  sub_1000159A0();
  v30 = sub_10001588C();
  OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)(v30, v31, v32, v33);
  sub_100015758(v25);
  sub_100015758(v1);
  sub_100015708(v29);
  OS_dispatch_source.resume()();
  sub_100015A10();
  sub_100015658();
}

void OS_dispatch_queue.wallTimer(_:interval:closure:)()
{
  uint64_t v0;
  uint64_t v1;
  double v2;
  double v3;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  sub_1000156D4();
  v3 = v2;
  sub_100015750();
  sub_1000156B0();
  __chkstk_darwin(v4);
  sub_100015690(v5, v35);
  v7 = __chkstk_darwin(v6);
  sub_1000157B8(v7, v8, v9, v10, v11, v12, v13, v14, v36);
  sub_1000156B0();
  __chkstk_darwin(v15);
  sub_10001563C();
  v17 = __chkstk_darwin(v16);
  sub_1000156BC(v17, v18, v19, v20, v21, v22, v23, v24, v37);
  sub_1000156B0();
  __chkstk_darwin(v25);
  sub_100015674();
  sub_1000156B0();
  __chkstk_darwin(v26);
  sub_100015788();
  sub_100012400();
  __chkstk_darwin(v27);
  sub_100015970();
  sub_100012464(v28, &qword_1000230A8, OS_dispatch_source_ptr);
  sub_100015958(&qword_1000230B0, v29, (uint64_t)&protocol conformance descriptor for OS_dispatch_source.TimerFlags);
  v30 = sub_100015820();
  sub_1000158BC(&qword_1000230C0);
  sub_100015710(v31);
  sub_100015920();
  sub_100015828();
  sub_100015930();
  sub_100015760((uint64_t)sub_1000128C4);
  v32 = sub_1000157A4();
  static DispatchQoS.unspecified.getter(v32);
  sub_100015A04();
  sub_100015864();
  sub_100015918();
  sub_1000158F4();
  sub_1000157F0();
  v33 = sub_1000159D0();
  static DispatchWallTime.now()(v33);
  + infix(_:_:)(v1, v3);
  sub_1000156F0();
  sub_1000159B0();
  sub_1000159A0();
  v34 = sub_10001588C();
  OS_dispatch_source_timer.schedule(wallDeadline:repeating:leeway:)(v34);
  sub_100015758(v30);
  sub_100015758(v0);
  sub_100015708(v38);
  OS_dispatch_source.resume()();
  sub_100015A10();
  sub_100015658();
}

uint64_t OS_dispatch_semaphore.wait(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, uint64_t);
  uint64_t v9;
  uint64_t v11;

  v0 = sub_1000157B0();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v2);
  v7 = (char *)&v11 - v6;
  static DispatchTime.now()(v5);
  sub_1000159C8();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v9 = OS_dispatch_semaphore.wait(timeout:)(v7) & 1;
  v8(v7, v0);
  return v9;
}

void static OS_dispatch_source.makeSignalSourceIgnored(signal:queue:)(uint64_t a1, uint64_t a2)
{
  void (__cdecl *v4)(int);
  void (__cdecl *v5)(int);

  v4 = (void (__cdecl *)(int))SIG_IGN.getter();
  v5 = signal(a1, v4);
  sub_100012464((uint64_t)v5, &qword_1000230A8, OS_dispatch_source_ptr);
  static OS_dispatch_source.makeSignalSource(signal:queue:)(a1, a2);
  sub_1000059DC();
}

double OS_dispatch_source_data_replace.doubleData.getter()
{
  return COERCE_DOUBLE(OS_dispatch_source.data.getter());
}

void OS_dispatch_source_data_replace.doubleData.setter(double a1)
{
  OS_dispatch_source_data_replace.replace(data:)(*(Swift::UInt *)&a1);
}

void (*OS_dispatch_source_data_replace.doubleData.modify(_QWORD *a1, uint64_t a2))(Swift::UInt *a1)
{
  uint64_t v2;

  a1[1] = a2;
  a1[2] = v2;
  *a1 = OS_dispatch_source.data.getter(a2);
  return sub_1000155F8;
}

void sub_1000155F8(Swift::UInt *a1)
{
  OS_dispatch_source_data_replace.replace(data:)(*a1);
}

uint64_t sub_100015674()
{
  return type metadata accessor for DispatchQoS(0);
}

void sub_100015690(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 176) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_1000156BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v10 - 208) = (char *)&a9 - v9;
  return type metadata accessor for DispatchWorkItemFlags(0);
}

uint64_t sub_1000156F0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 200) + 8))(v0, *(_QWORD *)(v1 - 192));
}

uint64_t sub_100015708(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_100015710(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return dispatch thunk of SetAlgebra.init<A>(_:)(v4 - 152, v2, a1, v3, v1);
}

uint64_t sub_100015730(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return dispatch thunk of SetAlgebra.init<A>(_:)(v4 - 152, v2, a1, v3, v1);
}

uint64_t sub_100015750()
{
  return type metadata accessor for DispatchTimeInterval(0);
}

uint64_t sub_100015758(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

void *sub_100015760@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = a1;
  *(_QWORD *)(v2 - 128) = v1;
  return _Block_copy((const void *)(v2 - 152));
}

uint64_t sub_10001576C()
{
  return type metadata accessor for OS_dispatch_source.TimerFlags(0);
}

uint64_t sub_100015788()
{
  return type metadata accessor for OS_dispatch_source.TimerFlags(0);
}

uint64_t sub_1000157A4()
{
  uint64_t v0;

  return swift_retain(v0);
}

uint64_t sub_1000157B0()
{
  return type metadata accessor for DispatchTime(0);
}

uint64_t sub_1000157B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v10 - 184) = (char *)&a9 - v9;
  return type metadata accessor for DispatchWallTime(0);
}

uint64_t sub_1000157F0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 264) + 8))(v0, *(_QWORD *)(v1 - 256));
}

uint64_t sub_100015808(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v2 - 168) + 104))(*(_QWORD *)(v2 - 184), a2, *(_QWORD *)(v2 - 160));
}

uint64_t sub_100015820()
{
  uint64_t *v0;

  return sub_1000054F4(v0);
}

uint64_t sub_100015828()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_10001583C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_100015850()
{
  return static DispatchTime.now()();
}

uint64_t sub_100015864()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return OS_dispatch_source.setEventHandler(qos:flags:handler:)(v2, v3, v0, v1);
}

uint64_t sub_100015878()
{
  uint64_t v0;
  uint64_t v1;

  return static OS_dispatch_source.makeTimerSource(flags:queue:)(v0, *(_QWORD *)(v1 - 264));
}

uint64_t sub_10001588C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1000158A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)(v3, v2, v1, v0);
}

void sub_1000158BC(unint64_t *a1)
{
  uint64_t *v1;

  sub_100014C98(a1, v1);
}

uint64_t sub_1000158E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return OS_dispatch_source.setEventHandler(qos:flags:handler:)(v1, v2, v0, v3);
}

uint64_t sub_1000158F4()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 248) + 8))(v0, *(_QWORD *)(v1 - 232));
}

uint64_t sub_100015908()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 240) + 8))(v0, *(_QWORD *)(v1 - 232));
}

void sub_100015918()
{
  const void *v0;

  _Block_release(v0);
}

uint64_t sub_100015920()
{
  uint64_t v0;
  uint64_t v1;

  return static OS_dispatch_source.makeTimerSource(flags:queue:)(v0, *(_QWORD *)(v1 - 240));
}

uint64_t sub_100015930()
{
  uint64_t v0;

  return swift_getObjectType(v0);
}

uint64_t sub_100015938()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_100015950(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

void sub_100015958(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_100005774(a1, v3, a3);
}

uint64_t sub_100015960()
{
  uint64_t v0;

  return sub_100015020(*(_QWORD **)(v0 - 176));
}

uint64_t sub_1000159A0()
{
  uint64_t v0;

  return sub_100015020(*(_QWORD **)(v0 - 176));
}

uint64_t sub_1000159B0()
{
  double v0;

  return static DispatchTimeInterval.seconds(_:)(v0);
}

uint64_t sub_1000159C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t sub_1000159C8()
{
  double v0;

  return + infix(_:_:)(v0);
}

uint64_t sub_1000159D0()
{
  uint64_t v0;

  return swift_release(*(_QWORD *)(v0 - 112));
}

uint64_t sub_1000159D8()
{
  double v0;

  return + infix(_:_:)(v0);
}

uint64_t sub_1000159E8()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 256) + 8))(v0, *(_QWORD *)(v1 - 248));
}

uint64_t sub_1000159F8()
{
  return sub_100014CDC();
}

uint64_t sub_100015A04()
{
  return sub_100014CDC();
}

uint64_t sub_100015A10()
{
  uint64_t v0;

  return v0;
}

void sub_100015A30(double a1)
{
  _QWORD *v1;

  *v1 = (uint64_t)a1;
}

uint64_t sub_100015A3C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_100015A50(uint64_t a1)
{
  return swift_allocObject(a1, 40, 7);
}

uint64_t sub_100015A5C()
{
  _QWORD *v0;

  return sub_100015020(v0);
}
