uint64_t sub_100004788()
{
  return 1;
}

void sub_100004804(int a1, id a2)
{
  id v2;
  id v3;

  v2 = objc_msgSend(a2, "role");
  v3 = objc_allocWithZone((Class)UISceneConfiguration);
  sub_100004A68(0xD000000000000015, 0x80000001000135C0, v2);
  sub_100004F9C();
}

id sub_100004930()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

void sub_100004980()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *ObjCClassFromMetadata;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v0 = type metadata accessor for AppDelegate();
  v1 = static CommandLine.unsafeArgv.getter();
  v2 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  v3 = static CommandLine.argc.getter(v2);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v0);
  v5 = NSStringFromClass(ObjCClassFromMetadata);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v8 = v7;

  LODWORD(v5) = UIApplicationMain(_:_:_:_:)(v3, v1, 0, 0, v6, v8);
  swift_bridgeObjectRelease(v8);
  exit((int)v5);
}

id sub_100004A08()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for AppDelegate();
  sub_100004980();
}

uint64_t type metadata accessor for AppDelegate()
{
  return objc_opt_self(_TtC24AMSEngagementViewService11AppDelegate);
}

id sub_100004A68(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  NSString v6;
  id v7;

  if (a2)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v3, "initWithName:sessionRole:", v6, a3);

  return v7;
}

unint64_t sub_100004AD4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E2A0;
  if (!qword_10001E2A0)
  {
    v1 = objc_opt_self(UISceneSession);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001E2A0);
  }
  return result;
}

void type metadata accessor for LaunchOptionsKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_10001E2B8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_1000188F0);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10001E2B8);
  }
}

void sub_100004B58()
{
  uint64_t *v0;

  sub_100004C58(*v0, (void (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100004B78(uint64_t a1)
{
  uint64_t *v1;

  return sub_100004B80(a1, *v1);
}

uint64_t sub_100004B80(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100004BC0(uint64_t a1)
{
  uint64_t *v1;

  return sub_100004BC8(a1, *v1);
}

Swift::Int sub_100004BC8(uint64_t a1, uint64_t a2)
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

void sub_100004C38()
{
  uint64_t *v0;

  sub_100004C58(*v0, (void (*)(uint64_t))&String._bridgeToObjectiveC());
}

void sub_100004C58(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v5 = v4;
  a2(v3);
  swift_bridgeObjectRelease(v5);
  sub_100004F9C();
}

uint64_t sub_100004C90(uint64_t a1, id *a2)
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

uint64_t sub_100004D08(uint64_t a1, id *a2)
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

NSString sub_100004D84@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  NSString result;

  result = sub_100004DA8(a1);
  *a2 = result;
  return result;
}

NSString sub_100004DA8(uint64_t a1)
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

uint64_t sub_100004DDC(uint64_t *a1, uint64_t *a2)
{
  return sub_100006CA0(*a1, *a2);
}

uint64_t sub_100004DE8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100004E2C@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = j___sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100004E58(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100004F60(&qword_10001E2B0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100012E04);
  v3 = v2;
  sub_100004F60(&qword_10001E2D8, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100012D58);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v4, &protocol witness table for String);
}

void sub_100004EDC()
{
  sub_100004F60(&qword_10001E2C0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100012D1C);
}

void sub_100004F08()
{
  sub_100004F60(&qword_10001E2C8, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100012CF0);
}

void sub_100004F34()
{
  sub_100004F60(&qword_10001E2D0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchOptionsKey, (uint64_t)&unk_100012D8C);
}

void sub_100004F60(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }
  sub_100004F9C();
}

uint64_t sub_100004FA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  URL.scheme.getter();
  if (!v7)
    return 0;
  sub_10000569C();
  sub_100005BA0();
  if ((v3 & 1) == 0)
    return 1;
  v8 = sub_1000053F8(a1, a2, a3);
  v9 = sub_100005038(v8);
  swift_bridgeObjectRelease(v8);
  return v9;
}

uint64_t sub_100005038(uint64_t a1)
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
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
    sub_100005730(&qword_10001E410);
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
  if (!v6)
    goto LABEL_9;
LABEL_8:
  v10 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v11 = v10 | (v9 << 6);
  while (1)
  {
    v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
    v18 = *v16;
    v17 = v16[1];
    sub_100005B04(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v41);
    *(_QWORD *)&v40 = v18;
    *((_QWORD *)&v40 + 1) = v17;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(_QWORD *)&v38[0] = v18;
    *((_QWORD *)&v38[0] + 1) = v17;
    swift_bridgeObjectRetain(v17);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7);
    sub_1000058D4(v39, v33);
    v34 = v30;
    v35 = v31;
    v36 = v32;
    sub_1000058D4(v33, v37);
    v30 = v34;
    v31 = v35;
    v32 = v36;
    sub_1000058D4(v37, v38);
    sub_1000058D4(v38, &v34);
    result = AnyHashable._rawHashValue(seed:)(v3[5]);
    v19 = -1 << *((_BYTE *)v3 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)&v7[8 * (v20 >> 6)]) == 0)
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v19) >> 6;
      while (++v21 != v24 || (v23 & 1) == 0)
      {
        v25 = v21 == v24;
        if (v21 == v24)
          v21 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)&v7[8 * v21];
        if (v26 != -1)
        {
          v22 = __clz(__rbit64(~v26)) + (v21 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)&v7[8 * (v20 >> 6)])) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(_QWORD *)&v7[(v22 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v22;
    v27 = v3[6] + 40 * v22;
    *(_OWORD *)v27 = v30;
    *(_OWORD *)(v27 + 16) = v31;
    *(_QWORD *)(v27 + 32) = v32;
    result = (uint64_t)sub_1000058D4(&v34, (_OWORD *)(v3[7] + 32 * v22));
    ++v3[2];
    if (v6)
      goto LABEL_8;
LABEL_9:
    v12 = v9 + 1;
    if (__OFADD__(v9, 1))
      goto LABEL_38;
    if (v12 >= v28)
      goto LABEL_36;
    v13 = *(_QWORD *)(v29 + 8 * v12);
    v14 = v9 + 1;
    if (!v13)
    {
      v14 = v9 + 2;
      if (v9 + 2 >= v28)
        goto LABEL_36;
      v13 = *(_QWORD *)(v29 + 8 * v14);
      if (!v13)
      {
        v14 = v9 + 3;
        if (v9 + 3 >= v28)
          goto LABEL_36;
        v13 = *(_QWORD *)(v29 + 8 * v14);
        if (!v13)
        {
          v14 = v9 + 4;
          if (v9 + 4 >= v28)
            goto LABEL_36;
          v13 = *(_QWORD *)(v29 + 8 * v14);
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
  if (v9 + 5 >= v28)
  {
LABEL_36:
    swift_release(v3);
    sub_100005B40(a1);
    return (uint64_t)v3;
  }
  v13 = *(_QWORD *)(v29 + 8 * v15);
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
    if (v14 >= v28)
      goto LABEL_36;
    v13 = *(_QWORD *)(v29 + 8 * v14);
    ++v15;
    if (v13)
      goto LABEL_24;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1000053F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  _BYTE v16[224];
  uint64_t v17;

  v6 = sub_100005730(&qword_10001E3F8);
  inited = swift_initStackObject(v6, v16);
  *(_OWORD *)(inited + 16) = xmmword_100012E50;
  strcpy((char *)(inited + 32), "nativeHandling");
  *(_BYTE *)(inited + 47) = -18;
  v8 = URL.scheme.getter();
  sub_100005624(v8, v9);
  v10 = sub_100005BA0();
  *(_BYTE *)(inited + 48) = v3 & 1;
  *(_QWORD *)(inited + 72) = &type metadata for Bool;
  *(_QWORD *)(inited + 80) = 0x656372756F73;
  *(_QWORD *)(inited + 88) = 0xE600000000000000;
  *(_QWORD *)(inited + 96) = 0xD000000000000018;
  *(_QWORD *)(inited + 104) = 0x8000000100012E40;
  *(_QWORD *)(inited + 120) = &type metadata for String;
  *(_QWORD *)(inited + 128) = 0x707954746E657665;
  *(_QWORD *)(inited + 136) = 0xE900000000000065;
  *(_QWORD *)(inited + 144) = 1802398060;
  *(_QWORD *)(inited + 152) = 0xE400000000000000;
  *(_QWORD *)(inited + 168) = &type metadata for String;
  *(_QWORD *)(inited + 176) = 7107189;
  *(_QWORD *)(inited + 184) = 0xE300000000000000;
  v11 = URL.absoluteString.getter(v10);
  *(_QWORD *)(inited + 216) = &type metadata for String;
  *(_QWORD *)(inited + 192) = v11;
  *(_QWORD *)(inited + 200) = v12;
  v17 = Dictionary.init(dictionaryLiteral:)(inited, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  if (a3)
  {
    *((_QWORD *)&v15 + 1) = &type metadata for String;
    *(_QWORD *)&v14 = a2;
    *((_QWORD *)&v14 + 1) = a3;
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
  }
  swift_bridgeObjectRetain(a3);
  sub_1000055A4((uint64_t)&v14, 0x7250656372756F73, 0xED0000737365636FLL);
  return v17;
}

uint64_t sub_1000055A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_1000058D4((_OWORD *)a1, v6);
    sub_1000058E4(v6, a2, a3);
    return swift_bridgeObjectRelease(a3);
  }
  else
  {
    sub_100005770(a1);
    sub_1000057B0(a2, a3, v6);
    swift_bridgeObjectRelease(a3);
    return sub_100005770((uint64_t)v6);
  }
}

void sub_100005624(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  BOOL v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!a2
    || ((sub_100005BAC(), v5) ? (v5 = v4 == 0xE600000000000000) : (v5 = 0),
        v5 || (sub_100005B48() & 1) != 0 || (a1 == 0x69752D736D61 ? (v6 = a2 == 0xE600000000000000) : (v6 = 0), v6)))
  {
    sub_100005B94();
  }
  else
  {
    v7 = sub_100005B68();
    sub_100005B88(v7, v8, v9, v10, v11);
  }
}

void sub_10000569C()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  BOOL v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_100005BAC();
  v2 = v2 && v1 == 0xE600000000000000;
  if (v2
    || ((v3 = v1, v4 = v0, v5 = sub_100005B48(), v4 == 0x69752D736D61) ? (v6 = v3 == 0xE600000000000000) : (v6 = 0),
        !v6 ? (v7 = 0) : (v7 = 1),
        (v5 & 1) != 0 || (v7 & 1) != 0))
  {
    sub_100005B94();
  }
  else
  {
    v8 = sub_100005B68();
    sub_100005B88(v8, v9, v10, v11, v12);
  }
}

uint64_t sub_100005700()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for EngagementDeepLinkController()
{
  return objc_opt_self(_TtC24AMSEngagementViewService28EngagementDeepLinkController);
}

uint64_t sub_100005730(uint64_t *a1)
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

uint64_t sub_100005770(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005730(&qword_10001E400);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double sub_1000057B0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  unint64_t v9;
  char v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  double result;
  uint64_t v16;

  v4 = v3;
  v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  v9 = sub_100009250(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v16 = *v4;
    v12 = *v4;
    *v4 = 0x8000000000000000;
    v13 = *(_QWORD *)(v12 + 24);
    sub_100005730(&qword_10001E408);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v13);
    swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v16 + 48) + 16 * v9 + 8));
    sub_1000058D4((_OWORD *)(*(_QWORD *)(v16 + 56) + 32 * v9), a3);
    _NativeDictionary._delete(at:)(v9, v16, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
    v14 = *v4;
    *v4 = v16;
    swift_bridgeObjectRelease(v14);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

_OWORD *sub_1000058D4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000058E4(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v10;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v10 = *v3;
  *v3 = 0x8000000000000000;
  sub_100005960(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  v8 = *v3;
  *v3 = v10;
  return swift_bridgeObjectRelease(v8);
}

_OWORD *sub_100005960(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
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
  v11 = sub_100009250(a2, a3);
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
  sub_100005730(&qword_10001E408);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15))
    goto LABEL_5;
  v18 = sub_100009250(a2, a3);
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
    sub_100005AE4(v21);
    return sub_1000058D4(a1, v21);
  }
  else
  {
    sub_100005A7C(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain(a3);
  }
}

_OWORD *sub_100005A7C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_1000058D4(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_100005AE4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100005B04(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100005B40(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100005B48()
{
  uint64_t v0;
  uint64_t v1;

  return _stringCompareWithSmolCheck(_:_:expecting:)(0x65752D736D61, 0xE600000000000000, v1, v0, 0);
}

uint64_t sub_100005B68()
{
  return 0x69752D736D61;
}

uint64_t sub_100005B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, a4, a5);
}

uint64_t sub_100005BA0()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

id sub_100005BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id result;
  uint64_t *v18;
  objc_class *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t MetatypeMetadata;
  Swift::String v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[3];
  _BYTE v43[8];
  _QWORD v44[4];
  _QWORD v45[3];
  objc_class *v46;
  objc_super v47;

  type metadata accessor for LogMessage.StringInterpolation(0);
  __chkstk_darwin();
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_allocWithZone((Class)_UIContentUnavailableView);
  v9 = v3;
  v10 = sub_100006940();
  result = sub_1000067A8(v13, v14, v15, v16, v10, v11, v12);
  if (result)
  {
    *(_QWORD *)&v9[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_contentUnavailableView] = result;
    *(_QWORD *)&v9[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_error] = a1;
    v18 = (uint64_t *)&v9[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_retryAction];
    *v18 = a2;
    v18[1] = a3;
    swift_errorRetain(a1);
    sub_100006840(a2, a3);

    v19 = (objc_class *)type metadata accessor for ErrorViewController();
    v47.receiver = v9;
    v47.super_class = v19;
    v20 = objc_msgSendSuper2(&v47, "initWithNibName:bundle:", 0, 0);
    v21 = sub_100005730((uint64_t *)&unk_10001E740);
    v22 = type metadata accessor for LogMessage(0);
    v23 = swift_allocObject(v21, ((*(unsigned __int8 *)(*(_QWORD *)(v22 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v22 - 8) + 80))+ 3 * *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v22 - 8) + 80) | 7);
    *(_OWORD *)(v23 + 16) = xmmword_100012EA0;
    v46 = v19;
    v45[0] = v20;
    v24 = v20;
    v25 = (id)AMSLogKey(v24);
    if (v25)
    {
      v26 = v25;
      v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
      v41 = a1;
      v28 = v24;
      v29 = a2;
      v30 = a3;
      v32 = v31;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4, 2);
      sub_100006920();
      sub_1000068F0();
      MetatypeMetadata = swift_getMetatypeMetadata();
      sub_1000068DC(MetatypeMetadata);
      sub_100006968();
      v34._countAndFlagsBits = 5972026;
      v34._object = (void *)0xE300000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v34);
      v44[3] = &type metadata for String;
      v44[0] = v27;
      v44[1] = v32;
      a3 = v30;
      a2 = v29;
      v24 = v28;
      a1 = v41;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v44);
      sub_100006968();
      v35 = 93;
    }
    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1, 1);
      sub_100006920();
      sub_1000068F0();
      v36 = swift_getMetatypeMetadata();
      sub_1000068DC(v36);
      sub_100006968();
      v35 = 58;
    }
    v37 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v35);
    LogMessage.init(stringInterpolation:)(v8);
    type metadata accessor for Log();
    sub_100005AE4(v45);
    LogMessage.init(stringLiteral:)(0xD000000000000017, 0x80000001000136E0);
    swift_getErrorValue(a1, v43, v42);
    v38 = Error.localizedDescription.getter(v42[1], v42[2]);
    v46 = (objc_class *)&type metadata for String;
    v45[0] = v38;
    v45[1] = v39;
    static LogMessage.safe(_:)(v45);
    sub_100005770((uint64_t)v45);
    sub_100006A34(v23);
    sub_100006874(a2, a3);
    swift_errorRelease(a1);
    swift_bridgeObjectRelease(v23);

    return v24;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100005EC8()
{
  char *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v1 = objc_allocWithZone((Class)_UIContentUnavailableView);
  v2 = sub_100006940();
  v9 = sub_1000067A8(v5, v6, v7, v8, v2, v3, v4);
  if (!v9)
    __break(1u);
  *(_QWORD *)&v0[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_contentUnavailableView] = v9;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000137D0, "AMSEngagementViewService/ErrorViewController.swift", 50, 2, 47, 0);
  __break(1u);
}

id sub_100005FA8(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  objc_super v6;

  v2 = sub_100006960(a1, "parentViewController");
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, "navigationItem");

    return v4;
  }
  else
  {
    v6.receiver = v1;
    v6.super_class = (Class)type metadata accessor for ErrorViewController();
    return objc_msgSendSuper2(&v6, "navigationItem");
  }
}

void sub_100006030()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;

  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for ErrorViewController();
  v7 = sub_100006938((uint64_t)v10.super_class, "loadView", v1, v2, v3, v4, v5, v6, v10);
  v8 = sub_100006960((uint64_t)v7, "view");
  v9 = objc_msgSend((id)objc_opt_self(UIColor), "ams_primaryBackground");
  sub_1000068C8((uint64_t)v9, "setBackgroundColor:");

}

void sub_1000060E8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for ErrorViewController();
  v7 = sub_100006938((uint64_t)v8.super_class, "viewDidLoad", v1, v2, v3, v4, v5, v6, v8);
  sub_100006228((uint64_t)v7);
}

id sub_10000614C()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v19;

  v19.receiver = v0;
  v19.super_class = (Class)type metadata accessor for ErrorViewController();
  v7 = sub_100006938((uint64_t)v19.super_class, "viewWillLayoutSubviews", v1, v2, v3, v4, v5, v6, v19);
  v8 = *(void **)&v0[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_contentUnavailableView];
  v9 = sub_100006960((uint64_t)v7, "view");
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  return objc_msgSend(v8, "setFrame:", v11, v13, v15, v17);
}

void sub_100006228(uint64_t a1)
{
  id v1;

  v1 = sub_100006960(a1, "navigationItem");
  objc_msgSend(v1, "ams_configureWithTransparentBackground");

  sub_100006268();
}

void sub_100006268()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  type metadata accessor for Localizations();
  v1 = sub_100006980(0xD000000000000015, (void *)0x8000000100013700);
  v3 = v2;
  v4 = sub_100006980(0xD000000000000014, (void *)0x8000000100013720);
  v6 = v5;
  sub_100006354(v1, v3, 0, 0, v4, v5);
  swift_bridgeObjectRelease(v3);
  v7 = swift_bridgeObjectRelease(v6);
  v8 = sub_100006930(v7, "view");
  objc_msgSend(v8, "addSubview:", *(_QWORD *)(v0 + OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_contentUnavailableView));

}

void sub_100006354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v14;
  char v16;
  id v17;
  char v19;
  id v20;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSString v26;
  void *v27;
  NSString v28;
  void *v29;
  NSString v30;
  void *v31;
  _QWORD aBlock[5];
  uint64_t v34;

  v14 = sub_100006930(a1, "buttonTitle");
  if (v14)
  {
    sub_100006978((uint64_t)v14);
    sub_100006914();
    if (!a6)
    {
LABEL_31:
      sub_1000068D4();
      goto LABEL_32;
    }
    if (v8 == a5 && v7 == a6)
    {
      v14 = (id)sub_1000068D4();
    }
    else
    {
      v16 = sub_100006970(v8, v7, a5, a6);
      v14 = (id)sub_1000068D4();
      if ((v16 & 1) == 0)
        goto LABEL_32;
    }
  }
  else if (a6)
  {
    goto LABEL_32;
  }
  v17 = sub_100006930((uint64_t)v14, "message");
  if (!v17)
  {
    if (!a4)
      goto LABEL_23;
LABEL_32:
    v23 = swift_allocObject(&unk_1000189C8, 24, 7);
    swift_unknownObjectWeakInit(v23 + 16, v6);
    aBlock[4] = sub_1000068A8;
    v34 = v23;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100009B44;
    aBlock[3] = &unk_1000189E0;
    v24 = _Block_copy(aBlock);
    v25 = swift_release(v34);
    sub_1000068C8(v25, "setButtonAction:");
    _Block_release(v24);
    if (a6)
    {
      v26 = String._bridgeToObjectiveC()();
      v27 = v26;
    }
    else
    {
      v27 = 0;
    }
    sub_1000068C8((uint64_t)v26, "setButtonTitle:");

    if (a4)
    {
      v28 = String._bridgeToObjectiveC()();
      v29 = v28;
    }
    else
    {
      v29 = 0;
    }
    sub_1000068C8((uint64_t)v28, "setMessage:");

    if (a2)
    {
      v30 = String._bridgeToObjectiveC()();
      v31 = v30;
    }
    else
    {
      v31 = 0;
    }
    sub_1000068C8((uint64_t)v30, "setTitle:");

    return;
  }
  sub_100006978((uint64_t)v17);
  sub_100006914();
  if (!a4)
    goto LABEL_31;
  if (v8 == a3 && v7 == a4)
  {
    v17 = (id)sub_1000068D4();
  }
  else
  {
    v19 = sub_100006970(v8, v7, a3, a4);
    v17 = (id)sub_1000068D4();
    if ((v19 & 1) == 0)
      goto LABEL_32;
  }
LABEL_23:
  v20 = sub_100006930((uint64_t)v17, "title");
  if (!v20)
  {
    if (!a2)
      return;
    goto LABEL_32;
  }
  sub_100006978((uint64_t)v20);
  sub_100006914();
  if (!a2)
    goto LABEL_31;
  if (v8 == a1 && v7 == a2)
  {
    swift_bridgeObjectRelease(v7);
    return;
  }
  v22 = sub_100006970(v8, v7, a1, a2);
  sub_1000068D4();
  if ((v22 & 1) == 0)
    goto LABEL_32;
}

void sub_100006604(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  void (*v4)(void);
  uint64_t v5;
  _BYTE v6[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v6, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    v4 = *(void (**)(void))(Strong + OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_retryAction);
    v5 = *(_QWORD *)(Strong + OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_retryAction + 8);
    sub_100006840((uint64_t)v4, v5);

    if (v4)
    {
      v4();
      sub_100006874((uint64_t)v4, v5);
    }
  }
}

void sub_100006688()
{
  _swift_stdlib_reportUnimplementedInitializer("AMSEngagementViewService.ErrorViewController", 44, "init()", 6, 0);
  __break(1u);
}

void sub_1000066C0()
{
  _swift_stdlib_reportUnimplementedInitializer("AMSEngagementViewService.ErrorViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
}

id sub_100006710()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for ErrorViewController();
  return sub_100006938((uint64_t)v8.super_class, "dealloc", v1, v2, v3, v4, v5, v6, v8);
}

uint64_t type metadata accessor for ErrorViewController()
{
  return objc_opt_self(_TtC24AMSEngagementViewService19ErrorViewController);
}

id sub_1000067A8(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v7;
  NSString v14;
  id v15;

  if (a6)
  {
    v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }
  else
  {
    v14 = 0;
  }
  v15 = objc_msgSend(v7, "initWithFrame:title:style:", v14, a7, a1, a2, a3, a4);

  return v15;
}

uint64_t sub_100006840(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

_QWORD *sub_100006850(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100006874(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100006884()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000068A8()
{
  uint64_t v0;

  sub_100006604(v0);
}

uint64_t sub_1000068B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000068C0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id sub_1000068C8(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_1000068D4()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000068DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = a1;
  *(_QWORD *)(v2 - 160) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 160);
}

uint64_t sub_1000068F0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 - 104);
  v2 = sub_100006850((_QWORD *)(v0 - 128), v1);
  return swift_getDynamicType(v2, v1, 1);
}

void sub_100006914()
{
  void *v0;

}

void sub_100006920()
{
  Swift::String v0;

  v0._countAndFlagsBits = 0;
  v0._object = (void *)0xE000000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

id sub_100006930(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id sub_100006938(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2);
}

uint64_t sub_100006940()
{
  return 0;
}

id sub_100006960(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_100006968()
{
  uint64_t v0;

  return sub_100005770(v0 - 160);
}

uint64_t sub_100006970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, a4, 0);
}

uint64_t sub_100006978(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

uint64_t sub_100006980(uint64_t a1, void *a2)
{
  id v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t countAndFlagsBits;
  Swift::String v9;

  v4 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v9._object = (void *)0xE000000000000000;
  v5._countAndFlagsBits = a1;
  v5._object = a2;
  v6._countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  v9._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v5, (Swift::String_optional)0, (NSBundle)v4, v6, v9)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t type metadata accessor for Localizations()
{
  return objc_opt_self(_TtC24AMSEngagementViewService13Localizations);
}

uint64_t sub_100006A34(uint64_t a1)
{
  uint64_t v2;

  v2 = static os_log_type_t.error.getter();
  return sub_100006C98(v2, a1);
}

uint64_t sub_100006A54()
{
  uint64_t result;

  sub_100006C5C();
  result = OS_os_log.init(subsystem:category:)(0xD000000000000025, 0x8000000100013860, 0x6C6172656E6567, 0xE700000000000000);
  qword_10001E4F0 = result;
  return result;
}

uint64_t sub_100006AB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (qword_10001E0F0 != -1)
    swift_once(&qword_10001E0F0, sub_100006A54);
  v4 = qword_10001E4F0;
  result = os_log_type_enabled((os_log_t)qword_10001E4F0, (os_log_type_t)a1);
  if ((_DWORD)result)
  {
    v6 = static LogMessage.isRedactionEnabled.getter();
    v7 = static LogMessage.describe(contentsOf:withRedaction:separator:)(a2, v6 & 1, 32, 0xE100000000000000);
    v9 = v8;
    v10 = sub_100005730(&qword_10001E590);
    v11 = swift_allocObject(v10, 72, 7);
    *(_OWORD *)(v11 + 16) = xmmword_100012EF0;
    *(_QWORD *)(v11 + 56) = &type metadata for String;
    *(_QWORD *)(v11 + 64) = sub_100006C20();
    *(_QWORD *)(v11 + 32) = v7;
    *(_QWORD *)(v11 + 40) = v9;
    os_log(_:dso:log:type:_:)("%{public}@", 10, 2, &_mh_execute_header, v4, a1, v11);
    return swift_bridgeObjectRelease(v11);
  }
  return result;
}

uint64_t sub_100006BC0(uint64_t a1)
{
  uint64_t v2;

  v2 = static os_log_type_t.default.getter();
  return sub_100006C98(v2, a1);
}

uint64_t sub_100006BE0(uint64_t a1)
{
  uint64_t v2;

  v2 = static os_log_type_t.info.getter();
  return sub_100006C98(v2, a1);
}

uint64_t type metadata accessor for Log()
{
  return objc_opt_self(_TtC24AMSEngagementViewService3Log);
}

unint64_t sub_100006C20()
{
  unint64_t result;

  result = qword_10001E598;
  if (!qword_10001E598)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001E598);
  }
  return result;
}

unint64_t sub_100006C5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E5A0;
  if (!qword_10001E5A0)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001E5A0);
  }
  return result;
}

uint64_t sub_100006C98(uint64_t a1, uint64_t a2)
{
  return sub_100006AB0(a1, a2);
}

uint64_t sub_100006CA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
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

BOOL sub_100006D24(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_100006D30(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

void sub_100006D54()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  _QWORD v9[9];

  v0 = Hasher.init(_seed:)(v9, 0);
  sub_100006E24(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9[0]);
  Hasher._finalize()();
  sub_100006E30();
}

void sub_100006D88()
{
  sub_100006D54();
}

void sub_100006D90(int a1)
{
  Swift::UInt *v1;

  sub_100006D30(a1, *v1);
}

void sub_100006D98(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  _QWORD v10[9];

  v1 = Hasher.init(_seed:)(v10, a1);
  sub_100006E24(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10[0]);
  Hasher._finalize()();
  sub_100006E30();
}

BOOL sub_100006DC8(uint64_t *a1, uint64_t *a2)
{
  return sub_100006D24(*a1, *a2);
}

unint64_t sub_100006DD8()
{
  unint64_t result;

  result = qword_10001E5A8;
  if (!qword_10001E5A8)
  {
    result = swift_getWitnessTable("![", &type metadata for RemoteAlertButtonAction);
    atomic_store(result, (unint64_t *)&qword_10001E5A8);
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteAlertButtonAction()
{
  return &type metadata for RemoteAlertButtonAction;
}

void sub_100006E24(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  Swift::UInt v10;

  Hasher._combine(_:)(v10);
}

unint64_t sub_100006E40()
{
  unint64_t result;

  result = qword_10001E5B0;
  if (!qword_10001E5B0)
  {
    result = swift_getWitnessTable(&unk_100012FE0, &type metadata for RemoteAlertButtonActionEvents);
    atomic_store(result, (unint64_t *)&qword_10001E5B0);
  }
  return result;
}

Swift::Int sub_100006E7C(Swift::UInt a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

Swift::Int sub_100006EC0(uint64_t a1, Swift::UInt a2)
{
  _QWORD v4[9];

  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(a2);
  return Hasher._finalize()();
}

uint64_t sub_100006F00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = 0;
    v3 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v3++;
      v4 = v5;
      if ((v5 & ~v2) == 0)
        v4 = 0;
      v2 |= v4;
      --v1;
    }
    while (v1);
  }
  else
  {
    v2 = 0;
  }
  swift_bridgeObjectRelease(a1);
  return v2;
}

_QWORD *sub_100006F50@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100006F5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_100006F80();
  *a1 = result;
  return result;
}

uint64_t sub_100006F80()
{
  return 0;
}

uint64_t sub_100006F88(_QWORD *a1)
{
  _QWORD *v1;

  return sub_100009874(*a1, *v1);
}

uint64_t sub_100006F94@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_100006FC0(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_100006FC0(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_100006FC8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_1000072F8(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_100006FF4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_100007020(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_100007020(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

BOOL sub_100007028(_QWORD *a1, uint64_t *a2)
{
  return sub_100007030(a1, *a2);
}

BOOL sub_100007030(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & a2;
  if (v3 != a2)
    *v2 |= a2;
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_10000705C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_10000708C(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_10000708C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = *v1 & a1;
  if (result)
    *v1 &= ~a1;
  return result;
}

uint64_t sub_1000070B0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_1000070E0(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1000070E0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

uint64_t sub_1000070F8(uint64_t *a1)
{
  return sub_100007100(*a1);
}

uint64_t sub_100007100(uint64_t result)
{
  _QWORD *v1;

  *v1 |= result;
  return result;
}

uint64_t sub_100007110(uint64_t *a1)
{
  return sub_100007300(*a1);
}

uint64_t sub_100007118(uint64_t *a1)
{
  return sub_100007120(*a1);
}

uint64_t sub_100007120(uint64_t result)
{
  _QWORD *v1;

  *v1 ^= result;
  return result;
}

uint64_t sub_100007130@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_10000715C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_10000715C(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_100007164(uint64_t *a1)
{
  uint64_t *v1;

  return sub_100007310(*a1, *v1);
}

BOOL sub_100007170(uint64_t *a1)
{
  uint64_t *v1;

  return sub_10000717C(*a1, *v1);
}

BOOL sub_10000717C(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_100007188(uint64_t *a1)
{
  uint64_t *v1;

  return sub_10000731C(*a1, *v1);
}

BOOL sub_100007194()
{
  uint64_t *v0;

  return sub_10000719C(*v0);
}

BOOL sub_10000719C(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_1000071A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

uint64_t sub_1000071C0(uint64_t *a1)
{
  return sub_1000071C8(*a1);
}

uint64_t sub_1000071C8(uint64_t result)
{
  _QWORD *v1;

  *v1 &= ~result;
  return result;
}

_QWORD *sub_1000071D8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1000071E8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1000071F4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = sub_100006F00(a1);
  *a2 = result;
  return result;
}

Swift::Int sub_100007218()
{
  Swift::UInt *v0;

  return sub_100006E7C(*v0);
}

Swift::Int sub_100007220(uint64_t a1)
{
  Swift::UInt *v1;

  return sub_100006EC0(a1, *v1);
}

ValueMetadata *type metadata accessor for RemoteAlertButtonActionEvents()
{
  return &type metadata for RemoteAlertButtonActionEvents;
}

unint64_t sub_10000723C()
{
  unint64_t result;

  result = qword_10001E5B8;
  if (!qword_10001E5B8)
  {
    result = swift_getWitnessTable(&unk_100013030, &type metadata for RemoteAlertButtonActionEvents);
    atomic_store(result, (unint64_t *)&qword_10001E5B8);
  }
  return result;
}

unint64_t sub_10000727C()
{
  unint64_t result;

  result = qword_10001E5C0;
  if (!qword_10001E5C0)
  {
    result = swift_getWitnessTable(&unk_100013060, &type metadata for RemoteAlertButtonActionEvents);
    atomic_store(result, (unint64_t *)&qword_10001E5C0);
  }
  return result;
}

unint64_t sub_1000072BC()
{
  unint64_t result;

  result = qword_10001E5C8;
  if (!qword_10001E5C8)
  {
    result = swift_getWitnessTable(&unk_100013098, &type metadata for RemoteAlertButtonActionEvents);
    atomic_store(result, (unint64_t *)&qword_10001E5C8);
  }
  return result;
}

uint64_t sub_1000072F8(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

uint64_t sub_100007300(uint64_t result)
{
  _QWORD *v1;

  *v1 &= result;
  return result;
}

BOOL sub_100007310(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_10000731C(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_100007328(char a1, char a2)
{
  return a1 == a2;
}

void sub_100007338(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

void sub_10000735C(uint64_t a1)
{
  unsigned __int8 v1;

  sub_1000099F0(a1);
  Hasher._combine(_:)(v1);
  sub_100009A70();
  sub_100006E30();
}

BOOL sub_100007388(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_100007398(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

void sub_1000073BC(uint64_t a1)
{
  char v1;

  sub_1000099F0(a1);
  Hasher._combine(_:)(v1 & 1);
  sub_100009A70();
  sub_100006E30();
}

BOOL sub_1000073E8(char *a1, char *a2)
{
  return sub_100007328(*a1, *a2);
}

void sub_1000073F4()
{
  unsigned __int8 *v0;

  sub_10000735C(*v0);
}

void sub_1000073FC(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_100007338(a1, *v1);
}

Swift::Int sub_100007404(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

BOOL sub_100007458(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100007388(*a1, *a2);
}

void sub_100007464()
{
  unsigned __int8 *v0;

  sub_1000073BC(*v0);
}

void sub_10000747C(uint64_t a1)
{
  char *v1;

  sub_100007398(a1, *v1);
}

void sub_100007484(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v3[9];

  v2 = *v1;
  Hasher.init(_seed:)(v3, a1);
  Hasher._combine(_:)(v2);
  sub_100009A70();
  sub_100006E30();
}

uint64_t sub_1000074B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v5;
  int v6;
  uint64_t v7;
  __n128 *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  _QWORD v18[3];
  uint64_t v19;

  sub_1000099C8();
  sub_100009980();
  __chkstk_darwin();
  sub_100009A28();
  if (!a1)
  {
    v5 = 1;
    goto LABEL_5;
  }
  if (a1 == 1)
  {
    v5 = 0;
LABEL_5:
    v6 = 1;
    return v5 | (v6 << 8);
  }
  sub_100005730((uint64_t *)&unk_10001E740);
  sub_1000099D8();
  sub_100009A40();
  v8 = (__n128 *)sub_100009ABC(v2 + 3 * v3, v7);
  v19 = sub_100009A98(v8, (__n128)xmmword_100012EA0);
  v18[0] = v1;
  swift_retain(v1);
  v9 = sub_1000094C0(a1);
  v10 = (id)AMSLogKey(v9);
  if (v10)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    sub_100009B18();
    sub_100009924();
    sub_100009958();
    v11 = v19;
    v12 = sub_100006850(v18, v19);
    sub_100009910((uint64_t)v12, v11);
    swift_getMetatypeMetadata();
    sub_100009B08();
    sub_100009B00();
    sub_1000098EC();
    sub_100009B08();
    sub_100009B00();
    v13 = 93;
  }
  else
  {
    sub_100009918();
    sub_100009958();
    v14 = v19;
    v15 = sub_100006850(v18, v19);
    sub_100009910((uint64_t)v15, v14);
    swift_getMetatypeMetadata();
    sub_100009B08();
    sub_100009B00();
    v13 = 58;
  }
  v16 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v13);
  sub_100009AD4();
  sub_1000099D0();
  sub_100005AE4(v18);
  sub_100009AE0(23, 0x8000000100013AD0);
  v19 = sub_100005730(&qword_10001E798);
  v18[0] = a1;
  static LogMessage.safe(_:)(v18);
  sub_100005770((uint64_t)v18);
  sub_100006BC0((uint64_t)v8);
  sub_100009AAC();
  v5 = 0;
  v6 = 0;
  return v5 | (v6 << 8);
}

uint64_t sub_1000076B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  unsigned __int8 v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  unint64_t v52;
  void *v53;
  uint64_t v54;
  unsigned __int8 v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  unint64_t v68;
  id v69[2];
  __int128 v70;
  __int128 v71;
  _QWORD v72[3];
  void *v73;

  v2 = v1;
  sub_1000099C8();
  sub_100009980();
  __chkstk_darwin();
  v5 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    v7 = 1;
    v6 = 3;
    return v6 | (v7 << 8);
  }
  if (a1 == 1)
  {
    v6 = 1;
LABEL_4:
    v7 = 1;
    return v6 | (v7 << 8);
  }
  v69[0] = (id)0xD000000000000015;
  v69[1] = (id)0x8000000100013A70;
  sub_10000996C();
  sub_100009930();
  v8 = sub_100009A20();
  if (!v73)
  {
    sub_100009964();
    goto LABEL_10;
  }
  v11 = sub_1000098FC(v8, v9, v10, (uint64_t)&type metadata for Data);
  if ((v11 & 1) == 0)
  {
LABEL_10:
    v7 = 1;
    v6 = 2;
    return v6 | (v7 << 8);
  }
  v13 = v69[0];
  v12 = v69[1];
  v14 = sub_100009978(v11, &qword_10001E778, NSKeyedUnarchiver_ptr);
  v15 = sub_100009978(v14, &qword_10001E780, AMSEngagementRequest_ptr);
  v16 = (void *)static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)(v15, v13, v12, v15);
  v67 = (uint64_t)v13;
  v68 = (unint64_t)v12;
  if (!v16)
  {
    sub_100009B10();
    goto LABEL_10;
  }
  v66 = v16;
  strcpy((char *)v69, "bagData");
  v69[1] = (id)0xE700000000000000;
  sub_10000996C();
  sub_100009930();
  v18 = sub_100009A20();
  if (!v73)
  {
    sub_100009964();
LABEL_19:
    v24 = objc_msgSend((id)objc_opt_self(AMSUIEngagementTask), "createBagForSubProfile");
    goto LABEL_20;
  }
  v21 = sub_1000098FC(v18, v19, v20, (uint64_t)&type metadata for Data);
  if ((v21 & 1) == 0)
    goto LABEL_19;
  v22 = v69[0];
  v23 = v69[1];
  sub_100009978(v21, &qword_10001E790, AMSSnapshotBag_ptr);
  v24 = sub_100007D94((uint64_t)v22, (unint64_t)v23);
  if (!v24)
    goto LABEL_19;
LABEL_20:
  strcpy((char *)v69, "clientInfoData");
  HIBYTE(v69[1]) = -18;
  sub_10000996C();
  sub_100009930();
  v25 = sub_100009A20();
  v65 = v24;
  if (!v73)
  {
    sub_100009964();
    goto LABEL_24;
  }
  v28 = sub_1000098FC(v25, v26, v27, (uint64_t)&type metadata for Data);
  if ((v28 & 1) == 0)
  {
LABEL_24:
    v64 = 0;
    goto LABEL_25;
  }
  v30 = v69[0];
  v29 = v69[1];
  v31 = sub_100009978(v28, &qword_10001E788, AMSProcessInfo_ptr);
  v61 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)(v31, v30, v29, v31);
  sub_10000999C();
  v64 = v61;
  v24 = v65;
  if (!v61)
  {
    sub_100009B10();

    swift_unknownObjectRelease(v24);
    v6 = 0;
    goto LABEL_4;
  }
LABEL_25:
  strcpy((char *)v69, "attachedToApp");
  HIWORD(v69[1]) = -4864;
  sub_10000996C();
  sub_100009930();
  v32 = sub_100009A20();
  if (!v73)
  {
    sub_100009964();
    goto LABEL_29;
  }
  v33 = sub_100009978(v32, &qword_10001E770, NSNumber_ptr);
  if ((sub_1000098FC(v33, v34, v35, v33) & 1) == 0)
  {
LABEL_29:
    v37 = 0;
    goto LABEL_30;
  }
  v36 = v69[0];
  v37 = objc_msgSend(v69[0], "BOOLValue");

LABEL_30:
  v38 = (void *)sub_100005730((uint64_t *)&unk_10001E740);
  v39 = *(_QWORD *)(sub_1000099D8() - 8);
  v40 = swift_allocObject(v38, ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80))+ 10 * *(_QWORD *)(v39 + 72), *(unsigned __int8 *)(v39 + 80) | 7);
  *(_OWORD *)(v40 + 16) = xmmword_1000134D0;
  *((_QWORD *)&v71 + 1) = type metadata accessor for RemoteEngagementPresenter();
  *(_QWORD *)&v70 = v2;
  v41 = swift_retain(v2);
  v42 = (id)AMSLogKey(v41);
  if (v42)
  {
    v62 = sub_100009A00((uint64_t)v42);
    v44 = v43;

    sub_100009924();
    sub_1000099E0();
    sub_1000098AC(&v70);
    v45 = sub_100009950();
    sub_1000099B4(v45);
    sub_100009964();
    sub_1000098EC();
    v73 = &type metadata for String;
    v72[0] = v62;
    v72[1] = v44;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v72);
    sub_100009964();
    v46 = 93;
  }
  else
  {
    sub_100009918();
    sub_1000099E0();
    sub_1000098AC(&v70);
    v47 = sub_100009950();
    sub_1000099B4(v47);
    sub_100009964();
    v46 = 58;
  }
  v48 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v46);
  LogMessage.init(stringInterpolation:)(v5);
  sub_100005AE4(&v70);
  sub_100009AC8(0xD000000000000018);
  sub_100009AE0(21, 0x8000000100013AB0);
  *((_QWORD *)&v71 + 1) = v15;
  *(_QWORD *)&v70 = v66;
  v49 = v66;
  sub_100009AE8();
  sub_100009A18();
  LogMessage.init(stringLiteral:)(0x3A676162202CLL, 0xE600000000000000);
  v63 = v40;
  if (v24)
  {
    *((_QWORD *)&v71 + 1) = swift_getObjectType(v24);
    *(_QWORD *)&v70 = v24;
    v50 = v24;
  }
  else
  {
    v50 = 0;
    v70 = 0u;
    v71 = 0u;
  }
  v51 = v67;
  v52 = v68;
  v53 = (void *)v64;
  swift_unknownObjectRetain(v50);
  sub_100009AE8();
  sub_100009A18();
  v54 = LogMessage.init(stringLiteral:)(0x746E65696C63202CLL, 0xEE003A6F666E6920);
  v55 = v37;
  if (v53)
  {
    *((_QWORD *)&v71 + 1) = sub_100009978(v54, &qword_10001E788, AMSProcessInfo_ptr);
    *(_QWORD *)&v70 = v53;
    v56 = v53;
  }
  else
  {
    v56 = 0;
    v70 = 0u;
    v71 = 0u;
  }
  sub_1000099D0();
  v57 = v56;
  static LogMessage.safe(_:)(&v70);
  sub_100009A18();
  LogMessage.init(stringLiteral:)(0x686361747461202CLL, 0xEC000000203A6465);
  *((_QWORD *)&v71 + 1) = &type metadata for Bool;
  LOBYTE(v70) = v55;
  static LogMessage.safe(_:)(&v70);
  sub_100009A18();
  sub_100006BC0(v63);
  sub_1000091D4(v51, v52);
  sub_100009AAC();
  *(_BYTE *)(v2 + 24) = v55;
  v58 = *(_QWORD *)(v2 + 32);
  *(_QWORD *)(v2 + 32) = v65;
  swift_unknownObjectRelease(v58);
  v59 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v53;

  v60 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = v66;

  v6 = 0;
  v7 = 0;
  return v6 | (v7 << 8);
}

double sub_100007D44@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v5;
  char v6;
  double result;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_1000092B0(a1), (v6 & 1) != 0))
  {
    sub_100005B04(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

id sub_100007D94(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  id v5;
  Class isa;
  id v7;

  v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  isa = Data._bridgeToObjectiveC()().super.isa;
  v7 = objc_msgSend(v5, "initWithData:", isa);
  sub_1000091D4(a1, a2);

  return v7;
}

void sub_100007E08(uint64_t a1)
{
  uint64_t v1;
  Class isa;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  objc_class *v14;
  objc_class *v15;
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  NSString v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  Swift::String v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  Swift::String v40;
  uint64_t v41;
  id v42;
  NSString v43;
  uint64_t v44;
  uint64_t inited;
  uint64_t v46;
  uint64_t v47;
  NSNumber v48;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  int64_t v63;
  _QWORD v64[3];
  uint64_t v65;
  uint64_t v66;
  char v67;
  char v68[16];
  uint64_t v69;
  Class v70;
  void *v71;

  v3 = v1;
  sub_1000099C8();
  sub_100009980();
  __chkstk_darwin();
  v5 = sub_100005730((uint64_t *)&unk_10001E740);
  v6 = *(_QWORD *)(sub_1000099D8() - 8);
  v7 = *(void **)(v6 + 72);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v9 = (char *)((v8 + 32) & ~v8);
  v61 = v7;
  v60 = v5;
  v59 = v8 | 7;
  v10 = swift_allocObject(v5, &v9[3 * (_QWORD)v7], v8 | 7);
  *(_OWORD *)(v10 + 16) = xmmword_100012EA0;
  v57 = type metadata accessor for RemoteEngagementPresenter();
  v65 = v57;
  v11 = sub_1000099A8();
  v12 = (id)AMSLogKey(v11);
  if (v12)
  {
    v13 = sub_100009A00((uint64_t)v12);
    v15 = v14;

    sub_100009924();
    sub_1000098DC();
    sub_100009888();
    v16 = sub_100009950();
    sub_1000098C8(v16);
    sub_100009940();
    sub_1000098EC();
    v71 = &type metadata for String;
    v69 = v13;
    v70 = v15;
    sub_100009AA4();
    sub_100009940();
    v17._countAndFlagsBits = 93;
  }
  else
  {
    sub_100009918();
    sub_1000098DC();
    sub_100009888();
    v18 = sub_100009950();
    sub_1000098C8(v18);
    sub_100009940();
    v17._countAndFlagsBits = 58;
  }
  v17._object = (void *)0xE100000000000000;
  sub_100009948(v17);
  sub_100009990();
  sub_1000099D0();
  sub_100005AE4(v64);
  v19 = v61;
  sub_100009AC8(0xD000000000000029);
  v65 = sub_100005730((uint64_t *)&unk_10001E760);
  v64[0] = a1;
  swift_bridgeObjectRetain(a1);
  static LogMessage.safe(_:)(v64);
  sub_100005770((uint64_t)v64);
  sub_100006BC0(v10);
  sub_100009B3C();
  v62 = a1 + 56;
  v20 = 1 << *(_BYTE *)(a1 + 32);
  v21 = -1;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  v22 = v21 & *(_QWORD *)(a1 + 56);
  v63 = (unint64_t)(v20 + 63) >> 6;
  v58 = &v9[2 * (_QWORD)v61];
  v55 = (void *)AMSErrorDomain;
  v54 = AMSErrorUserInfoKeyEngagementPresented;
  swift_bridgeObjectRetain(a1);
  v23 = 0;
  v56 = a1;
  v53 = v3;
  while (v22)
  {
    v24 = __clz(__rbit64(v22));
    v22 &= v22 - 1;
    v25 = v24 | (v23 << 6);
LABEL_23:
    if ((*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v25) & 0x10) != 0)
    {
      v32 = *(_BYTE *)(v3 + 24);
      *(_OWORD *)(swift_allocObject(v60, v58, v59) + 16) = xmmword_1000134E0;
      if ((v32 & 1) != 0)
      {
        v65 = v57;
        v37 = sub_1000099A8();
        v38 = (id)AMSLogKey(v37);
        if (v38)
        {
          sub_100009A00((uint64_t)v38);
          sub_100009B24();
          sub_100009924();
          sub_1000098DC();
          sub_100009888();
          v39 = sub_100009950();
          sub_1000098C8(v39);
          sub_100009940();
          sub_1000098EC();
          v71 = &type metadata for String;
          v69 = (uint64_t)v19;
          v70 = isa;
          sub_100009AA4();
          sub_100009940();
          v40._countAndFlagsBits = 93;
        }
        else
        {
          sub_100009918();
          sub_1000098DC();
          sub_100009888();
          v52 = sub_100009950();
          sub_1000098C8(v52);
          sub_100009940();
          v40._countAndFlagsBits = 58;
        }
        v40._object = (void *)0xE100000000000000;
        sub_100009948(v40);
        sub_100009990();
        sub_100005AE4(v64);
        LogMessage.init(stringLiteral:)(0xD00000000000002FLL, 0x8000000100013A40);
        sub_100009A78();
        sub_100009B3C();
      }
      else
      {
        v65 = v57;
        v33 = sub_1000099A8();
        v34 = (id)AMSLogKey(v33);
        if (v34)
        {
          sub_100009A00((uint64_t)v34);
          sub_100009B24();
          sub_100009924();
          sub_1000098DC();
          sub_100009888();
          v35 = sub_100009950();
          sub_1000098C8(v35);
          sub_100009940();
          sub_1000098EC();
          v71 = &type metadata for String;
          v69 = (uint64_t)v19;
          v70 = isa;
          sub_100009AA4();
          sub_100009940();
          v36._countAndFlagsBits = 93;
        }
        else
        {
          sub_100009918();
          sub_1000098DC();
          sub_100009888();
          v41 = sub_100009950();
          sub_1000098C8(v41);
          sub_100009940();
          v36._countAndFlagsBits = 58;
        }
        v36._object = (void *)0xE100000000000000;
        sub_100009948(v36);
        sub_100009990();
        sub_100005AE4(v64);
        LogMessage.init(stringLiteral:)(0xD00000000000001CLL, 0x80000001000139E0);
        sub_100009A78();
        sub_100009B3C();
        v42 = v55;
        v43 = String._bridgeToObjectiveC()();
        v19 = String._bridgeToObjectiveC()();
        v44 = sub_100005730(&qword_10001E3F8);
        inited = swift_initStackObject(v44, v68);
        *(_OWORD *)(inited + 16) = xmmword_100012EF0;
        *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
        *(_QWORD *)(inited + 40) = v46;
        v47 = sub_100009218(0, &qword_10001E770, NSNumber_ptr);
        v48.super.super.isa = NSNumber.init(BOOLeanLiteral:)(1).super.super.isa;
        *(_QWORD *)(inited + 72) = v47;
        *(NSNumber *)(inited + 48) = v48;
        v49 = Dictionary.init(dictionaryLiteral:)(inited, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
        isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v49);
        v50 = (id)AMSCustomError(v42, 6, v43, v19, isa, 0);

        v3 = v53;
        v64[0] = 0;
        v64[1] = v50;
        v65 = 0;
        v66 = 0;
        v64[2] = 0;
        v67 = 0;
        v51 = v50;
        SyncEvent.post(_:)(v64);

        a1 = v56;
      }
    }
  }
  v26 = v23 + 1;
  if (__OFADD__(v23, 1))
  {
    __break(1u);
    goto LABEL_35;
  }
  if (v26 >= v63)
    goto LABEL_33;
  v27 = *(_QWORD *)(v62 + 8 * v26);
  ++v23;
  if (v27)
    goto LABEL_22;
  v23 = v26 + 1;
  if (v26 + 1 >= v63)
    goto LABEL_33;
  sub_100009A60();
  if (v27)
    goto LABEL_22;
  v23 = v28 + 2;
  if (v28 + 2 >= v63)
    goto LABEL_33;
  sub_100009A60();
  if (v27)
  {
LABEL_22:
    v22 = (v27 - 1) & v27;
    v25 = __clz(__rbit64(v27)) + (v23 << 6);
    goto LABEL_23;
  }
  v30 = v29 + 3;
  if (v30 >= v63)
  {
LABEL_33:
    swift_release(a1);
    return;
  }
  v27 = *(_QWORD *)(v62 + 8 * v30);
  if (v27)
  {
    v23 = v30;
    goto LABEL_22;
  }
  while (1)
  {
    v23 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v23 >= v63)
      goto LABEL_33;
    sub_100009A60();
    v30 = v31 + 1;
    if (v27)
      goto LABEL_22;
  }
LABEL_35:
  __break(1u);
}

void sub_100008564()
{
  _QWORD *v0;
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  __n128 *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t (*v28)();
  void *v29;
  uint64_t v30;
  void *v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  void *MetatypeMetadata;

  sub_1000099C8();
  sub_100009980();
  __chkstk_darwin(v5);
  sub_100009A28();
  v6 = (uint64_t (*)())v0[4];
  if (v6 && (v2 = (_QWORD *)v0[7]) != 0)
  {
    v7 = (void *)v0[5];
    v8 = sub_100009AF4((uint64_t)&unk_100018C70);
    sub_100009A08(v8);
    v27 = v2;
    v28 = v6;
    v29 = v7;
    v30 = (uint64_t)sub_10000915C;
    v31 = v1;
    v32 = 1;
    v9 = v7;
    swift_retain(v1);
    swift_unknownObjectRetain(v6);
    v10 = v2;
    SyncEvent.post(_:)(&v27);
    sub_100009B30();

    swift_unknownObjectRelease(v6);
  }
  else
  {
    sub_100005730((uint64_t *)&unk_10001E740);
    sub_1000099D8();
    sub_100009A40();
    v12 = (__n128 *)sub_100009ABC((uint64_t)v1 + 2 * v4, v11);
    v30 = sub_100009A98(v12, (__n128)xmmword_1000134E0);
    v27 = v0;
    v13 = swift_retain(v0);
    v14 = (id)AMSLogKey(v13);
    if (v14)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
      sub_100009B18();
      sub_100009924();
      sub_100009958();
      v15 = v30;
      v16 = sub_100006850(&v27, v30);
      v17 = sub_100009910((uint64_t)v16, v15);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata(v17);
      v33 = v17;
      sub_100009A90();
      sub_100009A88();
      sub_1000098EC();
      MetatypeMetadata = &type metadata for String;
      v33 = (uint64_t)v2;
      v34 = v3;
      sub_100009A90();
      sub_100009A88();
      v18 = 93;
    }
    else
    {
      sub_100009918();
      sub_100009958();
      v19 = v30;
      v20 = sub_100006850(&v27, v30);
      v21 = sub_100009910((uint64_t)v20, v19);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata(v21);
      v33 = v21;
      sub_100009A90();
      sub_100009A88();
      v18 = 58;
    }
    v22 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v18);
    sub_100009AD4();
    sub_1000099D0();
    sub_100005AE4(&v27);
    sub_100009AE0(58, 0x8000000100013940);
    sub_100006A34((uint64_t)v12);
    sub_100009AAC();
    v23 = sub_1000090F4();
    v24 = swift_allocError(&unk_100018D08, v23, 0, 0);
    *v25 = 1;
    v26 = sub_100009AF4((uint64_t)&unk_100018C70);
    sub_100009A08(v26);
    v27 = (_QWORD *)v24;
    v28 = sub_100009154;
    v30 = 0;
    v31 = 0;
    v29 = v1;
    v32 = 2;
    swift_retain(v1);
    SyncEvent.post(_:)(&v27);
    sub_100009AB4();
    sub_100009B30();
  }
}

uint64_t sub_1000087EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _QWORD v7[5];
  char v8;
  _BYTE v9[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v9, 0, 0);
  result = swift_weakLoadStrong(v1);
  if (result)
  {
    v3 = result;
    v4 = sub_1000090F4();
    v5 = swift_allocError(&unk_100018D08, v4, 0, 0);
    *v6 = 1;
    v7[0] = 0;
    v7[1] = v5;
    memset(&v7[2], 0, 24);
    v8 = 0;
    SyncEvent.post(_:)(v7);
    swift_errorRelease(v5);
    return swift_release(v3);
  }
  return result;
}

uint64_t sub_100008890(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  Swift::String v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t DynamicType;
  Swift::String v24;
  uint64_t v25;
  Swift::String v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[8];
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  char v42;
  _QWORD v43[3];
  void *MetatypeMetadata;
  _BYTE v45[24];

  v6 = type metadata accessor for LogMessage.StringInterpolation(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  a3 += 16;
  swift_beginAccess(a3, v45, 0, 0);
  result = swift_weakLoadStrong(a3);
  if (result)
  {
    v10 = result;
    v11 = sub_100005730((uint64_t *)&unk_10001E740);
    v12 = type metadata accessor for LogMessage(0);
    v13 = swift_allocObject(v11, ((*(unsigned __int8 *)(*(_QWORD *)(v12 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v12 - 8) + 80))+ 5 * *(_QWORD *)(*(_QWORD *)(v12 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v12 - 8) + 80) | 7);
    *(_OWORD *)(v13 + 16) = xmmword_1000134F0;
    *((_QWORD *)&v40 + 1) = type metadata accessor for RemoteEngagementPresenter();
    *(_QWORD *)&v39 = v10;
    v14 = swift_retain(v10);
    v15 = (id)AMSLogKey(v14);
    if (v15)
    {
      v16 = v15;
      v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      v19 = v18;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4, 2);
      v20._countAndFlagsBits = 0;
      v20._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v20);
      v21 = *((_QWORD *)&v40 + 1);
      v22 = sub_100006850(&v39, *((uint64_t *)&v40 + 1));
      DynamicType = swift_getDynamicType(v22, v21, 1);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v43[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v43);
      sub_100005770((uint64_t)v43);
      v24._countAndFlagsBits = 5972026;
      v24._object = (void *)0xE300000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v24);
      MetatypeMetadata = &type metadata for String;
      v43[0] = v17;
      v43[1] = v19;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v43);
      sub_100005770((uint64_t)v43);
      v25 = 93;
    }
    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1, 1);
      v26._countAndFlagsBits = 0;
      v26._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v26);
      v27 = *((_QWORD *)&v40 + 1);
      v28 = sub_100006850(&v39, *((uint64_t *)&v40 + 1));
      v29 = swift_getDynamicType(v28, v27, 1);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v43[0] = v29;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v43);
      sub_100005770((uint64_t)v43);
      v25 = 58;
    }
    v30 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v25);
    LogMessage.init(stringInterpolation:)(v8);
    sub_100005AE4(&v39);
    LogMessage.init(stringLiteral:)(0xD000000000000021, 0x8000000100013980);
    if (a1)
    {
      *((_QWORD *)&v40 + 1) = sub_100009218(0, &qword_10001E758, AMSEngagementResult_ptr);
      *(_QWORD *)&v39 = a1;
    }
    else
    {
      v39 = 0u;
      v40 = 0u;
    }
    v31 = a1;
    static LogMessage.safe(_:)(&v39);
    sub_100005770((uint64_t)&v39);
    LogMessage.init(stringLiteral:)(0x3A726F727265202CLL, 0xE800000000000000);
    if (a2)
    {
      swift_getErrorValue(a2, v38, &v36);
      v32 = v36;
      v33 = v37;
      *((_QWORD *)&v40 + 1) = v37;
      v34 = sub_100009164(&v39);
      (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v34, v32, v33);
    }
    else
    {
      v39 = 0u;
      v40 = 0u;
    }
    type metadata accessor for Log();
    static LogMessage.safe(_:)(&v39);
    sub_100005770((uint64_t)&v39);
    sub_100006BC0(v13);
    swift_bridgeObjectRelease(v13);
    *(_QWORD *)&v39 = a1;
    *((_QWORD *)&v39 + 1) = a2;
    v41 = 0;
    v40 = 0uLL;
    v42 = 0;
    v35 = v31;
    swift_errorRetain(a2);
    SyncEvent.post(_:)(&v39);

    swift_errorRelease(a2);
    return swift_release(v10);
  }
  return result;
}

uint64_t sub_100008C10()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 32));

  return v0;
}

uint64_t sub_100008C44()
{
  uint64_t v0;

  sub_100008C10();
  return swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for RemoteEngagementPresenter()
{
  return objc_opt_self(_TtC24AMSEngagementViewService25RemoteEngagementPresenter);
}

uint64_t sub_100008C84(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

void *sub_100008CB4(void *result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  void *v8;
  id v9;
  id v11;
  id v12;

  v8 = result;
  switch(a6)
  {
    case 2:
      swift_errorRetain(result);
      return (void *)sub_100006840(a2, (uint64_t)a3);
    case 1:
      v11 = a3;
      swift_retain(a5);
      v12 = v8;
      return (void *)swift_unknownObjectRetain(a2);
    case 0:
      v9 = result;
      return (void *)swift_errorRetain(a2);
  }
  return result;
}

void sub_100008D58(uint64_t a1)
{
  sub_100008D70(*(void **)a1, *(_QWORD *)(a1 + 8), *(void **)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
}

void sub_100008D70(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  switch(a6)
  {
    case 2:
      swift_errorRelease(a1);
      sub_100006874(a2, (uint64_t)a3);
      break;
    case 1:

      swift_unknownObjectRelease(a2);
      swift_release(a5);

      break;
    case 0:

      swift_errorRelease(a2);
      break;
  }
}

uint64_t sub_100008E14(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_100008CB4(*(void **)a2, v4, v5, v6, v7, v8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  return a1;
}

uint64_t sub_100008E88(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_100008CB4(*(void **)a2, v4, v5, v6, v7, v8);
  v9 = *(void **)a1;
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(void **)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  v14 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v8;
  sub_100008D70(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 sub_100008F10(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_100008F24(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_BYTE *)(a2 + 40);
  v5 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(void **)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 32) = v3;
  v11 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v4;
  sub_100008D70(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t sub_100008F74(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 41))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 40);
      if (v3 <= 2)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100008FB4(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_100009004(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_10000900C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 40) = a2;
  return result;
}

void type metadata accessor for RemoteEngagementPresenter.State()
{
  sub_100009A58();
}

unint64_t sub_100009024()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E730;
  if (!qword_10001E730)
  {
    v1 = type metadata accessor for RemoteEngagementPresenter();
    result = swift_getWitnessTable(&unk_100013278, v1);
    atomic_store(result, (unint64_t *)&qword_10001E730);
  }
  return result;
}

uint64_t sub_100009060()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_100005730(&qword_10001E8A0);
  swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  *(_QWORD *)(v0 + 16) = SyncEvent.init()();
  *(_BYTE *)(v0 + 24) = 2;
  *(_QWORD *)(v0 + 56) = 0;
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  *(_BYTE *)(v0 + 48) = 0;
  return v0;
}

void sub_1000090B8()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 48) & 1) == 0)
  {
    sub_100008564();
    *(_BYTE *)(v0 + 48) = 1;
  }
}

unint64_t sub_1000090F4()
{
  unint64_t result;

  result = qword_10001E750;
  if (!qword_10001E750)
  {
    result = swift_getWitnessTable(&unk_10001348C, &unk_100018D08);
    atomic_store(result, (unint64_t *)&qword_10001E750);
  }
  return result;
}

uint64_t sub_100009130()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100009154()
{
  uint64_t v0;

  return sub_1000087EC(v0);
}

uint64_t sub_10000915C(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100008890(a1, a2, v2);
}

_QWORD *sub_100009164(_QWORD *a1)
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

uint64_t sub_1000091A0(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_1000091D4(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100009218(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

unint64_t sub_100009250(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = sub_100009A70();
  return sub_1000092E0(a1, a2, v5);
}

unint64_t sub_1000092B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_1000093C0(a1, v4);
}

unint64_t sub_1000092E0(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_1000093C0(uint64_t a1, uint64_t a2)
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
      sub_100009484(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_1000091A0((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100009484(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1000094C0(uint64_t result)
{
  if (result != 1)
    return swift_bridgeObjectRetain();
  return result;
}

_BYTE *sub_1000094D0(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_1000094E8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1000094F0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void type metadata accessor for RemoteEngagementPresenter.CompletionError()
{
  sub_100009A58();
}

uint64_t sub_100009508(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_100009590(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000095DC + 4 * byte_1000131A9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100009610 + 4 * byte_1000131A4[v4]))();
}

uint64_t sub_100009610(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009618(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100009620);
  return result;
}

uint64_t sub_10000962C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100009634);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100009638(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009640(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for RemoteEngagementPresenter.ConfigurationError()
{
  sub_100009A58();
}

uint64_t sub_100009658(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_1000096E0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000972C + 4 * byte_1000131B3[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100009760 + 4 * byte_1000131AE[v4]))();
}

uint64_t sub_100009760(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009768(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100009770);
  return result;
}

uint64_t sub_10000977C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100009784);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_100009788(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009790(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_10000979C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void type metadata accessor for RemoteEngagementPresenter.ActivationError()
{
  sub_100009A58();
}

unint64_t sub_1000097B4()
{
  unint64_t result;

  result = qword_10001E7A0;
  if (!qword_10001E7A0)
  {
    result = swift_getWitnessTable(&unk_100013354, &unk_100018E28);
    atomic_store(result, (unint64_t *)&qword_10001E7A0);
  }
  return result;
}

unint64_t sub_1000097F4()
{
  unint64_t result;

  result = qword_10001E7A8;
  if (!qword_10001E7A8)
  {
    result = swift_getWitnessTable(&unk_1000133FC, &unk_100018D98);
    atomic_store(result, (unint64_t *)&qword_10001E7A8);
  }
  return result;
}

unint64_t sub_100009834()
{
  unint64_t result;

  result = qword_10001E7B0;
  if (!qword_10001E7B0)
  {
    result = swift_getWitnessTable(&unk_100013464, &unk_100018D08);
    atomic_store(result, (unint64_t *)&qword_10001E7B0);
  }
  return result;
}

uint64_t sub_100009888()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 - 224);
  v2 = sub_100006850((_QWORD *)(v0 - 248), v1);
  return swift_getDynamicType(v2, v1, 1);
}

uint64_t sub_1000098AC(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = sub_100006850(a1, v1);
  return swift_getDynamicType(v2, v1, 1);
}

uint64_t sub_1000098C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = a1;
  *(_QWORD *)(v2 - 120) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 120);
}

void sub_1000098DC()
{
  Swift::String v0;

  v0._countAndFlagsBits = 0;
  v0._object = (void *)0xE000000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

void sub_1000098EC()
{
  Swift::String v0;

  v0._countAndFlagsBits = 5972026;
  v0._object = (void *)0xE300000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

uint64_t sub_1000098FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return swift_dynamicCast(v5 - 192, v5 - 128, v4 + 8, a4, 6);
}

uint64_t sub_100009910(uint64_t a1, uint64_t a2)
{
  return swift_getDynamicType(a1, a2, 1);
}

uint64_t sub_100009918()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1, 1);
}

uint64_t sub_100009924()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4, 2);
}

double sub_100009930()
{
  uint64_t v0;
  uint64_t v1;

  return sub_100007D44(v1 - 176, v0, (_OWORD *)(v1 - 128));
}

uint64_t sub_100009940()
{
  uint64_t v0;

  return sub_100005770(v0 - 120);
}

void sub_100009948(Swift::String a1)
{
  LogMessage.StringInterpolation.appendLiteral(_:)(a1);
}

uint64_t sub_100009950()
{
  return swift_getMetatypeMetadata();
}

void sub_100009958()
{
  Swift::String v0;

  v0._countAndFlagsBits = 0;
  v0._object = (void *)0xE000000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

uint64_t sub_100009964()
{
  uint64_t v0;

  return sub_100005770(v0 - 128);
}

uint64_t sub_10000996C()
{
  uint64_t v0;

  return AnyHashable.init<A>(_:)(v0 - 192);
}

uint64_t sub_100009978(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  return sub_100009218(0, a2, a3);
}

uint64_t sub_100009990()
{
  uint64_t v0;

  return LogMessage.init(stringInterpolation:)(v0);
}

uint64_t sub_10000999C()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1000091D4(v1, v0);
}

uint64_t sub_1000099A8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 248) = v0;
  return swift_retain(v0);
}

uint64_t sub_1000099B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = a1;
  *(_QWORD *)(v2 - 128) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 128);
}

uint64_t sub_1000099C8()
{
  return type metadata accessor for LogMessage.StringInterpolation(0);
}

uint64_t sub_1000099D0()
{
  return type metadata accessor for Log();
}

uint64_t sub_1000099D8()
{
  return type metadata accessor for LogMessage(0);
}

void sub_1000099E0()
{
  Swift::String v0;

  v0._countAndFlagsBits = 0;
  v0._object = (void *)0xE000000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

_QWORD *sub_1000099F0(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  return Hasher.init(_seed:)((uint64_t *)va, 0);
}

uint64_t sub_100009A00(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

uint64_t sub_100009A08(uint64_t a1)
{
  uint64_t v1;

  return swift_weakInit(a1 + 16, v1);
}

uint64_t sub_100009A18()
{
  uint64_t v0;

  return sub_100005770(v0 - 176);
}

uint64_t sub_100009A20()
{
  uint64_t v0;

  return sub_1000091A0(v0 - 176);
}

Swift::Int sub_100009A70()
{
  return Hasher._finalize()();
}

uint64_t sub_100009A78()
{
  uint64_t v0;

  return sub_100006BC0(v0);
}

uint64_t sub_100009A88()
{
  uint64_t v0;

  return sub_100005770(v0 - 96);
}

uint64_t sub_100009A90()
{
  uint64_t v0;

  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 96);
}

uint64_t sub_100009A98(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return type metadata accessor for RemoteEngagementPresenter();
}

uint64_t sub_100009AA4()
{
  uint64_t v0;

  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 120);
}

uint64_t sub_100009AAC()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100009AB4()
{
  uint64_t v0;

  return swift_errorRelease(v0);
}

uint64_t sub_100009ABC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return swift_allocObject(v2, a1, a2 | 7);
}

uint64_t sub_100009AC8(uint64_t a1)
{
  uint64_t v1;

  return LogMessage.init(stringLiteral:)(a1, (v1 - 32) | 0x8000000000000000);
}

uint64_t sub_100009AD4()
{
  uint64_t v0;

  return LogMessage.init(stringInterpolation:)(v0);
}

uint64_t sub_100009AE0(uint64_t a1, uint64_t a2)
{
  return LogMessage.init(stringLiteral:)(a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a2);
}

uint64_t sub_100009AE8()
{
  uint64_t v0;

  return static LogMessage.safe(_:)(v0 - 176);
}

uint64_t sub_100009AF4(uint64_t a1)
{
  return swift_allocObject(a1, 24, 7);
}

uint64_t sub_100009B00()
{
  uint64_t v0;

  return sub_100005770(v0 - 136);
}

uint64_t sub_100009B08()
{
  uint64_t v0;

  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 136);
}

uint64_t sub_100009B10()
{
  uint64_t v0;

  return sub_1000091D4(*(_QWORD *)(v0 - 216), *(_QWORD *)(v0 - 208));
}

void sub_100009B18()
{
  void *v0;

}

void sub_100009B24()
{
  void *v0;

}

uint64_t sub_100009B30()
{
  uint64_t v0;

  return swift_release_n(v0, 2);
}

uint64_t sub_100009B3C()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100009B44(uint64_t a1)
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

void sub_100009B70(uint64_t a1)
{
  sub_10000F2B8(a1, OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection);
}

uint64_t sub_100009B7C()
{
  char *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v10;
  _QWORD aBlock[5];
  uint64_t v12;

  v1 = *(void **)&v0[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection];
  if (!v1)
    return 0;
  v2 = sub_100009AF4((uint64_t)&unk_100019198);
  *(_QWORD *)(v2 + 16) = v0;
  aBlock[4] = sub_10000E464;
  v12 = v2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100009F4C;
  aBlock[3] = &unk_1000191B0;
  v3 = _Block_copy(aBlock);
  v4 = v12;
  v5 = v1;
  v6 = v0;
  swift_release(v4);
  v7 = objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v3);
  _Block_release(v3);

  _bridgeAnyObjectToAny(_:)(aBlock, v7);
  swift_unknownObjectRelease(v7);
  v8 = sub_100005730(&qword_10001E8B8);
  if (swift_dynamicCast(&v10, aBlock, (char *)&type metadata for Any + 8, v8, 6))
    return v10;
  else
    return 0;
}

uint64_t sub_100009CA0(uint64_t a1, void *a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::String v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t DynamicType;
  Swift::String v18;
  uint64_t v19;
  Swift::String v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[8];
  _QWORD v32[3];
  void *MetatypeMetadata;
  _QWORD v34[3];
  uint64_t v35;

  type metadata accessor for LogMessage.StringInterpolation(0);
  __chkstk_darwin();
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100005730((uint64_t *)&unk_10001E740);
  v7 = type metadata accessor for LogMessage(0);
  v8 = swift_allocObject(v6, ((*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80))+ 3 * *(_QWORD *)(*(_QWORD *)(v7 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80) | 7);
  *(_OWORD *)(v8 + 16) = xmmword_100012EA0;
  v35 = type metadata accessor for RemoteEngagementViewController();
  v34[0] = a2;
  v9 = (id)AMSLogKey(a2);
  if (v9)
  {
    v10 = v9;
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v13 = v12;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4, 2);
    v14._countAndFlagsBits = 0;
    v14._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v14);
    v15 = v35;
    v16 = sub_100006850(v34, v35);
    DynamicType = swift_getDynamicType(v16, v15, 1);
    MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v32[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v32);
    sub_10000E160((uint64_t)v32, &qword_10001E400);
    v18._countAndFlagsBits = 5972026;
    v18._object = (void *)0xE300000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v18);
    MetatypeMetadata = &type metadata for String;
    v32[0] = v11;
    v32[1] = v13;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v32);
    sub_10000E160((uint64_t)v32, &qword_10001E400);
    v19 = 93;
  }
  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1, 1);
    v20._countAndFlagsBits = 0;
    v20._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v20);
    v21 = v35;
    v22 = sub_100006850(v34, v35);
    v23 = swift_getDynamicType(v22, v21, 1);
    MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v32[0] = v23;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v32);
    sub_10000E160((uint64_t)v32, &qword_10001E400);
    v19 = 58;
  }
  v24 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v19);
  LogMessage.init(stringInterpolation:)(v5);
  type metadata accessor for Log();
  sub_100005AE4(v34);
  LogMessage.init(stringLiteral:)(0xD000000000000027, 0x8000000100013E10);
  swift_getErrorValue(a1, v31, &v29);
  v25 = v29;
  v26 = v30;
  v35 = v30;
  v27 = sub_100009164(v34);
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v27, v25, v26);
  static LogMessage.safe(_:)(v34);
  sub_10000E160((uint64_t)v34, &qword_10001E400);
  sub_100006A34(v8);
  return swift_bridgeObjectRelease(v8);
}

void sub_100009F4C(uint64_t a1, void *a2)
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

uint64_t sub_100009F9C()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v8;
  _OWORD v9[2];
  _QWORD aBlock[3];
  void *v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;

  v1 = sub_100009AF4((uint64_t)&unk_100019148);
  *(_QWORD *)(v1 + 16) = v0;
  v12 = sub_10000E414;
  v13 = v1;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000A390;
  v11 = &unk_100019160;
  v2 = _Block_copy(aBlock);
  v3 = v13;
  v4 = v0;
  swift_release(v3);
  v5 = objc_msgSend(v4, "_remoteViewControllerProxyWithErrorHandler:", v2);
  sub_10000F470();
  if (v5)
  {
    _bridgeAnyObjectToAny(_:)(v9, v5);
    swift_unknownObjectRelease(v5);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_10000E41C((uint64_t)v9, (uint64_t)aBlock);
  if (v11)
  {
    v6 = sub_100005730(&qword_10001E8B0);
    if (swift_dynamicCast(&v8, aBlock, (char *)&type metadata for Any + 8, v6, 6))
      return v8;
    else
      return 0;
  }
  else
  {
    sub_10000E160((uint64_t)aBlock, &qword_10001E400);
    return 0;
  }
}

uint64_t sub_10000A0D8(uint64_t a1, void *a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::String v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t DynamicType;
  Swift::String v18;
  uint64_t v19;
  Swift::String v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[8];
  _QWORD v32[3];
  void *MetatypeMetadata;
  __int128 v34;
  __int128 v35;

  type metadata accessor for LogMessage.StringInterpolation(0);
  __chkstk_darwin();
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100005730((uint64_t *)&unk_10001E740);
  v7 = type metadata accessor for LogMessage(0);
  v8 = swift_allocObject(v6, ((*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80))+ 3 * *(_QWORD *)(*(_QWORD *)(v7 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80) | 7);
  *(_OWORD *)(v8 + 16) = xmmword_100012EA0;
  *((_QWORD *)&v35 + 1) = type metadata accessor for RemoteEngagementViewController();
  *(_QWORD *)&v34 = a2;
  v9 = (id)AMSLogKey(a2);
  if (v9)
  {
    v10 = v9;
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v13 = v12;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4, 2);
    v14._countAndFlagsBits = 0;
    v14._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v14);
    v15 = *((_QWORD *)&v35 + 1);
    v16 = sub_100006850(&v34, *((uint64_t *)&v35 + 1));
    DynamicType = swift_getDynamicType(v16, v15, 1);
    MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v32[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v32);
    sub_10000E160((uint64_t)v32, &qword_10001E400);
    v18._countAndFlagsBits = 5972026;
    v18._object = (void *)0xE300000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v18);
    MetatypeMetadata = &type metadata for String;
    v32[0] = v11;
    v32[1] = v13;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v32);
    sub_10000E160((uint64_t)v32, &qword_10001E400);
    v19 = 93;
  }
  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1, 1);
    v20._countAndFlagsBits = 0;
    v20._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v20);
    v21 = *((_QWORD *)&v35 + 1);
    v22 = sub_100006850(&v34, *((uint64_t *)&v35 + 1));
    v23 = swift_getDynamicType(v22, v21, 1);
    MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v32[0] = v23;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v32);
    sub_10000E160((uint64_t)v32, &qword_10001E400);
    v19 = 58;
  }
  v24 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v19);
  LogMessage.init(stringInterpolation:)(v5);
  sub_100005AE4(&v34);
  LogMessage.init(stringLiteral:)(0xD000000000000037, 0x8000000100013DD0);
  if (a1)
  {
    swift_getErrorValue(a1, v31, &v29);
    v25 = v29;
    v26 = v30;
    *((_QWORD *)&v35 + 1) = v30;
    v27 = sub_100009164(&v34);
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v27, v25, v26);
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
  }
  type metadata accessor for Log();
  static LogMessage.safe(_:)(&v34);
  sub_10000E160((uint64_t)&v34, &qword_10001E400);
  sub_100006A34(v8);
  return swift_bridgeObjectRelease(v8);
}

void sub_10000A390(uint64_t a1, void *a2)
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

void sub_10000A3E4(uint64_t a1)
{
  sub_10000F2B8(a1, OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task);
}

void sub_10000A3F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  Swift::String v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  Swift::String v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  Swift::String v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  sub_10000F220();
  v3 = v2;
  v5 = v4;
  sub_1000099C8();
  sub_100009980();
  __chkstk_darwin();
  sub_10000F2FC();
  if (v5 && (v7 = sub_100006960(v6, "xpcEndpoint")) != 0)
  {
    v8 = (uint64_t)v7;
    sub_10000EF30(v5);
    v10 = v9;
    v11 = sub_1000074B8(v9);
    sub_100009AAC();
    v12 = (void *)sub_100005730((uint64_t *)&unk_10001E740);
    sub_1000099D8();
    sub_10000F344();
    v15 = v14 | 7;
    if ((v11 & 0x100) != 0)
    {
      v16 = sub_10000F2F4(v13, v10 + 3 * v1, v15);
      *(_OWORD *)(v16 + 16) = xmmword_100012EA0;
      v33 = type metadata accessor for RemoteEngagementViewController();
      v34 = sub_10000F2E8(v33);
      v35 = (id)AMSLogKey(v34);
      if (v35)
      {
        sub_100009A00((uint64_t)v35);

        sub_100009924();
        sub_1000098DC();
        sub_10000F140();
        v36 = sub_100009950();
        sub_10000F17C(v36);
        sub_10000F26C();
        sub_1000098EC();
        sub_10000F24C();
        sub_10000F26C();
        v37._countAndFlagsBits = 93;
      }
      else
      {
        sub_100009918();
        sub_1000098DC();
        sub_10000F140();
        v41 = sub_100009950();
        v42 = sub_10000F17C(v41);
        sub_10000F2B0(v42, &qword_10001E400);
        v37._countAndFlagsBits = 58;
      }
      v37._object = (void *)0xE100000000000000;
      sub_100009948(v37);
      sub_10000F45C();
      sub_1000099D0();
      sub_10000F1D4();
      sub_100009AC8(0xD00000000000001BLL);
      v43 = sub_10000F478();
      sub_10000F480(v43, &qword_10001E400);
      sub_100006A34(v16);
    }
    else
    {
      v16 = sub_10000F2F4(v13, v10 + 2 * v1, v15);
      *(_OWORD *)(v16 + 16) = xmmword_1000134E0;
      v17 = type metadata accessor for RemoteEngagementViewController();
      v18 = sub_10000F2E8(v17);
      v19 = (id)AMSLogKey(v18);
      if (v19)
      {
        sub_100009A00((uint64_t)v19);

        sub_100009924();
        sub_1000098DC();
        sub_10000F140();
        v20 = sub_100009950();
        sub_10000F17C(v20);
        sub_10000F26C();
        sub_1000098EC();
        sub_10000F24C();
        sub_10000F26C();
        v21._countAndFlagsBits = 93;
      }
      else
      {
        sub_100009918();
        sub_1000098DC();
        sub_10000F140();
        v38 = sub_100009950();
        v39 = sub_10000F17C(v38);
        sub_10000F2B0(v39, &qword_10001E400);
        v21._countAndFlagsBits = 58;
      }
      v21._object = (void *)0xE100000000000000;
      sub_100009948(v21);
      sub_10000F45C();
      sub_1000099D0();
      sub_10000F1D4();
      sub_10000F364();
      sub_100009AE0(23, v40);
      sub_100006BC0(v16);
    }
    swift_bridgeObjectRelease(v16);
    sub_10000BB54(v8);
    sub_10000B5E8();
    sub_10000B750();
    if (v3)
      sub_10000F3DC();
    swift_unknownObjectRelease(v8);
  }
  else
  {
    v22 = (void *)sub_100005730((uint64_t *)&unk_10001E740);
    sub_1000099D8();
    sub_10000F344();
    v25 = sub_10000F2F4(v24, v0 + 2 * v1, v23 | 7);
    *(_OWORD *)(v25 + 16) = xmmword_1000134E0;
    v26 = type metadata accessor for RemoteEngagementViewController();
    v27 = sub_10000F2E8(v26);
    v28 = (id)AMSLogKey(v27);
    if (v28)
    {
      sub_100009A00((uint64_t)v28);

      sub_100009924();
      sub_1000098DC();
      sub_10000F140();
      v29 = sub_100009950();
      sub_10000F17C(v29);
      sub_10000F260();
      sub_1000098EC();
      sub_10000F24C();
      sub_10000F260();
      v30._countAndFlagsBits = 93;
    }
    else
    {
      sub_100009918();
      sub_1000098DC();
      sub_10000F140();
      v31 = sub_100009950();
      v32 = sub_10000F17C(v31);
      sub_10000F2B0(v32, &qword_10001E400);
      v30._countAndFlagsBits = 58;
    }
    v30._object = (void *)0xE100000000000000;
    sub_100009948(v30);
    sub_10000F45C();
    sub_1000099D0();
    sub_10000F1D4();
    sub_100009AC8(0xD00000000000001CLL);
    sub_100006A34(v25);
    swift_bridgeObjectRelease(v25);
    if (v3)
      sub_10000F3DC();
  }
  sub_10000F164();
}

void sub_10000A8C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_10000F220();
  v2 = v1;
  v4 = v3;
  sub_1000099C8();
  sub_100009980();
  __chkstk_darwin();
  sub_10000F314();
  if (v4)
  {
    sub_10000EF30(v4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  v7 = sub_1000076B4(v6);
  sub_10000F378();
  v8 = (void *)sub_100005730((uint64_t *)&unk_10001E740);
  v9 = sub_1000099D8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = *(unsigned __int8 *)(v10 + 80);
  v13 = (v12 + 32) & ~v12;
  v14 = v12 | 7;
  if ((v7 & 0x100) != 0)
  {
    v21 = sub_10000F2F4(v9, v13 + 3 * v11, v14);
    *(_OWORD *)(v21 + 16) = xmmword_100012EA0;
    v22 = type metadata accessor for RemoteEngagementViewController();
    v23 = sub_10000F494(v22);
    v24 = (id)AMSLogKey(v23);
    if (v24)
    {
      sub_100009A00((uint64_t)v24);

      sub_100009924();
      sub_100006920();
      sub_10000F140();
      v25 = sub_100009950();
      sub_10000F1C0(v25);
      sub_10000F260();
      sub_1000098EC();
      sub_10000F24C();
      sub_10000F260();
      v26 = 93;
    }
    else
    {
      sub_100009918();
      sub_100006920();
      sub_10000F140();
      v30 = sub_100009950();
      v31 = sub_10000F1C0(v30);
      sub_10000F2B0(v31, &qword_10001E400);
      v26 = 58;
    }
    sub_10000F424(v26);
    LogMessage.init(stringInterpolation:)(v0);
    sub_1000099D0();
    sub_10000F1D4();
    sub_100009AC8(0xD00000000000001ALL);
    v32 = sub_10000F478();
    sub_10000F480(v32, &qword_10001E400);
    sub_100006A34(v21);
  }
  else
  {
    v15 = sub_10000F2F4(v9, v13 + 2 * v11, v14);
    *(_OWORD *)(v15 + 16) = xmmword_1000134E0;
    v16 = type metadata accessor for RemoteEngagementViewController();
    v17 = sub_10000F494(v16);
    v18 = (id)AMSLogKey(v17);
    if (v18)
    {
      sub_100009A00((uint64_t)v18);

      sub_100009924();
      sub_100006920();
      sub_10000F140();
      v19 = sub_100009950();
      sub_10000F1C0(v19);
      sub_10000F450();
      sub_1000098EC();
      sub_10000F24C();
      sub_10000F450();
      v20 = 93;
    }
    else
    {
      sub_100009918();
      sub_100006920();
      sub_10000F140();
      v27 = sub_100009950();
      v28 = sub_10000F1C0(v27);
      sub_10000F2B0(v28, &qword_10001E400);
      v20 = 58;
    }
    sub_10000F424(v20);
    LogMessage.init(stringInterpolation:)(v0);
    sub_1000099D0();
    sub_10000F1D4();
    sub_10000F364();
    sub_100009AE0(22, v29);
    sub_100006BC0(v15);
  }
  sub_10000F378();
  if (v2)
    sub_10000F3DC();
  sub_10000F164();
}

uint64_t sub_10000AC58(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  int v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t isUniquelyReferenced_nonNull_native;
  int64_t v26;
  int v27;
  char v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  void (*v36)(_BYTE *, _QWORD);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[32];
  uint64_t v41;
  uint64_t v42;
  char v43;
  _QWORD *v44;

  if (result)
  {
    v1 = result;
    v2 = swift_bridgeObjectRetain(result);
    v3 = sub_10000F708(v2);
    if (!v3)
    {
      sub_100009AAC();
      v8 = &_swiftEmptyArrayStorage;
LABEL_27:
      v38 = sub_10000AEAC((uint64_t)v8);
      sub_100007E08(v38);
      return swift_bridgeObjectRelease(v38);
    }
    v4 = v3;
    v44 = &_swiftEmptyArrayStorage;
    sub_10000EE20(0, v3 & ~(v3 >> 63), 0);
    if ((v1 & 0xC000000000000001) != 0)
    {
      if (v1 >= 0)
        v5 = v1 & 0xFFFFFFFFFFFFFF8;
      else
        v5 = v1;
      result = __CocoaSet.startIndex.getter(v5);
      v7 = 1;
    }
    else
    {
      result = sub_100011DF4(v1);
      v7 = v9 & 1;
    }
    v41 = result;
    v42 = v6;
    v43 = v7;
    if ((v4 & 0x8000000000000000) == 0)
    {
      v10 = v1 & 0xFFFFFFFFFFFFFF8;
      if (v1 < 0)
        v10 = v1;
      v39 = v10;
      do
      {
        v12 = v41;
        v11 = v42;
        v13 = v43;
        v14 = sub_10000F410();
        sub_100011C04(v14, v15, v16, v17);
        v19 = v18;
        v20 = objc_msgSend(v18, "events");

        v21 = v44;
        result = swift_isUniquelyReferenced_nonNull_native(v44);
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_10000EE20(0, v21[2] + 1, 1);
          v21 = v44;
        }
        v23 = v21[2];
        v22 = v21[3];
        if (v23 >= v22 >> 1)
        {
          result = (uint64_t)sub_10000EE20((char *)(v22 > 1), v23 + 1, 1);
          v21 = v44;
        }
        v21[2] = v23 + 1;
        v21[v23 + 4] = v20;
        if ((v1 & 0xC000000000000001) != 0)
        {
          if ((v13 & 1) == 0)
            goto LABEL_29;
          v24 = __CocoaSet.Index.handleBitPattern.getter(v12, v11);
          if (v24)
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v24);
          else
            isUniquelyReferenced_nonNull_native = 1;
          v35 = sub_100005730(&qword_10001E8D8);
          v36 = (void (*)(_BYTE *, _QWORD))Set.Index._asCocoa.modify(v40, v35);
          __CocoaSet.formIndex(after:isUnique:)(v37, isUniquelyReferenced_nonNull_native, v39);
          v36(v40, 0);
        }
        else
        {
          v26 = sub_10000F410();
          v30 = sub_10000EF94(v26, v27, v28, v29);
          v32 = v31;
          v34 = v33;
          sub_10000F078(v12, v11, v13);
          v41 = v30;
          v42 = v32;
          v43 = v34 & 1;
        }
        --v4;
      }
      while (v4);
      sub_10000F078(v41, v42, v43);
      sub_100009AAC();
      v8 = v44;
      goto LABEL_27;
    }
    __break(1u);
LABEL_29:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000AEAC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  Swift::UInt v7;
  uint64_t v8;
  Swift::UInt v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = sub_10000F084();
  v4 = Set.init(minimumCapacity:)(v2, &type metadata for RemoteAlertButtonAction, v3);
  v11 = v4;
  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      v7 = *(_QWORD *)(a1 + 8 * i + 32);
      sub_10000E50C(&v10, v7);
    }
    swift_bridgeObjectRelease(a1);
    return v11;
  }
  else
  {
    v8 = v4;
    swift_bridgeObjectRelease(a1);
  }
  return v8;
}

void sub_10000AFC4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  objc_super v11;

  v11.receiver = v0;
  v11.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  v7 = sub_100006938((uint64_t)v11.super_class, "loadView", v1, v2, v3, v4, v5, v6, v11);
  v8 = sub_100006960((uint64_t)v7, "view");
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
    sub_1000068C8((uint64_t)v10, "setBackgroundColor:");

    sub_10000F284();
  }
  else
  {
    __break(1u);
  }
}

void sub_10000B07C()
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
  v7.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  sub_100006938((uint64_t)v7.super_class, "viewDidLoad", v1, v2, v3, v4, v5, v6, v7);
  sub_10000B480();
  sub_10000F2A8();
  sub_10000E46C(&qword_10001E8C0, (uint64_t (*)(uint64_t))type metadata accessor for RemoteEngagementPresenter);
  ViewControllerPresenter.viewDidLoad()();
  sub_10000F284();
}

void sub_10000B16C(char a1)
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  objc_msgSendSuper2(&v3, "viewDidAppear:", a1 & 1);
  sub_10000B8B8();
  sub_1000090B8();
  sub_10000F284();
}

uint64_t sub_10000B1F8(char a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v4 = type metadata accessor for ViewWillDisappearReason(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  sub_10000F2FC();
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  objc_msgSendSuper2(&v9, "viewWillDisappear:", a1 & 1);
  static ViewWillDisappearReason.inferred(for:)(v1);
  v6 = sub_10000F2A8();
  sub_10000E46C(&qword_10001E8C0, (uint64_t (*)(uint64_t))type metadata accessor for RemoteEngagementPresenter);
  ViewControllerPresenter.viewWillDisappear(forReason:)(v2, v6, v7);
  return sub_10000F3BC(v2, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
}

uint64_t sub_10000B30C(char a1, SEL *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  objc_msgSendSuper2(&v10, *a2, a1 & 1);
  v7 = sub_10000F2A8();
  sub_10000E46C(&qword_10001E8C0, (uint64_t (*)(uint64_t))type metadata accessor for RemoteEngagementPresenter);
  return a3(v7, v8);
}

void sub_10000B3E4()
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
  v7.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  sub_100006938((uint64_t)v7.super_class, "didReceiveMemoryWarning", v1, v2, v3, v4, v5, v6, v7);
  sub_10000F2A8();
  sub_10000E46C(&qword_10001E8C0, (uint64_t (*)(uint64_t))type metadata accessor for RemoteEngagementPresenter);
  ViewControllerPresenter.viewDidReceiveMemoryWarning()();
  sub_10000F284();
}

void sub_10000B480()
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
  _QWORD v9[5];

  v2 = sub_100005730(&qword_10001E898);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  sub_10000F32C();
  v4 = *(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_presenter)
                 + 16);
  v5 = sub_100009AF4((uint64_t)&unk_100018F18);
  sub_10000F214(v5);
  v6 = sub_100005730(&qword_10001E8A0);
  sub_10000E3E0(&qword_10001E8A8, &qword_10001E8A0);
  v8 = v7;
  swift_retain(v4);
  dispatch thunk of static EventEmitter.defaultScheduler.getter(v9, v6, v8);
  EventEmitter.addObserver(on:singleUse:_:)(v9, 0, sub_10000E3D8, v5, v6, v8);
  sub_10000F370();
  sub_10000F2E0();
  sub_100005AE4(v9);
  sub_10000F3BC(v1, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  sub_10000F1AC();
}

void sub_10000B588(uint64_t a1, uint64_t a2)
{
  uint64_t Strong;
  void *v4;
  _BYTE v5[24];
  _BYTE v6[48];

  sub_10000E0E4(a1, (uint64_t)v6);
  a2 += 16;
  swift_beginAccess(a2, v5, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a2);
  if (Strong)
  {
    v4 = (void *)Strong;
    sub_10000DB8C();

  }
}

void sub_10000B5E8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  __n128 *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];

  sub_1000099C8();
  sub_100009980();
  __chkstk_darwin();
  v0 = (void *)sub_10000F290();
  if (v0)
  {
    v1 = (uint64_t)v0;
    objc_msgSend(v0, "setAllowsAlertStacking:", 1);
    sub_10000F238(v1);
  }
  else
  {
    sub_100005730((uint64_t *)&unk_10001E740);
    v2 = sub_1000099D8();
    v3 = (__n128 *)sub_10000F1F0(v2);
    v4 = sub_10000F4AC(v3, (__n128)xmmword_1000134E0);
    v5 = sub_10000F3C4(v4);
    v6 = (id)AMSLogKey(v5);
    if (v6)
    {
      sub_100009A00((uint64_t)v6);
      sub_10000F404();
      sub_100009924();
      sub_10000F1E0();
      sub_1000098AC(v12);
      v7 = sub_100009950();
      sub_10000F198(v7);
      sub_10000F254();
      sub_1000098EC();
      sub_10000F2C4();
      sub_10000F254();
      v8 = 93;
    }
    else
    {
      sub_100009918();
      sub_10000F1E0();
      sub_1000098AC(v12);
      v9 = sub_100009950();
      v10 = sub_10000F198(v9);
      sub_10000F35C(v10, &qword_10001E400);
      v8 = 58;
    }
    sub_10000F438(v8);
    sub_10000F488();
    sub_1000099D0();
    sub_100005AE4(v12);
    sub_10000F364();
    sub_100009AE0(62, v11);
    sub_100006A34((uint64_t)v3);
    sub_100009AAC();
    sub_10000F1AC();
  }
}

void sub_10000B750()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  __n128 *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];

  sub_1000099C8();
  sub_100009980();
  __chkstk_darwin();
  v0 = (void *)sub_10000F290();
  if (v0)
  {
    v1 = (uint64_t)v0;
    objc_msgSend(v0, "setDesiredHardwareButtonEvents:", 16);
    sub_10000F238(v1);
  }
  else
  {
    sub_100005730((uint64_t *)&unk_10001E740);
    v2 = sub_1000099D8();
    v3 = (__n128 *)sub_10000F1F0(v2);
    v4 = sub_10000F4AC(v3, (__n128)xmmword_1000134E0);
    v5 = sub_10000F3C4(v4);
    v6 = (id)AMSLogKey(v5);
    if (v6)
    {
      sub_100009A00((uint64_t)v6);
      sub_10000F404();
      sub_100009924();
      sub_10000F1E0();
      sub_1000098AC(v12);
      v7 = sub_100009950();
      sub_10000F198(v7);
      sub_10000F254();
      sub_1000098EC();
      sub_10000F2C4();
      sub_10000F254();
      v8 = 93;
    }
    else
    {
      sub_100009918();
      sub_10000F1E0();
      sub_1000098AC(v12);
      v9 = sub_100009950();
      v10 = sub_10000F198(v9);
      sub_10000F35C(v10, &qword_10001E400);
      v8 = 58;
    }
    sub_10000F438(v8);
    sub_10000F488();
    sub_1000099D0();
    sub_100005AE4(v12);
    sub_10000F364();
    sub_100009AE0(61, v11);
    sub_100006A34((uint64_t)v3);
    sub_100009AAC();
    sub_10000F1AC();
  }
}

void sub_10000B8B8()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[3];
  uint64_t v24;

  sub_1000099C8();
  sub_100009980();
  __chkstk_darwin(v1);
  sub_100009A28();
  v2 = objc_msgSend(v0, "view");
  if (!v2)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  v3 = v2;
  v4 = objc_msgSend(v2, "window");

  if (v4)
  {
    objc_opt_self(UIColor);
    v5 = v4;
    v6 = sub_100006960((uint64_t)v5, "systemBlueColor");
    sub_1000068C8((uint64_t)v6, "setTintColor:");

    v7 = objc_msgSend(v5, "_rootSheetPresentationController");
    if (v7)
    {
      v22 = v7;
      objc_msgSend(v7, "_setShouldScaleDownBehindDescendantSheets:", 0);

      return;
    }
    goto LABEL_10;
  }
  v8 = sub_100005730((uint64_t *)&unk_10001E740);
  v9 = sub_1000099D8();
  v10 = swift_allocObject(v8, ((*(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80))+ 2 * *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80) | 7);
  *(_OWORD *)(v10 + 16) = xmmword_1000134E0;
  v24 = type metadata accessor for RemoteEngagementViewController();
  v23[0] = v0;
  v11 = (id)AMSLogKey(v0);
  if (v11)
  {
    v12 = v11;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v11);

    sub_100009924();
    sub_100009958();
    v13 = v24;
    v14 = sub_100006850(v23, v24);
    v15 = sub_100009910((uint64_t)v14, v13);
    swift_getMetatypeMetadata(v15);
    sub_10000F2C4();
    sub_10000F3B0();
    sub_1000098EC();
    sub_10000F2C4();
    sub_10000F3B0();
    v16 = 93;
  }
  else
  {
    sub_100009918();
    sub_100009958();
    v17 = v24;
    v18 = sub_100006850(v23, v24);
    v19 = sub_100009910((uint64_t)v18, v17);
    swift_getMetatypeMetadata(v19);
    v20 = sub_10000F2C4();
    sub_10000F35C(v20, &qword_10001E400);
    v16 = 58;
  }
  sub_10000F430(v16);
  LogMessage.init(stringInterpolation:)(v0);
  sub_1000099D0();
  sub_100005AE4(v23);
  sub_10000F364();
  sub_100009AE0(50, v21);
  sub_100006A34(v10);
  swift_bridgeObjectRelease(v10);
  sub_10000F1AC();
}

void sub_10000BB54(uint64_t a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
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
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;

  v3 = objc_msgSend(objc_allocWithZone((Class)NSXPCListenerEndpoint), "init");
  objc_msgSend(v3, "_setEndpoint:", a1);
  sub_100009B70((uint64_t)objc_msgSend(objc_allocWithZone((Class)NSXPCConnection), "initWithListenerEndpoint:", v3));
  v4 = OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection;
  v5 = *(void **)(v1 + OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection);
  if (!v5)
    goto LABEL_7;
  objc_opt_self(NSXPCInterface);
  v6 = v5;
  v7 = sub_10000F380();
  sub_10000F278((uint64_t)v7, "setExportedInterface:");

  v8 = *(void **)(v1 + v4);
  if (!v8)
    goto LABEL_7;
  objc_opt_self(NSXPCInterface);
  v9 = v8;
  v10 = sub_10000F380();
  sub_10000F278((uint64_t)v10, "setRemoteObjectInterface:");

  v11 = *(void **)(v1 + v4);
  if (!v11)
    goto LABEL_8;
  objc_msgSend(v11, "setExportedObject:", v1);
  if (!*(_QWORD *)(v1 + v4))
    goto LABEL_7;
  v12 = sub_100009AF4((uint64_t)&unk_100018F18);
  v13 = sub_10000F214(v12);
  sub_10000F398(v13, v14, v15, v16, v17, v18, v19, v20, (uint64_t)_NSConcreteStackBlock);
  v21 = sub_10000F3E4();
  v22 = sub_10000F370();
  sub_10000F278(v22, "setInvalidationHandler:");
  sub_10000F470();

  if (*(_QWORD *)(v1 + v4))
  {
    v23 = sub_100009AF4((uint64_t)&unk_100018F18);
    v24 = sub_10000F214(v23);
    sub_10000F398(v24, v25, v26, v27, v28, v29, v30, v31, (uint64_t)_NSConcreteStackBlock);
    v32 = sub_10000F3E4();
    v33 = sub_10000F370();
    sub_10000F278(v33, "setInterruptionHandler:");
    sub_10000F470();

    v11 = *(void **)(v1 + v4);
  }
  else
  {
LABEL_7:
    v11 = 0;
  }
LABEL_8:
  objc_msgSend(v11, "resume");
  v34 = (void *)sub_100009B7C();
  if (v34)
  {
    v35 = v34;
    objc_msgSend(v34, "initializeClientToViewServiceConnection");
    swift_unknownObjectRelease(v35);
  }

}

void sub_10000BDB0(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t Strong;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Swift::String v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t DynamicType;
  Swift::String v19;
  uint64_t v20;
  Swift::String v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD v27[3];
  void *MetatypeMetadata;
  _QWORD v29[3];
  uint64_t v30;
  _BYTE v31[24];

  type metadata accessor for LogMessage.StringInterpolation(0);
  __chkstk_darwin();
  v3 = (char *)&v27[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v31, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    v5 = (void *)Strong;
    v6 = sub_100005730((uint64_t *)&unk_10001E740);
    v7 = type metadata accessor for LogMessage(0);
    v8 = swift_allocObject(v6, ((*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80))+ 2 * *(_QWORD *)(*(_QWORD *)(v7 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80) | 7);
    *(_OWORD *)(v8 + 16) = xmmword_1000134E0;
    v30 = type metadata accessor for RemoteEngagementViewController();
    v29[0] = v5;
    v9 = v5;
    v10 = (id)AMSLogKey(v9);
    if (v10)
    {
      v11 = v10;
      v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
      v14 = v13;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4, 2);
      v15._countAndFlagsBits = 0;
      v15._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v15);
      v16 = v30;
      v17 = sub_100006850(v29, v30);
      DynamicType = swift_getDynamicType(v17, v16, 1);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v27[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v27);
      sub_10000E160((uint64_t)v27, &qword_10001E400);
      v19._countAndFlagsBits = 5972026;
      v19._object = (void *)0xE300000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v19);
      MetatypeMetadata = &type metadata for String;
      v27[0] = v12;
      v27[1] = v14;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v27);
      sub_10000E160((uint64_t)v27, &qword_10001E400);
      v20 = 93;
    }
    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1, 1);
      v21._countAndFlagsBits = 0;
      v21._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v21);
      v22 = v30;
      v23 = sub_100006850(v29, v30);
      v24 = swift_getDynamicType(v23, v22, 1);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v27[0] = v24;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v27);
      sub_10000E160((uint64_t)v27, &qword_10001E400);
      v20 = 58;
    }
    v25 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v20);
    LogMessage.init(stringInterpolation:)(v3);
    type metadata accessor for Log();
    sub_100005AE4(v29);
    LogMessage.init(stringLiteral:)(0xD00000000000001DLL, 0x8000000100013CD0);
    sub_100006A34(v8);
    swift_bridgeObjectRelease(v8);
    sub_100009B70(0);

  }
}

void sub_10000C03C(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t Strong;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Swift::String v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t DynamicType;
  Swift::String v19;
  uint64_t v20;
  Swift::String v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD v27[3];
  void *MetatypeMetadata;
  _QWORD v29[3];
  uint64_t v30;
  _BYTE v31[24];

  type metadata accessor for LogMessage.StringInterpolation(0);
  __chkstk_darwin();
  v3 = (char *)&v27[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v31, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    v5 = (void *)Strong;
    v6 = sub_100005730((uint64_t *)&unk_10001E740);
    v7 = type metadata accessor for LogMessage(0);
    v8 = swift_allocObject(v6, ((*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80))+ 2 * *(_QWORD *)(*(_QWORD *)(v7 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80) | 7);
    *(_OWORD *)(v8 + 16) = xmmword_1000134E0;
    v30 = type metadata accessor for RemoteEngagementViewController();
    v29[0] = v5;
    v9 = v5;
    v10 = (id)AMSLogKey(v9);
    if (v10)
    {
      v11 = v10;
      v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
      v14 = v13;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4, 2);
      v15._countAndFlagsBits = 0;
      v15._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v15);
      v16 = v30;
      v17 = sub_100006850(v29, v30);
      DynamicType = swift_getDynamicType(v17, v16, 1);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v27[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v27);
      sub_10000E160((uint64_t)v27, &qword_10001E400);
      v19._countAndFlagsBits = 5972026;
      v19._object = (void *)0xE300000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v19);
      MetatypeMetadata = &type metadata for String;
      v27[0] = v12;
      v27[1] = v14;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v27);
      sub_10000E160((uint64_t)v27, &qword_10001E400);
      v20 = 93;
    }
    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1, 1);
      v21._countAndFlagsBits = 0;
      v21._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v21);
      v22 = v30;
      v23 = sub_100006850(v29, v30);
      v24 = swift_getDynamicType(v23, v22, 1);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v27[0] = v24;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v27);
      sub_10000E160((uint64_t)v27, &qword_10001E400);
      v20 = 58;
    }
    v25 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v20);
    LogMessage.init(stringInterpolation:)(v3);
    type metadata accessor for Log();
    sub_100005AE4(v29);
    LogMessage.init(stringLiteral:)(0xD00000000000001DLL, 0x8000000100013CB0);
    sub_100006A34(v8);
    swift_bridgeObjectRelease(v8);
    objc_msgSend(*(id *)&v9[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection], "invalidate");
    sub_100009B70(0);

  }
}

id sub_10000C2E0()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v1 = *(void **)&v0[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task];
  if (v1)
    objc_msgSend(v1, "cancel");
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  return sub_100006938((uint64_t)v9.super_class, "dealloc", v2, v3, v4, v5, v6, v7, v9);
}

void sub_10000C394(uint64_t a1, void *a2, uint64_t a3)
{
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = a1;
  v6 = sub_100006960(a1, "presentedViewController");
  if (v6)
  {
    v14 = v6;
    if (a2)
    {
      a2 = sub_10000F398((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)_NSConcreteStackBlock);
      swift_retain(a3);
      sub_10000F2E0();
    }
    objc_msgSend(v14, "dismissViewControllerAnimated:completion:", v5 & 1, a2);
    _Block_release(a2);

  }
  else if (a2)
  {
    ((void (*)(void))a2)();
  }
  sub_10000F2CC();
}

void sub_10000C45C()
{
  void *v0;
  char v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  void *v19;

  sub_10000F220();
  v2 = v1;
  sub_1000099C8();
  sub_100009980();
  __chkstk_darwin();
  sub_100009A28();
  sub_100005730((uint64_t *)&unk_10001E740);
  v3 = sub_1000099D8();
  v4 = sub_10000F4B8(((*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80))+ 2 * *(_QWORD *)(*(_QWORD *)(v3 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80));
  *(_OWORD *)(v4 + 16) = xmmword_1000134E0;
  v19 = (void *)type metadata accessor for RemoteEngagementViewController();
  v18[0] = v0;
  v5 = v0;
  v6 = (id)AMSLogKey(v5);
  if (v6)
  {
    v7 = v6;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v6);

    sub_100009924();
    sub_100009958();
    v8 = (uint64_t)v19;
    v9 = sub_100006850(v18, (uint64_t)v19);
    sub_100009910((uint64_t)v9, v8);
    swift_getMetatypeMetadata();
    sub_10000F24C();
    sub_10000F444();
    sub_1000098EC();
    sub_10000F24C();
    sub_10000F444();
    v10 = 93;
  }
  else
  {
    sub_100009918();
    sub_100009958();
    v11 = (uint64_t)v19;
    v12 = sub_100006850(v18, (uint64_t)v19);
    sub_100009910((uint64_t)v12, v11);
    swift_getMetatypeMetadata();
    v13 = sub_10000F24C();
    sub_10000F2B0(v13, &qword_10001E400);
    v10 = 58;
  }
  sub_10000F430(v10);
  sub_10000F4A0();
  sub_1000099D0();
  sub_10000F1D4();
  v19 = &type metadata for String;
  v18[0] = 0xD000000000000026;
  v18[1] = 0x8000000100013C20;
  v14 = sub_10000F478();
  sub_10000F480(v14, &qword_10001E400);
  sub_100006BE0(v4);
  sub_10000F378();
  v15 = sub_100009AF4((uint64_t)&unk_100018F18);
  swift_unknownObjectWeakInit(v15 + 16, v5);
  v16 = sub_10000F190((uint64_t)&unk_100019058, 25);
  *(_QWORD *)(v16 + 16) = v15;
  v17 = v2 & 1;
  *(_BYTE *)(v16 + 24) = v17;
  swift_retain(v15);
  sub_10000C394(v17, sub_10000E3B4, v16);
  sub_10000F370();
  sub_10000F2E0();
  sub_10000F164();
}

void sub_10000C680(uint64_t a1, char a2)
{
  uint64_t v4;
  char *v5;
  uint64_t Strong;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Swift::String v17;
  void *v18;
  _QWORD *v19;
  uint64_t DynamicType;
  Swift::String v21;
  uint64_t v22;
  Swift::String v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  _QWORD aBlock[3];
  void *v34;
  void *(*v35)();
  uint64_t v36;
  _QWORD v37[3];
  void *MetatypeMetadata;
  char v39[24];

  type metadata accessor for LogMessage.StringInterpolation(0);
  __chkstk_darwin();
  v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v39, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    v7 = (void *)Strong;
    v8 = sub_100005730((uint64_t *)&unk_10001E740);
    v9 = type metadata accessor for LogMessage(0);
    v10 = swift_allocObject(v8, ((*(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80))+ 2 * *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80) | 7);
    *(_OWORD *)(v10 + 16) = xmmword_1000134E0;
    v34 = (void *)type metadata accessor for RemoteEngagementViewController();
    aBlock[0] = v7;
    v11 = v7;
    v12 = (id)AMSLogKey(v11);
    if (v12)
    {
      v13 = v12;
      v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
      v16 = v15;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4, 2);
      v17._countAndFlagsBits = 0;
      v17._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v17);
      v18 = v34;
      v19 = sub_100006850(aBlock, (uint64_t)v34);
      DynamicType = swift_getDynamicType(v19, v18, 1);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v37[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v37);
      sub_10000E160((uint64_t)v37, &qword_10001E400);
      v21._countAndFlagsBits = 5972026;
      v21._object = (void *)0xE300000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v21);
      MetatypeMetadata = &type metadata for String;
      v37[0] = v14;
      v37[1] = v16;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v37);
      sub_10000E160((uint64_t)v37, &qword_10001E400);
      v22 = 93;
    }
    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1, 1);
      v23._countAndFlagsBits = 0;
      v23._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v23);
      v24 = v34;
      v25 = sub_100006850(aBlock, (uint64_t)v34);
      v26 = swift_getDynamicType(v25, v24, 1);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v37[0] = v26;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v37);
      sub_10000E160((uint64_t)v37, &qword_10001E400);
      v22 = 58;
    }
    v27 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v22);
    LogMessage.init(stringInterpolation:)(v5);
    type metadata accessor for Log();
    sub_100005AE4(aBlock);
    LogMessage.init(stringLiteral:)(0xD000000000000021, 0x8000000100013C50);
    sub_100006BE0(v10);
    swift_bridgeObjectRelease(v10);
    v28 = swift_allocObject(&unk_100019080, 24, 7);
    *(_QWORD *)(v28 + 16) = v11;
    v35 = sub_10000E3C0;
    v36 = v28;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100009B44;
    v34 = &unk_100019098;
    v29 = _Block_copy(aBlock);
    v30 = v36;
    v31 = v11;
    swift_release(v30);
    objc_msgSend(v31, "dismissViewControllerAnimated:completion:", a2 & 1, v29);
    _Block_release(v29);

  }
}

void *sub_10000C99C(void *a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t DynamicType;
  Swift::String v16;
  uint64_t v17;
  Swift::String v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *result;
  void *v26;
  _QWORD v27[3];
  void *MetatypeMetadata;
  _QWORD v29[3];
  uint64_t v30;

  type metadata accessor for LogMessage.StringInterpolation(0);
  __chkstk_darwin();
  v3 = (char *)v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100005730((uint64_t *)&unk_10001E740);
  v5 = type metadata accessor for LogMessage(0);
  v6 = swift_allocObject(v4, ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80))+ 2 * *(_QWORD *)(*(_QWORD *)(v5 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) | 7);
  *(_OWORD *)(v6 + 16) = xmmword_1000134E0;
  v30 = type metadata accessor for RemoteEngagementViewController();
  v29[0] = a1;
  v7 = (id)AMSLogKey(a1);
  if (v7)
  {
    v8 = v7;
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    v11 = v10;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4, 2);
    v12._countAndFlagsBits = 0;
    v12._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v12);
    v13 = v30;
    v14 = sub_100006850(v29, v30);
    DynamicType = swift_getDynamicType(v14, v13, 1);
    MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v27[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v27);
    sub_10000E160((uint64_t)v27, &qword_10001E400);
    v16._countAndFlagsBits = 5972026;
    v16._object = (void *)0xE300000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v16);
    MetatypeMetadata = &type metadata for String;
    v27[0] = v9;
    v27[1] = v11;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v27);
    sub_10000E160((uint64_t)v27, &qword_10001E400);
    v17 = 93;
  }
  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1, 1);
    v18._countAndFlagsBits = 0;
    v18._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v18);
    v19 = v30;
    v20 = sub_100006850(v29, v30);
    v21 = swift_getDynamicType(v20, v19, 1);
    MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v27[0] = v21;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v27);
    sub_10000E160((uint64_t)v27, &qword_10001E400);
    v17 = 58;
  }
  v22 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v17);
  LogMessage.init(stringInterpolation:)(v3);
  type metadata accessor for Log();
  sub_100005AE4(v29);
  LogMessage.init(stringLiteral:)(0xD000000000000027, 0x8000000100013C80);
  sub_100006BE0(v6);
  swift_bridgeObjectRelease(v6);
  v23 = (void *)sub_100009F9C();
  if (v23)
  {
    v24 = v23;
    objc_msgSend(v23, "dismiss");
    swift_unknownObjectRelease(v24);
  }
  result = (void *)sub_100009F9C();
  if (result)
  {
    v26 = result;
    objc_msgSend(result, "invalidate");
    return (void *)swift_unknownObjectRelease(v26);
  }
  return result;
}

void sub_10000CC38(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
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
  uint64_t v16;

  v4 = sub_100009B7C();
  if (v4)
  {
    v5 = (void *)v4;
    if (a2)
      a2 = (void *)_convertErrorToNSError(_:)(a2);
    v6 = sub_100009AF4((uint64_t)&unk_100018F18);
    v7 = sub_10000F214(v6);
    v16 = v6;
    v15 = sub_10000F398(v7, v8, v9, v10, v11, v12, v13, v14, (uint64_t)_NSConcreteStackBlock);
    swift_release(v16);
    objc_msgSend(v5, "engagementTaskDidFinishWithResult:error:completion:", a1, a2, v15);
    _Block_release(v15);

    sub_10000A3E4(0);
    swift_unknownObjectRelease(v5);
    sub_10000F2CC();
  }
  else
  {
    sub_10000CD78();
  }
}

void sub_10000CD28(uint64_t a1)
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
    sub_10000CD78();

  }
}

void sub_10000CD78()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  sub_10000F220();
  v22 = v3;
  v23 = v4;
  v5 = v0;
  v6 = ((uint64_t (*)(_QWORD))type metadata accessor for DispatchWorkItemFlags)(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  sub_10000F32C();
  v8 = ((uint64_t (*)(_QWORD))type metadata accessor for DispatchQoS)(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  sub_10000F314();
  if (objc_msgSend((id)objc_opt_self(NSThread), "isMainThread"))
  {
    sub_10000C45C();
  }
  else
  {
    sub_100009218(0, &qword_10001E818, OS_dispatch_queue_ptr);
    v19 = (void *)((uint64_t (*)(void))static OS_dispatch_queue.main.getter)();
    v10 = sub_100009AF4((uint64_t)&unk_100018FE0);
    *(_QWORD *)(v10 + 16) = v0;
    v20[4] = sub_10000E340;
    v21 = v10;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 1107296256;
    v20[2] = sub_100009B44;
    v20[3] = &unk_100018FF8;
    v11 = _Block_copy(v20);
    v12 = v21;
    v13 = v5;
    v14 = swift_release(v12);
    ((void (*)(uint64_t))static DispatchQoS.unspecified.getter)(v14);
    v20[0] = &_swiftEmptyArrayStorage;
    sub_10000E46C(&qword_10001E820, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    v16 = v15;
    v17 = sub_100005730(&qword_10001E828);
    sub_10000E3E0(&qword_10001E830, &qword_10001E828);
    ((void (*)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))dispatch thunk of SetAlgebra.init<A>(_:))(v20, v17, v18, v6, v16);
    ((void (*)(_QWORD, uint64_t, uint64_t, void *))OS_dispatch_queue.async(group:qos:flags:execute:))(0, v2, v1, v11);
    _Block_release(v11);

    sub_10000F3BC(v1, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v8);
    sub_10000F164();
  }
}

void sub_10000CF78()
{
  sub_10000C45C();
}

uint64_t sub_10000CF9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;

  v6 = sub_100009AF4((uint64_t)&unk_100018F18);
  sub_10000F214(v6);
  v7 = (_QWORD *)sub_10000F190((uint64_t)&unk_100018FB8, 48);
  v7[2] = v6;
  v7[3] = a1;
  v7[4] = a2;
  v7[5] = a3;
  swift_retain(v6);
  swift_errorRetain(a1);
  sub_100006840(a2, a3);
  sub_10000C394(1, sub_10000E318, (uint64_t)v7);
  sub_10000F2E0();
  return swift_release(v7);
}

void sub_10000D038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t Strong;
  void *v9;
  id v10;
  _BYTE v11[24];

  v7 = a1 + 16;
  swift_beginAccess(a1 + 16, v11, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v7);
  if (Strong)
  {
    v9 = (void *)Strong;
    objc_allocWithZone((Class)type metadata accessor for ErrorViewController());
    swift_errorRetain(a2);
    sub_100006840(a3, a4);
    v10 = sub_100005BC0(a2, a3, a4);
    objc_msgSend(v9, "presentViewController:animated:completion:", v10, 1, 0);

  }
}

void sub_10000D0FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  void *v18;
  void (*v19)(uint64_t, char *, uint64_t);
  id v20;
  NSURL *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  _QWORD *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;

  sub_10000F220();
  v30 = v1;
  v31 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  sub_100005730(&qword_10001E800);
  sub_100009980();
  ((void (*)(void))__chkstk_darwin)();
  sub_100009A28();
  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = ((uint64_t (*)(void))__chkstk_darwin)();
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v30 - v15;
  v17 = objc_msgSend(v9, "URL");
  if (!v17)
  {
    sub_10000F464(v0, 1);
    goto LABEL_5;
  }
  v18 = v17;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v19 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
  v19(v0, v14, v10);
  sub_10000F464(v0, 0);
  if (sub_10000E204(v0, 1, v10) == 1)
  {
LABEL_5:
    sub_10000E160(v0, &qword_10001E800);
    goto LABEL_6;
  }
  v19((uint64_t)v16, (char *)v0, v10);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  v20 = objc_allocWithZone((Class)AMSCampaignAttributionTask);
  swift_unknownObjectRetain(v7);
  v22 = sub_10000E210((uint64_t)v14, v7, v21);
  objc_msgSend(v22, "setClientInfo:", v5);
  v23 = objc_msgSend(v9, "account");
  objc_msgSend(v22, "setAccount:", v23);

  v25 = sub_100006960(v24, "perform");
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
LABEL_6:
  v26 = sub_100009AF4((uint64_t)&unk_100018F18);
  swift_unknownObjectWeakInit(v26 + 16, v31);
  v27 = (_QWORD *)sub_10000F190((uint64_t)&unk_100018F40, 64);
  v27[2] = v26;
  v27[3] = v9;
  v27[4] = v7;
  v27[5] = v5;
  v27[6] = v30;
  v27[7] = v3;
  swift_unknownObjectRetain(v7);
  swift_retain(v26);
  v28 = v9;
  v29 = v5;
  swift_retain(v3);
  sub_10000C394(1, sub_10000E1F4, (uint64_t)v27);
  swift_release(v26);
  swift_release(v27);
  sub_10000F164();
}

void sub_10000D374(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  char *v13;
  uint64_t Strong;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  Swift::String v31;
  void *v32;
  _QWORD *v33;
  uint64_t DynamicType;
  Swift::String v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  Swift::String v46;
  void *v47;
  _QWORD *v48;
  uint64_t v49;
  Swift::String v50;
  uint64_t v51;
  Swift::String v52;
  void *v53;
  _QWORD *v54;
  uint64_t v55;
  unint64_t v56;
  Swift::String v57;
  void *v58;
  _QWORD *v59;
  uint64_t v60;
  unint64_t v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  _QWORD *v66;
  void *v67;
  _QWORD *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD aBlock[3];
  void *v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  void *MetatypeMetadata;
  char v82[24];

  type metadata accessor for LogMessage.StringInterpolation(0);
  __chkstk_darwin();
  v13 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v82, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a1);
  if (Strong)
  {
    v15 = (void *)Strong;
    v16 = *(void **)(Strong + OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task);
    if (v16)
    {
      v17 = sub_100005730((uint64_t *)&unk_10001E740);
      v18 = *(_QWORD *)(type metadata accessor for LogMessage(0) - 8);
      v19 = *(_QWORD *)(v18 + 72);
      v20 = *(unsigned __int8 *)(v18 + 80);
      v74 = v19;
      v21 = swift_allocObject(v17, ((v20 + 32) & ~v20) + 2 * v19, v20 | 7);
      *(_OWORD *)(v21 + 16) = xmmword_1000134E0;
      v76 = (void *)type metadata accessor for RemoteEngagementViewController();
      aBlock[0] = v15;
      v22 = v15;
      v23 = v16;
      v24 = (id)AMSLogKey(v23);
      if (v24)
      {
        v25 = v24;
        v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
        v27 = a6;
        v28 = a5;
        v30 = v29;

        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4, 2);
        v31._countAndFlagsBits = 0;
        v31._object = (void *)0xE000000000000000;
        LogMessage.StringInterpolation.appendLiteral(_:)(v31);
        v32 = v76;
        v33 = sub_100006850(aBlock, (uint64_t)v76);
        DynamicType = swift_getDynamicType(v33, v32, 1);
        MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v79 = DynamicType;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v79);
        sub_10000E160((uint64_t)&v79, &qword_10001E400);
        v35._countAndFlagsBits = 5972026;
        v35._object = (void *)0xE300000000000000;
        LogMessage.StringInterpolation.appendLiteral(_:)(v35);
        MetatypeMetadata = &type metadata for String;
        v79 = v26;
        v80 = v30;
        a5 = v28;
        a6 = v27;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v79);
        sub_10000E160((uint64_t)&v79, &qword_10001E400);
        v36 = 93;
      }
      else
      {
        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1, 1);
        v52._countAndFlagsBits = 0;
        v52._object = (void *)0xE000000000000000;
        LogMessage.StringInterpolation.appendLiteral(_:)(v52);
        v53 = v76;
        v54 = sub_100006850(aBlock, (uint64_t)v76);
        v55 = swift_getDynamicType(v54, v53, 1);
        MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v79 = v55;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v79);
        sub_10000E160((uint64_t)&v79, &qword_10001E400);
        v36 = 58;
      }
      v56 = 0xE100000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v36);
      LogMessage.init(stringInterpolation:)(v13);
      type metadata accessor for Log();
      sub_100005AE4(aBlock);
      LogMessage.init(stringLiteral:)(0xD000000000000025, 0x8000000100013BF0);
      sub_100006BC0(v21);
      swift_bridgeObjectRelease(v21);
    }
    else
    {
      v74 = a5;
      v37 = sub_100005730((uint64_t *)&unk_10001E740);
      v38 = *(_QWORD *)(type metadata accessor for LogMessage(0) - 8);
      v39 = *(_QWORD *)(v38 + 72);
      v40 = *(unsigned __int8 *)(v38 + 80);
      v73 = v39;
      v41 = swift_allocObject(v37, ((v40 + 32) & ~v40) + 2 * v39, v40 | 7);
      *(_OWORD *)(v41 + 16) = xmmword_1000134E0;
      v76 = (void *)type metadata accessor for RemoteEngagementViewController();
      aBlock[0] = v15;
      v72 = v15;
      v42 = (id)AMSLogKey(v72);
      if (v42)
      {
        v43 = v42;
        v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(v42);
        v71 = v45;

        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4, 2);
        v46._countAndFlagsBits = 0;
        v46._object = (void *)0xE000000000000000;
        LogMessage.StringInterpolation.appendLiteral(_:)(v46);
        v47 = v76;
        v48 = sub_100006850(aBlock, (uint64_t)v76);
        v49 = swift_getDynamicType(v48, v47, 1);
        MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v79 = v49;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v79);
        sub_10000E160((uint64_t)&v79, &qword_10001E400);
        v50._countAndFlagsBits = 5972026;
        v50._object = (void *)0xE300000000000000;
        LogMessage.StringInterpolation.appendLiteral(_:)(v50);
        MetatypeMetadata = &type metadata for String;
        v79 = v44;
        v80 = v71;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v79);
        sub_10000E160((uint64_t)&v79, &qword_10001E400);
        v51 = 93;
      }
      else
      {
        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1, 1);
        v57._countAndFlagsBits = 0;
        v57._object = (void *)0xE000000000000000;
        LogMessage.StringInterpolation.appendLiteral(_:)(v57);
        v58 = v76;
        v59 = sub_100006850(aBlock, (uint64_t)v76);
        v60 = swift_getDynamicType(v59, v58, 1);
        MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v79 = v60;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v79);
        sub_10000E160((uint64_t)&v79, &qword_10001E400);
        v51 = 58;
      }
      a5 = v74;
      v61 = 0xE100000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v51);
      LogMessage.init(stringInterpolation:)(v13);
      type metadata accessor for Log();
      sub_100005AE4(aBlock);
      LogMessage.init(stringLiteral:)(0xD00000000000001CLL, 0x8000000100013BA0);
      sub_100006BC0(v41);
      swift_bridgeObjectRelease(v41);
      sub_100009218(0, &qword_10001E808, AMSUIEngagementTask_ptr);
      v62 = v72;
      v63 = a2;
      swift_unknownObjectRetain(a3);
      v23 = sub_10000D9A4(v63, a3, v62);
      objc_msgSend(v23, "setAllowMultiplePresentations:", 1);
      objc_msgSend(v23, "setClientInfo:", a4);
      sub_10000A3E4((uint64_t)v23);
    }
    v64 = objc_msgSend(v23, "presentEngagement");
    v65 = swift_allocObject(&unk_100018F18, 24, 7);
    swift_unknownObjectWeakInit(v65 + 16, v15);
    v66 = (_QWORD *)swift_allocObject(&unk_100018F68, 48, 7);
    v66[2] = v65;
    v66[3] = v23;
    v66[4] = a5;
    v66[5] = a6;
    v77 = sub_10000E2BC;
    v78 = v66;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000DB18;
    v76 = &unk_100018F80;
    v67 = _Block_copy(aBlock);
    v68 = v78;
    v69 = v23;
    swift_retain(a6);
    swift_release(v68);
    objc_msgSend(v64, "addFinishBlock:", v67);

    _Block_release(v67);
  }
}

id sub_10000D9A4(void *a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v7;

  v7 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3)), "initWithRequest:bag:presentingViewController:", a1, a2, a3);

  swift_unknownObjectRelease(a2);
  return v7;
}

uint64_t sub_10000DA0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v9;
  uint64_t Strong;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  _BYTE v18[24];

  v9 = a3 + 16;
  swift_beginAccess(a3 + 16, v18, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v9);
  if (Strong)
  {
    v11 = (void *)Strong;
    v12 = *(void **)(Strong + OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task);
    v13 = v12;

    if (v12)
    {
      sub_100009218(0, &qword_10001E810, NSObject_ptr);
      if ((static NSObject.== infix(_:_:)(v13, a4) & 1) != 0)
      {
        swift_beginAccess(v9, &v17, 0, 0);
        v14 = swift_unknownObjectWeakLoadStrong(v9);
        if (v14)
        {
          v15 = (void *)v14;
          sub_10000A3E4(0);

        }
      }

    }
  }
  return a5(a1, a2);
}

void sub_10000DB18(uint64_t a1, void *a2, void *a3)
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

void sub_10000DB8C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];
  void *MetatypeMetadata;
  id v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  char v36;

  sub_10000F220();
  v2 = v1;
  sub_1000099C8();
  sub_100009980();
  __chkstk_darwin(v3);
  sub_100009A28();
  sub_100005730((uint64_t *)&unk_10001E740);
  v4 = *(_QWORD *)(sub_1000099D8() - 8);
  v5 = sub_10000F4B8(((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ 3 * *(_QWORD *)(v4 + 72), *(unsigned __int8 *)(v4 + 80));
  *(_OWORD *)(v5 + 16) = xmmword_100012EA0;
  v34 = (void *)type metadata accessor for RemoteEngagementViewController();
  v31 = v0;
  v6 = (id)AMSLogKey(v0);
  if (v6)
  {
    v7 = v6;
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v10 = v9;

    sub_100009924();
    sub_100009958();
    v11 = (uint64_t)v34;
    v12 = sub_100006850(&v31, (uint64_t)v34);
    sub_100009910((uint64_t)v12, v11);
    swift_getMetatypeMetadata();
    sub_10000F3F0();
    sub_10000F3F8();
    sub_1000098EC();
    MetatypeMetadata = &type metadata for String;
    v29[0] = v8;
    v29[1] = v10;
    sub_10000F3F0();
    sub_10000F3F8();
    v13 = 93;
  }
  else
  {
    sub_100009918();
    sub_100009958();
    v14 = (uint64_t)v34;
    v15 = sub_100006850(&v31, (uint64_t)v34);
    v16 = sub_100009910((uint64_t)v15, v14);
    MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v29[0] = v16;
    sub_10000F3F0();
    sub_10000E160((uint64_t)v29, &qword_10001E400);
    v13 = 58;
  }
  sub_10000F430(v13);
  sub_10000F4A0();
  sub_1000099D0();
  sub_100005AE4(&v31);
  LogMessage.init(stringLiteral:)(0x6863206574617453, 0xEE003A6465676E61);
  v34 = &unk_100018C50;
  v31 = (id)sub_10000F190((uint64_t)&unk_100018EF0, 57);
  sub_10000E0E4(v2, (uint64_t)v31 + 16);
  sub_10000E120(v2);
  v17 = static LogMessage.safe(_:)(&v31);
  sub_10000F35C(v17, &qword_10001E400);
  sub_100006BC0(v5);
  sub_10000F378();
  sub_10000E0E4(v2, (uint64_t)&v31);
  if (v36)
  {
    if (v36 == 1)
    {
      v19 = v31;
      v18 = v32;
      v20 = v35;
      v21 = v33;
      swift_retain(v20);
      v22 = v19;
      swift_unknownObjectRetain(v18);
      sub_10000D0FC();

      swift_unknownObjectRelease(v18);
      sub_10000F2E0();
    }
    else
    {
      v26 = (uint64_t)v31;
      v27 = (uint64_t)v32;
      v28 = (uint64_t)v33;
      swift_errorRetain(v31);
      sub_100006840(v27, v28);
      sub_10000CF9C(v26, v27, v28);
      sub_100006874(v27, v28);
      swift_errorRelease(v26);
    }
  }
  else
  {
    v23 = (uint64_t)v31;
    v24 = v32;
    v25 = v31;
    swift_errorRetain(v24);
    sub_10000CC38(v23, v24);
    swift_errorRelease(v24);

  }
  sub_10000F164();
}

id sub_10000DE94(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSString v9;
  id v10;
  objc_super v12;

  *(_QWORD *)&v3[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection] = 0;
  v6 = OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_presenter;
  v7 = sub_10000F2A8();
  sub_10000F190(v7, 64);
  v8 = v3;
  *(_QWORD *)&v3[v6] = sub_100009060();
  *(_QWORD *)&v8[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task] = 0;

  if (a2)
  {
    v9 = String._bridgeToObjectiveC()();
    sub_100009AAC();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  v10 = objc_msgSendSuper2(&v12, "initWithNibName:bundle:", v9, a3);

  return v10;
}

id sub_10000DFCC(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  objc_super v8;

  *(_QWORD *)&v1[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection] = 0;
  v3 = OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_presenter;
  v4 = sub_10000F2A8();
  sub_10000F190(v4, 64);
  v5 = v1;
  *(_QWORD *)&v1[v3] = sub_100009060();
  *(_QWORD *)&v5[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task] = 0;

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  v6 = objc_msgSendSuper2(&v8, "initWithCoder:", a1);

  return v6;
}

uint64_t type metadata accessor for RemoteEngagementViewController()
{
  return objc_opt_self(_TtC24AMSEngagementViewService30RemoteEngagementViewController);
}

uint64_t sub_10000E0B4()
{
  uint64_t v0;

  sub_100008D70(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_BYTE *)(v0 + 56));
  return swift_deallocObject(v0, 57, 7);
}

uint64_t sub_10000E0E4(uint64_t a1, uint64_t a2)
{
  sub_100008F10(a2, a1);
  return a2;
}

uint64_t sub_10000E120(uint64_t a1)
{
  sub_100008CB4(*(void **)a1, *(_QWORD *)(a1 + 8), *(void **)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  return a1;
}

uint64_t sub_10000E154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

void sub_10000E160(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100005730(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_100004F9C();
}

uint64_t sub_10000E198()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_unknownObjectWeakDestroy(v0 + 16);
  v1 = sub_10000F3A0();
  return swift_deallocObject(v1, v2, v3);
}

uint64_t sub_10000E1B4()
{
  uint64_t v0;

  sub_10000F390();

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

void sub_10000E1F4()
{
  uint64_t v0;

  sub_10000D374(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
}

uint64_t sub_10000E204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

id sub_10000E210@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, NSURL *a3@<X8>)
{
  void *v3;
  void *v4;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  v4 = v3;
  URL._bridgeToObjectiveC()(a3);
  v8 = v7;
  v9 = objc_msgSend(v4, "initWithURL:bag:", v7, a2);
  swift_unknownObjectRelease(a2);

  v10 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
  return v9;
}

uint64_t sub_10000E28C()
{
  uint64_t v0;

  sub_10000F390();

  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000E2BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10000DA0C(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(uint64_t (**)(uint64_t, uint64_t))(v2 + 32));
}

uint64_t sub_10000E2C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000E2D8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000E2E0()
{
  _QWORD *v0;

  sub_10000F390();
  swift_errorRelease(v0[3]);
  if (v0[4])
    swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

void sub_10000E318()
{
  uint64_t *v0;

  sub_10000D038(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_10000E324()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_10000F3A0();
  return swift_deallocObject(v1, v2, v3);
}

void sub_10000E340()
{
  sub_10000CF78();
}

uint64_t sub_10000E348(uint64_t *a1)
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

void sub_10000E38C()
{
  uint64_t v0;

  sub_10000CD28(v0);
}

uint64_t sub_10000E394()
{
  uint64_t v0;

  sub_10000F390();
  return swift_deallocObject(v0, 25, 7);
}

void sub_10000E3B4()
{
  uint64_t v0;

  sub_10000C680(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

void *sub_10000E3C0()
{
  uint64_t v0;

  return sub_10000C99C(*(void **)(v0 + 16));
}

void sub_10000E3C8()
{
  uint64_t v0;

  sub_10000BDB0(v0);
}

void sub_10000E3D0()
{
  uint64_t v0;

  sub_10000C03C(v0);
}

void sub_10000E3D8(uint64_t a1)
{
  uint64_t v1;

  sub_10000B588(a1, v1);
}

void sub_10000E3E0(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = sub_10000E348(a2);
    atomic_store(sub_10000F3D0(v3), a1);
  }
  sub_100004F9C();
}

uint64_t sub_10000E414(uint64_t a1)
{
  uint64_t v1;

  return sub_10000A0D8(a1, *(void **)(v1 + 16));
}

uint64_t sub_10000E41C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005730(&qword_10001E400);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E464(uint64_t a1)
{
  uint64_t v1;

  return sub_100009CA0(a1, *(void **)(v1 + 16));
}

void sub_10000E46C(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = a2(255);
    atomic_store(sub_10000F3D0(v3), a1);
  }
  sub_100004F9C();
}

unint64_t sub_10000E4A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001E8D0;
  if (!qword_10001E8D0)
  {
    v1 = sub_100009218(255, &qword_10001E8C8, SBUIRemoteAlertButtonAction_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10001E8D0);
  }
  return result;
}

uint64_t sub_10000E4F0(uint64_t result, uint64_t a2, _QWORD *a3)
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

uint64_t sub_10000E50C(Swift::UInt *a1, Swift::UInt a2)
{
  _QWORD *v2;
  uint64_t v5;
  Swift::Int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  _QWORD v14[9];

  v5 = *v2;
  Hasher.init(_seed:)(v14, *(_QWORD *)(*v2 + 40));
  Hasher._combine(_:)(a2);
  v6 = Hasher._finalize()();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
    v14[0] = *v2;
    *v2 = 0x8000000000000000;
    sub_10000E8CC(a2, v8, isUniquelyReferenced_nonNull_native);
    v13 = *v2;
    *v2 = v14[0];
    swift_bridgeObjectRelease(v13);
    result = 1;
    goto LABEL_8;
  }
  v9 = *(_QWORD *)(v5 + 48);
  if (*(_QWORD *)(v9 + 8 * v8) != a2)
  {
    v10 = ~v7;
    do
    {
      v8 = (v8 + 1) & v10;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v9 + 8 * v8) != a2);
  }
  result = 0;
  a2 = *(_QWORD *)(*(_QWORD *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

Swift::Int sub_10000E628(uint64_t a1)
{
  Swift::Int *v1;
  Swift::Int *v2;
  Swift::Int v3;
  uint64_t v4;
  Swift::Int result;
  Swift::Int v6;
  int64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  Swift::Int v13;
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  Swift::UInt v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  Swift::Int *v29;
  uint64_t v30[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100005730(&qword_10001E8E8);
  result = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = result;
  if (*(_QWORD *)(v3 + 16))
  {
    v29 = v2;
    v7 = 0;
    v8 = (_QWORD *)(v3 + 56);
    v9 = 1 << *(_BYTE *)(v3 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v3 + 56);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = result + 56;
    if (!v11)
      goto LABEL_10;
LABEL_9:
    v14 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    for (i = v14 | (v7 << 6); ; i = __clz(__rbit64(v17)) + (v7 << 6))
    {
      v19 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * i);
      Hasher.init(_seed:)(v30, *(_QWORD *)(v6 + 40));
      Hasher._combine(_:)(v19);
      result = Hasher._finalize()();
      v20 = -1 << *(_BYTE *)(v6 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v13 + 8 * (v21 >> 6))) == 0)
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          v26 = v22 == v25;
          if (v22 == v25)
            v22 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v13 + 8 * v22);
          if (v27 != -1)
          {
            v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_33;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v13 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
      *(_QWORD *)(v13 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v23) = v19;
      ++*(_QWORD *)(v6 + 16);
      if (v11)
        goto LABEL_9;
LABEL_10:
      v16 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_41;
      if (v16 >= v12)
        goto LABEL_35;
      v17 = v8[v16];
      ++v7;
      if (!v17)
      {
        v7 = v16 + 1;
        if (v16 + 1 >= v12)
          goto LABEL_35;
        v17 = v8[v7];
        if (!v17)
        {
          v7 = v16 + 2;
          if (v16 + 2 >= v12)
            goto LABEL_35;
          v17 = v8[v7];
          if (!v17)
          {
            v18 = v16 + 3;
            if (v18 >= v12)
            {
LABEL_35:
              v28 = 1 << *(_BYTE *)(v3 + 32);
              if (v28 > 63)
                sub_10000E4F0(0, (unint64_t)(v28 + 63) >> 6, (_QWORD *)(v3 + 56));
              else
                *v8 = -1 << v28;
              v2 = v29;
              *(_QWORD *)(v3 + 16) = 0;
              break;
            }
            v17 = v8[v18];
            if (!v17)
            {
              while (1)
              {
                v7 = v18 + 1;
                if (__OFADD__(v18, 1))
                  goto LABEL_42;
                if (v7 >= v12)
                  goto LABEL_35;
                v17 = v8[v7];
                ++v18;
                if (v17)
                  goto LABEL_23;
              }
            }
            v7 = v18;
          }
        }
      }
LABEL_23:
      v11 = (v17 - 1) & v17;
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

uint64_t sub_10000E8CC(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  Swift::UInt v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  _QWORD v17[9];

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  v8 = v6 + 1;
  if ((a3 & 1) != 0)
  {
    sub_10000E628(v8);
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_10000EA18();
      goto LABEL_14;
    }
    sub_10000EBAC(v8);
  }
  v9 = *v3;
  Hasher.init(_seed:)(v17, *(_QWORD *)(*v3 + 40));
  Hasher._combine(_:)(v5);
  result = Hasher._finalize()();
  v10 = -1 << *(_BYTE *)(v9 + 32);
  a2 = result & ~v10;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v11 = *(_QWORD *)(v9 + 48);
    if (*(_QWORD *)(v11 + 8 * a2) == v5)
    {
LABEL_13:
      result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for RemoteAlertButtonAction);
      __break(1u);
    }
    else
    {
      v12 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v12;
        if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v11 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v13 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v13 + 48) + 8 * a2) = v5;
  v14 = *(_QWORD *)(v13 + 16);
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
    __break(1u);
  else
    *(_QWORD *)(v13 + 16) = v16;
  return result;
}

void *sub_10000EA18()
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
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  sub_100005730(&qword_10001E8E8);
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
  if (!v12)
    goto LABEL_12;
LABEL_11:
  v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v14 | (v9 << 6); ; i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * i) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
    if (v12)
      goto LABEL_11;
LABEL_12:
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_25:
    v12 = (v17 - 1) & v17;
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_10000EBAC(uint64_t a1)
{
  Swift::Int *v1;
  Swift::Int *v2;
  Swift::Int v3;
  uint64_t v4;
  Swift::Int result;
  Swift::Int v6;
  int64_t v7;
  Swift::Int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  Swift::Int v13;
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  Swift::UInt v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  Swift::Int *v28;
  uint64_t v29[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100005730(&qword_10001E8E8);
  result = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = result;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_37:
    *v2 = v6;
    return result;
  }
  v28 = v2;
  v7 = 0;
  v8 = v3 + 56;
  v9 = 1 << *(_BYTE *)(v3 + 32);
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v3 + 56);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = result + 56;
  if (!v11)
    goto LABEL_10;
LABEL_9:
  v14 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (i = v14 | (v7 << 6); ; i = __clz(__rbit64(v17)) + (v7 << 6))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * i);
    Hasher.init(_seed:)(v29, *(_QWORD *)(v6 + 40));
    Hasher._combine(_:)(v19);
    result = Hasher._finalize()();
    v20 = -1 << *(_BYTE *)(v6 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v13 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v13 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_33;
        }
      }
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v13 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(_QWORD *)(v13 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v23) = v19;
    ++*(_QWORD *)(v6 + 16);
    if (v11)
      goto LABEL_9;
LABEL_10:
    v16 = v7 + 1;
    if (__OFADD__(v7, 1))
      goto LABEL_39;
    if (v16 >= v12)
      goto LABEL_35;
    v17 = *(_QWORD *)(v8 + 8 * v16);
    ++v7;
    if (!v17)
    {
      v7 = v16 + 1;
      if (v16 + 1 >= v12)
        goto LABEL_35;
      v17 = *(_QWORD *)(v8 + 8 * v7);
      if (!v17)
      {
        v7 = v16 + 2;
        if (v16 + 2 >= v12)
          goto LABEL_35;
        v17 = *(_QWORD *)(v8 + 8 * v7);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v11 = (v17 - 1) & v17;
  }
  v18 = v16 + 3;
  if (v18 >= v12)
  {
LABEL_35:
    result = swift_release(v3);
    v2 = v28;
    goto LABEL_37;
  }
  v17 = *(_QWORD *)(v8 + 8 * v18);
  if (v17)
  {
    v7 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v7 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v7 >= v12)
      goto LABEL_35;
    v17 = *(_QWORD *)(v8 + 8 * v7);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

char *sub_10000EE20(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_10000EE3C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_10000EE3C(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_100005730((uint64_t *)&unk_10001E8F0);
    v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 8);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || &v14[8 * v8] <= v13)
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release(a4);
  return v11;
}

void sub_10000EF30(void *a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(a1, "userInfo");
  if (v1)
  {
    v2 = v1;
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v1, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  }
  sub_100004F9C();
}

int64_t sub_10000EF94(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  if (v5 + 1 < (unint64_t)(result + 63) >> 6)
  {
    v10 = *(_QWORD *)(v6 + 8 * v9);
    if (v10)
      return __clz(__rbit64(v10)) + (v9 << 6);
    v11 = (unint64_t)(result + 63) >> 6;
    v9 = v5 + 2;
    if (v5 + 2 < v11)
    {
      v10 = *(_QWORD *)(v6 + 8 * v9);
      if (v10)
        return __clz(__rbit64(v10)) + (v9 << 6);
      while (v5 + 3 < v11)
      {
        v10 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v10)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v10)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000F078(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

unint64_t sub_10000F084()
{
  unint64_t result;

  result = qword_10001E8E0;
  if (!qword_10001E8E0)
  {
    result = swift_getWitnessTable(&unk_100012F38, &type metadata for RemoteAlertButtonAction);
    atomic_store(result, (unint64_t *)&qword_10001E8E0);
  }
  return result;
}

uint64_t sub_10000F0C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  _Block_release(*(const void **)(v0 + 16));
  v1 = sub_10000F3A0();
  return swift_deallocObject(v1, v2, v3);
}

uint64_t sub_10000F0E0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_10000F140()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 - 88);
  v2 = sub_100006850((_QWORD *)(v0 - 112), v1);
  return swift_getDynamicType(v2, v1, 1);
}

uint64_t sub_10000F17C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = a1;
  *(_QWORD *)(v2 - 144) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 144);
}

uint64_t sub_10000F190(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7);
}

uint64_t sub_10000F198(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = a1;
  *(_QWORD *)(v2 - 128) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 128);
}

uint64_t sub_10000F1C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = a1;
  *(_QWORD *)(v2 - 144) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 144);
}

uint64_t sub_10000F1D4()
{
  uint64_t v0;

  return sub_100005AE4((_QWORD *)(v0 - 112));
}

void sub_10000F1E0()
{
  Swift::String v0;

  v0._countAndFlagsBits = 0;
  v0._object = (void *)0xE000000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

uint64_t sub_10000F1F0(uint64_t a1)
{
  uint64_t v1;

  return swift_allocObject(v1, ((*(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80))+ 2 * *(_QWORD *)(*(_QWORD *)(a1 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80) | 7);
}

uint64_t sub_10000F214(uint64_t a1)
{
  uint64_t v1;

  return swift_unknownObjectWeakInit(a1 + 16, v1);
}

uint64_t sub_10000F238(uint64_t a1)
{
  return swift_unknownObjectRelease(a1);
}

uint64_t sub_10000F24C()
{
  uint64_t v0;

  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 144);
}

void sub_10000F254()
{
  uint64_t *v0;
  uint64_t v1;

  sub_10000E160(v1 - 128, v0);
}

void sub_10000F260()
{
  uint64_t *v0;
  uint64_t v1;

  sub_10000E160(v1 - 144, v0);
}

void sub_10000F26C()
{
  uint64_t *v0;
  uint64_t v1;

  sub_10000E160(v1 - 144, v0);
}

id sub_10000F278(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t sub_10000F290()
{
  return sub_100009F9C();
}

uint64_t sub_10000F2A8()
{
  return type metadata accessor for RemoteEngagementPresenter();
}

void sub_10000F2B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_10000E160(v2 - 144, a2);
}

void sub_10000F2B8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v3;

  v3 = *(void **)(v2 + a2);
  *(_QWORD *)(v2 + a2) = a1;

}

uint64_t sub_10000F2C4()
{
  uint64_t v0;

  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 128);
}

uint64_t sub_10000F2E0()
{
  uint64_t v0;

  return swift_release(v0);
}

id sub_10000F2E8(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 88) = a1;
  *(_QWORD *)(v2 - 112) = v1;
  return v1;
}

uint64_t sub_10000F2F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return swift_allocObject(v3, a2, a3);
}

void sub_10000F35C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_10000E160(v2 - 128, a2);
}

uint64_t sub_10000F370()
{
  uint64_t v0;

  return swift_release(v0);
}

uint64_t sub_10000F378()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

id sub_10000F380()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  return objc_msgSend(v1, *(SEL *)(v2 + 2920), v0);
}

uint64_t sub_10000F390()
{
  uint64_t v0;

  return swift_release(*(_QWORD *)(v0 + 16));
}

void *sub_10000F398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _Block_copy(&a9);
}

uint64_t sub_10000F3A0()
{
  uint64_t v0;

  return v0;
}

void sub_10000F3B0()
{
  uint64_t *v0;
  uint64_t v1;

  sub_10000E160(v1 - 128, v0);
}

uint64_t sub_10000F3BC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

id sub_10000F3C4(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 72) = a1;
  *(_QWORD *)(v2 - 96) = v1;
  return v1;
}

uint64_t sub_10000F3D0(uint64_t a1)
{
  uint64_t v1;

  return swift_getWitnessTable(v1, a1);
}

uint64_t sub_10000F3DC()
{
  uint64_t (*v0)(void);

  return v0();
}

id sub_10000F3E4()
{
  void *v0;

  return v0;
}

uint64_t sub_10000F3F0()
{
  uint64_t v0;

  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 160);
}

void sub_10000F3F8()
{
  uint64_t *v0;
  uint64_t v1;

  sub_10000E160(v1 - 160, v0);
}

void sub_10000F404()
{
  void *v0;

}

uint64_t sub_10000F410()
{
  uint64_t v0;

  return v0;
}

void sub_10000F424(uint64_t a1)
{
  unint64_t v1;

  v1 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&a1);
}

void sub_10000F430(uint64_t a1)
{
  unint64_t v1;

  v1 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&a1);
}

void sub_10000F438(uint64_t a1)
{
  unint64_t v1;

  v1 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&a1);
}

void sub_10000F444()
{
  uint64_t *v0;
  uint64_t v1;

  sub_10000E160(v1 - 144, v0);
}

void sub_10000F450()
{
  uint64_t *v0;
  uint64_t v1;

  sub_10000E160(v1 - 144, v0);
}

uint64_t sub_10000F45C()
{
  uint64_t v0;

  return LogMessage.init(stringInterpolation:)(v0);
}

uint64_t sub_10000F464(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10000E154(a1, a2, 1, v2);
}

void sub_10000F470()
{
  const void *v0;

  _Block_release(v0);
}

uint64_t sub_10000F478()
{
  uint64_t v0;

  return static LogMessage.safe(_:)(v0 - 112);
}

void sub_10000F480(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_10000E160(v2 - 112, a2);
}

uint64_t sub_10000F488()
{
  uint64_t v0;

  return LogMessage.init(stringInterpolation:)(v0);
}

id sub_10000F494(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 88) = a1;
  *(_QWORD *)(v2 - 112) = v1;
  return v1;
}

uint64_t sub_10000F4A0()
{
  uint64_t v0;

  return LogMessage.init(stringInterpolation:)(v0);
}

uint64_t sub_10000F4AC(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return type metadata accessor for RemoteEngagementViewController();
}

uint64_t sub_10000F4B8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return swift_allocObject(v2, a1, a2 | 7);
}

void sub_10000F4E4()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + OBJC_IVAR____TtC24AMSEngagementViewService13SceneDelegate_window);
  sub_100004F9C();
}

void sub_10000F554(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC24AMSEngagementViewService13SceneDelegate_window);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC24AMSEngagementViewService13SceneDelegate_window) = a1;

}

void sub_10000F568(int a1, int a2, id a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;

  v4 = objc_msgSend(a3, "URLContexts");
  sub_100009218(0, &qword_10001E9B8, UIOpenURLContext_ptr);
  sub_100011B78(&qword_10001E9C0, &qword_10001E9B8, UIOpenURLContext_ptr);
  v5 = sub_1000120C0((uint64_t)v4);

  v6 = sub_10000F70C(v5);
  swift_bridgeObjectRelease(v5);
  if (v6 < 1)
  {
    v11 = objc_msgSend(a3, "userActivities");
    v12 = sub_100009218(0, &qword_10001E9C8, NSUserActivity_ptr);
    sub_100011B78((unint64_t *)&unk_10001E9D0, &qword_10001E9C8, NSUserActivity_ptr);
    v14 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v11, v12, v13);

    v16 = (void *)sub_10000F72C(v14);
    sub_100009AAC();
    if (v16)
    {
      sub_100011244(v16);
      sub_100011F64();

    }
    else
    {
      sub_100011F64();
    }
  }
  else
  {
    v7 = objc_msgSend(a3, "URLContexts");
    v8 = sub_1000120C0((uint64_t)v7);

    sub_10000F8B8(v9, v8);
    sub_100011F64();
    swift_bridgeObjectRelease(v10);
  }
}

uint64_t sub_10000F70C(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) == 0)
    return *(_QWORD *)(a1 + 16);
  if (a1 >= 0)
    a1 &= 0xFFFFFFFFFFFFFF8uLL;
  return __CocoaSet.count.getter(a1);
}

uint64_t sub_10000F72C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 >= 0)
      a1 &= 0xFFFFFFFFFFFFFF8uLL;
    v2 = __CocoaSet.startIndex.getter(a1);
    v4 = v3;
    v5 = 1;
  }
  else
  {
    v2 = sub_100011DF8(a1);
    v4 = v6;
    v5 = v7 & 1;
  }
  v8 = sub_100011BB4(v1);
  v10 = v9;
  v12 = v11 & 1;
  v13 = sub_100011E78(v2, v4, v5, v8, v9, v11 & 1);
  sub_10000F078(v8, v10, v12);
  if ((v13 & 1) != 0)
  {
    sub_10000F078(v2, v4, v5);
    return 0;
  }
  else
  {
    sub_100011C18(v2, v4, v5, v1, &unk_10001E9C8);
    v14 = v15;
    sub_10000F078(v2, v4, v5);
  }
  return v14;
}

void sub_10000F8B8(uint64_t a1, uint64_t a2)
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
  _QWORD *v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[5];

  v3 = sub_100012104();
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_10001203C();
  v7 = v6 - v5;
  if ((a2 & 0xC000000000000001) != 0)
  {
    if (a2 < 0)
      v8 = a2;
    else
      v8 = a2 & 0xFFFFFFFFFFFFFF8;
    sub_100012084();
    v9 = __CocoaSet.makeIterator()(v8);
    v10 = sub_100009218(0, &qword_10001E9B8, UIOpenURLContext_ptr);
    sub_100011B78(&qword_10001E9C0, &qword_10001E9B8, UIOpenURLContext_ptr);
    v12 = Set.Iterator.init(_cocoa:)(v37, v9, v10, v11);
    a2 = v37[0];
    v34 = v37[1];
    v13 = v37[2];
    v14 = v37[3];
    v15 = v37[4];
  }
  else
  {
    v16 = -1 << *(_BYTE *)(a2 + 32);
    v34 = a2 + 56;
    v13 = ~v16;
    v17 = -v16;
    if (v17 < 64)
      v18 = ~(-1 << v17);
    else
      v18 = -1;
    v15 = v18 & *(_QWORD *)(a2 + 56);
    v12 = (_QWORD *)sub_100012084();
    v14 = 0;
  }
  v33 = (unint64_t)(v13 + 64) >> 6;
  if (a2 < 0)
    goto LABEL_13;
  while (1)
  {
    if (v15)
    {
      v19 = (v15 - 1) & v15;
      v20 = __clz(__rbit64(v15)) | (v14 << 6);
      v21 = v14;
      goto LABEL_30;
    }
    v26 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v26 >= v33)
      goto LABEL_33;
    v27 = *(_QWORD *)(v34 + 8 * v26);
    v21 = v14 + 1;
    if (!v27)
    {
      v21 = v14 + 2;
      if (v14 + 2 >= v33)
        goto LABEL_33;
      v27 = *(_QWORD *)(v34 + 8 * v21);
      if (!v27)
      {
        v21 = v14 + 3;
        if (v14 + 3 >= v33)
          goto LABEL_33;
        v27 = *(_QWORD *)(v34 + 8 * v21);
        if (!v27)
        {
          v21 = v14 + 4;
          if (v14 + 4 >= v33)
            goto LABEL_33;
          v27 = *(_QWORD *)(v34 + 8 * v21);
          if (!v27)
          {
            v28 = v14 + 5;
            while (v28 < v33)
            {
              v27 = *(_QWORD *)(v34 + 8 * v28++);
              if (v27)
              {
                v21 = v28 - 1;
                goto LABEL_29;
              }
            }
LABEL_33:
            sub_100005B40(a2);
            sub_10000F164();
            return;
          }
        }
      }
    }
LABEL_29:
    v19 = (v27 - 1) & v27;
    v20 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_30:
    v25 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v20);
    if (!v25)
      goto LABEL_33;
    while (1)
    {
      v29 = objc_msgSend(v25, "URL");
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      v30 = (void *)sub_100011B0C(objc_msgSend(v25, "options"));
      v32 = v31;
      sub_10000FD14(v7, v30, v31);

      swift_bridgeObjectRelease(v32);
      v12 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
      v14 = v21;
      v15 = v19;
      if ((a2 & 0x8000000000000000) == 0)
        break;
LABEL_13:
      v22 = __CocoaSet.Iterator.next()(v12);
      if (v22)
      {
        v23 = v22;
        v35 = v22;
        v24 = sub_100009218(0, &qword_10001E9B8, UIOpenURLContext_ptr);
        swift_unknownObjectRetain(v23);
        sub_10001210C((uint64_t)&v36, (uint64_t)&v35, (uint64_t)&type metadata for Swift.AnyObject + 8, v24);
        v25 = v36;
        swift_unknownObjectRelease(v23);
        v21 = v14;
        v19 = v15;
        if (v25)
          continue;
      }
      goto LABEL_33;
    }
  }
  __break(1u);
}

void sub_10000FCAC(uint64_t a1, void *a2)
{
  sub_100011244(a2);
}

void sub_10000FD14(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
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
  id v29;
  uint64_t v30;
  uint64_t v31;
  Swift::String v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char v53;
  uint64_t v54;
  id v55;
  Class isa;
  id v57;
  id v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  Swift::String v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  Swift::String v70;
  uint64_t v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  Swift::String v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  CFNotificationCenterRef DistributedCenter;
  __CFNotificationCenter *v81;
  __CFNotificationCenter *v82;
  __CFString *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const __CFDictionary *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t, uint64_t);
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v103;
  uint64_t v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  id v110;
  uint64_t v111;
  Swift::String v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _QWORD *v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  void (*v129)(uint64_t, uint64_t);
  id v130;
  uint64_t v131;
  __n128 *v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  Swift::String v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  __n128 *v140;
  id v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  Swift::String v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  Swift::String v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  id v155;
  void *v156;
  uint64_t v157;
  NSString v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  id v162;
  uint64_t v163;
  void (*v164)(uint64_t, uint64_t);
  uint64_t v165;
  uint64_t v166;
  __int128 v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  id v175;
  uint64_t v176;
  uint64_t v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  char v188[16];
  __int128 aBlock;
  __int128 v190;
  uint64_t (*v191)(char, uint64_t);
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;

  v178 = a2;
  v181 = a1;
  sub_100005730(&qword_10001E9A0);
  sub_100009980();
  __chkstk_darwin(v6);
  sub_100011F88();
  v8 = sub_100011FF4(v7);
  v180 = type metadata accessor for URLQueryItem(v8);
  v179 = *(_QWORD *)(v180 - 8);
  sub_100011F34();
  __chkstk_darwin(v9);
  sub_100011F14();
  v177 = v10;
  sub_100011F7C();
  __chkstk_darwin(v11);
  v169 = (uint64_t)&v165 - v12;
  sub_100005730((uint64_t *)&unk_10001E990);
  sub_100009980();
  __chkstk_darwin(v13);
  sub_100011F88();
  v15 = sub_100011FF4(v14);
  v174 = type metadata accessor for URLComponents(v15);
  v173 = *(_QWORD *)(v174 - 8);
  sub_100011F34();
  __chkstk_darwin(v16);
  sub_100011F88();
  v18 = sub_100011FF4(v17);
  type metadata accessor for LogMessage.StringInterpolation(v18);
  sub_100009980();
  __chkstk_darwin(v19);
  sub_100011F14();
  v168 = v20;
  sub_100011F7C();
  __chkstk_darwin(v21);
  v22 = sub_100005730((uint64_t *)&unk_10001E740);
  type metadata accessor for LogMessage(0);
  sub_1000120F0();
  v25 = v24 & ~v23;
  v27 = v26;
  v182 = v23 | 7;
  v183 = v22;
  v28 = swift_allocObject(v22, v25 + 5 * v26, v23 | 7);
  *(_OWORD *)(v28 + 16) = xmmword_1000134F0;
  v185 = v25;
  v184 = type metadata accessor for SceneDelegate();
  *((_QWORD *)&v190 + 1) = v184;
  *(_QWORD *)&aBlock = v3;
  v175 = v3;
  v29 = (id)AMSLogKey(v175);
  if (v29)
  {
    v30 = sub_100009A00((uint64_t)v29);
    sub_10001202C();
    sub_100011EEC();
    sub_10000F1E0();
    sub_100011EB0();
    v31 = sub_100009950();
    sub_10000F198(v31);
    sub_100012114();
    sub_1000098EC();
    v195 = &type metadata for String;
    v193 = v30;
    v194 = v4;
    sub_10000F2C4();
    sub_100012114();
    v32._countAndFlagsBits = 93;
  }
  else
  {
    sub_100011EDC();
    sub_10000F1E0();
    sub_100011EB0();
    v33 = sub_100009950();
    v34 = sub_10000F198(v33);
    sub_10000F35C(v34, &qword_10001E400);
    v32._countAndFlagsBits = 58;
  }
  v32._object = (void *)0xE100000000000000;
  sub_100011ED4(v32);
  sub_100011F5C();
  sub_1000120D8();
  v35 = v27;
  sub_100009AC8(0xD000000000000018);
  v36 = sub_100012104();
  *((_QWORD *)&v190 + 1) = v36;
  v37 = sub_100009164(&aBlock);
  v38 = v181;
  sub_1000120E8((uint64_t)v37, v181, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 16));
  v39 = static LogMessage.safe(_:)(&aBlock);
  sub_100011FD0(v39, &qword_10001E400);
  v40 = 3 * v35;
  LogMessage.init(stringLiteral:)(0x7020656372756F73, 0xEF3A737365636F72);
  if (a3)
  {
    *((_QWORD *)&v190 + 1) = &type metadata for String;
    *(_QWORD *)&aBlock = v178;
    *((_QWORD *)&aBlock + 1) = a3;
  }
  else
  {
    aBlock = 0u;
    v190 = 0u;
  }
  v41 = 2 * v35;
  v42 = type metadata accessor for Log();
  swift_bridgeObjectRetain(a3);
  v43 = static LogMessage.safe(_:)(&aBlock);
  sub_100011FD0(v43, &qword_10001E400);
  v176 = v42;
  sub_100006BC0(v28);
  v44 = swift_bridgeObjectRelease(v28);
  v45 = URL.scheme.getter(v44);
  if (!v46)
    goto LABEL_13;
  v47 = v45 == 0x7564732D736D61 && v46 == 0xE700000000000000;
  if (v47)
  {
    sub_1000120E0();
  }
  else
  {
    v48 = sub_100006970(v45, v46, 0x7564732D736D61, 0xE700000000000000);
    sub_1000120E0();
    if ((v48 & 1) == 0)
    {
LABEL_13:
      v49 = type metadata accessor for EngagementDeepLinkController();
      v50 = sub_10000F190(v49, 16);
      v51 = sub_100004FA4(v38, (uint64_t)v178, a3);
      v53 = v52;
      swift_setDeallocating(v50);
      v54 = swift_deallocClassInstance(v50, 16, 7);
      if ((v53 & 1) == 0)
      {
        v55 = objc_msgSend(objc_allocWithZone((Class)AMSEngagement), "init");
        isa = Dictionary._bridgeToObjectiveC()().super.isa;
        sub_100011ABC(v51, 0);
        v57 = objc_msgSend(v55, "enqueueData:", isa);

        *(_QWORD *)&aBlock = 0;
        v58 = objc_msgSend(v57, "resultWithError:", &aBlock);

        v60 = (void *)aBlock;
        if (!v58)
        {
          v105 = (id)aBlock;
          v106 = _convertNSErrorToError(_:)(v60);

          v107 = swift_willThrow();
          v108 = sub_100012034(v107, v185 + v40);
          *(_OWORD *)(v108 + 16) = xmmword_100012EA0;
          v109 = sub_100011EFC();
          v110 = (id)AMSLogKey(v109);
          if (v110)
          {
            sub_100009A00((uint64_t)v110);
            sub_10001201C();
            sub_100011EEC();
            sub_10000F1E0();
            sub_100011EB0();
            v111 = sub_100009950();
            sub_10000F198(v111);
            sub_100011FD8();
            sub_1000098EC();
            v195 = &type metadata for String;
            v193 = 2 * v35;
            v194 = (uint64_t)&unk_100013000;
            sub_10000F2C4();
            sub_100012064();
            v112._countAndFlagsBits = 93;
          }
          else
          {
            sub_100011EDC();
            sub_10000F1E0();
            sub_100011EB0();
            v121 = sub_100009950();
            v122 = sub_10000F198(v121);
            sub_10000F35C(v122, &qword_10001E400);
            v112._countAndFlagsBits = 58;
          }
          v112._object = (void *)0xE100000000000000;
          sub_100011ED4(v112);
          sub_100011F5C();
          sub_100005AE4(&aBlock);
          LogMessage.init(stringLiteral:)(0xD000000000000027, 0x8000000100013FC0);
          swift_getErrorValue(v106, v188, &v186);
          v123 = v186;
          v124 = v187;
          *((_QWORD *)&v190 + 1) = v187;
          v125 = sub_100009164(&aBlock);
          (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v124 - 8) + 16))(v125, v123, v124);
          v126 = sub_1000120CC();
          sub_100011FD0(v126, &qword_10001E400);
          sub_100006A34(v108);
          sub_100009AAC();
          swift_errorRelease(v106);
          goto LABEL_59;
        }
        v61 = v185;
        v62 = sub_100012034(v59, v185 + v40);
        *(_OWORD *)(v62 + 16) = xmmword_100012EA0;
        sub_100011EFC();
        v63 = (id)AMSLogKey(v60);
        if (v63)
        {
          sub_100009A00((uint64_t)v63);
          sub_10001201C();
          sub_100011EEC();
          sub_10000F1E0();
          sub_100011EB0();
          v64 = sub_100009950();
          sub_10000F198(v64);
          sub_100011FD8();
          sub_1000098EC();
          v195 = &type metadata for String;
          v193 = 2 * v35;
          v194 = v61;
          sub_10000F2C4();
          sub_100012064();
          v65._countAndFlagsBits = 93;
        }
        else
        {
          sub_100011EDC();
          sub_10000F1E0();
          sub_100011EB0();
          v117 = sub_100009950();
          v118 = sub_10000F198(v117);
          sub_10000F35C(v118, &qword_10001E400);
          v65._countAndFlagsBits = 58;
        }
        v65._object = (void *)0xE100000000000000;
        sub_100011ED4(v65);
        sub_100011F5C();
        sub_100005AE4(&aBlock);
        sub_100009AC8(0xD000000000000022);
        *((_QWORD *)&v190 + 1) = sub_100009218(0, &qword_10001E9A8, AMSEngagementEnqueueResult_ptr);
        *(_QWORD *)&aBlock = v58;
        v119 = v58;
        v120 = sub_1000120CC();
        sub_100011FD0(v120, &qword_10001E400);
        sub_100006BC0(v62);

LABEL_58:
        sub_100009AAC();
LABEL_59:
        sub_10000F164();
        return;
      }
      v71 = sub_100012034(v54, v185 + v41);
      *(_OWORD *)(v71 + 16) = xmmword_1000134E0;
      v72 = sub_100011EFC();
      v73 = (id)AMSLogKey(v72);
      if (v73)
      {
        v74 = sub_100009A00((uint64_t)v73);
        sub_10001202C();
        sub_100011EEC();
        sub_10000F1E0();
        sub_100011EB0();
        v75 = sub_100009950();
        sub_10000F198(v75);
        sub_10000F254();
        sub_1000098EC();
        v195 = &type metadata for String;
        v193 = v74;
        v194 = 3 * v35;
        sub_10000F2C4();
        sub_10000F254();
        v76._countAndFlagsBits = 93;
      }
      else
      {
        sub_100011EDC();
        sub_10000F1E0();
        sub_100011EB0();
        v113 = sub_100009950();
        v114 = sub_10000F198(v113);
        sub_10000F35C(v114, &qword_10001E400);
        v76._countAndFlagsBits = 58;
      }
      v76._object = (void *)0xE100000000000000;
      sub_100011ED4(v76);
      sub_100011F5C();
      sub_100005AE4(&aBlock);
      sub_100009AC8(0xD000000000000019);
      v115 = v71;
LABEL_57:
      sub_100006A34(v115);
      goto LABEL_58;
    }
  }
  v166 = v185 + v41;
  v66 = swift_allocObject(v183, v185 + v41, v182);
  v167 = xmmword_1000134E0;
  *(_OWORD *)(v66 + 16) = xmmword_1000134E0;
  v178 = sub_100011EFC();
  v67 = (id)AMSLogKey(v178);
  if (v67)
  {
    v68 = sub_100009A00((uint64_t)v67);
    sub_10001202C();
    sub_100011EEC();
    sub_10000F1E0();
    sub_100011EB0();
    v69 = sub_100009950();
    sub_10000F198(v69);
    sub_10000F254();
    sub_1000098EC();
    v195 = &type metadata for String;
    v193 = v68;
    v194 = 3 * v35;
    sub_10000F2C4();
    sub_10000F254();
    v70._countAndFlagsBits = 93;
  }
  else
  {
    sub_100011EDC();
    sub_10000F1E0();
    sub_100011EB0();
    v77 = sub_100009950();
    v78 = sub_10000F198(v77);
    sub_10000F35C(v78, &qword_10001E400);
    v70._countAndFlagsBits = 58;
  }
  v79 = 0xD000000000000027;
  v70._object = (void *)0xE100000000000000;
  sub_100011ED4(v70);
  sub_100011F5C();
  sub_100005AE4(&aBlock);
  sub_100009AC8(0xD00000000000002CLL);
  sub_10001208C();
  sub_100009AAC();
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  if (!DistributedCenter)
  {
    __break(1u);
    goto LABEL_72;
  }
  v81 = objc_retainAutorelease(DistributedCenter);

  v82 = v81;
  v83 = (__CFString *)String._bridgeToObjectiveC()();
  v84 = sub_100005730(&qword_10001E9B0);
  v85 = sub_10000F190(v84, 64);
  *(_OWORD *)(v85 + 16) = xmmword_100012EF0;
  *(_QWORD *)(v85 + 32) = 7107189;
  *(_QWORD *)(v85 + 40) = 0xE300000000000000;
  v86 = v181;
  *(_QWORD *)(v85 + 48) = URL.absoluteString.getter(v85);
  *(_QWORD *)(v85 + 56) = v87;
  v88 = Dictionary.init(dictionaryLiteral:)(v85, &type metadata for String, &type metadata for String, &protocol witness table for String);
  v89 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v88);
  CFNotificationCenterPostNotification(v82, v83, 0, v89, 1u);

  v90 = v171;
  URLComponents.init(url:resolvingAgainstBaseURL:)(v86, 1);
  v91 = v174;
  if (sub_10000E204(v90, 1, v174) == 1)
  {
    v92 = (uint64_t *)&unk_10001E990;
    v93 = v90;
LABEL_53:
    sub_10000E160(v93, v92);
    v130 = v178;
    v132 = (__n128 *)sub_100012034(v131, v166);
    sub_100012004(v132);
    *((_QWORD *)&v190 + 1) = v184;
    *(_QWORD *)&aBlock = v130;
    v133 = (id)AMSLogKey(v130);
    if (v133)
    {
      v134 = sub_100009A00((uint64_t)v133);
      sub_10001202C();
      sub_100011EEC();
      sub_10000F1E0();
      sub_100011EB0();
      v135 = sub_100009950();
      sub_10000F198(v135);
      sub_10000F254();
      sub_1000098EC();
      v195 = &type metadata for String;
      v193 = v134;
      v194 = v86;
      sub_10000F2C4();
      sub_10000F254();
      v136._countAndFlagsBits = 93;
    }
    else
    {
      sub_100011EDC();
      sub_10000F1E0();
      sub_100011EB0();
      v137 = sub_100009950();
      v138 = sub_10000F198(v137);
      sub_10000F35C(v138, &qword_10001E400);
      v136._countAndFlagsBits = 58;
    }
    v136._object = (void *)0xE100000000000000;
    sub_100011ED4(v136);
    sub_100011F5C();
    sub_1000120D8();
    sub_100009AC8(v79 + 25);
    v115 = v90;
    goto LABEL_57;
  }
  v94 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v173 + 32))(v172, v90, v91);
  v95 = URLComponents.queryItems.getter(v94);
  if (!v95)
  {
    v116 = v170;
    sub_10000E154((uint64_t)v170, 1, 1, v180);
LABEL_52:
    v128 = sub_10001204C();
    v129(v128, v91);
    v92 = &qword_10001E9A0;
    v93 = (uint64_t)v116;
    goto LABEL_53;
  }
  v90 = v95;
  v86 = *(_QWORD *)(v95 + 16);
  v96 = v180;
  if (v86)
  {
    v181 = v35;
    v91 = v95 + ((*(unsigned __int8 *)(v179 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v179 + 80));
    v79 = *(_QWORD *)(v179 + 72);
    v97 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v179 + 16);
    sub_100012084();
    v98 = v177;
    while (1)
    {
      v99 = v97(v98, v91, v96);
      v100 = URLQueryItem.name.getter(v99);
      if (v100 == 0x656C646E7562 && v101 == 0xE600000000000000)
      {
        sub_100009AAC();
        v127 = 0xE600000000000000;
        goto LABEL_49;
      }
      v103 = sub_100006970(v100, v101, 0x656C646E7562, 0xE600000000000000);
      sub_1000120E0();
      if ((v103 & 1) != 0)
        break;
      v98 = v177;
      v96 = v180;
      sub_10001207C(v177, *(uint64_t (**)(uint64_t, uint64_t))(v179 + 8));
      v91 += v79;
      if (!--v86)
      {
        sub_100009AAC();
        sub_100011F9C();
        goto LABEL_44;
      }
    }
    v127 = v90;
LABEL_49:
    swift_bridgeObjectRelease(v127);
    v116 = v170;
    sub_100012120((uint64_t)v170, v177, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v179 + 32));
    sub_100011F9C();
  }
  else
  {
    v104 = 1;
LABEL_44:
    v116 = v170;
  }
  sub_100011F28((uint64_t)v116, v104);
  sub_100009AAC();
  sub_100011F40((uint64_t)v116);
  if (v47)
    goto LABEL_52;
  v139 = v169;
  sub_100012120(v169, (uint64_t)v116, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v179 + 32));
  v140 = (__n128 *)swift_allocObject(v183, v166, v182);
  sub_100012004(v140);
  *((_QWORD *)&v190 + 1) = v184;
  *(_QWORD *)&aBlock = v178;
  v141 = v178;
  v142 = (id)AMSLogKey(v141);
  if (v142)
  {
    v143 = sub_100009A00((uint64_t)v142);
    v145 = v144;

    sub_100011EEC();
    sub_10000F1E0();
    sub_100011EB0();
    v146 = sub_100009950();
    sub_10000F198(v146);
    sub_100011FD8();
    sub_1000098EC();
    v195 = &type metadata for String;
    v193 = v143;
    v194 = v145;
    sub_10000F2C4();
    v139 = v169;
    sub_10000E160((uint64_t)&v193, &qword_10001E400);
    v147._countAndFlagsBits = 93;
  }
  else
  {
    sub_100011EDC();
    sub_10000F1E0();
    sub_100011EB0();
    v148 = sub_100009950();
    v149 = sub_10000F198(v148);
    sub_10000F35C(v149, &qword_10001E400);
    v147._countAndFlagsBits = 58;
  }
  v147._object = (void *)0xE100000000000000;
  sub_100011ED4(v147);
  sub_100011F5C();
  sub_1000120D8();
  v150 = v168;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(39, 1);
  v151._object = (void *)0x80000001000140C0;
  v151._countAndFlagsBits = 0xD000000000000027;
  LogMessage.StringInterpolation.appendLiteral(_:)(v151);
  v152 = URLQueryItem.value.getter();
  if (v153)
  {
    *((_QWORD *)&v190 + 1) = &type metadata for String;
    *(_QWORD *)&aBlock = v152;
    *((_QWORD *)&aBlock + 1) = v153;
  }
  else
  {
    aBlock = 0u;
    v190 = 0u;
  }
  v154 = LogMessage.StringInterpolation.appendInterpolation(safe:)(&aBlock);
  sub_100011FD0(v154, &qword_10001E400);
  sub_100009958();
  LogMessage.init(stringInterpolation:)(v150);
  sub_10001208C();
  sub_100009AAC();
  v155 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
  if (v155)
  {
    v156 = v155;
    URLQueryItem.value.getter();
    if (v157)
    {
      v158 = String._bridgeToObjectiveC()();
      sub_100009AAC();
    }
    else
    {
      v158 = 0;
    }
    v159 = sub_10000F190((uint64_t)&unk_100019238, 24);
    *(_QWORD *)(v159 + 16) = v141;
    v191 = sub_100011AEC;
    v192 = v159;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v190 = sub_1000111E4;
    *((_QWORD *)&v190 + 1) = &unk_100019250;
    v160 = _Block_copy(&aBlock);
    v161 = v192;
    v162 = v141;
    swift_release(v161);
    objc_msgSend(v156, "openApplicationWithBundleIdentifier:usingConfiguration:completionHandler:", v158, 0, v160);
    _Block_release(v160);

    (*(void (**)(uint64_t, uint64_t))(v179 + 8))(v139, v180);
    v163 = sub_10001204C();
    v164(v163, v174);
    goto LABEL_59;
  }
LABEL_72:
  __break(1u);
}

uint64_t sub_100010D14(char a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  Swift::String v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  Swift::String v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t DynamicType;
  Swift::String v37;
  uint64_t v38;
  Swift::String v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  unint64_t v43;
  Swift::String v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  unint64_t v49;
  Swift::String v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  Swift::String v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE v57[8];
  uint64_t v58;
  uint64_t v59;
  void *MetatypeMetadata;
  _QWORD v61[3];
  uint64_t v62;

  v6 = type metadata accessor for LogMessage.StringInterpolation(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 && (a1 & 1) == 0)
  {
    v23 = sub_100005730((uint64_t *)&unk_10001E740);
    v24 = type metadata accessor for LogMessage(0);
    v25 = swift_allocObject(v23, ((*(unsigned __int8 *)(*(_QWORD *)(v24 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v24 - 8) + 80))+ 2 * *(_QWORD *)(*(_QWORD *)(v24 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v24 - 8) + 80) | 7);
    *(_OWORD *)(v25 + 16) = xmmword_1000134E0;
    v62 = type metadata accessor for SceneDelegate();
    v61[0] = a3;
    v26 = a3;
    v27 = swift_errorRetain(a2);
    v28 = (id)AMSLogKey(v27);
    if (v28)
    {
      v29 = v28;
      v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
      v32 = v31;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4, 2);
      v33._countAndFlagsBits = 0;
      v33._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v33);
      v34 = v62;
      v35 = sub_100006850(v61, v62);
      DynamicType = swift_getDynamicType(v35, v34, 1);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
      v58 = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v58);
      sub_10000E160((uint64_t)&v58, &qword_10001E400);
      v37._countAndFlagsBits = 5972026;
      v37._object = (void *)0xE300000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v37);
      MetatypeMetadata = &type metadata for String;
      v58 = v30;
      v59 = v32;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v58);
      sub_10000E160((uint64_t)&v58, &qword_10001E400);
      v38 = 93;
    }
    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1, 1);
      v45._countAndFlagsBits = 0;
      v45._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v45);
      v46 = v62;
      v47 = sub_100006850(v61, v62);
      v48 = swift_getDynamicType(v47, v46, 1);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata(v48);
      v58 = v48;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v58);
      sub_10000E160((uint64_t)&v58, &qword_10001E400);
      v38 = 58;
    }
    v49 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v38);
    LogMessage.init(stringInterpolation:)(v8);
    type metadata accessor for Log();
    sub_100005AE4(v61);
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(45, 1);
    v50._object = (void *)0x8000000100014150;
    v50._countAndFlagsBits = 0xD00000000000002DLL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v50);
    swift_getErrorValue(a2, v57, &v55);
    v51 = v55;
    v52 = v56;
    v62 = v56;
    v53 = sub_100009164(v61);
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 16))(v53, v51, v52);
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v61);
    sub_10000E160((uint64_t)v61, &qword_10001E400);
    v54._countAndFlagsBits = 0;
    v54._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v54);
    LogMessage.init(stringInterpolation:)(v8);
    sub_100006BC0(v25);
    swift_bridgeObjectRelease(v25);
    return swift_errorRelease(a2);
  }
  else
  {
    v9 = sub_100005730((uint64_t *)&unk_10001E740);
    v10 = type metadata accessor for LogMessage(0);
    v11 = swift_allocObject(v9, ((*(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80))+ 2 * *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80) | 7);
    *(_OWORD *)(v11 + 16) = xmmword_1000134E0;
    v62 = type metadata accessor for SceneDelegate();
    v61[0] = a3;
    v12 = (id)AMSLogKey(a3);
    if (v12)
    {
      v13 = v12;
      v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
      v16 = v15;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4, 2);
      v17._countAndFlagsBits = 0;
      v17._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v17);
      v18 = v62;
      v19 = sub_100006850(v61, v62);
      v20 = swift_getDynamicType(v19, v18, 1);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata(v20);
      v58 = v20;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v58);
      sub_10000E160((uint64_t)&v58, &qword_10001E400);
      v21._countAndFlagsBits = 5972026;
      v21._object = (void *)0xE300000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v21);
      MetatypeMetadata = &type metadata for String;
      v58 = v14;
      v59 = v16;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v58);
      sub_10000E160((uint64_t)&v58, &qword_10001E400);
      v22 = 93;
    }
    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1, 1);
      v39._countAndFlagsBits = 0;
      v39._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v39);
      v40 = v62;
      v41 = sub_100006850(v61, v62);
      v42 = swift_getDynamicType(v41, v40, 1);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata(v42);
      v58 = v42;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v58);
      sub_10000E160((uint64_t)&v58, &qword_10001E400);
      v22 = 58;
    }
    v43 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v22);
    LogMessage.init(stringInterpolation:)(v8);
    type metadata accessor for Log();
    sub_100005AE4(v61);
    LogMessage.init(stringLiteral:)(0xD000000000000032, 0x8000000100014110);
    sub_100006BC0(v11);
    return swift_bridgeObjectRelease(v11);
  }
}

void sub_1000111E4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  id v7;

  v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v7 = a3;
  v6(a2, a3);
  swift_release(v5);

}

void sub_100011244(void *a1)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t DynamicType;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(uint64_t, uint64_t);
  uint64_t v88;
  id v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t, uint64_t);
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  _QWORD v119[3];
  void *MetatypeMetadata;
  __int128 v121;
  __int128 v122;

  type metadata accessor for LogMessage.StringInterpolation(0);
  sub_100009980();
  __chkstk_darwin(v2);
  sub_10001203C();
  v5 = v4 - v3;
  sub_100005730((uint64_t *)&unk_10001E990);
  sub_100009980();
  __chkstk_darwin(v6);
  sub_10001203C();
  v9 = v8 - v7;
  v10 = type metadata accessor for URLComponents(0);
  v114 = *(_QWORD *)(v10 - 8);
  v115 = v10;
  sub_100011F34();
  __chkstk_darwin(v11);
  sub_100011F14();
  v112 = v12;
  sub_100011F7C();
  __chkstk_darwin(v13);
  v113 = (uint64_t)&v103 - v14;
  sub_100005730(&qword_10001E800);
  sub_100009980();
  __chkstk_darwin(v15);
  sub_100011F14();
  v107 = v16;
  sub_100011F7C();
  __chkstk_darwin(v17);
  v108 = (uint64_t)&v103 - v18;
  sub_100011F7C();
  __chkstk_darwin(v19);
  v110 = (char *)&v103 - v20;
  sub_100011F7C();
  v22 = __chkstk_darwin(v21);
  v24 = (char *)&v103 - v23;
  v25 = __chkstk_darwin(v22);
  v27 = (char *)&v103 - v26;
  __chkstk_darwin(v25);
  v29 = (char *)&v103 - v28;
  v30 = sub_100012104();
  v117 = *(_QWORD *)(v30 - 8);
  sub_100011F34();
  __chkstk_darwin(v31);
  sub_100011F14();
  v111 = v32;
  sub_100011F7C();
  v34 = __chkstk_darwin(v33);
  v36 = (char *)&v103 - v35;
  __chkstk_darwin(v34);
  v116 = (uint64_t)&v103 - v37;
  v118 = a1;
  v38 = objc_msgSend(a1, "activityType");
  v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
  v41 = v40;

  v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSUserActivityTypeBrowsingWeb);
  v44 = v39 == v42 && v41 == v43;
  if (v44)
  {
    v47 = swift_bridgeObjectRelease_n(v41, 2);
  }
  else
  {
    v45 = v43;
    v46 = sub_100006970(v39, v41, v42, v43);
    swift_bridgeObjectRelease(v41);
    v47 = swift_bridgeObjectRelease(v45);
    if ((v46 & 1) == 0)
      goto LABEL_15;
  }
  v48 = sub_1000120A4(v47, "webpageURL");
  if (!v48)
  {
    sub_100011F28((uint64_t)v29, 1);
    goto LABEL_13;
  }
  v49 = v48;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100012074((uint64_t)v29, (uint64_t)v36);
  sub_100011F28((uint64_t)v29, 0);
  sub_100011F40((uint64_t)v29);
  if (v44)
  {
LABEL_13:
    v52 = &qword_10001E800;
    v53 = (uint64_t)v29;
    goto LABEL_14;
  }
  v50 = (uint64_t)v29;
  v51 = v116;
  sub_100012074(v116, v50);
  URLComponents.init(url:resolvingAgainstBaseURL:)(v51, 1);
  if (sub_10000E204(v9, 1, v115) == 1)
  {
    sub_10001207C(v51, *(uint64_t (**)(uint64_t, uint64_t))(v117 + 8));
    v52 = (uint64_t *)&unk_10001E990;
    v53 = v9;
LABEL_14:
    sub_10000E160(v53, v52);
    goto LABEL_15;
  }
  sub_1000120E8(v113, v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v114 + 32));
  v54 = sub_100005730((uint64_t *)&unk_10001E740);
  type metadata accessor for LogMessage(0);
  sub_1000120F0();
  v57 = v56 & ~v55;
  v106 = v58;
  v59 = swift_allocObject(v54, v57 + 3 * v58, v55 | 7);
  *(_OWORD *)(v59 + 16) = xmmword_100012EA0;
  v104 = v59;
  v105 = v59 + v57;
  *((_QWORD *)&v122 + 1) = type metadata accessor for SceneDelegate();
  *(_QWORD *)&v121 = v109;
  v60 = v109;
  v61 = (id)AMSLogKey(v60);
  v109 = v60;
  if (v61)
  {
    v62 = v61;
    v63 = static String._unconditionallyBridgeFromObjectiveC(_:)(v61);
    v65 = v64;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4, 2);
    sub_100009958();
    v66 = *((_QWORD *)&v122 + 1);
    v67 = sub_100006850(&v121, *((uint64_t *)&v122 + 1));
    DynamicType = swift_getDynamicType(v67, v66, 1);
    MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v119[0] = DynamicType;
    sub_10000F3F0();
    sub_100012128();
    sub_1000098EC();
    MetatypeMetadata = &type metadata for String;
    v119[0] = v63;
    v119[1] = v65;
    sub_10000F3F0();
    sub_100012128();
    v69 = 93;
  }
  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1, 1);
    sub_100009958();
    v70 = *((_QWORD *)&v122 + 1);
    v71 = sub_100006850(&v121, *((uint64_t *)&v122 + 1));
    v72 = swift_getDynamicType(v71, v70, 1);
    MetatypeMetadata = (void *)swift_getMetatypeMetadata(v72);
    v119[0] = v72;
    sub_10000F3F0();
    sub_10000E160((uint64_t)v119, &qword_10001E400);
    v69 = 58;
  }
  v73 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v69);
  LogMessage.init(stringInterpolation:)(v5);
  sub_100005AE4(&v121);
  v74 = LogMessage.init(stringLiteral:)(0xD00000000000001DLL, 0x8000000100013F60);
  v75 = sub_1000120A4(v74, "webpageURL");
  if (v75)
  {
    v76 = v75;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v77 = 0;
  }
  else
  {
    v77 = 1;
  }
  v79 = v114;
  v78 = v115;
  v80 = v113;
  v81 = v104;
  sub_100011F28((uint64_t)v24, v77);
  sub_100011A74((uint64_t)v24, (uint64_t)v27);
  sub_100011F40((uint64_t)v27);
  if (v44)
  {
    sub_10000E160((uint64_t)v27, &qword_10001E800);
    v121 = 0u;
    v122 = 0u;
  }
  else
  {
    *((_QWORD *)&v122 + 1) = v30;
    v82 = sub_100009164(&v121);
    sub_100012074((uint64_t)v82, (uint64_t)v27);
  }
  v83 = v112;
  type metadata accessor for Log();
  v84 = static LogMessage.safe(_:)(&v121);
  sub_10000F35C(v84, &qword_10001E400);
  sub_100006BC0(v81);
  swift_bridgeObjectRelease(v81);
  sub_1000120E8(v83, v80, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v79 + 16));
  v85 = URLComponents.scheme.setter(0x69752D736D61, 0xE600000000000000);
  v86 = (uint64_t)v110;
  URLComponents.url.getter(v85);
  sub_100011F40(v86);
  if (v44)
  {
    v87 = *(void (**)(uint64_t, uint64_t))(v79 + 8);
    v87(v83, v78);
    v87(v80, v78);
    sub_10001207C(v116, *(uint64_t (**)(uint64_t, uint64_t))(v117 + 8));
    v52 = &qword_10001E800;
    v53 = v86;
    goto LABEL_14;
  }
  v88 = sub_100012074(v111, v86);
  v89 = sub_1000120A4(v88, "referrerURL");
  if (v89)
  {
    v90 = v89;
    v91 = v107;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v92 = 0;
  }
  else
  {
    v92 = 1;
    v91 = v107;
  }
  sub_100011F28(v91, v92);
  v93 = v108;
  sub_100011A74(v91, v108);
  if (sub_10000E204(v93, 1, v30))
  {
    sub_10000E160(v93, &qword_10001E800);
    v94 = 0;
    v95 = v117;
  }
  else
  {
    v95 = v117;
    sub_100012120((uint64_t)v36, v93, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v117 + 16));
    sub_10000E160(v93, &qword_10001E800);
    URL.absoluteString.getter(v96);
    v94 = v97;
    sub_10001207C((uint64_t)v36, *(uint64_t (**)(uint64_t, uint64_t))(v95 + 8));
  }
  v98 = v111;
  v99 = sub_100012098();
  sub_10000FD14(v99, v100, v94);
  swift_bridgeObjectRelease(v94);
  v101 = *(void (**)(uint64_t, uint64_t))(v95 + 8);
  v101(v98, v30);
  v102 = *(void (**)(uint64_t, uint64_t))(v79 + 8);
  v102(v83, v78);
  v102(v80, v78);
  v101(v116, v30);
LABEL_15:
  sub_10000F164();
}

id sub_1000119B8()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC24AMSEngagementViewService13SceneDelegate_window] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100011A14()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(_TtC24AMSEngagementViewService13SceneDelegate);
}

uint64_t sub_100011A74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005730(&qword_10001E800);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100011ABC(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

uint64_t sub_100011AC8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100011AEC(char a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100010D14(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_100011AF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100011B04(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100011B0C(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "sourceApplication");

  if (!v2)
    return 0;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v3;
}

void sub_100011B78(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = sub_100009218(255, a2, a3);
    atomic_store(swift_getWitnessTable(&protocol conformance descriptor for NSObject, v4), a1);
  }
  sub_100004F9C();
}

uint64_t sub_100011BB4(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) == 0)
    return 1 << *(_BYTE *)(a1 + 32);
  if (a1 >= 0)
    a1 &= 0xFFFFFFFFFFFFFF8uLL;
  return __CocoaSet.endIndex.getter(a1);
}

void sub_100011C04(uint64_t a1, int a2, char a3, uint64_t a4)
{
  sub_100011C18(a1, a2, a3, a4, &unk_10001E8C8);
}

void sub_100011C18(uint64_t a1, int a2, char a3, uint64_t a4, void *a5)
{
  void *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Swift::Int v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  id v19;
  char v20;
  uint64_t v21;
  char v22;
  id v23;
  char v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;

  if ((a4 & 0xC000000000000001) != 0)
  {
    if ((a3 & 1) != 0)
    {
      v8 = sub_100012098();
      v9 = __CocoaSet.element(at:)(v8);
      v10 = sub_100011FBC();
      swift_unknownObjectRetain(v9);
      sub_10001210C((uint64_t)&v28, (uint64_t)&v27, (uint64_t)&type metadata for Swift.AnyObject + 8, v10);
      swift_unknownObjectRelease(v9);
      sub_100011F64();
      return;
    }
    goto LABEL_22;
  }
  if ((a3 & 1) != 0)
    goto LABEL_10;
  if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) == 0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
    goto LABEL_17;
  __break(1u);
LABEL_10:
  v11 = sub_100012098();
  if (__CocoaSet.Index.age.getter(v11) != *(_DWORD *)(a4 + 36))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v12 = sub_100012098();
  v13 = __CocoaSet.Index.element.getter(v12);
  v14 = sub_100011FBC();
  swift_unknownObjectRetain(v13);
  sub_10001210C((uint64_t)&v28, (uint64_t)&v27, (uint64_t)&type metadata for Swift.AnyObject + 8, v14);
  a5 = v28;
  swift_unknownObjectRelease(v13);
  v15 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a4 + 40));
  v16 = -1 << *(_BYTE *)(a4 + 32);
  v17 = v15 & ~v16;
  sub_1000120AC();
  if ((v18 & 1) != 0)
  {
    v19 = sub_100012134();
    v20 = sub_100011FE4((uint64_t)v19);

    if ((v20 & 1) == 0)
    {
      v21 = ~v16;
      do
      {
        v17 = (v17 + 1) & v21;
        sub_1000120AC();
        if ((v22 & 1) == 0)
          goto LABEL_21;
        v23 = sub_100012134();
        v24 = sub_100011FE4((uint64_t)v23);

      }
      while ((v24 & 1) == 0);
    }

LABEL_17:
    sub_100011F64();
    v26 = v25;
    return;
  }
LABEL_21:

  __break(1u);
LABEL_22:
  __break(1u);
}

uint64_t sub_100011DF8(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

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
  v2 = 64;
  for (i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_100011E78(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a3 & 1) != 0)
  {
    if ((a6 & 1) != 0)
      return static __CocoaSet.Index.== infix(_:_:)(result, a2, a4, a5);
  }
  else if ((a6 & 1) == 0)
  {
    if ((_DWORD)a2 == (_DWORD)a5)
      return result == a4;
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100011EB0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 - 152);
  v2 = sub_100006850((_QWORD *)(v0 - 176), v1);
  return swift_getDynamicType(v2, v1, 1);
}

void sub_100011ED4(Swift::String a1)
{
  LogMessage.StringInterpolation.appendLiteral(_:)(a1);
}

uint64_t sub_100011EDC()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1, 1);
}

uint64_t sub_100011EEC()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4, 2);
}

id sub_100011EFC()
{
  uint64_t v0;
  void *v1;

  *(_QWORD *)(v0 - 152) = *(_QWORD *)(v0 - 232);
  v1 = *(void **)(v0 - 304);
  *(_QWORD *)(v0 - 176) = v1;
  return v1;
}

uint64_t sub_100011F28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10000E154(a1, a2, 1, v2);
}

uint64_t sub_100011F40(uint64_t a1)
{
  uint64_t v1;

  return sub_10000E204(a1, 1, v1);
}

uint64_t sub_100011F5C()
{
  uint64_t v0;

  return LogMessage.init(stringInterpolation:)(v0);
}

uint64_t sub_100011FBC()
{
  _QWORD *v0;
  unint64_t *v1;

  return sub_100009218(0, v1, v0);
}

void sub_100011FD0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_10000E160(v2 - 176, a2);
}

void sub_100011FD8()
{
  uint64_t *v0;
  uint64_t v1;

  sub_10000E160(v1 - 128, v0);
}

uint64_t sub_100011FE4(uint64_t a1)
{
  uint64_t v1;

  return static NSObject.== infix(_:_:)(a1, v1);
}

uint64_t sub_100011FF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

__n128 sub_100012004(__n128 *a1)
{
  uint64_t v1;
  __n128 result;

  result = *(__n128 *)(v1 - 384);
  a1[1] = result;
  return result;
}

void sub_10001201C()
{
  void *v0;

}

void sub_10001202C()
{
  void *v0;

}

uint64_t sub_100012034(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return swift_allocObject(*(_QWORD *)(v2 - 240), a2, *(_QWORD *)(v2 - 248));
}

uint64_t sub_10001204C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 328);
}

void sub_100012064()
{
  uint64_t *v0;
  uint64_t v1;

  sub_10000E160(v1 - 128, v0);
}

uint64_t sub_100012074(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t sub_10001207C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_100012084()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_10001208C()
{
  uint64_t v0;

  return sub_100006BC0(v0);
}

uint64_t sub_100012098()
{
  uint64_t v0;

  return v0;
}

id sub_1000120A4(uint64_t a1, const char *a2)
{
  uint64_t v2;

  return objc_msgSend(*(id *)(v2 - 168), a2);
}

uint64_t sub_1000120C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return static Set._unconditionallyBridgeFromObjectiveC(_:)(a1, v1, v2);
}

uint64_t sub_1000120CC()
{
  uint64_t v0;

  return static LogMessage.safe(_:)(v0 - 176);
}

uint64_t sub_1000120D8()
{
  uint64_t v0;

  return sub_100005AE4((_QWORD *)(v0 - 176));
}

uint64_t sub_1000120E0()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000120E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t sub_100012104()
{
  return type metadata accessor for URL(0);
}

uint64_t sub_10001210C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_dynamicCast(a1, a2, a3, a4, 7);
}

void sub_100012114()
{
  uint64_t *v0;
  uint64_t v1;

  sub_10000E160(v1 - 128, v0);
}

uint64_t sub_100012120@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void sub_100012128()
{
  uint64_t *v0;
  uint64_t v1;

  sub_10000E160(v1 - 160, v0);
}

id sub_100012134()
{
  uint64_t v0;
  uint64_t v1;

  return *(id *)(*(_QWORD *)(v0 + 48) + 8 * v1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC24AMSEngagementViewServiceP33_73DA483C63343F3B2BD6F73E1EFE2ABB19ResourceBundleClass);
}
